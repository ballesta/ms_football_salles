<?php namespace App\Models;
use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;
class mesure extends Sximo  {
    
    protected $table = 'fb_mesures';
    protected $primaryKey = 'mesure_id';
    public function __construct() {
        parent::__construct();
        
    }
    public static function querySelect(  ){
        
        return "  SELECT fb_mesures.* FROM fb_mesures  ";
    }
    public static function queryWhere(  ){
        ////(( Code generated begin
        $where = [];$where[] = \App\Helpers\Roles::filter( "mesure");
$sql_where = \App\Helpers\SQL_Where::compose($where);
return $sql_where;
        ////)) Code generated end
    }
    
    public static function queryGroup(){
        return "  ";
    }
    
}
