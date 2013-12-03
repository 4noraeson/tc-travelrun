-- phpMyAdmin SQL Dump
-- version 2.11.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 02, 2013 at 05:29 AM
-- Server version: 5.1.57
-- PHP Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: '<dbname>'
--

-- --------------------------------------------------------

--
-- Table structure for table 'country'
--

CREATE TABLE country (
  countryid int(11) NOT NULL,
  countryname varchar(100) COLLATE latin1_general_ci NOT NULL,
  letter char(1) COLLATE latin1_general_ci NOT NULL,
  flower int(11) NOT NULL,
  PRIMARY KEY (countryid),
  UNIQUE KEY letter (letter)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table 'country'
--

INSERT INTO country VALUES(1, 'Mexico', 'm', 260);
INSERT INTO country VALUES(2, 'Cayman Islands', 'i', 617);
INSERT INTO country VALUES(3, 'Canada', 'c', 263);
INSERT INTO country VALUES(4, 'Hawaii', 'h', 264);
INSERT INTO country VALUES(5, 'United Kingdom', 'u', 267);
INSERT INTO country VALUES(6, 'Argentina', 'a', 271);
INSERT INTO country VALUES(7, 'Switzerland', 's', 272);
INSERT INTO country VALUES(8, 'Japan', 'j', 277);
INSERT INTO country VALUES(9, 'China', 'x', 276);
INSERT INTO country VALUES(10, 'UAE', 'e', 385);
INSERT INTO country VALUES(11, 'South Africa', 'z', 282);

-- --------------------------------------------------------

--
-- Table structure for table 'counts'
--

CREATE TABLE counts (
  vkey varchar(12) COLLATE latin1_general_ci NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (vkey)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table 'counts'
--

INSERT INTO counts VALUES('m', 10517);
INSERT INTO counts VALUES('update2', 3756);
INSERT INTO counts VALUES('i', 4807);
INSERT INTO counts VALUES('c', 5306);
INSERT INTO counts VALUES('h', 4514);
INSERT INTO counts VALUES('u', 4082);
INSERT INTO counts VALUES('s', 1686);
INSERT INTO counts VALUES('a', 4106);
INSERT INTO counts VALUES('j', 3375);
INSERT INTO counts VALUES('x', 3083);
INSERT INTO counts VALUES('e', 2815);
INSERT INTO counts VALUES('z', 2479);

-- --------------------------------------------------------

--
-- Table structure for table 'item'
--

CREATE TABLE item (
  itemid int(11) NOT NULL,
  itemtype int(11) NOT NULL,
  itemname varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (itemid),
  KEY itemtype (itemtype)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table 'item'
--

INSERT INTO item VALUES(260, 1, 'Dahlia');
INSERT INTO item VALUES(617, 1, 'Banana Orchid');
INSERT INTO item VALUES(263, 1, 'Crocus');
INSERT INTO item VALUES(264, 1, 'Orchid');
INSERT INTO item VALUES(267, 1, 'Heather');
INSERT INTO item VALUES(271, 1, 'Ceibo Flower');
INSERT INTO item VALUES(272, 1, 'Edelweiss');
INSERT INTO item VALUES(277, 1, 'Cherry Blossom');
INSERT INTO item VALUES(276, 1, 'Peony');
INSERT INTO item VALUES(385, 1, 'Tribulus Omanense');
INSERT INTO item VALUES(282, 1, 'African Violet');
INSERT INTO item VALUES(17, 5, 'Beretta 92FS');
INSERT INTO item VALUES(146, 6, 'Yasukuni Sword');
INSERT INTO item VALUES(251, 6, 'Wushu Double Axes');
INSERT INTO item VALUES(235, 6, 'Wooden Nunchucks');
INSERT INTO item VALUES(170, 6, 'Wand of Destruction');
INSERT INTO item VALUES(250, 6, 'Twin Tiger Hooks');
INSERT INTO item VALUES(175, 6, 'Taser');
INSERT INTO item VALUES(224, 6, 'Swiss Army Knife');
INSERT INTO item VALUES(227, 6, 'Spear');
INSERT INTO item VALUES(9, 6, 'Scimitar');
INSERT INTO item VALUES(11, 6, 'Samurai Sword');
INSERT INTO item VALUES(238, 6, 'Sai');
INSERT INTO item VALUES(147, 6, 'Rusty Sword');
INSERT INTO item VALUES(440, 6, 'Pillow');
INSERT INTO item VALUES(632, 6, 'Petrified Humerus');
INSERT INTO item VALUES(5, 6, 'Pen Knife');
INSERT INTO item VALUES(604, 6, 'Pair of Ice Skates');
INSERT INTO item VALUES(346, 6, 'Pair of High Heels');
INSERT INTO item VALUES(395, 6, 'Nunchakas');
INSERT INTO item VALUES(111, 6, 'Ninja Claws');
INSERT INTO item VALUES(615, 6, 'Naval Cutlass Sword');
INSERT INTO item VALUES(397, 6, 'Mace');
INSERT INTO item VALUES(391, 6, 'Macana');
INSERT INTO item VALUES(110, 6, 'Leather Bull Whip');
INSERT INTO item VALUES(401, 6, 'Lead Pipe');
INSERT INTO item VALUES(237, 6, 'Kodachi Swords');
INSERT INTO item VALUES(4, 6, 'Knuckle Dusters');
INSERT INTO item VALUES(6, 6, 'Kitchen Knife');
INSERT INTO item VALUES(247, 6, 'Katana');
INSERT INTO item VALUES(236, 6, 'Kama');
INSERT INTO item VALUES(360, 6, 'Ivory Walking Cane');
INSERT INTO item VALUES(402, 6, 'Ice Pick');
INSERT INTO item VALUES(387, 6, 'Handbag');
INSERT INTO item VALUES(1, 6, 'Hammer');
INSERT INTO item VALUES(400, 6, 'Guandao');
INSERT INTO item VALUES(599, 6, 'Golden Broomstick');
INSERT INTO item VALUES(439, 6, 'Frying Pan');
INSERT INTO item VALUES(560, 6, 'Fruitcake');
INSERT INTO item VALUES(359, 6, 'Fine Chisel');
INSERT INTO item VALUES(291, 6, 'Dual Scimitars');
INSERT INTO item VALUES(292, 6, 'Dual Samurai Swords');
INSERT INTO item VALUES(290, 6, 'Dual Hammers');
INSERT INTO item VALUES(289, 6, 'Dual Axes');
INSERT INTO item VALUES(605, 6, 'Diamond Icicle');
INSERT INTO item VALUES(614, 6, 'Diamond Bladed Knife');
INSERT INTO item VALUES(600, 6, 'Devils Pitchfork');
INSERT INTO item VALUES(7, 6, 'Dagger');
INSERT INTO item VALUES(3, 6, 'Crow Bar');
INSERT INTO item VALUES(438, 6, 'Cricket Bat');
INSERT INTO item VALUES(217, 6, 'Claymore Sword');
INSERT INTO item VALUES(10, 6, 'Chainsaw');
INSERT INTO item VALUES(234, 6, 'Chain Whip');
INSERT INTO item VALUES(173, 6, 'Butterfly Knife');
INSERT INTO item VALUES(245, 6, 'Bo Staff');
INSERT INTO item VALUES(539, 6, 'Blood Spattered Sickle');
INSERT INTO item VALUES(2, 6, 'Baseball Bat');
INSERT INTO item VALUES(8, 6, 'Axe');
INSERT INTO item VALUES(184, 1, 'Bunch of Black Roses');
INSERT INTO item VALUES(97, 1, 'Bunch of Flowers');
INSERT INTO item VALUES(129, 1, 'Dozen Roses');
INSERT INTO item VALUES(435, 1, 'Dozen White Roses');
INSERT INTO item VALUES(183, 1, 'Single Red Rose');
INSERT INTO item VALUES(244, 5, 'Blowgun');
INSERT INTO item VALUES(490, 5, 'Blunderbuss');
INSERT INTO item VALUES(233, 5, 'BT MP9');
INSERT INTO item VALUES(177, 5, 'Cobra Derringer');
INSERT INTO item VALUES(218, 5, 'Crossbow');
INSERT INTO item VALUES(20, 5, 'Desert Eagle');
INSERT INTO item VALUES(21, 5, 'Dual 96G Berettas');
INSERT INTO item VALUES(246, 5, 'Fireworks');
INSERT INTO item VALUES(18, 5, 'Fiveseven');
INSERT INTO item VALUES(255, 5, 'Flame Thrower');
INSERT INTO item VALUES(230, 5, 'Flare Gun');
INSERT INTO item VALUES(12, 5, 'Glock 18');
INSERT INTO item VALUES(613, 5, 'Harpoon');
INSERT INTO item VALUES(253, 5, 'Lorcin 380');
INSERT INTO item VALUES(489, 5, 'Luger');
INSERT INTO item VALUES(15, 5, 'M-9');
INSERT INTO item VALUES(19, 5, 'Magnum');
INSERT INTO item VALUES(248, 5, 'Qsz-92');
INSERT INTO item VALUES(13, 5, 'Raven MP25');
INSERT INTO item VALUES(109, 5, 'RPG Launcher');
INSERT INTO item VALUES(14, 5, 'Ruger 22/45');
INSERT INTO item VALUES(254, 5, 'S&W M29');
INSERT INTO item VALUES(189, 5, 'S&W Revolver');
INSERT INTO item VALUES(393, 5, 'Slingshot');
INSERT INTO item VALUES(99, 5, 'Springfield 1911-A1');
INSERT INTO item VALUES(243, 5, 'Taurus');
INSERT INTO item VALUES(16, 5, 'USP');
INSERT INTO item VALUES(108, 4, '9mm Uzi');
INSERT INTO item VALUES(26, 4, 'AK-47');
INSERT INTO item VALUES(484, 4, 'AK74u');
INSERT INTO item VALUES(240, 4, 'Anti Tank');
INSERT INTO item VALUES(399, 4, 'ArmaLite M-15A4 Rifle');
INSERT INTO item VALUES(23, 4, 'Benelli M1 Tactical');
INSERT INTO item VALUES(28, 4, 'Benelli M4 Super');
INSERT INTO item VALUES(241, 4, 'Bushmaster Carbon 15 Type 21s');
INSERT INTO item VALUES(546, 4, 'Dual Bushmasters');
INSERT INTO item VALUES(547, 4, 'Dual MP5s');
INSERT INTO item VALUES(548, 4, 'Dual P90s');
INSERT INTO item VALUES(545, 4, 'Dual TMPs');
INSERT INTO item VALUES(549, 4, 'Dual Uzis');
INSERT INTO item VALUES(100, 4, 'Egg Propelled Launcher');
INSERT INTO item VALUES(219, 4, 'Enfield SA-80');
INSERT INTO item VALUES(382, 4, 'Gold Plated AK-47');
INSERT INTO item VALUES(231, 4, 'Heckler & Koch SL8');
INSERT INTO item VALUES(252, 4, 'Ithaca 37');
INSERT INTO item VALUES(223, 4, 'Jackhammer');
INSERT INTO item VALUES(29, 4, 'M16 A2 Rifle');
INSERT INTO item VALUES(31, 4, 'M249 PARA LMG');
INSERT INTO item VALUES(27, 4, 'M4A1 Colt Carbine');
INSERT INTO item VALUES(225, 4, 'Mag 7');
INSERT INTO item VALUES(63, 4, 'Minigun');
INSERT INTO item VALUES(488, 4, 'MP 40');
INSERT INTO item VALUES(24, 4, 'MP5 Navy');
INSERT INTO item VALUES(483, 4, 'MP5k');
INSERT INTO item VALUES(98, 4, 'Neutrilux 2000');
INSERT INTO item VALUES(25, 4, 'P90');
INSERT INTO item VALUES(388, 4, 'Pink Mac-10');
INSERT INTO item VALUES(22, 4, 'Sawed-Off Shotgun');
INSERT INTO item VALUES(232, 4, 'Sig 550');
INSERT INTO item VALUES(485, 4, 'Skorpian');
INSERT INTO item VALUES(249, 4, 'Sks Carbine');
INSERT INTO item VALUES(76, 4, 'Snow Cannon');
INSERT INTO item VALUES(30, 4, 'Steyr AUG');
INSERT INTO item VALUES(398, 4, 'Swiss Army SG 550');
INSERT INTO item VALUES(612, 4, 'Tavor TAR-21');
INSERT INTO item VALUES(487, 4, 'Thompson');
INSERT INTO item VALUES(486, 4, 'TMP');
INSERT INTO item VALUES(228, 4, 'Vektor CR-21');
INSERT INTO item VALUES(174, 4, 'XM8 Rifle');
INSERT INTO item VALUES(624, 8, 'Bikini');
INSERT INTO item VALUES(34, 8, 'Bulletproof Vest');
INSERT INTO item VALUES(101, 8, 'Bunny Fur');
INSERT INTO item VALUES(176, 8, 'Chain Mail');
INSERT INTO item VALUES(430, 8, 'Coconut Bra');
INSERT INTO item VALUES(178, 8, 'Flak Jacket');
INSERT INTO item VALUES(334, 8, 'Flexible Body Armour');
INSERT INTO item VALUES(49, 8, 'Full Body Armour');
INSERT INTO item VALUES(348, 8, 'Hazmat Suit');
INSERT INTO item VALUES(332, 8, 'Improved Interceptor Vest');
INSERT INTO item VALUES(107, 8, 'Kevlar Trench Coat');
INSERT INTO item VALUES(32, 8, 'Leather Vest');
INSERT INTO item VALUES(333, 8, 'Liquid Body Armour');
INSERT INTO item VALUES(50, 8, 'Outer Tactical Vest');
INSERT INTO item VALUES(33, 8, 'Riot Gear');
INSERT INTO item VALUES(609, 8, 'Santa Jacket');
INSERT INTO item VALUES(538, 8, 'Silver Armour');
INSERT INTO item VALUES(623, 8, 'Speedo');
INSERT INTO item VALUES(562, 8, 'Sweater');
INSERT INTO item VALUES(592, 8, 'Undefined 4');
INSERT INTO item VALUES(625, 8, 'Wetsuit');
INSERT INTO item VALUES(67, 14, 'First Aid Kit');
INSERT INTO item VALUES(66, 14, 'Morphine');
INSERT INTO item VALUES(361, 14, 'Neumune Tablet');
INSERT INTO item VALUES(68, 14, 'Small First Aid Kit');
INSERT INTO item VALUES(196, 3, 'Cannabis');
INSERT INTO item VALUES(197, 3, 'Ecstasy');
INSERT INTO item VALUES(198, 3, 'Ketamine');
INSERT INTO item VALUES(199, 3, 'LSD');
INSERT INTO item VALUES(200, 3, 'Opium');
INSERT INTO item VALUES(201, 3, 'PCP');
INSERT INTO item VALUES(203, 3, 'Shrooms');
INSERT INTO item VALUES(204, 3, 'Speed');
INSERT INTO item VALUES(205, 3, 'Vicodin');
INSERT INTO item VALUES(206, 3, 'Xanax');
INSERT INTO item VALUES(581, 7, 'Book');
INSERT INTO item VALUES(394, 7, 'Brick');
INSERT INTO item VALUES(229, 7, 'Claymore Mine');
INSERT INTO item VALUES(463, 7, 'Epinephrine');
INSERT INTO item VALUES(222, 7, 'Flash Grenade');
INSERT INTO item VALUES(220, 7, 'Grenade');
INSERT INTO item VALUES(242, 7, 'HEG');
INSERT INTO item VALUES(464, 7, 'Melatonin');
INSERT INTO item VALUES(239, 7, 'Ninja Stars');
INSERT INTO item VALUES(392, 7, 'Pepper Spray');
INSERT INTO item VALUES(465, 7, 'Serotonin');
INSERT INTO item VALUES(226, 7, 'Smoke Grenade');
INSERT INTO item VALUES(611, 7, 'Snowball');
INSERT INTO item VALUES(221, 7, 'Stick Grenade');
INSERT INTO item VALUES(256, 7, 'Tear Gas');
INSERT INTO item VALUES(257, 7, 'Throwing Knife');
INSERT INTO item VALUES(616, 7, 'Trout');
INSERT INTO item VALUES(570, 16, 'Advanced Driving Tactics');
INSERT INTO item VALUES(569, 16, 'Balaclava');
INSERT INTO item VALUES(576, 16, 'Chloroform');
INSERT INTO item VALUES(567, 16, 'Cut-Throat Razor');
INSERT INTO item VALUES(578, 16, 'Duct Tape');
INSERT INTO item VALUES(571, 16, 'Ergonomic Keyboard');
INSERT INTO item VALUES(574, 16, 'Fanny Pack');
INSERT INTO item VALUES(577, 16, 'Heavy Duty Padlock');
INSERT INTO item VALUES(565, 16, 'High-Speed DVD Drive');
INSERT INTO item VALUES(421, 16, 'Large Suitcase');
INSERT INTO item VALUES(420, 16, 'Medium Suitcase');
INSERT INTO item VALUES(566, 16, 'Mountain Bike');
INSERT INTO item VALUES(564, 16, 'Pair of Glasses');
INSERT INTO item VALUES(573, 16, 'Screwdriver');
INSERT INTO item VALUES(568, 16, 'Slim Crowbar');
INSERT INTO item VALUES(419, 16, 'Small Suitcase');
INSERT INTO item VALUES(386, 16, 'Sports Sneakers');
INSERT INTO item VALUES(572, 16, 'Tracking Device');
INSERT INTO item VALUES(575, 16, 'Tumble Dryer');
INSERT INTO item VALUES(544, 16, 'Wind Proof Lighter');
INSERT INTO item VALUES(579, 16, 'Wireless Dongle');
INSERT INTO item VALUES(530, 18, 'Can of Munster');
INSERT INTO item VALUES(532, 18, 'Can of Red Cow');
INSERT INTO item VALUES(554, 18, 'Can of Rockstar Rudolph');
INSERT INTO item VALUES(553, 18, 'Can of Santa Shooters');
INSERT INTO item VALUES(533, 18, 'Can of Tourine Elite');
INSERT INTO item VALUES(555, 18, 'Can of X-MASS');
INSERT INTO item VALUES(180, 12, 'Bottle of Beer');
INSERT INTO item VALUES(181, 12, 'Bottle of Champagne');
INSERT INTO item VALUES(638, 12, 'Bottle of Christmas Cocktail');
INSERT INTO item VALUES(550, 12, 'Bottle of Kandy Kane');
INSERT INTO item VALUES(551, 12, 'Bottle of Minty Mayhem');
INSERT INTO item VALUES(552, 12, 'Bottle of Mistletoe Madness');
INSERT INTO item VALUES(531, 12, 'Bottle of Pumpkin Brew');
INSERT INTO item VALUES(294, 12, 'Bottle of Sake');
INSERT INTO item VALUES(541, 12, 'Bottle of Stinky Swamp Punch');
INSERT INTO item VALUES(426, 12, 'Bottle of Tequila');
INSERT INTO item VALUES(542, 12, 'Bottle of Wicked Witch');
INSERT INTO item VALUES(634, 9, 'Bag of Bloody Eyeballs');
INSERT INTO item VALUES(37, 9, 'Bag of Bon Bons');
INSERT INTO item VALUES(527, 9, 'Bag of Candy Kisses');
INSERT INTO item VALUES(210, 9, 'Bag of Chocolate Kisses');
INSERT INTO item VALUES(529, 9, 'Bag of Chocolate Truffles');
INSERT INTO item VALUES(556, 9, 'Bag of Reindeer Droppings');
INSERT INTO item VALUES(587, 9, 'Bag of Sherbet');
INSERT INTO item VALUES(528, 9, 'Bag of Tootsie Rolls');
INSERT INTO item VALUES(36, 9, 'Big Box of Chocolate Bars');
INSERT INTO item VALUES(477, 9, 'Black Easter Egg');
INSERT INTO item VALUES(472, 9, 'Blue Easter Egg');
INSERT INTO item VALUES(38, 9, 'Box of Bon Bons');
INSERT INTO item VALUES(35, 9, 'Box of Chocolate Bars');
INSERT INTO item VALUES(39, 9, 'Box of Extra Strong Mints');
INSERT INTO item VALUES(209, 9, 'Box of Sweet Hearts');
INSERT INTO item VALUES(583, 9, 'Brown Easter Egg');
INSERT INTO item VALUES(478, 9, 'Gold Easter Egg');
INSERT INTO item VALUES(473, 9, 'Green Easter Egg');
INSERT INTO item VALUES(586, 9, 'Jawbreaker');
INSERT INTO item VALUES(310, 9, 'Lollipop');
INSERT INTO item VALUES(584, 9, 'Orange Easter Egg');
INSERT INTO item VALUES(585, 9, 'Pink Easter Egg');
INSERT INTO item VALUES(151, 9, 'Pixie Sticks');
INSERT INTO item VALUES(474, 9, 'Red Easter Egg');
INSERT INTO item VALUES(476, 9, 'White Easter Egg');
INSERT INTO item VALUES(475, 9, 'Yellow Easter Egg');
INSERT INTO item VALUES(561, 11, 'Book of Carols');
INSERT INTO item VALUES(330, 11, 'Boxing Gloves');
INSERT INTO item VALUES(331, 11, 'Dumbbells');
INSERT INTO item VALUES(366, 11, 'Erotic DVD');
INSERT INTO item VALUES(367, 11, 'Feathery Hotel Coupon');
INSERT INTO item VALUES(563, 11, 'Gift Card');
INSERT INTO item VALUES(106, 11, 'Parachute');
INSERT INTO item VALUES(329, 11, 'Skateboard');
INSERT INTO item VALUES(65, 15, 'Big TV Screen');
INSERT INTO item VALUES(43, 15, 'CD Player');
INSERT INTO item VALUES(41, 15, 'DVD Player');
INSERT INTO item VALUES(381, 15, 'Gold Laptop');
INSERT INTO item VALUES(45, 15, 'Hard Drive');
INSERT INTO item VALUES(154, 15, 'Laptop');
INSERT INTO item VALUES(62, 15, 'Microwave');
INSERT INTO item VALUES(42, 15, 'MP3 Player');
INSERT INTO item VALUES(44, 15, 'Pack of Blank CDs');
INSERT INTO item VALUES(40, 15, 'Pack of Music CDs');
INSERT INTO item VALUES(61, 15, 'Personal Computer');
INSERT INTO item VALUES(383, 15, 'Platinum PDA');
INSERT INTO item VALUES(104, 15, 'Playstation');
INSERT INTO item VALUES(417, 15, 'RS232 Cable');
INSERT INTO item VALUES(105, 15, 'Xbox');
INSERT INTO item VALUES(145, 15, 'Xbox 360');
INSERT INTO item VALUES(404, 10, 'Bandana');
INSERT INTO item VALUES(48, 10, 'Jacket');
INSERT INTO item VALUES(47, 10, 'Pair of Trainers');
INSERT INTO item VALUES(46, 10, 'Tank Top');
INSERT INTO item VALUES(54, 13, 'Diamond Ring');
INSERT INTO item VALUES(57, 13, 'Gold Necklace');
INSERT INTO item VALUES(53, 13, 'Gold Ring');
INSERT INTO item VALUES(60, 13, 'Gold Watch');
INSERT INTO item VALUES(55, 13, 'Pearl Necklace');
INSERT INTO item VALUES(51, 13, 'Plain Silver Ring');
INSERT INTO item VALUES(58, 13, 'Plastic Watch');
INSERT INTO item VALUES(52, 13, 'Sapphire Ring');
INSERT INTO item VALUES(56, 13, 'Silver Necklace');
INSERT INTO item VALUES(59, 13, 'Stainless Steel Watch');
INSERT INTO item VALUES(502, 19, 'Alfa Romeo 156');
INSERT INTO item VALUES(517, 19, 'Aston Martin One-77');
INSERT INTO item VALUES(518, 19, 'Audi R8');
INSERT INTO item VALUES(507, 19, 'Audi S3');
INSERT INTO item VALUES(87, 19, 'Audi S4');
INSERT INTO item VALUES(79, 19, 'Audi TT Quattro');
INSERT INTO item VALUES(80, 19, 'BMW M5');
INSERT INTO item VALUES(503, 19, 'BMW X5');
INSERT INTO item VALUES(81, 19, 'BMW Z8');
INSERT INTO item VALUES(519, 19, 'Bugatti Veyron');
INSERT INTO item VALUES(92, 19, 'Chevrolet Cavalier');
INSERT INTO item VALUES(82, 19, 'Chevrolet Corvette Z06');
INSERT INTO item VALUES(494, 19, 'Citroen Saxo');
INSERT INTO item VALUES(495, 19, 'Classic Mini');
INSERT INTO item VALUES(83, 19, 'Dodge Charger');
INSERT INTO item VALUES(520, 19, 'Ferrari 458');
INSERT INTO item VALUES(496, 19, 'Fiat Punto');
INSERT INTO item VALUES(84, 19, 'Firebird');
INSERT INTO item VALUES(511, 19, 'Ford Cosworth');
INSERT INTO item VALUES(508, 19, 'Ford Focus RS');
INSERT INTO item VALUES(85, 19, 'Ford GT40');
INSERT INTO item VALUES(93, 19, 'Ford Mustang');
INSERT INTO item VALUES(95, 19, 'Holden SS');
INSERT INTO item VALUES(89, 19, 'Honda Accord');
INSERT INTO item VALUES(90, 19, 'Honda Civic');
INSERT INTO item VALUES(88, 19, 'Honda Integra R');
INSERT INTO item VALUES(78, 19, 'Honda NSX');
INSERT INTO item VALUES(509, 19, 'Honda S2000');
INSERT INTO item VALUES(86, 19, 'Hummer H3');
INSERT INTO item VALUES(521, 19, 'Lamborghini Gallardo');
INSERT INTO item VALUES(522, 19, 'Lexus LFA');
INSERT INTO item VALUES(512, 19, 'Lotus Exige');
INSERT INTO item VALUES(523, 19, 'Mercedes SLR');
INSERT INTO item VALUES(510, 19, 'Mini Cooper S');
INSERT INTO item VALUES(513, 19, 'Mitsubishi Evo X');
INSERT INTO item VALUES(524, 19, 'Nissan GT-R');
INSERT INTO item VALUES(497, 19, 'Nissan Micra');
INSERT INTO item VALUES(498, 19, 'Peugeot 106');
INSERT INTO item VALUES(514, 19, 'Porsche 911 GT3');
INSERT INTO item VALUES(94, 19, 'Reliant Robin');
INSERT INTO item VALUES(499, 19, 'Renault Clio');
INSERT INTO item VALUES(504, 19, 'Seat Leon Cupra');
INSERT INTO item VALUES(515, 19, 'Subaru Impreza STI');
INSERT INTO item VALUES(77, 19, 'Toyota MR2');
INSERT INTO item VALUES(516, 19, 'TVR Sagaris');
INSERT INTO item VALUES(505, 19, 'Vauxhall Astra GSI');
INSERT INTO item VALUES(500, 19, 'Vauxhall Corsa');
INSERT INTO item VALUES(91, 19, 'Volkswagen Beetle');
INSERT INTO item VALUES(506, 19, 'Volkswagen Golf GTI');
INSERT INTO item VALUES(501, 19, 'Volvo 850');
INSERT INTO item VALUES(72, 20, 'Armored Virus');
INSERT INTO item VALUES(103, 20, 'Firewalk Virus');
INSERT INTO item VALUES(70, 20, 'Polymorphic Virus');
INSERT INTO item VALUES(69, 20, 'Simple Virus');
INSERT INTO item VALUES(73, 20, 'Stealth Virus');
INSERT INTO item VALUES(71, 20, 'Tunnelling Virus');
INSERT INTO item VALUES(461, 21, 'Black Senet Pawn');
INSERT INTO item VALUES(459, 21, 'Egyptian Amulet');
INSERT INTO item VALUES(451, 21, 'Florin Coin');
INSERT INTO item VALUES(453, 21, 'Ganesha Sculpture');
INSERT INTO item VALUES(452, 21, 'Gold Noble Coin');
INSERT INTO item VALUES(450, 21, 'Leopard Coin');
INSERT INTO item VALUES(457, 21, 'Script from the Quran: Ali');
INSERT INTO item VALUES(455, 21, 'Script from the Quran: Ibn Masud');
INSERT INTO item VALUES(456, 21, 'Script from the Quran: Ubay Ibn Kab');
INSERT INTO item VALUES(462, 21, 'Senet Board');
INSERT INTO item VALUES(458, 21, 'Shabti Sculpture');
INSERT INTO item VALUES(454, 21, 'Vairocana Buddha Sculpture');
INSERT INTO item VALUES(460, 21, 'White Senet Pawn');
INSERT INTO item VALUES(384, 2, 'Camel Plushie');
INSERT INTO item VALUES(273, 2, 'Chamois Plushie');
INSERT INTO item VALUES(258, 2, 'Jaguar Plushie');
INSERT INTO item VALUES(215, 2, 'Kitten Plushie');
INSERT INTO item VALUES(281, 2, 'Lion Plushie');
INSERT INTO item VALUES(269, 2, 'Monkey Plushie');
INSERT INTO item VALUES(266, 2, 'Nessie Plushie');
INSERT INTO item VALUES(274, 2, 'Panda Plushie');
INSERT INTO item VALUES(268, 2, 'Red Fox Plushie');
INSERT INTO item VALUES(186, 2, 'Sheep Plushie');
INSERT INTO item VALUES(618, 2, 'Stingray Plushie');
INSERT INTO item VALUES(187, 2, 'Teddy Bear Plushie');
INSERT INTO item VALUES(261, 2, 'Wolverine Plushie');
INSERT INTO item VALUES(364, 22, 'Box of Grenades');
INSERT INTO item VALUES(365, 22, 'Box of Medical Supplies');
INSERT INTO item VALUES(283, 17, 'Donator Pack');
INSERT INTO item VALUES(370, 22, 'Drug Pack');
INSERT INTO item VALUES(588, 22, 'Goodie Bag');
INSERT INTO item VALUES(396, 17, 'Business Class Ticket');
INSERT INTO item VALUES(428, 17, 'Casino Pass');
INSERT INTO item VALUES(336, 17, 'Cesium-137');
INSERT INTO item VALUES(337, 17, 'Dirty Bomb');
INSERT INTO item VALUES(627, 17, 'Dog Poop');
INSERT INTO item VALUES(580, 17, 'Horses Head');
INSERT INTO item VALUES(368, 17, 'Lawyer Business Card');
INSERT INTO item VALUES(369, 17, 'Lottery Voucher');
INSERT INTO item VALUES(380, 17, 'Small Explosive Device');
INSERT INTO item VALUES(628, 17, 'Stink Bombs');
INSERT INTO item VALUES(629, 17, 'Toilet Paper');
INSERT INTO item VALUES(133, 23, '10 Ton Pacifier');
INSERT INTO item VALUES(471, 23, 'Admin Portrait 2009');
INSERT INTO item VALUES(351, 23, 'Amazon Doll');
INSERT INTO item VALUES(166, 23, 'Annoying Man');
INSERT INTO item VALUES(343, 23, 'Backstage Pass');
INSERT INTO item VALUES(353, 23, 'Bag of Cheetos');
INSERT INTO item VALUES(144, 23, 'Banana Phone');
INSERT INTO item VALUES(169, 23, 'Barbie Doll');
INSERT INTO item VALUES(352, 23, 'BBQ Smoker');
INSERT INTO item VALUES(692, 23, 'Bear Skin Rug');
INSERT INTO item VALUES(448, 23, 'Bl0ndies Dictionary');
INSERT INTO item VALUES(161, 23, 'Black Unicorn');
INSERT INTO item VALUES(442, 23, 'Blow-Up Doll');
INSERT INTO item VALUES(126, 23, 'Blue Dragon');
INSERT INTO item VALUES(302, 23, 'Blue Ornament');
INSERT INTO item VALUES(444, 23, 'Breadfan Doll');
INSERT INTO item VALUES(688, 23, 'Brewery Key');
INSERT INTO item VALUES(480, 23, 'Bronze Dog Tag');
INSERT INTO item VALUES(284, 23, 'Bronze Paint Brush');
INSERT INTO item VALUES(214, 23, 'Brutus Keychain');
INSERT INTO item VALUES(447, 23, 'Burmese Flag');
INSERT INTO item VALUES(153, 23, 'Case of Whiskey');
INSERT INTO item VALUES(445, 23, 'Chaos Man');
INSERT INTO item VALUES(344, 23, 'Chemis Magic Potion');
INSERT INTO item VALUES(127, 23, 'China Tea Set');
INSERT INTO item VALUES(165, 23, 'Chocobo Flute');
INSERT INTO item VALUES(102, 23, 'Chocolate Egg 2005');
INSERT INTO item VALUES(470, 23, 'Christmas Card 2009');
INSERT INTO item VALUES(75, 23, 'Christmas Cracker 2004');
INSERT INTO item VALUES(468, 23, 'Christmas Stocking 2009');
INSERT INTO item VALUES(355, 23, 'Citrus Squeezer');
INSERT INTO item VALUES(142, 23, 'Cookie Jar');
INSERT INTO item VALUES(313, 23, 'Cookie Launcher');
INSERT INTO item VALUES(188, 23, 'Cracked Crystal Ball');
INSERT INTO item VALUES(211, 23, 'Crazy Cow');
INSERT INTO item VALUES(150, 23, 'Crystal Carousel');
INSERT INTO item VALUES(314, 23, 'Cursed Moon Pendant');
INSERT INTO item VALUES(148, 23, 'Dance Toy');
INSERT INTO item VALUES(371, 23, 'Dark Doll');
INSERT INTO item VALUES(312, 23, 'Devil Toy');
INSERT INTO item VALUES(342, 23, 'Dollar Bill Collectible');
INSERT INTO item VALUES(213, 23, 'Dreamcatcher');
INSERT INTO item VALUES(350, 23, 'Dunkins Donut');
INSERT INTO item VALUES(687, 23, 'Egotistical Bear');
INSERT INTO item VALUES(123, 23, 'Elite Action Man');
INSERT INTO item VALUES(118, 23, 'Evil Doll');
INSERT INTO item VALUES(349, 23, 'Flea Collar');
INSERT INTO item VALUES(686, 23, 'Friendly Bot Guide');
INSERT INTO item VALUES(300, 23, 'Gibals Dragonfly');
INSERT INTO item VALUES(482, 23, 'Gold Dog Tag');
INSERT INTO item VALUES(286, 23, 'Gold Paint Brush');
INSERT INTO item VALUES(303, 23, 'Green Ornament');
INSERT INTO item VALUES(193, 23, 'Hamster Toy');
INSERT INTO item VALUES(134, 23, 'Horse');
INSERT INTO item VALUES(340, 23, 'Hunny Pot');
INSERT INTO item VALUES(449, 23, 'Hydroponic Grow Tent');
INSERT INTO item VALUES(152, 23, 'Ice Sculpture');
INSERT INTO item VALUES(299, 23, 'Jesters Cap');
INSERT INTO item VALUES(446, 23, 'Karate Man');
INSERT INTO item VALUES(357, 23, 'Kevlar Helmet');
INSERT INTO item VALUES(441, 23, 'Khinkeh P0rnStar Doll');
INSERT INTO item VALUES(212, 23, 'Legends Urn');
INSERT INTO item VALUES(131, 23, 'Lego Hurin');
INSERT INTO item VALUES(164, 23, 'Leukaemia TeddyBear');
INSERT INTO item VALUES(137, 23, 'Locked Teddy');
INSERT INTO item VALUES(149, 23, 'Lucky Dime');
INSERT INTO item VALUES(690, 23, 'Mafia Kit');
INSERT INTO item VALUES(311, 23, 'Mardi Gras Beads');
INSERT INTO item VALUES(479, 23, 'Metal Dog Tag');
INSERT INTO item VALUES(207, 23, 'Miss Torn 2007 Crown');
INSERT INTO item VALUES(363, 23, 'Miss Torn 2008 Crown');
INSERT INTO item VALUES(390, 23, 'Miss Torn 2009 Crown');
INSERT INTO item VALUES(526, 23, 'Miss Torn 2010 Crown');
INSERT INTO item VALUES(594, 23, 'Miss Torn 2011 Crown');
INSERT INTO item VALUES(631, 23, 'Miss Torn 2012 Crown');
INSERT INTO item VALUES(695, 23, 'Miss Torn 2013 Crown');
INSERT INTO item VALUES(298, 23, 'Monkey Cuffs');
INSERT INTO item VALUES(354, 23, 'Motorbike');
INSERT INTO item VALUES(122, 23, 'Mouser Doll');
INSERT INTO item VALUES(288, 23, 'Mr Brownstone Doll');
INSERT INTO item VALUES(202, 23, 'Mr Torn 2007 Crown');
INSERT INTO item VALUES(362, 23, 'Mr Torn 2008 Crown');
INSERT INTO item VALUES(389, 23, 'Mr Torn 2009 Crown');
INSERT INTO item VALUES(525, 23, 'Mr Torn 2010 Crown');
INSERT INTO item VALUES(593, 23, 'Mr Torn 2011 Crown');
INSERT INTO item VALUES(630, 23, 'Mr Torn 2012 Crown');
INSERT INTO item VALUES(694, 23, 'Mr Torn 2013 Crown');
INSERT INTO item VALUES(128, 23, 'Mufasa Toy');
INSERT INTO item VALUES(132, 23, 'Mystical Sphere');
INSERT INTO item VALUES(114, 23, 'Non-Anon Doll');
INSERT INTO item VALUES(691, 23, 'Octopus Toy');
INSERT INTO item VALUES(163, 23, 'Official Ninja Kit');
INSERT INTO item VALUES(287, 23, 'Pand0ras Box');
INSERT INTO item VALUES(157, 23, 'Patriot Whip');
INSERT INTO item VALUES(113, 23, 'Pet Rock');
INSERT INTO item VALUES(115, 23, 'Poker Doll');
INSERT INTO item VALUES(140, 23, 'Pouncer Doll');
INSERT INTO item VALUES(304, 23, 'Purple Bell');
INSERT INTO item VALUES(155, 23, 'Purple Frog Doll');
INSERT INTO item VALUES(339, 23, 'Puzzle piece');
INSERT INTO item VALUES(192, 23, 'Rainbow Stud Earring');
INSERT INTO item VALUES(301, 23, 'Red Ornament');
INSERT INTO item VALUES(138, 23, 'Riddles Bat');
INSERT INTO item VALUES(121, 23, 'RockerHead Doll');
INSERT INTO item VALUES(125, 23, 'Royal Doll');
INSERT INTO item VALUES(119, 23, 'Rubber Ducky of Doom');
INSERT INTO item VALUES(74, 23, 'Santa Hat 2004');
INSERT INTO item VALUES(341, 23, 'Seductive Stethoscope');
INSERT INTO item VALUES(338, 23, 'Sh0rtys Surfboard');
INSERT INTO item VALUES(689, 23, 'Signed Jersey');
INSERT INTO item VALUES(481, 23, 'Silver Dog Tag');
INSERT INTO item VALUES(285, 23, 'Silver Paint Brush');
INSERT INTO item VALUES(130, 23, 'Skanky Doll');
INSERT INTO item VALUES(156, 23, 'Skeleton Key');
INSERT INTO item VALUES(139, 23, 'Soup Nazi Doll');
INSERT INTO item VALUES(141, 23, 'Spammer Doll');
INSERT INTO item VALUES(158, 23, 'Statue Of Aeolus');
INSERT INTO item VALUES(443, 23, 'Strawberry Milkshake');
INSERT INTO item VALUES(136, 23, 'Strife Clown');
INSERT INTO item VALUES(356, 23, 'Superman Shades');
INSERT INTO item VALUES(120, 23, 'Teppic Bear');
INSERT INTO item VALUES(582, 23, 'Tin Foil Hat');
INSERT INTO item VALUES(685, 23, 'Torn Bible');
INSERT INTO item VALUES(124, 23, 'Toy Reactor');
INSERT INTO item VALUES(693, 23, 'Tractor Toy');
INSERT INTO item VALUES(117, 23, 'Trojan Horse');
INSERT INTO item VALUES(135, 23, 'Uriels Speakers');
INSERT INTO item VALUES(143, 23, 'Vanity Mirror');
INSERT INTO item VALUES(162, 23, 'WarPaint Kit');
INSERT INTO item VALUES(116, 23, 'Yoda Figurine');
INSERT INTO item VALUES(297, 23, 'YouYou Yo Yo');
INSERT INTO item VALUES(557, 24, 'Advent Calendar');
INSERT INTO item VALUES(406, 24, 'Afro Comb');
INSERT INTO item VALUES(167, 24, 'Article on Crime');
INSERT INTO item VALUES(179, 24, 'Birthday Cake 2005');
INSERT INTO item VALUES(374, 24, 'Birthday Present');
INSERT INTO item VALUES(377, 24, 'Birthday Wrapping Paper');
INSERT INTO item VALUES(328, 24, 'Blank Credit Cards');
INSERT INTO item VALUES(327, 24, 'Blank Tokens');
INSERT INTO item VALUES(159, 24, 'Bolt Cutters');
INSERT INTO item VALUES(403, 24, 'Box of Tissues');
INSERT INTO item VALUES(185, 24, 'Bunch of Balloons 2005');
INSERT INTO item VALUES(190, 24, 'C4 Explosive');
INSERT INTO item VALUES(540, 24, 'Cauldron');
INSERT INTO item VALUES(429, 24, 'Chopsticks');
INSERT INTO item VALUES(637, 24, 'Christmas Express');
INSERT INTO item VALUES(308, 24, 'Christmas Gnome');
INSERT INTO item VALUES(601, 24, 'Christmas Lights');
INSERT INTO item VALUES(376, 24, 'Christmas Present');
INSERT INTO item VALUES(195, 24, 'Christmas Tree 2005');
INSERT INTO item VALUES(379, 24, 'Christmas Wrapping Paper');
INSERT INTO item VALUES(636, 24, 'Cinnamon Ornament');
INSERT INTO item VALUES(96, 24, 'Coat Hanger');
INSERT INTO item VALUES(407, 24, 'Compass');
INSERT INTO item VALUES(432, 24, 'Crazy Straw');
INSERT INTO item VALUES(467, 24, 'Dancing Santa Claus 2009');
INSERT INTO item VALUES(431, 24, 'Dart Board');
INSERT INTO item VALUES(543, 24, 'Deputy Star');
INSERT INTO item VALUES(626, 24, 'Diving Gloves');
INSERT INTO item VALUES(535, 24, 'Electronic Pumpkin');
INSERT INTO item VALUES(280, 24, 'Elephant Statue');
INSERT INTO item VALUES(372, 24, 'Empty Box');
INSERT INTO item VALUES(410, 24, 'Fire Hydrant');
INSERT INTO item VALUES(622, 24, 'Flippers');
INSERT INTO item VALUES(172, 24, 'Gas Can');
INSERT INTO item VALUES(378, 24, 'Generic Wrapping Paper');
INSERT INTO item VALUES(309, 24, 'Gingerbread House');
INSERT INTO item VALUES(602, 24, 'Gingerbread Man');
INSERT INTO item VALUES(437, 24, 'Glow stick');
INSERT INTO item VALUES(597, 24, 'Gold Nugget');
INSERT INTO item VALUES(639, 24, 'Golden Candy Cane');
INSERT INTO item VALUES(603, 24, 'Golden Wreath');
INSERT INTO item VALUES(262, 24, 'Hockey Stick');
INSERT INTO item VALUES(492, 24, 'Human Head');
INSERT INTO item VALUES(536, 24, 'Jack O Lantern Lamp');
INSERT INTO item VALUES(171, 24, 'Jack-O-Lantern 2005');
INSERT INTO item VALUES(275, 24, 'Jade Buddha');
INSERT INTO item VALUES(293, 24, 'Japanese/English Dictionary');
INSERT INTO item VALUES(278, 24, 'Kabuki Mask');
INSERT INTO item VALUES(633, 24, 'Latex Gloves');
INSERT INTO item VALUES(405, 24, 'Loaf of Bread');
INSERT INTO item VALUES(279, 24, 'Maneki Neko');
INSERT INTO item VALUES(259, 24, 'Mayan Statue');
INSERT INTO item VALUES(493, 24, 'Medal of Honor');
INSERT INTO item VALUES(191, 24, 'Memory Locket');
INSERT INTO item VALUES(306, 24, 'Mini Sleigh');
INSERT INTO item VALUES(305, 24, 'Mistletoe');
INSERT INTO item VALUES(411, 24, 'Model Space Ship');
INSERT INTO item VALUES(413, 24, 'Mountie Hat');
INSERT INTO item VALUES(620, 24, 'Nodding Turtle');
INSERT INTO item VALUES(295, 24, 'Oriental Log');
INSERT INTO item VALUES(296, 24, 'Oriental Log Translation');
INSERT INTO item VALUES(64, 24, 'Pack of Cuban Cigars');
INSERT INTO item VALUES(345, 24, 'Pack of Trogins');
INSERT INTO item VALUES(416, 24, 'Paper Weight');
INSERT INTO item VALUES(373, 24, 'Parcel');
INSERT INTO item VALUES(265, 24, 'Pele Charm');
INSERT INTO item VALUES(160, 24, 'Photographs');
INSERT INTO item VALUES(595, 24, 'Pile of Vomit');
INSERT INTO item VALUES(423, 24, 'Poker Chip');
INSERT INTO item VALUES(559, 24, 'Polar Bear Toy');
INSERT INTO item VALUES(375, 24, 'Present');
INSERT INTO item VALUES(326, 24, 'Printing Paper');
INSERT INTO item VALUES(414, 24, 'Proda Sunglasses');
INSERT INTO item VALUES(424, 24, 'Rabbits Foot');
INSERT INTO item VALUES(358, 24, 'Raw Ivory');
INSERT INTO item VALUES(596, 24, 'Rusty Dog Tag');
INSERT INTO item VALUES(606, 24, 'Santa Boots');
INSERT INTO item VALUES(607, 24, 'Santa Gloves');
INSERT INTO item VALUES(608, 24, 'Santa Hat');
INSERT INTO item VALUES(610, 24, 'Santa Trousers');
INSERT INTO item VALUES(469, 24, 'Santas Elf 2009');
INSERT INTO item VALUES(558, 24, 'Santas Snot');
INSERT INTO item VALUES(433, 24, 'Sensu');
INSERT INTO item VALUES(408, 24, 'Sextant');
INSERT INTO item VALUES(415, 24, 'Ship in a Bottle');
INSERT INTO item VALUES(216, 24, 'Single White Rose');
INSERT INTO item VALUES(621, 24, 'Snorkel');
INSERT INTO item VALUES(466, 24, 'Snow Globe 2009');
INSERT INTO item VALUES(436, 24, 'Snowboard');
INSERT INTO item VALUES(194, 24, 'Snowflake 2005');
INSERT INTO item VALUES(307, 24, 'Snowman');
INSERT INTO item VALUES(182, 24, 'Soap on a Rope');
INSERT INTO item VALUES(270, 24, 'Soccer Ball');
INSERT INTO item VALUES(537, 24, 'Spooky Paper Weight');
INSERT INTO item VALUES(412, 24, 'Sports Shades');
INSERT INTO item VALUES(619, 24, 'Steel Drum');
INSERT INTO item VALUES(335, 24, 'Stick of Dynamite');
INSERT INTO item VALUES(635, 24, 'Straitjacket');
INSERT INTO item VALUES(427, 24, 'Sumo Doll');
INSERT INTO item VALUES(418, 24, 'Tailors Dummy');
INSERT INTO item VALUES(347, 24, 'Thong');
INSERT INTO item VALUES(422, 24, 'Vanity Hand Mirror');
INSERT INTO item VALUES(425, 24, 'Voodoo Doll');
INSERT INTO item VALUES(534, 24, 'Witches Cauldron');
INSERT INTO item VALUES(598, 24, 'Witches Hat');
INSERT INTO item VALUES(434, 24, 'Yakitori Lantern');
INSERT INTO item VALUES(409, 24, 'Yucca Plant');
INSERT INTO item VALUES(491, 24, 'Zombie Brain');

-- --------------------------------------------------------

--
-- Table structure for table 'itemtype'
--

CREATE TABLE itemtype (
  itemtypeid int(11) NOT NULL AUTO_INCREMENT,
  itemtypename varchar(100) COLLATE latin1_general_ci NOT NULL,
  bgcolor varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (itemtypeid)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=25 ;

--
-- Dumping data for table 'itemtype'
--

INSERT INTO itemtype VALUES(1, 'Flowers', 'lightgreen');
INSERT INTO itemtype VALUES(2, 'Plushies', 'pink');
INSERT INTO itemtype VALUES(3, 'Drugs', 'yellow');
INSERT INTO itemtype VALUES(4, 'Primary Weapons', 'white');
INSERT INTO itemtype VALUES(5, 'Secondary Weapons', 'white');
INSERT INTO itemtype VALUES(6, 'Melee Weapons', 'white');
INSERT INTO itemtype VALUES(7, 'Temporary Items', 'white');
INSERT INTO itemtype VALUES(8, 'Armour', 'white');
INSERT INTO itemtype VALUES(9, 'Candy', 'white');
INSERT INTO itemtype VALUES(10, 'Clothes', 'white');
INSERT INTO itemtype VALUES(11, 'Other boosters', 'white');
INSERT INTO itemtype VALUES(12, 'Alcohol', 'lightcyan');
INSERT INTO itemtype VALUES(13, 'Jewelry', 'white');
INSERT INTO itemtype VALUES(14, 'Medical Items', 'white');
INSERT INTO itemtype VALUES(15, 'Electronic Items', 'white');
INSERT INTO itemtype VALUES(16, 'Enhancers', 'white');
INSERT INTO itemtype VALUES(17, 'Special Items', 'white');
INSERT INTO itemtype VALUES(-1, '(unknown)', 'white');
INSERT INTO itemtype VALUES(18, 'Energy Drinks', 'white');
INSERT INTO itemtype VALUES(19, 'Cars', 'white');
INSERT INTO itemtype VALUES(20, 'Viruses', 'white');
INSERT INTO itemtype VALUES(21, 'Artifacts', 'white');
INSERT INTO itemtype VALUES(22, 'Supply Packs', 'white');
INSERT INTO itemtype VALUES(23, 'Collectibles', 'white');
INSERT INTO itemtype VALUES(24, 'Miscellaneous', '#ddd');

-- --------------------------------------------------------

--
-- Table structure for table 'post'
--

CREATE TABLE post (
  postid int(11) NOT NULL AUTO_INCREMENT,
  postUTC datetime NOT NULL,
  postdata varchar(60000) COLLATE latin1_general_ci NOT NULL,
  user_agent varchar(255) COLLATE latin1_general_ci NOT NULL,
  referer varchar(255) COLLATE latin1_general_ci NOT NULL,
  sender varchar(78) COLLATE latin1_general_ci NOT NULL DEFAULT ' ',
  PRIMARY KEY (postid)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=4023 ;

-- --------------------------------------------------------

--
-- Table structure for table 'stock'
--

CREATE TABLE stock (
  stockid int(11) NOT NULL AUTO_INCREMENT,
  utctime datetime NOT NULL,
  country int(11) NOT NULL,
  item int(11) NOT NULL,
  price int(11) NOT NULL,
  quantity int(11) NOT NULL,
  manual tinyint(4) NOT NULL,
  sender varchar(78) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (stockid),
  KEY country (country),
  KEY item (item)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=51013 ;

-- --------------------------------------------------------

--
-- Table structure for table 'lastdrugs'
--

CREATE VIEW lastdrugs AS
  select stock.item AS item,
         stock.country AS country,
         max(stock.utctime) AS lastutc
  from stock
  where stock.item in (
    select item.itemid
    from item
    where (item.itemtype = 3)
  )
  group by stock.item, stock.country;


-- --------------------------------------------------------

--
-- Changes to table 'stock' at 2013-12-03
--

ALTER TABLE stock CHANGE price price BIGINT(11) NOT NULL;

