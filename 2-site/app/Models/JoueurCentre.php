<?php namespace App\Models;
use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;
class joueurCentre extends Sximo  {
    
    protected $table = 'fb_joueurs';
    protected $primaryKey = 'joueur_id';
    public function __construct() {
        parent::__construct();
        
    }
    public static function querySelect(  ){
        
        return "  SELECT fb_joueurs.* FROM fb_joueurs     ";
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
