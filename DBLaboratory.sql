USE [master]
GO
/****** Object:  Database [DBLaboratory]    Script Date: 24/11/2023 22:25:59 ******/
CREATE DATABASE [DBLaboratory]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBLaboratory', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\DBLaboratory.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBLaboratory_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\DBLaboratory_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DBLaboratory] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBLaboratory].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBLaboratory] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBLaboratory] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBLaboratory] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBLaboratory] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBLaboratory] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBLaboratory] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DBLaboratory] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBLaboratory] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBLaboratory] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBLaboratory] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBLaboratory] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBLaboratory] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBLaboratory] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBLaboratory] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBLaboratory] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBLaboratory] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBLaboratory] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBLaboratory] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBLaboratory] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBLaboratory] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBLaboratory] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBLaboratory] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBLaboratory] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBLaboratory] SET  MULTI_USER 
GO
ALTER DATABASE [DBLaboratory] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBLaboratory] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBLaboratory] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBLaboratory] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBLaboratory] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBLaboratory] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DBLaboratory] SET QUERY_STORE = ON
GO
ALTER DATABASE [DBLaboratory] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DBLaboratory]
GO
/****** Object:  Table [dbo].[Agregar_Examenes]    Script Date: 24/11/2023 22:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agregar_Examenes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Documento] [varbinary](max) NULL,
	[Extension] [nvarchar](100) NULL,
	[Categoria] [int] NULL,
	[Precio] [decimal](18, 0) NULL,
 CONSTRAINT [PK__Agregar___3214EC27DC88DEBA] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Categoria_Examen]    Script Date: 24/11/2023 22:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Categoria_Examen](
	[cod_area] [int] IDENTITY(1,1) NOT NULL,
	[categoria_Nombre] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_categoria_ex] PRIMARY KEY CLUSTERED 
(
	[cod_area] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Configuracion]    Script Date: 24/11/2023 22:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Configuracion](
	[cod_configuracion] [int] IDENTITY(1,1) NOT NULL,
	[configuracion] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_configuracion] PRIMARY KEY CLUSTERED 
(
	[cod_configuracion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Detalle_Facturacion]    Script Date: 24/11/2023 22:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Detalle_Facturacion](
	[Cod_Detalle_de_Factura] [int] IDENTITY(1,1) NOT NULL,
	[Cod_Factura] [int] NULL,
	[Cod_Examen] [int] NULL,
	[Precio] [money] NULL,
	[Cantidad] [money] NULL,
	[Monto] [money] NULL,
	[SubTotal] [money] NULL,
	[Total] [money] NULL,
 CONSTRAINT [PK_tbl_Detalle_Factura] PRIMARY KEY CLUSTERED 
(
	[Cod_Detalle_de_Factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Detalle_Pedidos]    Script Date: 24/11/2023 22:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Detalle_Pedidos](
	[Cod_Detalle_Pedidos] [int] IDENTITY(1,1) NOT NULL,
	[Cod_Pedidos] [int] NULL,
	[Nom_Producto] [nvarchar](50) NULL,
	[Precio] [money] NULL,
	[Cantidad] [int] NULL,
	[Subtotal] [money] NULL,
	[Total] [money] NULL,
 CONSTRAINT [PK_tbl_Detalle_Pedidos] PRIMARY KEY CLUSTERED 
(
	[Cod_Detalle_Pedidos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Detalles_Usuario]    Script Date: 24/11/2023 22:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Detalles_Usuario](
	[Codigo_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Apellido] [nvarchar](50) NULL,
	[Edad] [int] NULL,
	[Telefono] [bigint] NULL,
 CONSTRAINT [PK_tbl_Detalles_Usuario] PRIMARY KEY CLUSTERED 
(
	[Codigo_Usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Examen]    Script Date: 24/11/2023 22:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Examen](
	[cod_examen] [int] IDENTITY(1,1) NOT NULL,
	[cod_categoria] [int] NULL,
	[nombre] [nvarchar](50) NULL,
	[precio] [money] NULL,
 CONSTRAINT [PK_tbl_examen] PRIMARY KEY CLUSTERED 
(
	[cod_examen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Existencia]    Script Date: 24/11/2023 22:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Existencia](
	[cod_existencia] [int] IDENTITY(1,1) NOT NULL,
	[nom_articulo] [nvarchar](50) NULL,
	[tipo_de_articulo] [nvarchar](50) NULL,
	[cantidad] [bigint] NULL,
 CONSTRAINT [PK_tbl_existencia] PRIMARY KEY CLUSTERED 
(
	[cod_existencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Facturacion]    Script Date: 24/11/2023 22:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Facturacion](
	[Cod_Facturacion] [int] IDENTITY(1,1) NOT NULL,
	[cod_paciente] [int] NULL,
	[cod_user] [int] NULL,
	[Fecha_Actual] [datetime2](7) NULL,
	[SubTotal] [money] NULL,
	[Total] [money] NULL,
	[Descuento] [float] NULL,
	[Fecha_de_Entrega] [datetime2](7) NULL,
	[Hora_de_Entrega] [time](7) NULL,
 CONSTRAINT [PK_tbl_fact] PRIMARY KEY CLUSTERED 
(
	[Cod_Facturacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Pedidos]    Script Date: 24/11/2023 22:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Pedidos](
	[Cod_Pedidos] [int] NOT NULL,
	[Fecha] [datetime2](7) NOT NULL,
	[Cod_proveedor] [int] NULL,
	[SubTotal] [nchar](10) NULL,
	[Total] [nchar](10) NULL,
	[Efectivo] [nchar](10) NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[Cod_Pedidos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Proveedor]    Script Date: 24/11/2023 22:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Proveedor](
	[Cod_Proveedor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Casa_Comercial] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Proveedor] PRIMARY KEY CLUSTERED 
(
	[Cod_Proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Registros_de_Examenes]    Script Date: 24/11/2023 22:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Registros_de_Examenes](
	[Cod_resultados] [int] IDENTITY(1,1) NOT NULL,
	[cod_paciente] [int] NULL,
	[cod_examen] [int] NULL,
	[Descripcion_de_Resultados] [nvarchar](max) NULL,
	[Direccion_Url] [varchar](max) NULL,
	[Resultados] [image] NULL,
 CONSTRAINT [PK_tbl_Plantilla] PRIMARY KEY CLUSTERED 
(
	[Cod_resultados] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Registros_de_Pacientes]    Script Date: 24/11/2023 22:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Registros_de_Pacientes](
	[Cod_paciente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Edad] [int] NULL,
	[Sexo] [nvarchar](50) NULL,
	[Telefono] [bigint] NULL,
	[Correo] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_paciente] PRIMARY KEY CLUSTERED 
(
	[Cod_paciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Reservacion_Citas]    Script Date: 24/11/2023 22:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Reservacion_Citas](
	[cod_cita] [int] IDENTITY(1,1) NOT NULL,
	[nombre_completo] [nvarchar](50) NULL,
	[edad] [int] NULL,
	[telefono] [bigint] NULL,
	[motivo] [nvarchar](max) NULL,
	[fecha_realizacion] [date] NULL,
	[hora_de_realizacion] [time](7) NULL,
 CONSTRAINT [PK_tbl_cita] PRIMARY KEY CLUSTERED 
(
	[cod_cita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Roles]    Script Date: 24/11/2023 22:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Roles](
	[cod_rol] [int] IDENTITY(1,1) NOT NULL,
	[Nom_Roles] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_roles] PRIMARY KEY CLUSTERED 
(
	[cod_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 24/11/2023 22:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[Cod_User] [int] IDENTITY(1,1) NOT NULL,
	[Cod_Detalles_usuario] [int] NULL,
	[Usuario] [nvarchar](150) NOT NULL,
	[Contraseña] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_user] PRIMARY KEY CLUSTERED 
(
	[Cod_User] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_UserRol]    Script Date: 24/11/2023 22:26:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_UserRol](
	[Cod_Usuario] [int] IDENTITY(1,1) NOT NULL,
	[Cod_rol] [int] NOT NULL,
 CONSTRAINT [PK_tbl_UserRol] PRIMARY KEY CLUSTERED 
(
	[Cod_Usuario] ASC,
	[Cod_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Detalles_Usuario] ON 
GO
INSERT [dbo].[tbl_Detalles_Usuario] ([Codigo_Usuario], [Nombre], [Apellido], [Edad], [Telefono]) VALUES (1, N'Edgar Javier ', N'Salvatierra Vado', 20, 81998202)
GO
INSERT [dbo].[tbl_Detalles_Usuario] ([Codigo_Usuario], [Nombre], [Apellido], [Edad], [Telefono]) VALUES (2, N'Josue Enmanuel', N'Munoz', 30, 81998202)
GO
INSERT [dbo].[tbl_Detalles_Usuario] ([Codigo_Usuario], [Nombre], [Apellido], [Edad], [Telefono]) VALUES (3, N'ttrtrt', N'reeeewrer', 30, 81998202)
GO
INSERT [dbo].[tbl_Detalles_Usuario] ([Codigo_Usuario], [Nombre], [Apellido], [Edad], [Telefono]) VALUES (4, N'Eddy amalec ', N'Mercado Ruiz', 30, 78905533)
GO
INSERT [dbo].[tbl_Detalles_Usuario] ([Codigo_Usuario], [Nombre], [Apellido], [Edad], [Telefono]) VALUES (5, N'Madre', N'Madre', 30, 66766565)
GO
SET IDENTITY_INSERT [dbo].[tbl_Detalles_Usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Registros_de_Pacientes] ON 
GO
INSERT [dbo].[tbl_Registros_de_Pacientes] ([Cod_paciente], [Nombre], [Edad], [Sexo], [Telefono], [Correo]) VALUES (1, N'Edgar Javier Salvatierra', 23, N'Masculino', 81998202, N'esalvatierravado@gmail.com')
GO
INSERT [dbo].[tbl_Registros_de_Pacientes] ([Cod_paciente], [Nombre], [Edad], [Sexo], [Telefono], [Correo]) VALUES (2, N'Josue Enmanuel Munoz', 22, N'Masculino', 5665643, N'josue@gmail.com')
GO
INSERT [dbo].[tbl_Registros_de_Pacientes] ([Cod_paciente], [Nombre], [Edad], [Sexo], [Telefono], [Correo]) VALUES (3, N'Eddy Amalee', 22, N'Masculino', 78997667, N'eddy@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[tbl_Registros_de_Pacientes] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_User] ON 
GO
INSERT [dbo].[tbl_User] ([Cod_User], [Cod_Detalles_usuario], [Usuario], [Contraseña]) VALUES (1, 1, N'esalvatierravado@gmail.com', N'1234')
GO
INSERT [dbo].[tbl_User] ([Cod_User], [Cod_Detalles_usuario], [Usuario], [Contraseña]) VALUES (2, 2, N'1234', N'1221123')
GO
INSERT [dbo].[tbl_User] ([Cod_User], [Cod_Detalles_usuario], [Usuario], [Contraseña]) VALUES (3, 3, N'', N'')
GO
INSERT [dbo].[tbl_User] ([Cod_User], [Cod_Detalles_usuario], [Usuario], [Contraseña]) VALUES (4, 4, N'eddyamalec@gmail.com', N'233rer')
GO
INSERT [dbo].[tbl_User] ([Cod_User], [Cod_Detalles_usuario], [Usuario], [Contraseña]) VALUES (5, 5, N'Madre123', N'Madre34442')
GO
SET IDENTITY_INSERT [dbo].[tbl_User] OFF
GO
ALTER TABLE [dbo].[tbl_Detalle_Facturacion]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Detalle_Facturacion_tbl_Examen] FOREIGN KEY([Cod_Examen])
REFERENCES [dbo].[tbl_Examen] ([cod_examen])
GO
ALTER TABLE [dbo].[tbl_Detalle_Facturacion] CHECK CONSTRAINT [FK_tbl_Detalle_Facturacion_tbl_Examen]
GO
ALTER TABLE [dbo].[tbl_Detalle_Facturacion]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Detalle_Facturacion_tbl_Facturacion] FOREIGN KEY([Cod_Factura])
REFERENCES [dbo].[tbl_Facturacion] ([Cod_Facturacion])
GO
ALTER TABLE [dbo].[tbl_Detalle_Facturacion] CHECK CONSTRAINT [FK_tbl_Detalle_Facturacion_tbl_Facturacion]
GO
ALTER TABLE [dbo].[tbl_Detalle_Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Detalle_Pedidos_tbl_Pedidos] FOREIGN KEY([Cod_Pedidos])
REFERENCES [dbo].[tbl_Pedidos] ([Cod_Pedidos])
GO
ALTER TABLE [dbo].[tbl_Detalle_Pedidos] CHECK CONSTRAINT [FK_tbl_Detalle_Pedidos_tbl_Pedidos]
GO
ALTER TABLE [dbo].[tbl_Examen]  WITH CHECK ADD  CONSTRAINT [FK_tbl_examen_tbl_categoria_examen] FOREIGN KEY([cod_categoria])
REFERENCES [dbo].[tbl_Categoria_Examen] ([cod_area])
GO
ALTER TABLE [dbo].[tbl_Examen] CHECK CONSTRAINT [FK_tbl_examen_tbl_categoria_examen]
GO
ALTER TABLE [dbo].[tbl_Facturacion]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Facturacion_tbl_Registros_de_Pacientes] FOREIGN KEY([cod_paciente])
REFERENCES [dbo].[tbl_Registros_de_Pacientes] ([Cod_paciente])
GO
ALTER TABLE [dbo].[tbl_Facturacion] CHECK CONSTRAINT [FK_tbl_Facturacion_tbl_Registros_de_Pacientes]
GO
ALTER TABLE [dbo].[tbl_Facturacion]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Facturacion_tbl_User] FOREIGN KEY([cod_user])
REFERENCES [dbo].[tbl_User] ([Cod_User])
GO
ALTER TABLE [dbo].[tbl_Facturacion] CHECK CONSTRAINT [FK_tbl_Facturacion_tbl_User]
GO
ALTER TABLE [dbo].[tbl_Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Pedidos_tbl_Proveedor] FOREIGN KEY([Cod_proveedor])
REFERENCES [dbo].[tbl_Proveedor] ([Cod_Proveedor])
GO
ALTER TABLE [dbo].[tbl_Pedidos] CHECK CONSTRAINT [FK_tbl_Pedidos_tbl_Proveedor]
GO
ALTER TABLE [dbo].[tbl_Registros_de_Examenes]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Registros_de_examenes_tbl_Registros_de_Pacientes] FOREIGN KEY([cod_paciente])
REFERENCES [dbo].[tbl_Registros_de_Pacientes] ([Cod_paciente])
GO
ALTER TABLE [dbo].[tbl_Registros_de_Examenes] CHECK CONSTRAINT [FK_tbl_Registros_de_examenes_tbl_Registros_de_Pacientes]
GO
ALTER TABLE [dbo].[tbl_User]  WITH CHECK ADD  CONSTRAINT [FK_tbl_user_tbl_Detalles_Usuario] FOREIGN KEY([Cod_Detalles_usuario])
REFERENCES [dbo].[tbl_Detalles_Usuario] ([Codigo_Usuario])
GO
ALTER TABLE [dbo].[tbl_User] CHECK CONSTRAINT [FK_tbl_user_tbl_Detalles_Usuario]
GO
ALTER TABLE [dbo].[tbl_UserRol]  WITH CHECK ADD  CONSTRAINT [FK_tbl_UserRol_tbl_roles] FOREIGN KEY([Cod_rol])
REFERENCES [dbo].[tbl_Roles] ([cod_rol])
GO
ALTER TABLE [dbo].[tbl_UserRol] CHECK CONSTRAINT [FK_tbl_UserRol_tbl_roles]
GO
ALTER TABLE [dbo].[tbl_UserRol]  WITH CHECK ADD  CONSTRAINT [FK_tbl_UserRol_tbl_user] FOREIGN KEY([Cod_Usuario])
REFERENCES [dbo].[tbl_User] ([Cod_User])
GO
ALTER TABLE [dbo].[tbl_UserRol] CHECK CONSTRAINT [FK_tbl_UserRol_tbl_user]
GO
/****** Object:  StoredProcedure [dbo].[sp_categoria_Delete]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_categoria_Delete]
(
@cod_area int
)
as
begin
Delete From tbl_Categoria_Examen  where cod_area  = @cod_area

end
GO
/****** Object:  StoredProcedure [dbo].[sp_categoria_read]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_categoria_read]
as
begin
select cod_area,categoria_Nombre From tbl_Categoria_Examen

end
GO
/****** Object:  StoredProcedure [dbo].[sp_categoria_read_id]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_categoria_read_id]
(
@categoria_Nombre nvarchar(50)
)
as
begin

select * From tbl_Categoria_Examen where categoria_Nombre = @categoria_Nombre

end
GO
/****** Object:  StoredProcedure [dbo].[sp_categoria_update]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_categoria_update]
(
@categoria_Nombre nvarchar(50)
)
as 
begin
Update tbl_Categoria_Examen set categoria_Nombre = @categoria_Nombre

end
GO
/****** Object:  StoredProcedure [dbo].[sp_examen_delete]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_examen_delete]
(
@cod_categoria nvarchar(20)
)
as

begin

Delete From tbl_Examen where cod_categoria = @cod_categoria

end
GO
/****** Object:  StoredProcedure [dbo].[sp_examen_insert]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_examen_insert]
(
@nombre  nvarchar(50),
@precio money,
@cod_area nvarchar(20),
@categoria_examen nvarchar(50)
)
as
begin
set nocount on;
declare @IsValid nvarchar(20)

insert into tbl_Categoria_Examen(cod_area,categoria_Nombre) values(@cod_area,@categoria_examen)

set @IsValid = @cod_area

insert into tbl_Examen(cod_categoria,nombre,precio) values(@IsValid,@nombre,@precio)

end
GO
/****** Object:  StoredProcedure [dbo].[sp_examen_read]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_examen_read]

as

begin

select * From tbl_Examen

end
GO
/****** Object:  StoredProcedure [dbo].[sp_examen_readId]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_examen_readId]
(
@cod_categoria nvarchar(20)
)
as

begin

select * from tbl_Examen where cod_categoria = @cod_categoria 

end
GO
/****** Object:  StoredProcedure [dbo].[sp_examen_update]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_examen_update]
(
@cod_categoria nvarchar(20),
@nombre nvarchar(50),
@precio money
)
as

begin

update tbl_Examen set nombre = @nombre, precio = @precio
where cod_categoria = @cod_categoria

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Paciente_Delete]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Sp_Paciente_Delete]
(
@Codigo int
)
as 
begin

Delete From tbl_Registros_de_Pacientes where Cod_paciente = @Codigo

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Paciente_Insert]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Sp_Paciente_Insert]
(
@Nombre nvarchar(50),
@Edad int,
@Sexo nvarchar(50),
@Telefono bigint,
@Correo nvarchar(50)
)
as 
begin

insert into tbl_Registros_de_Pacientes(Nombre,Edad,Sexo,Telefono,Correo) 
values(@Nombre,@Edad,@Sexo,@Telefono,@Correo)

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Paciente_ReadId]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Sp_Paciente_ReadId]
(
@Codigo int
)
as 
begin

select Cod_paciente,Nombre,Edad,Sexo,Telefono,Correo From tbl_Registros_de_Pacientes where Cod_paciente = @Codigo

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Paciente_Update]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Sp_Paciente_Update]
(
@Codigo int,
@Nombre nvarchar(50),
@Edad int,
@Sexo nvarchar(50),
@Telefono bigint,
@Correo nvarchar(50)
)
as 
begin

Update tbl_Registros_de_Pacientes set Nombre = @Nombre, Edad = @Edad, Sexo = @Edad, Telefono = @Telefono, Correo = @Correo

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Pacientes_Read]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Sp_Pacientes_Read]
as
begin

select Nombre,Edad,Sexo,Telefono,Correo From tbl_Registros_de_Pacientes

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Proveedor_Delete]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Sp_Proveedor_Delete]
(
@Cod_Proveedor int
)
as
begin

Delete From tbl_Proveedor where Cod_Proveedor = @Cod_Proveedor

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Proveedor_Insert]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[Sp_Proveedor_Insert]
(
@Nombre nvarchar(50),
@Casa_Comercial nvarchar(50)
)
as
begin

Insert Into tbl_Proveedor(Nombre,Casa_Comercial) Values(@Nombre,@Casa_Comercial)

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Proveedor_Read]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Sp_Proveedor_Read]
as
begin

Select Cod_Proveedor,Nombre,Casa_Comercial From tbl_Proveedor

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Proveedor_ReadId]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Sp_Proveedor_ReadId]
(
@Cod_Proveedor int
)
as
begin

Select Cod_Proveedor,Nombre,Casa_Comercial From tbl_Proveedor where Cod_Proveedor = @Cod_Proveedor

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Proveedor_Update]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Sp_Proveedor_Update]
(
@Cod_Proveedor int,
@Nombre nvarchar(50),
@Casa_Commercial nvarchar(50)
)
as
begin

Update tbl_Proveedor set Nombre = @Nombre, Casa_Comercial = @Casa_Commercial  where Cod_Proveedor = @Cod_Proveedor

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Reservacion_Delete]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PRocedure [dbo].[Sp_Reservacion_Delete]
(
@cod_cita int
)
as
begin

Delete From tbl_Reservacion_Citas where cod_cita = @cod_cita

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Reservacion_Insert]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PRocedure [dbo].[Sp_Reservacion_Insert]
(
@nombre_completo nvarchar(50),
@edad int,
@telefono bigint,
@motivo nvarchar(max),
@fecha_realizacion date,
@hora_realizacion time
)
as
begin

insert into tbl_Reservacion_Citas(nombre_completo,edad,telefono,motivo,fecha_realizacion,hora_de_realizacion) 
values(@nombre_completo,@edad,@telefono,@motivo,@fecha_realizacion,@hora_realizacion)

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Reservacion_Read]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PRocedure [dbo].[Sp_Reservacion_Read]
as
begin

Select nombre_completo,edad,telefono,motivo,fecha_realizacion,hora_de_realizacion From tbl_Reservacion_Citas

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Reservacion_ReadId]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PRocedure [dbo].[Sp_Reservacion_ReadId]
(
@cod_cita int
)
as
begin

Select nombre_completo,edad,telefono,motivo,fecha_realizacion,hora_de_realizacion From tbl_Reservacion_Citas
where cod_cita = @cod_cita

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Reservacion_Update]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PRocedure [dbo].[Sp_Reservacion_Update]
(
@nombre_completo nvarchar(50),
@edad int,
@telefono bigint,
@motivo nvarchar(max),
@fecha_realizacion date,
@hora_realizacion time,
@cod_cita int
)
as
begin

Update tbl_Reservacion_Citas set nombre_completo = @nombre_completo, edad = @edad, telefono = @telefono, motivo = @motivo,
fecha_realizacion = @fecha_realizacion, hora_de_realizacion = @hora_realizacion where cod_cita = @cod_cita

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Roles_Delete]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Sp_Roles_Delete]
(
@cod_rol int
)
as
begin

Delete From tbl_Roles where cod_rol = @cod_rol

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Roles_Insert]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Sp_Roles_Insert]
(
@Nom_Roles nvarchar(50)
)
as
begin

Insert into tbl_Roles(Nom_Roles) values(@Nom_Roles)

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Roles_Read]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[Sp_Roles_Read]
as
begin

Select cod_rol,Nom_Roles From tbl_Roles

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Roles_ReadId]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- command (Ctrl-Shift-M) to fill in the parameter 
Create Procedure [dbo].[Sp_Roles_ReadId]
(
@cod_rol int
)
as
begin

Select cod_rol,Nom_Roles From tbl_Roles where cod_rol = @cod_rol

end
GO
/****** Object:  StoredProcedure [dbo].[Sp_Roles_Update]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- command (Ctrl-Shift-M) to fill in the parameter 
Create Procedure [dbo].[Sp_Roles_Update]
(
@cod_rol int,
@Nom_Roles nvarchar(50)
)
as
begin

Update tbl_Roles set Nom_Roles = @Nom_Roles where cod_rol = @cod_rol

end
GO
/****** Object:  StoredProcedure [dbo].[sp_usuario_delete]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_usuario_delete]
(
  @cod_user int
)
as
begin

Delete From tbl_User where Cod_Detalles_usuario = @cod_user
Delete From tbl_Detalles_Usuario where Codigo_Usuario = @cod_user

end
GO
/****** Object:  StoredProcedure [dbo].[sp_usuario_insert]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_usuario_insert]
(
@Nombre nvarchar(50),
@Apellido nvarchar(50),
@Telefono bigint,
@Edad int,
@Usuario nvarchar(50),
@Password nvarchar(50)
)
as
begin

declare @cod_usuario int

insert into tbl_Detalles_Usuario(Nombre,Apellido,Edad,Telefono)
 values(@Nombre,@Apellido,@Edad,@Telefono)

 set @cod_usuario = @@IDENTITY

 insert into tbl_User(Cod_Detalles_usuario,Usuario,Contraseña)
 values(@cod_usuario,@Usuario,@Password)

 end
GO
/****** Object:  StoredProcedure [dbo].[sp_usuario_read]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_usuario_read]
as
begin

select * From tbl_Detalles_Usuario

end
GO
/****** Object:  StoredProcedure [dbo].[sp_usuario_readId]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[sp_usuario_readId]
(
@Codigo_Usuario int
)
as
begin

select * From tbl_Detalles_Usuario where Codigo_Usuario = @Codigo_Usuario

end
GO
/****** Object:  StoredProcedure [dbo].[sp_usuario_update]    Script Date: 24/11/2023 22:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_usuario_update]
(
@Nombre nvarchar(50),
@Apellido nvarchar(50),
@Usuario nvarchar(50),
@Password nvarchar(50),
@cod_user int
)
as
begin
Update  tbl_Detalles_Usuario set  Nombre =  @Nombre,Apellido = @Apellido where Codigo_Usuario = @cod_user

Update tbl_User set Usuario = @Usuario, Contraseña= @Password where Cod_Detalles_usuario = @cod_user

 end
GO
USE [master]
GO
ALTER DATABASE [DBLaboratory] SET  READ_WRITE 
GO
