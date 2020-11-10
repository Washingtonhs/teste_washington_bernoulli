-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.31 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para bernoulli
DROP DATABASE IF EXISTS `bernoulli`;
CREATE DATABASE IF NOT EXISTS `bernoulli` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bernoulli`;

-- Copiando estrutura para tabela bernoulli.confrontations
DROP TABLE IF EXISTS `confrontations`;
CREATE TABLE IF NOT EXISTS `confrontations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `home` int(11) NOT NULL,
  `visitor` int(11) NOT NULL,
  `score_home` int(11) NOT NULL,
  `score_visitor` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_confrontations_times` (`visitor`),
  KEY `FK_confrontations_times_2` (`home`),
  CONSTRAINT `FK_confrontations_times` FOREIGN KEY (`visitor`) REFERENCES `teams` (`id`),
  CONSTRAINT `FK_confrontations_times_2` FOREIGN KEY (`home`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bernoulli.confrontations: ~0 rows (aproximadamente)
DELETE FROM `confrontations`;
/*!40000 ALTER TABLE `confrontations` DISABLE KEYS */;
/*!40000 ALTER TABLE `confrontations` ENABLE KEYS */;

-- Copiando estrutura para tabela bernoulli.score_teams
DROP TABLE IF EXISTS `score_teams`;
CREATE TABLE IF NOT EXISTS `score_teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team` int(11) NOT NULL DEFAULT '0',
  `score` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_score_teams_teams` (`team`),
  CONSTRAINT `FK_score_teams_teams` FOREIGN KEY (`team`) REFERENCES `teams` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela bernoulli.score_teams: ~20 rows (aproximadamente)
DELETE FROM `score_teams`;
/*!40000 ALTER TABLE `score_teams` DISABLE KEYS */;
INSERT INTO `score_teams` (`id`, `team`, `score`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 1, 0, '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(2, 2, 0, '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(3, 3, 0, '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(4, 4, 0, '2020-01-01 00:00:00', '2020-11-09 22:52:52', NULL),
	(5, 5, 0, '2020-01-01 00:00:00', '2020-11-09 22:54:39', NULL),
	(6, 6, 0, '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(7, 7, 0, '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(8, 8, 0, '2020-01-01 00:00:00', '2020-11-09 22:53:50', NULL),
	(9, 9, 0, '2020-01-01 00:00:00', '2020-11-09 21:10:29', NULL),
	(10, 10, 0, '2020-01-01 00:00:00', '2020-11-09 22:54:39', NULL),
	(11, 11, 0, '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(12, 12, 0, '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(13, 13, 0, '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(14, 14, 0, '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(15, 15, 0, '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(16, 16, 0, '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(17, 17, 0, '2020-01-01 00:00:00', '2020-11-09 21:11:26', NULL),
	(18, 18, 0, '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(19, 19, 0, '2020-01-01 00:00:00', '2020-11-10 00:48:05', NULL),
	(20, 20, 0, '2020-01-01 00:00:00', '2020-11-10 00:49:04', NULL);
/*!40000 ALTER TABLE `score_teams` ENABLE KEYS */;

-- Copiando estrutura para tabela bernoulli.teams
DROP TABLE IF EXISTS `teams`;
CREATE TABLE IF NOT EXISTS `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `picture` varchar(260) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bernoulli.teams: ~20 rows (aproximadamente)
DELETE FROM `teams`;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` (`id`, `name`, `picture`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Athletico Paranaense', 'athletico_paranaense', '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(2, 'Atlético Goianiense', 'atletico_goianiense', '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(3, 'Atlético Mineiro', 'atletico_mineiro', '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(4, 'Bahia', 'bahia', '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(5, 'Botafogo', 'botafogo', '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(6, 'Ceará', 'ceara', '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(7, 'Corinthians', 'corinthians', '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(8, 'Coritiba', 'coritiba', '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(9, 'Flamengo', 'flamengo', '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(10, 'Fluminense', 'fluminense', '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(11, 'Fortaleza', 'fortaleza', '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(12, 'Goiás', 'goias', '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(13, 'Grêmio', 'gremio', '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(14, 'Internacional', 'internacional', '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(15, 'Palmeiras', 'palmeiras', '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(16, 'Red Bull Bragantino', 'red_bull_bragantino', '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(17, 'Santos', 'santos', '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(18, 'São Paulo', 'sao_paulo', '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(19, 'Sport', 'sport', '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL),
	(20, 'Vasco da Gama', 'vasco_da_gama', '2020-01-01 00:00:00', '2020-11-09 08:58:56', NULL);
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
