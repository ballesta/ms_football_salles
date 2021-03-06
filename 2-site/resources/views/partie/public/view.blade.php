<div class="m-t" style="padding-top:25px;">	
    <div class="row m-b-lg animated fadeInDown delayp1 text-center">
        <h3> {{ $pageTitle }} <small> {{ $pageNote }} </small></h3>
        <hr />       
    </div>
</div>
<div class="m-t">
	<div class="table-responsive" > 	

		<table class="table table-striped table-bordered" >
			<tbody>	
		
			
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Date Hour', (isset($fields['debut']['language'])? $fields['debut']['language'] : array())) }}</td>
						<td>{{ date('d/m/Y h:i',strtotime($row->debut)) }} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Duration', (isset($fields['duree']['language'])? $fields['duree']['language'] : array())) }}</td>
						<td>{{ $row->duree}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Play Ground', (isset($fields['salle_id']['language'])? $fields['salle_id']['language'] : array())) }}</td>
						<td>{{ SiteHelpers::formatLookUp($row->salle_id,'salle_id','1:fbs_salles:salle_id:identifiant') }} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('A team', (isset($fields['equipe_a_id']['language'])? $fields['equipe_a_id']['language'] : array())) }}</td>
						<td>{{ SiteHelpers::formatLookUp($row->equipe_a_id,'equipe_a_id','1:fb_equipes:equipe_id:nom') }} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('B team', (isset($fields['equipe_b_id']['language'])? $fields['equipe_b_id']['language'] : array())) }}</td>
						<td>{{ SiteHelpers::formatLookUp($row->equipe_b_id,'equipe_b_id','1:fb_equipes:equipe_id:nom') }} </td>
						
					</tr>
						
					<tr>
						<td width='30%' class='label-view text-right'></td>
						<td> <a href="javascript:history.go(-1)" class="btn btn-primary"> Back To Grid <a> </td>
						
					</tr>					
				
			</tbody>	
		</table>   

	 
	
	</div>
</div>	