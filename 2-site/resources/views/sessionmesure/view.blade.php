@extends('layouts.app')

@section('content')
<div class="page-content row">
    <!-- Page header -->

	 
	 
 	<div class="page-content-wrapper m-t">   

<div class="sbox ">
	<div class="sbox-title">
		<div class="sbox-tools pull-left" >
	   		<a href="{{ url('sessionmesure?return='.$return) }}" class="tips" title="{{ Lang::get('core.btn_back') }}"><i class="fa  fa-arrow-left"></i></a>
			@if($access['is_add'] ==1)
	   		<a href="{{ url('sessionmesure/update/'.$id.'?return='.$return) }}" class="tips " title="{{ Lang::get('core.btn_edit') }}"><i class="fa  fa-pencil"></i></a>
			@endif 
					
		</div>	

		<div class="sbox-tools " >
			<a href="{{ ($prevnext['prev'] != '' ? url('sessionmesure/show/'.$prevnext['prev'].'?return='.$return ) : '#') }}" class="tips "><i class="fa fa-arrow-left"></i>  </a>	
			<a href="{{ ($prevnext['next'] != '' ? url('sessionmesure/show/'.$prevnext['next'].'?return='.$return ) : '#') }}" class="tips"> <i class="fa fa-arrow-right"></i>  </a>
			@if(Session::get('gid') ==1)
				<a href="{{ URL::to('sximo/module/config/'.$pageModule) }}" class="tips" title=" {{ Lang::get('core.btn_config') }}" ><i class="fa  fa-ellipsis-v"></i></a>
			@endif 			
		</div>


	</div>
	<div class="sbox-content" > 	

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
				
			</tbody>	
		</table>   

	 
	
	</div>
</div>	

	</div>
</div>
	  
@stop