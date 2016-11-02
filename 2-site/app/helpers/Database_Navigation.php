<?php
/**
 * Created by PhpStorm.
 * User: bernard
 * Date: 25/09/2016
 * Time: 02:18
 */

namespace App\Helpers;
use Illuminate\Support\Facades\DB;

class Database_Navigation
{
    // Fabrique un bouton pour accéder à la liste détaillée
    /**
     * @param $text
     * @param $help
     * @param $link
     * @param $parent_key
     * @param $parent_id
     * @return string
     */

    //use \Illuminate\Session;

    static function link_to_detail( $text,
                                    $help,
                                    $url,
                                    $parent_key,    // field name
                                    $parent_label,  // field name       -
                                    $parent_id,     // value            ^
									$parent_name    // value        For Breadcrum
                                  )
    {

	    // -Passer identifiant (id) en parametre
	    //  pour le mettre en session en début de l'url appellée
		//
	    // -Passer le nom  en parametre
	    //  pour l'afficher dans le breadcrumb

	    // todo reporter dans module
	    if ($parent_label == 'joueur_id') {
		    $joueur = \DB::table('fb_joueurs')->where('joueur_id', '=', $parent_id)->first();
		    if (count($joueur) == 1)
		    {
			    $parent_name = $joueur->nom;
		    }
	    }
        $bouton=
         '<a href="' . $url . '?'
         .         $parent_key . '=' . $parent_id
         .        '&' . $parent_label . '=' . $parent_name
         .       '"'
         .'   class="tips btn btn-xs btn-primary"'
         .'   title="' . $help . '">'
         .    $text
         . '</a>';

        return $bouton;
    }
}