<?php namespace App\Models;

use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;

class equipe extends Sximo  {
	
	protected $table = 'fb_equipes';
	protected $primaryKey = 'equipe_id';

	public function __construct() {
		parent::__construct();
		
	}

	public static function querySelect(  ){
		
		return "  SELECT fb_equipes.* FROM fb_equipes  ";
	}	

	public static function queryWhere(  ){
		
		return "  WHERE fb_equipes.equipe_id IS NOT NULL ";
	}
	
	public static function queryGroup(){
		return "  ";
	}
	

}
