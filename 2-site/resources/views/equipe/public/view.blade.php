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
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Team name', (isset($fields['nom']['language'])? $fields['nom']['language'] : array())) }}</td>
						<td>{{ $row->nom}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Center', (isset($fields['complexe_salle_id']['language'])? $fields['complexe_salle_id']['language'] : array())) }}</td>
						<td>{{ SiteHelpers::formatLookUp($row->complexe_salle_id,'complexe_salle_id','1:fbs_complexe_salles:complexe_salle_id:nom|ville') }} </td>
						
					</tr>
						
					<tr>
						<td width='30%' class='label-view text-right'></td>
						<td> <a href="javascript:history.go(-1)" class="btn btn-primary"> Back To Grid <a> </td>
						
					</tr>					
				
			</tbody>	
		</table>   

	 
	
	</div>
</div>	