<?php
	/**
	 * Created by PhpStorm.
	 * User: bernard
	 * Date: 12/11/2016
	 * Time: 18:47
	 */
	namespace App\Helpers;
	class Roles
	{
        static $roles =
	        [
				 1	=> 'Superadmin'	    ,
				 2	=> 'Administrator'	    ,
				 4	=> 'Responsable réseau'	,
				 5	=> 'Responsable Centre'	,
				 8	=> 'Accueil Centre'	    ,
				10  => 'Joueur'
			];
		static function filter($actual_role,$table)
		{
			$filter = '';
			$table_has_club_id = false;
			switch ($actual_role)
			{
				case 1:     // Superadmin
				case 2:     // Administrator
					$filter = '';
					break;
				case 4:     // Responsable réseau
					if ($table_has_club_id)
					{
						$club_id = \Session::get('club_id');
						$filter = " club_id = $club_id ";
					}
					break;
				case 5:     // Responsable Centre
					break;
				case 8:     // Accueil Centre
					break;
				case 5:     // Joueur
					break;
				default:
					dd("Role inconnu: $actual_role");
			}
			return $filter;
		}
	}
?>