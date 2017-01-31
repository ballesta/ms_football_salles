<?php namespace App\Models;

use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;

class joueursComplexe extends Sximo  {
	
	protected $table = 'fb_joueurs';
	protected $primaryKey = 'joueur_id';

	public function __construct() {
		parent::__construct();
		
	}

	public static function querySelect(  ){
		
		return "  SELECT fb_joueurs.* FROM fb_joueurs    ";
	}	

	public static function queryWhere(  ){
		
		return "  WHERE fb_joueurs.joueur_id IS NOT NULL ";
	}
	
	public static function queryGroup(){
		return "  ";
	}
	

}
