<?php namespace App\Models;
use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;
class mesure extends Sximo  {
    
    protected $table = 'fb_mesures';
    protected $primaryKey = 'mesure_id';
    public function __construct() {
        parent::__construct();
        
    }
    public static function querySelect(  ){
        
        return "  SELECT fb_mesures.* FROM fb_mesures  ";
    }
    public static function queryWhere(  ){
        ////(( Code generated begin
        $parent_id_key = 'session_mesure_id';
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
    
    public static function queryGroup(){
        return "  ";
    }
    
}