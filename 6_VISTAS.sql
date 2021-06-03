use DBVENTAS

--1
create View View_ClienteCompra
as
select c.IdCliente, c.Nombre, p.IdCompra, p.TotalCosto from CLIENTE
as c inner join COMPRA as p
on c.IdCliente = IdCliente

--como consutar esta vista
select * from View_ClienteCompra

--2
create View View_ClienteDetalleCompra
as
select c.IdCliente, c.Nombre, d.IdDetalleCompra, d.Cantidad, d.TotalCosto from CLIENTE
as c inner join DETALLE_COMPRA as d
on c.IdCliente = IdCliente

--como consutar esta vista
select * from View_ClienteDetalleCompra

--3
create View View_ClienteDetalleVenta
as
select c.IdCliente, c.Nombre, c.NumeroDocumento, d.IdDetalleVenta, d.Cantidad, d.ImporteTotal from CLIENTE
as c inner join DETALLE_VENTA as d
on c.IdCliente = IdCliente

--como consutar esta vista
select * from View_ClienteDetalleVenta

--4
create View View_UsuarioPermisos
as
select u.IdUsuario, u.Nombres, u.Apellidos, u.FechaRegistro, p.IdPermisos, p.Activo from USUARIO
as u inner join PERMISOS as p
on u.IdUsuario = IdUsuario

--como consutar esta vista
select * from View_UsuarioPermisos

--5
create View View_UsuarioRol
as
select u.IdUsuario, u.Nombres, u.Apellidos, r.IdRol, r.FechaRegistro, r.Activo from USUARIO
as u inner join ROL as r
on u.IdUsuario = IdUsuario

--como consutar esta vista
select * from View_UsuarioRol

--6
create View View_TiendaProducto
as
select t.IdTienda, t.Nombre, t.FechaRegistro, p.IdProductoTienda, p.Stock, p.Activo from TIENDA
as t inner join PRODUCTO_TIENDA as p
on t.IdTienda = IdProductoTienda

--como consutar esta vista
select * from View_TiendaProducto

--7
create View View_ProductoCategoria
as
select p.IdProducto, p.Codigo, p.Descripcion, c.IdCategoria, c.FechaRegistro, c.Activo from PRODUCTO
as p inner join CATEGORIA as c
on p.IdProducto = IdProducto

--como consutar esta vista
select * from View_ProductoCategoria

--8
create View View_ProductoProveedor
as
select p.IdProducto, p.Nombre, p.Descripcion, pr.IdProveedor, pr.FechaRegistro, pr.Activo from PRODUCTO
as p inner join PROVEEDOR as pr
on p.IdProducto = IdProducto

--como consutar esta vista
select * from View_ProductoProveedor






