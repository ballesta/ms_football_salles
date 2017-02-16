	{{
    Formulaire::form_debut
            (
                $titre   = "Inscription des joueurs",
                $id_form = "formulaire_inscriptions_remplie",
                $action  = "front/inscriptions-remplie");
    }}
	{{	Formulaire::cree_joueurs() }}
		//Formulaire::terrain_partie();
		//Formulaire::joueurs_inscrits_partie();
    {{ Formulaire::Form::form_fin($texte_bouton = "Crée les joueurs") }}

<?php
	// ------------------- P H P -------------

	class Formulaire
	{
		static function  form_debut($titre, $id_form, $action)
		{
			return <<<FIN
<div class="smart-wrap">
	<div class="smart-forms smart-container wrap-0">
		<div class="form-header header-primary">
			<h4><i class="fa fa-binoculars"></i>$titre</h4>
		</div><!-- end .form-header section -->
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
        <div class="frm-row">
        
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
               id="$id"  
               placeholder="$label">
    </label>
 </div><!-- end spacer -->
FIN;
    }


    static function duplication_fin()
    {
        return <<<FIN
        </div><!-- row -->
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
        selfself::titre_section('Création rapide des joueurs et     inscription à  la partie');
        self::duplication_debut('clone-cree-joueurs');
        self::champ_texte(3,'prenoms_nouveaux_joueurs', 'Prénom' );
        self::champ_texte(3,'noms_nouveaux_joueurs', 'Nom' );
        self::champ_texte(4,'email_nouveaux_joueurs', 'eMail' );
        self::duplication_fin();
    }

    static function terrain_partie()
    {
        return <<<FIN
    <div class="spacer-b30 spacer-t30">
        <div class="tagline">
            <span>Terrain et heure de la partie</span>
        </div><!-- .tagline -->
    </div>

    <div class="frm-row">
        <div class="spacer-b10 colm colm4">
            <label class="field select">
                <select id="terrain" name="terrain">
                    <option value="">Terrain</option>
                    <option value="1">Terrain aaaaaa</option>
                    <option value="2">Terrain bbbbbb</option>
                    <option value="3">Terrain ccccccc</option>
                    <option value="4">Terrain ddddddddd</option>
                    <option value="5">Terrain eeeeeeeee</option>
                </select>
                <i class="arrow double"></i>
            </label>
        </div>
        <div class="spacer-b10 colm colm2">
            <label class="field select">
                <select id="heure" name="heure">
                    <option value="">Heure</option>
                    <?php heures(); ?>
                </select>
                <i class="arrow simple"></i>
            </label>
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