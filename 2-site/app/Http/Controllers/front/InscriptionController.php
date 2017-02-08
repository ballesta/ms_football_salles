<?php

namespace App\Http\Controllers\front;

use Illuminate\Http\Request;
use DB;
use App\Http\Requests;
use App\Http\Controllers\Controller;

class InscriptionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    /*
     * Inscription joueurs à la partie sélectionné
     *
	 * Si demande de formulaire:
	 *     Si partie n'existe pas
	 *         créer nouvelle partie
	 *     Sinon
	 *         Lire la partie existante à patir deu terrain_id et heure de début
	 * Sinon
	 *     (Cas d'une soumission de formulaire rempli)
	 *     Traiter les données transmises par le formulaire:
	 *     Vérifier que la partie existe bien; sinon renvoyer un erreur grave
	 *     Créer les nouveaux joueurs tels que saisis dans le formulaire
	 *         Le joueurs sont saisi si ils ne sont pas proposés dans la liste déroulante
	 *     Créer les nouvelles équipes telles que saisis dans le formulaire
	 *     Effacer les inscriptions courantes de la partie
	 *     Créer les inscriptions à partir des valeurs du formulaire
	 *     Modifier la partie
	 * Générer le formulaire d'inscription à partie de la partie.
	 *     Ce qui demande de lire les fichiers liés comme les equipes et les joueurs.
	 *
     */
    public function inscription()
    {
	    $terrain_id = $_GET['terrain_id'];
	    $heure = $_GET['heure'];
	    $minutes = $_GET['minute'];
        echo "<h1>Inscription $terrain_id $heure $minutes</h1>";
        $partie = self::lis_ou_cree_partie($terrain_id, $heure, $minutes);
        $salle_id = $partie->salle_id;
        $salle= self::lis_salle($salle_id);
        dd(["Salle", $salle]);
        // Lis joueurs inscrits  + Noms joueurs
	    // Jointure entre joueurs incrits et joueurs
    }

    // Renvoie la partie
	private function lis_ou_cree_partie($terrain_id, $heure, $minutes)
	{
		$date_du_jour = date("Y-m-d");
		$hh_mm = self::heure_hh_mm( $heure, $minutes);
		$debut = "$date_du_jour $hh_mm:00";
		//dd($debut);
		$partie = DB::table('fb_partie')
			->where('salle_id', '=', $terrain_id )
			->where('debut'   , '=', $debut )
			->get();
		//dd([$debut,$partie]);
    	if(empty($partie))
	    {
	    	// Pas de partie: la créer
		    $partie_id = DB::table('fb_partie')->insert(
		    	[
			        [
			        	'debut' => $debut,
				        'duree' => 60,
				        'salle_id' => $terrain_id,
				        'complexe_salle_id' => 7
			        ]
			    ]);
		    $partie = DB::table('fb_partie')
			    ->where('partie_id', '=', $partie_id )
			    ->get();
			//dd(["Nouvelle partie",$partie]);
	    }
	    else
	    {
	    	// Partie existante
		    //dd(["partie",$partie]);
	    }
		return $partie[0];
	}

	// Renvoie la salle
	private function lis_salle($salle_id)
	{
		$salle = DB::table('fbs_salles')->where('salle_id', '=', $salle_id)->get();
		return $salle[0];
	}

	// Ajoute un zéro aux heures et minutes si necessaire
	// renvoie: "hh:mm"
	private function heure_hh_mm($h, $m)
	{
		if ($h < 10)
			$h = "0$h";
		if ($m < 10)
			$m = "0$m";
		return "$h:$m";
	}

    /**
     * Affiche la grille d'accès à une partie
     *
     * @return \Illuminate\Http\Response
     */
    public function grille_terrains_parties()
    {
	    //Echo '<h1>Inscription:grille_terrains_parties</h1>';
	    Vue_partie_grille::partie_grille();

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update inscription.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}


class Vue_partie_grille
{
	static $terrain_selectionne;
	static $heure_selectionne  ;
	static $minutes_selectionne;

	// Affiche la grille des Terrains et parties
	static function partie_grille()
	{
		echo "<h1>Inscription des joueurs</h1>";
		echo "<h>Sélectionner le terrain et l'heure de début de la partie</h>";
		self::$terrain_selectionne = self::parametre('terrain');
		self::$heure_selectionne = self::parametre('heure');
		self::$minutes_selectionne = self::parametre('minute');
		self::affiche_style();
		self::affiche_terrains_heures();
		if (self::$terrain_selectionne)
		{
			echo "<h2>joueurs incrits</h2>";
			//self::affiche_joueurs inscrits();
		}
	}

	static function parametre($p)
	{
		if (isset($_GET[$p]))
			$valeur = $_GET[$p]; else
			$valeur = NULL;
		return $valeur;
	}

	static function affiche_style()
	{
		$style = <<<FIN
		<head>
		<style>
		table {
			font-family: arial, sans-serif;
		    border-collapse: collapse;
		    width: 100%;
		}
		
		td, th {
			border: 1px solid #dddddd;
		    text-align: left;
		    padding: 8px;
		}
		
		tr:nth-child(even) {
		background-color: #dddddd;
		}
		</style>
		</head>
FIN;
		echo $style;
	}

	static function affiche_terrains_heures()
	{
		$terrains = self::lis_terrains();
		$heure_debut = 8;
		$heure_fin = 23;
		$heure = date('H');
		//echo $heure;
		echo "<table>";
		self::affiche_entete($heure_debut, $heure, $heure_fin);
		foreach ($terrains as $t) {
			$id = $t->salle_id;
			$nom = $t->identifiant;
			echo "<tr>";
			if ($id == self::$terrain_selectionne )
				$style = 'style="background-color:orangered"';
			else
				$style = '';
			echo "<td $style>$nom</td>";
			self::affiche_heures($id, $heure_debut, $heure, $heure_fin);
			echo "</tr>";
		}
		echo "</table>";
	}

	static function lis_terrains()
	{
		$terrains = DB::select('select * from fbs_salles');
		//dd($terrains);
		return $terrains;
	}


	static function affiche_entete($heure_debut, $heure, $heure_fin)
	{
		$heures_ouverture = $heure_fin - $heure_debut + 1;
		echo "<tr>";
		echo '<th>', '</th>';
		echo "<th  colspan=$heures_ouverture>", 'Heure de début de la parties (chaque 30 minutes)', '</th>';
		echo "</tr>";
		echo "<tr>";
		echo '<th>', 'Terrains', '</th>';
		for ($h = $heure_debut; $h <= $heure_fin; $h++) {
			if ($h == $heure)
				echo "<th style=\"background-color:yellow\" >$h</th>"; else
				echo "<th>$h</th>";
		}
		echo "</tr>";
	}

	static function affiche_heures($terrain_id,
		                           $heure_debut, $heure, $heure_fin)
	{
		for ($h = $heure_debut; $h <= $heure_fin; $h++) {
			if ($h == $heure)
				$style = 'style="background-color:yellow"';
			else
				$style = '';
			echo "<td $style>";
			//$t = htmlentities ($terrain);
			//echo $terrain;
			$url='/front/inscriptions';
			echo "<a href=\"$url?terrain_id=$terrain_id&heure=$h&minute=0\">
					  00
				  </a>
				  <br>";
			echo "<a href=\"$url?terrain_id=$terrain_id&heure=$h&minute=30\">  
				  		30
 				  </a>
 				  <br>";
			echo '</td>';
		}
		echo "</div>";
	}
}

