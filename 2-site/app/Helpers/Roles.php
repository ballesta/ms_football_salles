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
		static function filter( $module_name)
		{   $actual_role = \Session::get('gid');
			$filter = '';
			switch ($actual_role)
			{
				case 1:     // Superadmin
				case 2:     // Administrator
					// No filter, may access any club, complexe
					// Uers 'club_id'   'complexe_salle_id' are not meaninfull
					$filter = '';
					break;
				case 4:     // Responsable réseau
					switch ($module_name)
					{
						case 'reseauxsalles':
							$user_club_id = get_current_session_variable('user_club_id');
							$filter = "  club_id = $user_club_id";
							break;
						case 'complexesportif':
							// No filter: the hierarchical filter is sufficient
							break;
						default:
							break;
					}
					break;
				case 5:     // Responsable Centre
					switch ($module_name)
					{
						case 'reseauxsalles':
							$user_club_id = get_current_session_variable('user_club_id');
							$filter = "  club_id = $user_club_id";
							//dd($filter);
							break;
						case 'complexesportif':
							$complexe_salle_id = get_current_session_variable('user_complexe_salle_id');
							$filter = "  complexe_salle_id = $complexe_salle_id";
							break;
						default:
							break;
					}
					break;
				case 8:     // Accueil Centre
					switch ($module_name)
					{
						case 'reseauxsalles':
							$user_club_id = get_current_session_variable('user_club_id');
							$filter = "  club_id = $user_club_id";
							break;
						case 'complexesportif':
							$complexe_salle_id = get_current_session_variable('user_complexe_salle_id');
							$filter = "   complexe_salle_id = $complexe_salle_id";
							break;
						default:
							break;
					}
					break;
				case 5:     // Joueur
					break;
				default:
					dd("Role inconnu: $actual_role");
			}
			return $filter;
		}

	// Show menu depending on context recorded in session.
	// For each menu choice: show only if parent id is in session
	// Example:
	//  if "complexe sportif id" is in session:
	//      All menu choices of modules filtered by this parent id
	//      will be shown.
	//          Shown:
	//              Capteurs, Salles, joueurs
	//              Which have the their parent in context
	//          NOT shown:
	//              Partie (Parent is Salle)
	//              Inscription (Parent is Partie)
	static function show_menu($module_name)
	{
		$actual_role = \Session::get('gid');
		dd($module_name);
		return TRUE;
	}

	function get_current_session_variable($id)
	{
		$v = \Session::get($id, NULL);
		if (!is_null($v))
			return $v; else
			dd("Session variable '$id' not found");
	}
}
?>