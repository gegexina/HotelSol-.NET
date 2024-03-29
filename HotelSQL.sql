USE [master]
GO

/*Borrado de la base de datos*/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = 'HotelSQL')
    DROP DATABASE HotelSQL;


/****** Object:  Database [HotelSQL]    Script Date: 13/11/2023 20:54:58 ******/
CREATE DATABASE [HotelSQL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HotelSQL', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\HotelSQL.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HotelSQL_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\HotelSQL_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [HotelSQL] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelSQL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelSQL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelSQL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelSQL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelSQL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelSQL] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelSQL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HotelSQL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelSQL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelSQL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelSQL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelSQL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelSQL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelSQL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelSQL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelSQL] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HotelSQL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelSQL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelSQL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelSQL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelSQL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelSQL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HotelSQL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelSQL] SET RECOVERY FULL 
GO
ALTER DATABASE [HotelSQL] SET  MULTI_USER 
GO
ALTER DATABASE [HotelSQL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelSQL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HotelSQL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HotelSQL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HotelSQL] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HotelSQL] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'HotelSQL', N'ON'
GO
ALTER DATABASE [HotelSQL] SET QUERY_STORE = ON
GO
ALTER DATABASE [HotelSQL] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [HotelSQL]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 13/11/2023 20:54:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[NIF] [varchar](50) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellidos] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[VIP] [tinyint] NOT NULL default 0,
	[direccion] [varchar](50) NULL,
	[ciudad] [varchar](50) NULL,
	[cp] [int] NULL,
	[pais] [varchar](50) NULL,
	[fechaN] [date] NULL,
	[detalle] [varchar](50) NULL,
	[nombreCuenta] [varchar](50) NULL,
	[numeroCuenta] [varchar](50) NULL,
	[fechaAlta] [date] NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[NIF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 13/11/2023 20:54:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[numeroFactura] [int] IDENTITY(1,1) NOT NULL,
	[fechaFactura] [datetime] NOT NULL,
	[precioTotal] [float] NOT NULL,
	[servicioID] [int] NULL,
	[reservaID] [int] NOT NULL,
	[idCliente] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[numeroFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habitacion]    Script Date: 13/11/2023 20:54:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitacion](
	[numeroHabitacion] [int] NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[tipoID] [int] NOT NULL,
	[minNoches] [int] NULL,
	[maxPersonas] [int] NULL,
	[precioAlta] [float] NOT NULL,
	[PrecioMedia] [float] NOT NULL,
	[precioBaja] [float] NOT NULL,
	[fueraServicio] [tinyint] NOT NULL default 0,
 CONSTRAINT [PK_Habitacion] PRIMARY KEY CLUSTERED 
(
	[numeroHabitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[historicoReservas]    Script Date: 13/11/2023 20:54:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historicoReservas](
	[reservaID] [int] NOT NULL,
	[habitacion] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[entrada] [date] NOT NULL,
	[salida] [date] NOT NULL,
	[estado] [varchar](50) NULL,
	[idIncidencia] [int] NULL,
 CONSTRAINT [PK_historicoReservas] PRIMARY KEY CLUSTERED 
(
	[reservaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoricoServicios]    Script Date: 13/11/2023 20:54:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoricoServicios](
	[idServicio] [int] NOT NULL,
	[reservaID] [int] NOT NULL,
	[historicoID] [int] IDENTITY(1,1) NOT NULL
	 CONSTRAINT [PK_historicoID] PRIMARY KEY CLUSTERED 
(
	[historicoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Incidencias]    Script Date: 13/11/2023 20:54:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Incidencias](
	[idIncidencia] [int] NOT NULL,
	[tipo] [varchar](50) NULL,
	[detalle] [varchar](100) NULL,
	[resuelta] [tinyint] NULL,
 CONSTRAINT [PK_Incidencias] PRIMARY KEY CLUSTERED 
(
	[idIncidencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegimenPension]    Script Date: 13/11/2023 20:54:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegimenPension](
	[pensionID] [int] NOT NULL,
	[descripcion] [varchar](20) NOT NULL,
	[precio] [float] NOT NULL,
 CONSTRAINT [PK_RegimenPension] PRIMARY KEY CLUSTERED 
(
	[pensionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservas]    Script Date: 13/11/2023 20:54:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservas](
	[reservaID] [int] IDENTITY(1,1) NOT NULL,
	[firmado] [tinyint] NOT NULL default 0,
	[fechaEntrada] [datetime] NOT NULL,
	[fechaSalida] [datetime] NOT NULL,
	[NIF] [varchar](50) NOT NULL,
	[numeroHabitacion] [int] NOT NULL,
	[temporadaID] [int] NOT NULL,
	[pensionID] [int] NOT NULL,
 CONSTRAINT [PK_Reservas] PRIMARY KEY CLUSTERED 
(
	[reservaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 13/11/2023 20:54:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Servicio](
	[idServicio] [int] IDENTITY(1,1) NOT NULL,
	[precioServicio] [float] NOT NULL,
	[descripcion] [varchar](1000) NOT NULL,
	[tipoServicioID] [int] NULL,
	[precioAlta] [float] NOT NULL,
	[precioBaja] [float] NOT NULL,
	[precioMedia] [float] NOT NULL,
	[permisoAlta] [tinyint] NULL,
	[permisoMedia] [tinyint] NULL,
	[permisoBaja] [tinyint] NULL,
	[descVIP] [float] NOT NULL,
 CONSTRAINT [PK_Servicio] PRIMARY KEY CLUSTERED 
(
	[idServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temporada]    Script Date: 13/11/2023 20:54:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temporada](
	[temporadaID] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Temporada] PRIMARY KEY CLUSTERED 
(
	[temporadaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoHabitacion]    Script Date: 13/11/2023 20:54:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoHabitacion](
	[tipoID] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](20) NOT NULL,
 CONSTRAINT [PK_TipoHabitacion] PRIMARY KEY CLUSTERED 
(
	[tipoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Usuario]    Script Date: 13/11/2023 20:54:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[nombre] [varchar](50) NOT NULL,
	[usuarioID] [int] IDENTITY(1,1) NOT NULL,
	[password] [varchar](16) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[usuarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Reservas] FOREIGN KEY([reservaID])
REFERENCES [dbo].[Reservas] ([reservaID])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Reservas]
GO
ALTER TABLE [dbo].[Habitacion]  WITH CHECK ADD  CONSTRAINT [FK_Habitacion_TipoHabitacion] FOREIGN KEY([tipoID])
REFERENCES [dbo].[TipoHabitacion] ([tipoID])
GO
ALTER TABLE [dbo].[Habitacion] CHECK CONSTRAINT [FK_Habitacion_TipoHabitacion]
GO
ALTER TABLE [dbo].[HistoricoServicios]  WITH CHECK ADD  CONSTRAINT [FK_HistoricoServicios_Reservas] FOREIGN KEY([reservaID])
REFERENCES [dbo].[Reservas] ([reservaID])
GO
ALTER TABLE [dbo].[HistoricoServicios] CHECK CONSTRAINT [FK_HistoricoServicios_Reservas]
GO
ALTER TABLE [dbo].[historicoReservas]  WITH CHECK ADD  CONSTRAINT [FK_HistoricoReservas_Reservas] FOREIGN KEY([reservaID])
REFERENCES [dbo].[Reservas] ([reservaID])
GO
ALTER TABLE [dbo].[historicoReservas] CHECK CONSTRAINT [FK_HistoricoReservas_Reservas]
GO
ALTER TABLE [dbo].[HistoricoServicios]  WITH CHECK ADD  CONSTRAINT [FK_HistoricoServicios_Servicio] FOREIGN KEY([idServicio])
REFERENCES [dbo].[Servicio] ([idServicio])
GO
ALTER TABLE [dbo].[HistoricoServicios] CHECK CONSTRAINT [FK_HistoricoServicios_Servicio]
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD  CONSTRAINT [FK_Reservas_Clientes] FOREIGN KEY([NIF])
REFERENCES [dbo].[Clientes] ([NIF])
GO
ALTER TABLE [dbo].[Reservas] CHECK CONSTRAINT [FK_Reservas_Clientes]
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD  CONSTRAINT [FK_Reservas_Habitacion] FOREIGN KEY([numeroHabitacion])
REFERENCES [dbo].[Habitacion] ([numeroHabitacion])
GO
ALTER TABLE [dbo].[Reservas] CHECK CONSTRAINT [FK_Reservas_Habitacion]
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD  CONSTRAINT [FK_Reservas_Temporada] FOREIGN KEY([temporadaID])
REFERENCES [dbo].[Temporada] ([temporadaID])
GO
ALTER TABLE [dbo].[Reservas] CHECK CONSTRAINT [FK_Reservas_Temporada]
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD  CONSTRAINT [FK_Regimen_Pension] FOREIGN KEY([pensionID])
REFERENCES [dbo].[RegimenPension] ([pensionID])
GO
ALTER TABLE [dbo].[Reservas] CHECK CONSTRAINT [FK_Regimen_Pension]
GO
USE [master]
GO
ALTER DATABASE [HotelSQL] SET  READ_WRITE 
GO
USE [HotelSQL];

insert into TipoHabitacion (descripcion) values
('Individual'),
('Doble'),
('Triple');
GO
insert into Clientes (NIF, nombre, apellidos, telefono, email, VIP, direccion, ciudad, cp, pais, fechaN, detalle, nombreCuenta, numeroCuenta, fechaAlta) values
('11111111A', 'Pepe', 'Lopez', '666555444', 'pp@gmail.com', 0, 'su calle', 'su ciudad', 08000, 'su pais', '01-01-1990', null,'Banco Santander', '02554461344860', '01-11-2023'),
('22222222A', 'Lola', 'Diez', '666555443', 'lola@gmail.com', 1, 'su calle', 'su ciudad', 08001, 'su pais', '01-01-1990', null,'Banco Santander', '02554461344861', '03-11-2023'),
('55566677A', 'Paco', 'Perez', '666555442', 'paco@gmail.com', 1, 'su calle', 'su ciudad', 08003, 'su pais', '01-01-1990', null,'Banco Santander', '025544613448603', '03-11-2023');
GO
insert into Habitacion (numeroHabitacion, descripcion, tipoID, minNoches, maxPersonas, precioAlta, PrecioMedia, precioBaja, fueraServicio) values
(1, 'Individual', 1, 1, 1, 20.00, 15.00, 10.00, 0),
(2, 'Doble', 2,  1, 1, 40.00, 30.00, 20.00, 0),
(3, 'Doble', 2,  1, 1, 40.00, 30.00, 20.00, 0),
(4, 'Triple', 3, 1, 3, 50.00, 40.00, 30.00, 0);
GO
insert into Temporada (descripcion) values
('Alta'),
('Media'),
('Baja');
GO
insert into RegimenPension (pensionID, descripcion, precio) values
(1, 'Desayuno', 6),
(2, 'Media pension', 26),
(3, 'Pension Completa', 36);
GO
insert into Reservas (firmado, fechaEntrada, fechaSalida, NIF, numeroHabitacion, temporadaID, pensionID) values
(1, '18-11-2023', '21-11-2023', '11111111A', 1, 1, 1),
(1, '10-11-2023', '25-11-2023', '22222222A', 2, 2, 2),
(1, '20-11-2023', '30-11-2023', '55566677A', 3, 3, 3);
GO
insert into Servicio(precioServicio, descripcion, precioAlta, precioBaja, precioMedia, permisoAlta, permisoMedia, permisoBaja, descVIP) values
(10,'Lavanderia',20,5,10,1,1,1,0.2),
(10,'Plancha',20,5,10,1,1,1,0.2),
(10,'Trastero',20,5,10,1,1,1,0.2);
GO