
-- inserta usuarios
insert into usuario (nombre_usuario, contrasena, rol) values 
('Admin', 'admin123', 'Administrador'),
('EmpleadoLuis', 'Luis3000', 'Empleado');

-- inserta proveedores de prueba
insert into proveedor (nombre_empresa, telefono, contacto) values 
('Autopartes de Mexico', '2291234567', 'Juan Perez'),
('Distribuidora del Golfo', '2297654321', 'Maria Hernandez');

-- inserta los 10 productos (les asignamos el proveedor 1 o 2)
insert into refaccion (codigo, nombre, descripcion, precio, stock, categoria, id_proveedor) values 
('bujia-ngk-01', 'Bujía NGK Iridium', 'bujia de alto rendimiento', 150.50, 50, 'Motor', 1),
('ace-mob-5w30', 'Aceite Mobil 1 5W-30', 'aceite sintetico 946ml', 250.00, 24, 'Lubricantes', 2),
('fil-air-ph36', 'Filtro de Aire PH3614', 'filtro de aire estandar', 120.00, 15, 'Filtros', 1),
('bal-del-tsur', 'Balatas Delanteras Tsuru', 'juego de balatas de ceramica', 350.00, 10, 'Frenos', 2),
('liq-fre-dot3', 'Líquido de Frenos DOT 3', 'botella de 250ml', 85.00, 20, 'Frenos', 1),
('ban-alt-v12', 'Banda de Alternador V12', 'banda de caucho reforzado', 180.00, 8, 'Motor', 2),
('foc-h4-halo', 'Foco Halógeno H4', 'foco de luz blanca para faro', 95.00, 30, 'Eléctrico', 1),
('bat-lth-47', 'Batería LTH 47', 'bateria de 12v para auto sedan', 1850.00, 5, 'Eléctrico', 2),
('lim-iny-300', 'Limpiador de Inyectores', 'aditivo para tanque de gasolina', 110.00, 15, 'Lubricantes', 1),
('fil-ace-m1', 'Filtro de Aceite M1', 'filtro blindado para motor', 140.00, 20, 'Filtros', 2);
