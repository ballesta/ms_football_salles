<?php namespace App\Models;
use Illuminate\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Model;
class joueurselectionne extends Sximo  {
    
    protected $table = 'fb_joueurs_selectionnes';
    protected $primaryKey = 'joueur_selectionne_id';
    public function __construct() {
        parent::__construct();
        
    }
    public static function querySelect(  ){
        
        return "  SELECT fb_joueurs_selectionnes.* FROM fb_joueurs_selectionnes ";
    }
    public static function queryWhere(  ){
        ////(( Code generated begin
        $where = [];$where[] = \App\Helpers\Roles::filter( "joueurselectionne");
$sql_where = \App\Helpers\SQL_Where::compose($where);
return $sql_where;
        ////)) Code generated end
    }
    
    public static function queryGroup(){
        return "  ";
    }
    
}
