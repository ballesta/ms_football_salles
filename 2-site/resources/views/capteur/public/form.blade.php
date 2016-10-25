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
										<label for="Numéro Serie" class=" control-label col-md-4 text-left"> Numéro Serie </label>
										<div class="col-md-6">
										  {!! Form::text('numero_serie', $row['numero_serie'],array('class'=>'form-control', 'placeholder'=>'',   )) !!} 
										 </div> 
										 <div class="col-md-2">
										 	
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
										<label for="Complexe sportif" class=" control-label col-md-4 text-left"> Complexe sportif </label>
										<div class="col-md-6">
										  <select name='club_id' rows='5' id='club_id' class='select2 '   ></select> 
										 </div> 
										 <div class="col-md-2">
										 	<a href="#" data-toggle="tooltip" placement="left" class="tips" title="Complexe sportif mettant ce captuer à disposition des joueurs"><i class="icon-question2"></i></a>
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Malette Capteurs" class=" control-label col-md-4 text-left"> Malette Capteurs </label>
										<div class="col-md-6">
										  <select name='malette_capteurs_id' rows='5' id='malette_capteurs_id' class='select2 '   ></select> 
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
        
        
		$("#club_id").jCombo("{!! url('capteur/comboselect?filter=fbs_complexe_salles:complexe_salle_id:nom|ville') !!}",
		{  selected_value : '{{ $row["club_id"] }}' });
		
		$("#malette_capteurs_id").jCombo("{!! url('capteur/comboselect?filter=fb_malette_capteurs:malette_capteurs_id:identifiant') !!}",
		{  selected_value : '{{ $row["malette_capteurs_id"] }}' });
		

        $('.removeCurrentFiles').on('click', function () {
            var removeUrl = $(this).attr('href');
            $.get(removeUrl, function (response){});
            $(this).parent('div').empty();
            return false;
        });

    });
</script>
