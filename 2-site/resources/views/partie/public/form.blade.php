{!! Form::open(array('url'=>'partie/savepublic',
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
										<label for="Fin" class=" control-label col-md-4 text-left"> Fin </label>
										<div class="col-md-6">
										  <textarea name='fin' rows='5' id='fin' class='form-control '  
				           >{{ $row['fin'] }}</textarea> 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Salle" class=" control-label col-md-4 text-left"> Salle </label>
										<div class="col-md-6">
										  <select name='salle_id' rows='5' id='salle_id' class='select2 '   ></select> 
										 </div> 
										 <div class="col-md-2">
										 	
										 </div>
									  </div> 					
									  <div class="form-group  " >
										<label for="Complexe Salle Id" class=" control-label col-md-4 text-left"> Complexe Salle Id </label>
										<div class="col-md-6">
										  <textarea name='complexe_salle_id' rows='5' id='complexe_salle_id' class='form-control '  
				           >{{ $row['complexe_salle_id'] }}</textarea> 
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
        
        
		$("#salle_id").jCombo("{!! url('partie/comboselect?filter=fbs_salles:salle_id:identifiant') !!}",
		{  selected_value : '{{ $row["salle_id"] }}' });
		

        $('.removeCurrentFiles').on('click', function () {
            var removeUrl = $(this).attr('href');
            $.get(removeUrl, function (response){});
            $(this).parent('div').empty();
            return false;
        });

    });
</script>
