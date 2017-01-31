<?php namespace App\Models;

use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;

class statistiques extends Sximo  {
	
	protected $table = 'fb_statistiques';
	protected $primaryKey = 'statistique_id';

	public function __construct() {
		parent::__construct();
		
	}

	public static function querySelect(  ){
		
		return "  SELECT fb_statistiques.* FROM fb_statistiques  ";
	}	

	public static function queryWhere(  ){
		
		return "  WHERE fb_statistiques.statistique_id IS NOT NULL ";
	}
	
	public static function queryGroup(){
		return "  ";
	}
	

}
