USE [master]
GO
/****** Object:  Database [Juguetería]    Script Date: 04/09/2017 09:58:43 p.m. ******/
CREATE DATABASE [Juguetería]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Juguetería', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Juguetería.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Juguetería_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Juguetería_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Juguetería] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Juguetería].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Juguetería] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Juguetería] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Juguetería] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Juguetería] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Juguetería] SET ARITHABORT OFF 
GO
ALTER DATABASE [Juguetería] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Juguetería] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Juguetería] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Juguetería] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Juguetería] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Juguetería] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Juguetería] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Juguetería] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Juguetería] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Juguetería] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Juguetería] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Juguetería] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Juguetería] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Juguetería] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Juguetería] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Juguetería] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Juguetería] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Juguetería] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Juguetería] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Juguetería] SET  MULTI_USER 
GO
ALTER DATABASE [Juguetería] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Juguetería] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Juguetería] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Juguetería] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Juguetería]
GO
/****** Object:  Table [dbo].[Unidad Brasil]    Script Date: 04/09/2017 09:58:43 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unidad Brasil](
	[IDUnidadBrasil] [uniqueidentifier] NULL,
	[Dinero Obtenido] [money] NULL,
	[Ubicación] [nvarchar](50) NULL,
	[Gerente a Cargo] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Unidad Canadá]    Script Date: 04/09/2017 09:58:43 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unidad Canadá](
	[IDUnidadCanada] [uniqueidentifier] NULL,
	[Dinero Obtenido] [money] NULL,
	[Ubicación] [nvarchar](50) NULL,
	[Gerente a Cargo] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Unidad Guadalajara]    Script Date: 04/09/2017 09:58:43 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unidad Guadalajara](
	[IDUnidadGuadalajara] [uniqueidentifier] NULL,
	[Dinero Obtenido] [money] NULL,
	[Ubicación] [nvarchar](50) NULL,
	[Gerente a Cargo] [nvarchar](50) NULL,
	[Código Postal] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Unidad Madrid]    Script Date: 04/09/2017 09:58:43 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unidad Madrid](
	[IDUnidadMadrid] [uniqueidentifier] NULL,
	[Dinero Obtenido] [money] NULL,
	[Ubicación] [nvarchar](50) NULL,
	[Gerente a Cargo] [nvarchar](50) NULL,
	[[Código Postal] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Unidad México]    Script Date: 04/09/2017 09:58:43 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unidad México](
	[IDUnidadMexico] [nvarchar](50) NULL,
	[Dinero Obtenido] [money] NULL,
	[Ubicación] [nvarchar](50) NULL,
	[Gerente a cargo] [nvarchar](50) NULL,
	[Código Postal] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Unidad Monterrey]    Script Date: 04/09/2017 09:58:43 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unidad Monterrey](
	[IDUnidadMonterrey] [uniqueidentifier] NULL,
	[Dinero Obtenido] [money] NULL,
	[Ubicación] [nvarchar](50) NULL,
	[Gerente a Cargo] [nvarchar](10) NULL,
	[Código Postal] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Unidad USA]    Script Date: 04/09/2017 09:58:43 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unidad USA](
	[IDUnidadUSA] [uniqueidentifier] NULL,
	[Dinero Obtenido] [money] NULL,
	[Ubicación] [nvarchar](50) NULL,
	[Gerente a Cargo] [nvarchar](50) NULL,
	[Código Postal] [int] NULL
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [Juguetería] SET  READ_WRITE 
GO
