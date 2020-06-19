-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: pipoca_doce
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avaliacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `avaliacao` int NOT NULL,
  `data_avaliacao` datetime NOT NULL,
  `usuario_id` int NOT NULL,
  `filme_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_avaliacao_usuario_idx` (`usuario_id`),
  KEY `fk_avaliacao_filme_idx` (`filme_id`),
  CONSTRAINT `fk_avaliacao_filme` FOREIGN KEY (`filme_id`) REFERENCES `filme` (`id`),
  CONSTRAINT `fk_avaliacao_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
INSERT INTO `avaliacao` VALUES (1,2,'2020-04-21 12:30:00',1,1),(2,3,'2020-04-21 13:30:00',1,3);
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comentario` text NOT NULL,
  `data_comentario` datetime NOT NULL,
  `usuario_id` int NOT NULL,
  `filme_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comentario_usuario_idx` (`usuario_id`),
  KEY `fk_comentario_filme_idx` (`filme_id`),
  CONSTRAINT `fk_comentario_filme` FOREIGN KEY (`filme_id`) REFERENCES `filme` (`id`),
  CONSTRAINT `fk_comentario_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
INSERT INTO `comentario` VALUES (1,'Ótimo filme!','2020-04-21 12:30:00',1,1);
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comentarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comentarios` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
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
-- Table structure for table `diretor`
--

DROP TABLE IF EXISTS `diretor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diretor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diretor`
--

