-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-11-2023 a las 22:13:42
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `loncheras`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria`
--

CREATE TABLE `auditoria` (
  `Id` int(11) NOT NULL,
  `Descripcion` varchar(60) DEFAULT NULL,
  `Fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `Id_sede` int(11) DEFAULT NULL,
  `Idioma` varchar(10) DEFAULT NULL,
  `Pais` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dieta`
--

CREATE TABLE `dieta` (
  `Id_dieta` int(11) NOT NULL,
  `Dieta` varchar(255) DEFAULT NULL,
  `Especificaciones` varchar(60) DEFAULT NULL,
  `Fecha_entrega` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `Nombres` varchar(20) NOT NULL,
  `Apellidos` varchar(30) DEFAULT NULL,
  `Fecha_nacimiento` datetime DEFAULT NULL,
  `Edad` int(11) DEFAULT NULL,
  `Estado` tinyint(1) DEFAULT NULL,
  `F_ingreso` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FotoEstudiante` varchar(255) NOT NULL,
  `Id_usuario` int(11) NOT NULL,
  `Id_dieta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`Nombres`, `Apellidos`, `Fecha_nacimiento`, `Edad`, `Estado`, `F_ingreso`, `FotoEstudiante`, `Id_usuario`, `Id_dieta`) VALUES
('Samuel', 'Osorio', '2023-11-01 00:00:00', 20, NULL, '2023-11-02 20:26:56', 'Michi.jpg', 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idenestu`
--

CREATE TABLE `idenestu` (
  `N_identidad` int(11) DEFAULT NULL,
  `Nombres` varchar(20) DEFAULT NULL,
  `N_matricula` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `idenreco`
--

CREATE TABLE `idenreco` (
  `N_identidad` int(11) DEFAULT NULL,
  `Id_reconocimiento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `identificacion`
--

CREATE TABLE `identificacion` (
  `N_identidad` int(11) NOT NULL,
  `T_identidad` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prodieta`
--

CREATE TABLE `prodieta` (
  `Id_dieta` int(11) DEFAULT NULL,
  `Id_producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `Id_producto` int(11) NOT NULL,
  `Nombre_producto` varchar(20) DEFAULT NULL,
  `Cantidad_p` int(3) DEFAULT NULL,
  `Fecha_compra` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Fecha_caducida` datetime DEFAULT NULL,
  `Tipo_p` varchar(40) DEFAULT NULL,
  `Id_sede` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reconocimiento`
--

CREATE TABLE `reconocimiento` (
  `Id_reconocimiento` int(11) NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `N_identidad` int(11) DEFAULT NULL,
  `Biometria` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurante`
--

CREATE TABLE `restaurante` (
  `Id_sede` int(11) NOT NULL,
  `Nombre_encargado` varchar(30) DEFAULT NULL,
  `N_encargado` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `Id_rol` int(11) NOT NULL,
  `Nombre_rol` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`Id_rol`, `Nombre_rol`) VALUES
(1, 'SuperAdmin'),
(2, 'Admin'),
(3, 'Acudiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Id_usuario` int(11) NOT NULL,
  `Usuario` varchar(20) DEFAULT NULL,
  `Clave` int(101) DEFAULT NULL,
  `FotoUsuario` varchar(255) DEFAULT NULL,
  `Rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Id_usuario`, `Usuario`, `Clave`, `FotoUsuario`, `Rol`) VALUES
(2, 'Kevin', 827, 'IMG_4734.jpg', 1),
(4, 'Edilfredo', 827, 'calvo.jpg', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD PRIMARY KEY (`Id`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD KEY `Id_sede` (`Id_sede`);

--
-- Indices de la tabla `dieta`
--
ALTER TABLE `dieta`
  ADD PRIMARY KEY (`Id_dieta`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`Nombres`),
  ADD KEY `Id_usuario` (`Id_usuario`),
  ADD KEY `Id_dieta` (`Id_dieta`);

--
-- Indices de la tabla `idenestu`
--
ALTER TABLE `idenestu`
  ADD KEY `N_identidad` (`N_identidad`),
  ADD KEY `Nombres` (`Nombres`);

--
-- Indices de la tabla `idenreco`
--
ALTER TABLE `idenreco`
  ADD KEY `N_identidad` (`N_identidad`),
  ADD KEY `Id_reconocimiento` (`Id_reconocimiento`);

--
-- Indices de la tabla `identificacion`
--
ALTER TABLE `identificacion`
  ADD PRIMARY KEY (`N_identidad`);

--
-- Indices de la tabla `prodieta`
--
ALTER TABLE `prodieta`
  ADD KEY `Id_producto` (`Id_producto`),
  ADD KEY `Id_dieta` (`Id_dieta`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Id_producto`),
  ADD KEY `Id_sede` (`Id_sede`);

--
-- Indices de la tabla `reconocimiento`
--
ALTER TABLE `reconocimiento`
  ADD PRIMARY KEY (`Id_reconocimiento`);

--
-- Indices de la tabla `restaurante`
--
ALTER TABLE `restaurante`
  ADD PRIMARY KEY (`Id_sede`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`Id_rol`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id_usuario`),
  ADD KEY `Id_rol` (`Rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `Id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD CONSTRAINT `configuracion_ibfk_1` FOREIGN KEY (`Id_sede`) REFERENCES `restaurante` (`Id_sede`);

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`Id_usuario`) REFERENCES `usuario` (`Id_usuario`),
  ADD CONSTRAINT `estudiante_ibfk_2` FOREIGN KEY (`Id_dieta`) REFERENCES `dieta` (`Id_dieta`);

--
-- Filtros para la tabla `idenestu`
--
ALTER TABLE `idenestu`
  ADD CONSTRAINT `idenestu_ibfk_1` FOREIGN KEY (`N_identidad`) REFERENCES `identificacion` (`N_identidad`),
  ADD CONSTRAINT `idenestu_ibfk_2` FOREIGN KEY (`Nombres`) REFERENCES `estudiante` (`Nombres`);

--
-- Filtros para la tabla `idenreco`
--
ALTER TABLE `idenreco`
  ADD CONSTRAINT `idenreco_ibfk_1` FOREIGN KEY (`N_identidad`) REFERENCES `identificacion` (`N_identidad`),
  ADD CONSTRAINT `idenreco_ibfk_2` FOREIGN KEY (`Id_reconocimiento`) REFERENCES `reconocimiento` (`Id_reconocimiento`);

--
-- Filtros para la tabla `prodieta`
--
ALTER TABLE `prodieta`
  ADD CONSTRAINT `prodieta_ibfk_1` FOREIGN KEY (`Id_producto`) REFERENCES `producto` (`Id_producto`),
  ADD CONSTRAINT `prodieta_ibfk_2` FOREIGN KEY (`Id_dieta`) REFERENCES `dieta` (`Id_dieta`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`Id_sede`) REFERENCES `restaurante` (`Id_sede`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`Rol`) REFERENCES `rol` (`Id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
