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

		 {!! Form::open(array('url'=>'joueur/save?return='.$return, 'class'=>'form-horizontal','files' => true , 'parsley-validate'=>'','novalidate'=>' ')) !!}
<div class="col-md-12">
						<fieldset><legend> Joueurs</legend>
				{!! Form::hidden('joueur_id', $row['joueur_id']) !!}					
									  <div class="form-group  " >
										<label for="Nom" class=" control-label col-md-4 text-left"> Nom </label>
										<div class="col-md-6">
										  {!! Form::text('nom', $row['nom'],array('class'=>'form-control', 'placeholder'=>'',   )) !!} 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Prénom" class=" control-label col-md-4 text-left"> Prénom </label>
										<div class="col-md-6">
										  {!! Form::text('premon', $row['premon'],array('class'=>'form-control', 'placeholder'=>'',   )) !!} 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="EMail" class=" control-label col-md-4 text-left"> EMail </label>
										<div class="col-md-6">
										  <textarea name='eMail' rows='5' id='eMail' class='form-control '  
				           >{{ $row['eMail'] }}</textarea> 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Date Naissance" class=" control-label col-md-4 text-left"> Date Naissance </label>
										<div class="col-md-6">
										  {!! Form::text('date_naissance', $row['date_naissance'],array('class'=>'form-control', 'placeholder'=>'',   )) !!} 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Telephone" class=" control-label col-md-4 text-left"> Telephone </label>
										<div class="col-md-6">
										  <textarea name='telephone' rows='5' id='telephone' class='form-control '  
				           >{{ $row['telephone'] }}</textarea> 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Lateralite" class=" control-label col-md-4 text-left"> Lateralite </label>
										<div class="col-md-6">
										  
					<?php $lateralite = explode(',',$row['lateralite']);
					$lateralite_opt = array( 'Droitier' => 'Droitier' ,  'Gaucher' => 'Gaucher' , ); ?>
					<select name='lateralite' rows='5'   class='select2 '  > 
						<?php 
						foreach($lateralite_opt as $key=>$val)
						{
							echo "<option  value ='$key' ".($row['lateralite'] == $key ? " selected='selected' " : '' ).">$val</option>"; 						
						}						
						?></select> 
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
									  </div> 					
									  <div class="form-group  " >
										<label for="Equipe" class=" control-label col-md-4 text-left"> Equipe </label>
										<div class="col-md-6">
										  <select name='equipe_id' rows='5' id='equipe_id' class='select2 '   ></select> 
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
					<button type="button" onclick="location.href='{{ URL::to('joueur?return='.$return) }}' " class="btn btn-warning btn-sm "><i class="icon-cancel-circle2 "></i>  {{ Lang::get('core.sb_cancel') }} </button>
					</div>	  
			
				  </div> 
		 
		 {!! Form::close() !!}
	</div>
</div>		 
</div>	
</div>			 
   <script type="text/javascript">
	$(document).ready(function() { 
		
		
		$("#complexe_salle_id").jCombo("{!! url('joueur/comboselect?filter=fbs_complexe_salles:complexe_salle_id:nom|ville') !!}",
		{  selected_value : '{{ $row["complexe_salle_id"] }}' });
		
		$("#equipe_id").jCombo("{!! url('joueur/comboselect?filter=fb_equipes:equipe_id:nom') !!}",
		{  selected_value : '{{ $row["equipe_id"] }}' });
		 

		$('.removeMultiFiles').on('click',function(){
			var removeUrl = '{{ url("joueur/removefiles?file=")}}'+$(this).attr('url');
			$(this).parent().remove();
			$.get(removeUrl,function(response){});
			$(this).parent('div').empty();	
			return false;
		});		
		
	});
	</script>		 
@stop