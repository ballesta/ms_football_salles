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
						<td width='30%' class='label-view text-right'>Nom</td>
						<td>{{ $row->nom}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Prénom</td>
						<td>{{ $row->premon}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Equipe</td>
						<td>{{ SiteHelpers::formatLookUp($row->equipe_id,'equipe_id','1:fb_equipes:equipe_id:nom') }} </td>
						
					</tr>
						
					<tr>
						<td width='30%' class='label-view text-right'></td>
						<td> <a href="javascript:history.go(-1)" class="btn btn-primary"> Back To Grid <a> </td>
						
					</tr>					
				
			</tbody>	
		</table>   

	 
	
	</div>
</div>	