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
			$dist = 0;
			$shoot = 0;
			$dist = 0;
			$max = 0;
			$average = 0;
			for ($m = 0; $m <= $inscription->duree; $m++)
			{
				$dist += 10;
				$shoot += 1;
				$max = 10 + $m;
				$max = self::point(20,$m);
				$average = 5 + $m;
				$mesure["Mesure"] =
				[
					"Shoot" => "$shoot",
					"Control" => "0",
					"Step" => "78",
					"Dist" => "$dist",
					"UID" => "54:4a:16:56:46:1a",
					"Mobility" => "0",
					"Max" => "$max",
					"Average"=> "$average",
					"Pass" => "0",
					"Sprint" => "0"
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

		// Génère une série sinusoidale amortie en fonction du temps
		static function point($max, $t)
		{
			$pi = pi();
			$periode = 10;
			$p = 1
			   + (cos((2*$pi)/$periode))
			   * $t;
			return $p;
		}
	}