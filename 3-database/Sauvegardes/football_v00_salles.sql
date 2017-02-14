-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 14 Février 2017 à 09:43
-- Version du serveur :  5.7.11
-- Version de PHP :  7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `football_v00_salles`
--

-- --------------------------------------------------------

--
-- Structure de la table `fbs_complexe_salles`
--

CREATE TABLE `fbs_complexe_salles` (
  `complexe_salle_id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(100) NOT NULL,
  `Adresse` text NOT NULL,
  `code_postal` varchar(10) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `club_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `fbs_complexe_salles`
--

INSERT INTO `fbs_complexe_salles` (`complexe_salle_id`, `nom`, `Adresse`, `code_postal`, `ville`, `telephone`, `email`, `club_id`) VALUES
(1, 'aaaaaaaaaaaaaaaaaaaa', '63 rue Henri Vuillemin', '92230 ', 'Gennevilliers', '01 78 14 07 90', 'asnieres@urbansoccer.fr', 3),
(6, 'CLERMONT', '46 rue des Varennes', '63170', 'Aubière', '04 73 26 51 89', 'clermont@urbansoccer.fr', 3),
(7, 'Centre Boissy', '5 rue de la Pompadour', '94370', 'Boissy Saint Leger ', '0145695950', 'contact@bubblesoccerarena.fr', 4);

-- --------------------------------------------------------

--
-- Structure de la table `fbs_inscription`
--

CREATE TABLE `fbs_inscription` (
  `inscription_id` int(10) UNSIGNED NOT NULL,
  `joueur_id` int(10) UNSIGNED NOT NULL,
  `partie_id` int(10) UNSIGNED NOT NULL,
  `equipe_a_b` varchar(1) DEFAULT NULL,
  `capteur_id` int(10) UNSIGNED NOT NULL,
  `gage` varchar(100) DEFAULT NULL,
  `created_by_user_id` int(10) UNSIGNED NOT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedOn` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `fbs_inscription`
--

INSERT INTO `fbs_inscription` (`inscription_id`, `joueur_id`, `partie_id`, `equipe_a_b`, `capteur_id`, `gage`, `created_by_user_id`, `createdOn`, `updatedOn`) VALUES
(152, 17, 45, 'B', 13, NULL, 0, '2017-02-13 20:09:39', NULL),
(153, 26, 45, 'B', 10, NULL, 0, '2017-02-13 20:09:39', NULL),
(154, 4, 45, 'A', 3, NULL, 0, '2017-02-13 20:09:39', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `fbs_reseaux_salles`
--

CREATE TABLE `fbs_reseaux_salles` (
  `club_id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ville` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `fbs_reseaux_salles`
--

INSERT INTO `fbs_reseaux_salles` (`club_id`, `nom`, `ville`) VALUES
(4, 'Bubble Soccer Arena ', 'Boissy Saint Leger');

-- --------------------------------------------------------

--
-- Structure de la table `fbs_salles`
--

CREATE TABLE `fbs_salles` (
  `salle_id` int(11) NOT NULL,
  `identifiant` varchar(20) NOT NULL,
  `nbr_joueurs_equipe` int(11) NOT NULL DEFAULT '5',
  `complexe_salle_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `fbs_salles`
--

INSERT INTO `fbs_salles` (`salle_id`, `identifiant`, `nbr_joueurs_equipe`, `complexe_salle_id`) VALUES
(11, 'Premium 5 Vs 5 A', 5, 7),
(12, 'Platinium 5 Vs 5 B', 5, 7),
(13, 'Small 3 Vs 3', 5, 7),
(14, ' JorkyBall 1', 3, 7),
(15, ' JorkyBall 2', 5, 7),
(16, ' JorkyBall 3', 5, 7),
(17, 'Small 2', 5, 7);

-- --------------------------------------------------------

--
-- Structure de la table `fb_capteurs`
--

CREATE TABLE `fb_capteurs` (
  `capteur_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `numero_serie` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `UID` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `date_achat` datetime DEFAULT NULL,
  `complexe_salle_id` int(10) UNSIGNED DEFAULT NULL,
  `malette_capteurs_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `fb_capteurs`
--

INSERT INTO `fb_capteurs` (`capteur_id`, `code`, `numero_serie`, `UID`, `date_achat`, `complexe_salle_id`, `malette_capteurs_id`) VALUES
(3, 'A01', '12345678', '54:4a:16:56:46:1a', '2017-01-31 00:00:00', 7, 13),
(10, 'A02', '87654321', '54:4a:16:56:46:1a', '2016-12-13 00:00:00', 7, NULL),
(11, 'A03', '123456', '1122334455', '2017-01-26 00:00:00', 7, NULL),
(12, 'A04', '44223311', '44223311', '2017-01-26 20:34:00', 7, NULL),
(13, 'B01', '122112', '2121212121', '2017-01-26 00:00:00', 7, NULL),
(14, 'B05', '12121212', '1221221122', '2017-02-01 00:00:00', 7, NULL),
(15, 'xx', 'xxxxxxxx', 'XXXXXXxxx', '2017-02-01 00:00:00', 7, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `fb_categories`
--

CREATE TABLE `fb_categories` (
  `categorie_id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL,
  `description` text NOT NULL,
  `entraineur_id` int(10) UNSIGNED NOT NULL,
  `club_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `fb_categories`
--

INSERT INTO `fb_categories` (`categorie_id`, `nom`, `description`, `entraineur_id`, `club_id`) VALUES
(2, 'U19', 'Moins de 19 ans', 6, 1),
(5, 'Senior', '<p>Plus de 19 ans<br></p>', 6, 1),
(11, 'U20', 'Moins de 20 ans', 6, 1);

-- --------------------------------------------------------

--
-- Structure de la table `fb_clubs`
--

CREATE TABLE `fb_clubs` (
  `club_id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `ville` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `fb_clubs`
--

INSERT INTO `fb_clubs` (`club_id`, `nom`, `ville`) VALUES
(1, 'Paris Saint-Germain', 'Paris'),
(2, 'Five FC', 'Paris'),
(3, 'Urban Soccer', 'Ivry');

-- --------------------------------------------------------

--
-- Structure de la table `fb_club_type`
--

CREATE TABLE `fb_club_type` (
  `club_type_id` int(10) UNSIGNED NOT NULL,
  `type_club` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `fb_entraineurs`
--

CREATE TABLE `fb_entraineurs` (
  `entraineur_id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `club_id` int(10) UNSIGNED NOT NULL,
  `tb_users_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `fb_entraineurs`
--

INSERT INTO `fb_entraineurs` (`entraineur_id`, `nom`, `prenom`, `club_id`, `tb_users_id`) VALUES
(6, 'Unai', 'Emery', 1, 0);

-- --------------------------------------------------------

--
-- Structure de la table `fb_equipes`
--

CREATE TABLE `fb_equipes` (
  `equipe_id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL,
  `complexe_salle_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `fb_equipes`
--

INSERT INTO `fb_equipes` (`equipe_id`, `nom`, `complexe_salle_id`) VALUES
(6, 'IBM', 7),
(7, 'EDF', 7),
(8, 'Les ratons laveurs du 78', 7),
(9, 'Les Lions de l\'Atlas du 93', 7);

-- --------------------------------------------------------

--
-- Structure de la table `fb_equipe_joueur`
--

CREATE TABLE `fb_equipe_joueur` (
  `equipe_joueur_id` int(10) UNSIGNED NOT NULL,
  `equipe_id` int(10) UNSIGNED NOT NULL,
  `joueur_id` int(10) UNSIGNED NOT NULL,
  `club_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `fb_equipe_joueur`
--

INSERT INTO `fb_equipe_joueur` (`equipe_joueur_id`, `equipe_id`, `joueur_id`, `club_id`) VALUES
(6, 1, 4, 1),
(7, 2, 5, 1);

-- --------------------------------------------------------

--
-- Structure de la table `fb_joueurs`
--

CREATE TABLE `fb_joueurs` (
  `joueur_id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `premon` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `eMail` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telephone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lateralite` enum('Gaucher','Droitier') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Droitier',
  `date_naissance` date DEFAULT NULL,
  `taille` double(8,2) DEFAULT NULL,
  `poids` double(8,2) DEFAULT NULL,
  `poste_id` int(10) UNSIGNED DEFAULT NULL,
  `a_completer` tinyint(1) DEFAULT NULL,
  `complexe_salle_id` int(10) UNSIGNED NOT NULL,
  `equipe_id` int(10) UNSIGNED DEFAULT NULL,
  `categorie_id` int(10) UNSIGNED DEFAULT NULL,
  `entraineur_id` int(10) UNSIGNED DEFAULT NULL,
  `tb_users_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `fb_joueurs`
--

INSERT INTO `fb_joueurs` (`joueur_id`, `nom`, `premon`, `eMail`, `telephone`, `lateralite`, `date_naissance`, `taille`, `poids`, `poste_id`, `a_completer`, `complexe_salle_id`, `equipe_id`, `categorie_id`, `entraineur_id`, `tb_users_id`) VALUES
(4, 'Ibrahimovitch', 'Slatan', 'ibra@movitch.com', '112233445566', 'Gaucher', '1988-01-01', 199.00, 99.00, 1, NULL, 7, 1, 5, 6, 0),
(5, 'TRAPP', 'Kevin', NULL, NULL, 'Droitier', '1980-01-01', 188.00, 88.00, 4, NULL, 7, 1, 5, 6, 0),
(6, 'Platini', 'Michel', NULL, NULL, 'Droitier', NULL, NULL, NULL, NULL, NULL, 7, 2, NULL, NULL, NULL),
(12, 'Kaled', 'Mahajoub', 'mkaled@msfootball.fr', '06.09.12.38.77             ', 'Gaucher', NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(16, 'bernard', 'x', 'bernard@ballesta.fr', NULL, 'Droitier', NULL, NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, NULL),
(17, 'BALLESTA', 'Bernar', 'Bernard BALLESTA', NULL, 'Droitier', NULL, NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, NULL),
(19, 'HOLLANDE', 'François', 'François.HOLLANDE@domaine.fr', NULL, 'Droitier', NULL, NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, NULL),
(20, 'LEPEN', 'Marine', 'marine.lepen@domaine.fr', NULL, 'Droitier', NULL, NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, NULL),
(21, 'bernard.ballesta', 'x', 'bernard.ballesta@gmail.com', NULL, 'Droitier', NULL, NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, NULL),
(22, 'Ballesta', 'Cyril', 'cyril.ballesta@domaine.fr', NULL, 'Droitier', NULL, NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, NULL),
(23, 'aaaaaaaaaaaa', '', '.aaaaaaaaaaaa@domaine.fr', NULL, 'Droitier', NULL, NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, NULL),
(24, 'bbbbbbbbbbbb', '', '.bbbbbbbbbbbb@domaine.fr', NULL, 'Droitier', NULL, NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, NULL),
(25, 'upoil', '', '.upoil@domaine.fr', NULL, 'Droitier', NULL, NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, NULL),
(26, 'gaucho', 'jean', 'jean.gaucho@domaine.fr', NULL, 'Droitier', NULL, NULL, NULL, NULL, 1, 7, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `fb_joueurs_selectionnes`
--

CREATE TABLE `fb_joueurs_selectionnes` (
  `joueur_selectionne_id` int(10) UNSIGNED NOT NULL,
  `partie_id` int(10) UNSIGNED NOT NULL,
  `joueur_id` int(10) UNSIGNED NOT NULL,
  `capteur_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `fb_joueurs_selectionnes`
--

INSERT INTO `fb_joueurs_selectionnes` (`joueur_selectionne_id`, `partie_id`, `joueur_id`, `capteur_id`) VALUES
(1, 1, 4, 3),
(4, 2, 4, 3),
(5, 3, 4, 3),
(6, 4, 4, 3),
(7, 5, 4, 3),
(8, 5, 4, 3),
(9, 6, 4, 3),
(10, 6, 4, 3),
(11, 7, 4, 3),
(12, 8, 4, 3),
(13, 7, 4, 3);

-- --------------------------------------------------------

--
-- Structure de la table `fb_malette_capteurs`
--

CREATE TABLE `fb_malette_capteurs` (
  `malette_capteurs_id` int(10) UNSIGNED NOT NULL,
  `identifiant` varchar(10) NOT NULL,
  `complexe_salle_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `fb_malette_capteurs`
--

INSERT INTO `fb_malette_capteurs` (`malette_capteurs_id`, `identifiant`, `complexe_salle_id`) VALUES
(6, 'B', 1),
(7, 'C', 1),
(8, 'D', 1),
(9, 'A', 1),
(13, 'A', 7),
(14, 'B', 7);

-- --------------------------------------------------------

--
-- Structure de la table `fb_mesures`
--

CREATE TABLE `fb_mesures` (
  `mesure_id` int(10) UNSIGNED NOT NULL,
  `Horodatage` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bluetooth` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `complexe_salle_id` int(10) UNSIGNED DEFAULT NULL,
  `message_json` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `session_mesure_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `fb_mesures`
--

INSERT INTO `fb_mesures` (`mesure_id`, `Horodatage`, `bluetooth`, `complexe_salle_id`, `message_json`, `session_mesure_id`, `created_at`, `updated_at`) VALUES
(1167, '2016-12-31 16:00:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"18","Average":"8","Shoot":"2","Control":"0","Step":"78","Dist":"10","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1168, '2016-12-31 16:01:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"14.326872850571","Average":"17.672349695168","Shoot":"6.4180874237919","Control":"0","Step":"78","Dist":"24.326872850571","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1169, '2016-12-31 16:02:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"24.233602909196","Average":"19.386882327357","Shoot":"9.7579847518962","Control":"0","Step":"78","Dist":"41.026359491093","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1170, '2016-12-31 16:03:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"23.57650063792","Average":"13.0120409246","Shoot":"14.47328487948","Control":"0","Step":"78","Dist":"64.602860129013","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1171, '2016-12-31 16:04:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"20.361277008748","Average":"16.289021606998","Shoot":"17.126467582482","Control":"0","Step":"78","Dist":"77.868773644024","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1172, '2016-12-31 16:05:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"15.771327622801","Average":"7.1085310491204","Shoot":"18.903600344762","Control":"0","Step":"78","Dist":"93.640101266825","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1173, '2016-12-31 16:06:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"11.436647287006","Average":"3.8035884765729","Shoot":"19.854497463906","Control":"0","Step":"78","Dist":"98.394586862541","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1174, '2016-12-31 16:07:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"2.3173825346724","Average":"1.8539060277379","Shoot":"20.31797397084","Control":"0","Step":"78","Dist":"107.19664336497","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1175, '2016-12-31 16:08:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"2.3080024631991","Average":"6.8808202813852","Shoot":"20.77957446348","Control":"0","Step":"78","Dist":"109.50464582817","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1176, '2016-12-31 16:09:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"4.5174102853053","Average":"8.4995569920001","Shoot":"21.683056520541","Control":"0","Step":"78","Dist":"120.12909206817","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1177, '2016-12-31 16:10:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"7.9265457654537","Average":"11.082473224726","Shoot":"23.268365673632","Control":"0","Step":"78","Dist":"133.98218359908","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1178, '2016-12-31 16:11:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"11.13197201173","Average":"8.905577609384","Shoot":"26.645038049469","Control":"0","Step":"78","Dist":"150.86554547827","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1179, '2016-12-31 16:12:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"12.889647537966","Average":"10.311718030373","Shoot":"29.222967557062","Control":"0","Step":"78","Dist":"169.3366036248","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1180, '2016-12-31 16:13:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"17.984264811122","Average":"10.054247852109","Shoot":"31.736529520089","Control":"0","Step":"78","Dist":"187.32086843592","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1181, '2016-12-31 16:14:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"10.345994004544","Average":"8.2767952036353","Shoot":"34.857003232702","Control":"0","Step":"78","Dist":"197.66686244047","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1182, '2016-12-31 16:15:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"12.202050425948","Average":"5.6808201703794","Shoot":"37.297413317892","Control":"0","Step":"78","Dist":"204.76788765344","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1183, '2016-12-31 16:16:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"8.9908402523609","Average":"7.1926722018887","Shoot":"38.105527941474","Control":"0","Step":"78","Dist":"208.80846077135","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1184, '2016-12-31 16:17:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"2.2351227646114","Average":"5.6312699160877","Shoot":"38.552552494397","Control":"0","Step":"78","Dist":"215.84754816646","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1185, '2016-12-31 16:18:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"6.8901598557447","Average":"1.7825390694022","Shoot":"38.998187261747","Control":"0","Step":"78","Dist":"218.07572200322","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1186, '2016-12-31 16:19:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"8.389146917882","Average":"6.7113175343056","Shoot":"39.771175943404","Control":"0","Step":"78","Dist":"226.4648689211","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1187, '2016-12-31 16:20:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"10.780986177504","Average":"5.1123944710018","Shoot":"41.049274561155","Control":"0","Step":"78","Dist":"232.85536200985","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1188, '2016-12-31 16:21:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"13.0258656651","Average":"10.42069253208","Shoot":"42.802300812564","Control":"0","Step":"78","Dist":"241.62049326689","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1189, '2016-12-31 16:22:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"14.202059988861","Average":"11.361647991088","Shoot":"44.815750675149","Control":"0","Step":"78","Dist":"255.82255325576","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1190, '2016-12-31 16:23:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"9.8288260637523","Average":"11.073147693025","Shoot":"47.584037598405","Control":"0","Step":"78","Dist":"269.66398787204","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1191, '2016-12-31 16:24:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"8.1828644282667","Average":"9.6615059807572","Shoot":"49.220610484059","Control":"0","Step":"78","Dist":"277.8468523003","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1192, '2016-12-31 16:25:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"5.7789324219281","Average":"4.6231459375425","Shoot":"51.13218345283","Control":"0","Step":"78","Dist":"287.40471714416","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1193, '2016-12-31 16:26:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"7.1789418368242","Average":"5.7431534694593","Shoot":"52.567971820195","Control":"0","Step":"78","Dist":"290.91641089054","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1194, '2016-12-31 16:27:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"2.1741832281212","Average":"1.739346582497","Shoot":"53.714581371776","Control":"0","Step":"78","Dist":"296.64945864845","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1195, '2016-12-31 16:28:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"5.6227195231819","Average":"4.4981756185455","Shoot":"54.839125276412","Control":"0","Step":"78","Dist":"302.27217817163","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1196, '2016-12-31 16:29:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"3.3815840573983","Average":"5.3865571611036","Shoot":"55.515442087892","Control":"0","Step":"78","Dist":"309.00537462301","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1197, '2016-12-31 16:30:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"8.5051145558496","Average":"6.8040916446797","Shoot":"57.216464999062","Control":"0","Step":"78","Dist":"314.25793190093","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1198, '2016-12-31 16:31:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"7.0117325005224","Average":"8.1345297467962","Shoot":"58.618811499166","Control":"0","Step":"78","Dist":"324.42609408443","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1199, '2016-12-31 16:32:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"7.9763652817984","Average":"6.3810922254387","Shoot":"60.214084555526","Control":"0","Step":"78","Dist":"335.46560245403","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1200, '2016-12-31 16:33:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"10.772350522752","Average":"6.2397895956605","Shoot":"61.774031954441","Control":"0","Step":"78","Dist":"346.23795297678","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1201, '2016-12-31 16:34:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"6.5803786244648","Average":"5.2643028995718","Shoot":"63.667059583611","Control":"0","Step":"78","Dist":"352.81833160124","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1202, '2016-12-31 16:35:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"4.7995019928892","Average":"6.0792031886228","Shoot":"65.186860380767","Control":"0","Step":"78","Dist":"357.61783359413","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1203, '2016-12-31 16:36:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"3.1198902714107","Average":"2.4959122171285","Shoot":"65.810838435049","Control":"0","Step":"78","Dist":"363.4544880707","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1204, '2016-12-31 16:37:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"2.1290381091294","Average":"3.8124078381847","Shoot":"66.236646056875","Control":"0","Step":"78","Dist":"365.58352617983","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1205, '2016-12-31 16:38:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"4.6837766311926","Average":"1.7001795653297","Shoot":"66.661690948207","Control":"0","Step":"78","Dist":"370.26730281102","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1206, '2016-12-31 16:39:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"5.5064381732479","Average":"4.4051505385984","Shoot":"67.266391476832","Control":"0","Step":"78","Dist":"373.29080545415","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1207, '2016-12-31 16:40:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"4.4095536952976","Average":"3.5276429562381","Shoot":"68.630212954951","Control":"0","Step":"78","Dist":"377.70035914945","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1208, '2016-12-31 16:41:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"5.7127827535698","Average":"6.4408987000133","Shoot":"69.772769505665","Control":"0","Step":"78","Dist":"385.75148252446","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1209, '2016-12-31 16:42:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"6.4274002942059","Average":"6.9573060049632","Shoot":"71.058249564506","Control":"0","Step":"78","Dist":"394.44811503067","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1210, '2016-12-31 16:43:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"8.4987171054615","Average":"6.7989736843692","Shoot":"72.317559732655","Control":"0","Step":"78","Dist":"402.94683213613","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1211, '2016-12-31 16:44:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"7.5303103583514","Average":"6.0242482866811","Shoot":"73.823621804325","Control":"0","Step":"78","Dist":"410.47714249448","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1212, '2016-12-31 16:45:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"6.1478441703343","Average":"3.2591376681337","Shoot":"74.638406221358","Control":"0","Step":"78","Dist":"414.55106457965","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1213, '2016-12-31 16:46:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"4.8422635427033","Average":"2.2637080945802","Shoot":"75.606858929899","Control":"0","Step":"78","Dist":"419.39332812235","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1214, '2016-12-31 16:47:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"4.0487400476328","Average":"3.2389920381063","Shoot":"76.02597768638","Control":"0","Step":"78","Dist":"421.48892190476","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1215, '2016-12-31 16:48:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"2.0927685591703","Average":"3.1905525029018","Shoot":"76.823615812106","Control":"0","Step":"78","Dist":"425.47711253338","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1216, '2016-12-31 16:49:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"4.597633288436","Average":"3.6781066307488","Shoot":"77.743142469793","Control":"0","Step":"78","Dist":"428.23534194033","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1217, '2016-12-31 16:50:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"5.5700825623749","Average":"4.4560660498999","Shoot":"78.50015072603","Control":"0","Step":"78","Dist":"433.8054245027","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1218, '2016-12-31 16:51:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"6.4827824518054","Average":"5.1862259614443","Shoot":"79.796707216391","Control":"0","Step":"78","Dist":"438.55592161598","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1219, '2016-12-31 16:52:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"6.9609873778054","Average":"4.2239190465595","Shoot":"80.852686978031","Control":"0","Step":"78","Dist":"445.51690899378","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1220, '2016-12-31 16:53:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"5.1829631489081","Average":"4.1463705191265","Shoot":"81.889279607813","Control":"0","Step":"78","Dist":"452.33127703656","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1221, '2016-12-31 16:54:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"6.0969546794916","Average":"3.6110120694581","Shoot":"83.108670543711","Control":"0","Step":"78","Dist":"456.84504212339","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1222, '2016-12-31 16:55:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"5.0727985379321","Average":"4.0582388303457","Shoot":"84.123230251297","Control":"0","Step":"78","Dist":"461.91784066132","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1223, '2016-12-31 16:56:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"4.105600620414","Average":"2.0916870496789","Shoot":"84.646152013717","Control":"0","Step":"78","Dist":"464.53244947342","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1224, '2016-12-31 16:57:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"2.0708176157898","Average":"2.8141951653814","Shoot":"85.349700805063","Control":"0","Step":"78","Dist":"466.60326708921","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1225, '2016-12-31 16:58:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"3.4728878438757","Average":"2.7783102751006","Shoot":"85.763445732851","Control":"0","Step":"78","Dist":"468.67199172815","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1226, '2016-12-31 16:59:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"2.5617101601195","Average":"2.0493681280956","Shoot":"86.275787764874","Control":"0","Step":"78","Dist":"472.59636579887","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL),
(1227, '2016-12-31 17:00:00', '54:4a:16:56:46:1a', 7, '{"Mesure":{"UID":"54:4a:16:56:46:1a","Mobility":"0","Max":"4.6447822115454","Average":"3.7158257692363","Shoot":"86.940265986029","Control":"0","Step":"78","Dist":"477.24114801042","Pass":"0","Sprint":"0"}}', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `fb_mesure_eventshoot`
--

CREATE TABLE `fb_mesure_eventshoot` (
  `mesure_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `speed` int(11) NOT NULL,
  `horodatage` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `fb_mesure_eventshoot`
--

INSERT INTO `fb_mesure_eventshoot` (`mesure_id`, `uid`, `id`, `speed`, `horodatage`) VALUES
(217, 12345678, 4, 72, '2016-10-14 11:12:51'),
(228, 12345678, 1, 72, '2016-10-14 11:12:51'),
(229, 12345678, 2, 72, '2016-10-14 11:12:51'),
(230, 12345678, 3, 72, '2016-10-14 11:12:51'),
(231, 12345678, 4, 72, '2016-10-14 11:12:51'),
(232, 12345678, 5, 72, '2016-10-14 11:12:51'),
(233, 12345678, 6, 72, '2016-10-14 11:12:51'),
(234, 12345678, 7, 72, '2016-10-14 11:12:51'),
(235, 12345678, 8, 72, '2016-10-14 11:12:51'),
(236, 12345678, 9, 72, '2016-10-14 11:12:51'),
(237, 12345678, 10, 72, '2016-10-14 11:12:51'),
(238, 12345678, 1, 72, '2016-10-14 11:12:51'),
(239, 12345678, 2, 72, '2016-10-14 11:12:51'),
(240, 12345678, 3, 72, '2016-10-14 11:12:51'),
(241, 12345678, 4, 72, '2016-10-14 11:12:51'),
(242, 12345678, 5, 72, '2016-10-14 11:12:51'),
(243, 12345678, 6, 72, '2016-10-14 11:12:51'),
(244, 12345678, 7, 72, '2016-10-14 11:12:51'),
(245, 12345678, 8, 72, '2016-10-14 11:12:51'),
(246, 12345678, 9, 72, '2016-10-14 11:12:51'),
(247, 12345678, 10, 72, '2016-10-14 11:12:51'),
(248, 12345678, 1, 72, '2016-10-14 11:12:51'),
(249, 12345678, 2, 72, '2016-10-14 11:12:51'),
(250, 12345678, 3, 72, '2016-10-14 11:12:51'),
(251, 12345678, 4, 72, '2016-10-14 11:12:51'),
(252, 12345678, 5, 72, '2016-10-14 11:12:51'),
(253, 12345678, 6, 72, '2016-10-14 11:12:51'),
(254, 12345678, 7, 72, '2016-10-14 11:12:51'),
(255, 12345678, 8, 72, '2016-10-14 11:12:51'),
(256, 12345678, 9, 72, '2016-10-14 11:12:51'),
(257, 12345678, 10, 72, '2016-10-14 11:12:51'),
(324, 12345678, 1, 10, '2016-10-14 11:37:50'),
(325, 12345678, 1, 10, '2016-10-14 11:51:32'),
(326, 12345678, 1, 10, '2016-10-14 11:51:35'),
(327, 12345678, 1, 10, '2016-10-14 11:51:37'),
(328, 12345678, 1, 10, '2016-10-14 11:53:00'),
(329, 12345678, 1, 10, '2016-10-14 12:03:58'),
(330, 12345678, 1, 10, '2016-10-14 12:08:45'),
(331, 12345678, 1, 10, '2016-10-14 12:08:54'),
(332, 12345678, 1, 10, '2016-10-14 12:09:50'),
(333, 12345678, 2, 20, '2016-10-14 12:09:50'),
(334, 12345678, 3, 30, '2016-10-14 12:09:51'),
(335, 12345678, 4, 40, '2016-10-14 12:09:51'),
(336, 12345678, 5, 50, '2016-10-14 12:09:51'),
(337, 12345678, 6, 60, '2016-10-14 12:09:51'),
(338, 12345678, 7, 70, '2016-10-14 12:09:52'),
(339, 12345678, 8, 80, '2016-10-14 12:09:52'),
(340, 12345678, 9, 90, '2016-10-14 12:09:52'),
(341, 12345678, 10, 100, '2016-10-14 12:09:53'),
(342, 12345678, 1, 10, '2016-10-14 17:03:37');

-- --------------------------------------------------------

--
-- Structure de la table `fb_partie`
--

CREATE TABLE `fb_partie` (
  `partie_id` int(10) UNSIGNED NOT NULL,
  `debut` datetime NOT NULL,
  `duree` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `fin` datetime DEFAULT NULL,
  `salle_id` int(10) UNSIGNED NOT NULL,
  `equipe_a_id` int(11) UNSIGNED DEFAULT NULL,
  `equipe_b_id` int(11) UNSIGNED DEFAULT NULL,
  `malette_capteurs_id` int(10) UNSIGNED DEFAULT NULL,
  `complexe_salle_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `fb_partie`
--

INSERT INTO `fb_partie` (`partie_id`, `debut`, `duree`, `fin`, `salle_id`, `equipe_a_id`, `equipe_b_id`, `malette_capteurs_id`, `complexe_salle_id`) VALUES
(44, '2017-02-12 08:00:00', '01:00', NULL, 12, 6, 7, NULL, 7),
(45, '2017-02-13 08:00:00', '00:30', NULL, 12, 6, 7, NULL, 7);

-- --------------------------------------------------------

--
-- Structure de la table `fb_password_resets`
--

CREATE TABLE `fb_password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fb_postes`
--

CREATE TABLE `fb_postes` (
  `poste_id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `fb_postes`
--

INSERT INTO `fb_postes` (`poste_id`, `nom`) VALUES
(1, 'Attaquant'),
(2, 'Défenseur'),
(3, 'Milieu de terrain'),
(4, 'Gardien de but');

-- --------------------------------------------------------

--
-- Structure de la table `fb_sessions_mesures`
--

CREATE TABLE `fb_sessions_mesures` (
  `session_mesure_id` int(10) UNSIGNED NOT NULL,
  `joueur_selectionne_id` int(10) UNSIGNED DEFAULT NULL,
  `heure_debut` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `capteur_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `fb_sessions_mesures`
--

INSERT INTO `fb_sessions_mesures` (`session_mesure_id`, `joueur_selectionne_id`, `heure_debut`, `capteur_id`) VALUES
(11, 2, '2016-12-20 00:02:51', 3),
(12, 3, '2016-12-20 00:13:15', 10),
(13, 4, '2016-12-20 17:08:31', 3),
(14, 5, '2016-12-20 18:13:55', 3),
(15, 6, '2016-12-20 18:54:01', 3),
(16, 7, '2016-12-20 19:18:05', 3),
(17, 8, '2016-12-20 20:07:59', 3),
(18, 9, '2016-12-20 20:08:55', 3),
(19, 10, '2016-12-20 21:28:58', 3),
(20, 11, '2017-01-04 18:40:27', 3),
(21, 12, '2017-01-04 20:38:08', 3),
(22, 13, '2017-01-07 12:24:51', 3);

-- --------------------------------------------------------

--
-- Structure de la table `fb_sessions_mesures_00`
--

CREATE TABLE `fb_sessions_mesures_00` (
  `session_mesure_id` int(10) UNSIGNED NOT NULL,
  `date_heure` datetime DEFAULT NULL,
  `activite_temps_total` double(8,2) DEFAULT NULL,
  `activite_distance` double(8,2) DEFAULT NULL,
  `activite_vitesse_moyenne` double(8,2) DEFAULT NULL,
  `marche_temps_total` double(8,2) DEFAULT NULL,
  `marche_distance` double(8,2) DEFAULT NULL,
  `marche_vitesse_moyenne` double(8,2) DEFAULT NULL,
  `course_temps_total` double(8,2) DEFAULT NULL,
  `course_distance` double(8,2) DEFAULT NULL,
  `course_vitesse_moyenne` double(8,2) DEFAULT NULL,
  `sprint_temps_total` double(8,2) DEFAULT NULL,
  `sprint_distance` double(8,2) DEFAULT NULL,
  `sprint_vitesse_moyenne` double(8,2) DEFAULT NULL,
  `sprint_vitesse_maximum` double(8,2) DEFAULT NULL,
  `partie_id` int(10) UNSIGNED DEFAULT NULL,
  `activite_id` int(10) UNSIGNED DEFAULT NULL,
  `capteur_id` int(10) UNSIGNED NOT NULL,
  `joueur_id` int(10) UNSIGNED NOT NULL,
  `joueur_selectionne_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `fb_sessions_mesures_00`
--

INSERT INTO `fb_sessions_mesures_00` (`session_mesure_id`, `date_heure`, `activite_temps_total`, `activite_distance`, `activite_vitesse_moyenne`, `marche_temps_total`, `marche_distance`, `marche_vitesse_moyenne`, `course_temps_total`, `course_distance`, `course_vitesse_moyenne`, `sprint_temps_total`, `sprint_distance`, `sprint_vitesse_moyenne`, `sprint_vitesse_maximum`, `partie_id`, `activite_id`, `capteur_id`, `joueur_id`, `joueur_selectionne_id`) VALUES
(4, '2016-08-12 19:35:55', 1.00, 11.00, 11.00, 11.00, 11.00, 11.00, 11.00, 11.00, 11.00, 11.00, 11.00, 11.00, 11.00, 1, 2, 1, 4, 1),
(5, '2016-10-18 00:00:00', 22.00, 22.00, 22.00, 22.00, 22.00, 22.00, 22.00, 22.00, 22.00, 22.00, 22.00, 22.00, 22.00, 1, 1, 1, 1, 1),
(6, '2016-10-19 19:45:54', 33.00, 33.00, 33.00, 33.00, 33.00, 33.00, 33.00, 33.00, 33.00, 33.00, 33.00, 33.00, 33.00, NULL, NULL, 5, 4, NULL),
(7, '2016-10-18 13:50:11', 44.00, NULL, 44.00, 44.00, 44.00, 44.00, 44.00, 44.00, 44.00, 44.00, 44.00, 44.00, NULL, 5, NULL, 1, 5, NULL),
(8, '2016-10-17 12:30:04', 55.00, 55.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 5, 5),
(9, '2016-10-22 18:25:10', 99.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 6, 6),
(10, '2016-11-28 16:45:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 5, 5);

-- --------------------------------------------------------

--
-- Structure de la table `fb_stades`
--

CREATE TABLE `fb_stades` (
  `stade_id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL,
  `club_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `fb_stades`
--

INSERT INTO `fb_stades` (`stade_id`, `nom`, `club_id`) VALUES
(1, 'Parc des princes', 1),
(2, 'Stade de france', 1);

-- --------------------------------------------------------

--
-- Structure de la table `fb_staff`
--

CREATE TABLE `fb_staff` (
  `staff_id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL,
  `prenom` varchar(40) NOT NULL,
  `mail` varchar(40) NOT NULL,
  `staff_poste_id` int(10) UNSIGNED NOT NULL,
  `club_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `fb_staff`
--

INSERT INTO `fb_staff` (`staff_id`, `nom`, `prenom`, `mail`, `staff_poste_id`, `club_id`) VALUES
(1, 'aaaaaaaaaaaa', 'aaaaaaaaaaaa', 'AAAAAAAA@AAAAAAAAAA.com', 1, 1),
(2, 'Le Rebouteu', 'Yohan', 'XXXX@YYYY.COM', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `fb_staff_postes`
--

CREATE TABLE `fb_staff_postes` (
  `staff_poste_id` int(10) UNSIGNED NOT NULL,
  `nom` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `fb_staff_postes`
--

INSERT INTO `fb_staff_postes` (`staff_poste_id`, `nom`) VALUES
(1, 'Kiné'),
(2, 'Analyste vidéo');

-- --------------------------------------------------------

--
-- Structure de la table `fb_statistiques`
--

CREATE TABLE `fb_statistiques` (
  `statistique_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `joueur_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `fb_statistiques`
--

INSERT INTO `fb_statistiques` (`statistique_id`, `date`, `joueur_id`) VALUES
(1, '2016-11-25', 5),
(2, '2016-11-25', 6),
(3, '2016-11-25', 4);

-- --------------------------------------------------------

--
-- Structure de la table `fb_users`
--

CREATE TABLE `fb_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `payload` text,
  `last_activity` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `sessions`
--

INSERT INTO `sessions` (`id`, `payload`, `last_activity`) VALUES
('83debe181ca56219b1df706ba96184d668e35b2c', 'YToxMTp7czo2OiJfdG9rZW4iO3M6NDA6Ikt5c2ZCSkJYODViZ1ZKQlU3cHhITWREU0xISlN4SVlMek1rVGo3Q3MiO3M6Mzg6ImxvZ2luXzgyZTVkMmM1NmJkZDA4MTEzMThmMGNmMDc4Yjc4YmZjIjtpOjU7czozOiJ1aWQiO2k6NTtzOjM6ImdpZCI7aToxO3M6MzoiZWlkIjtzOjE5OiJiZXJuYXJkQGJhbGxlc3RhLmZyIjtzOjI6ImxsIjtzOjE5OiIyMDE3LTAxLTI2IDIyOjMxOjMxIjtzOjM6ImZpZCI7czoxNjoiQmVybmFyZCBCQUxMRVNUQSI7czo2OiJ0aGVtZXMiO3M6MTY6InN4aW1vLWxpZ2h0LWJsdWUiO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjgyOiJodHRwOi8vbXMtZm9vdGJhbGwtc2FsbGVzLXB1YmxpYy9mcm9udC9pbnNjcmlwdGlvbnM/aGV1cmU9OCZtaW51dGU9MCZ0ZXJyYWluX2lkPTEyIjt9czo1OiJmbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQ4NzAzMDY4MjtzOjE6ImMiO2k6MTQ4NzAwNDQwNDtzOjE6ImwiO3M6MToiMCI7fX0=', 1487030682);

-- --------------------------------------------------------

--
-- Structure de la table `tb_groups`
--

CREATE TABLE `tb_groups` (
  `group_id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `level` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `tb_groups`
--

INSERT INTO `tb_groups` (`group_id`, `name`, `description`, `level`) VALUES
(1, 'Superadmin', 'Root Superadmin', 1),
(2, 'Administrator', 'Administrator', 2),
(4, 'Responsable réseau ', 'Gère un réseau de centres sportifs', 10),
(5, 'Responsable Centre', 'Responsable d\'un centre sportif (complexe sportif)', 12),
(8, 'Accueil Centre', 'Accueil des joueurs, remise des capteurs', 14),
(10, 'joueur', 'Joueur (client)', 20);

-- --------------------------------------------------------

--
-- Structure de la table `tb_groups_access`
--

CREATE TABLE `tb_groups_access` (
  `id` int(6) NOT NULL,
  `group_id` int(6) DEFAULT NULL,
  `module_id` int(6) DEFAULT NULL,
  `access_data` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `tb_groups_access`
--

INSERT INTO `tb_groups_access` (`id`, `group_id`, `module_id`, `access_data`) VALUES
(424, 1, 1, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(425, 2, 1, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(426, 3, 1, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(427, 1, 8, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(428, 2, 8, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(429, 3, 8, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(430, 1, 2, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(431, 2, 2, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(432, 3, 2, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(439, 1, 11, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"0","is_edit":"0","is_remove":"1","is_excel":"1"}'),
(440, 2, 11, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"0","is_edit":"0","is_remove":"1","is_excel":"1"}'),
(441, 3, 11, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(448, 1, 7, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(449, 2, 7, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(450, 3, 7, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(451, 1, 4, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(452, 2, 4, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(453, 3, 4, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(454, 1, 21, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"0","is_edit":"0","is_remove":"1","is_excel":"0"}'),
(455, 2, 21, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"0","is_edit":"0","is_remove":"1","is_excel":"0"}'),
(456, 3, 21, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"0","is_edit":"0","is_remove":"1","is_excel":"0"}'),
(465, 3, 25, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(471, 3, 26, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(477, 3, 28, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(480, 3, 29, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(486, 3, 31, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(489, 3, 32, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(492, 3, 33, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(498, 3, 34, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"1"}'),
(504, 3, 35, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(507, 3, 36, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(510, 3, 37, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(516, 3, 38, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(543, 1, 29, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(544, 2, 29, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(545, 4, 29, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(546, 5, 29, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"0"}'),
(547, 8, 29, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(548, 10, 29, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(555, 1, 32, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(556, 2, 32, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(557, 4, 32, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(558, 5, 32, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(559, 8, 32, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(560, 10, 32, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(561, 1, 33, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(562, 2, 33, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(563, 4, 33, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(564, 5, 33, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(565, 8, 33, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(566, 10, 33, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(567, 1, 40, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(568, 2, 40, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(569, 4, 40, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(570, 5, 40, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(571, 8, 40, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(572, 10, 40, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(573, 1, 39, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(574, 2, 39, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(575, 4, 39, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(576, 5, 39, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(577, 8, 39, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"0"}'),
(578, 10, 39, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(579, 1, 35, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(580, 2, 35, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(581, 4, 35, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(582, 5, 35, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(583, 8, 35, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(584, 10, 35, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(585, 1, 28, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(586, 2, 28, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(587, 4, 28, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(588, 5, 28, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(589, 8, 28, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(590, 10, 28, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(591, 1, 37, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(592, 2, 37, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(593, 4, 37, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(594, 5, 37, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(595, 8, 37, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(596, 10, 37, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(597, 1, 38, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(598, 2, 38, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(599, 4, 38, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(600, 5, 38, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(601, 8, 38, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(602, 10, 38, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(603, 1, 34, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(604, 2, 34, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(605, 4, 34, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(606, 5, 34, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(607, 8, 34, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(608, 10, 34, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(615, 1, 31, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(616, 2, 31, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(617, 4, 31, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(618, 5, 31, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(619, 8, 31, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(620, 10, 31, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(621, 1, 36, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(622, 2, 36, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(623, 4, 36, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(624, 5, 36, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(625, 8, 36, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(626, 10, 36, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(639, 1, 41, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(640, 2, 41, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(641, 4, 41, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(642, 5, 41, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(643, 8, 41, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(644, 10, 41, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(675, 1, 25, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(676, 2, 25, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(677, 4, 25, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"0","is_edit":"1","is_remove":"0","is_excel":"1"}'),
(678, 5, 25, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(679, 8, 25, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(680, 10, 25, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(687, 1, 26, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(688, 2, 26, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(689, 4, 26, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(690, 5, 26, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"0","is_edit":"1","is_remove":"0","is_excel":"1"}'),
(691, 8, 26, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(692, 10, 26, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(699, 1, 42, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(700, 2, 42, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(701, 4, 42, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(702, 5, 42, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(703, 8, 42, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(704, 10, 42, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(759, 1, 49, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(760, 2, 49, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(761, 4, 49, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(762, 5, 49, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(763, 8, 49, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(764, 10, 49, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}'),
(771, 1, 50, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(772, 2, 50, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(773, 4, 50, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(774, 5, 50, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"1","is_excel":"1"}'),
(775, 8, 50, '{"is_global":"1","is_view":"1","is_detail":"1","is_add":"1","is_edit":"1","is_remove":"0","is_excel":"0"}'),
(776, 10, 50, '{"is_global":"0","is_view":"0","is_detail":"0","is_add":"0","is_edit":"0","is_remove":"0","is_excel":"0"}');

-- --------------------------------------------------------

--
-- Structure de la table `tb_logs`
--

CREATE TABLE `tb_logs` (
  `auditID` int(20) NOT NULL,
  `ipaddress` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  `task` varchar(50) DEFAULT NULL,
  `note` text,
  `logdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `tb_logs`
--

INSERT INTO `tb_logs` (`auditID`, `ipaddress`, `user_id`, `module`, `task`, `note`, `logdate`) VALUES
(1, '::1', 5, 'reseauxsalles', 'save', 'New Data with ID 4 Has been Inserted !', '2016-09-26 11:24:03'),
(2, '::1', 5, 'complexesportif', 'save', 'New Data with ID 1 Has been Inserted !', '2016-09-27 15:24:08'),
(3, '::1', 5, 'complexesportif', 'save', 'New Data with ID 2 Has been Inserted !', '2016-09-27 15:24:39'),
(4, '::1', 5, 'complexesportif', 'save', 'New Data with ID 3 Has been Inserted !', '2016-09-27 22:13:06'),
(5, '::1', 5, 'complexesportif', 'save', 'New Data with ID 4 Has been Inserted !', '2016-09-28 19:10:28'),
(6, '::1', 5, 'complexesportif', 'save', 'Data with ID 4 Has been Updated !', '2016-09-28 22:16:45'),
(7, '::1', 5, 'complexesportif', 'save', 'Data with ID 1 Has been Updated !', '2016-10-06 14:43:50'),
(8, '::1', 5, 'complexesportif', 'save', 'Data with ID 3 Has been Updated !', '2016-10-06 14:44:39'),
(9, '::1', 5, 'complexesportif', 'save', 'Data with ID 3 Has been Updated !', '2016-10-06 14:44:43'),
(10, '::1', 5, 'complexesportif', 'save', 'Data with ID 2 Has been Updated !', '2016-10-06 14:44:57'),
(11, '::1', 5, 'complexesportif', 'save', 'Data with ID 4 Has been Updated !', '2016-10-06 14:45:11'),
(12, '::1', 5, 'complexesportif', 'save', 'Data with ID 2 Has been Updated !', '2016-10-06 14:51:38'),
(13, '::1', 5, 'complexesportif', 'save', 'Data with ID 2 Has been Updated !', '2016-10-06 14:54:31'),
(14, '::1', 5, 'complexesportif', 'save', 'New Data with ID 5 Has been Inserted !', '2016-10-06 14:56:18'),
(15, '::1', 5, 'complexesportif', 'delete', 'ID : 5  , Has Been Removed Successfull', '2016-10-06 14:56:27'),
(16, '::1', 5, 'malette', 'save', 'New Data with ID 1 Has been Inserted !', '2016-10-06 15:14:06'),
(17, '::1', 5, 'malette', 'save', 'New Data with ID 2 Has been Inserted !', '2016-10-06 15:16:02'),
(18, '::1', 5, 'malette', 'save', 'New Data with ID 3 Has been Inserted !', '2016-10-06 15:17:45'),
(19, '::1', 5, 'malette', 'save', 'New Data with ID 4 Has been Inserted !', '2016-10-06 15:19:33'),
(20, '::1', 5, 'malette', 'save', 'New Data with ID 5 Has been Inserted !', '2016-10-06 15:30:41'),
(21, '::1', 5, 'malette', 'save', 'New Data with ID 6 Has been Inserted !', '2016-10-06 15:33:19'),
(22, '::1', 5, 'malette', 'save', 'New Data with ID 7 Has been Inserted !', '2016-10-06 15:34:20'),
(23, '::1', 5, 'malette', 'delete', 'ID : 1,2,4  , Has Been Removed Successfull', '2016-10-06 15:35:16'),
(24, '::1', 5, 'malette', 'save', 'New Data with ID 8 Has been Inserted !', '2016-10-06 15:37:02'),
(25, '::1', 5, 'malette', 'save', 'New Data with ID 9 Has been Inserted !', '2016-10-06 15:40:58'),
(26, '::1', 5, 'malette', 'save', 'New Data with ID 10 Has been Inserted !', '2016-10-06 15:41:21'),
(27, '::1', 5, 'malette', 'delete', 'ID : 10  , Has Been Removed Successfull', '2016-10-06 15:42:50'),
(28, '::1', 5, 'malette', 'save', 'New Data with ID 11 Has been Inserted !', '2016-10-06 15:43:01'),
(29, '::1', 5, 'malette', 'save', 'New Data with ID 12 Has been Inserted !', '2016-10-06 15:43:24'),
(30, '::1', 5, 'malette', 'delete', 'ID : 11  , Has Been Removed Successfull', '2016-10-06 15:46:47'),
(31, '::1', 5, 'malette', 'delete', 'ID : 12  , Has Been Removed Successfull', '2016-10-06 15:46:54'),
(32, '::1', 5, 'malette', 'save', 'Data with ID 6 Has been Updated !', '2016-10-06 15:47:04'),
(33, '::1', 5, 'reseauxsalles', 'save', 'Data with ID 4 Has been Updated !', '2016-10-06 15:50:39'),
(34, '::1', 5, 'complexesportif', 'save', 'Data with ID 1 Has been Updated !', '2016-10-06 15:51:50'),
(35, '::1', 5, 'complexesportif', 'save', 'Data with ID 3 Has been Updated !', '2016-10-06 15:52:09'),
(36, '::1', 5, 'malette', 'save', 'Data with ID 6 Has been Updated !', '2016-10-06 15:57:08'),
(37, '::1', 5, 'capteur', 'save', 'New Data with ID 3 Has been Inserted !', '2016-10-06 16:17:56'),
(38, '::1', 5, 'capteur', 'save', 'Data with ID 3 Has been Updated !', '2016-10-06 16:19:08'),
(39, '::1', 5, 'capteur', 'save', 'New Data with ID 4 Has been Inserted !', '2016-10-06 16:19:57'),
(40, '::1', 5, 'equipe', 'save', 'New Data with ID 5 Has been Inserted !', '2016-10-06 17:05:40'),
(41, '::1', 5, 'complexesportif', 'save', 'Data with ID 2 Has been Updated !', '2016-10-06 17:08:46'),
(42, '::1', 5, 'capteur', 'save', 'New Data with ID 5 Has been Inserted !', '2016-10-06 17:18:00'),
(43, '::1', 5, 'joueur', 'save', 'Data with ID 4 Has been Updated !', '2016-10-07 12:37:12'),
(44, '::1', 5, 'joueur', 'save', 'Data with ID 5 Has been Updated !', '2016-10-07 12:37:26'),
(45, '::1', 5, 'partie', 'save', 'Data with ID 2 Has been Updated !', '2016-10-10 13:07:01'),
(46, '::1', 5, 'partie', 'save', 'Data with ID 3 Has been Updated !', '2016-10-10 13:07:31'),
(47, '::1', 5, 'joueurselectionne', 'save', 'New Data with ID 1 Has been Inserted !', '2016-10-11 12:51:55'),
(48, '::1', 5, 'joueurselectionne', 'save', 'New Data with ID 2 Has been Inserted !', '2016-10-11 12:52:12'),
(49, '::1', 5, 'joueur', 'save', 'New Data with ID 6 Has been Inserted !', '2016-10-11 12:54:18'),
(50, '::1', 5, 'joueur', 'save', 'Data with ID 6 Has been Updated !', '2016-10-11 12:54:54'),
(51, '::1', 5, 'reseauxsalles', 'save', 'Data with ID 3 Has been Updated !', '2016-10-11 13:01:58'),
(52, '::1', 5, 'complexesportif', 'save', 'Data with ID 1 Has been Updated !', '2016-10-11 13:14:43'),
(53, '::1', 5, 'complexesportif', 'save', 'Data with ID 3 Has been Updated !', '2016-10-11 13:16:19'),
(54, '::1', 5, 'salle', 'save', 'Data with ID 1 Has been Updated !', '2016-10-11 13:17:34'),
(55, '::1', 5, 'salle', 'save', 'New Data with ID 2 Has been Inserted !', '2016-10-11 13:17:43'),
(56, '::1', 5, 'salle', 'save', 'New Data with ID 3 Has been Inserted !', '2016-10-11 13:17:52'),
(57, '::1', 5, 'salle', 'save', 'New Data with ID 4 Has been Inserted !', '2016-10-11 13:18:01'),
(58, '::1', 5, 'salle', 'save', 'New Data with ID 5 Has been Inserted !', '2016-10-11 13:18:09'),
(59, '::1', 5, 'salle', 'save', 'New Data with ID 6 Has been Inserted !', '2016-10-11 13:18:18'),
(60, '::1', 5, 'salle', 'save', 'New Data with ID 7 Has been Inserted !', '2016-10-11 13:18:27'),
(61, '::1', 5, 'salle', 'save', 'New Data with ID 8 Has been Inserted !', '2016-10-11 13:18:35'),
(62, '::1', 5, 'salle', 'save', 'New Data with ID 9 Has been Inserted !', '2016-10-11 13:18:46'),
(63, '::1', 5, 'salle', 'save', 'New Data with ID 10 Has been Inserted !', '2016-10-11 13:18:55'),
(64, '::1', 5, 'reseauxsalles', 'delete', 'ID : 1,2  , Has Been Removed Successfull', '2016-10-11 13:21:19'),
(65, '::1', 5, 'complexesportif', 'save', 'New Data with ID 6 Has been Inserted !', '2016-10-11 13:24:08'),
(66, '::1', 5, 'joueurselectionne', 'save', 'New Data with ID 3 Has been Inserted !', '2016-10-11 14:13:59'),
(67, '::1', 5, 'partie', 'save', 'New Data with ID 4 Has been Inserted !', '2016-10-11 14:20:13'),
(68, '::1', 5, 'mesure', 'save', 'New Data with ID 4 Has been Inserted !', '2016-10-13 09:52:20'),
(69, '::1', 5, 'mesure', 'save', 'Data with ID 3 Has been Updated !', '2016-10-13 09:52:41'),
(70, '::1', 5, 'mesurestoutes', 'delete', 'ID : 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33  , Has Been Removed Successfull', '2016-10-13 11:58:43'),
(71, '::1', 5, 'mesurestoutes', 'save', 'New Data with ID 154 Has been Inserted !', '2016-10-13 12:08:39'),
(72, '::1', 5, 'mesurestoutes', 'save', 'New Data with ID 155 Has been Inserted !', '2016-10-13 12:09:05'),
(73, '::1', 5, 'mesurestoutes', 'save', 'New Data with ID 156 Has been Inserted !', '2016-10-13 12:09:28'),
(74, '::1', 5, 'mesurestoutes', 'save', 'New Data with ID 157 Has been Inserted !', '2016-10-13 12:09:38'),
(75, '::1', 5, 'mesurestoutes', 'save', 'New Data with ID 158 Has been Inserted !', '2016-10-13 12:10:07'),
(76, '::1', 5, 'mesurestoutes', 'save', 'New Data with ID 159 Has been Inserted !', '2016-10-13 12:11:29'),
(77, '::1', 5, 'mesurestoutes', 'save', 'Data with ID 34 Has been Updated !', '2016-10-13 12:14:13'),
(78, '::1', 5, 'mesurestoutes', 'delete', 'ID : 34  , Has Been Removed Successfull', '2016-10-13 12:14:42'),
(79, '::1', 5, 'mesurestoutes', 'delete', 'ID : 35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84  , Has Been Removed Successfull', '2016-10-13 12:16:05'),
(80, '::1', 5, 'mesurestoutes', 'delete', 'ID : 85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134  , Has Been Removed Successfull', '2016-10-13 12:16:28'),
(81, '::1', 5, 'mesurestoutes', 'delete', 'ID : 155,156,157,158,159  , Has Been Removed Successfull', '2016-10-13 12:16:57'),
(82, '::1', 5, 'complexesportif', 'save', 'Data with ID 1 Has been Updated !', '2016-10-13 12:20:01'),
(83, '::1', 5, 'complexesportif', 'save', 'Data with ID 1 Has been Updated !', '2016-10-13 12:20:48'),
(84, '::1', 5, 'malette', 'delete', 'ID : 3,5  , Has Been Removed Successfull', '2016-10-13 12:47:04'),
(85, '::1', 5, 'capteur', 'save', 'Data with ID 5 Has been Updated !', '2016-10-13 12:48:14'),
(86, '::1', 5, 'complexesportif', 'save', 'New Data with ID 7 Has been Inserted !', '2016-10-17 11:19:08'),
(87, '::1', 5, 'salle', 'save', 'New Data with ID 11 Has been Inserted !', '2016-10-17 11:19:24'),
(88, '::1', 5, 'partie', 'save', 'New Data with ID 5 Has been Inserted !', '2016-10-17 16:26:19'),
(89, '::1', 5, 'joueurselectionne', 'save', 'New Data with ID 4 Has been Inserted !', '2016-10-17 16:27:02'),
(90, '::1', 5, 'joueurselectionne', 'save', 'New Data with ID 5 Has been Inserted !', '2016-10-17 16:27:22'),
(91, '::1', 5, 'joueurselectionne', 'save', 'New Data with ID 6 Has been Inserted !', '2016-10-17 16:36:09'),
(92, '::1', 5, 'equipe', 'save', 'New Data with ID 6 Has been Inserted !', '2016-10-17 16:39:39'),
(93, '::1', 5, 'equipe', 'save', 'New Data with ID 7 Has been Inserted !', '2016-10-17 16:40:05'),
(94, '::1', 5, 'joueur', 'save', 'New Data with ID 9 Has been Inserted !', '2016-10-17 16:49:03'),
(95, '::1', 5, 'joueur', 'save', 'Data with ID 9 Has been Updated !', '2016-10-17 16:49:34'),
(96, '::1', 5, 'joueur', 'save', 'New Data with ID 10 Has been Inserted !', '2016-10-17 16:50:25'),
(97, '::1', 5, 'complexesportif', 'delete', 'ID : 2,4  , Has Been Removed Successfull', '2016-10-18 08:56:34'),
(98, '::1', 5, 'capteur', 'save', 'Data with ID 1 Has been Updated !', '2016-10-18 09:05:06'),
(99, '::1', 5, 'capteur', 'save', 'Data with ID 2 Has been Updated !', '2016-10-18 09:07:50'),
(100, '::1', 5, 'capteur', 'delete', 'ID : 3  , Has Been Removed Successfull', '2016-10-18 10:25:14'),
(101, '::1', 5, 'malette', 'save', 'Data with ID 6 Has been Updated !', '2016-10-18 17:04:53'),
(102, '::1', 5, 'complexesportif', 'save', 'Data with ID 7 Has been Updated !', '2016-10-18 17:09:39'),
(103, '::1', 5, 'salle', 'save', 'New Data with ID 12 Has been Inserted !', '2016-10-18 17:13:21'),
(104, '::1', 5, 'salle', 'save', 'Data with ID 12 Has been Updated !', '2016-10-18 17:13:27'),
(105, '::1', 5, 'salle', 'save', 'Data with ID 12 Has been Updated !', '2016-10-18 17:16:41'),
(106, '::1', 5, 'salle', 'save', 'New Data with ID 13 Has been Inserted !', '2016-10-18 17:17:25'),
(107, '::1', 5, 'salle', 'save', 'New Data with ID 14 Has been Inserted !', '2016-10-18 17:17:42'),
(108, '::1', 5, 'salle', 'save', 'New Data with ID 15 Has been Inserted !', '2016-10-18 17:17:55'),
(109, '::1', 5, 'salle', 'save', 'New Data with ID 16 Has been Inserted !', '2016-10-18 17:18:08'),
(110, '::1', 5, 'joueurselectionne', 'delete', 'ID : 4  , Has Been Removed Successfull', '2016-10-18 17:18:40'),
(111, '::1', 5, 'sessionmesure', 'save', 'New Data with ID 6 Has been Inserted !', '2016-10-18 17:47:44'),
(112, '::1', 5, 'sessionmesure', 'save', 'New Data with ID 7 Has been Inserted !', '2016-10-18 17:51:17'),
(113, '::1', 5, 'sessionmesure', 'save', 'New Data with ID 8 Has been Inserted !', '2016-10-18 19:26:51'),
(114, '::1', 5, 'mesure', 'save', 'New Data with ID 343 Has been Inserted !', '2016-10-18 19:27:12'),
(115, '::1', 5, 'malette', 'save', 'New Data with ID 13 Has been Inserted !', '2016-10-18 19:27:35'),
(116, '::1', 5, 'malette', 'save', 'New Data with ID 14 Has been Inserted !', '2016-10-18 19:27:44'),
(117, '::1', 5, 'capteur', 'save', 'New Data with ID 7 Has been Inserted !', '2016-10-18 19:32:26'),
(118, '::1', 5, 'joueur', 'save', 'New Data with ID 11 Has been Inserted !', '2016-10-18 19:34:56'),
(119, '::1', 5, 'capteur', 'save', 'New Data with ID 8 Has been Inserted !', '2016-10-22 16:04:42'),
(120, '::1', 5, 'joueurCentre', 'save', 'New Data with ID 12 Has been Inserted !', '2016-10-22 16:24:35'),
(121, '::1', 5, 'joueurCentre', 'delete', 'ID : 12  , Has Been Removed Successfull', '2016-10-22 16:24:44'),
(122, '::1', 5, 'reseauxsalles', 'save', 'Data with ID 4 Has been Updated !', '2016-10-22 16:25:21'),
(123, '::1', 5, 'reseauxsalles', 'save', 'Data with ID 4 Has been Updated !', '2016-10-22 16:25:36'),
(124, '::1', 5, 'equipe', 'save', 'New Data with ID 8 Has been Inserted !', '2016-10-22 16:26:34'),
(125, '::1', 5, 'equipe', 'save', 'New Data with ID 9 Has been Inserted !', '2016-10-22 16:26:59'),
(126, '::1', 5, 'equipe', 'delete', 'ID : 9  , Has Been Removed Successfull', '2016-10-22 16:27:07'),
(127, '::1', 5, 'joueur', 'delete', 'ID : 9,10,11  , Has Been Removed Successfull', '2016-10-22 16:27:28'),
(128, '::1', 5, 'sessionmesure', 'save', 'New Data with ID 9 Has been Inserted !', '2016-10-22 16:28:46'),
(129, '::1', 7, 'capteur', 'delete', 'ID : 4,5,7,8  , Has Been Removed Successfull', '2016-10-24 11:22:18'),
(130, '::1', 7, 'capteur', 'save', 'New Data with ID 3 Has been Inserted !', '2016-10-25 18:22:49'),
(131, '::1', 7, 'capteur', 'save', 'New Data with ID 4 Has been Inserted !', '2016-10-25 18:23:14'),
(132, '::1', 7, 'capteur', 'save', 'Data with ID 4 Has been Updated !', '2016-10-25 18:23:31'),
(133, '::1', 7, 'capteur', 'save', 'Data with ID 4 Has been Updated !', '2016-10-25 18:23:43'),
(134, '::1', 5, 'capteur', 'save', 'Data with ID 4 Has been Updated !', '2016-10-25 18:26:46'),
(135, '::1', 5, 'capteur', 'save', 'Data with ID 3 Has been Updated !', '2016-10-25 18:37:12'),
(136, '::1', 5, 'joueurselectionne', 'save', 'Data with ID 6 Has been Updated !', '2016-10-26 14:24:00'),
(137, '::1', 5, 'mesure', 'save', 'New Data with ID 2 Has been Inserted !', '2016-10-29 14:44:25'),
(138, '::1', 5, 'salle', 'save', 'New Data with ID 17 Has been Inserted !', '2016-10-29 14:53:56'),
(139, '::1', 5, 'complexesportif', 'save', 'Data with ID 7 Has been Updated !', '2016-10-29 21:44:16'),
(140, '::1', 5, 'joueurCentre', 'save', 'New Data with ID 7 Has been Inserted !', '2016-11-01 17:42:34'),
(141, '::1', 5, 'complexesportif', 'delete', 'ID : 1  , Has Been Removed Successfull', '2016-11-01 17:46:56'),
(142, '::1', 5, 'joueurCentre', 'delete', 'ID : 7  , Has Been Removed Successfull', '2016-11-01 18:04:03'),
(143, '::1', 5, 'joueurCentre', 'save', 'New Data with ID 7 Has been Inserted !', '2016-11-02 08:14:21'),
(144, '::1', 5, 'capteur', 'save', 'New Data with ID 5 Has been Inserted !', '2016-11-02 17:01:12'),
(145, '::1', 5, 'capteur', 'save', 'New Data with ID 6 Has been Inserted !', '2016-11-02 17:03:49'),
(146, '::1', 5, 'capteur', 'save', 'New Data with ID 7 Has been Inserted !', '2016-11-02 17:09:48'),
(147, '::1', 5, 'capteur', 'save', 'New Data with ID 8 Has been Inserted !', '2016-11-02 17:10:44'),
(148, '::1', 5, 'joueurCentre', 'save', 'New Data with ID 8 Has been Inserted !', '2016-11-02 17:11:14'),
(149, '::1', 5, 'joueurCentre', 'delete', 'ID : 8  , Has Been Removed Successfull', '2016-11-02 17:11:23'),
(150, '::1', 5, 'salle', 'save', 'New Data with ID 18 Has been Inserted !', '2016-11-02 17:12:08'),
(151, '::1', 5, 'salle', 'delete', 'ID : 18  , Has Been Removed Successfull', '2016-11-02 17:12:16'),
(152, '::1', 5, 'partie', 'save', 'New Data with ID 6 Has been Inserted !', '2016-11-02 17:19:12'),
(153, '::1', 5, 'partie', 'save', 'New Data with ID 7 Has been Inserted !', '2016-11-02 17:19:38'),
(154, '::1', 5, 'partie', 'delete', 'ID : 7  , Has Been Removed Successfull', '2016-11-02 17:19:46'),
(155, '::1', 5, 'joueurselectionne', 'save', 'New Data with ID 7 Has been Inserted !', '2016-11-02 18:10:34'),
(156, '::1', 5, 'joueurselectionne', 'save', 'New Data with ID 8 Has been Inserted !', '2016-11-02 18:10:57'),
(157, '::1', 5, 'joueurselectionne', 'save', 'New Data with ID 9 Has been Inserted !', '2016-11-02 18:13:07'),
(158, '::1', 5, 'mesure', 'save', 'New Data with ID 3 Has been Inserted !', '2016-11-02 19:18:35'),
(159, '::1', 5, 'mesure', 'save', 'New Data with ID 4 Has been Inserted !', '2016-11-02 19:18:46'),
(160, '::1', 5, 'mesure', 'delete', 'ID : 3,4  , Has Been Removed Successfull', '2016-11-02 19:18:55'),
(161, '::1', 5, 'sessionmesure', 'save', 'New Data with ID 10 Has been Inserted !', '2016-11-02 19:19:38'),
(162, '::1', 5, 'sessionmesure', 'save', 'Data with ID 10 Has been Updated !', '2016-11-02 19:19:59'),
(163, '::1', 5, 'joueurselectionne', 'delete', 'ID : 8,9  , Has Been Removed Successfull', '2016-11-02 19:20:25'),
(164, '::1', 5, 'mesure', 'save', 'New Data with ID 5 Has been Inserted !', '2016-11-02 19:21:11'),
(165, '::1', 5, 'capteur', 'save', 'Data with ID 3 Has been Updated !', '2016-11-02 19:21:42'),
(166, '::1', 5, 'capteur', 'save', 'Data with ID 4 Has been Updated !', '2016-11-02 19:21:52'),
(167, '::1', 5, 'capteur', 'save', 'Data with ID 6 Has been Updated !', '2016-11-02 19:22:02'),
(168, '::1', 5, 'capteur', 'save', 'Data with ID 7 Has been Updated !', '2016-11-02 19:22:13'),
(169, '::1', 5, 'capteur', 'save', 'Data with ID 8 Has been Updated !', '2016-11-02 19:22:23'),
(170, '::1', 5, 'capteur', 'save', 'Data with ID 2 Has been Updated !', '2016-11-02 19:22:58'),
(171, '::1', 5, 'capteur', 'save', 'New Data with ID 9 Has been Inserted !', '2016-11-02 19:23:20'),
(172, '::1', 5, 'joueurCentre', 'delete', 'ID : 7  , Has Been Removed Successfull', '2016-11-02 19:23:46'),
(173, '::1', 5, 'joueurCentre', 'save', 'New Data with ID 9 Has been Inserted !', '2016-11-02 19:24:13'),
(174, '::1', 5, 'joueurCentre', 'save', 'New Data with ID 10 Has been Inserted !', '2016-11-02 19:24:28'),
(175, '::1', 5, 'joueurCentre', 'save', 'New Data with ID 11 Has been Inserted !', '2016-11-02 19:28:09'),
(176, '::1', 5, 'joueurCentre', 'save', 'Data with ID 4 Has been Updated !', '2016-11-02 19:37:34'),
(177, '::1', 5, 'joueurCentre', 'delete', 'ID : 11  , Has Been Removed Successfull', '2016-11-02 19:41:40'),
(178, '::1', 5, 'sessionmesure', 'save', 'Data with ID 8 Has been Updated !', '2016-11-02 19:47:25'),
(179, '::1', 5, 'mesure', 'save', 'New Data with ID 6 Has been Inserted !', '2016-11-02 19:49:02'),
(180, '::1', 5, 'mesure', 'save', 'New Data with ID 7 Has been Inserted !', '2016-11-02 19:49:11'),
(181, '::1', 5, 'mesure', 'delete', 'ID : 5  , Has Been Removed Successfull', '2016-11-03 18:44:15'),
(182, '::1', 5, 'testcombo', 'save', 'Data with ID 5 Has been Updated !', '2016-11-11 11:59:45'),
(183, '::1', 5, 'testcombo', 'save', 'Data with ID 5 Has been Updated !', '2016-11-11 20:35:31'),
(184, '::1', 5, 'testcombo', 'save', 'Data with ID 5 Has been Updated !', '2016-11-11 21:12:08'),
(185, '::1', 5, 'testcombo', 'save', 'Data with ID 5 Has been Updated !', '2016-11-11 21:16:41'),
(186, '::1', 5, 'testcombo', 'save', 'Data with ID 5 Has been Updated !', '2016-11-11 21:18:29'),
(187, '::1', 5, 'testcombo', 'save', 'Data with ID 5 Has been Updated !', '2016-11-11 21:18:56'),
(188, '::1', 5, 'testcombo', 'save', 'Data with ID 5 Has been Updated !', '2016-11-11 21:19:12'),
(189, '::1', 5, 'testcombo', 'save', 'Data with ID 5 Has been Updated !', '2016-11-11 21:29:57'),
(190, '::1', 5, 'testcombo', 'save', 'Data with ID 5 Has been Updated !', '2016-11-11 21:30:37'),
(191, '::1', 9, 'reseauxsalles', 'save', 'Data with ID 4 Has been Updated !', '2016-11-13 16:11:03'),
(192, '::1', 5, 'complexesportif', 'save', 'New Data with ID 8 Has been Inserted !', '2016-11-20 14:42:35'),
(193, '::1', 5, 'complexesportif', 'delete', 'ID : 8  , Has Been Removed Successfull', '2016-11-20 15:24:24'),
(194, '::1', 8, 'complexesportif', 'save', 'New Data with ID 9 Has been Inserted !', '2016-11-20 19:09:06'),
(195, '::1', 5, 'inscription', 'save', 'Data with ID 1 Has been Updated !', '2016-11-22 16:58:02'),
(196, '::1', 5, 'inscriptionb', 'save', 'New Data with ID 2 Has been Inserted !', '2016-11-22 17:25:23'),
(197, '::1', 5, 'inscription', 'save', 'New Data with ID 3 Has been Inserted !', '2016-11-23 00:17:58'),
(198, '::1', 5, 'inscription', 'save', 'New Data with ID 4 Has been Inserted !', '2016-11-23 18:10:09'),
(199, '::1', 5, 'inscription', 'save', 'New Data with ID 5 Has been Inserted !', '2016-11-23 18:13:01'),
(200, '::1', 5, 'inscription', 'delete', 'ID : 1,2,3,4,5  , Has Been Removed Successfull', '2016-11-23 18:13:12'),
(201, '::1', 5, 'joueurCentre', 'save', 'New Data with ID 11 Has been Inserted !', '2016-11-23 18:23:06'),
(202, '::1', 5, 'joueurCentre', 'save', 'Data with ID 4 Has been Updated !', '2016-11-23 18:35:34'),
(203, '::1', 5, 'inscription', 'save', 'New Data with ID 6 Has been Inserted !', '2016-11-23 19:31:15'),
(204, '::1', 5, 'complexesportif', 'save', 'New Data with ID 10 Has been Inserted !', '2016-11-23 19:35:49'),
(205, '::1', 5, 'salle', 'save', 'New Data with ID 18 Has been Inserted !', '2016-11-23 19:36:30'),
(206, '::1', 5, 'partie', 'save', 'New Data with ID 7 Has been Inserted !', '2016-11-23 19:37:16'),
(207, '::1', 5, 'partie', 'save', 'New Data with ID 8 Has been Inserted !', '2016-11-23 19:49:38'),
(208, '::1', 5, 'partie', 'save', 'Data with ID 8 Has been Updated !', '2016-11-23 19:49:52'),
(209, '::1', 5, 'partie', 'save', 'Data with ID 7 Has been Updated !', '2016-11-23 19:50:08'),
(210, '::1', 5, 'partie', 'save', 'New Data with ID 9 Has been Inserted !', '2016-11-23 19:50:32'),
(211, '::1', 5, 'inscription', 'save', 'New Data with ID 7 Has been Inserted !', '2016-11-23 19:51:54'),
(212, '::1', 5, 'joueurCentre', 'save', 'Data with ID 11 Has been Updated !', '2016-11-23 19:53:55'),
(213, '::1', 5, 'inscription', 'save', 'Data with ID 7 Has been Updated !', '2016-11-23 20:00:09'),
(214, '::1', 5, 'inscription', 'save', 'New Data with ID 8 Has been Inserted !', '2016-11-23 20:05:30'),
(215, '::1', 5, 'inscription', 'delete', 'ID : 7  , Has Been Removed Successfull', '2016-11-23 20:05:43'),
(216, '::1', 5, 'joueurCentre', 'save', 'New Data with ID 12 Has been Inserted !', '2016-11-23 20:12:27'),
(217, '::1', 5, 'joueurCentre', 'delete', 'ID : 12  , Has Been Removed Successfull', '2016-11-23 20:12:46'),
(218, '::1', 5, 'joueurCentre', 'save', 'Data with ID 4 Has been Updated !', '2016-11-23 20:13:01'),
(219, '::1', 5, 'inscription', 'save', 'Data with ID 6 Has been Updated !', '2016-11-23 20:13:41'),
(220, '::1', 5, 'mesurestoutes', 'delete', 'ID : 2,6,7  , Has Been Removed Successfull', '2016-11-23 20:15:00'),
(221, '::1', 5, 'inscription', 'save', 'Data with ID 8 Has been Updated !', '2016-11-23 20:16:51'),
(222, '::1', 5, 'capteur', 'save', 'New Data with ID 10 Has been Inserted !', '2016-11-23 20:17:15'),
(223, '::1', 5, 'inscription', 'save', 'Data with ID 8 Has been Updated !', '2016-11-23 22:34:57'),
(224, '::1', 5, 'inscription', 'save', 'Data with ID 6 Has been Updated !', '2016-11-23 22:35:16'),
(225, '::1', 5, 'statistiques', 'delete', 'ID : 1  , Has Been Removed Successfull', '2016-11-24 19:07:54'),
(226, '::1', 5, 'statistiques', 'save', 'New Data with ID 1 Has been Inserted !', '2016-11-25 19:40:55'),
(227, '::1', 5, 'statistiques', 'save', 'Data with ID 1 Has been Updated !', '2016-11-25 19:52:32'),
(228, '::1', 5, 'statistiques', 'save', 'New Data with ID 2 Has been Inserted !', '2016-11-25 20:21:17'),
(229, '::1', 5, 'statistiques', 'save', 'Data with ID 1 Has been Updated !', '2016-11-25 20:30:32'),
(230, '::1', 5, 'statistiques', 'save', 'New Data with ID 3 Has been Inserted !', '2016-11-25 20:32:02'),
(231, '::1', 5, 'statistiques', 'save', 'Data with ID 1 Has been Updated !', '2016-11-25 21:02:34'),
(232, '::1', 5, 'inscription', 'save', 'New Data with ID 9 Has been Inserted !', '2016-12-08 16:49:44'),
(233, '::1', 5, 'complexesportif', 'delete', 'ID : 10  , Has Been Removed Successfull', '2016-12-09 01:30:24'),
(234, '::1', 5, 'capteur', 'save', 'Data with ID 2 Has been Updated !', '2016-12-13 20:22:04'),
(235, '::1', 5, 'capteur', 'save', 'Data with ID 3 Has been Updated !', '2016-12-13 20:23:00'),
(236, '::1', 5, 'inscription', 'save', 'Data with ID 6 Has been Updated !', '2016-12-13 20:29:59'),
(237, '::1', 5, 'inscription', 'save', 'Data with ID 6 Has been Updated !', '2016-12-13 20:34:17'),
(238, '::1', 5, 'inscription', 'save', 'Data with ID 6 Has been Updated !', '2016-12-13 20:38:59'),
(239, '::1', 5, 'capteur', 'save', 'Data with ID 3 Has been Updated !', '2016-12-13 20:39:23'),
(240, '::1', 5, 'capteur', 'save', 'Data with ID 10 Has been Updated !', '2016-12-13 20:41:35'),
(241, '::1', 5, 'capteur', 'save', 'Data with ID 3 Has been Updated !', '2016-12-13 20:42:05'),
(242, '::1', 5, 'inscription', 'delete', 'ID : 9  , Has Been Removed Successfull', '2016-12-13 20:43:03'),
(243, '::1', 5, 'inscription', 'save', 'Data with ID 8 Has been Updated !', '2016-12-13 20:45:07'),
(244, '::1', 5, 'capteur', 'save', 'Data with ID 3 Has been Updated !', '2016-12-13 20:47:57'),
(245, '::1', 5, 'inscription', 'save', 'Data with ID 6 Has been Updated !', '2016-12-13 20:56:04'),
(246, '::1', 5, 'inscription', 'save', 'Data with ID 6 Has been Updated !', '2016-12-13 20:57:49'),
(247, '::1', 5, 'mesurestoutes', 'delete', 'ID : 21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40  , Has Been Removed Successfull', '2016-12-13 21:00:03'),
(248, '::1', 5, 'mesurestoutes', 'delete', 'ID : 1  , Has Been Removed Successfull', '2016-12-13 21:00:11'),
(249, '::1', 5, 'mesurestoutes', 'delete', 'ID : 14,15,16,17,18,19,20  , Has Been Removed Successfull', '2016-12-13 21:00:36'),
(250, '::1', 5, 'inscription', 'save', 'Data with ID 6 Has been Updated !', '2016-12-13 21:01:33'),
(251, '::1', 5, 'inscription', 'save', 'Data with ID 8 Has been Updated !', '2016-12-14 10:32:45'),
(252, '::1', 5, 'inscription', 'save', 'Data with ID 6 Has been Updated !', '2016-12-14 17:04:11'),
(253, '::1', 5, 'inscription', 'save', 'Data with ID 6 Has been Updated !', '2016-12-14 17:36:20'),
(254, '::1', 5, 'inscription', 'save', 'Data with ID 6 Has been Updated !', '2016-12-14 17:39:07'),
(255, '::1', 5, 'inscription', 'save', 'Data with ID 6 Has been Updated !', '2016-12-14 17:39:29'),
(256, '::1', 5, 'inscription', 'save', 'Data with ID 6 Has been Updated !', '2016-12-14 17:40:03'),
(257, '::1', 5, 'inscription', 'save', 'Data with ID 6 Has been Updated !', '2016-12-14 17:40:52'),
(258, '::1', 5, 'inscription', 'save', 'Data with ID 6 Has been Updated !', '2016-12-14 17:53:43'),
(259, '::1', 5, 'inscription', 'save', 'Data with ID 6 Has been Updated !', '2016-12-14 17:54:27'),
(260, '::1', 5, 'inscription', 'save', 'Data with ID 6 Has been Updated !', '2016-12-14 17:54:54'),
(261, '::1', 5, 'inscription', 'save', 'Data with ID 6 Has been Updated !', '2016-12-16 12:47:51'),
(262, '::1', 5, 'inscription', 'save', 'Data with ID 6 Has been Updated !', '2016-12-16 13:17:20'),
(263, '::1', 5, 'inscription', 'save', 'Data with ID 6 Has been Updated !', '2016-12-16 13:17:22'),
(264, '::1', 5, 'inscription', 'save', 'Data with ID 6 Has been Updated !', '2016-12-16 13:17:44'),
(265, '::1', 5, 'inscription', 'save', 'New Data with ID 12 Has been Inserted !', '2016-12-19 21:17:59'),
(266, '::1', 5, 'inscription', 'delete', 'ID : 6,8,9,10,11,12  , Has Been Removed Successfull', '2016-12-19 21:19:07'),
(267, '::1', 5, 'inscription', 'save', 'New Data with ID 13 Has been Inserted !', '2016-12-19 22:56:38'),
(268, '::1', 5, 'inscription', 'delete', 'ID : 13  , Has Been Removed Successfull', '2016-12-19 22:57:51'),
(269, '::1', 5, 'inscription', 'save', 'New Data with ID 14 Has been Inserted !', '2016-12-19 22:58:24'),
(270, '::1', 5, 'inscription', 'save', 'New Data with ID 15 Has been Inserted !', '2016-12-19 23:01:50'),
(271, '::1', 5, 'inscription', 'save', 'New Data with ID 16 Has been Inserted !', '2016-12-19 23:19:32'),
(272, '::1', 5, 'inscription', 'save', 'New Data with ID 17 Has been Inserted !', '2016-12-19 23:20:52'),
(273, '::1', 5, 'inscription', 'save', 'New Data with ID 20 Has been Inserted !', '2016-12-19 23:35:35'),
(274, '::1', 5, 'inscription', 'delete', 'ID : 14,15,16,17,18,19,20  , Has Been Removed Successfull', '2016-12-19 23:39:35'),
(275, '::1', 5, 'inscription', 'save', 'New Data with ID 22 Has been Inserted !', '2016-12-19 23:42:14'),
(276, '::1', 5, 'inscription', 'delete', 'ID : 21  , Has Been Removed Successfull', '2016-12-19 23:42:28'),
(277, '::1', 5, 'inscription', 'save', 'New Data with ID 23 Has been Inserted !', '2016-12-20 00:02:51'),
(278, '::1', 5, 'inscription', 'save', 'New Data with ID 24 Has been Inserted !', '2016-12-20 00:13:15'),
(279, '::1', 5, 'inscription', 'save', 'New Data with ID 31 Has been Inserted !', '2016-12-20 17:08:31'),
(280, '::1', 5, 'inscription', 'delete', 'ID : 22,23,24,25,26,27,28,29,30,31  , Has Been Removed Successfull', '2016-12-20 17:14:16'),
(281, '::1', 5, 'inscription', 'save', 'New Data with ID 32 Has been Inserted !', '2016-12-20 18:13:55'),
(282, '::1', 5, 'inscription', 'delete', 'ID : 32  , Has Been Removed Successfull', '2016-12-20 18:50:50'),
(283, '::1', 5, 'inscription', 'save', 'New Data with ID 33 Has been Inserted !', '2016-12-20 18:54:01'),
(284, '::1', 5, 'inscription', 'save', 'Data with ID 33 Has been Updated !', '2016-12-20 19:18:05'),
(285, '::1', 5, 'inscription', 'save', 'Data with ID 33 Has been Updated !', '2016-12-20 20:07:59'),
(286, '::1', 5, 'inscription', 'save', 'Data with ID 33 Has been Updated !', '2016-12-20 20:08:55'),
(287, '::1', 5, 'inscription', 'save', 'Data with ID 33 Has been Updated !', '2016-12-20 21:28:58'),
(288, '::1', 5, 'mesurestoutes', 'delete', 'ID : 749,750,751,752,753,754,755  , Has Been Removed Successfull', '2016-12-27 18:33:41'),
(289, '::1', 5, 'mesurestoutes', 'delete', 'ID : 746,747,748  , Has Been Removed Successfull', '2016-12-27 18:34:39'),
(290, '::1', 5, 'inscription', 'save', 'Data with ID 33 Has been Updated !', '2017-01-04 18:40:27'),
(291, '::1', 5, 'inscriptionsdates', 'save', 'New Data with ID 34 Has been Inserted !', '2017-01-04 19:30:56'),
(292, '::1', 5, 'inscriptionsdates', 'save', 'Data with ID 34 Has been Updated !', '2017-01-04 19:31:24'),
(293, '::1', 5, 'inscriptionsdates', 'save', 'Data with ID 34 Has been Updated !', '2017-01-04 19:40:14'),
(294, '::1', 5, 'inscriptionsdates', 'save', 'Data with ID 34 Has been Updated !', '2017-01-04 19:40:56'),
(295, '::1', 5, 'inscriptionsdates', 'save', 'Data with ID 34 Has been Updated !', '2017-01-04 19:56:23'),
(296, '::1', 5, 'inscriptionsdates', 'save', 'Data with ID 34 Has been Updated !', '2017-01-04 20:00:27'),
(297, '::1', 5, 'inscription', 'save', 'New Data with ID 37 Has been Inserted !', '2017-01-04 20:38:08'),
(298, '::1', 5, 'inscription', 'save', 'Data with ID 33 Has been Updated !', '2017-01-07 12:24:51'),
(299, '::1', 5, 'joueurCentre', 'save', 'Data with ID 11 Has been Updated !', '2017-01-12 10:36:01'),
(300, '::1', 5, 'joueurCentre', 'delete', 'ID : 9,10,11  , Has Been Removed Successfull', '2017-01-12 10:36:25'),
(301, '::1', 5, 'joueurCentre', 'save', 'New Data with ID 12 Has been Inserted !', '2017-01-12 10:37:35'),
(302, '::1', 5, 'accueiljoueurs', 'save', 'New Data with ID 38 Has been Inserted !', '2017-01-12 12:02:58'),
(303, '::1', 5, 'accueiljoueurs', 'save', 'New Data with ID 39 Has been Inserted !', '2017-01-12 12:10:21'),
(304, '::1', 5, 'accueiljoueurs', 'delete', 'ID : 38,39  , Has Been Removed Successfull', '2017-01-12 12:12:51'),
(305, '::1', 5, 'accueiljoueurs', 'save', 'New Data with ID 40 Has been Inserted !', '2017-01-12 12:14:03'),
(306, '::1', 5, 'joueurselectionne', 'delete', 'ID : 2,3  , Has Been Removed Successfull', '2017-01-12 12:27:26'),
(307, '::1', 5, 'accueiljoueurs', 'save', 'New Data with ID 41 Has been Inserted !', '2017-01-12 13:21:35'),
(308, '::1', 5, 'accueiljoueurs', 'save', 'New Data with ID 42 Has been Inserted !', '2017-01-12 13:22:38'),
(309, '::1', 5, 'partie', 'delete', 'ID : 1,2,3,4,5,6,7,8  , Has Been Removed Successfull', '2017-01-17 23:04:38'),
(310, '::1', 5, 'partie', 'save', 'New Data with ID 9 Has been Inserted !', '2017-01-17 23:14:37'),
(311, '::1', 5, 'partie', 'save', 'Data with ID 9 Has been Updated !', '2017-01-17 23:16:49'),
(312, '::1', 5, 'partie', 'save', 'Data with ID 9 Has been Updated !', '2017-01-17 23:25:12'),
(313, '::1', 5, 'partie', 'save', 'Data with ID 9 Has been Updated !', '2017-01-17 23:26:18'),
(314, '::1', 5, 'partie', 'save', 'Data with ID 9 Has been Updated !', '2017-01-17 23:34:31'),
(315, '::1', 5, 'partie', 'save', 'New Data with ID 10 Has been Inserted !', '2017-01-17 23:35:39'),
(316, '::1', 5, 'partie', 'save', 'Data with ID 9 Has been Updated !', '2017-01-18 00:45:45'),
(317, '::1', 5, 'partie', 'save', 'Data with ID 9 Has been Updated !', '2017-01-18 00:50:21'),
(318, '::1', 5, 'partie', 'save', 'Data with ID 9 Has been Updated !', '2017-01-18 00:56:51'),
(319, '::1', 5, 'inscription', 'save', 'Data with ID 33 Has been Updated !', '2017-01-18 19:52:16'),
(320, '::1', 5, 'partie', 'save', 'Data with ID 9 Has been Updated !', '2017-01-19 19:51:42'),
(321, '::1', 5, 'partie', 'save', 'Data with ID 9 Has been Updated !', '2017-01-19 19:56:43'),
(322, '::1', 5, 'inscription', 'delete', 'ID : 33,34,35,36,37,41,42,43  , Has Been Removed Successfull', '2017-01-19 22:46:46'),
(323, '::1', 5, 'inscription', 'save', 'New Data with ID 44 Has been Inserted !', '2017-01-19 22:47:12'),
(324, '::1', 5, 'equipe', 'delete', 'ID : 1,2,4  , Has Been Removed Successfull', '2017-01-19 22:56:39'),
(325, '::1', 5, 'equipe', 'delete', 'ID : 5,8  , Has Been Removed Successfull', '2017-01-19 22:56:50'),
(326, '::1', 5, 'partie', 'save', 'Data with ID 9 Has been Updated !', '2017-01-20 13:26:42'),
(327, '::1', 5, 'equipe', 'save', 'New Data with ID 8 Has been Inserted !', '2017-01-26 18:53:53'),
(328, '::1', 5, 'equipe', 'save', 'New Data with ID 9 Has been Inserted !', '2017-01-26 18:54:35'),
(329, '::1', 5, 'capteur', 'save', 'New Data with ID 11 Has been Inserted !', '2017-01-26 19:33:30'),
(330, '::1', 5, 'capteur', 'save', 'New Data with ID 12 Has been Inserted !', '2017-01-26 19:34:17'),
(331, '::1', 5, 'capteur', 'save', 'Data with ID 3 Has been Updated !', '2017-01-26 19:35:28'),
(332, '::1', 5, 'capteur', 'save', 'Data with ID 3 Has been Updated !', '2017-01-26 19:39:28'),
(333, '::1', 5, 'capteur', 'save', 'New Data with ID 13 Has been Inserted !', '2017-01-26 19:39:58'),
(334, '::1', 5, 'capteur', 'save', 'Data with ID 11 Has been Updated !', '2017-01-26 19:40:10'),
(335, '::1', 5, 'capteur', 'save', 'New Data with ID 14 Has been Inserted !', '2017-01-26 19:42:48'),
(336, '::1', 5, 'reseauxsalles', 'save', 'New Data with ID 5 Has been Inserted !', '2017-01-26 19:45:35'),
(337, '::1', 5, 'reseauxsalles', 'delete', 'ID : 3,5  , Has Been Removed Successfull', '2017-01-26 19:47:29'),
(338, '::1', 5, 'partie', 'save', 'New Data with ID 11 Has been Inserted !', '2017-01-26 21:19:59'),
(339, '::1', 5, 'inscription', 'save', 'New Data with ID 45 Has been Inserted !', '2017-01-26 21:37:15'),
(340, '::1', 5, 'partie', 'save', 'Data with ID 11 Has been Updated !', '2017-01-26 21:38:00'),
(341, '::1', 5, 'salle', 'save', 'Data with ID 11 Has been Updated !', '2017-01-26 21:48:36'),
(342, '::1', 5, 'salle', 'save', 'Data with ID 12 Has been Updated !', '2017-01-26 21:48:47'),
(343, '::1', 5, 'salle', 'save', 'Data with ID 12 Has been Updated !', '2017-01-26 21:48:54'),
(344, '::1', 5, 'inscription', 'save', 'New Data with ID 46 Has been Inserted !', '2017-01-26 21:50:08'),
(345, '::1', 5, 'inscription', 'save', 'New Data with ID 47 Has been Inserted !', '2017-02-01 22:39:58'),
(346, '::1', 5, 'partie', 'save', 'New Data with ID 12 Has been Inserted !', '2017-02-01 22:41:30'),
(347, '::1', 5, 'inscription', 'save', 'New Data with ID 48 Has been Inserted !', '2017-02-01 22:42:00'),
(348, '::1', 5, 'inscription', 'save', 'New Data with ID 49 Has been Inserted !', '2017-02-01 22:42:35'),
(349, '::1', 5, 'complexesportif', 'save', 'Data with ID 7 Has been Updated !', '2017-02-01 22:43:29'),
(350, '::1', 5, 'capteur', 'save', 'New Data with ID 15 Has been Inserted !', '2017-02-01 22:49:24');

-- --------------------------------------------------------

--
-- Structure de la table `tb_menu`
--

CREATE TABLE `tb_menu` (
  `menu_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `menu_name` varchar(100) DEFAULT NULL,
  `menu_type` char(10) DEFAULT NULL,
  `role_id` varchar(100) DEFAULT NULL,
  `deep` smallint(2) DEFAULT NULL,
  `ordering` int(6) DEFAULT NULL,
  `position` enum('top','sidebar','both') DEFAULT NULL,
  `menu_icons` varchar(30) DEFAULT NULL,
  `active` enum('0','1') DEFAULT '1',
  `access_data` text,
  `allow_guest` enum('0','1') DEFAULT '0',
  `menu_lang` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `tb_menu`
--

INSERT INTO `tb_menu` (`menu_id`, `parent_id`, `module`, `url`, `menu_name`, `menu_type`, `role_id`, `deep`, `ordering`, `position`, `menu_icons`, `active`, `access_data`, `allow_guest`, `menu_lang`) VALUES
(2, 0, 'contact-us', '', 'Contact Us', 'internal', NULL, NULL, 2, 'top', '', '1', '{"1":"0","2":"0","3":"0"}', '1', NULL),
(12, 0, 'about-us', '', 'About', 'internal', NULL, NULL, 0, 'top', '', '1', '{"1":"0","2":"0","3":"0"}', '1', NULL),
(13, 0, 'service', '', 'Service', 'internal', NULL, NULL, 1, 'top', '', '1', '{"1":"0","2":"0","3":"0"}', '1', '{"title":{"id":""}}'),
(17, 0, 'reseauxsalles', NULL, 'Sport networks', 'internal', NULL, NULL, 0, 'sidebar', 'icon-pyramid', '1', '{"1":"1","2":"1","4":"1","5":"1","8":"0","10":"0"}', NULL, '{"title":{"fr":"R\\u00e9seaux de complexes sportifs"}}'),
(18, 0, 'complexesportif', NULL, 'Sports Center', 'internal', NULL, NULL, 1, 'sidebar', 'icon-windows8', '1', '{"1":"1","2":"1","4":"0","5":"0","8":"0","10":"0"}', NULL, '{"title":{"fr":"Centre sportif"}}'),
(19, 29, 'malette', NULL, 'Sensor box', 'internal', NULL, NULL, 6, 'sidebar', 'icon-table2', '0', '{"1":"1","2":"1","4":"0","5":"0","8":"0","10":"0"}', '1', '{"title":{"fr":"Malettes de capteurs"}}'),
(20, 0, 'capteur', NULL, 'Sensors', 'internal', NULL, NULL, 2, 'sidebar', 'icon-arrow-right12', '1', '{"1":"1","2":"1","4":"0","5":"0","8":"0","10":"0"}', NULL, '{"title":{"fr":"Capteurs"}}'),
(21, 0, 'salle', NULL, 'Soccer indoor rooms', 'internal', NULL, NULL, 4, 'sidebar', 'icon-link22', '1', '{"1":"1","2":"1","4":"1","5":"1","8":"1","10":"0"}', '1', '{"title":{"fr":"Terrains de football"}}'),
(22, 0, 'equipe', NULL, 'Teams', 'internal', NULL, NULL, 5, 'sidebar', 'icon-users', '1', '{"1":"1","2":"1","4":"0","5":"0","8":"0","10":"0"}', '1', '{"title":{"fr":"Equipes"}}'),
(23, 0, 'joueurCentre', NULL, 'Players', 'internal', NULL, NULL, 3, 'sidebar', 'icon-user', '1', '{"1":"1","2":"1","4":"0","5":"0","8":"0","10":"0"}', '1', '{"title":{"fr":"Joueurs du centre"}}'),
(24, 0, 'partie', NULL, 'Matchs', 'internal', NULL, NULL, 6, 'sidebar', 'icon-stopwatch', '1', '{"1":"1","2":"1","3":"1"}', NULL, '{"title":{"fr":"Parties"}}'),
(25, 29, 'joueurselectionne', NULL, 'Selected players', 'internal', NULL, NULL, 5, 'sidebar', 'icon-user-plus', '1', '{"1":"1","2":"1","3":"1"}', '1', '{"title":{"fr":"Joueurs s\\u00e9lectionn\\u00e9s"}}'),
(26, 29, 'sessionmesure', NULL, 'Measures session', 'internal', NULL, NULL, 4, 'sidebar', 'icon-arrow3', '1', '{"1":"1","2":"1","3":"1"}', '1', '{"title":{"fr":"Session de mesures"}}'),
(27, 29, 'mesure', NULL, 'Measures', 'internal', NULL, NULL, 7, 'sidebar', 'icon-stats-down', '1', '{"1":"1","2":"1","3":"1"}', '1', '{"title":{"fr":"Mesures"}}'),
(28, 29, 'mesurestoutes', NULL, 'All measures', 'internal', NULL, NULL, 2, 'sidebar', 'icon-stackoverflow', '1', '{"1":"1","2":"1","4":"0","5":"0","10":"0"}', NULL, '{"title":{"fr":"Toutes les mesures"}}'),
(29, 0, NULL, NULL, 'Tests', 'external', NULL, NULL, 9, 'sidebar', 'icon-question5', '1', '{"1":"1","2":"1","3":"1"}', NULL, '{"title":{"fr":"Tests"}}'),
(30, 29, NULL, 'http://ms-football-salles/2-site/public/envoiMesures', 'Send Measures', 'external', NULL, NULL, 0, 'sidebar', 'icon-mail-send', '0', '{"1":"1","2":"1","4":"0","5":"0","10":"0"}', '1', '{"title":{"fr":"Envoi mesures"}}'),
(31, 0, 'inscription', NULL, 'Check in', 'internal', NULL, NULL, 7, 'sidebar', 'icon-user-plus3', '1', '{"1":"1","2":"1","4":"1","5":"1","8":"1","10":"0"}', NULL, '{"title":{"fr":"Accueil joueurs"}}'),
(32, 0, 'statistiques', NULL, 'Statistics', 'internal', NULL, NULL, 8, 'sidebar', 'icon-stats-up', '0', '{"1":"1","2":"1","4":"1","5":"1","8":"1","10":"1"}', '1', '{"title":{"fr":"Statistiques"}}'),
(33, 29, 'accueiljoueurs', NULL, 'Instant Check in', 'internal', NULL, NULL, 1, 'sidebar', 'icon-user-plus3', '1', '{"1":"1","2":"1","4":"1","5":"1","8":"1","10":"0"}', '1', '{"title":{"fr":"Accueil joueurs et remise capteurs"}}'),
(34, 29, 'inscriptionsdates', NULL, 'Inscriptions dates', 'internal', NULL, NULL, 3, 'sidebar', 'icon-calendar', '1', '{"1":"1","2":"0","4":"0","5":"0","8":"0","10":"0"}', NULL, '{"title":{"fr":"Inscriptions mise en forme dates"}}'),
(35, 0, 'InscriptionJoueur', 'http://ms-football-salles-public/accueiljoueurs/update?return=', 'Player sign up', 'external', NULL, NULL, NULL, 'top', ' fa-user', '1', '{"1":"1","2":"1","4":"1","5":"1","8":"1","10":"1"}', '1', '{"title":{"fr":"Inscription joueur"}}');

-- --------------------------------------------------------

--
-- Structure de la table `tb_module`
--

CREATE TABLE `tb_module` (
  `module_id` int(11) NOT NULL,
  `module_name` varchar(100) DEFAULT NULL,
  `module_title` varchar(100) DEFAULT NULL,
  `module_note` varchar(255) DEFAULT NULL,
  `module_author` varchar(100) DEFAULT NULL,
  `module_created` timestamp NULL DEFAULT NULL,
  `module_desc` text,
  `module_db` varchar(255) DEFAULT NULL,
  `module_db_key` varchar(100) DEFAULT NULL,
  `module_type` enum('master','report','proccess','core','generic','addon','ajax') DEFAULT 'master',
  `module_config` longtext,
  `module_lang` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `tb_module`
--

INSERT INTO `tb_module` (`module_id`, `module_name`, `module_title`, `module_note`, `module_author`, `module_created`, `module_desc`, `module_db`, `module_db_key`, `module_type`, `module_config`, `module_lang`) VALUES
(1, 'users', 'User Lists', 'View All Users', 'Mango Tm', '2013-07-10 15:46:46', NULL, 'tb_users', 'id', 'core', 'eyJ0YWJsZV9kY4oIonR4XgVzZXJzo4w4cHJ1bWFyeV9rZXk4O4JlciVyXi3ko4w4Zp9ybV9jbixlbWa4OjosopZvcplfbGFmbgV0oj17opNvbHVtb4oIM4w4dG30bGU4O4JVciVycyxEYXRho4w4Zp9ybWF0oj24ZgJ1ZCosopR1cgBsYXk4O4J2bgJ1ep9udGFson0sonNxbF9zZWx3YgQ4O4JTRUxFQlQ5oHR4XgVzZXJzL42soCB0Y39ncp9lcHMubpFtZSBcc3xuR3JPTSB0Y39lciVycyBMRUZUoE1PSUa5dGJfZgJvdXBzoE9OoHR4XidybgVwcymncp9lcF91ZCA9oHR4XgVzZXJzLpdybgVwXi3koCosonNxbF9g6GVyZSoIo4A5oFdoRVJFoHR4XgVzZXJzLp3koCE9Jyc5oCosonNxbF9ncp9lcCoIo4A5oCA4LCJncp3koj1beyJp6WVsZCoIop3ko4w4YWx1YXM4O4J0Y39lciVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JJZCosonZ1ZXc4OjAsopR3dGF1bCoIMCw4ci9ydGF4bGU4OjAsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjAsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oxo4w4Yi9ub4oIeyJiYWx1ZCoIo4osopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24YXZhdGFyo4w4YWx1YXM4O4J0Y39lciVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JBdpF0YXo4LCJi6WVgoj2xLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2wLCJzZWFyYi54OjEsopRvdimsbiFkoj2wLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojMwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oyo4w4Yi9ub4oIeyJiYWx1ZCoIo4osopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24Zp3ycgRfbpFtZSosopFs6WFzoj24dGJfdXN3cnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24Rp3ycgQ5TpFtZSosonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4o4LCJzbgJ0bG3zdCoIojM4LCJjbimuoj17onZhbG3koj24o4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4JsYXN0XimhbWU4LCJhbG3hcyoIonR4XgVzZXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokxhcgQ5TpFtZSosonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4o4LCJzbgJ0bG3zdCoIojQ4LCJjbimuoj17onZhbG3koj24o4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4Jncp9lcF91ZCosopFs6WFzoj24dGJfdXN3cnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24RgJvdXA4LCJi6WVgoj2xLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2wLCJzZWFyYi54OjEsopRvdimsbiFkoj2wLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24NSosopNvbpa4Ons4dpFs6WQ4O4oxo4w4ZGo4O4J0Y39ncp9lcHM4LCJrZXk4O4Jncp9lcF91ZCosopR1cgBsYXk4O4JuYWl3on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4JjbHV4Xi3ko4w4YWx1YXM4O4J0Y39lciVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JSXHUwMGUmciVhdSosonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oio4w4Yi9ub4oIeyJiYWx1ZCoIojE4LCJkY4oIopZ4cl9yZXN3YXVaXgNhbGx3cyosopt3eSoIopNsdWJf6WQ4LCJk6XNwbGFmoj24bp9tfHZ1bGx3on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4JjbilwbGVaZV9zYWxsZV91ZCosopFs6WFzoj24dGJfdXN3cnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24Qi9tcGx3eGU4LCJi6WVgoj2xLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24NyosopNvbpa4Ons4dpFs6WQ4O4oxo4w4ZGo4O4JpYnNfYi9tcGx3eGVfciFsbGVzo4w46iVmoj24Yi9tcGx3eGVfciFsbGVf6WQ4LCJk6XNwbGFmoj24bp9tfHZ1bGx3on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4J3bWF1bCosopFs6WFzoj24dGJfdXN3cnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24RWlh6Ww4LCJi6WVgoj2xLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24o4w4ci9ydGx1cgQ4O4oao4w4Yi9ub4oIeyJiYWx1ZCoIo4osopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24cGFzcgdvcpQ4LCJhbG3hcyoIonR4XgVzZXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3BhcgNgbgJko4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMCw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMCw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojk4LCJjbimuoj17onZhbG3koj24o4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4Jsbid1b39hdHR3bXB0o4w4YWx1YXM4O4J0Y39lciVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JMbid1b4BBdHR3bXB0o4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMCw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMCw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojEwo4w4Yi9ub4oIeyJiYWx1ZCoIo4osopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24dXN3cpmhbWU4LCJhbG3hcyoIonR4XgVzZXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3VzZXJuYWl3o4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIo4osonNvcnRs6XN0oj24MTE4LCJjbimuoj17onZhbG3koj24o4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4JuYWl3o4w4YWx1YXM4O4J0Y39ncp9lcHM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24RgJvdXA4LCJi6WVgoj2wLCJkZXRh6Ww4OjAsonNvcnRhYpx3oj2wLCJzZWFyYi54OjEsopRvdimsbiFkoj2wLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24MTo4LCJjbimuoj17onZhbG3koj24o4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4JjcpVhdGVkXiF0o4w4YWx1YXM4O4J0Y39lciVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JDcpVhdGVkoEF0o4w4dp33dyoIMCw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMCw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojEzo4w4Yi9ub4oIeyJiYWx1ZCoIo4osopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24bGFzdF9sbid1b4osopFs6WFzoj24dGJfdXN3cnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24TGFzdCBMbid1b4osonZ1ZXc4OjAsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjAsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oxNCosopNvbpa4Ons4dpFs6WQ4O4o4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIonVwZGF0ZWRfYXQ4LCJhbG3hcyoIonR4XgVzZXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3VwZGF0ZWQ5QXQ4LCJi6WVgoj2wLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24MTU4LCJjbimuoj17onZhbG3koj24o4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4JhYgR1dpU4LCJhbG3hcyoIonR4XgVzZXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokFjdG3iZSosonZ1ZXc4OjAsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjAsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4o4LCJzbgJ0bG3zdCoIojEio4w4Yi9ub4oIeyJiYWx1ZCoIo4osopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24cpVt6WmkZXo4LCJhbG3hcyoIonR4XgVzZXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3J3bW3uZGVyo4w4dp33dyoIMCw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojEgo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIopFjdG3iYXR1bia4LCJhbG3hcyoIonR4XgVzZXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokFjdG3iYXR1bia4LCJi6WVgoj2wLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24MT54LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24cpVtZWl4ZXJfdG9rZWa4LCJhbG3hcyoIonR4XgVzZXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3J3bWVtYpVyoFRv6iVuo4w4dp33dyoIMCw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojEmo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIopxhcgRfYWN06XZ1dHk4LCJhbG3hcyoIonR4XgVzZXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokxhcgQ5QWN06XZ1dHk4LCJi6WVgoj2wLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24MjA4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fV0sopZvcplzoj1beyJp6WVsZCoIop3ko4w4YWx1YXM4O4J0Y39lciVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JJZCosopZvcplfZgJvdXA4O4owo4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIoph1ZGR3b4osopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4O4oxo4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24o4w46WlhZiVfbXVsdG3wbGU4O4o4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIopdybgVwXi3ko4w4YWx1YXM4O4J0Y39lciVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JHcp9lcCBcLyBMZXZ3bCosopZvcplfZgJvdXA4O4owo4w4cpVxdW3yZWQ4O4JyZXFl6XJ3ZCosonZ1ZXc4OjEsonRmcGU4O4JzZWx3YgQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24M4osopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4J3eHR3cpmhbCosopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIonR4XidybgVwcyosopxvbitlcF9rZXk4O4Jncp9lcF91ZCosopxvbitlcF9iYWxlZSoIopmhbWU4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24o4w46WlhZiVfbXVsdG3wbGU4O4o4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIopNsdWJf6WQ4LCJhbG3hcyoIonR4XgVzZXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3JcdTAwZT3zZWFloCosopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2xLCJ0eXB3oj24ciVsZWN0o4w4YWRkoj2xLCJz6X13oj24MCosopVk6XQ4OjEsonN3YXJj6CoIojE4LCJzbgJ0bG3zdCoIojM4LCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24ZXh0ZXJuYWw4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4JpYnNfcpVzZWFleF9zYWxsZXM4LCJsbi9rdXBf6iVmoj24YixlY391ZCosopxvbitlcF9iYWxlZSoIopmvbXxi6WxsZSosop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24U3xlMDB3OXN3YXU5ZGU5ciFsbGVzoGR3oHNwbgJ0oGRvbnQ5bCdldG3s6XNhdGVlc4B3cgQ5cpVwcG9uciF4bGU4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIopNvbXBsZXh3XgNhbGx3Xi3ko4w4YWx1YXM4O4J0Y39lciVycyosopxhYpVsoj24Qi9tcGx3eGU5cgBvcnR1Z4osopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2xLCJ0eXB3oj24ciVsZWN0o4w4YWRkoj2xLCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci3IZSoIo4osonNvcnRs6XN0oj24NCosopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4J3eHR3cpmhbCosopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIopZ4cl9jbilwbGVaZV9zYWxsZXM4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24bp9tfHZ1bGx3o4w46XNfZGVwZWmkZWmjeSoIojE4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24YixlY391ZCosonBhdGhfdG9fdXBsbiFkoj24o4w4dXBsbiFkXgRmcGU4OpmlbGwsonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JlciVybpFtZSosopFs6WFzoj24dGJfdXN3cnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24VXN3cpmhbWU4LCJpbgJtXidybgVwoj24MCosonJ3cXV1cpVkoj24cpVxdW3yZWQ4LCJi6WVgoj2xLCJ0eXB3oj24dGVadCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4O4olo4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24o4w46WlhZiVfbXVsdG3wbGU4O4o4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIopZ1cnN0XimhbWU4LCJhbG3hcyoIonR4XgVzZXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokZ1cnN0oEmhbWU4LCJpbgJtXidybgVwoj24MCosonJ3cXV1cpVkoj24cpVxdW3yZWQ4LCJi6WVgoj2xLCJ0eXB3oj24dGVadCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4O4oio4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24o4w46WlhZiVfbXVsdG3wbGU4O4o4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIopxhcgRfbpFtZSosopFs6WFzoj24dGJfdXN3cnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24TGFzdCBOYWl3o4w4Zp9ybV9ncp9lcCoIojA4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2xLCJ0eXB3oj24dGVadCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4O4ogo4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24o4w46WlhZiVfbXVsdG3wbGU4O4o4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIopVtYW3so4w4YWx1YXM4O4J0Y39lciVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JFbWF1bCosopZvcplfZgJvdXA4O4owo4w4cpVxdW3yZWQ4O4J3bWF1bCosonZ1ZXc4OjEsonRmcGU4O4J0ZXh0o4w4YWRkoj2xLCJz6X13oj24MCosopVk6XQ4OjEsonN3YXJj6CoIojE4LCJzbgJ0bG3zdCoIoj54LCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24o4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4o4LCJ1bWFnZV9tdWx06XBsZSoIo4osopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24cGFzcgdvcpQ4LCJhbG3hcyoIonR4XgVzZXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3BhcgNgbgJko4w4Zp9ybV9ncp9lcCoIojA4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2xLCJ0eXB3oj24dGVadCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4O4omo4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIojA4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIo4osop3tYWd3XillbHR1cGx3oj24o4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4Jsbid1b39hdHR3bXB0o4w4YWx1YXM4O4J0Y39lciVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JMbid1b4BBdHR3bXB0o4w4Zp9ybV9ncp9lcCoIojA4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2wLCJ0eXB3oj24dGVadCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54OjAsonNvcnRs6XN0oj24MTA4LCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24o4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4o4LCJ1bWFnZV9tdWx06XBsZSoIo4osopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24bGFzdF9sbid1b4osopFs6WFzoj24dGJfdXN3cnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24TGFzdCBMbid1b4osopZvcplfZgJvdXA4O4oxo4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMCw4dH3wZSoIonR3eHQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj2wLCJzbgJ0bG3zdCoIojExo4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIojA4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIo4osop3tYWd3XillbHR1cGx3oj24o4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JhdpF0YXo4LCJhbG3hcyoIonR4XgVzZXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokFiYXRhc4osopZvcplfZgJvdXA4O4oxo4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIonR3eHQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj2wLCJzbgJ0bG3zdCoIojEyo4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24XC9lcGxvYWRzXC9lciVyclwvo4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj246WlhZiU4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JhYgR1dpU4LCJhbG3hcyoIonR4XgVzZXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3N0YXRlcyosopZvcplfZgJvdXA4O4oxo4w4cpVxdW3yZWQ4O4JyZXFl6XJ3ZCosonZ1ZXc4OjEsonRmcGU4O4JyYWR1byosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4O4oxMyosopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4JkYXRhbG3zdCosopxvbitlcF9xdWVyeSoIojAISWmh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', '{"title":{"id":""},"note":{"id":""}}'),
(2, 'groups', 'Users Group', 'View All', 'Mango Tm', '2013-07-10 06:45:14', NULL, 'tb_groups', 'group_id', 'core', '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O4JJRCosonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojA4LCJhdHRy6WJldGU4Ons46H3wZXJs6Wmroj17opFjdG3iZSoIMCw4bG3u6yoIo4osonRhcpd3dCoIo39zZWxpo4w46HRtbCoIo4J9LCJ1bWFnZSoIeyJhYgR1dpU4OjAsonBhdG54O4o4LCJz6X13Xg54O4o4LCJz6X13Xgk4O4o4LCJ2dGlsoj24onl9fSx7opZ1ZWxkoj24bpFtZSosopFs6WFzoj24dGJfZgJvdXBzo4w4bGF4ZWw4O4JOYWl3o4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJg6WR06CoIojEwMCosopFs6Wduoj24o4w4ci9ydGx1cgQ4O4oxo4w4YXR0cp34dXR3oj17ophmcGVybG3u6yoIeyJhYgR1dpU4OjAsopx1bps4O4o4LCJ0YXJnZXQ4O4JfciVsZ4osoph0bWw4O4o4fSw46WlhZiU4Ons4YWN06XZ3oj2wLCJwYXR2oj24o4w4ci3IZV9aoj24o4w4ci3IZV9moj24o4w46HRtbCoIo4J9fX0seyJp6WVsZCoIopR3ciNy6XB06W9uo4w4YWx1YXM4O4J0Y39ncp9lcHM4LCJsYWJ3bCoIokR3ciNy6XB06W9uo4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJg6WR06CoIojEwMCosopFs6Wduoj24o4w4ci9ydGx1cgQ4O4oyo4w4YXR0cp34dXR3oj17ophmcGVybG3u6yoIeyJhYgR1dpU4OjAsopx1bps4O4o4LCJ0YXJnZXQ4O4JfciVsZ4osoph0bWw4O4o4fSw46WlhZiU4Ons4YWN06XZ3oj2wLCJwYXR2oj24o4w4ci3IZV9aoj24o4w4ci3IZV9moj24o4w46HRtbCoIo4J9fX0seyJp6WVsZCoIopx3dpVso4w4YWx1YXM4O4J0Y39ncp9lcHM4LCJsYWJ3bCoIokx3dpVso4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24MyosopF0dHJ1YnV0ZSoIeyJ2eXB3cpx1bps4Ons4YWN06XZ3oj2wLCJs6Wmroj24o4w4dGFyZiV0oj24XgN3bGY4LCJ2dGlsoj24on0sop3tYWd3oj17opFjdG3iZSoIMCw4cGF06CoIo4osonN1epVfeCoIo4osonN1epVfeSoIo4osoph0bWw4O4o4fXl9XX0=', '{"title":{"id":""},"note":{"id":""}}'),
(4, 'module', 'Module Management', 'All module applications', 'Mango Tm', '2013-08-25 04:58:43', NULL, 'tb_module', 'module_id', 'core', 'eyJ0YWJsZV9kY4oIonR4XilvZHVsZSosonBy6Wlhcn3f6iVmoj24bW9kdWx3Xi3ko4w4cgFsXgN3bGVjdCoIo3NFTEVDVCB0Y39tbiRlbGUubW9kdWx3Xi3kLHR4XilvZHVsZSmtbiRlbGVfbpFtZSx0Y39tbiRlbGUubW9kdWx3XgR1dGx3LHR4XilvZHVsZSmtbiRlbGVfbp90ZSx0Y39tbiRlbGUubW9kdWx3XiFldGhvc4x0Y39tbiRlbGUubW9kdWx3XiNyZWF0ZWQsdGJfbW9kdWx3LplvZHVsZV9kZXNjLHR4XilvZHVsZSmtbiRlbGVfZGosdGJfbW9kdWx3LplvZHVsZV9kY39rZXksdGJfbW9kdWx3LplvZHVsZV90eXB3LHR4XilvZHVsZSmncp9lcF91ZCx0Y39tbiRlbGUubW9kdWx3XgBhdG55oEZST005dGJfbW9kdWx3oCosonNxbF9g6GVyZSoIo4A5oFdoRVJFoHR4XilvZHVsZSmtbiRlbGVf6WQ5SVM5Tk9UoEmVTEw5QUmEoGlvZHVsZV9uYWl3oCE9JilvZHVsZSc5oCosonNxbF9ncp9lcCoIo4A5oCA4LCJpbgJtcyoIWgs4Zp33bGQ4O4JtbiRlbGVf6WQ4LCJhbG3hcyoIonR4XilvZHVsZSosopxhYpVsoj24TW9kdWx3oE3ko4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24MCosonZ1ZXc4OjEsonRmcGU4O4J26WRkZWa4LCJhZGQ4OpZhbHN3LCJ3ZG30oj1pYWxzZSw4ciVhcpN2oj2wLCJz6X13oj24cgBhbjEyo4w4ci9ydGx1cgQ4O4owo4w4bgB06W9uoj17op9wdF90eXB3oj1pYWxzZSw4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIZpFsciUsopxvbitlcF9iYWxlZSoIZpFsciUsop3zXiR3cGVuZGVuYgk4OpZhbHN3LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4OpZhbHN3LCJwYXR2XgRvXgVwbG9hZCoIo4osonVwbG9hZF90eXB3oj1pYWxzZSw4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24bW9kdWx3XimhbWU4LCJhbG3hcyoIonR4XilvZHVsZSosopxhYpVsoj24TW9kdWx3oEmhbWU4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMCw4dH3wZSoIonR3eHQ4LCJhZGQ4O4o4LCJ3ZG30oj24o4w4ciVhcpN2oj2xLCJz6X13oj24cgBhbjEyo4w4ci9ydGx1cgQ4OjEsop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIojA4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JtbiRlbGVfdG30bGU4LCJhbG3hcyoIonR4XilvZHVsZSosopxhYpVsoj24TW9kdWx3oFR1dGx3o4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24MSosonZ1ZXc4OjEsonRmcGU4O4J0ZXh0o4w4YWRkoj24o4w4ZWR1dCoIo4osonN3YXJj6CoIMSw4ci3IZSoIonNwYWaxM4osonNvcnRs6XN0oj2yLCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4owo4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24bW9kdWx3XimvdGU4LCJhbG3hcyoIonR4XilvZHVsZSosopxhYpVsoj24TW9kdWx3oEmvdGU4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4o4LCJi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dGVuZF9jbGFzcyoIo4J9fV0sopdy6WQ4O3t7opZ1ZWxkoj24bW9kdWx3Xi3ko4w4YWx1YXM4O4J0Y39tbiRlbGU4LCJsYWJ3bCoIoklvZHVsZSBJZCosonZ1ZXc4OjAsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjAsopZybg13b4oIMSw4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojE4LCJhdHRy6WJldGU4Ons46H3wZXJs6Wmroj17opFjdG3iZSoIMCw4bG3u6yoIo4osonRhcpd3dCoIo39zZWxpo4w46HRtbCoIo4J9LCJ1bWFnZSoIeyJhYgR1dpU4OjAsonBhdG54O4o4LCJz6X13Xg54O4o4LCJz6X13Xgk4O4o4LCJ2dGlsoj24onl9fSx7opZ1ZWxkoj24bW9kdWx3XgBhdG54LCJhbG3hcyoIonR4XilvZHVsZSosopxhYpVsoj24QXBwcyosonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojo4LCJhdHRy6WJldGU4Ons46H3wZXJs6Wmroj17opFjdG3iZSoIMCw4bG3u6yoIo4osonRhcpd3dCoIo39zZWxpo4w46HRtbCoIo4J9LCJ1bWFnZSoIeyJhYgR1dpU4OjAsonBhdG54O4o4LCJz6X13Xg54O4o4LCJz6X13Xgk4O4o4LCJ2dGlsoj24onl9fSx7opZ1ZWxkoj24bW9kdWx3XimhbWU4LCJhbG3hcyoIonR4XilvZHVsZSosopxhYpVsoj24Qi9udHJvbGx3c4osonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojM4LCJhdHRy6WJldGU4Ons46H3wZXJs6Wmroj17opFjdG3iZSoIMCw4bG3u6yoIo4osonRhcpd3dCoIo39zZWxpo4w46HRtbCoIo4J9LCJ1bWFnZSoIeyJhYgR1dpU4OjAsonBhdG54O4o4LCJz6X13Xg54O4o4LCJz6X13Xgk4O4o4LCJ2dGlsoj24onl9fSx7opZ1ZWxkoj24bW9kdWx3XgR1dGx3o4w4YWx1YXM4O4J0Y39tbiRlbGU4LCJsYWJ3bCoIoklvZHVsZSBOYWl3o4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJg6WR06CoIojEyMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24NCosopF0dHJ1YnV0ZSoIeyJ2eXB3cpx1bps4Ons4YWN06XZ3oj2wLCJs6Wmroj24o4w4dGFyZiV0oj24XgN3bGY4LCJ2dGlsoj24on0sop3tYWd3oj17opFjdG3iZSoIMCw4cGF06CoIo4osonN1epVfeCoIo4osonN1epVfeSoIo4osoph0bWw4O4o4fXl9LHs4Zp33bGQ4O4JtbiRlbGVfbp90ZSosopFs6WFzoj24dGJfbW9kdWx3o4w4bGF4ZWw4O4JObgR3o4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJg6WR06CoIojElMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24NSosopF0dHJ1YnV0ZSoIeyJ2eXB3cpx1bps4Ons4YWN06XZ3oj2wLCJs6Wmroj24o4w4dGFyZiV0oj24XgN3bGY4LCJ2dGlsoj24on0sop3tYWd3oj17opFjdG3iZSoIMCw4cGF06CoIo4osonN1epVfeCoIo4osonN1epVfeSoIo4osoph0bWw4O4o4fXl9LHs4Zp33bGQ4O4JtbiRlbGVfYXV06G9yo4w4YWx1YXM4O4J0Y39tbiRlbGU4LCJsYWJ3bCoIokFldGhvc4osonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojY4LCJhdHRy6WJldGU4Ons46H3wZXJs6Wmroj17opFjdG3iZSoIMCw4bG3u6yoIo4osonRhcpd3dCoIo39zZWxpo4w46HRtbCoIo4J9LCJ1bWFnZSoIeyJhYgR1dpU4OjAsonBhdG54O4o4LCJz6X13Xg54O4o4LCJz6X13Xgk4O4o4LCJ2dGlsoj24onl9fSx7opZ1ZWxkoj24bW9kdWx3XiNyZWF0ZWQ4LCJhbG3hcyoIonR4XilvZHVsZSosopxhYpVsoj24QgJ3YXR3ZCosonZ1ZXc4OjAsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjAsopZybg13b4oIMSw4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojc4LCJhdHRy6WJldGU4Ons46H3wZXJs6Wmroj17opFjdG3iZSoIMCw4bG3u6yoIo4osonRhcpd3dCoIo39zZWxpo4w46HRtbCoIo4J9LCJ1bWFnZSoIeyJhYgR1dpU4OjAsonBhdG54O4o4LCJz6X13Xg54O4o4LCJz6X13Xgk4O4o4LCJ2dGlsoj24onl9fSx7opZ1ZWxkoj24bW9kdWx3XiR3ciM4LCJhbG3hcyoIonR4XilvZHVsZSosopxhYpVsoj24TW9kdWx3oER3ciM4LCJi6WVgoj2wLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oao4w4YXR0cp34dXR3oj17ophmcGVybG3u6yoIeyJhYgR1dpU4OjAsopx1bps4O4o4LCJ0YXJnZXQ4O4JfciVsZ4osoph0bWw4O4o4fSw46WlhZiU4Ons4YWN06XZ3oj2wLCJwYXR2oj24o4w4ci3IZV9aoj24o4w4ci3IZV9moj24o4w46HRtbCoIo4J9fX0seyJp6WVsZCoIoplvZHVsZV9kY4osopFs6WFzoj24dGJfbW9kdWx3o4w4bGF4ZWw4O4JNbiRlbGU5RGo4LCJi6WVgoj2wLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4omo4w4YXR0cp34dXR3oj17ophmcGVybG3u6yoIeyJhYgR1dpU4OjAsopx1bps4O4o4LCJ0YXJnZXQ4O4JfciVsZ4osoph0bWw4O4o4fSw46WlhZiU4Ons4YWN06XZ3oj2wLCJwYXR2oj24o4w4ci3IZV9aoj24o4w4ci3IZV9moj24o4w46HRtbCoIo4J9fX0seyJp6WVsZCoIoplvZHVsZV9kY39rZXk4LCJhbG3hcyoIonR4XilvZHVsZSosopxhYpVsoj24TW9kdWx3oER4oEt3eSosonZ1ZXc4OjAsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojEwo4w4YXR0cp34dXR3oj17ophmcGVybG3u6yoIeyJhYgR1dpU4OjAsopx1bps4O4o4LCJ0YXJnZXQ4O4JfciVsZ4osoph0bWw4O4o4fSw46WlhZiU4Ons4YWN06XZ3oj2wLCJwYXR2oj24o4w4ci3IZV9aoj24o4w4ci3IZV9moj24o4w46HRtbCoIo4J9fX0seyJp6WVsZCoIoplvZHVsZV90eXB3o4w4YWx1YXM4O4J0Y39tbiRlbGU4LCJsYWJ3bCoIo3RmcGU4LCJi6WVgoj2xLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oxMSosopF0dHJ1YnV0ZSoIeyJ2eXB3cpx1bps4Ons4YWN06XZ3oj2wLCJs6Wmroj24o4w4dGFyZiV0oj24XgN3bGY4LCJ2dGlsoj24on0sop3tYWd3oj17opFjdG3iZSoIMCw4cGF06CoIo4osonN1epVfeCoIo4osonN1epVfeSoIo4osoph0bWw4O4o4fXl9LHs4Zp33bGQ4O4Jncp9lcF91ZCosopFs6WFzoj24dGJfbW9kdWx3o4w4bGF4ZWw4O4JHcp9lcCBJZCosonZ1ZXc4OjAsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjAsopZybg13b4oIMSw4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojEyo4w4YXR0cp34dXR3oj17ophmcGVybG3u6yoIeyJhYgR1dpU4OjAsopx1bps4O4o4LCJ0YXJnZXQ4O4JfciVsZ4osoph0bWw4O4o4fSw46WlhZiU4Ons4YWN06XZ3oj2wLCJwYXR2oj24o4w4ci3IZV9aoj24o4w4ci3IZV9moj24o4w46HRtbCoIo4J9fXldfQ==', NULL),
(7, 'menu', 'Menu Management', 'Manage All Menu', 'Mango Tm', '2014-01-06 07:50:29', NULL, 'tb_menu', 'menu_id', 'core', 'eyJ0YWJsZV9kY4oIonR4Xil3bnU4LCJwcp3tYXJmXit3eSoIopl3bnVf6WQ4LCJzcWxfciVsZWN0oj24U0VMRUNUoHR4Xil3bnUuK4A5R3JPTSB0Y39tZWmloCosonNxbF9g6GVyZSoIo4BXSEVSRSB0Y39tZWmlLpl3bnVf6WQ5SVM5Tk9UoEmVTEw4LCJzcWxfZgJvdXA4O4o4LCJncp3koj1beyJp6WVsZCoIopl3bnVf6WQ4LCJhbG3hcyoIonR4Xil3bnU4LCJsYWJ3bCoIokl3bnU5SWQ4LCJi6WVgoj24MCosopR3dGF1bCoIojA4LCJzbgJ0YWJsZSoIojE4LCJzZWFyYi54O4oxo4w4ZG9gbpxvYWQ4O4oxo4w4ZnJvepVuoj24MCosoph1ZGR3b4oIojA4LCJhbG3nb4oIopx3ZnQ4LCJg6WR06CoIojEwMCosonNvcnRs6XN0oj24MCosopF0dHJ1YnV0ZSoIeyJ2eXB3cpx1bps4Ons4YWN06XZ3oj1pYWxzZSw4bG3u6yoIo4osonRhcpd3dCoIo4osoph0bWw4O4o4fSw46WlhZiU4Ons4YWN06XZ3oj1pYWxzZSw4cGF06CoIo4osonN1epVfeCoIo4osonN1epVfeSoIo4osoph0bWw4O4o4fX0sonRmcGU4O4J0ZXh0on0seyJp6WVsZCoIonBhcpVudF91ZCosopFs6WFzoj24dGJfbWVudSosopxhYpVsoj24UGFyZWm0oE3ko4w4dp33dyoIojE4LCJkZXRh6Ww4O4oxo4w4ci9ydGF4bGU4O4oxo4w4ciVhcpN2oj24MSosopRvdimsbiFkoj24MSosopZybg13b4oIojA4LCJ26WRkZWa4O4oxo4w4YWx1Zia4O4JsZWZ0o4w4di3kdG54O4oxMDA4LCJzbgJ0bG3zdCoIojE4LCJhdHRy6WJldGU4Ons46H3wZXJs6Wmroj17opFjdG3iZSoIZpFsciUsopx1bps4O4o4LCJ0YXJnZXQ4O4o4LCJ2dGlsoj24on0sop3tYWd3oj17opFjdG3iZSoIZpFsciUsonBhdG54O4o4LCJz6X13Xg54O4o4LCJz6X13Xgk4O4o4LCJ2dGlsoj24onl9LCJ0eXB3oj24dGVadCJ9LHs4Zp33bGQ4O4JtbiRlbGU4LCJhbG3hcyoIonR4Xil3bnU4LCJsYWJ3bCoIoklvZHVsZSosonZ1ZXc4O4oxo4w4ZGV0YW3soj24MSosonNvcnRhYpx3oj24MSosonN3YXJj6CoIojE4LCJkbgdubG9hZCoIojE4LCJpcp9IZWa4O4owo4w46G3kZGVuoj24MCosopFs6Wduoj24bGVpdCosond1ZHR2oj24MTUwo4w4ci9ydGx1cgQ4O4ozo4w4YXR0cp34dXR3oj17ophmcGVybG3u6yoIeyJhYgR1dpU4OpZhbHN3LCJs6Wmroj24o4w4dGFyZiV0oj24o4w46HRtbCoIo4J9LCJ1bWFnZSoIeyJhYgR1dpU4OpZhbHN3LCJwYXR2oj24o4w4ci3IZV9aoj24o4w4ci3IZV9moj24o4w46HRtbCoIo4J9fSw4dH3wZSoIonR3eHQ4fSx7opZ1ZWxkoj24dXJso4w4YWx1YXM4O4J0Y39tZWmlo4w4bGF4ZWw4O4JVcpw4LCJi6WVgoj24MCosopR3dGF1bCoIojA4LCJzbgJ0YWJsZSoIojE4LCJzZWFyYi54O4oxo4w4ZG9gbpxvYWQ4O4oxo4w4ZnJvepVuoj24MCosoph1ZGR3b4oIojA4LCJhbG3nb4oIopx3ZnQ4LCJg6WR06CoIojEwMCosonNvcnRs6XN0oj24MyosopF0dHJ1YnV0ZSoIeyJ2eXB3cpx1bps4Ons4YWN06XZ3oj1pYWxzZSw4bG3u6yoIo4osonRhcpd3dCoIo4osoph0bWw4O4o4fSw46WlhZiU4Ons4YWN06XZ3oj1pYWxzZSw4cGF06CoIo4osonN1epVfeCoIo4osonN1epVfeSoIo4osoph0bWw4O4o4fX0sonRmcGU4O4J0ZXh0on0seyJp6WVsZCoIopl3bnVfbpFtZSosopFs6WFzoj24dGJfbWVudSosopxhYpVsoj24TWVudSBOYWl3o4w4dp33dyoIojE4LCJkZXRh6Ww4O4oxo4w4ci9ydGF4bGU4O4oxo4w4ciVhcpN2oj24MSosopRvdimsbiFkoj24MSosopZybg13b4oIojA4LCJ26WRkZWa4O4owo4w4YWx1Zia4O4JsZWZ0o4w4di3kdG54O4ozMDA4LCJzbgJ0bG3zdCoIojo4LCJhdHRy6WJldGU4Ons46H3wZXJs6Wmroj17opFjdG3iZSoIZpFsciUsopx1bps4O4o4LCJ0YXJnZXQ4O4o4LCJ2dGlsoj24on0sop3tYWd3oj17opFjdG3iZSoIZpFsciUsonBhdG54O4o4LCJz6X13Xg54O4o4LCJz6X13Xgk4O4o4LCJ2dGlsoj24onl9LCJ0eXB3oj24dGVadCJ9LHs4Zp33bGQ4O4JtZWmlXgRmcGU4LCJhbG3hcyoIonR4Xil3bnU4LCJsYWJ3bCoIokl3bnU5VH3wZSosonZ1ZXc4O4owo4w4ZGV0YW3soj24MCosonNvcnRhYpx3oj24MSosonN3YXJj6CoIojE4LCJkbgdubG9hZCoIojE4LCJpcp9IZWa4O4owo4w46G3kZGVuoj24MCosopFs6Wduoj24bGVpdCosond1ZHR2oj24MTAwo4w4ci9ydGx1cgQ4O4olo4w4YXR0cp34dXR3oj17ophmcGVybG3u6yoIeyJhYgR1dpU4OpZhbHN3LCJs6Wmroj24o4w4dGFyZiV0oj24o4w46HRtbCoIo4J9LCJ1bWFnZSoIeyJhYgR1dpU4OpZhbHN3LCJwYXR2oj24o4w4ci3IZV9aoj24o4w4ci3IZV9moj24o4w46HRtbCoIo4J9fSw4dH3wZSoIonR3eHQ4fSx7opZ1ZWxkoj24cp9sZV91ZCosopFs6WFzoj24dGJfbWVudSosopxhYpVsoj24Up9sZSBJZCosonZ1ZXc4O4owo4w4ZGV0YW3soj24MSosonNvcnRhYpx3oj24MSosonN3YXJj6CoIojE4LCJkbgdubG9hZCoIojE4LCJpcp9IZWa4O4owo4w46G3kZGVuoj24MCosopFs6Wduoj24bGVpdCosond1ZHR2oj24MTAwo4w4ci9ydGx1cgQ4O4oio4w4YXR0cp34dXR3oj17ophmcGVybG3u6yoIeyJhYgR1dpU4OpZhbHN3LCJs6Wmroj24o4w4dGFyZiV0oj24o4w46HRtbCoIo4J9LCJ1bWFnZSoIeyJhYgR1dpU4OpZhbHN3LCJwYXR2oj24o4w4ci3IZV9aoj24o4w4ci3IZV9moj24o4w46HRtbCoIo4J9fSw4dH3wZSoIonR3eHQ4fSx7opZ1ZWxkoj24ZGV3cCosopFs6WFzoj24dGJfbWVudSosopxhYpVsoj24RGV3cCosonZ1ZXc4O4owo4w4ZGV0YW3soj24MSosonNvcnRhYpx3oj24MSosonN3YXJj6CoIojE4LCJkbgdubG9hZCoIojE4LCJpcp9IZWa4O4owo4w46G3kZGVuoj24MCosopFs6Wduoj24bGVpdCosond1ZHR2oj24MTAwo4w4ci9ydGx1cgQ4O4ogo4w4YXR0cp34dXR3oj17ophmcGVybG3u6yoIeyJhYgR1dpU4OpZhbHN3LCJs6Wmroj24o4w4dGFyZiV0oj24o4w46HRtbCoIo4J9LCJ1bWFnZSoIeyJhYgR1dpU4OpZhbHN3LCJwYXR2oj24o4w4ci3IZV9aoj24o4w4ci3IZV9moj24o4w46HRtbCoIo4J9fSw4dH3wZSoIonR3eHQ4fSx7opZ1ZWxkoj24bgJkZXJ1bpc4LCJhbG3hcyoIonR4Xil3bnU4LCJsYWJ3bCoIok9yZCosonZ1ZXc4O4oxo4w4ZGV0YW3soj24MSosonNvcnRhYpx3oj24MSosonN3YXJj6CoIojE4LCJkbgdubG9hZCoIojE4LCJpcp9IZWa4O4owo4w46G3kZGVuoj24MCosopFs6Wduoj24bGVpdCosond1ZHR2oj24NTA4LCJzbgJ0bG3zdCoIoj54LCJhdHRy6WJldGU4Ons46H3wZXJs6Wmroj17opFjdG3iZSoIZpFsciUsopx1bps4O4o4LCJ0YXJnZXQ4O4o4LCJ2dGlsoj24on0sop3tYWd3oj17opFjdG3iZSoIZpFsciUsonBhdG54O4o4LCJz6X13Xg54O4o4LCJz6X13Xgk4O4o4LCJ2dGlsoj24onl9LCJ0eXB3oj24dGVadCJ9LHs4Zp33bGQ4O4JwbgN1dG3vb4osopFs6WFzoj24dGJfbWVudSosopxhYpVsoj24UG9z6XR1bia4LCJi6WVgoj24MCosopR3dGF1bCoIojA4LCJzbgJ0YWJsZSoIojE4LCJzZWFyYi54O4oxo4w4ZG9gbpxvYWQ4O4oxo4w4ZnJvepVuoj24MCosoph1ZGR3b4oIojA4LCJhbG3nb4oIopx3ZnQ4LCJg6WR06CoIojEwMCosonNvcnRs6XN0oj24OSosopF0dHJ1YnV0ZSoIeyJ2eXB3cpx1bps4Ons4YWN06XZ3oj1pYWxzZSw4bG3u6yoIo4osonRhcpd3dCoIo4osoph0bWw4O4o4fSw46WlhZiU4Ons4YWN06XZ3oj1pYWxzZSw4cGF06CoIo4osonN1epVfeCoIo4osonN1epVfeSoIo4osoph0bWw4O4o4fX0sonRmcGU4O4J0ZXh0on0seyJp6WVsZCoIopl3bnVf6WNvbnM4LCJhbG3hcyoIonR4Xil3bnU4LCJsYWJ3bCoIo4BJYi9uo4w4dp33dyoIojE4LCJkZXRh6Ww4O4oxo4w4ci9ydGF4bGU4O4oxo4w4ciVhcpN2oj24MSosopRvdimsbiFkoj24MSosopZybg13b4oIojA4LCJ26WRkZWa4O4owo4w4YWx1Zia4O4JsZWZ0o4w4di3kdG54O4olMCosonNvcnRs6XN0oj24MTA4LCJhdHRy6WJldGU4Ons46H3wZXJs6Wmroj17opFjdG3iZSoIZpFsciUsopx1bps4O4o4LCJ0YXJnZXQ4O4o4LCJ2dGlsoj24on0sop3tYWd3oj17opFjdG3iZSoIZpFsciUsonBhdG54O4o4LCJz6X13Xg54O4o4LCJz6X13Xgk4O4o4LCJ2dGlsoj24onl9LCJ0eXB3oj24dGVadCJ9LHs4Zp33bGQ4O4JhYgR1dpU4LCJhbG3hcyoIonR4Xil3bnU4LCJsYWJ3bCoIokFjdG3iZSosonZ1ZXc4O4oxo4w4ZGV0YW3soj24MSosonNvcnRhYpx3oj24MSosonN3YXJj6CoIojE4LCJkbgdubG9hZCoIojE4LCJpcp9IZWa4O4owo4w46G3kZGVuoj24MCosond1ZHR2oj24NTA4LCJhbG3nb4oIopN3bnR3c4osonNvcnRs6XN0oj24NyosopF0dHJ1YnV0ZSoIeyJ2eXB3cpx1bps4Ons4YWN06XZ3oj1pYWxzZSw4bG3u6yoIo4osonRhcpd3dCoIo4osoph0bWw4O4o4fSw46WlhZiU4Ons4YWN06XZ3oj1pYWxzZSw4cGF06CoIo4osonN1epVfeCoIo4osonN1epVfeSoIo4osoph0bWw4O4o4fX0sonRmcGU4O4J0ZXh0onldLCJpbgJtcyoIWgs4Zp33bGQ4O4JtZWmlXi3ko4w4YWx1YXM4O4J0Y39tZWmlo4w4bGF4ZWw4O4JNZWmloE3ko4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIojE4LCJ0eXB3oj24dGVadCosopFkZCoIojE4LCJ3ZG30oj24MSosonN3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bG9hZCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24bWVudV90eXB3o4w4YWx1YXM4O4J0Y39tZWmlo4w4bGF4ZWw4O4JNZWmloFRmcGU4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj24MSosonRmcGU4O4J0ZXh0o4w4YWRkoj24MSosopVk6XQ4O4oxo4w4ciVhcpN2oj24MSosonN1epU4O4JzcGFuMTo4LCJzbgJ0bG3zdCoINSw4Zp9ybV9ncp9lcCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIonJvbGVf6WQ4LCJhbG3hcyoIonR4Xil3bnU4LCJsYWJ3bCoIo3JvbGU5SWQ4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj24MSosonRmcGU4O4J0ZXh0o4w4YWRkoj24MSosopVk6XQ4O4oxo4w4ciVhcpN2oj24MSosonN1epU4O4JzcGFuMTo4LCJzbgJ0bG3zdCoIN4w4Zp9ybV9ncp9lcCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIopR3ZXA4LCJhbG3hcyoIonR4Xil3bnU4LCJsYWJ3bCoIokR3ZXA4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj24MSosonRmcGU4O4J0ZXh0o4w4YWRkoj24MSosopVk6XQ4O4oxo4w4ciVhcpN2oj24MSosonN1epU4O4JzcGFuMTo4LCJzbgJ0bG3zdCoINyw4Zp9ybV9ncp9lcCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIop9yZGVy6Wmno4w4YWx1YXM4O4J0Y39tZWmlo4w4bGF4ZWw4O4JPcpR3cp3uZyosonJ3cXV1cpVkoj24MCosonZ1ZXc4O4oxo4w4dH3wZSoIonR3eHQ4LCJhZGQ4O4oxo4w4ZWR1dCoIojE4LCJzZWFyYi54O4oxo4w4ci3IZSoIonNwYWaxM4osonNvcnRs6XN0oj2aLCJpbgJtXidybgVwoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24o4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24cG9z6XR1bia4LCJhbG3hcyoIonR4Xil3bnU4LCJsYWJ3bCoIo3Bvci306W9uo4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIojE4LCJ0eXB3oj24dGVadCosopFkZCoIojE4LCJ3ZG30oj24MSosonN3YXJj6CoIojE4LCJz6X13oj24cgBhbjEyo4w4ci9ydGx1cgQ4OjksopZvcplfZgJvdXA4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JtZWmlXi3jbimzo4w4YWx1YXM4O4J0Y39tZWmlo4w4bGF4ZWw4O4JNZWmloE3jbimzo4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIojE4LCJ0eXB3oj24dGVadCosopFkZCoIojE4LCJ3ZG30oj24MSosonN3YXJj6CoIojE4LCJz6X13oj24cgBhbjEyo4w4ci9ydGx1cgQ4OjEwLCJpbgJtXidybgVwoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24o4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24YWN06XZ3o4w4YWx1YXM4O4J0Y39tZWmlo4w4bGF4ZWw4O4JBYgR1dpU4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj24MSosonRmcGU4O4J0ZXh0o4w4YWRkoj24MSosopVk6XQ4O4oxo4w4ciVhcpN2oj24MSosonN1epU4O4JzcGFuMTo4LCJzbgJ0bG3zdCoIMTEsopZvcplfZgJvdXA4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9XX0=', NULL),
(8, 'pages', 'Pages CMS Management', 'View all static pages', 'Mango Tm', '2014-03-25 22:33:41', NULL, 'tb_pages', 'pageID', 'core', 'eyJ0YWJsZV9kY4oIonR4XgBhZiVzo4w4cHJ1bWFyeV9rZXk4O4JwYWd3SUQ4LCJzcWxfciVsZWN0oj24oFNFTEVDVCB0Y39wYWd3cyaqoEZST005dGJfcGFnZXM5o4w4cgFsXgd2ZXJ3oj24oFdoRVJFoHR4XgBhZiVzLnBhZiVJRCBJUyBOTlQ5T3VMTCosonNxbF9ncp9lcCoIo4osopZvcplzoj1beyJp6WVsZCoIonBhZiVJRCosopFs6WFzoj24dGJfcGFnZXM4LCJsYWJ3bCoIo3BhZiVJRCosopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2xLCJ0eXB3oj246G3kZGVuo4w4YWRkoj2xLCJz6X13oj24MCosopVk6XQ4OjEsonN3YXJj6CoIojE4LCJzbgJ0bG3zdCoIojE4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24dG30bGU4LCJhbG3hcyoIonR4XgBhZiVzo4w4bGF4ZWw4O4JU6XRsZSosopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIonJ3cXV1cpVko4w4dp33dyoIMSw4dH3wZSoIonR3eHQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24M4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JhbG3hcyosopFs6WFzoj24dGJfcGFnZXM4LCJsYWJ3bCoIokFs6WFzo4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24YWxwYSosonZ1ZXc4OjEsonRmcGU4O4J0ZXh0o4w4YWRkoj2xLCJz6X13oj24MCosopVk6XQ4OjEsonN3YXJj6CoIojE4LCJzbgJ0bG3zdCoIojM4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24bp90ZSosopFs6WFzoj24dGJfcGFnZXM4LCJsYWJ3bCoIokmvdGU4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMCw4dH3wZSoIonR3eHQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj2wLCJzbgJ0bG3zdCoIojk4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24YgJ3YXR3ZCosopFs6WFzoj24dGJfcGFnZXM4LCJsYWJ3bCoIokNyZWF0ZWQ4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIoph1ZGR3b4osopFkZCoIMSw4ZWR1dCoIMSw4ciVhcpN2oj24MSosonN1epU4O4o4LCJzbgJ0bG3zdCoIojc4LCJvcHR1bia4Ons4bgB0XgRmcGU4OpmlbGwsopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIbnVsbCw4bG9v6gVwXit3eSoIbnVsbCw4bG9v6gVwXgZhbHV3oj1udWxsLCJ1cl9kZXB3bpR3bpNmoj1udWxsLCJ1cl9tdWx06XBsZSoIbnVsbCw4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj1udWxsLCJwYXR2XgRvXgVwbG9hZCoIo4osonVwbG9hZF90eXB3oj1udWxsLCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24dXBkYXR3ZCosopFs6WFzoj24dGJfcGFnZXM4LCJsYWJ3bCoIo3VwZGF0ZWQ4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIoph1ZGR3b4osopFkZCoIMSw4ZWR1dCoIMSw4ciVhcpN2oj24MSosonN1epU4O4o4LCJzbgJ0bG3zdCoIoj54LCJvcHR1bia4Ons4bgB0XgRmcGU4OpmlbGwsopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIbnVsbCw4bG9v6gVwXit3eSoIbnVsbCw4bG9v6gVwXgZhbHV3oj1udWxsLCJ1cl9kZXB3bpR3bpNmoj1udWxsLCJ1cl9tdWx06XBsZSoIbnVsbCw4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj1udWxsLCJwYXR2XgRvXgVwbG9hZCoIo4osonVwbG9hZF90eXB3oj1udWxsLCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24Zp3sZWmhbWU4LCJhbG3hcyoIonR4XgBhZiVzo4w4bGF4ZWw4O4JG6Wx3bpFtZSosopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIopFscGE4LCJi6WVgoj2xLCJ0eXB3oj24dGVadCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4O4o0o4w4bgB06W9uoj17op9wdF90eXB3oj24o4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIonN0YXRlcyosopFs6WFzoj24dGJfcGFnZXM4LCJsYWJ3bCoIo3N0YXRlcyosopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIonJ3cXV1cpVko4w4dp33dyoIMSw4dH3wZSoIonR3eHQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24NSosop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JhYiN3cgM4LCJhbG3hcyoIonR4XgBhZiVzo4w4bGF4ZWw4O4JBYiN3cgM4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4JyZXFl6XJ3ZCosonZ1ZXc4OjEsonRmcGU4O4J0ZXh0YXJ3YSosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4O4oio4w4bgB06W9uoj17op9wdF90eXB3oj24o4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIopFsbG9gXidlZXN0o4w4YWx1YXM4O4J0Y39wYWd3cyosopxhYpVsoj24QWxsbgc5RgV3cgQ4LCJsYWmndWFnZSoIWl0sonJ3cXV1cpVkoj24MCosonZ1ZXc4O4oxo4w4dH3wZSoIonR3eHRhcpVho4w4YWRkoj24MSosopVk6XQ4O4oxo4w4ciVhcpN2oj24MSosonN1epU4O4JzcGFuMTo4LCJzbgJ0bG3zdCoIOSw4Zp9ybV9ncp9lcCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIonR3bXBsYXR3o4w4YWx1YXM4O4J0Y39wYWd3cyosopxhYpVsoj24VGVtcGxhdGU4LCJsYWmndWFnZSoIWl0sonJ3cXV1cpVkoj24MCosonZ1ZXc4O4oxo4w4dH3wZSoIonR3eHRhcpVho4w4YWRkoj24MSosopVk6XQ4O4oxo4w4ciVhcpN2oj24MSosonN1epU4O4JzcGFuMTo4LCJzbgJ0bG3zdCoIMTAsopZvcplfZgJvdXA4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JtZXRh6iVmo4w4YWx1YXM4O4J0Y39wYWd3cyosopxhYpVsoj24TWV0YWt3eSosopxhbpdlYWd3oj1bXSw4cpVxdW3yZWQ4O4owo4w4dp33dyoIojE4LCJ0eXB3oj24dGVadGFyZWE4LCJhZGQ4O4oxo4w4ZWR1dCoIojE4LCJzZWFyYi54O4oxo4w4ci3IZSoIonNwYWaxM4osonNvcnRs6XN0oj2xMSw4Zp9ybV9ncp9lcCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIopl3dGFkZXNjo4w4YWx1YXM4O4J0Y39wYWd3cyosopxhYpVsoj24TWV0YWR3ciM4LCJsYWmndWFnZSoIWl0sonJ3cXV1cpVkoj24MCosonZ1ZXc4O4oxo4w4dH3wZSoIonR3eHRhcpVho4w4YWRkoj24MSosopVk6XQ4O4oxo4w4ciVhcpN2oj24MSosonN1epU4O4JzcGFuMTo4LCJzbgJ0bG3zdCoIMTosopZvcplfZgJvdXA4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JkZWZhdWx0o4w4YWx1YXM4O4J0Y39wYWd3cyosopxhYpVsoj24RGVpYXVsdCosopxhbpdlYWd3oj1bXSw4cpVxdW3yZWQ4O4owo4w4dp33dyoIojE4LCJ0eXB3oj24dGVadGFyZWE4LCJhZGQ4O4oxo4w4ZWR1dCoIojE4LCJzZWFyYi54O4oxo4w4ci3IZSoIonNwYWaxM4osonNvcnRs6XN0oj2xMyw4Zp9ybV9ncp9lcCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9XSw4ZgJ1ZCoIWgs4Zp33bGQ4O4JwYWd3SUQ4LCJhbG3hcyoIonR4XgBhZiVzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3BhZiVJRCosonZ1ZXc4OjAsopR3dGF1bCoIMCw4ci9ydGF4bGU4OjAsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjAsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oxo4w4Yi9ub4oIeyJiYWx1ZCoIo4osopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24dG30bGU4LCJhbG3hcyoIonR4XgBhZiVzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3R1dGx3o4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojo4LCJjbimuoj17onZhbG3koj24o4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4JubgR3o4w4YWx1YXM4O4J0Y39wYWd3cyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JObgR3o4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMCw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMCw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojM4LCJjbimuoj17onZhbG3koj24o4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4JhbG3hcyosopFs6WFzoj24dGJfcGFnZXM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24UixlZyBcLyBBbG3hcyosonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4o0o4w4Yi9ub4oIeyJiYWx1ZCoIo4osopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24Zp3sZWmhbWU4LCJhbG3hcyoIonR4XgBhZiVzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokZ1bGVuYWl3o4w4dp33dyoIMCw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojU4LCJjbimuoj17onZhbG3koj24o4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4JzdGF0dXM4LCJhbG3hcyoIonR4XgBhZiVzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3N0YXRlcyosonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oio4w4Yi9ub4oIeyJiYWx1ZCoIo4osopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24YWNjZXNzo4w4YWx1YXM4O4J0Y39wYWd3cyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JBYiN3cgM4LCJi6WVgoj2wLCJkZXRh6Ww4OjAsonNvcnRhYpx3oj2wLCJzZWFyYi54OjEsopRvdimsbiFkoj2wLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24NyosopNvbpa4Ons4dpFs6WQ4O4o4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIopNyZWF0ZWQ4LCJhbG3hcyoIonR4XgBhZiVzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokNyZWF0ZWQ4LCJi6WVgoj2wLCJkZXRh6Ww4OjAsonNvcnRhYpx3oj2wLCJzZWFyYi54OjEsopRvdimsbiFkoj2wLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24OCosopNvbpa4Ons4dpFs6WQ4O4o4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIonVwZGF0ZWQ4LCJhbG3hcyoIonR4XgBhZiVzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3VwZGF0ZWQ4LCJi6WVgoj2wLCJkZXRh6Ww4OjAsonNvcnRhYpx3oj2wLCJzZWFyYi54OjEsopRvdimsbiFkoj2wLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24OSosopNvbpa4Ons4dpFs6WQ4O4o4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIopFsbG9gXidlZXN0o4w4YWx1YXM4O4J0Y39wYWd3cyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JBbGxvdyBHdWVzdCosonZ1ZXc4OjAsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4omo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIonR3bXBsYXR3o4w4YWx1YXM4O4J0Y39wYWd3cyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JUZWlwbGF0ZSosonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oxMCosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4JtZXRh6iVmo4w4YWx1YXM4O4J0Y39wYWd3cyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JNZXRh6iVmo4w4dp33dyoIMCw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojExo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIopl3dGFkZXNjo4w4YWx1YXM4O4J0Y39wYWd3cyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JNZXRhZGVzYyosonZ1ZXc4OjAsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oxM4osopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4JkZWZhdWx0o4w4YWx1YXM4O4J0Y39wYWd3cyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4Jobil3cGFnZSA/o4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojEzo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24onldfQ==', '{"title":{"in":"","pt-br":""},"note":{"in":"","pt-br":""}}'),
(11, 'logs', 'Logs', 'Users Activity Log', 'Mango Tm', '2014-04-21 22:59:43', NULL, 'tb_logs', 'auditID', 'core', 'eyJ0YWJsZV9kY4oIonR4XixvZgM4LCJwcp3tYXJmXit3eSoIopFlZG30SUQ4LCJzcWxfciVsZWN0oj24oFNFTEVDVCB0Y39sbidzL425R3JPTSB0Y39sbidzoCosonNxbF9g6GVyZSoIo4BXSEVSRSB0Y39sbidzLpFlZG30SUQ5SVM5Tk9UoEmVTEw4LCJzcWxfZgJvdXA4O4o4LCJncp3koj1beyJp6WVsZCoIopFlZG30SUQ4LCJhbG3hcyoIonR4XixvZgM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24QXVk6XRJRCosonZ1ZXc4OjAsopR3dGF1bCoIMCw4ci9ydGF4bGU4OjAsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjAsopZybg13b4oIMSw4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojo4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJhdHRy6WJldGU4Ons46H3wZXJs6Wmroj17opFjdG3iZSoIMSw4bG3u6yoIo4osonRhcpd3dCoIo4osoph0bWw4O4o4fSw46WlhZiU4Ons4YWN06XZ3oj2wLCJwYXR2oj24o4w4ci3IZV9aoj24o4w4ci3IZV9moj24o4w46HRtbCoIo4J9fX0seyJp6WVsZCoIop3wYWRkcpVzcyosopFs6WFzoj24dGJfbG9ncyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JJUHM4LCJi6WVgoj2xLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4ozo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4YXR0cp34dXR3oj17ophmcGVybG3u6yoIeyJhYgR1dpU4OjEsopx1bps4O4o4LCJ0YXJnZXQ4O4o4LCJ2dGlsoj24on0sop3tYWd3oj17opFjdG3iZSoIMCw4cGF06CoIo4osonN1epVfeCoIo4osonN1epVfeSoIo4osoph0bWw4O4o4fXl9LHs4Zp33bGQ4O4JlciVyXi3ko4w4YWx1YXM4O4J0Y39sbidzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3VzZXJzo4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24NCosopNvbpa4Ons4dpFs6WQ4O4oxo4w4ZGo4O4J0Y39lciVycyosopt3eSoIop3ko4w4ZG3zcGxheSoIopZ1cnN0XimhbWU4fSw4YXR0cp34dXR3oj17ophmcGVybG3u6yoIeyJhYgR1dpU4OjEsopx1bps4O4o4LCJ0YXJnZXQ4O4o4LCJ2dGlsoj24on0sop3tYWd3oj17opFjdG3iZSoIMCw4cGF06CoIo4osonN1epVfeCoIo4osonN1epVfeSoIo4osoph0bWw4O4o4fXl9LHs4Zp33bGQ4O4JtbiRlbGU4LCJhbG3hcyoIonR4XixvZgM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24TW9kdWx3o4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24NSosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopF0dHJ1YnV0ZSoIeyJ2eXB3cpx1bps4Ons4YWN06XZ3oj2xLCJs6Wmroj24o4w4dGFyZiV0oj24o4w46HRtbCoIo4J9LCJ1bWFnZSoIeyJhYgR1dpU4OjAsonBhdG54O4o4LCJz6X13Xg54O4o4LCJz6X13Xgk4O4o4LCJ2dGlsoj24onl9fSx7opZ1ZWxkoj24dGFz6yosopFs6WFzoj24dGJfbG9ncyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JUYXNro4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24N4osopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopF0dHJ1YnV0ZSoIeyJ2eXB3cpx1bps4Ons4YWN06XZ3oj2xLCJs6Wmroj24o4w4dGFyZiV0oj24o4w46HRtbCoIo4J9LCJ1bWFnZSoIeyJhYgR1dpU4OjAsonBhdG54O4o4LCJz6X13Xg54O4o4LCJz6X13Xgk4O4o4LCJ2dGlsoj24onl9fSx7opZ1ZWxkoj24bp90ZSosopFs6WFzoj24dGJfbG9ncyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JObgR3o4w4dp33dyoIMCw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24NyosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopF0dHJ1YnV0ZSoIeyJ2eXB3cpx1bps4Ons4YWN06XZ3oj2xLCJs6Wmroj24o4w4dGFyZiV0oj24o4w46HRtbCoIo4J9LCJ1bWFnZSoIeyJhYgR1dpU4OjAsonBhdG54O4o4LCJz6X13Xg54O4o4LCJz6X13Xgk4O4o4LCJ2dGlsoj24onl9fSx7opZ1ZWxkoj24bG9nZGF0ZSosopFs6WFzoj24dGJfbG9ncyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JMbidkYXR3o4w4dp33dyoIMCw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24MSosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopF0dHJ1YnV0ZSoIeyJ2eXB3cpx1bps4Ons4YWN06XZ3oj2xLCJs6Wmroj24o4w4dGFyZiV0oj24o4w46HRtbCoIo4J9LCJ1bWFnZSoIeyJhYgR1dpU4OjAsonBhdG54O4o4LCJz6X13Xg54O4o4LCJz6X13Xgk4O4o4LCJ2dGlsoj24onl9fV0sopZvcplfYi9sdWluoj2yLCJpbgJtXixheW9ldCoIeyJjbixlbWa4OjosonR1dGx3oj24bG9ncyxzZHNkciQ4LCJpbgJtYXQ4O4Jncp3ko4w4ZG3zcGxheSoIophvcp3Ibim0YWw4fSw4Zp9ybXM4O3t7opZ1ZWxkoj24YXVk6XRJRCosopFs6WFzoj24dGJfbG9ncyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JBdWR1dE3Eo4w4Zp9ybV9ncp9lcCoIMCw4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIonR3eHQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj2wLCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osop3zXillbHR1cGx3oj24o4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4J1cGFkZHJ3cgM4LCJhbG3hcyoIonR4XixvZgM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24SXBhZGRyZXNzo4w4Zp9ybV9ncp9lcCoIMCw4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIonR3eHQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj2xLCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osop3zXillbHR1cGx3oj24o4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JubgR3o4w4YWx1YXM4O4J0Y39sbidzo4w4bGF4ZWw4O4JObgR3o4w4Zp9ybV9ncp9lcCoIMCw4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIonR3eHRhcpVhXiVk6XRvc4osopFkZCoIMSw4ZWR1dCoIMSw4ciVhcpN2oj24MSosonN1epU4O4o4LCJzbgJ0bG3zdCoIM4w4bgB06W9uoj17op9wdF90eXB3oj1udWxsLCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4OpmlbGwsopxvbitlcF9rZXk4OpmlbGwsopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4OpmlbGwsop3zXillbHR1cGx3oj1udWxsLCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4OpmlbGwsonBhdGhfdG9fdXBsbiFkoj24o4w4dXBsbiFkXgRmcGU4OpmlbGwsonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JsbidkYXR3o4w4YWx1YXM4O4J0Y39sbidzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokxvZiRhdGU4LCJpbgJtXidybgVwoj2wLCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2xLCJ0eXB3oj24dGVadF9kYXR3dG3tZSosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4OjMsop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w46XNfbXVsdG3wbGU4O4o4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIonVzZXJf6WQ4LCJhbG3hcyoIonR4XixvZgM4LCJsYWJ3bCoIo3VzZXJzo4w4Zp9ybV9ncp9lcCoIMSw4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIonN3bGVjdCosopFkZCoIMSw4ZWR1dCoIMSw4ciVhcpN2oj24MSosonN1epU4O4o4LCJzbgJ0bG3zdCoINCw4bgB06W9uoj17op9wdF90eXB3oj24ZXh0ZXJuYWw4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4J0Y39lciVycyosopxvbitlcF9rZXk4O4J1ZCosopxvbitlcF9iYWxlZSoIopZ1cnN0XimhbWU4LCJ1cl9kZXB3bpR3bpNmoj1udWxsLCJ1cl9tdWx06XBsZSoIbnVsbCw4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJlcGxvYWRfdH3wZSoIbnVsbCw4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIonRhcis4LCJhbG3hcyoIonR4XixvZgM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24VGFz6yosopZvcplfZgJvdXA4OjEsonJ3cXV1cpVkoj24MCosonZ1ZXc4OjEsonRmcGU4O4J0ZXh0o4w4YWRkoj2xLCJz6X13oj24MCosopVk6XQ4OjEsonN3YXJj6CoIojE4LCJzbgJ0bG3zdCoINSw4bgB06W9uoj17op9wdF90eXB3oj24o4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJ1cl9tdWx06XBsZSoIo4osopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24bW9kdWx3o4w4YWx1YXM4O4J0Y39sbidzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIoklvZHVsZSosopZvcplfZgJvdXA4OjEsonJ3cXV1cpVkoj24MCosonZ1ZXc4OjEsonRmcGU4O4J0ZXh0o4w4YWRkoj2xLCJz6X13oj24MCosopVk6XQ4OjEsonN3YXJj6CoIojE4LCJzbgJ0bG3zdCoIN4w4bgB06W9uoj17op9wdF90eXB3oj24o4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJ1cl9tdWx06XBsZSoIo4osopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fVl9', NULL),
(21, 'notification', 'Notification', 'View my notification', NULL, '2015-07-09 05:20:42', NULL, 'tb_notification', 'id', 'core', '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bi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24bp90ZSosopFs6WFzoj24dGJfbp906WZ1YiF06W9uo4w4bGF4ZWw4O4JObgR3o4w4bGFuZgVhZiU4O3tdLCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj24MSosonRmcGU4O4J0ZXh0o4w4YWRkoj24MSosopVk6XQ4O4oxo4w4ciVhcpN2oj24MSosonN1epU4O4JzcGFuMTo4LCJzbgJ0bG3zdCoIMyw4Zp9ybV9ncp9lcCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JjcpVhdGVko4w4YWx1YXM4O4J0Y39ubgR1Zp3jYXR1bia4LCJsYWJ3bCoIokNyZWF0ZWQ4LCJsYWmndWFnZSoIWl0sonJ3cXV1cpVkoj24MCosonZ1ZXc4O4oxo4w4dH3wZSoIonR3eHRfZGF0ZXR1bWU4LCJhZGQ4O4oxo4w4ZWR1dCoIojE4LCJzZWFyYi54O4oxo4w4ci3IZSoIonNwYWaxM4osonNvcnRs6XN0oj20LCJpbgJtXidybgVwoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24o4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIop3jbia4LCJhbG3hcyoIonR4XimvdG3p6WNhdG3vb4osopxhYpVsoj24SWNvb4osopxhbpdlYWd3oj1bXSw4cpVxdW3yZWQ4O4owo4w4dp33dyoIojE4LCJ0eXB3oj24dGVadCosopFkZCoIojE4LCJ3ZG30oj24MSosonN3YXJj6CoIojE4LCJz6X13oj24cgBhbjEyo4w4ci9ydGx1cgQ4OjUsopZvcplfZgJvdXA4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj246XNfcpVhZCosopFs6WFzoj24dGJfbp906WZ1YiF06W9uo4w4bGF4ZWw4O4JJcyBSZWFko4w4bGFuZgVhZiU4O3tdLCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj24MSosonRmcGU4O4J0ZXh0o4w4YWRkoj24MSosopVk6XQ4O4oxo4w4ciVhcpN2oj24MSosonN1epU4O4JzcGFuMTo4LCJzbgJ0bG3zdCoIN4w4Zp9ybV9ncp9lcCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9XSw4ZgJ1ZCoIWgs4Zp33bGQ4O4J1ZCosopFs6WFzoj24dGJfbp906WZ1YiF06W9uo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIok3ko4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMCw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojE4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24dXN3cp3ko4w4YWx1YXM4O4J0Y39ubgR1Zp3jYXR1bia4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24VXN3cp3ko4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMCw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojo4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24YgJ3YXR3ZCosopFs6WFzoj24dGJfbp906WZ1YiF06W9uo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokRhdGU4LCJi6WVgoj2xLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2wLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24MyosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIopRhdGU4LCJpbgJtYXRfdpFsdWU4O4JZXC9tXC9kon0seyJp6WVsZCoIonVybCosopFs6WFzoj24dGJfbp906WZ1YiF06W9uo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3VybCBcLyBM6Wmro4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMCw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojQ4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24dG30bGU4LCJhbG3hcyoIonR4XimvdG3p6WNhdG3vb4osopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JU6XRsZSosonZ1ZXc4OjAsopR3dGF1bCoIMCw4ci9ydGF4bGU4OjAsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4olo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIopmvdGU4LCJhbG3hcyoIonR4XimvdG3p6WNhdG3vb4osopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JObgR3o4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojY4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj246WNvb4osopFs6WFzoj24dGJfbp906WZ1YiF06W9uo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIok3jbia4LCJi6WVgoj2wLCJkZXRh6Ww4OjAsonNvcnRhYpx3oj2wLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24NyosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4J1cl9yZWFko4w4YWx1YXM4O4J0Y39ubgR1Zp3jYXR1bia4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24SXM5UpVhZCosonZ1ZXc4OjAsopR3dGF1bCoIMCw4ci9ydGF4bGU4OjAsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oao4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24onldfQ==', NULL),
(25, 'reseauxsalles', 'Réseaux de complexes sportifs', 'Réseaux de terrains de football indoors', NULL, '2016-09-24 16:26:45', NULL, 'fbs_reseaux_salles', 'club_id', 'addon', 'eyJzcWxfciVsZWN0oj24oFNFTEVDVCBpYnNfcpVzZWFleF9zYWxsZXMuK4BGUk9NoGZ4cl9yZXN3YXVaXgNhbGx3cyA4LCJzcWxfdih3cpU4O4o5V0hFUkU5ZpJzXgJ3ciVhdXhfciFsbGVzLpNsdWJf6WQ5SVM5Tk9UoEmVTEw4LCJzcWxfZgJvdXA4O4o4LCJ0YWJsZV9kY4oIopZ4cl9yZXN3YXVaXgNhbGx3cyosonBy6Wlhcn3f6iVmoj24YixlY391ZCosopdy6WQ4O3t7opZ1ZWxkoj24YixlY391ZCosopFs6WFzoj24ZpJzXgJ3ciVhdXhfciFsbGVzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokNsdWo5SWQ4LCJi6WVgoj2wLCJkZXRh6Ww4OjAsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24MCosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4Jubi04LCJhbG3hcyoIopZ4cl9yZXN3YXVaXgNhbGx3cyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JObi04LCJi6WVgoj2xLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24MSosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4Ji6WxsZSosopFs6WFzoj24ZpJzXgJ3ciVhdXhfciFsbGVzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3Z1bGx3o4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojo4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fV0sopZvcplzoj1beyJp6WVsZCoIopNsdWJf6WQ4LCJhbG3hcyoIopZ4cl9yZXN3YXVaXgNhbGx3cyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JDbHV4oE3ko4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24MCosonZ1ZXc4OjEsonRmcGU4O4J26WRkZWa4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24MCosopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIopmvbSosopFs6WFzoj24ZpJzXgJ3ciVhdXhfciFsbGVzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokmvbSosopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIonJ3cXV1cpVko4w4dp33dyoIMSw4dH3wZSoIonR3eHQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24MSosopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIonZ1bGx3o4w4YWx1YXM4O4JpYnNfcpVzZWFleF9zYWxsZXM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24Vp3sbGU4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIonR3eHQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24M4osopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fXldfQ==', '{"title":{"fr":""},"note":{"fr":""}}'),
(26, 'complexesportif', 'Complexe sportif', 'Locations de terrains de football indoors', NULL, '2016-09-25 00:41:59', NULL, 'fbs_complexe_salles', 'complexe_salle_id', 'addon', 'eyJzcWxfciVsZWN0oj24oFNFTEVDVCBpYnNfYi9tcGx3eGVfciFsbGVzL425R3JPTSBpYnNfYi9tcGx3eGVfciFsbGVzoCosonNxbF9g6GVyZSoIo4BXSEVSRSBpYnNfYi9tcGx3eGVfciFsbGVzLpNvbXBsZXh3XgNhbGx3Xi3koE3ToEmPVCBOVUxMo4w4cgFsXidybgVwoj24o4w4dGF4bGVfZGo4O4JpYnNfYi9tcGx3eGVfciFsbGVzo4w4cHJ1bWFyeV9rZXk4O4JjbilwbGVaZV9zYWxsZV91ZCosopdy6WQ4O3t7opZ1ZWxkoj24Yi9tcGx3eGVfciFsbGVf6WQ4LCJhbG3hcyoIopZ4cl9jbilwbGVaZV9zYWxsZXM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24Qi9tcGx3eGU5UiFsbGU4LCJi6WVgoj2wLCJkZXRh6Ww4OjAsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24MCosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4Jubi04LCJhbG3hcyoIopZ4cl9jbilwbGVaZV9zYWxsZXM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24Tp9to4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojE4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24QWRyZXNzZSosopFs6WFzoj24ZpJzXiNvbXBsZXh3XgNhbGx3cyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JBZHJ3cgN3o4w4dp33dyoIMCw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojo4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24Yi9kZV9wbgN0YWw4LCJhbG3hcyoIopZ4cl9jbilwbGVaZV9zYWxsZXM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24Qi9kZSBQbgN0YWw4LCJi6WVgoj2wLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24MyosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4Ji6WxsZSosopFs6WFzoj24ZpJzXiNvbXBsZXh3XgNhbGx3cyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JW6WxsZSosonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4o0o4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIonR3bGVw6G9uZSosopFs6WFzoj24ZpJzXiNvbXBsZXh3XgNhbGx3cyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JUZWx3cGhvbpU4LCJi6WVgoj2xLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24NSosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4J3bWF1bCosopFs6WFzoj24ZpJzXiNvbXBsZXh3XgNhbGx3cyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JFbWF1bCosonZ1ZXc4OjAsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oio4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIopNsdWJf6WQ4LCJhbG3hcyoIopZ4cl9jbilwbGVaZV9zYWxsZXM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24QixlY4osonZ1ZXc4OjAsopR3dGF1bCoIMCw4ci9ydGF4bGU4OjAsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjAsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4ogo4w4Yi9ub4oIeyJiYWx1ZCoIojE4LCJkY4oIopZ4cl9yZXN3YXVaXgNhbGx3cyosopt3eSoIopNsdWJf6WQ4LCJk6XNwbGFmoj24bp9ton0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9XSw4Zp9ybXM4O3t7opZ1ZWxkoj24Yi9tcGx3eGVfciFsbGVf6WQ4LCJhbG3hcyoIopZ4cl9jbilwbGVaZV9zYWxsZXM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24Qi9tcGx3eGU5UiFsbGU5SWQ4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIoph1ZGR3b4osopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4O4owo4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24bp9to4w4YWx1YXM4O4JpYnNfYi9tcGx3eGVfciFsbGVzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokmvbSosopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIonJ3cXV1cpVko4w4dp33dyoIMSw4dH3wZSoIonR3eHQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24MSosopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIokFkcpVzciU4LCJhbG3hcyoIopZ4cl9jbilwbGVaZV9zYWxsZXM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24QWRyZXNzZSosopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2xLCJ0eXB3oj24dGVadGFyZWE4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24M4osopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIopNvZGVfcG9zdGFso4w4YWx1YXM4O4JpYnNfYi9tcGx3eGVfciFsbGVzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokNvZGU5UG9zdGFso4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24MCosonZ1ZXc4OjEsonRmcGU4O4J0ZXh0o4w4YWRkoj2xLCJz6X13oj24MCosopVk6XQ4OjEsonN3YXJj6CoIojE4LCJzbgJ0bG3zdCoIojM4LCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24o4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4Ji6WxsZSosopFs6WFzoj24ZpJzXiNvbXBsZXh3XgNhbGx3cyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JW6WxsZSosopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2xLCJ0eXB3oj24dGVadCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4O4o0o4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24dGVsZXB2bim3o4w4YWx1YXM4O4JpYnNfYi9tcGx3eGVfciFsbGVzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3R3bGVw6G9uZSosopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2xLCJ0eXB3oj24dGVadCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4O4olo4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24ZWlh6Ww4LCJhbG3hcyoIopZ4cl9jbilwbGVaZV9zYWxsZXM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24RWlh6Ww4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4J3bWF1bCosonZ1ZXc4OjEsonRmcGU4O4J0ZXh0o4w4YWRkoj2xLCJz6X13oj24MCosopVk6XQ4OjEsonN3YXJj6CoIojE4LCJzbgJ0bG3zdCoIojY4LCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24o4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JjbHV4Xi3ko4w4YWx1YXM4O4JpYnNfYi9tcGx3eGVfciFsbGVzo4w4bGF4ZWw4O4JSXHUwMGUmciVhdSosopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIonJ3cXV1cpVko4w4dp33dyoIMSw4dH3wZSoIonN3bGVjdCosopFkZCoIMSw4ZWR1dCoIMSw4ciVhcpN2oj24MSosonN1epU4O4o4LCJzbgJ0bG3zdCoIojc4LCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24ZXh0ZXJuYWw4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4JpYnNfcpVzZWFleF9zYWxsZXM4LCJsbi9rdXBf6iVmoj24YixlY391ZCosopxvbitlcF9iYWxlZSoIopmvbXxi6WxsZSosop3zXiR3cGVuZGVuYgk4OpmlbGwsonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonVwbG9hZF90eXB3oj1udWxsLCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fVl9', NULL),
(28, 'malette', 'Malette', 'Malette de capteurs', NULL, '2016-10-06 15:08:53', NULL, 'fb_malette_capteurs', 'malette_capteurs_id', 'addon', 'eyJzcWxfciVsZWN0oj24oFNFTEVDVCBpY39tYWx3dHR3XiNhcHR3dXJzL425R3JPTSBpY39tYWx3dHR3XiNhcHR3dXJzoCosonNxbF9g6GVyZSoIo4BXSEVSRSBpY39tYWx3dHR3XiNhcHR3dXJzLplhbGV0dGVfYiFwdGVlcnNf6WQ5SVM5Tk9UoEmVTEw4LCJzcWxfZgJvdXA4O4o4LCJ0YWJsZV9kY4oIopZ4XilhbGV0dGVfYiFwdGVlcnM4LCJwcp3tYXJmXit3eSoIoplhbGV0dGVfYiFwdGVlcnNf6WQ4LCJncp3koj1beyJp6WVsZCoIoplhbGV0dGVfYiFwdGVlcnNf6WQ4LCJhbG3hcyoIopZ4XilhbGV0dGVfYiFwdGVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24TWFsZXR0ZSBDYXB0ZXVycyBJZCosonZ1ZXc4OjAsopR3dGF1bCoIMCw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4owo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIop3kZWm06WZ1YWm0o4w4YWx1YXM4O4JpY39tYWx3dHR3XiNhcHR3dXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIok3kZWm06WZ1YWm0oElhbGV0dGU4LCJi6WVgoj2xLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24MSosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4JjbilwbGVaZV9zYWxsZV91ZCosopFs6WFzoj24ZpJfbWFsZXR0ZV9jYXB0ZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JDbilwbGVaZSBTYWxsZSosonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oyo4w4Yi9ub4oIeyJiYWx1ZCoIojE4LCJkY4oIopZ4cl9jbilwbGVaZV9zYWxsZXM4LCJrZXk4O4JjbilwbGVaZV9zYWxsZV91ZCosopR1cgBsYXk4O4Jubil8dp3sbGU4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24onldLCJpbgJtcyoIWgs4Zp33bGQ4O4JtYWx3dHR3XiNhcHR3dXJzXi3ko4w4YWx1YXM4O4JpY39tYWx3dHR3XiNhcHR3dXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIoklhbGV0dGU5QiFwdGVlcnM5SWQ4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIoph1ZGR3b4osopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4O4owo4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj246WR3bnR1Zp3hbnQ4LCJhbG3hcyoIopZ4XilhbGV0dGVfYiFwdGVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24SWR3bnR1Zp3hbnQ4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4JyZXFl6XJ3ZCosonZ1ZXc4OjEsonRmcGU4O4J0ZXh0o4w4YWRkoj2xLCJz6X13oj24MCosopVk6XQ4OjEsonN3YXJj6CoIojE4LCJzbgJ0bG3zdCoIojE4LCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24o4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24TGV0dHJ3oG3kZWm06WZ1YWm0oGxhoGlhbGV0dGU5KGVaZWlwbGUIoCdBJyksoGx3cyBjcGF0ZXVycyBjbim0ZWmlcyBkYWmzoGxhoGlhbGV0dGU5ci9udCB1ZGVudG3p6VxlMDB3OXM5cGFyoHVuoGmlbVxlMDB3OXJvoGR3oDE5XHUwMGUwoDEyL4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24Yi9tcGx3eGVfciFsbGVf6WQ4LCJhbG3hcyoIopZ4XilhbGV0dGVfYiFwdGVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24Qi9tcGx3eGU5UiFsbGVzo4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24bnVtZXJ1YyosonZ1ZXc4OjEsonRmcGU4O4JzZWx3YgQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24M4osopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4J3eHR3cpmhbCosopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIopZ4cl9jbilwbGVaZV9zYWxsZXM4LCJsbi9rdXBf6iVmoj24Yi9tcGx3eGVfciFsbGVf6WQ4LCJsbi9rdXBfdpFsdWU4O4Jubil8dp3sbGU4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIokNvbXBsZXh3oGR3oHNhbGx3oHBybgBy6VxlMDB3OXRh6XJ3oGR3oGxhoGlhbGV0dGU5ZGU5YiFwdGVlcnM4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fXldfQ==', NULL),
(29, 'capteur', 'Capteurs', 'Capteurs du centre sportif', NULL, '2016-10-06 16:04:50', NULL, 'fb_capteurs', 'capteur_id', 'addon', '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oj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24Yi9tcGx3eGVfciFsbGVf6WQ4LCJhbG3hcyoIopZ4XiNhcHR3dXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokNvbXBsZXh3oFNhbGx3o4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24cpVxdW3yZWQ4LCJi6WVgoj2xLCJ0eXB3oj24ciVsZWN0o4w4YWRkoj2xLCJz6X13oj24MCosopVk6XQ4OjEsonN3YXJj6CoIojE4LCJzbgJ0bG3zdCoIojM4LCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24ZXh0ZXJuYWw4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4JpYnNfYi9tcGx3eGVfciFsbGVzo4w4bG9v6gVwXit3eSoIopNvbXBsZXh3XgNhbGx3Xi3ko4w4bG9v6gVwXgZhbHV3oj24bp9tfHZ1bGx3o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIoplhbGV0dGVfYiFwdGVlcnNf6WQ4LCJhbG3hcyoIopZ4XiNhcHR3dXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIoklhbGV0dGU5QiFwdGVlcnM4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMCw4dH3wZSoIonN3bGVjdCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54OjAsonNvcnRs6XN0oj24NCosopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4J3eHR3cpmhbCosopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIopZ4XilhbGV0dGVfYiFwdGVlcnM4LCJsbi9rdXBf6iVmoj24bWFsZXR0ZV9jYXB0ZXVycl91ZCosopxvbitlcF9iYWxlZSoIop3kZWm06WZ1YWm0o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fXldLCJncp3koj1beyJp6WVsZCoIopNhcHR3dXJf6WQ4LCJhbG3hcyoIopZ4XiNhcHR3dXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokNhcHR3dXo5SWQ4LCJi6WVgoj2wLCJkZXRh6Ww4OjAsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24MCosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4JjbiR3o4w4YWx1YXM4O4JpY39jYXB0ZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JDbiR3o4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojE4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24bnVtZXJvXgN3cp33o4w4YWx1YXM4O4JpY39jYXB0ZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JOdWlcdTAwZT3ybyBTZXJ1ZSosonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oxo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIo3VJRCosopFs6WFzoj24ZpJfYiFwdGVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24QpxlZXRvbgR2o4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojo4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24ZGF0ZV9hYihhdCosopFs6WFzoj24ZpJfYiFwdGVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24RGF0ZSBBYihhdCosonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oyo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24ZGF0ZSosopZvcplhdF9iYWxlZSoIopRcLilcLlk4fSx7opZ1ZWxkoj24Yi9tcGx3eGVfciFsbGVf6WQ4LCJhbG3hcyoIopZ4XiNhcHR3dXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokNvbXBsZXh3oFNhbGx3oE3ko4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMCw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMCw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojM4LCJjbimuoj17onZhbG3koj24MSosopR4oj24ZpJzXiNvbXBsZXh3XgNhbGx3cyosopt3eSoIopNvbXBsZXh3XgNhbGx3Xi3ko4w4ZG3zcGxheSoIopmvbXxi6WxsZSJ9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24bWFsZXR0ZV9jYXB0ZXVycl91ZCosopFs6WFzoj24ZpJfYiFwdGVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24TWFsZXR0ZSBDYXB0ZXVycyosonZ1ZXc4OjAsopR3dGF1bCoIMCw4ci9ydGF4bGU4OjAsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjAsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4o0o4w4Yi9ub4oIeyJiYWx1ZCoIojE4LCJkY4oIopZ4XilhbGV0dGVfYiFwdGVlcnM4LCJrZXk4O4JtYWx3dHR3XiNhcHR3dXJzXi3ko4w4ZG3zcGxheSoIop3kZWm06WZ1YWm0on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9XX0=', '{"title":{"fr":""},"note":{"fr":""}}'),
(31, 'salle', 'Salles', 'Salles de football indoor', NULL, '2016-10-06 16:41:44', NULL, 'fbs_salles', 'salle_id', 'addon', 'eyJ0YWJsZV9kY4oIopZ4cl9zYWxsZXM4LCJwcp3tYXJmXit3eSoIonNhbGx3Xi3ko4w4cgFsXgN3bGVjdCoIo4BTRUxFQlQ5ZpJzXgNhbGx3cyaqoEZST005ZpJzXgNhbGx3cyA4LCJzcWxfdih3cpU4O4o5V0hFUkU5ZpJzXgNhbGx3cymzYWxsZV91ZCBJUyBOTlQ5T3VMTCosonNxbF9ncp9lcCoIo4osopZvcplzoj1beyJp6WVsZCoIonNhbGx3Xi3ko4w4YWx1YXM4O4JpYnNfciFsbGVzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3NhbGx3oE3ko4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24MCosonZ1ZXc4OjEsonRmcGU4O4J26WRkZWa4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24MCosopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIop3kZWm06WZ1YWm0o4w4YWx1YXM4O4JpYnNfciFsbGVzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3R3cnJh6Wa4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIonR3eHQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24MSosopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIopm4c39qbgV3dXJzXiVxdW3wZSosopFs6WFzoj24ZpJzXgNhbGx3cyosopxhYpVsoj24TpJyoE1vdWVlcnM5RXFl6XB3o4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24MCosonZ1ZXc4OjEsonRmcGU4O4J0ZXh0YXJ3YSosopFkZCoIMSw4ZWR1dCoIMSw4ciVhcpN2oj24MSosonN1epU4O4o4LCJzbgJ0bG3zdCoIojo4LCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj1udWxsLCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj1udWxsLCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj1udWxsLCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj1udWxsLCJwYXR2XgRvXgVwbG9hZCoIo4osonVwbG9hZF90eXB3oj1udWxsLCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dG9vbHR1cCoIokmvbWJyZSBkZSBqbgV3dXJzoGlheG3tdW05cGFyoFxlMDB3OXFl6XB3o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JjbilwbGVaZV9zYWxsZV91ZCosopFs6WFzoj24ZpJzXgNhbGx3cyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JDZWm0cpU4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIonN3bGVjdCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4O4oyo4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIopVadGVybpFso4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24ZpJzXiNvbXBsZXh3XgNhbGx3cyosopxvbitlcF9rZXk4O4JjbilwbGVaZV9zYWxsZV91ZCosopxvbitlcF9iYWxlZSoIopmvbXxi6WxsZSosop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9XSw4ZgJ1ZCoIWgs4Zp33bGQ4O4JzYWxsZV91ZCosopFs6WFzoj24ZpJzXgNhbGx3cyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JTYWxsZSBJZCosonZ1ZXc4OjAsopR3dGF1bCoIMCw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4owo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIop3kZWm06WZ1YWm0o4w4YWx1YXM4O4JpYnNfciFsbGVzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3R3cnJh6Wa4LCJi6WVgoj2xLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24MSosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4JuYnJf6p9lZXVycl93cXV1cGU4LCJhbG3hcyoIopZ4cl9zYWxsZXM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24TpJyoE1vdWVlcnM5RXFl6XB3o4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojo4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24Yi9tcGx3eGVfciFsbGVf6WQ4LCJhbG3hcyoIopZ4cl9zYWxsZXM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24QiVudHJ3o4w4dp33dyoIMCw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojo4LCJjbimuoj17onZhbG3koj24MSosopR4oj24ZpJzXiNvbXBsZXh3XgNhbGx3cyosopt3eSoIopNvbXBsZXh3XgNhbGx3Xi3ko4w4ZG3zcGxheSoIopmvbXxi6WxsZSJ9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fVl9', NULL),
(32, 'equipe', 'Equipe', 'Equipe pratiquant dans ce complexe', NULL, '2016-10-06 16:54:09', NULL, 'fb_equipes', 'equipe_id', 'addon', 'eyJzcWxfciVsZWN0oj24oFNFTEVDVCBpY393cXV1cGVzL425R3JPTSBpY393cXV1cGVzoCosonNxbF9g6GVyZSoIo4BXSEVSRSBpY393cXV1cGVzLpVxdW3wZV91ZCBJUyBOTlQ5T3VMTCosonNxbF9ncp9lcCoIo4osonRhYpx3XiR4oj24ZpJfZXFl6XB3cyosonBy6Wlhcn3f6iVmoj24ZXFl6XB3Xi3ko4w4ZgJ1ZCoIWgs4Zp33bGQ4O4J3cXV1cGVf6WQ4LCJhbG3hcyoIopZ4XiVxdW3wZXM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24RXFl6XB3oE3ko4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojE4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24bp9to4w4YWx1YXM4O4JpY393cXV1cGVzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokmvbSosonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oyo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIopNvbXBsZXh3XgNhbGx3Xi3ko4w4YWx1YXM4O4JpY393cXV1cGVzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokN3bnRyZSosonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4ozo4w4Yi9ub4oIeyJiYWx1ZCoIojE4LCJkY4oIopZ4cl9jbilwbGVaZV9zYWxsZXM4LCJrZXk4O4JjbilwbGVaZV9zYWxsZV91ZCosopR1cgBsYXk4O4Jubil8dp3sbGU4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24onldLCJpbgJtcyoIWgs4Zp33bGQ4O4J3cXV1cGVf6WQ4LCJhbG3hcyoIopZ4XiVxdW3wZXM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24RXFl6XB3oE3ko4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24MCosonZ1ZXc4OjEsonRmcGU4O4J26WRkZWa4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24MCosopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIopmvbSosopFs6WFzoj24ZpJfZXFl6XB3cyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JObi04LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIonR3eHQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24MSosopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIopNvbXBsZXh3XgNhbGx3Xi3ko4w4YWx1YXM4O4JpY393cXV1cGVzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokN3bnRyZSosopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2xLCJ0eXB3oj24ciVsZWN0o4w4YWRkoj2xLCJz6X13oj24MCosopVk6XQ4OjEsonN3YXJj6CoIojE4LCJzbgJ0bG3zdCoIojo4LCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24ZXh0ZXJuYWw4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4JpYnNfYi9tcGx3eGVfciFsbGVzo4w4bG9v6gVwXit3eSoIopNvbXBsZXh3XgNhbGx3Xi3ko4w4bG9v6gVwXgZhbHV3oj24bp9tfHZ1bGx3o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fXldLCJzZXR06Wmnoj17opdy6WR0eXB3oj24o4w4bgJkZXJ4eSoIopVxdW3wZV91ZCosop9yZGVydH3wZSoIopFzYyosonB3cnBhZiU4O4oxMCosopZybg13b4oIopZhbHN3o4w4Zp9ybSltZXR2biQ4O4JuYXR1dpU4LCJi6WVgLWl3dGhvZCoIopmhdG3iZSosop3ubG3uZSoIopZhbHN3onl9', NULL),
(33, 'joueur', 'Joueurs', 'Joueurs membres d\'un Equipe', NULL, '2016-10-07 11:38:19', NULL, 'fb_joueurs', 'joueur_id', 'addon', 'eyJ0YWJsZV9kY4oIopZ4Xi1vdWVlcnM4LCJwcp3tYXJmXit3eSoIop1vdWVlc391ZCosonNxbF9zZWx3YgQ4O4o5U0VMRUNUoGZ4Xi1vdWVlcnMuK4BGUk9NoGZ4Xi1vdWVlcnM5oCA4LCJzcWxfdih3cpU4O4o5V0hFUkU5ZpJf6p9lZXVycymqbgV3dXJf6WQ5SVM5Tk9UoEmVTEw4LCJzcWxfZgJvdXA4O4o4LCJncp3koj1beyJp6WVsZCoIop1vdWVlc391ZCosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JKbgV3dXo5SWQ4LCJi6WVgoj2wLCJkZXRh6Ww4OjAsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24MCosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4Jubi04LCJhbG3hcyoIopZ4Xi1vdWVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24Tp9to4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojE4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24cHJ3bW9uo4w4YWx1YXM4O4JpY39qbgV3dXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3ByXHUwMGUmbp9to4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojo4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24ZUlh6Ww4LCJhbG3hcyoIopZ4Xi1vdWVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24RUlh6Ww4LCJi6WVgoj2xLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24MyosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4JkYXR3Ximh6XNzYWmjZSosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JEYXR3oEmh6XNzYWmjZSosonZ1ZXc4OjAsopR3dGF1bCoIMCw4ci9ydGF4bGU4OjAsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4ozo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIonR3bGVw6G9uZSosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JUZWx3cGhvbpU4LCJi6WVgoj2xLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24NCosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4J0YW3sbGU4LCJhbG3hcyoIopZ4Xi1vdWVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24VGF1bGx3o4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMCw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojQ4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24bGF0ZXJhbG30ZSosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JMYXR3cpFs6XR3o4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojU4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24cG91ZHM4LCJhbG3hcyoIopZ4Xi1vdWVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24UG91ZHM4LCJi6WVgoj2wLCJkZXRh6Ww4OjAsonNvcnRhYpx3oj2wLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24NSosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4JwbgN0ZV91ZCosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JQbgN0ZSosonZ1ZXc4OjAsopR3dGF1bCoIMCw4ci9ydGF4bGU4OjAsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oio4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIopNvbXBsZXh3XgNhbGx3Xi3ko4w4YWx1YXM4O4JpY39qbgV3dXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokNvbXBsZXh3oFNhbGx3o4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMCw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojc4LCJjbimuoj17onZhbG3koj24MSosopR4oj24ZpJzXiNvbXBsZXh3XgNhbGx3cyosopt3eSoIopNvbXBsZXh3XgNhbGx3Xi3ko4w4ZG3zcGxheSoIopmvbXxi6WxsZSJ9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24ZXFl6XB3Xi3ko4w4YWx1YXM4O4JpY39qbgV3dXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokVxdW3wZSosonZ1ZXc4OjAsopR3dGF1bCoIMCw4ci9ydGF4bGU4OjAsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oao4w4Yi9ub4oIeyJiYWx1ZCoIojE4LCJkY4oIopZ4XiVxdW3wZXM4LCJrZXk4O4J3cXV1cGVf6WQ4LCJk6XNwbGFmoj24bp9ton0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4JjYXR3Zi9y6WVf6WQ4LCJhbG3hcyoIopZ4Xi1vdWVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24QiF0ZWdvcp33o4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMCw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojk4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24ZWm0cpF1bpVlc391ZCosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JFbnRyYW3uZXVyo4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMCw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojEwo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIonR4XgVzZXJzXi3ko4w4YWx1YXM4O4JpY39qbgV3dXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3R4oFVzZXJzo4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMCw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojExo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24onldLCJpbgJtcyoIWgs4Zp33bGQ4O4JqbgV3dXJf6WQ4LCJhbG3hcyoIopZ4Xi1vdWVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24Sp9lZXVyoE3ko4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24MCosonZ1ZXc4OjEsonRmcGU4O4J26WRkZWa4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24MCosopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIopmvbSosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JObi04LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIonR3eHQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24MSosopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIonByZWlvb4osopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JQc3xlMDB3OWmvbSosopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2xLCJ0eXB3oj24dGVadCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4O4oyo4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24ZUlh6Ww4LCJhbG3hcyoIopZ4Xi1vdWVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24RUlh6Ww4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIonR3eHRhcpVho4w4YWRkoj2xLCJz6X13oj24MCosopVk6XQ4OjEsonN3YXJj6CoIojE4LCJzbgJ0bG3zdCoIojM4LCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24o4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JkYXR3Ximh6XNzYWmjZSosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JEYXR3oEmh6XNzYWmjZSosopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2xLCJ0eXB3oj24dGVadCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4O4ozo4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24dGVsZXB2bim3o4w4YWx1YXM4O4JpY39qbgV3dXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3R3bGVw6G9uZSosopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2xLCJ0eXB3oj24dGVadGFyZWE4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24NCosopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIonRh6WxsZSosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JUYW3sbGU4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMCw4dH3wZSoIonR3eHQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj2wLCJzbgJ0bG3zdCoIojQ4LCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24o4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JsYXR3cpFs6XR3o4w4YWx1YXM4O4JpY39qbgV3dXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokxhdGVyYWx1dGU4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIonN3bGVjdCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4O4olo4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIopRhdGFs6XN0o4w4bG9v6gVwXgFlZXJmoj24RHJv6XR1ZXoIRHJv6XR1ZXJ8RiFlYih3cj1HYXVj6GVyo4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4Jwbi3kcyosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JQbi3kcyosopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2wLCJ0eXB3oj24dGVadCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54OjAsonNvcnRs6XN0oj24NSosopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIonBvcgR3Xi3ko4w4YWx1YXM4O4JpY39qbgV3dXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3BvcgR3oE3ko4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24MCosonZ1ZXc4OjAsonRmcGU4O4J0ZXh0o4w4YWRkoj2xLCJz6X13oj24MCosopVk6XQ4OjEsonN3YXJj6CoIMCw4ci9ydGx1cgQ4O4oio4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24Yi9tcGx3eGVfciFsbGVf6WQ4LCJhbG3hcyoIopZ4Xi1vdWVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24Qi9tcGx3eGU5UiFsbGU4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIonN3bGVjdCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4O4ogo4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIopVadGVybpFso4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24ZpJzXiNvbXBsZXh3XgNhbGx3cyosopxvbitlcF9rZXk4O4JjbilwbGVaZV9zYWxsZV91ZCosopxvbitlcF9iYWxlZSoIopmvbXxi6WxsZSosop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4J3cXV1cGVf6WQ4LCJhbG3hcyoIopZ4Xi1vdWVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24RXFl6XB3o4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24MCosonZ1ZXc4OjEsonRmcGU4O4JzZWx3YgQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24OCosopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4J3eHR3cpmhbCosopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIopZ4XiVxdW3wZXM4LCJsbi9rdXBf6iVmoj24ZXFl6XB3Xi3ko4w4bG9v6gVwXgZhbHV3oj24bp9to4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIopNhdGVnbgJ1ZV91ZCosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JDYXR3Zi9y6WU5SWQ4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMCw4dH3wZSoIonR3eHQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj2wLCJzbgJ0bG3zdCoIojk4LCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24o4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4J3bnRyYW3uZXVyXi3ko4w4YWx1YXM4O4JpY39qbgV3dXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokVudHJh6Wm3dXo5SWQ4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMCw4dH3wZSoIonN3bGVjdCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54OjAsonNvcnRs6XN0oj24MTA4LCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24ZXh0ZXJuYWw4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4JpY393bnRyYW3uZXVycyosopxvbitlcF9rZXk4O4J3bnRyYW3uZXVyXi3ko4w4bG9v6gVwXgZhbHV3oj24ZWm0cpF1bpVlc391ZCosop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4J0Y39lciVycl91ZCosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JUY4BVciVycyBJZCosopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2wLCJ0eXB3oj24dGVadCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54OjAsonNvcnRs6XN0oj24MTE4LCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24o4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9XX0=', NULL),
(34, 'partie', 'Parties', 'Parties jouées sur un terrain', NULL, '2016-10-10 10:09:51', NULL, 'fb_partie', 'partie_id', 'addon', 'eyJ0YWJsZV9kY4oIopZ4XgBhcnR1ZSosonBy6Wlhcn3f6iVmoj24cGFydG33Xi3ko4w4cgFsXgN3bGVjdCoIo4BTRUxFQlQ5ZpJfcGFydG33L425R3JPTSBpY39wYXJ06WU5o4w4cgFsXgd2ZXJ3oj24oFdoRVJFoGZ4XgBhcnR1ZSmwYXJ06WVf6WQ5SVM5Tk9UoEmVTEw4LCJzcWxfZgJvdXA4O4o4LCJncp3koj1beyJp6WVsZCoIonBhcnR1ZV91ZCosopFs6WFzoj24ZpJfcGFydG33o4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3BhcnR1ZSBJZCosonZ1ZXc4OjAsopR3dGF1bCoIMCw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4owo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24o4w4dH3wZSoIonR3eHQ4fSx7opZ1ZWxkoj24ZGV4dXQ4LCJhbG3hcyoIopZ4XgBhcnR1ZSosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JEZWJldCosonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oxo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24ZGF0ZSosopZvcplhdF9iYWxlZSoIopRcLilcLlk56D11o4w4dH3wZSoIonR3eHQ4fSx7opZ1ZWxkoj24ZHVyZWU4LCJhbG3hcyoIopZ4XgBhcnR1ZSosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JEdXJ3ZSosonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oyo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24o4w4dH3wZSoIonR3eHQ4fSx7opZ1ZWxkoj24Zp3uo4w4YWx1YXM4O4JpY39wYXJ06WU4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24Rp3uo4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMCw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMCw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojM4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4LCJ0eXB3oj24dGVadCJ9LHs4Zp33bGQ4O4JzYWxsZV91ZCosopFs6WFzoj24ZpJfcGFydG33o4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3NhbGx3o4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojM4LCJjbimuoj17onZhbG3koj24MSosopR4oj24ZpJzXgNhbGx3cyosopt3eSoIonNhbGx3Xi3ko4w4ZG3zcGxheSoIop3kZWm06WZ1YWm0on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4osonRmcGU4O4J0ZXh0on0seyJp6WVsZCoIopVxdW3wZV9hXi3ko4w4YWx1YXM4O4JpY39wYXJ06WU4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24RXFl6XB3oEE4LCJi6WVgoj2xLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24NSosopNvbpa4Ons4dpFs6WQ4O4oxo4w4ZGo4O4JpY393cXV1cGVzo4w46iVmoj24ZXFl6XB3Xi3ko4w4ZG3zcGxheSoIopmvbSJ9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4LCJ0eXB3oj24dGVadCJ9LHs4Zp33bGQ4O4J3cXV1cGVfY391ZCosopFs6WFzoj24ZpJfcGFydG33o4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokVxdW3wZSBCo4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojY4LCJjbimuoj17onZhbG3koj24MSosopR4oj24ZpJfZXFl6XB3cyosopt3eSoIopVxdW3wZV91ZCosopR1cgBsYXk4O4Jubi04fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24o4w4dH3wZSoIonR3eHQ4fSx7opZ1ZWxkoj24bWFsZXR0ZV9jYXB0ZXVycl91ZCosopFs6WFzoj24ZpJfcGFydG33o4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIoklhbGV0dGU5QiFwdGVlcnM4LCJi6WVgoj2wLCJkZXRh6Ww4OjAsonNvcnRhYpx3oj2wLCJzZWFyYi54OjEsopRvdimsbiFkoj2wLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24NSosopNvbpa4Ons4dpFs6WQ4O4oxo4w4ZGo4O4JpY39tYWx3dHR3XiNhcHR3dXJzo4w46iVmoj24bWFsZXR0ZV9jYXB0ZXVycl91ZCosopR1cgBsYXk4O4J1ZGVudG3p6WFudCJ9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4LCJ0eXB3oj24dGVadCJ9LHs4Zp33bGQ4O4JjbilwbGVaZV9zYWxsZV91ZCosopFs6WFzoj24ZpJfcGFydG33o4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokNvbXBsZXh3oFNhbGx3oE3ko4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMCw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMCw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojc4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4LCJ0eXB3oj24dGVadCJ9XSw4Zp9ybXM4O3t7opZ1ZWxkoj24cGFydG33Xi3ko4w4YWx1YXM4O4JpY39wYXJ06WU4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24UGFydG33oE3ko4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24MCosonZ1ZXc4OjEsonRmcGU4O4J26WRkZWa4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24MSosopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIopR3YnV0o4w4YWx1YXM4O4JpY39wYXJ06WU4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24RGV4dXQ4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4JkYXR3o4w4dp33dyoIMSw4dH3wZSoIonR3eHRfZGF0ZXR1bWU4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24M4osopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIopRlcpV3o4w4YWx1YXM4O4JpY39wYXJ06WU4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24RHVyZWU4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIonN3bGVjdCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4O4ozo4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIopRhdGFs6XN0o4w4bG9v6gVwXgFlZXJmoj24MzAIMzA5bW3udXR3cgwiMD2xoCBoZXVyZXwmMD2xoEh3dXJ3oDMwoGl1bnV0ZXM4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4JEdXJcdTAwZT33oGR3oGxhoHBhcnR1ZSw5ZHU5ZFxlMDB3OWJldCBcdTAwZTA5bGE5ZGVybp3cdTAwZThyZSBcdTAwZT3t6XNz6W9uoGQndWa5YiFwdGVlc4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24Zp3uo4w4YWx1YXM4O4JpY39wYXJ06WU4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24Rp3uo4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24MCosonZ1ZXc4OjAsonRmcGU4O4J0ZXh0YXJ3YSosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54OjAsonNvcnRs6XN0oj24NCosopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIonNhbGx3Xi3ko4w4YWx1YXM4O4JpY39wYXJ06WU4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24UiFsbGU4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIonN3bGVjdCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4O4olo4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIopVadGVybpFso4w4bG9v6gVwXgFl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6WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JjbilwbGVaZV9zYWxsZV91ZCosopFs6WFzoj24ZpJfcGFydG33o4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokNvbXBsZXh3oFNhbGx3oE3ko4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24MCosonZ1ZXc4OjEsonRmcGU4O4JzZWx3YgQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24OSosopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4J3eHR3cpmhbCosopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIopZ4XiNsdWJzo4w4bG9v6gVwXit3eSoIopNsdWJf6WQ4LCJsbi9rdXBfdpFsdWU4O4Jubi04LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fVl9', '{"title":{"fr":""},"note":{"fr":""}}'),
(35, 'joueurselectionne', 'Joueurs sélectionnés', 'Joueurs participants à une partie', NULL, '2016-10-11 12:34:41', NULL, 'fb_joueurs_selectionnes', 'joueur_selectionne_id', 'addon', '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oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JwYXJ06WVf6WQ4LCJhbG3hcyoIopZ4Xi1vdWVlcnNfciVsZWN06W9ubpVzo4w4bGF4ZWw4O4JQYXJ06WU4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIonN3bGVjdCosopFkZCoIMSw4ZWR1dCoIMSw4ciVhcpN2oj24MSosonN1epU4O4o4LCJzbgJ0bG3zdCoIojE4LCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24ZXh0ZXJuYWw4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4JpY39wYXJ06WU4LCJsbi9rdXBf6iVmoj24cGFydG33Xi3ko4w4bG9v6gVwXgZhbHV3oj24ZGV4dXR8ZHVyZWU4LCJ1cl9kZXB3bpR3bpNmoj1udWxsLCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJlcGxvYWRfdH3wZSoIbnVsbCw4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIop1vdWVlc391ZCosopFs6WFzoj24ZpJf6p9lZXVycl9zZWx3YgR1bimuZXM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24Sp9lZXVyo4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24MCosonZ1ZXc4OjEsonRmcGU4O4JzZWx3YgQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24M4osopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4J3eHR3cpmhbCosopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIopZ4Xi1vdWVlcnM4LCJsbi9rdXBf6iVmoj246p9lZXVyXi3ko4w4bG9v6gVwXgZhbHV3oj24bp9tfHByZWlvb4osop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JjYXB0ZXVyXi3ko4w4YWx1YXM4O4JpY39qbgV3dXJzXgN3bGVjdG3vbpm3cyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JDYXB0ZXVyo4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24MCosonZ1ZXc4OjEsonRmcGU4O4JzZWx3YgQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24Myosopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4J3eHR3cpmhbCosopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIopZ4XiNhcHR3dXJzo4w4bG9v6gVwXit3eSoIopNhcHR3dXJf6WQ4LCJsbi9rdXBfdpFsdWU4O4JudWl3cp9fciVy6WU4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fVl9', NULL),
(36, 'sessionmesure', 'SessionMesures', 'Session de mesures ', NULL, '2016-10-11 18:01:01', NULL, 'fb_sessions_mesures', 'session_mesure_id', 'addon', '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cGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JqbgV3dXJfciVsZWN06W9ubpVf6WQ4LCJhbG3hcyoIopZ4XgN3cgN1bimzXil3cgVyZXM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24Sp9lZXVyoFN3bGVjdG3vbpm3oE3ko4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24MCosonZ1ZXc4OjEsonRmcGU4O4J26WRkZWa4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj2wLCJzbgJ0bG3zdCoIojowo4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fV0sopdy6WQ4O3t7opZ1ZWxkoj24ciVzci3vb39tZXNlcpVf6WQ4LCJhbG3hcyoIopZ4XgN3cgN1bimzXil3cgVyZXM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24UiVzci3vb4BNZXNlcpU5SWQ4LCJi6WVgoj2wLCJkZXRh6Ww4OjAsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24MSosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4J2ZXVyZV9kZWJldCosopFs6WFzoj24ZpJfciVzci3vbnNfbWVzdXJ3cyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JoZXVyZSBEZWJldCosonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oyo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIopNhcHR3dXJf6WQ4LCJhbG3hcyoIopZ4XgN3cgN1bimzXil3cgVyZXM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24QiFwdGVlc4osonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4ozo4w4Yi9ub4oIeyJiYWx1ZCoIojE4LCJkY4oIopZ4XiNhcHR3dXJzo4w46iVmoj24YiFwdGVlc391ZCosopR1cgBsYXk4O4JjbiR3fFVJRCJ9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj246p9lZXVyXgN3bGVjdG3vbpm3Xi3ko4w4YWx1YXM4O4JpY39zZXNz6W9ucl9tZXNlcpVzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3BhcnR1ZSosonZ1ZXc4OjAsopR3dGF1bCoIMCw4ci9ydGF4bGU4OjAsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjAsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oyMCosopNvbpa4Ons4dpFs6WQ4O4oxo4w4ZGo4O4JpY39qbgV3dXJzXgN3bGVjdG3vbpm3cyosopt3eSoIop1vdWVlc39zZWx3YgR1bimuZV91ZCosopR1cgBsYXk4O4JwYXJ06WVf6WQ4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24onldfQ==', NULL),
(37, 'mesure', 'Mesures', 'Mesures reçues des capteurs', NULL, '2016-10-13 08:21:17', NULL, 'fb_mesures', 'mesure_id', 'addon', 'eyJzcWxfciVsZWN0oj24oFNFTEVDVCBpY39tZXNlcpVzL425R3JPTSBpY39tZXNlcpVzoCosonNxbF9g6GVyZSoIo4BXSEVSRSBpY39tZXNlcpVzLpl3cgVyZV91ZCBJUyBOTlQ5T3VMTCosonNxbF9ncp9lcCoIo4osonRhYpx3XiR4oj24ZpJfbWVzdXJ3cyosonBy6Wlhcn3f6iVmoj24bWVzdXJ3Xi3ko4w4ZgJ1ZCoIWgs4Zp33bGQ4O4JtZXNlcpVf6WQ4LCJhbG3hcyoIopZ4Xil3cgVyZXM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24TWVzdXJ3oE3ko4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojA4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24YixlY391ZCosopFs6WFzoj24ZpJfbWVzdXJ3cyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JDbHV4oE3ko4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojE4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24bWVzciFnZV9qci9uo4w4YWx1YXM4O4JpY39tZXNlcpVzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokl3cgNhZiU5SnNvb4osonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oyo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIonN3cgN1bimfbWVzdXJ3Xi3ko4w4YWx1YXM4O4JpY39tZXNlcpVzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3N3cgN1bia5TWVzdXJ3o4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojM4LCJjbimuoj17onZhbG3koj24MSosopR4oj24ZpJfciVzci3vbnNfbWVzdXJ3cyosopt3eSoIonN3cgN1bimfbWVzdXJ3Xi3ko4w4ZG3zcGxheSoIopRhdGVf6GVlcpU4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24onldLCJpbgJtcyoIWgs4Zp33bGQ4O4JtZXNlcpVf6WQ4LCJhbG3hcyoIopZ4Xil3cgVyZXM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24TWVzdXJ3oE3ko4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24MCosonZ1ZXc4OjEsonRmcGU4O4J26WRkZWa4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24MCosopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIopNsdWJf6WQ4LCJhbG3hcyoIopZ4Xil3cgVyZXM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24Qi9tcGx3eGU5cgBvcnR1Z4osopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2wLCJ0eXB3oj24ciVsZWN0o4w4YWRkoj2xLCJz6X13oj24MCosopVk6XQ4OjEsonN3YXJj6CoIMCw4ci9ydGx1cgQ4O4oxo4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIopVadGVybpFso4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24ZpJfYixlYnM4LCJsbi9rdXBf6iVmoj24YixlY391ZCosopxvbitlcF9iYWxlZSoIopNsdWJf6WQ4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24bWVzciFnZV9qci9uo4w4YWx1YXM4O4JpY39tZXNlcpVzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokl3cgNhZiU5SnNvb4osopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2xLCJ0eXB3oj24dGVadCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4O4oyo4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24ciVzci3vb39tZXNlcpVf6WQ4LCJhbG3hcyoIopZ4Xil3cgVyZXM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24UiVzci3vb4BNZXNlcpU4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIonN3bGVjdCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4O4ozo4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIopVadGVybpFso4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24ZpJfciVzci3vbnNfbWVzdXJ3cyosopxvbitlcF9rZXk4O4JzZXNz6W9uXil3cgVyZV91ZCosopxvbitlcF9iYWxlZSoIopRhdGVf6GVlcpU4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fVl9', NULL),
(38, 'mesurestoutes', 'Mesures', 'Toutes les mesures reçues', NULL, '2016-10-13 11:35:34', NULL, 'fb_mesures', 'mesure_id', 'addon', 'eyJzcWxfciVsZWN0oj24oFNFTEVDVCBpY39tZXNlcpVzL425R3JPTSBpY39tZXNlcpVzoCosonNxbF9g6GVyZSoIo4BXSEVSRSBpY39tZXNlcpVzLpl3cgVyZV91ZCBJUyBOTlQ5T3VMTCosonNxbF9ncp9lcCoIo4osonRhYpx3XiR4oj24ZpJfbWVzdXJ3cyosonBy6Wlhcn3f6iVmoj24bWVzdXJ3Xi3ko4w4ZgJ1ZCoIWgs4Zp33bGQ4O4JtZXNlcpVf6WQ4LCJhbG3hcyoIopZ4Xil3cgVyZXM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24TWVzdXJ3oE3ko4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojA4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24SG9ybiRhdGFnZSosopFs6WFzoj24ZpJfbWVzdXJ3cyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JobgJvZGF0YWd3o4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojE4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24YixlY391ZCosopFs6WFzoj24ZpJfbWVzdXJ3cyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JDbHV4oE3ko4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojo4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24bWVzciFnZV9qci9uo4w4YWx1YXM4O4JpY39tZXNlcpVzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokl3cgNhZiU5SnNvb4osonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4ozo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIonN3cgN1bimfbWVzdXJ3Xi3ko4w4YWx1YXM4O4JpY39tZXNlcpVzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3N3cgN1bia5TWVzdXJ3oE3ko4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojQ4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fV0sopZvcplzoj1beyJp6WVsZCoIopl3cgVyZV91ZCosopFs6WFzoj24ZpJfbWVzdXJ3cyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JNZXNlcpU5SWQ4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIoph1ZGR3b4osopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4O4owo4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24SG9ybiRhdGFnZSosopFs6WFzoj24ZpJfbWVzdXJ3cyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JobgJvZGF0YWd3o4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24MCosonZ1ZXc4OjEsonRmcGU4O4J0ZXh0XiRhdGV06Wl3o4w4YWRkoj2xLCJz6X13oj24MCosopVk6XQ4OjEsonN3YXJj6CoIojE4LCJzbgJ0bG3zdCoIojE4LCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24o4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JjbHV4Xi3ko4w4YWx1YXM4O4JpY39tZXNlcpVz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', NULL),
(39, 'joueursComplexe', 'Joueurs complexe', 'Joueurs inscrits dans le complexe sportif', 'Bernard BALLESTA', '2016-10-07 11:38:19', NULL, 'fb_joueurs', 'joueur_id', 'addon', 'eyJ0YWJsZV9kY4oIopZ4Xi1vdWVlcnM4LCJwcp3tYXJmXit3eSoIop1vdWVlc391ZCosonNxbF9zZWx3YgQ4O4o5U0VMRUNUoGZ4Xi1vdWVlcnMuK4BGUk9NoGZ4Xi1vdWVlcnM5oCA4LCJzcWxfdih3cpU4O4o5V0hFUkU5ZpJf6p9lZXVycymqbgV3dXJf6WQ5SVM5Tk9UoEmVTEw4LCJzcWxfZgJvdXA4O4o4LCJncp3koj1beyJp6WVsZCoIop1vdWVlc391ZCosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JKbgV3dXo5SWQ4LCJi6WVgoj2xLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24MCosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4Jubi04LCJhbG3hcyoIopZ4Xi1vdWVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24Tp9to4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojE4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24cHJ3bW9uo4w4YWx1YXM4O4JpY39qbgV3dXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3ByXHUwMGUmbW9uo4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojo4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24ZGF0ZV9uYW3zciFuYiU4LCJhbG3hcyoIopZ4Xi1vdWVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24RGF0ZSBOYW3zciFuYiU4LCJi6WVgoj2wLCJkZXRh6Ww4OjAsonNvcnRhYpx3oj2wLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24MyosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4J0YW3sbGU4LCJhbG3hcyoIopZ4Xi1vdWVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24VGF1bGx3o4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMCw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojQ4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24cG91ZHM4LCJhbG3hcyoIopZ4Xi1vdWVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24UG91ZHM4LCJi6WVgoj2wLCJkZXRh6Ww4OjAsonNvcnRhYpx3oj2wLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24NSosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4JwbgN0ZV91ZCosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JQbgN0ZSBJZCosonZ1ZXc4OjAsopR3dGF1bCoIMCw4ci9ydGF4bGU4OjAsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oio4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIopNvbXBsZXh3XgNhbGx3Xi3ko4w4YWx1YXM4O4JpY39qbgV3dXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokNvbXBsZXh3oFNhbGx3oE3ko4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojc4LCJjbimuoj17onZhbG3koj24MSosopR4oj24ZpJzXiNvbXBsZXh3XgNhbGx3cyosopt3eSoIopNvbXBsZXh3XgNhbGx3Xi3ko4w4ZG3zcGxheSoIopmvbXxi6WxsZSJ9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24ZXFl6XB3Xi3ko4w4YWx1YXM4O4JpY39qbgV3dXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokVxdW3wZSBJZCosonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oao4w4Yi9ub4oIeyJiYWx1ZCoIojE4LCJkY4oIopZ4XiVxdW3wZXM4LCJrZXk4O4J3cXV1cGVf6WQ4LCJk6XNwbGFmoj24bp9ton0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4JjYXR3Zi9y6WVf6WQ4LCJhbG3hcyoIopZ4Xi1vdWVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24QiF0ZWdvcp33oE3ko4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMCw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojk4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24ZWm0cpF1bpVlc391ZCosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JFbnRyYW3uZXVyoE3ko4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMCw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojEwo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIonR4XgVzZXJzXi3ko4w4YWx1YXM4O4JpY39qbgV3dXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3R4oFVzZXJzoE3ko4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMCw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojExo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24onldLCJpbgJtcyoIWgs4Zp33bGQ4O4JqbgV3dXJf6WQ4LCJhbG3hcyoIopZ4Xi1vdWVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24Sp9lZXVyoE3ko4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24MCosonZ1ZXc4OjEsonRmcGU4O4J26WRkZWa4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24MCosopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIopmvbSosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JObi04LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIonR3eHQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24MSosopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIonByZWlvb4osopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JQc3xlMDB3OWmvbSosopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2xLCJ0eXB3oj24dGVadCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4O4oyo4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24ZGF0ZV9uYW3zciFuYiU4LCJhbG3hcyoIopZ4Xi1vdWVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24RGF0ZSBOYW3zciFuYiU4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMCw4dH3wZSoIonR3eHQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj2wLCJzbgJ0bG3zdCoIojM4LCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24o4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4J0YW3sbGU4LCJhbG3hcyoIopZ4Xi1vdWVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24VGF1bGx3o4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24MCosonZ1ZXc4OjAsonRmcGU4O4J0ZXh0o4w4YWRkoj2xLCJz6X13oj24MCosopVk6XQ4OjEsonN3YXJj6CoIMCw4ci9ydGx1cgQ4O4o0o4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24cG91ZHM4LCJhbG3hcyoIopZ4Xi1vdWVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24UG91ZHM4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMCw4dH3wZSoIonR3eHQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj2wLCJzbgJ0bG3zdCoIojU4LCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24o4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JwbgN0ZV91ZCosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JQbgN0ZSBJZCosopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2wLCJ0eXB3oj24dGVadCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54OjAsonNvcnRs6XN0oj24N4osopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIopNvbXBsZXh3XgNhbGx3Xi3ko4w4YWx1YXM4O4JpY39qbgV3dXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokNvbXBsZXh3oFNhbGx3oE3ko4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24MCosonZ1ZXc4OjEsonRmcGU4O4JzZWx3YgQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24Nyosopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4J3eHR3cpmhbCosopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIopZ4cl9jbilwbGVaZV9zYWxsZXM4LCJsbi9rdXBf6iVmoj24Yi9tcGx3eGVfciFsbGVf6WQ4LCJsbi9rdXBfdpFsdWU4O4Jubil8dp3sbGU4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24ZXFl6XB3Xi3ko4w4YWx1YXM4O4JpY39qbgV3dXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokVxdW3wZSBJZCosopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2xLCJ0eXB3oj24ciVsZWN0o4w4YWRkoj2xLCJz6X13oj24MCosopVk6XQ4OjEsonN3YXJj6CoIojE4LCJzbgJ0bG3zdCoIoj54LCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24ZXh0ZXJuYWw4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4JpY393cXV1cGVzo4w4bG9v6gVwXit3eSoIopVxdW3wZV91ZCosopxvbitlcF9iYWxlZSoIopmvbSosop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JjYXR3Zi9y6WVf6WQ4LCJhbG3hcyoIopZ4Xi1vdWVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24QiF0ZWdvcp33oE3ko4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24MCosonZ1ZXc4OjAsonRmcGU4O4J0ZXh0o4w4YWRkoj2xLCJz6X13oj24MCosopVk6XQ4OjEsonN3YXJj6CoIMCw4ci9ydGx1cgQ4O4omo4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24ZWm0cpF1bpVlc391ZCosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JFbnRyYW3uZXVyoE3ko4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24MCosonZ1ZXc4OjAsonRmcGU4O4JzZWx3YgQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj2wLCJzbgJ0bG3zdCoIojEwo4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIopVadGVybpFso4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24ZpJfZWm0cpF1bpVlcnM4LCJsbi9rdXBf6iVmoj24ZWm0cpF1bpVlc391ZCosopxvbitlcF9iYWxlZSoIopVudHJh6Wm3dXJf6WQ4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24dGJfdXN3cnNf6WQ4LCJhbG3hcyoIopZ4Xi1vdWVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24VGo5VXN3cnM5SWQ4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMCw4dH3wZSoIonR3eHQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj2wLCJzbgJ0bG3zdCoIojExo4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fVl9', NULL),
(40, 'joueurCentre', 'Joueurs Centre', 'Joueurs d\'un centre sportif', 'Bernard BALLESTA', '2016-10-07 11:38:19', NULL, 'fb_joueurs', 'joueur_id', 'addon', 'eyJ0YWJsZV9kY4oIopZ4Xi1vdWVlcnM4LCJwcp3tYXJmXit3eSoIop1vdWVlc391ZCosonNxbF9zZWx3YgQ4O4o5U0VMRUNUoGZ4Xi1vdWVlcnMuK4BGUk9NoGZ4Xi1vdWVlcnM5oCA5o4w4cgFsXgd2ZXJ3oj24oFdoRVJFoGZ4Xi1vdWVlcnMu6p9lZXVyXi3koE3ToEmPVCBOVUxMoCosonNxbF9ncp9lcCoIo4osopdy6WQ4O3t7opZ1ZWxkoj246p9lZXVyXi3ko4w4YWx1YXM4O4JpY39qbgV3dXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIok1vdWVlc4BJZCosonZ1ZXc4OjAsopR3dGF1bCoIMCw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oxo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIopmvbSosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JObi04LCJi6WVgoj2xLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24M4osopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4JwcpVtbia4LCJhbG3hcyoIopZ4Xi1vdWVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24UHJcdTAwZT3ubi04LCJi6WVgoj2xLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24MyosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4J3TWF1bCosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JFTWF1bCosonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4o0o4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIonR3bGVw6G9uZSosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JUXHUwMGUmbFxlMDB3OXB2bim3o4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojU4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24bGF0ZXJhbG30ZSosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JMYXR3cpFs6XR3o4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojU4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24ZGF0ZV9uYW3zciFuYiU4LCJhbG3hcyoIopZ4Xi1vdWVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24RGF0ZSBOYW3zciFuYiU4LCJi6WVgoj2wLCJkZXRh6Ww4OjAsonNvcnRhYpx3oj2wLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24N4osopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4Jwbi3kcyosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JQbi3kcyosonZ1ZXc4OjAsopR3dGF1bCoIMCw4ci9ydGF4bGU4OjAsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4ogo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIonRh6WxsZSosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JUYW3sbGU4LCJi6WVgoj2wLCJkZXRh6Ww4OjAsonNvcnRhYpx3oj2wLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24OCosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4JwbgN0ZV91ZCosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JQbgN0ZSosonZ1ZXc4OjAsopR3dGF1bCoIMCw4ci9ydGF4bGU4OjAsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4omo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIopNvbXBsZXh3XgNhbGx3Xi3ko4w4YWx1YXM4O4JpY39qbgV3dXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokNvbXBsZXh3oFNhbGx3o4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMCw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMCw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojEwo4w4Yi9ub4oIeyJiYWx1ZCoIojE4LCJkY4oIopZ4cl9jbilwbGVaZV9zYWxsZXM4LCJrZXk4O4JjbilwbGVaZV9zYWxsZV91ZCosopR1cgBsYXk4O4Jubil8dp3sbGU4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIopVxdW3wZV91ZCosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JFcXV1cGU4LCJi6WVgoj2wLCJkZXRh6Ww4OjAsonNvcnRhYpx3oj2wLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24MTE4LCJjbimuoj17onZhbG3koj24MSosopR4oj24ZpJfZXFl6XB3cyosopt3eSoIopVxdW3wZV91ZCosopR1cgBsYXk4O4Jubi04fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIopNhdGVnbgJ1ZV91ZCosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JDYXR3Zi9y6WU4LCJi6WVgoj2wLCJkZXRh6Ww4OjAsonNvcnRhYpx3oj2wLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24MTo4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24ZWm0cpF1bpVlc391ZCosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JFbnRyYW3uZXVyo4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMCw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojEzo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIonR4XgVzZXJzXi3ko4w4YWx1YXM4O4JpY39qbgV3dXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3R4oFVzZXJzo4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMCw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojE0o4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24onldLCJpbgJtcyoIWgs4Zp33bGQ4O4JqbgV3dXJf6WQ4LCJhbG3hcyoIopZ4Xi1vdWVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24Sp9lZXVyoE3ko4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24MCosonZ1ZXc4OjEsonRmcGU4O4J26WRkZWa4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24MCosopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIopmvbSosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JObi04LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIonR3eHQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24MSosopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIonByZWlvb4osopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JQc3xlMDB3OWmvbSosopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2xLCJ0eXB3oj24dGVadCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4O4oyo4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24ZUlh6Ww4LCJhbG3hcyoIopZ4Xi1vdWVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24RUlh6Ww4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIonR3eHQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24Myosopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIopRhdGVfbpF1cgNhbpN3o4w4YWx1YXM4O4JpY39qbgV3dXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokRhdGU5TpF1cgNhbpN3o4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24MCosonZ1ZXc4OjAsonRmcGU4O4J0ZXh0XiRhdGU4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj2wLCJzbgJ0bG3zdCoIojM4LCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24o4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4J0ZWx3cGhvbpU4LCJhbG3hcyoIopZ4Xi1vdWVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24VFxlMDB3OWxcdTAwZT3w6G9uZSosopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2xLCJ0eXB3oj24dGVadCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4O4o0o4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24dGF1bGx3o4w4YWx1YXM4O4JpY39qbgV3dXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3Rh6WxsZSosopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2wLCJ0eXB3oj24dGVadCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54OjAsonNvcnRs6XN0oj24NCosopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIopxhdGVyYWx1dGU4LCJhbG3hcyoIopZ4Xi1vdWVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24TGF0XHUwMGUmcpFs6XR3o4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24MCosonZ1ZXc4OjEsonRmcGU4O4JzZWx3YgQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24NSosopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4JkYXRhbG3zdCosopxvbitlcF9xdWVyeSoIokdhdWN2ZXoIRiFlYih3cnxEcp91dG33cj1Ecp91dG33c4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24cG91ZHM4LCJhbG3hcyoIopZ4Xi1vdWVlcnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24UG91ZHM4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4owo4w4dp33dyoIMCw4dH3wZSoIonR3eHQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj2wLCJzbgJ0bG3zdCoIojU4LCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24o4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JwbgN0ZV91ZCosopFs6WFzoj24ZpJf6p9lZXVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JQbgN0ZSBJZCosopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2wLCJ0eXB3oj24dGVadCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54OjAsonNvcnRs6XN0oj24N4osopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIopNvbXBsZXh3XgNhbGx3Xi3ko4w4YWx1YXM4O4JpY39qbgV3dXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokNvbXBsZXh3oFNhbGx3o4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24MCosonZ1ZXc4OjEsonRmcGU4O4JzZWx3YgQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24Nyosopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4J3eHR3cpmhbCosopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIopZ4cl9jbilwbGVaZV9zYWxsZXM4LCJsbi9rdXBf6iVmoj24Yi9tcGx3eGVfciFsbGVf6WQ4LCJsbi9rdXBfdpFsdWU4O4Jubil8dp3sbGU4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24ZXFl6XB3Xi3ko4w4YWx1YXM4O4JpY39qbgV3dXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokVxdW3wZSosopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2wLCJ0eXB3oj24ciVsZWN0o4w4YWRkoj2xLCJz6X13oj24MCosopVk6XQ4OjEsonN3YXJj6CoIMCw4ci9ydGx1cgQ4O4oao4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIopVadGVybpFso4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24ZpJfZXFl6XB3cyosopxvbitlcF9rZXk4O4J3cXV1cGVf6WQ4LCJsbi9rdXBfdpFsdWU4O4Jubi04LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24YiF0ZWdvcp33Xi3ko4w4YWx1YXM4O4JpY39qbgV3dXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoI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', NULL),
(41, 'testcombo', 'TestCombo', 'test combo liées sur users', NULL, '2016-11-11 11:54:14', NULL, 'tb_users', 'id', 'addon', 'eyJzcWxfciVsZWN0oj24oFNFTEVDVCB0Y39lciVycyaqoEZST005dGJfdXN3cnM5o4w4cgFsXgd2ZXJ3oj24oFdoRVJFoHR4XgVzZXJzLp3koE3ToEmPVCBOVUxMo4w4cgFsXidybgVwoj24o4w4dGF4bGVfZGo4O4J0Y39lciVycyosonBy6Wlhcn3f6iVmoj246WQ4LCJncp3koj1beyJp6WVsZCoIop3ko4w4YWx1YXM4O4J0Y39lciVycyosopxhYpVsoj24SWQ4LCJsYWmndWFnZSoIWl0sonN3YXJj6CoIojE4LCJkbgdubG9hZCoIojE4LCJhbG3nb4oIopx3ZnQ4LCJi6WVgoj24MSosopR3dGF1bCoIojE4LCJzbgJ0YWJsZSoIojE4LCJpcp9IZWa4O4owo4w46G3kZGVuoj24MCosonNvcnRs6XN0oj2wLCJg6WR06CoIojEwMCosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4Jncp9lcF91ZCosopFs6WFzoj24dGJfdXN3cnM4LCJsYWJ3bCoIokdybgVwoE3ko4w4bGFuZgVhZiU4O3tdLCJzZWFyYi54O4oxo4w4ZG9gbpxvYWQ4O4oxo4w4YWx1Zia4O4JsZWZ0o4w4dp33dyoIojE4LCJkZXRh6Ww4O4oxo4w4ci9ydGF4bGU4O4oxo4w4ZnJvepVuoj24MCosoph1ZGR3b4oIojA4LCJzbgJ0bG3zdCoIMSw4di3kdG54O4oxMDA4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24YixlY391ZCosopFs6WFzoj24dGJfdXN3cnM4LCJsYWJ3bCoIokNsdWo5SWQ4LCJsYWmndWFnZSoIWl0sonN3YXJj6CoIojE4LCJkbgdubG9hZCoIojE4LCJhbG3nb4oIopx3ZnQ4LCJi6WVgoj24MSosopR3dGF1bCoIojE4LCJzbgJ0YWJsZSoIojE4LCJpcp9IZWa4O4owo4w46G3kZGVuoj24MCosonNvcnRs6XN0oj2yLCJg6WR06CoIojEwMCosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4JjbilwbGVaZV9zYWxsZV91ZCosopFs6WFzoj24dGJfdXN3cnM4LCJsYWJ3bCoIokNvbXBsZXh3oFNhbGx3oE3ko4w4bGFuZgVhZiU4O3tdLCJzZWFyYi54O4oxo4w4ZG9gbpxvYWQ4O4oxo4w4YWx1Zia4O4JsZWZ0o4w4dp33dyoIojE4LCJkZXRh6Ww4O4oxo4w4ci9ydGF4bGU4O4oxo4w4ZnJvepVuoj24MCosoph1ZGR3b4oIojA4LCJzbgJ0bG3zdCoIMyw4di3kdG54O4oxMDA4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24dXN3cpmhbWU4LCJhbG3hcyoIonR4XgVzZXJzo4w4bGF4ZWw4O4JVciVybpFtZSosopxhbpdlYWd3oj1bXSw4ciVhcpN2oj24MSosopRvdimsbiFkoj24MSosopFs6Wduoj24bGVpdCosonZ1ZXc4O4oxo4w4ZGV0YW3soj24MSosonNvcnRhYpx3oj24MSosopZybg13b4oIojA4LCJ26WRkZWa4O4owo4w4ci9ydGx1cgQ4OjQsond1ZHR2oj24MTAwo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIonBhcgNgbgJko4w4YWx1YXM4O4J0Y39lciVycyosopxhYpVsoj24UGFzcgdvcpQ4LCJsYWmndWFnZSoIWl0sonN3YXJj6CoIojE4LCJkbgdubG9hZCoIojE4LCJhbG3nb4oIopx3ZnQ4LCJi6WVgoj24MSosopR3dGF1bCoIojE4LCJzbgJ0YWJsZSoIojE4LCJpcp9IZWa4O4owo4w46G3kZGVuoj24MCosonNvcnRs6XN0oj2lLCJg6WR06CoIojEwMCosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4J3bWF1bCosopFs6WFzoj24dGJfdXN3cnM4LCJsYWJ3bCoIokVtYW3so4w4bGFuZgVhZiU4O3tdLCJzZWFyYi54O4oxo4w4ZG9gbpxvYWQ4O4oxo4w4YWx1Zia4O4JsZWZ0o4w4dp33dyoIojE4LCJkZXRh6Ww4O4oxo4w4ci9ydGF4bGU4O4oxo4w4ZnJvepVuoj24MCosoph1ZGR3b4oIojA4LCJzbgJ0bG3zdCoIN4w4di3kdG54O4oxMDA4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24Zp3ycgRfbpFtZSosopFs6WFzoj24dGJfdXN3cnM4LCJsYWJ3bCoIokZ1cnN0oEmhbWU4LCJsYWmndWFnZSoIWl0sonN3YXJj6CoIojE4LCJkbgdubG9hZCoIojE4LCJhbG3nb4oIopx3ZnQ4LCJi6WVgoj24MSosopR3dGF1bCoIojE4LCJzbgJ0YWJsZSoIojE4LCJpcp9IZWa4O4owo4w46G3kZGVuoj24MCosonNvcnRs6XN0oj2gLCJg6WR06CoIojEwMCosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4JsYXN0XimhbWU4LCJhbG3hcyoIonR4XgVzZXJzo4w4bGF4ZWw4O4JMYXN0oEmhbWU4LCJsYWmndWFnZSoIWl0sonN3YXJj6CoIojE4LCJkbgdubG9hZCoIojE4LCJhbG3nb4oIopx3ZnQ4LCJi6WVgoj24MSosopR3dGF1bCoIojE4LCJzbgJ0YWJsZSoIojE4LCJpcp9IZWa4O4owo4w46G3kZGVuoj24MCosonNvcnRs6XN0oj2aLCJg6WR06CoIojEwMCosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4JhdpF0YXo4LCJhbG3hcyoIonR4XgVzZXJzo4w4bGF4ZWw4O4JBdpF0YXo4LCJsYWmndWFnZSoIWl0sonN3YXJj6CoIojE4LCJkbgdubG9hZCoIojE4LCJhbG3nb4oIopx3ZnQ4LCJi6WVgoj24MSosopR3dGF1bCoIojE4LCJzbgJ0YWJsZSoIojE4LCJpcp9IZWa4O4owo4w46G3kZGVuoj24MCosonNvcnRs6XN0oj2mLCJg6WR06CoIojEwMCosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4JhYgR1dpU4LCJhbG3hcyoIonR4XgVzZXJzo4w4bGF4ZWw4O4JBYgR1dpU4LCJsYWmndWFnZSoIWl0sonN3YXJj6CoIojE4LCJkbgdubG9hZCoIojE4LCJhbG3nb4oIopx3ZnQ4LCJi6WVgoj24MSosopR3dGF1bCoIojE4LCJzbgJ0YWJsZSoIojE4LCJpcp9IZWa4O4owo4w46G3kZGVuoj24MCosonNvcnRs6XN0oj2xMCw4di3kdG54O4oxMDA4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24bG9n6WmfYXR0ZWlwdCosopFs6WFzoj24dGJfdXN3cnM4LCJsYWJ3bCoIokxvZi3uoEF0dGVtcHQ4LCJsYWmndWFnZSoIWl0sonN3YXJj6CoIojE4LCJkbgdubG9hZCoIojE4LCJhbG3nb4oIopx3ZnQ4LCJi6WVgoj24MSosopR3dGF1bCoIojE4LCJzbgJ0YWJsZSoIojE4LCJpcp9IZWa4O4owo4w46G3kZGVuoj24MCosonNvcnRs6XN0oj2xMSw4di3kdG54O4oxMDA4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24bGFzdF9sbid1b4osopFs6WFzoj24dGJfdXN3cnM4LCJsYWJ3bCoIokxhcgQ5TG9n6Wa4LCJsYWmndWFnZSoIWl0sonN3YXJj6CoIojE4LCJkbgdubG9hZCoIojE4LCJhbG3nb4oIopx3ZnQ4LCJi6WVgoj24MSosopR3dGF1bCoIojE4LCJzbgJ0YWJsZSoIojE4LCJpcp9IZWa4O4owo4w46G3kZGVuoj24MCosonNvcnRs6XN0oj2xM4w4di3kdG54O4oxMDA4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24YgJ3YXR3ZF9hdCosopFs6WFzoj24dGJfdXN3cnM4LCJsYWJ3bCoIokNyZWF0ZWQ5QXQ4LCJsYWmndWFnZSoIWl0sonN3YXJj6CoIojE4LCJkbgdubG9hZCoIojE4LCJhbG3nb4oIopx3ZnQ4LCJi6WVgoj24MSosopR3dGF1bCoIojE4LCJzbgJ0YWJsZSoIojE4LCJpcp9IZWa4O4owo4w46G3kZGVuoj24MCosonNvcnRs6XN0oj2xMyw4di3kdG54O4oxMDA4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24dXBkYXR3ZF9hdCosopFs6WFzoj24dGJfdXN3cnM4LCJsYWJ3bCoIo3VwZGF0ZWQ5QXQ4LCJsYWmndWFnZSoIWl0sonN3YXJj6CoIojE4LCJkbgdubG9hZCoIojE4LCJhbG3nb4oIopx3ZnQ4LCJi6WVgoj24MSosopR3dGF1bCoIojE4LCJzbgJ0YWJsZSoIojE4LCJpcp9IZWa4O4owo4w46G3kZGVuoj24MCosonNvcnRs6XN0oj2xNCw4di3kdG54O4oxMDA4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24cpVt6WmkZXo4LCJhbG3hcyoIonR4XgVzZXJzo4w4bGF4ZWw4O4JSZWl1bpR3c4osopxhbpdlYWd3oj1bXSw4ciVhcpN2oj24MSosopRvdimsbiFkoj24MSosopFs6Wduoj24bGVpdCosonZ1ZXc4O4oxo4w4ZGV0YW3soj24MSosonNvcnRhYpx3oj24MSosopZybg13b4oIojA4LCJ26WRkZWa4O4owo4w4ci9ydGx1cgQ4OjElLCJg6WR06CoIojEwMCosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4JhYgR1dpF06W9uo4w4YWx1YXM4O4J0Y39lciVycyosopxhYpVsoj24QWN06XZhdG3vb4osopxhbpdlYWd3oj1bXSw4ciVhcpN2oj24MSosopRvdimsbiFkoj24MSosopFs6Wduoj24bGVpdCosonZ1ZXc4O4oxo4w4ZGV0YW3soj24MSosonNvcnRhYpx3oj24MSosopZybg13b4oIojA4LCJ26WRkZWa4O4owo4w4ci9ydGx1cgQ4OjEiLCJg6WR06CoIojEwMCosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4JyZWl3bWJ3c390bit3b4osopFs6WFzoj24dGJfdXN3cnM4LCJsYWJ3bCoIo3J3bWVtYpVyoFRv6iVuo4w4bGFuZgVhZiU4O3tdLCJzZWFyYi54O4oxo4w4ZG9gbpxvYWQ4O4oxo4w4YWx1Zia4O4JsZWZ0o4w4dp33dyoIojE4LCJkZXRh6Ww4O4oxo4w4ci9ydGF4bGU4O4oxo4w4ZnJvepVuoj24MCosoph1ZGR3b4oIojA4LCJzbgJ0bG3zdCoIMTcsond1ZHR2oj24MTAwo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4os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LCJsbi9rdXBfdpFsdWU4O4Jubi04LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24Yi9tcGx3eGVfciFsbGVf6WQ4LCJhbG3hcyoIonR4XgVzZXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokNvbXBsZXh3oFNhbGx3oE3ko4w4Zp9ybV9ncp9lcCoIMCw4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIonN3bGVjdCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4OjMsopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4J3eHR3cpmhbCosopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIopZ4cl9jbilwbGVaZV9zYWxsZXM4LCJsbi9rdXBf6iVmoj24Yi9tcGx3eGVfciFsbGVf6WQ4LCJsbi9rdXBfdpFsdWU4O4Jubi04LCJ1cl9kZXB3bpR3bpNmoj24MSosonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4JjbHV4Xi3ko4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JlciVybpFtZSosopFs6WFzoj24dGJfdXN3cnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24VXN3cpmhbWU4LCJpbgJtXidybgVwoj2wLCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2xLCJ0eXB3oj24dGVadCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4OjQsopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIonBhcgNgbgJko4w4YWx1YXM4O4J0Y39lciVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JQYXNzdi9yZCosopZvcplfZgJvdXA4OjAsonJ3cXV1cpVkoj24MCosonZ1ZXc4OjEsonRmcGU4O4J0ZXh0o4w4YWRkoj2xLCJz6X13oj24MCosopVk6XQ4OjEsonN3YXJj6CoIojE4LCJzbgJ0bG3zdCoINSw4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24ZWlh6Ww4LCJhbG3hcyoIonR4XgVzZXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokVtYW3so4w4Zp9ybV9ncp9lcCoIMCw4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIonR3eHQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj2iLCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24o4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4Jp6XJzdF9uYWl3o4w4YWx1YXM4O4J0Y39lciVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JG6XJzdCBOYWl3o4w4Zp9ybV9ncp9lcCoIMCw4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIonR3eHQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj2gLCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24o4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JsYXN0XimhbWU4LCJhbG3hcyoIonR4XgVzZXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokxhcgQ5TpFtZSosopZvcplfZgJvdXA4OjAsonJ3cXV1cpVkoj24MCosonZ1ZXc4OjEsonRmcGU4O4J0ZXh0o4w4YWRkoj2xLCJz6X13oj24MCosopVk6XQ4OjEsonN3YXJj6CoIojE4LCJzbgJ0bG3zdCoIOCw4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24YXZhdGFyo4w4YWx1YXM4O4J0Y39lciVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JBdpF0YXo4LCJpbgJtXidybgVwoj2wLCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2xLCJ0eXB3oj24dGVadCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4Ojksopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIopFjdG3iZSosopFs6WFzoj24dGJfdXN3cnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24QWN06XZ3o4w4Zp9ybV9ncp9lcCoIMCw4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIonR3eHQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj2xMCw4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24bG9n6WmfYXR0ZWlwdCosopFs6WFzoj24dGJfdXN3cnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24TG9n6Wa5QXR0ZWlwdCosopZvcplfZgJvdXA4OjAsonJ3cXV1cpVkoj24MCosonZ1ZXc4OjEsonRmcGU4O4J0ZXh0o4w4YWRkoj2xLCJz6X13oj24MCosopVk6XQ4OjEsonN3YXJj6CoIojE4LCJzbgJ0bG3zdCoIMTEsopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIopxhcgRfbG9n6Wa4LCJhbG3hcyoIonR4XgVzZXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokxhcgQ5TG9n6Wa4LCJpbgJtXidybgVwoj2wLCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2xLCJ0eXB3oj24dGVadF9kYXR3dG3tZSosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4OjEyLCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24o4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JjcpVhdGVkXiF0o4w4YWx1YXM4O4J0Y39lciVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JDcpVhdGVkoEF0o4w4Zp9ybV9ncp9lcCoIMCw4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIonR3eHRfZGF0ZXR1bWU4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj2xMyw4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24dXBkYXR3ZF9hdCosopFs6WFzoj24dGJfdXN3cnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24VXBkYXR3ZCBBdCosopZvcplfZgJvdXA4OjAsonJ3cXV1cpVkoj24MCosonZ1ZXc4OjEsonRmcGU4O4J0ZXh0XiRhdGV06Wl3o4w4YWRkoj2xLCJz6X13oj24MCosopVk6XQ4OjEsonN3YXJj6CoIojE4LCJzbgJ0bG3zdCoIMTQsopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIonJ3bW3uZGVyo4w4YWx1YXM4O4J0Y39lciVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JSZWl1bpR3c4osopZvcplfZgJvdXA4OjAsonJ3cXV1cpVkoj24MCosonZ1ZXc4OjEsonRmcGU4O4J0ZXh0o4w4YWRkoj2xLCJz6X13oj24MCosopVk6XQ4OjEsonN3YXJj6CoIojE4LCJzbgJ0bG3zdCoIMTUsopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4o4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4o4LCJsbi9rdXBf6iVmoj24o4w4bG9v6gVwXgZhbHV3oj24o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIopFjdG3iYXR1bia4LCJhbG3hcyoIonR4XgVzZXJzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokFjdG3iYXR1bia4LCJpbgJtXidybgVwoj2wLCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2xLCJ0eXB3oj24dGVadCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4OjEiLCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24o4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JyZWl3bWJ3c390bit3b4osopFs6WFzoj24dGJfdXN3cnM4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24UpVtZWl4ZXo5VG9rZWa4LCJpbgJtXidybgVwoj2wLCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2xLCJ0eXB3oj24dGVadCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4OjEgLCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24o4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JsYXN0XiFjdG3i6XRmo4w4YWx1YXM4O4J0Y39lciVycyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JMYXN0oEFjdG3i6XRmo4w4Zp9ybV9ncp9lcCoIMCw4cpVxdW3yZWQ4O4owo4w4dp33dyoIMSw4dH3wZSoIonR3eHQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj2xOCw4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fVl9', NULL),
(42, 'inscription', 'Inscription Joueurs', 'Remise des capteurs', NULL, '2016-11-22 12:17:13', NULL, 'fbs_inscription', 'inscription_id', 'addon', 'eyJ0YWJsZV9kY4oIopZ4cl91bnNjcp3wdG3vb4osonBy6Wlhcn3f6iVmoj246WmzYgJ1cHR1bimf6WQ4LCJzZXR06Wmnoj17opdy6WR0eXB3oj24o4w4bgJkZXJ4eSoIopNyZWF0ZWRPb4osop9yZGVydH3wZSoIopFzYyosonB3cnBhZiU4O4oyMCosopZybg13b4oIopZhbHN3o4w4Zp9ybSltZXR2biQ4O4JuYXR1dpU4LCJi6WVgLWl3dGhvZCoIopmhdG3iZSosop3ubG3uZSoIopZhbHN3on0sonNxbF9zZWx3YgQ4O4o5U0VMRUNUoGZ4cl91bnNjcp3wdG3vb4aqoEZST005ZpJzXi3uciNy6XB06W9uoCosonNxbF9g6GVyZSoIo4BXSEVSRSBpYnNf6WmzYgJ1cHR1biau6WmzYgJ1cHR1bimf6WQ5SVM5Tk9UoEmVTEw4LCJzcWxfZgJvdXA4O4o4LCJncp3koj1beyJp6WVsZCoIop3uciNy6XB06W9uXi3ko4w4YWx1YXM4O4JpYnNf6WmzYgJ1cHR1bia4LCJsYWmndWFnZSoIWl0sopxhYpVsoj246WQ4LCJi6WVgoj2wLCJkZXRh6Ww4OjAsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24MSosopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4osonRmcGU4O4J0ZXh0on0seyJp6WVsZCoIop1vdWVlc391ZCosopFs6WFzoj24ZpJzXi3uciNy6XB06W9uo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3BsYX33c4osonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oyo4w4Yi9ub4oIeyJiYWx1ZCoIojE4LCJkY4oIopZ4Xi1vdWVlcnM4LCJrZXk4O4JqbgV3dXJf6WQ4LCJk6XNwbGFmoj24cHJ3bW9ufGmvbSJ9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4LCJ0eXB3oj24dGVadCJ9LHs4Zp33bGQ4O4JwYXJ06WVf6WQ4LCJhbG3hcyoIopZ4cl91bnNjcp3wdG3vb4osopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JHYWl3o4w4dp33dyoIMCw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojM4LCJjbimuoj17onZhbG3koj24MSosopR4oj24ZpJfcGFydG33o4w46iVmoj24cGFydG33Xi3ko4w4ZG3zcGxheSoIopR3YnV0on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4osonRmcGU4O4J0ZXh0on0seyJp6WVsZCoIopVxdW3wZV91ZCosopFs6WFzoj24ZpJzXi3uciNy6XB06W9uo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3R3YW04LCJi6WVgoj2xLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24NCosopNvbpa4Ons4dpFs6WQ4O4oxo4w4ZGo4O4JpY393cXV1cGVzo4w46iVmoj24ZXFl6XB3Xi3ko4w4ZG3zcGxheSoIopmvbSJ9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4LCJ0eXB3oj24dGVadCJ9LHs4Zp33bGQ4O4JjYXB0ZXVyXi3ko4w4YWx1YXM4O4JpYnNf6WmzYgJ1cHR1bia4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24UiVuci9yo4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojU4LCJjbimuoj17onZhbG3koj24MSosopR4oj24ZpJfYiFwdGVlcnM4LCJrZXk4O4JjYXB0ZXVyXi3ko4w4ZG3zcGxheSoIopNvZGU4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24o4w4dH3wZSoIonR3eHQ4fSx7opZ1ZWxkoj24ZiFnZSosopFs6WFzoj24ZpJzXi3uciNy6XB06W9uo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokdhZiU4LCJi6WVgoj2wLCJkZXRh6Ww4OjAsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24N4osopNvbpa4Ons4dpFs6WQ4O4owo4w4ZGo4O4o4LCJrZXk4O4o4LCJk6XNwbGFmoj24on0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4osonRmcGU4O4J0ZXh0on0seyJp6WVsZCoIopNyZWF0ZWRfYn3fdXN3c391ZCosopFs6WFzoj24ZpJzXi3uciNy6XB06W9uo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3V06Wx1ciF0ZXVyo4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojc4LCJjbimuoj17onZhbG3koj24MSosopR4oj24dGJfdXN3cnM4LCJrZXk4O4J1ZCosopR1cgBsYXk4O4Jp6XJzdF9uYWl3fGxhcgRfbpFtZSJ9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4LCJ0eXB3oj24dGVadCJ9LHs4Zp33bGQ4O4JjcpVhdGVkTia4LCJhbG3hcyoIopZ4cl91bnNjcp3wdG3vb4osopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JDcpVhdGVkoG9uo4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIoj54LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4JkYXR3o4w4Zp9ybWF0XgZhbHV3oj24ZFwvbVwvWSBoOpk4LCJ0eXB3oj24dGVadCJ9LHs4Zp33bGQ4O4JlcGRhdGVkTia4LCJhbG3hcyoIopZ4cl91bnNjcp3wdG3vb4osopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JVcGRhdGVkoE9uo4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojk4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4JkYXR3o4w4Zp9ybWF0XgZhbHV3oj24ZFwvbVwvWSBoOpk4LCJ0eXB3oj24dGVadCJ9XSw4Zp9ybXM4O3t7opZ1ZWxkoj246WmzYgJ1cHR1bimf6WQ4LCJhbG3hcyoIopZ4cl91bnNjcp3wdG3vb4osopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JJbnNjcp3wdG3vb4osopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2xLCJ0eXB3oj246G3kZGVuo4w4YWRkoj2xLCJz6X13oj24MCosopVk6XQ4OjEsonN3YXJj6CoIojE4LCJzbgJ0bG3zdCoIojE4LCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24o4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JqbgV3dXJf6WQ4LCJhbG3hcyoIopZ4cl91bnNjcp3wdG3vb4osopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JQTGFmZXo4LCJpbgJtXidybgVwoj24o4w4cpVxdW3yZWQ4O4JyZXFl6XJ3ZCosonZ1ZXc4OjEsonRmcGU4O4JzZWx3YgQ4LCJhZGQ4OjEsonN1epU4O4owo4w4ZWR1dCoIMSw4ciVhcpN2oj24MSosonNvcnRs6XN0oj24M4osopx1bW30ZWQ4O4o4LCJvcHR1bia4Ons4bgB0XgRmcGU4O4J3eHR3cpmhbCosopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIopZ4Xi1vdWVlcnM4LCJsbi9rdXBf6iVmoj246p9lZXVyXi3ko4w4bG9v6gVwXgZhbHV3oj24cHJ3bW9ufGmvbSosop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JwYXJ06WVf6WQ4LCJhbG3hcyoIopZ4cl91bnNjcp3wdG3vb4osopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JNYXRj6CosopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIonJ3cXV1cpVko4w4dp33dyoIMSw4dH3wZSoIonN3bGVjdCosopFkZCoIMSw4ci3IZSoIojA4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YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JjcpVhdGVkXiJmXgVzZXJf6WQ4LCJhbG3hcyoIopZ4cl91bnNjcp3wdG3vb4osopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JDcpVhdGVkoGJmoCosopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2wLCJ0eXB3oj24dGVadCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4O4ogo4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24YgJ3YXR3ZE9uo4w4YWx1YXM4O4JpYnNf6WmzYgJ1cHR1bia4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24QgJ3YXR3ZCBPb4osopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2wLCJ0eXB3oj24dGVadF9kYXR3dG3tZSosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4O4oao4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxkoj24dXBkYXR3ZE9uo4w4YWx1YXM4O4JpYnNf6WmzYgJ1cHR1bia4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24VXBkYXR3ZE9uo4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24MCosonZ1ZXc4OjAsonRmcGU4O4J0ZXh0XiRhdGV06Wl3o4w4YWRkoj2xLCJz6X13oj24MCosopVk6XQ4OjEsonN3YXJj6CoIojE4LCJzbgJ0bG3zdCoIojk4LCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24o4w4bG9v6gVwXgFlZXJmoj24o4w4bG9v6gVwXgRhYpx3oj24o4w4bG9v6gVwXit3eSoIo4osopxvbitlcF9iYWxlZSoIo4osop3zXiR3cGVuZGVuYgk4O4o4LCJzZWx3YgRfbXVsdG3wbGU4O4owo4w46WlhZiVfbXVsdG3wbGU4O4owo4w4bG9v6gVwXiR3cGVuZGVuYg3f6iVmoj24o4w4cGF06F90bl9lcGxvYWQ4O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9XX0=', '{"title":{"fr":""},"note":{"fr":""}}'),
(49, 'statistiques', 'Statistiques', 'Performances des joueurs', NULL, '2016-11-25 19:35:49', NULL, 'fb_statistiques', 'statistique_id', 'addon', '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ZWmkXiNsYXNzoj24onl9XSw4ZgJ1ZCoIWgs4Zp33bGQ4O4JzdGF06XN06XFlZV91ZCosopFs6WFzoj24ZpJfcgRhdG3zdG3xdWVzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3N0YXR1cgR1cXV3oE3ko4w4dp33dyoIMCw4ZGV0YW3soj2wLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojE4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj24ZGF0ZSosopFs6WFzoj24ZpJfcgRhdG3zdG3xdWVzo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokRhdGU5ZXQ5SGVlcpU5UGFydG33o4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojo4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4JkYXR3o4w4Zp9ybWF0XgZhbHV3oj24ZFwvbVwvWSJ9LHs4Zp33bGQ4O4JqbgV3dXJf6WQ4LCJhbG3hcyoIopZ4XgN0YXR1cgR1cXV3cyosopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JKbgV3dXo4LCJi6WVgoj2xLCJkZXRh6Ww4OjEsonNvcnRhYpx3oj2xLCJzZWFyYi54OjEsopRvdimsbiFkoj2xLCJpcp9IZWa4OjEsopx1bW30ZWQ4O4o4LCJg6WR06CoIojEwMCosopFs6Wduoj24bGVpdCosonNvcnRs6XN0oj24MyosopNvbpa4Ons4dpFs6WQ4O4oxo4w4ZGo4O4JpY39qbgV3dXJzo4w46iVmoj246p9lZXVyXi3ko4w4ZG3zcGxheSoIonByZWlvbnxubi04fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24onldfQ==', NULL),
(50, 'accueiljoueurs', 'AccueilJoueurs ', 'Remise du capteur', NULL, '2016-12-08 16:54:13', NULL, 'fbs_inscription', 'inscription_id', 'addon', 'eyJzcWxfciVsZWN0oj24oFNFTEVDVCBpYnNf6WmzYgJ1cHR1biauK4BGUk9NoGZ4cl91bnNjcp3wdG3vb4A4LCJzcWxfdih3cpU4O4o5V0hFUkU5ZpJzXi3uciNy6XB06W9uLp3uciNy6XB06W9uXi3koE3ToEmPVCBOVUxMo4w4cgFsXidybgVwoj24o4w4dGF4bGVfZGo4O4JpYnNf6WmzYgJ1cHR1bia4LCJwcp3tYXJmXit3eSoIop3uciNy6XB06W9uXi3ko4w4ZgJ1ZCoIWgs4Zp33bGQ4O4J1bnNjcp3wdG3vb391ZCosopFs6WFzoj24ZpJzXi3uciNy6XB06W9uo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIok3uciNy6XB06W9uoE3ko4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojA4LCJjbimuoj17onZhbG3koj24MCosopR4oj24o4w46iVmoj24o4w4ZG3zcGxheSoIo4J9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj246p9lZXVyXi3ko4w4YWx1YXM4O4JpYnNf6WmzYgJ1cHR1bia4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24Sp9lZXVyoE3ko4w4dp33dyoIMSw4ZGV0YW3soj2xLCJzbgJ0YWJsZSoIMSw4ciVhcpN2oj2xLCJkbgdubG9hZCoIMSw4ZnJvepVuoj2xLCJs6Wl1dGVkoj24o4w4di3kdG54O4oxMDA4LCJhbG3nb4oIopx3ZnQ4LCJzbgJ0bG3zdCoIojE4LCJjbimuoj17onZhbG3koj24MSosopR4oj24ZpJf6p9lZXVycyosopt3eSoIop1vdWVlc391ZCosopR1cgBsYXk4O4JwcpVtbim8bp9ton0sopZvcplhdF9hcyoIo4osopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4J0ZXJyYW3uXi3ko4w4YWx1YXM4O4JpYnNf6WmzYgJ1cHR1bia4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24VGVycpF1b4BJZCosonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oyo4w4Yi9ub4oIeyJiYWx1ZCoIojE4LCJkY4oIopZ4cl9zYWxsZXM4LCJrZXk4O4JzYWxsZV91ZCosopR1cgBsYXk4O4J1ZGVudG3p6WFudCJ9LCJpbgJtYXRfYXM4O4o4LCJpbgJtYXRfdpFsdWU4O4o4fSx7opZ1ZWxkoj246GVlcpVfZGV4dXQ4LCJhbG3hcyoIopZ4cl91bnNjcp3wdG3vb4osopxhbpdlYWd3oj1bXSw4bGF4ZWw4O4JoZXVyZSBEZWJldCosonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4ozo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24ZGF0ZSosopZvcplhdF9iYWxlZSoIo4J9LHs4Zp33bGQ4O4JjYXB0ZXVyXi3ko4w4YWx1YXM4O4JpYnNf6WmzYgJ1cHR1bia4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24QiFwdGVlc4BJZCosonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4o0o4w4Yi9ub4oIeyJiYWx1ZCoIojE4LCJkY4oIopZ4XiNhcHR3dXJzo4w46iVmoj24YiFwdGVlc391ZCosopR1cgBsYXk4O4JudWl3cp9fciVy6WU4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIopNyZWF0ZWRfYn3fdXN3c391ZCosopFs6WFzoj24ZpJzXi3uciNy6XB06W9uo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokNyZWF0ZWQ5Qnk5VXN3c4BJZCosonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4olo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIopNyZWF0ZWRPb4osopFs6WFzoj24ZpJzXi3uciNy6XB06W9uo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokNyZWF0ZWRPb4osonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4oio4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIonVwZGF0ZWRPb4osopFs6WFzoj24ZpJzXi3uciNy6XB06W9uo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIo3VwZGF0ZWRPb4osonZ1ZXc4OjEsopR3dGF1bCoIMSw4ci9ydGF4bGU4OjEsonN3YXJj6CoIMSw4ZG9gbpxvYWQ4OjEsopZybg13b4oIMSw4bG3t6XR3ZCoIo4osond1ZHR2oj24MTAwo4w4YWx1Zia4O4JsZWZ0o4w4ci9ydGx1cgQ4O4ogo4w4Yi9ub4oIeyJiYWx1ZCoIojA4LCJkY4oIo4osopt3eSoIo4osopR1cgBsYXk4O4o4fSw4Zp9ybWF0XiFzoj24o4w4Zp9ybWF0XgZhbHV3oj24on0seyJp6WVsZCoIopNvbXBsZXh3XgNhbGx3Xi3ko4w4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O4o4LCJyZXN1epVfdi3kdG54O4o4LCJyZXN1epVf6GV1Zih0oj24o4w4dXBsbiFkXgRmcGU4O4o4LCJ0bi9sdG3woj24o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4J2ZXVyZV9kZWJldCosopFs6WFzoj24ZpJzXi3uciNy6XB06W9uo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokh3dXJ3oER3YnV0o4w4Zp9ybV9ncp9lcCoIo4osonJ3cXV1cpVkoj24cpVxdW3yZWQ4LCJi6WVgoj2xLCJ0eXB3oj24dGVadF9kYXR3dG3tZSosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4O4ozo4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIoph3dXJ3oGRloGRcdTAwZT34dXQ5ZGU5bGE5cGFydG33oFxlMDB3MCBsYXFlZWxsZSBsZSBqbgV3dXo5ci9l6GF1dCBzJi3uciNy6XJ3o4w4YXR0cp34dXR3oj24o4w4ZXh0ZWmkXiNsYXNzoj24onl9LHs4Zp33bGQ4O4JjYXB0ZXVyXi3ko4w4YWx1YXM4O4JpYnNf6WmzYgJ1cHR1bia4LCJsYWmndWFnZSoIWl0sopxhYpVsoj24QiFwdGVlc4BJZCosopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2xLCJ0eXB3oj24ciVsZWN0o4w4YWRkoj2xLCJz6X13oj24MCosopVk6XQ4OjEsonN3YXJj6CoIojE4LCJzbgJ0bG3zdCoIojQ4LCJs6Wl1dGVkoj24o4w4bgB06W9uoj17op9wdF90eXB3oj24ZXh0ZXJuYWw4LCJsbi9rdXBfcXV3cnk4O4o4LCJsbi9rdXBfdGF4bGU4O4JpY39jYXB0ZXVycyosopxvbitlcF9rZXk4O4JjYXB0ZXVyXi3ko4w4bG9v6gVwXgZhbHV3oj24bnVtZXJvXgN3cp33o4w46XNfZGVwZWmkZWmjeSoIo4osonN3bGVjdF9tdWx06XBsZSoIojA4LCJ1bWFnZV9tdWx06XBsZSoIojA4LCJsbi9rdXBfZGVwZWmkZWmjeV9rZXk4O4o4LCJwYXR2XgRvXgVwbG9hZCoIo4osonJ3ci3IZV9g6WR06CoIo4osonJ3ci3IZV92ZW3n6HQ4O4o4LCJlcGxvYWRfdH3wZSoIo4osonRvbix06XA4O4o4LCJhdHRy6WJldGU4O4o4LCJ3eHR3bpRfYixhcgM4O4o4fX0seyJp6WVsZCoIopNyZWF0ZWRfYn3fdXN3c391ZCosopFs6WFzoj24ZpJzXi3uciNy6XB06W9uo4w4bGFuZgVhZiU4O3tdLCJsYWJ3bCoIokNyZWF0ZWQ5Qnk5VXN3c4BJZCosopZvcplfZgJvdXA4O4o4LCJyZXFl6XJ3ZCoIojA4LCJi6WVgoj2xLCJ0eXB3oj24dGVadCosopFkZCoIMSw4ci3IZSoIojA4LCJ3ZG30oj2xLCJzZWFyYi54O4oxo4w4ci9ydGx1cgQ4O4olo4w4bG3t6XR3ZCoIo4osop9wdG3vb4oIeyJvcHRfdH3wZSoIo4osopxvbitlcF9xdWVyeSoIo4osopxvbitlcF90YWJsZSoIo4osopxvbitlcF9rZXk4O4o4LCJsbi9rdXBfdpFsdWU4O4o4LCJ1cl9kZXB3bpR3bpNmoj24o4w4ciVsZWN0XillbHR1cGx3oj24MCosop3tYWd3XillbHR1cGx3oj24MCosopxvbitlcF9kZXB3bpR3bpNmXit3eSoIo4osonBhdGhfdG9fdXBsbiFkoj24o4w4cpVz6X13Xgd1ZHR2oj24o4w4cpVz6X13Xih36Wd2dCoIo4osonVwbG9hZF90eXB3oj24o4w4dG9vbHR1cCoIo4osopF0dHJ1YnV0ZSoIo4osopVadGVuZF9jbGFzcyoIo4J9fSx7opZ1ZWxk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', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `tb_notification`
--

CREATE TABLE `tb_notification` (
  `id` int(11) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `note` text,
  `created` datetime DEFAULT NULL,
  `icon` char(20) DEFAULT NULL,
  `is_read` enum('0','1') DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `tb_notification`
--

INSERT INTO `tb_notification` (`id`, `userid`, `url`, `title`, `note`, `created`, `icon`, `is_read`) VALUES
(1, 1, 'sadas', 'asdasd', 'This is sample notification for superadmin', '2016-05-25 00:00:00', NULL, '1');

-- --------------------------------------------------------

--
-- Structure de la table `tb_pages`
--

CREATE TABLE `tb_pages` (
  `pageID` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `note` text,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `filename` varchar(50) DEFAULT NULL,
  `status` enum('enable','disable') DEFAULT 'enable',
  `access` text,
  `allow_guest` enum('0','1') DEFAULT '0',
  `template` enum('frontend','backend') DEFAULT 'frontend',
  `metakey` varchar(255) DEFAULT NULL,
  `metadesc` text,
  `default` enum('0','1') DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `tb_pages`
--

INSERT INTO `tb_pages` (`pageID`, `title`, `alias`, `note`, `created`, `updated`, `filename`, `status`, `access`, `allow_guest`, `template`, `metakey`, `metadesc`, `default`) VALUES
(1, 'Accueil', 'home', NULL, '2016-10-24 10:59:02', '2016-12-04 17:57:23', 'home', 'enable', '{"1":"1","2":"1","4":"1","5":"1","8":"1","10":"1"}', '1', 'frontend', 'tet', 'tetet', '1'),
(26, 'Contact Us', 'contact-us', NULL, '2016-10-24 10:59:02', '2016-10-24 10:59:02', 'contactus', 'enable', '{"1":"1","2":"0","3":"0"}', '1', 'frontend', '', '', '0'),
(27, 'About Us', 'about-us', NULL, '2016-10-24 10:59:02', '2016-10-24 10:59:02', 'aboutus', 'enable', '{"1":"1","2":"0","3":"0"}', '1', 'frontend', '', '', '0'),
(29, 'service', 'service', NULL, '2016-10-24 10:59:02', '2016-10-24 10:59:02', 'service', 'enable', '{"1":"1","2":"0","3":"0"}', '1', 'frontend', '', '', '0'),
(45, 'Term Of Condition', 'toc', NULL, '2016-10-24 10:59:02', '2016-10-24 10:59:02', 'toc', 'enable', '{"1":"1","2":"0","3":"0"}', '1', 'frontend', '', '', '0'),
(46, 'Privacy Policy', 'privacy', NULL, '2016-10-24 10:59:02', '2016-10-24 10:59:02', 'privacy', 'enable', '{"1":"1","2":"0","3":"0"}', '1', 'frontend', '', '', '0'),
(49, 'Inscription Joueur', 'InscriptionJoueur', NULL, '2017-01-12 08:52:47', '2017-01-12 09:04:34', 'InscriptionJoueur', 'enable', '{"1":"1","2":"1","4":"1","5":"1","8":"1","10":"1"}', '1', 'frontend', NULL, NULL, '0');

-- --------------------------------------------------------

--
-- Structure de la table `tb_users`
--

CREATE TABLE `tb_users` (
  `id` int(11) NOT NULL,
  `group_id` int(6) DEFAULT NULL,
  `club_id` int(10) UNSIGNED DEFAULT NULL,
  `complexe_salle_id` int(10) UNSIGNED DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(64) NOT NULL,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `login_attempt` tinyint(2) DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reminder` varchar(64) DEFAULT NULL,
  `activation` varchar(50) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `last_activity` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `tb_users`
--

INSERT INTO `tb_users` (`id`, `group_id`, `club_id`, `complexe_salle_id`, `username`, `password`, `email`, `first_name`, `last_name`, `avatar`, `active`, `login_attempt`, `last_login`, `created_at`, `updated_at`, `reminder`, `activation`, `remember_token`, `last_activity`) VALUES
(5, 1, 4, 7, 'bballesta', '$2y$10$Q3E2qK12y71AssYZlPZsKu7S9Vm8z0zoN8EemWL4DAN8mvmDaYVTW', 'bernard@ballesta.fr', 'Bernard', 'BALLESTA', '5.jpg', 1, 0, '2017-01-26 22:31:31', '2016-09-24 16:20:39', '2017-01-26 21:31:23', NULL, NULL, 'dINeWOBNELxD1ypBD9Fl2gAxPgv2uhvDecW4ibvBJKKPqLCuzHjMdQuKoYwm', 1487016580),
(6, 2, 0, 0, 'MG', '$2y$10$21EwVcnb3R0/wnwGQwUiqe668I.5FzsdQxcC5KV/T/poMA7ZAUXgG', 'bernard@ballesta.fr', 'Matthieu', 'GERARD', '6.png', 1, 0, NULL, '2016-10-24 10:35:54', NULL, NULL, NULL, NULL, NULL),
(7, 2, 0, 0, 'MK', '$2y$10$MebCDLXpSZMxkGJBPVXPF.HeC1dvvmez13xeQkEJ/Ir2bS/oiSUbC', 'mkaled@msfootball.fr', 'Mahajoub', 'Kaled', '7.jpg', 1, 0, '2016-11-21 21:48:04', '2016-10-24 10:39:26', '2016-11-22 12:15:26', NULL, NULL, 'j2zMZQkPrOLVVzwYitfkkAFSVKEvhvEnNikB0pwSRV4KzvYbD3UUo6Urdx6P', 1479816926),
(8, 4, 4, 0, 'RR', '$2y$10$sGjkWPKgpjSJBUNpq1EWoOE3ihkwEHWWW7hT13TjyVDehF.bSiKV.', 'rr@ballesta.fr', 'RR', 'rr', NULL, 1, 0, '2016-11-21 18:25:58', '2016-11-07 17:52:05', '2016-11-21 17:38:51', NULL, NULL, 'HbaIu38FDEuiUZfj5BSLg48ZtyKuqXAAPISHpDkxTkEX9YJdUUI6mnF7XIZp', 1479749931),
(9, 5, 4, 7, 'rs', '$2y$10$3RLsxtCTwnhEbrOlexjlZOGfY9FCBhxbltCkg4W0iUWi05T1cbWXi', 'rs@ballesta.fr', 'rs', 'rs', NULL, 1, 0, '2016-11-21 18:39:12', '2016-11-07 19:51:35', '2016-11-21 20:31:19', NULL, NULL, 'q6wdNoR5A7Ww4dwwpqweUKXQiZGyO3BDrsQ9g26GZhXivcoWUMQEGE3Z8yIU', 1479760279);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `fbs_complexe_salles`
--
ALTER TABLE `fbs_complexe_salles`
  ADD PRIMARY KEY (`complexe_salle_id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `fbs_inscription`
--
ALTER TABLE `fbs_inscription`
  ADD PRIMARY KEY (`inscription_id`);

--
-- Index pour la table `fbs_reseaux_salles`
--
ALTER TABLE `fbs_reseaux_salles`
  ADD PRIMARY KEY (`club_id`);

--
-- Index pour la table `fbs_salles`
--
ALTER TABLE `fbs_salles`
  ADD PRIMARY KEY (`salle_id`);

--
-- Index pour la table `fb_capteurs`
--
ALTER TABLE `fb_capteurs`
  ADD PRIMARY KEY (`capteur_id`),
  ADD KEY `capteurs_club_id_foreign` (`complexe_salle_id`);

--
-- Index pour la table `fb_categories`
--
ALTER TABLE `fb_categories`
  ADD PRIMARY KEY (`categorie_id`);

--
-- Index pour la table `fb_clubs`
--
ALTER TABLE `fb_clubs`
  ADD PRIMARY KEY (`club_id`);

--
-- Index pour la table `fb_club_type`
--
ALTER TABLE `fb_club_type`
  ADD PRIMARY KEY (`club_type_id`);

--
-- Index pour la table `fb_entraineurs`
--
ALTER TABLE `fb_entraineurs`
  ADD PRIMARY KEY (`entraineur_id`),
  ADD KEY `entraineurs_club_id_foreign` (`club_id`);

--
-- Index pour la table `fb_equipes`
--
ALTER TABLE `fb_equipes`
  ADD PRIMARY KEY (`equipe_id`);

--
-- Index pour la table `fb_equipe_joueur`
--
ALTER TABLE `fb_equipe_joueur`
  ADD PRIMARY KEY (`equipe_joueur_id`);

--
-- Index pour la table `fb_joueurs`
--
ALTER TABLE `fb_joueurs`
  ADD PRIMARY KEY (`joueur_id`),
  ADD KEY `joueurs_club_id_foreign` (`complexe_salle_id`),
  ADD KEY `joueurs_entraineur_id_foreign` (`entraineur_id`);

--
-- Index pour la table `fb_joueurs_selectionnes`
--
ALTER TABLE `fb_joueurs_selectionnes`
  ADD PRIMARY KEY (`joueur_selectionne_id`);

--
-- Index pour la table `fb_malette_capteurs`
--
ALTER TABLE `fb_malette_capteurs`
  ADD PRIMARY KEY (`malette_capteurs_id`);

--
-- Index pour la table `fb_mesures`
--
ALTER TABLE `fb_mesures`
  ADD PRIMARY KEY (`mesure_id`),
  ADD KEY `mesures_club_id_foreign` (`complexe_salle_id`),
  ADD KEY `mesures_session_mesure_id_foreign` (`session_mesure_id`);

--
-- Index pour la table `fb_partie`
--
ALTER TABLE `fb_partie`
  ADD PRIMARY KEY (`partie_id`),
  ADD KEY `activites_club_id_foreign` (`salle_id`);

--
-- Index pour la table `fb_password_resets`
--
ALTER TABLE `fb_password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Index pour la table `fb_postes`
--
ALTER TABLE `fb_postes`
  ADD PRIMARY KEY (`poste_id`);

--
-- Index pour la table `fb_sessions_mesures`
--
ALTER TABLE `fb_sessions_mesures`
  ADD PRIMARY KEY (`session_mesure_id`);

--
-- Index pour la table `fb_sessions_mesures_00`
--
ALTER TABLE `fb_sessions_mesures_00`
  ADD PRIMARY KEY (`session_mesure_id`);

--
-- Index pour la table `fb_stades`
--
ALTER TABLE `fb_stades`
  ADD PRIMARY KEY (`stade_id`);

--
-- Index pour la table `fb_staff`
--
ALTER TABLE `fb_staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- Index pour la table `fb_staff_postes`
--
ALTER TABLE `fb_staff_postes`
  ADD PRIMARY KEY (`staff_poste_id`);

--
-- Index pour la table `fb_statistiques`
--
ALTER TABLE `fb_statistiques`
  ADD PRIMARY KEY (`statistique_id`);

--
-- Index pour la table `fb_users`
--
ALTER TABLE `fb_users`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tb_groups`
--
ALTER TABLE `tb_groups`
  ADD PRIMARY KEY (`group_id`);

--
-- Index pour la table `tb_groups_access`
--
ALTER TABLE `tb_groups_access`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tb_logs`
--
ALTER TABLE `tb_logs`
  ADD PRIMARY KEY (`auditID`);

--
-- Index pour la table `tb_menu`
--
ALTER TABLE `tb_menu`
  ADD PRIMARY KEY (`menu_id`);

--
-- Index pour la table `tb_module`
--
ALTER TABLE `tb_module`
  ADD PRIMARY KEY (`module_id`);

--
-- Index pour la table `tb_notification`
--
ALTER TABLE `tb_notification`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tb_pages`
--
ALTER TABLE `tb_pages`
  ADD PRIMARY KEY (`pageID`);

--
-- Index pour la table `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `fbs_complexe_salles`
--
ALTER TABLE `fbs_complexe_salles`
  MODIFY `complexe_salle_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `fbs_inscription`
--
ALTER TABLE `fbs_inscription`
  MODIFY `inscription_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;
--
-- AUTO_INCREMENT pour la table `fbs_reseaux_salles`
--
ALTER TABLE `fbs_reseaux_salles`
  MODIFY `club_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `fbs_salles`
--
ALTER TABLE `fbs_salles`
  MODIFY `salle_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT pour la table `fb_capteurs`
--
ALTER TABLE `fb_capteurs`
  MODIFY `capteur_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT pour la table `fb_categories`
--
ALTER TABLE `fb_categories`
  MODIFY `categorie_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `fb_clubs`
--
ALTER TABLE `fb_clubs`
  MODIFY `club_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `fb_club_type`
--
ALTER TABLE `fb_club_type`
  MODIFY `club_type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `fb_entraineurs`
--
ALTER TABLE `fb_entraineurs`
  MODIFY `entraineur_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `fb_equipes`
--
ALTER TABLE `fb_equipes`
  MODIFY `equipe_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `fb_equipe_joueur`
--
ALTER TABLE `fb_equipe_joueur`
  MODIFY `equipe_joueur_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `fb_joueurs`
--
ALTER TABLE `fb_joueurs`
  MODIFY `joueur_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT pour la table `fb_joueurs_selectionnes`
--
ALTER TABLE `fb_joueurs_selectionnes`
  MODIFY `joueur_selectionne_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `fb_malette_capteurs`
--
ALTER TABLE `fb_malette_capteurs`
  MODIFY `malette_capteurs_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT pour la table `fb_mesures`
--
ALTER TABLE `fb_mesures`
  MODIFY `mesure_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1228;
--
-- AUTO_INCREMENT pour la table `fb_partie`
--
ALTER TABLE `fb_partie`
  MODIFY `partie_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT pour la table `fb_postes`
--
ALTER TABLE `fb_postes`
  MODIFY `poste_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `fb_sessions_mesures`
--
ALTER TABLE `fb_sessions_mesures`
  MODIFY `session_mesure_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT pour la table `fb_sessions_mesures_00`
--
ALTER TABLE `fb_sessions_mesures_00`
  MODIFY `session_mesure_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `fb_stades`
--
ALTER TABLE `fb_stades`
  MODIFY `stade_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `fb_staff`
--
ALTER TABLE `fb_staff`
  MODIFY `staff_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `fb_staff_postes`
--
ALTER TABLE `fb_staff_postes`
  MODIFY `staff_poste_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `fb_statistiques`
--
ALTER TABLE `fb_statistiques`
  MODIFY `statistique_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `fb_users`
--
ALTER TABLE `fb_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `tb_groups`
--
ALTER TABLE `tb_groups`
  MODIFY `group_id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `tb_groups_access`
--
ALTER TABLE `tb_groups_access`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=777;
--
-- AUTO_INCREMENT pour la table `tb_logs`
--
ALTER TABLE `tb_logs`
  MODIFY `auditID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=351;
--
-- AUTO_INCREMENT pour la table `tb_menu`
--
ALTER TABLE `tb_menu`
  MODIFY `menu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT pour la table `tb_module`
--
ALTER TABLE `tb_module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT pour la table `tb_notification`
--
ALTER TABLE `tb_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `tb_pages`
--
ALTER TABLE `tb_pages`
  MODIFY `pageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT pour la table `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `fb_entraineurs`
--
ALTER TABLE `fb_entraineurs`
  ADD CONSTRAINT `entraineurs_club_id_foreign` FOREIGN KEY (`club_id`) REFERENCES `fb_clubs` (`club_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `fb_mesures`
--
ALTER TABLE `fb_mesures`
  ADD CONSTRAINT `mesures_complexe_sportif_foreign` FOREIGN KEY (`complexe_salle_id`) REFERENCES `fbs_complexe_salles` (`complexe_salle_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mesures_session_mesure_id_foreign` FOREIGN KEY (`session_mesure_id`) REFERENCES `fb_sessions_mesures` (`session_mesure_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
