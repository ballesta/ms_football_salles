<?php
namespace App\Models;
//namespace App\Helpers\Roles;
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
    $key_word='WHERE ';
	        foreach ($module->queryWhere as $c)
	        {
		        $queryWhere .= $key_word . $c ;
		        // Following conditions
		        $key_word='AND ';
	        }
			return $queryWhere;
        ////)) Code generated end
    }
    
    public static function queryGroup(){
        return "  ";
    }
    
}
