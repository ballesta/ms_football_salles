{!! Form::open(array('url'=>'sessionmesure/savepublic',
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
						<fieldset><legend> SessionMesures</legend>
				{!! Form::hidden('session_mesure_id', $row['session_mesure_id']) !!}					
									  <div class="form-group  " >
										<label for="Date Heure" class=" control-label col-md-4 text-left"> Date Heure </label>
										<div class="col-md-6">
										  
				<div class="input-group m-b" style="width:150px !important;">
					{!! Form::text('date_heure', $row['date_heure'],array('class'=>'form-control datetime', 'style'=>'width:150px !important;')) !!}
					<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
				</div>
				 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Activite Temps Total" class=" control-label col-md-4 text-left"> Activite Temps Total </label>
										<div class="col-md-6">
										  {!! Form::text('activite_temps_total', $row['activite_temps_total'],array('class'=>'form-control', 'placeholder'=>'',   )) !!} 
										 </div> 
										 <div class="col-md-2">
										 	<a href="#" data-toggle="tooltip" placement="left" class="tips" title="Temps total des actions en minutes"><i class="icon-question2"></i></a>
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Activite Distance" class=" control-label col-md-4 text-left"> Activite Distance </label>
										<div class="col-md-6">
										  {!! Form::text('activite_distance', $row['activite_distance'],array('class'=>'form-control', 'placeholder'=>'',   )) !!} 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Activite Vitesse Moyenne" class=" control-label col-md-4 text-left"> Activite Vitesse Moyenne </label>
										<div class="col-md-6">
										  {!! Form::text('activite_vitesse_moyenne', $row['activite_vitesse_moyenne'],array('class'=>'form-control', 'placeholder'=>'',   )) !!} 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Marche Temps Total" class=" control-label col-md-4 text-left"> Marche Temps Total </label>
										<div class="col-md-6">
										  {!! Form::text('marche_temps_total', $row['marche_temps_total'],array('class'=>'form-control', 'placeholder'=>'',   )) !!} 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Marche Distance" class=" control-label col-md-4 text-left"> Marche Distance </label>
										<div class="col-md-6">
										  {!! Form::text('marche_distance', $row['marche_distance'],array('class'=>'form-control', 'placeholder'=>'',   )) !!} 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Marche Vitesse Moyenne" class=" control-label col-md-4 text-left"> Marche Vitesse Moyenne </label>
										<div class="col-md-6">
										  {!! Form::text('marche_vitesse_moyenne', $row['marche_vitesse_moyenne'],array('class'=>'form-control', 'placeholder'=>'',   )) !!} 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Course Temps Total" class=" control-label col-md-4 text-left"> Course Temps Total </label>
										<div class="col-md-6">
										  {!! Form::text('course_temps_total', $row['course_temps_total'],array('class'=>'form-control', 'placeholder'=>'',   )) !!} 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Course Distance" class=" control-label col-md-4 text-left"> Course Distance </label>
										<div class="col-md-6">
										  {!! Form::text('course_distance', $row['course_distance'],array('class'=>'form-control', 'placeholder'=>'',   )) !!} 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Course Vitesse Moyenne" class=" control-label col-md-4 text-left"> Course Vitesse Moyenne </label>
										<div class="col-md-6">
										  {!! Form::text('course_vitesse_moyenne', $row['course_vitesse_moyenne'],array('class'=>'form-control', 'placeholder'=>'',   )) !!} 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Sprint Temps Total" class=" control-label col-md-4 text-left"> Sprint Temps Total </label>
										<div class="col-md-6">
										  {!! Form::text('sprint_temps_total', $row['sprint_temps_total'],array('class'=>'form-control', 'placeholder'=>'',   )) !!} 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Sprint Distance" class=" control-label col-md-4 text-left"> Sprint Distance </label>
										<div class="col-md-6">
										  {!! Form::text('sprint_distance', $row['sprint_distance'],array('class'=>'form-control', 'placeholder'=>'',   )) !!} 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Sprint Vitesse Moyenne" class=" control-label col-md-4 text-left"> Sprint Vitesse Moyenne </label>
										<div class="col-md-6">
										  {!! Form::text('sprint_vitesse_moyenne', $row['sprint_vitesse_moyenne'],array('class'=>'form-control', 'placeholder'=>'',   )) !!} 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Sprint Vitesse Maximum" class=" control-label col-md-4 text-left"> Sprint Vitesse Maximum </label>
										<div class="col-md-6">
										  {!! Form::text('sprint_vitesse_maximum', $row['sprint_vitesse_maximum'],array('class'=>'form-control', 'placeholder'=>'',   )) !!} 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> {!! Form::hidden('partie_id', $row['partie_id']) !!}{!! Form::hidden('activite_id', $row['activite_id']) !!}					
									  <div class="form-group  " >
										<label for="Capteur" class=" control-label col-md-4 text-left"> Capteur </label>
										<div class="col-md-6">
										  <select name='capteur_id' rows='5' id='capteur_id' class='select2 '   ></select> 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Joueur" class=" control-label col-md-4 text-left"> Joueur </label>
										<div class="col-md-6">
										  <select name='joueur_id' rows='5' id='joueur_id' class='select2 '   ></select> 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> {!! Form::hidden('joueur_selectionne_id', $row['joueur_selectionne_id']) !!}</fieldset>
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
        
        
		$("#capteur_id").jCombo("{!! url('sessionmesure/comboselect?filter=fb_capteurs:capteur_id:numero_serie') !!}",
		{  selected_value : '{{ $row["capteur_id"] }}' });
		
		$("#joueur_id").jCombo("{!! url('sessionmesure/comboselect?filter=fb_joueurs:joueur_id:nom|premon') !!}",
		{  selected_value : '{{ $row["joueur_id"] }}' });
		

        $('.removeCurrentFiles').on('click', function () {
            var removeUrl = $(this).attr('href');
            $.get(removeUrl, function (response){});
            $(this).parent('div').empty();
            return false;
        });

    });
</script>
