{!! Form::open(array('url'=>'capteur/savepublic',
                     'class'=>'form-horizontal',
                     'files' => true ,
                     'parsley-validate'=>'',
                     'novalidate'=>' ')) !!}

@if(Session::has('messagetext'))

    {!! Session::get('messagetext') !!}

@endif
<ul class="parsley-error-list">
    @foreach($errors->all() as $error)
    <li>{{ $error }}</li>
    @endforeach
</ul>


<div class="col-md-12">
						<fieldset><legend> Capteurs</legend>
				{!! Form::hidden('capteur_id', $row['capteur_id']) !!}					
									  <div class="form-group  " >
										<label for="Code" class=" control-label col-md-4 text-left"> Code </label>
										<div class="col-md-6">
										  {!! Form::text('code', $row['code'],array('class'=>'form-control', 'placeholder'=>'',   )) !!} 
										 </div> 
										 <div class="col-md-2">
										 	<a href="#" data-toggle="tooltip" placement="left" class="tips" title="Format A01, A02, A.., B01, B02"><i class="icon-question2"></i></a>
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Numéro Serie" class=" control-label col-md-4 text-left"> Numéro Serie <span class="asterix"> * </span></label>
										<div class="col-md-6">
										  {!! Form::text('numero_serie', $row['numero_serie'],array('class'=>'form-control', 'placeholder'=>'', 'required'=>'true'  )) !!} 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="UID" class=" control-label col-md-4 text-left"> UID </label>
										<div class="col-md-6">
										  {!! Form::text('UID', $row['UID'],array('class'=>'form-control', 'placeholder'=>'',   )) !!} 
										 </div> 
										 <div class="col-md-2">
										 	<a href="#" data-toggle="tooltip" placement="left" class="tips" title="Identifiant Bluethoot (UID) qui caractérise le capteur"><i class="icon-question2"></i></a>
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Date Achat" class=" control-label col-md-4 text-left"> Date Achat </label>
										<div class="col-md-6">
										  
				<div class="input-group m-b" style="width:150px !important;">
					{!! Form::text('date_achat', $row['date_achat'],array('class'=>'form-control date')) !!}
					<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
				</div> 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Complexe Salle" class=" control-label col-md-4 text-left"> Complexe Salle <span class="asterix"> * </span></label>
										<div class="col-md-6">
										  <select name='complexe_salle_id' rows='5' id='complexe_salle_id' class='select2 ' required  ></select> 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> </fieldset>
			</div>
			
			

<div style="clear:both"></div>


<div class="form-group">
    <label class="col-sm-4 text-right">&nbsp;</label>
    <div class="col-sm-8">
        <button type="submit" name="apply" class="btn btn-info btn-sm"><i
                    class="fa  fa-check-circle"></i> {{ Lang::get('core.sb_apply') }}
        </button>
        <button type="submit" name="submit" class="btn btn-primary btn-sm"><i
                    class="fa  fa-save "></i> {{ Lang::get('core.sb_save') }}
        </button>
    </div>

</div>

{!! Form::close() !!}

<script type="text/javascript">
    $(document).ready(function () {
        
        
		$("#complexe_salle_id").jCombo("{!! url('capteur/comboselect?filter=fbs_complexe_salles:complexe_salle_id:nom|ville') !!}",
		{  selected_value : '{{ $row["complexe_salle_id"] }}' });
		

        $('.removeCurrentFiles').on('click', function () {
            var removeUrl = $(this).attr('href');
            $.get(removeUrl, function (response){});
            $(this).parent('div').empty();
            return false;
        });

    });
</script>
