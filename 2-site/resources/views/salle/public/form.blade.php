

		 {!! Form::open(array('url'=>'salle/savepublic', 'class'=>'form-horizontal','files' => true , 'parsley-validate'=>'','novalidate'=>' ')) !!}

	@if(Session::has('messagetext'))
	  
		   {!! Session::get('messagetext') !!}
	   
	@endif
	<ul class="parsley-error-list">
		@foreach($errors->all() as $error)
			<li>{{ $error }}</li>
		@endforeach
	</ul>		


<div class="col-md-12">
						<fieldset><legend> Salles</legend>
				{!! Form::hidden('salle_id', $row['salle_id']) !!}					
									  <div class="form-group  " >
										<label for="Terrain" class=" control-label col-md-4 text-left"> Terrain <span class="asterix"> * </span></label>
										<div class="col-md-6">
										  {!! Form::text('identifiant', $row['identifiant'],array('class'=>'form-control', 'placeholder'=>'', 'required'=>'true'  )) !!} 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Nbr Joueurs Equipe" class=" control-label col-md-4 text-left"> Nbr Joueurs Equipe </label>
										<div class="col-md-6">
										  <textarea name='nbr_joueurs_equipe' rows='5' id='nbr_joueurs_equipe' class='form-control '  
				           >{{ $row['nbr_joueurs_equipe'] }}</textarea> 
										 </div> 
										 <div class="col-md-2">
										 	<a href="#" data-toggle="tooltip" placement="left" class="tips" title="Nombre de joueurs maximum par équipe"><i class="icon-question2"></i></a>
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Centre" class=" control-label col-md-4 text-left"> Centre </label>
										<div class="col-md-6">
										  <select name='complexe_salle_id' rows='5' id='complexe_salle_id' class='select2 '   ></select> 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Sensors" class=" control-label col-md-4 text-left"> Sensors </label>
										<div class="col-md-6">
										  <textarea name='capteurs' rows='5' id='capteurs' class='form-control '  
				           >{{ $row['capteurs'] }}</textarea> 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> </fieldset>
			</div>
			
			

			<div style="clear:both"></div>	
				
					
				  <div class="form-group">
					<label class="col-sm-4 text-right">&nbsp;</label>
					<div class="col-sm-8">	
					<button type="submit" name="apply" class="btn btn-info btn-sm" ><i class="fa  fa-check-circle"></i> {{ Lang::get('core.sb_apply') }}</button>
					<button type="submit" name="submit" class="btn btn-primary btn-sm" ><i class="fa  fa-save "></i> {{ Lang::get('core.sb_save') }}</button>
				  </div>	  
			
		</div> 
		 
		 {!! Form::close() !!}
		 
   <script type="text/javascript">
	$(document).ready(function() { 
		
		
		$("#complexe_salle_id").jCombo("{!! url('salle/comboselect?filter=fbs_complexe_salles:complexe_salle_id:nom|ville') !!}",
		{  selected_value : '{{ $row["complexe_salle_id"] }}' });
		 

		$('.removeCurrentFiles').on('click',function(){
			var removeUrl = $(this).attr('href');
			$.get(removeUrl,function(response){});
			$(this).parent('div').empty();	
			return false;
		});		
		
	});
	</script>		 
