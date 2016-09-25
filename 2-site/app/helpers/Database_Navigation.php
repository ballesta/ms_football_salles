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
    static function link($text, $link)
    {
        return '<a href="'.$link.'">'.$text.'</a>';
    }
}