<?php
	/**
	 * Created by PhpStorm.
	 * User: bernard
	 * Date: 04/01/2017
	 * Time: 23:35
	 */
	namespace App\Helpers;
	use Illuminate\Support\Facades\DB;
	class GenereMesures
	{
		/**
		 * Génère des mesures pour un joueur inscrit à une partie.
		 *
		 * Appelée à partir de la liste des inscriptions
		 * par le bouton "génère" sur une ligne d'inscription
		 *
		 * @param $id_inscription = Identifiant inscription
		 * @param $inscription= détails de l'inscription
		 *                          -Capteur,
		 *                          -Date, heure début match
		 *                          -Durée du match (30, 60, 90 minutes)
		 *                      Exemple d'inscription:
		 *					        {#1157 ▼
		 *					        +"inscription_id": 33
		 *					        +"joueur_id": 4
		 *					        +"terrain_id": 11
		 *					        +"heure_debut": "2016-12-31 17:00:00"
		 *					        +"duree": 30
		 *					        +"capteur_id": 3
		 *					        +"created_by_user_id": 5
		 *					        +"createdOn": "2016-12-20 19:54:01"
		 *					        +"updatedOn": "2017-01-04 19:40:27"
		 *					        +"complexe_salle_id": 7
		 *					        }
		 */
		Static function Partie($id_inscription,
							   $inscription)
		{
			//dd($inscription);

			// Récupère l'adresse Mac (bluetooth) du capteur.
			$UID = self::get_UID_capteur($inscription->capteur_id);

			// Supprime les mesures de la partie
			// (intervalle début à fin)
			self::supprime_mesures_partie($inscription, $UID);


			// Génère une mesure par minute
			$mm='';
			$t = strtotime($inscription->heure_debut);
			$cumul_shoot = 0;
			$cumul_distance = 0;
			for ($m = 0; $m <= $inscription->duree; $m++)
			{
				$cumul_distance += self::point(20,$m);
				$cumul_shoot += self::point(4,$m);;
				$max = 10 + $m;
				$max = self::point(20,$m);
				$average = self::point(20-4,$m);;
				$mesure["Mesure"] =
				[
					"UID" => "54:4a:16:56:46:1a",   // Fixe
					"Mobility" => "0",              // Instantanée
					"Max" => "$max",                // Instantanée
					"Average"=> "$average",         // Instantanée
					"Shoot" => "$cumul_shoot",      // Cumul
					"Control" => "0",               // Cumul
					"Step" => "78",                 // Cumul
					"Dist" => "$cumul_distance",    // Cumul
					"Pass" => "0",                  // Cumul
					"Sprint" => "0"                 // Cumul
				];
				//dd($mesure_en_json);
				$horodatage = date('Y-m-d H-i-s', $t);
				$bluetooth = $UID;
				$complexe_salle_id = 7;
				$message_json = json_encode($mesure);

				// Ajoute la mesure
				DB::table('fb_mesures')->insert(
				[
					'Horodatage'        => $horodatage,
					'bluetooth'         => $bluetooth,
					'complexe_salle_id' => $complexe_salle_id,
					'message_json'      => $message_json
				]);
				$t += 60;   // Minute suivante
			}
		}

		Static function get_UID_capteur($capteur_id)
		{
			$capteurs = DB::table('fb_capteurs')
				->where('capteur_id', $capteur_id)
				->get();
			$UID = $capteurs[0]->UID;
			return $UID;
		}

		static function supprime_mesures_partie($inscription, $UID)
		{
			// Supprime les mesures
			$debut = strtotime($inscription->heure_debut);
			$fin = date('Y-m-d H-i-s',$debut + ($inscription->duree * 60));
			//dd([$debut,$fin]);
			DB::table('fb_mesures')
				->whereBetween('Horodatage', [$inscription->heure_debut,
					                          $fin])
				->where('bluetooth', $UID)
				->delete();
		}


		/**
		 * Génère une série sinusoidale amortie en fonction du temps
		 *
		 * Equations données par Le Docteur Annabelle BALLESTA
		 * Professeur à l'université de WarWick http://www2.warwick.ac.uk/
		 *
		 * @param $max Maximmum sur l'échelle des les Y
		 * @param $t   Temps t en minutes
		 *
		 * @return int Point sur l'axe des Y
		 */
		static function point($max, $t)
		{
			$pi = pi();     // Constante PI avec un max de précision
			$periode = 10;  // En Minutes

			// 1-Sinusoide
			$p = 1
			   + sin
				(
			   	    ((2*$pi)/$periode) * $t
				);

			// 2- Bruit aléatoire
			$alea = rand(0, 1);
			$p = $p + $alea;

			// 3-Atténuation exponentielle comme la tour Eiffel
			// http://www.unige.ch/~fiorelli/NuitScience/2010/Poster_TourEiffel_light.pdf
			$attenuation = exp(-(0.03 * $t));
			$p = $p * $attenuation;

			// 4-Mise à l'échelle des Y
			$y = ($p * $max / 2 * 0.8)
			   + ($max * 0.1);
			return $y;
		}
	}