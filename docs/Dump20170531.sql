-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: 127.0.0.1    Database: card17db
-- ------------------------------------------------------
-- Server version	5.7.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `arquetipos`
--

DROP TABLE IF EXISTS `arquetipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arquetipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descricao` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arquetipos`
--

LOCK TABLES `arquetipos` WRITE;
/*!40000 ALTER TABLE `arquetipos` DISABLE KEYS */;
INSERT INTO `arquetipos` VALUES (1,'combo','texto ..',NULL,NULL,NULL),(2,'midrange','texto ..',NULL,NULL,NULL),(3,'controle','texto ..',NULL,NULL,NULL),(4,'rush','texto ..',NULL,NULL,NULL);
/*!40000 ALTER TABLE `arquetipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carta_deck`
--

DROP TABLE IF EXISTS `carta_deck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carta_deck` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deck_id` int(11) NOT NULL,
  `carta_id` int(11) NOT NULL,
  `total` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cartas_decks_decks1_idx` (`deck_id`),
  KEY `fk_cartas_decks_cartas1_idx` (`carta_id`),
  CONSTRAINT `fk_cartas_decks_cartas1` FOREIGN KEY (`carta_id`) REFERENCES `cartas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cartas_decks_decks1` FOREIGN KEY (`deck_id`) REFERENCES `decks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carta_deck`
--

LOCK TABLES `carta_deck` WRITE;
/*!40000 ALTER TABLE `carta_deck` DISABLE KEYS */;
INSERT INTO `carta_deck` VALUES (1,1,4,1,NULL,NULL,NULL),(2,1,15,2,NULL,NULL,NULL),(3,1,22,1,NULL,NULL,NULL),(4,1,27,3,NULL,NULL,NULL),(5,1,42,1,NULL,NULL,NULL),(6,1,59,1,NULL,NULL,NULL),(7,1,87,2,NULL,NULL,NULL),(8,1,89,3,NULL,NULL,NULL),(9,1,113,2,NULL,NULL,NULL),(10,1,154,3,NULL,NULL,NULL),(11,1,157,3,NULL,NULL,NULL),(12,1,242,2,NULL,NULL,NULL),(13,1,264,3,NULL,NULL,NULL),(14,1,272,3,NULL,NULL,NULL),(15,2,10,1,NULL,NULL,NULL),(16,2,14,1,NULL,NULL,NULL),(17,2,24,1,NULL,NULL,NULL),(18,2,27,1,NULL,NULL,NULL),(19,2,37,1,NULL,NULL,NULL),(20,2,44,1,NULL,NULL,NULL),(21,2,48,2,NULL,NULL,NULL),(22,2,54,1,NULL,NULL,NULL),(23,2,56,1,NULL,NULL,NULL),(24,2,67,1,NULL,NULL,NULL),(25,2,75,1,NULL,NULL,NULL),(26,2,80,1,NULL,NULL,NULL),(27,2,82,1,NULL,NULL,NULL),(28,2,93,1,NULL,NULL,NULL),(29,2,94,1,NULL,NULL,NULL),(30,2,201,1,NULL,NULL,NULL),(31,2,213,1,NULL,NULL,NULL),(32,2,214,1,NULL,NULL,NULL),(33,2,227,1,NULL,NULL,NULL),(34,2,228,1,NULL,NULL,NULL),(35,2,233,1,NULL,NULL,NULL),(36,2,239,1,NULL,NULL,NULL),(37,2,243,1,NULL,NULL,NULL),(38,2,248,1,NULL,NULL,NULL),(39,2,258,1,NULL,NULL,NULL),(40,2,269,1,NULL,NULL,NULL),(41,2,284,1,NULL,NULL,NULL),(42,2,285,1,NULL,NULL,NULL),(43,2,303,1,NULL,NULL,NULL),(59,4,28,1,NULL,NULL,NULL),(60,4,36,3,NULL,NULL,NULL),(61,4,40,2,NULL,NULL,NULL),(62,4,61,2,NULL,NULL,NULL),(63,4,97,3,NULL,NULL,NULL),(64,4,173,2,NULL,NULL,NULL),(65,4,190,1,NULL,NULL,NULL),(66,4,205,3,NULL,NULL,NULL),(67,4,219,2,NULL,NULL,NULL),(68,4,224,1,NULL,NULL,NULL),(69,4,226,1,NULL,NULL,NULL),(70,4,231,1,NULL,NULL,NULL),(71,4,238,3,NULL,NULL,NULL),(72,4,263,2,NULL,NULL,NULL),(73,4,270,1,NULL,NULL,NULL),(74,4,273,2,NULL,NULL,NULL),(91,5,38,3,NULL,NULL,NULL),(92,5,44,1,NULL,NULL,NULL),(93,5,58,1,NULL,NULL,NULL),(94,5,84,1,NULL,NULL,NULL),(95,5,93,1,NULL,NULL,NULL),(96,5,100,3,NULL,NULL,NULL),(97,5,123,1,NULL,NULL,NULL),(98,5,141,1,NULL,NULL,NULL),(99,5,162,2,NULL,NULL,NULL),(100,5,173,1,NULL,NULL,NULL),(101,5,186,2,NULL,NULL,NULL),(102,5,192,3,NULL,NULL,NULL),(103,5,196,3,NULL,NULL,NULL),(104,5,201,2,NULL,NULL,NULL),(105,5,231,2,NULL,NULL,NULL),(106,5,235,2,NULL,NULL,NULL),(107,5,241,1,NULL,NULL,NULL),(121,31,2,3,NULL,NULL,NULL),(122,31,3,3,NULL,NULL,NULL),(123,31,4,3,NULL,NULL,NULL),(124,31,164,1,NULL,NULL,NULL),(125,31,171,2,NULL,NULL,NULL),(126,31,191,1,NULL,NULL,NULL),(127,31,82,1,NULL,NULL,NULL),(128,31,57,3,NULL,NULL,NULL),(129,31,59,3,NULL,NULL,NULL),(130,31,60,3,NULL,NULL,NULL),(131,31,63,3,NULL,NULL,NULL),(132,31,64,3,NULL,NULL,NULL),(133,31,62,1,NULL,NULL,NULL),(134,32,2,4,NULL,NULL,NULL),(135,32,3,4,NULL,NULL,NULL),(136,32,4,2,NULL,NULL,NULL),(137,32,82,1,NULL,NULL,NULL),(138,32,164,1,NULL,NULL,NULL),(139,32,171,3,NULL,NULL,NULL),(140,32,191,12,NULL,NULL,NULL),(141,32,274,1,NULL,NULL,NULL),(142,32,275,1,NULL,NULL,NULL),(143,32,276,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `carta_deck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartas`
--

DROP TABLE IF EXISTS `cartas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `metadata` varchar(1000) NOT NULL,
  `indice_pandora` decimal(2,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartas`
--

LOCK TABLES `cartas` WRITE;
/*!40000 ALTER TABLE `cartas` DISABLE KEYS */;
INSERT INTO `cartas` VALUES (1,'1;HUMAN;Farm Boy;creature;;1;;;;;1;1;;;2;100001;COMMON;;;;;',NULL,NULL,NULL,NULL),(2,'2;HUMAN;Hilltop Archer;creature;;4;;;;;2;2;{ranged_attack};;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(3,'3;HUMAN;Syland Warrior;creature;;5;;;;;3;6;;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(4,'4;HUMAN;Syland Horsemaster;creature;;3;;;;;3;2;{gift} - Give another friendly creature {charge|3} this turn.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(5,'9;HUMAN;Imperial Engineer;creature;;3;;;;;1;3;{gift} - Trigger all your production abilities.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(6,'10;HUMAN;Hold the Line!;event;;1;;;;;;;Add two 2/3 <b>Imperial Guards</b> with {taunt} to your hand.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(7,'11;HUMAN;Walking Fortress;creature;;9;;;;;6;10;;;2;100003;COMMON;;;;;',NULL,NULL,NULL,NULL),(8,'12;HUMAN;Steam Forge;structure;;1;;;;;;3;{production} - A random friendly creature gains +1/+0.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(9,'13;HUMAN;Tax Collector;creature;;3;;;;;1;4;{combat} - Gain {faeria|1}.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(10,'14;HUMAN;Healing Song;event;;3;;;;;;;Draw a card and gain 5 Life.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(11,'15;HUMAN;Safeguard;event;;3;;;;;;;Give a creature {protection}.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(12,'16;HUMAN;Imperial Guard;creature;;3;;;;;2;3;{taunt} {last_words} - Gain 2 Life.;;2;100003;COMMON;;;;;',NULL,NULL,NULL,NULL),(13,'22;HUMAN;Freedom Fighter;creature;;5;;;;;3;3;{haste};;2;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(14,'23;HUMAN;Campfire;event;;1;;;;;;;Give a creature +1/+1.;;2;100004;COMMON;;;;;',NULL,NULL,NULL,NULL),(15,'24;HUMAN;Falcon Dive;event;;1;;;;;;;Deal 1 damage to a creature.;;2;100004;COMMON;;;;;',NULL,NULL,NULL,NULL),(16,'29;HUMAN;Master Swordsman;creature;;3;;;;;2;3;Has +2/+0 during your turn.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(17,'30;HUMAN;Prairie Yak;creature;;3;;;;;2;4;;;2;100001;COMMON;;;;;',NULL,NULL,NULL,NULL),(18,'32;HUMAN;Yak Attack;event;;9;;;;;;;Summon three 2/2 <b>Angry Yaks</b> with {haste}.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(19,'33;HUMAN;Punishment;event;;3;;;;;;;Deal 2 damage to a creature. If it\'s a neutral creature, deal 5.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(20,'34;HUMAN;Queen\'s Favorite;creature;;4;;;;;2;2;{protection};;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(21,'35;HUMAN;Queen\'s Guard;creature;;6;;;;;3;6;{taunt} {combat} - Gain {faeria|1}.;;2;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(22,'36;HUMAN;Magda, Queen of Meroval;creature;;4;;;;;0;3;Your Legends costs {faeria|2} less. {production} - Add a random Legend to your hand.;;0;101000;LEGENDARY;;;;;',NULL,NULL,NULL,NULL),(23,'37;HUMAN;Court Jester;creature;;3;;;;;0;2;{taunt} {gift} - A random creature in your hand gains +2/+2.;;2;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(24,'38;HUMAN;King\'s Guard;creature;;6;;;;;3;6;{taunt} {combat} - Draw a card.;;2;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(25,'39;HUMAN;Unlikely Hero;creature;;2;;;;;1;2;The first time this creature fights and survives, it gains +3/+3 and {charge|3}.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(26,'40;HUMAN;Magnus, King of Meroval;creature;;10;;;;;4;8;{charge|3} {combat} - Draw a card. It costs {faeria|0}.;;0;101000;LEGENDARY;;;;;',NULL,NULL,NULL,NULL),(27,'41;HUMAN;Plague Bearer;creature;;3;;;;;2;1;{last_words} - Deal 2 damage to ALL creatures.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(28,'42;HUMAN;Siege Engine;creature;;7;;;;;2;6;{ranged_attack} Whenever this creature attacks, it gains +1/+0 afterwards.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(29,'43;HUMAN;Sharra, Dragonslayer;creature;;7;;;;;6;3;Ignores all damage equal to 4 or more.;;0;101000;LEGENDARY;;;;;',NULL,NULL,NULL,NULL),(30,'44;HUMAN;Famine;event;;2;;;;;;;Deal 1 damage to ALL creatures.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(31,'45;HUMAN;Royal Judge;creature;;5;;;;;1;1;{options|Draw a free Safeguard.|Draw a free Punishment.} - Add a <b>Safeguard</b> to your hand. It costs {faeria|0}. - Add a <b>Punishment</b> to your hand. It costs {faeria|0}.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(32,'46;HUMAN;Cartographer;creature;;3;;;;;1;1;{last_words} - Add an <b>Explore</b> to your hand.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(33,'47;HUMAN;Shimmering Statue;structure;;2;;;;;;4;{taunt} {production} - You gain 1 Life.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(34,'48;HUMAN;Village Elder;creature;;2;;;;;1;1;{last_words} - Draw a card.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(35,'49;HUMAN;Storyteller;creature;;3;;;;;2;2;{gift} - Each player draws 2 cards and gains 2 Life.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(36,'50;HUMAN;Wandering Monk;creature;;4;;;;;1;5;Whenever you draw a card, gain +1/+0.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(37,'51;HUMAN;Steamforge Enforcer;creature;;6;;;;;6;5;;;2;100003;COMMON;;;;;',NULL,NULL,NULL,NULL),(38,'52;HUMAN;King\'s Faithful;creature;;5;;;;;4;1;{protection};;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(39,'53;HUMAN;Day of the Dragons;event;;12;;;;;;;Add the four <b>Dragons</b> to your hand. They cost {faeria|4} less.;;0;101000;LEGENDARY;;;;;',NULL,NULL,NULL,NULL),(40,'54;HUMAN;Daring Adventurer;creature;;4;;;;;2;2;{gift} - Gain +2/+2 for each adjacent enemy creature.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(41,'55;HUMAN;Maceman;creature;;4;;;;;4;4;;;2;100002;COMMON;;;;;',NULL,NULL,NULL,NULL),(42,'56;HUMAN;Baron Thulgar;creature;;6;;;;;4;5;{last_words} - Each player draws a card. They cost {faeria|0}.;;0;101000;LEGENDARY;;;;;',NULL,NULL,NULL,NULL),(43,'57;HUMAN;Wisdom;event;;3;;;;;;;Draw 2 cards.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(44,'58;HUMAN;War Yak;creature;;5;;;;;4;5;Has +2/+0 while your opponent has 10 Life or less.;;2;100001;RARE;;;;;',NULL,NULL,NULL,NULL),(45,'59;HUMAN;Defender of the Homeland;creature;;2;;;;;1;2;{taunt} {gift} - If you were attacked last turn, summon another <b>Defender of the Homeland</b>.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(46,'60;HUMAN;Queen\'s Assassin;creature;;3;;;;;1;1;{deathtouch};;2;100004;COMMON;;;;;',NULL,NULL,NULL,NULL),(47,'61;HUMAN;Hunted Outlaw;creature;;3;;;;;4;5;{last_words} - Your opponent draws a card and gains {faeria|2}.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(48,'62;HUMAN;Fortune Hunter;creature;;3;;;;;1;1;Whenever this creature gathers faeria, a random creature you control gains +1/+1.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(49,'63;HUMAN;Outland Ranger;creature;;3;;;;;3;2;{gift} - Add a <b>Campfire</b> to your hand.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(50,'64;HUMAN;Imperial Drain;structure;;0;;;;;;2;Faeria wells are empty. {production} - Deal 1 damage to this structure.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(51,'65;HUMAN;Rainforest Explorer;creature;;4;;;;;3;3;{gift} - Gain +1/+1 if you control 2 lakes. Gain +0/+2 if you control 2 forests.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(52,'66;HUMAN;Caldera Explorer;creature;;4;;;;;3;3;{gift} - Gain +1/+1 if you control 2 lakes. Gain +2/+0 if you control 2 mountains.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(53,'67;HUMAN;Oasis Explorer;creature;;4;;;;;3;3;{gift} - Gain +1/+1 if you control 2 lakes. Gain +1/+1 if you control 2 deserts.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(54,'68;HUMAN;Taiga Explorer;creature;;4;;;;;3;3;{gift} - Gain +2/+0 if you control 2 mountains. Gain +0/+2 if you control 2 forests.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(55,'69;HUMAN;Savannah Explorer;creature;;4;;;;;3;3;{gift} - Gain +1/+1 if you control 2 deserts. Gain +0/+2 if you control 2 forests.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(56,'70;HUMAN;Sandstone Explorer;creature;;4;;;;;3;3;{gift} - Gain +2/+0 if you control 2 mountains. Gain +1/+1 if you control 2 deserts.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(57,'71;BLUE;Ruby Fish;creature;;1;1;;;;1;1;{aquatic};;2;100009;COMMON;;;;;',NULL,NULL,NULL,NULL),(58,'72;BLUE;Lore Thief;creature;;3;2;;;;1;1;{options|Gains +2/+2|Draw 2 cards.} - Gain +2/+2. - Draw 2 cards.;;2;100010;COMMON;;;;;',NULL,NULL,NULL,NULL),(59,'73;BLUE;Gabrian Cistern;structure;;4;2;;;;;3;{production} - Gain {faeria|3}. Deal 1 damage to this structure.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(60,'74;BLUE;Tyranax;creature;;5;1;;;;4;6;;;2;100009;COMMON;;;;;',NULL,NULL,NULL,NULL),(61,'75;BLUE;Gabrian Enchantress;creature;;4;2;;;;2;5;{gift} - Another creature\'s Attack becomes equal to its Life.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(62,'76;BLUE;Gabrian Commander;creature;;3;2;;;;4;2;{aquatic}, {charge|3} The first time you draw a card with a base cost of {faeria|7} or higher, gain {flying} and +1/+1.;;2;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(63,'77;BLUE;Gabrian Warden;creature;;7;2;;;;4;6;{gift} - Give a creature {protection}.;;2;100010;COMMON;;;;;',NULL,NULL,NULL,NULL),(64,'82;BLUE;Spring Mochi;creature;;3;2;;;;2;2;{gift} - The next card you draw with an original cost of {faeria|7} or higher costs {faeria|3} less.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(65,'83;BLUE;Triton Warrior;creature;;4;2;;;;4;4;{jump};;2;100011;COMMON;;;;;',NULL,NULL,NULL,NULL),(66,'84;BLUE;Mystic Beast;creature;;3;3;;;;2;5;{gift} - Gets +2/+0 and {jump} if summoned adjacent to an enemy well.;;2;100010;RARE;;;;;',NULL,NULL,NULL,NULL),(67,'85;BLUE;Mirror Phantasm;creature;;7;2;;;;5;5;{gift} - Transform another creature into a 5/5 <b>Mirror Phantasm</b>.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(68,'86;BLUE;Triton Chef;creature;;2;2;;;;2;2;{gift} - Add a <b>Triton Banquet</b> to your hand.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(69,'87;BLUE;Ninja Toad;creature;;4;3;;;;3;2;{jump}, {haste};;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(70,'88;BLUE;Frogify;event;;4;3;;;;;;Transform a creature into a 2/2 <b>Frog</b> with {jump}.;;2;100011;RARE;;;;;',NULL,NULL,NULL,NULL),(71,'93;BLUE;Gabrian Enchantment;event;;2;2;;;;;;A creature\'s Attack becomes equal to its Life. Draw a card.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(72,'94;BLUE;Aurora\'s Creation;event;;5;3;;;;;;Add a copy of a creature to your hand. It costs {faeria|5} less.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(73,'95;BLUE;Dark Stalker;creature;;3;1;;;;3;2;If you\'ve played an event this turn, costs {faeria|2} less.;;2;100012;COMMON;;;;;',NULL,NULL,NULL,NULL),(74,'96;BLUE;Spellwhirl;event;;0;2;;;;;;Add two random blue cards to your hand.;;2;100012;RARE;;;;;',NULL,NULL,NULL,NULL),(75,'97;BLUE;Gabrian Noble;creature;;6;3;;;;4;4;{gift} - Summon a 1/1 <b>Ruby Fish</b> (you may summon it on an ocean tile).;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(76,'102;BLUE;Aurora\'s Disciple;creature;;3;2;;;;2;2;Whenever you play an event, gain +1/+1.;;2;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(77,'103;BLUE;Sturdy Shell;creature;;2;1;;;;0;5;{aquatic};;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(78,'104;BLUE;Baeru, the First Wave;creature;;8;3;;;;8;10;{aquatic} {production} - Transform all adjacent lands into lakes.;;0;101000;LEGENDARY;;;;;',NULL,NULL,NULL,NULL),(79,'105;BLUE;Stormspawn;creature;;10;2;;;;3;3;{last_words} - Gain {faeria|10}.;;2;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(80,'106;BLUE;Tale of the Old Turtle;event;;6;2;;;;;;Draw 3 cards. All creatures drawn this way cost {faeria|2} less.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(81,'107;BLUE;Wavecrash Colossus;creature;;8;2;;;;7;7;Costs {faeria|1} less for each time you\'ve harvested from an enemy well (minimum cost: {faeria|4}).;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(82,'108;BLUE;Orosei, Dream of the Deep;creature;;10;2;;;;6;6;{flying}, {charge|2} {gift} - Transform all your other creatures into creatures that cost {faeria|2} more.;;0;101000;LEGENDARY;;;;;',NULL,NULL,NULL,NULL),(83,'109;BLUE;Water Elemental;creature;;4;1;;;;3;3;{jump} {gift} - Create a lake.;;2;100009;COMMON;;;;;',NULL,NULL,NULL,NULL),(84,'110;BLUE;Gemsilk Faerie;creature;;2;2;;;;1;1;{flying} The first time you draw an event, gain +2/+2,  and {charge|2}.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(85,'111;BLUE;Sunken Tower;structure;;2;2;;;;;3;{activate} - Move a land. Deal 1 damage to this structure.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(86,'112;BLUE;Azure Wisp;creature;;4;2;;;;3;3;Whenever you gather faeria from an opponent\'s well, gain +1/+1.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(87,'113;BLUE;Triton Sanctuary;structure;;2;1;;;;;1;Whenever you gather faeria, this structure gains +1 Life. {activate} - Destroy it and gain faeria equal to its Life.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(88,'114;BLUE;Aurora\'s Dream;event;;24;5;;;;;;Draw until you have 9 cards. Reduce the cost of all cards in your hand to {faeria|0}.;;0;101000;LEGENDARY;;;;;',NULL,NULL,NULL,NULL),(89,'115;BLUE;Snowstorm Lancer;creature;;5;2;;;;3;5;{jump} Whenever you play an event, gain +2/+0 this turn (limit +6/+0).;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(90,'116;BLUE;Luduan;creature;;3;1;;;;1;3;Whenever this creature gathers faeria from an opponent\'s well, add a random blue card to your hand. It costs {faeria|2} less.;;2;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(91,'117;BLUE;Egg of Wonders;structure;;5;3;;;;;3;When you draw a non-legendary creature, Egg of Wonders becomes a copy of it.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(92,'118;BLUE;Gabrian Archon;creature;;4;2;;;;4;4;{charge|2} Gain +2/+2 if you\'ve played two cards with a base cost of {faeria|7} or higher.;;2;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(93,'119;BLUE;Triton Diver;creature;;3;1;;;;2;2;{aquatic}, {jump};;2;100011;COMMON;;;;;',NULL,NULL,NULL,NULL),(94,'120;BLUE;Shifting Tide;event;;1;1;;;;;;{options|Move a land|Draw a card} - Move a land. - Draw a card.;;2;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(95,'121;BLUE;Prophet of Tides;creature;;3;2;;;;3;1;{gift} - Move a land you control twice.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(96,'122;BLUE;Humbling Vision;event;;3;2;;;;;;Halve a creature\'s base Attack and Life (rounded up).;;2;100012;COMMON;;;;;',NULL,NULL,NULL,NULL),(97,'123;BLUE;Ancient Herald;creature;;6;1;;;;5;6;{gift} - The next creature you draw with 5 Life or more costs {faeria|2} less.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(98,'124;BLUE;Triton Banquet;event;;3;1;;;;;;Give a creature +1/+1 and {jump}.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(99,'125;BLUE;Aurora, Myth Maker;creature;;4;2;;;;1;1;{gift} - Change another friendly creature\'s base Attack and Life to 6/6.;;0;101000;LEGENDARY;;;;;',NULL,NULL,NULL,NULL),(100,'126;BLUE;Wavecrafter;creature;;6;3;;;;5;6;At the end of your opponent\'s turn, set ALL players\' faeria to {faeria|3}.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(101,'127;BLUE;Failed Experiment;event;;1;1;;;;;;The next creature you play this turn costs {faeria|4} less. It dies instantly.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(102,'128;BLUE;Aurora\'s Trick;event;;4;5;;;;;;Gain control of a creature with 2 Attack or less.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(103,'129;BLUE;Battle Toads;event;;4;2;;;;;;Summon two 2/2 <b>Frogs</b> with {jump}.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(104,'130;BLUE;Windfall;event;;10;2;;;;;;Gain {faeria|12}.;;2;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(105,'131;GREEN;Sagami Warrior;creature;;3;;1;;;3;4;{dash|2};;2;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(106,'132;GREEN;Bone Collector;creature;;2;;1;;;1;3;Whenever an adjacent creature dies, gain +1/+1.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(107,'133;GREEN;Soulbound Sagami;creature;;6;;2;;;3;5;{last_words} - A random friendly creature gains +3/+5.;;2;100008;COMMON;;;;;',NULL,NULL,NULL,NULL),(108,'134;GREEN;Sagami Grovecaller;creature;;4;;2;;;2;4;{gift} - Teleport another friendly creature to a forest you control.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(109,'135;GREEN;Ancient Beastmaster;creature;;4;;2;;;3;4;When you summon a creature with 5 Life or more, it gains +1/+1.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(110,'136;GREEN;Gaea\'s Grace;event;;2;;2;;;;;You and a creature each gain +3 Life.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(111,'137;GREEN;Tiki Chieftain;creature;;3;;2;;;2;2;{gift} - Give a creature {taunt}.;;2;100006;COMMON;;;;;',NULL,NULL,NULL,NULL),(112,'138;GREEN;Bloomsprite;creature;;2;;2;;;1;1;{last_words} - Add a random green card to your hand. It costs {faeria|3} less.;;2;100005;COMMON;;;;;',NULL,NULL,NULL,NULL),(113,'139;GREEN;Elderwood Hermit;creature;;3;;1;;;1;1;{last_words} - A random friendly creature gains +2/+4.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(114,'140;GREEN;Tiki Caretaker;creature;;3;;2;;;1;1;{gift} - Give a creature +2/+2.;;2;100006;COMMON;;;;;',NULL,NULL,NULL,NULL),(115,'141;GREEN;Tiki Piper;creature;;3;;1;;;1;1;{gift} - Give a creature +0/+4.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(116,'142;GREEN;Shamanic Dance;event;;2;;2;;;;;Give a creature +0/+4 and {taunt}.;;2;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(117,'143;GREEN;Tiki Totem;structure;;3;;2;;;;3;The first creature you summon per turn gains +1/+1.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(118,'144;GREEN;Possessed Ursus;creature;;5;;2;;;1;8;Whenever this creature is dealt damage, its Attack doubles.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(119,'149;GREEN;Oakling;creature;;5;;2;;;1;5;{last_words} - A random creature in your hand gains +5/+5.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(120,'150;GREEN;Thyrian Golem;creature;;5;;5;;;5;10;;;2;100007;RARE;;;;;',NULL,NULL,NULL,NULL),(121,'151;GREEN;Seed Sower;creature;;6;;1;;;4;6;{gift} - Creates an adjacent forest at random.;;2;100007;COMMON;;;;;',NULL,NULL,NULL,NULL),(122,'152;GREEN;Vine Wall;structure;;1;;2;;;;4;{taunt} {last_words} - Create a forest at random.;;2;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(123,'153;GREEN;Deepwood Grizzly;creature;;5;;1;;;3;8;;;2;100005;COMMON;;;;;',NULL,NULL,NULL,NULL),(124,'154;GREEN;Tiki Healer;creature;;5;;2;;;2;6;{gift} - You gain 6 Life.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(125,'155;GREEN;Ruunin\'s Shrine;structure;;0;;2;;;;2;{gift} - Gain {faeria|2}. {last_words} - Your opponent gains {faeria|2}.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(126,'156;GREEN;Oak Father;creature;;7;;2;;;6;6;{gift} - Gain +0/+1 for each forest you control.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(127,'157;GREEN;Faeria Tree;structure;;2;;1;;;;1;{production} - This structure gains +1 Life. When it has 5 or more Life, destroy it and gain {faeria|10}.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(128,'158;GREEN;Living Willow;creature;;3;;2;;;1;7;{taunt};;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(129,'159;GREEN;Wild Growth;event;;2;;1;;;;;Create two forests at random.;;2;100007;RARE;;;;;',NULL,NULL,NULL,NULL),(130,'168;GREEN;Primeval Colossus;creature;;16;;2;;;7;14;Costs {faeria|1} less for each special land you have (minimum cost: {faeria|6}).;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(131,'169;GREEN;Tethra, Soul of the Wild;creature;;10;;2;;;6;6;{flying}, {charge|2} {gift} - Give a creature +5/+5.;;0;101000;LEGENDARY;;;;;',NULL,NULL,NULL,NULL),(132,'170;GREEN;Wood Elemental;creature;;4;;1;;;3;4;{taunt} {gift} - Create a forest.;;2;100008;COMMON;;;;;',NULL,NULL,NULL,NULL),(133,'171;GREEN;Flowersilk Faerie;creature;;2;;2;;;1;1;{flying} The first time you draw an event, gain +1/+4, {taunt} and {charge|2}.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(134,'172;GREEN;Overgrown Tower;structure;;2;;2;;;;3;{activate} - Give a creature +1/+1. Deal 1 damage to this structure.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(135,'173;GREEN;Everbloom Wisp;creature;;4;;2;;;1;2;Whenever you create a forest, gain +1/+1.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(136,'174;GREEN;Spirit of Rebirth;creature;;3;;2;;;3;3;Whenever another friendly creature dies, a random creature in your hand gains +1/+1.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(137,'175;GREEN;Elderwood Embrace;event;;3;;2;;;;;Give a creature +2/+4.;;2;100006;COMMON;;;;;',NULL,NULL,NULL,NULL),(138,'176;GREEN;Ruunin\'s Messenger;creature;;5;;1;;;3;5;{jump} Whenever this creature attacks a god, add a random green creature to your hand. It costs {faeria|2} less.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(139,'177;GREEN;Verduran Force;creature;;6;;2;;;7;7;;;2;100005;RARE;;;;;',NULL,NULL,NULL,NULL),(140,'178;GREEN;Grove Guardian;creature;;5;;3;;;5;6;{taunt};;2;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(141,'179;GREEN;Tarum, the Forest World;creature;;15;;5;;;7;15;{taunt} {last_words} - Fill the world with forests.;;0;101000;LEGENDARY;;;;;',NULL,NULL,NULL,NULL),(142,'180;GREEN;Weeping Idol;structure;;1;;1;;;;3;Whenever you are dealt damage, gain {faeria|1}.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(143,'181;GREEN;Earthcraft;event;;2;;1;;;;;Draw a card and {options|Create a forest|Create a lake|Create a mountain|Create a desert} - Create a forest. - Create a lake. - Create a mountain. - Create a desert.;;2;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(144,'182;GREEN;Wild Avenger;creature;;6;;2;;;5;5;{taunt}, {dash|2} Gain 1 Life for each time you\'ve been dealt damage this game.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(145,'183;GREEN;Ancient Boar;creature;;6;;1;;;4;5;{dash|2} If you control a creature with 5 Life or more, costs {faeria|2} less.;;2;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(146,'184;GREEN;Ruunin\'s Guidance;event;;2;;2;;;;;{options|Give a creature +2/+2.|Gain 5 Life.} - Give a creature +2/+2. - Gain 5 Life.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(147,'185;GREEN;Voice of Hunger;creature;;5;;2;;;3;5;{gift} - Destroy all adjacent friendly creatures. Gain Attack AND Life equal to their combined Life.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(148,'186;GREEN;Seedling;creature;;2;;1;;;0;1;{production} - If this creature has less than 5 Life, gain +1/+1.;;2;100008;COMMON;;;;;',NULL,NULL,NULL,NULL),(149,'187;GREEN;Eredon, Voice of All;creature;;5;;2;;;3;3;{last_words} - All creatures in your deck and hand gain +1/+1.;;0;101000;LEGENDARY;;;;;',NULL,NULL,NULL,NULL),(150,'188;GREEN;Feed the Forest;event;;1;;3;;;;;Destroy a friendly creature to gain faeria equal to its Life and draw a card.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(151,'189;GREEN;Ruunin\'s Presence;event;;4;;2;;;;;Add a random green creature to your hand. It gains +6/+6.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(152,'190;GREEN;Ruunin, the Relentless;creature;;6;;2;;;4;4;{dash|2} {last_words} - Return Ruunin to your hand. She gains +2/+2.;;0;101000;LEGENDARY;;;;;',NULL,NULL,NULL,NULL),(153,'191;RED;Underground Brigand;creature;;3;;;2;;2;3;{combat} - Gain {faeria|2}.;;2;100013;COMMON;;;;;',NULL,NULL,NULL,NULL),(154,'192;RED;Kobold Warlord;creature;;7;;;1;;5;7;{combat} - A random creature you control gains +3/+0.;;2;100013;COMMON;;;;;',NULL,NULL,NULL,NULL),(155,'193;RED;Kobold Warbeast;creature;;4;;;2;;5;4;;;2;100014;COMMON;;;;;',NULL,NULL,NULL,NULL),(156,'194;RED;Gift of Steel;event;;3;;;2;;;;Give +3/+0 to a creature. That creature also gains 3 Life if it has a <b>Combat</b> ability.;;2;100014;COMMON;;;;;',NULL,NULL,NULL,NULL),(157,'195;RED;Underground Boss;creature;;5;;;2;;3;5;{combat} - Gain {faeria|2}.;;2;100013;COMMON;;;;;',NULL,NULL,NULL,NULL),(158,'196;RED;Architect;creature;;2;;;2;;2;2;{gift} - Give a structure +2 Life.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(159,'197;RED;Exalted Ogre;creature;;5;;;1;;5;5;{gift} - If your opponent has 10 Life or less, gain +2/+2.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(160,'198;RED;Kobold Barracks;structure;;2;;;2;;;4;Adjacent friendly creatures have +2/+0.;;2;100014;RARE;;;;;',NULL,NULL,NULL,NULL),(161,'199;RED;Hate Seed;creature;;7;;;2;;4;4;Costs {faeria|1} less for each creature you have summoned with higher Attack than Life.;;2;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(162,'200;RED;Ogre Battler;creature;;8;;;2;;6;9;{taunt};;2;100015;COMMON;;;;;',NULL,NULL,NULL,NULL),(163,'201;RED;Bold Bargainer;creature;;7;;;2;;3;4;{gift} - A random card in your hand costs {faeria|7} less.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(164,'202;RED;Seifer, Blood Tyrant;creature;;5;;;2;;5;6;When Seifer destroys a creature, he gains Attack and Life equal to the destroyed creature\'s original Attack and Life.;;0;101000;LEGENDARY;;;;;',NULL,NULL,NULL,NULL),(165,'203;RED;Barbarian Ogre;creature;;7;;;2;;7;7;;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(166,'204;RED;Krog, the Ogre King;creature;;12;;;2;;2;12;{combat} - A random card in your hand costs {faeria|7} less.;;0;101000;LEGENDARY;;;;;',NULL,NULL,NULL,NULL),(167,'205;RED;Axe Grinder;creature;;3;;;1;;4;3;{gift} - Gain +1/+1 if summoned adjacent to an opponent\'s well.;;2;100015;RARE;;;;;',NULL,NULL,NULL,NULL),(168,'206;RED;Boulder Thrower;creature;;7;;;1;;3;5;{ranged_attack} When this creature attacks, it also damages each enemy adjacent to the target.;;2;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(169,'211;RED;Shedim Brute;creature;;5;;;2;;3;6;{combat} - Deal 2 damage to your opponent.;;2;100016;COMMON;;;;;',NULL,NULL,NULL,NULL),(170,'212;RED;Blood Singer;creature;;3;;;2;;2;4;Whenever an enemy creature dies, deal 1 damage to your opponent.;;2;100016;COMMON;;;;;',NULL,NULL,NULL,NULL),(171,'213;RED;Seifer\'s Fodder;creature;;4;;;1;;4;3;{last_words} - Deal 2 damage to your opponent.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(172,'214;RED;Flame Spitter;creature;;3;;;1;;2;2;{gift} - Deal 1 damage to an enemy.;;2;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(173,'215;RED;Lord of Terror;creature;;6;;;3;;0;6;Whenever your opponent is dealt damage, gain that much Attack.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(174,'216;RED;Shedim Pest;creature;;4;;;1;;4;3;{gift} - Gain +2/+0 if you have another creature with higher Attack than Life.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(175,'217;RED;Blood Obelisk;structure;;2;;;2;;;2;Whenever an enemy creature dies in combat, deal 1 damage to your opponent and gain {faeria|1}.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(176,'218;RED;Grim Guard;creature;;4;;;2;;2;5;{taunt} {combat} - Deal 2 damage to your opponent.;;2;100016;RARE;;;;;',NULL,NULL,NULL,NULL),(177,'223;RED;Bomb Slinger;creature;;5;;;3;;4;1;{gift} - Deal 4 damage to an adjacent enemy creature or structure.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(178,'224;RED;Cannon Carrier;creature;;7;;;1;;2;5;{gift} - Give {ranged_attack} to a friendly creature.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(179,'225;RED;Flame Burst;event;;3;;;2;;;;Deal 3 damage.;;2;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(180,'226;RED;Flame Thrower;creature;;3;;;3;;3;2;{ranged_attack} Whenever this creature attacks a god, deal 1 damage to all enemy creatures.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(181,'231;RED;Volcanic Colossus;creature;;12;;;2;;7;7;{ranged_attack} Costs {faeria|1} less for each enemy creature that has died in combat (minimum cost: {faeria|7}).;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(182,'232;RED;Garudan, Heart of the Mountain;creature;;10;;;2;;6;6;{flying}, {charge|2} {gift} - Deal 3 damage to all enemy creatures.;;0;101000;LEGENDARY;;;;;',NULL,NULL,NULL,NULL),(183,'233;RED;Fire Elemental;creature;;4;;;1;;5;2;{gift} - Create a mountain.;;2;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(184,'234;RED;Flamesilk Faerie;creature;;2;;;2;;1;1;{flying} The first time you draw an event, gain +3/+1 and {ranged_attack}.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(185,'235;RED;Derelict Tower;structure;;3;;;2;;;3;{activate} - Deal 1 damage. Deal 1 damage to this structure.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(186,'236;RED;Bloodfire Wisp;creature;;4;;;2;;1;2;Whenever an enemy creature dies, gain +2/+1.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(187,'237;RED;Groundshaker;creature;;6;;;2;;5;6;{gift} - Deal 1 damage to ALL enemies.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(188,'238;RED;Firebringer;creature;;4;;;2;;1;1;Gain +1/+1 whenever you summon a creature with higher Attack than Life (while in your deck or hand).;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(189,'239;RED;Blazing Salamander;creature;;5;;;2;;2;5;{gift} - Deal 2 damage to all adjacent enemy creatures.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(190,'240;RED;Bloodstone Sprite;creature;;4;;;1;;4;4;Whenever you harvest from an opponent\'s well, deal 1 damage to your opponent.;;2;100015;EPIC;;;;;',NULL,NULL,NULL,NULL),(191,'241;RED;Seifer\'s Wrath;event;;2;;;2;;;;Deal 2 damage to a creature. If it dies, deal 2 damage to its controller.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(192,'242;RED;Devouring Plant;structure;;2;;;2;;;5;{taunt} {production} - Deal 2 damage to adjacent enemy creatures.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(193,'243;RED;Firebomb;event;;4;;;2;;;;Deal 4 damage to a creature or structure.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(194,'244;RED;Firestorm;event;;6;;;3;;;;Deal 3 damage to all enemy creatures.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(195,'245;RED;Battle Rager;creature;;7;;;1;;7;3;Whenever this creature is dealt damage, deal that much damage back to your opponent.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(196,'246;RED;Crumbling Golem;creature;;5;;;1;;6;6;Whenever your opponent summons a creature, deal 1 damage to this Golem.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(197,'247;RED;Ogre Dance;event;;4;;;2;;;;A random card in your hand costs {faeria|7} less.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(198,'248;RED;Meteor;event;;12;;;5;;;;Choose a space. Destroy all creatures, structures and lands on, or adjacent to, that space.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(199,'249;RED;Red Devil;creature;;9;;;2;;6;4;{gift} - Gain {faeria|5}.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(200,'250;RED;Ignus, the First Flame;creature;;8;;;3;;4;4;Whenever you select +{faeria|1} from the power wheel, deal 4 damage randomly split among enemies.;;0;101000;LEGENDARY;;;;;',NULL,NULL,NULL,NULL),(201,'251;YELLOW;Oradrim Monk;creature;;3;;;;2;2;1;{haste} Whenever this creature attacks a god, draw a card.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(202,'252;YELLOW;Khalim\'s Prayer;event;;0;;;;2;;;Gain {faeria|2} and draw a card. Play only if you attacked a god this turn. You may pray only once each turn.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(203,'253;YELLOW;Khalim\'s Follower;creature;;1;;;;2;0;1;{haste} Gain +2/+0 against gods.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(204,'254;YELLOW;Oradrim Templar;creature;;3;;;;1;3;3;{dash|1} Gain +3/+0 against gods.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(205,'255;YELLOW;Oradrim Sagittarius;creature;;3;;;;2;1;3;{ranged_attack} Whenever you attack a god, gain {faeria|1}.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(206,'256;YELLOW;Oradrim Fanatic;creature;;3;;;;2;3;2;{jump} {gift} - Move a creature you control.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(207,'257;YELLOW;Desert Twister;event;;0;;;;5;;;Teleport a creature to a desert you control.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(208,'258;YELLOW;Wind Gate;structure;;1;;;;1;;4;You can summon creatures on spaces adjacent to this structure. {activate} - Move Wind Gate.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(209,'259;YELLOW;Malevolent Spirit;creature;;5;;;;1;3;3;{gift} - You drain 2 Life from your opponent.;;2;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(210,'260;YELLOW;Khalim, Sky Prodigy;creature;;5;;;;2;3;6;{flying}, {charge|2} When Khalim attacks a god, add a <b>Khalim\'s Follower</b> to your hand. It costs {faeria|0}.;;0;101000;LEGENDARY;;;;;',NULL,NULL,NULL,NULL),(211,'261;YELLOW;Slaughtering Shadow;creature;;3;;;;1;6;1;;;2;100017;COMMON;;;;;',NULL,NULL,NULL,NULL),(212,'262;YELLOW;Deathwish Ghoul;creature;;3;;;;2;3;1;{last_words} - Gain {faeria|2}.;;2;100017;COMMON;;;;;',NULL,NULL,NULL,NULL),(213,'263;YELLOW;Last Nightmare;event;;6;;;;3;;;Destroy a creature.;;2;100019;RARE;;;;;',NULL,NULL,NULL,NULL),(214,'264;YELLOW;Soul Pact;event;;0;;;;2;;;Gain {faeria|2} and deal 2 damage to yourself.;;2;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(215,'265;YELLOW;Altar of Souls;structure;;2;;;;3;;3;{activate} - Deal 2 damage to yourself and add a 6/1 <b>Slaughtering Shadow</b> to your hand. It costs {faeria|2}.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(216,'266;YELLOW;Shaytan Demon;creature;;3;;;;2;5;4;{production} - Deal 2 damage to yourself.;;2;100019;COMMON;;;;;',NULL,NULL,NULL,NULL),(217,'267;YELLOW;Khalim\'s Skyguard;creature;;4;;;;2;4;3;{flying} Can be summoned anywhere adjacent to a friendly creature.;;2;100020;COMMON;;;;;',NULL,NULL,NULL,NULL),(218,'268;YELLOW;Khalim\'s Training;event;;1;;;;2;;;Give a creature +1/+0, {flying} and {charge|2}.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(219,'273;YELLOW;Wind Soldier;creature;;3;;;;2;3;1;{haste}, {charge|3} Wind Soldier dies at end of turn.;;2;100018;COMMON;;;;;',NULL,NULL,NULL,NULL),(220,'274;YELLOW;Drakkar Skycaptain;creature;;4;;;;1;2;4;{flying} Whenever you draw a flying creature, it gains +1/+1.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(221,'275;YELLOW;Windborne Emissary;creature;;3;;;;2;3;3;{flying} Has +2/+0 while you control another flying creature.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(222,'276;YELLOW;Shaytan Scavenger;creature;;4;;;;2;4;3;Costs {faeria|2} less if you attacked a god this turn.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(223,'277;YELLOW;Dune Drake;creature;;4;;;;1;3;4;{flying}, {charge|2} Can\'t harvest faeria.;;2;100020;COMMON;;;;;',NULL,NULL,NULL,NULL),(224,'278;YELLOW;Windborne Champion;creature;;5;;;;5;5;5;{flying}, {charge|5} {gift} - Move a creature.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(225,'287;YELLOW;Windstorm Colossus;creature;;10;;;;2;7;7;{dash|3} Costs {faeria|1} less for each event you\'ve played (minimum cost: {faeria|5}).;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(226,'288;YELLOW;Azarai, Wrath of the Desert;creature;;10;;;;2;6;6;{flying}, {charge|2} {gift} - Azarai drains 2 Attack from each enemy creature.;;0;101000;LEGENDARY;;;;;',NULL,NULL,NULL,NULL),(227,'289;YELLOW;Air Elemental;creature;;4;;;;1;4;2;{flying} {gift} - Create a desert.;;2;100018;COMMON;;;;;',NULL,NULL,NULL,NULL),(228,'290;YELLOW;Sunsilk Faerie;creature;;2;;;;2;1;1;{flying} The first time you draw an event, gain +3/+1 and {charge|3}.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(229,'291;YELLOW;Celestial Tower;structure;;2;;;;2;;3;{activate} - Give a creature {charge|3} this turn. Deal 1 damage to this structure.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(230,'292;YELLOW;Wind Wisp;creature;;4;;;;1;1;2;{flying}, {charge|3} Whenever you attack a god, gain +3/+0.;;2;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(231,'293;YELLOW;Flash Wind;event;;0;;;;2;;;{options|Move a friendly creature.| You may pay {faeria|3} more to move an enemy creature instead.} - Move a friendly creature.  - You may pay {faeria|3} more to move an enemy creature instead.;;2;100020;RARE;;;;;',NULL,NULL,NULL,NULL),(232,'294;YELLOW;Golden Aviary;structure;;3;;;;2;;2;All your flying creatures have +2/+0.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(233,'295;YELLOW;Zealous Crusader;creature;;4;;;;2;3;3;{charge|2} Gain +1/+1 each time you attack a god (while in your deck or hand).;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(234,'296;YELLOW;Keldran Soldier;creature;;2;;;;1;3;2;;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(235,'297;YELLOW;Lord of the Wastes;creature;;5;;;;1;7;3;{gift} - You may sacrifice another creature to gain {faeria|3}.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(236,'298;YELLOW;Shaytan Assassin;creature;;3;;;;2;1;1;{deathtouch} {gift} - You may sacrifice another creature to give this creature {protection}.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(237,'299;YELLOW;Demon Wrangler;creature;;2;;;;1;2;1;{gift} - You may sacrifice another creature, summoning a 5/2 {flying} <b>Demon Wing</b> in its place.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(238,'300;YELLOW;Death Walker;creature;;3;;;;2;6;4;{deathtouch} You must sacrifice another creature to summon this creature.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(239,'301;YELLOW;Oath to Oblivion;event;;2;;;;2;;;Destroy a friendly creature. Summon a 6/3 <b>Oblivion Rider</b> with {charge|3} in its place.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(240,'302;YELLOW;Shaytan Monstrosity;creature;;6;;;;4;0;4;{charge|2} Whenever a friendly creature dies, this creature drains its attack.;;2;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(241,'303;YELLOW;Iona, Beloved by All;creature;;2;;;;2;2;1;{flying} Can\'t be attacked.;;0;101000;LEGENDARY;;;;;',NULL,NULL,NULL,NULL),(242,'304;YELLOW;Demon Wing;creature;;3;;;;1;5;2;{flying};;2;100017;COMMON;;;;;',NULL,NULL,NULL,NULL),(243,'305;YELLOW;Oblivion Rider;creature;;5;;;;1;6;3;{charge|3};;2;100018;COMMON;;;;;',NULL,NULL,NULL,NULL),(244,'306;YELLOW;Soul Drain;event;;2;;;;2;;;Drain 2 Life from a creature.;;2;100019;COMMON;;;;;',NULL,NULL,NULL,NULL),(245,'307;YELLOW;Choking Sand;event;;4;;;;2;;;Destroy a creature with 3 Attack or less.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(246,'308;YELLOW;Doomgate, Door to Oblivion;structure;;3;;;;2;;3;When this structure has 13 Life or more, destroy it and summon <b>Ostregoth</b>. {activate} - Destroy a friendly creature, draw a card and this gains +2 Life.;;0;101000;LEGENDARY;;;;;',NULL,NULL,NULL,NULL),(247,'309;YELLOW;Windstorm Archer;creature;;2;;;;2;1;2;{ranged_attack} Whenever you play an event, gain +1/+0 this turn.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(248,'310;YELLOW;Windstorm Charger;creature;;3;;;;2;2;4;{charge|2} Whenever you play an event, gain +2/+0 this turn (limit +6/+0).;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(249,'311;HUMAN;Apex Predator;creature;;7;3;3;;;3;3;{jump} {gift} - Gain Attack and Life equal to any creature\'s.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(250,'312;HUMAN;Icerock Behemoth;creature;;8;3;;3;;8;8;{taunt}, {protection};;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(251,'313;HUMAN;Twinsoul Spirit;creature;;4;3;;;3;4;3;{flying} Can be summoned adjacent to a friendly creature. {gift} - Summon another <b>Twinsoul Spirit</b>.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(252,'314;HUMAN;Crackthorn Beast;creature;;6;;3;3;;3;3;{dash|2} {gift} - Deal 4 damage randomly split among enemies. Give +4/+4 randomly split among allies.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(253,'315;HUMAN;Soul Eater;creature;;5;;3;;3;1;1;{flying}, {charge|3} Gain +1/+1 for each friendly creature that has died this game.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(254,'316;HUMAN;Scourgeflame Specter;creature;;7;;;3;3;2;5;{flying}, {haste}, {charge|2} {combat} - Deal 3 damage to your opponent.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(255,'329;HUMAN;Cutthroat Bandit;creature;;3;;;;;4;1;;;2;100002;COMMON;;;;;',NULL,NULL,NULL,NULL),(256,'335;HUMAN;Rebel Slinger;creature;;3;;;;;2;2;{gift} - Deal 2 damage to your opponent.;;2;100002;COMMON;;;;;',NULL,NULL,NULL,NULL),(257,'350;HUMAN;Three Wishes;event;;3;2;2;2;2;;;Gain 3 Life and copy the top 3 cards of your opponent\'s deck. They cost {faeria|3} less. You cannot wish for more wishes.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(258,'351;HUMAN;Rebel Glider;creature;;3;;;;;2;3;{flying}, {dash|2} Can\'t harvest faeria.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(259,'352;HUMAN;Radiance, Imperial Airship;creature;;20;;;;;10;10;{flying}, {dash|3} Radiance\'s faeria cost equals your Life total. {gift} - Gain 1 Life for each card in your hand.;;0;101000;LEGENDARY;;;;;',NULL,NULL,NULL,NULL),(260,'353;BLUE;Forbidden Library;structure;;1;4;;;;;2;{production} - Draw a card, gain {faeria|2} and deal 2 damage to yourself.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(261,'354;BLUE;Dream Reaver;creature;;7;7;;;;7;10;{dash|3} {gift} - Set a god\'s Life to 10.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(262,'355;GREEN;Feral Kodama;creature;;5;;4;;;5;5;{jump} Can\'t harvest faeria. Whenever this creature attacks a god, gain 5 Life.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(263,'356;GREEN;God Hunter;creature;;3;;2;;;5;4;{jump} Can only attack gods. Can\'t harvest faeria.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(264,'357;RED;Blood Song;event;;4;;;2;;;;Reduce the cost of a random card in your hand by {faeria|2} four times. Deal 4 damage to yourself.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(265,'358;RED;Hellfire;event;;7;;;2;;;;Deal 9 damage randomly split among enemies.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(266,'359;YELLOW;Doomsday;event;;9;;;;2;;;Set your faeria to {faeria|0}. Halve your Life (rounded down). Destroy ALL creatures and structures. End the turn.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(267,'360;YELLOW;Annoying Gnat;creature;;2;;;;2;1;1;{flying} Can\'t harvest faeria. {last_words} - Deal 2 damage to yourself. Summon this creature in a random space.;;0;101000;EPIC;;;;;',NULL,NULL,NULL,NULL),(268,'361;HUMAN;Long-horned Yak;creature;;3;;;;;2;2;{last_words} - The next creature you draw gains Attack equal to this creature\'s.;;0;101000;COMMON;;;;;',NULL,NULL,NULL,NULL),(269,'362;HUMAN;Time of Legends;event;;1;;;;;;;Draw the top legend in your deck. If there are no legends to answer the call, {options|Shuffle a random green legend into your deck|Shuffle a random blue legend into your deck|Shuffle a random red legend into your deck|Shuffle a random yellow legend into your deck} color. Shuffle a random legend of that color into your deck.;;0;101000;LEGENDARY;;;;;',NULL,NULL,NULL,NULL),(270,'363;BLUE;Triton Trainer;creature;;4;2;;;;3;3;{jump} {gift} - Give the next {jump} creature you summon +2/+2.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(271,'364;GREEN;Voice of Truth;creature;;4;;2;;;1;5;{gift} - Restore a creature to its original Attack and Life.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(272,'365;RED;Herald of War;creature;;3;;;2;;3;3;{combat} - Give the next {combat} creature you summon +1/+1.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(273,'366;YELLOW;Mistral Guide;creature;;4;;;;4;4;4;{flying} Friendly creatures summoned adjacent to this creature gain {dash|2} and {flying}.;;0;101000;RARE;;;;;',NULL,NULL,NULL,NULL),(274,'403;PANDORA;Dark Crystal;event;;8;;;;;;;Drain 4 Life from your opponent, deal 3 damage to all enemy creatures, and draw 2 cards.;;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL),(275,'404;PANDORA;Yakhorn Warhorn;event;;6;;;;;;;Summon three 2/4 <b>Angry Prairie Yaks</b> with haste.;;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL),(276,'405;PANDORA;Astral Weapon;creature;;14;;;;;7;7;{flying} {gift} - Destroy all adjacent creatures, structures and lands.;;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL),(277,'406;PANDORA;Ocarina;event;;10;;;;;;;Take an extra turn after this one.;;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL),(278,'407;PANDORA;Djinn\'s Lamp;event;;3;;;;;;;{options|Add 3 random green cards to your hand. They cost {faeria|3} less|Add 3 random blue cards to your hand. They cost {faeria|3} less|Add 3 random red cards to your hand. They cost {faeria|3} less|Add 3 random yellow cards to your hand. They cost {faeria|3} less} Choose a color. Add 3 random cards of that color to your hand. They cost {faeria|3} less.;;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL),(279,'408;PANDORA;Urn of Gabria;event;;0;;;;;;;Draw 2 cards and gain {faeria|2}.;;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL),(280,'409;PANDORA;Iona\'s Mirror;event;;2;;;;;;;Add two copies of the last <b>Treasure</b> your opponent played to your hand.;;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL),(281,'410;PANDORA;Bloodstone Golem;creature;;3;;;;;5;6;{production} - Create {faeria|1} in each well. Whenever faeria is harvested, deal 1 damage to your opponent.;;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL),(282,'411;PANDORA;Chalice from the Palace;event;;3;;;;;;;Give +6/+6 randomly split among friendly creatures.;;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL),(283,'412;PANDORA;Eredon\'s Drum;event;;8;;;;;;;Give all your creatures +2/+2, wherever they are.;;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL),(284,'413;PANDORA;Cloud Machine;structure;;3;;;;;;4;Friendly creatures have {flying}, {jump} and +1/+0.;;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL),(285,'414;PANDORA;Ring of Dominion;event;;0;;;;;;;{options|Transform a land to a forest. Gain control of it.|Transform a land to a lake. Gain control of it.|Transform a land to mountain. Gain control of it.|Transform a land to a desert. Gain control of it.} Transform a land into the color of your choice. Gain control of it.;;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL),(286,'415;PANDORA;The World\'s Tear;event;;2;;;;;;;Transform a creature that attacked a god this turn into a 10/10 <b>Sky Swallower</b> with {flying}.;;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL),(287,'416;PANDORA;Clockwork Yak;creature;;4;;;;;6;9;{dash|2};;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL),(288,'417;PANDORA;Equinox Automaton;creature;;6;;;;;6;6;{gift} - You gain 6 Life. {last_words} - Deal 6 damage to your opponent.;;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL),(289,'418;PANDORA;Magda\'s Rose;event;;9;;;;;;;Gain control of an enemy creature.;;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL),(290,'419;PANDORA;Aurora\'s Teapot;event;;5;;;;;;;Change the base Attack and Life of all friendly creatures to 6/6.;;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL),(291,'420;PANDORA;Stone of Fair Fortune;event;;0;;;;;;;Shuffle 3 random <b>Treasures</b> into your deck.;;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL),(292,'421;PANDORA;Secret of Strength;event;;4;;;;;;;Give a creature {flying}, {charge|3} and +4/+4.;;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL),(293,'422;PANDORA;Void Guardian;creature;;0;;;;;9;9;{gift} - Destroy your deck.;;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL),(294,'423;PANDORA;Crystal Dragon;creature;;3;;;;;6;6;{flying}, {charge|3};;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL),(295,'424;PANDORA;Flame Burst Ruby;event;;1;;;;;;;{options|Deal 3 damage.|Deal 3 damage to everything.} - Deal 3 damage. - Deal 3 damage to everything.;;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL),(296,'425;PANDORA;Hammer of Destruction;event;;3;;;;;;;Deal 5 damage. Shuffle the <b>Hammer</b> into your deck.;;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL),(297,'426;PANDORA;Earthfire Shaker;creature;;6;;;;;2;2;{gift} - Deal 2 damage to all enemies. For each enemy destroyed, gain +2/+2.;;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL),(298,'427;PANDORA;Death\'s Desire;event;;0;;;;;;;Destroy a creature. Its controller gains faeria equal to its cost and draws 2 cards.;;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL),(299,'428;PANDORA;Bottled Lightning;event;;6;;;;;;;Deal 6 damage to a creature and 3 damage to all adjacent enemies.;;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL),(300,'429;PANDORA;Dancing Blade;creature;;5;;;;;0;6;{flying}, {jump} At the end of your turn, deal 3 damage to all adjacent enemies.;;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL),(301,'430;PANDORA;Doom Scythe;event;;5;;;;;;;Destroy a creature. Summon a 6/1 <b>Slaughtering Shadow</b> in its place.;;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL),(302,'431;PANDORA;Jeweled Magpie;creature;;3;;;;;1;5;{flying}, {haste} Whenever this creature attacks a god, add a random <b>Treasure</b> to your hand.;;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL),(303,'432;PANDORA;Wheel of Chaos;event;;2;;;;;;;{options|Destroy 2 unoccupied lands.|Destroy a creature with 5 Attack or less.|Gain 7 Life.} - Destroy 2 unoccupied lands. - Destroy a creature with 5 Attack or less. - Gain 7 Life.;;0;107777;RARE;;;;;',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cartas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `conteudo` varchar(400) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comentarios_posts1_idx` (`post_id`),
  KEY `fk_comentarios_users1_idx` (`user_id`),
  CONSTRAINT `fk_comentarios_posts1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentarios_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cores`
--

DROP TABLE IF EXISTS `cores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `chave` varchar(45) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cores`
--

LOCK TABLES `cores` WRITE;
/*!40000 ALTER TABLE `cores` DISABLE KEYS */;
INSERT INTO `cores` VALUES (1,'neutro','HUMAN',NULL,NULL,NULL),(2,'deserto','YELLOW',NULL,NULL,NULL),(3,'montanha','RED',NULL,NULL,NULL),(4,'lago','BLUE',NULL,NULL,NULL),(5,'floresta','GREEN',NULL,NULL,NULL),(6,'pandora','PANDORA',NULL,NULL,NULL);
/*!40000 ALTER TABLE `cores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `decks`
--

DROP TABLE IF EXISTS `decks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `decks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deck_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `dificuldade_id` int(11) DEFAULT NULL,
  `modo_id` int(11) NOT NULL,
  `matchup_id` int(11) DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text,
  `custo` decimal(2,1) DEFAULT NULL,
  `likes` int(11) NOT NULL DEFAULT '0',
  `video` varchar(100) DEFAULT NULL,
  `vitorias` int(11) NOT NULL DEFAULT '0',
  `derrotas` int(11) NOT NULL DEFAULT '0',
  `ranking` int(11) DEFAULT NULL,
  `god` int(11) DEFAULT '0',
  `winrate` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `arquivado` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_decks_users1_idx` (`user_id`),
  KEY `fk_decks_dificuldades1_idx` (`dificuldade_id`),
  KEY `fk_decks_modos1_idx` (`modo_id`),
  KEY `fk_decks_decks1_idx` (`deck_id`),
  KEY `fk_decks_matchups1_idx` (`matchup_id`),
  CONSTRAINT `fk_decks_decks1` FOREIGN KEY (`deck_id`) REFERENCES `decks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_decks_dificuldades1` FOREIGN KEY (`dificuldade_id`) REFERENCES `dificuldades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_decks_matchups1` FOREIGN KEY (`matchup_id`) REFERENCES `matchups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_decks_modos1` FOREIGN KEY (`modo_id`) REFERENCES `modos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_decks_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decks`
--

LOCK TABLES `decks` WRITE;
/*!40000 ALTER TABLE `decks` DISABLE KEYS */;
INSERT INTO `decks` VALUES (1,NULL,1,1,1,2,'Thad Crooks','Sint saepe qui quas assumenda qui vitae autem. Corrupti dolor delectus velit voluptatem neque vel quibusdam. Sint fuga impedit impedit totam aut.',4.8,0,NULL,0,0,NULL,0,0,'2017-05-31 14:19:11','2017-05-31 14:19:11',NULL,0),(2,NULL,11,6,2,12,'Jared Gusikowski','Itaque voluptatem consequuntur iste rerum hic molestias illum. Ut est rerum eum magnam non veritatis sapiente natus. Sint animi impedit aut praesentium molestiae culpa ipsa.',4.8,0,NULL,0,0,NULL,0,0,'2017-05-31 14:19:13','2017-05-31 14:19:13',NULL,0),(4,NULL,22,11,1,22,'Amira Dach','Perferendis quos voluptatem saepe ducimus rerum non quo ratione. Est nulla culpa sed earum labore sint quidem. Aut sed iure voluptate numquam perspiciatis.',4.8,0,NULL,0,0,NULL,0,0,'2017-05-31 14:19:16','2017-05-31 14:19:16',NULL,0),(5,NULL,24,12,1,24,'Antonio Barton','Atque laudantium quaerat ut pariatur quo tempore. Sint consequatur facilis quia qui excepturi voluptas omnis. Quia quis deleniti voluptatem autem perferendis non.',4.8,0,NULL,0,0,NULL,0,0,'2017-05-31 14:19:16','2017-05-31 14:19:16',NULL,0),(6,NULL,27,14,1,26,'Camden Hayes V','Consequatur quisquam odio et explicabo cum. Mollitia omnis iste laborum repellat porro nostrum eos. Consequatur vero ut minus est id quia. Sed deserunt esse eos illum voluptas quia.',4.8,0,NULL,1,0,NULL,0,100,'2017-05-31 14:19:17','2017-05-31 14:19:17',NULL,0),(7,NULL,29,15,1,27,'Conor Windler','Voluptas maxime aut possimus deleniti labore. Recusandae quia laudantium dignissimos vel velit. Ducimus sed in quibusdam aut.',4.8,0,NULL,0,0,NULL,0,0,'2017-05-31 14:19:17','2017-05-31 14:19:17',NULL,0),(8,NULL,30,16,1,30,'Antone Grant PhD','Accusamus suscipit voluptatem impedit quae ipsam. Quas ratione repellendus nulla vero occaecati unde est. Accusantium dignissimos illum omnis veniam et minus.',4.8,0,NULL,0,0,NULL,0,0,'2017-05-31 14:19:17','2017-05-31 14:19:17',NULL,0),(9,NULL,32,17,1,31,'Tressa Kuhlman','Quae doloribus culpa eum rem earum suscipit. Nulla consectetur illo voluptates quas. Aut consequuntur repellat in ab nam quasi.',4.8,0,NULL,0,0,NULL,0,0,'2017-05-31 14:19:17','2017-05-31 14:19:17',NULL,0),(10,NULL,33,18,1,35,'Casandra Brekke','Et odio velit numquam nostrum. Sit natus iste consectetur nihil. Et mollitia nostrum eos dolores.',4.8,0,NULL,0,0,NULL,0,0,'2017-05-31 14:19:17','2017-05-31 14:19:17',NULL,0),(11,NULL,35,19,1,36,'Sunny Schuster MD','Quae sint rerum ipsam odio sed veritatis laborum est. Minus maxime ut ducimus incidunt ut placeat consequatur blanditiis. Quo sunt molestias labore eum.',4.8,0,NULL,0,0,NULL,0,0,'2017-05-31 14:19:17','2017-05-31 14:19:17',NULL,0),(12,NULL,36,20,1,39,'Jared Hayes DDS','Et esse dolore ut ut. Consequatur quis quo voluptates quia blanditiis non. Quibusdam voluptatem minima quo ut temporibus soluta sint.',4.8,0,NULL,1,0,NULL,0,100,'2017-05-31 14:19:18','2017-05-31 14:19:18',NULL,0),(13,NULL,39,21,1,40,'Ms. Ozella Kozey IV','Sequi id dolores et temporibus culpa. Est fugit neque molestias quam. At voluptatem tempore modi tempora officiis repudiandae.',4.8,0,NULL,0,0,NULL,0,0,'2017-05-31 14:19:18','2017-05-31 14:19:18',NULL,0),(14,NULL,41,22,1,43,'Kadin Eichmann','Omnis ullam dolore odit quasi iure. Expedita soluta vel quidem illum ad eum est. Perferendis eum velit explicabo earum.',4.8,0,NULL,0,0,NULL,0,0,'2017-05-31 14:19:18','2017-05-31 14:19:18',NULL,0),(15,NULL,43,23,1,44,'Amari Berge','Sequi vel animi sint velit. Quod ex ad accusamus repudiandae. Ipsa consequatur facilis aliquam aut.\nNon sint animi vitae dolores. Qui aut dolor ducimus. Libero aut aut tenetur facere.',4.8,0,NULL,0,0,NULL,0,0,'2017-05-31 14:19:18','2017-05-31 14:19:18',NULL,0),(16,NULL,44,24,2,46,'Vito Conroy','Tempore consequatur omnis necessitatibus dolorem maiores. Ut veritatis nesciunt quasi blanditiis. Ut illum odit qui quae quisquam maxime aut.',4.8,0,NULL,1,0,NULL,0,100,'2017-05-31 14:19:18','2017-05-31 14:19:19',NULL,0),(17,NULL,46,25,2,47,'Sophia Langosh','Repudiandae eaque quidem aut quis. Voluptatibus consectetur repellendus voluptatem tempore itaque quas dolores. Culpa similique eius alias soluta nihil aut numquam. Quia cum ipsum rerum.',4.8,0,NULL,0,0,NULL,0,0,'2017-05-31 14:19:18','2017-05-31 14:19:18',NULL,0),(18,NULL,47,26,2,50,'Jeremy Blick','Eveniet incidunt laudantium voluptatem non doloribus. Quod autem placeat enim. Magnam dolor quidem a ea. Eum rerum fugit modi fugit eveniet.',4.8,0,NULL,0,0,NULL,0,0,'2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,0),(19,NULL,49,27,2,51,'Estelle Rippin','Perferendis voluptates omnis dolorem iste labore. Aut et assumenda autem ducimus. Quis velit aut amet placeat. Quam quis consectetur laudantium officiis autem a vero.',4.8,0,NULL,0,0,NULL,0,0,'2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,0),(20,NULL,50,28,2,55,'Jerome Lind','Commodi quas eos quia doloribus dolor. Voluptatem in ullam saepe pariatur ex.',4.8,0,NULL,9,0,NULL,0,100,'2017-05-31 14:19:19','2017-05-31 14:19:20',NULL,0),(21,NULL,52,29,2,56,'Tito Trantow Sr.','Nam voluptatem aut sunt est voluptas debitis eligendi. Alias quia mollitia nihil ad dolorem eos. Et harum quis ut.',4.8,0,NULL,0,0,NULL,0,0,'2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,0),(22,NULL,53,30,2,58,'Frieda Pfannerstill','Consequatur quam sit accusantium ut et aut. Perferendis magni corrupti tempora placeat culpa consequatur. Minima odio earum qui qui maiores quos voluptatem.',4.8,0,NULL,0,0,NULL,0,0,'2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,0),(23,NULL,54,31,2,60,'Mr. Kelley Trantow MD','Fugiat magni repudiandae eius fugiat rerum iusto officia ex. Atque error magnam consequatur aut sed facere facere. In sed nihil iure atque enim.',4.8,0,NULL,0,0,NULL,0,0,'2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,0),(24,NULL,55,32,2,62,'Mr. Cordell Botsford III','Eveniet totam unde ab sit error sit quia. Autem quia aut corporis incidunt est quidem sunt consectetur. Esse iure voluptatem dignissimos id suscipit.',4.8,0,NULL,0,0,NULL,0,0,'2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,0),(25,NULL,56,33,2,64,'Ms. Joyce Larkin I','Distinctio alias sunt reiciendis qui reiciendis. Consequatur qui officiis aut provident qui. Eum adipisci itaque voluptatem molestiae reprehenderit praesentium.',4.8,0,NULL,0,0,NULL,0,0,'2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,0),(26,NULL,57,34,2,66,'Prof. Erick Johns PhD','Est qui magni quod omnis. Reprehenderit eum sunt velit. Numquam eveniet et magni adipisci eaque et. Est aut dolor repudiandae.',4.8,0,NULL,0,0,NULL,0,0,'2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,0),(27,NULL,58,35,2,68,'Heloise Jenkins PhD','Sed recusandae quia unde. Qui nesciunt perferendis accusamus nobis maiores saepe. Architecto et ipsum magni consequatur mollitia voluptas dolore.',4.8,0,NULL,0,0,NULL,0,0,'2017-05-31 14:19:20','2017-05-31 14:19:20',NULL,0),(28,NULL,59,36,2,70,'Raymond Pacocha','Est ut ipsa nobis sunt voluptatem sit. Velit animi eaque natus maiores. Commodi laudantium accusamus neque modi praesentium iste nostrum. Excepturi sit est sequi sit modi.',4.8,0,NULL,0,0,NULL,0,0,'2017-05-31 14:19:20','2017-05-31 14:19:20',NULL,0),(29,NULL,60,37,2,72,'Ms. Maiya Konopelski','Vel nostrum dolor quos quia. Odit exercitationem nisi non rerum dolor fuga. Recusandae corrupti libero voluptates nobis sunt voluptates. Quisquam magnam tenetur earum eius enim atque vel.',4.8,0,NULL,0,0,NULL,0,0,'2017-05-31 14:19:20','2017-05-31 14:19:20',NULL,0),(30,NULL,61,38,2,74,'Prof. Kiarra D\'Amore','Molestias consequatur reiciendis officia ipsam. At fugiat dolorem ipsum ullam unde. Modi debitis itaque ullam deleniti ut nostrum.',4.8,0,NULL,0,0,NULL,0,0,'2017-05-31 14:19:20','2017-05-31 14:19:20',NULL,0),(31,NULL,62,NULL,1,77,'Deck bat1','askdu aosdu asoiu',0.0,0,NULL,2,1,NULL,0,67,'2017-05-31 14:22:36','2017-05-31 14:23:24',NULL,0),(32,NULL,62,NULL,2,81,'pand1','asdasdasd',0.0,0,NULL,0,2,NULL,0,0,'2017-05-31 14:23:55','2017-05-31 14:24:53',NULL,0);
/*!40000 ALTER TABLE `decks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dificuldades`
--

DROP TABLE IF EXISTS `dificuldades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dificuldades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `chave` varchar(45) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dificuldades`
--

LOCK TABLES `dificuldades` WRITE;
/*!40000 ALTER TABLE `dificuldades` DISABLE KEYS */;
INSERT INTO `dificuldades` VALUES (1,'Gia Collins','DIFICIL','2017-05-31 14:19:11','2017-05-31 14:19:11',NULL),(2,'Dr. Melany Morar','DIFICIL','2017-05-31 14:19:11','2017-05-31 14:19:11',NULL),(3,'Jamison Bernier DVM','FACIL','2017-05-31 14:19:12','2017-05-31 14:19:12',NULL),(4,'Angelo Parisian','FACIL','2017-05-31 14:19:12','2017-05-31 14:19:12',NULL),(5,'Dr. Winnifred McCullough Jr.','FACIL','2017-05-31 14:19:12','2017-05-31 14:19:12',NULL),(6,'Ofelia Heidenreich','MEDIO','2017-05-31 14:19:13','2017-05-31 14:19:13',NULL),(7,'Zoila Trantow','DIFICIL','2017-05-31 14:19:13','2017-05-31 14:19:13',NULL),(8,'Hannah Schiller','FACIL','2017-05-31 14:19:14','2017-05-31 14:19:14',NULL),(9,'Prof. Clifford Gutkowski DDS','DIFICIL','2017-05-31 14:19:14','2017-05-31 14:19:14',NULL),(10,'Kaitlin Stark','FACIL','2017-05-31 14:19:15','2017-05-31 14:19:15',NULL),(11,'Meaghan Fahey','DIFICIL','2017-05-31 14:19:15','2017-05-31 14:19:15',NULL),(12,'Ignacio McCullough','DIFICIL','2017-05-31 14:19:16','2017-05-31 14:19:16',NULL),(13,'Dr. Calista Witting DVM','MEDIO','2017-05-31 14:19:16','2017-05-31 14:19:16',NULL),(14,'Camylle Hane III','FACIL','2017-05-31 14:19:17','2017-05-31 14:19:17',NULL),(15,'Deangelo Vandervort','FACIL','2017-05-31 14:19:17','2017-05-31 14:19:17',NULL),(16,'Dr. Lowell Brekke III','MEDIO','2017-05-31 14:19:17','2017-05-31 14:19:17',NULL),(17,'Adelbert Goldner','MEDIO','2017-05-31 14:19:17','2017-05-31 14:19:17',NULL),(18,'Nya Walker','MEDIO','2017-05-31 14:19:17','2017-05-31 14:19:17',NULL),(19,'Dorothea Lehner','FACIL','2017-05-31 14:19:17','2017-05-31 14:19:17',NULL),(20,'Prof. Jaylon Simonis Sr.','DIFICIL','2017-05-31 14:19:18','2017-05-31 14:19:18',NULL),(21,'Prof. Chaya Howell II','MEDIO','2017-05-31 14:19:18','2017-05-31 14:19:18',NULL),(22,'Gabrielle Mraz','DIFICIL','2017-05-31 14:19:18','2017-05-31 14:19:18',NULL),(23,'Juliana Koepp','FACIL','2017-05-31 14:19:18','2017-05-31 14:19:18',NULL),(24,'Miss Elvie Green','DIFICIL','2017-05-31 14:19:18','2017-05-31 14:19:18',NULL),(25,'Narciso Ullrich IV','DIFICIL','2017-05-31 14:19:18','2017-05-31 14:19:18',NULL),(26,'Mrs. Muriel Rodriguez','DIFICIL','2017-05-31 14:19:19','2017-05-31 14:19:19',NULL),(27,'Mr. Tomas Goodwin V','FACIL','2017-05-31 14:19:19','2017-05-31 14:19:19',NULL),(28,'Mrs. Lois Stroman','MEDIO','2017-05-31 14:19:19','2017-05-31 14:19:19',NULL),(29,'Dominique Lehner','DIFICIL','2017-05-31 14:19:19','2017-05-31 14:19:19',NULL),(30,'Mr. Franz Conn II','MEDIO','2017-05-31 14:19:19','2017-05-31 14:19:19',NULL),(31,'Rylee Hodkiewicz','DIFICIL','2017-05-31 14:19:19','2017-05-31 14:19:19',NULL),(32,'Dr. Myrtice Hermann III','FACIL','2017-05-31 14:19:19','2017-05-31 14:19:19',NULL),(33,'Lawrence Lesch','DIFICIL','2017-05-31 14:19:19','2017-05-31 14:19:19',NULL),(34,'Prof. Santa Bernier','DIFICIL','2017-05-31 14:19:19','2017-05-31 14:19:19',NULL),(35,'Orpha Schiller','MEDIO','2017-05-31 14:19:19','2017-05-31 14:19:19',NULL),(36,'Dr. Lenora Leuschke','MEDIO','2017-05-31 14:19:20','2017-05-31 14:19:20',NULL),(37,'Brigitte McGlynn','DIFICIL','2017-05-31 14:19:20','2017-05-31 14:19:20',NULL),(38,'Felton Rath IV','DIFICIL','2017-05-31 14:19:20','2017-05-31 14:19:20',NULL);
/*!40000 ALTER TABLE `dificuldades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchup_cor`
--

DROP TABLE IF EXISTS `matchup_cor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matchup_cor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matchup_id` int(11) NOT NULL,
  `cor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_matchup_cor_matchups1_idx` (`matchup_id`),
  KEY `fk_matchup_cor_cores1_idx` (`cor_id`),
  CONSTRAINT `fk_matchup_cor_cores1` FOREIGN KEY (`cor_id`) REFERENCES `cores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_matchup_cor_matchups1` FOREIGN KEY (`matchup_id`) REFERENCES `matchups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchup_cor`
--

LOCK TABLES `matchup_cor` WRITE;
/*!40000 ALTER TABLE `matchup_cor` DISABLE KEYS */;
INSERT INTO `matchup_cor` VALUES (1,1,2),(2,1,5),(3,1,4),(4,1,3),(5,2,2),(6,2,3),(7,2,4),(8,2,5),(9,3,1),(14,5,1),(15,5,3),(20,7,4),(25,9,1),(30,11,4),(31,11,6),(32,12,2),(33,12,4),(34,13,5),(35,13,6),(40,15,5),(41,15,6),(45,17,2),(46,17,3),(47,17,4),(48,17,6),(51,19,4),(52,19,3),(53,19,2),(54,19,1),(55,20,2),(56,20,3),(57,20,4),(58,20,5),(59,21,1),(60,22,2),(61,22,3),(62,22,4),(63,22,5),(64,23,1),(65,23,3),(66,23,2),(67,23,4),(68,24,2),(69,24,3),(70,24,4),(71,24,5),(72,25,1),(73,25,3),(74,25,5),(75,26,1),(76,26,3),(77,26,5),(78,26,2),(79,27,2),(80,27,5),(81,27,4),(82,28,1),(83,28,5),(84,29,1),(85,29,5),(86,30,5),(87,30,1),(88,31,3),(89,31,4),(90,31,5),(91,32,5),(92,32,3),(93,35,4),(94,35,1),(95,36,1),(96,36,2),(97,36,3),(98,37,5),(99,37,2),(102,39,4),(103,39,2),(104,39,3),(105,40,1),(106,40,5),(107,40,3),(108,40,4),(109,41,2),(110,41,1),(111,41,5),(112,42,2),(113,42,1),(114,42,5),(115,43,3),(116,43,4),(117,43,2),(118,43,1),(119,44,3),(120,45,3),(121,45,2),(122,46,4),(123,46,5),(124,46,6),(125,47,2),(126,47,5),(127,47,6),(128,48,5),(129,48,6),(130,49,5),(131,49,6),(132,50,5),(133,50,3),(134,50,4),(135,50,6),(136,51,2),(137,51,4),(138,51,6),(139,52,3),(140,52,5),(141,52,2),(142,52,6),(143,53,2),(144,53,4),(145,53,5),(146,53,3),(147,53,6),(153,55,5),(154,55,2),(155,55,6),(156,56,2),(157,56,3),(158,56,6),(159,57,2),(160,57,5),(161,57,6),(162,58,3),(163,58,6),(164,59,2),(165,59,5),(166,59,6),(167,60,2),(168,60,3),(169,60,6),(170,61,2),(171,61,4),(172,61,6),(173,62,4),(174,62,2),(175,62,5),(176,62,6),(177,63,3),(178,63,2),(179,63,4),(180,63,6),(181,64,2),(182,64,6),(183,65,3),(184,65,5),(185,65,6),(186,66,4),(187,66,5),(188,66,6),(189,67,4),(190,67,6),(191,68,3),(192,68,4),(193,68,6),(194,69,4),(195,69,3),(196,69,6),(197,70,4),(198,70,5),(199,70,2),(200,70,6),(201,71,2),(202,71,6),(203,72,5),(204,72,6),(205,73,4),(206,73,2),(207,73,3),(208,73,6),(209,74,2),(210,74,5),(211,74,6),(212,75,4),(213,75,6),(214,76,3),(215,76,4),(216,77,3),(217,77,4),(218,78,5),(219,78,4),(220,79,2),(221,79,3),(222,80,2),(223,80,5),(224,80,4),(225,81,3),(226,81,4),(227,83,2),(228,83,4),(229,84,2);
/*!40000 ALTER TABLE `matchup_cor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchup_tipo`
--

DROP TABLE IF EXISTS `matchup_tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matchup_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `matchup_id` int(11) NOT NULL,
  `tipo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_matchup_tipo_matchups1_idx` (`matchup_id`),
  KEY `fk_matchup_tipo_tipos1_idx` (`tipo_id`),
  CONSTRAINT `fk_matchup_tipo_matchups1` FOREIGN KEY (`matchup_id`) REFERENCES `matchups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_matchup_tipo_tipos1` FOREIGN KEY (`tipo_id`) REFERENCES `tipos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchup_tipo`
--

LOCK TABLES `matchup_tipo` WRITE;
/*!40000 ALTER TABLE `matchup_tipo` DISABLE KEYS */;
INSERT INTO `matchup_tipo` VALUES (1,1,6),(2,2,6),(3,3,8),(5,5,8),(7,7,8),(9,9,1),(11,11,4),(12,12,4),(13,13,1),(15,15,8),(17,17,7),(19,19,1),(20,20,1),(21,21,5),(22,22,5),(23,23,8),(24,24,8),(25,25,2),(26,26,2),(27,27,3),(28,28,7),(29,29,7),(30,30,8),(31,31,5),(32,32,8),(33,33,4),(35,35,2),(36,36,7),(37,37,3),(39,39,1),(40,40,8),(41,41,2),(42,42,2),(43,43,4),(44,44,8),(45,45,2),(46,46,4),(47,47,5),(48,48,1),(49,49,1),(50,50,5),(51,51,1),(52,52,6),(53,53,4),(55,55,2),(56,56,8),(57,57,8),(58,58,8),(59,59,1),(60,60,8),(61,61,5),(62,62,6),(63,63,4),(64,64,3),(65,65,8),(66,66,5),(67,67,3),(68,68,5),(69,69,6),(70,70,1),(71,71,4),(72,72,6),(73,73,7),(74,74,4),(75,75,5),(76,76,8),(77,76,7),(78,76,1),(79,76,5),(80,77,7);
/*!40000 ALTER TABLE `matchup_tipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matchups`
--

DROP TABLE IF EXISTS `matchups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matchups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `arquetipo_id` int(11) DEFAULT NULL,
  `hash` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_matchups_arquetipos1_idx` (`arquetipo_id`),
  KEY `idx_hash` (`hash`),
  CONSTRAINT `fk_matchups_arquetipos1` FOREIGN KEY (`arquetipo_id`) REFERENCES `arquetipos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matchups`
--

LOCK TABLES `matchups` WRITE;
/*!40000 ALTER TABLE `matchups` DISABLE KEYS */;
INSERT INTO `matchups` VALUES (1,'2017-05-31 14:19:11','2017-05-31 14:19:11',NULL,1,NULL),(2,'2017-05-31 14:19:11','2017-05-31 14:19:11',NULL,1,'1#2345#6'),(3,'2017-05-31 14:19:11','2017-05-31 14:19:11',NULL,1,NULL),(5,'2017-05-31 14:19:12','2017-05-31 14:19:12',NULL,2,NULL),(7,'2017-05-31 14:19:12','2017-05-31 14:19:12',NULL,1,NULL),(9,'2017-05-31 14:19:12','2017-05-31 14:19:12',NULL,3,NULL),(11,'2017-05-31 14:19:13','2017-05-31 14:19:13',NULL,2,NULL),(12,'2017-05-31 14:19:13','2017-05-31 14:19:13',NULL,2,'2#24#4'),(13,'2017-05-31 14:19:14','2017-05-31 14:19:14',NULL,1,NULL),(15,'2017-05-31 14:19:14','2017-05-31 14:19:14',NULL,3,NULL),(17,'2017-05-31 14:19:15','2017-05-31 14:19:15',NULL,1,NULL),(19,'2017-05-31 14:19:15','2017-05-31 14:19:15',NULL,4,NULL),(20,'2017-05-31 14:19:15','2017-05-31 14:19:15',NULL,4,'4#2345#1'),(21,'2017-05-31 14:19:15','2017-05-31 14:19:15',NULL,2,NULL),(22,'2017-05-31 14:19:15','2017-05-31 14:19:15',NULL,2,'2#2345#5'),(23,'2017-05-31 14:19:16','2017-05-31 14:19:16',NULL,3,NULL),(24,'2017-05-31 14:19:16','2017-05-31 14:19:16',NULL,3,'3#2345#8'),(25,'2017-05-31 14:19:16','2017-05-31 14:19:16',NULL,2,NULL),(26,'2017-05-31 14:19:17','2017-05-31 14:19:17',NULL,1,NULL),(27,'2017-05-31 14:19:17','2017-05-31 14:19:17',NULL,4,NULL),(28,'2017-05-31 14:19:17','2017-05-31 14:19:17',NULL,2,NULL),(29,'2017-05-31 14:19:17','2017-05-31 14:19:17',NULL,2,'2#15#7'),(30,'2017-05-31 14:19:17','2017-05-31 14:19:17',NULL,4,NULL),(31,'2017-05-31 14:19:17','2017-05-31 14:19:17',NULL,3,NULL),(32,'2017-05-31 14:19:17','2017-05-31 14:19:17',NULL,4,NULL),(33,'2017-05-31 14:19:17','2017-05-31 14:19:17',NULL,1,NULL),(35,'2017-05-31 14:19:17','2017-05-31 14:19:17',NULL,4,NULL),(36,'2017-05-31 14:19:17','2017-05-31 14:19:17',NULL,1,NULL),(37,'2017-05-31 14:19:17','2017-05-31 14:19:17',NULL,4,NULL),(38,'2017-05-31 14:19:17','2017-05-31 14:19:17',NULL,4,'4#25#3'),(39,'2017-05-31 14:19:18','2017-05-31 14:19:18',NULL,4,NULL),(40,'2017-05-31 14:19:18','2017-05-31 14:19:18',NULL,3,NULL),(41,'2017-05-31 14:19:18','2017-05-31 14:19:18',NULL,1,NULL),(42,'2017-05-31 14:19:18','2017-05-31 14:19:18',NULL,1,'1#125#2'),(43,'2017-05-31 14:19:18','2017-05-31 14:19:18',NULL,2,NULL),(44,'2017-05-31 14:19:18','2017-05-31 14:19:18',NULL,4,NULL),(45,'2017-05-31 14:19:18','2017-05-31 14:19:18',NULL,4,NULL),(46,'2017-05-31 14:19:18','2017-05-31 14:19:18',NULL,1,NULL),(47,'2017-05-31 14:19:18','2017-05-31 14:19:18',NULL,4,NULL),(48,'2017-05-31 14:19:18','2017-05-31 14:19:18',NULL,2,NULL),(49,'2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,2,'2#56#1'),(50,'2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,2,NULL),(51,'2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,4,NULL),(52,'2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,4,NULL),(53,'2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,4,NULL),(55,'2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,2,NULL),(56,'2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,3,NULL),(57,'2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,1,NULL),(58,'2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,2,NULL),(59,'2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,2,NULL),(60,'2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,3,NULL),(61,'2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,3,NULL),(62,'2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,2,NULL),(63,'2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,1,NULL),(64,'2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,2,NULL),(65,'2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,3,NULL),(66,'2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,2,NULL),(67,'2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,2,NULL),(68,'2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,1,NULL),(69,'2017-05-31 14:19:20','2017-05-31 14:19:20',NULL,1,NULL),(70,'2017-05-31 14:19:20','2017-05-31 14:19:20',NULL,4,NULL),(71,'2017-05-31 14:19:20','2017-05-31 14:19:20',NULL,4,NULL),(72,'2017-05-31 14:19:20','2017-05-31 14:19:20',NULL,3,NULL),(73,'2017-05-31 14:19:20','2017-05-31 14:19:20',NULL,2,NULL),(74,'2017-05-31 14:19:20','2017-05-31 14:19:20',NULL,1,NULL),(75,'2017-05-31 14:19:20','2017-05-31 14:19:20',NULL,4,NULL),(76,'2017-05-31 14:22:36','2017-05-31 14:22:36',NULL,1,'1#34#1578'),(77,'2017-05-31 14:22:46','2017-05-31 14:22:46',NULL,1,'1#34#7'),(78,'2017-05-31 14:23:07','2017-05-31 14:23:07',NULL,1,'1#45#'),(79,'2017-05-31 14:23:15','2017-05-31 14:23:15',NULL,3,'3#23#'),(80,'2017-05-31 14:23:24','2017-05-31 14:23:24',NULL,3,'3#245#'),(81,'2017-05-31 14:23:55','2017-05-31 14:23:55',NULL,4,'4#34#'),(83,'2017-05-31 14:24:09','2017-05-31 14:24:09',NULL,3,'3#24#'),(84,'2017-05-31 14:24:25','2017-05-31 14:24:25',NULL,3,'3#2#'),(85,'2017-05-31 14:24:37','2017-05-31 14:24:37',NULL,1,'1#4#');
/*!40000 ALTER TABLE `matchups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modos`
--

DROP TABLE IF EXISTS `modos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `chave` varchar(45) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modos`
--

LOCK TABLES `modos` WRITE;
/*!40000 ALTER TABLE `modos` DISABLE KEYS */;
INSERT INTO `modos` VALUES (1,'batalha','BATALHA',NULL,NULL,NULL),(2,'pandora','PANDORA',NULL,NULL,NULL);
/*!40000 ALTER TABLE `modos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pandoratierlist`
--

DROP TABLE IF EXISTS `pandoratierlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pandoratierlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) NOT NULL,
  `cartas_id` int(11) NOT NULL,
  `indice` decimal(2,2) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pandoratierlists_users1_idx` (`users_id`),
  KEY `fk_pandoratierlists_cartas1_idx` (`cartas_id`),
  CONSTRAINT `fk_pandoratierlists_cartas1` FOREIGN KEY (`cartas_id`) REFERENCES `cartas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pandoratierlists_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pandoratierlist`
--

LOCK TABLES `pandoratierlist` WRITE;
/*!40000 ALTER TABLE `pandoratierlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `pandoratierlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partidas`
--

DROP TABLE IF EXISTS `partidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partidas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deck_id` int(11) NOT NULL,
  `matchup_id` int(11) NOT NULL,
  `evento` int(11) NOT NULL,
  `primeiro` int(11) NOT NULL,
  `ranking` int(11) DEFAULT NULL,
  `god` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_decks_partidas_decks1_idx` (`deck_id`),
  KEY `fk_partidas_matchups1_idx` (`matchup_id`),
  CONSTRAINT `fk_decks1` FOREIGN KEY (`deck_id`) REFERENCES `decks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_partidas_matchups1` FOREIGN KEY (`matchup_id`) REFERENCES `matchups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partidas`
--

LOCK TABLES `partidas` WRITE;
/*!40000 ALTER TABLE `partidas` DISABLE KEYS */;
INSERT INTO `partidas` VALUES (1,6,29,1,1,5,0,'2017-05-31 14:19:17','2017-05-31 14:19:17',NULL),(3,12,42,1,0,4,0,'2017-05-31 14:19:18','2017-05-31 14:19:18',NULL),(4,16,49,1,1,NULL,0,'2017-05-31 14:19:19','2017-05-31 14:19:19',NULL),(5,20,57,1,1,NULL,0,'2017-05-31 14:19:20','2017-05-31 14:19:20',NULL),(6,20,59,1,1,NULL,0,'2017-05-31 14:19:20','2017-05-31 14:19:20',NULL),(7,20,61,1,1,NULL,0,'2017-05-31 14:19:20','2017-05-31 14:19:20',NULL),(8,20,63,1,1,NULL,0,'2017-05-31 14:19:20','2017-05-31 14:19:20',NULL),(9,20,65,1,1,NULL,0,'2017-05-31 14:19:20','2017-05-31 14:19:20',NULL),(10,20,67,1,0,NULL,0,'2017-05-31 14:19:20','2017-05-31 14:19:20',NULL),(11,20,69,1,0,NULL,0,'2017-05-31 14:19:20','2017-05-31 14:19:20',NULL),(12,20,71,1,0,NULL,0,'2017-05-31 14:19:20','2017-05-31 14:19:20',NULL),(13,20,73,1,0,NULL,0,'2017-05-31 14:19:20','2017-05-31 14:19:20',NULL),(14,31,78,1,0,NULL,0,'2017-05-31 14:23:07','2017-05-31 14:23:07',NULL),(15,31,79,1,0,NULL,0,'2017-05-31 14:23:15','2017-05-31 14:23:15',NULL),(16,31,80,-1,1,NULL,0,'2017-05-31 14:23:24','2017-05-31 14:23:24',NULL),(17,32,83,-1,0,NULL,0,'2017-05-31 14:24:09','2017-05-31 14:24:09',NULL),(18,32,84,-1,1,NULL,0,'2017-05-31 14:24:25','2017-05-31 14:24:25',NULL);
/*!40000 ALTER TABLE `partidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `conteudo` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_posts_teams1_idx` (`team_id`),
  KEY `fk_posts_users1_idx` (`user_id`),
  CONSTRAINT `fk_posts_teams1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_posts_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '		',
  `updated_at` datetime DEFAULT NULL COMMENT '	',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_teams_users1_idx` (`user_id`),
  CONSTRAINT `fk_teams_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams_users`
--

DROP TABLE IF EXISTS `teams_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams_users` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  `admin` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_teams_users_users_idx` (`user_id`),
  KEY `fk_teams_users_teams1_idx` (`team_id`),
  CONSTRAINT `fk_teams_users_teams1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_teams_users_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams_users`
--

LOCK TABLES `teams_users` WRITE;
/*!40000 ALTER TABLE `teams_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos`
--

DROP TABLE IF EXISTS `tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descricao` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos`
--

LOCK TABLES `tipos` WRITE;
/*!40000 ALTER TABLE `tipos` DISABLE KEYS */;
INSERT INTO `tipos` VALUES (1,'pulo',NULL,NULL,NULL,NULL),(2,'voador',NULL,NULL,NULL,NULL),(3,'combate',NULL,NULL,NULL,NULL),(4,'estruturas',NULL,NULL,NULL,NULL),(5,'sacrificio',NULL,NULL,NULL,NULL),(6,'eventos',NULL,NULL,NULL,NULL),(7,'burn',NULL,NULL,NULL,NULL),(8,'3desejos',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `tipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `api_token` varchar(60) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `locale` varchar(2) NOT NULL DEFAULT 'br',
  PRIMARY KEY (`id`),
  UNIQUE KEY `identificador_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'gibson.craig','Mireya Hand','ukoepp@example.com','$2y$10$kJQ1JgMgEG2qaGKt.floPurNLPiS6hZW1FT6F72KrTr9JtzRAarWu','LnTsqXWSt1','2017-05-31 14:19:11','2017-05-31 14:19:11',NULL,'br'),(2,'kuvalis.lemuel','Verona Toy','qterry@example.com','$2y$10$kJQ1JgMgEG2qaGKt.floPurNLPiS6hZW1FT6F72KrTr9JtzRAarWu','NTFX4xwoKc','2017-05-31 14:19:11','2017-05-31 14:19:11',NULL,'br'),(3,'vfriesen','Providenci McLaughlin','gkemmer@example.net','$2y$10$9vJyY2YYP2cR4HGaJeO6LeF4JEW00lQfutImCSI9dJFkmrcOV6pai','2pSKh1TdOp','2017-05-31 14:19:11','2017-05-31 14:19:11',NULL,'br'),(4,'tremblay.vergie','Dr. Rogers Hyatt','anne.labadie@example.org','$2y$10$9vJyY2YYP2cR4HGaJeO6LeF4JEW00lQfutImCSI9dJFkmrcOV6pai','MOyT1CH6Pv','2017-05-31 14:19:11','2017-05-31 14:19:11',NULL,'br'),(5,'tierra.grant','Marcelina Ondricka','angelica73@example.com','$2y$10$a/lDbVwbNx85kI.piDCaROqzS143uC0OoUZFrIfM9qWvzeXIGtA6.','hgeRrn9dcO','2017-05-31 14:19:12','2017-05-31 14:19:12',NULL,'br'),(6,'laurianne.murphy','Mr. Eli Grant','qjohnson@example.net','$2y$10$a/lDbVwbNx85kI.piDCaROqzS143uC0OoUZFrIfM9qWvzeXIGtA6.','iDVvLHGq7N','2017-05-31 14:19:12','2017-05-31 14:19:12',NULL,'br'),(7,'leann63','Mohammed Pfeffer IV','casey81@example.net','$2y$10$lWr0FfBMDwHovgQ9Ih17M.C1NTKeQ34N16lD2QP6ZcqvbEYPBeAHG','F2FU5bcA2g','2017-05-31 14:19:12','2017-05-31 14:19:12',NULL,'br'),(8,'orie20','Krista Zboncak','immanuel32@example.com','$2y$10$lWr0FfBMDwHovgQ9Ih17M.C1NTKeQ34N16lD2QP6ZcqvbEYPBeAHG','Rz8RP6ckUz','2017-05-31 14:19:12','2017-05-31 14:19:12',NULL,'br'),(9,'norbert.klocko','Miss Nina Schmeler','shaun31@example.com','$2y$10$.nn5DET9/9BjXWzvLWqFvuydivAIbfn7sXaht.M2X40yFUnENpKti','cscQUm3DBP','2017-05-31 14:19:12','2017-05-31 14:19:12',NULL,'br'),(10,'simonis.adrain','Mrs. Althea Turcotte PhD','adam01@example.com','$2y$10$.nn5DET9/9BjXWzvLWqFvuydivAIbfn7sXaht.M2X40yFUnENpKti','33a2iU1aJM','2017-05-31 14:19:12','2017-05-31 14:19:12',NULL,'br'),(11,'genoveva.jacobs','Chase Stroman','elmore.bayer@example.com','$2y$10$56VOJsom5Q0OMeMfaBWD6eff0ftycz1JOUGWGKaEJz4f6J0ttSVJ2','upNSqdrv1s','2017-05-31 14:19:13','2017-05-31 14:19:13',NULL,'br'),(12,'buckridge.oswald','Sonya Greenholt Sr.','rau.edmund@example.net','$2y$10$56VOJsom5Q0OMeMfaBWD6eff0ftycz1JOUGWGKaEJz4f6J0ttSVJ2','cit2UGfny6','2017-05-31 14:19:13','2017-05-31 14:19:13',NULL,'br'),(13,'cbogan','Mrs. Genesis Ziemann','deven11@example.net','$2y$10$mBtaoA7Wkp.sIrQ2E.YGHuOt6ZdZ0UCCw/KurOqe2..7JN6/.Ovoq','WGeJsoQuAQ','2017-05-31 14:19:13','2017-05-31 14:19:13',NULL,'br'),(14,'wmoen','Prof. Juwan Heidenreich Sr.','sydnee.lindgren@example.org','$2y$10$mBtaoA7Wkp.sIrQ2E.YGHuOt6ZdZ0UCCw/KurOqe2..7JN6/.Ovoq','kHkO14HACQ','2017-05-31 14:19:13','2017-05-31 14:19:13',NULL,'br'),(15,'aric.lynch','Lyla Klocko Jr.','leonard.jacobson@example.net','$2y$10$xgYRUZmmiorb3kawVT5NAuZRFfbmOH4XHjj/BwBNT4zr9rxsAOlpu','4NgWCo3TJB','2017-05-31 14:19:14','2017-05-31 14:19:14',NULL,'br'),(16,'fisher.dorothy','Hillard Murphy','wwelch@example.com','$2y$10$xgYRUZmmiorb3kawVT5NAuZRFfbmOH4XHjj/BwBNT4zr9rxsAOlpu','4JC3g9FVi5','2017-05-31 14:19:14','2017-05-31 14:19:14',NULL,'br'),(17,'wiley88','Dr. Rhea Abernathy','martine65@example.org','$2y$10$9c1XzAc4kNGC59/uXrfR4e79EEZ4911tNjhiAvUsxmhmkLSdfHEXa','z9EcMMmWrI','2017-05-31 14:19:14','2017-05-31 14:19:14',NULL,'br'),(18,'jaiden58','Dr. Tyra Towne MD','berniece.williamson@example.com','$2y$10$9c1XzAc4kNGC59/uXrfR4e79EEZ4911tNjhiAvUsxmhmkLSdfHEXa','Ysv3ypxqfN','2017-05-31 14:19:14','2017-05-31 14:19:14',NULL,'br'),(19,'lesch.maude','Major Robel','lydia.shanahan@example.net','$2y$10$m51ztYzLmbBJu.nrJV0EN.kRvslqGSj0qWDqLcdgn015XfHKySoTa','jR8UXwxDnf','2017-05-31 14:19:15','2017-05-31 14:19:15',NULL,'br'),(20,'ismael.davis','Angie Ziemann','koepp.chaim@example.org','$2y$10$m51ztYzLmbBJu.nrJV0EN.kRvslqGSj0qWDqLcdgn015XfHKySoTa','N6tSNhme1b','2017-05-31 14:19:15','2017-05-31 14:19:15',NULL,'br'),(21,'jasper20','Uriah Klocko','sierra.wintheiser@example.org','$2y$10$LKiZDeikxhIURcXxK1u3peiXON2fjSw118gu.a2A0aMUnqkp3tfES','JGGs3UJRuy','2017-05-31 14:19:15','2017-05-31 14:19:15',NULL,'br'),(22,'grady.keven','Sandrine Waters','oceane66@example.com','$2y$10$LKiZDeikxhIURcXxK1u3peiXON2fjSw118gu.a2A0aMUnqkp3tfES','vWyUopa1Qu','2017-05-31 14:19:15','2017-05-31 14:19:15',NULL,'br'),(23,'jjaskolski','Kimberly Zulauf','kjast@example.com','$2y$10$LKiZDeikxhIURcXxK1u3peiXON2fjSw118gu.a2A0aMUnqkp3tfES','dA5TTckt3G','2017-05-31 14:19:15','2017-05-31 14:19:15',NULL,'br'),(24,'durgan.corine','Makayla Quitzon','mschumm@example.com','$2y$10$HuMFKtOB4ddh0HYl5gs/OervFtFmKVj2..Vlk/O7DFc0.YNgA/LYi','PntVSSCyCL','2017-05-31 14:19:16','2017-05-31 14:19:16',NULL,'br'),(25,'lulu.mclaughlin','Randy Schmeler','ara.gottlieb@example.com','$2y$10$HuMFKtOB4ddh0HYl5gs/OervFtFmKVj2..Vlk/O7DFc0.YNgA/LYi','hhLml6fuk8','2017-05-31 14:19:16','2017-05-31 14:19:16',NULL,'br'),(26,'cecil.paucek','Leila Bauch','nbradtke@example.net','$2y$10$HuMFKtOB4ddh0HYl5gs/OervFtFmKVj2..Vlk/O7DFc0.YNgA/LYi','1ZcWtFj9hR','2017-05-31 14:19:16','2017-05-31 14:19:16',NULL,'br'),(27,'quinten.green','Bert Carroll IV','dennis.runolfsdottir@example.com','$2y$10$CDU8by8MDnq.tLCZUV6V/uzft63q74LDakPYPfkK6/lUK.CDsBPTy','ogAWYbpM9K','2017-05-31 14:19:16','2017-05-31 14:19:16',NULL,'br'),(28,'iwolf','Pansy Metz','vandervort.paolo@example.com','$2y$10$CDU8by8MDnq.tLCZUV6V/uzft63q74LDakPYPfkK6/lUK.CDsBPTy','1FntVo46g7','2017-05-31 14:19:17','2017-05-31 14:19:17',NULL,'br'),(29,'eichmann.ethan','Ms. Josefina Morar III','vwitting@example.com','$2y$10$CDU8by8MDnq.tLCZUV6V/uzft63q74LDakPYPfkK6/lUK.CDsBPTy','XM6y5FxJUz','2017-05-31 14:19:17','2017-05-31 14:19:17',NULL,'br'),(30,'chodkiewicz','Cassidy Tremblay','janice.mueller@example.org','$2y$10$OHGhmJABT7l7H2KYwRbe0uyDztmU9AMqYklwTnyJpXKcyC3XHbcu2','uliOHwv7Pp','2017-05-31 14:19:17','2017-05-31 14:19:17',NULL,'br'),(31,'amelia08','Pasquale Hilll','qkautzer@example.net','$2y$10$OHGhmJABT7l7H2KYwRbe0uyDztmU9AMqYklwTnyJpXKcyC3XHbcu2','pVpGHM29dv','2017-05-31 14:19:17','2017-05-31 14:19:17',NULL,'br'),(32,'wolf.kolby','Hassie Crooks','nklocko@example.net','$2y$10$OHGhmJABT7l7H2KYwRbe0uyDztmU9AMqYklwTnyJpXKcyC3XHbcu2','BO8uHO7bsl','2017-05-31 14:19:17','2017-05-31 14:19:17',NULL,'br'),(33,'tdoyle','Tyson Gislason','deonte54@example.net','$2y$10$dFEIdpgU8SWkIRgAV3Wx1OT.N7J77NSZVBrilqrCVzSB0mUhqeSbW','k75GgdTY3B','2017-05-31 14:19:17','2017-05-31 14:19:17',NULL,'br'),(34,'kian38','Anabel Balistreri','rreynolds@example.com','$2y$10$dFEIdpgU8SWkIRgAV3Wx1OT.N7J77NSZVBrilqrCVzSB0mUhqeSbW','ZUS1XBtIjE','2017-05-31 14:19:17','2017-05-31 14:19:17',NULL,'br'),(35,'scot.ledner','Chadrick Bednar','lesch.aimee@example.org','$2y$10$dFEIdpgU8SWkIRgAV3Wx1OT.N7J77NSZVBrilqrCVzSB0mUhqeSbW','GEOV9bz3LT','2017-05-31 14:19:17','2017-05-31 14:19:17',NULL,'br'),(36,'oberbrunner.barrett','Myrtis Orn','darius38@example.net','$2y$10$KH8NAxeHHEe6G/11zBgOGeSn3rdOcwTKiEWdKmAsNKU5qMxeiIPna','7GbZQ203K7','2017-05-31 14:19:18','2017-05-31 14:19:18',NULL,'br'),(37,'arvid.carroll','Berta Kilback','miller.elwin@example.org','$2y$10$KH8NAxeHHEe6G/11zBgOGeSn3rdOcwTKiEWdKmAsNKU5qMxeiIPna','l2MXsmrUaS','2017-05-31 14:19:18','2017-05-31 14:19:18',NULL,'br'),(38,'lbatz','Barrett Hilll','alana94@example.com','$2y$10$KH8NAxeHHEe6G/11zBgOGeSn3rdOcwTKiEWdKmAsNKU5qMxeiIPna','dmXc3y2qaU','2017-05-31 14:19:18','2017-05-31 14:19:18',NULL,'br'),(39,'zack.hayes','Xander Skiles','juston87@example.com','$2y$10$KH8NAxeHHEe6G/11zBgOGeSn3rdOcwTKiEWdKmAsNKU5qMxeiIPna','3aTYDRGuk4','2017-05-31 14:19:18','2017-05-31 14:19:18',NULL,'br'),(40,'willms.brant','Mrs. Madelyn Rau','sasha35@example.com','$2y$10$Ksm4cmrBnleu4cORr1g4gOy9cW1a/aTZpgdLur6NZ4EYoWr.rsZU2','zOpHnsGd3u','2017-05-31 14:19:18','2017-05-31 14:19:18',NULL,'br'),(41,'lizeth60','Gilbert Hammes','kassandra.labadie@example.org','$2y$10$Ksm4cmrBnleu4cORr1g4gOy9cW1a/aTZpgdLur6NZ4EYoWr.rsZU2','4JBDUB0Uei','2017-05-31 14:19:18','2017-05-31 14:19:18',NULL,'br'),(42,'douglas.jerald','Robbie Mosciski','tgoodwin@example.org','$2y$10$Ksm4cmrBnleu4cORr1g4gOy9cW1a/aTZpgdLur6NZ4EYoWr.rsZU2','mx9obNAYsu','2017-05-31 14:19:18','2017-05-31 14:19:18',NULL,'br'),(43,'johnson81','Demetris Zemlak','jayce.hermiston@example.org','$2y$10$Ksm4cmrBnleu4cORr1g4gOy9cW1a/aTZpgdLur6NZ4EYoWr.rsZU2','mqvCYOvhAQ','2017-05-31 14:19:18','2017-05-31 14:19:18',NULL,'br'),(44,'bernard56','Ivy Skiles','hoyt.ruecker@example.org','$2y$10$t9CiiT1DrOWTtFJKuxywo.VstSxGTwE/moNO0q0cCKSnREuzYQgoG','jGnNEGSCJA','2017-05-31 14:19:18','2017-05-31 14:19:18',NULL,'br'),(45,'imogene.wintheiser','Alverta Eichmann','kunde.milan@example.org','$2y$10$t9CiiT1DrOWTtFJKuxywo.VstSxGTwE/moNO0q0cCKSnREuzYQgoG','PESmYdHecO','2017-05-31 14:19:18','2017-05-31 14:19:18',NULL,'br'),(46,'muller.abelardo','Prof. Harrison Feeney','devyn60@example.com','$2y$10$t9CiiT1DrOWTtFJKuxywo.VstSxGTwE/moNO0q0cCKSnREuzYQgoG','icMpfH57Rq','2017-05-31 14:19:18','2017-05-31 14:19:18',NULL,'br'),(47,'reinger.shaylee','Heather Mante','vpfannerstill@example.org','$2y$10$Ct/7DAZAV9kPzt00DB1/VuMiMZeBCzdbiekC9hSKZCMv9bjfjbYh.','B2UbWZ00GF','2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,'br'),(48,'mueller.kayla','Prof. Evelyn Reichert','joanny.johnson@example.net','$2y$10$Ct/7DAZAV9kPzt00DB1/VuMiMZeBCzdbiekC9hSKZCMv9bjfjbYh.','J3YWpvnSAG','2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,'br'),(49,'cgusikowski','Gregory Bogisich','trever.pacocha@example.net','$2y$10$Ct/7DAZAV9kPzt00DB1/VuMiMZeBCzdbiekC9hSKZCMv9bjfjbYh.','9ZWmKN7Sg2','2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,'br'),(50,'lindgren.edmond','Mr. Quinten Zemlak','krutherford@example.net','$2y$10$9fAX0flYVCkzayvIZh1hVOCUWOmMVJwPAvh1pUHzEM0mm9DVH8Saa','aME8Vf4X6g','2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,'br'),(51,'hodkiewicz.helga','Dr. Dean Marquardt DVM','paul40@example.net','$2y$10$9fAX0flYVCkzayvIZh1hVOCUWOmMVJwPAvh1pUHzEM0mm9DVH8Saa','RdxbU2qwYO','2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,'br'),(52,'rahsaan.ullrich','Fleta Harris','zoie.veum@example.org','$2y$10$9fAX0flYVCkzayvIZh1hVOCUWOmMVJwPAvh1pUHzEM0mm9DVH8Saa','uN0V88qaAe','2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,'br'),(53,'lourdes.ohara','Karelle Metz','leuschke.etha@example.org','$2y$10$9fAX0flYVCkzayvIZh1hVOCUWOmMVJwPAvh1pUHzEM0mm9DVH8Saa','fBFxSKjVoj','2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,'br'),(54,'stehr.carmine','Jody Friesen IV','gonzalo.ward@example.net','$2y$10$9fAX0flYVCkzayvIZh1hVOCUWOmMVJwPAvh1pUHzEM0mm9DVH8Saa','tJNBjUaoRS','2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,'br'),(55,'sherwood70','Susie Schroeder V','chandler89@example.com','$2y$10$9fAX0flYVCkzayvIZh1hVOCUWOmMVJwPAvh1pUHzEM0mm9DVH8Saa','1NNoyELabi','2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,'br'),(56,'verdman','Ryan Grant DDS','hkilback@example.com','$2y$10$9fAX0flYVCkzayvIZh1hVOCUWOmMVJwPAvh1pUHzEM0mm9DVH8Saa','mOTIhoaaXc','2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,'br'),(57,'emard.aleen','Dr. Scottie Mann','ratke.ewell@example.com','$2y$10$9fAX0flYVCkzayvIZh1hVOCUWOmMVJwPAvh1pUHzEM0mm9DVH8Saa','6wVdUDrYym','2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,'br'),(58,'nstokes','Dora Hudson','clarson@example.com','$2y$10$9fAX0flYVCkzayvIZh1hVOCUWOmMVJwPAvh1pUHzEM0mm9DVH8Saa','n2Wbp1vmV7','2017-05-31 14:19:19','2017-05-31 14:19:19',NULL,'br'),(59,'eblock','Tamara Mann V','emilia.goyette@example.org','$2y$10$9fAX0flYVCkzayvIZh1hVOCUWOmMVJwPAvh1pUHzEM0mm9DVH8Saa','OOzzSLB9Co','2017-05-31 14:19:20','2017-05-31 14:19:20',NULL,'br'),(60,'francesca.zulauf','Demarco Zulauf','ykemmer@example.org','$2y$10$9fAX0flYVCkzayvIZh1hVOCUWOmMVJwPAvh1pUHzEM0mm9DVH8Saa','CCCoj1pFTN','2017-05-31 14:19:20','2017-05-31 14:19:20',NULL,'br'),(61,'stevie.reinger','Laila Friesen Sr.','luigi.hartmann@example.net','$2y$10$9fAX0flYVCkzayvIZh1hVOCUWOmMVJwPAvh1pUHzEM0mm9DVH8Saa','3ydRSZSASn','2017-05-31 14:19:20','2017-05-31 14:19:20',NULL,'br'),(62,'caio',NULL,'caio@caio.com','$2y$10$lQYjdJFES9b1AmeRruKIduUKQALn.ujbUhM5zp0/UtdNdZBJ/wCa.',NULL,'2017-05-31 14:21:50','2017-05-31 14:21:50',NULL,'br');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-31 11:30:10
