<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;


// Envoi de mesures pour lestests
class EnvoiMesuresController extends Controller
{
    /**
     * Route::get('envoiMesures',"EnvoiMesuresController@index");
     *
     * @return Response
     */
    public function getIndex()
    {
	    $begin = time();
        $r = $this->envoi_shoots();
		$end = time();

		return '----seconds: ' . $end - $begin . $r;
    }

    function envoi_shoots()
    {
        //
        $r = "<h1>Envoi mesures</h1>"
            . "<h3>Local: Enregistrement brut</h3>";
        //return $r;

        // URL de l'API
        $url = "http://ms-football-salles-public/sessionMesures";

        // Appel de l'api pour l'envoi d'un message

        $nombre_messages = 10;
        for ($i=1; $i <= $nombre_messages ; $i++ ) {
            $s = $i*10;
            $data_json = '
            {"chronoBorne": "0" , 
             "chronoSensor": "0" , 
             "IEEE": "54:4a:16:56:46:1a", 
             "mesures": 
                {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", 
                 "Control": "0", "Mobility": "0", "Max": "0", 
                 "Average": "0", "Sprint": "0"}
            }
		';
            $response = $this->api_post($data_json, $url);
            $r .= $response
                .  '<br><hr>';
        }

        $r .=  '*** Fin ***';

        return $r;
    }

    function api_post($data_json, $url)
    {
        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch,
            CURLOPT_HTTPHEADER,
            array('Content-Type: application/json'));
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS,$data_json);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $response  = curl_exec($ch);
        if (FALSE === $response)
        {
            // Erreur: remonter l'exception signalée par Curl
            throw new Exception(curl_error($ch), curl_errno($ch));
        }

        curl_close($ch);

        return $response;
    }
}
