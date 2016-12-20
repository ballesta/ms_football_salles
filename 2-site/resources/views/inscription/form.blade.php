@extends('layouts.app')

@section('content')

  <div class="page-content row">
    <!-- Page header -->

 
 	<div class="page-content-wrapper m-t">


<div class="sbox">
	<div class="sbox-title"> 
		<div class="sbox-tools pull-left" >
			<a href="{{ url($pageModule.'?return='.$return) }}" class="tips"  title="{{ Lang::get('core.btn_back') }}" ><i class="fa  fa-arrow-left"></i></a> 
		</div>
		<div class="sbox-tools " >
			@if(Session::get('gid') ==1)
				<a href="{{ URL::to('sximo/module/config/'.$pageModule) }}" class="tips" title=" {{ Lang::get('core.btn_config') }}" ><i class="fa  fa-ellipsis-v"></i></a>
			@endif 			
		</div> 

	</div>
	<div class="sbox-content"> 	

		<ul class="parsley-error-list">
			@foreach($errors->all() as $error)
				<li>{{ $error }}</li>
			@endforeach
		</ul>	

		 {!! Form::open(array('url'=>'inscription/save?return='.$return, 'class'=>'form-horizontal','files' => true , 'parsley-validate'=>'','novalidate'=>' ')) !!}
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
										  
					<?php $duree = explode(',',$row['duree']);
					$duree_opt = array( '30' => '30 minutes' ,  '60' => '60 minutes' ,  '90' => '90 minutes' , ); ?>
					<select name='duree' rows='5'   class='select2 '  > 
						<?php 
						foreach($duree_opt as $key=>$val)
						{
							echo "<option  value ='$key' ".($row['duree'] == $key ? " selected='selected' " : '' ).">$val</option>"; 						
						}						
						?></select> 
										 </div> 
										 <div class="col-md-2">
										 	<a href="#" data-toggle="tooltip" placement="left" class="tips" title="Durée du match en minutes (30, 60, 90 minutes)."><i class="icon-question2"></i></a>
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Capteur" class=" control-label col-md-4 text-left"> Capteur <span class="asterix"> * </span></label>
										<div class="col-md-6">
										  <select name='capteur_id' rows='5' id='capteur_id' class='select2 ' required  ></select> 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Complexe Salle" class=" control-label col-md-4 text-left"> Complexe Salle </label>
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
					<button type="button" onclick="location.href='{{ URL::to('inscription?return='.$return) }}' " class="btn btn-warning btn-sm "><i class="icon-cancel-circle2 "></i>  {{ Lang::get('core.sb_cancel') }} </button>
					</div>	  
			
				  </div> 
		 
		 {!! Form::close() !!}
	</div>
</div>		 
</div>	
</div>			 
   <script type="text/javascript">
	$(document).ready(function() { 
		
		
		$("#joueur_id").jCombo("{!! url('inscription/comboselect?filter=fb_joueurs:joueur_id:premon|nom') !!}",
		{  selected_value : '{{ $row["joueur_id"] }}' });
		
		$("#terrain_id").jCombo("{!! url('inscription/comboselect?filter=fbs_salles:salle_id:identifiant') !!}",
		{  selected_value : '{{ $row["terrain_id"] }}' });
		
		$("#capteur_id").jCombo("{!! url('inscription/comboselect?filter=fb_capteurs:capteur_id:code|numero_serie|UID') !!}",
		{  selected_value : '{{ $row["capteur_id"] }}' });
		
		$("#complexe_salle_id").jCombo("{!! url('inscription/comboselect?filter=fbs_complexe_salles:complexe_salle_id:nom|ville') !!}",
		{  selected_value : '{{ $row["complexe_salle_id"] }}' });
		 

		$('.removeMultiFiles').on('click',function(){
			var removeUrl = '{{ url("inscription/removefiles?file=")}}'+$(this).attr('url');
			$(this).parent().remove();
			$.get(removeUrl,function(response){});
			$(this).parent('div').empty();	
			return false;
		});		
		
	});
	</script>		 
@stop