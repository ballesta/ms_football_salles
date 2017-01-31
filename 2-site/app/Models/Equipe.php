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
$where[] = \App\Helpers\Roles::filter( "equipe");
$sql_where = \App\Helpers\SQL_Where::compose($where);
return $sql_where;
        ////)) Code generated end
    }
    
    public static function queryGroup(){
        return "  ";
    }
    
}
