USE [master]
GO
/****** Object:  Database [CityBookUsers]    Script Date: 30/06/2021 04:24:30 ******/
CREATE DATABASE [CityBookUsers]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CityBookUsers', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\CityBookUsers.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CityBookUsers_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\CityBookUsers_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CityBookUsers] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CityBookUsers].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CityBookUsers] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CityBookUsers] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CityBookUsers] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CityBookUsers] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CityBookUsers] SET ARITHABORT OFF 
GO
ALTER DATABASE [CityBookUsers] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CityBookUsers] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CityBookUsers] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CityBookUsers] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CityBookUsers] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CityBookUsers] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CityBookUsers] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CityBookUsers] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CityBookUsers] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CityBookUsers] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CityBookUsers] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CityBookUsers] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CityBookUsers] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CityBookUsers] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CityBookUsers] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CityBookUsers] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CityBookUsers] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CityBookUsers] SET RECOVERY FULL 
GO
ALTER DATABASE [CityBookUsers] SET  MULTI_USER 
GO
ALTER DATABASE [CityBookUsers] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CityBookUsers] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CityBookUsers] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CityBookUsers] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CityBookUsers] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CityBookUsers', N'ON'
GO
ALTER DATABASE [CityBookUsers] SET QUERY_STORE = OFF
GO
USE [CityBookUsers]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [CityBookUsers]
GO
/****** Object:  Table [dbo].[Children]    Script Date: 30/06/2021 04:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Children](
	[ChildId] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NULL,
	[ChildName] [nvarchar](50) NULL,
	[ChildTz] [nvarchar](9) NULL,
	[ChildBornDate] [datetime] NULL,
 CONSTRAINT [PK_Children] PRIMARY KEY CLUSTERED 
(
	[ChildId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 30/06/2021 04:24:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserFirstName] [nvarchar](50) NULL,
	[UserLastName] [nvarchar](50) NULL,
	[UserTz] [nvarchar](9) NULL,
	[BornDate] [datetime] NULL,
	[MaleOrFemale] [nvarchar](50) NULL,
	[HMO] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Children]  WITH CHECK ADD  CONSTRAINT [FK_Children_User] FOREIGN KEY([ParentId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Children] CHECK CONSTRAINT [FK_Children_User]
GO
USE [master]
GO
ALTER DATABASE [CityBookUsers] SET  READ_WRITE 
GO
