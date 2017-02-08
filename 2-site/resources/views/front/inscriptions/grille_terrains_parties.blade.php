@extends('layouts.app')
@section('header')
    <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }
        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        tr:nth-child(even) {
            background-color: #dddddd;
        }
    </style>
@endsection

@section('content')
    <h1>Inscription des joueurs et remise des capteurs</h1>
    <h2>Sélectionner le terrain et l'heure de début de la partie</h2>

    <table>

        <tr>
            <th></th>
            <th  colspan=12>
                Heure de début de la parties (chaque 30 minutes)
            </th>
        </tr>";
        <tr>
            <th>Terrains</th>
            @for ( $h = $grille->heure_debut; $h <= $grille->heure_fin; $h++)
                <th>{{$h}}</th>
            @endfor
        </tr>

        @foreach ($grille->salles as $salle)
           <tr>
               <td>Salle {{ $salle->identifiant }}<br>&nbsp;</td>

               @for ( $h = $grille->heure_debut; $h <= $grille->heure_fin; $h++)
                   <td>
                       <a href="/front/inscriptions?terrain_id={{$salle->salle_id}}&heure={{$h}}&minute=0"
                          target="_blank">
                       {{'00'}}
                       </a>
                       <br>
                       <a href="/front/inscriptions?terrain_id={{$salle->salle_id}}&heure={{$h}}&minute=30"
                          target="_blank">
                       {{'30'}}<br>
                       </a>

                   </td>
               @endfor

           </tr>
        @endforeach
    </table>

@endsection