{!! Form::open(array('url'=>'inscription/savepublic',
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
						<fieldset><legend> Inscription</legend>
				{!! Form::hidden('inscription_id', $row['inscription_id']) !!}					
									  <div class="form-group  " >
										<label for="Joueur" class=" control-label col-md-4 text-left"> Joueur <span class="asterix"> * </span></label>
										<div class="col-md-6">
										  <select name='joueur_id' rows='5' id='joueur_id' class='select2 ' required  ></select> 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Terrain" class=" control-label col-md-4 text-left"> Terrain <span class="asterix"> * </span></label>
										<div class="col-md-6">
										  <select name='terrain_id' rows='5' id='terrain_id' class='select2 ' required  ></select> 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Heure Debut" class=" control-label col-md-4 text-left"> Heure Debut <span class="asterix"> * </span></label>
										<div class="col-md-6">
										  
				<div class="input-group m-b" style="width:150px !important;">
					{!! Form::text('heure_debut', $row['heure_debut'],array('class'=>'form-control datetime', 'style'=>'width:150px !important;')) !!}
					<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
				</div>
				 
										 </div> 
										 <div class="col-md-2">
										 	<a href="#" data-toggle="tooltip" placement="left" class="tips" title="Date et Heure de début de la partie"><i class="icon-question2"></i></a>
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Duree" class=" control-label col-md-4 text-left"> Duree </label>
										<div class="col-md-6">
										  {!! Form::text('duree', $row['duree'],array('class'=>'form-control', 'placeholder'=>'',   )) !!} 
										 </div> 
										 <div class="col-md-2">
										 	<a href="#" data-toggle="tooltip" placement="left" class="tips" title="Durée du match en minutes (30, 60, 90mn)."><i class="icon-question2"></i></a>
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Capteur" class=" control-label col-md-4 text-left"> Capteur <span class="asterix"> * </span></label>
										<div class="col-md-6">
										  <select name='capteur_id' rows='5' id='capteur_id' class='select2 ' required  ></select> 
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
        
        
		$("#joueur_id").jCombo("{!! url('inscription/comboselect?filter=fb_joueurs:joueur_id:premon|nom') !!}",
		{  selected_value : '{{ $row["joueur_id"] }}' });
		
		$("#terrain_id").jCombo("{!! url('inscription/comboselect?filter=fbs_salles:salle_id:identifiant') !!}",
		{  selected_value : '{{ $row["terrain_id"] }}' });
		
		$("#capteur_id").jCombo("{!! url('inscription/comboselect?filter=fb_capteurs:capteur_id:code|numero_serie|UID') !!}",
		{  selected_value : '{{ $row["capteur_id"] }}' });
		

        $('.removeCurrentFiles').on('click', function () {
            var removeUrl = $(this).attr('href');
            $.get(removeUrl, function (response){});
            $(this).parent('div').empty();
            return false;
        });

    });
</script>
