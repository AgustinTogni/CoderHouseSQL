
-- Seleccionamos el esquema Distribuidora3

USE Distribuidora3;

-- Insertamos los datos a las tablas

INSERT INTO clientes 
VALUES
	(null, 'Agustin', 'Togni', '47891990', '20-47891990-8', '01145789812', 'agustintog2000@gmail.com'),
    (null, 'Gonzalo', 'Gonzales', '34821920', '20-34821920-8', '01136781012', 'gonzalogon19@gmail.com'),
    (null, 'Jorge', 'Zapata', '40892390', '20-40892390-8', '01124789801', null),
    (null, 'Raul', 'Rivera', '38898340', '20-38898340-8', '01134824212', 'raulrivera03@gmail.com'),
    (null, 'Gabriela', 'Jimenez', '42893400', '20-42893400-8', '01145789812', null);
    
INSERT INTO direccion_clientes 
VALUES
	(null, 'Santo Domingo 1870', '1856', 'Sur', 1),
    (null, 'Juan Roca 110', '1953', 'Sur', 2),
    (null, 'Simon Bolivar 270', '2136', 'Norte', 3),
    (null, 'Rodrigurez 1420', '3516', 'Norte', 4),
    (null, 'Hipolito Yrogoyen 763', '1552', 'Sur', 5);
    
INSERT INTO productos
VALUES
	(null, 'Mouse', 'Logitech', 'G502'),
    (null, 'Mouse', 'Corsair', 'R32'),
    (null, 'Mouse', 'Corsair', 'R202'),
    (null, 'Teclado', 'Logitech', 'G809'),
    (null, 'Teclado', 'Corsair', 'R302');
    
INSERT INTO detalle_productos
VALUES
	(null, 1, 10450, 35, 20498720),
    (null, 2, 15450, 27, 20452439),
    (null, 3, 19450, 30, 30492920),
    (null, 4, 20350, 21, 20218745),
    (null, 5, 25900, 15, 21495427);
    
INSERT INTO empleados
VALUES
	(null, 'Agustin', 'Gonzales', 43897654, 01134567421),
    (null, 'Ruben', 'Montiel', 37897654, 01132368823),
    (null, 'Orlando', 'Rodriguez', 39112223, 01124337495),
    (null, 'Lucas', 'Suarez', 41843611, 01133521411),
    (null, 'Martin', 'Garcia', 40227631, 01122563128);
    
INSERT INTO area_empleados 
VALUES
	(null, 'Vendedor', 1),
    (null, 'Transportista', 2),
    (null, 'Preparacion', 3),
    (null, 'Vendedor', 4),
    (null, 'Facturacion', 5);
    
INSERT INTO pedidos
VALUES 
	(null, 20230123, 175400, 1),
    (null, 20230130, 200100, 2),
    (null, 20230122, 110700, 3),
    (null, 20230117, 90000, 4),
    (null, 20230118, 111900, 5);
    
INSERT INTO facturas
VALUES
	(null, 20230124, 175400, 1),
    (null, 20230131, 200100, 2),
    (null, 20230124, 110700, 3),
    (null, 20230118, 90000, 4),
    (null, 20230120, 111900, 5);
    
    
	
    