-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-12-2024 a las 02:38:31
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clinica_el_rosal (unica)`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `id` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `id_consultorio` int(11) NOT NULL,
  `motivo_consulta` text NOT NULL,
  `id_receta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`id`, `id_persona`, `id_medico`, `id_consultorio`, `motivo_consulta`, `id_receta`) VALUES
(2, 2, 2, 3, 'cita medicina general', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consultorio`
--

CREATE TABLE `consultorio` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `ubicacion` varchar(100) NOT NULL,
  `capacidad` int(11) NOT NULL,
  `telefono` varchar(14) NOT NULL,
  `especialidad` varchar(100) NOT NULL,
  `estado` enum('activo','inactivo','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `consultorio`
--

INSERT INTO `consultorio` (`id`, `nombre`, `ubicacion`, `capacidad`, `telefono`, `especialidad`, `estado`) VALUES
(2, 'consultorio 2', 'primer piso', 15, '3135678797', 'medicina general', 'activo'),
(3, 'consultorio 3', 'primer piso', 15, '3144444444', 'nutriologia', 'activo'),
(5, 'rayos x', 'segundo piso', 5, '3135678797', 'radiologia', 'activo'),
(6, 'muestra de sangre', 'segundo piso', 16, '2342342324', 'medicina preventiva', 'activo'),
(7, 'odontologia', 'segundo piso', 10, '32123232', 'medicina interna', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id` int(11) NOT NULL,
  `nombre_departamento` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id`, `nombre_departamento`) VALUES
(5, 'Región ANTIOQUIA'),
(8, 'Región ATLÁNTICO'),
(11, 'BOGOTÁ, D.C.'),
(13, 'Zona Caribe'),
(15, 'BOYACÁ'),
(17, 'CALDAS'),
(18, 'CAQUETÁ'),
(19, 'CAUCA'),
(20, 'CESAR'),
(23, 'Zona Caribe'),
(25, 'CUNDINAMARCA - Región Central'),
(27, 'CHOCÓ'),
(41, 'HUILA'),
(44, 'Zona Caribe'),
(47, 'Zona Caribe'),
(50, 'META'),
(52, 'NARIÑO'),
(54, 'NORTE DE SANTANDER'),
(63, 'QUINDIO'),
(66, 'RISARALDA'),
(68, 'SANTANDER'),
(70, 'Zona Caribe'),
(73, 'TOLIMA'),
(76, 'VALLE DEL CAUCA'),
(81, 'Región ARAUCA'),
(85, 'CASANARE'),
(86, 'PUTUMAYO'),
(88, 'Región ARCHIPIÉLAGO DE SAN ANDRÉS, PROVIDENCIA Y SANTA CATALINA'),
(91, 'Región AMAZONAS'),
(94, 'GUAINÍA'),
(95, 'GUAVIARE'),
(97, 'VAUPÉS'),
(99, 'VICHADA ACTUALIZADO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_examenes`
--

CREATE TABLE `detalle_examenes` (
  `id` int(11) NOT NULL,
  `id_cita` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `nota_medica` text NOT NULL,
  `fecha_examen` date NOT NULL,
  `resultados` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_examenes`
--

INSERT INTO `detalle_examenes` (`id`, `id_cita`, `id_servicio`, `nota_medica`, `fecha_examen`, `resultados`) VALUES
(1, 2, 3, 'Examen de Oftalmología', '2024-10-30', 'En los exámenes se reflejaron que el paciente cuenta con Miopía avanzada sin mejora, pero el astigmatismo se ha mejorado de 1.5 a 0.5'),
(2, 2, 2, 'Escaner de Rayos X para evitar cualquier problema de fracturas', '2024-10-30', 'En el examen no se muestra ningún tipo de fractura, pero si cuenta con múltiples golpes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `id` int(11) NOT NULL,
  `nombre_especialidad` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`id`, `nombre_especialidad`) VALUES
(1, 'Pediatria'),
(2, 'Medicina Interna'),
(3, 'Dietetica y nutricion'),
(4, 'Fisioterapeuta'),
(5, 'Radiologo'),
(6, 'Ortopedia y Traumatologia'),
(7, 'Odontologia'),
(8, 'Medicina General'),
(9, 'Oftamologia'),
(10, 'Ginecologia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historia`
--

CREATE TABLE `historia` (
  `id` int(11) NOT NULL,
  `fecha_visita` date NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `diagnostico` text NOT NULL,
  `observaciones` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historia`
--

INSERT INTO `historia` (`id`, `fecha_visita`, `id_persona`, `id_medico`, `diagnostico`, `observaciones`) VALUES
(2, '2024-10-30', 2, 2, 'Cuadro de virosis con vomito y malestar General', 'Se presenta el paciente con un cuadro de virosis del cual se ve reflejado con mucha frecuencia el vomito y tiene mucho malestar general y ha tenido ese cuadro desde aproximadamente 8 dias '),
(4, '2024-10-30', 5, 9, 'Resequedad del ojo derecho', 'Se le proporciono al paciente la revision del ojo y se pudo encontrar que tenia mucha resequedad en el ojo derecho sabiendo esto se le suministro unas recetas con el fin de poder ver mejora '),
(5, '2024-10-30', 7, 7, 'Extraccion de Cordales', 'Se le extrajo con Exito cada una de las cordales y esperemos su buena recuperacion y nos volvemos a ver dentro de 15 dias para ver la evolucion que muestra'),
(7, '2024-08-04', 4, 8, 'Hipertenso', 'Asiste paciente con examenes del cual se diagnostica que es hipertenso y se le suministra sus medicamentos necesarios para controlarla ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `id` int(11) NOT NULL,
  `dia` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `id_medico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`id`, `dia`, `hora_inicio`, `hora_fin`, `id_medico`) VALUES
(1, '2024-12-30', '08:20:00', '09:25:00', 1),
(2, '2024-09-16', '08:20:00', '09:25:00', 2),
(3, '2024-08-09', '09:30:00', '10:25:00', 1),
(4, '2024-04-24', '08:30:00', '09:30:00', 6),
(5, '2024-05-01', '08:20:00', '09:25:00', 9),
(6, '2024-04-20', '08:30:00', '09:30:00', 7),
(7, '2024-01-08', '09:35:00', '10:25:00', 7),
(8, '2024-03-25', '10:30:00', '11:30:00', 1),
(9, '2024-04-06', '08:20:00', '09:25:00', 10),
(10, '2024-06-30', '09:30:00', '10:30:00', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `id_modo_uso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicamentos`
--

INSERT INTO `medicamentos` (`id`, `nombre`, `id_modo_uso`) VALUES
(1, 'paracetamol', 1),
(2, 'acetaminofén', 2),
(3, 'Liposomal Vitamin C', 3),
(4, 'Systane Gel Drops Gotas Oftálmicas Lubricantes ', 4),
(5, 'naproxeno', 5),
(6, 'diclofenaco', 6),
(7, 'Losartan y Metroporol', 7),
(8, 'Actromadol y Naproxeno', 8),
(9, 'Active Burner', 9),
(10, 'Flanax', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medico`
--

CREATE TABLE `medico` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `licencia_medica` varchar(100) NOT NULL,
  `id_especialidad` int(11) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `direccion` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medico`
--

INSERT INTO `medico` (`id`, `nombre`, `apellidos`, `telefono`, `licencia_medica`, `id_especialidad`, `correo`, `direccion`) VALUES
(1, 'brayan', 'parra', '111222333', '1153665363', 1, 'brayan@outlook.com', 'calle90#09'),
(2, 'lina', 'lopez', '111111111', '1213121321', 2, 'lina123@gmail.com', 'calle 67#6575'),
(3, 'mailin', 'serrano', '3145656451', '1902102910', 8, 'mailin123@gmail.com', 'calle65#676'),
(4, 'alejandro', 'alfonso', '32123232', '1234345344', 4, 'alendro@gmail.com', 'calle45#87este'),
(5, 'allison', 'perez', '3135678793', '121232145', 5, 'allison@gmail.com', 'calle56#65'),
(6, 'leon', 'panche', '321232454', '1004565678', 6, 'leon@gmail.com', 'calle45#87sur'),
(7, 'jhon', 'tovar', '3135467565', '999999999', 7, 'jhon@gmail.com', 'calle45#78'),
(8, 'stiven', 'leon', '321235467', '1234567891', 8, 'stiven@gmail.com', 'calle45#99'),
(9, 'camilo', 'uribe', '123432154654', '454567678', 9, 'camilo@gmail.com', 'calle65#676'),
(10, 'luz', 'lopez', '34565789', '4356565676', 10, 'luz@gamil.com', 'calle59sur#78b-17');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modo_uso`
--

CREATE TABLE `modo_uso` (
  `id` int(11) NOT NULL,
  `nombre_modo` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `modo_uso`
--

INSERT INTO `modo_uso` (`id`, `nombre_modo`) VALUES
(1, 'Tomar 1 comprimido cada 4-6 horas, según necesidad, hasta un máximo de 6 comprimidos al día. No tomar más de 3 gramos de paracetamol en 24 horas. Las tomas deben espaciarse al menos 4 horas.'),
(2, 'acetaminofeno cada 4 a 6 horas según sea necesario. No administre más de 4 dosis en 24 horas'),
(3, 'suplemento para subir las defensas tomar 1 vez cada dia'),
(4, 'Gotas para la resequedad (una gota por ojo) cada 8 horas.'),
(5, 'se toma con un vaso lleno de agua cada 8 o 12 horas, según sea necesario.'),
(6, ' diclofenaco se toman usualmente una vez al día, y en raras ocasiones se toman dos veces al día,'),
(7, 'Tomar Losartan Y metroporol todos los dias 2 dos veces al dia '),
(8, 'Se debe tomar antiinflamatorios y Naproxeno cada 8 horas durante 15 dias '),
(9, 'Vitaminas para la quema de grasa y perder peso'),
(10, 'Tomar Antiflamatorios cada 8 horas por 20 dias');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `id_departamento` int(11) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `municipio`
--

INSERT INTO `municipio` (`id`, `nombre`, `id_departamento`, `estado`) VALUES
(1, 'Abriaquí', 5, 0),
(2, 'Acacías', 50, 0),
(3, 'Acandí', 27, 0),
(4, 'Acevedo', 41, 0),
(5, 'Achí', 13, 0),
(6, 'Agrado', 41, 0),
(7, 'Agua de Dios', 25, 0),
(8, 'Aguachica', 20, 0),
(9, 'Aguada', 68, 0),
(10, 'Aguadas', 17, 0),
(11, 'Aguazul', 85, 0),
(12, 'Agustín Codazzi', 20, 0),
(13, 'Aipe', 41, 0),
(14, 'Albania', 18, 0),
(15, 'Albania', 44, 0),
(16, 'Albania', 68, 0),
(17, 'Albán', 25, 0),
(18, 'Albán (San José)', 52, 0),
(19, 'Alcalá', 76, 0),
(20, 'Alejandria', 5, 0),
(21, 'Algarrobo', 47, 0),
(22, 'Algeciras', 41, 0),
(23, 'Almaguer', 19, 0),
(24, 'Almeida', 15, 0),
(25, 'Alpujarra', 73, 0),
(26, 'Altamira', 41, 0),
(27, 'Alto Baudó (Pie de Pato)', 27, 0),
(28, 'Altos del Rosario', 13, 0),
(29, 'Alvarado', 73, 0),
(30, 'Amagá', 5, 0),
(31, 'Amalfi', 5, 0),
(32, 'Ambalema', 73, 0),
(33, 'Anapoima', 25, 0),
(34, 'Ancuya', 52, 0),
(35, 'Andalucía', 76, 0),
(36, 'Andes', 5, 0),
(37, 'Angelópolis', 5, 0),
(38, 'Angostura', 5, 0),
(39, 'Anolaima', 25, 0),
(40, 'Anorí', 5, 0),
(41, 'Anserma', 17, 0),
(42, 'Ansermanuevo', 76, 0),
(43, 'Anzoátegui', 73, 0),
(44, 'Anzá', 5, 0),
(45, 'Apartadó', 5, 0),
(46, 'Apulo', 25, 0),
(47, 'Apía', 66, 0),
(48, 'Aquitania', 15, 0),
(49, 'Aracataca', 47, 0),
(50, 'Aranzazu', 17, 0),
(51, 'Aratoca', 68, 0),
(52, 'Arauca', 81, 0),
(53, 'Arauquita', 81, 0),
(54, 'Arbeláez', 25, 0),
(55, 'Arboleda (Berruecos)', 52, 0),
(56, 'Arboledas', 54, 0),
(57, 'Arboletes', 5, 0),
(58, 'Arcabuco', 15, 0),
(59, 'Arenal', 13, 0),
(60, 'Argelia', 5, 0),
(61, 'Argelia', 19, 0),
(62, 'Argelia', 76, 0),
(63, 'Ariguaní (El Difícil)', 47, 0),
(64, 'Arjona', 13, 0),
(65, 'Armenia', 5, 0),
(66, 'Armenia', 63, 0),
(67, 'Armero (Guayabal)', 73, 0),
(68, 'Arroyohondo', 13, 0),
(69, 'Astrea', 20, 0),
(70, 'Ataco', 73, 0),
(71, 'Atrato (Yuto)', 27, 0),
(72, 'Ayapel', 23, 0),
(73, 'Bagadó', 27, 0),
(74, 'Bahía Solano (Mútis)', 27, 0),
(75, 'Bajo Baudó (Pizarro)', 27, 0),
(76, 'Balboa', 19, 0),
(77, 'Balboa', 66, 0),
(78, 'Baranoa', 8, 0),
(79, 'Baraya', 41, 0),
(80, 'Barbacoas', 52, 0),
(81, 'Barbosa', 5, 0),
(82, 'Barbosa', 68, 0),
(83, 'Barichara', 68, 0),
(84, 'Barranca de Upía', 50, 0),
(85, 'Barrancabermeja', 68, 0),
(86, 'Barrancas', 44, 0),
(87, 'Barranco de Loba', 13, 0),
(88, 'Barranquilla', 8, 0),
(89, 'Becerríl', 20, 0),
(90, 'Belalcázar', 17, 0),
(91, 'Bello', 5, 0),
(92, 'Belmira', 5, 0),
(93, 'Beltrán', 25, 0),
(94, 'Belén', 15, 0),
(95, 'Belén', 52, 0),
(96, 'Belén de Bajirá', 27, 0),
(97, 'Belén de Umbría', 66, 0),
(98, 'Belén de los Andaquíes', 18, 0),
(99, 'Berbeo', 15, 0),
(100, 'Betania', 5, 0),
(101, 'Beteitiva', 15, 0),
(102, 'Betulia', 5, 0),
(103, 'Betulia', 68, 0),
(104, 'Bituima', 25, 0),
(105, 'Boavita', 15, 0),
(106, 'Bochalema', 54, 0),
(107, 'Bogotá D.C.', 11, 0),
(108, 'Bojacá', 25, 0),
(109, 'Bojayá (Bellavista)', 27, 0),
(110, 'Bolívar', 5, 0),
(111, 'Bolívar', 19, 0),
(112, 'Bolívar', 68, 0),
(113, 'Bolívar', 76, 0),
(114, 'Bosconia', 20, 0),
(115, 'Boyacá', 15, 0),
(116, 'Briceño', 5, 0),
(117, 'Briceño', 15, 0),
(118, 'Bucaramanga', 68, 0),
(119, 'Bucarasica', 54, 0),
(120, 'Buenaventura', 76, 0),
(121, 'Buenavista', 15, 0),
(122, 'Buenavista', 23, 0),
(123, 'Buenavista', 63, 0),
(124, 'Buenavista', 70, 0),
(125, 'Buenos Aires', 19, 0),
(126, 'Buesaco', 52, 0),
(127, 'Buga', 76, 0),
(128, 'Bugalagrande', 76, 0),
(129, 'Burítica', 5, 0),
(130, 'Busbanza', 15, 0),
(131, 'Cabrera', 25, 0),
(132, 'Cabrera', 68, 0),
(133, 'Cabuyaro', 50, 0),
(134, 'Cachipay', 25, 0),
(135, 'Caicedo', 5, 0),
(136, 'Caicedonia', 76, 0),
(137, 'Caimito', 70, 0),
(138, 'Cajamarca', 73, 0),
(139, 'Cajibío', 19, 0),
(140, 'Cajicá', 25, 0),
(141, 'Calamar', 13, 0),
(142, 'Calamar', 95, 0),
(143, 'Calarcá', 63, 0),
(144, 'Caldas', 5, 0),
(145, 'Caldas', 15, 0),
(146, 'Caldono', 19, 0),
(147, 'California', 68, 0),
(148, 'Calima (Darién)', 76, 0),
(149, 'Caloto', 19, 0),
(150, 'Calí', 76, 0),
(151, 'Campamento', 5, 0),
(152, 'Campo de la Cruz', 8, 0),
(153, 'Campoalegre', 41, 0),
(154, 'Campohermoso', 15, 0),
(155, 'Canalete', 23, 0),
(156, 'Candelaria', 8, 0),
(157, 'Candelaria', 76, 0),
(158, 'Cantagallo', 13, 0),
(159, 'Cantón de San Pablo', 27, 0),
(160, 'Caparrapí', 25, 0),
(161, 'Capitanejo', 68, 0),
(162, 'Caracolí', 5, 0),
(163, 'Caramanta', 5, 0),
(164, 'Carcasí', 68, 0),
(165, 'Carepa', 5, 0),
(166, 'Carmen de Apicalá', 73, 0),
(167, 'Carmen de Carupa', 25, 0),
(168, 'Carmen de Viboral', 5, 0),
(169, 'Carmen del Darién (CURBARADÓ)', 27, 0),
(170, 'Carolina', 5, 0),
(171, 'Cartagena', 13, 0),
(172, 'Cartagena del Chairá', 18, 0),
(173, 'Cartago', 76, 0),
(174, 'Carurú', 97, 0),
(175, 'Casabianca', 73, 0),
(176, 'Castilla la Nueva', 50, 0),
(177, 'Caucasia', 5, 0),
(178, 'Cañasgordas', 5, 0),
(179, 'Cepita', 68, 0),
(180, 'Cereté', 23, 0),
(181, 'Cerinza', 15, 0),
(182, 'Cerrito', 68, 0),
(183, 'Cerro San Antonio', 47, 0),
(184, 'Chachaguí', 52, 0),
(185, 'Chaguaní', 25, 0),
(186, 'Chalán', 70, 0),
(187, 'Chaparral', 73, 0),
(188, 'Charalá', 68, 0),
(189, 'Charta', 68, 0),
(190, 'Chigorodó', 5, 0),
(191, 'Chima', 68, 0),
(192, 'Chimichagua', 20, 0),
(193, 'Chimá', 23, 0),
(194, 'Chinavita', 15, 0),
(195, 'Chinchiná', 17, 0),
(196, 'Chinácota', 54, 0),
(197, 'Chinú', 23, 0),
(198, 'Chipaque', 25, 0),
(199, 'Chipatá', 68, 0),
(200, 'Chiquinquirá', 15, 0),
(201, 'Chiriguaná', 20, 0),
(202, 'Chiscas', 15, 0),
(203, 'Chita', 15, 0),
(204, 'Chitagá', 54, 0),
(205, 'Chitaraque', 15, 0),
(206, 'Chivatá', 15, 0),
(207, 'Chivolo', 47, 0),
(208, 'Choachí', 25, 0),
(209, 'Chocontá', 25, 0),
(210, 'Chámeza', 85, 0),
(211, 'Chía', 25, 0),
(212, 'Chíquiza', 15, 0),
(213, 'Chívor', 15, 0),
(214, 'Cicuco', 13, 0),
(215, 'Cimitarra', 68, 0),
(216, 'Circasia', 63, 0),
(217, 'Cisneros', 5, 0),
(218, 'Ciénaga', 15, 0),
(219, 'Ciénaga', 47, 0),
(220, 'Ciénaga de Oro', 23, 0),
(221, 'Clemencia', 13, 0),
(222, 'Cocorná', 5, 0),
(223, 'Coello', 73, 0),
(224, 'Cogua', 25, 0),
(225, 'Colombia', 41, 0),
(226, 'Colosó (Ricaurte)', 70, 0),
(227, 'Colón', 86, 0),
(228, 'Colón (Génova)', 52, 0),
(229, 'Concepción', 5, 0),
(230, 'Concepción', 68, 0),
(231, 'Concordia', 5, 0),
(232, 'Concordia', 47, 0),
(233, 'Condoto', 27, 0),
(234, 'Confines', 68, 0),
(235, 'Consaca', 52, 0),
(236, 'Contadero', 52, 0),
(237, 'Contratación', 68, 0),
(238, 'Convención', 54, 0),
(239, 'Copacabana', 5, 0),
(240, 'Coper', 15, 0),
(241, 'Cordobá', 63, 0),
(242, 'Corinto', 19, 0),
(243, 'Coromoro', 68, 0),
(244, 'Corozal', 70, 0),
(245, 'Corrales', 15, 0),
(246, 'Cota', 25, 0),
(247, 'Cotorra', 23, 0),
(248, 'Covarachía', 15, 0),
(249, 'Coveñas', 70, 0),
(250, 'Coyaima', 73, 0),
(251, 'Cravo Norte', 81, 0),
(252, 'Cuaspud (Carlosama)', 52, 0),
(253, 'Cubarral', 50, 0),
(254, 'Cubará', 15, 0),
(255, 'Cucaita', 15, 0),
(256, 'Cucunubá', 25, 0),
(257, 'Cucutilla', 54, 0),
(258, 'Cuitiva', 15, 0),
(259, 'Cumaral', 50, 0),
(260, 'Cumaribo', 99, 0),
(261, 'Cumbal', 52, 0),
(262, 'Cumbitara', 52, 0),
(263, 'Cunday', 73, 0),
(264, 'Curillo', 18, 0),
(265, 'Curití', 68, 0),
(266, 'Curumaní', 20, 0),
(267, 'Cáceres', 5, 0),
(268, 'Cáchira', 54, 0),
(269, 'Cácota', 54, 0),
(270, 'Cáqueza', 25, 0),
(271, 'Cértegui', 27, 0),
(272, 'Cómbita', 15, 0),
(273, 'Córdoba', 13, 0),
(274, 'Córdoba', 52, 0),
(275, 'Cúcuta', 54, 0),
(276, 'Dabeiba', 5, 0),
(277, 'Dagua', 76, 0),
(278, 'Dibulla', 44, 0),
(279, 'Distracción', 44, 0),
(280, 'Dolores', 73, 0),
(281, 'Don Matías', 5, 0),
(282, 'Dos Quebradas', 66, 0),
(283, 'Duitama', 15, 0),
(284, 'Durania', 54, 0),
(285, 'Ebéjico', 5, 0),
(286, 'El Bagre', 5, 0),
(287, 'El Banco', 47, 0),
(288, 'El Cairo', 76, 0),
(289, 'El Calvario', 50, 0),
(290, 'El Carmen', 54, 0),
(291, 'El Carmen', 68, 0),
(292, 'El Carmen de Atrato', 27, 0),
(293, 'El Carmen de Bolívar', 13, 0),
(294, 'El Castillo', 50, 0),
(295, 'El Cerrito', 76, 0),
(296, 'El Charco', 52, 0),
(297, 'El Cocuy', 15, 0),
(298, 'El Colegio', 25, 0),
(299, 'El Copey', 20, 0),
(300, 'El Doncello', 18, 0),
(301, 'El Dorado', 50, 0),
(302, 'El Dovio', 76, 0),
(303, 'El Espino', 15, 0),
(304, 'El Guacamayo', 68, 0),
(305, 'El Guamo', 13, 0),
(306, 'El Molino', 44, 0),
(307, 'El Paso', 20, 0),
(308, 'El Paujil', 18, 0),
(309, 'El Peñol', 52, 0),
(310, 'El Peñon', 13, 0),
(311, 'El Peñon', 68, 0),
(312, 'El Peñón', 25, 0),
(313, 'El Piñon', 47, 0),
(314, 'El Playón', 68, 0),
(315, 'El Retorno', 95, 0),
(316, 'El Retén', 47, 0),
(317, 'El Roble', 70, 0),
(318, 'El Rosal', 25, 0),
(319, 'El Rosario', 52, 0),
(320, 'El Tablón de Gómez', 52, 0),
(321, 'El Tambo', 19, 0),
(322, 'El Tambo', 52, 0),
(323, 'El Tarra', 54, 0),
(324, 'El Zulia', 54, 0),
(325, 'El Águila', 76, 0),
(326, 'Elías', 41, 0),
(327, 'Encino', 68, 0),
(328, 'Enciso', 68, 0),
(329, 'Entrerríos', 5, 0),
(330, 'Envigado', 5, 0),
(331, 'Espinal', 73, 0),
(332, 'Facatativá', 25, 0),
(333, 'Falan', 73, 0),
(334, 'Filadelfia', 17, 0),
(335, 'Filandia', 63, 0),
(336, 'Firavitoba', 15, 0),
(337, 'Flandes', 73, 0),
(338, 'Florencia', 18, 0),
(339, 'Florencia', 19, 0),
(340, 'Floresta', 15, 0),
(341, 'Florida', 76, 0),
(342, 'Floridablanca', 68, 0),
(343, 'Florián', 68, 0),
(344, 'Fonseca', 44, 0),
(345, 'Fortúl', 81, 0),
(346, 'Fosca', 25, 0),
(347, 'Francisco Pizarro', 52, 0),
(348, 'Fredonia', 5, 0),
(349, 'Fresno', 73, 0),
(350, 'Frontino', 5, 0),
(351, 'Fuente de Oro', 50, 0),
(352, 'Fundación', 47, 0),
(353, 'Funes', 52, 0),
(354, 'Funza', 25, 0),
(355, 'Fusagasugá', 25, 0),
(356, 'Fómeque', 25, 0),
(357, 'Fúquene', 25, 0),
(358, 'Gachalá', 25, 0),
(359, 'Gachancipá', 25, 0),
(360, 'Gachantivá', 15, 0),
(361, 'Gachetá', 25, 0),
(362, 'Galapa', 8, 0),
(363, 'Galeras (Nueva Granada)', 70, 0),
(364, 'Galán', 68, 0),
(365, 'Gama', 25, 0),
(366, 'Gamarra', 20, 0),
(367, 'Garagoa', 15, 0),
(368, 'Garzón', 41, 0),
(369, 'Gigante', 41, 0),
(370, 'Ginebra', 76, 0),
(371, 'Giraldo', 5, 0),
(372, 'Girardot', 25, 0),
(373, 'Girardota', 5, 0),
(374, 'Girón', 68, 0),
(375, 'Gonzalez', 20, 0),
(376, 'Gramalote', 54, 0),
(377, 'Granada', 5, 0),
(378, 'Granada', 25, 0),
(379, 'Granada', 50, 0),
(380, 'Guaca', 68, 0),
(381, 'Guacamayas', 15, 0),
(382, 'Guacarí', 76, 0),
(383, 'Guachavés', 52, 0),
(384, 'Guachené', 19, 0),
(385, 'Guachetá', 25, 0),
(386, 'Guachucal', 52, 0),
(387, 'Guadalupe', 5, 0),
(388, 'Guadalupe', 41, 0),
(389, 'Guadalupe', 68, 0),
(390, 'Guaduas', 25, 0),
(391, 'Guaitarilla', 52, 0),
(392, 'Gualmatán', 52, 0),
(393, 'Guamal', 47, 0),
(394, 'Guamal', 50, 0),
(395, 'Guamo', 73, 0),
(396, 'Guapota', 68, 0),
(397, 'Guapí', 19, 0),
(398, 'Guaranda', 70, 0),
(399, 'Guarne', 5, 0),
(400, 'Guasca', 25, 0),
(401, 'Guatapé', 5, 0),
(402, 'Guataquí', 25, 0),
(403, 'Guatavita', 25, 0),
(404, 'Guateque', 15, 0),
(405, 'Guavatá', 68, 0),
(406, 'Guayabal de Siquima', 25, 0),
(407, 'Guayabetal', 25, 0),
(408, 'Guayatá', 15, 0),
(409, 'Guepsa', 68, 0),
(410, 'Guicán', 15, 0),
(411, 'Gutiérrez', 25, 0),
(412, 'Guática', 66, 0),
(413, 'Gámbita', 68, 0),
(414, 'Gámeza', 15, 0),
(415, 'Génova', 63, 0),
(416, 'Gómez Plata', 5, 0),
(417, 'Hacarí', 54, 0),
(418, 'Hatillo de Loba', 13, 0),
(419, 'Hato', 68, 0),
(420, 'Hato Corozal', 85, 0),
(421, 'Hatonuevo', 44, 0),
(422, 'Heliconia', 5, 0),
(423, 'Herrán', 54, 0),
(424, 'Herveo', 73, 0),
(425, 'Hispania', 5, 0),
(426, 'Hobo', 41, 0),
(427, 'Honda', 73, 0),
(428, 'Ibagué', 73, 0),
(429, 'Icononzo', 73, 0),
(430, 'Iles', 52, 0),
(431, 'Imúes', 52, 0),
(432, 'Inzá', 19, 0),
(433, 'Inírida', 94, 0),
(434, 'Ipiales', 52, 0),
(435, 'Isnos', 41, 0),
(436, 'Istmina', 27, 0),
(437, 'Itagüí', 5, 0),
(438, 'Ituango', 5, 0),
(439, 'Izá', 15, 0),
(440, 'Jambaló', 19, 0),
(441, 'Jamundí', 76, 0),
(442, 'Jardín', 5, 0),
(443, 'Jenesano', 15, 0),
(444, 'Jericó', 5, 0),
(445, 'Jericó', 15, 0),
(446, 'Jerusalén', 25, 0),
(447, 'Jesús María', 68, 0),
(448, 'Jordán', 68, 0),
(449, 'Juan de Acosta', 8, 0),
(450, 'Junín', 25, 0),
(451, 'Juradó', 27, 0),
(452, 'La Apartada y La Frontera', 23, 0),
(453, 'La Argentina', 41, 0),
(454, 'La Belleza', 68, 0),
(455, 'La Calera', 25, 0),
(456, 'La Capilla', 15, 0),
(457, 'La Ceja', 5, 0),
(458, 'La Celia', 66, 0),
(459, 'La Cruz', 52, 0),
(460, 'La Cumbre', 76, 0),
(461, 'La Dorada', 17, 0),
(462, 'La Esperanza', 54, 0),
(463, 'La Estrella', 5, 0),
(464, 'La Florida', 52, 0),
(465, 'La Gloria', 20, 0),
(466, 'La Jagua de Ibirico', 20, 0),
(467, 'La Jagua del Pilar', 44, 0),
(468, 'La Llanada', 52, 0),
(469, 'La Macarena', 50, 0),
(470, 'La Merced', 17, 0),
(471, 'La Mesa', 25, 0),
(472, 'La Montañita', 18, 0),
(473, 'La Palma', 25, 0),
(474, 'La Paz', 68, 0),
(475, 'La Paz (Robles)', 20, 0),
(476, 'La Peña', 25, 0),
(477, 'La Pintada', 5, 0),
(478, 'La Plata', 41, 0),
(479, 'La Playa', 54, 0),
(480, 'La Primavera', 99, 0),
(481, 'La Salina', 85, 0),
(482, 'La Sierra', 19, 0),
(483, 'La Tebaida', 63, 0),
(484, 'La Tola', 52, 0),
(485, 'La Unión', 5, 0),
(486, 'La Unión', 52, 0),
(487, 'La Unión', 70, 0),
(488, 'La Unión', 76, 0),
(489, 'La Uvita', 15, 0),
(490, 'La Vega', 19, 0),
(491, 'La Vega', 25, 0),
(492, 'La Victoria', 15, 0),
(493, 'La Victoria', 17, 0),
(494, 'La Victoria', 76, 0),
(495, 'La Virginia', 66, 0),
(496, 'Labateca', 54, 0),
(497, 'Labranzagrande', 15, 0),
(498, 'Landázuri', 68, 0),
(499, 'Lebrija', 68, 0),
(500, 'Leiva', 52, 0),
(501, 'Lejanías', 50, 0),
(502, 'Lenguazaque', 25, 0),
(503, 'Leticia', 91, 0),
(504, 'Liborina', 5, 0),
(505, 'Linares', 52, 0),
(506, 'Lloró', 27, 0),
(507, 'Lorica', 23, 0),
(508, 'Los Córdobas', 23, 0),
(509, 'Los Palmitos', 70, 0),
(510, 'Los Patios', 54, 0),
(511, 'Los Santos', 68, 0),
(512, 'Lourdes', 54, 0),
(513, 'Luruaco', 8, 0),
(514, 'Lérida', 73, 0),
(515, 'Líbano', 73, 0),
(516, 'López (Micay)', 19, 0),
(517, 'Macanal', 15, 0),
(518, 'Macaravita', 68, 0),
(519, 'Maceo', 5, 0),
(520, 'Machetá', 25, 0),
(521, 'Madrid', 25, 0),
(522, 'Magangué', 13, 0),
(523, 'Magüi (Payán)', 52, 0),
(524, 'Mahates', 13, 0),
(525, 'Maicao', 44, 0),
(526, 'Majagual', 70, 0),
(527, 'Malambo', 8, 0),
(528, 'Mallama (Piedrancha)', 52, 0),
(529, 'Manatí', 8, 0),
(530, 'Manaure', 44, 0),
(531, 'Manaure Balcón del Cesar', 20, 0),
(532, 'Manizales', 17, 0),
(533, 'Manta', 25, 0),
(534, 'Manzanares', 17, 0),
(535, 'Maní', 85, 0),
(536, 'Mapiripan', 50, 0),
(537, 'Margarita', 13, 0),
(538, 'Marinilla', 5, 0),
(539, 'Maripí', 15, 0),
(540, 'Mariquita', 73, 0),
(541, 'Marmato', 17, 0),
(542, 'Marquetalia', 17, 0),
(543, 'Marsella', 66, 0),
(544, 'Marulanda', 17, 0),
(545, 'María la Baja', 13, 0),
(546, 'Matanza', 68, 0),
(547, 'Medellín', 5, 0),
(548, 'Medina', 25, 0),
(549, 'Medio Atrato', 27, 0),
(550, 'Medio Baudó', 27, 0),
(551, 'Medio San Juan (ANDAGOYA)', 27, 0),
(552, 'Melgar', 73, 0),
(553, 'Mercaderes', 19, 0),
(554, 'Mesetas', 50, 0),
(555, 'Milán', 18, 0),
(556, 'Miraflores', 15, 0),
(557, 'Miraflores', 95, 0),
(558, 'Miranda', 19, 0),
(559, 'Mistrató', 66, 0),
(560, 'Mitú', 97, 0),
(561, 'Mocoa', 86, 0),
(562, 'Mogotes', 68, 0),
(563, 'Molagavita', 68, 0),
(564, 'Momil', 23, 0),
(565, 'Mompós', 13, 0),
(566, 'Mongua', 15, 0),
(567, 'Monguí', 15, 0),
(568, 'Moniquirá', 15, 0),
(569, 'Montebello', 5, 0),
(570, 'Montecristo', 13, 0),
(571, 'Montelíbano', 23, 0),
(572, 'Montenegro', 63, 0),
(573, 'Monteria', 23, 0),
(574, 'Monterrey', 85, 0),
(575, 'Morales', 13, 0),
(576, 'Morales', 19, 0),
(577, 'Morelia', 18, 0),
(578, 'Morroa', 70, 0),
(579, 'Mosquera', 25, 0),
(580, 'Mosquera', 52, 0),
(581, 'Motavita', 15, 0),
(582, 'Moñitos', 23, 0),
(583, 'Murillo', 73, 0),
(584, 'Murindó', 5, 0),
(585, 'Mutatá', 5, 0),
(586, 'Mutiscua', 54, 0),
(587, 'Muzo', 15, 0),
(588, 'Málaga', 68, 0),
(589, 'Nariño', 5, 0),
(590, 'Nariño', 25, 0),
(591, 'Nariño', 52, 0),
(592, 'Natagaima', 73, 0),
(593, 'Nechí', 5, 0),
(594, 'Necoclí', 5, 0),
(595, 'Neira', 17, 0),
(596, 'Neiva', 41, 0),
(597, 'Nemocón', 25, 0),
(598, 'Nilo', 25, 0),
(599, 'Nimaima', 25, 0),
(600, 'Nobsa', 15, 0),
(601, 'Nocaima', 25, 0),
(602, 'Norcasia', 17, 0),
(603, 'Norosí', 13, 0),
(604, 'Novita', 27, 0),
(605, 'Nueva Granada', 47, 0),
(606, 'Nuevo Colón', 15, 0),
(607, 'Nunchía', 85, 0),
(608, 'Nuquí', 27, 0),
(609, 'Nátaga', 41, 0),
(610, 'Obando', 76, 0),
(611, 'Ocamonte', 68, 0),
(612, 'Ocaña', 54, 0),
(613, 'Oiba', 68, 0),
(614, 'Oicatá', 15, 0),
(615, 'Olaya', 5, 0),
(616, 'Olaya Herrera', 52, 0),
(617, 'Onzaga', 68, 0),
(618, 'Oporapa', 41, 0),
(619, 'Orito', 86, 0),
(620, 'Orocué', 85, 0),
(621, 'Ortega', 73, 0),
(622, 'Ospina', 52, 0),
(623, 'Otanche', 15, 0),
(624, 'Ovejas', 70, 0),
(625, 'Pachavita', 15, 0),
(626, 'Pacho', 25, 0),
(627, 'Padilla', 19, 0),
(628, 'Paicol', 41, 0),
(629, 'Pailitas', 20, 0),
(630, 'Paime', 25, 0),
(631, 'Paipa', 15, 0),
(632, 'Pajarito', 15, 0),
(633, 'Palermo', 41, 0),
(634, 'Palestina', 17, 0),
(635, 'Palestina', 41, 0),
(636, 'Palmar', 68, 0),
(637, 'Palmar de Varela', 8, 0),
(638, 'Palmas del Socorro', 68, 0),
(639, 'Palmira', 76, 0),
(640, 'Palmito', 70, 0),
(641, 'Palocabildo', 73, 0),
(642, 'Pamplona', 54, 0),
(643, 'Pamplonita', 54, 0),
(644, 'Pandi', 25, 0),
(645, 'Panqueba', 15, 0),
(646, 'Paratebueno', 25, 0),
(647, 'Pasca', 25, 0),
(648, 'Patía (El Bordo)', 19, 0),
(649, 'Pauna', 15, 0),
(650, 'Paya', 15, 0),
(651, 'Paz de Ariporo', 85, 0),
(652, 'Paz de Río', 15, 0),
(653, 'Pedraza', 47, 0),
(654, 'Pelaya', 20, 0),
(655, 'Pensilvania', 17, 0),
(656, 'Peque', 5, 0),
(657, 'Pereira', 66, 0),
(658, 'Pesca', 15, 0),
(659, 'Peñol', 5, 0),
(660, 'Piamonte', 19, 0),
(661, 'Pie de Cuesta', 68, 0),
(662, 'Piedras', 73, 0),
(663, 'Piendamó', 19, 0),
(664, 'Pijao', 63, 0),
(665, 'Pijiño', 47, 0),
(666, 'Pinchote', 68, 0),
(667, 'Pinillos', 13, 0),
(668, 'Piojo', 8, 0),
(669, 'Pisva', 15, 0),
(670, 'Pital', 41, 0),
(671, 'Pitalito', 41, 0),
(672, 'Pivijay', 47, 0),
(673, 'Planadas', 73, 0),
(674, 'Planeta Rica', 23, 0),
(675, 'Plato', 47, 0),
(676, 'Policarpa', 52, 0),
(677, 'Polonuevo', 8, 0),
(678, 'Ponedera', 8, 0),
(679, 'Popayán', 19, 0),
(680, 'Pore', 85, 0),
(681, 'Potosí', 52, 0),
(682, 'Pradera', 76, 0),
(683, 'Prado', 73, 0),
(684, 'Providencia', 52, 0),
(685, 'Providencia', 88, 0),
(686, 'Pueblo Bello', 20, 0),
(687, 'Pueblo Nuevo', 23, 0),
(688, 'Pueblo Rico', 66, 0),
(689, 'Pueblorrico', 5, 0),
(690, 'Puebloviejo', 47, 0),
(691, 'Puente Nacional', 68, 0),
(692, 'Puerres', 52, 0),
(693, 'Puerto Asís', 86, 0),
(694, 'Puerto Berrío', 5, 0),
(695, 'Puerto Boyacá', 15, 0),
(696, 'Puerto Caicedo', 86, 0),
(697, 'Puerto Carreño', 99, 0),
(698, 'Puerto Colombia', 8, 0),
(699, 'Puerto Concordia', 50, 0),
(700, 'Puerto Escondido', 23, 0),
(701, 'Puerto Gaitán', 50, 0),
(702, 'Puerto Guzmán', 86, 0),
(703, 'Puerto Leguízamo', 86, 0),
(704, 'Puerto Libertador', 23, 0),
(705, 'Puerto Lleras', 50, 0),
(706, 'Puerto López', 50, 0),
(707, 'Puerto Nare', 5, 0),
(708, 'Puerto Nariño', 91, 0),
(709, 'Puerto Parra', 68, 0),
(710, 'Puerto Rico', 18, 0),
(711, 'Puerto Rico', 50, 0),
(712, 'Puerto Rondón', 81, 0),
(713, 'Puerto Salgar', 25, 0),
(714, 'Puerto Santander', 54, 0),
(715, 'Puerto Tejada', 19, 0),
(716, 'Puerto Triunfo', 5, 0),
(717, 'Puerto Wilches', 68, 0),
(718, 'Pulí', 25, 0),
(719, 'Pupiales', 52, 0),
(720, 'Puracé (Coconuco)', 19, 0),
(721, 'Purificación', 73, 0),
(722, 'Purísima', 23, 0),
(723, 'Pácora', 17, 0),
(724, 'Páez', 15, 0),
(725, 'Páez (Belalcazar)', 19, 0),
(726, 'Páramo', 68, 0),
(727, 'Quebradanegra', 25, 0),
(728, 'Quetame', 25, 0),
(729, 'Quibdó', 27, 0),
(730, 'Quimbaya', 63, 0),
(731, 'Quinchía', 66, 0),
(732, 'Quipama', 15, 0),
(733, 'Quipile', 25, 0),
(734, 'Ragonvalia', 54, 0),
(735, 'Ramiriquí', 15, 0),
(736, 'Recetor', 85, 0),
(737, 'Regidor', 13, 0),
(738, 'Remedios', 5, 0),
(739, 'Remolino', 47, 0),
(740, 'Repelón', 8, 0),
(741, 'Restrepo', 50, 0),
(742, 'Restrepo', 76, 0),
(743, 'Retiro', 5, 0),
(744, 'Ricaurte', 25, 0),
(745, 'Ricaurte', 52, 0),
(746, 'Rio Negro', 68, 0),
(747, 'Rioblanco', 73, 0),
(748, 'Riofrío', 76, 0),
(749, 'Riohacha', 44, 0),
(750, 'Risaralda', 17, 0),
(751, 'Rivera', 41, 0),
(752, 'Roberto Payán (San José)', 52, 0),
(753, 'Roldanillo', 76, 0),
(754, 'Roncesvalles', 73, 0),
(755, 'Rondón', 15, 0),
(756, 'Rosas', 19, 0),
(757, 'Rovira', 73, 0),
(758, 'Ráquira', 15, 0),
(759, 'Río Iró', 27, 0),
(760, 'Río Quito', 27, 0),
(761, 'Río Sucio', 17, 0),
(762, 'Río Viejo', 13, 0),
(763, 'Río de oro', 20, 0),
(764, 'Ríonegro', 5, 0),
(765, 'Ríosucio', 27, 0),
(766, 'Sabana de Torres', 68, 0),
(767, 'Sabanagrande', 8, 0),
(768, 'Sabanalarga', 5, 0),
(769, 'Sabanalarga', 8, 0),
(770, 'Sabanalarga', 85, 0),
(771, 'Sabanas de San Angel (SAN ANGEL)', 47, 0),
(772, 'Sabaneta', 5, 0),
(773, 'Saboyá', 15, 0),
(774, 'Sahagún', 23, 0),
(775, 'Saladoblanco', 41, 0),
(776, 'Salamina', 17, 0),
(777, 'Salamina', 47, 0),
(778, 'Salazar', 54, 0),
(779, 'Saldaña', 73, 0),
(780, 'Salento', 63, 0),
(781, 'Salgar', 5, 0),
(782, 'Samacá', 15, 0),
(783, 'Samaniego', 52, 0),
(784, 'Samaná', 17, 0),
(785, 'Sampués', 70, 0),
(786, 'San Agustín', 41, 0),
(787, 'San Alberto', 20, 0),
(788, 'San Andrés', 68, 0),
(789, 'San Andrés Sotavento', 23, 0),
(790, 'San Andrés de Cuerquía', 5, 0),
(791, 'San Antero', 23, 0),
(792, 'San Antonio', 73, 0),
(793, 'San Antonio de Tequendama', 25, 0),
(794, 'San Benito', 68, 0),
(795, 'San Benito Abad', 70, 0),
(796, 'San Bernardo', 25, 0),
(797, 'San Bernardo', 52, 0),
(798, 'San Bernardo del Viento', 23, 0),
(799, 'San Calixto', 54, 0),
(800, 'San Carlos', 5, 0),
(801, 'San Carlos', 23, 0),
(802, 'San Carlos de Guaroa', 50, 0),
(803, 'San Cayetano', 25, 0),
(804, 'San Cayetano', 54, 0),
(805, 'San Cristobal', 13, 0),
(806, 'San Diego', 20, 0),
(807, 'San Eduardo', 15, 0),
(808, 'San Estanislao', 13, 0),
(809, 'San Fernando', 13, 0),
(810, 'San Francisco', 5, 0),
(811, 'San Francisco', 25, 0),
(812, 'San Francisco', 86, 0),
(813, 'San Gíl', 68, 0),
(814, 'San Jacinto', 13, 0),
(815, 'San Jacinto del Cauca', 13, 0),
(816, 'San Jerónimo', 5, 0),
(817, 'San Joaquín', 68, 0),
(818, 'San José', 17, 0),
(819, 'San José de Miranda', 68, 0),
(820, 'San José de Montaña', 5, 0),
(821, 'San José de Pare', 15, 0),
(822, 'San José de Uré', 23, 0),
(823, 'San José del Fragua', 18, 0),
(824, 'San José del Guaviare', 95, 0),
(825, 'San José del Palmar', 27, 0),
(826, 'San Juan de Arama', 50, 0),
(827, 'San Juan de Betulia', 70, 0),
(828, 'San Juan de Nepomuceno', 13, 0),
(829, 'San Juan de Pasto', 52, 0),
(830, 'San Juan de Río Seco', 25, 0),
(831, 'San Juan de Urabá', 5, 0),
(832, 'San Juan del Cesar', 44, 0),
(833, 'San Juanito', 50, 0),
(834, 'San Lorenzo', 52, 0),
(835, 'San Luis', 73, 0),
(836, 'San Luís', 5, 0),
(837, 'San Luís de Gaceno', 15, 0),
(838, 'San Luís de Palenque', 85, 0),
(839, 'San Marcos', 70, 0),
(840, 'San Martín', 20, 0),
(841, 'San Martín', 50, 0),
(842, 'San Martín de Loba', 13, 0),
(843, 'San Mateo', 15, 0),
(844, 'San Miguel', 68, 0),
(845, 'San Miguel', 86, 0),
(846, 'San Miguel de Sema', 15, 0),
(847, 'San Onofre', 70, 0),
(848, 'San Pablo', 13, 0),
(849, 'San Pablo', 52, 0),
(850, 'San Pablo de Borbur', 15, 0),
(851, 'San Pedro', 5, 0),
(852, 'San Pedro', 70, 0),
(853, 'San Pedro', 76, 0),
(854, 'San Pedro de Cartago', 52, 0),
(855, 'San Pedro de Urabá', 5, 0),
(856, 'San Pelayo', 23, 0),
(857, 'San Rafael', 5, 0),
(858, 'San Roque', 5, 0),
(859, 'San Sebastián', 19, 0),
(860, 'San Sebastián de Buenavista', 47, 0),
(861, 'San Vicente', 5, 0),
(862, 'San Vicente del Caguán', 18, 0),
(863, 'San Vicente del Chucurí', 68, 0),
(864, 'San Zenón', 47, 0),
(865, 'Sandoná', 52, 0),
(866, 'Santa Ana', 47, 0),
(867, 'Santa Bárbara', 5, 0),
(868, 'Santa Bárbara', 68, 0),
(869, 'Santa Bárbara (Iscuandé)', 52, 0),
(870, 'Santa Bárbara de Pinto', 47, 0),
(871, 'Santa Catalina', 13, 0),
(872, 'Santa Fé de Antioquia', 5, 0),
(873, 'Santa Genoveva de Docorodó', 27, 0),
(874, 'Santa Helena del Opón', 68, 0),
(875, 'Santa Isabel', 73, 0),
(876, 'Santa Lucía', 8, 0),
(877, 'Santa Marta', 47, 0),
(878, 'Santa María', 15, 0),
(879, 'Santa María', 41, 0),
(880, 'Santa Rosa', 13, 0),
(881, 'Santa Rosa', 19, 0),
(882, 'Santa Rosa de Cabal', 66, 0),
(883, 'Santa Rosa de Osos', 5, 0),
(884, 'Santa Rosa de Viterbo', 15, 0),
(885, 'Santa Rosa del Sur', 13, 0),
(886, 'Santa Rosalía', 99, 0),
(887, 'Santa Sofía', 15, 0),
(888, 'Santana', 15, 0),
(889, 'Santander de Quilichao', 19, 0),
(890, 'Santiago', 54, 0),
(891, 'Santiago', 86, 0),
(892, 'Santo Domingo', 5, 0),
(893, 'Santo Tomás', 8, 0),
(894, 'Santuario', 5, 0),
(895, 'Santuario', 66, 0),
(896, 'Sapuyes', 52, 0),
(897, 'Saravena', 81, 0),
(898, 'Sardinata', 54, 0),
(899, 'Sasaima', 25, 0),
(900, 'Sativanorte', 15, 0),
(901, 'Sativasur', 15, 0),
(902, 'Segovia', 5, 0),
(903, 'Sesquilé', 25, 0),
(904, 'Sevilla', 76, 0),
(905, 'Siachoque', 15, 0),
(906, 'Sibaté', 25, 0),
(907, 'Sibundoy', 86, 0),
(908, 'Silos', 54, 0),
(909, 'Silvania', 25, 0),
(910, 'Silvia', 19, 0),
(911, 'Simacota', 68, 0),
(912, 'Simijaca', 25, 0),
(913, 'Simití', 13, 0),
(914, 'Sincelejo', 70, 0),
(915, 'Sincé', 70, 0),
(916, 'Sipí', 27, 0),
(917, 'Sitionuevo', 47, 0),
(918, 'Soacha', 25, 0),
(919, 'Soatá', 15, 0),
(920, 'Socha', 15, 0),
(921, 'Socorro', 68, 0),
(922, 'Socotá', 15, 0),
(923, 'Sogamoso', 15, 0),
(924, 'Solano', 18, 0),
(925, 'Soledad', 8, 0),
(926, 'Solita', 18, 0),
(927, 'Somondoco', 15, 0),
(928, 'Sonsón', 5, 0),
(929, 'Sopetrán', 5, 0),
(930, 'Soplaviento', 13, 0),
(931, 'Sopó', 25, 0),
(932, 'Sora', 15, 0),
(933, 'Soracá', 15, 0),
(934, 'Sotaquirá', 15, 0),
(935, 'Sotara (Paispamba)', 19, 0),
(936, 'Sotomayor (Los Andes)', 52, 0),
(937, 'Suaita', 68, 0),
(938, 'Suan', 8, 0),
(939, 'Suaza', 41, 0),
(940, 'Subachoque', 25, 0),
(941, 'Sucre', 19, 0),
(942, 'Sucre', 68, 0),
(943, 'Sucre', 70, 0),
(944, 'Suesca', 25, 0),
(945, 'Supatá', 25, 0),
(946, 'Supía', 17, 0),
(947, 'Suratá', 68, 0),
(948, 'Susa', 25, 0),
(949, 'Susacón', 15, 0),
(950, 'Sutamarchán', 15, 0),
(951, 'Sutatausa', 25, 0),
(952, 'Sutatenza', 15, 0),
(953, 'Suárez', 19, 0),
(954, 'Suárez', 73, 0),
(955, 'Sácama', 85, 0),
(956, 'Sáchica', 15, 0),
(957, 'Tabio', 25, 0),
(958, 'Tadó', 27, 0),
(959, 'Talaigua Nuevo', 13, 0),
(960, 'Tamalameque', 20, 0),
(961, 'Tame', 81, 0),
(962, 'Taminango', 52, 0),
(963, 'Tangua', 52, 0),
(964, 'Taraira', 97, 0),
(965, 'Tarazá', 5, 0),
(966, 'Tarqui', 41, 0),
(967, 'Tarso', 5, 0),
(968, 'Tasco', 15, 0),
(969, 'Tauramena', 85, 0),
(970, 'Tausa', 25, 0),
(971, 'Tello', 41, 0),
(972, 'Tena', 25, 0),
(973, 'Tenerife', 47, 0),
(974, 'Tenjo', 25, 0),
(975, 'Tenza', 15, 0),
(976, 'Teorama', 54, 0),
(977, 'Teruel', 41, 0),
(978, 'Tesalia', 41, 0),
(979, 'Tibacuy', 25, 0),
(980, 'Tibaná', 15, 0),
(981, 'Tibasosa', 15, 0),
(982, 'Tibirita', 25, 0),
(983, 'Tibú', 54, 0),
(984, 'Tierralta', 23, 0),
(985, 'Timaná', 41, 0),
(986, 'Timbiquí', 19, 0),
(987, 'Timbío', 19, 0),
(988, 'Tinjacá', 15, 0),
(989, 'Tipacoque', 15, 0),
(990, 'Tiquisio (Puerto Rico)', 13, 0),
(991, 'Titiribí', 5, 0),
(992, 'Toca', 15, 0),
(993, 'Tocaima', 25, 0),
(994, 'Tocancipá', 25, 0),
(995, 'Toguí', 15, 0),
(996, 'Toledo', 5, 0),
(997, 'Toledo', 54, 0),
(998, 'Tolú', 70, 0),
(999, 'Tolú Viejo', 70, 0),
(1000, 'Tona', 68, 0),
(1001, 'Topagá', 15, 0),
(1002, 'Topaipí', 25, 0),
(1003, 'Toribío', 19, 0),
(1004, 'Toro', 76, 0),
(1005, 'Tota', 15, 0),
(1006, 'Totoró', 19, 0),
(1007, 'Trinidad', 85, 0),
(1008, 'Trujillo', 76, 0),
(1009, 'Tubará', 8, 0),
(1010, 'Tuchín', 23, 0),
(1011, 'Tulúa', 76, 0),
(1012, 'Tumaco', 52, 0),
(1013, 'Tunja', 15, 0),
(1014, 'Tunungua', 15, 0),
(1015, 'Turbaco', 13, 0),
(1016, 'Turbaná', 13, 0),
(1017, 'Turbo', 5, 0),
(1018, 'Turmequé', 15, 0),
(1019, 'Tuta', 15, 0),
(1020, 'Tutasá', 15, 0),
(1021, 'Támara', 85, 0),
(1022, 'Támesis', 5, 0),
(1023, 'Túquerres', 52, 0),
(1024, 'Ubalá', 25, 0),
(1025, 'Ubaque', 25, 0),
(1026, 'Ubaté', 25, 0),
(1027, 'Ulloa', 76, 0),
(1028, 'Une', 25, 0),
(1029, 'Unguía', 27, 0),
(1030, 'Unión Panamericana (ÁNIMAS)', 27, 0),
(1031, 'Uramita', 5, 0),
(1032, 'Uribe', 50, 0),
(1033, 'Uribia', 44, 0),
(1034, 'Urrao', 5, 0),
(1035, 'Urumita', 44, 0),
(1036, 'Usiacuri', 8, 0),
(1037, 'Valdivia', 5, 0),
(1038, 'Valencia', 23, 0),
(1039, 'Valle de San José', 68, 0),
(1040, 'Valle de San Juan', 73, 0),
(1041, 'Valle del Guamuez', 86, 0),
(1042, 'Valledupar', 20, 0),
(1043, 'Valparaiso', 5, 0),
(1044, 'Valparaiso', 18, 0),
(1045, 'Vegachí', 5, 0),
(1046, 'Venadillo', 73, 0),
(1047, 'Venecia', 5, 0),
(1048, 'Venecia (Ospina Pérez)', 25, 0),
(1049, 'Ventaquemada', 15, 0),
(1050, 'Vergara', 25, 0),
(1051, 'Versalles', 76, 0),
(1052, 'Vetas', 68, 0),
(1053, 'Viani', 25, 0),
(1054, 'Vigía del Fuerte', 5, 0),
(1055, 'Vijes', 76, 0),
(1056, 'Villa Caro', 54, 0),
(1057, 'Villa Rica', 19, 0),
(1058, 'Villa de Leiva', 15, 0),
(1059, 'Villa del Rosario', 54, 0),
(1060, 'Villagarzón', 86, 0),
(1061, 'Villagómez', 25, 0),
(1062, 'Villahermosa', 73, 0),
(1063, 'Villamaría', 17, 0),
(1064, 'Villanueva', 13, 0),
(1065, 'Villanueva', 44, 0),
(1066, 'Villanueva', 68, 0),
(1067, 'Villanueva', 85, 0),
(1068, 'Villapinzón', 25, 0),
(1069, 'Villarrica', 73, 0),
(1070, 'Villavicencio', 50, 0),
(1071, 'Villavieja', 41, 0),
(1072, 'Villeta', 25, 0),
(1073, 'Viotá', 25, 0),
(1074, 'Viracachá', 15, 0),
(1075, 'Vista Hermosa', 50, 0),
(1076, 'Viterbo', 17, 0),
(1077, 'Vélez', 68, 0),
(1078, 'Yacopí', 25, 0),
(1079, 'Yacuanquer', 52, 0),
(1080, 'Yaguará', 41, 0),
(1081, 'Yalí', 5, 0),
(1082, 'Yarumal', 5, 0),
(1083, 'Yolombó', 5, 0),
(1084, 'Yondó (Casabe)', 5, 0),
(1085, 'Yopal', 85, 0),
(1086, 'Yotoco', 76, 0),
(1087, 'Yumbo', 76, 0),
(1088, 'Zambrano', 13, 0),
(1089, 'Zapatoca', 68, 0),
(1090, 'Zapayán (PUNTA DE PIEDRAS)', 47, 0),
(1091, 'Zaragoza', 5, 0),
(1092, 'Zarzal', 76, 0),
(1093, 'Zetaquirá', 15, 0),
(1094, 'Zipacón', 25, 0),
(1095, 'Zipaquirá', 25, 0),
(1096, 'Zona Bananera (PRADO - SEVILLA)', 47, 0),
(1097, 'Ábrego', 54, 0),
(1098, 'Íquira', 41, 0),
(1099, 'Úmbita', 15, 0),
(1100, 'Útica', 25, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `genero` enum('M','F','O') NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `tipo_identificacion` enum('CC','TI','EXTRANJERIA','PASAPORTE','REGISTRO CIVIL') NOT NULL,
  `identificacion` varchar(14) NOT NULL,
  `id_seguro` int(11) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `grupo_sangineo` varchar(20) NOT NULL,
  `alergias` enum('SI','NO') NOT NULL,
  `Tipo_de_Alergia` text NOT NULL,
  `id_municipio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id`, `nombre`, `apellido`, `genero`, `fecha_nacimiento`, `tipo_identificacion`, `identificacion`, `id_seguro`, `telefono`, `correo`, `direccion`, `grupo_sangineo`, `alergias`, `Tipo_de_Alergia`, `id_municipio`) VALUES
(2, 'fernanda', 'rodriguez', 'F', '2014-06-13', 'TI', '1107589326', 2, '878352521', 'Fernanda125@gmail.com', 'calle67#56sur', 'A+', 'NO', 'N/A', 107),
(4, 'valentina', 'orduz', 'F', '2016-10-03', 'TI', '5436353736', 4, '787534222', 'valentina@gmail.com', 'calle67#80', 'A+', 'SI', 'ALERGICA A LOS ACAROS', 107),
(5, 'omar', 'montes', 'M', '2016-10-18', 'PASAPORTE', '563572623', 1, '9837325242', 'omar@gmail.com', 'calle90#90', 'O+', 'NO', 'N/A', 9),
(7, 'Antonio', 'Sanchez', 'O', '2024-01-03', 'REGISTRO CIVIL', '1102987235', 3, '3045987324', 'mamadeAntonio@gmail.com', 'Calle24#7e-05', 'O-', 'NO', 'N/A', 914);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta`
--

CREATE TABLE `receta` (
  `id` int(11) NOT NULL,
  `id_medicamentos` int(11) NOT NULL,
  `can_medicamentos` varchar(100) NOT NULL,
  `observaciones` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `receta`
--

INSERT INTO `receta` (`id`, `id_medicamentos`, `can_medicamentos`, `observaciones`) VALUES
(1, 1, ' Adultos y adolescentes mayores de 15 años: Tomar 1 comprimido (500 mg de paracetamol) cada 4-6 hora', 'se debe tomar la cantidad necesaria por el tiempo estipulado y viendo su mejoras'),
(2, 2, 'Puede administrar acetaminofeno cada 4 a 6 horas según sea necesario. No administre más de 4 dosis e', 'se debe tomar la cantidad necesaria por el tiempo estipulado y viendo su mejoras'),
(3, 3, 'suplemento para subir las defensas tomar 1 vez cada dia', 'Tomarlo hasta terminar con el frasco'),
(4, 4, 'Gotas para la resequedad (una gota por ojo) cada 8 horas.', 'se debe suministrar hasta terminar el en base '),
(5, 5, ' se toma con un vaso lleno de agua cada 8 o 12 horas, según sea necesario. El naproxeno de venta lib', 'se debe tomar por 7 dias si na hay mejorias volver ala clinica '),
(6, 6, 'La dosis recomendada para casos más leves es de 100 mg (un comprimido dos veces al día).', 'se debe tomar por 7 dias si na hay mejorias volver ala clinica '),
(7, 7, 'Tomar Losartan Y metroporol todos los dias 2 dos veces al dia ', 'se debe todos los dias dos veces al dia sin falta'),
(8, 8, 'Se debe tomar antiinflamatorios y Naproxeno cada 8 horas durante 15 dias ', 'se debe tomar la cantidad necesaria por el tiempo estipulado y viendo su mejoras'),
(9, 9, 'Vitaminas para la quema de grasa y perder peso', 'tomarse una pastilla diaria OJO NO EXCEDERSE'),
(10, 10, 'Tomar Antiflamatorios cada 8 horas por 20 dias', ' Tomar el antiflamatorio antes de comer ya que puede ser muy fuerte');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguro`
--

CREATE TABLE `seguro` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `seguro`
--

INSERT INTO `seguro` (`id`, `nombre`) VALUES
(1, 'colsanitas'),
(2, 'colmedica'),
(3, 'compensar'),
(4, 'medisanitas'),
(5, 'sura prepagada'),
(6, 'coomeva'),
(7, 'seguros volibar'),
(8, 'saludtotal'),
(9, 'unisalud'),
(10, 'Mutual ser');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicio`
--

CREATE TABLE `servicio` (
  `id` int(11) NOT NULL,
  `descripcion_servicio` varchar(200) NOT NULL,
  `tipo_servicio` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicio`
--

INSERT INTO `servicio` (`id`, `descripcion_servicio`, `tipo_servicio`) VALUES
(1, 'Consulta General', 'consulta ambulatoria'),
(2, 'Rayos X', 'Consulta Ambulatoria.'),
(3, 'Oftamologia', 'consulta ambulatoria'),
(4, 'Odontologia', 'Consulta ambulatoria'),
(5, 'Ortopedia', 'Consulta ambulatoria'),
(6, 'Medicina Interna', 'Consulta ambulatoria'),
(7, 'Nutricion y Dietetica', 'Consulta ambulatoria'),
(8, 'Fisioterapia', 'Consulta ambulatoria'),
(9, 'Ginecologia', 'Consulta ambulatoria'),
(10, 'Pediatria', 'Consulta Ambulatoria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `login` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `id_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `login`, `password`, `id_persona`) VALUES
(2, 'Fernanda125@gmail.com', 'Fernanda128*', 2),
(4, 'valentina@gmail.com', 'Valentina7895&', 4),
(5, 'omar@gmail.com', 'Omar8595%', 5),
(7, 'mamadeAntonio@gmail.com', 'Antonito45**', 7);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_paciente` (`id_persona`),
  ADD UNIQUE KEY `id_medico` (`id_medico`),
  ADD KEY `id_` (`id_consultorio`),
  ADD KEY `id_receta` (`id_receta`);

--
-- Indices de la tabla `consultorio`
--
ALTER TABLE `consultorio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_examenes`
--
ALTER TABLE `detalle_examenes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cita` (`id_cita`),
  ADD KEY `id_servicio` (`id_servicio`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historia`
--
ALTER TABLE `historia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `paciente_id` (`id_persona`),
  ADD UNIQUE KEY `doctor_id` (`id_medico`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_horarios_medico` (`id_medico`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_modo_uso` (`id_modo_uso`);

--
-- Indices de la tabla `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_especialidad` (`id_especialidad`);

--
-- Indices de la tabla `modo_uso`
--
ALTER TABLE `modo_uso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_departamento` (`id_departamento`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identificacion` (`identificacion`),
  ADD KEY `id_municipio` (`id_municipio`),
  ADD KEY `id_seguro` (`id_seguro`);

--
-- Indices de la tabla `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_medicamentos` (`id_medicamentos`);

--
-- Indices de la tabla `seguro`
--
ALTER TABLE `seguro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_persona` (`id_persona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `consultorio`
--
ALTER TABLE `consultorio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT de la tabla `detalle_examenes`
--
ALTER TABLE `detalle_examenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `historia`
--
ALTER TABLE `historia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `medico`
--
ALTER TABLE `medico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `modo_uso`
--
ALTER TABLE `modo_uso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `municipio`
--
ALTER TABLE `municipio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1101;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `receta`
--
ALTER TABLE `receta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `seguro`
--
ALTER TABLE `seguro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `fk_cita_consultorio` FOREIGN KEY (`id_consultorio`) REFERENCES `consultorio` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cita_doctor` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cita_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cita_receta` FOREIGN KEY (`id_receta`) REFERENCES `receta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_examenes`
--
ALTER TABLE `detalle_examenes`
  ADD CONSTRAINT `fk_detalle_examenes_servicio` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_examenes_cita` FOREIGN KEY (`id_cita`) REFERENCES `cita` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `historia`
--
ALTER TABLE `historia`
  ADD CONSTRAINT `fk_historia_medico` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_historia_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `fk_horarios_medico` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD CONSTRAINT `fk_medicamentos_modo_uso` FOREIGN KEY (`id_modo_uso`) REFERENCES `modo_uso` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `medico`
--
ALTER TABLE `medico`
  ADD CONSTRAINT `fk_medico_especialidad` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD CONSTRAINT `fk_municipio_departamento` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_persona_municipio` FOREIGN KEY (`id_municipio`) REFERENCES `municipio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_persona_seguro` FOREIGN KEY (`id_seguro`) REFERENCES `seguro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `receta`
--
ALTER TABLE `receta`
  ADD CONSTRAINT `fk_receta_medicamentos` FOREIGN KEY (`id_medicamentos`) REFERENCES `medicamentos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usario_persona` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
