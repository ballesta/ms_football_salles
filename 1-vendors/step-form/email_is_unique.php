<?php
	/**
	 * Vérifie que le mail n'est pas utilisé par un joueur déjà inscrit
	 *
	 * Created by PhpStorm.
	 * User: bernard
	 * Date: 30/11/2016
	 * Time: 21:38
	 */
	// Succes
	$email = trim($_POST['email']);
	// ++++ Vérifier email dans table fb_joueurs ++++
	if ($email == 'bernard@ballesta.fr')
		echo http_response_code(200); // ok
	else
		echo http_response_code(404); // Error
