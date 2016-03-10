USE [master]
GO
/****** Object:  Database [Booking]    Script Date: 03/10/2016 16:57:24 ******/
CREATE DATABASE [Booking] ON  PRIMARY 
( NAME = N'onion', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\onion.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'onion_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\onion_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Booking] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Booking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Booking] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Booking] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Booking] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Booking] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Booking] SET ARITHABORT OFF
GO
ALTER DATABASE [Booking] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Booking] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Booking] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Booking] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Booking] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Booking] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Booking] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Booking] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Booking] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Booking] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Booking] SET  DISABLE_BROKER
GO
ALTER DATABASE [Booking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Booking] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Booking] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Booking] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Booking] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Booking] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Booking] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Booking] SET  READ_WRITE
GO
ALTER DATABASE [Booking] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Booking] SET  MULTI_USER
GO
ALTER DATABASE [Booking] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Booking] SET DB_CHAINING OFF
GO
USE [Booking]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 03/10/2016 16:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 03/10/2016 16:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201603090635514_InitialCreate', N'ShoppingCart.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FDB36147E1FB0FF20E8691B522B97B5E802BB45EA245BB0E6823A2DF656D012ED0895284DA2D204C37ED91EF693F617762851375E74B115DB29060CB578F89DC3C38FE4217998FFFEF977FCF6C1F78C7B1CC56E4026E6C168DF3430B103C725CB8999D0C58BD7E6DB37DF7F373E73FC07E3532E77C4E4A0268927E61DA5E1B165C5F61DF6513CF25D3B0AE260414776E05BC809ACC3FDFD5FAC83030B038409588631FE9010EAFA38FD013FA701B1714813E45D060EF662FE1D4A6629AA71857C1C87C8C6137376178421583745111D65E2A671E2B9084C99616F611A889080220A861E7F8CF18C460159CE42F880BCDBC71083DC027931E60D382EC5BBB665FF90B5C52A2BE6507612D3C0EF097870C49D6389D55772B159380FDC77066EA68FACD5A90B27E68583D34F1F020F1C202A3C9E7A11139E9897858A9338BCC27494571C6590E711C07D0DA22FA32AE29ED1B9DE5E41A6C3D13EFB6FCF98261E4D223C2138A111F2F68C9B64EEB9F6EFF8F136F882C9E4E860BE387AFDF215728E5EFD8C8F5E565B0A6D05B9DA07F8741305218EC036BC28DA6F1A56BD9E25562CAA55EA645E012E01F34CE3123DBCC76449EF60C41CBE368D73F7013BF9174EAE8FC4856104956894C0CFABC4F3D0DCC345B9D5A893FDBF41EBE1CB578368BD42F7EE32ED7A413F0C9C08C6D507ECA5A5F19D1B66C3ABD6DF9FB9D87914F8EC779D5F59E9E7599044366B4CA015B945D112D3BA7563AB246F274A33A8E1699DA3EE3EB599A532BD95A2AC41AB8C845CC5A647436EEFD3EAEDCCB8933084CE4BA9C53CD24438C56A3512AAEF1955A1923C075DC943A051DFF25C78E623D71B6032ECA0050291851BF9B868E5BB00A887486F9B6F501CC35CE0FC86E2BB06D3E19F03983EC3761201456714F9E1936BBBB90B08BE4AFC3963FEE6740DD635B75F837364D3203A23ACD6DA78EF03FB4B90D033E29C228A3F523B07643F6F5DBF3BC020E69CD8368EE373203376A601C4D939E005A14787BDE1D80CB5ED6064EA21D7574723C25CFA39172D2312B584149568C454914993A9EF83A54BBA999A8BEA4DCD245A4DE5627D4D6560DD2CE5927A435381563B33A9C162BDB487860FF652D8DD8FF6D65BBC757341C58D339821F1AF98E008A631E706518A2352F6409779631BC142DA7D4CE993AF4DA9A64FC84B8656B5D268482781E147430ABBFBA32135133EDFBB0E8B4A3A6C81726180EF24AFDE5DB58F39C1B24D0F875A3337AD7C3373806EB89CC47160BBE928501C7EF1A38BBAFD10C319EDE718596BC4B310681810DD654B1E7C81B69922A9AEC929F630C5C6899D1D0E4E516C2347762334C8E96158BEA22A0C2BCF44EAC6FD24E904A6E38855426C1314C34875099587854B6C37445EAB97849A1D9730D6F6428758728A434C98C2564F7451AE3E026106147A844E69F3D0D8AA30AE99889AA855D7E76D216CD9EFD2C9C44638D9123B6B78C9E3B7272166B3C73640CE66977431407B9CB70D82F2BD4A5702881B975D23A8B063D2109487541B2168DD635B2068DD25CF8EA0D916B56BFF0BFBD55DA3677DA3BCF965BDD15D5BE066CD1F3B46CD2CF6843A146AE048A6E7E99C15E207AAD89C819D7C7F16F35057A408039F615A3FB229E35D651C6A358388246A022C89D602CA2F0225206940F5302E3FCB6BB48E47113D60F373B746583EF70BB0150EC8D8D50BD18AA0FEDA542467A7DD47D1B2820D12C93B6D162A380A42889357BDE11D9CA23B97951DD32516EE130D571AC63BA3C1412D91ABC649796306F7524ECD762FA902B23E21D95A5E12C2278D97F2C60CEE25CED176272982821E61C15A2EAA2FE1030DB6FCA4A3586D8AB2B195254AF10F634B935135BE44E94D7325C38A7F3166597AD5F4C5AC7FDA919F615876ACC83E2AAC2D34D120424B2C94826AB0F4DC8D627A8A289A2376CE33757C494CB9B66AA6FF5C6575F9943B315F077269F66F7EB3AAB8BEAF2DB67234C241CEA1893E0B69D273740501D4D50D96F2863C14298EEEA78197F8441F61E96B671778D5FAD91719616C09F64B1194E42E29CEADFBBE53CFC8A362A85E2A2298D57B4A0FA1F3771E7F563DAE8B49F528F911551545776CB5B59ED38532FD7A4B0C13FB77562BC2D38C2C9E9B5205E09F7A6254D21B24B04A5977D47A064A15B35ED21D514833A9420A453DACAC2693D48CAC16AC84A7F1A85AA2BB06397DA48A2E97764756249254A115C52B602B6C16CBBAA32A724DAAC08AE2EED865E289388BEEF0DAA5DDBCACBE78651BDCF5562F0DC6D34C89C32C7E957BFC2A50E5734F2C7E532F81F1EF3B4927ED2E6F753A65071BEBD14983A19F7B6A57E0F5A9A7F1DE5E8F59BBD7AE4DEF4DF7FA7ABC7EA47D526A48BB3C51A4D05EECF6845DDD98EFB0DA1FD3485BAE4CC434723702A11E638AFD111318CDFEF4A69E8BD9449E0B5C22E22E704CB35C0E137684AF85E738BBF334C68A63C753EC5075EF63EA7DB681B42C728F22FB0E457292C41ACF474A50E9FCF98238F86162FE95D63A4E8F32D8BFD2CF7BC645FC91B87F2650701B25D8F85B4EFA1C269DBE799FB5A38F1FBA7BF5E28FCF59D53DE33A8211736CEC0BBE5CA587EB4F227A5993555DC39A951F4A3CDF01557B83A0441506C4EA4F0EE62E1DE4B9416EE50F3E7AF8B1AF69CA27056B212A9E0D0C8537880B75CF0256C1D23E0970E0274D9F04F46BACFA89C02AA6699F07B8A43F98F838A0FB3494D7DCE252A3D8146D624A4AFDDC9A5CBD56A6E5B6D72629077BAD812EE759F7805B23977A05663CB334E4C156474596F160D8DBA4F693A716EF4A367199E7B1DD24E24DE60D37DC0C7D53E9C23B90E0A648D8D97E52F0A6B9A63BC8DDF1CCCA7EA9BF3B46369EC6B5FD04DF4D934D77CCBBE364EB95C6BB635CDBD6FAB965A6755E42B79E942BE717692E645467C16D49B7D9C139ECF0E70190208B28B3B792EA2CAFA60CD51685A5885EA93EBD4C542C0D1C49AF24D1ACB65F5BF982DFD8582ED3AC569394D9A49BCFFF8DBAB94CB36E4DAAE336D28595C986AA14EE9679AC290FEA39A507D75AD2928DDE16B336DEAE3FA76CE0419C521B3D9A3BE2E793FC3B884B861C3A3D927DE5EB5E583B2B7F6111D6EFD85D9610ECEF2D126CD756CD42E6822C827CF1162CCA4584139A4B4C91034BEA4944DD05B22914B333E6F4B1777A6EC76E3AE6D8B920D7090D130A4DC6FEDCAB1D78B120A0497F9AD15CB7797C1DA67FB764882680992E3B9BBF26EF12D7730ABBCF1567421A08165DF0135DD697949DEC2E1F0BA4AB807404E2EE2B82A25BEC871E80C5D76486EEF12AB601FDDEE325B21FCB13401D487B47D4DD3E3E75D132427ECC31CAFAF01338ECF80F6FFE07738A794668540000, N'6.1.3-40302')
/****** Object:  Table [dbo].[ShowTimings]    Script Date: 03/10/2016 16:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShowTimings](
	[ShowId] [int] IDENTITY(1,1) NOT NULL,
	[Time] [int] NOT NULL,
	[Rate] [int] NOT NULL,
 CONSTRAINT [PK_ShowTimings] PRIMARY KEY CLUSTERED 
(
	[ShowId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ShowTimings] ON
INSERT [dbo].[ShowTimings] ([ShowId], [Time], [Rate]) VALUES (1, 10, 100)
INSERT [dbo].[ShowTimings] ([ShowId], [Time], [Rate]) VALUES (2, 1, 150)
INSERT [dbo].[ShowTimings] ([ShowId], [Time], [Rate]) VALUES (3, 4, 170)
INSERT [dbo].[ShowTimings] ([ShowId], [Time], [Rate]) VALUES (4, 7, 200)
INSERT [dbo].[ShowTimings] ([ShowId], [Time], [Rate]) VALUES (5, 10, 250)
SET IDENTITY_INSERT [dbo].[ShowTimings] OFF
/****** Object:  Table [dbo].[Theatre]    Script Date: 03/10/2016 16:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Theatre](
	[TheatreId] [int] IDENTITY(1,1) NOT NULL,
	[TheatreName] [varchar](100) NULL,
	[Rows] [int] NOT NULL,
	[SeatsPerRows] [int] NOT NULL,
	[IsActive] [bit] NULL,
	[NoOfSeats] [int] NOT NULL,
 CONSTRAINT [PK_Theatre] PRIMARY KEY CLUSTERED 
(
	[TheatreId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Theatre] ON
INSERT [dbo].[Theatre] ([TheatreId], [TheatreName], [Rows], [SeatsPerRows], [IsActive], [NoOfSeats]) VALUES (1, N'PVR', 5, 6, 1, 0)
INSERT [dbo].[Theatre] ([TheatreId], [TheatreName], [Rows], [SeatsPerRows], [IsActive], [NoOfSeats]) VALUES (2, N'ESquare', 10, 8, 1, 80)
INSERT [dbo].[Theatre] ([TheatreId], [TheatreName], [Rows], [SeatsPerRows], [IsActive], [NoOfSeats]) VALUES (3, N'Cinepolis', 8, 8, 1, 64)
INSERT [dbo].[Theatre] ([TheatreId], [TheatreName], [Rows], [SeatsPerRows], [IsActive], [NoOfSeats]) VALUES (4, N'Inox', 10, 8, 1, 80)
SET IDENTITY_INSERT [dbo].[Theatre] OFF
/****** Object:  Table [dbo].[Movie]    Script Date: 03/10/2016 16:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Movie](
	[MovieId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[ImageUrl] [varchar](1000) NULL,
	[Duration] [int] NOT NULL,
	[Description] [varchar](500) NULL,
	[Medium] [varchar](60) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Movie] ON
INSERT [dbo].[Movie] ([MovieId], [Name], [ImageUrl], [Duration], [Description], [Medium], [IsActive]) VALUES (1, N'Jai Gangajal', NULL, 120, N'Jai Gangajal', N'Hindi', 1)
INSERT [dbo].[Movie] ([MovieId], [Name], [ImageUrl], [Duration], [Description], [Medium], [IsActive]) VALUES (2, N'Airlift', N'Airlift', 150, N'Airlift', N'Hindi', 1)
INSERT [dbo].[Movie] ([MovieId], [Name], [ImageUrl], [Duration], [Description], [Medium], [IsActive]) VALUES (3, N'Neerja', N'Neerja', 160, N'Neerja', N'Hindi', 1)
SET IDENTITY_INSERT [dbo].[Movie] OFF
/****** Object:  Table [dbo].[Country]    Script Date: 03/10/2016 16:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (1, N'India')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (2, N'USA')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (3, N'UK')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (4, N'Canada')
SET IDENTITY_INSERT [dbo].[Country] OFF
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 03/10/2016 16:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers] 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'a0f59894-d20b-442b-9b48-8c506ffa389c', N'kagnihotri@tavisca.com', 0, N'AFinStQ18JuYBGoIrxP1aNJFW+1if14R+GzrxISule4B50PTkNYvwPGE2kHPaOvyFA==', N'd30f6b18-5257-4eb7-8086-150392c37a36', NULL, 0, 0, NULL, 1, 0, N'kagnihotri@tavisca.com')
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 03/10/2016 16:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles] 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 03/10/2016 16:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 03/10/2016 16:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims] 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 03/10/2016 16:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[State](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [varchar](50) NOT NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[State] ON
INSERT [dbo].[State] ([StateId], [StateName], [CountryId]) VALUES (1, N'Maharashtra', 1)
INSERT [dbo].[State] ([StateId], [StateName], [CountryId]) VALUES (2, N'UP', 1)
INSERT [dbo].[State] ([StateId], [StateName], [CountryId]) VALUES (3, N'MP', 1)
INSERT [dbo].[State] ([StateId], [StateName], [CountryId]) VALUES (4, N'Goa', 1)
INSERT [dbo].[State] ([StateId], [StateName], [CountryId]) VALUES (5, N'Arizon', 2)
INSERT [dbo].[State] ([StateId], [StateName], [CountryId]) VALUES (6, N'London', 2)
INSERT [dbo].[State] ([StateId], [StateName], [CountryId]) VALUES (7, N'Berlin', 3)
INSERT [dbo].[State] ([StateId], [StateName], [CountryId]) VALUES (8, N'Las', 2)
INSERT [dbo].[State] ([StateId], [StateName], [CountryId]) VALUES (9, N'Lax', 2)
SET IDENTITY_INSERT [dbo].[State] OFF
/****** Object:  Table [dbo].[MTSMapping]    Script Date: 03/10/2016 16:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTSMapping](
	[MTSMappingId] [int] IDENTITY(1,1) NOT NULL,
	[MovieId] [int] NOT NULL,
	[TheatreId] [int] NOT NULL,
	[ShowId] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_MTSMapping] PRIMARY KEY CLUSTERED 
(
	[MTSMappingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MTSMapping] ON
INSERT [dbo].[MTSMapping] ([MTSMappingId], [MovieId], [TheatreId], [ShowId], [StartDate], [EndDate], [IsActive]) VALUES (1, 1, 1, 1, CAST(0x0000A5BE00000000 AS DateTime), CAST(0x0000A5C500000000 AS DateTime), NULL)
INSERT [dbo].[MTSMapping] ([MTSMappingId], [MovieId], [TheatreId], [ShowId], [StartDate], [EndDate], [IsActive]) VALUES (3, 1, 1, 3, CAST(0x0000A5BE00000000 AS DateTime), CAST(0x0000A5C500000000 AS DateTime), NULL)
INSERT [dbo].[MTSMapping] ([MTSMappingId], [MovieId], [TheatreId], [ShowId], [StartDate], [EndDate], [IsActive]) VALUES (4, 2, 3, 1, CAST(0x0000A5BE00000000 AS DateTime), CAST(0x0000A5CC00000000 AS DateTime), NULL)
INSERT [dbo].[MTSMapping] ([MTSMappingId], [MovieId], [TheatreId], [ShowId], [StartDate], [EndDate], [IsActive]) VALUES (5, 2, 3, 3, CAST(0x0000A5BE00000000 AS DateTime), CAST(0x0000A5CC00000000 AS DateTime), NULL)
INSERT [dbo].[MTSMapping] ([MTSMappingId], [MovieId], [TheatreId], [ShowId], [StartDate], [EndDate], [IsActive]) VALUES (6, 2, 3, 4, CAST(0x0000A5BE00000000 AS DateTime), CAST(0x0000A5CC00000000 AS DateTime), NULL)
INSERT [dbo].[MTSMapping] ([MTSMappingId], [MovieId], [TheatreId], [ShowId], [StartDate], [EndDate], [IsActive]) VALUES (7, 3, 2, 1, CAST(0x0000A5BE00000000 AS DateTime), CAST(0x0000A5C500000000 AS DateTime), NULL)
INSERT [dbo].[MTSMapping] ([MTSMappingId], [MovieId], [TheatreId], [ShowId], [StartDate], [EndDate], [IsActive]) VALUES (8, 3, 2, 2, CAST(0x0000A5BE00000000 AS DateTime), CAST(0x0000A5C500000000 AS DateTime), NULL)
INSERT [dbo].[MTSMapping] ([MTSMappingId], [MovieId], [TheatreId], [ShowId], [StartDate], [EndDate], [IsActive]) VALUES (9, 3, 2, 3, CAST(0x0000A5BE00000000 AS DateTime), CAST(0x0000A5C500000000 AS DateTime), NULL)
INSERT [dbo].[MTSMapping] ([MTSMappingId], [MovieId], [TheatreId], [ShowId], [StartDate], [EndDate], [IsActive]) VALUES (10, 3, 2, 4, CAST(0x0000A5BE00000000 AS DateTime), CAST(0x0000A5C500000000 AS DateTime), NULL)
INSERT [dbo].[MTSMapping] ([MTSMappingId], [MovieId], [TheatreId], [ShowId], [StartDate], [EndDate], [IsActive]) VALUES (11, 3, 2, 5, CAST(0x0000A5BE00000000 AS DateTime), CAST(0x0000A5C500000000 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[MTSMapping] OFF
/****** Object:  Table [dbo].[MovieBookings]    Script Date: 03/10/2016 16:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MovieBookings](
	[BookingId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](100) NOT NULL,
	[MTSMappingID] [int] NOT NULL,
	[PaidStatus] [varchar](50) NULL,
	[TicketAmount] [float] NOT NULL,
	[NoOfSeats] [int] NOT NULL,
	[BookingDate] [datetime] NOT NULL,
	[ShowDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MovieBookings] PRIMARY KEY CLUSTERED 
(
	[BookingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[City]    Script Date: 03/10/2016 16:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](50) NOT NULL,
	[StateId] [int] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON
INSERT [dbo].[City] ([CityId], [CityName], [StateId]) VALUES (1, N'Nashik', 1)
INSERT [dbo].[City] ([CityId], [CityName], [StateId]) VALUES (2, N'Pune', 1)
INSERT [dbo].[City] ([CityId], [CityName], [StateId]) VALUES (4, N'Mumbai', 1)
INSERT [dbo].[City] ([CityId], [CityName], [StateId]) VALUES (5, N'Panji', 4)
INSERT [dbo].[City] ([CityId], [CityName], [StateId]) VALUES (6, N'Indor', 2)
SET IDENTITY_INSERT [dbo].[City] OFF
/****** Object:  Table [dbo].[BookingSeatMapping]    Script Date: 03/10/2016 16:57:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BookingSeatMapping](
	[BookingShowSeatMappingId] [int] IDENTITY(1,1) NOT NULL,
	[BookingId] [int] NULL,
	[SeatNo] [varchar](20) NULL,
	[RowNo] [int] NULL,
	[ColumnNo] [int] NULL,
 CONSTRAINT [PK_BookingSeatMapping] PRIMARY KEY CLUSTERED 
(
	[BookingShowSeatMappingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]    Script Date: 03/10/2016 16:57:25 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]    Script Date: 03/10/2016 16:57:25 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]    Script Date: 03/10/2016 16:57:25 ******/
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]    Script Date: 03/10/2016 16:57:25 ******/
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_State_Country]    Script Date: 03/10/2016 16:57:25 ******/
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([CountryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_State_Country]
GO
/****** Object:  ForeignKey [FK_MTSMapping_Movies]    Script Date: 03/10/2016 16:57:25 ******/
ALTER TABLE [dbo].[MTSMapping]  WITH CHECK ADD  CONSTRAINT [FK_MTSMapping_Movies] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movie] ([MovieId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MTSMapping] CHECK CONSTRAINT [FK_MTSMapping_Movies]
GO
/****** Object:  ForeignKey [FK_MTSMapping_ShowTimings]    Script Date: 03/10/2016 16:57:25 ******/
ALTER TABLE [dbo].[MTSMapping]  WITH CHECK ADD  CONSTRAINT [FK_MTSMapping_ShowTimings] FOREIGN KEY([ShowId])
REFERENCES [dbo].[ShowTimings] ([ShowId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MTSMapping] CHECK CONSTRAINT [FK_MTSMapping_ShowTimings]
GO
/****** Object:  ForeignKey [FK_MTSMapping_Theatre]    Script Date: 03/10/2016 16:57:25 ******/
ALTER TABLE [dbo].[MTSMapping]  WITH CHECK ADD  CONSTRAINT [FK_MTSMapping_Theatre] FOREIGN KEY([TheatreId])
REFERENCES [dbo].[Theatre] ([TheatreId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MTSMapping] CHECK CONSTRAINT [FK_MTSMapping_Theatre]
GO
/****** Object:  ForeignKey [FK_MovieBookings_MTSMapping]    Script Date: 03/10/2016 16:57:25 ******/
ALTER TABLE [dbo].[MovieBookings]  WITH CHECK ADD  CONSTRAINT [FK_MovieBookings_MTSMapping] FOREIGN KEY([MTSMappingID])
REFERENCES [dbo].[MTSMapping] ([MTSMappingId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MovieBookings] CHECK CONSTRAINT [FK_MovieBookings_MTSMapping]
GO
/****** Object:  ForeignKey [FK_City_State]    Script Date: 03/10/2016 16:57:25 ******/
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([StateId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_State]
GO
/****** Object:  ForeignKey [FK_BookingSeatMapping_MovieBookings]    Script Date: 03/10/2016 16:57:25 ******/
ALTER TABLE [dbo].[BookingSeatMapping]  WITH CHECK ADD  CONSTRAINT [FK_BookingSeatMapping_MovieBookings] FOREIGN KEY([BookingId])
REFERENCES [dbo].[MovieBookings] ([BookingId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookingSeatMapping] CHECK CONSTRAINT [FK_BookingSeatMapping_MovieBookings]
GO
