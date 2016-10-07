<?php namespace App\Models;
use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;
class malette extends Sximo  {
    
    protected $table = 'fb_malette_capteurs';
    protected $primaryKey = 'malette_capteurs_id';
    public function __construct() {
        parent::__construct();
        
    }
    public static function querySelect(  ){
        
        return "  SELECT fb_malette_capteurs.* FROM fb_malette_capteurs  ";
    }
    public static function queryWhere(  ){
        ////(( Code generated begin
        $parent_id_key = 'complexe_salle_id';
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
