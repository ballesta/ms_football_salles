@extends('layouts.app')
@section('content')
    <h1>
        Inscriptions et remise des capteurs.
    </h1>
    <h2>
        Salle: <strong>{{ $inscriptions_partie->partie->salle_nom }}</strong>
        &nbsp;&nbsp;&nbsp;&nbsp;
        Heure début: <strong>{{ $inscriptions_partie->partie->hh_mm }}</strong>
        &nbsp;&nbsp;&nbsp;&nbsp;
        Durée: <strong>{{ $inscriptions_partie->partie->duree }} </strong> minutes
    </h2>
    <br>
    <br>
    <br>
    <h2>++++ Intégrer smart form ++++</h2>

@endsection