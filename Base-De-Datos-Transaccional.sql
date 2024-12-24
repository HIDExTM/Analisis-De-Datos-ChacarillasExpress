--BASE DE DATOS LavanderiaChacarillaExpress--

use master

ALTER DATABASE LavanderiaChacarillaExpress SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

--ELIMINAR BASE POR SI YA EXISTE--
if exists (select name from sys.databases 
	where name = 'LavanderiaChacarillaExpress')
	Begin
		drop database LavanderiaChacarillaExpress
	End
go
--CREAR BASE--
Create Database LavanderiaChacarillaExpress
go


use LavanderiaChacarillaExpress


CREATE TABLE Distrito (
    iddistrito INT IDENTITY (1,1) PRIMARY KEY,
    descdistrito VARCHAR(255) NOT NULL,

); 

CREATE TABLE Clientes (
    idcliente INT IDENTITY (1,1) PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
	apellidos VARCHAR(255) NOT NULL,
	telefono VARCHAR(255) NOT NULL,
	direccion VARCHAR(255) NOT NULL,
	genero VARCHAR(255) NOT NULL,	
	iddistrito INT NOT NULL,
	FOREIGN KEY (iddistrito) REFERENCES Distrito(iddistrito),
);


CREATE TABLE Cargo (
    idcargo INT IDENTITY (1,1) PRIMARY KEY,
    desccargo VARCHAR(255) NOT NULL,

); 


CREATE TABLE Empleado (
    idempleado INT IDENTITY (1,1) PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
	apellidos VARCHAR(255) NOT NULL,
	telefono VARCHAR(255) NOT NULL,
	direccion VARCHAR(255) NOT NULL,
	genero VARCHAR(255) NOT NULL,	
	DNI VARCHAR(255) NOT NULL,
	idcargo int NOT NULL,
	FOREIGN KEY (idcargo) REFERENCES Cargo(idcargo),
);

CREATE TABLE TipoLavado (
    idtipolavado INT IDENTITY (1,1) PRIMARY KEY,
    desctipolavado VARCHAR(255) NOT NULL,

); 

CREATE TABLE Prenda (
	idprenda INT IDENTITY (1,1) PRIMARY KEY,
	descprenda VARCHAR (255) NOT NULL,
	color VARCHAR (255) NOT NULL,
	material VARCHAR (255) NOT NULL,
	idtipolavado INT NOT NULL,
	costo_unitario INT NOT NULL,
	FOREIGN KEY (idtipolavado) REFERENCES TipoLavado(idtipolavado)
);

CREATE TABLE ESTOPAGO (
	idestadopago int identity (1,1) PRIMARY KEY,
	descestadopago VARCHAR (255) NOT NULL,
	);

CREATE TABLE EstadoOrden (
	idestadooroden int identity (1,1) PRIMARY KEY,
	descestadooorden VARCHAR (255) NOT NULL,
	);

CREATE TABLE TipoComprobante (
	idtipocomprobante int identity (1,1) PRIMARY KEY,
	desctipocomprobante VARCHAR (255) NOT NULL,
	);

CREATE TABLE Sucursal (
	idsucursal int identity (1,1) PRIMARY KEY,
	descsucursal VARCHAR (255) NOT NULL,
	);

CREATE TABLE OrdeLavado (
	idorden INT IDENTITY (1,1) PRIMARY KEY,
	idsucursal INT,
	idcliente INT ,
	idempleado INT ,
	fecha_entrada VARCHAR (255) ,
	fecha_salida VARCHAR (255) ,
	idestadooroden INT ,
	idestadopago INT ,
	idtipocomprobante INT ,
	costo_total VARCHAR (255),
	FOREIGN KEY (idcliente) REFERENCES Clientes(idcliente),
	FOREIGN KEY (idempleado) REFERENCES Empleado(idempleado),
	FOREIGN KEY (idestadooroden) REFERENCES EstadoOrden(idestadooroden),
	FOREIGN KEY (idtipocomprobante) REFERENCES TipoComprobante(idtipocomprobante),
	FOREIGN KEY (idsucursal) REFERENCES Sucursal(idsucursal),
	FOREIGN KEY (idestadopago) REFERENCES ESTOPAGO(idestadopago),
);

CREATE TABLE OrdenLavado_Prenda (
    idorden INT NOT NULL,
    idprenda INT NOT NULL,
    cantidad INT NOT NULL,
	costo_total INT,
    FOREIGN KEY (idorden) REFERENCES OrdeLavado(idorden),
    FOREIGN KEY (idprenda) REFERENCES Prenda(idprenda)
);

select * from Cargo
select * from Empleado
select * from TipoLavado
select * from Prenda
select * from OrdeLavado
select * from OrdenLavado_Prenda
select * from Distrito
select * from Clientes
select * from EstadoOrden
select * from ESTOPAGO
select * from TipoComprobante


