-- inserta usuarios
INSERT INTO usuario (nombre_usuario, contrasena, rol) VALUES 
('Admin', 'admin123', 'Administrador'),
('EmpleadoLuis', 'Luis3000', 'Empleado');

-- inserta 10 productos
INSERT INTO refaccion (codigo, nombre, descripcion, precio, stock, categoria) VALUES 
('bujia-ngk-01', 'Bujía NGK Iridium', 'bujia de alto rendimiento', 150.50, 50, 'Motor'),
('ace-mob-5w30', 'Aceite Mobil 1 5W-30', 'aceite sintetico 946ml', 250.00, 24, 'Lubricantes'),
('fil-air-ph36', 'Filtro de Aire PH3614', 'filtro de aire estandar', 120.00, 15, 'Filtros'),
('bal-del-tsur', 'Balatas Delanteras Tsuru', 'juego de balatas de ceramica', 350.00, 10, 'Frenos'),
('liq-fre-dot3', 'Líquido de Frenos DOT 3', 'botella de 250ml', 85.00, 20, 'Frenos'),
('ban-alt-v12', 'Banda de Alternador V12', 'banda de caucho reforzado', 180.00, 8, 'Motor'),
('foc-h4-halo', 'Foco Halógeno H4', 'foco de luz blanca para faro', 95.00, 30, 'Eléctrico'),
('bat-lth-47', 'Batería LTH 47', 'bateria de 12v para auto sedan', 1850.00, 5, 'Eléctrico'),
('lim-iny-300', 'Limpiador de Inyectores', 'aditivo para tanque de gasolina', 110.00, 15, 'Lubricantes'),
('fil-ace-m1', 'Filtro de Aceite M1', 'filtro blindado para motor', 140.00, 20, 'Filtros');
