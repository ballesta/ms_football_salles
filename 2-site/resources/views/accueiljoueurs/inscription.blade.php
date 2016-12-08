
<div class="col-md-12">
    <form id="inscription"
          action="inscription.php"
          method="post">
        <fieldset>
            <legend>Joueur</legend>

            <!-- Onglets -->
            <ul class="nav nav-pills">
                <li class="active">
                    <a data-toggle="tab"
                       href="#tab_joueur_inscrit"
                       style="font-size: 18px;"
                    >
                        Joueur Inscrit
                    </a>
                </li>
                <li>
                    <a data-toggle="tab"
                       href="#tab_nouveau_joueur"
                       style="font-size: 18px;">
                        Nouveau joueur
                    </a>
                </li>
                <li>
                    <a data-toggle="tab"
                       href="#tab_aide"
                       style="font-size: 18px;">
                        Aide
                    </a>
                </li>
            </ul>

            <!-- Contenu des Onglets -->
            <div class="tab-content">
                <div id="tab_joueur_inscrit"
                     class="tab-pane fade in active">
                    <br>
                    <p style="font-size: 18px;">
                        Sélectionnez le joueur dans la liste déroulante
                        ci-dessous. <br>
                        Vous pouvez aussi rechercher
                        le joueur en saisissant une partie de son
                        nom.
                    </p>
                    <br>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group">
                                <select style="font-size: 18px;  "
                                        class="form-control"
                                        name="joueur"
                                        id="joueur"
                                        size="8">
                                    <option selected value="0">
                                        Sélectionnez le joueur
                                    </option>
                                    <option value="1">Jean DUPONT</option>
                                    <option value="2">Mohamed Hasnaoui</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="tab_nouveau_joueur"
                     class="tab-pane fade ">
                    <div class="col-xs-12" style="height:20px;"></div>
                    <div class="row">
                        <div class="col-md-10">

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

                            <div class="form-group">
                                <label for="telephone">Téléphone</label>
                                <input style="font-size: 20px"
                                       type="text"
                                       class="form-control"
                                       id="telephone"
                                       name="telephone"
                                       placeholder="Votre N° de téléphone">
                            </div>

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
                    <div class="invalid-form-error-message"></div>
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
                        <label for="terrain">Terrain</label>
                        <select class="form-control"
                                name="terrain"
                                id="terrain"
                                data-parsley-group="block1"
                                required
                                style="font-size: 30px;  height:50px;">
                            <option value="1">Platinium</option>
                            <option value="2">Gold</option>
                        </select>
                    </div>
                    <div class="form-group">
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
                        <label for="capteur">Capteur remis au joueur</label>
                        <select class="form-control"
                                name="capteur"
                                id="capteur"
                                data-parsley-group="block1"
                                required
                                style="font-size: 30px;  height:50px;">
                            <option value="1">1111111</option>
                            <option value="2">2222222</option>
                            <option value="3">3333333</option>
                            <option value="2">3333333</option>
                        </select>
                    </div>
                </div>
            </div>
        </fieldset>
    </form>
</div>
