{!! Form::open(array('url'=>'inscription/savepublic',
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
						<fieldset><legend> Inscription Joueurs</legend>
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
										<label for="Team" class=" control-label col-md-4 text-left"> Team </label>
										<div class="col-md-6">
										  <select name='equipe_id' rows='5' id='equipe_id' class='select2 '   ></select> 
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
        
        
		$("#joueur_id").jCombo("{!! url('inscription/comboselect?filter=fb_joueurs:joueur_id:premon|nom') !!}",
		{  selected_value : '{{ $row["joueur_id"] }}' });
		
		$("#partie_id").jCombo("{!! url('inscription/comboselect?filter=fb_partie:partie_id:debut') !!}",
		{  selected_value : '{{ $row["partie_id"] }}' });
		
		$("#equipe_id").jCombo("{!! url('inscription/comboselect?filter=fb_equipes:equipe_id:nom') !!}",
		{  selected_value : '{{ $row["equipe_id"] }}' });
		
		$("#capteur_id").jCombo("{!! url('inscription/comboselect?filter=fb_capteurs:capteur_id:code') !!}",
		{  selected_value : '{{ $row["capteur_id"] }}' });
		

        $('.removeCurrentFiles').on('click', function () {
            var removeUrl = $(this).attr('href');
            $.get(removeUrl, function (response){});
            $(this).parent('div').empty();
            return false;
        });

    });
</script>
