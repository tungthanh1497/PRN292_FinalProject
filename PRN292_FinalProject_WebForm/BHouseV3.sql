USE [master]
GO
/****** Object:  Database [BHouseDB]    Script Date: 03/28/2018 15:28:24 ******/



CREATE DATABASE [BHouseDB] 

GO
ALTER DATABASE [BHouseDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BHouseDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BHouseDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BHouseDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BHouseDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BHouseDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BHouseDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BHouseDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BHouseDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BHouseDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BHouseDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BHouseDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BHouseDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BHouseDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BHouseDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BHouseDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BHouseDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BHouseDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BHouseDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BHouseDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BHouseDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BHouseDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BHouseDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BHouseDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BHouseDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BHouseDB] SET  MULTI_USER 
GO
ALTER DATABASE [BHouseDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BHouseDB] SET DB_CHAINING OFF 
GO
USE [BHouseDB]
GO
/****** Object:  Table [dbo].[BillTBL]    Script Date: 03/28/2018 15:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillTBL](
	[roomNumber] [int] NOT NULL,
	[defaultFee] [int] NOT NULL,
	[electricity] [int] NULL,
	[extraFee] [int] NULL,
	[monthBill] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roomNumber] ASC,
	[monthBill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerTBL]    Script Date: 03/28/2018 15:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerTBL](
	[customerID] [int] NOT NULL,
	[roomNumber] [int] NOT NULL,
	[customerName] [nvarchar](200) NOT NULL,
	[identityCard] [varchar](12) NOT NULL,
	[phoneNumber] [varchar](13) NOT NULL,
	[parentsPhoneNumber] [varchar](13) NULL,
	[dateJoin] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExtraTBL]    Script Date: 03/28/2018 15:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExtraTBL](
	[extraID] [int] IDENTITY(1,1) NOT NULL,
	[roomNumber] [int] NOT NULL,
	[productName] [nvarchar](200) NOT NULL,
	[quantity] [int] NOT NULL,
	[pricePerProduct] [int] NOT NULL,
	[detail] [nvarchar](200) NULL,
	[extraDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[extraID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoginTBL]    Script Date: 03/28/2018 15:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoginTBL](
	[customerID] [int] IDENTITY(0,1) NOT NULL,
	[uname] [varchar](20) NOT NULL,
	[psw] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 03/28/2018 15:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](200) NOT NULL,
	[Detail] [varchar](1000) NULL,
	[DateCreated] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoomInfoTBL]    Script Date: 03/28/2018 15:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomInfoTBL](
	[roomNumber] [int] NOT NULL,
	[roomTypeID] [int] NOT NULL,
	[numPerson] [int] NOT NULL,
	[available] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roomNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoomTypeTBL]    Script Date: 03/28/2018 15:28:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoomTypeTBL](
	[roomTypeID] [int] NOT NULL,
	[optional] [bit] NOT NULL,
	[closed] [bit] NOT NULL,
	[price] [int] NOT NULL,
	[note] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[roomTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (1, 100000, 110000, 0, CAST(N'2017-05-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (1, 100000, 120000, 0, CAST(N'2017-06-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (1, 100000, 113000, 0, CAST(N'2017-07-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (1, 100000, 92000, 0, CAST(N'2017-08-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (1, 100000, 115000, 0, CAST(N'2017-09-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (1, 100000, 103000, 0, CAST(N'2017-10-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (1, 100000, 103000, 0, CAST(N'2017-11-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (1, 100000, 103000, 0, CAST(N'2017-12-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (1, 100000, 103000, 0, CAST(N'2018-01-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (1, 100000, 103000, 0, CAST(N'2018-02-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (1, 100000, 103000, 0, CAST(N'2018-03-01' AS Date))

INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (2, 100000, 130000, 0, CAST(N'2017-03-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (2, 100000, 120000, 0, CAST(N'2017-04-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (2, 100000, 100000, 0, CAST(N'2017-05-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (2, 100000, 105000, 0, CAST(N'2017-06-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (2, 100000, 108000, 0, CAST(N'2017-07-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (2, 200000, 220000, 0, CAST(N'2017-08-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (2, 200000, 215000, 0, CAST(N'2017-09-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (2, 200000, 202000, 0, CAST(N'2017-10-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (2, 200000, 103000, 0, CAST(N'2017-11-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (2, 200000, 103000, 0, CAST(N'2017-12-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (2, 200000, 103000, 0, CAST(N'2018-01-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (2, 200000, 103000, 0, CAST(N'2018-02-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (2, 200000, 103000, 0, CAST(N'2018-03-01' AS Date))

INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (3, 100000, 60000, 0, CAST(N'2017-03-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (3, 100000, 70000, 0, CAST(N'2017-04-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (3, 100000, 54000, 0, CAST(N'2017-05-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (3, 100000, 65000, 0, CAST(N'2017-06-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (3, 100000, 68000, 0, CAST(N'2017-07-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (3, 100000, 77000, 0, CAST(N'2017-08-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (3, 100000, 80000, 0, CAST(N'2017-09-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (3, 100000, 67000, 0, CAST(N'2017-10-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (3, 100000, 103000, 0, CAST(N'2017-11-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (3, 100000, 103000, 0, CAST(N'2017-12-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (3, 100000, 103000, 0, CAST(N'2018-01-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (3, 100000, 103000, 0, CAST(N'2018-02-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (3, 100000, 103000, 0, CAST(N'2018-03-01' AS Date))

INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (4, 100000, 79000, 0, CAST(N'2017-08-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (4, 100000, 97000, 0, CAST(N'2017-09-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (4, 100000, 59000, 0, CAST(N'2017-10-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (4, 100000, 103000, 0, CAST(N'2017-11-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (4, 100000, 103000, 0, CAST(N'2017-12-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (4, 100000, 103000, 0, CAST(N'2018-01-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (4, 100000, 103000, 0, CAST(N'2018-02-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (4, 100000, 103000, 0, CAST(N'2018-03-01' AS Date))

INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (5, 200000, 150000, 0, CAST(N'2017-08-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (5, 200000, 133000, 0, CAST(N'2017-09-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (5, 200000, 110000, 0, CAST(N'2017-10-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (5, 200000, 103000, 0, CAST(N'2017-11-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (5, 200000, 103000, 0, CAST(N'2017-12-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (5, 200000, 103000, 0, CAST(N'2018-01-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (5, 200000, 103000, 0, CAST(N'2018-02-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (5, 200000, 103000, 0, CAST(N'2018-03-01' AS Date))

INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (6, 200000, 140000, 0, CAST(N'2017-08-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (6, 200000, 131000, 0, CAST(N'2017-09-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (6, 200000, 108000, 0, CAST(N'2017-10-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (6, 200000, 103000, 0, CAST(N'2017-11-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (6, 200000, 103000, 0, CAST(N'2017-12-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (6, 200000, 103000, 0, CAST(N'2018-01-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (6, 200000, 103000, 0, CAST(N'2018-02-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (6, 200000, 103000, 0, CAST(N'2018-03-01' AS Date))

INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (7, 200000, 140000, 0, CAST(N'2017-07-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (7, 300000, 2030000, 0, CAST(N'2017-08-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (7, 300000, 205000, 0, CAST(N'2017-09-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (7, 300000, 221000, 0, CAST(N'2017-10-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (7, 300000, 103000, 0, CAST(N'2017-11-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (7, 300000, 103000, 0, CAST(N'2017-12-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (7, 300000, 103000, 0, CAST(N'2018-01-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (7, 300000, 103000, 0, CAST(N'2018-02-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (7, 300000, 103000, 0, CAST(N'2018-03-01' AS Date))

INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (8, 100000, 60000, 0, CAST(N'2017-03-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (8, 100000, 70000, 0, CAST(N'2017-04-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (8, 100000, 54000, 0, CAST(N'2017-05-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (8, 100000, 65000, 0, CAST(N'2017-06-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (8, 100000, 68000, 0, CAST(N'2017-07-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (8, 100000, 77000, 0, CAST(N'2017-08-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (8, 100000, 80000, 0, CAST(N'2017-09-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (8, 100000, 67000, 0, CAST(N'2017-10-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (8, 100000, 103000, 0, CAST(N'2017-11-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (8, 100000, 103000, 0, CAST(N'2017-12-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (8, 100000, 103000, 0, CAST(N'2018-01-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (8, 100000, 103000, 0, CAST(N'2018-02-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (8, 100000, 103000, 0, CAST(N'2018-03-01' AS Date))

INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (9, 100000, 77000, 0, CAST(N'2017-10-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (9, 100000, 103000, 0, CAST(N'2017-11-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (9, 100000, 103000, 0, CAST(N'2017-12-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (9, 100000, 103000, 0, CAST(N'2018-01-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (9, 100000, 103000, 0, CAST(N'2018-02-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (9, 100000, 103000, 0, CAST(N'2018-03-01' AS Date))

INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (10, 200000, 160000, 0, CAST(N'2017-03-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (10, 200000, 170000, 0, CAST(N'2017-04-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (10, 200000, 154000, 0, CAST(N'2017-05-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (10, 200000, 165000, 0, CAST(N'2017-06-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (10, 200000, 168000, 0, CAST(N'2017-07-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (10, 300000, 277000, 0, CAST(N'2017-08-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (10, 300000, 180000, 0, CAST(N'2017-09-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (10, 300000, 167000, 0, CAST(N'2017-10-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (10, 300000, 103000, 0, CAST(N'2017-11-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (10, 300000, 103000, 0, CAST(N'2017-12-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (10, 300000, 103000, 0, CAST(N'2018-01-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (10, 300000, 103000, 0, CAST(N'2018-02-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (10, 300000, 103000, 0, CAST(N'2018-03-01' AS Date))

INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (11, 200000, 179000, 0, CAST(N'2017-08-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (11, 200000, 197000, 0, CAST(N'2017-09-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (11, 200000, 159000, 0, CAST(N'2017-10-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (11, 200000, 103000, 0, CAST(N'2017-11-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (11, 200000, 103000, 0, CAST(N'2017-12-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (11, 200000, 103000, 0, CAST(N'2018-01-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (11, 200000, 103000, 0, CAST(N'2018-02-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (11, 200000, 103000, 0, CAST(N'2018-03-01' AS Date))

INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (12, 100000, 110000, 0, CAST(N'2017-05-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (12, 100000, 120000, 0, CAST(N'2017-06-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (12, 100000, 113000, 0, CAST(N'2017-07-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (12, 100000, 92000, 0, CAST(N'2017-08-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (12, 100000, 115000, 0, CAST(N'2017-09-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (12, 100000, 103000, 0, CAST(N'2017-10-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (12, 100000, 103000, 0, CAST(N'2017-11-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (12, 100000, 103000, 0, CAST(N'2017-12-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (12, 100000, 103000, 0, CAST(N'2018-01-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (12, 100000, 103000, 0, CAST(N'2018-02-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (12, 100000, 103000, 0, CAST(N'2018-03-01' AS Date))

INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (13, 200000, 210000, 0, CAST(N'2017-05-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (13, 200000, 220000, 0, CAST(N'2017-06-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (13, 200000, 213000, 0, CAST(N'2017-07-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (13, 200000, 292000, 0, CAST(N'2017-08-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (13, 200000, 215000, 0, CAST(N'2017-09-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (13, 200000, 203000, 0, CAST(N'2017-10-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (13, 200000, 103000, 0, CAST(N'2017-11-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (13, 200000, 103000, 0, CAST(N'2017-12-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (13, 200000, 103000, 0, CAST(N'2018-01-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (13, 200000, 103000, 0, CAST(N'2018-02-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (13, 200000, 103000, 0, CAST(N'2018-03-01' AS Date))

INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (14, 100000, 60000, 0, CAST(N'2017-03-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (14, 100000, 70000, 0, CAST(N'2017-04-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (14, 100000, 54000, 0, CAST(N'2017-05-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (14, 100000, 65000, 0, CAST(N'2017-06-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (14, 100000, 68000, 0, CAST(N'2017-07-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (14, 100000, 77000, 0, CAST(N'2017-08-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (14, 100000, 80000, 0, CAST(N'2017-09-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (14, 100000, 67000, 0, CAST(N'2017-10-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (14, 100000, 103000, 0, CAST(N'2017-11-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (14, 100000, 103000, 0, CAST(N'2017-12-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (14, 100000, 103000, 0, CAST(N'2018-01-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (14, 100000, 103000, 0, CAST(N'2018-02-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (14, 100000, 103000, 0, CAST(N'2018-03-01' AS Date))

INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (15, 100000, 60000, 0, CAST(N'2017-03-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (15, 100000, 70000, 0, CAST(N'2017-04-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (15, 100000, 54000, 0, CAST(N'2017-05-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (15, 100000, 65000, 0, CAST(N'2017-06-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (15, 100000, 68000, 0, CAST(N'2017-07-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (15, 100000, 77000, 0, CAST(N'2017-08-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (15, 100000, 80000, 0, CAST(N'2017-09-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (15, 100000, 67000, 0, CAST(N'2017-10-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (15, 100000, 103000, 0, CAST(N'2017-11-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (15, 100000, 103000, 0, CAST(N'2017-12-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (15, 100000, 103000, 0, CAST(N'2018-01-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (15, 100000, 103000, 0, CAST(N'2018-02-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (15, 100000, 103000, 0, CAST(N'2018-03-01' AS Date))

INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (16, 100000, 64000, 0, CAST(N'2017-03-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (16, 100000, 73000, 0, CAST(N'2017-04-01' AS Date))
GO
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (16, 100000, 56000, 0, CAST(N'2017-05-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (16, 100000, 62000, 0, CAST(N'2017-06-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (16, 100000, 68000, 0, CAST(N'2017-07-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (16, 100000, 76000, 0, CAST(N'2017-08-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (16, 100000, 81000, 0, CAST(N'2017-09-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (16, 100000, 77000, 0, CAST(N'2017-10-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (16, 100000, 0, 0, CAST(N'2017-11-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (17, 100000, 79000, 0, CAST(N'2017-08-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (17, 100000, 67000, 0, CAST(N'2017-09-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (17, 100000, 59000, 0, CAST(N'2017-10-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (17, 100000, 0, 0, CAST(N'2017-11-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (18, 200000, 179000, 0, CAST(N'2017-08-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (18, 200000, 197000, 0, CAST(N'2017-09-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (18, 200000, 159000, 0, CAST(N'2017-10-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (18, 200000, 0, 0, CAST(N'2017-11-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (19, 200000, 160000, 0, CAST(N'2017-03-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (19, 200000, 170000, 0, CAST(N'2017-04-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (19, 300000, 254000, 0, CAST(N'2017-05-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (19, 300000, 265000, 0, CAST(N'2017-06-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (19, 300000, 268000, 0, CAST(N'2017-07-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (19, 300000, 277000, 0, CAST(N'2017-08-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (19, 300000, 280000, 0, CAST(N'2017-09-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (19, 300000, 267000, 0, CAST(N'2017-10-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (19, 300000, 0, 0, CAST(N'2017-11-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (20, 300000, 179000, 0, CAST(N'2017-08-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (20, 300000, 267000, 0, CAST(N'2017-09-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (20, 300000, 259000, 0, CAST(N'2017-10-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (20, 300000, 0, 0, CAST(N'2017-11-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (21, 100000, 79000, 0, CAST(N'2017-08-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (21, 300000, 167000, 0, CAST(N'2017-09-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (21, 300000, 159000, 0, CAST(N'2017-10-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (21, 300000, 0, 0, CAST(N'2017-11-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (22, 100000, 56000, 0, CAST(N'2017-05-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (22, 100000, 62000, 0, CAST(N'2017-06-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (22, 100000, 68000, 0, CAST(N'2017-07-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (22, 100000, 76000, 0, CAST(N'2017-08-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (22, 100000, 81000, 0, CAST(N'2017-09-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (22, 100000, 77000, 0, CAST(N'2017-10-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (22, 100000, 0, 0, CAST(N'2017-11-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (23, 300000, 256000, 0, CAST(N'2017-05-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (23, 300000, 262000, 0, CAST(N'2017-06-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (23, 300000, 268000, 0, CAST(N'2017-07-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (23, 300000, 276000, 0, CAST(N'2017-08-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (23, 300000, 181000, 0, CAST(N'2017-09-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (23, 300000, 177000, 0, CAST(N'2017-10-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (23, 300000, 0, 0, CAST(N'2017-11-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (24, 300000, 168000, 0, CAST(N'2017-07-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (24, 300000, 176000, 0, CAST(N'2017-08-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (24, 300000, 181000, 0, CAST(N'2017-09-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (24, 300000, 177000, 0, CAST(N'2017-10-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (24, 300000, 0, 0, CAST(N'2017-11-01' AS Date))
INSERT [dbo].[BillTBL] ([roomNumber], [defaultFee], [electricity], [extraFee], [monthBill]) VALUES (25, 100000, 0, 0, CAST(N'2017-11-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (1, 1, N'Dinh Le Hoang', N'111111111111', N'0912345678', N'0912345679', CAST(N'2017-05-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (2, 2, N'Nguyen Van Thai', N'222222222222', N'0987654321', N'0987654320', CAST(N'2017-03-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (3, 2, N'Tran Huu Hiep', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-08-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (4, 3, N'Vuong Dinh Nguyen', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-03-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (5, 4, N'Tran Hoang Long', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-08-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (6, 5, N'Ha Van Thai', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-08-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (7, 5, N'Nguyen Thanh Cong', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-08-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (8, 6, N'Hoang Van Hung', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-08-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (9, 6, N'Nam Khanh', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-08-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (10, 7, N'Dao Thi Phuong', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-07-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (11, 7, N'Dinh Trang', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-07-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (12, 7, N'Vu Thuy', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-08-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (13, 8, N'Nguyen Thi Mai', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-03-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (14, 9, N'Nguyen Van Quynh', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-10-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (15, 10, N'Phan Van Duc', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-03-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (16, 10, N'Nguyen Manh Tien', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-03-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (17, 10, N'Dao Duy Anh', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-08-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (18, 11, N'Do Xuan Duong', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-08-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (19, 11, N'Nguyen Thi Thao', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-08-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (20, 12, N'Dinh Thi Thom', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-05-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (21, 13, N'Nguyen Ba Quang', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-05-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (22, 13, N'Nguyen Trong Thang', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-05-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (23, 14, N'Le Quang Sang', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-03-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (24, 15, N'Do Duc', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-03-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (25, 16, N'Tran Manh Tien', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-03-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (26, 17, N'Xuan Hinh', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-08-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (27, 18, N'Pham Duy Binh', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-08-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (28, 18, N'Tran Hanh', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-08-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (29, 19, N'Tran Danh Tai', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-03-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (30, 19, N'Vu Thuong', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-05-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (31, 19, N'Nguyen Tien Dat', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-03-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (32, 20, N'Nguyen Duc Anh', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-08-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (33, 20, N'Dao Khanh Tung', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-08-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (34, 20, N'Nguyen Dung Tuan', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-08-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (35, 21, N'Le Xuan Hai', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-09-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (36, 21, N'Doan Hieu', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-09-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (37, 21, N'Trung Huy', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-08-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (38, 22, N'Vu Thanh', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-05-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (39, 23, N'Do Bao Huan', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-05-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (40, 23, N'Ninh Quang Hop', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-05-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (41, 23, N'Nguyen Hoang Trung', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-05-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (42, 24, N'Nghiem Duc Hanh', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-07-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (43, 24, N'Le Thi', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-07-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (44, 24, N'Le Van Phuc', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-07-01' AS Date))
INSERT [dbo].[CustomerTBL] ([customerID], [roomNumber], [customerName], [identityCard], [phoneNumber], [parentsPhoneNumber], [dateJoin]) VALUES (45, 25, N'Tran Thanh Hien', N'333333333333', N'0123456789', N'0123456780', CAST(N'2017-11-01' AS Date))
SET IDENTITY_INSERT [dbo].[LoginTBL] ON 

INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (0, N'admin', N'admin')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (1, N'hoangdl', N'hoangdl')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (2, N'thainv', N'thainv')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (3, N'hiepth', N'hiepth')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (4, N'nguyenvd', N'nguyenvd')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (5, N'longth', N'longth')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (6, N'thaihv', N'thaihv')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (7, N'congnv', N'congnv')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (8, N'hunghv', N'hunghv')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (9, N'khanhn', N'khanhn')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (10, N'phuongdt', N'phuongdt')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (11, N'trangd', N'trangd')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (12, N'thuyv', N'thuyv')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (13, N'maint', N'maint')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (14, N'quynhnv', N'quynhnv')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (15, N'ducpv', N'dupv')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (16, N'tiennm', N'tiennm')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (17, N'anhdd', N'anhdd')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (18, N'duongdx', N'duongdx')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (19, N'thaont', N'thaont')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (20, N'thomdt', N'thomdt')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (21, N'quangnb', N'quangnb')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (22, N'thanglt', N'thanglt')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (23, N'sanglq', N'sanglq')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (24, N'ducd', N'ducd')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (25, N'tientm', N'tientm')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (26, N'hinhx', N'hinhx')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (27, N'binhpd', N'binhpd')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (28, N'hanht', N'hanht')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (29, N'taitd', N'taitd')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (30, N'thuongv', N'thuongv')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (31, N'datnt', N'datnt')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (32, N'anhnd', N'anhnd')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (33, N'tungdk', N'tungdk')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (34, N'tuannd', N'tuannd')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (35, N'hailx', N'hailx')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (36, N'hieud', N'hieud')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (37, N'huyt', N'huyt')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (38, N'thanhv', N'thanhv')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (39, N'huandb', N'huandb')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (40, N'hopnq', N'hopnq')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (41, N'trungnh', N'trungnh')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (42, N'hanhnd', N'hanhnd')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (43, N'thil', N'thil')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (44, N'phuclv', N'phuclv')
INSERT [dbo].[LoginTBL] ([customerID], [uname], [psw]) VALUES (45, N'hienth', N'hienth')
SET IDENTITY_INSERT [dbo].[LoginTBL] OFF
INSERT [dbo].[RoomInfoTBL] ([roomNumber], [roomTypeID], [numPerson], [available]) VALUES (1, 2, 1, 1)
INSERT [dbo].[RoomInfoTBL] ([roomNumber], [roomTypeID], [numPerson], [available]) VALUES (2, 2, 2, 1)
INSERT [dbo].[RoomInfoTBL] ([roomNumber], [roomTypeID], [numPerson], [available]) VALUES (3, 4, 1, 1)
INSERT [dbo].[RoomInfoTBL] ([roomNumber], [roomTypeID], [numPerson], [available]) VALUES (4, 2, 1, 1)
INSERT [dbo].[RoomInfoTBL] ([roomNumber], [roomTypeID], [numPerson], [available]) VALUES (5, 2, 2, 1)
INSERT [dbo].[RoomInfoTBL] ([roomNumber], [roomTypeID], [numPerson], [available]) VALUES (6, 2, 2, 1)
INSERT [dbo].[RoomInfoTBL] ([roomNumber], [roomTypeID], [numPerson], [available]) VALUES (7, 1, 3, 0)
INSERT [dbo].[RoomInfoTBL] ([roomNumber], [roomTypeID], [numPerson], [available]) VALUES (8, 1, 1, 1)
INSERT [dbo].[RoomInfoTBL] ([roomNumber], [roomTypeID], [numPerson], [available]) VALUES (9, 1, 1, 1)
INSERT [dbo].[RoomInfoTBL] ([roomNumber], [roomTypeID], [numPerson], [available]) VALUES (10, 1, 3, 0)
INSERT [dbo].[RoomInfoTBL] ([roomNumber], [roomTypeID], [numPerson], [available]) VALUES (11, 1, 2, 1)
INSERT [dbo].[RoomInfoTBL] ([roomNumber], [roomTypeID], [numPerson], [available]) VALUES (12, 1, 1, 1)
INSERT [dbo].[RoomInfoTBL] ([roomNumber], [roomTypeID], [numPerson], [available]) VALUES (13, 1, 2, 1)
INSERT [dbo].[RoomInfoTBL] ([roomNumber], [roomTypeID], [numPerson], [available]) VALUES (14, 1, 1, 1)
INSERT [dbo].[RoomInfoTBL] ([roomNumber], [roomTypeID], [numPerson], [available]) VALUES (15, 1, 1, 1)
INSERT [dbo].[RoomInfoTBL] ([roomNumber], [roomTypeID], [numPerson], [available]) VALUES (16, 1, 1, 1)
INSERT [dbo].[RoomInfoTBL] ([roomNumber], [roomTypeID], [numPerson], [available]) VALUES (17, 1, 1, 1)
INSERT [dbo].[RoomInfoTBL] ([roomNumber], [roomTypeID], [numPerson], [available]) VALUES (18, 1, 2, 1)
INSERT [dbo].[RoomInfoTBL] ([roomNumber], [roomTypeID], [numPerson], [available]) VALUES (19, 3, 3, 0)
INSERT [dbo].[RoomInfoTBL] ([roomNumber], [roomTypeID], [numPerson], [available]) VALUES (20, 3, 3, 0)
INSERT [dbo].[RoomInfoTBL] ([roomNumber], [roomTypeID], [numPerson], [available]) VALUES (21, 3, 3, 0)
INSERT [dbo].[RoomInfoTBL] ([roomNumber], [roomTypeID], [numPerson], [available]) VALUES (22, 4, 1, 1)
INSERT [dbo].[RoomInfoTBL] ([roomNumber], [roomTypeID], [numPerson], [available]) VALUES (23, 2, 3, 0)
INSERT [dbo].[RoomInfoTBL] ([roomNumber], [roomTypeID], [numPerson], [available]) VALUES (24, 1, 3, 0)
INSERT [dbo].[RoomInfoTBL] ([roomNumber], [roomTypeID], [numPerson], [available]) VALUES (25, 1, 1, 1)
INSERT [dbo].[RoomTypeTBL] ([roomTypeID], [optional], [closed], [price], [note]) VALUES (1, 1, 1, 1400000, N'Full option and closed')
INSERT [dbo].[RoomTypeTBL] ([roomTypeID], [optional], [closed], [price], [note]) VALUES (2, 1, 0, 1300000, N'Full option but not closed')
INSERT [dbo].[RoomTypeTBL] ([roomTypeID], [optional], [closed], [price], [note]) VALUES (3, 0, 1, 1300000, N'Closed but not full option')
INSERT [dbo].[RoomTypeTBL] ([roomTypeID], [optional], [closed], [price], [note]) VALUES (4, 0, 0, 1100000, N'neither closed nor full option')
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__LoginTBL__C7D2484E0AD2A005]    Script Date: 03/28/2018 15:28:25 ******/
ALTER TABLE [dbo].[LoginTBL] ADD UNIQUE NONCLUSTERED 
(
	[uname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BillTBL]  WITH CHECK ADD FOREIGN KEY([roomNumber])
REFERENCES [dbo].[RoomInfoTBL] ([roomNumber])
GO
ALTER TABLE [dbo].[CustomerTBL]  WITH CHECK ADD FOREIGN KEY([customerID])
REFERENCES [dbo].[LoginTBL] ([customerID])
GO
ALTER TABLE [dbo].[CustomerTBL]  WITH CHECK ADD FOREIGN KEY([roomNumber])
REFERENCES [dbo].[RoomInfoTBL] ([roomNumber])
GO
ALTER TABLE [dbo].[ExtraTBL]  WITH CHECK ADD FOREIGN KEY([roomNumber])
REFERENCES [dbo].[RoomInfoTBL] ([roomNumber])
GO
ALTER TABLE [dbo].[RoomInfoTBL]  WITH CHECK ADD FOREIGN KEY([roomTypeID])
REFERENCES [dbo].[RoomTypeTBL] ([roomTypeID])
GO
USE [master]
GO
ALTER DATABASE [BHouseDB] SET  READ_WRITE 
GO
