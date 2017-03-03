@extends('master')

@section('content')

<div class="row col-md-12">
<div class="clearfix"></div><br>
<div class="col-lg-12">
 <div class="col-lg-4">
 </div>
 <div class="col-lg-4">
 </div>
 <div class="col-lg-4">
 </div>
 </div>
 <div class="col-lg-12 row-1">
 <div class="col-lg-4">
 </div>
 <div class="col-lg-5">
	<div class="text-muted info upper"><span>Statistiques equipes</span></div>
 </div>
 <div class="col-lg-3 pull-right"></div>
 </div>
 <br>
 
 <div class="col-lg-12 row-2">
 <div class="col-lg-4">
 <h4><label class="text-primary">Date :</label> <label class="text-muted">{{$stats->date}}</label></h4>
 </div>
 <div class="col-lg-5">
 <h4>
 <label class="equipe-name">{{$stats->equipe}}</label>
 <label class="text-muted">VS</label>
 <label class="equipe-advairse">{{$stats->advairse}}</label>
 </h4>
 </div>
 <div class="col-lg-3">
 <h4><label class="text-primary">Durée :</label> <label class="text-muted">{{$stats->durée}} min</label>
 </h4>
 </div>
 </div>

 </div>
 <div class="clearfix"></div>
 <hr class="m-t-10">
<!--***************************Content*********************-->
                        <div class="row">
                            @foreach($stats->statistiques as $st)

                            <div class="col-lg-5 stats-col">
                                <div class="panel panel-color panel-{{$st['tables'][0]['color']}}">
                                    <div class="panel-heading"> 
                                        <h1 class="panel-title text-center">
                                        <img src="/img/{{$st['tables'][0]['icon']}}">  {{$st['tables'][0]['type']}}</h1> 
                                    </div> 
                                    <div class="panel-body">
                                     <div class="col-lg-12"> 
                                      <div class="col-lg-5">
                                      <?php $i=1;?>
                                      @foreach($st['tables'][0]['players'] as $name => $data)
                                      <?php $class = ($data['is_adv']==1)?" adv":"";?>
                                            <span class="player pl-left clearfix{{$class}}">
                                              <span class="text-muted num_1">{{$i}}</span> 
                                              {{$name}}
                                              </span>
                                              <?php 
                                              $i++;
                                              if($i == 7)
                                                break;
                                              ?>
                                              @endforeach
                                      </div>
                                      <div class="col-lg-1" style="padding-left: 0px;">
                                      <?php $i=1;?>
                                      @foreach($st['tables'][0]['players'] as $name => $data)
                                      <span class="pl-value clearfix">{{$data['value']}}</span>
                                      <?php 
                                          $i++;
                                          if($i == 7)
                                                break;
                                              ?>
                                      @endforeach
                                      </div>
                                      <div class="col-lg-5">
                                      <?php $i=1;?>
                                      @foreach($st['tables'][0]['players'] as $name => $data)
                                      <?php $class = ($data['is_adv']==1)?" adv":"";?>
                                          @if($i >6)
                                              <span class="player clearfix{{$class}}">
                                               <span class="text-muted num_2">{{$i}}</span> 
                                               {{$name}}
                                              </span>
                                              @endif
                                              <?php
                                              $i++; 
                                              if($i == 13)
                                                break;
                                              ?>
                                              @endforeach
                                      </div>
                                      <div class="col-lg-1">
                                      <?php $i=1;?>
                                      @foreach($st['tables'][0]['players'] as $name => $data)
                                        @if($i >6)
                                         <span class="pl-value clearfix">{{$data['value']}}</span>
                                        @endif
                                      <?php 
                                          $i++;
                                          if($i == 13)
                                                break;
                                              ?>
                                      @endforeach
                                      </div>
                                    </div>

                                    </div> 
                                </div>
                            </div>
                           <?php $cls = (isset($st['tables'][1]))?"":"-lg";
                                $cls_col = (isset($st['tables'][1]))?"col-lg-2":"col-lg-3";
                                 ?>
                            <div class="{{$cls_col}} text-center">
                                <h2><label class="text-{{$st['moy']['color']}} upper">{{$st['moy']['type']}}</label></h2>
                                <div class="clearfix"></div><br>
                                <span class="badge badge-cyan badge-custom{{$cls}} radius-left">{{$st['moy']['club']}}</span>
                                <span class="badge badge-pink badge-custom{{$cls}} radius-right">{{$st['moy']['advairse']}}</span>
                            </div>

                           @if(isset($st['tables'][1]))
                            <div class="col-lg-5 stats-col">
                                <div class="panel panel-color panel-{{$st['tables'][1]['color']}}">
                                    <div class="panel-heading"> 
                                        <h1 class="panel-title text-center">
                                        <img src="/img/{{$st['tables'][1]['icon']}}">  {{$st['tables'][1]['type']}}</h1> 
                                    </div> 
                                    <div class="panel-body">
                                     <div class="col-lg-12"> 
                                      <div class="col-lg-5">
                                      <?php $i=1;?>
                                      @foreach($st['tables'][1]['players'] as $name => $data)
                                      <?php $class = ($data['is_adv']==1)?" adv":"";?>
                                            <span class="player pl-left clearfix{{$class}}">
                                              <span class="text-muted num_1">{{$i}}</span> 
                                              {{$name}}
                                              </span>
                                              <?php 
                                              $i++;
                                              if($i == 7)
                                                break;
                                              ?>
                                              @endforeach
                                      </div>
                                      <div class="col-lg-1" style="padding-left: 0px;">
                                      <?php $i=1;?>
                                      @foreach($st['tables'][1]['players'] as $name => $data)
                                      <span class="pl-value clearfix">{{$data['value']}}</span>
                                      <?php 
                                          $i++;
                                          if($i == 7)
                                                break;
                                              ?>
                                      @endforeach
                                      </div>
                                      <div class="col-lg-5">
                                      <?php $i=1;?>
                                      @foreach($st['tables'][1]['players'] as $name => $data)
                                      <?php $class = ($data['is_adv']==1)?" adv":"";?>
                                          @if($i >6)
                                              <span class="player clearfix{{$class}}">
                                               <span class="text-muted num_2">{{$i}}</span> 
                                               {{$name}}
                                              </span>
                                              @endif
                                              <?php
                                              $i++; 
                                              if($i == 13)
                                                break;
                                              ?>
                                              @endforeach
                                      </div>
                                      <div class="col-lg-1">
                                      <?php $i=1;?>
                                      @foreach($st['tables'][1]['players'] as $name => $data)
                                        @if($i >6)
                                         <span class="pl-value clearfix">{{$data['value']}}</span>
                                        @endif
                                      <?php 
                                          $i++;
                                          if($i == 13)
                                                break;
                                              ?>
                                      @endforeach
                                      </div>
                                    </div>

                                    </div> 
                                </div>
                            </div>
                            @endif
                            <div class="clearfix"></div><br>

                            @endforeach

                        </div><!--End row-->

