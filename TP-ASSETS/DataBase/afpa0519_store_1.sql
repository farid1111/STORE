-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 02 sep. 2019 à 08:18
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `afpa0519_store_1`
--

-- --------------------------------------------------------

--
-- Structure de la table `st_addresses`
--

DROP TABLE IF EXISTS `st_addresses`;
CREATE TABLE IF NOT EXISTS `st_addresses` (
  `add_id` int(11) NOT NULL AUTO_INCREMENT,
  `st_customers_cus_id` int(11) NOT NULL,
  `add_address1` varchar(100) NOT NULL,
  `add_address2` varchar(100) DEFAULT NULL,
  `add_zipcode` varchar(5) NOT NULL,
  `add_city` varchar(45) NOT NULL,
  PRIMARY KEY (`add_id`),
  KEY `fk_st_addresses_st_customers1_idx` (`st_customers_cus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `st_addresses`
--

INSERT INTO `st_addresses` (`add_id`, `st_customers_cus_id`, `add_address1`, `add_address2`, `add_zipcode`, `add_city`) VALUES
(1, 1, 'Route de La Goulette', 'Site archéologique de Carthage', '2016', 'Carthage'),
(2, 2, '6/8 rue Georges et Mai Politzer', NULL, '75012', 'Paris'),
(3, 3, 'El Mouradia', NULL, '16000', 'Alger'),
(4, 4, 'Taourirt Moussa', '', '15000', 'Tizy Ouzou');

-- --------------------------------------------------------

--
-- Structure de la table `st_caddies`
--

DROP TABLE IF EXISTS `st_caddies`;
CREATE TABLE IF NOT EXISTS `st_caddies` (
  `st_customers_cus_id` int(11) NOT NULL,
  `st_products_pro_id` int(11) NOT NULL,
  `cad_qt` int(11) NOT NULL,
  `cad_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`st_customers_cus_id`,`st_products_pro_id`),
  KEY `fk_st_customers_has_st_products_st_products1_idx` (`st_products_pro_id`),
  KEY `fk_st_customers_has_st_products_st_customers_idx` (`st_customers_cus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `st_categories`
--

DROP TABLE IF EXISTS `st_categories`;
CREATE TABLE IF NOT EXISTS `st_categories` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_descr` varchar(45) NOT NULL,
  `cat_img_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `st_categories`
--

INSERT INTO `st_categories` (`cat_id`, `cat_descr`, `cat_img_url`) VALUES
(1, 'ARTISANAL', ''),
(2, 'BEAN TO BAR', ''),
(3, 'BIO', ''),
(4, 'CRU / NON-CONCHÉ', ''),
(5, 'ÉQUITABLE', ''),
(6, 'EXCLUSIF', ''),
(7, 'SANS SUCRE', ''),
(8, 'VEGAN', ''),
(9, 'ALLEMAGNE', ''),
(10, 'BELGIQUE', ''),
(11, 'CANADA', ''),
(12, 'ESPAGNE', ''),
(13, 'FINLANDE', ''),
(14, 'FRANCE', ''),
(15, 'ISLANDE', ''),
(16, 'SUISSE', ''),
(17, 'USA', ''),
(18, 'BELIZE', ''),
(19, 'BRÉSIL', ''),
(20, 'CAMEROUN', ''),
(21, 'COLOMBIE', ''),
(22, 'CONGO', ''),
(23, 'COSTA RICA', ''),
(24, 'CUBA', ''),
(25, 'ÉQUATEUR', ''),
(26, 'HONDURAS', ''),
(27, 'INDE', ''),
(28, 'JAMAÏQUE', ''),
(29, 'MADAGASCAR', ''),
(30, 'MEXIQUE', ''),
(31, 'NICARAGUA', ''),
(32, 'PAPOUASIE-NOUVELLE-GUINÉE', ''),
(33, 'PÉROU', ''),
(34, 'RÉPUBLIQUE DOMINICAINE', ''),
(35, 'TANZANIE', ''),
(36, 'VENEZUELA', ''),
(37, 'VIETNAM', ''),
(38, 'AU LAIT', 'https://cooking-chef.sa.metacdn.com/sites/default/files/styles/recipe_visuel_node/public/recettes/recette-temperage%20chocolat%20lait%20blanc.jpg?itok=ARQay10j'),
(39, 'BLANC', 'https://saviezvous.fr/wp-content/uploads/2018/07/chocolat-blanc-730x480.jpg'),
(40, 'BLOND', 'http://www.didierfourreau.com/wordpress/wp-content/uploads/2015/03/dulcey-2.jpg'),
(41, 'NOIR', 'http://www.douceur-des-thes.com/images/the-noir-chocolat_3.jpg'),
(42, 'NOIR D’ORIGINE', 'http://jemedeveloppe.com/wp-content/uploads/2017/12/chocolat-noir.jpg'),
(43, 'NOIR GRAND CRU ', 'https://www.misya.info/wp-content/uploads/2012/11/cioccolato-fondente.jpg'),
(44, 'RUBIS', 'https://www.francetvinfo.fr/image/75ee68170-29af/1500/843/13352953.jpg'),
(45, 'A. MORIN', ''),
(46, 'ARETÉ', ''),
(47, 'BELYZIUM', ''),
(48, 'CACAO SAMPAKA', ''),
(49, 'ERITHAJ', ''),
(50, 'GARÇOA', ''),
(51, 'GOODIO', ''),
(52, 'IDILIO ORIGINS', ''),
(53, 'LA FLOR', ''),
(54, 'MILLÉSIME', ''),
(55, 'OMNOM', ''),
(56, 'ORFÈVE', ''),
(57, 'QANTU', '');

-- --------------------------------------------------------

--
-- Structure de la table `st_categories_main`
--

DROP TABLE IF EXISTS `st_categories_main`;
CREATE TABLE IF NOT EXISTS `st_categories_main` (
  `cat_main_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_main_descr` varchar(45) NOT NULL,
  `cat_main_img` varchar(255) NOT NULL,
  PRIMARY KEY (`cat_main_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `st_categories_main`
--

INSERT INTO `st_categories_main` (`cat_main_id`, `cat_main_descr`, `cat_main_img`) VALUES
(1, 'label', 'http://www.didierfourreau.com/wordpress/wp-content/uploads/2015/03/dulcey-2.jpg'),
(2, 'production', 'https://saviezvous.fr/wp-content/uploads/2018/07/chocolat-blanc-730x480.jpg'),
(3, 'fèves', 'https://cooking-chef.sa.metacdn.com/sites/default/files/styles/recipe_visuel_node/public/recettes/recette-temperage%20chocolat%20lait%20blanc.jpg?itok=ARQay10j'),
(4, 'variétés', 'http://hand-crafted-chocolate.com/wp-content/uploads/2013/04/iStock_000000934640_Large.jpg'),
(5, 'brand', 'https://www.francetvinfo.fr/image/75ee68170-29af/1500/843/13352953.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `st_categories_main_has_st_categories`
--

DROP TABLE IF EXISTS `st_categories_main_has_st_categories`;
CREATE TABLE IF NOT EXISTS `st_categories_main_has_st_categories` (
  `st_categories_main_cat_main_id` int(11) NOT NULL,
  `st_categories_cat_id` int(11) NOT NULL,
  PRIMARY KEY (`st_categories_main_cat_main_id`,`st_categories_cat_id`),
  KEY `fk_st_categories_main_has_st_categories_main1_idx` (`st_categories_main_cat_main_id`) USING BTREE,
  KEY `fk_st_categories_main_has_st_categories1_idx` (`st_categories_cat_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `st_categories_main_has_st_categories`
--

INSERT INTO `st_categories_main_has_st_categories` (`st_categories_main_cat_main_id`, `st_categories_cat_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(2, 9),
(2, 10),
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16),
(2, 17),
(2, 45),
(3, 18),
(3, 19),
(3, 20),
(3, 21),
(3, 22),
(3, 23),
(3, 24),
(3, 25),
(3, 26),
(3, 27),
(3, 28),
(3, 29),
(3, 30),
(3, 31),
(3, 32),
(3, 33),
(3, 34),
(3, 35),
(3, 37),
(4, 38),
(4, 39),
(4, 41),
(4, 42),
(4, 43),
(4, 44),
(5, 45),
(5, 46),
(5, 47),
(5, 48),
(5, 49),
(5, 50),
(5, 51),
(5, 52),
(5, 53),
(5, 54),
(5, 55),
(5, 56),
(5, 57);

-- --------------------------------------------------------

--
-- Structure de la table `st_customers`
--

DROP TABLE IF EXISTS `st_customers`;
CREATE TABLE IF NOT EXISTS `st_customers` (
  `cus_id` int(11) NOT NULL AUTO_INCREMENT,
  `cus_civility` tinyint(4) NOT NULL DEFAULT '1',
  `cus_lastname` varchar(45) NOT NULL,
  `cus_firstname` varchar(45) NOT NULL,
  `cus_mail` varchar(80) NOT NULL,
  `cus_password` varchar(32) NOT NULL,
  `cus_admin` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `st_customers`
--

INSERT INTO `st_customers` (`cus_id`, `cus_civility`, `cus_lastname`, `cus_firstname`, `cus_mail`, `cus_password`, `cus_admin`) VALUES
(1, 1, 'BOUSSETTA', 'Farid', 'farid_2312@hotmail.fr', '8d5e957f297893487bd98fa830fa6413', 1),
(2, 1, 'MONDEGUER', 'Gwendal', 'loaye1978@gmail.com', '8d5e957f297893487bd98fa830fa6413', 1),
(3, 1, 'SALAH', 'Merwhan', 'merwhan.salah@outlook.fr', '8d5e957f297893487bd98fa830fa6413', 1),
(4, 1, 'TAKHERBOUCHT', 'Abdenour', 'tab88@live.fr', '8d5e957f297893487bd98fa830fa6413', 1),
(5, 1, 'GIRAUD', 'Philippe', 'phgiraud@cogitium.com)\r\n', '8d5e957f297893487bd98fa830fa6413', 1);

-- --------------------------------------------------------

--
-- Structure de la table `st_orders`
--

DROP TABLE IF EXISTS `st_orders`;
CREATE TABLE IF NOT EXISTS `st_orders` (
  `ord_id` int(11) NOT NULL AUTO_INCREMENT,
  `st_customers_cus_id` int(11) NOT NULL,
  `st_types_of_logistics_typ_log_id` int(11) NOT NULL,
  `st_address_billing` int(11) NOT NULL,
  `st_address_delivery` int(11) NOT NULL,
  `ord_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ord_total` decimal(10,2) NOT NULL,
  `ord_qt` int(11) NOT NULL,
  PRIMARY KEY (`ord_id`),
  KEY `fk_st_orders_st_customers1_idx` (`st_customers_cus_id`),
  KEY `fk_st_orders_st_types_of_logistics1_idx` (`st_types_of_logistics_typ_log_id`),
  KEY `fk_st_orders_st_addresses1_idx` (`st_address_billing`),
  KEY `fk_st_orders_st_addresses2_idx` (`st_address_delivery`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `st_orders_lines`
--

DROP TABLE IF EXISTS `st_orders_lines`;
CREATE TABLE IF NOT EXISTS `st_orders_lines` (
  `st_orders_ord_id` int(11) NOT NULL,
  `st_products_pro_id` int(11) NOT NULL,
  `ord_lines_qt` int(11) NOT NULL,
  `ord_lines_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`st_orders_ord_id`,`st_products_pro_id`),
  KEY `fk_st_orders_has_st_products_st_products1_idx` (`st_products_pro_id`),
  KEY `fk_st_orders_has_st_products_st_orders1_idx` (`st_orders_ord_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `st_payments`
--

DROP TABLE IF EXISTS `st_payments`;
CREATE TABLE IF NOT EXISTS `st_payments` (
  `pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `st_types_of_payments_typ_pay_id` int(11) NOT NULL,
  `st_customers_cus_id` int(11) NOT NULL,
  `pay_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pay_amount` decimal(10,2) NOT NULL,
  `st_orders_ord_id` int(11) NOT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `fk_st_payments_st_types_of_payments1_idx` (`st_types_of_payments_typ_pay_id`),
  KEY `fk_st_payments_st_customers1_idx` (`st_customers_cus_id`),
  KEY `fk_st_payments_st_orders1_idx` (`st_orders_ord_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `st_products`
--

DROP TABLE IF EXISTS `st_products`;
CREATE TABLE IF NOT EXISTS `st_products` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_title` varchar(200) NOT NULL,
  `pro_subtitle1` varchar(255) DEFAULT NULL,
  `pro_subtitle2` varchar(255) DEFAULT NULL,
  `pro_subtitle3` varchar(255) DEFAULT NULL,
  `pro_img_url_recto` varchar(255) NOT NULL,
  `pro_img_url_verso` varchar(255) NOT NULL,
  `pro_descr` mediumtext NOT NULL,
  `pro_price_euro` decimal(10,2) NOT NULL,
  `pro_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pro_id`),
  UNIQUE KEY `pro_title` (`pro_title`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `st_products`
--

INSERT INTO `st_products` (`pro_id`, `pro_title`, `pro_subtitle1`, `pro_subtitle2`, `pro_subtitle3`, `pro_img_url_recto`, `pro_img_url_verso`, `pro_descr`, `pro_price_euro`, `pro_date`) VALUES
(1, 'MENTA PIPERITA', 'chocolat banc à la menthe poivrée', 'Cacao Sampaka | Espagne (Barcelone)', 'artisanal', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Sampaka_Menta_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Sampaka_Menta_B.jpg', ' Dans la série des chocolats blancs d’une autre couleur, celui à la menthe mérite une attention particulière. Loin de l’impression très (trop?) puissante d’un After Eight, il distille son goût avec subtilité et douceur.', '6.35', '2019-08-30 20:43:07'),
(2, 'FRAMBUESA', 'chocolat rubis à la framboise', 'Cacao Sampaka | Espagne (Barcelone)', 'artisanal', 'https://www.chocolatsdumonde.ch/wp-content/uploads/CacaoSampaka_RubisFramboise_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/CacaoSampaka_RubisFramboise_B.jpg', ' L’ajout de framboises au rubis ne fait pas qu’augmenter la sensation de fruits rouges, il permet également de changer la texture du chocolat. A comparer avec le rubis classique.', '7.73', '2019-08-30 20:43:07'),
(3, 'RUBI', 'chocolat rubis', 'Cacao Sampaka | Espagne (Barcelone)', 'artisanal', 'https://www.chocolatsdumonde.ch/wp-content/uploads/CacaoSampaka_Rubis_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/CacaoSampaka_Rubis_B.jpg', ' La nouvelle sorte de chocolat qu’est le rubis fait couler beaucoup d’encre. Proche d’un chocolat blanc de par son côté fondant et sucré, il n’en reste pas moins surprenant : les notes de fruits rouges acidulés sont très nettes. Sa plus haute teneur en cacao le rend plus intéressant que les variantes industrielles. A goûter!', '6.81', '2019-08-30 20:43:07'),
(4, 'SIN AZUCARES ANADIDOS NEGRO', 'chocolat noir sans sucre', 'Cacao Sampaka | Espagne (Barcelone)', 'artisanal', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Sampaka_Sans_Sucre_Noir_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Sampaka_Sans_Sucre_Noir_B.jpg', ' Parce que les personnes ne pouvant pas manger du sucre ont aussi droit à du bon chocolat ! Ce chocolat noir à 55 % de cacao révèle une saveur cacao incroyablement douce, digne d’un chocolat chaud d’enfance.', '6.35', '2019-08-30 20:43:07'),
(5, 'SIN AZUCARES ANADIDOS BLANCO', 'chocolat blanc sans sucre', 'Cacao Sampaka | Espagne (Barcelone)', 'artisanal', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Sampaka_Sans_Sucre_Blanc_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Sampaka_Sans_Sucre_Blanc_B.jpg', ' Parce que les personnes ne pouvant pas manger du sucre ont aussi droit à du bon chocolat ! Ce chocolat blanc réussi la prouesse de rendre le côté légèrement caramélisé des chocolats blancs classiques, sans tomber dans l’écœurement.', '6.35', '2019-08-30 20:43:07'),
(6, 'PIMIENTA JAMAICA', 'chocolat au lait au poivre de Jamaïque', 'Cacao Sampaka | Espagne (Barcelone)', 'artisanal', 'https://www.chocolatsdumonde.ch/wp-content/uploads/CacaoSampaka_PimientaJamaica_a.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/CacaoSampaka_PimientaJamaica_b.jpg', ' Une impression de pain d’épice au nez et en bouche. Un chocolat subtile qui laisse émerger de la douceur du lait une impression poivrée raffinée. La texture du poivre moulu ajoute au plaisir. Aussi agréable qu’addictif.', '6.35', '2019-08-30 20:43:07'),
(7, 'MORA', 'chocolat noir aux mûres', 'Cacao Sampaka | Espagne (Barcelone)', 'artisanal', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Sampaka_Mora_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Sampaka_Mora_B.jpg', ' Tel un vin espagnol, ce chocolat révèle déjà au nez ses notes de fruits rouges. A la dégustation, c’est une danse entre les caractères cacaoté et fruité qui se joue auprès des papilles. L’agréable persistance en bouche ajoute à son charme.', '6.35', '2019-08-30 20:43:07'),
(8, 'FLOR DE AZAHAR', 'chocolat au lait à la fleur d’oranger', 'Cacao Sampaka | Espagne (Barcelone)', 'artisanal', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Sampaka_Flor_de_Azahar_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Sampaka_Flor_de_Azahar_B.jpg', ' La fleur d’oranger donne le ton avant même que le chocolat ne touche les lèvres, embarquant les sens pour un voyage qui rappelle les pâtisserie marocaines. La douceur du chocolat au lait et son fondant apportent une touche de fraicheur et révèlent le côté végétal.', '6.35', '2019-08-30 20:43:07'),
(9, 'INVIERNO 2017 (TRUFA NEGRA)', 'chocolat au lait à la truffe noire', 'Cacao Sampaka | Espagne (Barcelone)', 'artisanal', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Sampaka_Trufa_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Sampaka_Trufa_B.jpg', ' Une création qui sort de l’ordinaire ! Les saveurs du champignon séché se marient à merveille avec la douceur du chocolat au lait, sans qu’aucun ne prenne le dessus. Un délice à faire découvrir en fin de repas avec les fromages !', '14.63', '2019-08-30 20:43:07'),
(10, 'TOFFEE', 'chocolat blond', 'Cacao Sampaka | Espagne (Barcelone)', 'artisanal', 'https://www.chocolatsdumonde.ch/wp-content/uploads/CacaoSampaka_Toffee_a.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/CacaoSampaka_Toffee_b.jpg', ' Le chocolat blond est au chocolat ce que le caramel est au lait: un plaisir coupable dont on ne se passe que très difficilement!', '6.35', '2019-08-30 20:43:07'),
(11, 'SIN AZUCARES ANADIDOS CON LECHE', 'chocolat au lait sans sucre', 'Cacao Sampaka | Espagne (Barcelone)', 'artisanal', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Sampaka_Sans_Sucre_Lait_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Sampaka_Sans_Sucre_Lait_B.jpg', ' Parce que les personnes ne pouvant pas manger du sucre ont aussi droit à du bon chocolat ! Ce chocolat au lait n’a pas à rougir face à un classique avec sucre. Fondant et doux, il se laisser dévorer !', '6.35', '2019-08-30 20:43:07'),
(12, 'MADAGASCAR SAMBIRANO', 'chocolat noir grand cru | Madagascar', 'Areté | USA (Spencer TN)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Arete_Madagascar_Sambirano_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Arete_Madagascar_Sambirano_B.jpg', ' Les notes d’abricot acidulé attaquent les papilles en premier. Sensation typique pour du cacao de Madagascar. Des notes légèrement poivrées et florales apparaissent ensuite pour enrichir agréablement le profil de ce chocolat.', '11.87', '2019-08-30 20:43:07'),
(13, 'XOCONUSCO', 'Chocolat noir grand cru | Mexique', 'Cacao Sampaka | Espagne (Barcelone)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/CacaoSampaka_Xoconusco_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/CacaoSampaka_Xoconusco_B.jpg', ' Fèves real criollo, d’une plantation, dans l’état du Chiapas, torréfiées légèrement.\r\n        Des notes indistinctes de fruits secs mêlées d’une touche grillée laissent lentement place à un douce sensation de cacao.\r\n        ', '9.11', '2019-08-30 20:43:07'),
(14, 'BAGUA', 'chocolat noir grand cru | Pérou', 'Qantu | Canada (Montréal)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Qantu_Bagua_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Qantu_Bagua_B.jpg', ' Fèves provenant de la province de Bagua, dans la région d’Amazonas, uniquement vendues à Qantu\r\n        Aussi gourmand qu’inclassable. Les notes de fleur d’oranger se mêlent à un je ne sais quoi de grains de chasselas. La texture y est sûrement pour quelque chose. Un chocolat pour sortir des sentiers battus et saisir toute la richesse des variétés de cacao.\r\n        ', '9.11', '2019-08-30 20:43:07'),
(15, 'BAHIA', 'chocolat noir grand cru | Brésil', 'Orfève | Suisse (Genève)', 'bean to bar, agroforesterie', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Orfeve_Bahia_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Orfeve_Bahia_B.jpg', ' Fèves Catongo (Forestaro blanc) de la propriété Fazenda Leolinda, torréfiées 18 minutes à 110°C, 30h de conchage\r\n        Les notes végétales et mielleuses sont amples et étonnent tant ce chocolat noir puissant est exempt d’amertume et d’acidité, des touches poivrées se développent dans un deuxième temps.\r\n        ', '10.49', '2019-08-30 20:43:07'),
(16, 'MAYA', 'chocolat noir grand cru au piment | Belize', 'Belyzium | Allemagne (Berlin)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Belyzium_Maya_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Belyzium_Maya_B.jpg', ' Fèves hybrides criollo et trinitario.\r\n        Retour aux origines ! Liquide et épicé, le chocolat était d’abord un accord. Le piment monte crescendo jusqu’à en devenir vraiment fort. Une montée en puissance parfaitement maîtrisée et des saveurs élégantes. Un must !\r\n        ', '8.19', '2019-08-30 20:43:07'),
(17, 'CHUNCHO 100%', 'chocolat noir grand cru | Pérou', 'Qantu | Canada (Montréal)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Qantu_Chuncho100_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Qantu_Chuncho100_B.jpg', ' Fèves provenant de la province de La Mar, dans la région d’Ayacucho\r\n        Le fondant et l’impression cristalline de pain d’épices fait douter: est-ce bien un 100% ? Pourtant le goût puissant est bien là. Un chef d’œuvre! Une excellente façon d’aborder l’univers des 100%.\r\n        ', '10.30', '2019-08-30 20:43:07'),
(18, 'YVAN', 'chocolat noir grand cru | Pérou', 'A. Morin | France (Donzère)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/AMorin_Yvan_A-e1527798364791.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/AMorin_Yvan_B-e1527798387360.jpg', ' Fèves du centre du pays.\r\n        Inattendu! Les notes d’ébène à l’attaque se mêlent petit à petit de touches florales et très légèrement acidulées. La texture soyeuse amplifie l’impression florale.\r\n        ', '8.19', '2019-08-30 20:43:07'),
(19, '100', 'chocolat noir grand cru | Belize', 'Belyzium | Allemagne (Berlin)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Belyzium_100_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Belyzium_100_B.jpg', ' Fèves hybrides criollo et trinitario.\r\n        Un chocolat noir absolu, réservé aux amateurs avertis.\r\n        ', '8.19', '2019-08-30 20:43:07'),
(20, 'QUILLA', 'chocolat noir grand cru | Pérou', 'A. Morin | France (Donzère)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/AMorin_Quilla_A-e1527785623803.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/AMorin_Quilla_B-e1527785604807.jpg', ' Fèves 50% de criollo blanco et 50% de criollo porcelana.\r\n        Le ton est donné de suite : un chocolat puissant et acidulé aux notes de mûre et cassis qui remplissent la bouche. Le premier choc passé, une légère impression de petit beurre se glisse furtivement entre les papilles.\r\n        ', '8.19', '2019-08-30 20:43:07'),
(21, 'MAHALI', 'Chocolat noir grand cru | Congo', 'Cacao Sampaka | Espagne (Barcelone)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/CacaoSampaka_Mahali_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/CacaoSampaka_Mahali_B.jpg', ' Fèves criollo africain, dans la province de Kasaï, torréfiées légèrement.\r\n        La première impression en bouche oscille entre acre et ébène, puis viennent quelques très légères notes d’agrumes. Un chocolat complexe, qui demande à être goûté plusieurs fois pour se révéler.\r\n        ', '9.11', '2019-08-30 20:43:07'),
(22, 'ORIXAS', 'chocolat noir grand cru | Brésil', 'A. Morin | France (Donzère)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/AMorin_Orixas_A-e1527115304670.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/AMorin_Orixas_B-e1527115268882.jpg', ' Fèves de l’État du Para au Brésil.\r\n        Un chocolat brésilien aux notes complexes et inattendues: légèrement boisées et avec des fruits secs. Un chocolat noir original, mais facile à aborder.\r\n        ', '8.65', '2019-08-30 20:43:07'),
(23, 'LA JOYA', 'Chocolat noir grand cru | Mexique', 'Cacao Sampaka | Espagne (Barcelone)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/CacaoSampaka_LaJoya_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/CacaoSampaka_LaJoya_B.jpg', ' Fèves criollo blanc, d’une plantation, dans l’état du Tabasco, torréfiées légèrement.\r\n        Étonnamment clair, il attaque les papilles avec des notes de raisins secs et de prune, sur une pointe d’acidité. Viennent ensuite des touches de tabac. Un grand chocolat !\r\n        ', '9.11', '2019-08-30 20:43:07'),
(24, 'WILD BLUEBERRY', 'chocolat noir aux myrtilles sauvages', 'Goodio | Finlande (Helsinki)', 'bean to bar, cru / non conché', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Goodio_WildBlueberry_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Goodio_WildBlueberry_B.jpg', ' Les délicates notes de myrtilles semblent provenir du cacao, à la façon des fèves les plus fruitées. La texture non conchée renforce cette impression. Si la Finlande devait avoir un chocolat national, ce serait celui-ci!', '7.27', '2019-08-30 20:43:07'),
(25, 'CHAI', 'chocolat noir aux épices', 'Goodio | Finlande (Helsinki)', 'bean to bar, cru / non conché', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Goodio_Chai_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Goodio_Chai_B.jpg', ' Cannelle, cardamome, gingembre, poivre noir et curcuma font de cette tablette un voyage! La texture et les notes cacaotées donnent du corps aux saveurs intenses. Une réussite!', '7.27', '2019-08-30 20:43:07'),
(26, 'RÍO SECO', 'Chocolat noir grand cru | Honduras', 'Cacao Sampaka | Espagne (Barcelone)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/CacaoSampaka_RioSeco_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/CacaoSampaka_RioSeco_B.jpg', ' Fèves criollo maya rojo, d’une plantation, dans le département de Santa Barbara, torréfiées légèrement\r\n        Un chocolat surprenant aux saveurs qui s’emmêlent et jouent entre les fruits rouges et de la meringue fraîche sur un fond de cacao.\r\n        ', '9.11', '2019-08-30 20:43:07'),
(27, 'LOW FERM', 'chocolat noir grand cru | Belize', 'Belyzium | Allemagne (Berlin)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Belyzium_LowFerm_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Belyzium_LowFerm_B.jpg', ' Fèves hybrides criollo et trinitario.\r\n        La fermentation plus brève laisse place à l’acidité fruitée, puis aux notes épicées. La comparaison avec le 83% illustre parfaitement l’importance du traitement des fèves juste après la récolte.\r\n        ', '8.19', '2019-08-30 20:43:07'),
(28, 'CAMEROUN 2017', 'chocolat noir grand cru | Cameroun', 'Millésime | Belgique (Liège)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Millesime_CamerounNoir_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Millesime_CamerounNoir_B.jpg', ' Fèves forastero du Haut-Penja\r\n        Typiques des terroirs volcaniques, les notes fumées sont complétées par une légère impression de réglisse. La texture unique renforce ce sentiment de cacao volcanique. Un chocolat particulièrement fin et élégant.\r\n        ', '8.19', '2019-08-30 20:43:07'),
(29, 'CHUNO', 'chocolat noir grand cru | Nicaragua', 'A. Morin | France (Donzère)', NULL, 'https://www.chocolatsdumonde.ch/wp-content/uploads/AMorin_Chuno_A-e1530374137840.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/AMorin_Chuno_B-e1530374098163.jpg', ' Fèves provenant principalement des montages de la région Jinotega, au Nord du pays.\r\n        L’attaque aux saveurs végétales et légèrement poivrées est ensuite suivie par d’agréables notes acidulées et sucrées de pamplemousse.\r\n        ', '9.11', '2019-08-30 20:43:07'),
(30, 'NICARAGUA', 'chocolat noir d’origine | Nicaragua', 'Omnom | Islande (Reykjavik)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Omnom_Nicaragua_A-e1527100375445.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Omnom_Nicaragua_B-e1527100355263.jpg', ' Après une brève note fruitée, puis acidulée, c’est une douce amertume mêlée de notes épicées et boisées qui envahit le palais.', '10.03', '2019-08-30 20:43:07'),
(31, 'LAKKRIS + SEA SALT', 'chocolat blanc à la réglisse salée', 'Omnom | Islande (Reykjavik)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Omnom_LakkrisSeaSalt_A-e1527099528867.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Omnom_LakkrisSeaSalt_B-e1527099509149.jpg', ' Ne laisse personne indifférent, texture agréable, équilibré, puissant et long en bouche. Le sel de mer islandais ne gâche rien, bien au contraire.', '10.03', '2019-08-30 20:43:07'),
(32, 'HACIENDA LIMON WEISS', 'chocolat blanc | Equateur', 'La Flor | Suisse (Zurich)', NULL, 'https://www.chocolatsdumonde.ch/wp-content/uploads/LaFlor_HaciendaLimonWeiss_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/LaFlor_HaciendaLimonWeiss_B.jpg', ' Fèves nacional arriba de la Hacienda Limon en Équateur.\r\n        La texture plus croquante que d’habitude pour pour un chocolat blanc donne le ton quant à ce chocolat blanc grand cru rare. La vanille souligne une très légère note anisée, presque florale. Assurément de quoi remettre en question les certitudes de ceux qui pensent qu’un chocolat blanc ne mérite pas d’attention.\r\n        ', '4.60', '2019-08-30 20:43:07'),
(33, 'LOS RIOS', 'chocolat noir grand cru | Equateur', 'Orfève | Suisse (Genève)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Orfeve_Los_Rios_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Orfeve_Los_Rios_B.jpg', ' Fèves Nacional Arriba d’une seule propriété, province de Los Rios, torréfiées 16 min. à 120°C, 72h de conchage, récolte 2017\r\n        Equilibre entre amertume et acidité à l’attaque, notes florales et poivrées, ample et puissant, belle persistance en bouche.\r\n        ', '9.48', '2019-08-30 20:43:07'),
(34, 'PIURA', 'chocolat noir grand cru | Pérou', 'Orfève | Suisse (Genève)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Orfeve_Piura75_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Orfeve_Piura75_B.jpg', ' Fèves gran blanco de coopératives situées dans la vallée de l’Alto Piura, torréfiées 14 minutes à 120°C, 70h de conchage.\r\n        Notes sucrées et fruitées à l’attaque, puis les papilles sont envahies par la texture grasse et soyeuse qui sature agréablement le palais.\r\n        ', '10.49', '2019-08-30 20:43:07'),
(35, 'MILK OF NICARAGUA', 'chocolat au lait | Nicaragua', 'Omnom | Islande (Reykjavik)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Omnom_MilkNicaragua_A-e1527098377493.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Omnom_MilkNicaragua_B-e1527098348685.jpg', ' La douceur d’un chocolat au lait à la texture grasse combinée avec des notes grillées. Un chocolat au lait léger et agréable.', '10.03', '2019-08-30 20:43:07'),
(36, 'FAZENDA VERA CRUZ', 'chocolat noir grand cru | Brésil', 'La Flor | Suisse (Zurich)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/DSC01458-e1530384578497.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/DSC01459-e1530384552460.jpg', ' Fèves de cacao de la région Bahia au Brésil, venant d’une même plantation.\r\n        Une saveur de raisins secs envahit petit à petit la bouche, pour ensuite se métamorphoser en une agréable impression de fruits tropicaux légèrement acidulés avec une touche d’abricot. Un chocolat noir facile et agréable.\r\n        ', '4.60', '2019-08-30 20:43:07'),
(37, 'COSTA RICA 2017 LACTE', 'chocolat noir au lait grand cru | Costa Rica', 'Millésime | Belgique (Liège)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Millesime_CostaRicaLacte_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Millesime_CostaRicaLacte_B.jpg', ' Fèves trinitario de la région d’Upala\r\n        Le cassant est digne d’un chocolat noir pur, tout comme la complexité des saveurs : café, foin, impression presque salée. Un grand chocolat noir au lait.\r\n        ', '8.19', '2019-08-30 20:43:07'),
(38, 'COCONUT', 'chocolat noir à la noix de coco', 'Goodio | Finlande (Helsinki)', 'bean to bar, bio, cru/ non conché', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Goodio_Coconut_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Goodio_Coconut_B.jpg', ' Aussi doux et fondant qu’un chocolat au lait. Pourtant c’est un chocolat noir! Les notes de coco sont subtiles et se marient parfaitement avec le cacao. On en redemande!', '7.27', '2019-08-30 20:43:07'),
(39, 'MILK OF MADAGASCAR', 'chocolat au lait | Madagascar', 'Omnom | Islande (Reykjavik)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Omnom_MilkMadagascar_A-e1527100742873.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Omnom_MilkMadagascar_B-e1527100721328.jpg', ' Un chocolat au lait classique : doux, sucré et fondant. Léger, il se distingue par d’agréables notes caramélisées.', '10.03', '2019-08-30 20:43:07'),
(40, 'VIETNAM BEN TRE', 'chocolat noir grand cru | Vietnam', 'Areté | USA (Spencer TN)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Arete_Vietnam_BenTre_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Arete_Vietnam_BenTre_B.jpg', ' Un florilège de saveurs boisées, florales, épicées remue les papilles. Suit une impression fugitive de tabac qui laisse ensuite place à une sensation de fraîcheur acidulée. Une palette de notes aussi impressionnantes que cristallines! Une des plus belles interprétations du terroir vietnamien.', '14.44', '2019-08-30 20:43:07'),
(41, 'MARVIA (LAIT)', 'chocolat au lait | Jamaïque', 'A. Morin | France (Donzère)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/AMorin_Marvia_A-e1527798770337.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/AMorin_Marvia_B-e1527798795945.jpg', ' Fèves généralement trinitario en Jamaïque, importées via un organisme officiel ayant le monopole.\r\n        Un chocolat au lait surprenant dont la douceur et le fondant se marient avec des notes végétales qui lui confère un goût particulièrement peu sucré. A goûter si vous voulez sentir des sentiers battus.\r\n        ', '7.82', '2019-08-30 20:43:07'),
(42, 'IDUKKI NIBS', 'Chocolat noir grand cru | Inde\r\n   Garçoa | Suisse (Zurich)', 'bean to bar', NULL, 'https://www.chocolatsdumonde.ch/wp-content/uploads/Garcoa_IdukkiNibs_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Garcoa_IdukkiNibs_B.jpg', ' undefined', '10.58', '2019-08-30 20:43:07'),
(43, 'GINGER & LEMONGRASS', 'chocolat noir au gingembre et à la citronnelle', 'Goodio | Finlande (Helsinki)', 'bean to bar, cru / non conché', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Goodio_GingerLemongrass_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Goodio_GingerLemongrass_B.jpg', ' Le parfum de la citronnelle donne le ton avant même de goûter. Le gingembre attaque les papilles au premier contact. Un chocolat fortement épicé – comme ceux au piment – mais à la façon asiatique. Puissance parfaitement maîtrisée.', '7.27', '2019-08-30 20:43:07'),
(44, 'FINCA RODRIGO FARINA BONA', 'chocolat noir grand cru à la farine de maïs | Venezuela', 'La Flor | Suisse (Zurich)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/LaFlor_FincaRodrigoFarinaBona_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/LaFlor_FincaRodrigoFarinaBona_B.jpg', ' Fèves Canobao de la région du même nom au Venezuela.\r\n        Les notes puissantes du cacao se marient petit à petit à la farine de maïs grillé, qui donne une impression de pop-corn ! La farine de maïs grillée provient du Tessin et est fabriquée selon une recette artisanale. Le chocolat parfait pour un film au cinéma ! Aussi surprenant qu’agréable.\r\n        ', '4.60', '2019-08-30 20:43:07'),
(45, 'LICORICE & SEA BUCKTHORN', 'chocolat noir à la réglisse et à l’argousier', 'Goodio | Finlande (Helsinki)', 'bean to bar, cru / non conché', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Goodio_LicoriceSeaBuckthorn_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Goodio_LicoriceSeaBuckthorn_B.jpg', ' Le chocolat révèle en premier les notes typiques de l’argousier. La sensation est accentuée par la texture non conchée, mais fondante. La réglisse ne se laisse que deviner petit à petit tant l’accord est fin. Une tablette aussi originale qu’unique!', '7.27', '2019-08-30 20:43:07'),
(46, 'NIBS', 'chocolat noir grand cru avec éclats de fèves de cacao | Belize', 'Belyzium | Allemagne (Berlin)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Belyzium_Nibs_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Belyzium_Nibs_B.jpg', ' Fèves hybrides criollo et trinitario.\r\n        L’ajout d’éclats de fèves de cacao est bien plus qu’un autre variation du 83. Les notes de cacaotées des fèves ajoutent une première impression gourmande, tandis que le caractère acidulé renforce les sensations fruitées. Une réussite!\r\n        ', '8.56', '2019-08-30 20:43:07'),
(47, 'MR. CARROTS – LAKKRIS', NULL, NULL, NULL, 'https://www.chocolatsdumonde.ch/wp-content/uploads/BunnyOmnom_unboxed.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/BunnyOmnom_bar.jpg', 'A la recherche d’un lapin de Pâques unique? Seuls 4 ont réussi à s’envoler d’Islande pour passer les fêtes en Suisse! Offrez-vous un design à couper le souffle et des sensations gustatives uniques grâce au chocolat blanc à la réglisse. De l’art éphémère.\r\n       300 g de bonheur! Mr Carrots vit dans une boîte de 31 x 25 x 16 cm. Être sensible et fragile, il ne peut être livré ou récupéré que dans le Canton de Genève.\r\n        Il attend avec impatience de pouvoir rejoindre une maison aimante qui saura l’apprécier à sa juste valeur. N.B. Il n’est pas nécessaire de parler islandais pour l’adopter. Sachez quand même que lapin se dit kanína.\r\n        ', '59.80', '2019-08-30 20:43:07'),
(48, 'HACIENDA LIMON', 'chocolat noir grand cru | Équateur', 'La Flor | Suisse (Zurich)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/DSC01844-e1530382556683.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/DSC01845-e1530382534306.jpg', ' Fèves nacional arriba de la Hacienda Limon en Equateur.\r\n        Aux notes épicées, s’ajoute une touche de fruits rouges, puis de noisette, sans que l’aspect poivré ne disparaisse vraiment. Un chocolat plutôt fort en goût, sans tomber dans l’excès.\r\n        ', '4.60', '2019-08-30 20:43:07'),
(49, 'HACIENDA LIMON MILCH & NIBS', 'chocolat au lait | Equateur', 'La Flor | Suisse (Zurich)', NULL, 'https://www.chocolatsdumonde.ch/wp-content/uploads/LaFlor_HaciendaLimonMilchNibs_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/LaFlor_HaciendaLimonMilchNibs_B.jpg', ' Fèves nacional arriba de la Hacienda Limon en Équateur et nibs de Fazenda Vera Cruz au Brésil.\r\n        Un chocolat au lait suisse inclassable: fondant grâce au lait, croquant grâce aux nibs et intense comme un chocolat noir avec son haut pourcentage de cacao. Les éclats de cacao ne font pas qu’ajouter de la texture, leurs arômes de bananes se déploient en croquant dans les nibs et confèrent une longueur en bouche unique pour un chocolat au lait. A goûter absolument!\r\n        ', '4.60', '2019-08-30 20:43:07'),
(50, '83', 'chocolat noir grand cru | Belize', 'Belyzium | Allemagne (Berlin)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Belyzium_83_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Belyzium_83_B.jpg', ' Fèves hybrides criollo et trinitario.\r\n        Puissant, la légère acidité de l’attaque est très vite renversée par le cacao amer et ample qui sature les papilles avec une texture pâteuse agréable. Une bonne initiation à un chocolat fort.\r\n        ', '8.19', '2019-08-30 20:43:07'),
(51, 'AMBAJA', 'chocolat noir grand cru | Madagascar', 'Orfève | Suisse (Genève)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Orfeve_Ambaja75_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Orfeve_Ambaja75_B-1.jpg', ' Fèves trinitario d’une seule propriété, district d’Ambaja, torréfiées 18 minutes à 130°C, 72h de conchage.\r\n        Attaque douce et légèrement acide avec des notes de fruits sec et miel, puis se développe des notes épicées laissant une impression délicate en bouche.\r\n        ', '9.84', '2019-08-30 20:43:07'),
(52, 'BARACOA', 'chocolat noir grand cru | Cuba', 'Orfève | Suisse (Genève)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Orfeve_Baracoa_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Orfeve_Baracoa_B.jpg', ' Fèves trinitario des Caraïbes de la région de Baracoa à l’est de Cuba, torréfiées 13 minutes à 110°C, 60h de conchage\r\n        La texture infiniment soyeuse contraste avec les notes boisées et de tabac. Des saveurs acidulées relevées de notes de miel d’acacia complètent le tableau. Un chocolat exceptionnel!\r\n        ', '10.67', '2019-08-30 20:43:07'),
(53, 'COFFEE + MILK', 'chocolat blanc au café', 'Omnom | Islande (Reykjavik)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Omnom_CoffeeMilk_A-e1527099043267.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Omnom_CoffeeMilk_B-e1527099023600.jpg', ' Tel un bon cappuccino, bel équilibre entre le lait, l’excellent café et l’onctuosité du beurre de cacao. Un mélange pour un réveil en douceur.', '10.03', '2019-08-30 20:43:07'),
(54, 'TANZANIA', 'chocolat noir d’origine | Tanzanie', 'Omnom | Islande (Reykjavik)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Omnom_Tanzania_A-e1527099864264.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Omnom_Tanzania_B-e1527099844859.jpg', ' La texture lisse et soyeuse dévoile lentement des notes fruitées, légèrement acidulé, sur un fond grillé, sans amertume.', '10.03', '2019-08-30 20:43:07'),
(55, 'SOCONUSCO (EDITION LIMITEE)', 'chocolat noir grand cru | Mexique', 'A. Morin | France (Donzère)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Morin_Soconusco_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Morin_Soconusco_B.jpg', ' Fèves de la région côtière du sud-ouest du pays, non loin du Guatemala.\r\n        La robe noire profonde cache une merveille. Les notes poivrées de l’attaque se développent ensuite en des saveurs florales et boisées, le tout sur un fond acidulé de fruits rouges. La texture soyeuse et pâteuse renforce l’ampleur de ce grand chocolat, qui laisse une belle longueur en bouche. Merveilleux!\r\n        ', '9.11', '2019-08-30 20:43:07'),
(56, 'MADAGASCAR 2017 PRALINE', 'chocolat noir au lait grand cru praliné | Madagsacar', 'Millésime | Belgique (Liège)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Millesime_MadagascarPraline_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Millesime_MadagascarPraline_B.jpg', ' Fèves trinitario de la vallée du Sambirano\r\n        Les saveurs de noisettes et amandes grillées attaquent de suite les papilles, mais très vite le cacao et ses notes finement épicées viennent se joindre à l’explosion de saveurs. Un classique merveilleusement revisité et plus raffiné.\r\n        ', '8.19', '2019-08-30 20:43:07'),
(57, 'CHANCHAMAYO 100%', 'chocolat noir grand cru | Pérou', 'A. Morin | France (Donzère)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Morin_Chanchamayo100_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Morin_Chanchamayo100_B.jpg', ' Fèves du centre du pays, dans les contreforts des Andes.\r\n        Puissant, ce chocolat surprend par ses notes cristallines d’agrumes dès l’attaque. Une impression de rose poivrée soulignée par des touches d’amande et noisette complète le tableau. Si vous deviez oser goûter un 100%, essayez celui!\r\n        ', '7.82', '2019-08-30 20:43:07'),
(58, 'SIDO', 'chocolat noir grand cru | Papouasie Nouvelle Guinée', 'A. Morin | France (Donzère)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/AMorin_Sido_A-e1527114411209.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/AMorin_Sido_B-e1527114391429.jpg', ' Fèves de Nouvelle Bretagne Orientale, province sur une des îles de Papouasie-Nouvelle-Guinée, et qui sont un mélange entre le Criollo Vénézuélien, l’Amelonado d’Afrique de l’Ouest, l’hybride Forastero et le clone du Trinitario.\r\n        Notes grillées et fumées à l’attaque qui se développent au fur et à mesure. Un chocolat surprenant à la texture grasse et un peu pâteuse.\r\n        ', '7.82', '2019-08-30 20:43:07'),
(59, 'ESMERALDA', 'chocolat noir grand cru | Equateur', 'A. Morin | France (Donzère)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/AMorin_Esmeralda_noir_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/AMorin_Esmeralda_noir_B.jpg', ' Fèves généralement nacional cultivées en agroforesterie de la province d’Esmeraldas.\r\n        Un chocolat noir sans fioritures : ample, profond, sans amertume. De légères notes fruitées et épicées complètent au tableau. Belle longueur en bouche.\r\n        ', '7.82', '2019-08-30 20:43:07'),
(60, 'PABLINO', 'chocolat noir grand cru | Pérou', 'A. Morin | France (Donzère)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/AMorin_Pablino_A-e1527951502185.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/AMorin_Pablino_B-e1527951482482.jpg', ' Fèves du centre du pays, dans les contreforts des Andes, d’une plantation propriété d’un seul producteur qui cultive également plusieurs types d’arbres comme la papaye, le café et même parfois des courges au sol.\r\n        Une pointe de note pimentée réveille les papilles à l’attaque et laisse ensuite défiler un nombre de saveurs : fruits, fleurs, épices. Le tout dans un parfait équilibre. Du grand art !\r\n        ', '7.27', '2019-08-30 20:43:07'),
(61, 'MILCH', 'chocolat au lait | Belize', 'Belyzium | Allemagne (Berlin)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Belyzium_Milch_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Belyzium_Milch_B.jpg', ' Fèves hybrides criollo et trinitario.\r\n        Un chocolat au lait surprenant, qui sent bon la ferme. Un peu rude, texturé et au cacao bien présent.\r\n        ', '8.19', '2019-08-30 20:43:07'),
(62, 'FIJI MATASAWALEVU', 'chocolat noir grand cru des îles Fidji', 'Areté | USA (Spencer TN)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Arete_Fiji_Matasawalevu_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Arete_Fiji_Matasawalevu_B.jpg', ' L’onctuosité contraste avec les premières notes poivrées. Ensuite, les saveurs de fruits séchés suaves viennent faire le lien entre les deux sensations pour les marier dans un bel équilibre. Un grand chocolat.', '11.87', '2019-08-30 20:43:07'),
(63, 'CRANMARY', 'chocolat noir aux canneberges et romarin', 'Goodio | Finlande (Helsinki)', 'bean to bar, cru / non conché', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Goodio_Cranmary_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Goodio_Cranmary_B.jpg', ' La fraîcheur du romarin complète la douceur légèrement acidulée des canneberges. Tandis cacao enveloppe le tout avec brio et prête sa texture pour prolonger les saveurs. Goodio compare ce chocolat à un crépuscule de nuit d’été nordique, on comprend pourquoi!', '7.54', '2019-08-30 20:43:07'),
(64, 'RUGOSO', 'chocolat noir grand cru | Nicaragua', 'A. Morin | France (Donzère)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/AMorin_Rugoso_A-e1527948743822.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/AMorin_Rugoso_B-e1527948713898.jpg', ' Fèves provenant principalement des montages de la région Jinotega, au nord du pays.\r\n        Une intense et douce saveur de cacao, laisse petit à petit percer des notes de noisette, puis de fruits rouges acidulés. Le tout soutenu par un texture onctueuse. Un régal !\r\n        ', '9.11', '2019-08-30 20:43:07'),
(65, 'SEA SALTED ALMONDS + MILK', 'chocolat au lait avec amandes salées', 'Omnom | Islande (Reykjavik)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Omnom_SeaSaltAlmondsMilk_A-e1527101493829.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Omnom_SeaSaltAlmondsMilk_B-e1527101472612.jpg', ' Un chocolat d’apéro ! Mélange sucré-salé, on en picore comme des noix salées à l’apéritif. L’addiction n’est pas loin… normal si c’est du sel de mer islandais !', '10.03', '2019-08-30 20:43:07'),
(66, 'GIANDUIA PERU UCAYALI', 'chocolat noir grand cru avec gianduia | Pérou', 'Areté | USA (Spencer TN)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Arete_Gianduia_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Arete_Gianduia_B.jpg', ' La noisette magnifiée avec du chocolat ! La sensation de noisettes grillées est soulignée avec élégance par les notes douce du cacao. Grâce au choix d’un cacao sans amertume et d’un chocolat sans lait, la douceur ne s’encombre pas de sucrosité superflue, mettant parfaitement en valeur les produits. Le croquant des éclats de noisettes du Piémont ne gâche rien. Un travail ciselé jusqu’au bout, les noisettes étant transformées par le chocolatier lui-même.', '14.44', '2019-08-30 20:43:07'),
(67, 'MADAGASCAR', 'chocolat noir d’origine | Madagascar', 'Omnom | Islande (Reykjavik)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Omnom_Madagascar_A-1-e1526937458994.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Omnom_Madagascar_B-e1526937510449.jpg', ' Notes d’agrumes à l’attaque, puis de fruits secs et de miel, finale légèrement acidulée et délicate longueur en bouche.', '10.03', '2019-08-30 20:43:07'),
(68, 'INDIA IDUKKI', 'chocolat noir grand cru d’Inde', 'Areté | USA (Spencer TN)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Arete_India_Idukki_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Arete_India_Idukki_B.jpg', ' L’onctuosité et des notes douces de miel laissent place à une sensation acide très douce, légèrement fruitée. Très belle ampleur et longueur en bouche. Un chocolat noir élégant, tout en finesse. 100% bio!', '15.18', '2019-08-30 20:43:07'),
(69, 'COLOMBIA TUMACO', 'chocolat noir grand cru au lait | Colombie', 'Areté | USA (Spencer TN)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Arete_Columbia_Tumaco_DarkMilk_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Arete_Columbia_Tumaco_DarkMilk_B.jpg', ' Des notes caramel très distinctes dès l’attaque donnent le ton : c’est un chocolat au lait entier. L’impression cacaotée qui suit rappelle celle d’un gâteau au chocolat. Le mélange des deux donne l’impression d’un fondant au chocolat nappé de caramel. Le tout ciselé avec une grande finesse.', '11.87', '2019-08-30 20:43:07'),
(70, 'ÉRABLE ET FLEUR DE SEL DE MARAS', 'chocolat noir grand cru à l’érable et au sel | Pérou', 'Qantu | Canada (Montréal)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Qantu_Erable_Sel_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Qantu_Erable_Sel_B.jpg', ' Fèves provenant de la province de La Mar, dans la région d’Ayacucho, pur sucre d’érable et fleur de sel des Andes\r\n        C’est le sel qui vient d’abord exalter les saveurs du Chuncho. Puis, émergeant du chocolat qui fond, les notes d’érable apportent une touche légèrement sucrée et boisée. Découvrez le mariage du Québec et des Andes. Aussi original que subtil.\r\n        ', '10.30', '2019-08-30 20:43:07'),
(71, 'FINCA RODRIGO', 'chocolat noir grand cru | Venezuela', 'La Flor | Suisse (Zurich)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/DSC01456-e1530383893574.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/DSC01457-e1530383869960.jpg', ' Fèves Canoabo de la région du même nom au Venezuela.\r\n        Un chocolat de caractère unique qui est un mélange de notes épicées d’où ressort nettement la cannelle et des nuances boisées. Le tout avec un très bel équilibre et une agréable longueur en bouche.\r\n        ', '4.60', '2019-08-30 20:43:07'),
(72, 'CHUNCHO', 'chocolat noir grand cru | Pérou', 'Qantu | Canada (Montréal)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Qantu_Chuncho_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Qantu_Chuncho_B.jpg', ' Fèves provenant de la province de La Mar, dans la région d’Ayacucho\r\n        Le fondant est saisissant et donne aux premières notes de noix et d’épices une sensation unique. Les saveurs florales qui suivent amènent une agréable fraîcheur. Chocolat d’une grande finesse et douceur. Particulièrement élégant et addictif…\r\n        ', '9.11', '2019-08-30 20:43:07'),
(73, 'CHANCHAMAYO', 'chocolat noir grand cru | Pérou', 'A. Morin | France (Donzère)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/AMorin_Chanchamayo_A-e1527785260340.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/AMorin_Chanchamayo_B-e1527785239578.jpg', ' Fèves du centre du pays, dans les contreforts des Andes.\r\n        L’attaque chocolatée se mêle très vite de notes acidulées : framboise et fruits de la passion. Une touche de saveur très légèrement mielleuse vient compléter le tout. Un régal !\r\n        ', '7.27', '2019-08-30 20:43:07'),
(74, 'PEROU 2018 LACTE CARAMEL BEURRE SALE', 'chocolat noir au lait grand cru avec caramel | Pérou', 'Millésime | Belgique (Liège)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Millesime_PerouCaramel_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Millesime_PerouCaramel_B.jpg', ' Fèves criollo & trinitario de la forêt de Lamas dans la région de San Martin\r\n        La texture croquante interpelle immédiatement. Les saveurs cacaotées mêlées de notes café et d’épices arrivent les premières, puis petit à petit le caramel fond et distille ses notes sucrées. Le cacao reste étonnamment longtemps en bouche.\r\n        ', '8.19', '2019-08-30 20:43:07'),
(75, 'NICALIZO', 'chocolat noir grand cru | Nicaragua', 'A. Morin | France (Donzère)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/AMorin_Nicalizo_A-e1527949958190.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/AMorin_Nicalizo_B-e1527949937616.jpg', ' Fèves provenant principalement des montages de la région Jinotega, au nord du pays.\r\n        Notes épicées et de fruits rouges se mêlent de façon indistincte au départ, puis le poivre rose se révèle avec le cassis et la mûre. La texture pâteuse et ample ressemble à celle d’un grand vin rouge qui envahit la bouche et laisse une belle impression.\r\n        ', '9.11', '2019-08-30 20:43:07'),
(76, 'YAMASA', 'chocolat noir grand cru | République Dominicaine', 'A. Morin | France (Donzère)', 'bean to bar', 'https://www.chocolatsdumonde.ch/wp-content/uploads/AMorin_Yamasa_A-e1527777707396.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/AMorin_Yamasa_B-e1527777674297.jpg', ' Fèves du nord-ouest de l’île.\r\n        Un chocolat complexe qui titille les papilles. Les fortes notes cacaotées mêlées à l’acacia se transforment en des touches fruitées plus fraîches et sucrées, entre le miel et le caramel. Une belle suite de saveurs dont on redemande.\r\n        ', '7.27', '2019-08-30 20:43:07'),
(77, 'HAM LUONG', 'chocolat noir grand cru | Vietnam', 'Erithaj | France (Strasbourg)', 'exclusif', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Erithaj_HamLuong80_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Erithaj_HamLuong80_B.jpg', ' Fèves trinitario, torréfiées par A. Morin.\r\n        Un chocolat profond et soyeux qui maintient de façon constante un bel équilibre entre acidité et amertume. Un chocolat puissant, mais maîtrisé.\r\n        ', '8.19', '2019-08-30 20:43:07'),
(78, 'MO CAY', 'chocolat au lait | Vietnam', 'Erithaj | France (Strasbourg)', 'exclusif', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Erithaj_MoCay58_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Erithaj_MoCay58_B-1.jpg', ' Fèves trinitario, torréfiées par A. Morin.\r\n        Le parfait équilibre entre les saveurs d’un cacao racé et la douceur du lait. Belle longueur en bouche. Un plaisir addictif.\r\n        ', '8.19', '2019-08-30 20:43:07'),
(79, 'DAK LAK', 'chocolat noir grand cru | Vietnam', 'Erithaj | France (Strasbourg)', 'exclusif', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Erithaj_DakLak70_A-1.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Erithaj_DakLak70_B.jpg', ' Fèves trinitario, torréfiées par A. Morin.\r\n        Une attaque puissante avec des notes de cacao et de réglisse, qui se développent en des saveurs acidulées. Texture et longueur en bouche font forte impression.\r\n        ', '8.19', '2019-08-30 20:43:07'),
(80, 'BEN TRE', 'chocolat noir grand cru | Vietnam', 'Erithaj | France (Strasbourg)', 'exclusif', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Erithaj_BenTre70_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Erithaj_BenTre70_B.jpg', ' Fèves trinitario, torréfiées par A. Morin.\r\n        Une attaque puissante avec des notes de cacao et de réglisse, qui se développent en des saveurs acidulées. Texture et longueur en bouche font forte impression.\r\n        ', '8.19', '2019-08-30 20:43:07'),
(81, 'BEN TRE (LAIT)', 'chocolat au lait | Vietnam', 'Erithaj | France (Strasbourg)', 'exclusif', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Erithaj_BenTre40_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Erithaj_BenTre40_B.jpg', ' Fèves trinitario, torréfiées par A. Morin.\r\n        Un chocolat au lait gourmand et atypique dont on redemande : la texture révèle des notes caramels, laissant ensuite filtrer quelques notes d’agrumes.\r\n        ', '8.19', '2019-08-30 20:43:07'),
(82, 'BEN TRE 100 %', 'chocolat noir grand cru | Vietnam', 'Erithaj | France (Strasbourg)', 'exclusif', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Erithaj_BenTre100_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Erithaj_BenTre100_B.jpg', ' Fèves trinitario, torréfiées par A. Morin.\r\n        Toute la force du cacao vietnamien concentrée dans une tablette à l’amertume surprenante et à la texture particulièrement grasse. Pour les amateurs avertis.\r\n        ', '8.19', '2019-08-30 20:43:07'),
(83, '7imo SELECCION CATA OCUMARE + NIBS', 'chocolat noir grand cru avec éclats de fèves de cacao | Venezuela', 'Idilio Origins | Suisse (Bâle)', 'exclusif', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Idilio_7imo_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Idilio_7imo_B.jpg', ' Fèves criollo, provenant d’une seule plantation près de la ville d’Ocumare de la Costa, conchage 48h.\r\n        Noyés dans la masse, les nibs procurent un agréable croquant lorsque le chocolat fond. Leurs notes grillées et de café se marient à merveille avec la douceur du chocolat. Un équilibre savamment dosé et réussi !\r\n        ', '7.82', '2019-08-30 20:43:07'),
(84, '15nto IDILIO CON LECHE', 'chocolat au lait | Venezuela', 'Idilio Origins | Suisse (Bâle)', 'exclusif', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Idilio_15nto_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Idilio_15nto_B.jpg', ' La rencontre des fèves de cacao des plaines de l’Orénoque avec le lait suisse. Une douce sensation de caramel envahit les papilles et laisse lentement transparaître des notes de lait et de café grillé. Un chocolat au lait fin et subtile.', '7.82', '2019-08-30 20:43:07'),
(85, '1ero PORCELANA CRIOLLO PURO', 'chocolat noir grand cru | Venezuela', 'Idilio Origins | Suisse (Bâle)', 'exclusif', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Idilio_1ero_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Idilio_1ero_B.jpg', ' Fèves procelana criollo puro, de l’Etat de Zulia, conchage 48h.\r\n        L’attaque légèrement et agréablement acidulée laisse ensuite la place à des notes de noisette, puis de fruits rouges et de café. Le tout avec une texture soyeuse et une sensation ample en bouche. Belle persistance. Un chocolat particulièrement harmonieux.\r\n        ', '10.58', '2019-08-30 20:43:07'),
(86, '3ero SELECCION CATA OCUMARE', 'chocolat noir grand cru | Venezuela', 'Idilio Origins | Suisse (Bâle)', 'exclusif', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Idilio_3ero_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Idilio_3ero_B.jpg', ' Fèves criollo, provenant d’une seule plantation près de la ville d’Ocumare de la Costa, conchage 48h.\r\n        Le soyeux et le fondant semblent divins et ne sont dépassés que par l’explosion de saveurs : notes grillées, poivrées et de griottes. Belle longueur en bouche.\r\n        ', '7.82', '2019-08-30 20:43:07'),
(87, '16xto TRINCHERA', 'chocolat noir grand cru | Venezuela', 'Idilio Origins | Suisse (Bâle)', 'exclusif', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Idilio_16xto_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Idilio_16xto_B.jpg', ' Fèves provenant du village de Las Trinchera, conchage 48h.\r\n        Une légère sensation de banane cède le pas à un déferlement tropical avec des notes boisées, légèrement acres, et qui se termine sur une impression plus douce, presque vanillée. Un chocolat surprenant.\r\n        ', '9.11', '2019-08-30 20:43:07');
INSERT INTO `st_products` (`pro_id`, `pro_title`, `pro_subtitle1`, `pro_subtitle2`, `pro_subtitle3`, `pro_img_url_recto`, `pro_img_url_verso`, `pro_descr`, `pro_price_euro`, `pro_date`) VALUES
(88, '14rto CHUAO', 'chocolat noir grand cru | Venezuela', 'Idilio Origins | Suisse (Bâle)', 'exclusif', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Idilio_14rto_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Idilio_14rto_B.jpg', ' Fèves provenant du village de Chuao, près de Choroni, accessible uniquement par bateau, conchage 48h.\r\n        La douceur du cacao domine l’attaque pour rapidement laisser place à un festival de saveurs : ananas, amandes grillées pour terminer avec une impression légèrement acidulée et épicée. Un grand chocolat avec une belle longueur en bouche.\r\n        ', '9.11', '2019-08-30 20:43:07'),
(89, 'CAFÉ ARÁBIGA', 'chocolat noir au café arabica', 'Cacao Sampaka | Espagne (Barcelone)', 'artisanal', 'https://www.chocolatsdumonde.ch/wp-content/uploads/CacaoSampaka_Arrabica_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/CacaoSampaka_Arrabica_B.jpg', ' L’intensité du chocolat noir (86%) se mêle à celle du café. Un mélange fort agréablement souligné par les éclats de grains de café. Un noir serré.', '6.35', '2019-08-30 20:43:07'),
(90, 'FLOR DE SAL DE IBIZA', 'chocolat noir au sel d’Ibiza', 'Cacao Sampaka | Espagne (Barcelone)', 'artisanal', 'https://www.chocolatsdumonde.ch/wp-content/uploads/CacaoSampaka_FleurDeSel_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/CacaoSampaka_FleurDeSel_B.jpg', ' Un chocolat noir (68%) aux arômes de cacao qui sont révélés par le sel, gagnant en intensité. Un chocolat noir à consommer l’esprit léger pour accompagner de la charcuterie ou du vin.', '6.35', '2019-08-30 20:43:07'),
(91, 'ROSAS Y FRESAS', 'chocolat blanc à la rose et aux fraises', 'Cacao Sampaka | Espagne (Barcelone)', 'artisanal', 'https://www.chocolatsdumonde.ch/wp-content/uploads/CacaoSampaka_RoseFraise_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/CacaoSampaka_RoseFraise_B.jpg', ' Un chocolat blanc et rose qui envahit le nez et le palais avec sa délicate saveur à l’eau de rose, qui est ensuite relevée par une touche de fraise.', '6.35', '2019-08-30 20:43:07'),
(92, 'VERANO 2017 (MOJITO)', 'chocolat blanc à la menthe et au citron vert', 'Cacao Sampaka | Espagne (Barcelone)', 'artisanal', 'https://www.chocolatsdumonde.ch/wp-content/uploads/CacaoSampaka_Mojito_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/CacaoSampaka_Mojito_B.jpg', ' Un chocolat blanc estival qui surprend par son accord original et donne envie d’y goûter à nouveau. A consommer sans modération.', '6.35', '2019-08-30 20:43:07'),
(93, 'TÉ VERDE MATCHA', 'Chocolat blanc au matcha de thé vert', 'Cacao Sampaka | Espagne (Barcelone)', 'artisanal', 'https://www.chocolatsdumonde.ch/wp-content/uploads/CacaoSampaka_Matcha_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/CacaoSampaka_Matcha_B.jpg', ' Ce chocolat blanc est en réalité… vert ! Un ovni dont la base au thé vert est rehaussée par des pointes de citron. Un délice de fraicheur et d’originalité.', '6.35', '2019-08-30 20:43:07'),
(94, 'GIN & TONIC', 'chocolat au lait avec citron et genévrier', 'Cacao Sampaka | Espagne (Barcelone)', 'artisanal', 'https://www.chocolatsdumonde.ch/wp-content/uploads/CacaoSampaka_GinTonic_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/CacaoSampaka_GinTonic_B.jpg', ' Alliance de la douceur du chocolat au lait avec le pétillant du cocktail, le mélange est réussi ! Un plaisir léger et sucré pour les papilles.', '6.35', '2019-08-30 20:43:07'),
(95, 'CANELA CEYLAN', 'chocolat blanc à la cannelle de Ceylan', 'Cacao Sampaka | Espagne (Barcelone)', 'artisanal', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Sampaka_Canela_A.jpg', 'https://www.chocolatsdumonde.ch/wp-content/uploads/Sampaka_Canela_B.jpg', ' Réservé aux amateurs de cannelle et de sensations de marché de Noël. Un moment de douceur à savourer en fin de repas ou avec des biscuits de Noël. Aussi fondant qu’addictif…', '6.35', '2019-08-30 20:43:07');

-- --------------------------------------------------------

--
-- Structure de la table `st_products_has_st_categories`
--

DROP TABLE IF EXISTS `st_products_has_st_categories`;
CREATE TABLE IF NOT EXISTS `st_products_has_st_categories` (
  `st_products_pro_id` int(11) NOT NULL,
  `st_categories_cat_id` int(11) NOT NULL,
  PRIMARY KEY (`st_products_pro_id`,`st_categories_cat_id`),
  KEY `fk_st_products_has_st_categories_st_categories1_idx` (`st_categories_cat_id`),
  KEY `fk_st_products_has_st_categories_st_products1_idx` (`st_products_pro_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `st_products_has_st_categories`
--

INSERT INTO `st_products_has_st_categories` (`st_products_pro_id`, `st_categories_cat_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(44, 2),
(45, 2),
(46, 2),
(47, 2),
(48, 2),
(49, 2),
(50, 2),
(51, 2),
(52, 2),
(53, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 2),
(58, 2),
(59, 2),
(60, 2),
(61, 2),
(62, 2),
(63, 2),
(64, 2),
(65, 2),
(66, 2),
(67, 2),
(68, 2),
(69, 2),
(70, 2),
(71, 2),
(72, 2),
(73, 2),
(74, 2),
(75, 2),
(76, 2),
(12, 3),
(14, 3),
(15, 3),
(16, 3),
(17, 3),
(18, 3),
(19, 3),
(22, 3),
(24, 3),
(25, 3),
(27, 3),
(30, 3),
(31, 3),
(34, 3),
(35, 3),
(38, 3),
(39, 3),
(40, 3),
(43, 3),
(45, 3),
(46, 3),
(50, 3),
(51, 3),
(53, 3),
(54, 3),
(60, 3),
(61, 3),
(62, 3),
(65, 3),
(66, 3),
(67, 3),
(68, 3),
(69, 3),
(70, 3),
(72, 3),
(73, 3),
(74, 3),
(76, 3),
(24, 4),
(25, 4),
(38, 4),
(43, 4),
(45, 4),
(63, 4),
(14, 5),
(16, 5),
(17, 5),
(19, 5),
(20, 5),
(22, 5),
(27, 5),
(34, 5),
(42, 5),
(46, 5),
(50, 5),
(61, 5),
(64, 5),
(70, 5),
(72, 5),
(75, 5),
(76, 5),
(77, 5),
(78, 5),
(79, 5),
(80, 5),
(82, 5),
(83, 5),
(83, 6),
(84, 6),
(85, 6),
(86, 6),
(87, 6),
(88, 6),
(5, 7),
(11, 7),
(19, 7),
(12, 8),
(13, 8),
(14, 8),
(15, 8),
(16, 8),
(17, 8),
(18, 8),
(19, 8),
(20, 8),
(21, 8),
(22, 8),
(23, 8),
(24, 8),
(25, 8),
(26, 8),
(27, 8),
(28, 8),
(29, 8),
(30, 8),
(34, 8),
(36, 8),
(38, 8),
(40, 8),
(42, 8),
(43, 8),
(44, 8),
(45, 8),
(46, 8),
(48, 8),
(50, 8),
(51, 8),
(52, 8),
(54, 8),
(55, 8),
(57, 8),
(58, 8),
(59, 8),
(60, 8),
(62, 8),
(63, 8),
(64, 8),
(66, 8),
(67, 8),
(68, 8),
(70, 8),
(71, 8),
(72, 8),
(73, 8),
(75, 8),
(76, 8),
(77, 8),
(79, 8),
(82, 8),
(83, 8),
(85, 8),
(86, 8),
(87, 8),
(88, 8),
(89, 8),
(90, 8),
(16, 9),
(19, 9),
(27, 9),
(46, 9),
(50, 9),
(61, 9),
(28, 10),
(37, 10),
(56, 10),
(74, 10),
(14, 11),
(17, 11),
(70, 11),
(72, 11),
(1, 12),
(2, 12),
(3, 12),
(5, 12),
(6, 12),
(7, 12),
(8, 12),
(9, 12),
(10, 12),
(11, 12),
(13, 12),
(21, 12),
(23, 12),
(26, 12),
(89, 12),
(90, 12),
(91, 12),
(92, 12),
(93, 12),
(94, 12),
(95, 12),
(24, 13),
(25, 13),
(38, 13),
(43, 13),
(45, 13),
(63, 13),
(18, 14),
(20, 14),
(22, 14),
(29, 14),
(41, 14),
(55, 14),
(57, 14),
(58, 14),
(59, 14),
(60, 14),
(64, 14),
(73, 14),
(75, 14),
(76, 14),
(77, 14),
(78, 14),
(79, 14),
(80, 14),
(81, 14),
(82, 14),
(30, 15),
(31, 15),
(35, 15),
(39, 15),
(47, 15),
(53, 15),
(54, 15),
(65, 15),
(67, 15),
(15, 16),
(32, 16),
(33, 16),
(34, 16),
(36, 16),
(42, 16),
(44, 16),
(48, 16),
(49, 16),
(51, 16),
(52, 16),
(71, 16),
(83, 16),
(84, 16),
(85, 16),
(86, 16),
(87, 16),
(88, 16),
(12, 17),
(40, 17),
(62, 17),
(66, 17),
(68, 17),
(69, 17),
(16, 18),
(19, 18),
(27, 18),
(46, 18),
(50, 18),
(61, 18),
(15, 19),
(22, 19),
(36, 19),
(28, 20),
(69, 21),
(21, 22),
(37, 23),
(52, 24),
(32, 25),
(33, 25),
(48, 25),
(49, 25),
(59, 25),
(26, 26),
(42, 27),
(62, 27),
(68, 27),
(41, 28),
(12, 29),
(39, 29),
(51, 29),
(66, 29),
(67, 29),
(13, 30),
(23, 30),
(55, 30),
(29, 31),
(30, 31),
(35, 31),
(64, 31),
(75, 31),
(58, 32),
(14, 33),
(17, 33),
(18, 33),
(20, 33),
(34, 33),
(57, 33),
(60, 33),
(70, 33),
(72, 33),
(73, 33),
(74, 33),
(76, 34),
(54, 35),
(44, 36),
(71, 36),
(83, 36),
(84, 36),
(85, 36),
(86, 36),
(87, 36),
(88, 36),
(40, 37),
(77, 37),
(78, 37),
(79, 37),
(80, 37),
(81, 37),
(82, 37),
(6, 38),
(8, 38),
(9, 38),
(11, 38),
(35, 38),
(37, 38),
(39, 38),
(41, 38),
(56, 38),
(59, 38),
(61, 38),
(65, 38),
(69, 38),
(74, 38),
(78, 38),
(81, 38),
(84, 38),
(94, 38),
(1, 39),
(5, 39),
(31, 39),
(32, 39),
(47, 39),
(49, 39),
(53, 39),
(91, 39),
(92, 39),
(93, 39),
(95, 39),
(10, 40),
(7, 41),
(24, 41),
(25, 41),
(38, 41),
(43, 41),
(63, 41),
(89, 41),
(90, 41),
(30, 42),
(54, 42),
(67, 42),
(12, 43),
(13, 43),
(14, 43),
(16, 43),
(17, 43),
(18, 43),
(19, 43),
(20, 43),
(21, 43),
(22, 43),
(23, 43),
(26, 43),
(27, 43),
(28, 43),
(29, 43),
(33, 43),
(34, 43),
(36, 43),
(40, 43),
(42, 43),
(44, 43),
(46, 43),
(48, 43),
(50, 43),
(51, 43),
(52, 43),
(55, 43),
(57, 43),
(58, 43),
(60, 43),
(62, 43),
(64, 43),
(66, 43),
(68, 43),
(70, 43),
(71, 43),
(72, 43),
(73, 43),
(75, 43),
(76, 43),
(77, 43),
(79, 43),
(82, 43),
(83, 43),
(85, 43),
(86, 43),
(87, 43),
(88, 43),
(2, 44),
(3, 44),
(18, 45),
(20, 45),
(22, 45),
(29, 45),
(41, 45),
(55, 45),
(57, 45),
(58, 45),
(59, 45),
(60, 45),
(64, 45),
(73, 45),
(75, 45),
(76, 45),
(12, 46),
(40, 46),
(62, 46),
(66, 46),
(68, 46),
(69, 46),
(16, 47),
(19, 47),
(27, 47),
(46, 47),
(50, 47),
(61, 47),
(1, 48),
(2, 48),
(3, 48),
(5, 48),
(6, 48),
(7, 48),
(8, 48),
(9, 48),
(10, 48),
(11, 48),
(13, 48),
(21, 48),
(23, 48),
(26, 48),
(89, 48),
(90, 48),
(91, 48),
(92, 48),
(93, 48),
(94, 48),
(95, 48),
(77, 49),
(78, 49),
(79, 49),
(81, 49),
(82, 49),
(42, 50),
(24, 51),
(25, 51),
(38, 51),
(43, 51),
(45, 51),
(63, 51),
(83, 52),
(84, 52),
(85, 52),
(86, 52),
(87, 52),
(88, 52),
(32, 53),
(36, 53),
(44, 53),
(48, 53),
(49, 53),
(71, 53),
(28, 54),
(37, 54),
(56, 54),
(74, 54),
(30, 55),
(31, 55),
(35, 55),
(39, 55),
(47, 55),
(53, 55),
(54, 55),
(65, 55),
(67, 55),
(15, 56),
(33, 56),
(34, 56),
(51, 56),
(52, 56),
(14, 57),
(17, 57),
(70, 57),
(72, 57);

-- --------------------------------------------------------

--
-- Structure de la table `st_types_of_logistics`
--

DROP TABLE IF EXISTS `st_types_of_logistics`;
CREATE TABLE IF NOT EXISTS `st_types_of_logistics` (
  `typ_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `typ_log_descr` varchar(45) NOT NULL,
  `typ_log_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`typ_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `st_types_of_payments`
--

DROP TABLE IF EXISTS `st_types_of_payments`;
CREATE TABLE IF NOT EXISTS `st_types_of_payments` (
  `typ_pay_id` int(11) NOT NULL AUTO_INCREMENT,
  `typ_pay_descr` varchar(45) NOT NULL,
  PRIMARY KEY (`typ_pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `st_addresses`
--
ALTER TABLE `st_addresses`
  ADD CONSTRAINT `fk_st_addresses_st_customers1` FOREIGN KEY (`st_customers_cus_id`) REFERENCES `st_customers` (`cus_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `st_caddies`
--
ALTER TABLE `st_caddies`
  ADD CONSTRAINT `fk_st_customers_has_st_products_st_customers` FOREIGN KEY (`st_customers_cus_id`) REFERENCES `st_customers` (`cus_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_st_customers_has_st_products_st_products1` FOREIGN KEY (`st_products_pro_id`) REFERENCES `st_products` (`pro_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `st_categories_main_has_st_categories`
--
ALTER TABLE `st_categories_main_has_st_categories`
  ADD CONSTRAINT `fk_st_categories_main_has_st_categories1` FOREIGN KEY (`st_categories_cat_id`) REFERENCES `st_categories` (`cat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_st_categories_main_has_st_categories_main1` FOREIGN KEY (`st_categories_main_cat_main_id`) REFERENCES `st_categories_main` (`cat_main_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `st_orders`
--
ALTER TABLE `st_orders`
  ADD CONSTRAINT `fk_st_orders_st_addresses1` FOREIGN KEY (`st_address_billing`) REFERENCES `st_addresses` (`add_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_st_orders_st_addresses2` FOREIGN KEY (`st_address_delivery`) REFERENCES `st_addresses` (`add_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_st_orders_st_customers1` FOREIGN KEY (`st_customers_cus_id`) REFERENCES `st_customers` (`cus_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_st_orders_st_types_of_logistics1` FOREIGN KEY (`st_types_of_logistics_typ_log_id`) REFERENCES `st_types_of_logistics` (`typ_log_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `st_orders_lines`
--
ALTER TABLE `st_orders_lines`
  ADD CONSTRAINT `fk_st_orders_has_st_products_st_orders1` FOREIGN KEY (`st_orders_ord_id`) REFERENCES `st_orders` (`ord_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_st_orders_has_st_products_st_products1` FOREIGN KEY (`st_products_pro_id`) REFERENCES `st_products` (`pro_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `st_payments`
--
ALTER TABLE `st_payments`
  ADD CONSTRAINT `fk_st_payments_st_customers1` FOREIGN KEY (`st_customers_cus_id`) REFERENCES `st_customers` (`cus_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_st_payments_st_orders1` FOREIGN KEY (`st_orders_ord_id`) REFERENCES `st_orders` (`ord_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_st_payments_st_types_of_payments1` FOREIGN KEY (`st_types_of_payments_typ_pay_id`) REFERENCES `st_types_of_payments` (`typ_pay_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `st_products_has_st_categories`
--
ALTER TABLE `st_products_has_st_categories`
  ADD CONSTRAINT `fk_st_products_has_st_categories_st_categories1` FOREIGN KEY (`st_categories_cat_id`) REFERENCES `st_categories` (`cat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_st_products_has_st_categories_st_products1` FOREIGN KEY (`st_products_pro_id`) REFERENCES `st_products` (`pro_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
