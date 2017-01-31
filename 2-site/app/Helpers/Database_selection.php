<?php
	/**
	 * Created by BB.
	 * User: bernard
	 * Date: 01/01/2017
	 * Time: 18:21
	 */
	namespace App\Helpers;
	class Database_selection
	{
		// Sélectionne la base de données en fonction
		// du serveur (local ou production).
		Static function init()
		{
			$s = $_SERVER['SERVER_NAME'];
			if ($s == 'ms-football-salles-public')
			{
				$bd =
					array (
						'driver' => 'mysql',
						'host' => 'localhost',
						'database' => 'football_v00_salles',
						'username' => 'root',
						'password' => '',
						'charset' => 'utf8',
						'collation' => 'utf8_unicode_ci',
						'prefix' => '',
						'strict' => false,
					);
			}
			else
				$bd =
					array (
						'driver'    => 'mysql',
						'host'      => 'db652315212.db.1and1.com',
						'database'  => 'db652315212',
						'username'  => 'dbo652315212',
						'password'  => 'y4FG23SaSUZ0uANU',
						'charset'   => 'utf8',
						'collation' => 'utf8_unicode_ci',
						'prefix'    => '',
						'strict'    => false,
					);
			return $bd;
		}
	}