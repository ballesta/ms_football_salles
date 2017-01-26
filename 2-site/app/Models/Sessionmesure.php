<?php namespace App\Models;
use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;
class sessionmesure extends Sximo  {
    
    protected $table = 'fb_sessions_mesures';
    protected $primaryKey = 'session_mesure_id';
    public function __construct() {
        parent::__construct();
        
    }
    public static function querySelect(  ){
        
        return "  SELECT fb_sessions_mesures .* FROM fb_sessions_mesures  ";
    }
    public static function queryWhere(  ){
        ////(( Code generated begin
        $where = [];$where[] = \App\Helpers\Roles::filter( "sessionmesure");
$sql_where = \App\Helpers\SQL_Where::compose($where);
return $sql_where;
        ////)) Code generated end
    }
    
    public static function queryGroup(){
        return "  ";
    }
    
}
