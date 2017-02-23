@extends('layouts.app')

@section('content')
<div class="page-content row">
	 
	 
 	<div class="page-content-wrapper m-t">   

<div class="sbox "> 
	<div class="sbox-title"> 

	 <h3> {{ $pageTitle }} <small>{{ $pageNote }}</small></h3>

	 	<div class="sbox-tools">
	   		<a href="{{ URL::to('accueiljoueurs?return='.$return) }}" class="tips btn btn-xs btn-white pull-right" title="{{ Lang::get('core.btn_back') }}"><i class="fa fa-arrow-circle-left"></i>&nbsp;{{ Lang::get('core.btn_back') }}</a>
			
			@if($access['is_add'] ==1)
	   		<a href="{{ URL::to('accueiljoueurs/update/'.$id.'?return='.$return) }}" class="tips btn btn-xs btn-white pull-right" title="{{ Lang::get('core.btn_edit') }}"><i class="fa fa-edit"></i>&nbsp;{{ Lang::get('core.btn_edit') }}</a>
			@endif 
		</div>
	</div>
	<div class="sbox-content" > 	

		<table class="table table-striped table-bordered" >
			<tbody>	
		
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Inscription Id', (isset($fields['inscription_id']['language'])? $fields['inscription_id']['language'] : array())) }}</td>
						<td>{{ $row->inscription_id}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Joueur Id', (isset($fields['joueur_id']['language'])? $fields['joueur_id']['language'] : array())) }}</td>
						<td>{{ SiteHelpers::formatLookUp($row->joueur_id,'joueur_id','1:fb_joueurs:joueur_id:premon|nom') }} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Partie Id', (isset($fields['partie_id']['language'])? $fields['partie_id']['language'] : array())) }}</td>
						<td>{{ SiteHelpers::formatLookUp($row->partie_id,'partie_id','1:fb_partie:partie_id:debut|duree') }} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Equipe A B', (isset($fields['equipe_a_b']['language'])? $fields['equipe_a_b']['language'] : array())) }}</td>
						<td>{{ $row->equipe_a_b}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Capteur Id', (isset($fields['capteur_id']['language'])? $fields['capteur_id']['language'] : array())) }}</td>
						<td>{{ SiteHelpers::formatLookUp($row->capteur_id,'capteur_id','1:fb_capteurs:capteur_id:code') }} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Gage', (isset($fields['gage']['language'])? $fields['gage']['language'] : array())) }}</td>
						<td>{{ $row->gage}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('Created By User Id', (isset($fields['created_by_user_id']['language'])? $fields['created_by_user_id']['language'] : array())) }}</td>
						<td>{{ $row->created_by_user_id}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('CreatedOn', (isset($fields['createdOn']['language'])? $fields['createdOn']['language'] : array())) }}</td>
						<td>{{ $row->createdOn}} </td>
						
					</tr>
				
					<tr>
						<td width='30%' class='label-view text-right'>{{ SiteHelpers::activeLang('UpdatedOn', (isset($fields['updatedOn']['language'])? $fields['updatedOn']['language'] : array())) }}</td>
						<td>{{ $row->updatedOn}} </td>
						
					</tr>
				
			</tbody>	
		</table>   
	
	</div>
</div>	

	</div>
</div>
	  
@stop