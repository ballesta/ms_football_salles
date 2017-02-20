<?php namespace App\Http\Controllers;
use App\Http\Controllers\controller;
use App\Models\Salle;
use Illuminate\Http\Request;
use Illuminate\Pagination\LengthAwarePaginator as Paginator;
use Validator, Input, Redirect ;
class SalleController extends Controller {
    protected $layout = "layouts.main";
    protected $data = array();
    public $module = 'salle';
    static $per_page	= '10';
    
    public function __construct()
    {
        parent::__construct();
        $this->model = new Salle();
        
        $this->info = $this->model->makeInfo( $this->module);
        $this->access = $this->model->validAccess($this->info['id']);
        
        $this->data = array(
        'pageTitle'			=> 	$this->info['title'],
        'pageNote'			=>  $this->info['note'],
        'pageModule'		=> 'salle',
        'pageUrl'			=>  url('salle'),
        'return' 			=> 	self::returnUrl()
        );
        
    }
    
    public function getIndex()
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
            ."<i>Terrains</i>")
            ->with("msgstatus","warning");
        }
        ////)) Code generated end
        ////(( Code generated begin
        \Session::forget("salle_id");
        \Session::forget("salle_id_identifier");
        \Session::forget("partie_id");
        \Session::forget("partie_id_identifier");
        \Session::forget("inscription_id");
        \Session::forget("inscription_id_identifier");
        \Session::forget("joueur_id");
        \Session::forget("joueur_id_identifier");
        \Session::forget("capteurs_id");
        \Session::forget("capteurs_id_identifier");
        \Session::forget("equipe_id");
        \Session::forget("equipe_id_identifier");
        ////)) Code generated end
        if($this->access['is_view'] ==0)
        return Redirect::to('dashboard')->with('messagetext',\Lang::get('core.note_restric'))->with('msgstatus','error');
        
        $this->data['access']		= $this->access;
        return view('salle.index',$this->data);
    }
    public function postData( Request $request)
    {
        $sort = (!is_null($request->input('sort')) ? $request->input('sort') : $this->info['setting']['orderby']);
        $order = (!is_null($request->input('order')) ? $request->input('order') : $this->info['setting']['ordertype']);
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
        'limit'		=> (!is_null($request->input('rows')) ? filter_var($request->input('rows'),FILTER_VALIDATE_INT) : $this->info['setting']['perpage'] ) ,
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
        $pagination->setPath('salle/data');
        
        $this->data['param']		= $params;
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
        $this->data['colspan'] 		= \SiteHelpers::viewColSpan($this->info['config']['grid']);
        // Group users permission
        $this->data['access']		= $this->access;
        // Detail from master if any
        $this->data['setting'] 		= $this->info['setting'];
        
        // Master detail link if any
        $this->data['subgrid']	= (isset($this->info['config']['subgrid']) ? $this->info['config']['subgrid'] : array());
        // Render into template
        return view('salle.table',$this->data);
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
            $this->data['row'] 		=  $row;
        } else {
            $this->data['row'] 		= $this->model->getColumnTable('fbs_salles');
            ////(( Code generated begin
            $columns = $this->data['row'];
            $id = \Session::get('complexe_salle_id', null);
            $columns['complexe_salle_id'] = $id;
            $this->data['row'] = $columns;
            ////)) Code generated end
        }
        $this->data['setting'] 		= $this->info['setting'];
        $this->data['fields'] 		=  \AjaxHelpers::fieldLang($this->info['config']['forms']);
        
        $this->data['id'] = $id;
        return view('salle.form',$this->data);
    }
    public function getShow( $id = null)
    {
        
        if($this->access['is_detail'] ==0)
        return Redirect::to('dashboard')
        ->with('messagetext', \Lang::get('core.note_restric'))->with('msgstatus','error');
        
        $row = $this->model->getRow($id);
        if($row)
        {
            $this->data['row'] =  $row;
            
            $this->data['id'] = $id;
            $this->data['access']		= $this->access;
            $this->data['setting'] 		= $this->info['setting'];
            $this->data['fields'] 		= \AjaxHelpers::fieldLang($this->info['config']['grid']);
            $this->data['subgrid']		= (isset($this->info['config']['subgrid']) ? $this->info['config']['subgrid'] : array());
            return view('salle.view',$this->data);
        } else {
            return response()->json(array(
            'status'=>'error',
            'message'=> \Lang::get('core.note_error')
            ));
        }
    }
    function postCopy( Request $request)
    {
        
        foreach(\DB::select("SHOW COLUMNS FROM fbs_salles ") as $column)
        {
            if( $column->Field != 'salle_id')
            $columns[] = $column->Field;
        }
        if(count($request->input('ids')) >=1)
        {
            $toCopy = implode(",",$request->input('ids'));
            
            
            $sql = "INSERT INTO fbs_salles (".implode(",", $columns).") ";
            $sql .= " SELECT ".implode(",", $columns)." FROM fbs_salles WHERE salle_id IN (".$toCopy.")";
            \DB::select($sql);
            return response()->json(array(
            'status'=>'success',
            'message'=> \Lang::get('core.note_success')
            ));
        } else {
            return response()->json(array(
            'status'=>'success',
            'message'=> 'Please select row to copy'
            ));
        }
        
    }
    function postSave( Request $request, $id =0)
    {
        
        $rules = $this->validateForm();
        $validator = Validator::make($request->all(), $rules);
        if ($validator->passes()) {
            $data = $this->validatePost('fbs_salles');
            
            $id = $this->model->insertRow($data , $request->input('salle_id'));
            
            return response()->json(array(
            'status'=>'success',
            'message'=> \Lang::get('core.note_success')
            ));
            
        } else {
            $message = $this->validateListError(  $validator->getMessageBag()->toArray() );
            return response()->json(array(
            'message'	=> $message,
            'status'	=> 'error'
            ));
        }
        
    }
    public function postDelete( Request $request)
    {
        if($this->access['is_remove'] ==0) {
            return response()->json(array(
            'status'=>'error',
            'message'=> \Lang::get('core.note_restric')
            ));
            die;
        }
        // delete multipe rows
        if(count($request->input('ids')) >=1)
        {
            $this->model->destroy($request->input('ids'));
            
            return response()->json(array(
            'status'=>'success',
            'message'=> \Lang::get('core.note_success_delete')
            ));
        } else {
            return response()->json(array(
            'status'=>'error',
            'message'=> \Lang::get('core.note_error')
            ));
        }
    }
    public static function display( )
    {
        $mode  = isset($_GET['view']) ? 'view' : 'default' ;
        $model  = new Salle();
        $info = $model::makeInfo('salle');
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
                return view('salle.public.view',$data);
            }
        } else {
            $page = isset($_GET['page']) ? $_GET['page'] : 1;
            $params = array(
            'page'		=> $page ,
            'limit'		=>  (isset($_GET['rows']) ? filter_var($_GET['rows'],FILTER_VALIDATE_INT) : 10 ) ,
            'sort'		=> 'salle_id' ,
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
            return view('salle.public.index',$data);
        }
    }
    function postSavepublic( Request $request)
    {
        
        $rules = $this->validateForm();
        $validator = Validator::make($request->all(), $rules);
        if ($validator->passes()) {
            $data = $this->validatePost('fbs_salles');
            $this->model->insertRow($data , $request->input('salle_id'));
            return  Redirect::back()->with('messagetext','<p class="alert alert-success">'.\Lang::get('core.note_success').'</p>')->with('msgstatus','success');
        } else {
            return  Redirect::back()->with('messagetext','<p class="alert alert-danger">'.\Lang::get('core.note_error').'</p>')->with('msgstatus','error')
            ->withErrors($validator)->withInput();
        }
        
    }
    
}
