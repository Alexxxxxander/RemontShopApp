USE [master]
GO
/****** Object:  Database [RemontPractice]    Script Date: 23.01.2024 10:36:16 ******/
CREATE DATABASE [RemontPractice]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RemontPractice', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\RemontPractice.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RemontPractice_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\RemontPractice_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [RemontPractice] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RemontPractice].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RemontPractice] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RemontPractice] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RemontPractice] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RemontPractice] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RemontPractice] SET ARITHABORT OFF 
GO
ALTER DATABASE [RemontPractice] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RemontPractice] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RemontPractice] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RemontPractice] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RemontPractice] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RemontPractice] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RemontPractice] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RemontPractice] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RemontPractice] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RemontPractice] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RemontPractice] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RemontPractice] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RemontPractice] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RemontPractice] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RemontPractice] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RemontPractice] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RemontPractice] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RemontPractice] SET RECOVERY FULL 
GO
ALTER DATABASE [RemontPractice] SET  MULTI_USER 
GO
ALTER DATABASE [RemontPractice] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RemontPractice] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RemontPractice] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RemontPractice] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RemontPractice] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RemontPractice] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'RemontPractice', N'ON'
GO
ALTER DATABASE [RemontPractice] SET QUERY_STORE = ON
GO
ALTER DATABASE [RemontPractice] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [RemontPractice]
GO
/****** Object:  User [sql_login]    Script Date: 23.01.2024 10:36:16 ******/
CREATE USER [sql_login] FOR LOGIN [sql_login] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Application]    Script Date: 23.01.2024 10:36:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Application](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateStart] [datetime] NULL,
	[Appliance] [nvarchar](100) NOT NULL,
	[ProblemTypeId] [int] NOT NULL,
	[Description] [nvarchar](200) NULL,
	[ClientId] [int] NOT NULL,
	[StatusId] [int] NULL,
	[StageId] [int] NULL,
	[EmployeeId] [int] NULL,
	[DateEnd] [datetime] NULL,
	[Comment] [nvarchar](200) NULL,
	[LastModify] [datetime] NULL,
 CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 23.01.2024 10:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Phone] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 23.01.2024 10:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Phone] [nvarchar](15) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProblemType]    Script Date: 23.01.2024 10:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProblemType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProblemType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 23.01.2024 10:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StageApplication]    Script Date: 23.01.2024 10:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageApplication](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_StageApplication] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusApplication]    Script Date: 23.01.2024 10:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusApplication](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_StatusApplication] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 23.01.2024 10:36:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[RoleId] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Application] ON 

