<?php namespace App\Models;
use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Session;

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
		$parent_id_key = 'club_id'; 
        // Table
        $table = self::table;
        // clef primaire de la table
        $key = self::primaryKey;
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
    }
    
    public static function queryGroup(){
        return "  ";
    }
    
}
