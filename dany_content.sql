-- --------------------------------------------------------
-- Hôte :                        localhost
-- Version du serveur:           5.7.24 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             9.5.0.5332
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour dany_content
CREATE DATABASE IF NOT EXISTS `dany_content` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dany_content`;

-- Listage de la structure de la table dany_content. code_dr
CREATE TABLE IF NOT EXISTS `code_dr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentaire` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table dany_content.code_dr : ~28 rows (environ)
/*!40000 ALTER TABLE `code_dr` DISABLE KEYS */;
INSERT INTO `code_dr` (`id`, `type`, `code`, `commentaire`) VALUES
	(1, 'D', 'D 1', 'Dépôt sur ou dans le sol (par exemple, mise en décharge, etc.) '),
	(2, 'D', 'D 2', 'Traitement en milieu terrestre (par exemple, biodégradation de déchets liquides ou de boues dans les sols, etc.) '),
	(3, 'D', 'D 3', 'Injection en profondeur (par exemple, injection des déchets pompables dans des puits, des dômes de sel ou des failles géologiques naturelles, etc.) '),
	(4, 'D', 'D 4', 'Lagunage (par exemple, déversement de déchets liquides ou de boues dans des puits, des étangs ou des bassins, etc.) '),
	(5, 'D', 'D 5', 'Mise en décharge spécialement aménagée (par exemple, placement dans des alvéoles étanches séparées, recouvertes et isolées les unes et les autres et de l’environnement, etc.) '),
	(6, 'D', 'D 6', 'Rejet dans le milieu aquatique sauf l’immersion '),
	(7, 'D', 'D 7', 'Immersion, y compris enfouissement dans le sous-sol marin '),
	(8, 'D', 'D 8', 'Traitement biologique non spécifié ailleurs dans la présente annexe, aboutissant à des composés ou à des mélanges qui sont éliminés selon l’un des procédés numérotés D 1 à D 12 '),
	(9, 'D', 'D 9', 'Traitement physico-chimique non spécifié ailleurs dans la présente annexe, aboutissant à des composés ou à des mélanges qui sont éliminés selon l’un des procédés numérotés D 1 à D 12 (par exemple, évaporation, séchage, calcination, etc.) '),
	(10, 'D', 'D 10', 'Incinération à terre '),
	(11, 'D', 'D 11', 'Incinération en mer '),
	(12, 'D', 'D 12', 'Stockage permanent (par exemple, placement de conteneurs dans une mine, etc.) '),
	(13, 'D', 'D 13', 'Regroupement préalablement à l’une des opérations numérotées D 1 à D 12 '),
	(14, 'D', 'D 14', 'Reconditionnement préalablement à l’une des opérations numérotées D 1 à D 13 '),
	(15, 'D', 'D 15', 'Stockage préalablement à l’une des opérations numérotées D 1 à D 14 (à l’exclusion du stockage temporaire, avant collecte, sur le site de production). '),
	(16, 'R', 'R 1', 'Utilisation principale comme combustible ou autre moyen de produire de l’énergie '),
	(17, 'R', 'R 2', 'Récupération ou régénération des solvants '),
	(18, 'R', 'R 3', 'Recyclage ou récupération des substances organiques qui ne sont pas utilisées comme solvants (y compris les opérations de compostage et autres transformations biologiques) '),
	(19, 'R', 'R 4', 'Recyclage ou récupération des métaux et des composés métalliques '),
	(20, 'R', 'R 5', 'Recyclage ou récupération d’autres matières inorganiques '),
	(21, 'R', 'R 6', 'Régénération des acides ou des bases '),
	(22, 'R', 'R 7', 'Récupération des produits servant à capter les polluants '),
	(23, 'R', 'R 8', 'Récupération des produits provenant des catalyseurs '),
	(24, 'R', 'R 9', 'Régénération ou autres réemplois des huiles '),
	(25, 'R', 'R 10', 'Épandage sur le sol au profit de l’agriculture ou de l’écologie '),
	(26, 'R', 'R 11', 'Utilisation de déchets résiduels obtenus à partir de l’une des opérations numérotées R 1 à R 10 '),
	(27, 'R', 'R 12', 'Échange de déchets en vue de les soumettre à l’une des opérations numérotées R 1 à R 11 '),
	(28, 'R', 'R 13', 'Stockage de déchets préalablement à l’une des opérations numérotées R 1 à R 12 (à l’exclusion du stockage temporaire, avant collecte, sur le site de production). ');
/*!40000 ALTER TABLE `code_dr` ENABLE KEYS */;

-- Listage de la structure de la table dany_content. emetteur
CREATE TABLE IF NOT EXISTS `emetteur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_dr_id` int(11) NOT NULL,
  `entreposage_id` int(11) NOT NULL,
  `transporteur_id` int(11) NOT NULL,
  `entreprise_traitement_id` int(11) NOT NULL,
  `code_dr_traitement_id` int(11) NOT NULL,
  `mode_traitement_id` int(11) NOT NULL,
  `id_bsd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fichier_bsd` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_enlevement` date NOT NULL,
  `designation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_nomenclature` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantite` decimal(10,3) NOT NULL,
  `date_admission` date NOT NULL,
  `date_traitement` date NOT NULL,
  `commentaire` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_52127D6C2B60725` (`entreposage_id`),
  KEY `IDX_52127D697C86FA4` (`transporteur_id`),
  KEY `IDX_52127D61EF34BE9` (`code_dr_id`),
  KEY `IDX_52127D684CA2E6E` (`entreprise_traitement_id`),
  KEY `IDX_52127D6E70A892A` (`code_dr_traitement_id`),
  KEY `IDX_52127D6F99DEB1A` (`mode_traitement_id`),
  CONSTRAINT `FK_2825F3ACA4AEAFEA` FOREIGN KEY (`entreposage_id`) REFERENCES `entreprise` (`id`),
  CONSTRAINT `FK_2A356D271EF34BE9` FOREIGN KEY (`code_dr_traitement_id`) REFERENCES `code_dr` (`id`),
  CONSTRAINT `FK_2A356D27A4AEAFEA` FOREIGN KEY (`entreprise_traitement_id`) REFERENCES `entreprise` (`id`),
  CONSTRAINT `FK_2A356D27F99DEB1A` FOREIGN KEY (`mode_traitement_id`) REFERENCES `mode_traitement` (`id`),
  CONSTRAINT `FK_52127D61EF34BE9` FOREIGN KEY (`code_dr_id`) REFERENCES `code_dr` (`id`),
  CONSTRAINT `FK_A2564975A4AEAFEA` FOREIGN KEY (`transporteur_id`) REFERENCES `entreprise` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table dany_content.emetteur : ~174 rows (environ)
