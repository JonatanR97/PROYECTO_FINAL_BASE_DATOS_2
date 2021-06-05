USE DBVENTAS
GO

--BITACORA DE LA TABLA PRODUCTO

alter database DBVENTAS add filegroup bitacoras;

alter database DBVENTAS 
add file (
	name='bitacora_PRODUCTO',
	filename = 'C:\BaseDatos\bitacoras\bitacora_PRODUCTO.ndf',
	size = 1MB
)	to filegroup bitacoras;

use DBVENTAS
exec sp_helpfilegroup
exec sp_helpfile

create table bitacora_PRODUCTO(
id_bitacora int identity primary key,

	evento varchar(15), --tipo de evento insert update delete
	tipo_reg varchar(3),--tipo de registro new u old
	inicio_sesion varchar(50),--nombre del login del usuario
	user1 varchar(50), -- nombre del usuario que dispara al evento
	aplicacion varchar(60),--la aplicacion que dispara al evento
	hostname varchar(30),--el host que dispara el evento
	fecha datetime not null default getdate(),--fecha en que ocurre el evento

	IdProducto int ,
	Codigo varchar(100),
	ValorCodigo int,
	Nombre varchar(100),
	Descripcion varchar(100),
	Activo bit default 1,
	Usuario varchar(50),
	

	constraint ck_evento check (evento in ('I','U','D')),
	constraint ck_tipo_reg check (tipo_reg in ('old','new'))
) ON bitacoras;

--TRIGGER PARA INSERTAR DATOS
create or alter trigger trigger_insert_producto
on PRODUCTO
AFTER INSERT
NOT FOR REPLICATION 
AS

	insert into bitacora_PRODUCTO
	(evento,
	tipo_reg,
	inicio_sesion,
	user1,
	aplicacion,
	hostname,
	IdProducto, Codigo, ValorCodigo, Nombre, Descripcion, Activo, Usuario)

	SELECT 'I',
	'new',
	SUSER_NAME(),
	USER_NAME(),
	APP_NAME(),
	HOST_NAME(),
	IdProducto,
	Codigo,
	ValorCodigo, 
	Nombre, 
	Descripcion, 
	Activo,
	Usuario

	from inserted
	print 'Trigger after insert disparado'

--TRIGGER PARA UPDATE
create or alter trigger trigger_update_producto
on PRODUCTO
AFTER update
NOT FOR REPLICATION 
AS

	insert into bitacora_PRODUCTO
	(evento,
	tipo_reg,
	inicio_sesion,
	user1,
	aplicacion,
	hostname,
	IdProducto, Codigo, ValorCodigo, Nombre, Descripcion, Activo, Usuario)

	SELECT 'U',
	'old',
	SUSER_NAME(),
	USER_NAME(),
	APP_NAME(),
	HOST_NAME(),
	IdProducto,
	Codigo,
	ValorCodigo, 
	Nombre, 
	Descripcion, 
	Activo,
	Usuario

	from deleted;

	insert into bitacora_PRODUCTO
	(evento,
	tipo_reg,
	inicio_sesion,
	user1,
	aplicacion,
	hostname,
	IdProducto, Codigo, ValorCodigo, Nombre, Descripcion, Activo, Usuario)

	SELECT 'U',
	'new',
	SUSER_NAME(),
	USER_NAME(),
	APP_NAME(),
	HOST_NAME(),
	IdProducto,
	Codigo,
	ValorCodigo, 
	Nombre, 
	Descripcion, 
	Activo,
	Usuario

	from inserted;

	print 'Trigger after update disparado'

--TREGGER PARA DELETED
create or alter trigger trigger_deleted_producto
on PRODUCTO
AFTER delete
NOT FOR REPLICATION 
AS

	insert into bitacora_PRODUCTO
	(evento,
	tipo_reg,
	inicio_sesion,
	user1,
	aplicacion,
	hostname,
	IdProducto, Codigo, ValorCodigo, Nombre, Descripcion, Activo, Usuario)

	SELECT 'D',
	'old',
	SUSER_NAME(),
	USER_NAME(),
	APP_NAME(),
	HOST_NAME(),
	IdProducto,
	Codigo,
	ValorCodigo, 
	Nombre, 
	Descripcion, 
	Activo,
	Usuario

	from deleted;
	print 'Trigger after deleted disparado'

--OBTENER TODOS LOS TRIGGERS CREADOS
SELECT OBJECT_NAME(parent_id) as Parent_Object_Name, *
from sys.triggers
go

--PROBAR LOS TRIGGERS
select * from PRODUCTO
select * from bitacora_PRODUCTO

insert into PRODUCTO (Codigo, ValorCodigo, Nombre, Descripcion, Activo, Usuario)
values ('000012', '12', 'Vold', 'Bebida ', '1', 'Eren');

delete from PRODUCTO 
where IdProducto = 12
go
