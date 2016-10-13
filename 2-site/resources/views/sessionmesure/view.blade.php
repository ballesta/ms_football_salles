@extends('layouts.app')

@section('content')
<div class="page-content row">
    <!-- Page header -->

	 
	 
 	<div class="page-content-wrapper m-t">   

<div class="sbox ">
	<div class="sbox-title"><h3> {{ $pageTitle }} <small>{{ $pageNote }}</small></h3> 
	<div class="sbox-tools" >
   		<a href="{{ URL::to('sessionmesure?return='.$return) }}" class="tips btn btn-xs btn-white pull-right" title="{{ Lang::get('core.btn_back') }}"><i class="icon-backward"></i>&nbsp;{{ Lang::get('core.btn_back') }}</a>
		@if($access['is_add'] ==1)
   		<a href="{{ URL::to('sessionmesure/update/'.$id.'?return='.$return) }}" class="tips btn btn-xs btn-white pull-right" title="{{ Lang::get('core.btn_edit') }}"><i class="fa fa-edit"></i>&nbsp;{{ Lang::get('core.btn_edit') }}</a>
		@endif 
	</div>	
	</div>
	<div class="sbox-content" style="background:#fff;"> 	

		<table class="table table-striped table-bordered" >
			<tbody>	
		
					<tr>
						<td width='30%' class='label-view text-right'>Date Heure</td>
						<td>{{ $row->date_heure}} </td>
						
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
						<td width='30%' class='label-view text-right'>Capteur</td>
						<td>{{ SiteHelpers::formatLookUp($row->capteur_id,'capteur_id','1:fb_capteurs:capteur_id:numero_serie') }} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Joueur</td>
						<td>{{ SiteHelpers::formatLookUp($row->joueur_id,'joueur_id','1:fb_joueurs:joueur_id:nom|premon') }} </td>
						
					</tr>
				
			</tbody>	
		</table>   

	 
	
	</div>
</div>	

	</div>
</div>
	  
@stop