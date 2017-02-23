@extends('layouts.app')

@section('content')
<div class="page-content row">
	 
	 
 	<div class="page-content-wrapper m-t">   

<div class="sbox "> 
	<div class="sbox-title"> 

	 <h3> {{ $pageTitle }} <small>{{ $pageNote }}</small></h3>

	 	<div class="sbox-tools">
	   		<a href="{{ URL::to('partie?return='.$return) }}" class="tips btn btn-xs btn-white pull-right" title="{{ Lang::get('core.btn_back') }}"><i class="fa fa-arrow-circle-left"></i>&nbsp;{{ Lang::get('core.btn_back') }}</a>
			
			@if($access['is_add'] ==1)
	   		<a href="{{ URL::to('partie/update/'.$id.'?return='.$return) }}" class="tips btn btn-xs btn-white pull-right" title="{{ Lang::get('core.btn_edit') }}"><i class="fa fa-edit"></i>&nbsp;{{ Lang::get('core.btn_edit') }}</a>
			@endif 
		</div>
	</div>
	<div class="sbox-content" > 	

		<table class="table table-striped table-bordered" >
			<tbody>	
		
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Date Hour', (isset($fields['debut']['language'])? $fields['debut']['language'] : array())) }}</td>
						<td>{{ date('d/m/Y h:i',strtotime($row->debut)) }} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Duration', (isset($fields['duree']['language'])? $fields['duree']['language'] : array())) }}</td>
						<td>{{ $row->duree}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Play Ground', (isset($fields['salle_id']['language'])? $fields['salle_id']['language'] : array())) }}</td>
						<td>{{ SiteHelpers::formatLookUp($row->salle_id,'salle_id','1:fbs_salles:salle_id:identifiant') }} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('A team', (isset($fields['equipe_a_id']['language'])? $fields['equipe_a_id']['language'] : array())) }}</td>
						<td>{{ SiteHelpers::formatLookUp($row->equipe_a_id,'equipe_a_id','1:fb_equipes:equipe_id:nom') }} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('B team', (isset($fields['equipe_b_id']['language'])? $fields['equipe_b_id']['language'] : array())) }}</td>
						<td>{{ SiteHelpers::formatLookUp($row->equipe_b_id,'equipe_b_id','1:fb_equipes:equipe_id:nom') }} </td>
						
					</tr>
				
			</tbody>	
		</table>   
	
	</div>
</div>	

	</div>
</div>
	  
@stop