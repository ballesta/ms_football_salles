<?php
    /**
     * Created by PhpStorm.
     * User: bernard
     * Date: 21/10/2016
     * Time: 12:10
     */

@extends('layouts.app')

@section('content')

    <div class="page-content row">
        <!-- Page header -->
        <div class="page-content-wrapper m-t">
            <div class="sbox">
                <div class="sbox-title">
                    <div class="sbox-tools pull-left" >
                        <a href="{{ url($pageModule.'?return='.$return) }}"
                           class="tips"
                           title="{{ Lang::get('core.btn_back') }}" >
                            <i class="fa  fa-arrow-left">
                            </i>
                        </a>
                    </div>
                    <div class="sbox-tools " >
                        @if(Session::get('gid') ==1)
                            <a href="{{ URL::to('sximo/module/config/'.$pageModule) }}"
                               class="tips"
                               title=" {{ Lang::get('core.btn_config') }}" >
                                <i class="fa  fa-ellipsis-v">
                                </i>
                            </a>
                        @endif
                    </div>
                </div>

                <!-- Création nouveau joueur -->
                <div class="sbox-content">
                    <ul class="parsley-error-list">
                        @foreach($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>

                    {!! Form::open(array('url'=>'joueur/save?return='.$return,
                                         'class'=>'form-horizontal',
                                         'files' => true ,
                                         'parsley-validate'=>'',
                                         'novalidate'=>' ')) !!}
                    <div class="col-md-12">
                        <fieldset><legend>Nouveau Joueur</legend>
                            {!! Form::hidden('joueur_id',
                                      $row['joueur_id']) !!}
                            <div class="form-group  " >
                                <label for="Nom" class=" control-label col-md-4 text-left"> Nom joueur </label>
                                <div class="col-md-6">
                                    {!! Form::text('nom', $row['nom'],array('class'=>'form-control', 'placeholder'=>'',   )) !!}
                                </div>
                                <div class="col-md-2">
                                </div>
                            </div>
                            <div class="form-group  " >
                                <label for="Prénom" class=" control-label col-md-4 text-left"> Prénom joueur </label>
                                <div class="col-md-6">
                                    {!! Form::text('premon',
                                                   $row['premon'],
                                                   array('class'=>'form-control',
                                                         'placeholder'=>'prénom du nouveau joueur',   )) !!}
                                </div>
                                <div class="col-md-2">
                                </div>
                            </div>

                            <!-- Initialiser avec session -->
                            <div class="form-group  " >
                                <label for="Complexe Salle" class=" control-label col-md-4 text-left">
                                    Complexe Salle
                                </label>
                                <div class="col-md-6">
                                    <select name='complexe_salle_id'
                                            rows='5'
                                            id='complexe_salle_id'
                                            class='select2 '   >

                                    </select>
                                </div>
                                <div class="col-md-2">
                                </div>
                            </div>

                            <!-- null -->
                            <div class="form-group  " >
                                <label for="Equipe" class=" control-label col-md-4 text-left"> Equipe </label>
                                <div class="col-md-6">
                                    <select name='equipe_id' rows='5' id='equipe_id' class='select2 '   ></select>
                                </div>
                                <div class="col-md-2">
                                </div>
                            </div>
                        </fieldset>
                    </div>

                    <div style="clear:both"></div>

                    <div class="form-group">
                        <label class="col-sm-4 text-right">&nbsp;</label>
                        <div class="col-sm-8">
                            <button type="submit"
                                    name="apply"
                                    class="btn btn-info btn-sm" >
                                <i class="icon-checkmark-circle2"></i>
                                Créer nouveau joueur
                            </button>
                        </div>
                    </div>
                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function() {
            // Sélection Salle (terrain)
            $("#complexe_salle_id").jCombo(
                    "{!! url('joueur/comboselect?filter=fbs_complexe_salles:complexe_salle_id:nom|ville') !!}",
                    {  selected_value : '{{ $row["complexe_salle_id"] }}' });

            // Equipe
            $("#equipe_id").jCombo(
                    "{!! url('joueur/comboselect?filter=fb_equipes:equipe_id:nom') !!}",
                    {  selected_value : '{{ $row["equipe_id"] }}' });

            // Suppression?
            $('.removeMultiFiles').on('click',function(){
                var removeUrl = '{{ url("joueur/removefiles?file=")}}'+$(this).attr('url');
                $(this).parent().remove();
                $.get(removeUrl,function(response){});
                $(this).parent('div').empty();
                return false;
            });

        });
    </script>
@stop