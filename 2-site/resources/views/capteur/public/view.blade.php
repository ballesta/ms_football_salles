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
						<td width='30%' class='label-view text-right'>Numéro Serie</td>
						<td>{{ $row->numero_serie}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Date Achat</td>
						<td>{{ $row->date_achat}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Complexe sportif</td>
						<td>{{ SiteHelpers::formatLookUp($row->club_id,'club_id','1:fbs_complexe_salles:complexe_salle_id:nom|ville') }} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Malette Capteurs</td>
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