@stop
@section('style')
<style type="text/css">
   hr {
   	border-top: 1px solid #000;
    margin-top : 0;
   }
   .equipe-name{
    color:#48cccd;
    font-size: 22px;
    letter-spacing: 2px;
   }
   .equipe-advairse{
    color:#f6358a;
    font-size: 22px;
    letter-spacing: 2px;
   }
    .stats-col img{
      width: 30px;
      height: 30px;
      vertical-align: text-bottom; ;
    }
   .row-1 .info span{
    color: #000;
   	font-size: 20px;
    letter-spacing: 2px;
    margin-left: 15px;
   	margin-top: 20px;
    margin-bottom: 10px;
    font-weight :bold;
    }
	.upper{
		 text-transform: uppercase;
	  }
    .row-2 label{
      font-size: 22px;
    }
    .badge-custom {
     width: 82px;
     font-size: 17px;
     font-weight: bold;
     float: left;
    }
    .badge-custom-lg{
    width: 130px;
    font-size: 20px;
    font-weight: bold;
    float: left;
    }
    .radius-right {
      border-radius: 0 10px 10px 0;
    }
    .radius-left {
        border-radius: 10px 0 0 10px;
    }
    .num_1 {
        margin-left: -47px;
    }
    .num_2 {
        margin-left: 2px;
    }
    .player {
        color: #48cccd;
        font-size: 13px;
        font-weight: bold;
        text-transform: uppercase;
        
    }
    .pl-left2 {
        float:left;
    }
    .pl-right {
        float: right;
    }
    .player.adv {
        color: #ec407a !important;
    }
    .pl-value {
        color: #000;
        font-size: 13px;
        font-weight: bold;
    }

</style>
@stop
@section("jquery")
        <script type="text/javascript">
        jQuery(document).ready(function($){
        	
        });

        	</script>
@stop