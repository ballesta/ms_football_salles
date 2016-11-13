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
        ////(( Code generated begin
    public static function queryWhere(  ){
	        $role = \Session::get('gid');
	        if ($role == 1 ||  $role == 2)
	        {
		        $filter =  "  WHERE fbs_reseaux_salles.club_id IS NOT NULL ";
	        }
	        elseif ($role == 4)
	        {
		        // Responsable reseau : limit to network
		        $club_id = \Session::get('user_club_id');
		        $filter =  "  WHERE fbs_reseaux_salles.club_id = $club_id ";
	        }
	        return $filter;
        }
        ////)) Code generated end
    }
