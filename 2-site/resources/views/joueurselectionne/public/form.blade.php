

		 {!! Form::open(array('url'=>'joueurselectionne/savepublic', 'class'=>'form-horizontal','files' => true , 'parsley-validate'=>'','novalidate'=>' ')) !!}

	@if(Session::has('messagetext'))
	  
		   {!! Session::get('messagetext') !!}
	   
	@endif
	<ul class="parsley-error-list">
		@foreach($errors->all() as $error)
			<li>{{ $error }}</li>
		@endforeach
	</ul>		


<div class="col-md-12">
						<fieldset><legend> Joueurs sélectionnés</legend>
				{!! Form::hidden('joueur_selectionne_id', $row['joueur_selectionne_id']) !!}					
									  <div class="form-group  " >
										<label for="Partie Id" class=" control-label col-md-4 text-left"> Partie Id </label>
										<div class="col-md-6">
										  <select name='partie_id' rows='5' id='partie_id' class='select2 '   ></select> 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Joueur Id" class=" control-label col-md-4 text-left"> Joueur Id </label>
										<div class="col-md-6">
										  <select name='joueur_id' rows='5' id='joueur_id' class='select2 '   ></select> 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Capteur Id" class=" control-label col-md-4 text-left"> Capteur Id </label>
										<div class="col-md-6">
										  <select name='capteur_id' rows='5' id='capteur_id' class='select2 '   ></select> 
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
		
		
		$("#partie_id").jCombo("{!! url('joueurselectionne/comboselect?filter=fb_partie:partie_id:debut|duree') !!}",
		{  selected_value : '{{ $row["partie_id"] }}' });
		
		$("#joueur_id").jCombo("{!! url('joueurselectionne/comboselect?filter=fb_joueurs:joueur_id:nom|premon') !!}",
		{  selected_value : '{{ $row["joueur_id"] }}' });
		
		$("#capteur_id").jCombo("{!! url('joueurselectionne/comboselect?filter=fb_capteurs:capteur_id:numero_serie') !!}",
		{  selected_value : '{{ $row["capteur_id"] }}' });
		 

		$('.removeCurrentFiles').on('click',function(){
			var removeUrl = $(this).attr('href');
			$.get(removeUrl,function(response){});
			$(this).parent('div').empty();	
			return false;
		});		
		
	});
	</script>		 
