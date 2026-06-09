
-- 1. tabla de usuarios
create table usuario (
    id_usuario serial primary key,
    nombre_usuario varchar(50) not null,
    contrasena varchar(100) not null,
    rol varchar(20) not null
);

-- 2. tabla de proveedores
create table proveedor (
    id_proveedor serial primary key,
    nombre_empresa varchar(100) not null,
    telefono varchar(20),
    contacto varchar(100)
);

-- 3. tabla de refacciones
create table refaccion (
    id_refaccion serial primary key, 
    codigo varchar(50) unique not null,
    nombre varchar(100) not null,
    descripcion text,
    precio decimal(10, 2) not null,
    stock int not null,
    categoria varchar(50),
    id_proveedor int,
    constraint fk_refaccion_proveedor foreign key (id_proveedor) references proveedor(id_proveedor)
);

-- 4. tabla para guardar el ticket de la venta
create table venta (
    id_venta serial primary key,
    id_usuario int,
    fecha_hora timestamp default current_timestamp,
    total_venta numeric(10, 2) not null default 0.0,
    constraint fk_venta_usuario foreign key (id_usuario) references usuario(id_usuario)
);

-- 5. tabla para guardar las piezas que van dentro del ticket
create table detalleventa (
    id_detalle serial primary key,
    id_venta int,
    id_refaccion int,
    cantidad int not null,
    precio_unitario numeric(10, 2) not null,
    subtotal numeric(10, 2) not null,
    constraint fk_detalle_venta foreign key (id_venta) references venta(id_venta),
    constraint fk_detalle_refaccion foreign key (id_refaccion) references refaccion(id_refaccion)
);
