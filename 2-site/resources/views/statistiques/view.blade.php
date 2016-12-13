@extends('layouts.app')

@section('content')
    <!--Statistics view-->

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.min.js"></script>
    <div class="page-content row">
        <!-- Page header -->
        <div class="page-content-wrapper m-t">
            <div class="sbox ">
                <div class="sbox-title">
                    <div class="sbox-tools pull-left">
                        <a href="{{ url('statistiques?return='.$return) }}" class="tips" title="{{ Lang::get('core.btn_back') }}"><i class="fa  fa-arrow-left"></i> Retour à la liste</a>
                        @if($access['is_add'] ==1)
                            <a href="{{ url('statistiques/update/'.$id.'?return='.$return) }}" class="tips " title="{{ Lang::get('core.btn_edit') }}"><i class="fa  fa-pencil"></i> Modifier</a>
                        @endif
                    </div>

                    <div class="sbox-tools ">
                        <a href="{{ ($prevnext['prev'] != '' ? url('statistiques/show/'.$prevnext['prev'].'?return='.$return ) : '#') }}" class="tips "><i class="fa fa-arrow-left"></i> Partie
                            précédente </a>
                        <a href="{{ ($prevnext['next'] != '' ? url('statistiques/show/'.$prevnext['next'].'?return='.$return ) : '#') }}" class="tips">
                            <i class="fa fa-arrow-right"></i>
                            Partie suivante
                        </a>
                        @if(Session::get('gid') ==1)
                            <a href="{{ URL::to('sximo/module/config/'.$pageModule) }}" class="tips" title=" {{ Lang::get('core.btn_config') }}"><i class="fa  fa-ellipsis-v"></i></a>
                        @endif
                    </div>
                </div>
                <div class="sbox-content">
                    <center><img src="/uploads/images/bsa.png"></center>
                    <table class="table table-striped table-bordered">
                        <tbody>

                        <tr>
                            <td width='30%'
                                class='label-view text-right'>
                                Date et Heure Partie
                            </td>
                            <td>{{ date('d F Y à H:i',strtotime($row->date)) }} </td>

                        </tr>

                        <tr>
                            <td width='30%' class='label-view text-right'>Joueur</td>
                            <td>
                                <h2>
                                    {{ SiteHelpers::formatLookUp($row->joueur_id,
                                                                 'joueur_id',
                                                                 '1:fb_joueurs:joueur_id:premon|nom')
                                    }}
                                </h2>
                            </td>

                        </tr>

                        </tbody>
                    </table>
                    <table class="table  table-bordered">
                        <tr>
                            <td>
                                <img src="/uploads/images/statistiques/distance.png"
                                     style="float:left;width:100px;height:100px;">
                                <h3>Distance parcourue<br>
                                    <font color="#ffcc00">
                                        <strong>
                                            {{  $statistiques['Dist'] }}
                                            km</strong>
                                    </font>
                                </h3>
                            </td>
                            <td>
                                <img src="/uploads/images/statistiques/duree.png"
                                     style="float:left;width:100px;height:100px;">
                                <h3>Durée de la partie<br>
                                    <font color="#ff9900">
                                        <strong>
                                            {{  $statistiques['duree'] }}
                                        </strong>
                                    </font>
                                </h3>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="/uploads/images/statistiques/ballons.png"
                                     style="float:left;width:100px;height:100px;">
                                <h3>Ballons joués<br>
                                    <font color="#3399ff">
                                        {{  $statistiques['ballons_joues'] }}
                                    </font>
                                </h3>
                            </td>
                            <td>
                                <img src="/uploads/images/statistiques/vitesse.png"
                                     style="float:left;width:100px;height:100px;">
                                <h3>Vitesse maximale<br>
                                    <font color="#e60000">
                                        {{  $statistiques['vitesse_maximale'] }}
                                        km/h
                                    </font>
                                </h3>
                            </td>
                        </tr>
                    </table>
                    <canvas id="myChart"></canvas>
                    <script>
                        var ctx = document.getElementById('myChart').getContext('2d');
                        var myChart = new Chart(
                                ctx,
                                {
                                    type: 'line',
                                    data: {
                                        datasets: [{
                                            label: 'Vitesse',
                                            data:
                                            [
                                                {{ $statistiques['vitesses']  }}
                                            ]
                                        }]
                                    },
                                    options: {
                                        scales: {
                                            xAxes: [{
                                                type: 'linear',
                                                position: 'bottom'
                                            }]
                                        }
                                    }
                                });
                    </script>
                </div>
            </div>

        </div>
    </div>

@stop