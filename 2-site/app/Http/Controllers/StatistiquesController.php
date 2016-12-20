<?php

namespace App\Http\Controllers;

use App\Http\Controllers\controller;
use App\Models\Statistiques;
use Illuminate\Http\Request;
use Illuminate\Pagination\LengthAwarePaginator as Paginator;
use Validator, Input, Redirect ;

use Illuminate\Support\Facades\DB;

class StatistiquesController extends Controller {

	protected $layout = "layouts.main";
	protected $data = array();	
	public $module = 'statistiques';
	static $per_page	= '10';

	public function __construct()
	{
		
		$this->beforeFilter('csrf', array('on'=>'post'));
		$this->model = new Statistiques();
		
		$this->info = $this->model->makeInfo( $this->module);
		$this->access = $this->model->validAccess($this->info['id']);
	
		$this->data = array(
			'pageTitle'	=> 	$this->info['title'],
			'pageNote'	=>  $this->info['note'],
			'pageModule'=> 'statistiques',
			'return'	=> self::returnUrl()
			
		);
		
		\App::setLocale(CNF_LANG);
		if (defined('CNF_MULTILANG') && CNF_MULTILANG == '1') {

		$lang = (\Session::get('lang') != "" ? \Session::get('lang') : CNF_LANG);
		\App::setLocale($lang);
		}
	}

	public function getIndex( Request $request )
	{

		if($this->access['is_view'] ==0) 
			return Redirect::to('dashboard')
				->with('messagetext', \Lang::get('core.note_restric'))->with('msgstatus','error');

		$sort = (!is_null($request->input('sort')) ? $request->input('sort') : 'statistique_id'); 
		$order = (!is_null($request->input('order')) ? $request->input('order') : 'asc');
		// End Filter sort and order for query 
		// Filter Search for query		
		$filter = '';	
		if(!is_null($request->input('search')))
		{
			$search = 	$this->buildSearch('maps');
			$filter = $search['param'];
			$this->data['search_map'] = $search['maps'];
		} 

		
		$page = $request->input('page', 1);
		$params = array(
			'page'		=> $page ,
			'limit'		=> (!is_null($request->input('rows')) ? filter_var($request->input('rows'),FILTER_VALIDATE_INT) : static::$per_page ) ,
			'sort'		=> $sort ,
			'order'		=> $order,
			'params'	=> $filter,
			'global'	=> (isset($this->access['is_global']) ? $this->access['is_global'] : 0 )
		);
		// Get Query 
		$results = $this->model->getRows( $params );		
		
		// Build pagination setting
		$page = $page >= 1 && filter_var($page, FILTER_VALIDATE_INT) !== false ? $page : 1;	
		$pagination = new Paginator($results['rows'], $results['total'], $params['limit']);	
		$pagination->setPath('statistiques');
		
		$this->data['rowData']		= $results['rows'];
		// Build Pagination 
		$this->data['pagination']	= $pagination;
		// Build pager number and append current param GET
		$this->data['pager'] 		= $this->injectPaginate();	
		// Row grid Number 
		$this->data['i']			= ($page * $params['limit'])- $params['limit']; 
		// Grid Configuration 
		$this->data['tableGrid'] 	= $this->info['config']['grid'];
		$this->data['tableForm'] 	= $this->info['config']['forms'];	
		// Group users permission
		$this->data['access']		= $this->access;
		// Detail from master if any
		
		// Master detail link if any 
		$this->data['subgrid']	= (isset($this->info['config']['subgrid']) ? $this->info['config']['subgrid'] : array()); 
		// Render into template
		return view('statistiques.index',$this->data);
	}	

	function getUpdate(Request $request, $id = null)
	{
	
		if($id =='')
		{
			if($this->access['is_add'] ==0 )
			return Redirect::to('dashboard')->with('messagetext',\Lang::get('core.note_restric'))->with('msgstatus','error');
		}	
		
		if($id !='')
		{
			if($this->access['is_edit'] ==0 )
			return Redirect::to('dashboard')->with('messagetext',\Lang::get('core.note_restric'))->with('msgstatus','error');
		}				
				
		$row = $this->model->find($id);
		if($row)
		{
			$this->data['row'] =  $row;
		} else {
			$this->data['row'] = $this->model->getColumnTable('fb_statistiques'); 
		}
		$this->data['fields'] 		=  \SiteHelpers::fieldLang($this->info['config']['forms']);
		
		$this->data['id'] = $id;
		return view('statistiques.form',$this->data);
	}

