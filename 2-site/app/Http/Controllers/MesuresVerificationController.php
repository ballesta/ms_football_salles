<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use DB;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class MesuresVerificationController extends Controller
{
    /**
     * Vérifie la chronologie des mesures
     *
     *  'chronoBorne' du message json doit être croissant
     *  Enregistre les trous dans la numérotation dans le champ 'perte_messages'
     *
     * @return \Illuminate\Http\Response
     */
    public function verifieMesures()
    {
	    $mesures = DB::select('SELECT `mesure_id`, `message_json` 
                               FROM `fb_mesures`
                               WHERE `message_json` LIKE "%chronoSensor%IEEE%"
                               ORDER BY `fb_mesures`.`Horodatage` ASC 
                               LIMIT 10000');
	    //dd($mesures);
	    $chronoBornePrecedent = 0;
	    $chronoSensorPrecedent = [];
	    $i=0;
	    $trace='';
	    $nombre_redemarrage_borne = 0;
	    $nombre_redemarrage_sensor = 0;
	    foreach ($mesures as $m)
	    {
		    $message = json_decode($m->message_json);
		    $mesure_id = $m->mesure_id ;
		    //if ($i>=19) dd($m);
		    $chronoSensor = $message->chronoSensor;
		    $chronoBorne = $message->chronoBorne;
		    $mesure_id = $m->mesure_id;
		    $trace .= "$mesure_id $chronoSensor $chronoBorne ";

		    // ---- Capteur ----
		    // Chrono for each sensor

		    $IEEE = $message->IEEE;
		    $IEEE = substr($IEEE, 2,17);
		    //dd($IEEE );
		    $IEEE = "AAAA";
		    if (!isset($chronoSensorPrecedent[$IEEE]))
			    $chronoSensorPrecedent[$IEEE] =  0;
		    //dd([$IEEE,$m->message_json,$message]);
		    if($chronoSensor == 0)
		    {
			    // Redemarrage de la borne: ne pas signaler comme erreur
			    $nombre_redemarrage_sensor++;
			    $trace .= " ==== Redemarage sensor $nombre_redemarrage_sensor";
		    }
		    else
		    {
			    // Pas un redemarrage: vérifier la séquence
			    $chronoSensorAttendu = $chronoSensorPrecedent[$IEEE] + 1;
			    if 	($chronoSensor != $chronoSensorAttendu)
			    {
				    $manquants =  $chronoSensor - $chronoSensorAttendu;
				    // Rupture de séquence: enregistrer dans le champ perte_messages
				    $trace .= " ---->>>> Attendu Capteur:" . $chronoSensorAttendu;
				    $affected = DB::update('update fb_mesures 
                                            set perte_messages_capteur = ? 
                                            where mesure_id = ?',
					    [
						    $manquants,
						    $mesure_id
					    ]
				    );
			    }
		    }
		    //dd($IEEE);
		    $chronoSensorPrecedent[$IEEE] = $chronoSensor;

		    // ---- Borne
	    	if($chronoBorne == 0)
			{
				// Redemarrage de la borne: ne pas signaler comme erreur
				$nombre_redemarrage_borne++;
				$trace .= " ==== Redemarage Borne $nombre_redemarrage_borne";
			}
			else
			{
				// Pas un redemarrage: vérifier la séquence

				$chronoAttendu = $chronoBornePrecedent + 1;
				if 	($chronoBorne != $chronoAttendu)
				{
					$manquants =  $chronoBorne - $chronoAttendu;
					// Rupture de séquence: enregistrer dans le champ perte_messages
					$trace .= " ---->>>> Attendu Borne:" . $chronoAttendu;
					$affected = DB::update('update fb_mesures 
                                            set perte_messages = ? 
                                            where mesure_id = ?',
						                    [
						                     $manquants,
							                 $mesure_id
						                    ]
					                      );
				}
			}
		    $chronoBornePrecedent = $chronoBorne;

		    $trace .= "<br>";
	    	$i++;
	    }
	    $trace .= "Nombre mesures: $i<br>";
    	return "<h1>Vérification des mesures</h1>"
		    . "<h3>Vérifie les numéro chronologiques des messages des capteurs et des bornes</h3>"
		    . "nombre_redemarrage_borne=$nombre_redemarrage_borne<br>"
		    . "nombre_redemarrage_sensor=$nombre_redemarrage_sensor<br>"
		    . "id    Capteur Borne<br>"
		    . "----  ------- -----<br>"
		     . $trace;
    }
}
