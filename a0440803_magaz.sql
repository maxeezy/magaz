-- MySQL dump 10.13  Distrib 5.7.26-29, for Linux (x86_64)
--
-- Host: localhost    Database: a0440803_magaz
-- ------------------------------------------------------
-- Server version	5.7.26-29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!50717 SELECT COUNT(*) INTO @rocksdb_has_p_s_session_variables FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'session_variables' */;
/*!50717 SET @rocksdb_get_is_supported = IF (@rocksdb_has_p_s_session_variables, 'SELECT COUNT(*) INTO @rocksdb_is_supported FROM performance_schema.session_variables WHERE VARIABLE_NAME=\'rocksdb_bulk_load\'', 'SELECT 0') */;
/*!50717 PREPARE s FROM @rocksdb_get_is_supported */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;
/*!50717 SET @rocksdb_enable_bulk_load = IF (@rocksdb_is_supported, 'SET SESSION rocksdb_bulk_load = 1', 'SET @rocksdb_dummy_bulk_load = 0') */;
/*!50717 PREPARE s FROM @rocksdb_enable_bulk_load */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;

--
-- Table structure for table `adress`
--

DROP TABLE IF EXISTS `adress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adress` (
  `user_id` int(11) NOT NULL,
  `city` text COLLATE utf8mb4_unicode_ci,
  `street` text COLLATE utf8mb4_unicode_ci,
  `house` text COLLATE utf8mb4_unicode_ci,
  `index_adress` text COLLATE utf8mb4_unicode_ci,
  KEY `id` (`user_id`),
  CONSTRAINT `adress_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adress`
--

LOCK TABLES `adress` WRITE;
/*!40000 ALTER TABLE `adress` DISABLE KEYS */;
INSERT INTO `adress` (`user_id`, `city`, `street`, `house`, `index_adress`) VALUES (2,'Профессиональ','Профессиональная','1','414000'),(3,NULL,NULL,NULL,NULL),(4,NULL,NULL,NULL,NULL),(5,NULL,NULL,NULL,NULL),(6,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `adress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `basket`
--

DROP TABLE IF EXISTS `basket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `basket` (
  `user_id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `good_id` (`good_id`),
  CONSTRAINT `basket_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `basket_ibfk_2` FOREIGN KEY (`good_id`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `basket`
--

LOCK TABLES `basket` WRITE;
/*!40000 ALTER TABLE `basket` DISABLE KEYS */;
INSERT INTO `basket` (`user_id`, `good_id`, `count`) VALUES (3,3,1),(2,21,1);
/*!40000 ALTER TABLE `basket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buy`
--

DROP TABLE IF EXISTS `buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status_id` (`status_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `buy_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  CONSTRAINT `buy_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy`
--

LOCK TABLES `buy` WRITE;
/*!40000 ALTER TABLE `buy` DISABLE KEYS */;
INSERT INTO `buy` (`id`, `user_id`, `status_id`, `cost`, `date`) VALUES (25,2,4,250,'2020-04-18 19:20:37'),(26,2,1,250,'2020-04-18 19:23:30'),(27,2,3,450,'2020-04-18 19:25:03'),(28,2,1,850,'2020-05-14 17:33:47'),(29,2,1,1350,'2020-05-14 17:38:38');
/*!40000 ALTER TABLE `buy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buy_goods`
--

DROP TABLE IF EXISTS `buy_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buy_goods` (
  `buy_id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  KEY `buy_id` (`buy_id`),
  KEY `good_id` (`good_id`),
  CONSTRAINT `buy_goods_ibfk_1` FOREIGN KEY (`buy_id`) REFERENCES `buy` (`id`),
  CONSTRAINT `buy_goods_ibfk_2` FOREIGN KEY (`good_id`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buy_goods`
--

LOCK TABLES `buy_goods` WRITE;
/*!40000 ALTER TABLE `buy_goods` DISABLE KEYS */;
INSERT INTO `buy_goods` (`buy_id`, `good_id`, `count`) VALUES (25,3,1),(26,32,1),(27,2,1),(27,9,1),(28,23,1),(28,4,1),(28,6,1),(28,9,1),(29,4,1),(29,6,1),(29,9,1),(29,80,1),(29,47,1);
/*!40000 ALTER TABLE `buy_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`id`, `name`, `img`) VALUES (1,'Joker & Harley','https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513175/img/category/harleyj.jpg'),(6,'Star Wars','https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513175/img/category/starwars.jpg'),(7,'Eat Sweet','https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513174/img/category/eatsweet.jpg'),(8,'Gravity Fols','https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513173/img/category/gravitifolz.jpg'),(9,'Harry Potter','https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513173/img/category/harrypotter.jpg'),(10,'Znacki','https://res.cloudinary.com/dhsrjlsya/image/upload/v1583442851/img/category/znacki.jpg'),(11,'Memes','https://res.cloudinary.com/dhsrjlsya/image/upload/v1583442849/img/category/memes.jpg'),(12,'Batman','https://res.cloudinary.com/dhsrjlsya/image/upload/v1583442847/img/category/batman.jpg'),(13,'Passport','https://res.cloudinary.com/dhsrjlsya/image/upload/v1583442804/img/category/passport.jpg'),(14,'Anime','https://res.cloudinary.com/dhsrjlsya/image/upload/v1583442789/img/category/anime.jpg');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_good`
--

DROP TABLE IF EXISTS `category_good`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_good` (
  `category_id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  KEY `category_id` (`category_id`),
  KEY `good_id` (`good_id`),
  CONSTRAINT `category_good_ibfk_1` FOREIGN KEY (`good_id`) REFERENCES `goods` (`id`),
  CONSTRAINT `category_good_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_good`
--

LOCK TABLES `category_good` WRITE;
/*!40000 ALTER TABLE `category_good` DISABLE KEYS */;
INSERT INTO `category_good` (`category_id`, `good_id`) VALUES (1,47),(1,46),(1,88),(1,89);
/*!40000 ALTER TABLE `category_good` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorites` (
  `user_id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `user_id_2` (`user_id`),
  KEY `good_id` (`good_id`),
  CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`good_id`) REFERENCES `goods` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` (`user_id`, `good_id`) VALUES (2,2),(2,21);
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `good_type`
--

DROP TABLE IF EXISTS `good_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `good_type` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `good_type`
--

LOCK TABLES `good_type` WRITE;
/*!40000 ALTER TABLE `good_type` DISABLE KEYS */;
INSERT INTO `good_type` (`id`, `name`) VALUES (1,'Браслет'),(2,'Кулон'),(3,'Обложка на паспорт'),(4,'Значок');
/*!40000 ALTER TABLE `good_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `price` int(11) NOT NULL,
  `img` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `goods_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `good_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` (`id`, `type_id`, `name`, `description`, `price`, `img`) VALUES (1,4,'Деревянный значок \"Джокер\"','Этот значок выполнен по фильму \"Джокер\", где роль Джокера исполнил непревзойденный Хоакин Феникс. Значок прекрасно подойдет к вашей улыбке,особенно если у вас брекеты.',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583521939/img/joker1_tt0jks.png'),(2,4,'Деревянный значок \"Индейка\"','Вы смотрели сериал Друзья? Где Джоуи хотел испугать Чендлера на День Благодарения, надев на голову Индюшку. Вы можете приобрести мини-версию Индюшки и порадовать себя или своих друзей',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583521936/img/chiken_xaw0i5.png'),(3,4,'Деревянный значок \"Дрэээйк\"','Тот самый Drizzy, с Торонто, которого уничтожил Pusha-T в трэке \"The Story Of Adidon\" под бит из трека Jay-Z.',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583521939/img/nenene_z62huj.png'),(4,4,'Деревянный значок \"Капрал Леви\"','Кто этот милый котик?  Этот милый котик - Капрал Леви! А ведь и не скажешь, что Капрал строг со своими подопечными (и мил с Эреном :))) )',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583521442/img/levi_o7ev9z.png'),(5,4,'Деревянный значок \"Акацуки\"','В течение нескольких десятилетий, Акацуки принимало различные формы и возглавлялось различными людьми. Хотя каждый её состав считался или диверсантами или преступниками, все они стремились сделать мир лучше для жизни согласно собственному видению.',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513964/img/1_63_hsdsra.png'),(6,4,'Деревянный значок \"Хяккимару\"','«Чудовище убивающее чудовищ»..Звучит устрашающе, однако это так.\r\nХяккимару является первоклассным мечником и способен без усилий, вести бой одновременно с несколькими противниками, достаточной быстро, чтобы они не успевали реагировать на все его движения.',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513970/img/hayakamy.png'),(7,4,'Деревянный значок \"Джоскэ\"','Извини... Что ты там сказал о моей причёске?!\r\nС этим значком вы будете выглядеть элегантно и чувствовать уверенность в себе, как Джоске Хигашиката.\r\n \" Это великолепно!	\r\n—グレートだぜ!, Gurēto daz \"',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513964/img/jojo.png'),(8,4,'Деревянный значок Сайтама \"Окей\"','История следует за жизнью героя, который умудряется выигрывать все битвы одним единственным ударом, с этим связано и его имя - Лысое яйцо! Упс, точнее, Ванпанчмен :)',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513966/img/okay.png'),(9,4,'Деревянный значок \"Осаму Дазай\"','Представьте : Вы в хорошем настроении гуляете по парку, вокруг щебечут птички и прекрасная погода. Греет солнышко , вы проходите по мостику через реку...и видите,что в канаве плывет что-то крупное. Спокойнее,это Дазай, он снова совершает очередной суицид. Если вы прекрасная дама, то Дазай будет приятно рад этому.\r\n',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513964/img/dazai.png'),(10,4,'Деревянный значок \"Канеки\"','\"Сегодня в Петрозаводске пожилой пенсионер зонтиком избил скинхеда. Местные жители шокированы. На место происшествия уже успел прибыть наш корреспондент.\" - не будьте Dead inside\'ами, за вас это сделает Канеки.',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513964/img/ghoul.png'),(11,4,'Деревянный значок \"Умару\"','Сон, игры, телевизор, фастфуд, кола — это близкие друзья Умару в домашних условиях, с которыми она всласть развлекается, сгружая бытовые проблемы на брата. Ну что-же, давайте погрузимся в Мир Умару и на минутку представим как мы ленимся сделать вообще что-то, хотя что тут представлять, каждый из нас немного Умару. ',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513965/img/umaru.png'),(12,4,'Деревянный значок \"Шото кид\"','Шото Тодороки всего 15 лет, но он уже умеет управлять силами огня и льда. Один из лучших студентов-первокурсников Геройского факультета Юуэй, Шото стал кумиров миллионов поклонников аниме. Какие тайны сокрыты в прошлом персонажа и как ему удается совмещать несовместимое: пламя и лед?',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513968/img/shkid.png'),(13,4,'Деревянный значок \"Юрий Плисецкий\"','\"- Ногу выше тяни, Плисецкий! А то выглядишь как конь на йоге, не знаешь куда копыто запихать.\"\r\nВ душе Юра - милая булочка, которая злится на Виктора из-за того, что тот стал больше опекать Кацуки. Каждый раз Юра заливается краской от ненависти к Юри, но однажды на очередном соревновании он встречает Отабека..',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513966/img/yuri.png'),(14,4,'Деревянный значок \"Изуку в рюкзаке\"','\"Если все злодеи, с которыми он пришел, на том же уровне, тогда все остальные тоже в опасности. Мало того, их целью оказались мы - ученики. Я должен сообщить об этом Аизаве-сенсею и кошечкам! Если я могу их спасти, то я просто обязан это сделать, понимаешь?\"',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513965/img/izuku.png'),(15,4,'Деревянный значок \"Панчмен\"','\"Так кто победит?\r\nЧак Норрис или Ванпанчмен?!\"\r\n-Ванпанчмен приседал и отжимался по 100 раз , Чак Норрис каждый день приседает и отжимается все разы.\r\n-Но..Если он отжимался все разы, откуда брались 100 отжиманий для Ванпанчмена?\r\n-Что за глупые вопросы?! Ванпанчмен доприсёдывал ношеные разы за Чаком.',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513966/img/vanchpanchman.png'),(16,4,'Деревянный значок \"Стальной Алхимик\"','Братья Эдвард и Альфонс Элрики живут в провинции Ризенбург. Мальчики рано начали интересоваться алхимией..Конечно же, ведь их отец был алхимиком,только вот он ушел из семьи, когда Альфонсу было 4 года. Вскоре ,их мать умерла и мальчики решили провести запрещенную алхимией трансмуатацию человеческого тела,но мальчики потерпели неудачу. Эдвард потерял ногу, Альфонс - все тело.Дабы вернуть брата , Эдвард пожертвовал рукой. Думаю, вы понимаете прозвище Стальной. Стальной Алхимик.',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513937/img/https:/res.cloudinary.com/dhsrjlsya/image/upload/v1583513937/img/fullmetal.png'),(17,1,'Браслет с гравировкой \"Удав, проглотивший слона\"','Я показал мое творение взрослым и спросил, не страшно ли им.\r\n        - Разве шляпа страшная? - возразили мне. А это была совсем не шляпа. Это был удав, который проглотил слона. Тогда я нарисовал удава изнутри, чтобы взрослым было понятнее. Им ведь всегда нужно все объяснять.',900,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513937/img/elefant.png'),(18,1,'Браслет с гравировкой \"Friends\"','\"Они не знают, что мы знаем, что они знают, что мы знаем\"\r\nДружить нужно так, как в сериале \"Друзья\". \r\nМы надеемся, что вы не Джоуи, который не делится едой :)',900,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583518117/img/friends.png'),(19,1,'Браслет с гравировкой \"Сотворение Адама\"','Лежащее на зелёной скале тело Адама постепенно приходит в движение, пробуждается к жизни. Вся композиция сконцентрирована на жесте двух рук. Рука Бога даёт импульс, а рука Адама принимает его, давая всему телу жизненную энергию. \r\nТем, что их руки не соприкасаются, Микеланджело подчеркнул невозможность соединения божественного и человеческого. ',900,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513938/img/adamandgod.png'),(20,1,'Браслет с гравировкой \"Розмарин\"','Название цветка можно перевести как «морская роса».\r\nЕще в Древнем Риме розмарин считали священным растением, и в религиозные праздники его приносили в дар богине любви.',900,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513938/img/rosemarin.png'),(21,1,'Браслет с гравировкой \"LOVER\"','Not loser, but lover...\r\nНадпись является отсылкой к клубу неудачников из фильма снятого по экранизации книги Стивена Кинга \"ОНО\"',900,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583521433/img/lover_v0uyxh.png'),(22,1,'Браслет с гравировкой \"Кит\"','Осень была дождливой, волна тумана. \r\nКит приходил ночами из океана. \r\nМы познакомились, каждую ночь болтали. \r\nВсё это долго и тчетно держали в тайне. \r\n\r\nКит стал мне лучшим другом, однажды утром. \r\nЛюди пришли за ним с китобойным судном. \r\nЯ это видел с нашего с ним причала. \r\n\r\nКит закричал, и кита не стало.\r\nЗнаменитая песня \"Кит\" группы \"Сплин\"',900,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513937/img/kit.png'),(23,4,'Деревянный значок \"Тоторо\"','Тоторо- хранитель леса, большое мохнатое существо серого цвета. Тоторо — не традиционный японский персонаж: его полностью придумал Миядзаки. Тем не менее, для Тоторо очень естественно находится место в системе традиционных японских представлений, среди низших природных божеств, духов-хранителей местности.',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513939/img/totoro1.png'),(24,4,'Деревянный значок \"Тоторо\"','Тоторо- хранитель леса, большое мохнатое существо серого цвета. Тоторо — не традиционный японский персонаж: его полностью придумал Миядзаки. Тем не менее, для Тоторо очень естественно находится место в системе традиционных японских представлений, среди низших природных божеств, духов-хранителей местности.',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513938/img/totoro3.png'),(25,4,'Деревянный значок \"Тоторо\"','Тоторо- хранитель леса, большое мохнатое существо серого цвета. Тоторо — не традиционный японский персонаж: его полностью придумал Миядзаки. Тем не менее, для Тоторо очень естественно находится место в системе традиционных японских представлений, среди низших природных божеств, духов-хранителей местности.',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513938/img/totoro2.png'),(26,4,'Деревянный значок \"Сальвадор Дали\"','Человек-концерт, человек-фантазия, воплощение творчества и сюрреализма, дитя сладострастия и кисть собственного воображения. Его гению было тесто в целом мире. Он говорил: «Я благодарен судьбе за две вещи: за то, что я испанец и за то, что я – Сальвадор Дали». И что мы можем добавить?…',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513940/img/salvador.png'),(27,4,'Деревянный значок \"Сотворение Адама\"','Лежащее на зелёной скале тело Адама постепенно приходит в движение, пробуждается к жизни. Вся композиция сконцентрирована на жесте двух рук. Рука Бога даёт импульс, а рука Адама принимает его, давая всему телу жизненную энергию. \r\nТем, что их руки не соприкасаются, Микеланджело подчеркнул невозможность соединения божественного и человеческого. ',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513941/img/adam3.png'),(28,4,'Деревянный значок \"Сотворение Адама\"','Лежащее на зелёной скале тело Адама постепенно приходит в движение, пробуждается к жизни. Вся композиция сконцентрирована на жесте двух рук. Рука Бога даёт импульс, а рука Адама принимает его, давая всему телу жизненную энергию. \r\nТем, что их руки не соприкасаются, Микеланджело подчеркнул невозможность соединения божественного и человеческого. ',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513939/img/adam2.png'),(29,4,'Деревянный значок \"Книга Гарри Поттер\"','Гарри Поттер в твои годы боролся со злом, а ты себя побороть не можешь, чтобы выйти из интернета.\r\n______________________\r\nА если Поттер был сиротой с шизофренией, который никогда не покидал кладовку и выдумал этот магический мир, чтобы чувствовать себя лучше? :)',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513943/img/bookharry.png'),(30,4,'Деревянный значок \"Маяковский\"','Маяковскому говорят: \r\n— Вот вы писали, что «среди грузинов я — грузин, среди русских я -русский», а среди дураков вы кто?\r\nМаяковский не растерялся и говорит: \r\n— А среди дураков я впервые.',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513940/img/mayakivskii.png'),(31,4,'Деревянный значок \"Узбагойся\"','Узбагойся – мем-эдвайс с упоротым лемуром, который просит тебя успокоиться.\r\nБудь Збогоен, сохраняй чистый разум и спокойсвтие на душе. Оставь все проблемы и заботы другим людишкам. ',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513942/img/zbogoino.png'),(32,4,'Деревянный значок Кот \"Вжух\"','Если вы видите эту картинку, то у вас счастливый день.Вас посетил ВЕЛИКИЙ КОТ ВОЛШЕБНИК  - мудрейший из всех котов волшебников, волшебной школы котов.Проклятие легло на вас и оно превратит вашу жизнь в ужас .Только кот волшебник сможет снять проклятие и снова сделать вашу жизнь прекрасной и полной волшебства. Но только если вы проговорите при заказе \"Ты воистину великий кот волшебник\"',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513949/img/vzhuh.png'),(33,4,'Деревянный значок \"Всё ок!\"\r\n','This is fine (“Все хорошо”) — двухпанельный комикс про собаку в шляпе, которая сидит в комнате, объятой огнем, и пытается убедить себя в том, что “всё хорошо”.\r\nРекомендуется использовать вместе с сарказмом и иронией в ситуациях, когда пытаетесь найти позитивные стороны ситуации.',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513941/img/imfine.png'),(34,4,'Деревянный значок Угрюмый кот','Выражает грусть, печаль, угрюмое, унылое настроение.\r\nПодходит для дождливых дней.',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513942/img/grannycat.png'),(35,4,'Деревянный значок \"Лягушка Pepe\"','Лягушонок Пепе  – популярная пикча с зелёной плачущей лягушкой. Мем означает грусть, хотя на оригинальных рисунках лягушонок был радостным.',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513945/img/pepe.png'),(36,4,'Деревянный значок \"Гарри Поттер\"','Гарри Поттер пришел к Волдеморту: \r\n- Хочу стать Пожирателем Смерти! \r\n- Авада Кедавра! Кушай, не обляпайся!!!',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583521453/img/potter_sx07zr.png'),(37,4,'Деревянный значок \"Пуффендуй\"','Пуффендуй - ценит трудолюбие , верность и честность. Талисман - барсук, цвета - канареечно-желтый и черный. Декан - преподаватель травологии Помона Стебль. Привидение - Толстый Проповедник. Основатель - Пенелопа Пуффендуй. Пуффендуй- стихия земли.',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513943/img/puff.png'),(38,4,'Деревянный значок \"Слизерин\"','Слизерин - ценит хитрость, амбициозность, решительность, находчивость. Характерна черта жажды власти. Талисман - змея, цвета - зеленый и серебристый. Декан - Северус Снегг, профессор Зельеварения. Его предшественник, а потом и преемник на этом посту- Гораций Слизнорт. Приведение - устрашающий кровавый барон.Слизерин - стихия воды.',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513943/img/slizerin.png'),(39,4,'Деревянный значок \"Когтевран\"','Когтевран - ценит ум, творчество , остроумие и мудрость. Популярная когтевранская пословица гласит = \"wir=t beyond measure is man\'s greatest treasure\". Талисман - орёл, цвета- синий и бронзовый. Декан - профессор заклинаний Филипп Флитвик.Приведение - Серая дама. Основатель - Кандида Когтевран. В книге упоминается , что Серая Дама при жизни была дочерью Кандиды - Елена Когтевран.Когтевран - стихия воздуха.',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513945/img/cogtevran.png'),(40,4,'Деревянный значок \"Гриффиндор\"','Гриффиндор -отличительные качества\r\nучеников этого факультета:\r\nхрабрость, честь,\r\nблагородство. Талисман —лев, цвета — алый и золотой. Декан — преподаватель\r\nтрансфигурации Минерва Макгонагалл. Привидение — Почти Безголовый Ник.\r\nОснователь — Годрик Гриффиндор',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513944/img/griff.png'),(41,4,'Деревянный значок \"9 и 3/4\"','В режиссёрской версии «Гарри Поттера» оказывается, что всё это — сон мальчика, который ударился головой о стену на вокзале.',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513945/img/934.png'),(42,4,'Деревянный значок \"Хогвартс Экспресс\"','В режиссёрской версии «Гарри Поттера» оказывается, что всё это — сон мальчика, который ударился головой о стену на вокзале.',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513946/img/train.png'),(43,4,'Деревянный значок \"Batman\"','Брюс Уэйн - мальчик, живущий в аристократичной семье. Отец - успешный человек, который основал свою компанию по развитию технологий Wayne Ind., поддерживающий город Готэм, Заботливая мать и друг семьи - дворецкий Альфред Пенниуорт. Но у города есть и другая сторона - темная, где законом правят приступники, убийцы, и психи сбежавшие из аркхема. Ничего не предвещало беды, однажды семья Уэйнов возвращались домой после просмотра кино, как на них напал бандит , выставив дуло пистолета на главу семьи...Так началась история великого Темного Рыцаря защищающего город от зла и психа-клоуна.',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583521445/img/batman4_dx4oii.png'),(44,4,'Деревянный значок \"Batman\"','Брюс Уэйн - мальчик, живущий в аристократичной семье. Отец - успешный человек, который основал свою компанию по развитию технологий Wayne Ind., поддерживающий город Готэм, Заботливая мать и друг семьи - дворецкий Альфред Пенниуорт. Но у города есть и другая сторона - темная, где законом правят приступники, убийцы, и психи сбежавшие из аркхема. Ничего не предвещало беды, однажды семья Уэйнов возвращались домой после просмотра кино, как на них напал бандит , выставив дуло пистолета на главу семьи...Так началась история великого Темного Рыцаря защищающего город от зла и психа-клоуна.',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513945/img/batman2.png'),(45,4,'Деревянный значок \"Batman\"','В Готэме снова не спокойно, но наш Темный Рыцарь не дремлет. \r\nВ этот раз зло объединилось под командованием Двуликого. Человек-загадка?Джокер? \r\nПреступный мир продолжает властвовать над Готэмом, но надолго ли?',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513946/img/batman1.png'),(46,4,'Деревянный значок \"Harley\"','Харлин Квинзель - хороший психолог, которая была слишком одинока по жизни , пока не встретила его - Бэтм..нет, Мистера Джея. Джокера. Ради него она даже прыгнула в кислоту.Сердцу не прикажешь; два психа желающие захватить мир, чтобы во Вселенной воцарил хаос. Это так прекрасно, что любовь может так объединять. \r\nА у вас есть свой Пуддинг?',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583521636/img/harley20_aunj11.png'),(47,4,'Деревянный значок \"Harley\"','А это тебе за Пуддинга!\r\nВы уже смотрели отряд самоубийц? \r\nМы тоже! Неужели Джокер оставил бы свою Харли в тюрьме, спокойно попивать чай и читать роман Молли О\'Киф \"Between the Sheets\"?',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513947/img/harley3.png'),(48,4,'Деревянный значок \"Harley\"','А это тебе за Пуддинга!\r\nВы уже смотрели отряд самоубийц? \r\nМы тоже! Неужели Джокер оставил бы свою Харли в тюрьме, спокойно попивать чай и читать роман Молли О\'Киф \"Between the Sheets\"?',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513950/img/harley2.png'),(49,4,'Деревянный значок \"Джокер\"','Скучная жизнь в Темном Аркхеме начинает надоедать, ведь усадил сюда Бэтмен . Джокер знает ,против кого надо восстать.\r\nОни оба стоят друг друга.Не будет одного, нет смысла в проделках другого.Может , у Джокера симпатия вовсе не к Харли?)',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513946/img/joker.png'),(50,4,'Деревянный значок \"Пухля\"','-Сэр, мне нужна эта свинья\r\n-Угадай вес этой 7-ми килограммовой свиньи. \r\n- эм , 7 килограммов?\r\n- Да ты , ведьма',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583521449/img/pig1_rovuw9.png'),(51,4,'Деревянный значок \"Пухля\"','-Сэр, мне нужна эта свинья\r\n-Угадай вес этой 7-ми килограммовой свиньи. \r\n- эм , 7 килограммов?\r\n- Да ты , ведьма',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583521437/img/pig2_s5zccd.png'),(52,4,'Деревянный значок \"Билл Сайфер\"','Помни, реальность — иллюзия, Вселенная — голограмма. Скупай золото! Пока!',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513947/img/bill.png'),(53,4,'Деревянный значок \"Мейбл\"','Старшая школа, Диппер! Девочки станут девушками. А еще нас там научат... Ты сам знаешь, чему.\r\n— Тригонометрии?',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513948/img/mabel.png'),(54,4,'Деревянный значок \"Диппер\"','Меня зовут Диппер. А девчонка, которую тошнит, — моя сестра Мэйбл.',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513947/img/dipper.png'),(55,4,'Деревянный значок \"Мороженка\"','— Что ж ты такой холодный, прямо как мороженое. — Зато мороженое сладкое.',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583521448/img/ice2_u2z7ck.png'),(56,4,'Деревянный значок \"Мороженка\"','Когда он так на меня смотрит, я таю, как мороженое у подростков, обнимающихся на тротуаре напротив.',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583521450/img/ice1_napvt3.png'),(57,4,'Деревянный значок \"Nutella\"','Попробуйте сделать следующее: скажите кому-нибудь слово Nutella. Вы заметите, что его или ее лицо просветлится, появится улыбка, и, скорее всего, этот человек скажет что-то вроде: «Ах, Nutella…». \r\n',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513948/img/nutella.png'),(58,4,'Деревянный значок \"Картошка Фри\"','Скучаю по тебе немножко, как соус по картошке :)',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583521439/img/potato_w2pygy.png'),(59,4,'Деревянный значок \"Love is...\"','Любовь — это…\r\n\r\n... вместе встречать весну.\r\n\r\n… когда ты не спрашиваешь цену ее нового платья.\r\n\r\n… когда его фотография стоит у тебя на столе, а твоя любовь живет в его сердце...\r\nИ многое другое. А вы собрали свою коллекцию картинок и познали,что такое истинная любовь?',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583521433/img/loveis_ll4q6h.png'),(60,4,'Деревянный значок \"Banana Cat\"','Фрукт - фрукт\r\n\r\nКиска - киска\r\n\r\nЦветок - цветок \r\n\r\nОбереги свою киску от банана..или не обереги',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583521451/img/bananacat_dyfkjb.png'),(61,4,'Деревянный значок \"Авокадо\"','Я буду разговаривать только в присутствии своего авокадо',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513948/img/avocado.png'),(62,4,'Деревянный значок \"Авокато\"','\"Я не толстое, это кость у меня широкая\"',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513952/img/avocat.png'),(63,4,'Деревянный значок \"Пончик мопс\"','„Между оптимистом и пессимистом есть забавное различие. Оптимист видит мопсика, пессимист пончик!“\r\nА что видишь ты и твои друзья? Закажи значок и проверь :)',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513952/img/donggy.png'),(64,4,'Деревянный значок \"Пицца\"','Я так люблю свою пиццу, что я верю в свой бред, что и моя пицца может полюбить меня взамен. У меня отношения с этой пиццей, почти роман.',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513949/img/pizza.png'),(65,4,'Деревянный значок \"Чили\"','Странно, как могут не вызывать симпатию люди, по характеру напоминающие перец чили. Острые, жгучие, манящие, но для многих непостижимые. Избранные гурманами и презираемые дилетантами.\r\n',200,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513950/img/chilli.png'),(66,3,'Обложка на паспорт \"Хищные птицы\"','Харли и Джокер расстались, но окружение считало это лепетом,тогда Харли решила доказать, что на этот раз всё серьезно. Она взорвала завод с кислотой, как место, где началась их история. С этого момента открылась охота на Харли Квинн, ведь теперь она считалась не под защитой Джокера. Харли случайно собирает свою команду и борется со злом,которое хочет взять кусочек от Харли. ',400,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513953/img/harley1.png'),(67,3,'Обложка на паспорт \"Хищные птицы\"','Харли и Джокер расстались, но окружение считало это лепетом,тогда Харли решила доказать, что на этот раз всё серьезно. Она взорвала завод с кислотой, как место, где началась их история. С этого момента открылась охота на Харли Квинн, ведь теперь она считалась не под защитой Джокера. Харли случайно собирает свою команду и борется со злом,которое хочет взять кусочек от Харли. ',400,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513950/img/harley2.png'),(68,3,'Обложка на паспорт \"Стар\"','Слушайте, мы следовали планам Марко не потому, что они хороши. Мы следовали им, потому что это Марко. Он придумает очередной бредовый план и затем, как он не сработает, он придумает новый, а потом еще один и именно поэтому он наш лидер. Ведь он настолько туп, что никогда не сдается.',400,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513951/img/star2.png'),(69,3,'Обложка на паспорт \"Стар\"','Шутишь? Да нет ничего лучше, чем слепо доверять предсказаниям из печенек!',400,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513957/img/star1.png'),(70,3,'Обложка на паспорт \"Скуби-ду\"','— Складывайте все ценности в мешок. — Моя ценность — это Скуби.\r\n — Не-а, я туда не полезу!\r\nЕсли у вас нет еще такого лучшего друга как Скуби, то вы можете заказать у нас Обложку со Скуби,и доверить ему свои документы. Или заказать другу)',400,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513957/img/scooby.png'),(71,3,'Обложка на паспорт \"Скуби-ду\"','Собираясь в путешествие, не забудьте паспорт и верных друзей! Вместе веселей и страшней совсем немного..)',400,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583521442/img/scooby2_ctkjne.png'),(72,3,'Обложка на паспорт \"Криминальное чтиво\"','Криминальные миньоны? Миньонное чтиво? \r\nКриминальное чтиво! Все любят пейринги, но вы готовы принять такой пейринг? \r\n\"Не нужно думать. Нужно покупать.\"- спеши скорее заказывать',400,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513952/img/criminalminion.png'),(73,3,'Обложка на паспорт \"Ленивец\"','-Ленивцу всегда хочется что-нибудь делать.\r\n-Болезнь для ленивых есть праздник.\r\nНу  не лениись нажать пару кнопок и оформить заказ',400,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513953/img/lazy.png'),(74,3,'Обложка на паспорт \"Лама\"','Какие-то проблламы? Стильная лама в очках защитит тебя и твои документы от неприятностей. Скорее кликай и заказывай. Безопасность превыше всего!',400,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513955/img/problama.png'),(75,3,'Обложка на паспорт \"Время приключений\"','— Чувак! Я не завожу отношения, потому что не хочу обсуждать, что у нас будет на ужин каждый вечер! Ведь когда я один, я могу просто сидеть на диване и есть всё, что захочу! — Но, чувак, когда у тебя нет девушки, это же так уныло! Разве тебе не одиноко?! — У меня есть друзья.',400,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513955/img/timeto1.png'),(76,3,'Обложка на паспорт \"Время приключений\"','Знаешь, бро, я рад, что ты тут. Умирать вместе капельку приятнее, чем по одиночке.',400,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583521446/img/timeto_z59bhy.png'),(77,3,'Обложка на паспорт \"Бойцовский клуб\"','Первое правило Бойцовского клуба: никому не рассказывать о Бойцовском клубе',400,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513955/img/club.png'),(78,3,'Обложка на паспорт \"Малыш Йода\"','Малыш — персонаж оригинального телесериала «Мандалорец» от стримингового сервиса Disney+. Он принадлежит к той же инопланетной расе, что и мастер-джедай Йода, популярный персонаж оригинальной трилогии и трилогии приквелов «Звёздных войн».',400,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513958/img/babyyoda.png'),(79,2,'Кулон \"Якорь\"','Минималистичный кулон Якоря , подойдет вашему моряку. Станет идеальным подарком на любой праздник для мужчин.Или для женщин, если фанатка морской темы)',500,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583517772/img/charm1.png'),(80,2,'Кулон \"Жизнь\"','Жизнь — как вождение велосипеда. Чтобы сохранить равновесие, ты должен двигаться.',500,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583521439/img/kulon3_e2qvic.png'),(81,2,'Кулон \"Цветок\"','Любовь как цветок — ей нужно время, чтобы расцвести.',500,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583521443/img/kulon4_wqzwtp.png'),(82,1,'Браслет со своей гравировкой','Чтобы заказать браслет со своей гравировкой, для начала прочитайте статью с условиями для подборки изображения или текста для вашего браслета. Далее, обратить к нам в группу в вк для дальнейшего обсуждения деталей. \r\nМы рады ответить всем :)',900,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583521950/img/brace4_vfxot3.png'),(83,3,'Обложка на паспорт \"Эминем\"','„Будь горд, что ты – это ты. Даже если это звучит банально, не позволяй никому говорить, что ты не прекрасен.“ —  Эминем\r\n/',400,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513962/img/eminem.png'),(84,3,'Обложка на паспорт \"Киберпанк\"',' Игроку будет предоставлен на выбор ряд игровых классов с возможностью их комбинирования. Игровой мир будет состоять из города, поделённого на шесть уникальных районов, в котором также будет присутствовать полный цикл дня и ночи',400,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513963/img/cyberpunk.png'),(85,3,'Обложка на паспорт \"Черная пантера\"','\"Эвакуируете город. Займите оборону. И дайте этому человеку щит.\"\r\n― Т\'Чалла',400,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513962/img/bckpantera.png'),(86,3,'Обложка на паспорт \"Эд Ширан\"','„Если кто-нибудь говорит тебе изменить себя, скажи ему, чтобы шел к черту.“ ...',400,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513961/img/edsheeran.png'),(87,3,'Обложка на паспорт \"Эйфория\"','Настоящая любовь — когда не можешь жить без кого-то, когда ты скорей умрешь, чем расстанешься. Все вокруг гаснет и важен только человек перед тобой.',400,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513959/img/eiphoria.png'),(88,4,'Деревянный значок \"Джокер\" - тест','Деревянный значок \"Джокер\" - тест',250,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513946/img/joker.png'),(89,4,'Деревянный значок \"Джокер\" - тест - 2','Деревянный значок \"Джокер\" - тест - 2',250,'https://res.cloudinary.com/dhsrjlsya/image/upload/v1583513946/img/joker.png');
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rank`
--

DROP TABLE IF EXISTS `rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rank` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rank`
--

LOCK TABLES `rank` WRITE;
/*!40000 ALTER TABLE `rank` DISABLE KEYS */;
INSERT INTO `rank` (`id`, `name`) VALUES (0,'admin'),(1,'user');
/*!40000 ALTER TABLE `rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` (`id`, `name`) VALUES (1,'В обработке'),(2,'В пути'),(3,'Доставлено'),(4,'Отменено');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci,
  `surname` text COLLATE utf8mb4_unicode_ci,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `login` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rank_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rank` (`rank_id`),
  CONSTRAINT `user_ibfk_3` FOREIGN KEY (`rank_id`) REFERENCES `rank` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `name`, `surname`, `email`, `login`, `password`, `rank_id`) VALUES (2,'Профи','Професси','professional228@mail.ru','professional228','$2y$10$TOXjR9a6og2EkMaZRBPP/uSjsKlIARogM6c3btbCXl8Cc9VO9S8qa',1),(3,NULL,NULL,'baskov@mail.ru','baskov','$2y$10$Wi5QnA1ow8Uc1KT82SbvbugfcrS4k9QzMPbpDRdqWqGwHFTcaVF0m',1),(4,NULL,NULL,'putin@mail.ru','putin1','$2y$10$X/OVhVlL2UPrGEGedrYUS.Yo3Uf1XGrTO/y9XWHs8ubuJHE3tuVj.',1),(5,NULL,NULL,'medvedev@mail.ru','medvedev','$2y$10$uvoJeORN0i8aDuGh4O//HuCgq.kYq/Sgbn1zL2ukzsbGJ3pGz6EHe',1),(6,NULL,NULL,'admin@mail.ru','admin$_$','$2y$10$jafForRJwB04gv2ZsnnbMOgbZXL2WWZ82a5Jg2LsJAEd5AXK8Z/cm',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'a0440803_magaz'
--
/*!50112 SET @disable_bulk_load = IF (@is_rocksdb_supported, 'SET SESSION rocksdb_bulk_load = @old_rocksdb_bulk_load', 'SET @dummy_rocksdb_bulk_load = 0') */;
/*!50112 PREPARE s FROM @disable_bulk_load */;
/*!50112 EXECUTE s */;
/*!50112 DEALLOCATE PREPARE s */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-26 17:23:54