INSERT [dbo].[Application] ([Id], [DateStart], [Appliance], [ProblemTypeId], [Description], [ClientId], [StatusId], [StageId], [EmployeeId], [DateEnd], [Comment], [LastModify]) VALUES (1, CAST(N'2024-01-01T00:00:00.000' AS DateTime), N'Телефон Xiaomi 12X', 8, N'Тормозит', 1, 3, 3, 1, CAST(N'2024-01-02T00:00:00.000' AS DateTime), N'Очищена память от мусора', CAST(N'2024-01-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Application] ([Id], [DateStart], [Appliance], [ProblemTypeId], [Description], [ClientId], [StatusId], [StageId], [EmployeeId], [DateEnd], [Comment], [LastModify]) VALUES (3, CAST(N'2024-01-16T00:00:00.000' AS DateTime), N'Телефон Iphone 9', 1, NULL, 1, 2, 1, NULL, NULL, NULL, CAST(N'2024-01-20T16:15:25.173' AS DateTime))
INSERT [dbo].[Application] ([Id], [DateStart], [Appliance], [ProblemTypeId], [Description], [ClientId], [StatusId], [StageId], [EmployeeId], [DateEnd], [Comment], [LastModify]) VALUES (4, CAST(N'2024-01-16T00:00:00.000' AS DateTime), N'Телефон Xiaomi 12X', 5, N'Забит динамик и порт зарядки', 2, 2, 2, 2, NULL, NULL, CAST(N'2024-01-20T16:49:48.103' AS DateTime))
INSERT [dbo].[Application] ([Id], [DateStart], [Appliance], [ProblemTypeId], [Description], [ClientId], [StatusId], [StageId], [EmployeeId], [DateEnd], [Comment], [LastModify]) VALUES (5, CAST(N'2024-01-16T00:00:00.000' AS DateTime), N'Телефон Xiaomi 12X', 6, NULL, 2, 1, 1, 2, NULL, NULL, CAST(N'2024-01-22T09:25:00.513' AS DateTime))
INSERT [dbo].[Application] ([Id], [DateStart], [Appliance], [ProblemTypeId], [Description], [ClientId], [StatusId], [StageId], [EmployeeId], [DateEnd], [Comment], [LastModify]) VALUES (11, CAST(N'2024-01-01T00:00:00.000' AS DateTime), N'Ноутбук HP194812', 6, NULL, 1, 3, 3, 2, CAST(N'2024-01-03T00:00:00.000' AS DateTime), NULL, CAST(N'2024-01-03T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Application] OFF
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([Id], [Surname], [Name], [Patronymic], [Phone]) VALUES (1, N'Полиненко', N'Артур', N'Евгеньевич', N'89467387373')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Patronymic], [Phone]) VALUES (2, N'Житомиров', N'Иван', N'Артемович', N'89374751423')
INSERT [dbo].[Client] ([Id], [Surname], [Name], [Patronymic], [Phone]) VALUES (3, N'Куриенко', N'Владислав', N'Романович', N'85671854712')
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [Surname], [Name], [Patronymic], [Phone], [UserId]) VALUES (1, N'Ашенов', N'Кирилл', N'Георгиевич', N'89384561835', 1)
INSERT [dbo].[Employee] ([Id], [Surname], [Name], [Patronymic], [Phone], [UserId]) VALUES (2, N'Кулибин', N'Петр', N'Романович', N'89572756128', 2)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[ProblemType] ON 

INSERT [dbo].[ProblemType] ([Id], [Name]) VALUES (1, N'Не работает дисплей')
INSERT [dbo].[ProblemType] ([Id], [Name]) VALUES (2, N'Замена аккумулятора')
INSERT [dbo].[ProblemType] ([Id], [Name]) VALUES (3, N'Не работает тачскрин')
INSERT [dbo].[ProblemType] ([Id], [Name]) VALUES (4, N'Не работает порт зарядки')
INSERT [dbo].[ProblemType] ([Id], [Name]) VALUES (5, N'Очистка от пыли')
INSERT [dbo].[ProblemType] ([Id], [Name]) VALUES (6, N'Полировка')
INSERT [dbo].[ProblemType] ([Id], [Name]) VALUES (7, N'Установка защитного стекла')
INSERT [dbo].[ProblemType] ([Id], [Name]) VALUES (8, N'Диагностика')
INSERT [dbo].[ProblemType] ([Id], [Name]) VALUES (9, N'Не работает динамик')
INSERT [dbo].[ProblemType] ([Id], [Name]) VALUES (10, N'Разбит экран')
SET IDENTITY_INSERT [dbo].[ProblemType] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Менеджер')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Исполнитель')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[StageApplication] ON 

INSERT [dbo].[StageApplication] ([Id], [Name]) VALUES (1, N'Не выполнено')
INSERT [dbo].[StageApplication] ([Id], [Name]) VALUES (2, N'В работе')
INSERT [dbo].[StageApplication] ([Id], [Name]) VALUES (3, N'Выполнено')
SET IDENTITY_INSERT [dbo].[StageApplication] OFF
GO
SET IDENTITY_INSERT [dbo].[StatusApplication] ON 

INSERT [dbo].[StatusApplication] ([Id], [Name]) VALUES (1, N'В ожидании')
INSERT [dbo].[StatusApplication] ([Id], [Name]) VALUES (2, N'В работе')
INSERT [dbo].[StatusApplication] ([Id], [Name]) VALUES (3, N'Выполнено')
SET IDENTITY_INSERT [dbo].[StatusApplication] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Login], [Password], [RoleId]) VALUES (1, N'testM', N'1', 1)
INSERT [dbo].[User] ([Id], [Login], [Password], [RoleId]) VALUES (2, N'testE', N'123456', 2)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK_Application_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK_Application_Client]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK_Application_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK_Application_Employee]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK_Application_ProblemType] FOREIGN KEY([ProblemTypeId])
REFERENCES [dbo].[ProblemType] ([Id])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK_Application_ProblemType]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK_Application_StageApplication] FOREIGN KEY([StageId])
REFERENCES [dbo].[StageApplication] ([Id])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK_Application_StageApplication]
GO
ALTER TABLE [dbo].[Application]  WITH CHECK ADD  CONSTRAINT [FK_Application_StatusApplication] FOREIGN KEY([StatusId])
REFERENCES [dbo].[StatusApplication] ([Id])
GO
ALTER TABLE [dbo].[Application] CHECK CONSTRAINT [FK_Application_StatusApplication]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [RemontPractice] SET  READ_WRITE 
GO
