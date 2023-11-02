-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2023 at 04:29 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loncheras`
--

-- --------------------------------------------------------

--
-- Table structure for table `auditoria`
--

CREATE TABLE `auditoria` (
  `Id` int(11) NOT NULL,
  `descripcion` varchar(60) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `configuracion`
--

CREATE TABLE `configuracion` (
  `Id_sede` int(11) NOT NULL,
  `Idioma` varchar(10) DEFAULT NULL,
  `Pais` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dieta`
--

CREATE TABLE `dieta` (
  `Id_dieta` int(11) NOT NULL,
  `Dieta` varchar(60) DEFAULT NULL,
  `Especificaciones` varchar(60) DEFAULT NULL,
  `Fecha_entrega` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estudiante`
--

CREATE TABLE `estudiante` (
  `Nombres` varchar(20) DEFAULT NULL,
  `Apellidos` varchar(30) DEFAULT NULL,
  `Fecha_nacimiento` datetime DEFAULT NULL,
  `Edad` int(2) DEFAULT NULL,
  `N_matricula` int(20) NOT NULL,
  `Fecha_ingreso` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Id_usuario` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `Id_producto` int(11) DEFAULT NULL,
  `Nombre_producto` varchar(20) DEFAULT NULL,
  `Cantidad` int(3) DEFAULT NULL,
  `Fecha_compra` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Fecha_caducida` datetime DEFAULT NULL,
  `Tipo_p` varchar(40) DEFAULT NULL,
  `Id_sede` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reconocimiento`
--

CREATE TABLE `reconocimiento` (
  `Id_reconocimiento` int(15) NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `N_matricula` int(20) DEFAULT NULL,
  `biometria` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurante`
--

CREATE TABLE `restaurante` (
  `Id_sede` int(11) DEFAULT NULL,
  `Name_encargado` varchar(20) DEFAULT NULL,
  `N_encargado` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rol`
--

CREATE TABLE `rol` (
  `Id_rol` int(11) NOT NULL,
  `Nombre_rol` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rol`
--

INSERT INTO `rol` (`Id_rol`, `Nombre_rol`) VALUES
(1, 'SuperAdmin'),
(2, 'Administador'),
(3, 'Acudiente');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `Id_usuario` int(11) NOT NULL,
  `Usuario` varchar(20) NOT NULL,
  `Clave` int(101) NOT NULL,
  `FotoUsuario` varchar(255) DEFAULT NULL,
  `Rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`Id_usuario`, `Usuario`, `Clave`, `FotoUsuario`, `Rol`) VALUES
(1, 'Kevin', 827, 'logo-loncheras.png', 1),
(2, 'Ximena', 827, 'IMG_4734.jpg', 1),
(3, 'Juan', 827, 'WhatsApp Image 2022-11-19 at 22.47.07.jpeg', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auditoria`
--
ALTER TABLE `auditoria`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`Id_sede`);

--
-- Indexes for table `dieta`
--
ALTER TABLE `dieta`
  ADD PRIMARY KEY (`Id_dieta`);

--
-- Indexes for table `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`N_matricula`),
  ADD KEY `Id_usuario` (`Id_usuario`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD KEY `Id_sede` (`Id_sede`);

--
-- Indexes for table `reconocimiento`
--
ALTER TABLE `reconocimiento`
  ADD PRIMARY KEY (`Id_reconocimiento`),
  ADD KEY `N_matricula` (`N_matricula`);

--
-- Indexes for table `restaurante`
--
ALTER TABLE `restaurante`
  ADD PRIMARY KEY (`N_encargado`),
  ADD KEY `Id_sede` (`Id_sede`);

--
-- Indexes for table `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`Id_rol`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id_usuario`),
  ADD KEY `Rol` (`Rol`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`Id_usuario`) REFERENCES `usuario` (`Id_usuario`);

--
-- Constraints for table `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`Id_sede`) REFERENCES `configuracion` (`Id_sede`);

--
-- Constraints for table `reconocimiento`
--
ALTER TABLE `reconocimiento`
  ADD CONSTRAINT `reconocimiento_ibfk_1` FOREIGN KEY (`N_matricula`) REFERENCES `estudiante` (`N_matricula`);

--
-- Constraints for table `restaurante`
--
ALTER TABLE `restaurante`
  ADD CONSTRAINT `restaurante_ibfk_1` FOREIGN KEY (`Id_sede`) REFERENCES `configuracion` (`Id_sede`),
  ADD CONSTRAINT `restaurante_ibfk_2` FOREIGN KEY (`Id_sede`) REFERENCES `configuracion` (`Id_sede`),
  ADD CONSTRAINT `restaurante_ibfk_3` FOREIGN KEY (`Id_sede`) REFERENCES `configuracion` (`Id_sede`),
  ADD CONSTRAINT `restaurante_ibfk_4` FOREIGN KEY (`Id_sede`) REFERENCES `configuracion` (`Id_sede`);

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`Rol`) REFERENCES `rol` (`Id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
