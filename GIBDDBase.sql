USE [master]
GO
/****** Object:  Database [ГИБДД]    Script Date: 12.11.2020 1:54:32 ******/
CREATE DATABASE [ГИБДД]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ГИБДД', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ГИБДД.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ГИБДД_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ГИБДД_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ГИБДД] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ГИБДД].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ГИБДД] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ГИБДД] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ГИБДД] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ГИБДД] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ГИБДД] SET ARITHABORT OFF 
GO
ALTER DATABASE [ГИБДД] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ГИБДД] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ГИБДД] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ГИБДД] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ГИБДД] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ГИБДД] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ГИБДД] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ГИБДД] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ГИБДД] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ГИБДД] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ГИБДД] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ГИБДД] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ГИБДД] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ГИБДД] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ГИБДД] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ГИБДД] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ГИБДД] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ГИБДД] SET RECOVERY FULL 
GO
ALTER DATABASE [ГИБДД] SET  MULTI_USER 
GO
ALTER DATABASE [ГИБДД] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ГИБДД] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ГИБДД] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ГИБДД] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ГИБДД] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ГИБДД] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ГИБДД', N'ON'
GO
ALTER DATABASE [ГИБДД] SET QUERY_STORE = OFF
GO
USE [ГИБДД]
GO
/****** Object:  Table [dbo].[Водители]    Script Date: 12.11.2020 1:54:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Водители](
	[NomerPrav] [int] NOT NULL,
	[FIO] [nvarchar](50) NOT NULL,
	[Passport] [nvarchar](50) NOT NULL,
	[Adress] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Водители] PRIMARY KEY CLUSTERED 
(
	[NomerPrav] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Машины]    Script Date: 12.11.2020 1:54:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Машины](
	[GosNomer] [nvarchar](50) NOT NULL,
	[MarkaAvto] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Машины] PRIMARY KEY CLUSTERED 
(
	[GosNomer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователи]    Script Date: 12.11.2020 1:54:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователи](
	[IdUser] [int] NOT NULL,
	[Login] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Пользователи] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Роли]    Script Date: 12.11.2020 1:54:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Роли](
	[RoleNum] [int] NOT NULL,
	[RoleName] [nvarchar](30) NULL,
 CONSTRAINT [PK_Роли] PRIMARY KEY CLUSTERED 
(
	[RoleNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[РолиПользователи]    Script Date: 12.11.2020 1:54:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[РолиПользователи](
	[idUser] [int] NOT NULL,
	[RoleNum] [int] NOT NULL,
 CONSTRAINT [PK_РолиПользователи] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC,
	[RoleNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[СотрудникиГИБДД]    Script Date: 12.11.2020 1:54:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[СотрудникиГИБДД](
	[TabelNum] [int] NOT NULL,
	[FIO] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
	[DateBith] [date] NOT NULL,
	[Doljnost] [nvarchar](50) NOT NULL,
	[Oklad] [int] NOT NULL,
	[HomeAdress] [nvarchar](50) NOT NULL,
	[PhoneNum] [nvarchar](11) NOT NULL,
 CONSTRAINT [PK_Сотрудники ГИБДД] PRIMARY KEY CLUSTERED 
(
	[TabelNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Страховка]    Script Date: 12.11.2020 1:54:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Страховка](
	[StrahovoiNomer] [int] NOT NULL,
	[Owner] [int] NOT NULL,
	[Avto] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Страховка] PRIMARY KEY CLUSTERED 
(
	[StrahovoiNomer] ASC,
	[Owner] ASC,
	[Avto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Штрафы]    Script Date: 12.11.2020 1:54:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Штрафы](
	[NomerShtrafa] [int] IDENTITY(1,1) NOT NULL,
	[MarkaAvto] [nvarchar](50) NOT NULL,
	[GosNomer] [nvarchar](50) NOT NULL,
	[OpisanieShtrafa] [nvarchar](max) NULL,
	[SumShtrafa] [int] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[SotrudnikTabel] [int] NOT NULL,
 CONSTRAINT [PK_Штрафы] PRIMARY KEY CLUSTERED 
(
	[NomerShtrafa] ASC,
	[GosNomer] ASC,
	[SotrudnikTabel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Водители] ([NomerPrav], [FIO], [Passport], [Adress]) VALUES (12112001, N'Карев Евстигней Валериевич', N'31189894', N' Бочкова 65')
INSERT [dbo].[Водители] ([NomerPrav], [FIO], [Passport], [Adress]) VALUES (12578654, N'Касимова Елена Родионовна', N'56341244', N'Хасимова 92')
INSERT [dbo].[Водители] ([NomerPrav], [FIO], [Passport], [Adress]) VALUES (74747474, N'Курбанов Моисей Назарович
', N'41981143', N'Елесина 10')
INSERT [dbo].[Водители] ([NomerPrav], [FIO], [Passport], [Adress]) VALUES (77783741, N'Комзина Зоя Олеговна
', N'51766129', N'Муськина 33')
INSERT [dbo].[Водители] ([NomerPrav], [FIO], [Passport], [Adress]) VALUES (98765432, N'Янковский Ростислав Архипович
', N'38144216', N'пушкина 77')
GO
INSERT [dbo].[Машины] ([GosNomer], [MarkaAvto]) VALUES (N'777777', N'ess')
INSERT [dbo].[Машины] ([GosNomer], [MarkaAvto]) VALUES (N'а777уф', N'Jaguar')
INSERT [dbo].[Машины] ([GosNomer], [MarkaAvto]) VALUES (N'к247ум', N'Lada')
INSERT [dbo].[Машины] ([GosNomer], [MarkaAvto]) VALUES (N'м633от', N'Jeep')
INSERT [dbo].[Машины] ([GosNomer], [MarkaAvto]) VALUES (N'х016см', N'Mercedes')
INSERT [dbo].[Машины] ([GosNomer], [MarkaAvto]) VALUES (N'х228ач', N'Audi')
INSERT [dbo].[Машины] ([GosNomer], [MarkaAvto]) VALUES (N'ч779ач', N'Brabus')
GO
INSERT [dbo].[Пользователи] ([IdUser], [Login], [Password]) VALUES (12112001, N'driver2', N'qwerty')
INSERT [dbo].[Пользователи] ([IdUser], [Login], [Password]) VALUES (12578654, N'driver5', N'driver5')
INSERT [dbo].[Пользователи] ([IdUser], [Login], [Password]) VALUES (22822828, N'sotr1', N'sotr1')
INSERT [dbo].[Пользователи] ([IdUser], [Login], [Password]) VALUES (33377728, N'sotr2', N'sotr2')
INSERT [dbo].[Пользователи] ([IdUser], [Login], [Password]) VALUES (74747474, N'driver1', N'driver1')
INSERT [dbo].[Пользователи] ([IdUser], [Login], [Password]) VALUES (77783741, N'driver3', N'driver3')
INSERT [dbo].[Пользователи] ([IdUser], [Login], [Password]) VALUES (98765432, N'driver4', N'driver4')
GO
INSERT [dbo].[Роли] ([RoleNum], [RoleName]) VALUES (1, N'Водитель')
INSERT [dbo].[Роли] ([RoleNum], [RoleName]) VALUES (2, N'Сотрудник')
GO
INSERT [dbo].[РолиПользователи] ([idUser], [RoleNum]) VALUES (12112001, 1)
INSERT [dbo].[РолиПользователи] ([idUser], [RoleNum]) VALUES (12578654, 1)
INSERT [dbo].[РолиПользователи] ([idUser], [RoleNum]) VALUES (22822828, 2)
INSERT [dbo].[РолиПользователи] ([idUser], [RoleNum]) VALUES (33377728, 2)
INSERT [dbo].[РолиПользователи] ([idUser], [RoleNum]) VALUES (74747474, 1)
INSERT [dbo].[РолиПользователи] ([idUser], [RoleNum]) VALUES (77783741, 1)
INSERT [dbo].[РолиПользователи] ([idUser], [RoleNum]) VALUES (98765432, 1)
GO
INSERT [dbo].[СотрудникиГИБДД] ([TabelNum], [FIO], [Gender], [DateBith], [Doljnost], [Oklad], [HomeAdress], [PhoneNum]) VALUES (22822828, N'Зубенко Михаил Михайлович', N'Муж', CAST(N'2001-11-12' AS Date), N'Стажер', 10000, N'Российская 23', N'79072272775')
INSERT [dbo].[СотрудникиГИБДД] ([TabelNum], [FIO], [Gender], [DateBith], [Doljnost], [Oklad], [HomeAdress], [PhoneNum]) VALUES (33377728, N'Пащенкой Витайлий Малинович', N'Муж', CAST(N'1978-11-23' AS Date), N'Главный', 70000, N'Энгельса 17', N'79854479868')
GO
INSERT [dbo].[Страховка] ([StrahovoiNomer], [Owner], [Avto]) VALUES (1, 12578654, N'а777уф')
INSERT [dbo].[Страховка] ([StrahovoiNomer], [Owner], [Avto]) VALUES (2, 12578654, N'к247ум')
INSERT [dbo].[Страховка] ([StrahovoiNomer], [Owner], [Avto]) VALUES (3, 74747474, N'м633от')
INSERT [dbo].[Страховка] ([StrahovoiNomer], [Owner], [Avto]) VALUES (4, 77783741, N'х016см')
INSERT [dbo].[Страховка] ([StrahovoiNomer], [Owner], [Avto]) VALUES (5, 98765432, N'х228ач')
INSERT [dbo].[Страховка] ([StrahovoiNomer], [Owner], [Avto]) VALUES (6, 98765432, N'ч779ач')
GO
SET IDENTITY_INSERT [dbo].[Штрафы] ON 

INSERT [dbo].[Штрафы] ([NomerShtrafa], [MarkaAvto], [GosNomer], [OpisanieShtrafa], [SumShtrafa], [Status], [SotrudnikTabel]) VALUES (1, N'Jaguar', N'а777уф', N'Идейные соображения высшего порядка, а также постоянный количественный рост и сфера нашей активности влечет за собой процесс внедрения и модернизации модели развития. Значимость этих проблем настолько очевидна, что постоянное информационно-пропагандистское обеспечение', 1000, N'Не оплачено', 22822828)
INSERT [dbo].[Штрафы] ([NomerShtrafa], [MarkaAvto], [GosNomer], [OpisanieShtrafa], [SumShtrafa], [Status], [SotrudnikTabel]) VALUES (2, N'Audi', N'х228ач', N'Задача организации, в особенности же рамки и место обучения кадров позволяет оценить значение новых предложений. Идейные соображения высшего порядка, а также реализация намеченных плановых заданий представляет собой интересный эксперимент проверки соответствующий условий активизации.', 5000, N'Не оплачено', 22822828)
INSERT [dbo].[Штрафы] ([NomerShtrafa], [MarkaAvto], [GosNomer], [OpisanieShtrafa], [SumShtrafa], [Status], [SotrudnikTabel]) VALUES (3, N'Mercedes', N'х016см', N'С другой стороны сложившаяся структура организации позволяет выполнять важные задания по разработке существенных финансовых и административных условий. Повседневная практика показывает, что начало повседневной работы по формированию позиции требуют от нас анализа позиций,', 15000, N'Оплачено', 22822828)
INSERT [dbo].[Штрафы] ([NomerShtrafa], [MarkaAvto], [GosNomer], [OpisanieShtrafa], [SumShtrafa], [Status], [SotrudnikTabel]) VALUES (6, N'Jaguar', N'а777уф', N'Товарищи! постоянный количественный рост и сфера нашей активности способствует подготовки и реализации модели развития. Задача организации, в особенности же постоянный количественный рост и сфера нашей активности позволяет оценить значение системы обучения кадров,', 7500, N'Оплачено', 22822828)
INSERT [dbo].[Штрафы] ([NomerShtrafa], [MarkaAvto], [GosNomer], [OpisanieShtrafa], [SumShtrafa], [Status], [SotrudnikTabel]) VALUES (9, N'Audi', N'х228ач', N'Задача организации, в особенности же рамки и место обучения кадров обеспечивает широкому кругу (специалистов) участие в формировании соответствующий условий активизации. Товарищи! постоянный количественный рост и сфера нашей активности играет важную роль в формировании модели развития. Идейные соображения высшего порядка, а также новая модель организационной деятельности обеспечивае', 300, N'Оплачено', 33377728)
INSERT [dbo].[Штрафы] ([NomerShtrafa], [MarkaAvto], [GosNomer], [OpisanieShtrafa], [SumShtrafa], [Status], [SotrudnikTabel]) VALUES (11, N'Audi', N'х228ач', N'широкому кругу (специалистов) участие в формировании позиций, занимаемых участниками в отношении поставленных задач. Равным образом постоянное информационно-пропагандистское обеспечение нашей деятельности позволяет оценить значение соответствующий условий активизации. Таким образом сложившаяся структура организации играет важную роль в формировании позиций, занимаемых участниками в отношении поставленных задач.', 700, N'Оплачено', 33377728)
INSERT [dbo].[Штрафы] ([NomerShtrafa], [MarkaAvto], [GosNomer], [OpisanieShtrafa], [SumShtrafa], [Status], [SotrudnikTabel]) VALUES (12, N'Jaguar', N'а777уф', N'Приветики', 700, N'Не оплачено', 22822828)
SET IDENTITY_INSERT [dbo].[Штрафы] OFF
GO
ALTER TABLE [dbo].[Водители]  WITH CHECK ADD  CONSTRAINT [FK_Водители_Пользователи] FOREIGN KEY([NomerPrav])
REFERENCES [dbo].[Пользователи] ([IdUser])
GO
ALTER TABLE [dbo].[Водители] CHECK CONSTRAINT [FK_Водители_Пользователи]
GO
ALTER TABLE [dbo].[РолиПользователи]  WITH CHECK ADD  CONSTRAINT [FK_РолиПользователи_Пользователи] FOREIGN KEY([idUser])
REFERENCES [dbo].[Пользователи] ([IdUser])
GO
ALTER TABLE [dbo].[РолиПользователи] CHECK CONSTRAINT [FK_РолиПользователи_Пользователи]
GO
ALTER TABLE [dbo].[РолиПользователи]  WITH CHECK ADD  CONSTRAINT [FK_РолиПользователи_Роли] FOREIGN KEY([RoleNum])
REFERENCES [dbo].[Роли] ([RoleNum])
GO
ALTER TABLE [dbo].[РолиПользователи] CHECK CONSTRAINT [FK_РолиПользователи_Роли]
GO
ALTER TABLE [dbo].[СотрудникиГИБДД]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудники ГИБДД_Пользователи] FOREIGN KEY([TabelNum])
REFERENCES [dbo].[Пользователи] ([IdUser])
GO
ALTER TABLE [dbo].[СотрудникиГИБДД] CHECK CONSTRAINT [FK_Сотрудники ГИБДД_Пользователи]
GO
ALTER TABLE [dbo].[Страховка]  WITH CHECK ADD  CONSTRAINT [FK_Страховка_Водители] FOREIGN KEY([Owner])
REFERENCES [dbo].[Водители] ([NomerPrav])
GO
ALTER TABLE [dbo].[Страховка] CHECK CONSTRAINT [FK_Страховка_Водители]
GO
ALTER TABLE [dbo].[Страховка]  WITH CHECK ADD  CONSTRAINT [FK_Страховка_Машины] FOREIGN KEY([Avto])
REFERENCES [dbo].[Машины] ([GosNomer])
GO
ALTER TABLE [dbo].[Страховка] CHECK CONSTRAINT [FK_Страховка_Машины]
GO
ALTER TABLE [dbo].[Штрафы]  WITH CHECK ADD  CONSTRAINT [FK_Штрафы_Машины] FOREIGN KEY([GosNomer])
REFERENCES [dbo].[Машины] ([GosNomer])
GO
ALTER TABLE [dbo].[Штрафы] CHECK CONSTRAINT [FK_Штрафы_Машины]
GO
ALTER TABLE [dbo].[Штрафы]  WITH CHECK ADD  CONSTRAINT [FK_Штрафы_Сотрудники ГИБДД] FOREIGN KEY([SotrudnikTabel])
REFERENCES [dbo].[СотрудникиГИБДД] ([TabelNum])
GO
ALTER TABLE [dbo].[Штрафы] CHECK CONSTRAINT [FK_Штрафы_Сотрудники ГИБДД]
GO
USE [master]
GO
ALTER DATABASE [ГИБДД] SET  READ_WRITE 
GO
