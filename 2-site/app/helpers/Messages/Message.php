<?php
	/**
	 * Created by PhpStorm.
	 * User: bernard
	 * Date: 28/11/2016
	 * Time: 18:29
	 */
	namespace Messages;
	class Message
	{
		public $type_emetteur;      // Type émetteur
		public $type_message;       // Type message
		public $identifiant_unique; // Identifiant unique

		// Liste de paramètres spécifié dans les sous classes
	}

	class Start extends Message
	{

	}

	class EventShoot extends Message
	{

	}

	class EventPass extends Message
	{

	}

	class EventControl extends Message
	{

	}

