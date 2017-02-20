
@if($setting['form-method'] =='native')
	<div class="sbox">
		<div class="sbox-title">  
			<h4> <i class="fa fa-table"></i> <?php echo $pageTitle ;?> <small>{{ $pageNote }}</small>
				<a href="javascript:void(0)" class="collapse-close pull-right btn btn-xs btn-danger" onclick="ajaxViewClose('#{{ $pageModule }}')"><i class="fa fa fa-times"></i></a>
			</h4>
	</div>

	<div class="sbox-content"> 
@endif	
			{!! Form::open(array('url'=>'mesurestoutesajax/save/'.SiteHelpers::encryptID($row['mesure_id']), 'class'=>'form-horizontal','files' => true , 'parsley-validate'=>'','novalidate'=>' ','id'=> 'mesurestoutesajaxFormAjax')) !!}
			<div class="col-md-12">
						<fieldset><legend> All Sensor values</legend>
				{!! Form::hidden('mesure_id', $row['mesure_id']) !!}					
									  <div class="form-group  " >
										<label for="Horodatage" class=" control-label col-md-4 text-left"> Horodatage </label>
										<div class="col-md-6">
										  
				<div class="input-group m-b" style="width:150px !important;">
					{!! Form::text('Horodatage', $row['Horodatage'],array('class'=>'form-control datetime', 'style'=>'width:150px !important;')) !!}
					<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
				</div>
				 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Bluetooth" class=" control-label col-md-4 text-left"> Bluetooth </label>
										<div class="col-md-6">
										  {!! Form::text('bluetooth', $row['bluetooth'],array('class'=>'form-control', 'placeholder'=>'',   )) !!} 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Complexe Salle Id" class=" control-label col-md-4 text-left"> Complexe Salle Id </label>
										<div class="col-md-6">
										  <select name='complexe_salle_id' rows='5' id='complexe_salle_id' class='select2 '   ></select> 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Perte Messages" class=" control-label col-md-4 text-left"> Perte Messages </label>
										<div class="col-md-6">
										  <textarea name='perte_messages' rows='5' id='perte_messages' class='form-control '  
				           >{{ $row['perte_messages'] }}</textarea> 
										 </div> 
										 <div class="col-md-2">
										 	<a href="#" data-toggle="tooltip" placement="left" class="tips" title="Nombre de massage manquants"><i class="icon-question2"></i></a>
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Perte Messages Capteur" class=" control-label col-md-4 text-left"> Perte Messages Capteur </label>
										<div class="col-md-6">
										  <textarea name='perte_messages_capteur' rows='5' id='perte_messages_capteur' class='form-control '  
				           >{{ $row['perte_messages_capteur'] }}</textarea> 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Message Json" class=" control-label col-md-4 text-left"> Message Json </label>
										<div class="col-md-6">
										  {!! Form::text('message_json', $row['message_json'],array('class'=>'form-control', 'placeholder'=>'',   )) !!} 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Session Mesure Id" class=" control-label col-md-4 text-left"> Session Mesure Id </label>
										<div class="col-md-6">
										  <select name='session_mesure_id' rows='5' id='session_mesure_id' class='select2 '   ></select> 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Created At" class=" control-label col-md-4 text-left"> Created At </label>
										<div class="col-md-6">
										  
				<div class="input-group m-b" style="width:150px !important;">
					{!! Form::text('created_at', $row['created_at'],array('class'=>'form-control datetime', 'style'=>'width:150px !important;')) !!}
					<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
				</div>
				 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Updated At" class=" control-label col-md-4 text-left"> Updated At </label>
										<div class="col-md-6">
										  
				<div class="input-group m-b" style="width:150px !important;">
					{!! Form::text('updated_at', $row['updated_at'],array('class'=>'form-control datetime', 'style'=>'width:150px !important;')) !!}
					<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
				</div>
				 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> </fieldset>
			</div>
			
												
								
						
			<div style="clear:both"></div>	
							
			<div class="form-group">
				<label class="col-sm-4 text-right">&nbsp;</label>
				<div class="col-sm-8">	
					<button type="submit" class="btn btn-primary btn-sm "><i class="icon-checkmark-circle2"></i>  {{ Lang::get('core.sb_save') }} </button>
					<button type="button" onclick="ajaxViewClose('#{{ $pageModule }}')" class="btn btn-success btn-sm"><i class="icon-cancel-circle2 "></i>  {{ Lang::get('core.sb_cancel') }} </button>
				</div>			
			</div> 		 
			{!! Form::close() !!}


@if($setting['form-method'] =='native')
	</div>	
</div>	
@endif	

	
</div>	
			 
<script type="text/javascript">
$(document).ready(function() { 
	
		$("#complexe_salle_id").jCombo("{!! url('mesurestoutesajax/comboselect?filter=fbs_complexe_salles:complexe_salle_id:complexe_salle_id') !!}",
		{  selected_value : '{{ $row["complexe_salle_id"] }}' });
		
		$("#session_mesure_id").jCombo("{!! url('mesurestoutesajax/comboselect?filter=fb_sessions_mesures:session_mesure_id:session_mesure_id') !!}",
		{  selected_value : '{{ $row["session_mesure_id"] }}' });
		 
	
	$('.editor').summernote();
	$('.previewImage').fancybox();	
	$('.tips').tooltip();	
	$(".select2").select2({ width:"98%"});	
	$('.date').datepicker({format:'yyyy-mm-dd',autoClose:true})
	$('.datetime').datetimepicker({format: 'yyyy-mm-dd hh:ii:ss'}); 
	$('input[type="checkbox"],input[type="radio"]').iCheck({
		checkboxClass: 'icheckbox_square-red',
		radioClass: 'iradio_square-red',
	});			
		$('.removeMultiFiles').on('click',function(){
			var removeUrl = '{{ url("mesurestoutesajax/removefiles?file=")}}'+$(this).attr('url');
			$(this).parent().remove();
			$.get(removeUrl,function(response){});
			$(this).parent('div').empty();	
			return false;
		});
				
	var form = $('#mesurestoutesajaxFormAjax'); 
	form.parsley();
	form.submit(function(){
		
		if(form.parsley('isValid') == true){			
			var options = { 
				dataType:      'json', 
				beforeSubmit :  showRequest,
				success:       showResponse  
			}  
			$(this).ajaxSubmit(options); 
			return false;
						
		} else {
			return false;
		}		
	
	});

});

function showRequest()
{
	$('.ajaxLoading').show();		
}  
function showResponse(data)  {		
	
	if(data.status == 'success')
	{
		ajaxViewClose('#{{ $pageModule }}');
		ajaxFilter('#{{ $pageModule }}','{{ $pageUrl }}/data');
		notyMessage(data.message);	
		$('#sximo-modal').modal('hide');	
	} else {
		notyMessageError(data.message);	
		$('.ajaxLoading').hide();
		return false;
	}	
}			 

</script>		 