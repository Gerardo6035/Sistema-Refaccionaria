-- 1. Tabla de usuarios
CREATE TABLE Usuario (
    id_usuario SERIAL PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    contrasena VARCHAR(100) NOT NULL,
    rol VARCHAR(20) NOT NULL
);

-- 2. Tabla de refacciones
CREATE TABLE refaccion (
    id_refaccion SERIAL PRIMARY KEY, 
    codigo VARCHAR(50) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    categoria VARCHAR(50)
);

-- 3. Tabla para guardar tickets de venta
CREATE TABLE Venta (
    id_venta SERIAL PRIMARY KEY,
    id_usuario INT,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_venta NUMERIC(10, 2) NOT NULL DEFAULT 0.0,
    CONSTRAINT fk_venta_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

-- 4. Tabla para guardar las piezas que van dentro del ticket
CREATE TABLE DetalleVenta (
    id_detalle SERIAL PRIMARY KEY,
    id_venta INT,
    id_refaccion INT,
    cantidad INT NOT NULL,
    precio_unitario NUMERIC(10, 2) NOT NULL,
    subtotal NUMERIC(10, 2) NOT NULL,
    CONSTRAINT fk_detalle_venta FOREIGN KEY (id_venta) REFERENCES Venta(id_venta),
    CONSTRAINT fk_detalle_refaccion FOREIGN KEY (id_refaccion) REFERENCES refaccion(id_refaccion)
);
