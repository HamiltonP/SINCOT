-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 01-05-2019 a las 17:25:03
-- Versión del servidor: 5.7.21-log
-- Versión de PHP: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `siscot`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `apu_s`
--

DROP TABLE IF EXISTS `apu_s`;
CREATE TABLE IF NOT EXISTS `apu_s` (
  `idapu_s` int(11) NOT NULL AUTO_INCREMENT,
  `unidades_fk` int(11) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `total` decimal(45,0) DEFAULT NULL,
  PRIMARY KEY (`idapu_s`),
  KEY `fk_apu_s_unidades_idx` (`unidades_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `apu_s`
--

INSERT INTO `apu_s` (`idapu_s`, `unidades_fk`, `descripcion`, `total`) VALUES
(1, 3, 'DESMONTE Y LIMPIEZA EN BOSQUE\r\n', '2342678'),
(2, 3, 'DESMONTE Y LIMPIEZA EN ZONAS NO BOSCOSAS\r\n', '12347724'),
(3, 3, 'DEMOLICIÓN DE EDIFICACIONES\r\n', '34567854'),
(4, 3, 'DEMOLICIÓN DE ESTRUCTURAS\r\n', '87654876'),
(5, 3, 'DEMOLICIÓN DE PAVIMENTOS RÍGIDOS, PISOS, ANDENES Y BORDILLOS DE CONCRETO\r\n', '76543567'),
(6, 3, 'DEMOLICIÓN DE OBSTÁCULos', '23456745'),
(7, 4, 'DEMOLICIÓN DE EDIFICACIONES\r\n', '136'),
(8, 3, '', NULL),
(9, 5, 'DEMOLICIÓN DE BORDILLOS DE CONCRETO\r\n', '6'),
(10, 3, 'REMOCIÓN DE DUCTOS DE SERVICIOS EXISTENTES\r\n', '23456');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

DROP TABLE IF EXISTS `area`;
CREATE TABLE IF NOT EXISTS `area` (
  `idarea` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idarea`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `area`
--

INSERT INTO `area` (`idarea`, `descripcion`) VALUES
(1, 'oficina central'),
(2, 'oficina administrativa'),
(3, 'piso 2'),
(4, 'piso 3'),
(5, 'cocina'),
(6, 'piso 3'),
(7, 'hall principal'),
(8, 'parqueadero'),
(9, 'berma central'),
(10, 'salon de eventos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area_has_cotizacion`
--

DROP TABLE IF EXISTS `area_has_cotizacion`;
CREATE TABLE IF NOT EXISTS `area_has_cotizacion` (
  `area_idarea` int(11) NOT NULL,
  `transaccion_fk` int(11) NOT NULL,
  KEY `fk_area_has_cotizacion_area1_idx` (`area_idarea`),
  KEY `fk_area_has_cotizacion_transaccion_cotizacion1_idx` (`transaccion_fk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `area_has_cotizacion`
--

INSERT INTO `area_has_cotizacion` (`area_idarea`, `transaccion_fk`) VALUES
(2, 1),
(7, 1),
(1, 1),
(7, 1),
(5, 1),
(8, 1),
(5, 1),
(5, 2),
(7, 2),
(3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area_has_lugar_area`
--

DROP TABLE IF EXISTS `area_has_lugar_area`;
CREATE TABLE IF NOT EXISTS `area_has_lugar_area` (
  `lugar_area_idlugar_area` int(11) NOT NULL,
  `area_idarea` int(11) NOT NULL,
  KEY `fk_area_has_lugar_area_lugar_area1_idx` (`lugar_area_idlugar_area`),
  KEY `fk_area_has_lugar_area_area1_idx` (`area_idarea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `area_has_lugar_area`
--

INSERT INTO `area_has_lugar_area` (`lugar_area_idlugar_area`, `area_idarea`) VALUES
(4, 5),
(5, 7),
(5, 7),
(1, 2),
(5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion_has_herramientas`
--

DROP TABLE IF EXISTS `cotizacion_has_herramientas`;
CREATE TABLE IF NOT EXISTS `cotizacion_has_herramientas` (
  `herramientas_idherramientas` int(11) NOT NULL,
  `transaccion_inventario_idtransaccion_inventario` int(11) NOT NULL,
  KEY `fk_cotizacion_has_herramientas_herramientas1_idx` (`herramientas_idherramientas`),
  KEY `fk_cotizacion_has_herramientas_transaccion_inventario1_idx` (`transaccion_inventario_idtransaccion_inventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cotizacion_has_herramientas`
--

INSERT INTO `cotizacion_has_herramientas` (`herramientas_idherramientas`, `transaccion_inventario_idtransaccion_inventario`) VALUES
(1, 2),
(3, 4),
(4, 2),
(4, 5),
(1, 7),
(2, 6),
(2, 6),
(2, 5),
(3, 5),
(5, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

DROP TABLE IF EXISTS `equipo`;
CREATE TABLE IF NOT EXISTS `equipo` (
  `idequipo` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(60) DEFAULT NULL,
  `unidades_fk` int(11) NOT NULL,
  `tarifa_dia` decimal(45,0) DEFAULT NULL,
  `rendimiento` decimal(45,0) DEFAULT NULL,
  `valor_unitario` decimal(45,0) DEFAULT NULL,
  PRIMARY KEY (`idequipo`),
  KEY `fk_equipo_unidades1_idx` (`unidades_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`idequipo`, `descripcion`, `unidades_fk`, `tarifa_dia`, `rendimiento`, `valor_unitario`) VALUES
(1, 'Vehículo delineador', 2, '107207', '1', '56754'),
(2, 'Vehículo delineador R=1500 M/H', 3, '91', '1', '91'),
(3, '\"Vibrador de concreto (incluye operario) \"', 3, '6', '2', '12356'),
(4, '\"Vibrocompatador Dynapac (10 ton) \"', 2, '47927', '1', '378761'),
(5, 'Piloteadora potencia 250KW, RPM 1800, fuerza elevadora 200KN', 3, '22467', '2', '47927'),
(6, 'Motoniveladora,', 1, '143455', '2', '378761'),
(7, 'Mezcladora de concreto 1 bulto', 2, '200544', '1', '140167'),
(8, 'Guadañadora, Cilindraje 41.5 cm3,', 3, '45607', '1', '45607'),
(9, 'Montacargas', 2, '20000', '1', '20000'),
(10, 'Vibrocompactador, tipo benitìn', 3, '2340', '2', '4680');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo_has_apu`
--

DROP TABLE IF EXISTS `equipo_has_apu`;
CREATE TABLE IF NOT EXISTS `equipo_has_apu` (
  `apu_s_idapu_s` int(11) NOT NULL,
  `equipo_idequipo` int(11) NOT NULL,
  KEY `fk_equipo_has_apu_apu_s1_idx` (`apu_s_idapu_s`),
  KEY `fk_equipo_has_apu_equipo1_idx` (`equipo_idequipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `herramientas`
--

DROP TABLE IF EXISTS `herramientas`;
CREATE TABLE IF NOT EXISTS `herramientas` (
  `idherramientas` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(120) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `valor_alquiler` int(11) DEFAULT NULL,
  `marcas_fk` int(11) NOT NULL,
  PRIMARY KEY (`idherramientas`),
  KEY `fk_herramientas_marcas1_idx` (`marcas_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `herramientas`
--

INSERT INTO `herramientas` (`idherramientas`, `descripcion`, `cantidad`, `valor_alquiler`, `marcas_fk`) VALUES
(1, 'Pulidora (8500 REV)\r\n', 2, 3000, 2),
(2, 'Planta trituradora\r\n', 2, 4000, 2),
(3, 'Retrocargador CAT 510 \r\n', 100, 4000, 3),
(4, 'Planta eléctrica \r\n', 2, 20000, 3),
(5, '\"Retroexcavadora sobre llantas \r\n\"\r\n', 10, 5000, 4),
(6, '\"Taladro de 1/2´´, pulidora, lijadora y circular', 34, 4000, 4),
(7, '\"Formaleta para camisa de pilote', 30, 20300, 5),
(8, 'Fresadora de pavimento,', 0, 3020, 3),
(9, 'Equipo de oxigeno y soldadura\r\n', 0, 6000, 5),
(10, '\"Equipo de rayos X y/o ultrasonido', 0, 100000, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugar_area`
--

DROP TABLE IF EXISTS `lugar_area`;
CREATE TABLE IF NOT EXISTS `lugar_area` (
  `idlugar_area` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idlugar_area`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `lugar_area`
--

INSERT INTO `lugar_area` (`idlugar_area`, `descripcion`) VALUES
(1, 'pared'),
(2, 'piso'),
(3, 'techo principal'),
(4, 'enchape pared'),
(5, 'muebles principales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lugar_area_has_apu`
--

DROP TABLE IF EXISTS `lugar_area_has_apu`;
CREATE TABLE IF NOT EXISTS `lugar_area_has_apu` (
  `apu_s_idapu_s` int(11) NOT NULL,
  `lugar_area_idlugar_area` int(11) NOT NULL,
  KEY `fk_lugar_area_has_apu_apu_s1_idx` (`apu_s_idapu_s`),
  KEY `fk_lugar_area_has_apu_lugar_area1_idx` (`lugar_area_idlugar_area`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `lugar_area_has_apu`
--

INSERT INTO `lugar_area_has_apu` (`apu_s_idapu_s`, `lugar_area_idlugar_area`) VALUES
(1, 2),
(1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mano_obra`
--

DROP TABLE IF EXISTS `mano_obra`;
CREATE TABLE IF NOT EXISTS `mano_obra` (
  `idmano_obra` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) DEFAULT NULL,
  `unidades_fk` int(11) NOT NULL,
  `jornada_dia` decimal(45,0) DEFAULT NULL,
  `rendimiento` decimal(45,0) DEFAULT NULL,
  `valor_unitario` decimal(45,0) DEFAULT NULL,
  PRIMARY KEY (`idmano_obra`),
  KEY `fk_mano_obra_unidades1_idx` (`unidades_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mano_obra`
--

INSERT INTO `mano_obra` (`idmano_obra`, `descripcion`, `unidades_fk`, `jornada_dia`, `rendimiento`, `valor_unitario`) VALUES
(1, 'Operador prueba de integridad', 1, '120442', '2', '60221'),
(2, 'Paletero', 1, '48177', '2', '24088'),
(3, 'Paletero (2)', 1, '96353', '2', '48177'),
(4, 'Perforador', 1, '96353', '2', '48177'),
(5, 'Perforador + Ayudante1 + Ayudante2', 1, '192706', '2', '96353'),
(6, 'Personal requerido para el dise?o y fabricaci«n de estructura metãlica.', 1, '722649', '2', '361325'),
(7, 'Rastrillero', 1, '72265', '1', '72265'),
(8, 'Rastrilleros (2)', 1, '144530', '1', '144530'),
(9, 'Soldador', 1, '96353', '1', '96353'),
(10, 'Soldador (2)', 1, '192706', '1', '192706'),
(11, 'Soldador 1A', 1, '120442', '1', '120442'),
(12, 'Soldador experto en montaje y pruebas', 1, '144530', '1', '144530'),
(13, 'Soldador experto en montaje y pruebas', 1, '144530', '1', '144530'),
(14, 'Top«grafo', 1, '144530', '1', '144530'),
(15, 'Obrero ', 1, '48177', '1', '48177'),
(16, 'Viãticos ingeniero y director', 1, '481766', '1', '481766'),
(17, 'Viãticos soldadores', 1, '240883', '1', '240883'),
(18, 'Celador', 1, '48177', '1', '48177');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mano_obra_has_apu`
--

DROP TABLE IF EXISTS `mano_obra_has_apu`;
CREATE TABLE IF NOT EXISTS `mano_obra_has_apu` (
  `apu_s_idapu_s` int(11) NOT NULL,
  `mano_obra_idmano_obra` int(11) NOT NULL,
  KEY `fk_mano_obra_has_apu_apu_s1_idx` (`apu_s_idapu_s`),
  KEY `fk_mano_obra_has_apu_mano_obra1_idx` (`mano_obra_idmano_obra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mano_obra_has_apu`
--

INSERT INTO `mano_obra_has_apu` (`apu_s_idapu_s`, `mano_obra_idmano_obra`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

DROP TABLE IF EXISTS `marcas`;
CREATE TABLE IF NOT EXISTS `marcas` (
  `idmarcas` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idmarcas`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`idmarcas`, `descripcion`) VALUES
(1, 'Kalley'),
(2, 'caterpillar'),
(3, 'viniltex'),
(4, 'Sin Referencia'),
(5, 'goltex'),
(6, 'Stanley'),
(7, 'Yale'),
(8, 'bosch'),
(9, 'makita'),
(10, 'hitachi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiales`
--

DROP TABLE IF EXISTS `materiales`;
CREATE TABLE IF NOT EXISTS `materiales` (
  `idmateriales` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(150) DEFAULT NULL,
  `unidades_fk` int(11) NOT NULL,
  `cantidad` decimal(45,0) DEFAULT NULL,
  `precio_unitario` decimal(45,0) DEFAULT NULL,
  `valor_unitario` decimal(45,0) DEFAULT NULL,
  PRIMARY KEY (`idmateriales`),
  KEY `fk_materiales_unidades1_idx` (`unidades_fk`)
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `materiales`
--

INSERT INTO `materiales` (`idmateriales`, `descripcion`, `unidades_fk`, `cantidad`, `precio_unitario`, `valor_unitario`) VALUES
(2, 'Acero A-37', 1, '3', '4084', '12252'),
(3, 'Acero A-40', 1, '3', '3123', '9369'),
(4, 'Acero PDR-60', 1, '3', '3203', '9609'),
(5, 'Acero suministrado y figurado PDR 60', 1, '3', '2151', '6454'),
(6, 'Aditivo Acelerante de Fraguado', 1, '3', '11800', '35400'),
(7, 'Aditivo curador', 1, '3', '5129', '15386'),
(8, 'Adoquðn color 10X20X6', 1, '3', '1412', '4236'),
(9, 'Adoquðn e=8cm', 1, '3', '1506', '4518'),
(10, 'Adoquðn grama 10X20X6', 1, '3', '1317', '3951'),
(11, 'Adoquðn Gris E=10 Cm', 1, '3', '1506', '4518');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiales_has_apu`
--

DROP TABLE IF EXISTS `materiales_has_apu`;
CREATE TABLE IF NOT EXISTS `materiales_has_apu` (
  `apu_s_idapu_s` int(11) NOT NULL,
  `materiales_idmateriales` int(11) NOT NULL,
  KEY `fk_materiales_has_apu_apu_s1_idx` (`apu_s_idapu_s`),
  KEY `fk_materiales_has_apu_materiales1_idx` (`materiales_idmateriales`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `materiales_has_apu`
--

INSERT INTO `materiales_has_apu` (`apu_s_idapu_s`, `materiales_idmateriales`) VALUES
(1, 2),
(2, 3),
(2, 3),
(1, 4),
(2, 3),
(2, 3),
(2, 4),
(2, 4),
(2, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccion_cotizacion`
--

DROP TABLE IF EXISTS `transaccion_cotizacion`;
CREATE TABLE IF NOT EXISTS `transaccion_cotizacion` (
  `idtransaccion_cotizacion` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(150) DEFAULT NULL,
  `numero_cel` int(11) DEFAULT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `departamento` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `valor_parcial` int(11) NOT NULL,
  `a_i_u` decimal(45,0) DEFAULT NULL,
  `valor_total` int(11) NOT NULL,
  PRIMARY KEY (`idtransaccion_cotizacion`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `transaccion_cotizacion`
--

INSERT INTO `transaccion_cotizacion` (`idtransaccion_cotizacion`, `nombre_cliente`, `numero_cel`, `ciudad`, `departamento`, `fecha`, `valor_parcial`, `a_i_u`, `valor_total`) VALUES
(1, 'pedro martinez', 34211234, 'bogota', 'cundinamarca', '2019-05-14', 45677853, '345677', 87654322),
(2, 'juan rios', 320904996, 'cali', 'valle', '2019-05-08', 43890, '23453', 78654);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccion_inventario`
--

DROP TABLE IF EXISTS `transaccion_inventario`;
CREATE TABLE IF NOT EXISTS `transaccion_inventario` (
  `idtransaccion_inventario` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `usuario_idusuario` int(11) NOT NULL,
  PRIMARY KEY (`idtransaccion_inventario`),
  KEY `fk_transaccion_inventario_usuario1_idx` (`usuario_idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `transaccion_inventario`
--

INSERT INTO `transaccion_inventario` (`idtransaccion_inventario`, `cantidad`, `fecha`, `usuario_idusuario`) VALUES
(1, 0, '2019-04-09', 1),
(2, 0, '2019-04-09', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transporte`
--

DROP TABLE IF EXISTS `transporte`;
CREATE TABLE IF NOT EXISTS `transporte` (
  `idtransporte` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(90) DEFAULT NULL,
  `unidades_idunidades` int(11) NOT NULL,
  `distancia` decimal(45,0) DEFAULT NULL,
  `tarifa` decimal(45,0) DEFAULT NULL,
  `valor_unitario` decimal(45,0) DEFAULT NULL,
  PRIMARY KEY (`idtransporte`),
  KEY `fk_transporte_unidades1_idx` (`unidades_idunidades`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `transporte`
--

INSERT INTO `transporte` (`idtransporte`, `descripcion`, `unidades_idunidades`, `distancia`, `tarifa`, `valor_unitario`) VALUES
(1, 'camion', 5, '50', '200000', '2500'),
(2, 'vehículo pesado doble troque', 5, '43', '120000', '32000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transporte_has_apu`
--

DROP TABLE IF EXISTS `transporte_has_apu`;
CREATE TABLE IF NOT EXISTS `transporte_has_apu` (
  `apu_s_idapu_s` int(11) NOT NULL,
  `transporte_idtransporte` int(11) NOT NULL,
  KEY `fk_transporte_has_apu_apu_s1_idx` (`apu_s_idapu_s`),
  KEY `fk_transporte_has_apu_transporte1_idx` (`transporte_idtransporte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `transporte_has_apu`
--

INSERT INTO `transporte_has_apu` (`apu_s_idapu_s`, `transporte_idtransporte`) VALUES
(2, 1),
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidades`
--

DROP TABLE IF EXISTS `unidades`;
CREATE TABLE IF NOT EXISTS `unidades` (
  `idunidades` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idunidades`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `unidades`
--

INSERT INTO `unidades` (`idunidades`, `descripcion`) VALUES
(1, 'cm'),
(2, 'und'),
(3, 'cm2'),
(4, 'cm3'),
(5, 'mts');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `numero_ide` int(11) DEFAULT NULL,
  `correo_electronico` varchar(45) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `contraseña` varchar(15) DEFAULT NULL,
  `token` varchar(150) DEFAULT NULL,
  `validacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `apellido`, `numero_ide`, `correo_electronico`, `usuario`, `contraseña`, `token`, `validacion`) VALUES
(1, 'alberto', 'martinez', 1013456765, 'alberto@martinez.com', 'admin', '12345', NULL, 0);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `apu_s`
--
ALTER TABLE `apu_s`
  ADD CONSTRAINT `fk_apu_s_unidades` FOREIGN KEY (`unidades_fk`) REFERENCES `unidades` (`idunidades`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `area_has_cotizacion`
--
ALTER TABLE `area_has_cotizacion`
  ADD CONSTRAINT `fk_area_has_cotizacion_area1` FOREIGN KEY (`area_idarea`) REFERENCES `area` (`idarea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_area_has_cotizacion_transaccion_cotizacion1` FOREIGN KEY (`transaccion_fk`) REFERENCES `transaccion_cotizacion` (`idtransaccion_cotizacion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `area_has_lugar_area`
--
ALTER TABLE `area_has_lugar_area`
  ADD CONSTRAINT `fk_area_has_lugar_area_area1` FOREIGN KEY (`area_idarea`) REFERENCES `area` (`idarea`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_area_has_lugar_area_lugar_area1` FOREIGN KEY (`lugar_area_idlugar_area`) REFERENCES `lugar_area` (`idlugar_area`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
