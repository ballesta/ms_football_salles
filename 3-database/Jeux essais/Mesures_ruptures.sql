
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
-- Structure de la table `fb_mesures`
--

DROP TABLE IF EXISTS `fb_mesures`;
CREATE TABLE `fb_mesures` (
  `mesure_id` int(10) UNSIGNED NOT NULL,
  `Horodatage` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bluetooth` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `complexe_salle_id` int(10) UNSIGNED DEFAULT NULL,
  `notes` varchar(40) COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `perte_messages` int(11) DEFAULT NULL,
  `perte_messages_capteur` int(11) DEFAULT NULL,
  `message_json` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `session_mesure_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `fb_mesures`
--

INSERT INTO `fb_mesures` 
	(
		`mesure_id`, 
		`Horodatage`, 
		`bluetooth`, 
		`complexe_salle_id`, 
		`notes`,
		`perte_messages`, 
		`perte_messages_capteur`, 
		`message_json`, 
		`session_mesure_id`, 
		`created_at`, 
		`updated_at`
	) 
VALUES
(1650, '2017-02-14 16:33:39', '', 7,  "0-9 OK Borne+Sensor"     , NULL, NULL, '{"chronoBorne": "0" , "chronoSensor": "0" , "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL),
(1651, '2017-02-14 16:33:41', '', 7,  ""						, NULL, NULL, '{"chronoBorne": "1" , "chronoSensor": "1" , "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL),
(1652, '2017-02-14 16:33:46', '', 7,  ""						, NULL, NULL, '{"chronoBorne": "2" , "chronoSensor": "2" , "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL),
(1653, '2017-02-14 16:33:54', '', 7,  ""						, NULL, NULL, '{"chronoBorne": "3" , "chronoSensor": "3" , "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL),
(1654, '2017-02-14 16:33:56', '', 7,  ""						, NULL, NULL, '{"chronoBorne": "4" , "chronoSensor": "4" , "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL),
(1655, '2017-02-14 16:34:05', '', 7,  ""						, NULL, NULL, '{"chronoBorne": "5" , "chronoSensor": "5" , "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL),
(1656, '2017-02-14 16:34:07', '', 7,  ""						, NULL, NULL, '{"chronoBorne": "6" , "chronoSensor": "6" , "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL),
(1657, '2017-02-14 16:34:12', '', 7,  ""						, NULL, NULL, '{"chronoBorne": "7" , "chronoSensor": "7" , "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL),
(1658, '2017-02-14 16:34:17', '', 7,  ""						, NULL, NULL, '{"chronoBorne": "8" , "chronoSensor": "8" , "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL),
(1659, '2017-02-14 16:34:21', '', 7,  "Fin OK"					, NULL, NULL, '{"chronoBorne": "9" , "chronoSensor": "9" , "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL),

(1660, '2017-02-14 16:34:27', '', 7,  "20-29 RUPTURE Borne"		, NULL, NULL, '{"chronoBorne": "20", "chronoSensor": "10", "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL),
(1661, '2017-02-14 16:34:32', '', 7,  "Rupture sensor"			, NULL, NULL, '{"chronoBorne": "21", "chronoSensor": "21", "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL),
(1662, '2017-02-14 16:34:39', '', 7,  ""						, NULL, NULL, '{"chronoBorne": "22", "chronoSensor": "22", "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL),
(1663, '2017-02-14 16:34:44', '', 7,  ""						, NULL, NULL, '{"chronoBorne": "23", "chronoSensor": "23", "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL),
(1664, '2017-02-14 16:34:48', '', 7,  ""						, NULL, NULL, '{"chronoBorne": "24", "chronoSensor": "24", "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL),
(1665, '2017-02-14 16:34:53', '', 7,  ""						, NULL, NULL, '{"chronoBorne": "25", "chronoSensor": "25", "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL),
(1666, '2017-02-14 16:34:58', '', 7,  ""						, NULL, NULL, '{"chronoBorne": "26", "chronoSensor": "26", "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL),
(1667, '2017-02-14 16:35:04', '', 7,  ""						, NULL, NULL, '{"chronoBorne": "27", "chronoSensor": "27", "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL),
(1668, '2017-02-14 16:35:09', '', 7,  ""						, NULL, NULL, '{"chronoBorne": "28", "chronoSensor": "28", "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL),
(1669, '2017-02-14 16:35:13', '', 7,  ""						, NULL, NULL, '{"chronoBorne": "29", "chronoSensor": "29", "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL),

(1670, '2017-02-14 16:35:20', '', 7,  "RAZ Borne + Sensor"	   	, NULL, NULL, '{"chronoBorne": "0" , "chronoSensor": "0"  , "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL),
(1671, '2017-02-14 16:35:24', '', 7,  ""						, NULL, NULL, '{"chronoBorne": "1" , "chronoSensor": "1"  , "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL),
(1672, '2017-02-14 16:35:31', '', 7,  ""						, NULL, NULL, '{"chronoBorne": "2" , "chronoSensor": "2"  , "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL),
(1673, '2017-02-14 16:35:34', '', 7,  ""						, NULL, NULL, '{"chronoBorne": "3" , "chronoSensor": "3"  , "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL),
(1674, '2017-02-14 16:35:40', '', 7,  ""						, NULL, NULL, '{"chronoBorne": "4" , "chronoSensor": "4"  , "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL),
(1675, '2017-02-14 16:35:44', '', 7,  ""						, NULL, NULL, '{"chronoBorne": "5" , "chronoSensor": "5"  , "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL),
(1676, '2017-02-14 16:35:50', '', 7,  "Rupture Borne"			, NULL, NULL, '{"chronoBorne": "8" , "chronoSensor": "6"  , "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL),
(1677, '2017-02-14 16:35:55', '', 7,  "Rupture Sensor"			, NULL, NULL, '{"chronoBorne": "9" , "chronoSensor": "10"  , "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL),
(1678, '2017-02-14 16:35:59', '', 7,  ""						, NULL, NULL, '{"chronoBorne": "10" , "chronoSensor": "11"  , "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL),
(1679, '2017-02-14 16:36:06', '', 7,  ""						, NULL, NULL, '{"chronoBorne": "11" , "chronoSensor": "12"  , "IEEE": "54:4a:16:56:46:1a", "mesures": {"Shoot": "0", "Passes": "0", "Step": "0", "Dist": "0", "Control": "0", "Mobility": "0", "Max": "0", "Average": "0", "Sprint": "0"}}', NULL, NULL, NULL);

--
-- Index pour la table `fb_mesures`
--
ALTER TABLE `fb_mesures`
  ADD PRIMARY KEY (`mesure_id`);


--
-- AUTO_INCREMENT pour la table `fb_mesures`
--
-- ALTER TABLE `fb_mesures`
--   MODIFY `mesure_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2000;
--
-- Contraintes pour les tables exportÃ©es
--

--
-- Contraintes pour la table `fb_mesures`
--
-- ALTER TABLE `fb_mesures` ADD CONSTRAINT `mesures_complexe_sportif_foreign`  FOREIGN KEY (`complexe_salle_id`)  REFERENCES `fbs_complexe_salles` (`complexe_salle_id`)  ON DELETE CASCADE  ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
