@extends('layouts.app')

@section('content')

  <div class="page-content row">

 	<div class="page-content-wrapper m-t">


<div class="sbox">
	<div class="sbox-title"> <h3> {{ $pageTitle }} <small>{{ $pageNote }}</small></h3> </div>
	<div class="sbox-content"> 	

		<ul class="parsley-error-list">
			@foreach($errors->all() as $error)
				<li>{{ $error }}</li>
			@endforeach
		</ul>	

		 {!! Form::open(array('url'=>'partie/save?return='.$return, 'class'=>'form-horizontal','files' => true , 'parsley-validate'=>'','novalidate'=>' ')) !!}
<div class="col-md-12">
						<fieldset><legend> Parties</legend>
				{!! Form::hidden('partie_id', $row['partie_id']) !!}					
									  <div class="form-group  " >
										<label for="Begins" class=" control-label col-md-4 text-left"> Begins <span class="asterix"> * </span></label>
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
										<label for="Duration" class=" control-label col-md-4 text-left"> Duration </label>
										<div class="col-md-6">
										  
					<?php $duree = explode(',',$row['duree']);
					$duree_opt = array( '30' => '30 minutes' ,  '60' => '1  Heure' ,  '90' => '1 Heure 30 minutes' , ); ?>
					<select name='duree' rows='5'   class='select2 '  > 
						<?php 
						foreach($duree_opt as $key=>$val)
						{
							echo "<option  value ='$key' ".($row['duree'] == $key ? " selected='selected' " : '' ).">$val</option>"; 						
						}						
						?></select> 
										 </div> 
										 <div class="col-md-2">
										 	<a href="#" data-toggle="tooltip" placement="left" class="tips" title="Durée de la partie, du début à la dernière émission d'un capteur"><i class="icon-question2"></i></a>
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="End" class=" control-label col-md-4 text-left"> End </label>
										<div class="col-md-6">
										  
				<div class="input-group m-b" style="width:150px !important;">
					{!! Form::text('fin', $row['fin'],array('class'=>'form-control datetime', 'style'=>'width:150px !important;')) !!}
					<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
				</div>
				 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Play Ground" class=" control-label col-md-4 text-left"> Play Ground </label>
										<div class="col-md-6">
										  <select name='salle_id' rows='5' id='salle_id' class='select2 '   ></select> 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="A team" class=" control-label col-md-4 text-left"> A team </label>
										<div class="col-md-6">
										  <select name='equipe_a_id' rows='5' id='equipe_a_id' class='select2 '   ></select> 
										 </div> 
										 <div class="col-md-2">
										 	<a href="#" data-toggle="tooltip" placement="left" class="tips" title="Première equipe"><i class="icon-question2"></i></a>
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="B team" class=" control-label col-md-4 text-left"> B team </label>
										<div class="col-md-6">
										  <select name='equipe_b_id' rows='5' id='equipe_b_id' class='select2 '   ></select> 
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
									  </div> </fieldset>
			</div>
			
			

		
			<div style="clear:both"></div>	
				
					
				  <div class="form-group">
					<label class="col-sm-4 text-right">&nbsp;</label>
					<div class="col-sm-8">	
					<button type="submit" name="apply" class="btn btn-info btn-sm" ><i class="icon-checkmark-circle2"></i> {{ Lang::get('core.sb_apply') }}</button>
					<button type="submit" name="submit" class="btn btn-primary btn-sm" ><i class="icon-bubble-check"></i> {{ Lang::get('core.sb_save') }}</button>
					<button type="button" onclick="location.href='{{ URL::to('partie?return='.$return) }}' " class="btn btn-warning btn-sm "><i class="icon-cancel-circle2 "></i>  {{ Lang::get('core.sb_cancel') }} </button>
					</div>	  
			
				  </div>
		 
		 {!! Form::close() !!}
	</div>
</div>		 
</div>	
</div>			 
   <script type="text/javascript">
	$(document).ready(function() { 
		
		
		$("#salle_id").jCombo("{!! url('partie/comboselect?filter=fbs_salles:salle_id:identifiant') !!}",
		{  selected_value : '{{ $row["salle_id"] }}' });
		
		$("#equipe_a_id").jCombo("{!! url('partie/comboselect?filter=fb_equipes:equipe_id:nom') !!}",
		{  selected_value : '{{ $row["equipe_a_id"] }}' });
		
		$("#equipe_b_id").jCombo("{!! url('partie/comboselect?filter=fb_equipes:equipe_id:nom') !!}",
		{  selected_value : '{{ $row["equipe_b_id"] }}' });
		
		$("#complexe_salle_id").jCombo("{!! url('partie/comboselect?filter=fbs_complexe_salles:complexe_salle_id:nom|ville') !!}",
		{  selected_value : '{{ $row["complexe_salle_id"] }}' });
		 
		
		$('.removeMultiFiles').on('click',function(){
			var removeUrl = '{{ url("partie/removefiles?file=")}}'+$(this).attr('url');
			$(this).parent().remove();
			$.get(removeUrl,function(response){});
			$(this).parent('div').empty();	
			return false;
		});		
		
	});
	</script>		 
@stop