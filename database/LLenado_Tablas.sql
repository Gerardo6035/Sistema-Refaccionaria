-- Insertar usuarios
INSERT INTO Usuario (nombre_usuario, contrasena, rol) VALUES 
('Admin', 'admin123', 'Administrador'),
('EmpleadoLuis', 'Luis3000', 'Empleado');

-- Insertar categorias
INSERT INTO Categoria (nombre_categoria) VALUES 
('Aceites y Lubricantes'),
('Filtros');

-- Insertar productos
INSERT INTO Producto (nombre_producto, precio_venta, id_categoria) VALUES 
('Aceite Multigrado 15W-40 946ml', 145.00, 1),
('Filtro de Aire PH3614', 120.00, 2);

-- Inicializar inventario
INSERT INTO Inventario (id_producto, stock_actual, stock_minimo) VALUES 
(1, 24, 5),
(2, 20, 5);

-- Movimientos iniciales de prueba
INSERT INTO HistorialMovimientos (id_usuario, id_inventario, tipo_movimiento) VALUES 
(1, 1, 'Carga Inicial de Inventario'),
(1, 2, 'Carga Inicial de Inventario');