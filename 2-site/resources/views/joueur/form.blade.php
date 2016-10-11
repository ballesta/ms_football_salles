@extends('layouts.app')

@section('content')

    <div class="page-content row">
        <!-- Page header -->
        <div class="page-content-wrapper m-t">
            <div class="sbox">
                <div class="sbox-title">
                    <h3> {{ $pageTitle }}
                        <small>{{ $pageNote }}</small>
                    </h3>
                    <div class="sbox-tools">
                        <a href="{{ url($pageModule.'?return='.$return) }}" class="btn btn-xs btn-white tips"
                           title="{{ Lang::get('core.btn_back') }}"><i
                                    class="icon-backward"></i> {{ Lang::get('core.btn_back') }} </a>
                    </div>
                </div>
                <div class="sbox-content">

                    <ul class="parsley-error-list">
                        @foreach($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>

                    {!! Form::open(array('url'=>'joueur/save?return='.$return,
                                         'class'=>'form-horizontal',
                                         'files' => TRUE ,
                                         'parsley-validate'=>'','novalidate'=>' ')) !!}
                    <div class="col-md-12">
                        <fieldset>
                            <legend> Joueurs</legend>
                            {!! Form::hidden('joueur_id', $row['joueur_id']) !!}
                            <div class="form-group  ">
                                <label for="Nom" class=" control-label col-md-4 text-left"> Nom </label>
                                <div class="col-md-6">
                                    {!! Form::text('nom', $row['nom'],array('class'=>'form-control', 'placeholder'=>'',   )) !!}
                                </div>
                                <div class="col-md-2">

                                </div>
                            </div>
                            <div class="form-group  ">
                                <label for="Prénom" class=" control-label col-md-4 text-left"> Prénom </label>
                                <div class="col-md-6">
                                    {!! Form::text('premon', $row['premon'],array('class'=>'form-control', 'placeholder'=>'',   )) !!}
                                </div>
                                <div class="col-md-2">

                                </div>
                            </div>
                            <div class="form-group  ">
                                <label for="Complexe Salle Id" class=" control-label col-md-4 text-left"> Complexe Salle
                                    Id </label>
                                <div class="col-md-6">
                                    <select name='complexe_salle_id' rows='5' id='complexe_salle_id'
                                            class='select2 '></select>
                                </div>
                                <div class="col-md-2">

                                </div>
                            </div>
                            <div class="form-group  ">
                                <label for="Equipe Id" class=" control-label col-md-4 text-left"> Equipe Id </label>
                                <div class="col-md-6">
                                    <select name='equipe_id' rows='5'
                                            id='equipe_id' class='select2 '></select>
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
                            <button type="submit" name="apply" class="btn btn-info btn-sm"><i
                                        class="icon-checkmark-circle2"></i> {{ Lang::get('core.sb_apply') }}</button>
                            <button type="submit" name="submit" class="btn btn-primary btn-sm"><i
                                        class="icon-bubble-check"></i> {{ Lang::get('core.sb_save') }}</button>
                            <button type="button" onclick="location.href='{{ URL::to('joueur?return='.$return) }}' "
                                    class="btn btn-warning btn-sm "><i
                                        class="icon-cancel-circle2 "></i> {{ Lang::get('core.sb_cancel') }} </button>
                        </div>

                    </div>

                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {


            $("#complexe_salle_id").jCombo("{!! url('joueur/comboselect?filter=fbs_complexe_salles:complexe_salle_id:nom|ville') !!}",
                    {selected_value: '{{ $row["complexe_salle_id"] }}'});

            $("#equipe_id").jCombo("{!! url('joueur/comboselect?filter=fb_equipes:equipe_id:nom') !!}",
                    {selected_value: '{{ $row["equipe_id"] }}'});


            $('.removeMultiFiles').on('click', function () {
                var removeUrl = '{{ url("joueur/removefiles?file=")}}' + $(this).attr('url');
                $(this).parent().remove();
                $.get(removeUrl, function (response) {
                });
                $(this).parent('div').empty();
                return false;
            });

        });
    </script>
@stop