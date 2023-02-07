
USE distribuidora;

-- Fuction para ver los margenes exactos actuales.

DROP FUNCTION calculo_margen;

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

select PT_Costo, PT_Precio, calculo_margen(PT_Costo,PT_Precio) margen from detalle_productos

-- Fuction para generar alertas de margenes sobre los precios.

DROP FUNCTION aviso_margen;

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

select PT_Costo, PT_Precio, aviso_margen(PT_Costo,PT_Precio) margen from detalle_productos