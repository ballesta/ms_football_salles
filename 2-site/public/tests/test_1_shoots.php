<?php
    /**
     * Created by PhpStorm.
     * User: bernard
     * Date: 15/10/2016
     * Time: 10:04
     */

    echo "<h1>Envoi mesures</h1>";
    echo "<h3>Local: Enregistrement brut</h3>";

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
        $response = api_post($data_json, $url);
        print_r($response); echo '<br><hr>';
    }

echo '*** Fin ***';


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
?>