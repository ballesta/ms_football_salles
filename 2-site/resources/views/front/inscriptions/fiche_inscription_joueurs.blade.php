@extends('layouts.app')

@section('content')

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <style>
        hr
        {
             margin-top: 10px;
             margin-bottom: 10px;
             border: 0;
             border-top: 1px solid #eee;
        }
    </style>


    <script type="text/javascript">
        $(function()
        {
            /* Simple Cloning
             ------------------------------------------------- */
            $('#joueurs').cloneya();
        }
        );
    </script>
    <h1>
        Sélectionnez les joueurs de la partie
    </h1>

    <div class="smart-wrap">
        <div class="smart-forms smart-container wrap-0">
            <form method="post"
                  action="inscription-remplie"
                  id="formulaire_inscriptions_remplie">
                <div class="form-body">
                    <div class="frm-row">
                        <div class="spacer-b10 colm colm3">
                        Salle<br>
                                <strong>
                                    {{$inscriptions_partie->partie->salle_nom}}
                                </strong>
                        </div>
                        <div class="spacer-b10 colm colm1">
                            Début<br>
                            <strong>{{$inscriptions_partie->partie->hh_mm}}</strong>
                        </div>
                        <div class="spacer-b10 colm colm2">
                            Durée<br>
                            <label class="field select">
                                <select id="access" name="partie_duree[]" value="01:00">
                                    <option value="00:30">00:30</option>
                                    <option value="01:00">01:00</option>
                                    <option value="01:30">01:30</option>
                                </select>
                                <i class="arrow simple"></i>
                            </label>
                        </div>
                        <div class="spacer-b10 colm colm3">
                            Equipe A<br>
                            <label class="field select">
                                <select id="access" name="equipe_id_a[]">
                                    <option value="0"></option>
                                    @foreach($inscriptions_partie->equipes as $e)
                                        <option value="{{$e->equipe_id}}">{{$e->nom}}</option>
                                    @endforeach
                                </select>
                                <i class="arrow simple"></i>
                            </label>
                        </div>
                        <div class="spacer-b10 colm colm3">
                            Equipe B<br>
                            <label class="field select">
                                <select id="access" name="equipes_id_b[]">
                                    <option value="0"></option>
                                    @foreach($inscriptions_partie->equipes as $e)
                                        <option value="{{$e->equipe_id}}">{{$e->nom}}</option>
                                    @endforeach
                                </select>
                                <i class="arrow simple"></i>
                            </label>
                        </div>
                    </div>
                    <hr>
                    <div class="toclone clone-widget">
                        <div class="frm-row">
                            <div class="spacer-b10 colm colm3"><strong>Nom joueur</strong></div>
                            <div class="spacer-b10 colm colm3"><strong>Mail joueur</strong></div>
                            <div class="spacer-b10 colm colm2"><strong>Latéralité</strong></div>
                            <div class="spacer-b10 colm colm2"><strong>Capteur</strong></div>
                            <div class="spacer-b10 colm colm2">
                                <strong>
                                    Equipe
                                </strong>
                            </div>
                        </div>
                    </div>
                    <hr>
                    {!! Formulaire::duplication_debut('joueurs') !!}
                        <div class="frm-row">
                            <div class="spacer-b5 colm colm3">
                                <label class="field select">
                                    <select  name="joueur_id[]">
                                        <option value="0"></option>
                                        @foreach($inscriptions_partie->joueurs as $j)
                                            <option value="{{$j->joueur_id}}">{{$j->nom}}</option>
                                        @endforeach
                                    </select>
                                    <i class="arrow simple"></i>
                                </label>
                            </div>
                            {!!  Formulaire::champ_texte(3, "joueur_mail[]", "Mail Joueur" )!!}
                            <div class="spacer-b5 colm colm2">
                                <label class="field select">
                                    <select  name="joueur_lateralite[]">
                                        <option value=""></option>
                                        <option value="Droitier">Droitier</option>
                                        <option value="Gaucher">Gaucher</option>
                                    </select>
                                    <i class="arrow simple"></i>
                                </label>
                            </div>
                            <div class="spacer-b5 colm colm2">
                                <label class="field select">
                                    <select  name="joueur_capteur_id[]">
                                        <option value="0"></option>
                                        @foreach($inscriptions_partie->capteurs as $c)
                                            <option value="{{$c->capteur_id}}">{{$c->code}}</option>
                                        @endforeach
                                    </select>
                                    <i class="arrow simple"></i>
                                </label>
                            </div>
                            <div class="spacer-b5 colm colm1">
                                <label class="field select">
                                    <select  name="joueur_equipe_id[]">
                                        <option value=""></option>
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                    </select>
                                    <i class="arrow simple"></i>
                                </label>
                            </div>
                        </div><!-- end row -->
                    {!! Formulaire::duplication_fin('joueurs')!!}


                </div><!-- end .form-body section -->
                <div class="form-footer">
                    <button type="submit"
                            class="button btn-primary">
                        Enregistrer les inscriptions à la partie
                    </button>
                </div><!-- end .form-footer section -->
            </form><!-- end form -->
        </div><!-- end .smart-forms section -->
    </div><!-- end .smart-wrap section -->

@endsection

