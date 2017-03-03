<?php namespace App\Http\Controllers\front\tunisie;

use App\Http\Controllers\controller;
use Illuminate\Http\Request;
use App\Http\Requests;

class StatsController extends Controller
{

    public function get_stats_player()
    {
        $statistiques_joueur = new StatistiquesJoueur();
        $stats = $statistiques_joueur->stats_player();
        return view('front.statistiques.tunisie.player.stats',compact('stats'));
    }
}