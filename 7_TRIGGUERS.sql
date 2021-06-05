use DBVENTAS

--TRIGGUERS
--1
go
create trigger TR_01 on Cliente for insert
as
if(select TipoDocumento from inserted)  < 0
Begin 
	print 'Documento Nulo' 
	RollBack 
End
go

--2
go
create trigger TR_02 on PRODUCTO_TIENDA for insert
as
if(select Stock from inserted)  < 0
Begin 
	print 'Stock no permite cantidades negativas' 
	RollBack 
End
go

--3
go
create trigger TR_03 on PRODUCTO_TIENDA for insert
as
if(select PrecioUnidadCompra from inserted)  < 0
Begin 
	print 'Precio de Unidad area Compra Negativa' 
	RollBack 
End
go

--4
go
create trigger TR_04 on PRODUCTO_TIENDA for insert
as
if(select PrecioUnidadVenta from inserted)  < 0
Begin 
	print 'Precio de Unidad area Venta Negativa' 
	RollBack 
End
go

--5
go
create trigger TR_05 on DETALLE_COMPRA for insert
as
if(select Cantidad from inserted)  < 0
Begin 
	print 'No se permite cantidades Negativas' 
	RollBack 
End
go

--6
go
create trigger TR_06 on DETALLE_COMPRA for insert
as
if(select TotalCosto from inserted)  < 0
Begin 
	print 'Costo Negativo' 
	RollBack 
End
go

--7
go
create trigger TR_07 on VENTA for insert
as
if(select CantidadProducto from inserted)  > 500
Begin 
	print 'Cantidad Maxima de Producto es de 500' 
	RollBack 
End
go

--8
go
create trigger TR_08 on VENTA for insert
as
if(select CantidadTotal from inserted)  > 500
Begin 
	print 'Cantidad Maxima permitida es de 500' 
	RollBack 
End
go

--9
go
create trigger TR_09 on COMPRA for insert
as
if(select TotalCosto from inserted)  < 0
Begin 
	print 'No se permite cantidades Negativas' 
	RollBack 
End
go

--10
go
create trigger TR_10 on DETALLE_VENTA for insert
as
if(select Cantidad from inserted)  < 0
Begin 
	print 'No se permite cantidades Negativas' 
	RollBack 
End
go
