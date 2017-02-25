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
	    return '<h1>Statistiques des parties</h1>
				<p>Liste ds joueurs, des parties et accès aux statistiques pour chaque joueur et pour chaque équipe.
				</p>
				<p>En cours de développement
				</p>
				
                <a href=http://football-bsa.ballesta.fr/index.php>
					<h2>
						Retour au site BSA
					</h2>
				</a>';
    }
}
