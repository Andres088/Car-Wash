-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-11-2018 a las 03:04:20
-- Versión del servidor: 10.1.9-MariaDB
-- Versión de PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `carwash`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbacceso`
--

CREATE TABLE `tbacceso` (
  `nomusu` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `dni` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbacceso`
--

INSERT INTO `tbacceso` (`nomusu`, `pass`, `dni`) VALUES
('utp', '123456', '76000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbauto`
--

CREATE TABLE `tbauto` (
  `placa` varchar(50) NOT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `des` varchar(50) DEFAULT NULL,
  `dni` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbauto`
--

INSERT INTO `tbauto` (`placa`, `marca`, `modelo`, `des`, `dni`) VALUES
('14GH5', 'Toyota', 'Yaris', 'Auto de color rojo', '1'),
('er333', 'hyndai', 'ducati', 'dadada', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbcarwash`
--

CREATE TABLE `tbcarwash` (
  `codcar` int(6) NOT NULL,
  `direc` varchar(50) NOT NULL DEFAULT '0',
  `hora` varchar(50) NOT NULL DEFAULT '0.0',
  `telf` varchar(10) NOT NULL DEFAULT '0',
  `punt` double(5,1) NOT NULL DEFAULT '0.0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbcarwash`
--

INSERT INTO `tbcarwash` (`codcar`, `direc`, `hora`, `telf`, `punt`) VALUES
(1, 'La Molina', 'Lun a Vier 10am-6pm', '73156201', 8.1),
(2, 'La Molina', 'Mar a Jue 12pm-8pm', '54201562', 7.2),
(3, 'Surco', 'Jue a Dom 10am-4pm', '61235488', 7.0),
(4, 'Centro', 'Lue a Sab 10pm-5pm', '94520811', 5.8),
(5, 'San Isidro', 'Mier a Vier 11pm-9pm', '74152085', 5.3),
(6, 'San Isidro', 'Mar a Jue 10pm-7pm', '76214598', 5.7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblavador`
--

CREATE TABLE `tblavador` (
  `codlav` int(5) NOT NULL,
  `nom` varchar(50) NOT NULL DEFAULT '0',
  `hora` varchar(50) NOT NULL DEFAULT '0',
  `punt` double(5,1) NOT NULL DEFAULT '0.0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblavador`
--

INSERT INTO `tblavador` (`codlav`, `nom`, `hora`, `punt`) VALUES
(1, 'Jose Ceballos', 'Lunes a Viernes 5pm-7pm', 7.5),
(2, 'Erick Garcia', 'Sabado 10am-5pm', 8.0),
(3, 'Manuel Jimenez', 'Martes a Jueves 10am-7pm', 5.5),
(4, 'Jose Luis Sanchez', 'Lun Mar Mier 8am-5pm', 5.2),
(5, 'Pablo Cano', 'Jue Vie 8am-7pm', 7.2),
(6, 'Ivan Arenas', 'Dom 11pm-2pm', 6.0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbservlavado`
--

CREATE TABLE `tbservlavado` (
  `codserv` int(11) NOT NULL,
  `tipolav` varchar(50) NOT NULL DEFAULT '0',
  `tipopag` varchar(50) NOT NULL DEFAULT '0',
  `placa` varchar(50) NOT NULL,
  `codlav` int(5) DEFAULT NULL,
  `codcar` int(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbservlavado`
--

INSERT INTO `tbservlavado` (`codserv`, `tipolav`, `tipopag`, `placa`, `codlav`, `codcar`) VALUES
(4, 'Basico', 'Efectivo', '14GH5', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbusuario`
--

CREATE TABLE `tbusuario` (
  `dni` varchar(8) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `telf` varchar(9) NOT NULL,
  `direc` varchar(30) NOT NULL,
  `edad` int(11) NOT NULL,
  `sexo` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbusuario`
--

INSERT INTO `tbusuario` (`dni`, `nom`, `correo`, `telf`, `direc`, `edad`, `sexo`) VALUES
('74000000', 'Jose Diaz', 'nose@jaja.com', '55555555', 'desconocida', 19, 'Hombre'),
('75000000', 'Loco', 'loco@jaja.com', '999999999', 'desconocida', 27, 'Hombre'),
('76000000', 'fulano de tal', 'nose@jaja.com', '55555555', 'desconocida', 22, 'Hombre');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbacceso`
--
ALTER TABLE `tbacceso`
  ADD PRIMARY KEY (`nomusu`),
  ADD KEY `dni` (`dni`);

--
-- Indices de la tabla `tbauto`
--
ALTER TABLE `tbauto`
  ADD PRIMARY KEY (`placa`),
  ADD KEY `codigousuario` (`dni`) USING BTREE;

--
-- Indices de la tabla `tbcarwash`
--
ALTER TABLE `tbcarwash`
  ADD PRIMARY KEY (`codcar`);

--
-- Indices de la tabla `tblavador`
--
ALTER TABLE `tblavador`
  ADD PRIMARY KEY (`codlav`);

--
-- Indices de la tabla `tbservlavado`
--
ALTER TABLE `tbservlavado`
  ADD PRIMARY KEY (`codserv`),
  ADD KEY `FK_servlavado_auto` (`placa`),
  ADD KEY `FK_servlavado_lavador` (`codlav`),
  ADD KEY `FK_servlavado_carwash` (`codcar`);

--
-- Indices de la tabla `tbusuario`
--
ALTER TABLE `tbusuario`
  ADD PRIMARY KEY (`dni`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbcarwash`
--
ALTER TABLE `tbcarwash`
  MODIFY `codcar` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `tblavador`
--
ALTER TABLE `tblavador`
  MODIFY `codlav` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `tbservlavado`
--
ALTER TABLE `tbservlavado`
  MODIFY `codserv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbacceso`
--
ALTER TABLE `tbacceso`
  ADD CONSTRAINT `fk_acceso_usuario` FOREIGN KEY (`dni`) REFERENCES `tbusuario` (`dni`);

--
-- Filtros para la tabla `tbservlavado`
--
ALTER TABLE `tbservlavado`
  ADD CONSTRAINT `FK_servlavado_auto` FOREIGN KEY (`placa`) REFERENCES `tbauto` (`placa`),
  ADD CONSTRAINT `FK_servlavado_carwash` FOREIGN KEY (`codcar`) REFERENCES `tbcarwash` (`codcar`),
  ADD CONSTRAINT `FK_servlavado_lavador` FOREIGN KEY (`codlav`) REFERENCES `tblavador` (`codlav`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
