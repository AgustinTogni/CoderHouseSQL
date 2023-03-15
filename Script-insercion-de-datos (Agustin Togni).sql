
-- Seleccionamos el esquema Distribuidora

USE Distribuidora;

-- Insertamos los datos a las tablas

INSERT INTO clientes 
VALUES
	(null, 'Agustin', 'Togni', '47891990', '20-47891990-8', '01145789812', 'agustintog2000@gmail.com'),
    (null, 'Gonzalo', 'Gonzales', '34821920', '20-34821920-8', '01136781012', 'gonzalogon19@gmail.com'),
    (null, 'Jorge', 'Zapata', '40892390', '20-40892390-8', '01124789801', null),
    (null, 'Raul', 'Rivera', '38898340', '20-38898340-8', '01134824212', 'raulrivera03@gmail.com'),
    (null, 'Martin', 'Rodriguez', '32834110', '20-32834110-8', '01132781277', 'martinrodriguez23@gmail.com'),
    (null, 'Jose', 'Gonzales', '22894301', '20-22894301-8', '01133780015', null),
    (null, 'Orlando', 'Pereyra', '43892388', '20-43892388-8', '01138711834', 'orlandopereyra34@gmail.com'),
    (null, 'Agustin', 'Ramirez', '43892211', '20-43892211-8', '01143732112', 'agustinramirez21@gmail.com'),
    (null, 'Gabriela', 'Jazmin', '34891176', '20-34891176-8', '01141732815', null),
    (null, 'Jorge', 'Gonzales', '43321100', '20-43321100-8', '01134722112', null),
    (null, 'Martin', 'Zapata', '43811220', '20-43811220-8', '01139722111', 'martinzapata11@gmail.com'),
    (null, 'Sebastian', 'Mostles', '44113560', '20-44113560-8', '01141722111', null),
    (null, 'Valentin', 'Jimenez', '43823444', '20-43823444-8', '01143722112', null),
    (null, 'Marcelo', 'Gonzales', '43223411', '20-43223411-8', '01123119811', null),
    (null, 'Myke', 'Montana', '42811422', '20-42811422-8', '01139744815', 'mykemontana22@gmail.com');
    
INSERT INTO direccion_clientes 
VALUES
	(null, 'Santo Domingo 1870', '1856', 'Sur', 1),
    (null, 'Juan Roca 110', '1953', 'Sur', 2),
    (null, 'Simon Bolivar 270', '2136', 'Norte', 3),
    (null, 'Rodrigurez 1420', '3516', 'Norte', 4),
    (null, 'Hipolito Yrogoyen 763', '1552', 'Sur', 5),
    (null, 'Wilson 722', '2222', 'Sur', 6),
    (null, 'Palumbo 233', '2952', 'Sur', 7),
    (null, 'San Martin 332', '2052', 'Norte', 8),
    (null, 'San Martin 444', '1672', 'Norte', 9),
    (null, 'Rafael Calzada 656', '1222', 'Norte', 10),
    (null, 'Adrogue 212', '1882', 'Sur', 11),
    (null, 'Burzaco 321', '1888', 'Sur', 12),
    (null, 'El Bolson 675', '1213', 'Norte', 13),
    (null, 'Hipolyto 809', '1022', 'Norte', 14),
    (null, 'Juan Manuel 980', '1112', 'Sur', 15);
    
    
INSERT INTO productos
VALUES
	(null, 'Mouse', 'Logitech', 'G502'),
    (null, 'Mouse', 'Corsair', 'R32'),
    (null, 'Mouse', 'Corsair', 'R202'),
    (null, 'Teclado', 'Logitech', 'G809'),
    (null, 'Teclado', 'Corsair', 'R302'),
    (null, 'Mouse', 'Logitech', 'G202'),
    (null, 'Mouse', 'Logitech', 'G102'),
    (null, 'Teclado', 'Corsair', 'R502'),
    (null, 'Mouse', 'Corsair', 'R232'),
    (null, 'Mouse', 'Corsair', 'R552'),
    (null, 'Mouse', 'Corsair', 'R912'),
    (null, 'Teclado', 'Logitech', 'G552'),
    (null, 'Teclado', 'Logitech', 'G772'),
    (null, 'Mouse', 'Corsair', 'R302'),
    (null, 'Mouse', 'Logitech', 'G522');
    
