<?php
	namespace App\Models;
use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;

class reseauxsalles extends Sximo  {
    
    protected $table = 'fbs_reseaux_salles';
    protected $primaryKey = 'club_id';
    public function __construct() {
        parent::__construct();
        
    }
    public static function querySelect(  ){
        
        return "  SELECT fbs_reseaux_salles.* FROM fbs_reseaux_salles  ";
    }
    public static function queryWhere(  ){
        ////(( Code generated begin
        $where = [];
        $where[] = \App\Helpers\Roles::filter( "reseauxsalles");
		$sql_where = \App\Helpers\SQL_Where::compose($where);
		return $sql_where;
        ////)) Code generated end
    }
    
    public static function queryGroup(){
        return "  ";
    }
    
}
