use DBVENTAS

--FUNCIONES CON VALORES DE TABLA
--1
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION dbo.PRODUCTO_VALOR 
(	
	@IdCategoria nchar (10)
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT        PRODUCTO.*
	FROM            PRODUCTO
	WHERE        (IdCategoria = @IdCategoria)
)
GO

--2
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION dbo.VENTA_VALOR_TIENDA
(	
	@IdTienda nchar (10)
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT        VENTA.*
	FROM            VENTA
	WHERE        (IdTienda = @IdTienda)
)
GO

--3
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION dbo.VENTA_VALOR_USUARIO
(	
	@IdUsuario nchar (10)
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT        VENTA.*
	FROM            VENTA
	WHERE        (IdUsuario = @IdUsuario)
)
GO

--4
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION dbo.VENTA_VALOR_CLIENTE
(	
	@IdCliente nchar (10)
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT        VENTA.*
	FROM            VENTA
	WHERE        (IdCliente = @IdCliente)
)
GO

--5
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION dbo.DETALLE_COMPRA_VALOR
(	
	@IdDetalleCompra nchar (10)
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT        DETALLE_COMPRA.*
	FROM            DETALLE_COMPRA
	WHERE        (IdCompra = @IdDetalleCompra)
)
GO

