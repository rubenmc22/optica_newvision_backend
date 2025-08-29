-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 29-08-2025 a las 11:48:19
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
(1, 'H-20250801-001', '2025-08-01', 'guarenas-25409904', 'asdadasd|Dificultad visual cerca', '', NULL, NULL, '11554570', '{\"esf_od\":\"+1.00\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"av_lejos_od\":\"20/30\",\"av_cerca_od\":\"J3\",\"av_lejos_bi\":\"20/25\",\"av_bi\":\"J2\",\"esf_oi\":\"+1.25\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"av_lejos_oi\":\"20/30\",\"av_cerca_oi\":\"J3\",\"av_cerca_bi\":\"J2\"}', '{\"esf_od\":\"+1.25\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"avccl_od\":\"20/25\",\"avccc_od\":\"J2\",\"avccl_bi\":\"20/20\",\"avccc_bi\":\"J1\",\"esf_oi\":\"+1.50\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"avccl_oi\":\"20/25\",\"avccc_oi\":\"J2\"}', '{\"esf_od\":\"+1.25\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"alt_od\":\"3\",\"dp_od\":\"64\",\"esf_oi\":\"+1.50\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"alt_oi\":\"3\",\"dp_oi\":\"64\"}', '{\"avsc_od\":\"20/25\",\"avae_od\":\"J2\",\"otros_od\":\"\",\"avsc_oi\":\"20/25\",\"avae_oi\":\"J2\",\"otros_oi\":\"\",\"avsc_bi\":\"20/20\"}', 'Presbicia con astigmatismo leve', 'Uso de lentes progresivos digitales', '[{\"cristal\":[\"Progresivo digital intermedio\"],\"material\":[\"POLICARBONATO\",\"FOTOCROMATICO_BLUE_BLOCK\",\"Trivex\"],\"montura\":\"Acetato\",\"cristalSugerido\":\"Progresivo digital amplio\",\"observaciones\":\"Se recomienda uso en ambientes con luz artificial prolongada\"}]', 'PACIENTE CONFORME CON LA EXPLICACION REALIZADA POR EL ASESOR SOBRE LAS VENTAJAS Y DESVENTAJAS DE LOS DIFERENTES TIPOS DE CRISTALES Y MATERIAL DE MONTURA, NO SE ACEPTARAN MODIFICACIONES LUEGO DE HABER RECIBIDO LA INFORMACION Y FIRMADA LA HISTORIA POR EL PACIENTE.', '', '', '25409904', '25409904', '2025-08-01 15:13:26', '2025-08-01 15:25:26', NULL),
(2, 'H-20250801-002', '2025-08-01', 'guarenas-25409904', 'Fatiga visual|Dificultad visual cerca', '', NULL, NULL, '11554570', '{\"esf_od\":\"+1.00\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"av_lejos_od\":\"20/30\",\"av_cerca_od\":\"J3\",\"av_lejos_bi\":\"20/25\",\"av_bi\":\"J2\",\"esf_oi\":\"+1.25\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"av_lejos_oi\":\"20/30\",\"av_cerca_oi\":\"J3\",\"av_cerca_bi\":\"J2\"}', '{\"esf_od\":\"+1.25\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"avccl_od\":\"20/25\",\"avccc_od\":\"J2\",\"avccl_bi\":\"20/20\",\"avccc_bi\":\"J1\",\"esf_oi\":\"+1.50\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"avccl_oi\":\"20/25\",\"avccc_oi\":\"J2\"}', '{\"esf_od\":\"+1.25\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"alt_od\":\"3\",\"dp_od\":\"64\",\"esf_oi\":\"+1.50\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"alt_oi\":\"3\",\"dp_oi\":\"64\"}', '{\"avsc_od\":\"20/25\",\"avae_od\":\"J2\",\"otros_od\":\"\",\"avsc_oi\":\"20/25\",\"avae_oi\":\"J2\",\"otros_oi\":\"\",\"avsc_bi\":\"20/20\"}', 'Presbicia con astigmatismo leve', 'Uso de lentes progresivos digitales', '[{\"cristal\":[\"Progresivo digital intermedio\"],\"material\":[\"POLICARBONATO\",\"FOTOCROMATICO_BLUE_BLOCK\",\"Trivex\"],\"montura\":\"Acetato\",\"cristalSugerido\":\"Progresivo digital amplio\",\"observaciones\":\"Se recomienda uso en ambientes con luz artificial prolongada\"}]', 'PACIENTE CONFORME CON LA EXPLICACION REALIZADA POR EL ASESOR SOBRE LAS VENTAJAS Y DESVENTAJAS DE LOS DIFERENTES TIPOS DE CRISTALES Y MATERIAL DE MONTURA, NO SE ACEPTARAN MODIFICACIONES LUEGO DE HABER RECIBIDO LA INFORMACION Y FIRMADA LA HISTORIA POR EL PACIENTE.', '', '', '25409904', '25409904', '2025-08-01 15:17:50', '2025-08-01 15:17:50', NULL),
(3, 'H-20250811-001', '2025-08-11', 'guarenas-25409904', 'Fatiga visual|Dificultad visual cerca', '', 'Alguno', '2025-08-10', 'Dr. José Martínez', '{\"esf_od\":\"+1.00\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"av_lejos_od\":\"20/30\",\"av_cerca_od\":\"J3\",\"av_lejos_bi\":\"20/25\",\"av_bi\":\"J2\",\"esf_oi\":\"+1.25\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"av_lejos_oi\":\"20/30\",\"av_cerca_oi\":\"J3\",\"av_cerca_bi\":\"J2\"}', '{\"esf_od\":\"+1.25\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"avccl_od\":\"20/25\",\"avccc_od\":\"J2\",\"avccl_bi\":\"20/20\",\"avccc_bi\":\"J1\",\"esf_oi\":\"+1.50\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"avccl_oi\":\"20/25\",\"avccc_oi\":\"J2\"}', '{\"esf_od\":\"+1.25\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"alt_od\":\"3\",\"dp_od\":\"64\",\"esf_oi\":\"+1.50\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"alt_oi\":\"3\",\"dp_oi\":\"64\"}', '{\"avsc_od\":\"20/25\",\"avae_od\":\"J2\",\"otros_od\":\"\",\"avsc_oi\":\"20/25\",\"avae_oi\":\"J2\",\"otros_oi\":\"\",\"avsc_bi\":\"20/20\"}', 'Presbicia con astigmatismo leve', 'Uso de lentes progresivos digitales', '[{\"cristal\":[\"Progresivo digital intermedio\"],\"material\":[\"POLICARBONATO\",\"FOTOCROMATICO_BLUE_BLOCK\",\"Trivex\"],\"montura\":\"Acetato\",\"cristalSugerido\":\"Progresivo digital amplio\",\"observaciones\":\"Se recomienda uso en ambientes con luz artificial prolongada\"}]', 'PACIENTE CONFORME CON LA EXPLICACION REALIZADA POR EL ASESOR SOBRE LAS VENTAJAS Y DESVENTAJAS DE LOS DIFERENTES TIPOS DE CRISTALES Y MATERIAL DE MONTURA, NO SE ACEPTARAN MODIFICACIONES LUEGO DE HABER RECIBIDO LA INFORMACION Y FIRMADA LA HISTORIA POR EL PACIENTE.', NULL, NULL, '25409904', '25409904', '2025-08-11 12:22:21', '2025-08-11 12:22:21', NULL),
(5, 'H-20250811-[ob', '2025-08-11', 'guarenas-25409904', 'Fatiga visual|Dificultad visual cerca', '', 'Alguno', '2025-08-10', 'Dr. José Martínez', '{\"esf_od\":\"+1.00\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"av_lejos_od\":\"20/30\",\"av_cerca_od\":\"J3\",\"av_lejos_bi\":\"20/25\",\"av_bi\":\"J2\",\"esf_oi\":\"+1.25\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"av_lejos_oi\":\"20/30\",\"av_cerca_oi\":\"J3\",\"av_cerca_bi\":\"J2\"}', '{\"esf_od\":\"+1.25\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"avccl_od\":\"20/25\",\"avccc_od\":\"J2\",\"avccl_bi\":\"20/20\",\"avccc_bi\":\"J1\",\"esf_oi\":\"+1.50\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"avccl_oi\":\"20/25\",\"avccc_oi\":\"J2\"}', '{\"esf_od\":\"+1.25\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"alt_od\":\"3\",\"dp_od\":\"64\",\"esf_oi\":\"+1.50\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"alt_oi\":\"3\",\"dp_oi\":\"64\"}', '{\"avsc_od\":\"20/25\",\"avae_od\":\"J2\",\"otros_od\":\"\",\"avsc_oi\":\"20/25\",\"avae_oi\":\"J2\",\"otros_oi\":\"\",\"avsc_bi\":\"20/20\"}', 'Presbicia con astigmatismo leve', 'Uso de lentes progresivos digitales', '[{\"cristal\":[\"Progresivo digital intermedio\"],\"material\":[\"POLICARBONATO\",\"FOTOCROMATICO_BLUE_BLOCK\",\"Trivex\"],\"montura\":\"Acetato\",\"cristalSugerido\":\"Progresivo digital amplio\",\"observaciones\":\"Se recomienda uso en ambientes con luz artificial prolongada\"}]', 'PACIENTE CONFORME CON LA EXPLICACION REALIZADA POR EL ASESOR SOBRE LAS VENTAJAS Y DESVENTAJAS DE LOS DIFERENTES TIPOS DE CRISTALES Y MATERIAL DE MONTURA, NO SE ACEPTARAN MODIFICACIONES LUEGO DE HABER RECIBIDO LA INFORMACION Y FIRMADA LA HISTORIA POR EL PACIENTE.', NULL, NULL, '25409904', '25409904', '2025-08-11 12:39:20', '2025-08-11 12:39:20', NULL),
(6, 'H-20250811-003', '2025-08-11', 'guarenas-25409904', 'Fatiga visual|Dificultad visual cerca', '', 'Alguno', '2025-08-10', 'Dr. José Martínez', '{\"esf_od\":\"+1.00\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"av_lejos_od\":\"20/30\",\"av_cerca_od\":\"J3\",\"av_lejos_bi\":\"20/25\",\"av_bi\":\"J2\",\"esf_oi\":\"+1.25\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"av_lejos_oi\":\"20/30\",\"av_cerca_oi\":\"J3\",\"av_cerca_bi\":\"J2\"}', '{\"esf_od\":\"+1.25\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"avccl_od\":\"20/25\",\"avccc_od\":\"J2\",\"avccl_bi\":\"20/20\",\"avccc_bi\":\"J1\",\"esf_oi\":\"+1.50\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"avccl_oi\":\"20/25\",\"avccc_oi\":\"J2\"}', '{\"esf_od\":\"+1.25\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"alt_od\":\"3\",\"dp_od\":\"64\",\"esf_oi\":\"+1.50\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"alt_oi\":\"3\",\"dp_oi\":\"64\"}', '{\"avsc_od\":\"20/25\",\"avae_od\":\"J2\",\"otros_od\":\"\",\"avsc_oi\":\"20/25\",\"avae_oi\":\"J2\",\"otros_oi\":\"\",\"avsc_bi\":\"20/20\"}', 'Presbicia con astigmatismo leve', 'Uso de lentes progresivos digitales', '[{\"cristal\":[\"Progresivo digital intermedio\"],\"material\":[\"POLICARBONATO\",\"FOTOCROMATICO_BLUE_BLOCK\",\"Trivex\"],\"montura\":\"Acetato\",\"cristalSugerido\":\"Progresivo digital amplio\",\"observaciones\":\"Se recomienda uso en ambientes con luz artificial prolongada\"}]', 'PACIENTE CONFORME CON LA EXPLICACION REALIZADA POR EL ASESOR SOBRE LAS VENTAJAS Y DESVENTAJAS DE LOS DIFERENTES TIPOS DE CRISTALES Y MATERIAL DE MONTURA, NO SE ACEPTARAN MODIFICACIONES LUEGO DE HABER RECIBIDO LA INFORMACION Y FIRMADA LA HISTORIA POR EL PACIENTE.', NULL, NULL, '25409904', '25409904', '2025-08-11 12:39:30', '2025-08-11 12:39:30', NULL),
(7, 'H-20250811-004', '2025-08-11', 'guarenas-25409904', 'Fatiga visual|Dificultad visual cerca', '', 'Alguno', '2025-08-10', 'Dr. José Martínez', '{\"esf_od\":\"+1.00\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"av_lejos_od\":\"20/30\",\"av_cerca_od\":\"J3\",\"av_lejos_bi\":\"20/25\",\"av_bi\":\"J2\",\"esf_oi\":\"+1.25\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"av_lejos_oi\":\"20/30\",\"av_cerca_oi\":\"J3\",\"av_cerca_bi\":\"J2\"}', '{\"esf_od\":\"+1.25\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"avccl_od\":\"20/25\",\"avccc_od\":\"J2\",\"avccl_bi\":\"20/20\",\"avccc_bi\":\"J1\",\"esf_oi\":\"+1.50\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"avccl_oi\":\"20/25\",\"avccc_oi\":\"J2\"}', '{\"esf_od\":\"+1.25\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"alt_od\":\"3\",\"dp_od\":\"64\",\"esf_oi\":\"+1.50\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"alt_oi\":\"3\",\"dp_oi\":\"64\"}', '{\"avsc_od\":\"20/25\",\"avae_od\":\"J2\",\"otros_od\":\"\",\"avsc_oi\":\"20/25\",\"avae_oi\":\"J2\",\"otros_oi\":\"\",\"avsc_bi\":\"20/20\"}', 'Presbicia con astigmatismo leve', 'Uso de lentes progresivos digitales', '[{\"cristal\":[\"Progresivo digital intermedio\"],\"material\":[\"POLICARBONATO\",\"FOTOCROMATICO_BLUE_BLOCK\",\"Trivex\"],\"montura\":\"Acetato\",\"cristalSugerido\":\"Progresivo digital amplio\",\"observaciones\":\"Se recomienda uso en ambientes con luz artificial prolongada\"}]', 'PACIENTE CONFORME CON LA EXPLICACION REALIZADA POR EL ASESOR SOBRE LAS VENTAJAS Y DESVENTAJAS DE LOS DIFERENTES TIPOS DE CRISTALES Y MATERIAL DE MONTURA, NO SE ACEPTARAN MODIFICACIONES LUEGO DE HABER RECIBIDO LA INFORMACION Y FIRMADA LA HISTORIA POR EL PACIENTE.', NULL, NULL, '25409904', '25409904', '2025-08-11 12:39:31', '2025-08-11 12:39:31', NULL),
(8, 'H-20250811-005', '2025-08-11', 'guarenas-25409904', 'Fatiga visual|Dificultad visual cerca', '', 'Alguno', '2025-08-10', 'Dr. José Martínez', '{\"esf_od\":\"+1.00\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"av_lejos_od\":\"20/30\",\"av_cerca_od\":\"J3\",\"av_lejos_bi\":\"20/25\",\"av_bi\":\"J2\",\"esf_oi\":\"+1.25\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"av_lejos_oi\":\"20/30\",\"av_cerca_oi\":\"J3\",\"av_cerca_bi\":\"J2\"}', '{\"esf_od\":\"+1.25\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"avccl_od\":\"20/25\",\"avccc_od\":\"J2\",\"avccl_bi\":\"20/20\",\"avccc_bi\":\"J1\",\"esf_oi\":\"+1.50\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"avccl_oi\":\"20/25\",\"avccc_oi\":\"J2\"}', '{\"esf_od\":\"+1.25\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"alt_od\":\"3\",\"dp_od\":\"64\",\"esf_oi\":\"+1.50\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"alt_oi\":\"3\",\"dp_oi\":\"64\"}', '{\"avsc_od\":\"20/25\",\"avae_od\":\"J2\",\"otros_od\":\"\",\"avsc_oi\":\"20/25\",\"avae_oi\":\"J2\",\"otros_oi\":\"\",\"avsc_bi\":\"20/20\"}', 'Presbicia con astigmatismo leve', 'Uso de lentes progresivos digitales', '[{\"cristal\":[\"Progresivo digital intermedio\"],\"material\":[\"POLICARBONATO\",\"FOTOCROMATICO_BLUE_BLOCK\",\"Trivex\"],\"montura\":\"Acetato\",\"cristalSugerido\":\"Progresivo digital amplio\",\"observaciones\":\"Se recomienda uso en ambientes con luz artificial prolongada\"}]', 'PACIENTE CONFORME CON LA EXPLICACION REALIZADA POR EL ASESOR SOBRE LAS VENTAJAS Y DESVENTAJAS DE LOS DIFERENTES TIPOS DE CRISTALES Y MATERIAL DE MONTURA, NO SE ACEPTARAN MODIFICACIONES LUEGO DE HABER RECIBIDO LA INFORMACION Y FIRMADA LA HISTORIA POR EL PACIENTE.', NULL, NULL, '25409904', '25409904', '2025-08-11 12:39:32', '2025-08-11 12:39:32', NULL),
(9, 'H-20250811-006', '2025-08-11', 'guarenas-25409904', 'Fatiga visual|Dificultad visual cerca', '', 'Alguno', '2025-08-10', 'Dr. José Martínez', '{\"esf_od\":\"+1.00\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"av_lejos_od\":\"20/30\",\"av_cerca_od\":\"J3\",\"av_lejos_bi\":\"20/25\",\"av_bi\":\"J2\",\"esf_oi\":\"+1.25\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"av_lejos_oi\":\"20/30\",\"av_cerca_oi\":\"J3\",\"av_cerca_bi\":\"J2\"}', '{\"esf_od\":\"+1.25\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"avccl_od\":\"20/25\",\"avccc_od\":\"J2\",\"avccl_bi\":\"20/20\",\"avccc_bi\":\"J1\",\"esf_oi\":\"+1.50\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"avccl_oi\":\"20/25\",\"avccc_oi\":\"J2\"}', '{\"esf_od\":\"+1.25\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"alt_od\":\"3\",\"dp_od\":\"64\",\"esf_oi\":\"+1.50\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"alt_oi\":\"3\",\"dp_oi\":\"64\"}', '{\"avsc_od\":\"20/25\",\"avae_od\":\"J2\",\"otros_od\":\"\",\"avsc_oi\":\"20/25\",\"avae_oi\":\"J2\",\"otros_oi\":\"\",\"avsc_bi\":\"20/20\"}', 'Presbicia con astigmatismo leve', 'Uso de lentes progresivos digitales', '[{\"cristal\":[\"Progresivo digital intermedio\"],\"material\":[\"POLICARBONATO\",\"FOTOCROMATICO_BLUE_BLOCK\",\"Trivex\"],\"montura\":\"Acetato\",\"cristalSugerido\":\"Progresivo digital amplio\",\"observaciones\":\"Se recomienda uso en ambientes con luz artificial prolongada\"}]', 'PACIENTE CONFORME CON LA EXPLICACION REALIZADA POR EL ASESOR SOBRE LAS VENTAJAS Y DESVENTAJAS DE LOS DIFERENTES TIPOS DE CRISTALES Y MATERIAL DE MONTURA, NO SE ACEPTARAN MODIFICACIONES LUEGO DE HABER RECIBIDO LA INFORMACION Y FIRMADA LA HISTORIA POR EL PACIENTE.', NULL, NULL, '25409904', '25409904', '2025-08-11 12:39:34', '2025-08-11 12:39:34', NULL),
(10, 'H-20250812-001', '2025-08-12', 'guarenas-25409904', 'Fatiga visual|Dificultad visual cerca', '', 'Alguno', '2025-08-10', 'Dr. José Martínez', '{\"esf_od\":\"+1.00\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"av_lejos_od\":\"20/30\",\"av_cerca_od\":\"J3\",\"av_lejos_bi\":\"20/25\",\"av_bi\":\"J2\",\"esf_oi\":\"+1.25\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"av_lejos_oi\":\"20/30\",\"av_cerca_oi\":\"J3\",\"av_cerca_bi\":\"J2\"}', '{\"esf_od\":\"+1.25\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"avccl_od\":\"20/25\",\"avccc_od\":\"J2\",\"avccl_bi\":\"20/20\",\"avccc_bi\":\"J1\",\"esf_oi\":\"+1.50\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"avccl_oi\":\"20/25\",\"avccc_oi\":\"J2\"}', '{\"esf_od\":\"+1.25\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"alt_od\":\"3\",\"dp_od\":\"64\",\"esf_oi\":\"+1.50\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"alt_oi\":\"3\",\"dp_oi\":\"64\"}', '{\"avsc_od\":\"20/25\",\"avae_od\":\"J2\",\"otros_od\":\"\",\"avsc_oi\":\"20/25\",\"avae_oi\":\"J2\",\"otros_oi\":\"\",\"avsc_bi\":\"20/20\"}', 'Presbicia con astigmatismo leve', 'Uso de lentes progresivos digitales', '[{\"cristal\":[\"Progresivo digital intermedio\"],\"material\":[\"POLICARBONATO\",\"FOTOCROMATICO_BLUE_BLOCK\",\"Trivex\"],\"montura\":\"Acetato\",\"cristalSugerido\":\"Progresivo digital amplio\",\"observaciones\":\"Se recomienda uso en ambientes con luz artificial prolongada\"}]', 'PACIENTE CONFORME CON LA EXPLICACION REALIZADA POR EL ASESOR SOBRE LAS VENTAJAS Y DESVENTAJAS DE LOS DIFERENTES TIPOS DE CRISTALES Y MATERIAL DE MONTURA, NO SE ACEPTARAN MODIFICACIONES LUEGO DE HABER RECIBIDO LA INFORMACION Y FIRMADA LA HISTORIA POR EL PACIENTE.', NULL, NULL, '25409904', '25409904', '2025-08-12 02:47:38', '2025-08-12 02:47:38', NULL),
(11, 'H-20250812-002', '2025-08-12', 'guarenas-25409904', 'Fatiga visual|Dificultad visual cerca', '', 'Alguno', '2025-08-10', '25409904', '{\"esf_od\":\"+1.00\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"av_lejos_od\":\"20/30\",\"av_cerca_od\":\"J3\",\"av_lejos_bi\":\"20/25\",\"av_bi\":\"J2\",\"esf_oi\":\"+1.25\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"av_lejos_oi\":\"20/30\",\"av_cerca_oi\":\"J3\",\"av_cerca_bi\":\"J2\"}', '{\"esf_od\":\"+1.25\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"avccl_od\":\"20/25\",\"avccc_od\":\"J2\",\"avccl_bi\":\"20/20\",\"avccc_bi\":\"J1\",\"esf_oi\":\"+1.50\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"avccl_oi\":\"20/25\",\"avccc_oi\":\"J2\"}', '{\"esf_od\":\"+1.25\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"alt_od\":\"3\",\"dp_od\":\"64\",\"esf_oi\":\"+1.50\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"alt_oi\":\"3\",\"dp_oi\":\"64\"}', '{\"avsc_od\":\"20/25\",\"avae_od\":\"J2\",\"otros_od\":\"\",\"avsc_oi\":\"20/25\",\"avae_oi\":\"J2\",\"otros_oi\":\"\",\"avsc_bi\":\"20/20\"}', 'Presbicia con astigmatismo leve', 'Uso de lentes progresivos digitales', '[{\"cristal\":[\"Progresivo digital intermedio\"],\"material\":[\"POLICARBONATO\",\"FOTOCROMATICO_BLUE_BLOCK\",\"Trivex\"],\"montura\":\"Acetato\",\"cristalSugerido\":\"Progresivo digital amplio\",\"observaciones\":\"Se recomienda uso en ambientes con luz artificial prolongada\"}]', 'PACIENTE CONFORME CON LA EXPLICACION REALIZADA POR EL ASESOR SOBRE LAS VENTAJAS Y DESVENTAJAS DE LOS DIFERENTES TIPOS DE CRISTALES Y MATERIAL DE MONTURA, NO SE ACEPTARAN MODIFICACIONES LUEGO DE HABER RECIBIDO LA INFORMACION Y FIRMADA LA HISTORIA POR EL PACIENTE.', NULL, NULL, '25409904', '25409904', '2025-08-12 02:47:53', '2025-08-12 02:47:53', NULL),
(12, 'H-20250812-003', '2025-08-12', 'guarenas-25409904', 'asdadasd|Dificultad visual cerca', '', 'Alguno', '2025-08-10', '25409904', '{\"esf_od\":\"+1.00\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"av_lejos_od\":\"20/30\",\"av_cerca_od\":\"J3\",\"av_lejos_bi\":\"20/25\",\"av_bi\":\"J2\",\"esf_oi\":\"+1.25\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"av_lejos_oi\":\"20/30\",\"av_cerca_oi\":\"J3\",\"av_cerca_bi\":\"J2\"}', '{\"esf_od\":\"+1.25\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"avccl_od\":\"20/25\",\"avccc_od\":\"J2\",\"avccl_bi\":\"20/20\",\"avccc_bi\":\"J1\",\"esf_oi\":\"+1.50\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"avccl_oi\":\"20/25\",\"avccc_oi\":\"J2\"}', '{\"esf_od\":\"+1.25\",\"cil_od\":\"-0.50\",\"eje_od\":\"90\",\"add_od\":\"+2.00\",\"alt_od\":\"3\",\"dp_od\":\"64\",\"esf_oi\":\"+1.50\",\"cil_oi\":\"-0.75\",\"eje_oi\":\"180\",\"add_oi\":\"+2.00\",\"alt_oi\":\"3\",\"dp_oi\":\"64\"}', '{\"avsc_od\":\"20/25\",\"avae_od\":\"J2\",\"otros_od\":\"\",\"avsc_oi\":\"20/25\",\"avae_oi\":\"J2\",\"otros_oi\":\"\",\"avsc_bi\":\"20/20\"}', 'Presbicia con astigmatismo leve', 'Uso de lentes progresivos digitales', '[{\"cristal\":[\"Progresivo digital intermedio\"],\"material\":[\"POLICARBONATO\",\"FOTOCROMATICO_BLUE_BLOCK\",\"Trivex\"],\"montura\":\"Acetato\",\"cristalSugerido\":\"Progresivo digital amplio\",\"observaciones\":\"Se recomienda uso en ambientes con luz artificial prolongada\"}]', 'PACIENTE CONFORME CON LA EXPLICACION REALIZADA POR EL ASESOR SOBRE LAS VENTAJAS Y DESVENTAJAS DE LOS DIFERENTES TIPOS DE CRISTALES Y MATERIAL DE MONTURA, NO SE ACEPTARAN MODIFICACIONES LUEGO DE HABER RECIBIDO LA INFORMACION Y FIRMADA LA HISTORIA POR EL PACIENTE.', NULL, NULL, '25409904', '25409904', '2025-08-12 02:47:58', '2025-08-12 02:49:02', NULL);

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
(13, 'guarenas', '25409904', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZWRlX2lkIjoiZ3VhcmVuYXMiLCJ1c2VyQ2VkdWxhIjoiMjU0MDk5MDQiLCJpYXQiOjE3NTY0NTk5NDEsImV4cCI6MTc1NjU0NjM0MX0.MLdTduWPJh81vOS1_v1wvWNjvkq4CJwK9WYcxWEcV78', '::1', '2025-08-29 09:32:21', '2025-08-29 09:32:21');

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
  `pkey` varchar(70) DEFAULT NULL,
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
  `patologia_ocular` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id`, `pkey`, `sede_id`, `cedula`, `sin_cedula`, `nombre`, `fecha_nacimiento`, `telefono`, `email`, `ocupacion`, `genero`, `direccion`, `redes_sociales`, `tiene_lentes`, `fotofobia`, `uso_dispositivo_electronico`, `traumatismo_ocular`, `traumatismo_ocular_descripcion`, `cirugia_ocular`, `cirugia_ocular_descripcion`, `alergias`, `antecedentes_personales`, `antecedentes_familiares`, `patologias`, `patologia_ocular`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'a1ce1e1fb5b77d7aff14e2847501b859', 'guarenas', '25409904', 1, 'Jefferson Torres', '1996-06-11', '04241738615', 'jefersonugas@gmail.com', 'Ingeniero de Sistemas', 'm', 'Guatire, Castillejo, en una casa.', '[{\"platform\":\"Facebook\",\"username\":\"maria.gonzalez\"},{\"platform\":\"Instagram\",\"username\":\"@maria.g\"}]', 'Si', NULL, 'Si, 3 a 6 horas', NULL, NULL, NULL, NULL, NULL, '', '', 'a|b|c', '', '2025-07-23 07:32:52', '2025-08-29 09:47:52', NULL),
(10, '727a0c9dae6ca03d794f21569f85ef84', 'guarenas', '25409904', 1, 'Ruben Martinez', '2025-07-01', '04123920817', 'rubemm18@gmail.com', 'fgdfgdf', 'm', 'Las rosas, conj res, country villas', '[{\"platform\":\"Instagram\",\"username\":\"asdadasda\"}]', 'Sí', 'No', 'Si, 3 a 6 horas', 'No', NULL, 'Sí', 'catarata', NULL, '', 'Diabetes', 'Astigmatismo|Miopía', '', '2025-08-29 09:37:33', '2025-08-29 09:37:33', NULL);

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
(4, 'admin', 'gerente', '25409904', 'Jefferson Torres', '$2b$10$7KuJRh76glMvnAPw7l.S9ebE2y6lalWWui7R3Znwyjk4pqStyPnOy', 'jeffersonjtorresu@gmail.com', '04128977574', '1996-06-11', NULL, NULL, 1, '2025-03-28 18:31:30', '2025-06-14 01:44:37', NULL),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `historial_rastreo_bcv`
--
ALTER TABLE `historial_rastreo_bcv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `logins`
--
ALTER TABLE `logins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `otps`
--
ALTER TABLE `otps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
