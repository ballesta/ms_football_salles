@extends('master')

@section('content')
    <div class="row">
        <col-md-12>
            <div class="col-md-4 form-group">

            </div>
            <div class="clearfix"></div>

            <div class="col-md-4 form-group">

            </div>
            <div class="clearfix"></div>

            <div class="form-group col-md-2">
                <a href="{{route('player.stats')}}">
                    <button class="btn btn-info">View statistique joueur</button>
                </a>
                <br><br>
                <a href="{{route('equipe.stats')}}">
                    <button class="btn btn-info">View statistique equipe</button>
                </a>
            </div>
        </col-md-12>
    </div>
@stop