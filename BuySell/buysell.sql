-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2024 at 06:38 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `buysell`
--

-- --------------------------------------------------------

--
-- Table structure for table `card_informations`
--

CREATE TABLE `card_informations` (
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `card_number` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `card_informations`
--

INSERT INTO `card_informations` (`id_user`, `card_number`, `created_at`, `updated_at`) VALUES
(5, '1234123412341234', '2024-03-10 16:56:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id_category` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id_category`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 'Gardening', '2024-03-10 15:20:11', NULL),
(2, 'Vehicles', '2024-03-10 15:20:11', NULL),
(3, 'Music', '2024-03-10 15:20:56', NULL),
(4, 'Movies and TV', '2024-03-10 15:20:56', NULL),
(5, 'Electronics', '2024-03-10 15:21:18', NULL),
(6, 'Books', '2024-03-10 15:21:18', NULL),
(7, 'Furniture', '2024-03-10 15:21:32', NULL),
(8, 'Clothing', '2024-03-10 15:21:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id_city` bigint(20) UNSIGNED NOT NULL,
  `id_country` bigint(20) UNSIGNED NOT NULL,
  `city_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id_city`, `id_country`, `city_name`) VALUES
(1, 1, 'North Annette'),
(2, 1, 'West Heloise'),
(3, 1, 'Langworthchester'),
(4, 1, 'Lake Haskellside'),
(5, 1, 'New Elvieview'),
(6, 1, 'Lake Freeda'),
(7, 1, 'East Karianebury'),
(8, 1, 'Raushire'),
(9, 1, 'Cummingsstad'),
(10, 1, 'New Hulda'),
(11, 1, 'Garettview'),
(12, 1, 'East Mossie'),
(13, 1, 'South Colemanton'),
(14, 1, 'Orvalchester'),
(15, 1, 'West Elmermouth'),
(16, 1, 'Reichertton'),
(17, 1, 'Katelynnland'),
(18, 1, 'South Karleestad'),
(19, 1, 'East Abbie'),
(20, 1, 'Lake Amani'),
(21, 2, 'Felicityfort'),
(22, 2, 'South Michelbury'),
(23, 2, 'Stokesstad'),
(24, 2, 'Port Elyssa'),
(25, 2, 'Kreigerville'),
(26, 2, 'McGlynnbury'),
(27, 2, 'South Brooke'),
(28, 2, 'Odafurt'),
(29, 2, 'Kingside'),
(30, 2, 'Linastad'),
(31, 2, 'Bennystad'),
(32, 2, 'West Mauricio'),
(33, 2, 'Port Aileenfurt'),
(34, 2, 'Gregoriaborough'),
(35, 2, 'Port Georgianafort'),
(36, 2, 'East Kattie'),
(37, 2, 'Marinachester'),
(38, 2, 'Johnberg'),
(39, 2, 'Altenwerthview'),
(40, 2, 'West Newellhaven'),
(41, 3, 'East Keely'),
(42, 3, 'Bartonhaven'),
(43, 3, 'Port Maye'),
(44, 3, 'West Myrtice'),
(45, 3, 'Dewayneburgh'),
(46, 3, 'North Mozelle'),
(47, 3, 'Port Jace'),
(48, 3, 'Port Leonardo'),
(49, 3, 'West Ritaville'),
(50, 3, 'New Margarete'),
(51, 3, 'East Marilieside'),
(52, 3, 'Alberthaside'),
(53, 3, 'West Celestino'),
(54, 3, 'North Alexandro'),
(55, 3, 'Douglaston'),
(56, 3, 'Erdmanstad'),
(57, 3, 'Robelside'),
(58, 3, 'Shadland'),
(59, 3, 'North Jacklynborough'),
(60, 3, 'Pfefferview'),
(61, 4, 'Delphaton'),
(62, 4, 'Herminaville'),
(63, 4, 'East Prestonberg'),
(64, 4, 'Conorland'),
(65, 4, 'Adelefurt'),
(66, 4, 'Barryfort'),
(67, 4, 'Lake Walter'),
(68, 4, 'Port Lance'),
(69, 4, 'East Nicolas'),
(70, 4, 'Quitzonport'),
(71, 4, 'Port Coopermouth'),
(72, 4, 'North Anguston'),
(73, 4, 'Port Ludwig'),
(74, 4, 'North Jerod'),
(75, 4, 'Kochborough'),
(76, 4, 'West Emie'),
(77, 4, 'Lake Lavern'),
(78, 4, 'Boylemouth'),
(79, 4, 'South Cassie'),
(80, 4, 'Schoenburgh'),
(81, 5, 'Gibsonstad'),
(82, 5, 'North Gabrielshire'),
(83, 5, 'Port Evangelineville'),
(84, 5, 'South Justus'),
(85, 5, 'West Ashlynnmouth'),
(86, 5, 'Turcottehaven'),
(87, 5, 'Lake Thelmaborough'),
(88, 5, 'West Philipshire'),
(89, 5, 'East Adaline'),
(90, 5, 'North Orinshire'),
(91, 5, 'South Aisha'),
(92, 5, 'Shaniashire'),
(93, 5, 'Ryanmouth'),
(94, 5, 'Oberbrunnerburgh'),
(95, 5, 'Champlinchester'),
(96, 5, 'Hageneshaven'),
(97, 5, 'New Hilton'),
(98, 5, 'Yadiramouth'),
(99, 5, 'East Amie'),
(100, 5, 'Greenholtborough'),
(101, 6, 'Port Carlie'),
(102, 6, 'Mazieburgh'),
(103, 6, 'Oralbury'),
(104, 6, 'New Cristal'),
(105, 6, 'Ramonatown'),
(106, 6, 'South Quentin'),
(107, 6, 'Athenamouth'),
(108, 6, 'Modestaside'),
(109, 6, 'Port Lance'),
(110, 6, 'Edythberg'),
(111, 6, 'East Julio'),
(112, 6, 'Jacklynland'),
(113, 6, 'Chloefurt'),
(114, 6, 'Port Morgantown'),
(115, 6, 'Port Gracielaton'),
(116, 6, 'Port Jasen'),
(117, 6, 'Grahamstad'),
(118, 6, 'Langworthfurt'),
(119, 6, 'Port Felicitamouth'),
(120, 6, 'Fridaville'),
(121, 7, 'Lake Sierraview'),
(122, 7, 'New Cynthia'),
(123, 7, 'North Carmellafurt'),
(124, 7, 'Rodriguezstad'),
(125, 7, 'East Haydenville'),
(126, 7, 'Dariuschester'),
(127, 7, 'Ernserburgh'),
(128, 7, 'O\'Connellville'),
(129, 7, 'Watsicaborough'),
(130, 7, 'Port Calistahaven'),
(131, 7, 'New Nathanielberg'),
(132, 7, 'Lake Justineville'),
(133, 7, 'Jaidamouth'),
(134, 7, 'Eleanorachester'),
(135, 7, 'Quigleyview'),
(136, 7, 'Port Caterina'),
(137, 7, 'North Jocelynstad'),
(138, 7, 'Roxannehaven'),
(139, 7, 'Port Jameyfort'),
(140, 7, 'North Iciestad'),
(141, 8, 'North Flavie'),
(142, 8, 'Schillerfort'),
(143, 8, 'East Colemanmouth'),
(144, 8, 'East Kellenton'),
(145, 8, 'Sipesland'),
(146, 8, 'Christaburgh'),
(147, 8, 'West Robbieside'),
(148, 8, 'Gaylordfurt'),
(149, 8, 'South Tyreekshire'),
(150, 8, 'Benniefurt'),
(151, 8, 'New Macy'),
(152, 8, 'North Sydnee'),
(153, 8, 'West Rasheedtown'),
(154, 8, 'Riceberg'),
(155, 8, 'Natton'),
(156, 8, 'New Neva'),
(157, 8, 'New Percival'),
(158, 8, 'Macejkovicfort'),
(159, 8, 'North Keshawntown'),
(160, 8, 'Eleazarfort'),
(161, 9, 'Wolfborough'),
(162, 9, 'Langland'),
(163, 9, 'Maudiemouth'),
(164, 9, 'Kulasside'),
(165, 9, 'Casperville'),
(166, 9, 'Lavinafort'),
(167, 9, 'East Shannaberg'),
(168, 9, 'Carriefort'),
(169, 9, 'Alberthashire'),
(170, 9, 'East Lindsay'),
(171, 9, 'East Ben'),
(172, 9, 'Uniqueborough'),
(173, 9, 'West Joellebury'),
(174, 9, 'Blandaberg'),
(175, 9, 'North Zoraton'),
(176, 9, 'New Eliasfort'),
(177, 9, 'Bernhardland'),
(178, 9, 'Johnsborough'),
(179, 9, 'Port Loycefort'),
(180, 9, 'East Cristopherfurt'),
(181, 10, 'Carolynstad'),
(182, 10, 'Lake Edmundhaven'),
(183, 10, 'Haagton'),
(184, 10, 'Port Juneport'),
(185, 10, 'Greenfelderside'),
(186, 10, 'Kobeport'),
(187, 10, 'Favianland'),
(188, 10, 'East Timothy'),
(189, 10, 'North Saige'),
(190, 10, 'Port Darrelhaven'),
(191, 10, 'South Aldaborough'),
(192, 10, 'Shanahanborough'),
(193, 10, 'East Casandraland'),
(194, 10, 'New Earnestinehaven'),
(195, 10, 'Guyport'),
(196, 10, 'South Price'),
(197, 10, 'East Myrna'),
(198, 10, 'Padbergville'),
(199, 10, 'Bernhardton'),
(200, 10, 'Abernathybury'),
(201, 11, 'East Carlo'),
(202, 11, 'McCulloughstad'),
(203, 11, 'Olsonview'),
(204, 11, 'South Cameronland'),
(205, 11, 'Gleasonside'),
(206, 11, 'Rosenbaummouth'),
(207, 11, 'Lake Jaceland'),
(208, 11, 'Rutherfordhaven'),
(209, 11, 'North Kylie'),
(210, 11, 'Port Jaidenton'),
(211, 11, 'Justusfort'),
(212, 11, 'North Itzel'),
(213, 11, 'West Elvabury'),
(214, 11, 'Port Javierville'),
(215, 11, 'New Sibyl'),
(216, 11, 'Krajciktown'),
(217, 11, 'Lake Shanelchester'),
(218, 11, 'Toyland'),
(219, 11, 'Wuckertton'),
(220, 11, 'Brendafurt'),
(221, 12, 'Lake Wyman'),
(222, 12, 'West Makennafurt'),
(223, 12, 'Bergefort'),
(224, 12, 'Mayerstad'),
(225, 12, 'West Lane'),
(226, 12, 'North Germanhaven'),
(227, 12, 'Lake Aleen'),
(228, 12, 'South Velma'),
(229, 12, 'Roslynbury'),
(230, 12, 'Alvenamouth'),
(231, 12, 'Retafort'),
(232, 12, 'Carlomouth'),
(233, 12, 'Ulicesshire'),
(234, 12, 'West Amanda'),
(235, 12, 'Fritschstad'),
(236, 12, 'O\'Konfort'),
(237, 12, 'Port Nathanael'),
(238, 12, 'East Lexi'),
(239, 12, 'Elmiraburgh'),
(240, 12, 'Schimmelburgh'),
(241, 13, 'Port Deltahaven'),
(242, 13, 'Aracelyport'),
(243, 13, 'Abelardoport'),
(244, 13, 'North Marcia'),
(245, 13, 'South Cortneyberg'),
(246, 13, 'Hermistonburgh'),
(247, 13, 'Eloisestad'),
(248, 13, 'Beermouth'),
(249, 13, 'Seamuston'),
(250, 13, 'Lake Lorna'),
(251, 13, 'Lubowitzmouth'),
(252, 13, 'Port Amiya'),
(253, 13, 'East Quinn'),
(254, 13, 'Eileenshire'),
(255, 13, 'West Kassandrafurt'),
(256, 13, 'West Celestine'),
(257, 13, 'Orvilleshire'),
(258, 13, 'West Lennieberg'),
(259, 13, 'Port Reidton'),
(260, 13, 'North Ezrashire'),
(261, 14, 'Strackemouth'),
(262, 14, 'Lake Samanthahaven'),
(263, 14, 'Lake Rickbury'),
(264, 14, 'New Casimertown'),
(265, 14, 'Altheaton'),
(266, 14, 'East Wilfridview'),
(267, 14, 'New Emmie'),
(268, 14, 'Fritzborough'),
(269, 14, 'Erickland'),
(270, 14, 'Rubyetown'),
(271, 14, 'Port Margarette'),
(272, 14, 'Lake Hermannstad'),
(273, 14, 'West Loisfurt'),
(274, 14, 'New Kaelyntown'),
(275, 14, 'Port Pabloside'),
(276, 14, 'Dickensport'),
(277, 14, 'Port Minnieside'),
(278, 14, 'West Kellenland'),
(279, 14, 'Jackytown'),
(280, 14, 'Lakinshire'),
(281, 15, 'West Gardnerville'),
(282, 15, 'Blandatown'),
(283, 15, 'East Tedshire'),
(284, 15, 'South Magaliland'),
(285, 15, 'South Victoriaview'),
(286, 15, 'New Erna'),
(287, 15, 'Romagueraberg'),
(288, 15, 'Hettingerview'),
(289, 15, 'East Palma'),
(290, 15, 'North Lorainebury'),
(291, 15, 'South Dominic'),
(292, 15, 'Howellborough'),
(293, 15, 'Wilkinsonbury'),
(294, 15, 'Port Zelmamouth'),
(295, 15, 'West Vickyburgh'),
(296, 15, 'Labadieville'),
(297, 15, 'West Hollisbury'),
(298, 15, 'East Noelberg'),
(299, 15, 'Denabury'),
(300, 15, 'South Romanmouth'),
(301, 16, 'Kiraside'),
(302, 16, 'Osinskibury'),
(303, 16, 'New Dena'),
(304, 16, 'Kuhnshire'),
(305, 16, 'Halvorsonview'),
(306, 16, 'Dibbertfurt'),
(307, 16, 'New Nilsberg'),
(308, 16, 'Susanafort'),
(309, 16, 'Lake Leanne'),
(310, 16, 'Powlowskiborough'),
(311, 16, 'Aliviaside'),
(312, 16, 'Garrisonville'),
(313, 16, 'East Gabrielleside'),
(314, 16, 'North Savionburgh'),
(315, 16, 'Windlerchester'),
(316, 16, 'Cristianhaven'),
(317, 16, 'Edgardoberg'),
(318, 16, 'Gabriellahaven'),
(319, 16, 'Gleichnerberg'),
(320, 16, 'Brekkeside'),
(321, 17, 'Janessamouth'),
(322, 17, 'Bustertown'),
(323, 17, 'East Andersonshire'),
(324, 17, 'Dooleyport'),
(325, 17, 'West Burdettemouth'),
(326, 17, 'Raynorfort'),
(327, 17, 'Darrickborough'),
(328, 17, 'North Friedrichport'),
(329, 17, 'West Bufordchester'),
(330, 17, 'Port Savannaland'),
(331, 17, 'North Loyce'),
(332, 17, 'Lake Ludwig'),
(333, 17, 'Maryamville'),
(334, 17, 'Denesikbury'),
(335, 17, 'Floridashire'),
(336, 17, 'Maymiemouth'),
(337, 17, 'Lolitaburgh'),
(338, 17, 'East Carlos'),
(339, 17, 'New Shainastad'),
(340, 17, 'East Albertha'),
(341, 18, 'East Newtonport'),
(342, 18, 'West Otis'),
(343, 18, 'North Lina'),
(344, 18, 'Tillmanshire'),
(345, 18, 'New Johathan'),
(346, 18, 'Jalynchester'),
(347, 18, 'Bruenbury'),
(348, 18, 'South May'),
(349, 18, 'South Betsy'),
(350, 18, 'West Earnestine'),
(351, 18, 'North Wilfrid'),
(352, 18, 'Wolfffurt'),
(353, 18, 'Stammside'),
(354, 18, 'Lake Burleystad'),
(355, 18, 'Rodgerfurt'),
(356, 18, 'Cronabury'),
(357, 18, 'West Manuela'),
(358, 18, 'North Brennontown'),
(359, 18, 'West Royce'),
(360, 18, 'Port Brisa'),
(361, 19, 'East Kenyattaborough'),
(362, 19, 'Jedediahmouth'),
(363, 19, 'Darrellbury'),
(364, 19, 'Jocelynside'),
(365, 19, 'Lurlinemouth'),
(366, 19, 'North Raphaelview'),
(367, 19, 'Lionelstad'),
(368, 19, 'Port Vena'),
(369, 19, 'Burdetteborough'),
(370, 19, 'North Ansel'),
(371, 19, 'Arthurport'),
(372, 19, 'West Hassan'),
(373, 19, 'Lake Demetrisport'),
(374, 19, 'Morissetteborough'),
(375, 19, 'Kayceeview'),
(376, 19, 'North Jodiefort'),
(377, 19, 'Johnathonmouth'),
(378, 19, 'Madelynnburgh'),
(379, 19, 'Port Narciso'),
(380, 19, 'Walshstad'),
(381, 20, 'Johnathonhaven'),
(382, 20, 'Mertzbury'),
(383, 20, 'Millerberg'),
(384, 20, 'Dasiafort'),
(385, 20, 'Aleneland'),
(386, 20, 'East Colin'),
(387, 20, 'New Malcolm'),
(388, 20, 'Port Ceciliamouth'),
(389, 20, 'New Lazaro'),
(390, 20, 'North Frank'),
(391, 20, 'East Gertrudestad'),
(392, 20, 'West Kaydentown'),
(393, 20, 'Faemouth'),
(394, 20, 'Zboncakhaven'),
(395, 20, 'West Hermannview'),
(396, 20, 'Alfort'),
(397, 20, 'Konopelskishire'),
(398, 20, 'Wilkinsonmouth'),
(399, 20, 'West Kristinfort'),
(400, 20, 'South Normaborough'),
(401, 21, 'East Mauricio'),
(402, 21, 'West Jayde'),
(403, 21, 'Abagailberg'),
(404, 21, 'Turnershire'),
(405, 21, 'Rathborough'),
(406, 21, 'Lake Omermouth'),
(407, 21, 'Jensenburgh'),
(408, 21, 'Bodeton'),
(409, 21, 'Vonton'),
(410, 21, 'South Lessie'),
(411, 21, 'Williamsonshire'),
(412, 21, 'Port Kasandrabury'),
(413, 21, 'Josiannehaven'),
(414, 21, 'East Rickie'),
(415, 21, 'North Mayraville'),
(416, 21, 'Myraberg'),
(417, 21, 'Nameshire'),
(418, 21, 'North Ellie'),
(419, 21, 'Lizethmouth'),
(420, 21, 'Sallieton'),
(421, 22, 'Eichmannside'),
(422, 22, 'Kovacekhaven'),
(423, 22, 'North Prudence'),
(424, 22, 'South Mozell'),
(425, 22, 'Schimmelborough'),
(426, 22, 'Kerlukefurt'),
(427, 22, 'Rueckerbury'),
(428, 22, 'Shanahanfurt'),
(429, 22, 'South Timmyside'),
(430, 22, 'Ernesttown'),
(431, 22, 'East Kaelyn'),
(432, 22, 'Port Hertha'),
(433, 22, 'Hodkiewiczmouth'),
(434, 22, 'Walkerland'),
(435, 22, 'Monahanfurt'),
(436, 22, 'Brigittestad'),
(437, 22, 'Kuhicfurt'),
(438, 22, 'Lake Alishafort'),
(439, 22, 'North Emmett'),
(440, 22, 'West Lonview'),
(441, 23, 'East Leoside'),
(442, 23, 'New Ronchester'),
(443, 23, 'North Holliefort'),
(444, 23, 'Schoenport'),
(445, 23, 'Melanyton'),
(446, 23, 'West Durward'),
(447, 23, 'Wilfordmouth'),
(448, 23, 'North Guillermo'),
(449, 23, 'South Dewayne'),
(450, 23, 'Wizaside'),
(451, 23, 'Okunevaside'),
(452, 23, 'South Antwontown'),
(453, 23, 'Urbanmouth'),
(454, 23, 'West Deondrebury'),
(455, 23, 'Riceville'),
(456, 23, 'Joanniebury'),
(457, 23, 'Lake Kaydenburgh'),
(458, 23, 'Rosaliaside'),
(459, 23, 'Spencerfurt'),
(460, 23, 'Minervaton'),
(461, 24, 'Lake Isommouth'),
(462, 24, 'Bodeborough'),
(463, 24, 'New Jaida'),
(464, 24, 'Port Elwynberg'),
(465, 24, 'East Tatum'),
(466, 24, 'Freddieside'),
(467, 24, 'Port Marcusland'),
(468, 24, 'McKenzieport'),
(469, 24, 'Quintenview'),
(470, 24, 'New Rosarioton'),
(471, 24, 'Port Adelle'),
(472, 24, 'New Gerardofort'),
(473, 24, 'North Destineeville'),
(474, 24, 'Leilaville'),
(475, 24, 'New Carolinemouth'),
(476, 24, 'New Frankiehaven'),
(477, 24, 'Port Napoleontown'),
(478, 24, 'North Herminiafort'),
(479, 24, 'West Madisynmouth'),
(480, 24, 'Keaganshire'),
(481, 25, 'North Federico'),
(482, 25, 'Shieldsberg'),
(483, 25, 'Lake Mableberg'),
(484, 25, 'Port Efrainton'),
(485, 25, 'Greenfeldermouth'),
(486, 25, 'Lehnerberg'),
(487, 25, 'Greenholtfurt'),
(488, 25, 'Port Giuseppeview'),
(489, 25, 'East Enidchester'),
(490, 25, 'New Zanefurt'),
(491, 25, 'Clemmieport'),
(492, 25, 'Ruthhaven'),
(493, 25, 'New Freddy'),
(494, 25, 'New Reilly'),
(495, 25, 'New Owen'),
(496, 25, 'Lake Ardithville'),
(497, 25, 'Hirthehaven'),
(498, 25, 'Port Bessie'),
(499, 25, 'Malloryville'),
(500, 25, 'Kiramouth'),
(501, 26, 'South Gavin'),
(502, 26, 'New Thurman'),
(503, 26, 'Quigleystad'),
(504, 26, 'Dibbertville'),
(505, 26, 'Eusebioview'),
(506, 26, 'North Arvelland'),
(507, 26, 'West Emanueltown'),
(508, 26, 'Estachester'),
(509, 26, 'South Kelli'),
(510, 26, 'West Gonzalo'),
(511, 26, 'Muellerburgh'),
(512, 26, 'Lake Wiley'),
(513, 26, 'New Ettiemouth'),
(514, 26, 'Johnsonbury'),
(515, 26, 'Lesliebury'),
(516, 26, 'Bernierland'),
(517, 26, 'South Danialhaven'),
(518, 26, 'Lake Janeborough'),
(519, 26, 'Jaydonburgh'),
(520, 26, 'Seanhaven'),
(521, 27, 'Lake Leonardo'),
(522, 27, 'Lake Krystinaport'),
(523, 27, 'East Kaleigh'),
(524, 27, 'South Raina'),
(525, 27, 'West Fatimaville'),
(526, 27, 'South Steve'),
(527, 27, 'Kesslerville'),
(528, 27, 'Rueckermouth'),
(529, 27, 'North Pascalehaven'),
(530, 27, 'North Baileeside'),
(531, 27, 'New Shaniya'),
(532, 27, 'South Rodrigoside'),
(533, 27, 'West Jazlynshire'),
(534, 27, 'Murphybury'),
(535, 27, 'Reginaldburgh'),
(536, 27, 'Wolffview'),
(537, 27, 'Zboncakmouth'),
(538, 27, 'Port Kellie'),
(539, 27, 'West Candida'),
(540, 27, 'Kulasside'),
(541, 28, 'Cummerataside'),
(542, 28, 'Grimesmouth'),
(543, 28, 'New Dennisstad'),
(544, 28, 'South Guiseppe'),
(545, 28, 'Franeckifort'),
(546, 28, 'Aylaville'),
(547, 28, 'Gibsonborough'),
(548, 28, 'New Daltonbury'),
(549, 28, 'O\'Haraville'),
(550, 28, 'Fayview'),
(551, 28, 'Gaylordview'),
(552, 28, 'South Coltenland'),
(553, 28, 'North Linda'),
(554, 28, 'North Ryannport'),
(555, 28, 'Cheyennemouth'),
(556, 28, 'Hermistonburgh'),
(557, 28, 'Judsonmouth'),
(558, 28, 'Keelingburgh'),
(559, 28, 'Maggiomouth'),
(560, 28, 'West Bianka'),
(561, 29, 'Schinnerside'),
(562, 29, 'Beahanburgh'),
(563, 29, 'Port Felicity'),
(564, 29, 'Biankabury'),
(565, 29, 'New Keshawnstad'),
(566, 29, 'Malindashire'),
(567, 29, 'Madiestad'),
(568, 29, 'Rowefurt'),
(569, 29, 'Klingberg'),
(570, 29, 'Rolfsonfurt'),
(571, 29, 'New Zackton'),
(572, 29, 'Candiceport'),
(573, 29, 'West Terrell'),
(574, 29, 'Naomiefort'),
(575, 29, 'New Icie'),
(576, 29, 'South Emanuelmouth'),
(577, 29, 'North Sarah'),
(578, 29, 'Port Mossieton'),
(579, 29, 'Reynaton'),
(580, 29, 'Caterinahaven'),
(581, 30, 'South Angelinaview'),
(582, 30, 'Port Tristian'),
(583, 30, 'East Clemenshaven'),
(584, 30, 'New Aryannamouth'),
(585, 30, 'New Treva'),
(586, 30, 'Biankahaven'),
(587, 30, 'Andreanemouth'),
(588, 30, 'New Aida'),
(589, 30, 'Jermaineborough'),
(590, 30, 'West Lamont'),
(591, 30, 'Dahliaborough'),
(592, 30, 'New Durwardside'),
(593, 30, 'Okunevaburgh'),
(594, 30, 'North Marcia'),
(595, 30, 'Lilyanhaven'),
(596, 30, 'Lake Kaseyfort'),
(597, 30, 'Bertmouth'),
(598, 30, 'Port Kallieton'),
(599, 30, 'Thompsonport'),
(600, 30, 'South Cletustown'),
(601, 31, 'Vitaborough'),
(602, 31, 'Nienowstad'),
(603, 31, 'West Chrisburgh'),
(604, 31, 'Salvatoremouth'),
(605, 31, 'Mullerport'),
(606, 31, 'Port Jevonfort'),
(607, 31, 'Cedrickfurt'),
(608, 31, 'Port Kaceychester'),
(609, 31, 'Hettingerport'),
(610, 31, 'West Todburgh'),
(611, 31, 'Goodwinmouth'),
(612, 31, 'Caroleborough'),
(613, 31, 'Morissetteton'),
(614, 31, 'West Callie'),
(615, 31, 'Bridgettefurt'),
(616, 31, 'Nikitamouth'),
(617, 31, 'Toymouth'),
(618, 31, 'Port Ryleigh'),
(619, 31, 'Millsburgh'),
(620, 31, 'Pearlieville'),
(621, 32, 'Romanchester'),
(622, 32, 'Port Assuntaport'),
(623, 32, 'Strackemouth'),
(624, 32, 'New Theresaside'),
(625, 32, 'North Avery'),
(626, 32, 'Funkfurt'),
(627, 32, 'Westtown'),
(628, 32, 'Port Jerome'),
(629, 32, 'Vernershire'),
(630, 32, 'North Arnoldoland'),
(631, 32, 'New Melyssaview'),
(632, 32, 'Lake Alisha'),
(633, 32, 'New Vitomouth'),
(634, 32, 'South Lelashire'),
(635, 32, 'West Amanda'),
(636, 32, 'Port Annabelleville'),
(637, 32, 'Otiliastad'),
(638, 32, 'New Sean'),
(639, 32, 'North Michel'),
(640, 32, 'Wunschmouth'),
(641, 33, 'Alverabury'),
(642, 33, 'Reichertchester'),
(643, 33, 'Bergstromhaven'),
(644, 33, 'West Joe'),
(645, 33, 'Ziemannmouth'),
(646, 33, 'West Doyle'),
(647, 33, 'East Lelahview'),
(648, 33, 'East Verlaberg'),
(649, 33, 'New Stanton'),
(650, 33, 'Port Lucy'),
(651, 33, 'Annabelhaven'),
(652, 33, 'Shannystad'),
(653, 33, 'North Melissabury'),
(654, 33, 'Joanieport'),
(655, 33, 'Ivyton'),
(656, 33, 'East Laurieburgh'),
(657, 33, 'West Scottieborough'),
(658, 33, 'Markside'),
(659, 33, 'East Kaylin'),
(660, 33, 'New Lawson'),
(661, 34, 'Luettgenport'),
(662, 34, 'Hauckport'),
(663, 34, 'Alainafurt'),
(664, 34, 'Carolynestad'),
(665, 34, 'Gonzaloshire'),
(666, 34, 'McGlynnton'),
(667, 34, 'Lowechester'),
(668, 34, 'Port Rene'),
(669, 34, 'Bodestad'),
(670, 34, 'Arvidfort'),
(671, 34, 'West Jazlynhaven'),
(672, 34, 'Beermouth'),
(673, 34, 'Freddyview'),
(674, 34, 'Eulaliaville'),
(675, 34, 'North Isabelle'),
(676, 34, 'North Jaydashire'),
(677, 34, 'East Beverlymouth'),
(678, 34, 'Sageport'),
(679, 34, 'Port Trudie'),
(680, 34, 'South Jamey'),
(681, 35, 'East Gustave'),
(682, 35, 'Eberthaven'),
(683, 35, 'New Emerson'),
(684, 35, 'South Delores'),
(685, 35, 'Mellieshire'),
(686, 35, 'South Olinville'),
(687, 35, 'Morissetteberg'),
(688, 35, 'Gottliebhaven'),
(689, 35, 'New Jabari'),
(690, 35, 'North Stan'),
(691, 35, 'Konopelskimouth'),
(692, 35, 'New Zola'),
(693, 35, 'New Gracie'),
(694, 35, 'New Garryburgh'),
(695, 35, 'New Delaney'),
(696, 35, 'South Jedediahborough'),
(697, 35, 'Torphyville'),
(698, 35, 'Carlottaland'),
(699, 35, 'Bayermouth'),
(700, 35, 'Port Edgar'),
(701, 36, 'Ivoryside'),
(702, 36, 'New Cortezbury'),
(703, 36, 'South Koleborough'),
(704, 36, 'Lake Kali'),
(705, 36, 'Stanborough'),
(706, 36, 'South Joliefort'),
(707, 36, 'Lednerton'),
(708, 36, 'Rohanchester'),
(709, 36, 'Pearlborough'),
(710, 36, 'Dietrichchester'),
(711, 36, 'Port Ellie'),
(712, 36, 'Port Kaitlynburgh'),
(713, 36, 'North Jackyhaven'),
(714, 36, 'Lake Maritzaview'),
(715, 36, 'Clevechester'),
(716, 36, 'Lake Brooksbury'),
(717, 36, 'South Newellstad'),
(718, 36, 'East Tellyton'),
(719, 36, 'East Felixview'),
(720, 36, 'New Tamara'),
(721, 37, 'New Luciano'),
(722, 37, 'Joanmouth'),
(723, 37, 'Kyleebury'),
(724, 37, 'East Macyfort'),
(725, 37, 'Port Logan'),
(726, 37, 'New Daisy'),
(727, 37, 'Efrainborough'),
(728, 37, 'Hamillview'),
(729, 37, 'Romaview'),
(730, 37, 'East Stantown'),
(731, 37, 'South Louie'),
(732, 37, 'Hamillstad'),
(733, 37, 'Francescomouth'),
(734, 37, 'Krismouth'),
(735, 37, 'South Lauriane'),
(736, 37, 'Runolfssonport'),
(737, 37, 'Samantachester'),
(738, 37, 'Aminafort'),
(739, 37, 'Port Mariana'),
(740, 37, 'Hodkiewiczport'),
(741, 38, 'New Willard'),
(742, 38, 'Muellerview'),
(743, 38, 'New Kirstin'),
(744, 38, 'Runtehaven'),
(745, 38, 'Erickchester'),
(746, 38, 'South Deontaeport'),
(747, 38, 'Port Vilmaburgh'),
(748, 38, 'West Alvah'),
(749, 38, 'South Isobel'),
(750, 38, 'Port Bernicetown'),
(751, 38, 'Cormierhaven'),
(752, 38, 'Roobborough'),
(753, 38, 'West Salvador'),
(754, 38, 'Haskellport'),
(755, 38, 'Wunschfort'),
(756, 38, 'Riceton'),
(757, 38, 'Allyborough'),
(758, 38, 'South Jess'),
(759, 38, 'South Allene'),
(760, 38, 'Carolineville'),
(761, 39, 'North Ellsworth'),
(762, 39, 'North Danton'),
(763, 39, 'Metzstad'),
(764, 39, 'West Bud'),
(765, 39, 'Port Russel'),
(766, 39, 'New Annette'),
(767, 39, 'Westville'),
(768, 39, 'New Chad'),
(769, 39, 'Eddburgh'),
(770, 39, 'East Cassieton'),
(771, 39, 'North Malinda'),
(772, 39, 'Columbusville'),
(773, 39, 'Hazelview'),
(774, 39, 'Alisonmouth'),
(775, 39, 'North Clarabelle'),
(776, 39, 'East Thurman'),
(777, 39, 'West Lorine'),
(778, 39, 'South D\'angelobury'),
(779, 39, 'Lake Marjoryshire'),
(780, 39, 'North Abigaylemouth'),
(781, 40, 'Noemieville'),
(782, 40, 'Pinkshire'),
(783, 40, 'Beckerport'),
(784, 40, 'Ryanborough'),
(785, 40, 'Pearliehaven'),
(786, 40, 'Dejonview'),
(787, 40, 'Port Bettyfort'),
(788, 40, 'Port Annabelle'),
(789, 40, 'Port Karianne'),
(790, 40, 'Willisborough'),
(791, 40, 'Phoebeshire'),
(792, 40, 'Port Soledad'),
(793, 40, 'Towneborough'),
(794, 40, 'Ernsermouth'),
(795, 40, 'Wittingburgh'),
(796, 40, 'West Hudsonville'),
(797, 40, 'Bayerville'),
(798, 40, 'South Florencioside'),
(799, 40, 'West Faustino'),
(800, 40, 'North Christop'),
(801, 41, 'North Cooper'),
(802, 41, 'Port Ellsworth'),
(803, 41, 'Stantonmouth'),
(804, 41, 'Beckerton'),
(805, 41, 'Marisolmouth'),
(806, 41, 'West Lou'),
(807, 41, 'Lake Joan'),
(808, 41, 'Lake Lessie'),
(809, 41, 'Moenmouth'),
(810, 41, 'Cassidyshire'),
(811, 41, 'New Halberg'),
(812, 41, 'Kacifurt'),
(813, 41, 'Lake Dallinmouth'),
(814, 41, 'Port Alberto'),
(815, 41, 'Katrinashire'),
(816, 41, 'East Vicente'),
(817, 41, 'Carrollview'),
(818, 41, 'North Rooseveltfort'),
(819, 41, 'Schoenhaven'),
(820, 41, 'Bechtelarmouth'),
(821, 42, 'New Nicklauston'),
(822, 42, 'North Lincolnland'),
(823, 42, 'South Amieborough'),
(824, 42, 'Aubreyburgh'),
(825, 42, 'New Tomasa'),
(826, 42, 'Davonstad'),
(827, 42, 'North Fayeland'),
(828, 42, 'South Sandra'),
(829, 42, 'South Elyseland'),
(830, 42, 'Lonmouth'),
(831, 42, 'East Laurine'),
(832, 42, 'North Verla'),
(833, 42, 'New Tierraport'),
(834, 42, 'West Jedediah'),
(835, 42, 'West Claraland'),
(836, 42, 'Thompsonview'),
(837, 42, 'Nolaburgh'),
(838, 42, 'Jordyfurt'),
(839, 42, 'New Winfieldshire'),
(840, 42, 'South Amaniland'),
(841, 43, 'North Trishaborough'),
(842, 43, 'Creminchester'),
(843, 43, 'Valliemouth'),
(844, 43, 'West Tatyanachester'),
(845, 43, 'Bartonshire'),
(846, 43, 'Lake Melisa'),
(847, 43, 'West Saige'),
(848, 43, 'Bartellshire'),
(849, 43, 'D\'Amoreland'),
(850, 43, 'East Jaylinside'),
(851, 43, 'North Jaren'),
(852, 43, 'Ellieburgh'),
(853, 43, 'Augustusberg'),
(854, 43, 'Barneystad'),
(855, 43, 'New Estellestad'),
(856, 43, 'Lake Destanyberg'),
(857, 43, 'New Jaydeton'),
(858, 43, 'New Bruceport'),
(859, 43, 'Conroymouth'),
(860, 43, 'East Sheila'),
(861, 44, 'East Bobbie'),
(862, 44, 'Schneiderton'),
(863, 44, 'Vonmouth'),
(864, 44, 'Lake Madonnahaven'),
(865, 44, 'Maudmouth'),
(866, 44, 'West Kassandrahaven'),
(867, 44, 'South Dennisborough'),
(868, 44, 'New Rodrigo'),
(869, 44, 'Pricechester'),
(870, 44, 'Kemmerfort'),
(871, 44, 'East Layla'),
(872, 44, 'Chaimshire'),
(873, 44, 'New Dejonmouth'),
(874, 44, 'Millshaven'),
(875, 44, 'Joanview'),
(876, 44, 'Cronaland'),
(877, 44, 'Dickenschester'),
(878, 44, 'Raleighbury'),
(879, 44, 'Meghanfurt'),
(880, 44, 'Port Gracieberg'),
(881, 45, 'Shieldsmouth'),
(882, 45, 'Mrazchester'),
(883, 45, 'South Ashtonburgh'),
(884, 45, 'South Rick'),
(885, 45, 'Jovaniside'),
(886, 45, 'South Nickmouth'),
(887, 45, 'Haagfort'),
(888, 45, 'Muellerport'),
(889, 45, 'Port Erikastad'),
(890, 45, 'Gulgowskiville'),
(891, 45, 'Lelahchester'),
(892, 45, 'O\'Connerton'),
(893, 45, 'South Verlietown'),
(894, 45, 'Lake Sylvan'),
(895, 45, 'West Ezequielside'),
(896, 45, 'Hilpertport'),
(897, 45, 'Port Delaneyside'),
(898, 45, 'Lake Cleveland'),
(899, 45, 'Port Ryan'),
(900, 45, 'West Merle');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id_country` bigint(20) UNSIGNED NOT NULL,
  `country_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id_country`, `country_name`) VALUES
(4, 'Antigua and Barbuda'),
(6, 'Bermuda'),
(19, 'Bosnia and Herzegovina'),
(33, 'Bouvet Island (Bouvetoya)'),
(37, 'Brazil'),
(24, 'Burundi'),
(3, 'Cameroon'),
(31, 'Chad'),
(29, 'Comoros'),
(40, 'Costa Rica'),
(17, 'Cyprus'),
(30, 'Denmark'),
(13, 'Ethiopia'),
(9, 'Gambia'),
(39, 'Georgia'),
(22, 'Guadeloupe'),
(14, 'Guam'),
(44, 'Guinea'),
(26, 'Iraq'),
(10, 'Japan'),
(5, 'Korea'),
(12, 'Lebanon'),
(8, 'Lesotho'),
(45, 'Libyan Arab Jamahiriya'),
(7, 'Maldives'),
(16, 'Malta'),
(28, 'Micronesia'),
(15, 'Montserrat'),
(34, 'Netherlands'),
(18, 'Nigeria'),
(41, 'Oman'),
(42, 'Reunion'),
(11, 'Saint Kitts and Nevis'),
(32, 'Saint Martin'),
(25, 'Samoa'),
(20, 'Sierra Leone'),
(1, 'Singapore'),
(36, 'Slovenia'),
(27, 'Somalia'),
(21, 'Sri Lanka'),
(2, 'Tanzania'),
(43, 'Uganda'),
(38, 'United States of America'),
(23, 'Venezuela'),
(35, 'Wallis and Futuna');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id_image` bigint(20) UNSIGNED NOT NULL,
  `for_id_item` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id_image`, `for_id_item`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, '65edd2fe5e0cb2022-honda-civic-touring-4dr-sedan.jpg', '2024-03-10 15:34:22', NULL),
(2, 1, '65edd2fe61054most-popular-cars.jpg', '2024-03-10 15:34:22', NULL),
(3, 2, '65edd42c75ef8ford.png', '2024-03-10 15:39:24', NULL),
(4, 3, '65edd4f9bc494bike.jpg', '2024-03-10 15:42:49', NULL),
(5, 3, '65edd4f9be453bike1.jpg', '2024-03-10 15:42:49', NULL),
(6, 4, '65edd56030cb0posesivna.jpg', '2024-03-10 15:44:32', NULL),
(7, 4, '65edd56039b64posesivna1.jpg', '2024-03-10 15:44:32', NULL),
(8, 5, '65edd5f938d5elav1.jpg', '2024-03-10 15:47:05', NULL),
(9, 5, '65edd5f943f87lav2.jpg', '2024-03-10 15:47:05', NULL),
(10, 6, '65edd6c98964asn.png', '2024-03-10 15:50:33', NULL),
(11, 6, '65edd6c98be85sn1.png', '2024-03-10 15:50:33', NULL),
(12, 7, '65edd7afc7c35halo.jpg', '2024-03-10 15:54:23', NULL),
(13, 7, '65edd7afca264halo1.jpg', '2024-03-10 15:54:23', NULL),
(14, 8, '65edd7f9b218eduk.jpg', '2024-03-10 15:55:37', NULL),
(15, 9, '65edd86165f7crep.png', '2024-03-10 15:57:21', NULL),
(16, 10, '65edd8de78aabweb.png', '2024-03-10 15:59:26', NULL),
(17, 11, '65edd94e7b18bwow.png', '2024-03-10 16:01:18', NULL),
(18, 12, '65edda1942e65sofa.jpg', '2024-03-10 16:04:41', NULL),
(19, 13, '65edda4ae109cused.jpg', '2024-03-10 16:05:30', NULL),
(20, 14, '65edda860a28bdmg.jpg', '2024-03-10 16:06:30', NULL),
(21, 15, '65eddad4b7ef5set.jpg', '2024-03-10 16:07:48', NULL),
(22, 16, '65eddc30b5fbechairs.jpg', '2024-03-10 16:13:36', NULL),
(23, 17, '65eddc934da7bhandcraft.jpeg', '2024-03-10 16:15:15', NULL),
(24, 18, '65eddd25b519cshoes.jpg', '2024-03-10 16:17:41', NULL),
(25, 19, '65eddd821615cshoes1.jpg', '2024-03-10 16:19:14', NULL),
(26, 20, '65edde9e28ff9gnome.jpg', '2024-03-10 16:23:58', NULL),
(27, 21, '65eddec9312f6garden.png', '2024-03-10 16:24:41', NULL),
(28, 22, '65eddf0316708scraps.jpeg', '2024-03-10 16:25:39', NULL),
(29, 23, '65eddf2b7a169scrap.jpg', '2024-03-10 16:26:19', NULL),
(30, 24, '65eddf98deb55tv.jpg', '2024-03-10 16:28:08', NULL),
(31, 25, '65ede00a83a66used.png', '2024-03-10 16:30:02', NULL),
(32, 26, '65ede0c0f148fmixer.jpg', '2024-03-10 16:33:04', NULL),
(33, 27, '65ede11a69dfbmix1.jpg', '2024-03-10 16:34:34', NULL),
(34, 28, '65ede167caad3stove.jpg', '2024-03-10 16:35:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id_item` bigint(20) UNSIGNED NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_price` double NOT NULL,
  `id_category` bigint(20) UNSIGNED NOT NULL,
  `price_type` bigint(20) UNSIGNED NOT NULL,
  `item_state` bigint(20) UNSIGNED NOT NULL,
  `item_description` text NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id_item`, `item_name`, `item_price`, `id_category`, `price_type`, `item_state`, `item_description`, `id_user`, `created_at`, `updated_at`) VALUES
(1, '2022 Honda Civic', 550, 2, 2, 4, 'Honda Civic for sale', 35, '2024-03-10 15:34:22', NULL),
(2, 'Ford F150', 430, 2, 2, 2, 'Ford F150 for sale.', 24, '2024-03-10 15:39:24', '2024-03-10 16:37:10'),
(4, 'POSESIVNA - MILICA PAVLOVIC - ALBUM', 98.99, 3, 1, 4, 'Posesivna album - unopened.', 8, '2024-03-10 15:44:32', '2024-03-10 16:37:17'),
(6, 'Speak Now (TV) - Vinyl', 430, 3, 2, 4, 'Long awaited Taylor\'s Version of Speak Now.', 14, '2024-03-10 15:50:33', '2024-03-10 16:37:23'),
(8, 'Dobrodosao u klub - CD Edition', 129.99, 3, 1, 4, 'Cultural reset in CD form', 35, '2024-03-10 15:55:37', NULL),
(9, 'Reputation - Taylor Swift', 59.99, 3, 2, 4, 'Reputation CD Edition', 3, '2024-03-10 15:57:21', '2024-03-10 16:37:41'),
(10, 'Madame Web - Bluray', 15.99, 4, 1, 2, 'Madame Web bluray edition', 30, '2024-03-10 15:59:26', '2024-03-10 16:37:47'),
(11, 'Avatar: The Way of Water', 17.99, 4, 1, 2, 'Avatar: Way of Water bluray edition', 31, '2024-03-10 16:01:18', '2024-03-10 16:37:53'),
(12, 'LINANAS Sofa', 399, 7, 1, 4, 'Sofa from Linanas', 27, '2024-03-10 16:04:41', '2024-03-10 16:37:57'),
(13, 'Couch for sale', 31.25, 7, 2, 2, 'Used sofa up for sale', 21, '2024-03-10 16:05:30', '2024-03-10 16:38:05'),
(14, 'Couch for free', 1, 7, 2, 1, 'First come first serve', 18, '2024-03-10 16:06:30', '2024-03-10 16:38:10'),
(15, 'NORDVIKEN chair set', 899, 7, 1, 3, 'Complete set of NORDVIKEN chairs', 15, '2024-03-10 16:07:48', '2024-03-10 16:38:16'),
(16, 'Cheap 4-chair set', 59.95, 7, 2, 2, 'Cheap set of chairs', 35, '2024-03-10 16:13:36', NULL),
(17, 'We sew clothes', 49.99, 8, 1, 4, 'Hand sewn clothes', 30, '2024-03-10 16:15:15', '2024-03-10 16:38:24'),
(18, 'Casual Flipkart shoes - Not used', 12.99, 8, 1, 3, 'pair of flipkart shoes', 23, '2024-03-10 16:17:41', '2024-03-10 16:38:31'),
(19, 'Men Running Shoes JOGFLOW', 27.15, 8, 1, 4, 'Pair of running shoes', 32, '2024-03-10 16:19:14', '2024-03-10 16:38:35'),
(20, 'Garden Gnome Statue', 34.79, 1, 1, 4, 'Gnome garden decoration', 25, '2024-03-10 16:23:58', '2024-03-10 16:38:42'),
(21, 'Beginner Gardening Set', 499.89, 1, 2, 4, 'Gardening set for beginners', 25, '2024-03-10 16:24:41', '2024-03-10 16:38:47'),
(22, 'Broken tools for scrap', 10.99, 1, 2, 1, 'broken tools for scrap', 16, '2024-03-10 16:25:39', '2024-03-10 16:38:52'),
(23, 'Hammer (can be repaired)', 7.99, 1, 2, 1, 'broken hammer', 20, '2024-03-10 16:26:19', '2024-03-10 16:39:00'),
(24, '32\" HD T4300 Smart TV 2020', 1129.99, 5, 1, 4, 'Brand new Smart TV for sale', 13, '2024-03-10 16:28:08', '2024-03-10 16:39:06'),
(25, 'JVC TV - In good condition - Negotiable', 789.99, 5, 2, 3, 'JVC tv for sale', 11, '2024-03-10 16:30:02', '2024-03-10 16:39:15'),
(26, 'JASK E20 Mixer', 14.99, 5, 2, 1, 'broken mixer', 19, '2024-03-10 16:33:04', '2024-03-10 16:39:40'),
(27, 'BAUER Mikser HM 100 Bela , 300W - Tri O', 62.3, 5, 2, 2, 'professional mixer for sale', 27, '2024-03-10 16:34:34', '2024-03-10 16:39:35'),
(28, 'Stove for sale - Good condition - Not used much', 109.99, 5, 2, 2, 'selling a stove', 22, '2024-03-10 16:35:51', '2024-03-10 16:39:31');

-- --------------------------------------------------------

--
-- Table structure for table `item_states`
--

CREATE TABLE `item_states` (
  `id_item_state` bigint(20) UNSIGNED NOT NULL,
  `state_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_states`
--

INSERT INTO `item_states` (`id_item_state`, `state_name`) VALUES
(1, 'Damaged or defective'),
(2, 'Used'),
(3, 'Like new (unused)'),
(4, 'New');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_08_19_000000_create_failed_jobs_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2024_03_03_222858_create_countries_table', 1),
(4, '2024_03_03_222859_create_cities_table', 1),
(5, '2024_03_03_222917_create_categories_table', 1),
(6, '2024_03_03_222946_create_price_types_table', 1),
(7, '2024_03_03_222955_create_item_states_table', 1),
(8, '2024_03_03_223001_create_roles_table', 1),
(9, '2024_03_03_223002_create_users_table', 1),
(10, '2024_03_03_223003_create_items_table', 1),
(11, '2024_03_03_234837_create_images_table', 1),
(12, '2024_03_09_114959_create_card_informations', 1),
(13, '2024_03_09_220718_create_sales_table', 1),
(14, '2025_03_03_223004_create_transactions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `price_types`
--

CREATE TABLE `price_types` (
  `id_type` bigint(20) UNSIGNED NOT NULL,
  `type_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `price_types`
--

INSERT INTO `price_types` (`id_type`, `type_name`) VALUES
(1, 'Fixed'),
(2, 'Negotiable');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id_role` bigint(20) UNSIGNED NOT NULL,
  `role_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id_role`, `role_name`) VALUES
(1, 'administrator'),
(2, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id_item` bigint(20) UNSIGNED NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `item_price` double NOT NULL,
  `id_category` bigint(20) UNSIGNED NOT NULL,
  `price_type` bigint(20) UNSIGNED NOT NULL,
  `item_state` bigint(20) UNSIGNED NOT NULL,
  `item_description` text NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id_item`, `item_name`, `item_price`, `id_category`, `price_type`, `item_state`, `item_description`, `id_user`, `created_at`, `updated_at`) VALUES
(3, 'Brand New MTB Bike Mountain Bike 27.5\'\'\' inch Original Shimano - EXCELLENT BIKE!', 272.9, 2, 1, 4, 'Brand New MTB Bike Mountain Bike 27.5\'\'\' inch Original Shimano - EXCELLENT BIKE!', 14, '2024-03-10 15:42:49', '2024-03-10 16:37:05'),
(5, 'Milica Pavlovic - Lav Album - Mint Condition', 99.99, 3, 1, 4, 'MP\'s newest album. Mint condition.', 35, '2024-03-10 15:47:05', NULL),
(7, 'Severina - Halo Album - CD Edition', 119.99, 3, 1, 4, 'Severina\'s 12th studio album titled \'Halo\'', 35, '2024-03-10 15:54:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id_transaction` bigint(20) UNSIGNED NOT NULL,
  `id_item` bigint(20) UNSIGNED NOT NULL,
  `id_buyer` bigint(20) UNSIGNED NOT NULL,
  `card` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id_transaction`, `id_item`, `id_buyer`, `card`, `created_at`, `updated_at`) VALUES
(1, 3, 5, '1234123412341234', '2024-03-10 16:56:37', NULL),
(2, 7, 5, '1234123412341234', '2024-03-10 16:57:03', NULL),
(3, 5, 8, '7272727272727272', '2024-03-10 16:58:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `id_city` bigint(20) UNSIGNED NOT NULL,
  `id_role` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `name`, `surname`, `username`, `password`, `phone_number`, `email`, `address`, `id_city`, `id_role`, `created_at`, `updated_at`) VALUES
(1, 'Dayne', 'Torphy', 'linda.mckenzie', '$2y$12$P1RL3qtjKpznIOg/LEkXvOprHj/XxO3gcJ4XJ3w.F.NKKIDetQy1K', '+1-510-754-1069', 'kking@yahoo.com', '1216 Sincere Centers\nKittyport, AL 14504', 508, 2, '2024-03-10 15:25:46', '2024-03-10 16:55:55'),
(2, 'Juwan', 'Quitzon', 'christop.smith', '$2y$12$H0e.qjxad8bb6hvcNoJe.uJPHTaf5.uTDL8j/IfH2iUJIw65ZCEGy', '1-831-709-2075', 'reyna18@hotmail.com', '4211 Queen Grove Suite 014\nWest Dillanchester, CT 21798', 114, 2, '2024-03-10 15:25:46', NULL),
(3, 'Derrick', 'Renner', 'dfahey', '$2y$12$lcdu46dq9NzTWmIgfbVHluUbCiZPjSsPCxwcLNj6OFSCxxtCyGHn.', '+1-667-769-0782', 'oshanahan@yahoo.com', '7989 Alexa Spur\nEast Elissamouth, WY 71923-4836', 500, 2, '2024-03-10 15:25:46', '2024-03-10 16:55:55'),
(4, 'Matilda', 'Moen', 'haskell06', '$2y$12$dqJA77GW68A8Q4iQS1MufOZVpCPsxhbEnr.dsbGZ.YI.x2ou3L8SS', '283.386.5706', 'ayla.schmeler@gmail.com', '595 Schamberger Forest\nPort Tremayne, RI 04543', 504, 2, '2024-03-10 15:25:47', NULL),
(5, 'Darian', 'Mitchell', 'rosalee11', '$2y$12$fSn17TQG1CqKf6XT8t/bBuwrLOFqmJKiizzd9WxXYrs68.qkOwK7q', '929-356-0319', 'hilpert.ashlee@gmail.com', '6179 Twila Hills\nOkunevashire, GA 10285', 303, 2, '2024-03-10 15:25:47', '2024-03-10 16:55:55'),
(6, 'Princess', 'Runte', 'raoul.trantow', '$2y$12$WXj.E0OiVaqgVzN0SxztxOVUOV4SUGeFgEo1lkK0wC5pcK5v7oQKW', '(302) 618-8964', 'cbernier@gmail.com', '687 Miller Walk\nSouth Megane, NY 99008', 742, 2, '2024-03-10 15:26:28', NULL),
(7, 'Vicente', 'Gulgowski', 'claude37', '$2y$12$q5JXE8/k5hkSizOqivu95.kEmXNlra8pJ1CEfLpUSJUUixL9IPgaK', '858-640-1131', 'baumbach.forest@hotmail.com', '654 Bashirian Junction Suite 021\nSouth Romainechester, VA 08803-0244', 895, 2, '2024-03-10 15:26:28', '2024-03-10 16:55:55'),
(8, 'Frieda', 'Heaney', 'amy60', '$2y$12$oseU2q.PoHqQinhy8xa6T./0djiUReI9woVDpH/CTY05zR2TtzWoe', '928-206-8892', 'cruickshank.jadon@koepp.com', '57878 Waters Knolls Apt. 532\nNorth Andymouth, ID 36487', 617, 2, '2024-03-10 15:26:28', '2024-03-10 16:55:55'),
(9, 'Myrtis', 'Lockman', 'greg41', '$2y$12$f8dlFfCEQ8T/bpYU3st.EOOn8hOxHs43JWFjBAtVm5HcYxaLTaJs2', '435.676.3436', 'ted.rodriguez@gmail.com', '81780 Frances Island Apt. 724\nPort Ricky, WA 66877', 880, 2, '2024-03-10 15:26:29', '2024-03-10 16:55:55'),
(10, 'Arely', 'Blick', 'oconnell.kyler', '$2y$12$DoniaLhm5ipZciEUvgmaaOwE3fHNWomL4zLt8vRAeHE/CcDXlXx8u', '410.294.8847', 'cornelius72@gmail.com', '499 Lisandro Tunnel Apt. 189\nSouth Gusland, PA 73522-7522', 549, 2, '2024-03-10 15:26:29', NULL),
(11, 'Alexandrine', 'Legros', 'lfay', '$2y$12$N19OQBAZ.cBDcGazRxTSdOiLQoetuFBxK66AqCt6STpAIYLqhhL6q', '+1-906-672-3319', 'yschowalter@beatty.com', '2141 Pagac Creek Apt. 354\nNew Joaquinport, NM 12451-3861', 4, 2, '2024-03-10 15:26:29', '2024-03-10 16:55:55'),
(12, 'Keyon', 'Hettinger', 'hilda.jenkins', '$2y$12$RtjeLBZuzH82qz/39bO61er9TWZAzaq3ySsE.v8a8OISiS3TqsqcC', '+1.754.381.7559', 'lenore68@berge.com', '46904 Bessie Green\nNew Horaceview, NV 36798-9313', 17, 2, '2024-03-10 15:26:29', '2024-03-10 16:55:55'),
(13, 'Ismael', 'Keebler', 'lgutkowski', '$2y$12$mm3AkHAEq05vWstVD./tquPblTbjOerdBgQppTLm58D96HgzUyi6O', '802-648-9804', 'alf37@rau.com', '27101 Tomasa Bridge Apt. 861\nNew Javonburgh, LA 38584-3614', 600, 2, '2024-03-10 15:26:29', NULL),
(14, 'Kraig', 'Vandervort', 'ktillman', '$2y$12$N1e5V6X0Mid/.aqiK4HYw.epIyxvjayl51C9UFJMM8UlR9DE.vkb2', '+1.915.405.3296', 'leilani58@witting.biz', '5799 Maryam Manor\nNorth Guiseppe, NY 66363-2906', 629, 2, '2024-03-10 15:26:30', NULL),
(15, 'Nicole', 'Lemke', 'mustafa34', '$2y$12$THCulZPoRk19CJJm6ZXWP.rrTzCWNadKoqVRIGeAztT2b/sW7I/TW', '(978) 993-0950', 'cbrakus@gmail.com', '44997 Ziemann Mountains Apt. 461\nWest Noratown, MO 97507', 383, 2, '2024-03-10 15:26:30', '2024-03-10 16:55:55'),
(16, 'Mathew', 'Labadie', 'brown57', '$2y$12$0/Jsy1dKJf1ispPbMFGuZe5HNFi4vriRhSN2kZi5Vq.YDqSstrJ6S', '+16817794872', 'ehoppe@cremin.net', '332 O\'Hara Ford\nLake Stephanie, AZ 50550', 338, 2, '2024-03-10 15:26:30', NULL),
(17, 'Sigmund', 'Champlin', 'esther.lockman', '$2y$12$C88MOfhKqZkNA4ghH.Vmced5nzxyYAt2gFPu074puICgkqTncB0La', '1-934-609-0218', 'ariel.carter@hotmail.com', '39262 Drew Extension\nSouth Sylviafurt, OK 51547-6286', 848, 2, '2024-03-10 15:26:30', '2024-03-10 16:55:55'),
(18, 'D\'angelo', 'Wyman', 'weissnat.zaria', '$2y$12$m2zD8AVUJBLTMefqGeuxLeBaYN/G3Q4Va6WR2UWSKUtQDlp3s5Blq', '878-623-5636', 'may51@koepp.info', '220 Ottilie Fields Apt. 887\nSpinkastad, OH 42800-4201', 805, 2, '2024-03-10 15:26:30', '2024-03-10 16:55:55'),
(19, 'Lera', 'Predovic', 'shanel03', '$2y$12$yZQnd0oc3biGMIFoehERv.x9PC.9GPtuSoZ.6jA1/WVAfmTt0E82.', '1-918-318-7437', 'wunsch.eleanora@gmail.com', '86220 Mills Square\nNorth Jaren, MD 21609', 268, 2, '2024-03-10 15:26:31', NULL),
(20, 'Jena', 'Hodkiewicz', 'tavares38', '$2y$12$z7i1LKjrLuLzYjvwG6an0uX8pSwlL8zTzaJWNK7ceS6tG5HT9cSN6', '+1.907.535.6503', 'kozey.vergie@greenfelder.com', '109 Robel Field Suite 298\nLake Keeleymouth, NY 50322', 868, 2, '2024-03-10 15:26:31', NULL),
(21, 'Estefania', 'Nikolaus', 'mustafa.bogisich', '$2y$12$AJhErtiT1qfDq2sbsL0HSeJiEJHuFKOyClytc1BA6FFNyFDuuLGOu', '(954) 947-6903', 'crona.chauncey@crooks.com', '217 Sister Field\nBergeside, VA 80992-6992', 598, 2, '2024-03-10 15:26:31', '2024-03-10 16:55:55'),
(22, 'Bill', 'Romaguera', 'fabiola24', '$2y$12$LMOhl0T40nor..S.IMQstOPiRw92yDv48ISlejIzJzIQg/l6SN5ee', '(951) 736-9065', 'yundt.destiney@leffler.biz', '39158 Gutmann Court\nPort Zeldafurt, HI 56515-0240', 703, 2, '2024-03-10 15:26:31', '2024-03-10 16:55:55'),
(23, 'Myrtle', 'Zulauf', 'beier.jaunita', '$2y$12$1yHKS0IkhM8n2GKMkE5uS.RnF6hVnLRTMN/2wphJGWAamwdOeuaf.', '(312) 554-7451', 'carolyn.sauer@christiansen.com', '4790 Kub Way Suite 314\nSwaniawskifurt, AZ 33403', 346, 2, '2024-03-10 15:26:32', NULL),
(24, 'Ernest', 'McClure', 'wfeest', '$2y$12$XDUQmm944y5cTy7g6VAPZexybSxiHm2LewSkzbfD5xLoWT.AbWcIi', '+1-332-308-8932', 'cummings.adriana@schowalter.info', '19559 Fernando Extensions Apt. 361\nNew Kennedytown, VT 40171-4102', 750, 2, '2024-03-10 15:26:32', NULL),
(25, 'Ariane', 'Waters', 'neil76', '$2y$12$Tra.N8yyCyW7o3fhiVpgQuqU3.T16jTmpLWy6FDKRuv8yXFwkjJRC', '878-761-4788', 'feeney.beverly@murray.com', '528 Francis Mountains Suite 537\nClaudialand, NY 90779-3510', 513, 2, '2024-03-10 15:26:32', NULL),
(26, 'Heber', 'Sauer', 'zruecker', '$2y$12$OCA5tcZUEIUspWkOun9/wuTJboejMHfr9LiGTyrcSh6JrSo3sF0nO', '+1 (541) 700-3248', 'wweimann@yahoo.com', '4427 Treutel Gardens Apt. 260\nNorth Malliemouth, SC 51172-8224', 509, 2, '2024-03-10 15:26:32', NULL),
(27, 'Gina', 'Fadel', 'heaney.marta', '$2y$12$xk71vvYXk2lVRIntSGGWI.MUpIhRjHJ/YAxdBfilCtgV619c2O3X2', '857.581.8422', 'sauer.aubree@gmail.com', '9695 Trudie Run Suite 535\nDaughertyville, IL 79676-1139', 619, 2, '2024-03-10 15:26:32', '2024-03-10 16:55:55'),
(28, 'Schuyler', 'Fadel', 'yesenia47', '$2y$12$KZgRGcWeIKfcU/41KROob.ozFzXPRRTYzVwl0esWCFyd5QfoClXuy', '1-681-855-0984', 'quigley.fletcher@hotmail.com', '837 David Corner Suite 616\nJessystad, WY 54641', 653, 2, '2024-03-10 15:26:33', '2024-03-10 16:55:55'),
(29, 'Santina', 'Konopelski', 'uvon', '$2y$12$r2dH.jViSiQYxPLoRAq0see2TowbFsLG1vee6Km6VFEZvg0in1OPK', '(662) 210-1373', 'trace.kertzmann@yahoo.com', '26922 Friesen Camp\nSouth Fernandoberg, CO 01350', 777, 2, '2024-03-10 15:26:33', '2024-03-10 16:55:55'),
(30, 'Misael', 'Ferry', 'kendall.bergstrom', '$2y$12$YLaDk9MLR2snTDzIzKkZMeo3oZbciJ.6hLDXj20VLLQT92oDjCdju', '+1 (419) 870-2208', 'fboyer@herman.info', '812 Sabrina Viaduct\nPort Edgardo, CT 33016-1352', 855, 2, '2024-03-10 15:26:33', '2024-03-10 16:55:55'),
(31, 'Nona', 'Feil', 'kfritsch', '$2y$12$gpZ28./wqhPbDWvzGPthdOsGDC/.7dzfamqQs3KUE4CSzrblkLKj2', '586-886-0928', 'kip.rowe@bradtke.com', '9841 Dax Burgs\nVernertown, MO 56267-8381', 771, 2, '2024-03-10 15:26:33', '2024-03-10 16:55:55'),
(32, 'Kellen', 'Steuber', 'dina24', '$2y$12$1/mSOotH6qm0lIFSKStjnuIltniga.x1zB7ePZWhiFukn6MJ9A30q', '(234) 689-5642', 'xrunolfsson@gmail.com', '360 Alvena Junctions\nMyriamfurt, TN 08192-0117', 156, 2, '2024-03-10 15:26:33', NULL),
(33, 'Summer', 'Homenick', 'esmeralda.collier', '$2y$12$fQixQfhW7JPkLS3v6Pr7pOSY.2ejsHwLUMgPRfJJThFWn3LdKQxR.', '+1-475-605-0546', 'ftromp@marquardt.org', '4703 Keshaun Centers\nGretchenville, GA 56962-5946', 263, 2, '2024-03-10 15:26:34', NULL),
(34, 'Zelda', 'Johns', 'admin', '$2y$12$YkAETKcjwiLmzJpHl2K9dOg8fUhLRT0aEw4516u6XronkDWzp/HJW', '(973) 396-2190', 'admin@gmail.com', '97034 Ferne Rapids\nEast Raegan, WV 25186', 17, 1, '2024-03-10 15:26:34', '2024-03-10 15:30:26'),
(35, 'Kiera', 'Hilpert', 'user', '$2y$12$HbOkgXa6bc5ZOxTk1NQog.fO8sOqxcYNdKQovaS/.8k4AWqJoNW1m', '+1 (878) 713-3354', 'user@gmail.com', '60080 Homenick Bridge Suite 182\nNorth Irma, TN 39183', 123, 2, '2024-03-10 15:26:34', '2024-03-10 15:31:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `card_informations`
--
ALTER TABLE `card_informations`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `card_informations_id_user_index` (`id_user`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id_city`),
  ADD KEY `cities_id_country_index` (`id_country`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id_country`),
  ADD UNIQUE KEY `countries_country_name_unique` (`country_name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id_image`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `items_price_type_index` (`price_type`),
  ADD KEY `items_item_state_index` (`item_state`),
  ADD KEY `items_id_user_index` (`id_user`),
  ADD KEY `items_id_category_index` (`id_category`);

--
-- Indexes for table `item_states`
--
ALTER TABLE `item_states`
  ADD PRIMARY KEY (`id_item_state`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `price_types`
--
ALTER TABLE `price_types`
  ADD PRIMARY KEY (`id_type`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `sales_price_type_index` (`price_type`),
  ADD KEY `sales_item_state_index` (`item_state`),
  ADD KEY `sales_id_user_index` (`id_user`),
  ADD KEY `sales_id_category_index` (`id_category`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id_transaction`),
  ADD KEY `transactions_id_item_index` (`id_item`),
  ADD KEY `transactions_id_buyer_index` (`id_buyer`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_phone_number_unique` (`phone_number`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_id_city_index` (`id_city`),
  ADD KEY `users_id_role_index` (`id_role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `card_informations`
--
ALTER TABLE `card_informations`
  MODIFY `id_user` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id_category` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id_city` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=901;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id_country` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id_image` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id_item` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `item_states`
--
ALTER TABLE `item_states`
  MODIFY `id_item_state` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `price_types`
--
ALTER TABLE `price_types`
  MODIFY `id_type` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id_role` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id_transaction` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `card_informations`
--
ALTER TABLE `card_informations`
  ADD CONSTRAINT `card_informations_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_id_country_foreign` FOREIGN KEY (`id_country`) REFERENCES `countries` (`id_country`);

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_id_category_foreign` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`),
  ADD CONSTRAINT `items_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE,
  ADD CONSTRAINT `items_item_state_foreign` FOREIGN KEY (`item_state`) REFERENCES `item_states` (`id_item_state`),
  ADD CONSTRAINT `items_price_type_foreign` FOREIGN KEY (`price_type`) REFERENCES `price_types` (`id_type`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_id_category_foreign` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_category`),
  ADD CONSTRAINT `sales_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_item_state_foreign` FOREIGN KEY (`item_state`) REFERENCES `item_states` (`id_item_state`),
  ADD CONSTRAINT `sales_price_type_foreign` FOREIGN KEY (`price_type`) REFERENCES `price_types` (`id_type`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_id_buyer_foreign` FOREIGN KEY (`id_buyer`) REFERENCES `users` (`id_user`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_id_item_foreign` FOREIGN KEY (`id_item`) REFERENCES `sales` (`id_item`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_city_foreign` FOREIGN KEY (`id_city`) REFERENCES `cities` (`id_city`),
  ADD CONSTRAINT `users_id_role_foreign` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id_role`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
