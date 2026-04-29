
-- 1
CREATE TABLE Usuario (
    id_usuario SERIAL PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    contrasena VARCHAR(100) NOT NULL,
    rol VARCHAR(20) NOT NULL
);

-- 2
CREATE TABLE Categoria (
    id_categoria SERIAL PRIMARY KEY,
    nombre_categoria VARCHAR(100) NOT NULL
);

-- 3
CREATE TABLE Producto (
    id_producto SERIAL PRIMARY KEY,
    nombre_producto VARCHAR(150) NOT NULL,
    precio_venta NUMERIC(10, 2) NOT NULL,
    id_categoria INT,
    CONSTRAINT fk_producto_categoria FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria)
);

-- 4
CREATE TABLE Inventario (
    id_inventario SERIAL PRIMARY KEY,
    id_producto INT UNIQUE,
    stock_actual INT NOT NULL DEFAULT 0,
    stock_minimo INT NOT NULL DEFAULT 5,
    CONSTRAINT fk_inventario_producto FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

-- 5
CREATE TABLE Venta (
    id_venta SERIAL PRIMARY KEY,
    id_usuario INT,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_venta NUMERIC(10, 2) NOT NULL DEFAULT 0.0,
    CONSTRAINT fk_venta_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

-- 6
CREATE TABLE DetalleVenta (
    id_detalle SERIAL PRIMARY KEY,
    id_venta INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario NUMERIC(10, 2) NOT NULL,
    subtotal NUMERIC(10, 2) NOT NULL,
    CONSTRAINT fk_detalle_venta FOREIGN KEY (id_venta) REFERENCES Venta(id_venta),
    CONSTRAINT fk_detalle_producto FOREIGN KEY (id_producto) REFERENCES Producto(id_producto)
);

-- 7
CREATE TABLE HistorialMovimientos (
    id_movimiento SERIAL PRIMARY KEY,
    id_usuario INT,
    id_inventario INT,
    tipo_movimiento VARCHAR(50) NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_historial_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    CONSTRAINT fk_historial_inventario FOREIGN KEY (id_inventario) REFERENCES Inventario(id_inventario)
);