INSERT INTO detalle_productos
VALUES
	(null, 1, 8431.10, 10324.35, 35, 20498720),
    (null, 2, 12452.39, 15323.21, 27, 20452439),
    (null, 3, 13431.98, 19546.12, 30, 30492920),
    (null, 4, 17842.99, 20873.34, 21, 20218745),
    (null, 5, 21874.65, 25476.99, 15, 21495427),
    (null, 6, 24844.22, 28226.35, 22, 21435422),
    (null, 7, 11824.11, 14226.55, 11, 32424327),
    (null, 8, 18344.66, 21226.88, 45, 22492227),
    (null, 9, 14231.34, 17331.23, 23, 34494427),
    (null, 10, 16774.67, 19556.34, 51, 11423427),
    (null, 11, 25664.98, 28226.65, 24, 25492227),
    (null, 12, 27994.23, 31436.76, 17, 24494421),
    (null, 13, 24553.45, 27223.22, 18, 11491127),
    (null, 14, 13224.44, 16231.31, 21, 33493427),
    (null, 15, 10234.91, 14345.34, 22, 45492226);
    
INSERT INTO empleados
VALUES
	(null, 'Agustin', 'Gonzales', 43897654, 01134567421),
    (null, 'Ruben', 'Montiel', 37897654, 01132368823),
    (null, 'Orlando', 'Rodriguez', 39112223, 01124337495),
    (null, 'Lucas', 'Suarez', 41843611, 01133521411),
    (null, 'Gonzalo', 'Garcia', 42211634, 01122563128),
    (null, 'Jorge', 'Gonzales', 41111621, 01132561128),
    (null, 'Raul', 'Rodriguez', 39234613, 01123522166),
    (null, 'Daniel', 'Pereyra', 37222311, 01128861128),
    (null, 'Orlando', 'Gonzales', 45123231, 01133521121),
    (null, 'Lucas', 'Togni', 44344621, 01112433199),
    (null, 'Manuel', 'Torres', 42234311, 01134555128),
    (null, 'Myke', 'Balassi', 43337221, 01121263145),
    (null, 'Mateo', 'Gonzales', 37223331, 01123561128),
    (null, 'Sebastian', 'Suarez', 41222331, 01123463111),
    (null, 'Valentin', 'Rodriguez', 46237771, 01144562228);
    
INSERT INTO area_empleados 
VALUES
	(null, 'Vendedor', 1),
    (null, 'Transportista', 2),
    (null, 'Preparacion', 3),
    (null, 'Vendedor', 4),
    (null, 'Facturacion', 5),
    (null, 'Vendedor', 6),
    (null, 'Vendedor', 7),
    (null, 'Vendedor', 8),
    (null, 'Facturacion', 9),
    (null, 'Preparacion', 10),
    (null, 'Transportista', 11),
    (null, 'Facturacion', 12),
    (null, 'Facturacion', 13),
    (null, 'Transportista', 14),
    (null, 'Vendedor', 15);
    
INSERT INTO pedidos
VALUES 
	(null, 20230123, 175324.32, 1),
    (null, 20230124, 200999.21, 2),
    (null, 20230122, 111993.34, 3),
    (null, 20230117, 91233.32, 4),
    (null, 20230118, 119324.98, 5),
    (null, 20230212, 123224.22, 6),
    (null, 20230213, 143225.32, 7),
    (null, 20230522, 110214.11, 8),
    (null, 20230523, 140204.77, 9),
    (null, 20230614, 109222.45, 10),
    (null, 20231027, 90221.34, 11),
    (null, 20231024, 89114.33, 12),
    (null, 20231111, 95121.76, 13),
    (null, 20231223, 99111.66, 14),
    (null, 20230618, 122114.23, 15);
    
INSERT INTO facturas
VALUES
	(null, 20230124, 178744.32, 1),
    (null, 20230125, 209883.31, 2),
    (null, 20230124, 112999.87, 3),
    (null, 20230118, 92983.14, 4),
    (null, 20230120, 121394.32, 5),
    (null, 20230222, 124114.21, 6),
    (null, 20230213, 145555.34, 7),
    (null, 20230523, 111224.17, 8),
    (null, 20230519, 141404.88, 9),
    (null, 20230621, 110112.99, 10),
    (null, 20231026, 91321.12, 11),
    (null, 20231025, 90114.34, 12),
    (null, 20231126, 97222.76, 13),
    (null, 20231224, 100123.87, 14),
    (null, 20230621, 123224.33, 15);
    
    
	
    