-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.36-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para carwash
CREATE DATABASE IF NOT EXISTS `carwash` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `carwash`;

-- Volcando estructura para tabla carwash.tbatencion
CREATE TABLE IF NOT EXISTS `tbatencion` (
  `codatencion` int(6) NOT NULL,
  `codusu` int(6) DEFAULT NULL,
  `codlocal` int(6) DEFAULT NULL,
  `placa` varchar(50) DEFAULT NULL,
  `servicios` varchar(100) DEFAULT NULL,
  `estado` varchar(25) DEFAULT NULL,
  `monto` double DEFAULT NULL,
  `puntos` int(6) DEFAULT NULL,
  `fecha` varchar(25) DEFAULT NULL,
  `hora` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`codatencion`),
  KEY `FK_atencion_usuario` (`codusu`),
  KEY `FK_atencion_local` (`codlocal`),
  CONSTRAINT `FK_atencion_local` FOREIGN KEY (`codlocal`) REFERENCES `tbcarwash` (`codlocal`),
  CONSTRAINT `FK_atencion_usuario` FOREIGN KEY (`codusu`) REFERENCES `tbusuario` (`codusu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla carwash.tbatencion: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `tbatencion` DISABLE KEYS */;
INSERT INTO `tbatencion` (`codatencion`, `codusu`, `codlocal`, `placa`, `servicios`, `estado`, `monto`, `puntos`, `fecha`, `hora`) VALUES
	(1, 1, 1, '14GH5', 'Masaje prostatico', 'Atendiendo', 200, 2000, '30/11/2018', '06:46');
/*!40000 ALTER TABLE `tbatencion` ENABLE KEYS */;

-- Volcando estructura para tabla carwash.tbauto
CREATE TABLE IF NOT EXISTS `tbauto` (
  `placa` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `ano` int(4) NOT NULL,
  `codusu` int(6) NOT NULL,
  PRIMARY KEY (`placa`),
  KEY `FK_auto_usuario` (`codusu`),
  CONSTRAINT `FK_auto_usuario` FOREIGN KEY (`codusu`) REFERENCES `tbusuario` (`codusu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla carwash.tbauto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbauto` DISABLE KEYS */;
INSERT INTO `tbauto` (`placa`, `marca`, `modelo`, `ano`, `codusu`) VALUES
	('14GH5', 'Toyota', 'Yaris', 2009, 1);
/*!40000 ALTER TABLE `tbauto` ENABLE KEYS */;

-- Volcando estructura para tabla carwash.tbcalificacion
CREATE TABLE IF NOT EXISTS `tbcalificacion` (
  `codcali` int(6) NOT NULL,
  `codlocal` int(6),
  `codusu` int(6),
  `comentario` varchar(300) DEFAULT NULL,
  `score` int(1) NOT NULL,
  `fecha` varchar(25) NOT NULL,
  `hora` varchar(25) NOT NULL,
  PRIMARY KEY (`codcali`),
  KEY `FK_calificacion_carwash` (`codlocal`),
  KEY `FK_calificacion_usuario` (`codusu`),
  CONSTRAINT `FK_calificacion_carwash` FOREIGN KEY (`codlocal`) REFERENCES `tbcarwash` (`codlocal`),
  CONSTRAINT `FK_calificacion_usuario` FOREIGN KEY (`codusu`) REFERENCES `tbusuario` (`codusu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla carwash.tbcalificacion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbcalificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbcalificacion` ENABLE KEYS */;

-- Volcando estructura para tabla carwash.tbcarwash
CREATE TABLE IF NOT EXISTS `tbcarwash` (
  `codlocal` int(6) NOT NULL,
  `codusu` int(6) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `servicios` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `distrito` varchar(50) DEFAULT NULL,
  `telefono` varchar(9) DEFAULT NULL,
  `horario` varchar(100) DEFAULT NULL,
  `disponibilidad` varchar(25) DEFAULT NULL,
  `latitud` varchar(25) DEFAULT NULL,
  `longitud` varchar(25) DEFAULT NULL,
  `imagen` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codlocal`),
  KEY `FK_carwash_usuario` (`codusu`),
  CONSTRAINT `FK_carwash_usuario` FOREIGN KEY (`codusu`) REFERENCES `tbusuario` (`codusu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla carwash.tbcarwash: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbcarwash` DISABLE KEYS */;
INSERT INTO `tbcarwash` (`codlocal`, `codusu`, `nombre`, `servicios`, `direccion`, `distrito`, `telefono`, `horario`, `disponibilidad`, `latitud`, `longitud`, `imagen`) VALUES
	(1, 2, 'Las Nenitas', 'Todo papi', 'Av. Venezuela 395', 'Cercado', '999948184', 'Todos los dias', 'Ya mismo', '', NULL, NULL);
/*!40000 ALTER TABLE `tbcarwash` ENABLE KEYS */;

-- Volcando estructura para tabla carwash.tbusuario
CREATE TABLE IF NOT EXISTS `tbusuario` (
  `codusu` int(6) NOT NULL AUTO_INCREMENT,
  `nomusu` varchar(50) NOT NULL DEFAULT '0',
  `pass` varchar(50) NOT NULL DEFAULT '0',
  `nom` varchar(60) NOT NULL DEFAULT '0',
  `correo` varchar(50) NOT NULL DEFAULT '0',
  `telf` varchar(9) NOT NULL DEFAULT '0',
  `direc` varchar(70) NOT NULL DEFAULT '0',
  `edad` int(3) NOT NULL DEFAULT '0',
  `sexo` varchar(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`codusu`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla carwash.tbusuario: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `tbusuario` DISABLE KEYS */;
INSERT INTO `tbusuario` (`codusu`, `nomusu`, `pass`, `nom`, `correo`, `telf`, `direc`, `edad`, `sexo`) VALUES
	(1, 'utp', '123', 'usuario1', 'utp@hotmail.com', '959406132', 'Av. Arequipa 2560 - Centro de Lima', 25, 'Hombre'),
	(2, 'colaborador1', '123', 'Carlos Perez', 'cperez@robajato.com', '999999999', 'Av. Alfonso Ugarte 345 - Centro de Lima', 29, 'Hombre');
/*!40000 ALTER TABLE `tbusuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
