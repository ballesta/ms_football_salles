<?php namespace App\Http\Controllers;

use App\Http\Controllers\controller;
use App\Models\Inscription;
use Illuminate\Http\Request;
use Illuminate\Pagination\LengthAwarePaginator as Paginator;
use Validator, Input, Redirect ;

use Illuminate\Support\Facades\DB;
class InscriptionController extends Controller {

	protected $layout = "layouts.main";
	protected $data = array();	
	public $module = 'inscription';
	static $per_page	= '10';

	public function __construct()
	{
		
		$this->beforeFilter('csrf', array('on'=>'post'));
		$this->model = new Inscription();
		
		$this->info = $this->model->makeInfo( $this->module);
		$this->access = $this->model->validAccess($this->info['id']);
	
		$this->data = array(
			'pageTitle'	=> 	$this->info['title'],
			'pageNote'	=>  $this->info['note'],
			'pageModule'=> 'inscription',
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

		$sort = (!is_null($request->input('sort')) ? $request->input('sort') : 'inscription_id'); 
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
		$pagination->setPath('inscription');
		
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
		return view('inscription.index',$this->data);
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
			$this->data['row'] = $this->model->getColumnTable('fbs_inscription'); 
		}
		$this->data['fields'] 		=  \SiteHelpers::fieldLang($this->info['config']['forms']);
		
		$this->data['id'] = $id;
		//dd($this->data);
		return view('inscription.form',$this->data);
	}	

	public function getShow( Request $request, $id = null)
	{
		if($this->access['is_detail'] ==0) 
		return Redirect::to('dashboard')
			->with('messagetext', \Lang::get('core.note_restric'))->with('msgstatus','error');
					
		$row = $this->model->getRow($id);
		if($row)
		{
			$this->data['row'] =  $row;
			$this->data['fields'] 		=  \SiteHelpers::fieldLang($this->info['config']['grid']);
			$this->data['id'] = $id;
			$this->data['access']		= $this->access;
			$this->data['subgrid']	= (isset($this->info['config']['subgrid']) ? $this->info['config']['subgrid'] : array()); 
			$this->data['prevnext'] = $this->model->prevNext($id);
			return view('inscription.view',$this->data);
		} else {
			return Redirect::to('inscription')->with('messagetext','Record Not Found !')->with('msgstatus','error');					
		}
	}	

