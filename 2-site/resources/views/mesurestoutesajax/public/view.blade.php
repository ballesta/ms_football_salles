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
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Mesure Id', (isset($fields['mesure_id']['language'])? $fields['mesure_id']['language'] : array())) }}</td>
						<td>{{ $row->mesure_id}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Horodatage', (isset($fields['Horodatage']['language'])? $fields['Horodatage']['language'] : array())) }}</td>
						<td>{{ $row->Horodatage}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Bluetooth', (isset($fields['bluetooth']['language'])? $fields['bluetooth']['language'] : array())) }}</td>
						<td>{{ $row->bluetooth}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Complexe Salle Id', (isset($fields['complexe_salle_id']['language'])? $fields['complexe_salle_id']['language'] : array())) }}</td>
						<td>{{ $row->complexe_salle_id}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Message Json', (isset($fields['message_json']['language'])? $fields['message_json']['language'] : array())) }}</td>
						<td>{{ $row->message_json}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Session Mesure Id', (isset($fields['session_mesure_id']['language'])? $fields['session_mesure_id']['language'] : array())) }}</td>
						<td>{{ $row->session_mesure_id}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Created At', (isset($fields['created_at']['language'])? $fields['created_at']['language'] : array())) }}</td>
						<td>{{ $row->created_at}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Updated At', (isset($fields['updated_at']['language'])? $fields['updated_at']['language'] : array())) }}</td>
						<td>{{ $row->updated_at}} </td>
						
					</tr>
						
					<tr>
						<td width='30%' class='label-view text-right'></td>
						<td> <a href="javascript:history.go(-1)" class="btn btn-primary"> Back To Grid <a> </td>
						
					</tr>					
				
			</tbody>	
		</table>   

	 
	
	</div>
</div>	