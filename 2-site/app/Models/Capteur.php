<?php namespace App\Models;

use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;

class capteur extends Sximo  {
	
	protected $table = 'fb_capteurs';
	protected $primaryKey = 'capteur_id';

	public function __construct() {
		parent::__construct();
		
	}

	public static function querySelect(  ){
		
		return "  SELECT fb_capteurs.* FROM fb_capteurs  ";
	}	

	public static function queryWhere(  ){
		
		return "  WHERE fb_capteurs.capteur_id IS NOT NULL ";
	}
	
	public static function queryGroup(){
		return "  ";
	}
	

}
