@extends('layouts.app')

@section('content')
<div class="page-content row">
    <!-- Page header -->

	 
	 
 	<div class="page-content-wrapper m-t">   

<div class="sbox ">
	<div class="sbox-title">
		<div class="sbox-tools pull-left" >
	   		<a href="{{ url('reseauxsalles?return='.$return) }}" class="tips" title="{{ Lang::get('core.btn_back') }}"><i class="fa  fa-arrow-left"></i></a>
			@if($access['is_add'] ==1)
	   		<a href="{{ url('reseauxsalles/update/'.$id.'?return='.$return) }}" class="tips " title="{{ Lang::get('core.btn_edit') }}"><i class="fa  fa-pencil"></i></a>
			@endif 
					
		</div>	

		<div class="sbox-tools " >
			<a href="{{ ($prevnext['prev'] != '' ? url('reseauxsalles/show/'.$prevnext['prev'].'?return='.$return ) : '#') }}" class="tips "><i class="fa fa-arrow-left"></i>  </a>	
			<a href="{{ ($prevnext['next'] != '' ? url('reseauxsalles/show/'.$prevnext['next'].'?return='.$return ) : '#') }}" class="tips"> <i class="fa fa-arrow-right"></i>  </a>
			@if(Session::get('gid') ==1)
				<a href="{{ URL::to('sximo/module/config/'.$pageModule) }}" class="tips" title=" {{ Lang::get('core.btn_config') }}" ><i class="fa  fa-ellipsis-v"></i></a>
			@endif 			
		</div>


	</div>
	<div class="sbox-content" > 	

		<table class="table table-striped table-bordered" >
			<tbody>	
		
					<tr>
						<td width='30%' class='label-view text-right'>Nom</td>
						<td>{{ $row->nom}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Ville</td>
						<td>{{ $row->ville}} </td>
						
					</tr>
				
			</tbody>	
		</table>   

	 
	
	</div>
</div>	

	</div>
</div>
	  
@stop