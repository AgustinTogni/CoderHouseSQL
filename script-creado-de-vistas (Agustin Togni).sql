
use distribuidora;

CREATE OR REPLACE VIEW clientesdni_vista AS
	(SELECT CL_Nombre, CL_Apellido, CL_DNI FROM clientes);
    
CREATE OR REPLACE VIEW productocorsair_vista AS
	(SELECT ID_Producto, Producto, Marca, Modelo FROM productos
    WHERE Marca LIKE('%Corsair%'));
    
CREATE OR REPLACE VIEW 150kfacturas_vista AS
	(SELECT ID_Factura, FC_Fecha, FC_Monto FROM facturas
    WHERE FC_Monto > 150000);

CREATE OR REPLACE VIEW precioslogitech_vista AS
	(SELECT T1.ID_Producto, T1.Producto, T1.Marca, T1.Modelo, T2.PT_Precio FROM productos T1
    JOIN detalle_productos T2 ON (T1.ID_Producto = T2.ID_Producto)
    WHERE T1.Marca = 'logitech');

CREATE OR REPLACE VIEW empleadosvendedores_vista AS
	(SELECT T1.ID_Empleado, T1.EP_Nombre, T1.EP_Apellido, T1.EP_DNI, T2.EP_Area FROM empleados T1
    JOIN area_empleados T2 ON (T1.ID_Empleado = T2.ID_Empleado)
    WHERE T2.EP_Area = 'Vendedor');
    
    
    


    



