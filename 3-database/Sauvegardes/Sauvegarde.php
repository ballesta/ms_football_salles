<?php

	/**
	 * Created by PhpStorm.
	 * User: bernard
	 * Date: 24/10/2016
	 * Time: 23:33
	 */
	class Sauvegarde
	{
		static function Sauve_base($utilisateur, $mdp, $nom_base)
		{
			$chemin = "H:\wamp-3-32\bin\mysql\mysql5.7.11\bin";
			$commande = "$chemin\mysqldump --user=$utilisateur "
					   ."          --password= $mdp "
					   ."          --host=localhost "
					   ."          $nom_base "
				       ."          > $nom_base.sql"
			;
			echo $commande, '<br>';
			// Sauvegarde Base
			$r = exec($commande);
			// Lis contenu sauvegarde
			$contenu = file_get_contents ("$nom_base.sql");
			// Transforme sauvegarde
			$contenu_substitue = str_replace ("\'", "''", $contenu);
			// Reecris le contenu normalisé
			file_put_contents ("$nom_base.sql", $contenu_substitue);
			echo "Resultat: $r";
		}
	}

	echo "<h1>Sauvegarde base</h1>";
	Sauvegarde::Sauve_base('root','','football_v00_salles');
	echo "<h1>Fin Sauvegarde base</h1>";

?>