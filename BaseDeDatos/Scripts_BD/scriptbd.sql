USE [master]
GO
/****** Object:  Database [SincoABR]    Script Date: 10/12/2019 2:01:13 p. m. ******/
CREATE DATABASE [SincoABR]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SincoABR', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\SincoABR.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SincoABR_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\SincoABR_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [SincoABR] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SincoABR].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SincoABR] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SincoABR] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SincoABR] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SincoABR] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SincoABR] SET ARITHABORT OFF 
GO
ALTER DATABASE [SincoABR] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SincoABR] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SincoABR] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SincoABR] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SincoABR] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SincoABR] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SincoABR] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SincoABR] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SincoABR] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SincoABR] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SincoABR] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SincoABR] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SincoABR] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SincoABR] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SincoABR] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SincoABR] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SincoABR] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SincoABR] SET RECOVERY FULL 
GO
ALTER DATABASE [SincoABR] SET  MULTI_USER 
GO
ALTER DATABASE [SincoABR] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SincoABR] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SincoABR] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SincoABR] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SincoABR] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SincoABR', N'ON'
GO
ALTER DATABASE [SincoABR] SET QUERY_STORE = OFF
GO
USE [SincoABR]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [SincoABR]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 10/12/2019 2:01:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Semestre] [int] NULL,
	[Carrera] [nvarchar](max) NULL,
 CONSTRAINT [PK_Alumno] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Det_Registro_Alumno_Materia]    Script Date: 10/12/2019 2:01:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Det_Registro_Alumno_Materia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Periodo] [int] NOT NULL,
	[Nota] [decimal](18, 2) NULL,
	[Id_Re_Alumno_Materia] [int] NULL,
 CONSTRAINT [PK_Det_Registro_Alumno_Materia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materia]    Script Date: 10/12/2019 2:01:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Codigo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Materia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profesor]    Script Date: 10/12/2019 2:01:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Profesion] [nvarchar](max) NULL,
 CONSTRAINT [PK_Profesor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registro_Alumno_Materia]    Script Date: 10/12/2019 2:01:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registro_Alumno_Materia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Materia] [int] NOT NULL,
	[Id_Alumno] [int] NULL,
 CONSTRAINT [PK_Registro] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registro_Profesor_Materia]    Script Date: 10/12/2019 2:01:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registro_Profesor_Materia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_Profesor] [int] NULL,
	[Id_Materia] [int] NULL,
 CONSTRAINT [PK_Registro_Profesor_Materia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Det_Registro_Alumno_Materia]  WITH CHECK ADD  CONSTRAINT [FK_Det_Registro_Alumno_Materia_Registro_Alumno_Materia] FOREIGN KEY([Id_Re_Alumno_Materia])
