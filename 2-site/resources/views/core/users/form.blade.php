@extends('layouts.app')
@section('content')
    <div class="page-content row">
        <div class="page-content-wrapper m-t">
            <div class="sbox animated fadeInRight">
                <div class="sbox-title">
                    <h4><i class="fa fa-table"></i> <?php echo $pageTitle;?>
                        <small>{{ $pageNote }}</small>
                    </h4>
                </div>
                <div class="sbox-content">
                    <ul class="parsley-error-list">
                        @foreach($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                    {!! Form::open(array('url'=>'core/users/save?return='.$return,
                                         'class'=>'form-horizontal',
                                         'files' => TRUE ,
                                         'parsley-validate'=>'',
                                         'novalidate'=>' ')) !!}
                    <div class="col-md-8">
                        <div class="form-group hidethis " style="display:none;">
                            <label for="Id" class=" control-label col-md-4 text-left"> Id </label>
                            <div class="col-md-8">
                                {!! Form::text('id',
                                               $row['id'],
                                               array('class'=>'form-control',
                                                     'placeholder'=>'',   )) !!}
                            </div>
                        </div>
                        <div class="form-group  ">
                            <label for="group_id"
                                   class=" control-label col-md-4 text-left">
                                Group / Level
                                <span class="asterix"> * </span>
                            </label>
                            <div class="col-md-8">
                                <select name='group_id'
                                        rows='5'
                                        id='group_id'
                                        code='{$group_id}'
                                        class='select2 ' required>
                                </select>
                            </div>
                        </div>
                        <!--
                            Réseau de complexes sportifs
                            ----------------------------
                        -->
                        <div class="form-group  ">
                            <label for="club_id"
                                   class=" control-label col-md-4 text-left">
                                Réseau de complexes sportifs
                            </label>
                            <div class="col-md-8">
                                <select name='club_id'
                                        rows='5'
                                        id='club_id'
                                        code='{$club_id}'
                                        class='select2'

                                >
                                </select>
                            </div>
                        </div>
                        <!--
                            Complexes sportifs
                            ------------------
                        -->
                        <div class="form-group  ">
                            <label for="complexe_salle_id"
                                   class=" control-label col-md-4 text-right">
                                Complexe sportif
                            </label>
                            <div class="col-md-8">
                                <select name='complexe_salle_id'
                                        rows='5'
                                        id='complexe_salle_id'
                                        code='{$complexe_salle_id}'
                                        class='select2'
                                >
                                </select>
                            </div>
                        </div>
                        <div class="form-group  ">
                            <label for="Username"
                                   class=" control-label col-md-4 text-left">
                                   Username <span class="asterix"> * </span>
                            </label>
                            <div class="col-md-8">
                                {!! Form::text('username',
                                               $row['username'],
                                               array('class'=>'form-control',
                                                     'placeholder'=>'',
                                                     'required'=>'true'  )) !!}
                            </div>
                        </div>
                        <div class="form-group  ">
                            <label for="First Name"
                                   class=" control-label col-md-4 text-left">
                                First Name <span class="asterix"> * </span>
                            </label>
                            <div class="col-md-8">
                                {!! Form::text('first_name',
                                                $row['first_name'],
                                                array('class'=>'form-control',
                                                      'placeholder'=>'',
                                                      'required'=>'true'  )) !!}
                            </div>
   
                        </div>
                        <div class="form-group  ">
                            <label for="Last Name"
                                   class=" control-label col-md-4 text-left">
                                Last Name
                            </label>
                            <div class="col-md-8">
                                {!! Form::text('last_name',
                                               $row['last_name'],
                                               array('class'=>'form-control',
                                                     'placeholder'=>'',   )) !!}
                            </div>
   
                        </div>
                        <div class="form-group  ">
                            <label for="Email"
                                   class=" control-label col-md-4 text-left">
                                        Email <span class="asterix"> * </span>
                            </label>
                            <div class="col-md-8">
                                {!! Form::text('email', $row['email'],array('class'=>'form-control', 'placeholder'=>'', 'required'=>'true', 'parsley-type'=>'email'   )) !!}
                            </div>
   
                        </div>
                        <div class="form-group  ">
                            <label for="Status" class=" control-label col-md-4 text-left"> Status <span class="asterix"> * </span></label>
                            <div class="col-md-8">
                                <label class='radio radio-inline'>
                                    <input type='radio' name='active' value='0' required @if($row['active'] == '0') checked="checked" @endif > Inactive </label>
                                <label class='radio radio-inline'>
                                    <input type='radio' name='active' value='1' required @if($row['active'] == '1') checked="checked" @endif > Active </label>
                            </div>
   
                        </div>
                        <div class="form-group  ">
                            <label for="Avatar" class=" control-label col-md-4 text-left"> Avatar </label>
                            <div class="col-md-8">
                                <input type='file' name='avatar' id='avatar' @if($row['avatar'] =='') class='required' @endif style='width:150px !important;'/>
                                <div>
                                    {!! SiteHelpers::showUploadedFile($row['avatar'],'/uploads/users/') !!}
                                </div>
                            </div>
   
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="form-group">
                            <label for="ipt" class=" control-label col-md-4 text-left"> </label>
                            <div class="col-md-8">
                                @if($row['id'] !='')
                                    {{ Lang::get('core.notepassword') }}
                                @else
                                    Create Password
                                @endif
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="ipt" class=" control-label col-md-4"> {{ Lang::get('core.newpassword') }} </label>
                            <div class="col-md-8">
                                <input name="password" type="password" id="password" class="form-control input-sm" value=""
                                       @if($row['id'] =='')
                                           required
                                       @endif
                                />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="ipt" class=" control-label col-md-4"> {{ Lang::get('core.conewpassword') }} </label>
                            <div class="col-md-8">
                                <input name="password_confirmation" type="password" id="password_confirmation" class="form-control input-sm" value=""
                                       @if($row['id'] =='')
                                       required
                                        @endif
                                />
                            </div>
                        </div>
                    </div>
                    <div style="clear:both"></div>
                    <div class="form-group">
                        <label class="col-sm-4 text-right">&nbsp;</label>
                        <div class="col-sm-8">
                            <button type="submit" name="apply" class="btn btn-info btn-sm"><i class="fa  fa-check-circle"></i> {{ Lang::get('core.sb_apply') }}</button>
                            <button type="submit" name="submit" class="btn btn-primary btn-sm"><i class="fa  fa-save "></i> {{ Lang::get('core.sb_save') }}</button>
                            <button type="button" onclick="location.href='{{ URL::to('core/users?return='.$return) }}' " class="btn btn-success btn-sm "><i
                                        class="fa  fa-arrow-circle-left "></i> {{ Lang::get('core.sb_cancel') }} </button>
                        </div>
                    </div>
                    {!! Form::close() !!}
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#complexe_salle_id").jCombo
            (
                    "{!! url( 'testcombo/comboselect?filter=fbs_complexe_salles:complexe_salle_id:nom')!!}&parent=club_id:",
                    {  parent: '#club_id', selected_value : '{{ $row["complexe_salle_id"] }}' }
            );

            $("#club_id").jCombo("{{ URL::to
                (
                    'core/users/comboselect?filter=fbs_reseaux_salles:club_id:nom') }}",
                    {selected_value: '{{ $row["club_id"] }}'}
            );

            $("#group_id").jCombo("{{ URL::to('core/users/comboselect?filter=tb_groups:group_id:name') }}",
                    {selected_value: '{{ $row["group_id"] }}'});

        });
    </script>
@stop