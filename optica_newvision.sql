-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 23-07-2025 a las 09:35:16
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `optica_newvision`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `id` varchar(50) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`id`, `nombre`) VALUES
('administrador', 'Administrador'),
('asesor-optico-1', 'Asesor optico 1'),
('asesor-optico-2', 'Asesor optico 2'),
('gerente', 'Gerente'),
('oftalmologo', 'Oftalmologo'),
('optometrista', 'Optometrista');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logins`
--

CREATE TABLE `logins` (
  `id` int(11) NOT NULL,
  `sede_id` varchar(50) NOT NULL,
  `usu_cedula` varchar(20) NOT NULL,
  `token` text NOT NULL,
  `ip` varchar(15) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `logins`
--

INSERT INTO `logins` (`id`, `sede_id`, `usu_cedula`, `token`, `ip`, `created_at`, `updated_at`) VALUES
(5, 'guarenas', '25409904', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZWRlX2lkIjoiZ3VhcmVuYXMiLCJ1c2VyQ2VkdWxhIjoiMjU0MDk5MDQiLCJpYXQiOjE3NTMyNTM1NzMsImV4cCI6MTc1MzMzOTk3M30.3d-pbVT3JKUv0GQdbKA6IgzahZpeH0ZWtIG1w-IR5F4', '::1', '2025-07-23 06:52:53', '2025-07-23 06:52:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `otps`
--

CREATE TABLE `otps` (
  `id` int(11) NOT NULL,
  `usu_cedula` varchar(20) NOT NULL,
  `otp` varchar(8) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `activo` tinyint(4) NOT NULL,
  `verificado` tinyint(4) NOT NULL,
  `historial` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL,
  `pkey` varchar(70) NOT NULL,
  `sede_id` varchar(50) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `ocupacion` text NOT NULL,
  `genero` varchar(1) NOT NULL,
  `direccion` text NOT NULL,
  `redes_sociales` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`redes_sociales`)),
  `tiene_lentes` varchar(100) DEFAULT NULL,
  `fotofobia` varchar(100) DEFAULT NULL,
  `traumatismo_ocular` varchar(100) DEFAULT NULL,
  `traumatismo_ocular_descripcion` text DEFAULT NULL,
  `cirugia_ocular` varchar(100) DEFAULT NULL,
  `cirugia_ocular_descripcion` text DEFAULT NULL,
  `alergias` text DEFAULT NULL,
  `antecedentes_personales` text DEFAULT NULL,
  `antecedentes_familiares` text DEFAULT NULL,
  `patologias` text DEFAULT NULL,
  `patologia_ocular` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id`, `pkey`, `sede_id`, `cedula`, `nombre`, `fecha_nacimiento`, `telefono`, `email`, `ocupacion`, `genero`, `direccion`, `redes_sociales`, `tiene_lentes`, `fotofobia`, `traumatismo_ocular`, `traumatismo_ocular_descripcion`, `cirugia_ocular`, `cirugia_ocular_descripcion`, `alergias`, `antecedentes_personales`, `antecedentes_familiares`, `patologias`, `patologia_ocular`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'guarenas-25409904', 'guarenas', '25409904', 'Jefferson Torres', '1996-06-11', '04241738615', 'jefersonugas@gmail.com', 'Ingeniero de Sistemas', 'm', 'Guatire, Castillejo, en una casa.', '[{\"platform\":\"Facebook\",\"username\":\"maria.gonzalez\"},{\"platform\":\"Instagram\",\"username\":\"@maria.g\"}]', 'Si', NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'a|b|c', '', '2025-07-23 07:32:52', '2025-07-23 07:32:52', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` varchar(100) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`) VALUES
