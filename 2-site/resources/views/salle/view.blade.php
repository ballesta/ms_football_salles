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
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Soccer Field', (isset($fields['identifiant']['language'])? $fields['identifiant']['language'] : array())) }}</td>
						<td>{{ $row->identifiant}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Number of players', (isset($fields['nbr_joueurs_equipe']['language'])? $fields['nbr_joueurs_equipe']['language'] : array())) }}</td>
						<td>{{ $row->nbr_joueurs_equipe}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Centre', (isset($fields['complexe_salle_id']['language'])? $fields['complexe_salle_id']['language'] : array())) }}</td>
						<td>{{ SiteHelpers::formatLookUp($row->complexe_salle_id,'complexe_salle_id','1:fbs_complexe_salles:complexe_salle_id:nom|ville') }} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Sensors', (isset($fields['capteurs']['language'])? $fields['capteurs']['language'] : array())) }}</td>
						<td>{{ $row->capteurs}} </td>
						
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