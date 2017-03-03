<?php namespace App\Http\Controllers\front\tunisie;

use Illuminate\Database\Eloquent\Model;


	/**
	 * Vue Laravel pour statistiques joueur
	 */

	// Données sur lesquelles est basée la vue laravel
	class StatistiquesJoueur extends Model
	{
		// Valeurs à mettre en forme
		public $photo;
		public $nom;
		public $rang;
		public $date;
		public $durée;
		public $equipe;
		public $distance;
		public $rythme;
		public $acitvite;
		public $courses;
		public $sprints;
		public $vitesseMax;
		public $explosivite;
		public $ballonsJoues;
		public $passes;
		public $tirs;
		public $puissancemax;
		// Séries pour histogrammes empilés
		public $marcheCourseLente=[];
		public $Course=[];
		public $CourseHauteIntensite=[];

		public function stats_player(){

			// Exemple de données transmises à la vue Laravel
			$stats = new StatistiquesJoueur();
			$stats->photo          = 'mahajoub.jpeg';
			$stats->nom            = 'Kaled Mahajoub';
			$stats->rang           = '25';
			$stats->date           = 'mercredi 6 janvier 2017';
			$stats->durée          = '60';
			$stats->equipe         = 'Les artistes';
			$stats->distance       = '1258';
			$stats->rythme         = '11.02';
			$stats->acitvite       = '28.8';
			$stats->courses        = '68';
			$stats->sprints        = '25';
			$stats->vitesseMax     = '21';
			$stats->explosivite    = '28.8';
			$stats->ballonsJoues   = '180';
			$stats->passes         = '122';
			$stats->tirs           = '18';
			$stats->puissancemax   = '89';
			$stats->marcheCourseLente    = [1,2,3,4,5,4,3,2,1]; // Pyramide
			$stats->Course               = [9,8,7,6,5,4,3,2,1]; // Décroissante
			$stats->CourseHauteIntensite = [1,2,3,2,1,2,3,2,1]; // Dents de scie
			return $stats;
      }
	}

?>