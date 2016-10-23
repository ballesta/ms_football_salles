<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class EnvoiMesuresController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function getIndex()
    {

        return $this->envoi_shoots();

    }

    function envoi_shoots()
    {
        //
        $r = "<h1>Envoi mesures</h1>"
            . "<h3>Local: Enregistrement brut</h3>";
        return $r;

        // URL de l'API
        // $url = "http://ms-football-api-native-5-1-lts/public/sessionMesures";
        //$url = "http://localhost/ms_football_api_native_5_1_lts/public/sessionMesures";
        $url = "http://localhost/ms-football-salles/public/sessionMesures";
        //$url = "http://localhost/ms_football_api_native_5_1_lts/";
        //      http://localhost/ms_football_api_native_5_1_lts/
        // sessionMesures

        // Appel de l'api pour l'envoi d'un message

        $nombre_messages = 1;
        for ($i=1; $i <= $nombre_messages ; $i++ ) {
            $s = $i*10;
            $data_json = '
        {   
            "sensor": {
              "EventShoot": {
                 "UID": "12345678",'.
                '"id": "' . $i . '",' .
                '"speed": "' . $s . '"
              }
            }
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
