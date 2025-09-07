-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 07-09-2025 a las 03:07:49
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
-- Estructura de tabla para la tabla `historiales_medicos`
--

CREATE TABLE `historiales_medicos` (
  `id` int(11) NOT NULL,
  `numero` varchar(14) NOT NULL,
  `fecha` date NOT NULL,
  `paciente_id` varchar(70) NOT NULL,
  `motivo_consulta` text DEFAULT NULL,
  `otro_motivo_consulta` text DEFAULT NULL,
  `tipo_cristal_actual` text DEFAULT NULL,
  `ultima_graduacion` date DEFAULT NULL,
  `medico` varchar(255) DEFAULT NULL,
  `examen_ocular_lensometria` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`examen_ocular_lensometria`)),
  `examen_ocular_refraccion` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`examen_ocular_refraccion`)),
  `examen_ocular_refraccion_final` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`examen_ocular_refraccion_final`)),
  `examen_ocular_avsc_avae_otros` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`examen_ocular_avsc_avae_otros`)),
  `diagnostico` text DEFAULT NULL,
  `tratamiento` text DEFAULT NULL,
  `recomendaciones` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`recomendaciones`)),
  `conformidad_nota` text DEFAULT NULL,
  `conformidad_firma_paciente` varchar(100) DEFAULT NULL,
  `conformidad_firma_medico` varchar(100) DEFAULT NULL,
  `created_by` varchar(20) NOT NULL,
  `updated_by` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historiales_medicos`
--

INSERT INTO `historiales_medicos` (`id`, `numero`, `fecha`, `paciente_id`, `motivo_consulta`, `otro_motivo_consulta`, `tipo_cristal_actual`, `ultima_graduacion`, `medico`, `examen_ocular_lensometria`, `examen_ocular_refraccion`, `examen_ocular_refraccion_final`, `examen_ocular_avsc_avae_otros`, `diagnostico`, `tratamiento`, `recomendaciones`, `conformidad_nota`, `conformidad_firma_paciente`, `conformidad_firma_medico`, `created_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(26, 'H-20250812-001', '2025-08-12', 'aab3238922bcc25a6f606eb525ffdc56', 'Molestia ocular', '', 'Progresivo digital amplio', '2025-06-26', '10092901', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"av_lejos_od\":\"\",\"av_cerca_od\":\"\",\"av_lejos_bi\":\"\",\"av_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"av_lejos_oi\":\"\",\"av_cerca_oi\":\"\",\"av_cerca_bi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"avccl_od\":\"\",\"avccc_od\":\"\",\"avccl_bi\":\"\",\"avccc_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"avccl_oi\":\"\",\"avccc_oi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"alt_od\":\"\",\"dp_od\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"alt_oi\":\"\",\"dp_oi\":\"\"}', '{\"avsc_od\":\"\",\"avae_od\":\"\",\"otros_od\":\"\",\"avsc_oi\":\"\",\"avae_oi\":\"\",\"otros_oi\":\"\"}', '', '', '[{\"cristal\":{\"label\":\"Visión sencilla digital\",\"value\":\"Visión sencilla digital\"},\"material\":[\"AR_VERDE\"],\"montura\":\"\",\"cristalSugerido\":\"\",\"observaciones\":\"\"}]', 'PACIENTE CONFORME CON LA EXPLICACION  REALIZADA POR EL ASESOR SOBRE LAS VENTAJAS Y DESVENTAJAS DE LOS DIFERENTES TIPOS DE CRISTALES Y MATERIAL DE MONTURA, NO SE ACEPTARAN MODIFICACIONES LUEGO DE HABER RECIBIDO LA INFORMACION Y FIRMADA LA HISTORIA POR EL PACIENTE.', NULL, NULL, '24367965', '24367965', '2025-08-12 02:15:11', '2025-08-12 13:47:02', NULL),
(27, 'H-20250812-002', '2025-08-12', 'aab3238922bcc25a6f606eb525ffdc56', 'Consulta rutinaria|Fatiga visual', '', 'Visión sencilla digital', '2025-08-07', '8759927', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"av_lejos_od\":\"\",\"av_cerca_od\":\"\",\"av_lejos_bi\":\"\",\"av_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"av_lejos_oi\":\"\",\"av_cerca_oi\":\"\",\"av_cerca_bi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"avccl_od\":\"\",\"avccc_od\":\"\",\"avccl_bi\":\"\",\"avccc_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"avccl_oi\":\"\",\"avccc_oi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"alt_od\":\"\",\"dp_od\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"alt_oi\":\"\",\"dp_oi\":\"\"}', '{\"avsc_od\":\"\",\"avae_od\":\"\",\"otros_od\":\"\",\"avsc_oi\":\"\",\"avae_oi\":\"\",\"otros_oi\":\"\"}', '', '', '[{\"cristal\":{\"label\":\"Visión sencilla digital\",\"value\":\"Visión sencilla digital\"},\"material\":[\"AR_BLUE_BLOCK\"],\"montura\":\"\",\"cristalSugerido\":\"\",\"observaciones\":\"\"}]', 'PACIENTE CONFORME CON LA EXPLICACION  REALIZADA POR EL ASESOR SOBRE LAS VENTAJAS Y DESVENTAJAS DE LOS DIFERENTES TIPOS DE CRISTALES Y MATERIAL DE MONTURA, NO SE ACEPTARAN MODIFICACIONES LUEGO DE HABER RECIBIDO LA INFORMACION Y FIRMADA LA HISTORIA POR EL PACIENTE.', NULL, NULL, '24367965', '24367965', '2025-08-12 02:24:40', '2025-08-12 15:00:04', NULL),
(28, 'H-20250812-003', '2025-08-12', 'c9f0f895fb98ab9159f51fd0297e236d', 'Fatiga visual|Consulta rutinaria|Molestia ocular', '', 'Bifocal', '2025-05-29', '10092901', '{\"esf_od\":{\"value\":\"+0.25\",\"label\":\"+0.25\"},\"cil_od\":\"+0.50\",\"eje_od\":90,\"add_od\":\"+0.75\",\"av_lejos_od\":\"20/30\",\"av_cerca_od\":\"J2\",\"av_lejos_bi\":\"20/30\",\"av_bi\":\"20/30\",\"esf_oi\":\"+0.50\",\"cil_oi\":\"+0.50\",\"eje_oi\":90,\"add_oi\":\"+1.00\",\"av_lejos_oi\":\"20/30\",\"av_cerca_oi\":\"J3\",\"av_cerca_bi\":\"\"}', '{\"esf_od\":\"+0.25\",\"cil_od\":\"+0.50\",\"eje_od\":90,\"add_od\":\"+1.00\",\"avccl_od\":\"20/30\",\"avccc_od\":\"J2\",\"avccl_bi\":\"20/25\",\"avccc_bi\":\"20/25\",\"esf_oi\":\"+0.25\",\"cil_oi\":\"+0.25\",\"eje_oi\":90,\"add_oi\":\"+0.75\",\"avccl_oi\":\"20/25\",\"avccc_oi\":\"J2\"}', '{\"esf_od\":\"+0.50\",\"cil_od\":\"+0.25\",\"eje_od\":2,\"add_od\":\"+0.75\",\"alt_od\":\"10\",\"dp_od\":\"22\",\"esf_oi\":\"+0.25\",\"cil_oi\":\"+0.50\",\"eje_oi\":90,\"add_oi\":\"+0.75\",\"alt_oi\":\"10\",\"dp_oi\":\"22\"}', '{\"avsc_od\":\"20/20\",\"avae_od\":\"J2\",\"otros_od\":\"12\",\"avsc_oi\":\"20/20\",\"avae_oi\":\"J2\",\"otros_oi\":\"21\"}', 'Diagnostico de prueba', 'Tratamiento de prueba', '[{\"cristal\":{\"label\":\"Visión sencilla digital\",\"value\":\"Visión sencilla digital\"},\"material\":[\"AR_BLUE_BLOCK\"],\"montura\":\"Plastico\",\"cristalSugerido\":\"\",\"observaciones\":\"Observaciones de prueba\"},{\"cristal\":{\"label\":\"Bifocal\",\"value\":\"Bifocal\"},\"material\":[\"CR39\"],\"montura\":\"Metalica\",\"cristalSugerido\":\"\",\"observaciones\":\"Observaciones de prueba\"}]', 'PACIENTE CONFORME CON LA EXPLICACION  REALIZADA POR EL ASESOR SOBRE LAS VENTAJAS Y DESVENTAJAS DE LOS DIFERENTES TIPOS DE CRISTALES Y MATERIAL DE MONTURA, NO SE ACEPTARAN MODIFICACIONES LUEGO DE HABER RECIBIDO LA INFORMACION Y FIRMADA LA HISTORIA POR EL PACIENTE.', NULL, NULL, '24367965', '24367965', '2025-08-12 17:58:55', '2025-08-13 14:20:01', NULL),
(29, 'H-20250812-004', '2025-08-12', 'd3d9446802a44259755d38e6d163e820', 'Fatiga visual', '', 'Visión sencilla digital', '2025-08-05', '10092901', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"av_lejos_od\":\"\",\"av_cerca_od\":\"\",\"av_lejos_bi\":\"\",\"av_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"av_lejos_oi\":\"\",\"av_cerca_oi\":\"\",\"av_cerca_bi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"avccl_od\":\"\",\"avccc_od\":\"\",\"avccl_bi\":\"\",\"avccc_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"avccl_oi\":\"\",\"avccc_oi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"alt_od\":\"\",\"dp_od\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"alt_oi\":\"\",\"dp_oi\":\"\"}', '{\"avsc_od\":\"\",\"avae_od\":\"\",\"otros_od\":\"\",\"avsc_oi\":\"\",\"avae_oi\":\"\",\"otros_oi\":\"\",\"avsc_bi\":\"\"}', '', '', '[{\"cristal\":{\"label\":\"Monofocal visión sencilla\",\"value\":\"Monofocal visión sencilla\"},\"material\":[\"AR_VERDE\"],\"montura\":\"\",\"cristalSugerido\":\"\",\"observaciones\":\"\"}]', 'PACIENTE CONFORME CON LA EXPLICACION  REALIZADA POR EL ASESOR SOBRE LAS VENTAJAS Y DESVENTAJAS DE LOS DIFERENTES TIPOS DE CRISTALES Y MATERIAL DE MONTURA, NO SE ACEPTARAN MODIFICACIONES LUEGO DE HABER RECIBIDO LA INFORMACION Y FIRMADA LA HISTORIA POR EL PACIENTE.', NULL, NULL, '24367965', '24367965', '2025-08-12 18:02:40', '2025-08-12 18:02:40', NULL),
(30, 'H-20250822-001', '2025-08-22', 'aab3238922bcc25a6f606eb525ffdc56', 'Molestia ocular', '', 'Monofocal visión sencilla', '2025-08-14', '8759927', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"av_lejos_od\":\"\",\"av_cerca_od\":\"\",\"av_lejos_bi\":\"\",\"av_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"av_lejos_oi\":\"\",\"av_cerca_oi\":\"\",\"av_cerca_bi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"avccl_od\":\"\",\"avccc_od\":\"\",\"avccl_bi\":\"\",\"avccc_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"avccl_oi\":\"\",\"avccc_oi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"alt_od\":\"\",\"dp_od\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"alt_oi\":\"\",\"dp_oi\":\"\"}', '{\"avsc_od\":\"\",\"avae_od\":\"\",\"otros_od\":\"\",\"avsc_oi\":\"\",\"avae_oi\":\"\",\"otros_oi\":\"\",\"avsc_bi\":\"\"}', 'ghghjg', 'gjgjgjh', '[{\"cristal\":{\"label\":\"Monofocal visión sencilla\",\"value\":\"Monofocal visión sencilla\"},\"material\":[\"CR39\"],\"montura\":\"\",\"cristalSugerido\":\"\",\"observaciones\":\"\"}]', 'PACIENTE CONFORME CON LA EXPLICACION  REALIZADA POR EL ASESOR SOBRE LAS VENTAJAS Y DESVENTAJAS DE LOS DIFERENTES TIPOS DE CRISTALES Y MATERIAL DE MONTURA, NO SE ACEPTARAN MODIFICACIONES LUEGO DE HABER RECIBIDO LA INFORMACION Y FIRMADA LA HISTORIA POR EL PACIENTE.', NULL, NULL, '24367965', '24367965', '2025-08-22 00:38:19', '2025-08-22 00:38:19', NULL),
(31, 'H-20250822-002', '2025-08-22', 'aab3238922bcc25a6f606eb525ffdc56', 'Consulta rutinaria', '', 'Visión sencilla digital', NULL, '10092901', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"av_lejos_od\":\"\",\"av_cerca_od\":\"\",\"av_lejos_bi\":\"\",\"av_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"av_lejos_oi\":\"\",\"av_cerca_oi\":\"\",\"av_cerca_bi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"avccl_od\":\"\",\"avccc_od\":\"\",\"avccl_bi\":\"\",\"avccc_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"avccl_oi\":\"\",\"avccc_oi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"alt_od\":\"\",\"dp_od\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"alt_oi\":\"\",\"dp_oi\":\"\"}', '{\"avsc_od\":\"\",\"avae_od\":\"\",\"otros_od\":\"\",\"avsc_oi\":\"\",\"avae_oi\":\"\",\"otros_oi\":\"\",\"avsc_bi\":\"\"}', '', '', '[{\"cristal\":{\"label\":\"Monofocal visión sencilla\",\"value\":\"Monofocal visión sencilla\"},\"material\":[\"AR_BLUE_BLOCK\"],\"montura\":\"\",\"cristalSugerido\":\"\",\"observaciones\":\"\"},{\"cristal\":{\"label\":\"Lentes de contacto\",\"value\":\"Lentes de contacto\"},\"material\":[\"CR39\"],\"montura\":\"\",\"cristalSugerido\":\"\",\"observaciones\":\"\"}]', 'PACIENTE CONFORME CON LA EXPLICACION  REALIZADA POR EL ASESOR SOBRE LAS VENTAJAS Y DESVENTAJAS DE LOS DIFERENTES TIPOS DE CRISTALES Y MATERIAL DE MONTURA, NO SE ACEPTARAN MODIFICACIONES LUEGO DE HABER RECIBIDO LA INFORMACION Y FIRMADA LA HISTORIA POR EL PACIENTE.', NULL, NULL, '24367965', '24367965', '2025-08-22 00:58:31', '2025-08-22 00:58:31', NULL),
(32, 'H-20250831-001', '2025-08-31', '4e732ced3463d06de0ca9a15b6153677', 'Fatiga visual', '', 'Bifocal', '2025-08-06', '8759927', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"av_lejos_od\":\"\",\"av_cerca_od\":\"\",\"av_lejos_bi\":\"\",\"av_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"av_lejos_oi\":\"\",\"av_cerca_oi\":\"\",\"av_cerca_bi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"avccl_od\":\"\",\"avccc_od\":\"\",\"avccl_bi\":\"\",\"avccc_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"avccl_oi\":\"\",\"avccc_oi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"alt_od\":\"\",\"dp_od\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"alt_oi\":\"\",\"dp_oi\":\"\"}', '{\"avsc_od\":\"\",\"avae_od\":\"\",\"otros_od\":\"\",\"avsc_oi\":\"\",\"avae_oi\":\"\",\"otros_oi\":\"\",\"avsc_bi\":\"\"}', 'sadasdasdasdad', 'asdasdasdasdada', '[{\"cristal\":{\"label\":\"Visión sencilla digital\",\"value\":\"Visión sencilla digital\"},\"material\":[\"AR_VERDE\"],\"montura\":\"\",\"cristalSugerido\":\"\",\"observaciones\":\"\"}]', 'PACIENTE CONFORME CON LA EXPLICACION  REALIZADA POR EL ASESOR SOBRE LAS VENTAJAS Y DESVENTAJAS DE LOS DIFERENTES TIPOS DE CRISTALES Y MATERIAL DE MONTURA, NO SE ACEPTARAN MODIFICACIONES LUEGO DE HABER RECIBIDO LA INFORMACION Y FIRMADA LA HISTORIA POR EL PACIENTE.', NULL, NULL, '24367965', '24367965', '2025-08-31 23:55:36', '2025-08-31 23:55:36', NULL),
(33, 'H-20250901-001', '2025-09-01', '28acbaf873ad2772e216895c44281940', 'Consulta rutinaria', '', 'Bifocal', '2025-06-04', '10092901', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"av_lejos_od\":\"\",\"av_cerca_od\":\"\",\"av_lejos_bi\":\"\",\"av_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"av_lejos_oi\":\"\",\"av_cerca_oi\":\"\",\"av_cerca_bi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"avccl_od\":\"\",\"avccc_od\":\"\",\"avccl_bi\":\"\",\"avccc_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"avccl_oi\":\"\",\"avccc_oi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"alt_od\":\"\",\"dp_od\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"alt_oi\":\"\",\"dp_oi\":\"\"}', '{\"avsc_od\":\"\",\"avae_od\":\"\",\"otros_od\":\"\",\"avsc_oi\":\"\",\"avae_oi\":\"\",\"otros_oi\":\"\",\"avsc_bi\":\"\"}', 'dfhdfgdfg', 'ddfgdgdfgd', '[{\"cristal\":{\"label\":\"Progresivo digital intermedio\",\"value\":\"Progresivo digital intermedio\"},\"material\":[\"AR_VERDE\"],\"montura\":\"\",\"cristalSugerido\":\"\",\"observaciones\":\"\"}]', 'PACIENTE CONFORME CON LA EXPLICACION  REALIZADA POR EL ASESOR SOBRE LAS VENTAJAS Y DESVENTAJAS DE LOS DIFERENTES TIPOS DE CRISTALES Y MATERIAL DE MONTURA, NO SE ACEPTARAN MODIFICACIONES LUEGO DE HABER RECIBIDO LA INFORMACION Y FIRMADA LA HISTORIA POR EL PACIENTE.', NULL, NULL, '24367965', '24367965', '2025-09-01 13:40:10', '2025-09-01 13:40:10', NULL),
(34, 'H-20250901-002', '2025-09-01', '28acbaf873ad2772e216895c44281940', 'Fatiga visual', '', 'Bifocal', NULL, '8759927', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"av_lejos_od\":\"\",\"av_cerca_od\":\"\",\"av_lejos_bi\":\"\",\"av_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"av_lejos_oi\":\"\",\"av_cerca_oi\":\"\",\"av_cerca_bi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"avccl_od\":\"\",\"avccc_od\":\"\",\"avccl_bi\":\"\",\"avccc_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"avccl_oi\":\"\",\"avccc_oi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"alt_od\":\"\",\"dp_od\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"alt_oi\":\"\",\"dp_oi\":\"\"}', '{\"avsc_od\":\"\",\"avae_od\":\"\",\"otros_od\":\"\",\"avsc_oi\":\"\",\"avae_oi\":\"\",\"otros_oi\":\"\",\"avsc_bi\":\"\"}', 'fgsdfsdfs', 'fsdfsdfsdf', '[{\"cristal\":{\"label\":\"Visión sencilla digital\",\"value\":\"Visión sencilla digital\"},\"material\":[\"AR_VERDE\"],\"montura\":\"\",\"cristalSugerido\":\"\",\"observaciones\":\"\"}]', 'PACIENTE CONFORME CON LA EXPLICACION  REALIZADA POR EL ASESOR SOBRE LAS VENTAJAS Y DESVENTAJAS DE LOS DIFERENTES TIPOS DE CRISTALES Y MATERIAL DE MONTURA, NO SE ACEPTARAN MODIFICACIONES LUEGO DE HABER RECIBIDO LA INFORMACION Y FIRMADA LA HISTORIA POR EL PACIENTE.', NULL, NULL, '24367965', '24367965', '2025-09-01 14:13:51', '2025-09-01 14:13:51', NULL),
(35, 'H-20250901-003', '2025-09-01', '02e74f10e0327ad868d138f2b4fdd6f0', 'Consulta rutinaria', '', 'Bifocal', NULL, '8759927', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"av_lejos_od\":\"\",\"av_cerca_od\":\"\",\"av_lejos_bi\":\"\",\"av_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"av_lejos_oi\":\"\",\"av_cerca_oi\":\"\",\"av_cerca_bi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"avccl_od\":\"\",\"avccc_od\":\"\",\"avccl_bi\":\"\",\"avccc_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"avccl_oi\":\"\",\"avccc_oi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"alt_od\":\"\",\"dp_od\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"alt_oi\":\"\",\"dp_oi\":\"\"}', '{\"avsc_od\":\"\",\"avae_od\":\"\",\"otros_od\":\"\",\"avsc_oi\":\"\",\"avae_oi\":\"\",\"otros_oi\":\"\",\"avsc_bi\":\"\"}', 'werwrwerewr', 'wrewer', '[{\"cristal\":{\"label\":\"Monofocal visión sencilla\",\"value\":\"Monofocal visión sencilla\"},\"material\":[\"AR_VERDE\"],\"montura\":\"\",\"cristalSugerido\":\"\",\"observaciones\":\"\"}]', 'PACIENTE CONFORME CON LA EXPLICACION  REALIZADA POR EL ASESOR SOBRE LAS VENTAJAS Y DESVENTAJAS DE LOS DIFERENTES TIPOS DE CRISTALES Y MATERIAL DE MONTURA, NO SE ACEPTARAN MODIFICACIONES LUEGO DE HABER RECIBIDO LA INFORMACION Y FIRMADA LA HISTORIA POR EL PACIENTE.', NULL, NULL, '24367965', '24367965', '2025-09-01 14:14:44', '2025-09-01 14:14:44', NULL),
(36, 'H-20250901-004', '2025-09-01', '02e74f10e0327ad868d138f2b4fdd6f0', 'Consulta rutinaria', '', 'Bifocal', NULL, '8759927', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"av_lejos_od\":\"\",\"av_cerca_od\":\"\",\"av_lejos_bi\":\"\",\"av_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"av_lejos_oi\":\"\",\"av_cerca_oi\":\"\",\"av_cerca_bi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"avccl_od\":\"\",\"avccc_od\":\"\",\"avccl_bi\":\"\",\"avccc_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"avccl_oi\":\"\",\"avccc_oi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"alt_od\":\"\",\"dp_od\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"alt_oi\":\"\",\"dp_oi\":\"\"}', '{\"avsc_od\":\"\",\"avae_od\":\"\",\"otros_od\":\"\",\"avsc_oi\":\"\",\"avae_oi\":\"\",\"otros_oi\":\"\",\"avsc_bi\":\"\"}', 'retert', 'erteteete', '[{\"cristal\":{\"label\":\"Visión sencilla digital\",\"value\":\"Visión sencilla digital\"},\"material\":[\"AR_VERDE\"],\"montura\":\"\",\"cristalSugerido\":\"\",\"observaciones\":\"\"}]', 'PACIENTE CONFORME CON LA EXPLICACION  REALIZADA POR EL ASESOR SOBRE LAS VENTAJAS Y DESVENTAJAS DE LOS DIFERENTES TIPOS DE CRISTALES Y MATERIAL DE MONTURA, NO SE ACEPTARAN MODIFICACIONES LUEGO DE HABER RECIBIDO LA INFORMACION Y FIRMADA LA HISTORIA POR EL PACIENTE.', NULL, NULL, '24367965', '24367965', '2025-09-01 14:15:10', '2025-09-01 14:15:10', NULL),
(37, 'H-20250901-005', '2025-09-01', '45c48cce2e2d7fbdea1afc51c7c6ad26', 'Fatiga visual', '', 'Bifocal', '2025-08-31', '8759927', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"av_lejos_od\":\"\",\"av_cerca_od\":\"\",\"av_lejos_bi\":\"\",\"av_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"av_lejos_oi\":\"\",\"av_cerca_oi\":\"\",\"av_cerca_bi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"avccl_od\":\"\",\"avccc_od\":\"\",\"avccl_bi\":\"\",\"avccc_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"avccl_oi\":\"\",\"avccc_oi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"alt_od\":\"\",\"dp_od\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"alt_oi\":\"\",\"dp_oi\":\"\"}', '{\"avsc_od\":\"\",\"avae_od\":\"\",\"otros_od\":\"\",\"avsc_oi\":\"\",\"avae_oi\":\"\",\"otros_oi\":\"\",\"avsc_bi\":\"\"}', '', '', '[{\"cristal\":{\"label\":\"Monofocal visión sencilla\",\"value\":\"Monofocal visión sencilla\"},\"material\":[\"CR39\"],\"montura\":\"\",\"cristalSugerido\":\"\",\"observaciones\":\"\"}]', 'PACIENTE CONFORME CON LA EXPLICACION  REALIZADA POR EL ASESOR SOBRE LAS VENTAJAS Y DESVENTAJAS DE LOS DIFERENTES TIPOS DE CRISTALES Y MATERIAL DE MONTURA, NO SE ACEPTARAN MODIFICACIONES LUEGO DE HABER RECIBIDO LA INFORMACION Y FIRMADA LA HISTORIA POR EL PACIENTE.', NULL, NULL, '24367965', '24367965', '2025-09-01 14:15:36', '2025-09-01 14:15:36', NULL),
(38, 'H-20250901-006', '2025-09-01', '45c48cce2e2d7fbdea1afc51c7c6ad26', 'Consulta rutinaria', '', NULL, '2025-08-31', '8759927', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"av_lejos_od\":\"\",\"av_cerca_od\":\"\",\"av_lejos_bi\":\"\",\"av_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"av_lejos_oi\":\"\",\"av_cerca_oi\":\"\",\"av_cerca_bi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"avccl_od\":\"\",\"avccc_od\":\"\",\"avccl_bi\":\"\",\"avccc_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"avccl_oi\":\"\",\"avccc_oi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"alt_od\":\"\",\"dp_od\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"alt_oi\":\"\",\"dp_oi\":\"\"}', '{\"avsc_od\":\"\",\"avae_od\":\"\",\"otros_od\":\"\",\"avsc_oi\":\"\",\"avae_oi\":\"\",\"otros_oi\":\"\",\"avsc_bi\":\"\"}', 'erewrew', 'werewrew', '[{\"cristal\":{\"label\":\"Visión sencilla digital\",\"value\":\"Visión sencilla digital\"},\"material\":[\"AR_VERDE\"],\"montura\":\"\",\"cristalSugerido\":\"\",\"observaciones\":\"\"}]', 'PACIENTE CONFORME CON LA EXPLICACION  REALIZADA POR EL ASESOR SOBRE LAS VENTAJAS Y DESVENTAJAS DE LOS DIFERENTES TIPOS DE CRISTALES Y MATERIAL DE MONTURA, NO SE ACEPTARAN MODIFICACIONES LUEGO DE HABER RECIBIDO LA INFORMACION Y FIRMADA LA HISTORIA POR EL PACIENTE.', NULL, NULL, '24367965', '24367965', '2025-09-01 14:27:26', '2025-09-01 14:27:26', NULL),
(39, 'H-20250901-007', '2025-09-01', '02e74f10e0327ad868d138f2b4fdd6f0', 'Consulta rutinaria', '', 'Bifocal', '2025-08-31', '8759927', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"av_lejos_od\":\"\",\"av_cerca_od\":\"\",\"av_lejos_bi\":\"\",\"av_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"av_lejos_oi\":\"\",\"av_cerca_oi\":\"\",\"av_cerca_bi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"avccl_od\":\"\",\"avccc_od\":\"\",\"avccl_bi\":\"\",\"avccc_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"avccl_oi\":\"\",\"avccc_oi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"alt_od\":\"\",\"dp_od\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"alt_oi\":\"\",\"dp_oi\":\"\"}', '{\"avsc_od\":\"\",\"avae_od\":\"\",\"otros_od\":\"\",\"avsc_oi\":\"\",\"avae_oi\":\"\",\"otros_oi\":\"\",\"avsc_bi\":\"\"}', 'asdsada', 'asdasda', '[{\"cristal\":{\"label\":\"Visión sencilla digital\",\"value\":\"Visión sencilla digital\"},\"material\":[\"AR_VERDE\"],\"montura\":\"\",\"cristalSugerido\":\"\",\"observaciones\":\"\"}]', 'PACIENTE CONFORME CON LA EXPLICACION  REALIZADA POR EL ASESOR SOBRE LAS VENTAJAS Y DESVENTAJAS DE LOS DIFERENTES TIPOS DE CRISTALES Y MATERIAL DE MONTURA, NO SE ACEPTARAN MODIFICACIONES LUEGO DE HABER RECIBIDO LA INFORMACION Y FIRMADA LA HISTORIA POR EL PACIENTE.', NULL, NULL, '24367965', '24367965', '2025-09-01 14:36:39', '2025-09-01 14:36:39', NULL),
(40, 'H-20250901-008', '2025-09-01', '45c48cce2e2d7fbdea1afc51c7c6ad26', 'Consulta rutinaria', '', 'Bifocal', '2025-08-31', '8759927', '{\"esf_od\":{\"value\":\"+0.25\",\"label\":\"+0.25\"},\"cil_od\":\"-0.25\",\"eje_od\":2,\"add_od\":\"+0.75\",\"av_lejos_od\":\"20/25\",\"av_cerca_od\":\"J2\",\"av_lejos_bi\":\"20/25\",\"av_bi\":\"20/25\",\"esf_oi\":\"+0.25\",\"cil_oi\":\"-0.25\",\"eje_oi\":2,\"add_oi\":\"+0.75\",\"av_lejos_oi\":\"20/25\",\"av_cerca_oi\":\"J2\",\"av_cerca_bi\":\"\"}', '{\"esf_od\":\"+0.50\",\"cil_od\":\"-0.50\",\"eje_od\":2,\"add_od\":\"0.00\",\"avccl_od\":\"20/25\",\"avccc_od\":\"J2\",\"avccl_bi\":\"20/20\",\"avccc_bi\":\"20/20\",\"esf_oi\":\"+0.25\",\"cil_oi\":\"-0.25\",\"eje_oi\":2,\"add_oi\":\"+0.75\",\"avccl_oi\":\"20/20\",\"avccc_oi\":\"J2\"}', '{\"esf_od\":\"+0.25\",\"cil_od\":\"0.00\",\"eje_od\":1,\"add_od\":\"0.00\",\"alt_od\":\"897\",\"dp_od\":\"7897\",\"esf_oi\":\"0.00\",\"cil_oi\":\"-0.25\",\"eje_oi\":2,\"add_oi\":\"+0.75\",\"alt_oi\":\"7897\",\"dp_oi\":\"79879\"}', '{\"avsc_od\":\"20/25\",\"avae_od\":\"J2\",\"otros_od\":\"hfghfgh\",\"avsc_oi\":\"20/20\",\"avae_oi\":\"J1\",\"otros_oi\":\"fhgfhf\",\"avsc_bi\":\"\"}', 'fghfhg', 'fhfhfh', '[{\"cristal\":{\"label\":\"Visión sencilla digital\",\"value\":\"Visión sencilla digital\"},\"material\":[\"AR_VERDE\"],\"montura\":\"fghfhfhf\",\"cristalSugerido\":\"\",\"observaciones\":\"fghfghfhfhfh\"}]', 'PACIENTE CONFORME CON LA EXPLICACION  REALIZADA POR EL ASESOR SOBRE LAS VENTAJAS Y DESVENTAJAS DE LOS DIFERENTES TIPOS DE CRISTALES Y MATERIAL DE MONTURA, NO SE ACEPTARAN MODIFICACIONES LUEGO DE HABER RECIBIDO LA INFORMACION Y FIRMADA LA HISTORIA POR EL PACIENTE.', NULL, NULL, '24367965', '24367965', '2025-09-01 14:41:47', '2025-09-01 14:41:47', NULL),
(41, 'H-20250901-009', '2025-09-01', '45d23e843211818dd5ad1bbd9caf4bfd', 'Fatiga visual', '', 'Visión sencilla digital', '2025-08-31', '8759927', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"av_lejos_od\":\"\",\"av_cerca_od\":\"\",\"av_lejos_bi\":\"\",\"av_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"av_lejos_oi\":\"\",\"av_cerca_oi\":\"\",\"av_cerca_bi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"avccl_od\":\"\",\"avccc_od\":\"\",\"avccl_bi\":\"\",\"avccc_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"avccl_oi\":\"\",\"avccc_oi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"alt_od\":\"\",\"dp_od\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"alt_oi\":\"\",\"dp_oi\":\"\"}', '{\"avsc_od\":\"\",\"avae_od\":\"\",\"otros_od\":\"\",\"avsc_oi\":\"\",\"avae_oi\":\"\",\"otros_oi\":\"\",\"avsc_bi\":\"\"}', 'sdfsdf', 'sdfsdfsd', '[{\"cristal\":{\"label\":\"Visión sencilla digital\",\"value\":\"Visión sencilla digital\"},\"material\":[\"AR_VERDE\"],\"montura\":\"\",\"cristalSugerido\":\"\",\"observaciones\":\"\"}]', 'PACIENTE CONFORME CON LA EXPLICACION  REALIZADA POR EL ASESOR SOBRE LAS VENTAJAS Y DESVENTAJAS DE LOS DIFERENTES TIPOS DE CRISTALES Y MATERIAL DE MONTURA, NO SE ACEPTARAN MODIFICACIONES LUEGO DE HABER RECIBIDO LA INFORMACION Y FIRMADA LA HISTORIA POR EL PACIENTE.', NULL, NULL, '24367965', '24367965', '2025-09-01 14:42:18', '2025-09-01 14:42:18', NULL),
(42, 'H-20250901-010', '2025-09-01', '02e74f10e0327ad868d138f2b4fdd6f0', 'Fatiga visual', '', 'Bifocal', NULL, '8759927', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"av_lejos_od\":\"\",\"av_cerca_od\":\"\",\"av_lejos_bi\":\"\",\"av_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"av_lejos_oi\":\"\",\"av_cerca_oi\":\"\",\"av_cerca_bi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"avccl_od\":\"\",\"avccc_od\":\"\",\"avccl_bi\":\"\",\"avccc_bi\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"avccl_oi\":\"\",\"avccc_oi\":\"\"}', '{\"esf_od\":\"\",\"cil_od\":\"\",\"eje_od\":\"\",\"add_od\":\"\",\"alt_od\":\"\",\"dp_od\":\"\",\"esf_oi\":\"\",\"cil_oi\":\"\",\"eje_oi\":\"\",\"add_oi\":\"\",\"alt_oi\":\"\",\"dp_oi\":\"\"}', '{\"avsc_od\":\"\",\"avae_od\":\"\",\"otros_od\":\"\",\"avsc_oi\":\"\",\"avae_oi\":\"\",\"otros_oi\":\"\",\"avsc_bi\":\"\"}', 'dfgdgd', 'gdgdgd', '[{\"cristal\":{\"label\":\"Visión sencilla digital\",\"value\":\"Visión sencilla digital\"},\"material\":[\"CR39\"],\"montura\":\"\",\"cristalSugerido\":\"\",\"observaciones\":\"\"}]', 'PACIENTE CONFORME CON LA EXPLICACION  REALIZADA POR EL ASESOR SOBRE LAS VENTAJAS Y DESVENTAJAS DE LOS DIFERENTES TIPOS DE CRISTALES Y MATERIAL DE MONTURA, NO SE ACEPTARAN MODIFICACIONES LUEGO DE HABER RECIBIDO LA INFORMACION Y FIRMADA LA HISTORIA POR EL PACIENTE.', NULL, NULL, '24367965', '24367965', '2025-09-01 15:45:36', '2025-09-01 15:45:36', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_rastreo_bcv`
--

CREATE TABLE `historial_rastreo_bcv` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` varchar(8) NOT NULL,
  `rastreado` tinyint(4) NOT NULL,
  `respuesta` text DEFAULT NULL,
  `comentario` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial_rastreo_bcv`
--

INSERT INTO `historial_rastreo_bcv` (`id`, `fecha`, `hora`, `rastreado`, `respuesta`, `comentario`, `created_at`, `updated_at`) VALUES
(10, '2025-08-19', '22:39:00', 1, '{\"dolar\":\"138.12830000\",\"euro\":\"161.22197047\"}', NULL, '2025-08-20 02:39:00', '2025-08-20 02:39:00'),
(11, '2025-08-19', '22:40:00', 1, '{\"dolar\":\"138.12830000\",\"euro\":\"161.22197047\"}', NULL, '2025-08-20 02:40:00', '2025-08-20 02:40:00'),
(12, '2025-08-19', '22:41:00', 1, '{\"dolar\":\"138.12830000\",\"euro\":\"161.22197047\"}', NULL, '2025-08-20 02:41:00', '2025-08-20 02:41:00'),
(13, '2025-08-19', '22:42:00', 1, '{\"dolar\":\"138.12830000\",\"euro\":\"161.22197047\"}', NULL, '2025-08-20 02:42:00', '2025-08-20 02:42:00'),
(14, '2025-08-19', '22:43:00', 1, '{\"dolar\":\"138.12830000\",\"euro\":\"161.22197047\"}', NULL, '2025-08-20 02:43:00', '2025-08-20 02:43:00'),
(15, '2025-08-19', '22:44:00', 1, '{\"dolar\":\"138.12830000\",\"euro\":\"161.22197047\"}', NULL, '2025-08-20 02:44:00', '2025-08-20 02:44:00'),
(16, '2025-08-19', '22:45:00', 1, '{\"dolar\":\"138.12830000\",\"euro\":\"161.22197047\"}', NULL, '2025-08-20 02:45:00', '2025-08-20 02:45:00'),
(17, '2025-08-19', '22:46:00', 1, '{\"dolar\":\"138.12830000\",\"euro\":\"161.22197047\"}', NULL, '2025-08-20 02:46:00', '2025-08-20 02:46:00'),
(18, '2025-08-19', '22:47:00', 1, '[]', NULL, '2025-08-20 02:47:00', '2025-08-20 02:47:00'),
(19, '2025-08-19', '22:48:00', 1, '[]', NULL, '2025-08-20 02:48:00', '2025-08-20 02:48:00'),
(20, '2025-08-19', '22:50:00', 1, '{\"euro\":\"161.22197047\"}', NULL, '2025-08-20 02:50:00', '2025-08-20 02:50:00'),
(21, '2025-08-19', '22:51:00', 1, '{\"dolar\":\"138.12830000\"}', NULL, '2025-08-20 02:51:00', '2025-08-20 02:51:00'),
(22, '2025-08-19', '22:52:00', 1, '{\"dolar\":\"138.12830000\"}', NULL, '2025-08-20 02:52:00', '2025-08-20 02:52:00'),
(23, '2025-08-19', '22:53:00', 1, '{\"dolar\":\"138.12830000\",\"euro\":\"161.22197047\"}', NULL, '2025-08-20 02:53:00', '2025-08-20 02:53:00'),
(24, '2025-08-19', '22:54:00', 1, '{\"dolar\":\"138.12830000\",\"euro\":\"161.22197047\"}', NULL, '2025-08-20 02:54:00', '2025-08-20 02:54:00');

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
(5, 'guarenas', '25409904', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZWRlX2lkIjoiZ3VhcmVuYXMiLCJ1c2VyQ2VkdWxhIjoiMjU0MDk5MDQiLCJpYXQiOjE3NTMyNTM1NzMsImV4cCI6MTc1MzMzOTk3M30.3d-pbVT3JKUv0GQdbKA6IgzahZpeH0ZWtIG1w-IR5F4', '::1', '2025-07-23 06:52:53', '2025-07-23 06:52:53'),
(6, 'guarenas', '25409904', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZWRlX2lkIjoiZ3VhcmVuYXMiLCJ1c2VyQ2VkdWxhIjoiMjU0MDk5MDQiLCJpYXQiOjE3NTM1NTU2MzIsImV4cCI6MTc1MzY0MjAzMn0.ME93WQeOnB5CvkB6wCdV4BVQX4e0GcrSQl1LSyZSgcc', '::1', '2025-07-26 18:47:12', '2025-07-26 18:47:12'),
(7, 'guarenas', '25409904', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZWRlX2lkIjoiZ3VhcmVuYXMiLCJ1c2VyQ2VkdWxhIjoiMjU0MDk5MDQiLCJpYXQiOjE3NTM2Mjg0OTcsImV4cCI6MTc1MzcxNDg5N30.7chzX_gKfNYUP9O1t3C6ttNQoWM9PTPbcc5z_ofRFf0', '::1', '2025-07-27 15:01:37', '2025-07-27 15:01:37'),
(8, 'guarenas', '25409904', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZWRlX2lkIjoiZ3VhcmVuYXMiLCJ1c2VyQ2VkdWxhIjoiMjU0MDk5MDQiLCJpYXQiOjE3NTM2Mjg2ODYsImV4cCI6MTc1MzcxNTA4Nn0.m3tCEhVkmXafTyohLpH4O5qEgmvradmbpnWOgvQAl1c', '::1', '2025-07-27 15:04:46', '2025-07-27 15:04:46'),
(9, 'guarenas', '25409904', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZWRlX2lkIjoiZ3VhcmVuYXMiLCJ1c2VyQ2VkdWxhIjoiMjU0MDk5MDQiLCJpYXQiOjE3NTQwNjA4MTYsImV4cCI6MTc1NDE0NzIxNn0.Tkqiiwcl7f6M17JiJ5PBgVVuHNdCgizoMbDz5r9XiHg', '::1', '2025-08-01 15:06:56', '2025-08-01 15:06:56'),
(10, 'guarenas', '25409904', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZWRlX2lkIjoiZ3VhcmVuYXMiLCJ1c2VyQ2VkdWxhIjoiMjU0MDk5MDQiLCJpYXQiOjE3NTQxMTEwMzEsImV4cCI6MTc1NDE5NzQzMX0.cJ5hzM-u6Jg66tvLRMQuphlmgXD7qF6l7Z-uOjGr-_o', '::1', '2025-08-02 05:03:51', '2025-08-02 05:03:51'),
(11, 'guarenas', '25409904', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZWRlX2lkIjoiZ3VhcmVuYXMiLCJ1c2VyQ2VkdWxhIjoiMjU0MDk5MDQiLCJpYXQiOjE3NTQ1NzkwMDAsImV4cCI6MTc1NDY2NTQwMH0.288c8pukMenKpsVCzJ7v1NtC7offjMB7QJwb3CxuhgU', '::1', '2025-08-07 15:03:20', '2025-08-07 15:03:20'),
(12, 'guarenas', '25409904', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZWRlX2lkIjoiZ3VhcmVuYXMiLCJ1c2VyQ2VkdWxhIjoiMjU0MDk5MDQiLCJpYXQiOjE3NTQ5MTQ5MTcsImV4cCI6MTc1NTAwMTMxN30.GVMr-JiN9MZ1sQ5BGWOOWBA667B89IlRdAJVjIrTJL4', '::1', '2025-08-11 12:21:57', '2025-08-11 12:21:57'),
(13, 'guarenas', '25409904', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZWRlX2lkIjoiZ3VhcmVuYXMiLCJ1c2VyQ2VkdWxhIjoiMjU0MDk5MDQiLCJpYXQiOjE3NTY0NTk5NDEsImV4cCI6MTc1NjU0NjM0MX0.MLdTduWPJh81vOS1_v1wvWNjvkq4CJwK9WYcxWEcV78', '::1', '2025-08-29 09:32:21', '2025-08-29 09:32:21'),
(14, 'guarenas', '25409904', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZWRlX2lkIjoiZ3VhcmVuYXMiLCJ1c2VyQ2VkdWxhIjoiMjU0MDk5MDQiLCJpYXQiOjE3NTY1OTEwMjEsImV4cCI6MTc1NjY3NzQyMX0.efwcCIZT1ZGjBYQZunECl9yEp8AZJQx72AHkMpjWSR4', '::1', '2025-08-30 21:57:01', '2025-08-30 21:57:01'),
(15, 'guarenas', '25409904', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZWRlX2lkIjoiZ3VhcmVuYXMiLCJ1c2VyQ2VkdWxhIjoiMjU0MDk5MDQiLCJpYXQiOjE3NTY2NTY1NTEsImV4cCI6MTc1Njc0Mjk1MX0.iwn4zgRsvOt56tGqi0YynWvW0Ve0Q41fNfIqIebBzpE', '::1', '2025-08-31 16:09:11', '2025-08-31 16:09:11'),
(16, 'guarenas', '25409904', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZWRlX2lkIjoiZ3VhcmVuYXMiLCJ1c2VyQ2VkdWxhIjoiMjU0MDk5MDQiLCJpYXQiOjE3NTY3NDM5NzcsImV4cCI6MTc1NjgzMDM3N30.c1WSYN7oi86Qe0tgyVriuqAK97v-LUBZzJOeVusATtQ', '::1', '2025-09-01 16:26:17', '2025-09-01 16:26:17'),
(17, 'guarenas', '25409904', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZWRlX2lkIjoiZ3VhcmVuYXMiLCJ1c2VyQ2VkdWxhIjoiMjU0MDk5MDQiLCJpYXQiOjE3NTcxOTQxMDcsImV4cCI6MTc1NzI4MDUwN30.iyeNnGw0EX7_h09FPyEXMLoBEuwdDa2mM9KrhEAsB40', '::1', '2025-09-06 21:28:27', '2025-09-06 21:28:27');

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
  `sin_cedula` tinyint(4) NOT NULL DEFAULT 0,
  `nombre` varchar(255) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `ocupacion` text NOT NULL,
  `genero` varchar(1) NOT NULL,
  `direccion` text NOT NULL,
  `redes_sociales` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`redes_sociales`)),
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `tiene_lentes` varchar(100) DEFAULT NULL,
  `fotofobia` varchar(100) DEFAULT NULL,
  `uso_dispositivo_electronico` text DEFAULT NULL,
  `traumatismo_ocular` varchar(100) DEFAULT NULL,
  `traumatismo_ocular_descripcion` text DEFAULT NULL,
  `cirugia_ocular` varchar(100) DEFAULT NULL,
  `cirugia_ocular_descripcion` text DEFAULT NULL,
  `alergias` text DEFAULT NULL,
  `antecedentes_personales` text DEFAULT NULL,
  `antecedentes_familiares` text DEFAULT NULL,
  `patologias` text DEFAULT NULL,
  `patologia_ocular` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id`, `pkey`, `sede_id`, `cedula`, `sin_cedula`, `nombre`, `fecha_nacimiento`, `telefono`, `email`, `ocupacion`, `genero`, `direccion`, `redes_sociales`, `created_at`, `updated_at`, `deleted_at`, `tiene_lentes`, `fotofobia`, `uso_dispositivo_electronico`, `traumatismo_ocular`, `traumatismo_ocular_descripcion`, `cirugia_ocular`, `cirugia_ocular_descripcion`, `alergias`, `antecedentes_personales`, `antecedentes_familiares`, `patologias`, `patologia_ocular`) VALUES
(8, 'c9f0f895fb98ab9159f51fd0297e236d', 'guatire', '267758784', 0, 'Jesus Martinez', '1998-10-03', '04142134565', 'jesusmc@gmail.com', 'Ingeniero', 'm', 'Guatire', '[{\"platform\":\"Facebook\",\"username\":\"jesusmc\"},{\"platform\":\"Instagram\",\"username\":\"@jesusmc\"}]', '2025-07-22 00:34:08', '2025-08-30 21:36:51', NULL, 'No', 'No', 'No', 'No', NULL, 'No', NULL, NULL, '', '', '', ''),
(9, '45c48cce2e2d7fbdea1afc51c7c6ad26', 'guatire', '10092901', 0, 'Ana Castro', '1969-10-03', '04142134565', 'jesusmc@gmail.com', 'Ingeniero', 'm', 'Guatire', '[{\"platform\":\"Facebook\",\"username\":\"anacastro\"},{\"platform\":\"Instagram\",\"username\":\"@anacastro\"}]', '2025-07-22 00:47:47', '2025-07-22 00:47:47', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'd3d9446802a44259755d38e6d163e820', 'guarenas', '25409904', 0, 'Jefferson Torres', '1996-06-11', '04241738615', 'jefersonugas@gmail.com', 'Ingeniero de Sistemas', 'm', 'Guatire, Castillejo', '[{\"platform\":\"Facebook\",\"username\":\"maria.gonzalez\"},{\"platform\":\"Instagram\",\"username\":\"@maria.g\"}]', '2025-07-23 15:52:19', '2025-07-24 22:38:43', NULL, 'Si', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', 'a|b|c', ''),
(14, 'aab3238922bcc25a6f606eb525ffdc56', 'guatire', '24367965', 0, 'Ruben dario Martinez castro', '1995-11-10', '04123920817', 'rubemm18@gmail.com', 'Ingeniero', 'm', 'Las rosas, conj res, country villas', '[{\"platform\":\"Instagram\",\"username\":\"martinezcr_\"}]', '2025-07-24 21:35:31', '2025-08-31 23:29:27', NULL, 'Sí', 'No', 'Sí, 1 a 3 horas', 'No', NULL, 'Sí', 'Miopia y agtismatismo', NULL, '', '', 'Miopía|Astigmatismo', ''),
(24, '45d23e843211818dd5ad1bbd9caf4bfd', 'guatire', '23423432', 0, 'test test', '2025-08-04', '04123920817', 'rubemm18@gmail.com', 'qwdasdasd', 'f', 'Las rosas, conj res, country villas', '[]', '2025-08-29 15:59:05', '2025-08-30 21:42:09', NULL, 'No', 'No', 'No', 'No', NULL, 'No', NULL, NULL, '', '', '', ''),
(25, '28acbaf873ad2772e216895c44281940', 'guatire', '8759927', 1, 'Dario Castro', '2025-08-14', '04123920817', 'rubemm18@gmail.com', 'Programador', 'm', 'Las rosas, conj res, country villas', '[]', '2025-08-30 21:48:38', '2025-08-30 21:48:38', NULL, 'No', 'No', 'No', 'No', '', 'No', '', NULL, '', '', '', ''),
(26, '4e732ced3463d06de0ca9a15b6153677', 'guatire', '4353453', 0, 'dfsfsdfsf', '2025-09-16', '04123920817', 'rubemm18@gmail.com', 'sfsdfsd', 'f', 'Las rosas, conj res, country villas', '[]', '2025-09-01 13:34:30', '2025-09-01 13:34:30', NULL, 'No', 'No', 'No', 'No', '', 'No', '', NULL, '', '', '', ''),
(27, '02e74f10e0327ad868d138f2b4fdd6f0', 'guatire', '723423432', 0, 'sdfsdfsdfd', '2025-09-02', '04123920817', 'rubemm18@gmail.com', 'sadasdsad', 'f', 'Las rosas, conj res, country villas', '[]', '2025-09-01 16:43:09', '2025-09-01 16:43:09', NULL, 'No', 'No', 'No', 'No', '', 'No', '', NULL, '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `sede_id` varchar(50) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `marca` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `codigo` varchar(255) NOT NULL,
  `material` varchar(255) NOT NULL,
  `proveedor` varchar(255) NOT NULL,
  `categoria` varchar(255) NOT NULL,
  `stock` int(11) NOT NULL,
  `precio` double NOT NULL,
  `moneda` varchar(20) NOT NULL,
  `activo` tinyint(4) NOT NULL,
  `descripcion` text NOT NULL,
  `imagen_url` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `sede_id`, `nombre`, `marca`, `color`, `codigo`, `material`, `proveedor`, `categoria`, `stock`, `precio`, `moneda`, `activo`, `descripcion`, `imagen_url`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'guarenas', 'Producto Chevere 1', 'Marca Generica 1', 'Azul', '12345678', 'Plastico', 'Pepsi', 'Lentes', 5, 5, 'euro', 1, 'Descripcion generica de muestra', '/public/images/product-1.png?t=1757207114871', '2025-09-06 22:31:13', '2025-09-07 01:05:14', NULL),
(3, 'guarenas', 'Producto 2', 'Marca Generica 1', 'Azul', '12345678', 'Plastico', 'Pepsi', 'Lentes', 5, 5, 'dolar', 1, 'Descripcion generica de muestra', NULL, '2025-09-06 22:34:12', '2025-09-06 22:34:12', NULL),
(4, 'guarenas', 'Producto 3', 'Marca Generica 1', 'Azul', '12345678', 'Plastico', 'Pepsi', 'Lentes', 5, 5, 'euro', 0, 'Descripcion generica de muestra', NULL, '2025-09-06 22:34:35', '2025-09-06 22:34:35', NULL);

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
('dolar', 'Dolar', '$', 138.1283, 0, 'Automatico con BCV', '2025-06-14 16:18:23', '2025-08-20 02:53:00'),
('euro', 'Euro', '€', 161.222, 0, 'Automatico con BCV', '2025-06-14 16:18:23', '2025-08-20 02:53:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tasas_historial`
--

CREATE TABLE `tasas_historial` (
  `id` int(11) NOT NULL,
  `tasa_id` varchar(20) NOT NULL,
  `valor_nuevo` double NOT NULL,
  `usu_cedula` varchar(20) DEFAULT NULL,
  `tipo_cambio` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tasas_historial`
--

INSERT INTO `tasas_historial` (`id`, `tasa_id`, `valor_nuevo`, `usu_cedula`, `tipo_cambio`, `created_at`, `updated_at`) VALUES
(25, 'dolar', 138.1283, NULL, 'Automatico con BCV', '2025-08-20 02:39:00', '2025-08-20 02:39:00'),
(26, 'euro', 161.222, NULL, 'Automatico con BCV', '2025-08-20 02:39:00', '2025-08-20 02:39:00'),
(27, 'dolar', 138.1283, NULL, 'Automatico con BCV', '2025-08-20 02:40:00', '2025-08-20 02:40:00'),
(28, 'euro', 161.222, NULL, 'Automatico con BCV', '2025-08-20 02:40:00', '2025-08-20 02:40:00'),
(29, 'euro', 161.222, NULL, 'Automatico con BCV', '2025-08-20 02:41:00', '2025-08-20 02:41:00'),
(30, 'euro', 161.222, NULL, 'Automatico con BCV', '2025-08-20 02:42:00', '2025-08-20 02:42:00'),
(31, 'euro', 161.222, NULL, 'Automatico con BCV', '2025-08-20 02:43:00', '2025-08-20 02:43:00'),
(32, 'euro', 161.222, NULL, 'Automatico con BCV', '2025-08-20 02:44:00', '2025-08-20 02:44:00'),
(33, 'euro', 161.222, NULL, 'Automatico con BCV', '2025-08-20 02:45:00', '2025-08-20 02:45:00'),
(34, 'euro', 161.222, NULL, 'Automatico con BCV', '2025-08-20 02:46:00', '2025-08-20 02:46:00'),
(35, 'euro', 161.222, NULL, 'Automatico con BCV', '2025-08-20 02:47:00', '2025-08-20 02:47:00'),
(36, 'euro', 161.222, NULL, 'Automatico con BCV', '2025-08-20 02:48:00', '2025-08-20 02:48:00'),
(37, 'euro', 161.222, NULL, 'Automatico con BCV', '2025-08-20 02:50:00', '2025-08-20 02:50:00'),
(38, 'dolar', 138.1283, NULL, 'Automatico con BCV', '2025-08-20 02:51:00', '2025-08-20 02:51:00'),
(39, 'dolar', 138.1283, NULL, 'Automatico con BCV', '2025-08-20 02:52:00', '2025-08-20 02:52:00'),
(40, 'dolar', 138.1283, NULL, 'Automatico con BCV', '2025-08-20 02:53:00', '2025-08-20 02:53:00'),
(41, 'euro', 161.222, NULL, 'Automatico con BCV', '2025-08-20 02:53:00', '2025-08-20 02:53:00'),
(42, 'dolar', 138.1283, NULL, 'Automatico con BCV', '2025-08-20 02:54:00', '2025-08-20 02:54:00'),
(43, 'euro', 161.222, NULL, 'Automatico con BCV', '2025-08-20 02:54:00', '2025-08-20 02:54:00');

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
(4, 'admin', 'gerente', '25409904', 'Jefferson Torres', '$2b$10$7KuJRh76glMvnAPw7l.S9ebE2y6lalWWui7R3Znwyjk4pqStyPnOy', 'jeffersonjtorresu@gmail.com', '04128977574', '1996-06-11', '/public/images/profile-25409904.png?t=1757206117655', NULL, 1, '2025-03-28 18:31:30', '2025-09-07 00:48:37', NULL),
(24, 'asesor-optico', 'asesor-optico-1', '11554570', 'Heriberto Torres', '$2b$10$7KuJRh76glMvnAPw7l.S9ebE2y6lalWWui7R3Znwyjk4pqStyPnOy', 'heriberto@gmail.com', '04241738615', '1996-06-11', NULL, NULL, 1, '2025-07-27 15:19:32', '2025-07-27 15:19:32', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historiales_medicos`
--
ALTER TABLE `historiales_medicos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero` (`numero`);

--
-- Indices de la tabla `historial_rastreo_bcv`
--
ALTER TABLE `historial_rastreo_bcv`
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
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT de la tabla `historiales_medicos`
--
ALTER TABLE `historiales_medicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `historial_rastreo_bcv`
--
ALTER TABLE `historial_rastreo_bcv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `logins`
--
ALTER TABLE `logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `otps`
--
ALTER TABLE `otps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tasas_historial`
--
ALTER TABLE `tasas_historial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
