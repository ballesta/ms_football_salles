<?php namespace App\Http\Controllers;
use App\Http\Controllers\controller;
use App\Models\Accueiljoueurs;
use Illuminate\Http\Request;
use Illuminate\Pagination\LengthAwarePaginator as Paginator;
use Validator, Input, Redirect ;
class AccueiljoueursController extends Controller {
    protected $layout = "layouts.main";
    protected $data = array();
    public $module = 'accueiljoueurs';
    static $per_page	= '10';
    public function __construct()
    {
        
        $this->beforeFilter('csrf', array('on'=>'post'));
        $this->model = new Accueiljoueurs();
        
        $this->info = $this->model->makeInfo( $this->module);
        $this->access = $this->model->validAccess($this->info['id']);
        
        $this->data = array(
        'pageTitle'	=> 	$this->info['title'],
        'pageNote'	=>  $this->info['note'],
        'pageModule'=> 'accueiljoueurs',
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
        ////(( Code generated begin
        // Get parameter in URL to use it as filter
        $id = $request->query("complexe_salle_id");
        $identifier = $request->query("nom");
        if (!is_null($id))
        {
            \Session::put("complexe_salle_id", $id);
            \Session::put("complexe_salle_id_identifier", $identifier);
        }
        $id = \Session::get("complexe_salle_id", null);
        $active_filter = \Session::get("complexe_salle_id_identifier");
        // Check if parent already selected
        if (is_null($id))
        {
            return Redirect::to("complexesportif")
            ->with("messagetext",
            "Vous devez d'abord sélectionner votre <br> "
            ."<i>Centres sportifs</i> <br>"
            ."avant de choisir <br>"
            ."<i>Accueil Joueurs</i>")
            ->with("msgstatus","warning");
        }
        ////)) Code generated end
        ////(( Code generated begin
        \Session::forget("salle_id");
        \Session::forget("salle_id_identifier");
        \Session::forget("partie_id");
        \Session::forget("partie_id_identifier");
        \Session::forget("joueur_selectionne_id");
        \Session::forget("joueur_selectionne_id_identifier");
        \Session::forget("session_mesure_id");
        \Session::forget("session_mesure_id_identifier");
        \Session::forget("mesure_id");
        \Session::forget("mesure_id_identifier");
        \Session::forget("joueur_id");
        \Session::forget("joueur_id_identifier");
        \Session::forget("capteurs_id");
        \Session::forget("capteurs_id_identifier");
        \Session::forget("inscription_id");
        \Session::forget("inscription_id_identifier");
        ////)) Code generated end
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
        $pagination->setPath('accueiljoueurs');
        
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
        return view('accueiljoueurs.index',$this->data);
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
            ////(( Code generated begin
            $columns = $this->data['row'];
            $id = \Session::get('complexe_salle_id', null);
            $columns['complexe_salle_id'] = $id;
            $this->data['row'] = $columns;
            ////)) Code generated end
        }
        $this->data['fields'] 		=  \SiteHelpers::fieldLang($this->info['config']['forms']);
        
        $this->data['id'] = $id;
        return view('accueiljoueurs.form',$this->data);
    }
    // Elabore les statistiques pour un joueur dans une partie.
    public function getShow( Request $request, $id = null)
    {
        if($this->access['is_detail'] == 0)
        {
            return Redirect::to('dashboard')
            ->with('messagetext',
            \Lang::get('core.note_restric'))
            ->with('msgstatus','error');
        }
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
            $this->statistiques_partie_joueur
            (
            $this->data['row']->joueur_id,
            $this->data['row']->date,
            $this->data['row']->duree
            );
            $this->data['access'] = $this->access;
            $this->data['subgrid']	= (isset($this->info['config']['subgrid']) ? $this->info['config']['subgrid'] : array());
            $this->data['prevnext'] = $this->model->prevNext($id);
            //dd($this);
            // Attention: utilise la vue d'une autre entité
            return view('statistiques.view',$this->data);
        }
        else
        {
            return Redirect::to('statistiques')->with('messagetext','Record Not Found !')->with('msgstatus','error');
        }
    }
    //bb
    // Elabore les statistiques pour un joueur dans une partie.
    /*
    * Exemple de message:
    * ------------------
    {
        "sensor":
        {
            "EventShoot":
            {
                "param": [
                {
                    "UID": "111111",
                    "id": "1",
                    "speed": "11"
                }
                ]
            }
        }
    }
    */
    function statistiques_partie_joueur($joueur_id,
    $date_debut_partie,
    $duree_match)
    {
        //dd($date);
        // ++++ Lis toutes les mesure et les affecte au joueur ++++
        // Par ordre chronologique ascendants.
        $mesures = DB::table('fb_mesures')
        ->orderBy('Horodatage', 'asc')
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
                //dd($m);
                $date_heure =  strtotime($m->Horodatage);
                $date_fin_partie = $date_debut_partie+($duree_match * 60);
                if (   $date_heure >= $date_debut_partie
                && $date_heure <= $date_fin_partie)
                {
                    // Date mesure entre le debut et la fin de la partie
                    // En cas d'absence de message start: prendre heure premier message
                    if($i++ == 1)
                    {
                        // Premier message seulement: top de départ
                        $start = $date_heure;
                    }
                    $mesure = json_decode($m->message_json, $to_array=true);
                    //dd($mesure);
                    if (isset($mesure["sensor"]["Start"]))
                    $start = $date_heure;
                    elseif (isset($mesure["sensor"]["EventShoot"]))
                    {
                        $ballons_joues++;
                    }
                    elseif (isset($mesure["sensor"]["EventPass"]))
                    {
                        $ballons_joues++;
                    }
                    elseif (isset($mesure["sensor"]["EventControl"]))
                    {
                        $ballons_joues++;
                    }
                    elseif (isset($mesure["sensor"]["Mesure"]))
                    {
                        // Mémorise les dernières valeurs reçues qui seront affichée
                        // Distance totale parcourue en mètres
                        $Dist       = $mesure["sensor"]["Mesure"]["param"][0]["Dist"];
                        // Vitesse moyenne en km/h
                        $Average    = $mesure["sensor"]["Mesure"]["param"][0]["Average"];
                        // Vitesse maximum en km/h
                        $Max = $mesure["sensor"]["Mesure"]["param"][0]["Max"];
                        // Nombre de pas depuis le début de la session
                        $Step       = $mesure["sensor"]["Mesure"]["param"][0]["Step"];
                        // Nombre de sprint depuis le début de la session
                        $Sprint     = $mesure["sensor"]["Mesure"]["param"][0]["Sprint"];
                        // Ratio mouvement/immobilité
                        $Mobility   = $mesure["sensor"]["Mesure"]["param"][0]["Mobility"];
                        // Nombre de tir depuis le début de la session
                        $Shoot      = $mesure["sensor"]["Mesure"]["param"][0]["Shoot"];
                        // Nombre de passes depuis le début de la session
                        $Pass       = $mesure["sensor"]["Mesure"]["param"][0]["Pass"];
                        //Nombre de contrôles depuis le début de la session
                        $Control    = $mesure["sensor"]["Mesure"]["param"][0]["Control"];
                        // Pour la courbe
                        $minutes = ($date_heure - $start) / 60;
                        $vitesses_moyennes["$minutes"] = $Average;
                    }
                    elseif (isset($mesure["sensor"]["Check"]))
                    {
                        null;
                    }
                    elseif (isset($mesure["sensor"]["Battery"]))
                    {
                        null;
                    }
                    else
                    dd(["Message capteur inconnu:",$m]);
                    $end = $date_heure;
                }
            }
            $minutes = ($end - $start) / 60;
            $heures = floor($minutes / 60);
            $minutes = $minutes % 60;
            if ($minutes < 10)
            $duree = "$heures:0$minutes";
            else
            $duree = "$heures:$minutes";
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
        // Valeurs pour affichage dans vue
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
        dd($request);
        $rules = $this->validateForm();
        $validator = Validator::make($request->all(), $rules);
        if ($validator->passes()) {
            $data = $this->validatePost('tb_accueiljoueurs');
            
            $id = $this->model->insertRow($data , $request->input('inscription_id'));
            
            if(!is_null($request->input('apply')))
            {
                $return = 'accueiljoueurs/update/'.$id.'?return='.self::returnUrl();
            } else {
                $return = 'accueiljoueurs?return='.self::returnUrl();
            }
            // Insert logs into database
            if($request->input('inscription_id') =='')
            {
                \SiteHelpers::auditTrail( $request , 'New Data with ID '.$id.' Has been Inserted !');
            } else {
                \SiteHelpers::auditTrail($request ,'Data with ID '.$id.' Has been Updated !');
            }
            return Redirect::to($return)->with('messagetext',\Lang::get('core.note_success'))->with('msgstatus','success');
            
        } else {
            return Redirect::to('accueiljoueurs/update/'.$request->input('inscription_id'))->with('messagetext',\Lang::get('core.note_error'))->with('msgstatus','error')
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
            return Redirect::to('accueiljoueurs?return='.self::returnUrl())
            ->with('messagetext', \Lang::get('core.note_success_delete'))
            ->with('msgstatus','success');
        }
        else
        {
            return Redirect::to('accueiljoueurs?return='.self::returnUrl())
            ->with('messagetext','No Item Deleted')
            ->with('msgstatus','error');
        }
    }
    public static function display( )
    {
        $mode  = isset($_GET['view']) ? 'view' : 'default' ;
        $model  = new Accueiljoueurs();
        $info = $model::makeInfo('accueiljoueurs');
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
                return view('accueiljoueurs.public.view',$data);
            }
        }
        else
        {
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
            return view('accueiljoueurs.public.index',$data);
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
