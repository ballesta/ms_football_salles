<?php
	/**
	 * Created by PhpStorm.
	 * User: bernard
	 * Date: 20/12/2016
	 * Time: 15:44
	 */
	namespace App\Helpers;
	use Illuminate\Support\Facades\DB;
	class StatistiquesMesures
	{
		// Appelé après ajout inscription dans 'InscriptionController.php'
		// Crée
		// - la partie à laquelle s'est inscrit le joueur,
		// - la participation du joueur à la partie créée
		// - la session de mesure avec le capteur remis
		static function cree_partie_joueur_selectionne_session_mesures($id, $inscription)
		{
			// Crée la partie à laquelle s'est inscrit le joueur,
			$partie_id = self::cree_partie($id, $inscription);
			// Crée la participation du joueur à la partie
			$joueur_selectionne_id = self::inscrit_joueur_a_partie($partie_id, $inscription);
			// Crée la session de mesure avec le capteur remis
			$session_mesure_id = self::cree_sessions_mesures($joueur_selectionne_id, $inscription);
			// Les mesures seront liées à la session de mesure sur demande des statistiques
			return $session_mesure_id;
		}


		// Suite à inscription et remise capteur:
		// - Crée la partie si inexistante
		// - - Table fb_partie
		static function cree_partie($inscription_id, $inscription)
		{
			// Lis ou crée partie
			// Partie définie par:
			// - Complexe salle
			// - Salle (terrain)
			// - Heure début
			// Tentative de lecture de la partie
			$complexe_salle_id = $inscription['complexe_salle_id'];
			$salle_id = $inscription['terrain_id'];
			$terrain_id = $salle_id;
			$heure_debut = $inscription['heure_debut'];
			$duree = $inscription['duree'];
			$parties = DB::table('fb_partie')->where('complexe_salle_id', $complexe_salle_id)->where('salle_id', $salle_id)->where('debut', $heure_debut)->get();
			$nbr_parties = count($parties);
			if ($nbr_parties == 0) {
				$partie = [];
				$partie['debut'] = $heure_debut;
				$partie['duree'] = $duree;
				$partie['fin'] = NULL;
				$partie['salle_id'] = $salle_id;
				$partie['complexe_salle_id'] = $complexe_salle_id;
				// Partie inexistante: créer
				$partie_id = DB::table('fb_partie')->insertGetId($partie);
			} elseif ($nbr_parties == 1) {
				// Partie déjà créée
				// dd($parties);
				$partie_id = $parties[0]->partie_id;
			} else {
				dd(['Plus d une partie', parties]);
			}
			// Renvoie l'id de la partie créé ou lue
			return $partie_id;
		}

		// Inscrit le joueur à la partie si pas encore inscrit
		// - Table fb_joueurs_selectionnes
		// - Déja inscrit si changement de capteur
		//
		// ++++ Restriction temporaire: pas de changement de capteur en cours de partie.
		static function inscrit_joueur_a_partie($partie_id, $inscription)
		{
			$joueur_id = $inscription['joueur_id'];
			$capteur_id = $inscription['capteur_id'];
			$joueur_selectionne['partie_id'] = $partie_id;
			$joueur_selectionne['joueur_id'] = $joueur_id;
			$joueur_selectionne['capteur_id'] = $capteur_id;
			// Partie inexistante: créer
			$joueur_selectionne_id = DB::table('fb_joueurs_selectionnes')->insertGetId($joueur_selectionne);
			return $joueur_selectionne_id;
		}

		// Crée la session de mesures du capteur
		// - Table fb_sessions_mesures
		static function cree_sessions_mesures($joueur_selectionne_id, $inscription)
		{
			$capteur_id = $inscription['capteur_id'];
			$session_mesure = [];
			$session_mesure['capteur_id'] = $capteur_id;
			$session_mesure['joueur_selectionne_id'] = $joueur_selectionne_id;
			$session_mesure_id = DB::table('fb_sessions_mesures')->insertGetId($session_mesure);
			return $session_mesure_id;
		}


		// Appelé pour préparer les données à afficher par la vue des statistiques
		// Elabore les statistiques pour une inscription donnée
		// Filtre les mesures sur
		// - Intervalle Date et heures début .. fin
		// - UID du capteur remis à l'inscription
		// Renvoie les données pour affichage par la vue de statistique

		/*
		Exemple de message en Json:
		{
			"EventShoot":
			{
				{
					"UID": "111111",
					"id": "1",
					"speed": "11"
				}
			}
		}
		---------------------
		{
			"Mesure":
			{
				"Shoot": "0",
				"Control": "0",
				"Step": "9",
				"Dist": "10",
				"UID": "54:4a:16:56:46:1a",
				"Mobility": "0",
				"Max": "0",
				"Average": "0",
				"Pass": "0",
				"Sprint": "0"
			}
		}
		*/

		static function statistiques($inscription_id, $inscription)
		{
			//dd($inscription);
			// Critères de filtrage à partir de l'inscription
			$debut_partie = strtotime($inscription->heure_debut);
			$duree = $inscription->duree * 60;
			$fin_partie = $debut_partie + $duree;
			$capteur_id = $inscription->capteur_id;
			//dd([$debut_partie, $duree, $fin_partie]);
			// Récupère l'adresse MAC du capteur
			$capteur = DB::table('fb_capteurs')->where('capteur_id', $capteur_id)
				                              ->get();
			//dd($capteur);
			$uid_capteur = $capteur[0]->UID;
			//dd($uid_capteur);


			// Lis toutes les mesure
			// par ordre chronologique ascendants.
			$mesures = DB::table('fb_mesures')->orderBy('Horodatage', 'asc')->get();
			$ballons_joues = 0;
			$Dist = 0;
			$Average = 0;
			$Max = 0;
			$Max_session = 0;
			$Step = 0;
			$Sprint = 0;
			$Mobility = 0;
			$Shoot = 0;
			$Pass = 0;
			$Control = 0;
			$duree = 0;
			$gen_test_a = 0;
			$vitesses = "";
			if (count($mesures) > 0) {
				// Calculées à partir des vitesses moyennes transmises pour chaque mesure
				// ++++ Hypothèse
				$vitesses_moyennes = [];
				$i = 0;
				$mesures_intervalle = [];
				$mesures_traitees = [];
				foreach ($mesures as $m)
				{
					//dd($m); // Mesure base
					$date_heure = strtotime($m->Horodatage);
					if (   $date_heure >= $debut_partie
						&& $date_heure <= $fin_partie)
					{
						// Mesure pendant la partie, voir l'uid du capteur est celui que porte le joueur
						$mesure = json_decode($m->message_json, $to_array = TRUE);
						//dd($mesure);
						$mesures_intervalle[] = $mesure;
						//if (   isset($mesure['Mesure'])) dd($mesure);
						if (   isset($mesure['Mesure']["UID"])
							&& $mesure['Mesure']["UID"]== $uid_capteur)
						{
							// Traiter mesure
							// En cas d'absence de message start: prendre heure premier message
							$mesures_traitees[] = [$m->Horodatage, $mesure];
							if (++$i == 1) {
								// Premier message seulement: top de départ
								$start = $date_heure;
							}
							//dd($mesure);
							if (isset($mesure["mesures"])) {
								NULL;
							} elseif (isset($mesure ["EventShoot"])) {
								$ballons_joues++;
							} elseif (isset($mesure ["EventShoot"])) {
								$ballons_joues++;
							} elseif (isset($mesure ["EventPass"])) {
								$ballons_joues++;
							} elseif (isset($mesure ["EventControl"])) {
								$ballons_joues++;
							} elseif (isset($mesure["Mesure"])) {
								// Mémorise les dernières valeurs reçues qui seront affichée
								// Distance totale parcourue en mètres
								$Dist = $mesure ["Mesure"]["Dist"];
								// Vitesse moyenne en km/h depuis le dernier message
								$Average = $mesure ["Mesure"]["Average"];
								// Vitesse maximum en km/h depuis le dernier message
								//$Average = $gen_test_a++;

								$Max = $mesure ["Mesure"]["Max"];
								// Mémorise le maximum
								if ($Max > $Max_session)
									$Max_session = $Max;
								// Nombre de pas depuis le début de la session
								$Step = $mesure ["Mesure"]["Step"];
								// Nombre de sprint depuis le début de la session
								$Sprint = $mesure ["Mesure"]["Sprint"];
								// Ratio mouvement/immobilité
								$Mobility = $mesure ["Mesure"]["Mobility"];
								// Nombre de tir depuis le début de la session
								$Shoot = $mesure ["Mesure"]["Shoot"];
								if ($Shoot > $ballons_joues)
									$ballons_joues = $Shoot;
								// Nombre de passes depuis le début de la session
								$Pass = $mesure ["Mesure"]["Pass"];
								//Nombre de contrôles depuis le début de la session
								$Control = $mesure ["Mesure"]["Control"];
								// Pour la courbe
								$minutes = ($date_heure - $start) / 60;
								$vitesses_moyennes["$minutes"] = $Average;
							} elseif (isset($mesure ["Check"])) {
								NULL;
							} elseif (isset($mesure ["Battery"])) {
								NULL;
							} else
								dd(["Message capteur inconnu:", $mesure]);
							$end = $date_heure;
						}
					}
				}
				if ($i > 0) {
					// Présence de mesures
					$minutes = ($end - $start) / 60;
					$heures = floor($minutes / 60);
					$minutes = $minutes % 60;
					if ($minutes < 10)
						$duree = "0$heures:0$minutes";
					else
						$duree = "0$heures:$minutes";
					//dd([$end, $start,$end - $start,  $duree]);
					$vitesses = "";
					//dd($vitesses_moyennes);
					//$n = count($vitesses_moyennes);
					foreach ($vitesses_moyennes as $m => $v) {
						$vitesses .= "{ x:$m, y:$v },";
					}
					$vitesses = rtrim($vitesses, ",");
					//dd([$vitesses_moyennes,$vitesses]);
				}
			}
			$s =
			[   'Dist'               => $Dist,
			    'duree'              => $duree,
			    'ballons_joues'      => $ballons_joues,
			    'vitesse_maximale'   => $Max_session,
			    'vitesses'           => $vitesses
			];
			//dd([$end, $start, $minutes, $mesures_intervalle, $mesures_traitees, $s]);
			return $s;
		}
	}


