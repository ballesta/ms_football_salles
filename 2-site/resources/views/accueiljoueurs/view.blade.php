@extends('layouts.app')

@section('content')
<div class="page-content row">
    <!-- Page header -->

	 
	 
 	<div class="page-content-wrapper m-t">   

<div class="sbox ">
	<div class="sbox-title">
		<div class="sbox-tools pull-left" >
	   		<a href="{{ url('accueiljoueurs?return='.$return) }}" class="tips" title="{{ Lang::get('core.btn_back') }}"><i class="fa  fa-arrow-left"></i></a>
			@if($access['is_add'] ==1)
	   		<a href="{{ url('accueiljoueurs/update/'.$id.'?return='.$return) }}" class="tips " title="{{ Lang::get('core.btn_edit') }}"><i class="fa  fa-pencil"></i></a>
			@endif 
					
		</div>	

		<div class="sbox-tools " >
			<a href="{{ ($prevnext['prev'] != '' ? url('accueiljoueurs/show/'.$prevnext['prev'].'?return='.$return ) : '#') }}" class="tips "><i class="fa fa-arrow-left"></i>  </a>	
			<a href="{{ ($prevnext['next'] != '' ? url('accueiljoueurs/show/'.$prevnext['next'].'?return='.$return ) : '#') }}" class="tips"> <i class="fa fa-arrow-right"></i>  </a>
			@if(Session::get('gid') ==1)
				<a href="{{ URL::to('sximo/module/config/'.$pageModule) }}" class="tips" title=" {{ Lang::get('core.btn_config') }}" ><i class="fa  fa-ellipsis-v"></i></a>
			@endif 			
		</div>


	</div>
	<div class="sbox-content" > 	

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
						<td>{{ $row->heure_debut}} </td>
						
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
				
			</tbody>	
		</table>   

	 
	
	</div>
</div>	

	</div>
</div>
	  
@stop