@extends('layouts.app')

@section('content')
<div class="page-content row">
    <!-- Page header -->

	 
	 
 	<div class="page-content-wrapper m-t">   

<div class="sbox ">
	<div class="sbox-title">
		<div class="sbox-tools pull-left" >
	   		<a href="{{ url('inscription?return='.$return) }}" class="tips" title="{{ Lang::get('core.btn_back') }}"><i class="fa  fa-arrow-left"></i></a>
			@if($access['is_add'] ==1)
	   		<a href="{{ url('inscription/update/'.$id.'?return='.$return) }}" class="tips " title="{{ Lang::get('core.btn_edit') }}"><i class="fa  fa-pencil"></i></a>
			@endif 
					
		</div>	

		<div class="sbox-tools " >
			<a href="{{ ($prevnext['prev'] != '' ? url('inscription/show/'.$prevnext['prev'].'?return='.$return ) : '#') }}" class="tips "><i class="fa fa-arrow-left"></i>  </a>	
			<a href="{{ ($prevnext['next'] != '' ? url('inscription/show/'.$prevnext['next'].'?return='.$return ) : '#') }}" class="tips"> <i class="fa fa-arrow-right"></i>  </a>
			@if(Session::get('gid') ==1)
				<a href="{{ URL::to('sximo/module/config/'.$pageModule) }}" class="tips" title=" {{ Lang::get('core.btn_config') }}" ><i class="fa  fa-ellipsis-v"></i></a>
			@endif 			
		</div>


	</div>
	<div class="sbox-content" > 	

		<table class="table table-striped table-bordered" >
			<tbody>	
		
					<tr>
						<td width='30%' class='label-view text-right'>Player</td>
						<td>{{ SiteHelpers::formatLookUp($row->joueur_id,'joueur_id','1:fb_joueurs:joueur_id:premon|nom') }} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Game</td>
						<td>{{ SiteHelpers::formatLookUp($row->partie_id,'partie_id','1:fb_partie:partie_id:debut') }} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Team</td>
						<td>{{ SiteHelpers::formatLookUp($row->equipe_id,'equipe_id','1:fb_equipes:equipe_id:nom') }} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>Sensor</td>
						<td>{{ SiteHelpers::formatLookUp($row->capteur_id,'capteur_id','1:fb_capteurs:capteur_id:code') }} </td>
						
					</tr>
				
			</tbody>	
		</table>   

	 
	
	</div>
</div>	

	</div>
</div>
	  
@stop