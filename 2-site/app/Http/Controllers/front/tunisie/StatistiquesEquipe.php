<?php

	namespace App;
	use Illuminate\Database\Eloquent\Model;
	/**
	 * Vue Laravel pour statistiques equipe
	 */
	// Données sur lesquelles est basée la vue laravel
	class StatistiquesEquipe extends Model
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
		public $marcheCourseLente = [];
		public $Course = [];
		public $CourseHauteIntensite = [];

		public function stats_equipe()
		{
			// Exemple de données transmises à la vue Laravel
			$stats = new StatistiquesEquipe();
			$stats->photo = 'mahajoub.jpeg';
			$stats->nom = 'Kaled Mahajoub';
			$stats->date = '6 janvier 2017';
			$stats->durée = '60';
			$stats->equipe = 'Créteil Futsal';
			$stats->advairse = 'Paris FC';
			$stats->statistiques = array(array('moy' => array('type' => 'Distance',
			                                                  'color' => 'primary',
			                                                  'club' => '34.3 Km',
			                                                  'advairse' => '31.6 KM'),
			                                                  'tables' => array(
			                                                  	array('type' => 'distance',
			                                                          'color' => 'primary',
			                                                          'icon' => 'distance.svg',
			                                                          'players' => array('THIERRY HENRY' => array('value' => '1258', 'is_adv' => 0), 'Bernarddiomede' => array('value' => '1220', 'is_adv' => 1), 'Thierry Henry' => array('value' => '1208', 'is_adv' => 0), 'Zlatan Ibrahimovic' => array('value' => '1203', 'is_adv' => 0), 'Kaled Mahajoub' => array('value' => '1152', 'is_adv' => 1), 'Ngolokante' => array('value' => '1125', 'is_adv' => 1), 'Patrice Evra' => array('value' => '1120', 'is_adv' => 1), 'Thiago Motta' => array('value' => '1020', 'is_adv' => 1), 'Edisson Cavani' => array('value' => '1010', 'is_adv' => 0), 'Lucas Digne' => array('value' => '990', 'is_adv' => 0), 'Karim Benzema' => array('value' => '893', 'is_adv' => 1), 'Blaise Matuidi' => array('value' => '880', 'is_adv' => 0))), array('type' => 'Activite', 'color' => 'primary', 'icon' => 'chronometer.svg', 'players' => array('THIERRY HENRY' => array('value' => '28.8', 'is_adv' => 0), 'Bernarddiomede' => array('value' => '28.2', 'is_adv' => 1), 'Thierry Henry' => array('value' => '28.1', 'is_adv' => 0), 'Zlatan Ibrahimovic' => array('value' => '27.5', 'is_adv' => 0), 'Kaled Mahajoub' => array('value' => '23.5', 'is_adv' => 1), 'Ngolokante' => array('value' => '22.5', 'is_adv' => 1), 'Patrice Evra' => array('value' => '20.3', 'is_adv' => 1), 'Thiago Motta' => array('value' => '19.2', 'is_adv' => 1), 'Edisson Cavani' => array('value' => '19.1', 'is_adv' => 0), 'Lucas Digne' => array('value' => '18.8', 'is_adv' => 0), 'Karim Benzema' => array('value' => '18.3', 'is_adv' => 1), 'Blaise Matuidi' => array('value' => '15.5', 'is_adv' => 0))))), array('moy' => array('type' => 'Courses', 'color' => 'green-apple', 'club' => '258', 'advairse' => '222'), 'tables' => array(array('type' => 'Courses', 'color' => 'green-apple', 'icon' => 'course.svg', 'players' => array('THIERRY HENRY' => array('value' => '125', 'is_adv' => 0), 'Bernarddiomede' => array('value' => '105', 'is_adv' => 1), 'Thierry Henry' => array('value' => '102', 'is_adv' => 0), 'Zlatan Ibrahimovic' => array('value' => '100', 'is_adv' => 0), 'Kaled Mahajoub' => array('value' => '98', 'is_adv' => 1), 'Ngolokante' => array('value' => '82', 'is_adv' => 1), 'Patrice Evra' => array('value' => '87', 'is_adv' => 1), 'Thiago Motta' => array('value' => '85', 'is_adv' => 1), 'Edisson Cavani' => array('value' => '80', 'is_adv' => 0), 'Lucas Digne' => array('value' => '758', 'is_adv' => 0), 'Karim Benzema' => array('value' => '70', 'is_adv' => 1), 'Blaise Matuidi' => array('value' => '60', 'is_adv' => 0))), array('type' => 'Vitesse Max', 'color' => 'green-apple', 'icon' => 'vitesse_max.svg', 'players' => array('THIERRY HENRY' => array('value' => '28.8', 'is_adv' => 0), 'Bernarddiomede' => array('value' => '28.2', 'is_adv' => 1), 'Thierry Henry' => array('value' => '28.1', 'is_adv' => 0), 'Zlatan Ibrahimovic' => array('value' => '27.5', 'is_adv' => 0), 'Kaled Mahajoub' => array('value' => '23.5', 'is_adv' => 1), 'Ngolokante' => array('value' => '22.5', 'is_adv' => 1), 'Patrice Evra' => array('value' => '20.3', 'is_adv' => 1), 'Thiago Motta' => array('value' => '19.2', 'is_adv' => 1), 'Edisson Cavani' => array('value' => '19.1', 'is_adv' => 0), 'Lucas Digne' => array('value' => '18.8', 'is_adv' => 0), 'Karim Benzema' => array('value' => '18.3', 'is_adv' => 1), 'Blaise Matuidi' => array('value' => '15.5', 'is_adv' => 0))))), array('moy' => array('type' => 'Ballons joues', 'color' => 'orange', 'club' => '325', 'advairse' => '258'), 'tables' => array(array('type' => 'Ballons joues', 'color' => 'orange', 'icon' => 'ballons_joues.svg', 'players' => array('THIERRY HENRY' => array('value' => '666', 'is_adv' => 0), 'Bernarddiomede' => array('value' => '652', 'is_adv' => 1), 'Thierry Henry' => array('value' => '640', 'is_adv' => 0), 'Zlatan Ibrahimovic' => array('value' => '620', 'is_adv' => 0), 'Kaled Mahajoub' => array('value' => '613', 'is_adv' => 1), 'Ngolokante' => array('value' => '603', 'is_adv' => 1), 'Patrice Evra' => array('value' => '595', 'is_adv' => 1), 'Thiago Motta' => array('value' => '592', 'is_adv' => 1), 'Edisson Cavani' => array('value' => '580', 'is_adv' => 0), 'Lucas Digne' => array('value' => '550', 'is_adv' => 0), 'Karim Benzema' => array('value' => '520', 'is_adv' => 1), 'Blaise Matuidi' => array('value' => '480', 'is_adv' => 0))))), array('moy' => array('type' => 'Tirs', 'color' => 'orange', 'club' => '85', 'advairse' => '25'), 'tables' => array(array('type' => 'Tirs', 'color' => 'orange', 'icon' => 'Tirs.svg', 'players' => array('THIERRY HENRY' => array('value' => '152', 'is_adv' => 0), 'Bernarddiomede' => array('value' => '148', 'is_adv' => 1), 'Thierry Henry' => array('value' => '144', 'is_adv' => 0), 'Zlatan Ibrahimovic' => array('value' => '132', 'is_adv' => 0), 'Kaled Mahajoub' => array('value' => '125', 'is_adv' => 1), 'Ngolokante' => array('value' => '115', 'is_adv' => 1), 'Patrice Evra' => array('value' => '113', 'is_adv' => 1), 'Thiago Motta' => array('value' => '109', 'is_adv' => 1), 'Edisson Cavani' => array('value' => '101', 'is_adv' => 0), 'Lucas Digne' => array('value' => '92', 'is_adv' => 0), 'Karim Benzema' => array('value' => '89', 'is_adv' => 1), 'Blaise Matuidi' => array('value' => '88', 'is_adv' => 0))))));
			return $stats;
		}
	}

	?>