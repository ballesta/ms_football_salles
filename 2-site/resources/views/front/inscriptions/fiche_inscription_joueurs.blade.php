@extends('layouts.app')

@section('content')
    <link rel="stylesheet"
          type="text/css"
          href="/assets/smart-forms/css/smart-forms.css">
    <link rel="stylesheet"
          type="text/css"
          href="/assets/smart-forms/css/font-awesome.min.css">


    <script type="text/javascript"
            src="/assets/smart-forms/js/jquery-cloneya.min.js">
    </script>

    <!--[if lte IE 9]>
    <script type="text/javascript"
            src="/assets/smart-forms/js/jquery.placeholder.min.js">
    </script>
    <![endif]-->

    <!--[if lte IE 8]>
    <link type="text/css" rel="stylesheet"
          href="/assets/smart-forms/css/smart-forms-ie8.css">
    <![endif]-->

    <script type="text/javascript">
        $(function()
        {
            /* Simple Cloning
             ------------------------------------------------- */
            $('#clone-fields').cloneya();
        }
        );
    </script>
    <h1>
        Inscriptions et remise des capteurs.
    </h1>
    <h2>
        Salle: <strong>{{ $inscriptions_partie->partie->salle_nom }}</strong>
        &nbsp;&nbsp;&nbsp;
        Heure début: <strong>{{ $inscriptions_partie->partie->hh_mm }}</strong>
        &nbsp;&nbsp;&nbsp;&nbsp;
        Durée: <strong>{{ $inscriptions_partie->partie->duree }} </strong> minutes
    </h2>
    <div  class="smart-wrap">
        <div class="smart-forms ">
            <form method="post" action="inscriptions-remplie" id="account2">
                <div class="form-body">
                    <div class="spacer-b30">
                        <div class="tagline">
                            <span>Simple Cloning </span>
                            <?php CLASSE::test(); ?>
                        </div><!-- .tagline -->
                    </div>
                    <div id="clone-fields">
                        <div class="toclone clone-widget">
                            <div class="spacer-b10">
                                <label class="field">
                                    <input type="text" class="gui-input" name="address[]" id="address" placeholder="Nom joueur">
                                </label>
                            </div>
                            <a href="#"
                               class="clone button btn-primary">
                                <i class="fa fa-plus"></i>
                            </a>
                            <a href="#" class="delete button">
                                <i class="fa fa-minus"></i>
                            </a>
                        </div>
                    </div><!-- end #clone-fields -->
                </div><!-- end .form-body section -->
                <div class="form-footer">
                    <button type="submit" class="button btn-primary"> Send Form </button>
                </div><!-- end .form-footer section -->
            </form>

        </div><!-- end .smart-forms section -->
    </div><!-- end .smart-wrap section -->
@endsection

<?php
        class Classe
        {
        	static function test()
                {
                	echo "Test classe dand vue";
                }

        }
?>