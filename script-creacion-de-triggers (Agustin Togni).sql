
use distribuidora;

-- Creamos las tablas logs de los clientes

DROP TABLE IF EXISTS logs_insertar_clientes;

-- Guardamos en logs la insercion de los datos en la tabla "clientes" ademas del usuario que realizo la insercion, fecha y hora de la misma.
CREATE TABLE logs_insertar_clientes (
		id_log_insertar_clientes INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
	ID_Cliente INT NOT NULL,
    CL_Nombre VARCHAR(25) NOT NULL,
    CL_Apellido VARCHAR(25) NOT NULL,
    CL_DNI INT NOT NULL UNIQUE,
    CL_CUIT VARCHAR(13) NOT NULL UNIQUE,
    CL_TELEFONO INT NOT NULL,
    CL_Email VARCHAR(50),
    Usuario_insercion VARCHAR(50),
    Fecha_insercion DATE,
    Hora_insercion TIME
);

DROP TABLE IF EXISTS logs_actualizar_clientes;

-- Guardamos en logs una actualizacion de los datos en la tabla "clientes" ademas del usuario que realizo la actualizacion, fecha y hora de la misma, datos nuevos y datos viejos.
CREATE TABLE logs_actualizar_clientes (
		id_log_actualizar_clientes INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
	ID_Cliente INT NOT NULL,
    old_CL_Nombre VARCHAR(25) NOT NULL,
    old_CL_Apellido VARCHAR(25) NOT NULL,
    old_CL_DNI INT NOT NULL UNIQUE,
    old_CL_CUIT VARCHAR(13) NOT NULL UNIQUE,
    old_CL_TELEFONO INT NOT NULL,
    old_CL_Email VARCHAR(50),
	Usuario_actualizo VARCHAR(50),
    Fecha_actualizado DATE,
    Hora_actualizado TIME,
	new_CL_Nombre VARCHAR(25) NOT NULL,
    new_CL_Apellido VARCHAR(25) NOT NULL,
    new_CL_DNI INT NOT NULL UNIQUE,
    new_CL_CUIT VARCHAR(13) NOT NULL UNIQUE,
    new_CL_TELEFONO INT NOT NULL,
    new_CL_Email VARCHAR(50)
);

DROP TABLE IF EXISTS logs_eliminar_clientes;

-- Guardamos en logs una eliminacion de los datos en la tabla "clientes" ademas del usuario que realizo la eliminacion, fecha y hora de la misma.
CREATE TABLE logs_eliminar_clientes (
		id_log_eliminar_clientes INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
	ID_Cliente INT NOT NULL,
    CL_Nombre VARCHAR(25) NOT NULL,
    CL_Apellido VARCHAR(25) NOT NULL,
    CL_DNI INT NOT NULL UNIQUE,
    CL_CUIT VARCHAR(13) NOT NULL UNIQUE,
    CL_TELEFONO INT NOT NULL,
    CL_Email VARCHAR(50),
    Usuario_borro VARCHAR(50),
    Fecha_borrado DATE,
    Hora_borrado TIME
);

-- Creamos los triggers de los clientes

DROP TRIGGER IF EXISTS tr_after_insertar_cliente;

DELIMITER //
CREATE TRIGGER tr_after_insertar_cliente
AFTER INSERT ON clientes
FOR EACH ROW
INSERT INTO logs_insertar_clientes
VALUES (NULL, NEW.ID_Cliente,NEW.CL_Nombre,NEW.CL_Apellido,NEW.CL_DNI,NEW.CL_CUIT,NEW.CL_Telefono,NEW.CL_Email, SESSION_USER(), CURRENT_DATE(), CURRENT_TIME());
//

DROP TRIGGER IF EXISTS tr_before_actualizar_cliente;

DELIMITER //
CREATE TRIGGER tr_before_actualizar_cliente
BEFORE UPDATE ON clientes
FOR EACH ROW
INSERT INTO logs_actualizar_clientes
VALUES (NULL, OLD.ID_Cliente,OLD.CL_Nombre,OLD.CL_Apellido,OLD.CL_DNI,OLD.CL_CUIT,OLD.CL_Telefono,OLD.CL_Email, SESSION_USER(), CURRENT_DATE(), CURRENT_TIME(),
		NEW.id_Cliente,NEW.CL_Nombre,NEW.CL_Apellido,NEW.CL_DNI,NEW.CL_CUIT,NEW.CL_Telefono,NEW.CL_Email);
//

DROP TRIGGER IF EXISTS tr_before_borrar_cliente;

DELIMITER //
CREATE TRIGGER tr_before_borrar_cliente
BEFORE DELETE ON clientes
FOR EACH ROW
INSERT INTO logs_eliminar_clientes
VALUES (NULL, OLD.ID_Cliente,OLD.CL_Nombre,OLD.CL_Apellido,OLD.CL_DNI,OLD.CL_CUIT,OLD.CL_Telefono,OLD.CL_Email, SESSION_USER(), CURRENT_DATE(), CURRENT_TIME());
//

