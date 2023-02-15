
USE distribuidora;

-- Ordenar clientes de una tabla

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

-- S.P. insertar un nuevo cliente

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

-- S.P. eliminar un cliente

DROP PROCEDURE IF EXISTS sp_eliminar_cliente;

DELIMITER //
CREATE PROCEDURE sp_eliminar_cliente (IN ID INT) 
BEGIN
DELETE FROM clientes WHERE ID_Cliente=ID;
END
//