LOCK TABLES `diretor` WRITE;
/*!40000 ALTER TABLE `diretor` DISABLE KEYS */;
INSERT INTO `diretor` VALUES (1,'Anthony Russo'),(2,'Joe Russo'),(3,'Niki Caro'),(4,'Justin Lin'),(5,'Jeff Fowler'),(6,'Cate Shortland'),(7,'Bilall Fallah'),(8,'Adil El Arbi'),(9,'Cathy Yan'),(10,'Todd Phillips'),(11,'Bong Joon-ho'),(12,'Barbara Białowąs'),(13,'Michael Showalter'),(14,'Patty Jenkins'),(15,'Olivier Megaton'),(16,'Leigh Whannell'),(17,'John Krasinski'),(18,'Spike Lee'),(19,'Matthew Vaughn'),(20,'Walt Dohrn'),(21,'Christopher Nolan');
/*!40000 ALTER TABLE `diretor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filme`
--

DROP TABLE IF EXISTS `filme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filme` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `duracao` varchar(20) NOT NULL,
  `dataLancamento` varchar(50) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `tipo` varchar(30) DEFAULT NULL,
  `sinopse` text NOT NULL,
  `elenco` varchar(100) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filme`
--

LOCK TABLES `filme` WRITE;
/*!40000 ALTER TABLE `filme` DISABLE KEYS */;
INSERT INTO `filme` VALUES (1,'Vingadores: Ultimato','3h 2m','25 de abril de 2019 ','https://www.youtube-nocookie.com/embed/g6ng8iy-l0U?controls=0','Lançado','Após Thanos eliminar metade das criaturas vivas, os Vingadores têm de lidar com a perda de amigos e entes queridos. Com Tony Stark vagando perdido no espaço sem água e comida, Steve Rogers e Natasha Romanov lideram a resistência contra o titã louco.','Robert Downey Jr., Chris Evans, Mark Ruffalo','vigadores-20200619000638.jpg'),(2,'Mulan','1h 55m','23 de julho de 2020 ','https://www.youtube-nocookie.com/embed/LBRJhII2wu8?controls=0','Em Breve','Em Mulan, Hua Mulan (Liu Yifei) é a espirituosa e determinada filha mais velha de um honrado guerreiro. Quando o Imperador da China emite um decreto que um homem de cada família deve servir no exército imperial, Mulan decide tomar o lugar de seu pai, que está doente. Assumindo a identidade de Hua Jun, ela se disfarça de homem para combater os invasores que estão atacando sua nação, provando-se uma grande guerreira.','Yifei Liu, Donnie Yen, Jason Scott Lee','0409486-20200619000641.jpg'),(3,'Velozes e Furiosos 9','2h 15m','20 de maio de 2020','https://www.youtube-nocookie.com/embed/NnDGWyfP7q4?controls=0','Lançado','Nono filme da série Velozes & Furiosos, e segundo da nova trilogia (Velozes 8, 9 e 10), que não conta mais com a presença de Paul Walker, falecido em 2013. O longa vem dando continuidade às corridas eletrizantes da equipe de amigos liderada por Dominic Toretto (Vin Diesel). ','Vin Diesel, Michelle Rodriguez, Jordana Brewster','images-20200619010605.jpg'),(4,'Sonic: O Filme','1h 40m','13 de fevereiro de 2020','https://www.youtube-nocookie.com/embed/zQEjE_M2Esw?controls=0','Lançado','Sonic, o porco-espinho azul mais famoso do mundo, se junta com os seus amigos para derrotar o terrível Doutor Eggman, um cientista louco que planeja dominar o mundo, e o Doutor Robotnik, responsável por aprisionar animais inocentes em robôs.','Jim Carrey, James Marsden, Tika Sumpter','0121118-20200605210647-20200619010608.jpg'),(5,'Viúva Negra','2h','29 de outubro de 2020','https://www.youtube-nocookie.com/embed/Lk7LPTq0_XY?controls=0','Em Breve','Em Viúva Negra, após seu nascimento, Natasha Romanoff (Scarlett Johansson) é dada à KGB, que a prepara para se tornar sua agente definitiva. Quando a URSS rompe, o governo tenta matá-la enquanto a ação se move para a atual Nova York, onde ela trabalha como freelancer. ','Scarlett Johansson, Florence Pugh, David Harbour','images (1)-20200619010616.jpg'),(6,'Bad Boys para Sempre','2h 4m','30 de janeiro de 2020','https://www.youtube-nocookie.com/embed/jCCGGYvFjlw?controls=0','Lançado','Os policiais Mike Lowery e Marcus Burnett se juntam para derrubar o líder de um cartel de drogas em Miami. A recém-criada equipe de elite do departamento de polícia de Miami, ao lado de Mike e Marcus, enfrenta o implacável Armando Armas.','Will Smith, Martin Lawrence, Vanessa Hudgens','bbps_640x940-data-20200606010612-20200619010627.jpg'),(7,'Aves de Rapina','1h 49m','6 de fevereiro de 2020','https://www.youtube-nocookie.com/embed/XS0mcsu8G3I?controls=0','Lançado','Arlequina narra os eventos de sua vida: algum tempo após a derrota da Magia, o Coringa termina com Arlequina, jogando-a nas ruas de Gotham City. Ela é acolhida por Doc, o idoso dono de um restaurante chinês.','Margot Robbie, Mary Elizabeth, Winstead Jurnee, Smollett Bell','5316438-20200619010651.jpg'),(8,'Coringa','2h 2m','3 de outubro de 2019','https://www.youtube-nocookie.com/embed/621pfj0EfIc?controls=0','Lançado','Isolado, intimidado e desconsiderado pela sociedade, o fracassado comediante Arthur Fleck inicia seu caminho como uma mente criminosa após assassinar três homens em pleno metrô. Sua ação inicia um movimento popular contra a elite de Gotham City, da qual Thomas Wayne é seu maior representante.','Joaquin Phoenix, Robert De Niro, Zazie Beetz','images (2)-20200619010654.jpg'),(9,'Parasita','2h 12m','7 de novembro de 2019','https://www.youtube-nocookie.com/embed/yCJPhuwGnws?controls=0','Lançado','Em Parasita, toda a família de Ki-taek está desempregada, vivendo num porão sujo e apertado. Uma obra do acaso faz com que o filho adolescente da família comece a dar aulas de inglês à garota de uma família rica. Fascinados com a vida luxuosa destas pessoas, pai, mãe, filho e filha bolam um plano para se infiltrarem também na família burguesa, um a um. No entanto, os segredos e mentiras necessários à ascensão social custarão caro a todos.','Song Kang-Ho, Woo-sik Choi, Park So-Dam','Parasitaposter-20200619150608.jpg'),(10,'365 DNI','1h 54m','7 de fevereiro de 2020 ','https://www.youtube-nocookie.com/embed/gg72UGQ3iGg?controls=0','Lançado','Em 365 Dias (365 DNI, no original), Laura Biel é uma diretora de vendas que tem sua vida virada do avesso quando, em uma viagem a Sicília, Massimo Torricelli, um membro da família da máfia siciliana, a sequestra lhe dando 365 dias para se apaixonar por ele.','Michele Morrone, Anna-Maria Sieklucka, Grazyna Szapolowska','365-dni57774-20200619150610.jpg'),(11,'Um Crime para Dois','1h 26m','24 de abril de 2020','https://www.youtube-nocookie.com/embed/msvHbCb1cB4?controls=0','Lançado','Em Um Crime para Dois, um casal (Issa Rae e Kumail Nanjiani) está passando por uma crise em seu relacionamento. Quando eles se veem de repente envolvidos em um misterioso assassinato, eles precisam tentar resolver o crime para limpar seus nomes enquanto tentam salvar a relação.','Kumail Nanjiani, Issa Rae, Moses Storm','4963dc3efdc429d22dc01efe09f9de84_XL-20200619150611.jpg'),(12,'Mulher-Maravilha 1984','-','13 de agosto de 2020','https://www.youtube-nocookie.com/embed/sfM7_JLk-84?controls=0','Em Breve','A sinopse de Mulher-Maravilha 1984 não foi revelada, então é difícil saber o que esperar em termos de trama. O que foi revelado, no entanto, é que ele será ambientado nos anos 1980 porque a diretora Patty Jenkins quis que o filme se passasse no auge da década. \"Foi pouco antes do mercado ficar com as dificuldades do restante da década. Foi o topo do topo\". ',' Gal Gadot, Chris Pine, Kristen Wiig','mulhermaravilha-20200619150606.jpg'),(13,'The Last Days of American Crime','2h 29m','5 de junho de 2020','https://www.youtube-nocookie.com/embed/gdWxGwiuhnU?controls=0','Lançado','Um ladrão de bancos participa de um plano para cometer um último grande assalto antes do governo ativar um sinal mental que acabará com todas as atividades criminosas.\r\n','Edgar Ramírez,Michael Pitt,Anna Brewster','1080909-20200619150611.jpg'),(14,'O Homem Invisível','2h 05m','27 de fevereiro de 2020','https://www.youtube-nocookie.com/embed/Sb-_wbXSuK4?controls=0','Lançado','Depois de forjar o próprio suicídio, um cientista enlouquecido usa seu poder para se tornar invisível e aterrorizar sua ex-namorada. Quando a polícia se recusa a acreditar em sua história, ela decide resolver o assunto por conta própria.','Elisabeth Moss, Oliver Jackson-Cohen, Harriet Dyer','1054901-20200619150612.jpg'),(15,'Um Lugar Silencioso - Parte II','1h 40m','3 de setembro de 2020','https://www.youtube-nocookie.com/embed/XEMwSdne6UE?controls=0','Em Breve','A família Abbott precisa enfrentar os terrores do mundo exterior enquanto luta pela sobrevivência em silêncio. Forçados a se aventurar no desconhecido, eles percebem que as criaturas que caçam pelo som não são as únicas ameaças no caminho da areia.','Emily Blunt, Cillian Murphy, Millicent Simmonds, Noah Jupe, Djimon Hounsou, John Krasinski','0494340-20200619150613.jpg'),(16,'Destacamento Blood','2h 35m','12 de junho de 2020','https://www.youtube-nocookie.com/embed/03aoq9yzI9c?controls=0','Lançado','Spike Lee conta a história de quatro veteranos de guerra afro-americanos que voltam ao Vietnã à procura dos restos mortais de seu comandante e de um tesouro enterrado.','Delroy Lindo, Jonathan Majors, Clarke Peters','ey3lv6lu8aivgpw-1222224-20200619150614.jpg'),(17,'King’s Man: A Origem','-','17 de setembro de 2020','https://www.youtube-nocookie.com/embed/gdt9-ZPk1dk?controls=0','Em Breve','Um grupo formado pelos tiranos e criminosos mais cruéis de todos os tempos arma um plano que ameaça a vida de milhões de inocentes. Agora um homem precisa correr contra o tempo para salvar a vida de todos.','Taron Egerton, Colin Firth','EFrIrckUUAAPQG4-20200619150616.jpg'),(18,'Trolls 2','1h 31m','11 de março de 2020','https://www.youtube-nocookie.com/embed/V-l30ZS0sFA?controls=0','Lançado','A rainha Poppy (Anna Kendrick) e Branch (Justin Timberlake) descobrem que há outros mundos Troll além do seu, e suas diferenças criam grandes confrontos entre essas diversas tribos. No entanto, uma ameaça misteriosa faz com que eles tenham que criar harmonia entre os rivais.',' Anna Kendrick, Justin Timberlake, Rachel Bloom','trolls-2-poppy-20200619150617.jpg'),(19,'Tenet','-','13 de agosto de 2020','https://www.youtube-nocookie.com/embed/LdOM0x0XDMo?controls=0','Em Breve','Um épico de ação, que se passa em sete países diferentes, dentro do mundo da espionagem. Sinopse oficial ainda não divulgada.Confira a classificação indicativa no Portal Online da Cultura Digital.','John David Washington, Robert Pattinson, Elizabeth Debicki','tenet-20200619150618.png');
/*!40000 ALTER TABLE `filme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filme_diretor`
--

DROP TABLE IF EXISTS `filme_diretor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filme_diretor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_filme` int NOT NULL,
  `id_diretor` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_filme_genero_diretor_idx` (`id_diretor`),
  KEY `fk_filme_diretor_filme_idx` (`id_filme`),
  CONSTRAINT `fk_filme_diretor_filme` FOREIGN KEY (`id_filme`) REFERENCES `filme` (`id`),
  CONSTRAINT `fk_filme_genero_diretor` FOREIGN KEY (`id_diretor`) REFERENCES `diretor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filme_diretor`
--

LOCK TABLES `filme_diretor` WRITE;
/*!40000 ALTER TABLE `filme_diretor` DISABLE KEYS */;
INSERT INTO `filme_diretor` VALUES (17,6,7),(18,6,8),(19,2,3),(20,1,1),(21,1,2),(23,3,4),(24,4,5),(26,5,6),(29,7,9),(30,8,10),(47,12,14),(48,9,11),(49,10,12),(50,11,13),(51,13,15),(52,14,16),(53,15,17),(54,16,18),(57,17,19),(58,18,20),(59,19,21);
/*!40000 ALTER TABLE `filme_diretor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filme_genero`
--

DROP TABLE IF EXISTS `filme_genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filme_genero` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_filme` int NOT NULL,
  `id_genero` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_genero_idx` (`id_genero`),
  KEY `fk_filme_genero_filme_idx` (`id_filme`),
  CONSTRAINT `fk_filme_genero_filme` FOREIGN KEY (`id_filme`) REFERENCES `filme` (`id`),
  CONSTRAINT `fk_filme_genero_genero` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filme_genero`
--

LOCK TABLES `filme_genero` WRITE;
/*!40000 ALTER TABLE `filme_genero` DISABLE KEYS */;
INSERT INTO `filme_genero` VALUES (24,6,1),(25,6,5),(26,2,1),(27,2,3),(28,1,1),(29,1,16),(32,3,1),(33,3,3),(34,4,5),(38,5,1),(39,5,3),(40,5,13),(43,7,1),(44,8,12),(81,12,1),(82,12,3),(83,12,15),(84,9,22),(85,10,12),(86,10,32),(87,11,5),(88,11,20),(89,13,12),(90,14,15),(91,14,22),(92,14,23),(93,15,23),(94,16,1),(95,16,3),(102,17,1),(103,17,5),(104,17,13),(105,18,2),(106,18,5),(107,18,18),(108,19,1),(109,19,13),(110,19,22);
/*!40000 ALTER TABLE `filme_genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Ação'),(2,'Animação'),(3,'Aventura'),(4,'Cinema de arte'),(5,'Comédia'),(6,'Comédia romântica'),(7,'Comédia dramática'),(8,'Comédia de ação'),(9,'Dança'),(10,'Documentário'),(11,'Docuficção'),(12,'Drama'),(13,'Espionagem'),(14,'Faroeste'),(15,'Fantasia científica'),(16,'Ficção científica'),(17,'Filmes de guerra'),(18,'Musical'),(19,'Filme policial'),(20,'Romance'),(21,'Seriado'),(22,'Suspense'),(23,'Terror'),(28,'Teste'),(32,'Erótico'),(33,'Fantasia');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Nathan Sousa','2000-06-15','nathan@gmail.com','81dc9bdb52d04dc20036dbd8313ed055','19059715_1189472924498462_4082649541936361331_n-20200619000604.jpg'),(2,'Thiago Sousa','2000-01-14','thiago@gmail.com','81dc9bdb52d04dc20036dbd8313ed055','pp-20200619010603-20200619030650.jpg'),(3,'Rodrigo Nunes','1999-05-17','rodrigo@gmail.com','81dc9bdb52d04dc20036dbd8313ed055','447874-20200619180624.jpg'),(4,'Daniel Lopes','2000-04-01','daniel@gmail.com','81dc9bdb52d04dc20036dbd8313ed055',NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'pipoca_doce'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-19 19:09:06
