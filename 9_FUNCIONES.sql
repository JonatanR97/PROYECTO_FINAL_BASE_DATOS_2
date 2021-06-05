use DBVENTAS

-- FUNCIONES 
--1
CREATE FUNCTION ventaYdetalle (@detalle_venta as varchar(30))
RETURNS TABLE
AS
     RETURN (SELECT v.IdVenta,(v.Codigo + ' ' +
     v.ImporteRecibido) as VENTA,d.Cantidad as DETALLE_VENTA
     from VENTA v inner join DETALLE_VENTA d
     on d.IdDetalleVenta=v.IdCliente
     where d.Cantidad=@detalle_venta)
GO

--2
CREATE FUNCTION productoxcategoria (@categoria as varchar(30))
RETURNS TABLE
AS
     RETURN (SELECT pro.IdProducto,(pro.nombre + ' ' +
     pro.Codigo) as PRODUCTO,cat.Descripcion as CATEGORIA
     from PRODUCTO pro inner join CATEGORIA cat
     on cat.IdCategoria=pro.IdCategoria
     where cat.Descripcion=@categoria)
GO

--3
CREATE FUNCTION compraproveedor (@proveedor as varchar(30))
RETURNS TABLE
AS
     RETURN (SELECT com.IdCompra,(com.TotalCosto + ' ' +
     com.FechaRegistro) as COMPRA,pro.Direccion as PROVEEDOR
     from COMPRA com inner join PROVEEDOR pro
     on pro.IdProveedor=com.IdProveedor
     where pro.Direccion=@proveedor)
GO

--4
CREATE FUNCTION compraxtienda (@tienda as varchar(30))
RETURNS TABLE
AS
     RETURN (SELECT com.IdCompra,(com.TipoComprobante + ' ' +
     com.FechaRegistro) as COMPRA,t.Nombre as TIENDA
     from COMPRA com inner join TIENDA t
     on t.IdTienda=com.IdTienda
     where t.Nombre=@tienda)
GO

--5
CREATE FUNCTION detallexcompra (@compra as varchar(30))
RETURNS TABLE
AS
     RETURN (SELECT com.IdDetalleCompra,(com.TotalCosto + ' ' +
     com.FechaRegistro) as DETALLE_COMPRA,pro.TipoComprobante as COMPRA
     from DETALLE_COMPRA com inner join COMPRA pro
     on pro.IdCompra=com.IdCompra
     where pro.TipoComprobante=@compra)
GO

--6
CREATE FUNCTION comprausuario (@usuario as varchar(30))
RETURNS TABLE
AS
     RETURN (SELECT com.IdCompra,(com.TotalCosto + ' ' +
     com.FechaRegistro) as COMPRA,u.Nombres as USUARIO
     from COMPRA com inner join USUARIO u
     on u.IdUsuario=com.IdUsuario
     where u.Nombres=@usuario)
GO

--7
CREATE FUNCTION ventaYtienda (@tienda as varchar(30))
RETURNS TABLE
AS
     RETURN (SELECT v.IdVenta,(v.Codigo + ' ' +
     v.FechaRegistro) as VENTA,t.Nombre as TIENDA
     from VENTA v inner join TIENDA t
     on t.IdTienda=v.IdTienda
     where t.Nombre=@tienda)
GO

--8
CREATE FUNCTION ventacliente (@cliente as varchar(30))
RETURNS TABLE
AS
     RETURN (SELECT v.IdVenta,(v.Codigo + ' ' +
     v.FechaRegistro) as VENTA,c.Nombre as CLIENTE
     from VENTA v inner join CLIENTE c
     on c.IdCliente=v.IdCliente
     where c.Nombre=@cliente)
GO



