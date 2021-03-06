@extends('layouts.app')
@section('content')
{{--*/ usort($tableGrid, "SiteHelpers::_sort") /*--}}
<div class="page-content row">
<div class="page-content-wrapper m-t">
<div class="sbox">
<div class="sbox-title">
<div class="sbox-tools pull-left" >
@if($access['is_add'] ==1)
<a href="{{ URL::to('sessionmesure/update?return='.$return) }}"
class="tips"  title="{{ Lang::get('core.btn_create') }}">
<i class="fa  fa-plus "></i> Créer</a>
@endif
@if($access['is_remove'] ==1)
<a href="javascript://ajax"  onclick="SximoDelete();" class="tips"
title="Supprimer les lignes cochées">
<i class="fa fa-trash-o"></i> Supprimer</a>
@endif
<a href="{{ URL::to( 'sessionmesure/search?return='.$return) }}"
class="tips"
onclick="SximoModal(this.href,'Advance Search'); return false;"               title="{{ Lang::get('core.btn_search') }}">
<i class="fa fa-search"> Rechercher</i> </a>
@if($access['is_excel'] ==1)
<a href="{{ URL::to('sessionmesure/download?return='.$return) }}" class="tips " title="{{ Lang::get('core.btn_download') }}">
<i class="fa fa-cloud-download"></i> Télécharger</a>
@endif
<a href="{{ url($pageModule) }}"
class=" tips"
title="{{ Lang::get('core.btn_clearsearch') }}" >
<i class="fa fa-spinner"> Tout Afficher</i>
</a>
</div>
<div class="sbox-tools" >
@if(Session::get('gid') ==1)
<a href="{{ URL::to('sximo/module/config/'.$pageModule) }}" class="tips" title=" {{ Lang::get('core.btn_config') }}" ><i class="fa  fa-ellipsis-v"></i></a>
@endif
</div>
</div>
<div class="sbox-content">
{!! (isset($search_map) ? $search_map : '') !!}
{!! Form::open(array('url'=>'sessionmesure/delete/0?return='.$return, 'class'=>'form-horizontal' ,'id' =>'SximoTable' )) !!}
<div class="table-responsive" style="min-height:300px;">
<table class="table table-striped ">
<thead>
<tr>
<th class="number"><span> No </span> </th>
<th> <input type="checkbox" class="checkall" /></th>
@foreach ($tableGrid as $t)
@if($t['view'] =='1')
<?php $limited = isset($t['limited']) ? $t['limited'] :''; ?>
@if(SiteHelpers::filterColumn($limited ))
<th><span>{{ $t['label'] }}</span></th>
@endif
@endif
@endforeach
<th width="40%"><span>{{ Lang::get('core.btn_action') }}</span></th>
</tr>
</thead>
<tbody>
@foreach ($rowData as $row)
<tr>
<td width="30"> {{ ++$i }} </td>
<td width="50"><input type="checkbox" class="ids" name="ids[]" value="{{ $row->session_mesure_id }}" />  </td>
@foreach ($tableGrid as $field)
@if($field['view'] =='1')
<?php $limited = isset($field['limited']) ? $field['limited'] :''; ?>
@if(SiteHelpers::filterColumn($limited ))
<td>
{!! SiteHelpers::formatRows($row->{$field['field']},$field ,$row ) !!}
</td>
@endif
@endif
@endforeach
<td>
@if($access['is_detail'] ==1)
<a href="{{ URL::to('sessionmesure/show/'.$row->session_mesure_id.'?return='.$return)}}" class="tips btn btn-xs btn-primary" title="{{ Lang::get('core.btn_view') }}"><i class="fa  fa-search "></i></a>
@endif
@if($access['is_edit'] ==1)
<a  href="{{ URL::to('sessionmesure/update/'.$row->session_mesure_id.'?return='.$return) }}" class="tips btn btn-xs btn-success" title="{{ Lang::get('core.btn_edit') }}"><i class="fa fa-edit "></i></a>
@endif
</td>
</tr>
@endforeach
</tbody>
</table>
<input type="hidden" name="md" value="" />
</div>
{!! Form::close() !!}
@include('footer')
</div>
</div>
</div>
</div>
@stop
