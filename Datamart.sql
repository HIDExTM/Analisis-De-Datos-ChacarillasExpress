--BASE DE DATOS LavanderiaChacarillaExpressDT--

use master

ALTER DATABASE LavanderiaChacarillaExpressDT SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

--ELIMINAR BASE POR SI YA EXISTE--
if exists (select name from sys.databases 
	where name = 'LavanderiaChacarillaExpressDT')
	Begin
		drop database LavanderiaChacarillaExpressDT
	End
go
--CREAR BASE--
Create Database LavanderiaChacarillaExpressDT
go


use LavanderiaChacarillaExpressDT

CREATE TABLE HECHO_ORDENLAVADO (
	idsucursal INT NOT NULL,
    idcliente INT NOT NULL,
    idempleado INT NOT NULL,
    idtiempo INT NOT NULL,
    idprenda INT NOT NULL,
    cantidad INT NOT NULL,
	costo_total INT NOT NULL,
    idestadopago INT NOT NULL,
    idestadooroden INT NOT NULL,
	idtipocomprobante INT NOT NULL,
);

CREATE TABLE DIM_TIEMPO (
    idtiempo INT IDENTITY (1,1) PRIMARY KEY,
	fecha VARCHAR (20) NOT NULL,
	anio INT NOT NULL,
	mes INT NOT NULL,
	dia int NOT NULL,
);

CREATE TABLE DIM_PRENDAS (
    idprenda INT IDENTITY (1,1) PRIMARY KEY,
    descprenda VARCHAR(20) NOT NULL,
    color VARCHAR(10) NOT NULL,
    material VARCHAR(15) NOT NULL,
    desctipolavado VARCHAR(15) NOT NULL,
    costo_unitario INT NOT NULL
);

CREATE TABLE DIM_CLIENTE (
    idcliente INT IDENTITY (1,1) PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellidos VARCHAR(20) NOT NULL,
    telefono INT NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    genero VARCHAR(10) NOT NULL,
    descdistrico VARCHAR(20) NOT NULL
);

CREATE TABLE DIM_EMPLEADO (
    idempleado INT IDENTITY (1,1) PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellidos VARCHAR(20) NOT NULL,
    telefono INT NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    genero VARCHAR(10) NOT NULL,
    DNI INT NOT NULL,
    desccargo VARCHAR(20) NOT NULL,
);

CREATE TABLE DIM_ESTADOORDEN (
    idestadooroden INT IDENTITY (1,1) PRIMARY KEY,
    descestadoorden VARCHAR(30) NOT NULL,
);

CREATE TABLE DIM_ESTADOPAGO (
    idestadopago INT IDENTITY (1,1) PRIMARY KEY,
    descestadopago VARCHAR(30) NOT NULL,
);

CREATE TABLE DIM_TIPOCOMPROBANTE (
    idtipocomprobante INT IDENTITY (1,1) PRIMARY KEY,
    desctipocomprobante VARCHAR(30) NOT NULL,
);

CREATE TABLE DIM_SUCURSAL(
    idsucursal INT IDENTITY (1,1) PRIMARY KEY,
    descsucursal VARCHAR(100) NOT NULL,
);


ALTER TABLE HECHO_ORDENLAVADO
ADD FOREIGN KEY (idcliente) REFERENCES DIM_CLIENTE(idcliente),
    FOREIGN KEY (idempleado) REFERENCES DIM_EMPLEADO(idempleado),
    FOREIGN KEY (idtiempo) REFERENCES DIM_TIEMPO(idtiempo),
    FOREIGN KEY (idprenda) REFERENCES DIM_PRENDAS(idprenda),
	FOREIGN KEY (idestadopago) REFERENCES DIM_ESTADOPAGO(idestadopago),
	FOREIGN KEY (idtipocomprobante) REFERENCES DIM_TIPOCOMPROBANTE(idtipocomprobante),
	FOREIGN KEY (idsucursal) REFERENCES DIM_SUCURSAL(idsucursal),
    FOREIGN KEY (idestadooroden) REFERENCES DIM_ESTADOORDEN(idestadooroden);


SELECT t.fecha, p.descprenda, SUM(h.cantidad) AS total_cantidad
FROM HECHO_ORDENLAVADO h
INNER JOIN DIM_PRENDAS p ON p.idprenda = h.idprenda
INNER JOIN DIM_TIEMPO t ON t.idtiempo = h.idtiempo
WHERE t.fecha = '2024-01-01'
GROUP BY t.fecha, p.descprenda;


select fecha from DIM_TIEMPO
where idtiempo = 7762

select idcliente,idprenda,cantidad,costo_total,idtiempo from HECHO_ORDENLAVADO
where idcliente= 3


