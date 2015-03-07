# ************************************************************
# Sequel Pro SQL dump
# Versión 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.38)
# Base de datos: chapapresupuestos
# Tiempo de Generación: 2015-03-07 02:17:31 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Volcado de tabla Actividad
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Actividad`;

CREATE TABLE `Actividad` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mensaje` varchar(500) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `fechaCreacion_f` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Actividad` WRITE;
/*!40000 ALTER TABLE `Actividad` DISABLE KEYS */;

INSERT INTO `Actividad` (`id`, `mensaje`, `usuario`, `fechaCreacion_f`)
VALUES
	(1,'Ha cerrado sesión','admin','2014-12-16 10:25:37'),
	(2,'Ha iniciado sesión','alex','2014-12-16 10:25:43'),
	(3,'Ha cerrado sesión','Guest','2014-12-16 11:53:57'),
	(4,'Ha iniciado sesión','alex','2014-12-16 11:54:01'),
	(5,'Ha iniciado sesión','alex','2014-12-22 09:24:45'),
	(6,'Ha iniciado sesión','alex','2014-12-30 11:38:41'),
	(7,'Ha iniciado sesión','alex','2014-12-31 10:11:40'),
	(8,'Ha cerrado sesión','Guest','2014-12-31 10:13:26'),
	(9,'Ha iniciado sesión','alex','2014-12-31 10:13:29'),
	(10,'Ha iniciado sesión','alex','2014-12-31 11:08:55'),
	(11,'Ha iniciado sesión','alex','2015-01-02 10:57:07'),
	(12,'Ha iniciado sesión','alex','2015-01-06 09:30:02'),
	(13,'Ha iniciado sesión','alex','2015-01-12 09:02:22'),
	(14,'Ha iniciado sesión','alex','2015-01-12 09:10:07'),
	(15,'Ha cerrado sesión','alex','2015-01-12 11:47:33'),
	(16,'Ha iniciado sesión','alex','2015-01-12 11:47:41'),
	(17,'Ha cerrado sesión','alex','2015-01-12 16:53:44'),
	(18,'Ha iniciado sesión','alex','2015-01-12 16:53:57'),
	(19,'Ha cerrado sesión','alex','2015-01-13 10:07:34'),
	(20,'Ha iniciado sesión','alex','2015-01-13 10:07:42'),
	(21,'Ha iniciado sesión','alex','2015-01-20 15:32:53'),
	(22,'Ha cerrado sesión','alex','2015-01-20 18:12:13'),
	(23,'Ha iniciado sesión','alex','2015-01-20 18:12:17'),
	(24,'Ha iniciado sesión','alex','2015-01-26 11:19:57'),
	(25,'Ha iniciado sesión','alex','2015-01-27 19:35:33'),
	(26,'Ha iniciado sesión','zama','2015-02-19 19:50:18'),
	(27,'Ha iniciado sesión','admin','2015-02-20 14:31:13');

/*!40000 ALTER TABLE `Actividad` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla Estatus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Estatus`;

CREATE TABLE `Estatus` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Estatus` WRITE;
/*!40000 ALTER TABLE `Estatus` DISABLE KEYS */;

INSERT INTO `Estatus` (`id`, `nombre`)
VALUES
	(1,'Activo'),
	(2,'Inactivo');

/*!40000 ALTER TABLE `Estatus` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla TipoUsuario
# ------------------------------------------------------------

DROP TABLE IF EXISTS `TipoUsuario`;

CREATE TABLE `TipoUsuario` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `estatus_did` int(11) unsigned NOT NULL,
  `fechaCreacion_f` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `tipoUsuario_estatus` (`estatus_did`),
  CONSTRAINT `tipoUsuario_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `Estatus` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `TipoUsuario` WRITE;
/*!40000 ALTER TABLE `TipoUsuario` DISABLE KEYS */;

INSERT INTO `TipoUsuario` (`id`, `nombre`, `estatus_did`, `fechaCreacion_f`)
VALUES
	(1,'Administrador',1,'2014-11-03 10:20:08'),
	(2,'Guest',1,'2014-11-03 10:20:34'),
	(3,'Super',1,'2014-12-10 09:53:41');

/*!40000 ALTER TABLE `TipoUsuario` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla Usuario
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Usuario`;

CREATE TABLE `Usuario` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `puesto` varchar(100) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `contrasena` varchar(100) DEFAULT NULL,
  `tipoUsuario_did` int(11) unsigned DEFAULT NULL,
  `estatus_did` int(11) unsigned DEFAULT NULL,
  `fechaCreacion_f` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `foto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_estatus` (`estatus_did`),
  KEY `usuario_tipoUsuario` (`tipoUsuario_did`),
  CONSTRAINT `usuario_estatus` FOREIGN KEY (`estatus_did`) REFERENCES `Estatus` (`id`),
  CONSTRAINT `usuario_tipoUsuario` FOREIGN KEY (`tipoUsuario_did`) REFERENCES `TipoUsuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;

INSERT INTO `Usuario` (`id`, `nombre`, `puesto`, `usuario`, `contrasena`, `tipoUsuario_did`, `estatus_did`, `fechaCreacion_f`, `foto`)
VALUES
	(1,'Alejandro','Sistemas','alex','1234',1,1,'2014-11-03 10:06:25','20141104_1815_Rolling_Spider_2014-08-17T154538+0000_BC675F91442650C12656A95B4513D551.jpg'),
	(2,'Invitado','Invitado','Guest','123',2,1,'2014-11-03 10:18:51',NULL),
	(3,'Administrador','Sistemas','admin','123',3,1,'2014-12-10 09:53:55',NULL),
	(4,'Roberto Zamarripa','Programador','zama','123',NULL,NULL,'2014-12-16 09:59:00',NULL);

/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla YiiLog
# ------------------------------------------------------------

DROP TABLE IF EXISTS `YiiLog`;

CREATE TABLE `YiiLog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(128) DEFAULT NULL,
  `category` varchar(128) DEFAULT NULL,
  `logtime` int(11) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
