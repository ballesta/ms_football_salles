@extends('layouts.app')

@section('content')
<div class="page-content row">
	 
	 
 	<div class="page-content-wrapper m-t">   

<div class="sbox "> 
	<div class="sbox-title"> 

	 <h3> {{ $pageTitle }} <small>{{ $pageNote }}</small></h3>

	 	<div class="sbox-tools">
	   		<a href="{{ URL::to('capteur?return='.$return) }}" class="tips btn btn-xs btn-white pull-right" title="{{ Lang::get('core.btn_back') }}"><i class="fa fa-arrow-circle-left"></i>&nbsp;{{ Lang::get('core.btn_back') }}</a>
			
			@if($access['is_add'] ==1)
	   		<a href="{{ URL::to('capteur/update/'.$id.'?return='.$return) }}" class="tips btn btn-xs btn-white pull-right" title="{{ Lang::get('core.btn_edit') }}"><i class="fa fa-edit"></i>&nbsp;{{ Lang::get('core.btn_edit') }}</a>
			@endif 
		</div>
	</div>
	<div class="sbox-content" > 	

		<table class="table table-striped table-bordered" >
			<tbody>	
		
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Code', (isset($fields['code']['language'])? $fields['code']['language'] : array())) }}</td>
						<td>{{ $row->code}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Serial numbezr', (isset($fields['numero_serie']['language'])? $fields['numero_serie']['language'] : array())) }}</td>
						<td>{{ $row->numero_serie}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Bluetooth', (isset($fields['UID']['language'])? $fields['UID']['language'] : array())) }}</td>
						<td>{{ $row->UID}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Date baught', (isset($fields['date_achat']['language'])? $fields['date_achat']['language'] : array())) }}</td>
						<td>{{ date('d/m/Y',strtotime($row->date_achat)) }} </td>
						
					</tr>
				
			</tbody>	
		</table>   
	
	</div>
</div>	

	</div>
</div>
	  
@stop