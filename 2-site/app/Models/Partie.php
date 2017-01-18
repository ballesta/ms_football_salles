<?php namespace App\Models;

use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;

class partie extends Sximo  {
	
	protected $table = 'fb_partie';
	protected $primaryKey = 'partie_id';

	public function __construct() {
		parent::__construct();
		
	}

	public static function querySelect(  ){
		
		return "  SELECT fb_partie.* FROM fb_partie  ";
	}	

	public static function queryWhere(  ){
		
		return "  WHERE fb_partie.partie_id IS NOT NULL ";
	}
	
	public static function queryGroup(){
		return "  ";
	}
	

}
