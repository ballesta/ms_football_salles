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
		$n=10;
		$interval = 5; // Minutes
		$this->add_EventShoots($n, $interval);
		$this->add_Mesures($n, $interval);

		return "Mesures Générées: $n eventShoot  (chaque $interval minutes)<br>"
		     . "Mesures Générées: $n mesures (chaque $interval minutes)<br>  ";
	}

	// Add EventShoots
	function add_EventShoots($n, $interval)
	{
		// Start now: time in seconds since Unix creation
		$time = time();
		// Sensor id
		$uid = "111111";
		// Start at 10 km/h
		$speed = 10;
		// Generate 10 mesures
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
	function add_Mesures($n, $interval)
	{
		// Start now: time in seconds since Unix creation
		$time = time();
		// Sensor id
		$uid = "111111";
		$Dist = 0;
		$Average = 1;
		$Max = 0;
		$Step = 0;
		$Sprint = 0;
		$Mobility = 0;
		$Shoot = 0;
		$Pass = 0;
		$Control = 0;

		$top_average = 40;
		// Generate mesures
		for ($id = 1; $id <= $n; $id++) 
		{
			// Add $interval minutes to time
			$time += $interval * 60;
			$formated_time = date("Y-m-d H:i:s", $time);
			$Dist++;
			$Average = $Average * 2;
			if($Average > $top_average--)
				$Average = $top_average-- / 4;
			$Max++;
			$Step++;
			$Sprint++;
			$Mobility++;
			$Shoot++;
			$Pass++;
			$Control++;
			$this->generateMesure(  $formated_time, 
				                    $uid,
									$Dist,
									$Average,
									$Max,
									$Step,
									$Sprint,
									$Mobility,
									$Shoot,
									$Pass,
									$Control);
		}
	}

	function generateMesure($time, 
							$uid,
							$Dist,
							$Average,
							$Max,
							$Step,
							$Sprint,
							$Mobility,
							$Shoot,
							$Pass,
							$Control)
	{
		//echo "$time, $uid, $id, $speed <br>";
		$Event = <<<END
		{
		  "sensor": {
		  "Mesure": {
		    "param": [
		      {
		        "UID"       : "$uid",
		        "Dist"      : "$Dist",
		        "Average"   : "$Average",
		        "Max"       : "$Max",
		        "Step"      : "$Step",
		        "Sprint"    : "$Sprint",
		        "Mobility"  : "$Mobility",
		        "Shoot"     : "$Shoot",
		        "Pass"      : "$Pass",
		        "Control"   : "$Control"
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
