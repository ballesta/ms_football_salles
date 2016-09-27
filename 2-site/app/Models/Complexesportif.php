<?php namespace App\Models;

use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;

class complexesportif extends Sximo  {
	
	protected $table = 'fbs_complexe_salles';
	protected $primaryKey = 'complexe_salle_id';

	public function __construct() {
		parent::__construct();
		
	}

	public static function querySelect(  ){
		
		return "  SELECT fbs_complexe_salles.* FROM fbs_complexe_salles  ";
	}	

	public static function queryWhere(  ){

	    //dd($_GET['club_id']);
        return self::parent_filter('club_id');
	}
	
	public static function queryGroup(){
		return "  ";
	}
	

}
