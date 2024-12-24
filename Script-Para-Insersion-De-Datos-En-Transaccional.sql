use LavanderiaChacarillaExpress
BULK INSERT 
	Clientes
From 'C:\Users\hidet\OneDrive\Escritorio\Big Data\Inserts\Clientes.csv'
with (
	FIELDTERMINATOR = ';',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2);
	select * from Clientes

BULK INSERT 
	Cargo
From 'C:\Users\hidet\OneDrive\Escritorio\Big Data\Inserts\Cargo.csv'
with (
	FIELDTERMINATOR = ';',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2);
	select * from Cargo

BULK INSERT 
	Empleado
From 'C:\Users\hidet\OneDrive\Escritorio\Big Data\Inserts\Empleados.csv'
with (
	FIELDTERMINATOR = ';',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2);
	select * from Empleado


BULK INSERT 
	Prenda
From 'C:\Users\hidet\OneDrive\Escritorio\Big Data\Inserts\Prendas.csv'
with (
	FIELDTERMINATOR = ';',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2);
	select * from Prenda

BULK INSERT 
	TipoLavado
From 'C:\Users\hidet\OneDrive\Escritorio\Big Data\Inserts\TipoLavado.csv'
with (
	FIELDTERMINATOR = ';',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2);
	select * from TipoLavado

BULK INSERT 
	Distrito
From 'C:\Users\hidet\OneDrive\Escritorio\Big Data\Inserts\Distrito.csv'
with (
	FIELDTERMINATOR = ';',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2);
	select * from Distrito

BULK INSERT 
	OrdeLavado
From 'C:\Users\hidet\OneDrive\Escritorio\Big Data\Inserts\Ordenes.csv'
with (
	FIELDTERMINATOR = ';',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2);
	select * from OrdeLavado

BULK INSERT 
	OrdenLavado_Prenda
From 'C:\Users\hidet\OneDrive\Escritorio\Big Data\Inserts\Detalles.csv'
with (
	FIELDTERMINATOR = ';',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2);
	select * from OrdenLavado_Prenda

BULK INSERT 
	EstadoOrden
From 'C:\Users\hidet\OneDrive\Escritorio\Big Data\Inserts\EstadoOrden.csv'
with (
	FIELDTERMINATOR = ';',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2);
	select * from EstadoOrden

BULK INSERT 
	ESTOPAGO
From 'C:\Users\hidet\OneDrive\Escritorio\Big Data\Inserts\EstadoPago.csv'
with (
	FIELDTERMINATOR = ';',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2);
	select * from ESTOPAGO

BULK INSERT 
	TipoComprobante
From 'C:\Users\hidet\OneDrive\Escritorio\Big Data\Inserts\TipoComprobante.csv'
with (
	FIELDTERMINATOR = ';',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2);
	select * from TipoComprobante

BULK INSERT 
	Sucursal
From 'C:\Users\hidet\OneDrive\Escritorio\Big Data\Inserts\Sucursal.csv'
with (
	FIELDTERMINATOR = ';',
	ROWTERMINATOR = '\n',
	FIRSTROW = 2);
	select * from Sucursal



SELECT idorden , idprenda,cantidad,costo_total
FROM OrdenLavado_Prenda
ORDER BY idorden asc;

UPDATE OrdenLavado_Prenda
SET costo_total = op.cantidad * p.costo_unitario
FROM OrdenLavado_Prenda op
INNER JOIN Prenda p ON op.idprenda = p.idprenda;

UPDATE OrdeLavado
SET costo_total = (
    SELECT SUM(costo_total) 
    FROM OrdenLavado_Prenda 
    WHERE OrdenLavado_Prenda.idorden = OrdeLavado.idorden
)

UPDATE OrdeLavado
SET fecha_entrada = SUBSTRING(REPLACE(fecha_entrada, '/', '-'), 7, 4) + '-' + 
                    SUBSTRING(REPLACE(fecha_entrada, '/', '-'), 4, 2) + '-' + 
                    SUBSTRING(REPLACE(fecha_entrada, '/', '-'), 1, 2),
    fecha_salida = SUBSTRING(REPLACE(fecha_salida, '/', '-'), 7, 4) + '-' + 
                   SUBSTRING(REPLACE(fecha_salida, '/', '-'), 4, 2) + '-' + 
                   SUBSTRING(REPLACE(fecha_salida, '/', '-'), 1, 2);



SELECT * FROM OrdeLavado;
SELECT * FROM OrdenLavado_Prenda;
SELECT * FROM Sucursal;







