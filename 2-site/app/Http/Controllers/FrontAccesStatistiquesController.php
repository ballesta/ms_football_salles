<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class FrontAccesStatistiquesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
	    if ( isset($_GET['key']))
		    $key = $_GET['key'];
	        if ($key != "K&SuDY3rz5wX#iy1kf%CJOv0S3^DLLcv")
	        	return "Erreur d'authentification: clef non reconnue";
	    else
		    return "Erreur d'authentification: clef absente";


    	//http://football-bsa.ballesta.fr/index.php
	    if ( isset($_SERVER['HTTP_REFERER']))
    	    $retour = $_SERVER['HTTP_REFERER'];
	    else
	    	$retour = " #";

	    return
		    "
				<h1>Statistiques des parties</h1>
				<p>Liste ds joueurs, des parties et accès aux statistiques pour chaque joueur et pour chaque équipe.
				</p>
				<p>En cours de développement
				</p>
				
                <a href=$retour>
					<h2>
						Retour au site BSA
					</h2>
				</a>
			";
    }
}
