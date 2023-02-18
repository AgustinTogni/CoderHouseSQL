
-- Creamos la base de datos de la distribuidora

DROP SCHEMA IF EXISTS Distribuidora;

CREATE SCHEMA IF NOT EXISTS Distribuidora;

-- Seleccionamos el esquema Distribuidora

USE Distribuidora;

-- Creamos las tablas

DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
	ID_Cliente INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    CL_Nombre VARCHAR(25) NOT NULL,
    CL_Apellido VARCHAR(25) NOT NULL,
    CL_DNI INT NOT NULL UNIQUE,
    CL_CUIT VARCHAR(13) NOT NULL UNIQUE,
    CL_TELEFONO INT NOT NULL,
    CL_Email VARCHAR(50)
);

DROP TABLE IF EXISTS direccion_clientes;

CREATE TABLE direccion_clientes (
	ID_DireccionCliente INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    CL_Direccion VARCHAR(50) NOT NULL,
    CL_CodigoPostal INT NOT NULL,
    CL_Zona VARCHAR(25) NOT NULL,
    ID_Cliente INT NOT NULL UNIQUE,
    FOREIGN KEY (ID_Cliente) REFERENCES clientes(ID_Cliente) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS productos;

CREATE TABLE productos (
	ID_Producto INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    Producto VARCHAR(15) NOT NULL,
    Marca VARCHAR(25) NOT NULL,
    Modelo VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS detalle_productos;

CREATE TABLE detalle_productos (
	ID_DetalleProducto INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    ID_Producto INT NOT NULL UNIQUE,
    PT_Costo NUMERIC(10,2) NOT NULL,
    PT_Precio NUMERIC(10,2) NOT NULL,
    PT_Stock INT NOT NULL,
    PT_Codigo INT NOT NULL,
    FOREIGN KEY (ID_Producto) REFERENCES productos(ID_Producto) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS empleados;

CREATE TABLE empleados (
	ID_Empleado INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    EP_Nombre VARCHAR(25) NOT NULL,
    EP_Apellido VARCHAR(25) NOT NULL,
    EP_DNI INT NOT NULL UNIQUE,
    EP_Telefono INT NOT NULL
);

DROP TABLE IF EXISTS area_empleados;

CREATE TABLE area_empleados (
	ID_AreaAsignada INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    EP_Area VARCHAR(25) NOT NULL,
    ID_Empleado INT NOT NULL UNIQUE,
    FOREIGN KEY (ID_Empleado) REFERENCES empleados(ID_Empleado) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS pedidos;

CREATE TABLE pedidos (
	ID_Pedido INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    PD_Fecha DATE NOT NULL,
	PD_Monto NUMERIC(10,2) NOT NULL,
    ID_Cliente INT NOT NULL UNIQUE,
    FOREIGN KEY (ID_Cliente) REFERENCES clientes(ID_Cliente) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS facturas;

CREATE TABLE facturas (
	ID_Factura INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    FC_Fecha DATE NOT NULL,
	FC_Monto NUMERIC(10,2) NOT NULL,
    ID_Cliente INT NOT NULL UNIQUE,
    FOREIGN KEY (ID_Cliente) REFERENCES clientes(ID_Cliente) ON DELETE CASCADE ON UPDATE CASCADE
);

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

-- Creamos una fuction para ver los margenes exactos actuales en (%).

DROP FUNCTION IF EXISTS calculo_margen;

DELIMITER //
CREATE FUNCTION calculo_margen (c NUMERIC(10,2), p NUMERIC(10,2)) RETURNS NUMERIC(10,2)
DETERMINISTIC
BEGIN
	DECLARE a NUMERIC(10,2);
    DECLARE m NUMERIC(10,2);
    
    SET a = 100;
	SET m = a*((p-c)/p);

	RETURN m;
END;
//

-- Creamos una fuction para generar alertas sobre los margenes de los precios.

DROP FUNCTION IF EXISTS aviso_margen;

DELIMITER //
CREATE FUNCTION aviso_margen (c NUMERIC(10,2), p NUMERIC(10,2)) RETURNS VARCHAR(18)
DETERMINISTIC
BEGIN
	DECLARE a NUMERIC(10,2);
    DECLARE m NUMERIC(10,2);
    DECLARE mensaje VARCHAR(18);
    
    SET a = 100;
	SET m = a*((p-c)/p);
    
    IF m>=10
    THEN 
    SET mensaje='Margen OK!';
    ELSE 
    SET mensaje='Corregir Margen';
    END IF;
    
	RETURN mensaje;
END;
//

-- Creamos una S.P. para poder ordenar los clientes de la tabla clientes.

DROP PROCEDURE IF EXISTS sp_lista_clientes;

DELIMITER //
CREATE PROCEDURE sp_lista_clientes (IN field VARCHAR(20), IN my_order VARCHAR(4))
BEGIN
	IF field <> '' THEN
		SET @ordenar_lista = concat_ws('', 'order by', field, my_order);
	ELSE 
		SET @ordenar_lista = '';
	END IF;
    
    SET @clausula = concat_ws('', 'select * from clientes', @ordenar_lista);
    
    PREPARE ejecutra FROM @clausula;
    EXECUTE ejecutar;
    DEALLOCATE PREPARE ejecutar;
    
END
//

-- Creamos una S.P. para poder insertar un nuevo cliente de manera mas rapida.

DROP PROCEDURE IF EXISTS sp_insertar_cliente;

DELIMITER //
CREATE PROCEDURE sp_insertar_cliente (
IN ID_Cliente INT, 
IN CL_Nombre VARCHAR(25), 
IN CL_Apellido VARCHAR(25),
IN CL_DNI INT,
IN CL_CUIT VARCHAR(13),
IN CL_TELEFONO INT,
IN CL_Email VARCHAR(50))
BEGIN
INSERT INTO clientes VALUES (ID_Cliente, CL_Nombre, CL_Apellido, CL_DNI, CL_CUIT, CL_Telefono, CL_Email);
END
//

-- Creamos una S.P. para poder eliminar un cliente de manera mas rapida.

DROP PROCEDURE IF EXISTS sp_eliminar_cliente;

DELIMITER //
CREATE PROCEDURE sp_eliminar_cliente (IN ID INT) 
BEGIN
DELETE FROM clientes WHERE ID_Cliente=ID;
END
//

-- Creamos las distintas vistas de las tablas.

-- Mostramos una lista de los DNI de todos los clientes.
DROP VIEW IF EXISTS vs_clientes_dni;

CREATE OR REPLACE VIEW vs_clientes_dni AS
	(SELECT CL_Nombre, CL_Apellido, CL_DNI FROM clientes);
 
-- Mostramos una lista de todos los productos cuya marca sea Corsair. 
DROP VIEW IF EXISTS vs_productos_corsair;

CREATE OR REPLACE VIEW vs_productos_corsair AS
	(SELECT ID_Producto, Producto, Marca, Modelo FROM productos
    WHERE Marca = 'Corsair');

-- Mostramos una lista de todas las facturas cuyo monto sea mayor a $150.000.    
DROP VIEW IF EXISTS vs_150k_facturas;

CREATE OR REPLACE VIEW vs_150k_facturas AS
	(SELECT ID_Factura, FC_Fecha, FC_Monto FROM facturas
    WHERE FC_Monto > 150000);

-- Mostramos una lista que muestra los precios de todos los productos cuya marca sea Logitech.
DROP VIEW IF EXISTS vs_precios_logitech;    

CREATE OR REPLACE VIEW vs_precios_logitech AS
	(SELECT T1.ID_Producto, T1.Producto, T1.Marca, T1.Modelo, T2.PT_Precio FROM productos T1
    JOIN detalle_productos T2 ON (T1.ID_Producto = T2.ID_Producto)
    WHERE T1.Marca = 'logitech');

-- Mostramos una lista de todos los empleados que pertenezcan a el area de vendedores.
DROP VIEW IF EXISTS vs_empleados_vendedores;    

CREATE OR REPLACE VIEW vs_empleados_vendedores AS
	(SELECT T1.ID_Empleado, T1.EP_Nombre, T1.EP_Apellido, T1.EP_DNI, T2.EP_Area FROM empleados T1
    JOIN area_empleados T2 ON (T1.ID_Empleado = T2.ID_Empleado)
    WHERE T2.EP_Area = 'Vendedor');