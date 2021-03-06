<?php

	namespace App\Http\Controllers;

	use Illuminate\Http\Request;
	use DB;
	use Exception;
	use App\Http\Requests;
	use App\Http\Controllers\Controller;

	class SessionMesuresAPIController extends Controller
	{
		/**
		 * Display a listing of the resource.
		 *
		 * @return Response
		 */
		public function index()
		{
			//
		}

		/**
		 * Show the form for creating a new resource.
		 *
		 * @return Response
		 */
		public function create()
		{
			//
		}

		/**
		 * Store a newly created resource in storage.
		 *
		 * @return Response
		 */
		// Récupère et enregistre la mesure transmise par l'api
		//
		public function store(Request $request)
		{
			//
			//return "Store a newly created resource in storage.";
			try
			{
				// Récupère la mesure en json
				$mesure_json = $request->getContent();
				// Transforme du contenu json en tableau
				$mesure = json_decode($mesure_json, true);
				// Associe la mesure à sa session de mesure, (capteur + joueurs + partie courante)
				// todo : renvoie null
				$session_mesure_id = $this->associe_mesure_a_joueur($mesure);
				// verifie les numeros de sequence de la borne
				//var_dump($mesure); die();
				$chronoBorne = $mesure['chronoBorne'];
				if ($request->session()->has('chronoBorne')) {
					// Chrono en session: vérifier séquence
					$chronoBornePrecedente = $request->session()->get('chronoBorne');
					if (($chronoBornePrecedente+1) != $chronoBorne )
					{
						// Rupture de séquence
						$mesure_json = '>>>>' . $mesure_json;
					}
				}
				$request->session()->put('chronoBorne',$chronoBorne);
				$mesure_brute_id = $this->enregistre_mesure_brute($mesure_json, $session_mesure_id);
				//$this->enregistre_mesure($mesure, $mesure_brute_id);
				$request->session()->save();
			}
			catch (Exception $e)
			{
				$m = $e->getMessage();
				return response()->json(['error'   => true,
				                         'message' =>$m]);
			}
			return response()->json(['success' => true,
			                         'message' => "Mesure OK"]);
		}

		function associe_mesure_a_joueur($mesure)
		{
			/*  NOK
			 * -----
			// 1: Détermine le capteur_id à partir du N° de série du capteur
			$numero_serie_capteur   = $mesure['sensor']['EventShoot']['UID'  ];
			$capteurs = DB::table('fb_capteurs')
				->where('numero_serie', '=', $numero_serie_capteur)
				->get();
			if (count($capteurs) == 1)
			{
				$capteur_id = $capteurs[0]->capteur_id;
			}
			else
			{
				throw new Exception("02:N° Capteur non trouvé ($numero_serie_capteur)");
			}

			// 2: Détermine la session de mesure )à affecter à la mesure
			// à partir du capteur_id
			$sessions_mesures = DB::table('fb_sessions_mesures')
				->select('fb_sessions_mesures.*')
				// Joueurs sélectionnés dans les parties en cours
				->join('fb_parties',
					'fb_partie.partie_id',
					'=',
					'fb_joueurs_selectionnes.partie_id')
				// Sessions de mesures
				->join('fb_sessions_mesures',
					'fb_joueurs_selectionnes.joueur_selectionne_id',
					'=',
					'fb_sessions_mesures.joueur_selectionne_id')
				// Capteur utilisé dans la session
				->where('fb_sessions_mesures.capteur_id', '=', $capteur_id)
				// Parties en cours (heure entre le debut et la fin de la partie)
				->where(DB::raw('TIME_TO_SEC(NOW()) >= TIME_TO_SEC(fb_partie.debut)'))
				->where(DB::raw('TIME_TO_SEC(NOW()) <= TIME_TO_SEC(fb_partie.fin)'))
				->get();
			if (count($sessions_mesures) == 1)
			{
				$session_mesures_id = $sessions_mesures[0]->session_mesure_id;
			}
			else
			{
				throw new Exception("03: N° Capteur non associé à un joueur '
								   .    "($numero_serie_capteur)");
			}
			*/

			/*  -------------------------
			 *  Fonctionne.
			 *  SQL testé dans phpMyAdmin
			 *  -------------------------
				-- Les 3 tables liées
				select fb_joueurs_selectionnes.*
				-- Table à laquelle nous devons associer la mesure reçue
				from `fb_sessions_mesures`
				-- Une session_mesure appartient à un joueur_selectionne dans un partie
				inner join `fb_joueurs_selectionnes`
				on `fb_sessions_mesures`.`joueur_selectionne_id`
					=
					`fb_joueurs_selectionnes`.`joueur_selectionne_id`
				-- Un joueur selectionne appartient à une partie
				inner join `fb_partie`
				on `fb_partie`.`partie_id` = `fb_joueurs_selectionnes`.`partie_id`
				-- Le joueur selectionne doit avoir le N° de capteur de la mesure reçue
				where fb_joueurs_selectionnes.capteur_id = 1
				-- La partie doit être en cours
				and TIME_TO_SEC(NOW()) >= TIME_TO_SEC(fb_partie.debut)
				and TIME_TO_SEC(NOW()) <= TIME_TO_SEC(fb_partie.fin)
			*/


			$session_mesures_id = NULL;
			return $session_mesures_id;
		}

		function enregistre_mesure_brute($mesure_json, $session_mesure_id)
		{
			// Enregistre la mesure brute
			$id = DB::table('fb_mesures')->insertGetId(
				[
					'message_json'      => $mesure_json,
					'session_mesure_id' => $session_mesure_id,
				]
			);
			return $id;
		}

		// Enregistre la mesure dans sa table propre
		function enregistre_mesure($mesure, $mesure_brute_id)
		{
			// todo : activer
			// Teste le type de la mesure et enregistre dans sa table propre
			if (isset($mesure['sensor']['EventShoot']))
			{
				$uid   = $mesure['sensor']['EventShoot']['UID'  ];
				$id    = $mesure['sensor']['EventShoot']['id'   ];
				$speed = $mesure['sensor']['EventShoot']['speed'];

				// Enregistre la mesure brute
				$id_mesure_shoot = DB::table('fb_mesure_eventshoot')->insertGetId(
					[
						'mesure_id'  => $mesure_brute_id,
						'uid'        => $uid            ,
						'id'         => $id             ,
						'speed'      => $speed
					]
				);
				return $id_mesure_shoot;
			}
			else
			{
				throw new Exception('01:Type de message non reconnu');
			}
		}





		/**
		 * Display the specified resource.
		 *
		 * @param  int  $id
		 * @return Response
		 */
		public function show($id)
		{
			//
		}

		/**
		 * Show the form for editing the specified resource.
		 *
		 * @param  int  $id
		 * @return Response
		 */
		public function edit($id)
		{
			//
		}

		/**
		 * Update the specified resource in storage.
		 *
		 * @param  int  $id
		 * @return Response
		 */
		public function update($id)
		{
			//
		}

		/**
		 * Remove the specified resource from storage.
		 *
		 * @param  int  $id
		 * @return Response
		 */
		public function destroy($id)
		{
			//
		}
	}
