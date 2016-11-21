<?php namespace App\Models;
use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;
class joueurCentre extends Sximo  {
    
    protected $table = 'fb_joueurs';
    protected $primaryKey = 'joueur_id';
    public function __construct() {
        parent::__construct();
        
    }
    public static function querySelect(  ){
        
        return "  SELECT fb_joueurs.* FROM fb_joueurs     ";
    }
    public static function queryWhere(  ){
        ////(( Code generated begin
    $where = [];// Filter on parent 
$parent_id_key = 'complexe_salle_id';
// Table
$table = with(new static)->table;
// clef primaire de la table
$key = with(new static)->primaryKey;
// Id du parent passée en paramètre?
$id = \Session::get($parent_id_key,null);
if (is_null($id))
{
    // No id,leave existing filter
    $where[] = " $table.$key IS NOT NULL ";
}
else
{
    // Filter by parent id
    $where[] = "  $table.$parent_id_key = $id ";
}
$where[] = \App\Helpers\Roles::filter( "joueurCentre");
$sql_where = \App\Helpers\SQL_Where::compose($where);
return $sql_where;
        ////)) Code generated end
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
    $where .=  "  WHERE fb_joueurs.complexe_salle_id = $id ";
}
return $where;
////)) Code generated end
}
public static function queryGroup(){
return "  ";
}
}