('admin', 'Administrador'),
('asesor-optico', 'Asesor optico'),
('gerente', 'Gerente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sedes`
--

CREATE TABLE `sedes` (
  `id` varchar(50) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `sedes`
--

INSERT INTO `sedes` (`id`, `nombre`) VALUES
('guarenas', 'Sede Guarenas'),
('guatire', 'Sede Guatire');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasas`
--

CREATE TABLE `tasas` (
  `id` varchar(20) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `simbolo` varchar(3) NOT NULL,
  `valor` double NOT NULL,
  `rastreo_bcv` tinyint(4) NOT NULL DEFAULT 0,
  `ultimo_tipo_cambio` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tasas`
--

INSERT INTO `tasas` (`id`, `nombre`, `simbolo`, `valor`, `rastreo_bcv`, `ultimo_tipo_cambio`, `created_at`, `updated_at`) VALUES
('dolar', 'Dolar', '$', 111.4186, 0, NULL, '2025-06-14 16:18:23', '2025-07-06 01:22:17'),
('euro', 'Euro', '€', 120, 1, 'Manual', '2025-06-14 16:18:23', '2025-07-06 16:30:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasas_historial`
--

CREATE TABLE `tasas_historial` (
  `id` int(11) NOT NULL,
  `tasa_id` varchar(20) NOT NULL,
  `valor_nuevo` double NOT NULL,
  `usu_cedula` varchar(20) NOT NULL,
  `tipo_cambio` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tasas_historial`
--

INSERT INTO `tasas_historial` (`id`, `tasa_id`, `valor_nuevo`, `usu_cedula`, `tipo_cambio`, `created_at`, `updated_at`) VALUES
(10, 'dolar', 108.1891, '25409904', 'manual con BCV', '2025-06-30 19:58:36', '2025-06-30 19:58:36'),
(11, 'euro', 127.1384, '25409904', 'manual con BCV', '2025-06-30 19:58:36', '2025-06-30 19:58:36'),
(12, 'dolar', 111.4186, '25409904', 'manual con BCV', '2025-07-06 01:22:17', '2025-07-06 01:22:17'),
(13, 'euro', 131.2389, '25409904', 'manual con BCV', '2025-07-06 01:22:17', '2025-07-06 01:22:17'),
(14, 'euro', 120, '25409904', 'manual', '2025-07-06 15:57:32', '2025-07-06 15:57:32'),
(15, 'euro', 120, '25409904', 'manual', '2025-07-06 15:57:47', '2025-07-06 15:57:47'),
(16, 'euro', 120, '25409904', 'manual', '2025-07-06 16:30:37', '2025-07-06 16:30:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `rol_id` varchar(100) NOT NULL,
  `cargo_id` varchar(50) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `ruta_imagen` text DEFAULT NULL,
  `avatar_url` text DEFAULT NULL,
  `activo` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `rol_id`, `cargo_id`, `cedula`, `nombre`, `password`, `correo`, `telefono`, `fecha_nacimiento`, `ruta_imagen`, `avatar_url`, `activo`, `created_at`, `updated_at`, `deleted_at`) VALUES
(4, 'admin', 'gerente', '25409904', 'Jefferson Torres', '$2b$10$7KuJRh76glMvnAPw7l.S9ebE2y6lalWWui7R3Znwyjk4pqStyPnOy', 'jeffersonjtorresu@gmail.com', '04128977574', '1996-06-11', NULL, NULL, 1, '2025-03-28 18:31:30', '2025-06-14 01:44:37', NULL),
(24, 'gerente', 'gerente', '11554570', 'Heriberto Torres', '$2b$10$7KuJRh76glMvnAPw7l.S9ebE2y6lalWWui7R3Znwyjk4pqStyPnOy', 'heriberto@gmail.com', '04128977574', '1996-06-11', NULL, NULL, 1, '2025-06-14 01:27:46', '2025-06-20 00:57:56', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `logins`
--
ALTER TABLE `logins`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `otps`
--
ALTER TABLE `otps`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pkey` (`pkey`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sedes`
--
ALTER TABLE `sedes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `tasas`
--
ALTER TABLE `tasas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tasas_historial`
--
ALTER TABLE `tasas_historial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasa_id` (`tasa_id`),
  ADD KEY `usu_cedula` (`usu_cedula`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `logins`
--
ALTER TABLE `logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `otps`
--
ALTER TABLE `otps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tasas_historial`
--
ALTER TABLE `tasas_historial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
