@extends('layouts.app')

@section('content')
<div class="page-content row">
    <!-- Page header -->

	 
	 
 	<div class="page-content-wrapper m-t">   

<div class="sbox ">
	<div class="sbox-title"><h3> {{ $pageTitle }} <small>{{ $pageNote }}</small></h3> 
	<div class="sbox-tools" >
   		<a href="{{ URL::to('malette?return='.$return) }}" class="tips btn btn-xs btn-white pull-right" title="{{ Lang::get('core.btn_back') }}"><i class="icon-backward"></i>&nbsp;{{ Lang::get('core.btn_back') }}</a>
		@if($access['is_add'] ==1)
   		<a href="{{ URL::to('malette/update/'.$id.'?return='.$return) }}" class="tips btn btn-xs btn-white pull-right" title="{{ Lang::get('core.btn_edit') }}"><i class="fa fa-edit"></i>&nbsp;{{ Lang::get('core.btn_edit') }}</a>
		@endif 
	</div>	
	</div>
	<div class="sbox-content" style="background:#fff;"> 	

		<table class="table table-striped table-bordered" >
			<tbody>	
		
					<tr>
						<td width='30%' class='label-view text-right'>Malette Capteurs Id</td>
						<td>{{ $row->malette_capteurs_id}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Identifiant</td>
						<td>{{ $row->identifiant}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Complexe Salle Id</td>
						<td>{{ SiteHelpers::formatLookUp($row->complexe_salle_id,'complexe_salle_id','1:fbs_complexe_salles:complexe_salle_id:nom|ville') }} </td>
						
					</tr>
				
			</tbody>	
		</table>   

	 
	
	</div>
</div>	

	</div>
</div>
	  
@stop