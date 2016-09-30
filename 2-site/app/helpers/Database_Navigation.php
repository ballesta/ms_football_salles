<?php
/**
 * Created by PhpStorm.
 * User: bernard
 * Date: 25/09/2016
 * Time: 02:18
 */

namespace App\Helpers;

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
    static function link($text, $help, $url, $parent_key, $parent_id)
    {
        // Passer identifiant en parametre
        // pour le mettre en session en début de l'url appellée
        $bouton=
         '<a href="' . $url . '?' . $parent_key . '=' . $parent_id . '"'
        .'   class="tips btn btn-xs btn-primary"'
        .'   title="' . $help . '">'
        .    $text
        . '</a>';

        return $bouton;
    }
}