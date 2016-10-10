

		 {!! Form::open(array('url'=>'partie/savepublic', 'class'=>'form-horizontal','files' => true , 'parsley-validate'=>'','novalidate'=>' ')) !!}

	@if(Session::has('messagetext'))
	  
		   {!! Session::get('messagetext') !!}
	   
	@endif
	<ul class="parsley-error-list">
		@foreach($errors->all() as $error)
			<li>{{ $error }}</li>
		@endforeach
	</ul>		


<div class="col-md-12">
						<fieldset><legend> Parties</legend>
				{!! Form::hidden('partie_id', $row['partie_id']) !!}					
									  <div class="form-group  " >
										<label for="Debut" class=" control-label col-md-4 text-left"> Debut </label>
										<div class="col-md-6">
										  
				<div class="input-group m-b" style="width:150px !important;">
					{!! Form::text('debut', $row['debut'],array('class'=>'form-control datetime', 'style'=>'width:150px !important;')) !!}
					<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
				</div>
				 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Duree" class=" control-label col-md-4 text-left"> Duree </label>
										<div class="col-md-6">
										  {!! Form::text('duree', $row['duree'],array('class'=>'form-control', 'placeholder'=>'',   )) !!} 
										 </div> 
										 <div class="col-md-2">
										 	<a href="#" data-toggle="tooltip" placement="left" class="tips" title="Durée de la partie, du début à la dernière émission d'un capteur"><i class="icon-question2"></i></a>
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Salle Id" class=" control-label col-md-4 text-left"> Salle Id </label>
										<div class="col-md-6">
										  <select name='salle_id' rows='5' id='salle_id' class='select2 '   ></select> 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Equipe Id" class=" control-label col-md-4 text-left"> Equipe Id </label>
										<div class="col-md-6">
										  <select name='equipe_id' rows='5' id='equipe_id' class='select2 '   ></select> 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Malette Capteurs Id" class=" control-label col-md-4 text-left"> Malette Capteurs Id </label>
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
					<button type="submit" name="apply" class="btn btn-info btn-sm" ><i class="fa  fa-check-circle"></i> {{ Lang::get('core.sb_apply') }}</button>
					<button type="submit" name="submit" class="btn btn-primary btn-sm" ><i class="fa  fa-save "></i> {{ Lang::get('core.sb_save') }}</button>
				  </div>	  
			
		</div> 
		 
		 {!! Form::close() !!}
		 
   <script type="text/javascript">
	$(document).ready(function() { 
		
		
		$("#salle_id").jCombo("{!! url('partie/comboselect?filter=fb_clubs:club_id:club_id') !!}",
		{  selected_value : '{{ $row["salle_id"] }}' });
		
		$("#equipe_id").jCombo("{!! url('partie/comboselect?filter=fb_equipes:equipe_id:nom') !!}",
		{  selected_value : '{{ $row["equipe_id"] }}' });
		
		$("#malette_capteurs_id").jCombo("{!! url('partie/comboselect?filter=fb_malette_capteurs:malette_capteurs_id:identifiant') !!}",
		{  selected_value : '{{ $row["malette_capteurs_id"] }}' });
		 

		$('.removeCurrentFiles').on('click',function(){
			var removeUrl = $(this).attr('href');
			$.get(removeUrl,function(response){});
			$(this).parent('div').empty();	
			return false;
		});		
		
	});
	</script>		 
