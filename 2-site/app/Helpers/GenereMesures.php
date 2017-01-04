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
		 * par le bouton "génère"
		 *
		 * @param $id_inscription = Identifiant inscription
		 * @param $inscription = détails de l'inscription
		 *                       -Capteur,
		 *                       -Date, heure début match
		 *                       -Durée du match (30, 60, 90 minutes)
		 */
		Static function Partie($id_inscription,
							   $inscription)
		{
			dd($inscription);
		}
	}