<?php namespace App\Models;
use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;
class complexesportif extends Sximo  {
    
    protected $table = 'fbs_complexe_salles';
    protected $primaryKey = 'complexe_salle_id';
    public function __construct() {
        parent::__construct();
        
    }
    public static function querySelect(  ){
        
        return "  SELECT fbs_complexe_salles.* FROM fbs_complexe_salles  ";
    }
    public static function queryWhere(  ){
        ////(( Code generated begin
        $parent_id_key = 'club_id';
        // Table
        $table = with(new static)->table;
        // clef primaire de la table
        $key = with(new static)->primaryKey;
        // Id du parent passée en paramètre?
        $id = \Session::get($parent_id_key, null);
        if (is_null($id))
        {
            // No id,leave existing filter
            $where = "  WHERE $table.$key IS NOT NULL ";
        }
        else
        {
            // Filter by parent id
            $where = "  WHERE $table.$parent_id_key = $id ";
        }
        return $where;
        ////)) Code generated end
    }
    elseif ($role == 5)
    {
        // Responsable complexe sportif : complexe sportif
        $id = \Session::get('user_complexe_salle_id');
        $where .=  "  WHERE fbs_complexe_salles.complexe_salle_id = $id ";
    }
    return $where;
    ////)) Code generated end
}
elseif ($role == 5)
{
    // Responsable complexe sportif : complexe sportif
    $id = \Session::get('user_complexe_salle_id');
    $where .=  "  AND fbs_complexe_salles.complexe_salle_id = $id ";
}
return $where;
////)) Code generated end
}
public static function queryGroup(){
return "  ";
}
}