-- Creamos las tablas logs de los productos

DROP TABLE IF EXISTS logs_insertar_detalles_productos;

-- Guardamos en logs la insercion de los datos en la tabla "detalle_productos" ademas del usuario que realizo la insercion, fecha y hora de la misma.
CREATE TABLE logs_insertar_detalles_productos (
		id_log_insertar_detalles_productos INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
	ID_DetalleProducto INT NOT NULL,
    ID_Producto INT NOT NULL UNIQUE,
    PT_Costo NUMERIC(10,2) NOT NULL,
    PT_Precio NUMERIC(10,2) NOT NULL,
    PT_Stock INT NOT NULL,
    PT_Codigo INT NOT NULL,
	Usuario_insercion VARCHAR(50),
    Fecha_insercion DATE,
    Hora_insercion TIME
);

DROP TABLE IF EXISTS logs_actualizar_detalles_productos;

-- Guardamos en logs una actualizacion de los datos en la tabla "detalle_productos" ademas del usuario que realizo la actualizacion, fecha y hora de la misma, datos nuevos y datos viejos.
CREATE TABLE logs_actualizar_detalles_productos (
		id_log_actualizar_detalles_productos INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
	old_ID_DetalleProducto INT NOT NULL,
    old_ID_Producto INT NOT NULL UNIQUE,
    old_PT_Costo NUMERIC(10,2) NOT NULL,
    old_PT_Precio NUMERIC(10,2) NOT NULL,
    old_PT_Stock INT NOT NULL,
    old_PT_Codigo INT NOT NULL,
	Usuario_actualizo VARCHAR(50),
    Fecha_actualizado DATE,
    Hora_actualizado TIME,
	new_ID_DetalleProducto INT NOT NULL,
    new_ID_Producto INT NOT NULL UNIQUE,
    new_PT_Costo NUMERIC(10,2) NOT NULL,
    new_PT_Precio NUMERIC(10,2) NOT NULL,
    new_PT_Stock INT NOT NULL,
    new_PT_Codigo INT NOT NULL
);

DROP TABLE IF EXISTS logs_eliminar_detalles_productos;

-- Guardamos en logs una eliminacion de los datos en la tabla "detalle_productos" ademas del usuario que realizo la eliminacion, fecha y hora de la misma.
CREATE TABLE logs_eliminar_detalles_productos (
		id_log_eliminar_detalles_productos INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
	ID_DetalleProducto INT NOT NULL,
    ID_Producto INT NOT NULL UNIQUE,
    PT_Costo NUMERIC(10,2) NOT NULL,
    PT_Precio NUMERIC(10,2) NOT NULL,
    PT_Stock INT NOT NULL,
    PT_Codigo INT NOT NULL,
    Usuario_borro VARCHAR(50),
    Fecha_borrado DATE,
    Hora_borrado TIME
);

-- Creamos los triggers de los productos

DROP TRIGGER IF EXISTS tr_after_insertar_detalles_productos;

DELIMITER //
CREATE TRIGGER tr_after_insertar_detalles_productos
AFTER INSERT ON detalle_productos
FOR EACH ROW
INSERT INTO logs_insertar_detalles_productos
VALUES (NULL, NEW.ID_DetalleProducto,NEW.ID_Producto,NEW.PT_Costo,NEW.PT_Precio,NEW.PT_Stock,NEW.PT_Codigo, SESSION_USER(), CURRENT_DATE(), CURRENT_TIME());
//

DROP TRIGGER IF EXISTS tr_before_actualizar_detalles_productos;

DELIMITER //
CREATE TRIGGER tr_before_actualizar_detalles_productos
BEFORE UPDATE ON detalle_productos
FOR EACH ROW
INSERT INTO logs_actualizar_detalles_productos
VALUES (NULL, NEW.ID_DetalleProducto,NEW.ID_Producto,NEW.PT_Costo,NEW.PT_Precio,NEW.PT_Stock,NEW.PT_Codigo, SESSION_USER(), CURRENT_DATE(), CURRENT_TIME(),
		OLD.ID_DetalleProducto,OLD.ID_Producto,OLD.PT_Costo,OLD.PT_Precio,OLD.PT_Stock,OLD.PT_Codigo);
//

DROP TRIGGER IF EXISTS tr_before_eliminar_detalles_productos;

DELIMITER //
CREATE TRIGGER tr_before_eliminar_detalles_productos
BEFORE DELETE ON detalle_productos
FOR EACH ROW
INSERT INTO logs_eliminar_detalles_productos
VALUES (NULL, OLD.ID_DetalleProducto,OLD.ID_Producto,OLD.PT_Costo,OLD.PT_Precio,OLD.PT_Stock,OLD.PT_Codigo, SESSION_USER(), CURRENT_DATE(), CURRENT_TIME());
//
