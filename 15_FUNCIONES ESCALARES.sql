use DBVENTAS

-- FUNCIONES ESCALARES
--1
create function f_nombreMes
 (@fecha datetime='2007/01/01')
  returns varchar(10)
  as
  begin
    declare @nombre varchar(10)
    set @nombre=
     case datename(month,@fecha)
       when 'January' then 'Enero'
       when 'February' then 'Febrero'
       when 'March' then 'Marzo'
       when 'April' then 'Abril'
       when 'May' then 'Mayo'
       when 'June' then 'Junio'
       when 'July' then 'Julio'
       when 'August' then 'Agosto'
       when 'September' then 'Setiembre'
       when 'October' then 'Octubre'
       when 'November' then 'Noviembre'
       when 'December' then 'Diciembre'
     end--case
    return @nombre
 end;

 --2
 create function f_promedio
 (@valor1 decimal(4,2),
  @valor2 decimal(4,2)
 )
 returns decimal (6,2)
 as
 begin 
   declare @resultado decimal(6,2)
   set @resultado=(@valor1+@valor2)/2
   return @resultado
 end;

 --3
CREATE FUNCTION dbo.Stock(@ProductID int)  
RETURNS int   
AS   
BEGIN  
    DECLARE @ret int;  
    SELECT @ret = SUM(p.Quantity)   
    FROM Production.ProductInventory p   
    WHERE p.ProductID = @ProductID   
        AND p.LocationID = '6';  
     IF (@ret IS NULL)   
        SET @ret = 0;  
    RETURN @ret;  
END; 

--4
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION cantidadcuadrada
(
    @VALOR FLOAT
)
RETURNS FLOAT
AS
BEGIN
    DECLARE @RESULTADO FLOAT;
    SET @RESULTADO = SQRT(@VALOR);
 
    RETURN @RESULTADO;
END
GO

--5
CREATE FUNCTION Iva  (@DATE money)
RETURNS money
AS
BEGIN
Declare @iva money
Set  @Iva=@date*0.12
Return(@iva)
END






