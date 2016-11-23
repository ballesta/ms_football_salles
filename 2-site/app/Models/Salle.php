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
		
		return "  WHERE fbs_salles.salle_id IS NOT NULL ";
	}
	
	public static function queryGroup(){
		return "  ";
	}
	

}
