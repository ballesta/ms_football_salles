<?php namespace App\Models;
use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;
class salle extends Sximo  {
    
    protected $table = 'fbs_salles';
    protected $primaryKey = 'salle_id';
    public function __construct() {
        parent::__construct();
        
    }
    public static function querySelect(  ){
        
        return "  SELECT fbs_salles.* FROM fbs_salles  ";
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
