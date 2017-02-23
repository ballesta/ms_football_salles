<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class EnvoiMesuresController extends Controller
{
    /**
     * Envoi des mesures
     * Utilisation pour injecter des mesures de test
     *
     * @return Response
     */
    public function index()
    {

        return $this->envoi_shoots();

    }

    // Envoi des mesures de shoots
    function envoi_shoots()
    {
        //
        $r = "<h1>Envoi mesures</h1>"
            . "<h3>Local: Enregistrement brut</h3>";
        //return $r;
        // URL de l'API
        // $url = "http://ms-football-api-native-5-1-lts/public/sessionMesures";
        //$url = "http://localhost/ms_football_api_native_5_1_lts/public/sessionMesures";
	    $url = "http://football.ballesta.fr/sessionMesures";
	    //$url = "http://football.ballesta.fr/sessionMesures";
	    $begin = time();
	    $nombre_messages = 1000;
	    $ch = curl_init();
        for ($i=1; $i <= $nombre_messages ; $i++ ) {
            $s = $i*10;
            // Message
            $data_json = '
		        {   
                    "chronoBorne": "0" , "chronoSensor": "0" , "IEEE": "54:4a:16:56:46:1a",
                     "mesures": 
                        {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", 
                        "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}"
		        }
			';
	        // Appel de l'api pour l'envoi d'un message
	        $response = $this->api_post($ch, $data_json, $url);
            $r .= $response . '<br><hr>';
        }
	    curl_close($ch);
	    $end = time();
        $duree_emission = $end - $begin;

        $r .= "url: $url<br>"
	        . "nombre_messages: $nombre_messages <br>"
	        . "duree_emission: $duree_emission <br>"
	       .  '*** Fin ***';

        return $r;
    }


    // Envoi une mesure (codée en Json)
    function api_post($ch, $data_json, $url)
    {
        //$ch = curl_init();
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
            throw new Exception('****' . curl_error($ch), curl_errno($ch));
        }

        //curl_close($ch);

        return $response;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        //
        return "<h1>Create</h1>";
    }

    /**
     * Store a newly created resource in storage.
     *
     * @return Response
     */
    public function store()
    {
        //
        return "<h1>Store</h1>";
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id)
    {
        //
        return "<h1>Show</h1>";
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function update($id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id)
    {
        //
    }
}
