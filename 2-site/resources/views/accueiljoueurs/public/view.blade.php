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
						<td width='30%' class='label-view text-right'>Inscription Id</td>
						<td>{{ $row->inscription_id}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Joueur Id</td>
						<td>{{ SiteHelpers::formatLookUp($row->joueur_id,'joueur_id','1:fb_joueurs:joueur_id:premon|nom') }} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Terrain Id</td>
						<td>{{ SiteHelpers::formatLookUp($row->terrain_id,'terrain_id','1:fbs_salles:salle_id:identifiant') }} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Heure Debut</td>
						<td>{{ date('',strtotime($row->heure_debut)) }} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Capteur Id</td>
						<td>{{ SiteHelpers::formatLookUp($row->capteur_id,'capteur_id','1:fb_capteurs:capteur_id:numero_serie') }} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Created By User Id</td>
						<td>{{ $row->created_by_user_id}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>CreatedOn</td>
						<td>{{ $row->createdOn}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>UpdatedOn</td>
						<td>{{ $row->updatedOn}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Complexe Salle Id</td>
						<td>{{ $row->complexe_salle_id}} </td>
						
					</tr>
						
					<tr>
						<td width='30%' class='label-view text-right'></td>
						<td> <a href="javascript:history.go(-1)" class="btn btn-primary"> Back To Grid <a> </td>
						
					</tr>					
				
			</tbody>	
		</table>   

	 
	
	</div>
</div>	