REFERENCES [dbo].[Registro_Alumno_Materia] ([Id])
GO
ALTER TABLE [dbo].[Det_Registro_Alumno_Materia] CHECK CONSTRAINT [FK_Det_Registro_Alumno_Materia_Registro_Alumno_Materia]
GO
ALTER TABLE [dbo].[Registro_Alumno_Materia]  WITH CHECK ADD  CONSTRAINT [FK_Registro_Alumno] FOREIGN KEY([Id_Alumno])
REFERENCES [dbo].[Alumno] ([Id])
GO
ALTER TABLE [dbo].[Registro_Alumno_Materia] CHECK CONSTRAINT [FK_Registro_Alumno]
GO
ALTER TABLE [dbo].[Registro_Alumno_Materia]  WITH CHECK ADD  CONSTRAINT [FK_Registro_Materia] FOREIGN KEY([Id_Materia])
REFERENCES [dbo].[Materia] ([Id])
GO
ALTER TABLE [dbo].[Registro_Alumno_Materia] CHECK CONSTRAINT [FK_Registro_Materia]
GO
ALTER TABLE [dbo].[Registro_Profesor_Materia]  WITH CHECK ADD  CONSTRAINT [FK_Registro_Profesor_Materia_Materia] FOREIGN KEY([Id_Materia])
REFERENCES [dbo].[Materia] ([Id])
GO
ALTER TABLE [dbo].[Registro_Profesor_Materia] CHECK CONSTRAINT [FK_Registro_Profesor_Materia_Materia]
GO
ALTER TABLE [dbo].[Registro_Profesor_Materia]  WITH CHECK ADD  CONSTRAINT [FK_Registro_Profesor_Materia_Profesor] FOREIGN KEY([Id_Profesor])
REFERENCES [dbo].[Profesor] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Registro_Profesor_Materia] CHECK CONSTRAINT [FK_Registro_Profesor_Materia_Profesor]
GO
/****** Object:  StoredProcedure [dbo].[SPGETNUMBERSPRIME]    Script Date: 10/12/2019 2:01:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPGETNUMBERSPRIME] 
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
), BASE AS
(
    SELECT  TOP( CONVERT( INT, CEILING(SQRT(@FIN)) ) ) ROW_NUMBER() OVER (ORDER BY (SELECT 1)) AS [NUM]
    FROM        SEGUNDO S1
    CROSS JOIN  SEGUNDO S2
), NUMS AS
(
    SELECT  TOP (@CANTIDAD) (ROW_NUMBER() OVER (ORDER BY (SELECT 1)) * 2) + (@INICIO - 1 - (@INICIO%2)) AS [NUM]
    FROM        BASE B1
    CROSS JOIN  BASE B2
), DIVS AS
(
    SELECT  [NUM]
    FROM        BASE B3
    WHERE   B3.[NUM] > 4
    AND     B3.[NUM] % 2 <> 0
    AND     B3.[NUM] % 3 <> 0
)
SELECT  DADO.[NUM] AS [PRIMO]
FROM        (VALUES (2), (3)) DADO(NUM)
WHERE   DADO.[NUM] >= @INICIO
UNION ALL
SELECT  N.[NUM] AS [PRIMO]
FROM        NUMS N
WHERE   N.[NUM] BETWEEN 5 AND @FIN
AND     N.[NUM] % 3 <> 0
AND     NOT EXISTS (SELECT *
                    FROM DIVS D
                    WHERE D.[NUM] <> N.[NUM]
                    AND N.[NUM] % D.[NUM] = 0);
END

GO
/****** Object:  StoredProcedure [dbo].[SPREPORTEALUMNO]    Script Date: 10/12/2019 2:01:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPREPORTEALUMNO] @ID_ALUMNO INT
AS
SELECT 
	REAM.ID                       [ID_REGISTRO], 
	AL.NOMBRE [ALUMNO], MA.NOMBRE [MATERIA], 
	((SUM(DREAM.NOTA))/2)         [NOTA], 
	PRO.NOMBRE                    [PROFESOR] 
	FROM REGISTRO_ALUMNO_MATERIA REAM
		INNER JOIN ALUMNO AL                         ON REAM.ID_ALUMNO = AL.ID
		INNER JOIN MATERIA MA                        ON REAM.ID_MATERIA = MA.ID
		INNER JOIN DET_REGISTRO_ALUMNO_MATERIA DREAM ON DREAM.Id_Re_Alumno_Materia = REAM.ID 
		INNER JOIN REGISTRO_PROFESOR_MATERIA REPM    ON MA.ID = REPM.ID_MATERIA
		INNER JOIN PROFESOR PRO                      ON PRO.ID = REPM.ID_PROFESOR
WHERE AL.ID = @ID_ALUMNO
GROUP BY REAM.ID, AL.NOMBRE, MA.NOMBRE, PRO.NOMBRE
GO
/****** Object:  StoredProcedure [dbo].[SPTRACEEXECUTION]    Script Date: 10/12/2019 2:01:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPTRACEEXECUTION] 
AS
BEGIN
DECLARE @dbname    nvarchar(256),
        @procname  nvarchar(256)
SELECT @dbname = 'SincoABR',  
       @procname = '[dbo].[SPGETNUMBERSPRIME]' 

; WITH basedata AS (
   SELECT qs.statement_start_offset/2    AS stmt_start,
          qs.statement_end_offset/2      AS stmt_end,
          est.encrypted                  AS isencrypted, 
		  est.text                       AS sqltext,
          epa.value                      AS set_options, 
		  qp.query_plan                  AS query_plan,    
	      qs.last_execution_time         AS last_execution_time,
		  est.objectid                   AS objectid,
          charindex('<ParameterList>', qp.query_plan) + len('<ParameterList>') AS paramstart,
          charindex('</ParameterList>', qp.query_plan) AS paramend
   FROM   sys.dm_exec_query_stats qs
   CROSS  APPLY sys.dm_exec_sql_text(qs.sql_handle) est
   CROSS  APPLY sys.dm_exec_text_query_plan(qs.plan_handle,
                                            qs.statement_start_offset,
                                            qs.statement_end_offset) qp
   CROSS  APPLY sys.dm_exec_plan_attributes(qs.plan_handle) epa
   WHERE  est.objectid  = object_id (@procname)
     AND  est.dbid      = db_id(@dbname)
     AND  epa.attribute = 'set_options'
), next_level AS (
   SELECT stmt_start, set_options, query_plan, last_execution_time, objectid,
          CASE WHEN isencrypted = 1 THEN '-- ENCRYPTED'
               WHEN stmt_start >= 0
               THEN substring(sqltext, stmt_start + 1,
                              CASE stmt_end
                                   WHEN 0 THEN datalength(sqltext)
                                   ELSE stmt_end - stmt_start + 1
                              END)
          END AS Statement,
          CASE WHEN paramend > paramstart
               THEN CAST (substring(query_plan, paramstart,
                                   paramend - paramstart) AS xml)
          END AS params
   FROM   basedata
)
SELECT n.objectid AS ID,
	   CR.c.value('@Column', 'nvarchar(128)') AS Parametro,
       CR.c.value('@ParameterCompiledValue', 'nvarchar(128)') AS Valor,
	   n.last_execution_time AS fecha_de_transacción
FROM   next_level n
CROSS  APPLY   n.params.nodes('ColumnReference') AS CR(c)
ORDER  BY Parametro DESC

END
GO
USE [master]
GO
ALTER DATABASE [SincoABR] SET  READ_WRITE 
GO
