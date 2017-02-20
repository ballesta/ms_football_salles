@if($setting['view-method'] =='native')
<div class="sbox">
	<div class="sbox-title">  
		<h4> <i class="fa fa-table"></i> <?php echo $pageTitle ;?> <small>{{ $pageNote }}</small>
			<a href="javascript:void(0)" class="collapse-close pull-right btn btn-xs btn-danger" onclick="ajaxViewClose('#{{ $pageModule }}')">
			<i class="fa fa fa-times"></i></a>
		</h4>
	 </div>

	<div class="sbox-content"> 
@endif	

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
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Perte Messages', (isset($fields['perte_messages']['language'])? $fields['perte_messages']['language'] : array())) }}</td>
						<td>{{ $row->perte_messages}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Perte Messages Capteur', (isset($fields['perte_messages_capteur']['language'])? $fields['perte_messages_capteur']['language'] : array())) }}</td>
						<td>{{ $row->perte_messages_capteur}} </td>
						
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
				
			</tbody>	
		</table>  
			
		 	

@if($setting['form-method'] =='native')
	</div>	
</div>	
@endif	

<script>
$(document).ready(function(){

});
</script>	