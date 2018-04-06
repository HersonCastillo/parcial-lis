-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 09-09-2015 a las 11:42:38
-- Versión del servidor: 5.5.42-cll-lve
-- Versión de PHP: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `zirconia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_sucursal` int(11) NOT NULL,
  `codigo` varchar(200) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_sucursal` (`id_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_vendedor` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `registro_fiscal` varchar(100) NOT NULL,
  `dui` varchar(100) NOT NULL,
  `limite_credito` float NOT NULL,
  `nombre_comercial` varchar(200) NOT NULL,
  `pais` varchar(200) NOT NULL,
  `departamento` varchar(200) NOT NULL,
  `municipio` varchar(200) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `telefono` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `nit` varchar(200) NOT NULL,
  `estado` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idVendedor` (`id_vendedor`,`id_sucursal`),
  KEY `id_sucursal` (`id_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consignacion`
--

CREATE TABLE IF NOT EXISTS `consignacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_cliente` varchar(100) DEFAULT NULL,
  `codigo_vendedor` varchar(100) DEFAULT NULL,
  `id_sucursal` int(11) NOT NULL,
  `num_consigna` int(11) NOT NULL,
  `fecha_entrega` varchar(200) NOT NULL,
  `fecha_recibo` varchar(200) DEFAULT NULL,
  `total_precio` float DEFAULT NULL,
  `total_productos` int(11) DEFAULT NULL,
  `notas` varchar(300) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `tipo` varchar(60) DEFAULT NULL,
  `codigo_traslado` varchar(30) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `codigoCliente` (`codigo_cliente`),
  KEY `id_cliente` (`codigo_cliente`),
  KEY `id_sucursales` (`id_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `corte_diario`
--

CREATE TABLE IF NOT EXISTS `corte_diario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_vendedor` int(11) NOT NULL,
  `id_transacion` int(11) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `cliente` int(11) NOT NULL,
  `monto` float NOT NULL,
  `created_at` date NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta_cobrar`
--

CREATE TABLE IF NOT EXISTS `cuenta_cobrar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente` varchar(100) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `monto` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `id_cliente` (`cliente`),
  KEY `id_sucursal` (`id_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `datos_clientes`
--

CREATE TABLE IF NOT EXISTS `datos_clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `r_nombre` varchar(100) NOT NULL,
  `r_telefono` varchar(100) NOT NULL,
  `rf_nombre` varchar(100) NOT NULL,
  `rf_telefono` varchar(100) NOT NULL,
  `rf_nombre2` varchar(100) NOT NULL,
  `rf_telefono2` varchar(100) NOT NULL,
  `rp_nombre` varchar(100) NOT NULL,
  `rp_telefono` varchar(100) NOT NULL,
  `rp_nombre2` varchar(100) NOT NULL,
  `rp_telefono2` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_cliente`),
  KEY `id_cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_consignacion`
--

CREATE TABLE IF NOT EXISTS `detalle_consignacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `codigo_producto` varchar(60) NOT NULL,
  `id_consignacion` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` float NOT NULL,
  `total` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `id_producto` (`id_producto`),
  KEY `id_consignacion` (`id_consignacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_inventario`
--

CREATE TABLE IF NOT EXISTS `detalle_inventario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_inventario` int(11) NOT NULL,
  `codigo_prod` varchar(100) NOT NULL,
  `cantidad_stock` int(11) NOT NULL,
  `cantidad_consigna` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `id_inventario` (`id_inventario`,`codigo_prod`),
  KEY `id_producto` (`codigo_prod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_liquidacion`
--

CREATE TABLE IF NOT EXISTS `detalle_liquidacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_liquidacion` int(11) NOT NULL,
  `id_consignacion` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_liquidacion` (`id_liquidacion`),
  KEY `id_consignacion` (`id_consignacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devolucion`
--

CREATE TABLE IF NOT EXISTS `devolucion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod_devolucion` varchar(100) NOT NULL,
  `cliente` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `total` float NOT NULL,
  `estado` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente` (`cliente`),
  KEY `cliente_2` (`cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE IF NOT EXISTS `inventario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_sucursal` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idSucursal` (`id_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `liquidacion`
--

CREATE TABLE IF NOT EXISTS `liquidacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_liquidacion` int(11) DEFAULT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_cliente` varchar(100) NOT NULL,
  `cant_pro` int(11) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `total` float NOT NULL,
  `deuda` float NOT NULL DEFAULT '0',
  `monto_usado` float NOT NULL DEFAULT '0',
  `montoR` float NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_sucursal` (`id_sucursal`),
  KEY `id_cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `motivo_salida`
--

CREATE TABLE IF NOT EXISTS `motivo_salida` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `motivo` varchar(400) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos_cc`
--

CREATE TABLE IF NOT EXISTS `movimientos_cc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_factura` int(11) DEFAULT NULL,
  `id_cc` int(11) NOT NULL,
  `tipo` varchar(100) NOT NULL,
  `codigo_cliente` varchar(100) NOT NULL,
  `cliente` varchar(100) NOT NULL,
  `vendedor` varchar(100) NOT NULL,
  `notas` varchar(100) DEFAULT NULL,
  `monto` float NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cc` (`id_cc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `id` int(200) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) DEFAULT NULL,
  `id_sucursal` int(11) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `nombre_producto` varchar(200) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `precio` float NOT NULL,
  `precio_unitario` float NOT NULL,
  `precio_mayoria` float NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idCategoria` (`id_categoria`),
  KEY `id_sucursal` (`id_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_devolucion`
--

CREATE TABLE IF NOT EXISTS `productos_devolucion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_devolucion` int(11) NOT NULL,
  `producto` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `precio` float NOT NULL,
  `cantidad` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_devolucion` (`id_devolucion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_liquidacion`
--

CREATE TABLE IF NOT EXISTS `productos_liquidacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `codigo_producto` varchar(60) NOT NULL,
  `id_liquidacion` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `cantidad_visual` int(11) NOT NULL,
  `devuelve` int(11) NOT NULL DEFAULT '0',
  `precio` float NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_producto` (`id_producto`),
  KEY `id_liquidacion` (`id_liquidacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE IF NOT EXISTS `proveedores` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `codigo_prov` varchar(100) NOT NULL,
  `registro_fiscal` varchar(200) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `nit` varchar(200) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `fecha` varchar(20) NOT NULL,
  `pais` varchar(200) NOT NULL,
  `departamento` varchar(200) NOT NULL,
  `municipio` varchar(2000) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `giro_negocio` varchar(200) NOT NULL,
  `contacto` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal`
--

CREATE TABLE IF NOT EXISTS `sucursal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(10) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `telefono` varchar(200) NOT NULL,
  `pais` varchar(200) NOT NULL,
  `departamento` varchar(200) NOT NULL,
  `municipio` varchar(200) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `sucursal`
--

INSERT INTO `sucursal` (`id`, `codigo`, `nombre`, `telefono`, `pais`, `departamento`, `municipio`, `direccion`, `created_at`, `updated_at`) VALUES
(7, '345', 'San Salvador', '3232', 'EL Salvador', 'San Salvador', 'Ilopango', 'fdsafdsa', '2015-09-03 17:30:23', '0000-00-00 00:00:00'),
(8, '444', 'fdsa', 'fdsa', 'El Salvador', 'Ahuachapán', 'Apaneca', 'fdsa', '2015-09-04 00:37:15', '2015-09-04 00:37:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supervisor`
--

CREATE TABLE IF NOT EXISTS `supervisor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `telefono` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `estado` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idUsuario` (`id_usuario`),
  KEY `id_sucursal` (`id_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_sucursal` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `tipo` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `id_sucursal` (`id_sucursal`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `id_sucursal`, `username`, `password`, `tipo`, `created_at`, `updated_at`) VALUES
(37, 7, 'cardoza', '027836371f0526d4f94dae02f7c920ac', 'SuperAdmin', '2015-09-03 17:32:09', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendedor`
--

CREATE TABLE IF NOT EXISTS `vendedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `telefono` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `estado` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idSucursal` (`id_usuario`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_sucursal` (`id_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `categorias_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`id_vendedor`) REFERENCES `vendedor` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `consignacion`
--
ALTER TABLE `consignacion`
  ADD CONSTRAINT `consignacion_ibfk_2` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `cuenta_cobrar`
--
ALTER TABLE `cuenta_cobrar`
  ADD CONSTRAINT `cuenta_cobrar_ibfk_2` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `datos_clientes`
--
ALTER TABLE `datos_clientes`
  ADD CONSTRAINT `datos_clientes_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_consignacion`
--
ALTER TABLE `detalle_consignacion`
  ADD CONSTRAINT `detalle_consignacion_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_consignacion_ibfk_2` FOREIGN KEY (`id_consignacion`) REFERENCES `consignacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_inventario`
--
ALTER TABLE `detalle_inventario`
  ADD CONSTRAINT `detalle_inventario_ibfk_1` FOREIGN KEY (`id_inventario`) REFERENCES `inventario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_liquidacion`
--
ALTER TABLE `detalle_liquidacion`
  ADD CONSTRAINT `detalle_liquidacion_ibfk_2` FOREIGN KEY (`id_consignacion`) REFERENCES `consignacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_liquidacion_ibfk_3` FOREIGN KEY (`id_liquidacion`) REFERENCES `liquidacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `liquidacion`
--
ALTER TABLE `liquidacion`
  ADD CONSTRAINT `liquidacion_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `movimientos_cc`
--
ALTER TABLE `movimientos_cc`
  ADD CONSTRAINT `movimientos_cc_ibfk_1` FOREIGN KEY (`id_cc`) REFERENCES `cuenta_cobrar` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos_devolucion`
--
ALTER TABLE `productos_devolucion`
  ADD CONSTRAINT `productos_devolucion_ibfk_1` FOREIGN KEY (`id_devolucion`) REFERENCES `devolucion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos_liquidacion`
--
ALTER TABLE `productos_liquidacion`
  ADD CONSTRAINT `productos_liquidacion_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `productos_liquidacion_ibfk_2` FOREIGN KEY (`id_liquidacion`) REFERENCES `liquidacion` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `supervisor`
--
ALTER TABLE `supervisor`
  ADD CONSTRAINT `supervisor_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `supervisor_ibfk_2` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `vendedor`
--
ALTER TABLE `vendedor`
  ADD CONSTRAINT `vendedor_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vendedor_ibfk_2` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