	// Appellé par visualisation statistique (Loupe verte sur ligne)
	// Lis et filtre les mesure
	public function getShow( Request $request, $id = null)
	{

		if($this->access['is_detail'] ==0) 
		return Redirect::to('dashboard')
			->with('messagetext', \Lang::get('core.note_restric'))->with('msgstatus','error');
					
		$row = $this->model->getRow($id);
		if($row)
		{
			$this->data['row'] =  $row;
			$this->data['fields'] = \SiteHelpers::fieldLang($this->info['config']['grid']);
			$this->data['id'] = $id;
			// Elabore les statistique concernant un joueur à partir des mesures recues
			// ++++ Pour les tests: toutes les mesures ++++
			$this->data['statistiques']
			=
			$this->statistiques_partie_joueur($this->data['row']->joueur_id,
									          $this->data['row']->date);
			$this->data['access']		= $this->access;
			$this->data['subgrid']
				= (isset($this->info['config']['subgrid']) ?
				         $this->info['config']['subgrid']
				         :
				         array());
			$this->data['prevnext'] = $this->model->prevNext($id);
			//dd($this);
			return view('statistiques.view',
				         $this->data);
		} else {
			return Redirect::to('statistiques')
				             ->with('messagetext','Record Not Found !')
				             ->with('msgstatus','error');
		}
	}	

	//bb
	// Elabore les statistiques pour un joueur dans une partie.
	/*
		{
				"EventShoot":
				{
					{
						"UID": "111111",
						"id": "1",
						"speed": "11"
					}
				}
			}
		}
	*/

	function statistiques_partie_joueur($joueur_id, $date)
	{
		//dd($date);
		// ++++ Lis toutes les mesure et les affecte au joueur ++++
		// Par ordre chronologique ascendants.
		$mesures = DB::table('fb_mesures')->orderBy('Horodatage', 'asc')
										  ->get();
		$ballons_joues = 0;
		$Dist = 0;
		$Average = 0;
		$Max = 0;
		$Step = 0;
		$Sprint = 0;
		$Mobility = 0;
		$Shoot = 0;
		$Pass = 0;
		$Control = 0;
		$duree = 0;
		$vitesses="";

		if (count($mesures) > 0)
		{
			// Calculées à partir des vitesses moyennes transmises pour chaque mesure
			// ++++ Hypothèse
			$vitesses_moyennes = [];
			$i=1;
			foreach ($mesures as $m)
			{
				//dd($m); // Mesure base
				$date_heure =  strtotime($m->Horodatage);
				// En cas d'absence de message start: prendre heure premier message
				if($i++ == 1)
				{
					// Premier message seulement: top de départ
					$start = $date_heure;
				}
				$mesure = json_decode($m->message_json, $to_array=true);
				//dd($mesure);
				if (isset($mesure["mesures"]))
				{
					null;
				}
				elseif (isset($mesure ["EventShoot"]))
				{
					$ballons_joues++;
				}
				elseif (isset($mesure ["EventShoot"]))
				{
					$ballons_joues++;
				}
				elseif (isset($mesure ["EventPass"]))
				{
					$ballons_joues++;
				}
				elseif (isset($mesure ["EventControl"]))
				{
					$ballons_joues++;
				}
				elseif (isset($mesure["Mesure"]))
				{
					// Mémorise les dernières valeurs reçues qui seront affichée
					// Distance totale parcourue en mètres
					$Dist = $mesure ["Mesure"]["Dist"];
					// Vitesse moyenne en km/h
					$Average    = $mesure ["Mesure"]["Average"];
					// Vitesse maximum en km/h
					$Max = $mesure ["Mesure"]["Max"];
					// Nombre de pas depuis le début de la session
					$Step       = $mesure ["Mesure"]["Step"];
					// Nombre de sprint depuis le début de la session
					$Sprint     = $mesure ["Mesure"]["Sprint"];
					// Ratio mouvement/immobilité
					$Mobility   = $mesure ["Mesure"]["Mobility"];
					// Nombre de tir depuis le début de la session
					$Shoot      = $mesure ["Mesure"]["Shoot"];
					// Nombre de passes depuis le début de la session
					$Pass       = $mesure ["Mesure"]["Pass"];
					//Nombre de contrôles depuis le début de la session
					$Control    = $mesure ["Mesure"]["Control"];

					// Pour la courbe
					$minutes = ($date_heure - $start) / 60;

					$vitesses_moyennes["$minutes"] = $Average;
				}
				elseif (isset($mesure ["Check"]))
				{
					null;
				}
				elseif (isset($mesure ["Battery"]))
				{
					null;
				}
				else
					dd(["Message capteur inconnu:",$mesure]);
				$end = $date_heure;
			}

			$minutes = ($end - $start) / 60;

			$heures = floor($minutes / 60);
			$minutes = $minutes % 60;
			if ($minutes < 10)
				$duree = "0$heures:0$minutes";
			else
				$duree = "0$heures:$minutes";

			//dd([$end, $start,$end - $start,  $duree]);
			$vitesses="";
			//dd($vitesses_moyennes);
			//$n = count($vitesses_moyennes);
			foreach ($vitesses_moyennes as $m => $v)
			{
				$vitesses .= "{ x:$m, y:$v },";
			}
			$vitesses = rtrim($vitesses, ",");

			//dd([$vitesses_moyennes,$vitesses]);
		}

		return
		[
			'Dist'              => $Dist ,
			'duree'             => $duree ,
			'ballons_joues'     => $ballons_joues ,
			'vitesse_maximale'  => $Max,
			'vitesses'          => $vitesses
		];
	}