<?php
    // ------------------- P H P -------------

    class Formulaire
    {
    	// Copie des Données de base de la vue
        public static $inscriptions_partie = null;

    	static function donnees($inscriptions_partie){
        	self::$inscriptions_partie = $inscriptions_partie;
        }

	    static function  form_debut($titre, $id_form, $action)
	    {
		    return <<<FIN
<div class="smart-wrap">
	<div class="smart-forms smart-container wrap-0">
        <form method="post"
                      action="$action"
                      id="$id_form">
            <div class="form-body">

FIN;
	    }
	    static function form_fin($texte_bouton)
	    {
		    return <<<FIN
            </div><!-- end .form-body section -->
            <div class="form-footer">
                <button type="submit"
                        class="button btn-primary">
                        $texte_bouton
                </button>
            </div><!-- end .form-footer section -->
        </form><!-- end form -->
    </div><!-- end .smart-forms section -->
</div><!-- end .smart-wrap section -->
FIN;
	    }


	    static function titre_section($t)
	    {
		    return <<<FIN
	<div class="spacer-b30 spacer-t30">
        <div class="tagline">
            <span>$t</span>
        </div><!-- tagline -->
    </div><!-- spacer -->
FIN;
	    }

	    static function duplication_debut($id)
	    {
		    return <<<FIN
<div id="$id">
    <div class="toclone clone-widget">
FIN;
	    }

	    static function champ_texte($colonnes, $id, $label )
	    {
		    $name = $id . '[]';
		    return <<<FIN
 <div class="spacer-b10 colm colm$colonnes">
    <label class="field">
        <input type="text" class="gui-input"
               name="$name"
               placeholder="$label">
    </label>
 </div><!-- end spacer -->
FIN;
	    }


	    static function duplication_fin()
	    {
		    return <<<FIN
        <a href="#"
           class="clone button btn-primary">
            <i class="fa fa-plus"></i>
        </a>
        <a href="#"
           class="delete button">
           <i class="fa fa-minus"></i>
        </a>
    </div><!-- to clone -->
</div><!-- id -->
FIN;
	    }

	    static function cree_joueurs()
	    {
		    //self::titre_section('Création rapide des joueurs et     inscription à  la partie');
		    self::duplication_debut('clone-cree-joueurs');
		    self::champ_texte(3,'prenoms_nouveaux_joueurs', 'Prénom' );
		    self::champ_texte(3,'noms_nouveaux_joueurs', 'Nom' );
		    self::champ_texte(4,'email_nouveaux_joueurs', 'eMail' );
		    self::duplication_fin();
	    }

	    static function terrain_partie($terrain, $heure_debut)
	    {
		    return <<<FIN
    <div class="spacer-b30 spacer-t30">
        <div class="tagline">
            <span>Terrain, heure de début la partie, équipes</span>
        </div><!-- .tagline -->
    </div>

    <div class="frm-row">
        <div class="spacer-b10 colm colm4">
           <h2><strong>$terrain</strong><h2>
        </div>
        <div class="spacer-b10 colm colm2">
           <h2><strong>$heure_debut</strong><h2>
        </div>
        <div class="spacer-b10 colm colm3">
            <label class="field select">
                <select id="access" name="equipe_a_partie[]">
                    <option value="">Equipe</option>
                    <option value="IBM">IBM</option>
                    <option value="EDF">EDF</option>
                    <option value="Lions">Les lions du 93</option>
                </select>
                <i class="arrow simple"></i>
            </label>
        </div>
        <div class="spacer-b10 colm colm3">
            <label class="field select">
                <select id="access" name="equipes_b_partie[]">
                    <option value="">Equipe</option>
                    <option value="IBM">IBM</option>
                    <option value="EDF">EDF</option>
                    <option value="LIONS">Les lions du 93</option>
                </select>
                <i class="arrow simple"></i>
            </label>
        </div>
    </div>

FIN;
	    }

	    static function joueurs_inscrits_partie()
	    {
		    return <<<FIN
    <div class="spacer-b30 spacer-t30">
        <div class="tagline">
            <span>Joueurs Incrits à la partie</span>
        </div><!-- .tagline -->
    </div>
    <div id="clone-group-fields">
        <div class="toclone clone-widget">
            <div class="frm-row">
                <div class="spacer-b10 colm colm6">
                    <label class="prepend-icon">
                        <input type="text" name="joueurs[]" id="users" class="gui-input" placeholder="Ajouter nouveau joueur">
                        <span class="field-icon">
                            <i class="fa fa-user"></i>
                        </span>
                    </label>
                </div>
                <div class="spacer-b10 colm colm2">
                    <label class="field select">
                        <select id="access" name="equipe_joueur[]">
                            <option value="">Equipe</option>
                            <option value="A">Equipe A</option>
                            <option value="B">B</option>
                        </select>
                        <i class="arrow simple"></i>
                    </label>
                </div>
            </div>
            <!-- end frm-row section -->
            <a href="#" class="clone button btn-primary"><i class="fa fa-plus"></i></a>
            <a href="#" class="delete button"><i class="fa fa-minus"></i></a>
        </div>
    </div>
    <!-- end #clone-group-fields -->
FIN;
	    }

	    // todo voir ou utilisé
	    static function heures()
	    {
		    $liste_heures = "";
		    for ($h = 8; $h<=23; $h++)
		    {
			    if ($h < 10)
				    $hm = "0" . $h;
			    else
				    $hm = $h;

			    $liste_heures .= "<option value=\"$hm:00\">$hm:00</option>";
			    $liste_heures .= "<option value=\"$hm:30\">$hm:30</option>";
		    }
		    return $liste_heures;
	    }

	    // Envoi du contenu html au navigateur.
	    // Le paramètre $html est en général composé en heredoc ("<<<FIN ... FIN")
	    // Relpplacé par un return direct.
	    // todo supprimer?
	    static function echo_html($html)
	    {
		    echo $html;
	    }
    }
?>
