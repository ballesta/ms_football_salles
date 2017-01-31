<?php namespace App\Models;

use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;

class accueiljoueurs extends Sximo  {
	
	protected $table = 'fbs_inscription';
	protected $primaryKey = 'inscription_id';

	public function __construct() {
		parent::__construct();
		
	}

	public static function querySelect(  ){
		
		return "  SELECT fbs_inscription.* FROM fbs_inscription  ";
	}	

	public static function queryWhere(  ){
		
		return "  WHERE fbs_inscription.inscription_id IS NOT NULL ";
	}
	
	public static function queryGroup(){
		return "  ";
	}
	

}
