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
     * Traitement en pseudo code:
     * -------------------------
	 * Demande de formulaire à partir du terrain et de l'heure de début de la partie:
     * Peut être une demande initale pour laquelle la partie n'est pas encore créée
     * ou pour une partie qui est créée et qui a été complétée à plusiers reprises
	 *     Si partie n'existe pas
	 *         créer nouvelle partie
	 *     Sinon
	 *         Lire la partie existante à partir deu terrain_id et heure de début
     *         Lire tous les détail de la partie et les tables liées dont le formulaire a besoin
     *      Générer le formulaire
     *
	 * Réception du Formulaire rempli
	 *      (Cas d'une soumission de formulaire rempli)
	 *   >>>Vérifier que la partie existe bien; sinon renvoyer un erreur grave
	 *      Traiter les données transmises par le formulaire:
	 *          Créer les nouveaux joueurs tels que saisis dans le formulaire
	 *              Le joueurs sont saisi si ils ne sont pas proposés dans la liste déroulante
     *              Vérifier que le mail est bien unique
	 *          Créer les nouvelles équipes telles que saisis dans le formulaire
     *              todo créer equipes
	 *          Effacer les inscriptions courantes de la partie
	 *          Créer les inscriptions à partir des valeurs du formulaire
	 *          Modifier la partie
     *      Appeler la route précédente pour Générer le formulaire d'inscription à partir de la partie.
	 *          Ce qui demande de lire les fichiers liés comme les equipes et les joueurs pour
     *          déréférencer et constituer les listes.
	 *
     */

    // Demande de fiche d'inscription à une partie
	// spécifiée par le terrain (salle) et l'heure de début.
    public function inscription(Request $request)
    {
	    $terrain_id = $_GET['terrain_id'];
	    $heure = $_GET['heure'];
	    $minutes = $_GET['minute'];
        echo "<h1>Inscription</h1>";
        $partie = self::lis_ou_cree_partie($terrain_id, $heure, $minutes);
        //$salle_id = $partie->salle_id;
        //$salle= self::lis_salle($salle_id);
	    $partie_completee = self::complete_partie($partie);
	    // Lis les joueurs enregistrés pour permettre de renseigner les listes déroulants
	    $joueurs = self::lis_joueurs();
	    // Lis les equipes pour permettre de renseigner les listes déroulants
	    $equipes = self::lis_equipes();
	    // Lis les capteurs pour permettre de renseigner les listes déroulants
	    $capteurs = self::lis_capteurs();
	    // Lis joueurs inscrits  + Noms joueurs + Capteurs
	    $inscriptions = self::lis_joueurs_capteurs($partie);
	    // Compose les données à transmettre à la vue
	    $inscriptions_partie = new Partie($partie_completee, $joueurs, $equipes, $capteurs, $inscriptions);
		//dd($inscriptions_partie);

	    return view('front.inscriptions.fiche_inscription_joueurs')
		            ->with(compact('inscriptions_partie'));
    }

    // Réception de la Fiche d'inscription remplie
	// Traitement des données saisies sur la fiche
	public function inscriptionRemplie(Request $request)
	{
		//dd(["Fiche inscription remplie",$_POST]);
		// Récupère les paramètre de l'url: terrain et heure de début de la partie

		// Mise à jour de la partie existante ave les données de la fiche
		self::maj_partie($request);

		self::efface_joueurs_incrits($request);

		self::cree_et_incrit_nouveaux_joueurs($request);

		//self:inscrit_joueurs_connus_($request);

		return back()->withInput();
	}

	// Mise à jour de la partie avec les données de la fiche reçue
	static function maj_partie(Request $request)
	{
		$partie_id = $request->partie_id;
		echo $partie_id;
		//dd($request);
		//DB::listen(function($sql) {
		//	var_dump($sql);
		//});
		//DB::enableQueryLog();
		$nbr_lignes_maj = DB::table('fb_partie')
			->where('partie_id', '=', $partie_id)
			->update
			(
				[
					'duree'       => $request->partie_duree ,
					'equipe_a_id' => $request->equipe_a_id  ,
					'equipe_b_id' => $request->equipe_b_id
				]
			);
	}

	// Eface les inscriptions à la partie courante.
	static  function efface_joueurs_incrits($request)
	{
		DB::table('fbs_inscription')->where('partie_id', '=', $request->partie_id)->delete();
	}

	static function cree_et_incrit_nouveaux_joueurs($request)
	{
		// Index des joueurs pour gérer accéder à toutes les données
		// du joueur en cours de traitement.
		$j = 0;

		foreach($request->joueur_mail as $eMail)
		{
			if (!empty($eMail))
			{
				// Présence du mail.
				// Voir si mail déja enregistré dans la base.
				$joueurs = DB::table('fb_joueurs')
					->where('eMail', '=', $eMail)
					->get();
				if (empty($joueurs))
				{
					// eMail inconnu: créer joueur
					$joueur_id = DB::table('fb_joueurs')->insertGetId(
						[
							'eMail'             => $eMail[0],
							'premon'            => '--',
							'nom'               => 'A completer--',
							'complexe_salle_id' => '7'
						]);
				}
				else
				{
					// Email connu, mémorise l'id pour inscription
					/*
					 * array:1 [▼
					  0 => {#906 ▼
					    +"joueur_id": 13
					    +"nom": "--A completer--"
					    +"premon": "--A completer--"
					    +"eMail": "Bernard@Ballesta.fr"
					    +"telephone": null
					    +"lateralite": "Droitier"
					    +"date_naissance": null
					    +"taille": null
					    +"poids": null
					    +"poste_id": null
					    +"complexe_salle_id": 7
					    +"equipe_id": null
					    +"categorie_id": null
					    +"entraineur_id": null
					    +"tb_users_id": null
					  }
					]
					 */
					//dd($joueurs);
					$joueur_id = $joueurs[0]->joueur_id;
				}
				// Joueur_id est connu.
				// Inscription du joueur à la partie
				DB::table('fbs_inscription')->insert(
					[
						'joueur_id'         => $joueur_id,
						'partie_id'         => $request->partie_id,
						'capteur_id'        => $request->joueur_capteur_id[$j],
						'equipe_a_b'        => $request->joueur_equipe_id[$j]
					]);

			}
			$j++;
		}
	}


	// Renvoie la partie
	private function lis_ou_cree_partie($terrain_id, $heure, $minutes)
	{
		$partie = self::lis_partie($terrain_id, $heure, $minutes);
    	if($partie === false)
	    {
	    	// Pas de partie: la créer
		    $date_du_jour = date("Y-m-d");
		    $hh_mm = self::heure_hh_mm( $heure, $minutes);
		    $debut = "$date_du_jour $hh_mm:00";
		    $partie_id = DB::table('fb_partie')->insertGetId(
		    	[
			        	'debut' => $debut,
				        'duree' => '60',
				        'salle_id' => $terrain_id,
				        'complexe_salle_id' => '7'
			    ]);
		    // Lis après création
		    $parties = DB::table('fb_partie')
			    ->where('partie_id', '=', $partie_id )
			    ->get();
			// Vérifie la lecture de la toute nouvelle partie
		    if(empty($parties))
		    {
			    dd(["Nouvelle partie non créée ou impossible à lire!", $partie_id, $partie]);
		    }
		    else
		    	$partie = $parties[0];
	    }
	    else
	    {
	    	// Partie existante
		    //dd(["partie",$partie]);
	    }

		return $partie;
	}

    // Lis la partie
	// Renvoie la partie ou un vide
	static function lis_partie($terrain_id, $heure, $minutes)
	{
		$date_du_jour = date("Y-m-d");
		$hh_mm = self::heure_hh_mm( $heure, $minutes);
		$debut = "$date_du_jour $hh_mm:00";
		// Tentative de lecture de la partie
		$parties =  DB::table('fb_partie')
							->where('salle_id', '=', $terrain_id )
							->where('debut'   , '=', $debut )
							->get();
		if (!empty($parties))
			return $parties[0];
		else
			return false;
	}


	// Renvoie la salle
	private function lis_salle($salle_id)
	{
		$salle = DB::table('fbs_salles')->where('salle_id', '=', $salle_id)->get();
		return $salle[0];
	}

	// Renvoie le détail de la partie complète destinée à être traitée par la vue
	// Les inscriptions sont traitées à part.
	private function complete_partie($partie)
	{
		// Complète la partie avec le nom de la salle et le nom des equipes
		$partie_completee =
			DB::table('fb_partie as p')
				->where('partie_id', '=', $partie->partie_id )
				->leftjoin('fbs_salles as s',  's.salle_id', '=', 'p.salle_id')
				->leftjoin('fb_equipes as equipe_a', 'equipe_a.equipe_id', '=', 'p.equipe_a_id')
				->leftjoin('fb_equipes as equipe_b', 'equipe_b.equipe_id', '=', 'p.equipe_b_id')
				->select(
					'p.*',
				    DB::raw('SUBSTRING(p.debut,12,5) as hh_mm'),
					's.identifiant as salle_nom',
					'equipe_a.nom as equipe_a_nom',
					'equipe_b.nom as equipe_b_nom'
				)
			->get();
		//dd($partie_completee);
		if (empty($partie_completee))
			dd("Partie completee?");
		return $partie_completee[0];
	}

	private function lis_equipes()
	{
		return 	DB::table('fb_equipes as e')
			->select('e.*')
			->get();
	}

	private function lis_capteurs()
	{
		return 	DB::table('fb_capteurs as c')
			->select('c.*')
			->get();
	}

	private function lis_joueurs()
	{
		return 	DB::table('fb_joueurs as j')
			->select('j.*')
			->get();
	}
	// Lis joueurs inscrits  + Noms joueurs + Capteurs
	// par jointure entre joueurs incrits, joueurs et capteurs.
	private function lis_joueurs_capteurs($partie)
	{
		$inscription_joueurs =
			DB::table('fbs_inscription as i')
				->where('i.partie_id', '=', $partie->partie_id )
				->join('fb_joueurs as j',  'j.joueur_id', '=', 'i.joueur_id')
				->join('fb_capteurs as c',  'c.capteur_id', '=', 'i.capteur_id')
				->select
				(
					'i.*',
					DB::raw('CONCAT(j.premon, " ", j.nom) AS joueur_nom'),
					'c.code as capteur_code'
				)
				->get();
		//dd($inscription_joueurs);
		return $inscription_joueurs;
	}

	// Ajoute un zéro aux heures et minutes si necessaire
	// renvoie: "hh:mm"
	private static function heure_hh_mm($h, $m)
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
     * route: 'front\InscriptionController@grille_terrains_parties'
     * @return \Illuminate\Http\Response
     */
    public function grille_terrains_parties()
    {
	    Echo '<h1>Inscription:grille_terrains_parties</h1>';
	    return Vue_partie_grille::partie_grille();

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



// Partie complète pour affichage dans la vue
class Partie
{
	public $partie;
	public $inscriptions;

	function __construct($partie, $joueurs, $equipes, $capteurs, $inscriptions)
	{
		$this->partie = $partie;
		$this->joueurs = $joueurs;
		$this->equipes = $equipes;
		$this->capteurs = $capteurs;
		$this->inscriptions = $inscriptions;
	}
}
class Grille
{

	public $salles = [];
	public $heure_debut;
	public $heure_fin;

	function __construct($heure_debut, $heure_fin, $salles)
	{
		$this->heure_debut = $heure_debut;
		$this->heure_fin = $heure_fin;
		$this->salles = $salles;
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
		//echo "<h1>Inscription des joueurs</h1>";
		//echo "<h>Sélectionner le terrain et l'heure de début de la partie</h>";
		$grille = '';
		self::$terrain_selectionne = self::parametre('terrain');
		self::$heure_selectionne = self::parametre('heure');
		self::$minutes_selectionne = self::parametre('minute');
		self::affiche_style();
		$salles = self::lis_terrains();
		$grille = new Grille(8,23,$salles);
		//dd($grille);
		return view('front.inscriptions.grille_terrains_parties')
			->with(compact('grille'));
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

