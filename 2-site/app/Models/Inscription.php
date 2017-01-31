<?php namespace App\Models;
use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;
class inscription extends Sximo  {
    
    protected $table = 'fbs_inscription';
    protected $primaryKey = 'inscription_id';
    public function __construct() {
        parent::__construct();
        
    }
    public static function querySelect(  ){
        
        return "  SELECT fbs_inscription.* FROM fbs_inscription  ";
    }
    public static function queryWhere(  ){
        ////(( Code generated begin
    $where = [];// Filter on parent 
$parent_id_key = 'partie_id';
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
$where[] = \App\Helpers\Roles::filter( "inscription");
$sql_where = \App\Helpers\SQL_Where::compose($where);
return $sql_where;
        ////)) Code generated end
    }
    
    public static function queryGroup(){
        return "  ";
    }
    
}
