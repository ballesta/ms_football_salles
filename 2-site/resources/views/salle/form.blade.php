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

		 {!! Form::open(array('url'=>'salle/save?return='.$return, 'class'=>'form-horizontal','files' => true , 'parsley-validate'=>'','novalidate'=>' ')) !!}
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
										<label for="Maximum players" class=" control-label col-md-4 text-left"> Maximum players <span class="asterix"> * </span></label>
										<div class="col-md-6">
										  {!! Form::text('nbr_joueurs_equipe', $row['nbr_joueurs_equipe'],array('class'=>'form-control', 'placeholder'=>'', 'required'=>'true', 'parsley-type'=>'number'   )) !!} 
										 </div> 
										 <div class="col-md-2">
										 	<a href="#" data-toggle="tooltip" placement="left" class="tips" title="Nombre de joueurs maximum par équipe"><i class="icon-question2"></i></a>
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Sensors" class=" control-label col-md-4 text-left"> Sensors </label>
										<div class="col-md-6">
										  
					<?php $capteurs = explode(',',$row['capteurs']);
					$capteurs_opt = array( '1' => 'Equipé de bornes MS-SPORT' ,  '0' => 'NON équipé de bornes MS-SPORT' , ); ?>
					<select name='capteurs' rows='5'   class='select2 '  > 
						<?php 
						foreach($capteurs_opt as $key=>$val)
						{
							echo "<option  value ='$key' ".($row['capteurs'] == $key ? " selected='selected' " : '' ).">$val</option>"; 						
						}						
						?></select> 
										 </div> 
										 <div class="col-md-2">
										 	<a href="#" data-toggle="tooltip" placement="left" class="tips" title="Le terrain (salle) est il équipé de bornes de réception des signaux des capteurs "><i class="icon-question2"></i></a>
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Centre" class=" control-label col-md-4 text-left"> Centre </label>
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
					<button type="button" onclick="location.href='{{ URL::to('salle?return='.$return) }}' " class="btn btn-warning btn-sm "><i class="icon-cancel-circle2 "></i>  {{ Lang::get('core.sb_cancel') }} </button>
					</div>	  
			
				  </div>
		 
		 {!! Form::close() !!}
	</div>
</div>		 
</div>	
</div>			 
   <script type="text/javascript">
	$(document).ready(function() { 
		
		
		$("#complexe_salle_id").jCombo("{!! url('salle/comboselect?filter=fbs_complexe_salles:complexe_salle_id:nom|ville') !!}",
		{  selected_value : '{{ $row["complexe_salle_id"] }}' });
		 
		
		$('.removeMultiFiles').on('click',function(){
			var removeUrl = '{{ url("salle/removefiles?file=")}}'+$(this).attr('url');
			$(this).parent().remove();
			$.get(removeUrl,function(response){});
			$(this).parent('div').empty();	
			return false;
		});		
		
	});
	</script>		 
@stop