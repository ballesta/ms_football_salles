@extends('layouts.app')

@section('content')
    <!--Statistics view-->

    <!-- back to top -->
    <style>
        #back-to-top {
            position: fixed;
            bottom: 60px;
            right: 40px;
            z-index: 9999;
            width: 42px;
            height: 42px;
            text-align: center;
            line-height: 40px;
            background: #f5f5f5;
            color: #444;
            cursor: pointer;
            border: 0;
            border-radius: 2px;
            text-decoration: none;
            transition: opacity 0.2s ease-out;
            opacity: 0;
        }
        #back-to-top:hover {
            background: #eeeeec;
        }
        #back-to-top.show {
            opacity: 1;
        }
    </style>
    <a href="#" id="back-to-top" title="Remonter en haut de page"><strong>&uarr;</strong></a>
    <script>
        if ($('#back-to-top').length) {
            var scrollTrigger = 100, // px
                backToTop = function () {
                    var scrollTop = $(window).scrollTop();
                    if (scrollTop > scrollTrigger) {
                        $('#back-to-top').addClass('show');
                    } else {
                        $('#back-to-top').removeClass('show');
                    }
                };
            backToTop();
            $(window).on('scroll', function () {
                backToTop();
            });
            $('#back-to-top').on('click', function (e) {
                e.preventDefault();
                $('html,body').animate({
                    scrollTop: 285
                }, 1000);
            });
        }
    </script>
    <!-- back to top end-->

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.1.4/Chart.min.js"></script>

    <div class="page-content row">
        <!-- Page header -->
        <div class="page-content-wrapper m-t">
            <div class="sbox ">
                <div class="sbox-title">
                    <div class="sbox-tools pull-left">
                        <a href="{{ url('inscription?return='.$return) }}" class="tips"
                           title="Retour à la liste des inscriptions des joueurs avec remise des capteurs"><i class="fa  fa-arrow-left"></i> Retour à la liste des inscriptions</a>
                    </div>

                    <div class="sbox-tools ">
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
                            <td>{{ date('d F Y à H:i',strtotime($row->heure_debut)) }} </td>

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
                                <h3>
                                    <a href="#Graphique_Distance_Parcourue">
                                        Distance parcourue
                                    </a>
                                    <br>
                                    <font color="#ffcc00">
                                        <strong>
                                            {{  $statistiques['Dist'] }}
                                            m</strong>
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
                                <h3> <a href="#Graphique_Vitesse">Vitesse maximale</a><br>
                                    <font color="#e60000">
                                        {{  $statistiques['vitesse_maximale'] }}
                                        km/h
                                    </font>
                                </h3>
                            </td>
                        </tr>
                    </table>
                    <canvas id="Graphique_Distance_Parcourue"></canvas>
                    <script>
                        var ctx_distance = document
                                         . getElementById('Graphique_Distance_Parcourue')
                                         . getContext('2d');
                        var myChartVitesse = new Chart(
                            ctx_distance,
                            {
                                type: 'line',
                                data: {
                                    datasets:
                                        [
                                            {
                                                label: 'Distance parcourue',
                                                fontColor: "DarkOrange",
                                                data:
                                                    [
                                                        {{ $statistiques['vitesses']  }}
                                                    ],
                                                backgroundColor: "DarkOrange",
                                                hoverBorderColor: "white",
                                            },
                                        ]
                                },
                                options: {
                                    scales: {
                                        xAxes: [{
                                            type: 'linear',
                                            position: 'bottom'
                                        }],
                                    },
                                    legend: {
                                        display: true,
                                        labels: {
                                            fontColor: 'Grey'
                                        }
                                    },
                                    title: {
                                        display: true,
                                        text: 'Performances'
                                    }
                                }
                            });
                    </script>
                    <canvas id="Graphique_Vitesse"></canvas>
                    <script>
                        var ctx_vitesse = document.getElementById('Graphique_Vitesse').getContext('2d');
                        var myChartVitesse = new Chart(
                            ctx_vitesse,
                            {
                                type: 'line',
                                data: {
                                    datasets:
                                        [
                                            {
                                                label: 'Vitesse',
                                                data:
                                                    [
                                                        {{ $statistiques['vitesses']  }}
                                                    ],
                                                backgroundColor: "Crimson"
                                            }
                                        ]
                                },
                                options: {
                                    scales: {
                                        xAxes: [{
                                            type: 'linear',
                                            position: 'bottom'
                                        }],
                                    },
                                    legend: {
                                        display: true,
                                        labels: {
                                            fontColor: 'Grey'
                                        }
                                    },
                                    title: {
                                        display: true,
                                        text: 'Performances: Vitesse instantanée'
                                    }
                                }
                            });
                    </script>

                    <canvas id="Graphique_Ballons_Joues"></canvas>
                    <script>
                        var ctx_ballons = document.getElementById('Graphique_Ballons_Joues').getContext('2d');
                        var myChartBallons = new Chart(
                            ctx_ballons,
                            {
                                type: 'line',
                                data: {
                                    datasets:
                                        [
                                            {
                                                label: 'Ballons joués',
                                                data:
                                                    [
                                                        {{ $statistiques['ballons']  }}
                                                    ],
                                                backgroundColor: "CornflowerBlue"
                                            }
                                        ]
                                },
                                options: {
                                    scales: {
                                        xAxes: [{
                                            type: 'linear',
                                            position: 'bottom'
                                        }],
                                    },
                                    legend: {
                                        display: true,
                                        labels: {
                                            fontColor: 'Grey'
                                        }
                                    },
                                    title: {
                                        display: true,
                                        text: 'Performances'
                                    }
                                }
                            });
                    </script>
                </div>
            </div>

        </div>
    </div>

@stop