-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.5.8-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para web1
CREATE DATABASE IF NOT EXISTS `web1` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;
USE `web1`;

-- Volcando estructura para tabla web1.cfgenerales
CREATE TABLE IF NOT EXISTS `cfgenerales` (
  `idConfiguracion` int(11) NOT NULL AUTO_INCREMENT,
  `idEmpresa` int(11) NOT NULL,
  `cgNombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `cgDescripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `cgValor` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `cgEstatus` binary(1) NOT NULL,
  PRIMARY KEY (`idConfiguracion`),
  KEY `FK__ctempresas_cfGenerales` (`idEmpresa`),
  CONSTRAINT `FK__ctempresas_cfGenerales` FOREIGN KEY (`idEmpresa`) REFERENCES `ctempresas` (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Configuraciones generales.';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla web1.ctclientes
CREATE TABLE IF NOT EXISTS `ctclientes` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `idEmpresa` int(11) NOT NULL,
  `clNombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `clTelefono` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `clMail` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `clDireccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idCliente`),
  KEY `FK_ctclientes_ctempresas` (`idEmpresa`),
  CONSTRAINT `FK_ctclientes_ctempresas` FOREIGN KEY (`idEmpresa`) REFERENCES `ctempresas` (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Catalogo de clientes.';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla web1.ctempresas
CREATE TABLE IF NOT EXISTS `ctempresas` (
  `idEmpresa` int(11) NOT NULL AUTO_INCREMENT,
  `epNombre` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `epTelefono` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `epDireccion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `epCorreo` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Catalogo de empresas.';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla web1.ctformas
CREATE TABLE IF NOT EXISTS `ctformas` (
  `idForma` int(11) NOT NULL AUTO_INCREMENT,
  `idEmpresa` int(11) NOT NULL,
  `frClave` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `frNombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `frDescripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `frEstatus` binary(1) NOT NULL,
  PRIMARY KEY (`idForma`),
  KEY `FK_ctformas_ctempresas` (`idEmpresa`),
  CONSTRAINT `FK_ctformas_ctempresas` FOREIGN KEY (`idEmpresa`) REFERENCES `ctempresas` (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Catalogo de fomras.';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla web1.ctmateriales
CREATE TABLE IF NOT EXISTS `ctmateriales` (
  `idMaterial` int(11) NOT NULL AUTO_INCREMENT,
  `idTipoMaterial` int(11) NOT NULL,
  `mtClave` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `mtNombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `mtMedida` float(10,2) NOT NULL,
  `mtPrecio` float(10,2) NOT NULL,
  `mtEstatus` binary(1) NOT NULL,
  PRIMARY KEY (`idMaterial`),
  KEY `FK_ctmateriales_cttipomaterial` (`idTipoMaterial`),
  CONSTRAINT `FK_ctmateriales_cttipomaterial` FOREIGN KEY (`idTipoMaterial`) REFERENCES `cttipomaterial` (`idTipoMaterial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Catalogo de materiales';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla web1.ctmodulos
CREATE TABLE IF NOT EXISTS `ctmodulos` (
  `idModulo` int(11) NOT NULL AUTO_INCREMENT,
  `mdNombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `mdDescripcion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idModulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Catalogo de modulos.';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla web1.cttipomaterial
CREATE TABLE IF NOT EXISTS `cttipomaterial` (
  `idTipoMaterial` int(11) NOT NULL AUTO_INCREMENT,
  `idEmpresa` int(11) NOT NULL,
  `tmNombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `tmDescripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idTipoMaterial`),
  KEY `FK_cttipomaterial_ctempresas` (`idEmpresa`),
  CONSTRAINT `FK_cttipomaterial_ctempresas` FOREIGN KEY (`idEmpresa`) REFERENCES `ctempresas` (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Catalogo de tipos de material.';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla web1.ctusuarios
CREATE TABLE IF NOT EXISTS `ctusuarios` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `idEmpresa` int(11) NOT NULL,
  `usNombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `usApellido` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `usMail` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `usPassword` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `FK_ctusuarios_ctempresas` (`idEmpresa`),
  CONSTRAINT `FK_ctusuarios_ctempresas` FOREIGN KEY (`idEmpresa`) REFERENCES `ctempresas` (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Catalogo de usuarios.';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla web1.rgcotizacionglobal
CREATE TABLE IF NOT EXISTS `rgcotizacionglobal` (
  `idCG` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `cgFecha` date NOT NULL,
  `cgTotal` float(10,2) NOT NULL,
  PRIMARY KEY (`idCG`),
  KEY `FK_rgcotizacionglobal_ctclientes` (`idCliente`),
  KEY `FK_rgcotizacionglobal_ctusuarios` (`idUsuario`),
  CONSTRAINT `FK_rgcotizacionglobal_ctclientes` FOREIGN KEY (`idCliente`) REFERENCES `ctclientes` (`idCliente`),
  CONSTRAINT `FK_rgcotizacionglobal_ctusuarios` FOREIGN KEY (`idUsuario`) REFERENCES `ctusuarios` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Registro de cotizaciones globales.';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla web1.rgcotizacionunitaria
CREATE TABLE IF NOT EXISTS `rgcotizacionunitaria` (
  `idCU` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idForma` int(11) NOT NULL,
  `cuFecha` date NOT NULL,
  `cuTotal` float(10,2) NOT NULL,
  PRIMARY KEY (`idCU`),
  KEY `FK_rgcotizacionunitaria_ctclientes` (`idCliente`),
  KEY `FK_rgcotizacionunitaria_ctusuarios` (`idUsuario`),
  KEY `FK_rgcotizacionunitaria_ctformas` (`idForma`),
  CONSTRAINT `FK_rgcotizacionunitaria_ctclientes` FOREIGN KEY (`idCliente`) REFERENCES `ctclientes` (`idCliente`),
  CONSTRAINT `FK_rgcotizacionunitaria_ctformas` FOREIGN KEY (`idForma`) REFERENCES `ctformas` (`idForma`),
  CONSTRAINT `FK_rgcotizacionunitaria_ctusuarios` FOREIGN KEY (`idUsuario`) REFERENCES `ctusuarios` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Registro de documento de cotizacion unitaria.';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla web1.rgdetallecotizacionglobal
CREATE TABLE IF NOT EXISTS `rgdetallecotizacionglobal` (
  `idDCG` int(11) NOT NULL AUTO_INCREMENT,
  `idCG` int(11) NOT NULL,
  `idCU` int(11) NOT NULL,
  `dcgPrecioUnitario` float(10,2) NOT NULL,
  `dcgTotal` float(10,2) NOT NULL,
  PRIMARY KEY (`idDCG`),
  KEY `FK_rgdetallecotizacionglobal_rgcotizacionglobal` (`idCG`),
  KEY `FK_rgdetallecotizacionglobal_rgcotizacionunitaria` (`idCU`),
  CONSTRAINT `FK_rgdetallecotizacionglobal_rgcotizacionglobal` FOREIGN KEY (`idCG`) REFERENCES `rgcotizacionglobal` (`idCG`),
  CONSTRAINT `FK_rgdetallecotizacionglobal_rgcotizacionunitaria` FOREIGN KEY (`idCU`) REFERENCES `rgcotizacionunitaria` (`idCU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Registro de detalle de cotizaciones globales.';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla web1.rgdetallecotizacionunitaria
CREATE TABLE IF NOT EXISTS `rgdetallecotizacionunitaria` (
  `idDCU` int(11) NOT NULL AUTO_INCREMENT,
  `idCU` int(11) NOT NULL,
  `idMaterial` int(11) NOT NULL,
  `dcuCantidad` int(11) NOT NULL,
  `dcuPrecioUnitario` float(10,2) NOT NULL,
  `dcuTotal` float(10,2) NOT NULL,
  PRIMARY KEY (`idDCU`),
  KEY `FK_rgdetallecotizacionunitaria_ctmateriales` (`idMaterial`),
  KEY `FK_rgdetallecotizacionunitaria_rgcotizacionunitaria` (`idCU`),
  CONSTRAINT `FK_rgdetallecotizacionunitaria_ctmateriales` FOREIGN KEY (`idMaterial`) REFERENCES `ctmateriales` (`idMaterial`),
  CONSTRAINT `FK_rgdetallecotizacionunitaria_rgcotizacionunitaria` FOREIGN KEY (`idCU`) REFERENCES `rgcotizacionunitaria` (`idCU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Registro del detalle de las cotizaciones unitairas.';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla web1.rgformasmateriales
CREATE TABLE IF NOT EXISTS `rgformasmateriales` (
  `idFormaMateriales` int(11) NOT NULL AUTO_INCREMENT,
  `idForma` int(11) NOT NULL,
  `idTipoMaterial` int(11) NOT NULL,
  PRIMARY KEY (`idFormaMateriales`),
  KEY `FK__ctformas_RGFM` (`idForma`),
  KEY `FK__cttipomaterial_RGFM` (`idTipoMaterial`),
  CONSTRAINT `FK__ctformas_RGFM` FOREIGN KEY (`idForma`) REFERENCES `ctformas` (`idForma`),
  CONSTRAINT `FK__cttipomaterial_RGFM` FOREIGN KEY (`idTipoMaterial`) REFERENCES `cttipomaterial` (`idTipoMaterial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Registro de materiales para formas.';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla web1.rglicencias
CREATE TABLE IF NOT EXISTS `rglicencias` (
  `idLicencia` int(11) NOT NULL AUTO_INCREMENT,
  `idEmpresa` int(11) NOT NULL,
  `lcClave` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `lcEstatus` binary(1) NOT NULL,
  `lcFechaInicio` date NOT NULL,
  `lcFechaFin` date NOT NULL,
  PRIMARY KEY (`idLicencia`),
  KEY `FK__ctempresas` (`idEmpresa`),
  CONSTRAINT `FK__ctempresas` FOREIGN KEY (`idEmpresa`) REFERENCES `ctempresas` (`idEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Registro de licencias.';

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla web1.rglicenciasmodulos
CREATE TABLE IF NOT EXISTS `rglicenciasmodulos` (
  `idLicenciasModulos` int(11) NOT NULL AUTO_INCREMENT,
  `idLicencia` int(11) NOT NULL,
  `idModulo` int(11) NOT NULL,
  PRIMARY KEY (`idLicenciasModulos`),
  KEY `FK__rglicencias` (`idLicencia`),
  KEY `FK__ctmodulos` (`idModulo`),
  CONSTRAINT `FK__ctmodulos` FOREIGN KEY (`idModulo`) REFERENCES `ctmodulos` (`idModulo`),
  CONSTRAINT `FK__rglicencias` FOREIGN KEY (`idLicencia`) REFERENCES `rglicencias` (`idLicencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Registro de licencias y modulos que corresponden a las mismas.';

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
