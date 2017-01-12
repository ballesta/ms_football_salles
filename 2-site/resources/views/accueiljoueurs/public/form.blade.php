{!! Form::open(array('url'=>'accueiljoueurs/savepublic',
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
						<fieldset><legend> AccueilJoueurs </legend>
				{!! Form::hidden('inscription_id', $row['inscription_id']) !!}					
									  <div class="form-group  " >
										<label for="Joueur Id" class=" control-label col-md-4 text-left"> Joueur Id </label>
										<div class="col-md-6">
										  <select name='joueur_id' rows='5' id='joueur_id' class='select2 '   ></select> 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Terrain Id" class=" control-label col-md-4 text-left"> Terrain Id </label>
										<div class="col-md-6">
										  <select name='terrain_id' rows='5' id='terrain_id' class='select2 '   ></select> 
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
										 	<a href="#" data-toggle="tooltip" placement="left" class="tips" title="heure du début de la partie à laquelle le joueur souhait s'inscrire"><i class="icon-question2"></i></a>
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Capteur Id" class=" control-label col-md-4 text-left"> Capteur Id </label>
										<div class="col-md-6">
										  <select name='capteur_id' rows='5' id='capteur_id' class='select2 '   ></select> 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Created By User Id" class=" control-label col-md-4 text-left"> Created By User Id </label>
										<div class="col-md-6">
										  {!! Form::text('created_by_user_id', $row['created_by_user_id'],array('class'=>'form-control', 'placeholder'=>'',   )) !!} 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="CreatedOn" class=" control-label col-md-4 text-left"> CreatedOn </label>
										<div class="col-md-6">
										  
				<div class="input-group m-b" style="width:150px !important;">
					{!! Form::text('createdOn', $row['createdOn'],array('class'=>'form-control datetime', 'style'=>'width:150px !important;')) !!}
					<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
				</div>
				 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="UpdatedOn" class=" control-label col-md-4 text-left"> UpdatedOn </label>
										<div class="col-md-6">
										  
				<div class="input-group m-b" style="width:150px !important;">
					{!! Form::text('updatedOn', $row['updatedOn'],array('class'=>'form-control datetime', 'style'=>'width:150px !important;')) !!}
					<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
				</div>
				 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Complexe Salle Id" class=" control-label col-md-4 text-left"> Complexe Salle Id </label>
										<div class="col-md-6">
										  {!! Form::text('complexe_salle_id', $row['complexe_salle_id'],array('class'=>'form-control', 'placeholder'=>'',   )) !!} 
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
        
        
		$("#joueur_id").jCombo("{!! url('accueiljoueurs/comboselect?filter=fb_joueurs:joueur_id:premon|nom') !!}",
		{  selected_value : '{{ $row["joueur_id"] }}' });
		
		$("#terrain_id").jCombo("{!! url('accueiljoueurs/comboselect?filter=fbs_salles:salle_id:identifiant') !!}",
		{  selected_value : '{{ $row["terrain_id"] }}' });
		
		$("#capteur_id").jCombo("{!! url('accueiljoueurs/comboselect?filter=fb_capteurs:capteur_id:numero_serie') !!}",
		{  selected_value : '{{ $row["capteur_id"] }}' });
		

        $('.removeCurrentFiles').on('click', function () {
            var removeUrl = $(this).attr('href');
            $.get(removeUrl, function (response){});
            $(this).parent('div').empty();
            return false;
        });

    });
</script>
