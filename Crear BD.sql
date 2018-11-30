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

-- Volcando datos para la tabla carwash.tbatencion: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbatencion` DISABLE KEYS */;
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
	('14GH5', 'Toyota', 'Yaris', 2009, 11);
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
	(1, 1, 'AUTOWASH', 'Lavada, Encerado, Pulido', 'Av. Prol. Iquitos 1738', 'Lince', '2622010', 'L - D  08:00 am - 18:30 pm', 'disponible', '-12.080797', '-77.028648', 'local-01.png'),
	(2, 2, 'House Car Wash', 'Lavada, Encerado', 'Calle Piura 1181', 'Miraflores', '4479548', 'L - S  08:00 am - 18:00 pm', 'disponible', '-12.11593', '-77.040849', 'local-02.jpg'),
	(3, 3, 'RS4 Carwash Detailing', 'Lavada', 'Jirón Francisco de Zela 1939', 'Lince', '990016117', 'L - D  08:00 am - 19:00 pm', 'disponible', '-12.083403', '-77.039830', 'local-03.jpg'),
	(4, 4, 'Car Wash Zurita', 'Lavada, Encerado, Pulido', 'Av. Jose Manuel Iturregui', 'Surquillo', '4468859', 'L - S  09:00 am - 18:00 pm', 'disponible', '-12.105247', '-77.019624', 'local-04.jpg'),
	(5, 5, 'The Wash Brothers Peru', 'Lavada, Encerado, Pulido, Undercoating', 'Calle San Diego 745', 'Surquillo', '942013318', 'L - D  08:30 am - 17:30 pm', 'disponible', '-12.11772', '-77.018812', 'local-05.jpg'),
	(6, 6, 'Lava Car Peru', 'Lavada', 'Av. Surco Cuadra 1, lote 4 Urb. Huertos de Camacho', 'Surco', '943444741', 'L - D  07:30 am - 19:00 pm', 'disponible', '-12.147046', '-76.999039', 'local-06.jpg'),
	(7, 7, 'Vapor Car Wash', 'Lavada, Encerado', 'Av. Brasil 699', 'Jesus Maria', '6789327', 'L - D  08:00 am - 19:00 pm', 'disponible', '-12.066293', '-77.046194', 'local-07.jpg'),
	(8, 8, 'Pit Stop Peru', 'Lavada, Encerado', 'Avenida San Juan 235', 'La Victoria', '6661895', 'L - D  08:00 am - 19:00 pm', 'disponible', '-12.076379', '-77.009295', 'local-08.png'),
	(9, 9, 'G&R Car Wash', 'Lavada', 'Av. Ignacio Merino 2376', 'Lince', '963339490', 'L - S  08:00 am - 17:30 pm', 'disponible', '-12.087047', '-77.032067', 'local-09.jpg'),
	(10, 10, 'Monkey Car Wash & Detailing', 'Lavada, Encerado, Pulido, Undercoating', 'Calle Domingo Orué 770', 'Surquillo', '999014949', 'L - D  08:00 am - 18:00 pm', 'disponible', '-12.10612', '-77.020043', 'local-10.png');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla carwash.tbusuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tbusuario` DISABLE KEYS */;
INSERT INTO `tbusuario` (`codusu`, `nomusu`, `pass`, `nom`, `correo`, `telf`, `direc`, `edad`, `sexo`) VALUES
	(1, 'colaborador1', '123', 'Ismael Gimenez Fernandez', 'colaborador1@hotmail.com', '948184046', 'Av. Brasil 1430', 18, 'Hombre'),
	(2, 'colaborador2', '123', 'Mario Casas Ferrer', 'colaborador2@hotmail.com', '948184047', 'Av. Brasil 1431', 19, 'Hombre'),
	(3, 'colaborador3', '123', 'Mario Morales Muñoz', 'colaborador3@hotmail.com', '948184048', 'Av. Brasil 1432', 20, 'Hombre'),
	(4, 'colaborador4', '123', 'Joan Fuentes Lozano', 'colaborador4@hotmail.com', '948184049', 'Av. Brasil 1433', 21, 'Hombre'),
	(5, 'colaborador5', '123', 'Raúl Mas Gutierrez', 'colaborador5@hotmail.com', '948184050', 'Av. Brasil 1434', 22, 'Hombre'),
	(6, 'colaborador6', '123', 'Paula Ruiz Vidal', 'colaborador6@hotmail.com', '948184051', 'Av. Brasil 1435', 23, 'Mujer'),
	(7, 'colaborador7', '123', 'Aroa Flores Soto', 'colaborador7@hotmail.com', '948184052', 'Av. Brasil 1436', 24, 'Mujer'),
	(8, 'colaborador8', '123', 'Mara Flores Alvarez', 'colaborador8@hotmail.com', '948184053', 'Av. Brasil 1437', 25, 'Mujer'),
	(9, 'colaborador9', '123', 'Yaiza Ferrer Garrido', 'colaborador9@hotmail.com', '948184054', 'Av. Brasil 1438', 26, 'Mujer'),
	(10, 'colaborador10', '123', 'Victoria Alvarez Santiago', 'colaborador10@hotmail.com', '948184055', 'Av. Brasil 1439', 27, 'Mujer'),
	(11, 'utp', '123', 'David Quevedo Velasco', 'profesor@utp.edu.pe', '948184056', 'Av. Brasil 1440', 28, 'Hombre');
/*!40000 ALTER TABLE `tbusuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
