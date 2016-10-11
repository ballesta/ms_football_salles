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
						<td width='30%' class='label-view text-right'>Debut</td>
						<td>{{ $row->debut}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Duree</td>
						<td>{{ $row->duree}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Salle Id</td>
						<td>{{ SiteHelpers::formatLookUp($row->salle_id,'salle_id','1:fbs_salles:salle_id:identifiant') }} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Equipe Id</td>
						<td>{{ SiteHelpers::formatLookUp($row->equipe_id,'equipe_id','1:fb_equipes:equipe_id:nom') }} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Malette Capteurs Id</td>
						<td>{{ SiteHelpers::formatLookUp($row->malette_capteurs_id,'malette_capteurs_id','1:fb_malette_capteurs:malette_capteurs_id:identifiant') }} </td>
						
					</tr>
						
					<tr>
						<td width='30%' class='label-view text-right'></td>
						<td> <a href="javascript:history.go(-1)" class="btn btn-primary"> Back To Grid <a> </td>
						
					</tr>					
				
			</tbody>	
		</table>   

	 
	
	</div>
</div>	