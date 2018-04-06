-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 06-04-2018 a las 15:14:32
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `servicioweb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE IF NOT EXISTS `departamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=15 ;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id`, `nombre`) VALUES
(1, 'Ahuachapán'),
(2, 'Sonsonate'),
(3, 'Santa Ana'),
(4, 'Cabañas'),
(5, 'Chalatenango'),
(6, 'Cuscatlán'),
(7, 'La Libertad'),
(8, 'La Paz'),
(9, 'San Salvador'),
(10, 'San Vicente'),
(11, 'Morazán'),
(12, 'San Miguel'),
(13, 'Usulután'),
(14, 'La Unión');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE IF NOT EXISTS `historial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idproducto` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_at` (`created_at`,`updated_at`),
  KEY `historial_usu` (`idusuario`),
  KEY `historial_pro` (`idproducto`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `historial`
--

INSERT INTO `historial` (`id`, `idproducto`, `idusuario`, `created_at`, `updated_at`) VALUES
(1, 5, 2, '2018-04-06', '2018-04-06'),
(2, 3, 4, '2018-04-06', '2018-04-06'),
(3, 3, 2, '2018-04-06', '2018-04-06'),
(4, 1, 4, '2018-04-06', '2018-04-06'),
(5, 1, 3, '2018-04-06', '2018-04-06'),
(6, 2, 4, '2018-04-06', '2018-04-06'),
(7, 4, 4, '2018-04-06', '2018-04-06'),
(8, 5, 2, '2018-04-06', '2018-04-06'),
(9, 1, 2, '2018-04-06', '2018-04-06'),
(10, 2, 2, '2018-04-06', '2018-04-06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE IF NOT EXISTS `municipio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `iddepartamento` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `municipios_dep` (`iddepartamento`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=157 ;

--
-- Volcado de datos para la tabla `municipio`
--

INSERT INTO `municipio` (`id`, `nombre`, `iddepartamento`) VALUES
(1, 'Apaneca', 1),
(2, 'Atiquizaya', 1),
(3, 'Concepción de Ataco', 1),
(4, 'El Refugio', 1),
(5, 'Guaymango', 1),
(6, 'Jujutla', 1),
(7, 'San Francisco Menéndez', 1),
(8, 'San Lorenzo', 1),
(9, 'San Pedro Puxtla', 1),
(10, 'Tacuba', 1),
(11, 'Turín', 1),
(12, 'Acajutla', 2),
(13, 'Armenia', 2),
(14, 'Caluco', 2),
(15, 'Cuisnahuat', 2),
(16, 'Izalco', 2),
(17, 'Juayúa', 2),
(18, 'Nahuizalco', 2),
(19, 'Nahulingo', 2),
(20, 'Salcoatitán', 2),
(21, 'San Antonio del Monte', 2),
(22, 'San Julián', 2),
(23, 'Santa Catarina Masahuat', 2),
(24, 'Santa Isabel Ishuatán', 2),
(25, 'Santo Domingo de Guzmán', 2),
(26, 'Sonsonate', 2),
(27, 'Sonzacate', 2),
(28, 'Candelaria de la Frontera', 3),
(29, 'Chalchuapa', 3),
(30, 'Coatepeque', 3),
(31, 'El Congo', 3),
(32, 'El Porvenir', 3),
(33, 'Masahuat', 3),
(34, 'Metapán', 3),
(35, 'San Antonio Pajonal', 3),
(36, 'San Sebastián Salitrillo', 3),
(37, 'Santa Ana', 3),
(38, 'Santa Rosa Guachipilín', 3),
(39, 'Santiago de la Frontera', 3),
(40, 'Texistepeque', 3),
(41, 'Cinquera', 4),
(42, ' Villa Dolores', 4),
(43, 'Guacotecti', 4),
(44, 'Ilobasco', 4),
(45, 'Jutiapa', 4),
(46, 'San Isidro', 4),
(47, 'Sensuntepeque', 4),
(48, 'Tejutepeque', 4),
(49, 'Victoria', 4),
(50, 'Agua Caliente', 5),
(51, 'Arcatao', 5),
(52, 'Azacualpa', 5),
(53, 'Chalatenango', 5),
(54, 'Citalá', 5),
(55, 'Comalapa', 5),
(56, 'Concepción Quezaltepeque', 5),
(57, 'Dulce Nombre de María', 5),
(58, 'El Carrizal', 5),
(59, 'El Paraíso', 5),
(60, 'La Laguna', 5),
(61, 'La Palma', 5),
(62, 'La Reina', 5),
(63, 'Las Vueltas', 5),
(64, 'Nombre de Jesús', 5),
(65, 'Nueva Concepción', 5),
(66, 'Nueva Trinidad', 5),
(67, 'Ojos de Agua', 5),
(68, 'Potonico', 5),
(69, 'San Antonio de la Cruz', 5),
(70, 'San Antonio Los Ranchos', 5),
(71, 'San Fernando', 5),
(72, 'San Francisco Lempa', 5),
(73, 'San Francisco Morazán', 5),
(74, 'San Ignacio', 5),
(75, 'San Isidro Labrador', 5),
(76, 'Cancasque', 5),
(77, 'Las Flores', 5),
(78, 'San Luis del Carmen', 5),
(79, 'San Miguel de Mercedes', 5),
(80, 'San Rafael', 5),
(81, 'Santa Rita', 5),
(82, 'Tejutla', 5),
(83, 'Candelaria', 6),
(84, 'Cojutepeque', 6),
(85, 'El Carmen', 6),
(86, 'El Rosario', 6),
(87, 'Monte San Juan', 6),
(88, 'Oratorio de Concepción', 6),
(89, 'San Bartolomé Perulapía', 6),
(90, 'San Cristóbal', 6),
(91, 'San José Guayabal', 6),
(92, 'San Pedro Perulapán', 6),
(93, 'San Rafael Cedros', 6),
(94, 'San Ramón', 6),
(95, 'Santa Cruz Analquito', 6),
(96, 'Santa Cruz Michapa', 6),
(97, 'Suchitoto', 6),
(98, 'Tenancingo', 6),
(99, 'Antiguo Cuscatlán', 7),
(100, 'Chiltiupán', 7),
(101, 'Ciudad Arce', 7),
(102, 'Colón', 7),
(103, 'Comasagua', 7),
(104, 'Huizúcar	', 7),
(105, 'Jayaque', 7),
(106, 'Jicalapa', 7),
(107, 'La Libertad', 7),
(108, 'Santa Tecla', 7),
(109, 'Nuevo Cuscatlán', 7),
(110, 'San Juan Opico', 7),
(111, 'Quezaltepeque', 7),
(112, 'Sacacoyo', 7),
(113, 'San José Villanueva', 7),
(114, 'San Matías', 7),
(115, 'San Pablo Tacachico', 7),
(116, 'Talnique', 7),
(117, 'Tamanique', 7),
(118, 'Teotepeque', 7),
(119, 'Tepecoyo', 7),
(120, 'Zaragoza', 7),
(121, 'Cuyultitán', 8),
(122, 'El Rosario', 8),
(123, 'Jerusalén	', 8),
(124, 'Mercedes La Ceiba', 8),
(125, 'Olocuilta', 8),
(126, 'Paraíso de Osorio', 8),
(127, 'Aguilares', 9),
(128, 'Apopa', 9),
(129, 'Ayutuxtepeque', 9),
(130, 'Delgado', 9),
(131, 'Ilopango', 9),
(132, 'Guadalupe', 10),
(133, 'Verapaz', 10),
(134, 'Santa Clara', 10),
(135, 'San Vicente', 10),
(136, 'San Ildefonso', 10),
(137, 'San Francisco Gotera', 11),
(138, 'San Isidro', 11),
(139, 'Yamabal', 11),
(140, 'Yoloaiquín', 11),
(141, 'Torola', 11),
(142, 'San Miguel', 12),
(143, 'Lolotique', 12),
(144, 'Moncagua', 12),
(145, 'Quelepa', 12),
(146, 'Sesori', 12),
(147, 'Alegría', 13),
(148, 'Usulután', 13),
(149, 'Tecapán', 13),
(150, 'Ozatlán', 13),
(151, 'Jucuarán', 13),
(152, 'La Unión', 14),
(153, 'Anamorós', 14),
(154, 'Bolívar', 14),
(155, 'Conchagua', 14),
(156, 'Intipucá', 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_spanish2_ci NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_at` (`created_at`,`updated_at`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio`, `created_at`, `updated_at`) VALUES
(1, 'CD', 'disco reproductor de musica de los 90''s', '60.00', '2018-04-06', '2018-04-06'),
(2, 'USB 64GB', 'dispositivo de almacenamiento portatil de 64GB', '29.99', '2018-04-06', '2018-04-06'),
(3, 'Disquete 10MB', 'Dispositivo antiguo de almacenamiento de 10MB', '15.00', '2018-04-06', '2018-04-06'),
(4, 'Discoduro 1TB', 'Dispositivo masivo de almacenamiento de 1TB', '50.00', '2018-04-06', '2018-04-06'),
(5, 'i8 ', 'procesador para computadoras de ultima generacion', '69.99', '2018-04-06', '2018-04-06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `departamentoid` int(11) NOT NULL,
  `municipioid` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_mun` (`municipioid`),
  KEY `usuario_dep` (`departamentoid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `username`, `password`, `nombre`, `departamentoid`, `municipioid`, `created_at`, `updated_at`) VALUES
(2, 'root', 'root', 'root', 12, 145, '2018-04-06', '2018-04-06'),
(3, 'samael', 'udb123', 'Samuel', 4, 42, '2018-04-06', '2018-04-06'),
(4, 'Havalos', 'avalos', 'Henry', 1, 1, '2018-04-06', '2018-04-06');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `historial_pro` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_usu` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `municipios_dep` FOREIGN KEY (`iddepartamento`) REFERENCES `departamento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_dep` FOREIGN KEY (`departamentoid`) REFERENCES `departamento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_mun` FOREIGN KEY (`municipioid`) REFERENCES `municipio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