	// Ajoute inscription
	function postSave( Request $request)
	{
		$rules = $this->validateForm();
		$validator = Validator::make($request->all(), $rules);	
		if ($validator->passes()) {
			$inscription = $this->validatePost('tb_inscription');

			// Passe la date de format français vers format anglais pour le base de données
			// Format francais
			$date_heure_francaise = $inscription['heure_debut'];
			$format = "d/m/Y H:i";
			// Format français vers interne
			$dateobj = \DateTime::createFromFormat($format, $date_heure_francaise);
			// Interne vers format anglais BD
			$inscription['heure_debut'] = $dateobj->format('Y-m-d H:i') ;
			//dd([ $inscription, $date_heure_francaise, $dateobj]);

			$inscription['complexe_salle_id'] = "7"; // ++++
			//dd($inscription);
			$id = $this->model
				       ->insertRow($inscription ,
				                   $request->input('inscription_id'));

			$partie_id = $this->cree_partie($id, $inscription);
			$joueur_selectionne_id = $this->inscrit_joueur_a_partie($partie_id,
				                                                    $inscription);
			$session_mesure_id = $this->cree_sessions_mesures($joueur_selectionne_id,
															  $inscription);
			if(!is_null($request->input('apply')))
			{
				$return = 'inscription/update/'.$id.'?return='.self::returnUrl();
			} else {
				$return = 'inscription?return='.self::returnUrl();
			}

			// Insert logs into database
			if($request->input('inscription_id') =='')
			{
				\SiteHelpers::auditTrail( $request ,
										  'New Data with ID '
										  .$id
										  .' Has been Inserted !');
			} else {
				\SiteHelpers::auditTrail($request ,'Data with ID '.$id.' Has been Updated !');
			}
			return Redirect::to($return)
				             ->with('messagetext',
				                    \Lang::get('core.note_success'))
				             ->with('msgstatus','success');
		} else {
			return Redirect::to('inscription/update/'
				                .$request
					          ->input('inscription_id'))
							  ->with('messagetext',\Lang::get('core
							                                 .note_error'))
				              ->with('msgstatus','error')
			                  ->withErrors($validator)
				              ->withInput();
		}	
	
	}
	// Suite à inscription et remise capteur:
	// - Crée la partie si inexistante
	// - - Table fb_partie
	public function cree_partie($inscription_id, $inscription)
	{
		// Lis ou crée partie
		// Partie définie par:
		// - Complexe salle
		// - Salle (terrain)
		// - Heure début
		// Tentative de lecture de la partie
		$complexe_salle_id = $inscription['complexe_salle_id'];
        $salle_id          = $inscription['terrain_id'];
        $terrain_id = $salle_id;
		$heure_debut       = $inscription['heure_debut'];
		$duree = $inscription['duree'];
		$parties = DB::table('fb_partie')->where('complexe_salle_id',
												 $complexe_salle_id)
			                             ->where('salle_id',
				                                 $salle_id)
			                             ->where('debut',
				                                  $heure_debut)
										 ->get();
        $nbr_parties = count($parties);
		if ($nbr_parties == 0)
        {
	        $partie = [];
	        $partie['debut'] = $heure_debut;
	        $partie['duree'] = $duree;
	        $partie['fin'] = null;
	        $partie['salle_id'] = $salle_id;
	        $partie['complexe_salle_id'] = $complexe_salle_id ;

        	// Partie inexistante: créer
	        $partie_id = DB::table('fb_partie')->insertGetId($partie);
        }
        elseif ($nbr_parties == 1)
        {
        	// Partie déjà créée
	        // dd($parties);
	        $partie_id = $parties[0]->partie_id;
        }
        else
        {
        	dd(['Plus d une partie', parties]);
        }

        // Renvoie l'id de la partie créé ou lue
		return $partie_id;
	}

	// Inscrit le joueur à la partie si pas encore inscrit
	// - Table fb_joueurs_selectionnes
	// - Déja inscrit si changement de capteur
	//
	// ++++ Restriction temporaire: pas de changement de capteur en cours de partie.
	public function inscrit_joueur_a_partie($partie_id, $inscription)
	{
		$joueur_id = $inscription['joueur_id'];
		$capteur_id = $inscription['capteur_id'];

		$joueur_selectionne['partie_id' ] = $partie_id;
		$joueur_selectionne['joueur_id' ] = $joueur_id;
		$joueur_selectionne['capteur_id'] = $capteur_id;

		// Partie inexistante: créer
		$joueur_selectionne_id = DB::table('fb_joueurs_selectionnes')
			                         ->insertGetId($joueur_selectionne);
		return $joueur_selectionne_id;
	}

	// Crée la session de mesures du capteur
	// - Table fb_sessions_mesures
	public function cree_sessions_mesures($joueur_selectionne_id, $inscription)
	{

		$capteur_id = $inscription['capteur_id'];

		$session_mesure = [];
		$session_mesure['capteur_id'] = $capteur_id;
		$session_mesure['joueur_selectionne_id'] = $joueur_selectionne_id;
		$session_mesure_id = DB::table('fb_sessions_mesures')
			                     ->insertGetId($session_mesure);
		return $session_mesure_id;
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
			return Redirect::to('inscription?return='.self::returnUrl())
        		->with('messagetext', \Lang::get('core.note_success_delete'))->with('msgstatus','success');
		} else {
			return Redirect::to('inscription?return='.self::returnUrl())
        		->with('messagetext','No Item Deleted')->with('msgstatus','error');				
		}

	}	

	public static function display( )
	{
		$mode  = isset($_GET['view']) ? 'view' : 'default' ;
		$model  = new Inscription();
		$info = $model::makeInfo('inscription');

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
				return view('inscription.public.view',$data);
			} 

		} else {

			$page = isset($_GET['page']) ? $_GET['page'] : 1;
			$params = array(
				'page'		=> $page ,
				'limit'		=>  (isset($_GET['rows']) ? filter_var($_GET['rows'],FILTER_VALIDATE_INT) : 10 ) ,
				'sort'		=> 'inscription_id' ,
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
			return view('inscription.public.index',$data);			
		}


	}

	function postSavepublic( Request $request)
	{
		
		$rules = $this->validateForm();
		$validator = Validator::make($request->all(), $rules);	
		if ($validator->passes()) {
			$data = $this->validatePost('fbs_inscription');		
			 $this->model->insertRow($data , $request->input('inscription_id'));
			return  Redirect::back()->with('messagetext','<p class="alert alert-success">'.\Lang::get('core.note_success').'</p>')->with('msgstatus','success');
		} else {

			return  Redirect::back()->with('messagetext','<p class="alert alert-danger">'.\Lang::get('core.note_error').'</p>')->with('msgstatus','error')
			->withErrors($validator)->withInput();
		}
	}
}