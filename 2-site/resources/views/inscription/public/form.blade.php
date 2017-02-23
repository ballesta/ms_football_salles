

		 {!! Form::open(array('url'=>'inscription/savepublic', 'class'=>'form-horizontal','files' => true , 'parsley-validate'=>'','novalidate'=>' ')) !!}

	@if(Session::has('messagetext'))
	  
		   {!! Session::get('messagetext') !!}
	   
	@endif
	<ul class="parsley-error-list">
		@foreach($errors->all() as $error)
			<li>{{ $error }}</li>
		@endforeach
	</ul>		


<div class="col-md-12">
						<fieldset><legend> Players checkin</legend>
				{!! Form::hidden('inscription_id', $row['inscription_id']) !!}					
									  <div class="form-group  " >
										<label for="PLayer" class=" control-label col-md-4 text-left"> PLayer <span class="asterix"> * </span></label>
										<div class="col-md-6">
										  <select name='joueur_id' rows='5' id='joueur_id' class='select2 ' required  ></select> 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Equipe A B" class=" control-label col-md-4 text-left"> Equipe A B </label>
										<div class="col-md-6">
										  <textarea name='equipe_a_b' rows='5' id='equipe_a_b' class='form-control '  
				           >{{ $row['equipe_a_b'] }}</textarea> 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Sensor" class=" control-label col-md-4 text-left"> Sensor </label>
										<div class="col-md-6">
										  <select name='capteur_id' rows='5' id='capteur_id' class='select2 '   ></select> 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Pledge" class=" control-label col-md-4 text-left"> Pledge </label>
										<div class="col-md-6">
										  <textarea name='gage' rows='5' id='gage' class='form-control '  
				           >{{ $row['gage'] }}</textarea> 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Match" class=" control-label col-md-4 text-left"> Match <span class="asterix"> * </span></label>
										<div class="col-md-6">
										  <select name='partie_id' rows='5' id='partie_id' class='select2 ' required  ></select> 
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
		
		
		$("#joueur_id").jCombo("{!! url('inscription/comboselect?filter=fb_joueurs:joueur_id:premon|nom') !!}",
		{  selected_value : '{{ $row["joueur_id"] }}' });
		
		$("#capteur_id").jCombo("{!! url('inscription/comboselect?filter=fb_capteurs:capteur_id:code') !!}",
		{  selected_value : '{{ $row["capteur_id"] }}' });
		
		$("#partie_id").jCombo("{!! url('inscription/comboselect?filter=fb_partie:partie_id:debut') !!}",
		{  selected_value : '{{ $row["partie_id"] }}' });
		 

		$('.removeCurrentFiles').on('click',function(){
			var removeUrl = $(this).attr('href');
			$.get(removeUrl,function(response){});
			$(this).parent('div').empty();	
			return false;
		});		
		
	});
	</script>		 
