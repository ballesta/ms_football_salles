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
