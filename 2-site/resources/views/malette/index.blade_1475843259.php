@extends('layouts.app')
@section('content')
{{--*/ usort($tableGrid, "SiteHelpers::_sort") /*--}}
<div class="page-content row">
<div class="page-content-wrapper m-t">
<div class="sbox">
<div class="sbox-title"> <h3> {{ $pageTitle }} <small>{{ $pageNote }}</small></h3>
<div class="sbox-tools" >
<a href="{{ url($pageModule) }}" class="btn btn-xs btn-white tips"  title="{{ Lang::get('core.btn_clearsearch') }}" ><i class="fa fa-trash-o"></i> {{ Lang::get('core.btn_clearsearch') }} </a>
@if(Session::get('gid') ==1)
<a href="{{ URL::to('sximo/module/config/'.$pageModule) }}" class="btn btn-xs btn-white tips" title=" {{ Lang::get('core.btn_config') }}" ><i class="fa fa-cog"></i></a>
@endif
</div>
</div>
<div class="sbox-content">
<div class="toolbar-line ">
@if($access['is_add'] ==1)
<a href="{{ URL::to('malette/update') }}" class="tips btn btn-sm btn-white"  title="{{ Lang::get('core.btn_create') }}">
<i class="icon-plus-circle2 "></i>&nbsp;{{ Lang::get('core.btn_create') }}</a>
@endif
@if($access['is_remove'] ==1)
<a href="javascript://ajax"  onclick="SximoDelete();" class="tips btn btn-sm btn-white" title="{{ Lang::get('core.btn_remove') }}">
<i class="icon-remove4"></i>&nbsp;{{ Lang::get('core.btn_remove') }}</a>
@endif
<a href="{{ URL::to( 'malette/search') }}" class="btn btn-sm btn-white" onclick="SximoModal(this.href,'Advance Search'); return false;" title="{{ Lang::get('core.btn_search') }}"><i class="icon-search3"></i> {{ Lang::get('core.btn_search') }} </a>
@if($access['is_excel'] ==1)
<a href="{{ URL::to('malette/download?return='.$return) }}" class="tips btn btn-sm btn-white" title="{{ Lang::get('core.btn_download') }}">
<i class="icon-file-download"></i>&nbsp;{{ Lang::get('core.btn_download') }} </a>
@endif
</div>
{!! (isset($search_map) ? $search_map : '') !!}
{!! Form::open(array('url'=>'malette/delete/', 'class'=>'form-horizontal' ,'id' =>'SximoTable' )) !!}
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
<th width="330" ><span>{{ Lang::get('core.btn_action') }}</span></th>
</tr>
</thead>
<tbody>
@foreach ($rowData as $row)
<tr>
<td width="30"> {{ ++$i }} </td>
<td width="50"><input type="checkbox" class="ids" name="ids[]" value="{{ $row->malette_capteurs_id }}" />  </td>
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
{!!
    \Navigation::link_to_detail(
    $text      = 'Capteurs',
    $help      = '',
    $url       = URL::to('capteur'),
    $parent_key= 'malette_capteurs_id',
    $parent_id = $row->malette_capteurs_id)
!!}
{!!
    \Navigation::link_to_detail(
    $text      = 'Capteurs',
    $help      = '',
    $url       = URL::to('capteur'),
    $parent_key= 'malette_capteurs_id',
    $parent_id = $row->malette_capteurs_id)
!!}
@if($access['is_detail'] ==1)
<a href="{{ URL::to('malette/show/'.$row->malette_capteurs_id.'?return='.$return)}}" class="tips btn btn-xs btn-primary" title="{{ Lang::get('core.btn_view') }}"><i class="fa  fa-search "></i></a>
@endif
@if($access['is_edit'] ==1)
<a  href="{{ URL::to('malette/update/'.$row->malette_capteurs_id.'?return='.$return) }}" class="tips btn btn-xs btn-success" title="{{ Lang::get('core.btn_edit') }}"><i class="fa fa-edit "></i></a>
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
<script>
$(document).ready(function(){
    $('.do-quick-search').click(function(){
    $('#SximoTable').attr('action','{{ URL::to("malette/multisearch")}}');
        $('#SximoTable').submit();
    });
    
});
</script>
@stop
