@extends('layouts.app')

@section('content')
    <div class="page-content row">
        <!-- Page header -->
        <div class="page-content-wrapper m-t">
            <div class="sbox">
                <div class="sbox-title">
                    <div class="sbox-tools pull-left">
                        <a href="{{ url($pageModule.'?return='.$return) }}" class="tips" title="{{ Lang::get('core.btn_back') }}"><i class="fa  fa-arrow-left"></i></a>
                    </div>
                    <div class="sbox-tools ">
                        @if(Session::get('gid') ==1)
                            <a href="{{ URL::to('sximo/module/config/'.$pageModule) }}" class="tips" title=" {{ Lang::get('core.btn_config') }}"><i class="fa  fa-ellipsis-v"></i></a>
                        @endif
                    </div>

                </div>
                <div class="sbox-content">

                    <ul class="parsley-error-list">
                        @foreach($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>

                    {!! Form::open(array('url'=>'statistiques/save?return='.$return, 'class'=>'form-horizontal','files' => TRUE , 'parsley-validate'=>'','novalidate'=>' ')) !!}
                    <div class="col-md-12">
                        <fieldset>
                            <legend> <h2>Bienvenue dans le module de Statistiques</h2></legend>
                            {!! Form::hidden('statistique_id', $row['statistique_id']) !!}
                            <div class="form-group  ">
                                <label for="Date et Heure Partie" class=" control-label col-md-4 text-left"> Choisissez le jour et l'heure du match <span class="asterix"> * </span></label>
                                <div class="col-md-6">
                                    <div class="input-group m-b" style="width:150px !important;">
                                        {!! Form::text('date',
                                                       $row['date'],
                                                       array('class'=>'form-control datetime',
                                                             'style'=>'width:150px !important;'))
                                        !!}
                                        <span class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </span>
                                    </div>

                                </div>
                                <div class="col-md-2">
                                </div>
                            </div>
                            <div class="form-group  ">
                                    <label for="Joueur"
                                           class=" control-label col-md-4 text-left">
                                        Sélectionnez le joueur
                                        <span class="asterix"> * </span>
                                    </label>
                                <div class="col-md-6">
                                    <h2>
                                    <select name='joueur_id'
                                            rows='5'
                                            id='joueur_id'
                                            class='select2 '
                                            required>

                                    </select>
                                    </h2>
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
                            &nbsp;
                            <button type="submit"
                                    name="submit"
                                    class="btn btn-primary btn-sm">
                                <h3>
                                    <i class="icon-stats-up">&nbsp;</i>
                                    Voir les statistiques pour ce joueur
                                <h3>
                            </button>
                        </div>
                    </div>
                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#joueur_id").jCombo("{!! url('statistiques/comboselect?filter=fb_joueurs:joueur_id:premon|nom') !!}",
                    {selected_value: '{{ $row["joueur_id"] }}'});
            $('.removeMultiFiles').on('click', function () {
                var removeUrl = '{{ url("statistiques/removefiles?file=")}}' + $(this).attr('url');
                $(this).parent().remove();
                $.get(removeUrl, function (response) {
                });
                $(this).parent('div').empty();
                return false;
            });
        });
    </script>
@stop