/*!40000 ALTER TABLE `emetteur` DISABLE KEYS */;
INSERT INTO `emetteur` (`id`, `code_dr_id`, `entreposage_id`, `transporteur_id`, `entreprise_traitement_id`, `code_dr_traitement_id`, `mode_traitement_id`, `id_bsd`, `fichier_bsd`, `date_enlevement`, `designation`, `code_nomenclature`, `quantite`, `date_admission`, `date_traitement`, `commentaire`) VALUES
	(1, 5, 2, 1, 1, 7, 1, 'first', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(2, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(3, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(4, 8, 1, 2, 2, 9, 1, '123', '123.pdf', '2019-03-13', 'dechet nuclaire', '456', 7.000, '2019-03-27', '2019-03-31', NULL),
	(5, 1, 1, 1, 1, 1, 1, '1', '1.pdf', '2019-03-29', '1', '1', 1.000, '2019-03-20', '2019-03-28', NULL),
	(6, 1, 1, 1, 1, 1, 1, '1', '1.pdf', '2019-03-28', '1', '1', 1.000, '2019-03-26', '2019-03-25', NULL),
	(7, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(8, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(9, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(10, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(11, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(12, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(13, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(14, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(15, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(16, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(17, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(18, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(19, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(20, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(21, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(22, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(23, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(24, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(25, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(26, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(27, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(28, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(29, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(30, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(31, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(32, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(33, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(34, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(35, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(36, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(37, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(38, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(39, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(40, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(41, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(42, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(43, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(44, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(45, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(46, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(47, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(48, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(49, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(50, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(51, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(52, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(53, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(54, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(55, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(56, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(57, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(58, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(59, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(60, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(61, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(62, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(63, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(64, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(65, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(66, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(67, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(68, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(69, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(70, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(71, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(72, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(73, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(74, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(75, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(76, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(77, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(78, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(79, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(80, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(81, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(82, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(83, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(84, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(85, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(86, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(87, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(88, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(89, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(90, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(91, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(92, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(93, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(94, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(95, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(96, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(97, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(98, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(99, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(100, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(101, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(102, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(103, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(104, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(105, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(106, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(107, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(108, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(109, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(110, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(111, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(112, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(113, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(114, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(115, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(116, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(117, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(118, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(119, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(120, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(121, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(122, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(123, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(124, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(125, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(126, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(127, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(128, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(129, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(130, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(131, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(132, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(133, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(134, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(135, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(136, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(137, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(138, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(139, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(140, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(141, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(142, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(143, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(144, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(145, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(146, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(147, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(148, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(149, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(150, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(151, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(152, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(153, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(154, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(155, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(156, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(157, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(158, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(159, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(160, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(161, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(162, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(163, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(164, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(165, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(168, 5, 2, 1, 1, 7, 1, 'id bsd', 'id bsd.pdf', '2019-03-20', 'designation', 'code nomen', 1.500, '2019-03-28', '2019-03-30', 'commentaire'),
	(171, 1, 1, 1, 1, 1, 1, '1', '1.pdf', '2019-03-14', '1', '123', 1.000, '2019-03-26', '2019-03-29', NULL),
	(172, 1, 1, 1, 1, 1, 1, '1', '1.pdf', '2019-03-29', '1', '1', 1.000, '2019-03-27', '2019-03-27', NULL),
	(173, 1, 1, 1, 1, 1, 1, 'The last', 'The last.pdf', '2019-03-14', 'The last', 'The last', 1.000, '2019-03-14', '2019-03-14', NULL),
	(174, 1, 1, 1, 1, 1, 1, 'lastdude', 'lastdude.pdf', '2019-03-14', 'lastdude', 'lastdude', 1.000, '2019-03-14', '2019-03-21', NULL),
	(175, 1, 2, 2, 2, 1, 1, 'lastdudelastdude', 'lastdudelastdude.txt', '2019-03-01', 'designation', 'code nomen', 1.000, '2019-03-01', '2019-03-01', NULL),
	(176, 1, 1, 1, 1, 1, 1, 'id bsd', 'id bsd.pdf', '2019-03-14', 'ù', '$', 1.000, '2019-03-27', '2019-03-29', NULL),
	(177, 1, 1, 1, 1, 1, 1, '$', '$.pdf', '2019-03-28', 'm', 'm', 1.000, '2019-03-28', '2019-03-29', NULL),
	(178, 1, 1, 1, 1, 1, 1, 'ùùùùùùùùùùù', 'ùùùùùùùùùùù.pdf', '2019-03-22', 'ùù', 'ùùù', 1.000, '2019-03-27', '2019-03-31', NULL),
	(179, 1, 1, 1, 1, 1, 1, 'm', 'm.pdf', '2019-03-21', 'm', 'm', 0.043, '2019-03-27', '2019-03-30', NULL);
/*!40000 ALTER TABLE `emetteur` ENABLE KEYS */;

-- Listage de la structure de la table dany_content. entreprise
CREATE TABLE IF NOT EXISTS `entreprise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `siret` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `siren` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recepisse` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table dany_content.entreprise : ~2 rows (environ)
/*!40000 ALTER TABLE `entreprise` DISABLE KEYS */;
INSERT INTO `entreprise` (`id`, `nom`, `siret`, `siren`, `adresse`, `recepisse`) VALUES
	(1, 'CRI33', '84810113500012', '848101135', '1 le Chai 33410 LOUPIAC', '2019-T-021'),
	(2, 'alan', '1324', '4321', '15 rue du canal 49100 angers', '3635');
/*!40000 ALTER TABLE `entreprise` ENABLE KEYS */;

-- Listage de la structure de la table dany_content. migration_versions
CREATE TABLE IF NOT EXISTS `migration_versions` (
  `version` varchar(14) COLLATE utf8mb4_unicode_ci NOT NULL,
  `executed_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table dany_content.migration_versions : ~3 rows (environ)
/*!40000 ALTER TABLE `migration_versions` DISABLE KEYS */;
INSERT INTO `migration_versions` (`version`, `executed_at`) VALUES
	('20190310175553', '2019-03-13 10:14:42'),
	('20190310183702', '2019-03-12 16:24:49'),
	('20190313224833', '2019-03-13 22:48:44');
/*!40000 ALTER TABLE `migration_versions` ENABLE KEYS */;

-- Listage de la structure de la table dany_content. mode_traitement
CREATE TABLE IF NOT EXISTS `mode_traitement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentaire` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table dany_content.mode_traitement : ~2 rows (environ)
/*!40000 ALTER TABLE `mode_traitement` DISABLE KEYS */;
INSERT INTO `mode_traitement` (`id`, `label`, `commentaire`) VALUES
	(1, 'Regroupement avant valorisation', '');
/*!40000 ALTER TABLE `mode_traitement` ENABLE KEYS */;

-- Listage de la structure de la table dany_content. test
CREATE TABLE IF NOT EXISTS `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newfieldinside_id` int(11) NOT NULL,
  `field1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D87F7E0CD4B1AF0A` (`newfieldinside_id`),
  CONSTRAINT `FK_D87F7E0CD4B1AF0A` FOREIGN KEY (`newfieldinside_id`) REFERENCES `testdeux` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table dany_content.test : ~0 rows (environ)
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;

-- Listage de la structure de la table dany_content. testdeux
CREATE TABLE IF NOT EXISTS `testdeux` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field11` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field22` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table dany_content.testdeux : ~0 rows (environ)
/*!40000 ALTER TABLE `testdeux` DISABLE KEYS */;
/*!40000 ALTER TABLE `testdeux` ENABLE KEYS */;

-- Listage de la structure de la table dany_content. user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table dany_content.user : ~2 rows (environ)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `name`, `password`) VALUES
	(1, 'admin', '$2y$13$CtUlyQT3OjGZ166RupdFjOlPWJLSO.Ujv3i2AXFD/irkyA1hS9xfW'),
	(2, 'backup', '$13$MOVtvkLpZBQSglOROaVcuOGok02IhDbzJRDmzdTgnk6vk9i8x17g.');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
