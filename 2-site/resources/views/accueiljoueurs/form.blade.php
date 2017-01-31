@extends('layouts.app')

@section('head')
    <!-- Step Form Wizard plugin -->
    <link rel="stylesheet"
          href="{{ URL::asset('assets/step-form/step-form-wizard/css/step-form-wizard-all.css') }}" />

    <script type="text/javascript"
            src="{{ URL::asset('assets/step-form/step-form-wizard/js/step-form-wizard.js') }}">
    </script>

    <!-- nicer scroll in steps -->
    <link rel="stylesheet"
          href="{{ URL::asset('assets/step-form/plugins/mcustom-scrollbar/jquery.mCustomScrollbar.min.css') }}" />


    <script type="text/javascript"
            src="{{ URL::asset('assets/step-form/plugins/mcustom-scrollbar/jquery.mCustomScrollbar.concat.min.js') }}">
    </script>

    <!-- validation library http://parsleyjs.org/ -->
    <link rel="stylesheet"
          href="{{ URL::asset('assets/step-form/plugins/parsley/parsley.css') }}" />
    <script type="text/javascript"
            src="{{ URL::asset('assets/step-form/plugins/parsley/parsley.min.js') }}" >
    </script>

    <!-- French translation of messages -->
    <script type="text/javascript"
            src="{{ URL::asset('assets/step-form/plugins/parsley/i18n/fr.js') }}">
    </script>


    <style>
        pre {
            margin: 45px 0 60px;
        }

        h1 {
            margin: 60px 0 60px 0;
        }

        p {
            margin-bottom: 10px;
        }
    </style>
    <script>
        // Initialisation après chargement de la page
        $(document).ready(function () {
                // En français
                Parsley.setLocale('fr');

                sfw = $("#inscription").stepFormWizard({
                        transition: 'fade',
                        showNav: 'left',
                        //duration: 1000,
                        height: '500px',
                        nextBtn:
                            $('<a class="next-btn sf-right sf-btn" ' +
                               'href="#">Suivant</a>'),
                        prevBtn:
                            $('<a class="prev-btn sf-left sf-btn" ' +
                              'href="#">Précédent</a>'),
                        finishBtn:
                            $('<a class="finish-btn sf-right sf-btn" ' +
                              'href="#">Terminer</a>'),
                        showNav: 'left',
                        //theme: 'sun',
                        // Bouton suivant pour tous les panneaux.
                        // i = N° du panneau qui demande de passer au suivant.
                        onNext: function (i) {
                            var valid = null;
                            if (i == 0)
                            {
                                // Panneau 1: joueur
                                // Remis à null après l'échec de la validation: pour quelle raison?
                                if ($('#joueur_id').val() >=1 )
                                {
                                    // Raz des champs de création d'un nouveau joueur
                                    $("#nom"      ).val("");
                                    $("#prenom"   ).val("");
                                    $("#email"    ).val("");
                                    $("#telephone").val("");
                                    $("#mdp1"     ).val("");
                                    $("#mdp2"     ).val("");
                                    valid = true;
                                }
                                else
                                {
                                    // Joueur non sélectionné: création nouveau joueur
                                    // Valider les champs (nom, prénom, ...)
                                    valid = $("#inscription").parsley().validate('block' + i);
                                }
                            }
                            else
                            {
                                // Panneaux 2, 3, ... suivants
                                valid = $("#inscription").parsley().validate('block' + i);
                            }
                            // La validation peut changer l'affichage en ajoutant des messages d'erreur.
                            // Ré afficher le panneau pour prendre en compte.
                            sfw.refresh();
                            return valid;
                        },
                        // Validation particulière au bouton de fin sur le dernier panneau.
                        onFinish: function (i) {
                            // Validation du dernier panneau
                            valid = $("#inscription").parsley().validate("block" + i);
                            sfw.refresh();
                            // Debrayer les vérifications de Parseley,
                            // sinon ca bloque l'envoi du formulaire!
                            // La raison est surement une dernière vérification globale
                            // faite par Parseley avant d'envoyer.
                            // Laquelle est bloquée par le fait que les champs de création du joueur
                            // ne sont pas renseignés.
                            $('#inscription').parsley().destroy();
                            return valid;
                        },
                    }
                );
                $("#joueur_id").jCombo
                (
                    "{!! url('joueur/comboselect?filter=fb_joueurs:joueur_id:premon|nom') !!}",
                    {  selected_value : '{{ $row["joueur_id"] }}' }
                );

                // Calcule l'heure courante pour la proposer comme heure de début de partie
                var date = new Date();
                var heure_debut = date.getHours();
            }
        )
        ;
        $(window).load(function () {
            /* Use mcustom scrollbar */
            $(".sf-step").mCustomScrollbar({
                theme: "dark-3",
                scrollButtons: {
                    enable: true
                }
            });
        });

    </script>

