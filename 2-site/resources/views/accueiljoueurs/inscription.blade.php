<div class="col-md-12">
    <form id="inscription"
          action="/accueiljoueurs/save"
          method="post">
        <fieldset>
            <legend>Joueur</legend>

            <!-- Onglets pour joueur inscrit ou non -->
            <ul class="nav nav-pills">
                <li class="active">
                    <a data-toggle="tab"
                       href="#tab_joueur_inscrit"
                       style="font-size: 16px;"
                    >
                        Joueur Inscrit
                    </a>
                </li>
                <li>
                    <a data-toggle="tab"
                       href="#tab_nouveau_joueur"
                       style="font-size: 16px;">
                        Nouveau joueur
                    </a>
                </li>
                <li>
                    <a data-toggle="tab"
                       href="#tab_aide"
                       style="font-size: 16px;">
                        Aide
                    </a>
                </li>
            </ul>

            <!-- Contenu des Onglets -->
            <div class="tab-content">
                <div id="tab_joueur_inscrit"
                     class="tab-pane fade in active">
                    <br>
                    <br>
                    <label for="joueur_id">Joueur inscrit</label>
                    <select name='joueur_id'
                            rows='8'
                            id='joueur_id'
                            class='select2 '
                            style="font-size: 22px;">
                    </select>

                    <br>
                    <div class="row">
                        <div class="col-md-12">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <br>
                            <p style="font-size: 14px;">
                                Sélectionnez le joueur dans la liste déroulante
                                ci-dessus. <br>
                                Vous pouvez aussi rechercher
                                le joueur en saisissant une partie de son
                                nom en utilisant le champ de recherche situé en début de liste déroulante.
                            </p>
                        </div>
                    </div>
                </div>
                <div id="tab_nouveau_joueur"
                     class="tab-pane fade ">
                    <div class="col-md-12" style="height:20px;">
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <input type="radio"
                                       name="genre"
                                       value="F"
                                >
                                <span style="font-size: 18px;">
                                                    Femme &nbsp;
                                                </span>
                                <input type="radio"
                                       name="genre"
                                       value="H" checked
                                >
                                <span style="font-size: 18px;">
                                                Homme
                                                </span>
                                <br>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="prenom">Prénom *</label>
                                <input style="font-size: 20px"
                                       type="text"
                                       class="form-control"
                                       id="prenom"
                                       name="prenom"
                                       placeholder="Votre prénom"
                                       required
                                       data-parsley-group="block0">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="nom">Nom *</label>
                                <input style="font-size: 20px"
                                       type="text"
                                       class="form-control"
                                       id="nom"
                                       name="nom"
                                       placeholder="Votre nom"
                                       required
                                       data-parsley-group="block0">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="email">Adresse Email *</label>
                                <input style="font-size: 20px"
                                       type="email"
                                       class="form-control"
                                       id="email"
                                       name="email"
                                       placeholder="Votre email"
                                       required
                                       data-parsley-group="block0"
                                       data-parsley-trigger="change"
                                       data-parsley-remote-options='{ "type": "POST", "dataType": "jsonp" }'
                                       data-parsley-remote="email_is_unique.php"
                                       data-parsley-remote-message="eMail utilisé par un joueur inscrit"
                                >
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="telephone">Téléphone</label>
                                <input style="font-size: 20px"
                                       type="text"
                                       class="form-control"
                                       id="telephone"
                                       name="telephone"
                                       placeholder="Votre N° de téléphone">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-10">
                            <div class="form-group">
                                <input
                                        type="radio"
                                        name="lateralisation"
                                        value="G">
                                <span style="font-size: 22px;">
                                                Gaucher &nbsp;
                                                </span>
                                <input type="radio"
                                       name="lateralisation"
                                       value="F"
                                       checked>
                                <span style="font-size: 22px;">
                                                Droitier
                                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="mdp1">Mot de Passe *</label>
                                <input type="password"
                                       class="form-control"
                                       id="mdp1"
                                       name="mdp1"
                                       placeholder="Votre mot de Passe"
                                       required
                                       data-parsley-group="block0"
                                       data-parsley-equalto="#mdp2">
                            </div>
                        </div>
                        <div class="col-md-6">

                            <div class="form-group">
                                <label for="mdp2">Mot de Passe pour vérification *</label>
                                <input type="password" class="form-control"
                                       id="mdp2"
                                       name="mdp2"
                                       placeholder="Saisissez à nouveau votre mot de Passe"
                                       required
                                       data-parsley-group="block0"
                                       data-parsley-equalto="#mdp1">
                            </div>
                        </div>
                    </div>
                    <div class="invalid-form-error-message">
                    </div>
                </div>
                <div id="tab_aide"
                     class="tab-pane fade">
                    <h3>Aide</h3>
                    <p>
                        Vous devez décider si le joueur est déjà inscrit
                        ou
                        s'il est inconnu chez vous.
                    </p>
                    <p>
                        Si vous avez un doute sur l'inscription au site,
                        vous pouvez rechercher le joueur en saisissant une partie de son nom
                        dans la boite de recherche de la liste déroulante
                        de l'onglet "Joueur Inscrit" (premier onglet).
                    </p>
                </div>
            </div>
        </fieldset>
        <fieldset>
            <legend>Partie</legend>
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <label for="terrain_id">Terrain</label>
                        <select name='terrain_id'
                                rows='8'
                                id='terrain_id'
                                class='select2 '
                                style="font-size: 22px;">
                        </select>
                    </div>
                    <!-- div class="form-group">
                        <label for='heure'>Heure de début du match (format HHmm)</label>
                        <input class="form-control"
                               id='heure'
                               required
                               data-parsley-group="block1"
                               type='text'
                               name='heure-debut'
                               placeholder="HHMM"
                               style="font-size: 30px; width:130px; height:50px;"
                        />
                    </div -->
                    <label for='heure'>Date et Heure de début du match</label>
                    <div class="input-group m-b" style="width:150px !important;">
                        {!! Form::text('heure_debut', $row['heure_debut'],array('class'=>'form-control datetime', 'style'=>'width:150px !important;')) !!}
                        <span class="input-group-addon">
                            <i class="fa fa-calendar"></i>
                        </span>
                    </div>
                    <div class="form-group">
                        <label>Durée du match (HH:MM)</label>
                        <br>
                        <input
                                type="radio"
                                style="width:20px; height:20px;"
                                id="duree30"
                                name="duree"
                                value="30">
                        <label for="duree30"
                               style="font-size: 20px;
                                               width:120px; height:20px;">
                            00:30 &nbsp;
                        </label>
                        <input type="radio"
                               style=" width:20px; height:20px;"
                               name="duree"
                               id="duree60"
                               value="60"
                               checked>
                        <label for="duree60"
                               style="font-size: 20px;
                                               width:120px; height:20px;">
                            01:00 &nbsp;
                        </label>
                        <input type="radio"
                               style="width:20px; height:20px;"
                               name="duree"
                               id="duree90"
                               value="90"
                        >
                        <label for="duree90"
                               style="font-size: 20px;
                                               width:120px;
                                               height:20px;">
                            01:30 &nbsp;
                        </label>
                    </div>
                </div>
            </div>
        </fieldset>
        <fieldset>
            <legend>Capteur</legend>
            <div class="row">
                <div class="col-lg-12">
                    <div class="form-group">
                        <label for="capteur_id">Capteur remis au joueur</label>
                        <select name='capteur_id'
                                rows='8'
                                id='capteur_id'
                                class='select2 '
                                style="font-size: 22px;">
                        </select>
                    </div>
                </div>
            </div>
        </fieldset>
    </form>
</div>
