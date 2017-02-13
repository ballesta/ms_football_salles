<?php

	/**
	 * Vue Laravel pour statistiques joueurs
	 */

	// Données sur lesquelles est basée la vue laravel
	class StatistiquesJoueur
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
	}

	// Exemple de données transmises à la vue Laravel
	$s = new StatistiquesJoueur();
	$s ->photo          = 'mahajoub.jpg';
	$s ->nom            = 'Kaled Mahajoub';
	$s ->rang           = '25';
	$s ->date           = '06/01/2017';
	$s ->durée          = '60';
	$s ->equipe         = 'Les artistes';
	$s ->distance       = '1258';
	$s ->rythme         = '11.02';
	$s ->acitvite       = '28.8';
	$s ->courses        = '68';
	$s ->sprints        = '25';
	$s ->vitesseMax     = '21';
	$s ->explosivite    = '28.8';
	$s ->ballonsJoues   = '180';
	$s ->passes         = '122';
	$s ->tirs           = '18';
	$s ->puissancemax   = '89';
	$s ->marcheCourseLente    = [1,2,3,4,5,4,3,2,1]; // Pyramide
	$s ->Course               = [9,8,7,6,5,4,3,2,1]; // Décroissante
	$s ->CourseHauteIntensite = [1,2,3,2,1,2,3,2,1]; // Dents de scie

?>