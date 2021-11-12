-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-11-2021 a las 23:05:23
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tarzam`
--

CREATE DATABASE tarzam;
USE tarzam;

-- --------------------------------------------------------


--
-- Estructura de tabla para la tabla `usuarios`
--


CREATE TABLE `usuario` (
  `id_usuario` int(5) NOT NULL COMMENT 'Id de usuario',
  `username` varchar(50) NOT NULL COMMENT 'Nombre de usuario',
  `password` varchar(100) NOT NULL COMMENT 'Contraseña'
  
  );


--
-- Estructura de tabla para la tabla `boleta`
--

CREATE TABLE `boleta` (
  `codigo_boleta` int(5) NOT NULL COMMENT 'Clave Primaria',
  `codigo_cliente` int(12) NOT NULL COMMENT 'Clave foranea',
  `nroboleta_boleta` varchar(5) COLLATE utf8_spanish2_ci NOT NULL,
  `datealquiler_boleta` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `codigo_cliente` int(12) NOT NULL COMMENT 'Clave primaria',
  `nombre_cliente` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `primerapellido_cliente` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `segundoapellido_cliente` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `nombrecompleto` varchar(150) COLLATE utf8_spanish2_ci NOT NULL,
  `numdocumento_cliente` int(11) NOT NULL,
  `direccion_cliente` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono_cliente` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `celular_cliente` varchar(13) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_boleta`
--

CREATE TABLE `detalle_boleta` (
  `codigo_detalleboleta` int(5) NOT NULL COMMENT 'Clave Primaria',
  `codigo_pelicula` int(5) NOT NULL COMMENT 'Clave foranea',
  `precioalquilado_detalleboleta` int(11) NOT NULL,
  `devuelto_detalleboleta` tinyint(1) NOT NULL,
  `datedevuelto_detalleboleta` datetime NOT NULL,
  `diasmora_detalleboleta` int(11) NOT NULL COMMENT 'Dias de retraso de la entrega'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pelicula`
--

CREATE TABLE `pelicula` (
  `codigo_pelicula` int(5) NOT NULL COMMENT 'Clave primaria',
  `titulo_pelicula` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `tipo_pelicula` varchar(15) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Selección: Comedia, Accion, Terror, etc.',
  `categoria_pelicula` varchar(10) COLLATE utf8_spanish2_ci NOT NULL COMMENT 'Selección: Estreno, normal, clasico',
  `actorprincipal_pelicula` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `precioactual_pelicula` int(11) NOT NULL,
  `stock_pelicula` int(11) NOT NULL,
  `saldo_pelicula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indices de la tabla `boleta`
--
ALTER TABLE `boleta`
  ADD PRIMARY KEY (`codigo_boleta`),
  ADD KEY `FOREING` (`codigo_cliente`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codigo_cliente`);

--
-- Indices de la tabla `detalle_boleta`
--
ALTER TABLE `detalle_boleta`
  ADD PRIMARY KEY (`codigo_detalleboleta`),
  ADD KEY `FOREING PELICULA` (`codigo_pelicula`);

--
-- Indices de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  ADD PRIMARY KEY (`codigo_pelicula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `boleta`
--
ALTER TABLE `boleta`
  MODIFY `codigo_boleta` int(5) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria';

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codigo_cliente` int(12) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria';

--
-- AUTO_INCREMENT de la tabla `detalle_boleta`
--
ALTER TABLE `detalle_boleta`
  MODIFY `codigo_detalleboleta` int(5) NOT NULL AUTO_INCREMENT COMMENT 'Clave Primaria';

--
-- AUTO_INCREMENT de la tabla `pelicula`
--
ALTER TABLE `pelicula`
  MODIFY `codigo_pelicula` int(5) NOT NULL AUTO_INCREMENT COMMENT 'Clave primaria';

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `boleta`
--
ALTER TABLE `boleta`
  ADD CONSTRAINT `boleta_ibfk_1` FOREIGN KEY (`codigo_cliente`) REFERENCES `cliente` (`codigo_cliente`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
