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
    //
		$role = \Session::get('gid');
		if ($role == 1 ||  $role == 2)
		{
		    // Administrator: no filters by reseau
		    $where =  "";
		}
		elseif ($role == 4  ||  $role == 5)
		{
		    // Responsable reseau : limit to user network
		    $club_id = \Session::get('user_club_id');
		    $where =  "  WHERE fbs_reseaux_salles.club_id = $club_id ";
		}		    
		return $where;
        ////)) Code generated end
    }
    elseif ($role == 4  ||  $role == 5)
    {
        // Responsable reseau : limit to user network
        $club_id = \Session::get('user_club_id');
        $where =  "  WHERE fbs_reseaux_salles.club_id = $club_id ";
    }
    return $where;
    ////)) Code generated end
}
elseif ($role == 4  ||  $role == 5)
{
    // Responsable reseau : limit to user network
    $club_id = \Session::get('user_club_id');
    $where =  "  WHERE fbs_reseaux_salles.club_id = $club_id ";
}
return $where;
////)) Code generated end
}
public static function queryGroup(){
return "  ";
}
}
