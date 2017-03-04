<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\Mesure;

use Illuminate\Support\Facades\DB;
class GenereMesuresController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        //return "Mesures";
    }


    // Appelé par la route:
	// 	    Route::get('genere/mesures',
	//                 GenereMesuresController@addMesures' );
	//                                         ----------
	public function addMesures()
	{
		// Supprime l'ensemble des mesures
		// avant de générer le nouveau jeux d'essais
		//DB::table('fb_mesures')->truncate();
		$duree_partie =30; // minutes
		//$this->add_EventShoots($duree_partie, 60);
		$this->add_Mesures($duree_partie, 5);

		return "Mesures Générées: $n eventShoot  (chaque $interval minutes)<br>"
		     . "Mesures Générées: $n mesures (chaque $interval minutes)<br>  ";
	}

	// Add EventShoots
	function add_EventShoots($n, $interval)
	{
		// Start now: time in seconds since Unix creation
		$time = time();
		// Sensor id
		$uid = "54:4a:16:56:46:1a";
		// Start at 10 km/h
		$speed = 10;
		// Generate mesures
		$begin_at= time();
		for ($id = 1; $id <= $n; $id++) {
			// Change speed
			$speed++;
			// Add $interval minutes to time
			$time += $interval * 60;
			$formated_time = date("Y-m-d H:i:s", $time);
			$this->generateEventShoot($formated_time, $uid, $id, $speed);
		}
		$end_at = time();
		echo $end_at - $begin_at
	}

	function generateEventShoot($time, $uid, $id, $speed)
	{
		//echo "$time, $uid, $id, $speed <br>";
		$Event = <<<END
		{
		  "sensor": {
		  "EventShoot": {
		    "param": [
		      {
		        "UID": "$uid",
		        "id": "$id",
		        "speed": "$speed"
		      }
		    ]
		  }
		  }
		}
END;
		// Crée la mesure
		$mesure = new Mesure;
		$mesure->Horodatage = $time;
		$mesure->message_json = $Event;
		$mesure->save();
	}

	// Add Mesures
	function add_Mesures($game_duration_minutes, $interval_seconds)
	{
		// Start now: time in seconds since Unix creation
		$time = time();
		// Sensor id
		$IEEE = "54:4a:16:56:46:1a";
		$ChronoBorne = 0;
		$ChronoSensor = 0;
		$Dist = 0;
		$Average = 1;
		$Max = 0;
		$Step = 0;
		$Sprint = 0;
		$Mobility = 0;
		$Shoot = 0;
		$Passes = 0;
		$Control = 0;
		$top_average = 40;
		$n = ($game_duration_minutes * 60) / $interval_seconds;
		// Generate mesures
		for ($id = 1; $id <= $n; $id++) 
		{
			// Add $interval minutes to time
			$time += $interval_seconds;
			$formated_time = date("Y-m-d ", $time). '12:00:00';
			$Shoot++;
			$Passes++;
			$Step++;
			$Dist++;
			$Control++;
			$Mobility++;
			$Max++;
			$Average = $Average * 2;
			if($Average > $top_average--)
				$Average = $top_average-- / 4;
			$Sprint++;
			$this->generateMesure(  $formated_time,
									$ChronoBorne,
									$ChronoSensor,
									$IEEE,
									$Shoot,
									$Passes,
									$Step,
									$Dist,
									$Control,
									$Mobility,
									$Max,
									$Average,
									$Sprint);
		}
	}

	function generateMesure($time,
							$ChronoBorne,
							$ChronoSensor,
							$IEEE,
							$Shoot,
							$Passes,
							$Step,
							$Dist,
							$Control,
							$Mobility,
							$Max,
							$Average,
							$Sprint)
	{
		//echo "$time, $uid, $id, $speed <br>";
		/*
		 * Extrait des mesures réalisées en février à BSA avec Mathieux
		 * {
		 *  "chronoBorne": "1" ,
		 *  "chronoSensor": "1" ,
		 *  "IEEE": "54:4a:16:56:46:1a",
		 *  "mesures":
		 *      {
		 *          "Shoot": "0",
		 *          "Passes": "0",
		 *          "Step": "0",
		 *          "Dist": "0",
		 *          "Control": "0",
		 *          "Mobility": "0",
		 *          "Max": "0",
		 *          "Average": "0",
		 *          "Sprint": "0"
		 *       }
		 *  }
		 * */

		$message = <<<END
		  {
		    "chronoBorne" : "$ChronoBorne" ,
			"chronoSensor": "$ChronoSensor" ,
		    "IEEE": "$IEEE",
		    "mesures": 
		        {
		            "Shoot"     : "$Shoot",
		            "Passes"    : "$Passes",
		            "Step"      : "$Step",
		            "Dist"      : "$Dist",
		            "Control"   : "$Control"
		            "Mobility"  : "$Mobility",
		            "Max"       : "$Max",
		            "Average"   : "$Average",
		            "Sprint"    : "$Sprint",
		        }
		  }
END;
		// Crée la mesure
		$mesure = new Mesure;
		$mesure->Horodatage = $time;
		$mesure->message_json = $message;
		$mesure->save();
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
    public function store()
    {
        //
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
