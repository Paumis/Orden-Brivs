
-- Crear base de datos 
CREATE DATABASE fosdb; 
USE fosdb; 
--
-- Create de tabla para la tabla `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `ID` int(2) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Insert de datos para la tabla `tbl_admin`
--

INSERT INTO `tbl_admin` (`ID`, `username`, `password`) VALUES
(0, 'admin', '1234abcd..');

-- --------------------------------------------------------

--
-- Create de tabla para la tabla `tbl_menu`
--

CREATE TABLE `tbl_menu` (
  `menuID` int(11) NOT NULL,
  `menuName` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Insert de datos para la tabla `tbl_menu`
--

INSERT INTO `tbl_menu` (`menuID`, `menuName`) VALUES
(8, 'a la Parrilla'),
(9, 'Cocidos o al Vapor'),
(10, 'Bebidas'),
(11, 'Sopas');

-- --------------------------------------------------------

--
-- Create de tabla para la tabla `tbl_menuitem`
--

CREATE TABLE `tbl_menuitem` (
  `itemID` int(11) NOT NULL,
  `menuID` int(11) NOT NULL,
  `menuItemName` text NOT NULL,
  `price` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Insert de datos para la tabla `tbl_menuitem`
--

-- Platillos del menú
INSERT INTO `tbl_menuitem` (`itemID`, `menuID`, `menuItemName`, `price`) VALUES
(17, 8, 'Filete de Pescado a la Parrilla', '12000.00'),
(18, 8, 'Brochetas de Mariscos', '15000.00'),
(19, 8, 'Parrillada de Mariscos', '18000.00'),
(20, 8, 'Ceviche de Pescado', '13000.00'),
(21, 9, 'Salmón al Vapor', '16000.00'),
(22, 9, 'Cazuela de Mariscos', '17000.00'),
(23, 9, 'Arroz con Camarones', '14000.00'),
(24, 9, 'Pescado al Vapor con Hierbas', '15000.00'),
(25, 10, 'Agua de Coco', '3000.00'),
(26, 10, 'Limonada de Maracuyá', '3500.00'),
(27, 11, 'Sopa de Pescado con Verduras', '12000.00'),
(28, 11, 'Crema de Mariscos', '14000.00');
-- --------------------------------------------------------

--
-- Create de tabla para la tabla `tbl_order`
--

CREATE TABLE `tbl_order` (
  `orderID` int(11) NOT NULL,
  `status` text NOT NULL,
  `total` decimal(15,2) NOT NULL,
  `order_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Insert de datos para la tabla `tbl_order`
--

INSERT INTO `tbl_order` (`orderID`, `status`, `total`, `order_date`) VALUES
(1, 'finish', '1000.00', '2023-01-17'),
(2, 'finish', '10000.00', '2023-01-17'),
(3, 'ready', '11000.00', '2023-01-18'),
(4, 'cancelled', '6000.00', '2023-01-18'),
(5, 'preparing', '10000.00', '2023-01-25'),
(6, 'waiting', '15500.00', '2023-01-25');

-- --------------------------------------------------------

--
-- Create de tabla para la tabla `tbl_orderdetail`
--

CREATE TABLE `tbl_orderdetail` (
  `orderID` int(11) NOT NULL,
  `orderDetailID` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `mesaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Insert de datos para la tabla `tbl_orderdetail`
--

INSERT INTO `tbl_orderdetail` (`orderID`, `orderDetailID`, `itemID`, `quantity`, `mesaID`) VALUES
(1, 1, 14, 1, 1),
(2, 2, 13, 1, 2),
(2, 3, 14, 1, 3),
(2, 4, 15, 1, 4),
(2, 5, 16, 1, 5),
(3, 6, 25, 1, 6),
(3, 7, 38, 1, 7),
(3, 8, 32, 1, 8),
(4, 9, 17, 1, 9),
(4, 10, 30, 1, 10),
(5, 11, 17, 2, 11),
(6, 12, 23, 1, 12),
(6, 13, 26, 1, 13),
(6, 14, 36, 1, 14);

-- --------------------------------------------------------

CREATE TABLE `tbl_mesa` (
  `mesaID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`mesaID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;  



INSERT INTO `tbl_mesa` (`mesaID`) VALUES 
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14);

--
-- Create de tabla para la tabla `tbl_role`
--

CREATE TABLE `tbl_role` (
  `role` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Insert de datos para la tabla `tbl_role`
--

INSERT INTO `tbl_role` (`role`) VALUES
('chef'),
('Mesero');

-- --------------------------------------------------------

--
-- Create de tabla para la tabla `tbl_staff`
--

CREATE TABLE `tbl_staff` (
  `staffID` int(2) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` text NOT NULL,
  `role` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Insert de datos para la tabla `tbl_staff`
--

INSERT INTO `tbl_staff` (`staffID`, `username`, `password`, `status`, `role`) VALUES
(1, 'Juan', '1234abcd..', 'Online', 'chef'),
(4, 'Pedro', '1234abcd..', 'Online', 'Mesero'),
(5, 'Emily', '1234abcd..', 'Online', 'chef'),
(6, 'Robert', '1234abcd..', 'Online', 'chef'),
(7, 'Sofia', 'abc123', 'Offline', 'Mesero'),
(9, 'Marin', '1234abcd..', 'Online', 'chef');

--
-- Índices para tablas volcadas
--

--
-- Conexión de la tabla `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`ID`);

--
-- Conexión de la tabla `tbl_menu`
--
ALTER TABLE `tbl_menu`
  ADD PRIMARY KEY (`menuID`);

--
-- Conexión de la tabla `tbl_menuitem`
--
ALTER TABLE `tbl_menuitem`
  ADD PRIMARY KEY (`itemID`),
  ADD KEY `menuID` (`menuID`);

--
-- Conexión de la tabla `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`orderID`);

--
-- Conexión de la tabla `tbl_orderdetail`
--
ALTER TABLE `tbl_orderdetail`
  ADD PRIMARY KEY (`orderDetailID`),
  ADD KEY `itemID` (`itemID`),
  ADD KEY `orderID` (`orderID`);

-- Conexión de la tabla 

  ALTER TABLE `tbl_orderdetail`
  ADD KEY `mesaID` (`mesaID`);

--
-- Conexión de la tabla `tbl_staff`
--
ALTER TABLE `tbl_staff`
  ADD PRIMARY KEY (`staffID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_menu`
--
ALTER TABLE `tbl_menu`
  MODIFY `menuID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tbl_menuitem`
--
ALTER TABLE `tbl_menuitem`
  MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `tbl_orderdetail`
--
ALTER TABLE `tbl_orderdetail`
  MODIFY `orderDetailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `tbl_staff`
--
ALTER TABLE `tbl_staff`
  MODIFY `staffID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

