<?php namespace App\Models;

use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;

class malette extends Sximo  {
	
	protected $table = 'fb_malette_capteurs';
	protected $primaryKey = 'malette_capteurs_id';

	public function __construct() {
		parent::__construct();
		
	}

	public static function querySelect(  ){
		
		return "  SELECT fb_malette_capteurs.* FROM fb_malette_capteurs  ";
	}	

	public static function queryWhere(  ){
		
		return "  WHERE fb_malette_capteurs.malette_capteurs_id IS NOT NULL ";
	}
	
	public static function queryGroup(){
		return "  ";
	}
	

}
