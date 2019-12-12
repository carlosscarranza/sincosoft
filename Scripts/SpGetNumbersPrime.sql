USE [SINCOABR]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF EXISTS (SELECT * FROM SYS.OBJECTS WHERE TYPE = 'P' AND NAME = 'SPGETNUMBERSPRIME') 
	DROP PROCEDURE [DBO].[SPGETNUMBERSPRIME] 
GO 

CREATE PROCEDURE [DBO].[SPGETNUMBERSPRIME] 
@INICIO INT,
@FIN INT
AS
BEGIN

IF (ISNULL(@INICIO, 0) = 0)
BEGIN
    RAISERROR('Parametro Invalido: @INICIO no puede ser NULL o cero', 18, 0)
    RETURN
END

IF (ISNULL(@FIN, 0) = 0)
BEGIN
    RAISERROR('Parametro Invalido: @FIN no puede ser NULL o cero', 18, 0)
    RETURN
END

--Obtengo la cantidad de numeros exacta haciendo un redondeo
DECLARE  @CANTIDAD INT = CEILING((@FIN - @INICIO + 1) / 2.0);

;WITH PRIMERO AS
(
    SELECT  TMP.PROPIEDAD1
    FROM        (VALUES (0), (0), (0), (0), (0), (0), (0), (0), (0), (0)) TMP(PROPIEDAD1)
), SEGUNDO AS
(
    SELECT  0 AS [PROPIEDAD2]
    FROM        PRIMERO T1
    CROSS JOIN  PRIMERO T2
    CROSS JOIN  PRIMERO T3
), BASE AS --Obtengo la base inicial de numeros a encontrar en valores de 0
(
    SELECT  TOP( CONVERT( INT, CEILING(SQRT(@FIN)) ) ) ROW_NUMBER() OVER (ORDER BY (SELECT 1)) AS [NUM]
    FROM        SEGUNDO S1
    CROSS JOIN  SEGUNDO S2
), NUMS AS --Obtengo los numeros de inicio a fin impares empezando desde el 3, ya que los pares no son primos (ex: 2)
(
    SELECT  TOP (@CANTIDAD) (ROW_NUMBER() OVER (ORDER BY (SELECT 1)) * 2) + (@INICIO - 1 - (@INICIO%2)) AS [NUM]
    FROM        BASE B1
    CROSS JOIN  BASE B2
), DIVS AS --Extraigo los numeros correspondientes de la base para validar cada numero
(
    SELECT  [NUM]
    FROM        BASE B3
    WHERE   B3.[NUM] > 4
    AND     B3.[NUM] % 2 <> 0
    AND     B3.[NUM] % 3 <> 0
)
--Selecciono los numeros 2 y 3 siempre y cuando el valor inicial sea menor
SELECT  DADO.[NUM] AS [PRIMO]
FROM        (VALUES (2), (3)) DADO(NUM)
WHERE   DADO.[NUM] >= @INICIO
UNION ALL
--Selecciono cada numero si su modulo entre 3 es distinto de 0 y si esta entre 5 y el ultimo numero
SELECT  N.[NUM] AS [PRIMO]
FROM        NUMS N
WHERE   N.[NUM] BETWEEN 5 AND @FIN
AND     N.[NUM] % 3 <> 0
AND     NOT EXISTS (SELECT *
                    FROM DIVS D
					--Validar la diferencia de cada numero empezando por el 3
                    WHERE D.[NUM] <> N.[NUM]
					--Division exacta no es primo
                    AND N.[NUM] % D.[NUM] = 0);
END

