use DBVENTAS

--1
--encriptar vista
ALTER VIEW View_ClienteCompra
with encryption
as
select c.IdCliente, c.Nombre, p.IdCompra, p.TotalCosto from CLIENTE
as c inner join COMPRA as p
on c.IdCliente = p.IdCompra 

--2
Alter View View_ClienteDetalleCompra
with encryption
as
select c.IdCliente, c.Nombre, d.IdDetalleCompra, d.Cantidad, d.TotalCosto from CLIENTE
as c inner join DETALLE_COMPRA as d
on c.IdCliente = IdCliente

--3
Alter View View_ClienteDetalleVenta
with encryption
as
select c.IdCliente, c.Nombre, c.NumeroDocumento, d.IdDetalleVenta, d.Cantidad, d.ImporteTotal from CLIENTE
as c inner join DETALLE_VENTA as d
on c.IdCliente = IdCliente

--4
Alter View View_UsuarioPermisos
with encryption
as
select u.IdUsuario, u.Nombres, u.Apellidos, u.FechaRegistro, p.IdPermisos, p.Activo from USUARIO
as u inner join PERMISOS as p
on u.IdUsuario = IdUsuario

--5
Alter View View_UsuarioRol
with encryption
as
select u.IdUsuario, u.Nombres, u.Apellidos, r.IdRol, r.FechaRegistro, r.Activo from USUARIO
as u inner join ROL as r
on u.IdUsuario = IdUsuario