	function postSave( Request $request)
	{
		
		$rules = $this->validateForm();
		$validator = Validator::make($request->all(), $rules);	
		if ($validator->passes()) {
			$data = $this->validatePost('tb_statistiques');
				
			$id = $this->model->insertRow($data , $request->input('statistique_id'));
			
			if(!is_null($request->input('apply')))
			{
				$return = 'statistiques/update/'.$id.'?return='.self::returnUrl();
			} else {
				$return = 'statistiques?return='.self::returnUrl();
			}

			// Insert logs into database
			if($request->input('statistique_id') =='')
			{
				\SiteHelpers::auditTrail( $request , 'New Data with ID '.$id.' Has been Inserted !');
			} else {
				\SiteHelpers::auditTrail($request ,'Data with ID '.$id.' Has been Updated !');
			}

			return Redirect::to($return)->with('messagetext',\Lang::get('core.note_success'))->with('msgstatus','success');
			
		} else {

			return Redirect::to('statistiques/update/'.$request->input('statistique_id'))->with('messagetext',\Lang::get('core.note_error'))->with('msgstatus','error')
			->withErrors($validator)->withInput();
		}	
	
	}	

	public function postDelete( Request $request)
	{
		
		if($this->access['is_remove'] ==0) 
			return Redirect::to('dashboard')
				->with('messagetext', \Lang::get('core.note_restric'))->with('msgstatus','error');
		// delete multipe rows 
		if(count($request->input('ids')) >=1)
		{
			$this->model->destroy($request->input('ids'));
			
			\SiteHelpers::auditTrail( $request , "ID : ".implode(",",$request->input('ids'))."  , Has Been Removed Successfull");
			// redirect
			return Redirect::to('statistiques?return='.self::returnUrl())
        		->with('messagetext', \Lang::get('core.note_success_delete'))->with('msgstatus','success'); 
	
		} else {
			return Redirect::to('statistiques?return='.self::returnUrl())
        		->with('messagetext','No Item Deleted')->with('msgstatus','error');				
		}

	}	

	public static function display( )
	{
		$mode  = isset($_GET['view']) ? 'view' : 'default' ;
		$model  = new Statistiques();
		$info = $model::makeInfo('statistiques');

		$data = array(
			'pageTitle'	=> 	$info['title'],
			'pageNote'	=>  $info['note']
			
		);

		if($mode == 'view')
		{
			$id = $_GET['view'];
			$row = $model::getRow($id);
			if($row)
			{
				$data['row'] =  $row;
				$data['fields'] 		=  \SiteHelpers::fieldLang($info['config']['grid']);
				$data['id'] = $id;
				return view('statistiques.public.view',$data);
			} 

		} else {

			$page = isset($_GET['page']) ? $_GET['page'] : 1;
			$params = array(
				'page'		=> $page ,
				'limit'		=>  (isset($_GET['rows']) ? filter_var($_GET['rows'],FILTER_VALIDATE_INT) : 10 ) ,
				'sort'		=> 'statistique_id' ,
				'order'		=> 'asc',
				'params'	=> '',
				'global'	=> 1 
			);

			$result = $model::getRows( $params );
			$data['tableGrid'] 	= $info['config']['grid'];
			$data['rowData'] 	= $result['rows'];	

			$page = $page >= 1 && filter_var($page, FILTER_VALIDATE_INT) !== false ? $page : 1;	
			$pagination = new Paginator($result['rows'], $result['total'], $params['limit']);	
			$pagination->setPath('');
			$data['i']			= ($page * $params['limit'])- $params['limit']; 
			$data['pagination'] = $pagination;
			return view('statistiques.public.index',$data);			
		}
	}

	function postSavepublic( Request $request)
	{
		$rules = $this->validateForm();
		$validator = Validator::make($request->all(), $rules);	
		if ($validator->passes()) {
			$data = $this->validatePost('fb_statistiques');		
			 $this->model->insertRow($data , $request->input('statistique_id'));
			return  Redirect::back()->with('messagetext','<p class="alert alert-success">'.\Lang::get('core.note_success').'</p>')->with('msgstatus','success');
		} else {

			return  Redirect::back()->with('messagetext','<p class="alert alert-danger">'.\Lang::get('core.note_error').'</p>')->with('msgstatus','error')
			->withErrors($validator)->withInput();

		}	
	
	}	

}