@endsection

@section('content')
    <div class="page-content row">
        <!-- Page header -->
        <!--
        Formulaire d'accueil dérivé de step form
        Prototype hors Laravel:
            1-vendors/step-form/step-form-wizard/01-basic-football.html
        -->
        @include('accueiljoueurs.inscription')
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
                // alert('debut');
                Parsley.setLocale('fr');
                sfw = $("#inscription").stepFormWizard({
                        transition: 'fade',
                        //duration: 1000,
                        height: 'auto',
                        nextBtn: $('<a class="next-btn sf-right sf-btn" href="#">Suivant</a>'),
                        prevBtn: $('<a class="prev-btn sf-left sf-btn" href="#">Précédent</a>'),
                        finishBtn: $('<a class="finish-btn sf-right sf-btn" href="#">Terminer</a>'),
                        showNav: 'left',
                        //theme: 'sun',
                        // Bouton suivant pour tous les panneaux.
                        // i = N° du panneau qui demande de passer au suivant.
                        onNext: function (i) {
                            var valid = null;
                            if (i == 0) {
                                // Panneau 1: joueur
                                // Remis à null après l'échec de la validation: pour quelle raison?
                                if ($('#joueur').val() >= 1) {
                                    // Raz des champs de création d'un nouveau joueur
                                    $("#nom").val("");
                                    $("#prenom").val("");
                                    $("#email").val("");
                                    $("#telephone").val("");
                                    $("#mdp1").val("");
                                    $("#mdp2").val("");
                                    valid = true;
                                }
                                else {
                                    // Joueur non sélectionné: création nouveau joueur
                                    // Valider les champs (nom, prénom, ...)
                                    valid = $("#inscription").parsley().validate('block' + i);
                                }
                            }
                            else {
                                // Panneaux 2, 3, ... suivants
                                valid = $("#inscription").parsley().validate('block' + i);
                            }
                            // La validation peut changer l'affichage en ajoutant des messages d'erreur.
                            // Ré afficher le panneau pour prendre en compte.
                            sfw.refresh();
                            return valid;
                        },
                        // Validation particulière au bouton de fin sur le dernier panneau.
                        onFinish: function (i) {
                            //    // Validation du dernier panneau
                            valid = $("#inscription").parsley().validate("block" + i);
                            sfw.refresh();
                            // Debrayer les vérifications de Parseley,
                            // sinon ca bloque l'envoi du formulaire!
                            // La raison est surement une dernière vérification globale
                            // faite par Parseley avant d'envoyer.
                            // Laquelle est bloquée par le fait que les champs de création du joueur
                            // ne sont pas renseignés.
                            $('#inscription').parsley().destroy();
                            return valid;
                        },
                    }
                );

                // Calcule l'heure courante pour la proposer comme heure de début de partie
                var date = new Date();
                var heure_debut = date.getHours();

        ;
        $(window).load(function () {
            /* Use mcustom scrollbar */
            $(".sf-step").mCustomScrollbar({
                theme: "dark-3",
                scrollButtons: {
                    enable: true
                }
            });
        });

        $("#joueur_id").jCombo(
            "{!! url('accueiljoueurs/comboselect?filter=fb_joueurs:joueur_id:premon|nom') !!}",
            {selected_value: '{{ $row["joueur_id"] }}'});

        $("#terrain_id").jCombo(
            "{!! url('accueiljoueurs/comboselect?filter=fbs_salles:salle_id:identifiant') !!}",
            {selected_value: '{{ $row["terrain_id"] }}'});

        $("#capteur_id").jCombo(
            "{!! url('accueiljoueurs/comboselect?filter=fb_capteurs:capteur_id:numero_serie') !!}",
            {selected_value: '{{ $row["capteur_id"] }}'})
    }
)
    </script>
@stop