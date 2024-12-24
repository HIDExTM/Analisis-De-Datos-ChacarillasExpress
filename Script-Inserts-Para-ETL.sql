Use LavanderiaChacarillaExpress

select nombre,apellidos,telefono,direccion,genero,D.descdistrito from Clientes
inner join Distrito D on D.iddistrito = Clientes.iddistrito

select nombre,apellidos,telefono,direccion,genero,DNI,C.desccargo from Empleado 
inner join Cargo C on C.idcargo = Empleado.idcargo

select descprenda,color,material,t.desctipolavado,costo_unitario from Prenda 
inner join TipoLavado T on T.idtipolavado = Prenda.idtipolavado

select descestadooorden from EstadoOrden 

select descestadopago from ESTOPAGO 

select desctipocomprobante from TipoComprobante 

select descsucursal from Sucursal 


SELECT DISTINCT
    fecha_entrada AS fecha,
    CONVERT(INT, DATEPART(YEAR, TRY_CONVERT(DATE, fecha_entrada, 23))) AS Anio,
    CONVERT(INT, DATEPART(MONTH, TRY_CONVERT(DATE, fecha_entrada, 23))) AS Mes,
    CONVERT(INT, DATEPART(DAY, TRY_CONVERT(DATE, fecha_entrada, 23))) AS Dia
FROM OrdeLavado;





SELECT 
    dsu.idsucursal as idsucursal,
    cli.idcliente as idcliente,
    emp.idempleado as idempleado,
    op.idprenda as idprenda,
    tim.idtiempo as idtiempo,
    op.cantidad as cantidad,
    op.costo_total as costo,
    dtp.idtipocomprobante as idcomprobante,
    dep.idestadopago as idestadopago,
    deo.idestadooroden as idestadoorden

FROM LavanderiaChacarillaExpress.dbo.OrdeLavado ct
INNER JOIN LavanderiaChacarillaExpress.dbo.Clientes c ON c.idcliente = ct.idcliente
INNER JOIN LavanderiaChacarillaExpress.dbo.Empleado e ON e.idempleado = ct.idempleado
INNER JOIN LavanderiaChacarillaExpress.dbo.OrdenLavado_Prenda op ON op.idorden = ct.idorden
INNER JOIN LavanderiaChacarillaExpress.dbo.Prenda p ON p.idprenda = op.idprenda
INNER JOIN LavanderiaChacarillaExpress.dbo.EstadoOrden eo ON eo.idestadooroden = ct.idestadooroden
INNER JOIN LavanderiaChacarillaExpress.dbo.ESTOPAGO ep ON ep.idestadopago = ct.idestadopago
INNER JOIN LavanderiaChacarillaExpress.dbo.TipoComprobante tp ON tp.idtipocomprobante = ct.idtipocomprobante
INNER JOIN LavanderiaChacarillaExpress.dbo.Sucursal su ON su.idsucursal = ct.idsucursal

INNER JOIN LavanderiaChacarillaExpressDT.dbo.DIM_SUCURSAL dsu ON dsu.idsucursal = su.idsucursal
INNER JOIN LavanderiaChacarillaExpressDT.dbo.DIM_ESTADOORDEN deo ON deo.idestadooroden = eo.idestadooroden
INNER JOIN LavanderiaChacarillaExpressDT.dbo.DIM_ESTADOPAGO dep ON dep.idestadopago = ep.idestadopago
INNER JOIN LavanderiaChacarillaExpressDT.dbo.DIM_CLIENTE cli ON cli.idcliente = c.idcliente
INNER JOIN LavanderiaChacarillaExpressDT.dbo.DIM_EMPLEADO emp ON emp.idempleado = e.idempleado
INNER JOIN LavanderiaChacarillaExpressDT.dbo.DIM_PRENDAS epren ON epren.idprenda = p.idprenda
INNER JOIN LavanderiaChacarillaExpressDT.dbo.DIM_TIPOCOMPROBANTE dtp ON dtp.idtipocomprobante = tp.idtipocomprobante
INNER JOIN LavanderiaChacarillaExpressDT.dbo.DIM_TIEMPO tim ON tim.fecha = ct.fecha_entrada;


SELECT
    SU.idsucursal,
    CLI.idcliente,
    EMP.idempleado,
    TI.idtiempo,
    PRE.idprenda,
    OLP.cantidad,
    OL.costo_total,
    EP.idestadopago,
    EO.idestadooroden,
    TC.idtipocomprobante
FROM
    LavanderiaChacarillaExpress.dbo.OrdeLavado OL
    INNER JOIN LavanderiaChacarillaExpress.dbo.OrdenLavado_Prenda OLP ON OL.idorden = OLP.idorden
    INNER JOIN LavanderiaChacarillaExpressDT.dbo.DIM_SUCURSAL SU ON OL.idsucursal = SU.idsucursal
    INNER JOIN LavanderiaChacarillaExpressDT.dbo.DIM_CLIENTE CLI ON OL.idcliente = CLI.idcliente
    INNER JOIN LavanderiaChacarillaExpressDT.dbo.DIM_EMPLEADO EMP ON OL.idempleado = EMP.idempleado
    INNER JOIN LavanderiaChacarillaExpressDT.dbo.DIM_TIEMPO TI ON OL.fecha_entrada = TI.fecha
    INNER JOIN LavanderiaChacarillaExpressDT.dbo.DIM_PRENDAS PRE ON OLP.idprenda = PRE.idprenda
    INNER JOIN LavanderiaChacarillaExpressDT.dbo.DIM_ESTADOPAGO EP ON OL.idestadopago = EP.idestadopago
    INNER JOIN LavanderiaChacarillaExpressDT.dbo.DIM_ESTADOORDEN EO ON OL.idestadooroden = EO.idestadooroden
    INNER JOIN LavanderiaChacarillaExpressDT.dbo.DIM_TIPOCOMPROBANTE TC ON OL.idtipocomprobante = TC.idtipocomprobante;










