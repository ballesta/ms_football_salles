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
						<td width='30%' class='label-view text-right'>Date Heure</td>
						<td>{{ $row->date_heure}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Capteur</td>
						<td>{{ SiteHelpers::formatLookUp($row->capteur_id,'capteur_id','1:fb_capteurs:capteur_id:numero_serie') }} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Activite Temps Total</td>
						<td>{{ $row->activite_temps_total}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Activite Distance</td>
						<td>{{ $row->activite_distance}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Activite Vitesse Moyenne</td>
						<td>{{ $row->activite_vitesse_moyenne}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Marche Temps Total</td>
						<td>{{ $row->marche_temps_total}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Marche Distance</td>
						<td>{{ $row->marche_distance}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Marche Vitesse Moyenne</td>
						<td>{{ $row->marche_vitesse_moyenne}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Course Temps Total</td>
						<td>{{ $row->course_temps_total}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Course Distance</td>
						<td>{{ $row->course_distance}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Course Vitesse Moyenne</td>
						<td>{{ $row->course_vitesse_moyenne}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Sprint Temps Total</td>
						<td>{{ $row->sprint_temps_total}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Sprint Distance</td>
						<td>{{ $row->sprint_distance}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Sprint Vitesse Moyenne</td>
						<td>{{ $row->sprint_vitesse_moyenne}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Sprint Vitesse Maximum</td>
						<td>{{ $row->sprint_vitesse_maximum}} </td>
						
					</tr>
						
					<tr>
						<td width='30%' class='label-view text-right'></td>
						<td> <a href="javascript:history.go(-1)" class="btn btn-primary"> Back To Grid <a> </td>
						
					</tr>					
				
			</tbody>	
		</table>   

	 
	
	</div>
</div>	