@extends('layouts.app')

@section('content')
<div class="page-content row">
    <!-- Page header -->

	 
	 
 	<div class="page-content-wrapper m-t">   

<div class="sbox ">
	<div class="sbox-title"><h3> {{ $pageTitle }} <small>{{ $pageNote }}</small></h3> 
	<div class="sbox-tools" >
   		<a href="{{ URL::to('partie?return='.$return) }}" class="tips btn btn-xs btn-white pull-right" title="{{ Lang::get('core.btn_back') }}"><i class="icon-backward"></i>&nbsp;{{ Lang::get('core.btn_back') }}</a>
		@if($access['is_add'] ==1)
   		<a href="{{ URL::to('partie/update/'.$id.'?return='.$return) }}" class="tips btn btn-xs btn-white pull-right" title="{{ Lang::get('core.btn_edit') }}"><i class="fa fa-edit"></i>&nbsp;{{ Lang::get('core.btn_edit') }}</a>
		@endif 
	</div>	
	</div>
	<div class="sbox-content" style="background:#fff;"> 	

		<table class="table table-striped table-bordered" >
			<tbody>	
		
					<tr>
						<td width='30%' class='label-view text-right'>Debut</td>
						<td>{{ $row->debut}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Duree</td>
						<td>{{ $row->duree}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Salle Id</td>
						<td>{{ SiteHelpers::formatLookUp($row->salle_id,'salle_id','1:fbs_salles:salle_id:identifiant') }} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Equipe Id</td>
						<td>{{ SiteHelpers::formatLookUp($row->equipe_id,'equipe_id','1:fb_equipes:equipe_id:nom') }} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Malette Capteurs Id</td>
						<td>{{ SiteHelpers::formatLookUp($row->malette_capteurs_id,'malette_capteurs_id','1:fb_malette_capteurs:malette_capteurs_id:identifiant') }} </td>
						
					</tr>
				
			</tbody>	
		</table>   

	 
	
	</div>
</div>	

	</div>
</div>
	  
@stop