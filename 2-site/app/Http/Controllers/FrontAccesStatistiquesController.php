<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;

class FrontAccesStatistiquesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
	    return '<h1>Statistiques des parties</h1>
                <a href=javascript:history.go(-1)>
					<h2>
						Retour au site BSA
					</h2>
				</a>';
    }
}
