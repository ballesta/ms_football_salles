<?php namespace App\Models;

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
		
		return "  WHERE fbs_reseaux_salles.club_id IS NOT NULL ";
	}
	
	public static function queryGroup(){
		return "  ";
	}
	

}
