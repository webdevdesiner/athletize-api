-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: athletizedb
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` text DEFAULT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'João Silva','joao.silva@email.com','11999998888','Rua das Flores, 123','2025-04-20 09:56:32'),(2,'Maria Oliveira','maria.oliveira@email.com','21988887777','Av. Central, 456','2025-04-20 09:56:32'),(3,'Carlos Souza','carlos.souza@email.com','31977776666','Rua Nova, 789','2025-04-20 09:56:32'),(4,'Ana Paula','ana.paula@email.com','41966665555','Travessa da Paz, 10','2025-04-20 09:56:32');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itens_venda`
--

DROP TABLE IF EXISTS `itens_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itens_venda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `venda_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `preco_unitario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `venda_id` (`venda_id`),
  KEY `produto_id` (`produto_id`),
  CONSTRAINT `itens_venda_ibfk_1` FOREIGN KEY (`venda_id`) REFERENCES `vendas` (`id`),
  CONSTRAINT `itens_venda_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itens_venda`
--

LOCK TABLES `itens_venda` WRITE;
/*!40000 ALTER TABLE `itens_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `itens_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `estoque` int(11) DEFAULT 0,
  `data_cadastro` timestamp NOT NULL DEFAULT current_timestamp(),
  `foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (30,'Camiseta Dry Fit nike','Camiseta esportiva leve e respirável',79.90,50,'2025-04-21 01:52:01','https://sportbras.vtexassets.com/arquivos/ids/1171322/CAMISETA-MASCULINA-NIKE-DRI-FIT-0.jpg?v=638622694513470000?width=800'),(31,'Tênis de Corrida nike','Tênis leve com amortecimento ideal para corrida',299.90,30,'2025-04-21 01:52:01','https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-4.0.3&auto=format&fit=crop&w=600&q=60'),(32,'Shorts Fitness varias cores','Shorts com tecido de alta performance',89.90,20,'2025-04-21 01:52:01','https://mimostock.com/cdn/shop/files/S6e599a5218a746caafdb4b96008019406_800x.webp?v=1707132468'),(34,'Regata Masculina','Regata de treino com tecido dry fit',69.90,40,'2025-04-21 01:52:01','https://images.tcdn.com.br/img/img_prod/628041/regata_nike_dri_fit_miler_cinza_19381_1_b8cd1118ac683ca2073255f9f9d2e4c9.jpg'),(36,'Meias','meias cano alto para treino',28.00,45,'2025-04-21 02:07:20','https://static.ativaesportes.com.br/public/ativaesportes/imagens/produtos/meia-nike-cano-alto-everyday-cushion-pacote-3-pares-sx7664-010-26817.jpg'),(38,'Blusa de moleton nike','Blusa de moleton com capuz , material 3 cabos',99.99,5,'2025-04-21 12:47:14','https://images.tcdn.com.br/img/img_prod/731602/blusao_de_moletom_nike_sportswear_club_com_capuz_preto_2343_1_0f6f174354563b6b88e8ad45648f4907.jpg'),(39,'Moleton azul nike','moleton ',258.00,6,'2025-04-21 13:32:41','https://static.dafiti.com.br/p/nike-sportswear-moletom-nike-sportswear-club-crew-swoosh-azul-2399-4429361-1-zoom.jpg?ims=filters:quality(70)');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_id` int(11) DEFAULT NULL,
  `data_venda` timestamp NOT NULL DEFAULT current_timestamp(),
  `valor_total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `vendas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'athletizedb'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-21 12:39:22
