<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script>
        window.Laravel = <?php echo json_encode(['csrfToken' => csrf_token(),]); ?>
    </script>
    <title>Statistique Joueurs</title>
    <link rel="stylesheet" href="/css/bootstrap.css">

    <link href="/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="/css/material-design-iconic-font.min.css" rel="stylesheet" type="text/css"/>

    @yield('style')
</head>
<body class="fixed-left widescreen">
<div id="wrapper">
    @include('topbar')
    <div class="content-page">
        <!-- Start content -->
        <div class="content">
            <div class="container">
                @yield('content')
            </div>
        </div>

    </div>
</div>
<script src="/js/jquery.min.js"></script>
<script src="/js/jquery-ui.js"></script>
<script src="/js/bootstrap.js"></script>
<script src="/js/Chart.min.js"></script>
@yield('jquery')
</body>
</html>