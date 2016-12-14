<?php

	//add_EventShoots(10);

	function add_EventShoots($n)
	{
		// Start now: time in seconds since Unix creation
		$time = time();
		// Sensor id
		$uid = "111111";
		// Start at 10 km/h
		$speed = 10;
		// Generate 10 mesures
		for ($id = 1; $id <= $n; $id++) {
			// Change speed
			$speed++;
			// Add 5 minutes to time
			$time += 5 * 60;
			$formated_time = date("Y-m-d H:i:s", $time);
			EventShoot($formated_time, $uid, $id, $speed);
		}
	}

	function EventShoot($time, $uid, $id, $speed)
	{
		echo "$time, $uid, $id, $speed <br>";
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
		$mesure->bluetooth = $uid;
		$mesure->message_json = $Event;
		$mesure->save();
	}

?>