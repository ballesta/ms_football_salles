@extends('layouts.app')

@section('content')
    <div class="row col-md-12 content-row">
        <div class="clearfix"></div>
        <br>
        <div class="col-md-12">
            <div class="col-md-4">
            </div>
            <div class="col-md-4">
                <div class="hexagon">
                    <div class="hexTop"></div>
                    <div class="hexBottom"></div>
                </div>
            </div>
            <div class="col-md-4">
            </div>
        </div>
        <div class="col-md-12 row-1">
            <div class="col-md-4">
            </div>
            <div class="col-md-5 pull-left">
                <div class="text-muted info"><span>{{$stats->nom}}</span></div>
            </div>
            <div class="col-md-3 pull-right">
                <div class="text-muted info"><span>Rang: </span><label>{{$stats->rang}}</label></div>
            </div>
        </div>
        <div class="clearfix"></div>
        <br>
        <hr class="m-t-10">
        <div class="col-md-12">
            <div class="col-md-5">
                <h4><label class="text-primary">Date :</label> <label class="text-muted">{{$stats->date}}</label></h4>
            </div>
            <div class="col-md-4">
                <h4><label class="text-primary">Durée :</label> <label class="text-muted">{{$stats->durée}} min</label>
                </h4>
            </div>
            <div class="col-md-3">
                <h4><label class="text-primary">Equipe :</label>
                    <label class="text-muted">{{$stats->equipe}}</label>
                </h4>
            </div>
        </div>
        <div class="clearfix"></div>
        <br>

        <div class="col-md-12">
            <div class="col-md-3">
            </div>
            <div class="col-md-3 stats-col">
                <span class="stats_number"><strong>{{$stats->distance}} <label class="text-muted"><h4>M</h4></label></strong></span><br>
                <img src="/img/distance.svg"><label class="text-muted"><h4>Distance</h4></label>
            </div>
            <div class="col-md-3 stats-col">
                <span class="stats_number"><strong>{{$stats->rythme}} <label class="text-muted"><h4>/KM</h4></label></strong></span><br>
                <img src="/img/rythme.svg"> <label class="text-muted"><h4>Rythme</h4></label>
            </div>
            <div class="col-md-3 stats-col">
                <span class="stats_number"><strong>{{$stats->acitvite}} <label class="text-muted"><h4>%</h4></label></strong></span><br>
                <img src="/img/chronometer.svg"> <label class="text-muted"><h4>Activite</h4></label>
            </div>
        </div>
        <div class="clearfix"></div>
        <br>

        <div class="col-md-12">
            <div class="col-md-3 stats-col">
                <span class="stats_number"><strong>{{$stats->courses}}</strong></span><br>
                <img src="/img/course.svg"><label class="text-muted"><h4>Courses</h4></label>
            </div>
            <div class="col-md-3 stats-col">
                <span class="stats_number"><strong>{{$stats->sprints}}</strong></span><br>
                <img src="/img/sprint.svg"> <label class="text-muted"><h4>Sprints</h4></label>
            </div>
            <div class="col-md-3 stats-col">
                <span class="stats_number"><strong>{{$stats->vitesseMax}} <label class="text-muted"><h4>KM/H</h4></label></strong></span><br>
                <img src="/img/vitesse_max.svg"> <label class="text-muted"><h4>Vitesse Max</h4></label>
            </div>
            <div class="col-md-3 stats-col">
                <span class="stats_number"><strong>{{$stats->explosivite}} <label class="text-muted"><h4>KM/H</h4></label></strong></span><br>
                <img src="/img/explosivité.svg"><label class="text-muted"><h4>Explosivite</h4></label>
            </div>
        </div>
        <div class="clearfix"></div>
        <br>

        <div class="col-md-12">
            <div class="col-md-3 stats-col">
                <span class="stats_number"><strong>{{$stats->ballonsJoues}}</strong></span><br>
                <img src="/img/ballons_joues.svg"> <label class="text-muted"><h4>Ballons Joues</h4></label>
            </div>
            <div class="col-md-3 stats-col">
                <span class="stats_number"><strong>{{$stats->passes}}</strong></span><br>
                <img src="/img/passes.svg"> <label class="text-muted"><h4>Passes</h4></label>
            </div>
            <div class="col-md-3 stats-col">
                <span class="stats_number"><strong>{{$stats->tirs}}</strong></span><br>
                <img src="/img/Tirs.svg"> <label class="text-muted"><h4>Tirs</h4></label>
            </div>
            <div class="col-md-3 stats-col">
                <div class="progress">
                    <div class="progress-bar progress-bar-warning" aria-valuemin="0" aria-valuemax="100" style="width: {{$stats->puissancemax}}%;">{{$stats->puissancemax}}%</div>
                </div>
                <br>
                <img src="/img/Puissance_max.svg"> <label class="text-muted"><h4>Puissance Max</h4></label>
            </div>
        </div>
        <div class="clearfix"></div>
        <br>
        <div class="col-md-12">
            <div class="canvas-holder">
                <canvas id="stats-chart" ></canvas>
                <br>
            </div>
        </div>
        <div class="clearfix"></div>
        <br>
    </div>

    <style type="text/css">
        hr {
            border-top: 1px solid #000;
        }

        .row-1 .info span {
            font-size: 30px;
            margin-top: 20px;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .row-1 .info label {
            font-size: 20px;
        }

        .stats_number {
            font-size: 45px;
            color: #000;
        }

        .stats-col {
            text-transform: uppercase;
        }

        .stats-col img {
            width: 50px;
            height: 50px;
            vertical-align: top;
        }

        .row-1 .info {
            text-transform: uppercase;
        }

        .progress {
            height: 30px;
            margin-bottom: 5px;
            margin-top: 20px;
        }

        .progress .progress-bar {
            line-height: 30px;
        }

        /******http://csshexagon.com/ ******/
        /**Image css***/
        .hexagon {
            position: relative;
            width: 180px;
            height: 103.92px;
            margin: 51.96px 0;
            margin-left: 50px;
            background-image: url(/img/players/{{$stats->photo}});
            background-size: auto 200.9179px;
            background-position: center;
            box-shadow: 0 0 95px rgba(0, 0, 0, 0.7);
            border-left: solid 3px #333333;
            border-right: solid 3px #333333;
        }

        .hexTop,
        .hexBottom {
            position: absolute;
            z-index: 1;
            width: 127.28px;
            height: 127.28px;
            overflow: hidden;
            -webkit-transform: scaleY(0.5774) rotate(-45deg);
            -ms-transform: scaleY(0.5774) rotate(-45deg);
            transform: scaleY(0.5774) rotate(-45deg);
            background: inherit;
            left: 23.36px;
            box-shadow: 0 0 95px rgba(0, 0, 0, 1);
        }

        /*counter transform the bg image on the caps*/
        .hexTop:after,
        .hexBottom:after {
            content: "";
            position: absolute;
            width: 174.0000px;
            height: 100.45894683899489px;
            -webkit-transform: rotate(45deg) scaleY(1.7321) translateY(-50.2295px);
            -ms-transform: rotate(45deg) scaleY(1.7321) translateY(-50.2295px);
            transform: rotate(45deg) scaleY(1.7321) translateY(-50.2295px);
            -webkit-transform-origin: 0 0;
            -ms-transform-origin: 0 0;
            transform-origin: 0 0;
            background: inherit;
        }

        .hexTop {
            top: -63.6396px;
            border-top: solid 4.2426px #333333;
            border-right: solid 4.2426px #333333;
        }

        .hexTop:after {
            background-position: center top;
        }

        .hexBottom {
            bottom: -63.6396px;
            border-bottom: solid 4.2426px #333333;
            border-left: solid 4.2426px #333333;
        }

        .hexBottom:after {
            background-position: center bottom;
        }

        .hexagon:after {
            content: "";
            position: absolute;
            top: 1.7321px;
            left: 0;
            width: 174.0000px;
            height: 100.4589px;
            z-index: 2;
            background: inherit;
        }
    </style>
    <script src="/frontend/default/plugins/chart/js/Chart.min.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {

            var $data1 = <?php echo $list = isset($stats->marcheCourseLente) ? json_encode($stats->marcheCourseLente) : json_encode(array());?>;

            var $data2 = <?php echo $list = isset($stats->Course) ? json_encode($stats->Course) : json_encode(array());?>;

            var $data3 = <?php echo $list = isset($stats->CourseHauteIntensite) ? json_encode($stats->CourseHauteIntensite) : json_encode(array());?>;

            var data = {
                labels: ["5", "10", "15", "20", "25", "30", "35", "40", "45", "50", "55", "60", "65", "70", "75", "80", "85", "90"],
                datasets: [
                    {
                        label: "Marche/Course lente",
                        backgroundColor: '#bcbcbc',
                        data: $data1
                    },
                    {
                        label: "Course",
                        backgroundColor: 'orange',
                        data: $data2
                    },
                    {
                        label: "Course à haute intensité",
                        backgroundColor: '#ef5350',
                        data: $data3
                    }
                ]
            };

            new Chart($("#stats-chart"), {
                type: "bar",
                data: data,
                options: {
                    scales: {
                        xAxes: [{
                            stacked: true,
                        }],
                        yAxes: [{
                            stacked: true,
                        }]
                    }

                }
            });

        });

    </script>
@stop