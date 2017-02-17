<?php namespace App\Models;

use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;

class mesurestoutesajax extends Sximo  {
	
	protected $table = 'fb_mesures';
	protected $primaryKey = 'mesure_id';

	public function __construct() {
		parent::__construct();
		
	}

	public static function querySelect(  ){
		
		return "  SELECT fb_mesures.* FROM fb_mesures  ";
	}	

	public static function queryWhere(  ){
		
		return "  WHERE fb_mesures.mesure_id IS NOT NULL ";
	}
	
	public static function queryGroup(){
		return "  ";
	}
	

}
