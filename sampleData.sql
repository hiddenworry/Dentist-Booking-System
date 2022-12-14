USE [master]
GO
/****** Object:  Database [dentist]    Script Date: 7/31/2022 3:20:28 PM ******/
CREATE DATABASE [dentist]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dentist', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dentist.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dentist_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\dentist_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dentist] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dentist].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dentist] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dentist] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dentist] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dentist] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dentist] SET ARITHABORT OFF 
GO
ALTER DATABASE [dentist] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [dentist] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dentist] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dentist] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dentist] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dentist] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dentist] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dentist] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dentist] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dentist] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dentist] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dentist] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dentist] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dentist] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dentist] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dentist] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dentist] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dentist] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dentist] SET  MULTI_USER 
GO
ALTER DATABASE [dentist] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dentist] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dentist] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dentist] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dentist] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dentist] SET QUERY_STORE = OFF
GO
USE [dentist]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/31/2022 3:20:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date_of_birth] [date] NOT NULL,
	[email] [varchar](50) NULL,
	[full_name] [nvarchar](30) NOT NULL,
	[gender] [int] NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[phone] [varchar](10) NULL,
	[status] [decimal](1, 0) NOT NULL,
	[district_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 7/31/2022 3:20:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[appointment_date] [date] NOT NULL,
	[appointment_time] [varchar](255) NOT NULL,
	[note] [nvarchar](max) NULL,
	[status] [decimal](1, 0) NOT NULL,
	[time_making] [datetime2](7) NOT NULL,
	[account_id] [int] NOT NULL,
	[branch_id] [int] NOT NULL,
	[doctor_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointment_Detail]    Script Date: 7/31/2022 3:20:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment_Detail](
	[appointment_id] [int] NOT NULL,
	[service_id] [int] NOT NULL,
	[discount_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[appointment_id] ASC,
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 7/31/2022 3:20:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[close_time] [time](7) NOT NULL,
	[name] [nvarchar](30) NOT NULL,
	[open_time] [time](7) NOT NULL,
	[status] [decimal](1, 0) NOT NULL,
	[url] [varchar](max) NOT NULL,
	[district_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 7/31/2022 3:20:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[end_date] [date] NOT NULL,
	[name] [nvarchar](30) NOT NULL,
	[percentage] [float] NOT NULL,
	[start_date] [date] NOT NULL,
	[status] [decimal](1, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount_Service]    Script Date: 7/31/2022 3:20:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount_Service](
	[discount_id] [int] NOT NULL,
	[service_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[discount_id] ASC,
	[service_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[District]    Script Date: 7/31/2022 3:20:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NOT NULL,
	[province_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 7/31/2022 3:20:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[name] [nvarchar](30) NOT NULL,
	[status] [decimal](1, 0) NOT NULL,
	[url] [varchar](max) NOT NULL,
	[branch_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 7/31/2022 3:20:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[content] [nvarchar](150) NOT NULL,
	[status] [decimal](1, 0) NOT NULL,
	[time] [date] NOT NULL,
	[appointment_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 7/31/2022 3:20:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[account_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Province]    Script Date: 7/31/2022 3:20:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Province](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/31/2022 3:20:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 7/31/2022 3:20:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[estimated_time] [float] NOT NULL,
	[max_price] [float] NOT NULL,
	[min_price] [float] NOT NULL,
	[name] [nvarchar](30) NOT NULL,
	[status] [decimal](1, 0) NOT NULL,
	[url] [varchar](max) NOT NULL,
	[service_type_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceType]    Script Date: 7/31/2022 3:20:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[name] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id], [date_of_birth], [email], [full_name], [gender], [password], [phone], [status], [district_id], [role_id]) VALUES (1, CAST(N'2001-09-09' AS Date), N'1234@gmail.com', N'Nguyễn Trung Hiếu', 1, N'$2a$10$nbRlmsNRpZxPgsN1q5h7PuE5auLI4UTEWEg9v/qKjvYCws2WbR1Nu', N'0987121963', CAST(1 AS Decimal(1, 0)), 1, 1)
INSERT [dbo].[Account] ([id], [date_of_birth], [email], [full_name], [gender], [password], [phone], [status], [district_id], [role_id]) VALUES (2, CAST(N'2001-09-27' AS Date), N'', N'Hồ Nguyễn Trung Hiếu', 2, N'$2a$10$95poxOVWF5hdbV.EDGeZMuze3ustiKwHyEsMn4vjsD/NTS5yd0Vla', N'0345741884', CAST(1 AS Decimal(1, 0)), 1, 3)
INSERT [dbo].[Account] ([id], [date_of_birth], [email], [full_name], [gender], [password], [phone], [status], [district_id], [role_id]) VALUES (3, CAST(N'2001-03-03' AS Date), N'', N'Quỳnh Phương Anh', 1, N'$2a$10$95poxOVWF5hdbV.EDGeZMuze3ustiKwHyEsMn4vjsD/NTS5yd0Vla', N'0345741885', CAST(1 AS Decimal(1, 0)), 1, 3)
INSERT [dbo].[Account] ([id], [date_of_birth], [email], [full_name], [gender], [password], [phone], [status], [district_id], [role_id]) VALUES (4, CAST(N'2001-06-09' AS Date), N'', N'Phạm Xuân Kiên', 2, N'$2a$10$6okgFUjfIKBgBSKOsk.tIuxwU6ZwENBm7OUn0nZVxfouZB087gyOe', N'0345741883', CAST(1 AS Decimal(1, 0)), 14, 2)
INSERT [dbo].[Account] ([id], [date_of_birth], [email], [full_name], [gender], [password], [phone], [status], [district_id], [role_id]) VALUES (5, CAST(N'2001-07-16' AS Date), N'', N'Nguyễn Trung Hiếu', 1, N'$2a$10$95poxOVWF5hdbV.EDGeZMuze3ustiKwHyEsMn4vjsD/NTS5yd0Vla', N'0973073310', CAST(1 AS Decimal(1, 0)), 8, 2)
INSERT [dbo].[Account] ([id], [date_of_birth], [email], [full_name], [gender], [password], [phone], [status], [district_id], [role_id]) VALUES (6, CAST(N'2004-10-22' AS Date), N'', N'Nguyễn Phan Quỳnh Anh', 2, N'$2a$10$4vwQBXbURjcfzzvKHof7surpq4e1cuz/LvPIO7GPPtOL98wtsthQC', N'0986724746', CAST(1 AS Decimal(1, 0)), 18, 2)
INSERT [dbo].[Account] ([id], [date_of_birth], [email], [full_name], [gender], [password], [phone], [status], [district_id], [role_id]) VALUES (7, CAST(N'1991-03-12' AS Date), N'ntrunghieu1701@gmail.com', N'Lê Quốc Bảo', 1, N'$2a$10$95poxOVWF5hdbV.EDGeZMuze3ustiKwHyEsMn4vjsD/NTS5yd0Vla', N'0986121631', CAST(1 AS Decimal(1, 0)), 15, 2)
INSERT [dbo].[Account] ([id], [date_of_birth], [email], [full_name], [gender], [password], [phone], [status], [district_id], [role_id]) VALUES (8, CAST(N'2000-07-07' AS Date), N'ntrunghieu1701@gmail.com', N'Hồ Trung Hiếu', 1, N'$2a$10$95poxOVWF5hdbV.EDGeZMuze3ustiKwHyEsMn4vjsD/NTS5yd0Vla', N'0792435566', CAST(1 AS Decimal(1, 0)), 14, 2)
INSERT [dbo].[Account] ([id], [date_of_birth], [email], [full_name], [gender], [password], [phone], [status], [district_id], [role_id]) VALUES (9, CAST(N'2000-02-29' AS Date), N'ntrunghieu1701@gmail.com', N'Phạm Phước Long', 2, N'$2a$10$95poxOVWF5hdbV.EDGeZMuze3ustiKwHyEsMn4vjsD/NTS5yd0Vla', N'0792435567', CAST(1 AS Decimal(1, 0)), 12, 2)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Appointment] ON 

INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (16, CAST(N'2022-01-08' AS Date), N'08:00-10:30', NULL, CAST(6 AS Decimal(1, 0)), CAST(N'2022-01-01T07:53:44.6880000' AS DateTime2), 4, 3, 6)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (17, CAST(N'2022-01-08' AS Date), N'09:00-11:00', N'Tình trạng răng chưa đủ điều kiện để trám răng vàng, quay lại tía khám sau 2 tuần', CAST(1 AS Decimal(1, 0)), CAST(N'2022-01-01T07:54:53.7580000' AS DateTime2), 5, 2, 4)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (18, CAST(N'2022-01-06' AS Date), N'07:00-09:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-01-01T07:55:48.1010000' AS DateTime2), 6, 1, 2)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (19, CAST(N'2022-01-07' AS Date), N'09:00-11:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-01-01T08:01:39.0030000' AS DateTime2), 7, 3, 6)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (20, CAST(N'2022-01-12' AS Date), N'13:00-15:00', N'Chân răng bị viêm, không thể trám răng vàng, cần tái khám sau 1 tuần', CAST(1 AS Decimal(1, 0)), CAST(N'2022-01-08T08:25:49.4980000' AS DateTime2), 4, 3, 6)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (21, CAST(N'2022-01-15' AS Date), N'10:00-12:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-01-08T08:26:58.9710000' AS DateTime2), 5, 2, 3)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (22, CAST(N'2022-01-15' AS Date), N'13:00-15:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-01-08T08:28:52.4170000' AS DateTime2), 6, 2, 3)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (23, CAST(N'2022-01-11' AS Date), N'08:00-10:00', NULL, CAST(3 AS Decimal(1, 0)), CAST(N'2022-01-08T08:29:55.9210000' AS DateTime2), 7, 3, 6)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (24, CAST(N'2022-01-25' AS Date), N'08:00-10:30', N'Sâu răng đã tương đối giảm, cần tái khám sau 2 tuần', CAST(5 AS Decimal(1, 0)), CAST(N'2022-01-18T08:20:27.3340000' AS DateTime2), 4, 2, 4)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (25, CAST(N'2022-01-22' AS Date), N'08:00-09:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-01-18T08:21:21.5670000' AS DateTime2), 5, 2, 4)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (26, CAST(N'2022-01-22' AS Date), N'07:00-08:30', NULL, CAST(3 AS Decimal(1, 0)), CAST(N'2022-01-18T08:22:26.7510000' AS DateTime2), 6, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (27, CAST(N'2022-01-20' AS Date), N'08:30-09:00', NULL, CAST(3 AS Decimal(1, 0)), CAST(N'2022-01-18T08:23:24.9580000' AS DateTime2), 7, 3, 6)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (28, CAST(N'2022-01-22' AS Date), N'08:00-09:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-01-18T08:23:55.7680000' AS DateTime2), 7, 2, 3)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (29, CAST(N'2022-01-29' AS Date), N'08:00-10:00', N'Chân răng bị viêm, cần uống thuốc đầy đủ và tái khám sau 5 ngày', CAST(1 AS Decimal(1, 0)), CAST(N'2022-01-26T08:32:02.1680000' AS DateTime2), 4, 2, 3)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (30, CAST(N'2022-01-29' AS Date), N'10:00-12:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-01-26T08:33:03.5550000' AS DateTime2), 5, 2, 3)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (31, CAST(N'2022-02-02' AS Date), N'07:00-09:30', N'Răng có dấu hiệu bị sâu, cần đi tái khám sau 1 tuần', CAST(1 AS Decimal(1, 0)), CAST(N'2022-01-31T08:38:15.3250000' AS DateTime2), 4, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (32, CAST(N'2022-02-05' AS Date), N'08:00-10:30', NULL, CAST(3 AS Decimal(1, 0)), CAST(N'2022-01-31T08:39:59.0480000' AS DateTime2), 5, 2, 3)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (33, CAST(N'2022-02-03' AS Date), N'10:30-12:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-01-31T08:40:32.2200000' AS DateTime2), 5, 3, 6)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (34, CAST(N'2022-02-03' AS Date), N'08:30-10:30', NULL, CAST(5 AS Decimal(1, 0)), CAST(N'2022-01-31T08:42:06.0380000' AS DateTime2), 6, 3, 6)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (35, CAST(N'2022-02-01' AS Date), N'14:00-15:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-01-31T08:43:56.6300000' AS DateTime2), 7, 3, 6)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (36, CAST(N'2022-02-10' AS Date), N'07:00-09:00', NULL, CAST(2 AS Decimal(1, 0)), CAST(N'2022-02-06T07:36:00.4480000' AS DateTime2), 4, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (37, CAST(N'2022-02-11' AS Date), N'08:00-10:30', N'Bệnh nhân có tình trạng răng tốt, ca phẩu thuật thuận lợi, cần tái khám sau 3 tuần để bác sĩ kiểm tra lại', CAST(1 AS Decimal(1, 0)), CAST(N'2022-02-06T07:36:55.6870000' AS DateTime2), 5, 2, 3)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (38, CAST(N'2022-02-10' AS Date), N'08:00-10:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-02-06T07:37:40.6900000' AS DateTime2), 6, 3, 6)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (39, CAST(N'2022-02-12' AS Date), N'09:00-10:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-02-06T07:38:36.6120000' AS DateTime2), 7, 3, 6)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (40, CAST(N'2022-02-19' AS Date), N'08:00-09:30', NULL, CAST(3 AS Decimal(1, 0)), CAST(N'2022-02-15T08:03:05.0930000' AS DateTime2), 4, 2, 3)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (41, CAST(N'2022-02-17' AS Date), N'08:00-10:30', N'Răng cấm bị sâu nghiêm trọng, có khả năng nhiểm trùng, cần sử dụng thuốc chữa trị trước khi nhổ, hẹn tái khám vào tuần sau', CAST(1 AS Decimal(1, 0)), CAST(N'2022-02-15T08:04:54.8080000' AS DateTime2), 5, 3, 6)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (42, CAST(N'2022-02-19' AS Date), N'08:00-10:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-02-15T08:06:09.0820000' AS DateTime2), 6, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (43, CAST(N'2022-02-19' AS Date), N'07:30-09:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-02-15T08:06:57.6550000' AS DateTime2), 7, 1, 2)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (44, CAST(N'2022-02-22' AS Date), N'08:00-08:30', NULL, CAST(6 AS Decimal(1, 0)), CAST(N'2022-02-20T07:39:11.5950000' AS DateTime2), 4, 3, 6)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (45, CAST(N'2022-02-22' AS Date), N'09:00-10:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-02-20T07:40:29.8090000' AS DateTime2), 5, 2, 3)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (46, CAST(N'2022-02-23' AS Date), N'07:30-09:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-02-20T07:41:28.3330000' AS DateTime2), 6, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (47, CAST(N'2022-02-22' AS Date), N'07:30-09:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-02-20T07:42:13.7370000' AS DateTime2), 7, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (57, CAST(N'2022-03-03' AS Date), N'12:30-13:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-03-01T23:40:19.5040000' AS DateTime2), 4, 3, 10)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (58, CAST(N'2022-03-03' AS Date), N'09:30-10:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-03-01T23:40:44.1730000' AS DateTime2), 5, 1, 3)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (59, CAST(N'2022-03-03' AS Date), N'09:30-10:30', NULL, CAST(6 AS Decimal(1, 0)), CAST(N'2022-03-01T23:41:07.4470000' AS DateTime2), 6, 1, 2)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (60, CAST(N'2022-03-03' AS Date), N'15:30-16:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-03-01T23:41:34.2800000' AS DateTime2), 7, 3, 10)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (61, CAST(N'2022-03-03' AS Date), N'10:30-11:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-03-01T23:41:59.7840000' AS DateTime2), 8, 3, 10)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (62, CAST(N'2022-03-03' AS Date), N'07:30-08:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-03-01T23:42:21.6840000' AS DateTime2), 9, 1, 3)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (63, CAST(N'2022-03-10' AS Date), N'08:30-09:30', NULL, CAST(3 AS Decimal(1, 0)), CAST(N'2022-03-03T23:49:45.5930000' AS DateTime2), 4, 3, 10)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (64, CAST(N'2022-03-05' AS Date), N'12:30-13:00', NULL, CAST(6 AS Decimal(1, 0)), CAST(N'2022-03-03T23:50:25.4260000' AS DateTime2), 4, 3, 9)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (65, CAST(N'2022-03-10' AS Date), N'10:30-11:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-03-03T23:56:59.7480000' AS DateTime2), 4, 3, 10)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (66, CAST(N'2022-03-05' AS Date), N'07:30-08:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-03-07T23:58:02.7520000' AS DateTime2), 5, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (67, CAST(N'2022-03-10' AS Date), N'07:30-08:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-03-07T00:03:14.1340000' AS DateTime2), 5, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (68, CAST(N'2022-03-10' AS Date), N'07:30-08:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-03-07T00:03:45.5600000' AS DateTime2), 6, 1, 2)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (69, CAST(N'2022-03-10' AS Date), N'11:00-11:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-03-07T00:04:14.9120000' AS DateTime2), 7, 3, 10)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (70, CAST(N'2022-03-10' AS Date), N'12:00-13:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-03-07T00:04:48.7620000' AS DateTime2), 8, 3, 10)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (71, CAST(N'2022-03-10' AS Date), N'09:30-10:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-03-07T00:05:37.1360000' AS DateTime2), 9, 1, 3)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (72, CAST(N'2022-03-16' AS Date), N'12:30-14:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-03-14T00:14:04.7850000' AS DateTime2), 4, 3, 9)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (73, CAST(N'2022-03-16' AS Date), N'11:30-12:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-03-14T00:14:58.6120000' AS DateTime2), 5, 1, 3)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (74, CAST(N'2022-03-16' AS Date), N'14:00-14:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-03-14T00:15:25.9270000' AS DateTime2), 6, 1, 3)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (75, CAST(N'2022-03-16' AS Date), N'14:00-14:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-03-14T00:16:03.5500000' AS DateTime2), 7, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (76, CAST(N'2022-03-16' AS Date), N'11:30-12:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-03-14T00:16:43.4960000' AS DateTime2), 8, 3, 9)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (77, CAST(N'2022-03-16' AS Date), N'09:30-10:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-03-14T00:17:22.4820000' AS DateTime2), 9, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (78, CAST(N'2022-03-26' AS Date), N'12:00-13:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-03-25T00:22:51.5580000' AS DateTime2), 4, 3, 10)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (79, CAST(N'2022-03-26' AS Date), N'11:30-12:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-03-25T00:23:18.7810000' AS DateTime2), 5, 1, 3)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (80, CAST(N'2022-03-26' AS Date), N'09:30-10:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-03-25T00:23:43.7050000' AS DateTime2), 6, 1, 2)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (81, CAST(N'2022-03-26' AS Date), N'12:30-13:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-03-25T00:24:08.6380000' AS DateTime2), 7, 3, 11)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (82, CAST(N'2022-03-26' AS Date), N'13:00-14:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-03-25T00:24:32.8220000' AS DateTime2), 8, 1, 2)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (83, CAST(N'2022-03-26' AS Date), N'10:30-11:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-03-25T00:24:56.3420000' AS DateTime2), 9, 2, 6)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (84, CAST(N'2022-04-02' AS Date), N'10:30-11:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-04-01T00:29:15.1010000' AS DateTime2), 4, 3, 9)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (85, CAST(N'2022-04-02' AS Date), N'09:30-11:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-04-01T00:30:25.2060000' AS DateTime2), 5, 1, 4)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (86, CAST(N'2022-04-02' AS Date), N'09:30-10:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-04-01T00:31:41.9150000' AS DateTime2), 6, 1, 2)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (87, CAST(N'2022-04-02' AS Date), N'11:30-12:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-04-01T00:32:12.8050000' AS DateTime2), 7, 3, 9)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (88, CAST(N'2022-04-02' AS Date), N'07:30-08:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-04-01T00:32:35.7080000' AS DateTime2), 8, 1, 2)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (89, CAST(N'2022-04-02' AS Date), N'08:30-09:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-04-01T00:32:58.8360000' AS DateTime2), 9, 2, 6)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (90, CAST(N'2022-04-08' AS Date), N'12:30-13:30', NULL, CAST(3 AS Decimal(1, 0)), CAST(N'2022-04-07T00:34:48.3480000' AS DateTime2), 4, 3, 11)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (91, CAST(N'2022-04-08' AS Date), N'08:30-09:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-04-07T00:35:13.3490000' AS DateTime2), 4, 3, 9)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (92, CAST(N'2022-04-08' AS Date), N'07:30-08:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-04-07T00:36:46.6530000' AS DateTime2), 5, 1, 2)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (93, CAST(N'2022-04-13' AS Date), N'09:30-10:00', NULL, CAST(6 AS Decimal(1, 0)), CAST(N'2022-04-07T00:37:37.4000000' AS DateTime2), 6, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (94, CAST(N'2022-04-08' AS Date), N'10:00-11:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-04-07T00:39:14.3290000' AS DateTime2), 7, 3, 10)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (95, CAST(N'2022-04-08' AS Date), N'09:00-09:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-04-07T08:18:58.4740000' AS DateTime2), 8, 3, 9)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (96, CAST(N'2022-04-08' AS Date), N'10:30-11:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-04-07T08:19:28.0720000' AS DateTime2), 9, 2, 5)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (97, CAST(N'2022-04-15' AS Date), N'07:30-08:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-04-14T10:56:19.0800000' AS DateTime2), 4, 1, 2)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (98, CAST(N'2022-04-16' AS Date), N'07:30-08:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-04-14T10:57:02.9470000' AS DateTime2), 5, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (99, CAST(N'2022-04-15' AS Date), N'09:30-10:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-04-14T10:59:11.9860000' AS DateTime2), 6, 1, 3)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (100, CAST(N'2022-04-15' AS Date), N'08:00-09:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-04-14T10:59:43.7330000' AS DateTime2), 7, 3, 10)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (101, CAST(N'2022-04-15' AS Date), N'16:00-18:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-04-14T11:00:13.8130000' AS DateTime2), 8, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (102, CAST(N'2022-04-15' AS Date), N'12:30-13:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-04-14T11:00:38.4560000' AS DateTime2), 9, 1, 2)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (103, CAST(N'2022-04-22' AS Date), N'07:00-08:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-04-21T11:03:04.2870000' AS DateTime2), 4, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (104, CAST(N'2022-04-22' AS Date), N'08:30-09:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-04-21T11:11:18.9410000' AS DateTime2), 5, 2, 6)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (105, CAST(N'2022-04-22' AS Date), N'08:30-09:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-04-21T11:16:07.9060000' AS DateTime2), 6, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (106, CAST(N'2022-04-22' AS Date), N'17:30-18:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-04-21T11:16:35.6190000' AS DateTime2), 7, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (107, CAST(N'2022-04-22' AS Date), N'09:30-10:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-04-21T11:17:02.1540000' AS DateTime2), 8, 1, 2)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (108, CAST(N'2022-04-22' AS Date), N'16:30-17:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-04-21T11:17:27.7290000' AS DateTime2), 9, 2, 5)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (109, CAST(N'2022-05-02' AS Date), N'13:00-13:30', NULL, CAST(3 AS Decimal(1, 0)), CAST(N'2022-04-30T23:05:55.2110000' AS DateTime2), 4, 3, 10)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (110, CAST(N'2022-05-03' AS Date), N'13:00-14:00', N'Đã hoàn thành các dịch vụ, phát hiện 1 số răng hàm trên bị sâu mức độ nhẹ, hẹn tái khám để nhổ', CAST(1 AS Decimal(1, 0)), CAST(N'2022-04-30T23:06:56.0660000' AS DateTime2), 4, 3, 10)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (111, CAST(N'2022-05-03' AS Date), N'07:00-08:00', N'Đã hoàn thành các dịch vụ, không có răng có vấn đề', CAST(5 AS Decimal(1, 0)), CAST(N'2022-04-30T23:11:22.6050000' AS DateTime2), 5, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (112, CAST(N'2022-05-06' AS Date), N'16:30-18:00', NULL, CAST(3 AS Decimal(1, 0)), CAST(N'2022-04-30T23:15:12.4030000' AS DateTime2), 6, 1, 3)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (113, CAST(N'2022-05-06' AS Date), N'17:30-18:00', N'Đã hoàn thành các dịch vụ, không có răng có vấn đề', CAST(1 AS Decimal(1, 0)), CAST(N'2022-04-30T23:15:40.6440000' AS DateTime2), 6, 1, 2)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (114, CAST(N'2022-05-11' AS Date), N'18:00-20:00', NULL, CAST(3 AS Decimal(1, 0)), CAST(N'2022-05-06T23:47:35.3590000' AS DateTime2), 7, 3, 12)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (115, CAST(N'2022-05-12' AS Date), N'18:30-20:00', NULL, CAST(6 AS Decimal(1, 0)), CAST(N'2022-05-06T23:48:08.6280000' AS DateTime2), 7, 3, 12)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (116, CAST(N'2022-05-10' AS Date), N'19:30-20:00', NULL, CAST(6 AS Decimal(1, 0)), CAST(N'2022-05-06T23:48:53.2540000' AS DateTime2), 8, 3, 11)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (117, CAST(N'2022-05-13' AS Date), N'17:00-18:00', NULL, CAST(3 AS Decimal(1, 0)), CAST(N'2022-05-06T23:49:38.9320000' AS DateTime2), 9, 1, 3)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (118, CAST(N'2022-05-11' AS Date), N'17:30-18:00', N'Đã hoàn thành các dịch vụ, phát hiện 1 số răng hàm dưới bị sâu mức độ nhẹ, hẹn tái khám để nhổ', CAST(1 AS Decimal(1, 0)), CAST(N'2022-05-06T23:50:13.7810000' AS DateTime2), 9, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (119, CAST(N'2022-05-14' AS Date), N'19:00-20:00', N'Đã hoàn thành các dịch vụ, không có răng có vấn đề', CAST(1 AS Decimal(1, 0)), CAST(N'2022-05-09T07:05:43.5760000' AS DateTime2), 4, 3, 9)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (120, CAST(N'2022-05-16' AS Date), N'16:30-18:00', NULL, CAST(3 AS Decimal(1, 0)), CAST(N'2022-05-09T07:06:23.5420000' AS DateTime2), 5, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (121, CAST(N'2022-05-16' AS Date), N'17:00-18:00', N'Đã hoàn thành các dịch vụ, không có răng có vấn đề', CAST(1 AS Decimal(1, 0)), CAST(N'2022-05-09T07:07:04.1920000' AS DateTime2), 5, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (122, CAST(N'2022-05-14' AS Date), N'17:30-18:00', N'Đã hoàn thành các dịch vụ, không có răng có vấn đề', CAST(1 AS Decimal(1, 0)), CAST(N'2022-05-09T07:07:40.3930000' AS DateTime2), 6, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (123, CAST(N'2022-05-28' AS Date), N'19:00-20:00', N'Đã hoàn thành các dịch vụ, phát hiện 1 số răng hàm trên bị sâu mức độ nhẹ, hẹn tái khám để nhổ', CAST(1 AS Decimal(1, 0)), CAST(N'2022-05-21T07:34:07.3620000' AS DateTime2), 7, 3, 9)
GO
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (124, CAST(N'2022-05-27' AS Date), N'19:30-20:00', NULL, CAST(3 AS Decimal(1, 0)), CAST(N'2022-05-21T07:34:40.9660000' AS DateTime2), 8, 3, 9)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (125, CAST(N'2022-05-28' AS Date), N'09:00-09:30', N'Đã hoàn thành các dịch vụ, phát hiện 1 số răng hàm trên bị sâu mức độ nhẹ, hẹn tái khám để nhổ', CAST(1 AS Decimal(1, 0)), CAST(N'2022-05-21T07:35:07.2240000' AS DateTime2), 8, 3, 10)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (126, CAST(N'2022-05-28' AS Date), N'14:00-15:00', NULL, CAST(3 AS Decimal(1, 0)), CAST(N'2022-05-21T07:35:44.2480000' AS DateTime2), 9, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (127, CAST(N'2022-05-28' AS Date), N'17:30-18:00', N'Đã hoàn thành các dịch vụ, không có răng có vấn đề', CAST(1 AS Decimal(1, 0)), CAST(N'2022-05-21T07:36:21.3140000' AS DateTime2), 9, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (128, CAST(N'2022-05-31' AS Date), N'18:00-20:00', NULL, CAST(3 AS Decimal(1, 0)), CAST(N'2022-05-28T07:46:41.0310000' AS DateTime2), 4, 3, 9)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (129, CAST(N'2022-05-30' AS Date), N'08:00-08:30', N'Đã hoàn thành các dịch vụ, không có răng có vấn đề', CAST(1 AS Decimal(1, 0)), CAST(N'2022-05-28T07:47:10.6190000' AS DateTime2), 4, 3, 9)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (130, CAST(N'2022-05-31' AS Date), N'07:30-08:00', NULL, CAST(3 AS Decimal(1, 0)), CAST(N'2022-05-28T07:47:53.0050000' AS DateTime2), 5, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (131, CAST(N'2022-05-30' AS Date), N'07:00-07:30', NULL, CAST(2 AS Decimal(1, 0)), CAST(N'2022-05-28T07:48:43.3820000' AS DateTime2), 5, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (132, CAST(N'2022-05-30' AS Date), N'08:30-09:00', N'Đã hoàn thành các dịch vụ, không có răng có vấn đề', CAST(1 AS Decimal(1, 0)), CAST(N'2022-05-28T07:49:15.9320000' AS DateTime2), 6, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (133, CAST(N'2022-06-01' AS Date), N'19:30-20:00', N'Đã hoàn thành các dịch vụ, không có răng có vấn đề', CAST(1 AS Decimal(1, 0)), CAST(N'2022-05-30T07:59:44.3190000' AS DateTime2), 7, 3, 9)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (134, CAST(N'2022-06-04' AS Date), N'09:00-09:30', N'Đã hoàn thành các dịch vụ, không có răng có vấn đề', CAST(1 AS Decimal(1, 0)), CAST(N'2022-05-30T08:00:56.3070000' AS DateTime2), 8, 3, 9)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (135, CAST(N'2022-06-01' AS Date), N'07:00-08:00', NULL, CAST(2 AS Decimal(1, 0)), CAST(N'2022-05-30T08:01:33.6330000' AS DateTime2), 9, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (136, CAST(N'2022-06-09' AS Date), N'15:00-15:30', NULL, CAST(3 AS Decimal(1, 0)), CAST(N'2022-06-04T08:17:29.2930000' AS DateTime2), 4, 3, 9)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (137, CAST(N'2022-06-10' AS Date), N'19:30-20:00', N'Đã hoàn thành các dịch vụ, không có răng có vấn đề', CAST(5 AS Decimal(1, 0)), CAST(N'2022-06-04T08:19:01.7430000' AS DateTime2), 4, 3, 9)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (138, CAST(N'2022-06-10' AS Date), N'08:00-08:30', NULL, CAST(2 AS Decimal(1, 0)), CAST(N'2022-06-04T08:19:34.5320000' AS DateTime2), 5, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (139, CAST(N'2022-06-10' AS Date), N'09:00-09:30', NULL, CAST(3 AS Decimal(1, 0)), CAST(N'2022-06-04T08:20:17.6310000' AS DateTime2), 6, 2, 5)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (140, CAST(N'2022-06-11' AS Date), N'18:30-19:00', NULL, CAST(6 AS Decimal(1, 0)), CAST(N'2022-06-04T08:20:43.9780000' AS DateTime2), 6, 2, 5)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (141, CAST(N'2022-06-13' AS Date), N'15:00-15:30', NULL, CAST(3 AS Decimal(1, 0)), CAST(N'2022-06-11T10:55:42.7100000' AS DateTime2), 7, 3, 9)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (142, CAST(N'2022-06-13' AS Date), N'17:00-17:30', N'Đã hoàn thành 1 phần dịch vụ, chưa hoàn thành hết vì không đủ thời gian cho phiên làm việc, hẹn tái khám để tiếp tục các phần dịch vụ đó', CAST(5 AS Decimal(1, 0)), CAST(N'2022-06-11T10:56:11.9310000' AS DateTime2), 7, 3, 9)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (143, CAST(N'2022-06-15' AS Date), N'18:30-19:30', N'Đã hoàn thành các dịch vụ, không có răng có vấn đề', CAST(1 AS Decimal(1, 0)), CAST(N'2022-06-11T10:57:00.5430000' AS DateTime2), 8, 3, 9)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (144, CAST(N'2022-06-13' AS Date), N'18:30-19:00', N'Đã hoàn thành các dịch vụ, không có răng có vấn đề', CAST(5 AS Decimal(1, 0)), CAST(N'2022-06-11T10:57:56.2780000' AS DateTime2), 9, 2, 5)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (145, CAST(N'2022-06-16' AS Date), N'17:00-17:30', N'Đã hoàn thành các dịch vụ, phát hiện 1 số răng hàm trên bị sâu mức độ nhẹ, hẹn tái khám để nhổ', CAST(1 AS Decimal(1, 0)), CAST(N'2022-06-15T11:06:24.3370000' AS DateTime2), 4, 3, 9)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (146, CAST(N'2022-06-16' AS Date), N'17:30-18:00', N'Đã hoàn thành các dịch vụ, phát hiện 1 số răng hàm trên bị sâu mức độ nhẹ, hẹn tái khám để nhổ', CAST(5 AS Decimal(1, 0)), CAST(N'2022-06-15T11:12:03.6390000' AS DateTime2), 5, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (147, CAST(N'2022-06-22' AS Date), N'16:30-17:00', N'Đã hoàn thành 1 phần dịch vụ, chưa hoàn thành hết vì không đủ thời gian cho phiên làm việc, hẹn tái khám để tiếp tục các phần dịch vụ đó', CAST(5 AS Decimal(1, 0)), CAST(N'2022-06-15T11:12:59.9390000' AS DateTime2), 6, 2, 5)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (148, CAST(N'2022-06-23' AS Date), N'13:00-14:00', NULL, CAST(3 AS Decimal(1, 0)), CAST(N'2022-06-22T11:23:22.9810000' AS DateTime2), 7, 3, 9)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (149, CAST(N'2022-06-23' AS Date), N'15:00-16:00', N'Đã hoàn thành các dịch vụ, không có răng có vấn đề', CAST(1 AS Decimal(1, 0)), CAST(N'2022-06-22T11:23:52.9110000' AS DateTime2), 7, 3, 9)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (150, CAST(N'2022-06-29' AS Date), N'13:00-15:00', NULL, CAST(3 AS Decimal(1, 0)), CAST(N'2022-06-22T11:24:48.7030000' AS DateTime2), 8, 3, 9)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (151, CAST(N'2022-06-29' AS Date), N'17:30-19:00', N'Đã hoàn thành 1 phần dịch vụ, chưa hoàn thành hết vì không đủ thời gian cho phiên làm việc, hẹn tái khám để tiếp tục các phần dịch vụ đó', CAST(5 AS Decimal(1, 0)), CAST(N'2022-06-22T11:25:12.8280000' AS DateTime2), 8, 3, 9)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (152, CAST(N'2022-06-23' AS Date), N'17:00-18:00', N'Đã hoàn thành các dịch vụ, không có răng có vấn đề', CAST(1 AS Decimal(1, 0)), CAST(N'2022-06-22T11:25:51.7590000' AS DateTime2), 9, 2, 5)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (153, CAST(N'2022-07-07' AS Date), N'07:00-09:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-07-01T14:32:12.7000000' AS DateTime2), 4, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (154, CAST(N'2022-07-04' AS Date), N'08:00-10:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-07-01T14:33:47.6720000' AS DateTime2), 5, 2, 4)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (155, CAST(N'2022-07-07' AS Date), N'08:00-10:30', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-07-01T14:34:58.7830000' AS DateTime2), 7, 3, 6)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (156, CAST(N'2022-07-07' AS Date), N'08:00-10:00', NULL, CAST(1 AS Decimal(1, 0)), CAST(N'2022-07-01T14:36:41.5810000' AS DateTime2), 6, 2, 5)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (157, CAST(N'2022-08-01' AS Date), N'09:30-10:30', NULL, CAST(0 AS Decimal(1, 0)), CAST(N'2022-07-31T14:42:04.3260000' AS DateTime2), 4, 1, 1)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (158, CAST(N'2022-08-01' AS Date), N'09:30-10:00', NULL, CAST(0 AS Decimal(1, 0)), CAST(N'2022-07-31T14:42:46.8110000' AS DateTime2), 5, 1, 2)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (159, CAST(N'2022-08-01' AS Date), N'08:30-09:30', NULL, CAST(0 AS Decimal(1, 0)), CAST(N'2022-07-31T14:43:36.0720000' AS DateTime2), 7, 1, 2)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (160, CAST(N'2022-08-01' AS Date), N'09:30-10:00', NULL, CAST(0 AS Decimal(1, 0)), CAST(N'2022-07-31T14:44:13.9780000' AS DateTime2), 8, 3, 10)
INSERT [dbo].[Appointment] ([id], [appointment_date], [appointment_time], [note], [status], [time_making], [account_id], [branch_id], [doctor_id]) VALUES (161, CAST(N'2022-08-01' AS Date), N'10:30-11:30', NULL, CAST(0 AS Decimal(1, 0)), CAST(N'2022-07-31T14:44:41.1820000' AS DateTime2), 9, 2, 6)
SET IDENTITY_INSERT [dbo].[Appointment] OFF
GO
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (16, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (16, 2, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (16, 4, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (17, 3, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (17, 4, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (17, 7, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (18, 2, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (18, 4, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (18, 5, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (19, 2, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (19, 4, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (19, 7, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (20, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (20, 4, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (20, 7, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (21, 3, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (21, 4, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (21, 7, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (22, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (22, 2, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (22, 4, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (23, 3, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (23, 4, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (23, 5, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (24, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (24, 2, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (24, 4, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (25, 4, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (26, 3, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (26, 4, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (27, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (28, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (28, 2, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (29, 3, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (29, 4, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (29, 5, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (30, 3, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (30, 4, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (30, 7, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (31, 2, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (31, 4, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (31, 7, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (32, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (32, 2, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (32, 4, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (33, 4, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (33, 7, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (34, 3, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (34, 4, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (34, 7, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (35, 4, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (35, 7, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (36, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (36, 2, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (36, 5, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (37, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (37, 2, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (37, 4, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (38, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (38, 2, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (38, 3, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (39, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (39, 2, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (40, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (40, 2, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (41, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (41, 2, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (41, 4, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (42, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (42, 3, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (42, 4, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (43, 3, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (43, 4, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (43, 7, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (44, 5, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (45, 3, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (45, 4, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (46, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (46, 2, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (47, 3, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (47, 4, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (47, 7, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (57, 2, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (58, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (59, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (60, 7, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (61, 5, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (62, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (63, 2, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (64, 7, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (65, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (66, 3, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (67, 2, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (68, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (69, 3, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (70, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (71, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (72, 3, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (72, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (73, 5, 2)
GO
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (74, 5, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (75, 3, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (76, 2, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (77, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (78, 2, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (79, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (80, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (81, 5, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (82, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (83, 5, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (84, 3, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (85, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (85, 5, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (86, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (87, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (88, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (89, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (90, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (91, 3, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (92, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (93, 7, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (94, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (95, 5, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (96, 3, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (97, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (98, 2, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (99, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (100, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (101, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (101, 8, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (102, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (103, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (104, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (105, 3, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (106, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (107, 3, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (108, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (109, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (110, 2, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (111, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (112, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (112, 5, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (113, 5, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (114, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (114, 8, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (115, 3, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (115, 8, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (116, 5, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (117, 2, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (118, 5, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (119, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (120, 3, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (120, 8, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (121, 8, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (122, 3, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (123, 8, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (124, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (125, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (126, 8, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (127, 5, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (128, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (128, 8, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (129, 3, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (130, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (131, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (132, 3, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (133, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (134, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (135, 8, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (136, 5, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (137, 5, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (138, 3, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (139, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (140, 5, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (141, 7, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (142, 7, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (143, 2, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (144, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (145, 5, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (146, 5, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (147, 3, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (148, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (149, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (150, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (150, 8, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (151, 3, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (151, 8, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (152, 8, 2)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (153, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (153, 2, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (153, 5, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (154, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (154, 2, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (154, 5, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (155, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (155, 2, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (155, 4, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (156, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (156, 2, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (156, 5, NULL)
GO
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (157, 2, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (158, 5, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (159, 4, 1)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (160, 1, NULL)
INSERT [dbo].[Appointment_Detail] ([appointment_id], [service_id], [discount_id]) VALUES (161, 4, 1)
GO
SET IDENTITY_INSERT [dbo].[Branch] ON 

INSERT [dbo].[Branch] ([id], [close_time], [name], [open_time], [status], [url], [district_id]) VALUES (1, CAST(N'18:00:00' AS Time), N'Chi nhánh số 1', CAST(N'07:00:00' AS Time), CAST(1 AS Decimal(1, 0)), N'174In8lBDntk5svw_wfWQJ0HMzztp91CR', 7)
INSERT [dbo].[Branch] ([id], [close_time], [name], [open_time], [status], [url], [district_id]) VALUES (2, CAST(N'19:00:00' AS Time), N'Chi nhánh số 2', CAST(N'08:00:00' AS Time), CAST(1 AS Decimal(1, 0)), N'1F8oal-H8l44usjfRBORO7YOWt142DKzr', 1)
INSERT [dbo].[Branch] ([id], [close_time], [name], [open_time], [status], [url], [district_id]) VALUES (3, CAST(N'20:00:00' AS Time), N'Chi nhánh Thủ Đức', CAST(N'08:00:00' AS Time), CAST(1 AS Decimal(1, 0)), N'1nPqngCHjZoNKQMuBDlFTJP2i82M7_50L', 15)
INSERT [dbo].[Branch] ([id], [close_time], [name], [open_time], [status], [url], [district_id]) VALUES (4, CAST(N'18:00:00' AS Time), N'Chi nhánh Quận 1', CAST(N'07:00:00' AS Time), CAST(1 AS Decimal(1, 0)), N'1KfK2vhbqtV4zFl4MFGeVGq586qcD3_4w', 16)
INSERT [dbo].[Branch] ([id], [close_time], [name], [open_time], [status], [url], [district_id]) VALUES (5, CAST(N'18:00:00' AS Time), N'Chi nhánh số 3', CAST(N'06:00:00' AS Time), CAST(1 AS Decimal(1, 0)), N'14WxOtFDjVPgeDMUNBVPPmDDhBPUWZBe1', 15)
INSERT [dbo].[Branch] ([id], [close_time], [name], [open_time], [status], [url], [district_id]) VALUES (6, CAST(N'18:00:00' AS Time), N'Chi nhánh Quận 2', CAST(N'07:00:00' AS Time), CAST(1 AS Decimal(1, 0)), N'1EO0x-XNvxe9aX1pYCMFZku-HVLqCPbwG', 2)
SET IDENTITY_INSERT [dbo].[Branch] OFF
GO
SET IDENTITY_INSERT [dbo].[Discount] ON 

INSERT [dbo].[Discount] ([id], [description], [end_date], [name], [percentage], [start_date], [status]) VALUES (1, N'Nhân dịp khai trương chi nhánh 1, RaDe dành tặng đến các khách hàng khuyến mãi 20% cho 1 số dịch vụ, áp dụng cho tất cả chi nhánh trong cả nước', CAST(N'2022-09-03' AS Date), N'Khai trương Chi nhánh 1', 20, CAST(N'2022-01-01' AS Date), CAST(1 AS Decimal(1, 0)))
INSERT [dbo].[Discount] ([id], [description], [end_date], [name], [percentage], [start_date], [status]) VALUES (2, N'Mừng tết 2022', CAST(N'2022-07-29' AS Date), N'Tết 2022', 30, CAST(N'2022-02-15' AS Date), CAST(1 AS Decimal(1, 0)))
INSERT [dbo].[Discount] ([id], [description], [end_date], [name], [percentage], [start_date], [status]) VALUES (3, N'Mừng ngày quốc tế lao động 1/5/2022', CAST(N'2022-05-03' AS Date), N'Quốc tế lao động 2022', 15, CAST(N'2022-05-01' AS Date), CAST(1 AS Decimal(1, 0)))
SET IDENTITY_INSERT [dbo].[Discount] OFF
GO
INSERT [dbo].[Discount_Service] ([discount_id], [service_id]) VALUES (1, 2)
INSERT [dbo].[Discount_Service] ([discount_id], [service_id]) VALUES (1, 4)
INSERT [dbo].[Discount_Service] ([discount_id], [service_id]) VALUES (2, 5)
INSERT [dbo].[Discount_Service] ([discount_id], [service_id]) VALUES (2, 7)
INSERT [dbo].[Discount_Service] ([discount_id], [service_id]) VALUES (2, 8)
INSERT [dbo].[Discount_Service] ([discount_id], [service_id]) VALUES (3, 1)
INSERT [dbo].[Discount_Service] ([discount_id], [service_id]) VALUES (3, 2)
GO
SET IDENTITY_INSERT [dbo].[District] ON 

INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (1, N'Quận 1', 1)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (2, N'Quận 2', 1)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (3, N'Quận 3', 1)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (4, N'Quận 4', 1)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (5, N'Quận 5', 1)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (6, N'Ba Đình', 2)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (7, N'Cầu Giấy', 2)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (8, N'Đống Đa', 2)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (9, N'Hà Đông', 2)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (10, N'Hai Bà Trưng', 2)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (11, N'Cẩm Lê', 3)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (12, N'Hải Châu', 3)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (13, N'Liên Chiểu', 3)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (14, N'Biên Hòa', 4)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (15, N'Cẩm Mỹ', 4)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (16, N'Định Quán', 4)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (17, N'Đồ Sơn', 5)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (18, N'Dương Kinh', 5)
INSERT [dbo].[District] ([id], [name], [province_id]) VALUES (19, N'Hải An', 5)
SET IDENTITY_INSERT [dbo].[District] OFF
GO
SET IDENTITY_INSERT [dbo].[Doctor] ON 

INSERT [dbo].[Doctor] ([id], [description], [name], [status], [url], [branch_id]) VALUES (1, N'Chuyên về các dịch vụ nhổ răng', N'Nguyễn Phan Quỳnh Anh', CAST(1 AS Decimal(1, 0)), N'100-lEx2cOokPvMcwaSET0x6qwAQPeVd9', 1)
INSERT [dbo].[Doctor] ([id], [description], [name], [status], [url], [branch_id]) VALUES (2, N'40 năm kinh nghiệm, chuyên về các dịch vụ trám răng', N'Nguyễn Quốc Bảo', CAST(1 AS Decimal(1, 0)), N'1kbK1M4AWgffySqv8TsrbGy6oFIunTg-_', 1)
INSERT [dbo].[Doctor] ([id], [description], [name], [status], [url], [branch_id]) VALUES (3, N'30 năm kinh nghiệm, chuyên về các dịch vụ nhổ răng', N'Phạm Xuân Kiên', CAST(1 AS Decimal(1, 0)), N'1xjj8DDcXJh2TfvnKpib3O2Jl2uOZqft9', 1)
INSERT [dbo].[Doctor] ([id], [description], [name], [status], [url], [branch_id]) VALUES (4, N'Chuyên đa khoa', N'Nguyễn Trung Hiếu', CAST(1 AS Decimal(1, 0)), N'12f5fVsAO1E3wHwaEkBvvFQP93BnthzTE', 1)
INSERT [dbo].[Doctor] ([id], [description], [name], [status], [url], [branch_id]) VALUES (5, N'Chuyên đa khoa', N'Phan Quỳnh Hương', CAST(1 AS Decimal(1, 0)), N'1k9TEPisQ-Ve4Wlo4PwjXfTZiiWkJX8Ji', 2)
INSERT [dbo].[Doctor] ([id], [description], [name], [status], [url], [branch_id]) VALUES (6, N'30 năm kinh nghiệm, chuyên về các dịch vụ nhổ răng', N'Nguyễn Văn Toàn', CAST(1 AS Decimal(1, 0)), N'130bVNVgleWCO5rP372Y8JgQEe348_zdU', 2)
INSERT [dbo].[Doctor] ([id], [description], [name], [status], [url], [branch_id]) VALUES (7, N'40 năm kinh nghiệm, chuyên về các dịch vụ trám răng', N'Thái Quốc Bảo', CAST(1 AS Decimal(1, 0)), N'1kbK1M4AWgffySqv8TsrbGy6oFIunTg-_', 2)
INSERT [dbo].[Doctor] ([id], [description], [name], [status], [url], [branch_id]) VALUES (8, N'30 năm kinh nghiệm, chuyên về các dịch vụ nhổ răng', N'Phạm Lê Minh', CAST(1 AS Decimal(1, 0)), N'1xjj8DDcXJh2TfvnKpib3O2Jl2uOZqft9', 2)
INSERT [dbo].[Doctor] ([id], [description], [name], [status], [url], [branch_id]) VALUES (9, N'30 năm kinh nghiệm, chuyên về các dịch vụ nhổ răng', N'Phạm Xuân Kiên', CAST(1 AS Decimal(1, 0)), N'1xjj8DDcXJh2TfvnKpib3O2Jl2uOZqft9', 3)
INSERT [dbo].[Doctor] ([id], [description], [name], [status], [url], [branch_id]) VALUES (10, N'Chuyên đa khoa', N'Nguyễn Trung Hiếu', CAST(1 AS Decimal(1, 0)), N'12f5fVsAO1E3wHwaEkBvvFQP93BnthzTE', 3)
INSERT [dbo].[Doctor] ([id], [description], [name], [status], [url], [branch_id]) VALUES (11, N'Chuyên đa khoa', N'Phan Quỳnh Hương', CAST(1 AS Decimal(1, 0)), N'1k9TEPisQ-Ve4Wlo4PwjXfTZiiWkJX8Ji', 3)
INSERT [dbo].[Doctor] ([id], [description], [name], [status], [url], [branch_id]) VALUES (12, N'30 năm kinh nghiệm, chuyên về các dịch vụ nhổ răng', N'Nguyễn Văn Toàn', CAST(1 AS Decimal(1, 0)), N'130bVNVgleWCO5rP372Y8JgQEe348_zdU', 3)
SET IDENTITY_INSERT [dbo].[Doctor] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([id], [content], [status], [time], [appointment_id]) VALUES (1, N'Hoàn toàn có thể đi làm bình thường sau điều trị. Không hề đau vì bác sỹ rất nhẹ nhàng, sưng thì rất ít, ai để ý kỹ thì mới nhận ra được.', CAST(1 AS Decimal(1, 0)), CAST(N'2022-07-21' AS Date), 24)
INSERT [dbo].[Feedback] ([id], [content], [status], [time], [appointment_id]) VALUES (2, N'Thời gian hồi phục của mình chỉ vài ngày. Giờ thì tự tin cười thả ga rồi.', CAST(1 AS Decimal(1, 0)), CAST(N'2022-07-21' AS Date), 137)
INSERT [dbo].[Feedback] ([id], [content], [status], [time], [appointment_id]) VALUES (3, N'Mình bị hở lợi mức độ nặng và từng rất tự ti, nhưng đó là trước đây thôi. Hiện tại mình hoàn toàn có thể cười thoải mái bất cứ lúc nào thấy vui.', CAST(1 AS Decimal(1, 0)), CAST(N'2022-07-21' AS Date), 111)
INSERT [dbo].[Feedback] ([id], [content], [status], [time], [appointment_id]) VALUES (4, N'Ca của mình phẫu thuật khá nhanh khoảng 30 phút, gây tê đầy đủ nên không đau gì cả. Mình rất hài lòng.', CAST(1 AS Decimal(1, 0)), CAST(N'2022-07-21' AS Date), 146)
INSERT [dbo].[Feedback] ([id], [content], [status], [time], [appointment_id]) VALUES (5, N'Tận tình, luôn thăm hỏi động viên khách hàng và chu đáo trong quá trình chăm sóc, điều trị, bác sĩ đã để lại ấn tượng cho mình từ lần gặp gỡ đầu tiên.', CAST(1 AS Decimal(1, 0)), CAST(N'2022-07-21' AS Date), 34)
INSERT [dbo].[Feedback] ([id], [content], [status], [time], [appointment_id]) VALUES (6, N'Hiện nay niềng răng của mình đã được tháo và kết quả làm mình thực sự muốn óc khòa lên vì hạnh phúc', CAST(1 AS Decimal(1, 0)), CAST(N'2022-07-21' AS Date), 147)
INSERT [dbo].[Feedback] ([id], [content], [status], [time], [appointment_id]) VALUES (7, N'Bác sĩ giải thích rất rõ ràng về cơ chế phát triển của răng để an tâm hơn về độ tuổi niềng răng', CAST(1 AS Decimal(1, 0)), CAST(N'2022-07-21' AS Date), 142)
INSERT [dbo].[Feedback] ([id], [content], [status], [time], [appointment_id]) VALUES (8, N'Trong thời gian khám và tái khám, tôi được chỉ định đến kiểm tra định kỳ và được chăm sóc sức khỏe răng tận tình tại phòng khám.', CAST(1 AS Decimal(1, 0)), CAST(N'2022-07-21' AS Date), 151)
INSERT [dbo].[Feedback] ([id], [content], [status], [time], [appointment_id]) VALUES (9, N'Không ngờ một ngày mình lại có thể tự tin nở nụ cười với hàm răng đều đặn, lành lặn như bao người bình thường.', CAST(1 AS Decimal(1, 0)), CAST(N'2022-07-21' AS Date), 144)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (1, CAST(N'2022-07-15' AS Date), N'Khuyến mãi mới Khai trương Chi nhánh 2 trong thời gian giới hạn! Bắt đầu từ 15/07/2022 đến 03/09/2022! Ưu đãi 20.0% áp dụng cho dịch vụ: Nhổ răng khôn, Trám răng cao cấp. Chi tiết khuyến mãi: Nhân dịp khai trương chi nhánh 2, RaDe dành tặng đến các khách hàng khuyến mãi 20% cho 1 số dịch vụ, áp dụng cho tất cả chi nhánh trong cả nước', NULL)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (2, CAST(N'2022-07-15' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 12:00 ngày 15-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (3, CAST(N'2022-07-15' AS Date), N'Phản hồi của bạn đã được gửi tới trung tâm, cảm ơn bạn đã để lại đánh giá cho RaDe.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (4, CAST(N'2022-07-15' AS Date), N'Phản hồi cho lịch hẹn vào lúc 12:00 ngày 14-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 1 đã được phê duyệt, xin cảm ơn quý khách đã để lại phản hồi tới trung tâm nha khoa RaDe.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (5, CAST(N'2022-07-15' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 13:00 ngày 15-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 2. Nhớ đến đúng giờ nhé <3.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (7, CAST(N'2022-07-15' AS Date), N'Phản hồi của bạn đã được gửi tới trung tâm, cảm ơn bạn đã để lại đánh giá cho RaDe.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (8, CAST(N'2022-07-15' AS Date), N'Phản hồi cho lịch hẹn vào lúc 13:00 ngày 15-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 2 đã được phê duyệt, xin cảm ơn quý khách đã để lại phản hồi tới trung tâm nha khoa RaDe.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (9, CAST(N'2022-07-15' AS Date), N'Lịch hẹn khám răng vào lúc 09:30 ngày 20-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 1 đã bị hủy do: bác sĩ vắng. Xin quý khách thông cảm vì sự bất tiện này.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (10, CAST(N'2022-07-15' AS Date), N'Phản hồi của bạn đã được gửi tới trung tâm, cảm ơn bạn đã để lại đánh giá cho RaDe.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (11, CAST(N'2022-07-15' AS Date), N'Phản hồi cho lịch hẹn vào lúc 10:00 ngày 15-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 1 đã được phê duyệt, xin cảm ơn quý khách đã để lại phản hồi tới trung tâm nha khoa RaDe.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (12, CAST(N'2022-07-15' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 07:00 ngày 15-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (13, CAST(N'2022-07-15' AS Date), N'Lịch hẹn khám răng vào lúc 07:00 ngày 15-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 1 đã bị hủy do bạn không có mặt quá 15 phút.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (14, CAST(N'2022-07-15' AS Date), N'Khuyến mãi mới tháng 7 hot trong thời gian giới hạn! Bắt đầu từ 16/07/2022 đến 29/07/2022! Ưu đãi 30.0% áp dụng cho dịch vụ: Nhổ răng sâu, Nhổ răng khôn, Trám răng. Chi tiết khuyến mãi: Áp dụng toàn quốc', NULL)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (15, CAST(N'2022-07-16' AS Date), N'Khuyến mãi mới khuyến mãi tháng 8 trong thời gian giới hạn! Bắt đầu từ 13/07/2022 đến 07/08/2022! Ưu đãi 78.0% áp dụng cho dịch vụ: Nhổ răng sâu, Nhổ răng khôn. Chi tiết khuyến mãi: Áp dụng toàn quốc', NULL)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (16, CAST(N'2022-07-16' AS Date), N'Khuyến mãi mới svad sfb dgr v v trong thời gian giới hạn! Bắt đầu từ 14/07/2022 đến 20/07/2022! Ưu đãi 100.0% áp dụng cho dịch vụ: Nhổ răng sâu. Chi tiết khuyến mãi: Áp dụng toàn quốc', NULL)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (17, CAST(N'2022-07-17' AS Date), N'Phản hồi cho lịch hẹn vào lúc 12:00 ngày 14-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 1 không được phê duyệt vi phạm quy tắc cộng động. Chi tiết phản hồi: Làm việc rất tận tâm, cũng may có bác sĩ nên phát hiện sớm được cái răng khôn sắp nhú', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (18, CAST(N'2022-07-17' AS Date), N'Phản hồi cho lịch hẹn vào lúc 12:00 ngày 14-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 1 đã được phê duyệt, xin cảm ơn quý khách đã để lại phản hồi tới trung tâm nha khoa RaDe.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (19, CAST(N'2022-07-17' AS Date), N'Khuyến mãi mới khuyến mãi khủng trong thời gian giới hạn! Bắt đầu từ 21/07/2022 đến 22/07/2022! Ưu đãi 40.0% áp dụng cho dịch vụ: Nhổ răng sâu, Nhổ răng khôn, service 1. Chi tiết khuyến mãi: Áp dụng toàn quốc', NULL)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (20, CAST(N'2022-07-17' AS Date), N'Khuyến mãi mới khai trương chi nhánh trong thời gian giới hạn! Bắt đầu từ 29/07/2022 đến 05/08/2022! Ưu đãi 10.0% áp dụng cho dịch vụ: Nhổ răng sâu, service 1. Chi tiết khuyến mãi: Áp dụng toàn quốc', NULL)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (21, CAST(N'2022-07-17' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 10:30 ngày 18-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (24, CAST(N'2022-07-17' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 11:00 ngày 18-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (25, CAST(N'2022-07-17' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 08:00 ngày 18-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (27, CAST(N'2022-07-17' AS Date), N'Lịch hẹn khám răng vào lúc 11:30 ngày 17-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 1 đã bị hủy do bạn không có mặt quá 15 phút.', 6)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (28, CAST(N'2022-07-17' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 11:30 ngày 17-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 6)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (30, CAST(N'2022-07-17' AS Date), N'Phản hồi của bạn đã được gửi tới trung tâm, cảm ơn bạn đã để lại đánh giá cho RaDe.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (31, CAST(N'2022-07-17' AS Date), N'Lịch hẹn khám răng vào lúc 11:30 ngày 17-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 1 đã bị hủy do: Bác sĩ bận. Xin quý khách thông cảm vì sự bất tiện này.', 6)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (32, CAST(N'2022-07-17' AS Date), N'Phản hồi cho lịch hẹn vào lúc 10:00 ngày 15-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 1 đã được phê duyệt, xin cảm ơn quý khách đã để lại phản hồi tới trung tâm nha khoa RaDe.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (33, CAST(N'2022-07-17' AS Date), N'Khuyến mãi mới khuyến mãi tháng 9 trong thời gian giới hạn! Bắt đầu từ 21/07/2022 đến 05/08/2022! Ưu đãi 45.0% áp dụng cho dịch vụ: Nhổ răng sâu, trám răng vàng. Chi tiết khuyến mãi: Áp dụng toàn quốc', NULL)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (34, CAST(N'2022-07-17' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 10:00 ngày 18-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (36, CAST(N'2022-07-17' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 10:00 ngày 18-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (38, CAST(N'2022-07-17' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 11:30 ngày 18-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 6)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (40, CAST(N'2022-07-18' AS Date), N'Khuyến mãi mới tháng 8 hot hot trong thời gian giới hạn! Bắt đầu từ 19/07/2022 đến 29/07/2022! Ưu đãi 47.0% áp dụng cho dịch vụ: Nhổ răng khôn, Trám răng, Trám răng cao cấp, service 1. Chi tiết khuyến mãi: Áp dụng toàn quốc', NULL)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (41, CAST(N'2022-07-18' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 10:00 ngày 18-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (45, CAST(N'2022-07-18' AS Date), N'Phản hồi của bạn đã được gửi tới trung tâm, cảm ơn bạn đã để lại đánh giá cho RaDe.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (46, CAST(N'2022-07-18' AS Date), N'Phản hồi cho lịch hẹn vào lúc 10:00 ngày 18-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 1 đã được phê duyệt, xin cảm ơn quý khách đã để lại phản hồi tới trung tâm nha khoa RaDe.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (47, CAST(N'2022-07-18' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 10:00 ngày 18-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (49, CAST(N'2022-07-18' AS Date), N'Phản hồi của bạn đã được gửi tới trung tâm, cảm ơn bạn đã để lại đánh giá cho RaDe.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (50, CAST(N'2022-07-18' AS Date), N'Phản hồi cho lịch hẹn vào lúc 09:30 ngày 17-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 1 không được phê duyệt vi phạm quy tắc cộng động. Chi tiết phản hồi: dịch vụ không  được', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (51, CAST(N'2022-07-18' AS Date), N'Lịch hẹn khám răng vào lúc 11:30 ngày 18-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 1 đã bị hủy do: Bác sĩ bận. Xin quý khách thông cảm vì sự bất tiện này.', 6)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (52, CAST(N'2022-01-08' AS Date), N'Lịch hẹn khám răng vào lúc 08:00 ngày 08-01-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức đã bị hủy do: Hệ thống nha khoa bị mất điện. Xin quý khách thông cảm vì sự bất tiện này.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (53, CAST(N'2022-01-31' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 14:00 ngày 01-02-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức. Nhớ đến đúng giờ nhé <3.', 7)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (54, CAST(N'2022-02-09' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 07:00 ngày 10-02-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (58, CAST(N'2022-02-10' AS Date), N'Lịch hẹn khám răng vào lúc 07:00 ngày 10-02-2022 tại trung tâm nha khoa RaDe Chi nhánh 1 đã bị hủy do bạn không có mặt quá 15 phút.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (59, CAST(N'2022-02-10' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 08:00 ngày 11-02-2022 tại trung tâm nha khoa RaDe Chi nhánh 2. Nhớ đến đúng giờ nhé <3.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (62, CAST(N'2022-02-16' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 08:00 ngày 17-02-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức. Nhớ đến đúng giờ nhé <3.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (69, CAST(N'2022-02-18' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 08:00 ngày 19-02-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 6)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (72, CAST(N'2022-02-18' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 07:30 ngày 19-02-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 7)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (74, CAST(N'2022-02-21' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 08:00 ngày 22-02-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức. Nhớ đến đúng giờ nhé <3.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (78, CAST(N'2022-02-21' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 09:00 ngày 22-02-2022 tại trung tâm nha khoa RaDe Chi nhánh 2. Nhớ đến đúng giờ nhé <3.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (80, CAST(N'2022-02-21' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 07:30 ngày 22-02-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 7)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (82, CAST(N'2022-02-22' AS Date), N'Lịch hẹn khám răng vào lúc 08:00 ngày 22-02-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức đã bị hủy do: Chi nhánh bị mất điện. Xin quý khách thông cảm vì sự bất tiện này.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (83, CAST(N'2022-02-22' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 07:30 ngày 23-02-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 6)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (85, CAST(N'2022-07-03' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 08:00 ngày 04-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 2. Nhớ đến đúng giờ nhé <3.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (89, CAST(N'2022-03-07' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 08:00 ngày 08-03-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức. Nhớ đến đúng giờ nhé <3.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (90, CAST(N'2022-03-22' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 12:30 ngày 18-03-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức. Nhớ đến đúng giờ nhé <3.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (91, CAST(N'2022-03-22' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 11:30 ngày 17-03-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (92, CAST(N'2022-03-01' AS Date), N'Lịch hẹn khám răng vào lúc 09:30 ngày 03-03-2022 tại trung tâm nha khoa RaDe Chi nhánh 1 đã bị hủy do: Bác sĩ bận. Xin quý khách thông cảm vì sự bất tiện này.', 6)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (93, CAST(N'2022-03-03' AS Date), N'Lịch hẹn khám răng vào lúc 12:30 ngày 05-03-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức đã bị hủy do: Bác sĩ bận. Xin quý khách thông cảm vì sự bất tiện này.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (94, CAST(N'2022-03-07' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 07:30 ngày 05-03-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (95, CAST(N'2022-03-09' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 10:30 ngày 10-03-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức. Nhớ đến đúng giờ nhé <3.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (96, CAST(N'2022-03-09' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 07:30 ngày 10-03-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (97, CAST(N'2022-03-09' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 07:30 ngày 10-03-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 6)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (98, CAST(N'2022-03-09' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 11:00 ngày 10-03-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức. Nhớ đến đúng giờ nhé <3.', 7)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (99, CAST(N'2022-03-09' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 12:00 ngày 10-03-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức. Nhớ đến đúng giờ nhé <3.', 8)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (100, CAST(N'2022-03-09' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 09:30 ngày 10-03-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 9)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (101, CAST(N'2022-03-10' AS Date), N'Phản hồi của bạn đã được gửi tới trung tâm, cảm ơn bạn đã để lại đánh giá cho RaDe.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (102, CAST(N'2022-03-10' AS Date), N'Phản hồi cho lịch hẹn vào lúc 12:30 ngày 03-03-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức đã được phê duyệt, xin cảm ơn quý khách đã để lại phản hồi tới trung tâm nha khoa RaDe.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (103, CAST(N'2022-03-10' AS Date), N'Phản hồi của bạn đã được gửi tới trung tâm, cảm ơn bạn đã để lại đánh giá cho RaDe.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (104, CAST(N'2022-03-10' AS Date), N'Phản hồi cho lịch hẹn vào lúc 10:30 ngày 10-03-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức đã được phê duyệt, xin cảm ơn quý khách đã để lại phản hồi tới trung tâm nha khoa RaDe.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (105, CAST(N'2022-03-10' AS Date), N'Phản hồi của bạn đã được gửi tới trung tâm, cảm ơn bạn đã để lại đánh giá cho RaDe.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (106, CAST(N'2022-03-10' AS Date), N'Phản hồi cho lịch hẹn vào lúc 07:30 ngày 10-03-2022 tại trung tâm nha khoa RaDe Chi nhánh 1 đã được phê duyệt, xin cảm ơn quý khách đã để lại phản hồi tới trung tâm nha khoa RaDe.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (107, CAST(N'2022-03-15' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 12:30 ngày 16-03-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức. Nhớ đến đúng giờ nhé <3.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (108, CAST(N'2022-03-15' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 11:30 ngày 16-03-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (109, CAST(N'2022-03-15' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 14:00 ngày 16-03-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 6)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (110, CAST(N'2022-03-15' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 14:00 ngày 16-03-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 7)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (111, CAST(N'2022-03-15' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 11:30 ngày 16-03-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức. Nhớ đến đúng giờ nhé <3.', 8)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (112, CAST(N'2022-03-15' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 09:30 ngày 16-03-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 9)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (113, CAST(N'2022-03-25' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 12:00 ngày 26-03-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức. Nhớ đến đúng giờ nhé <3.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (114, CAST(N'2022-03-25' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 11:30 ngày 26-03-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (115, CAST(N'2022-03-25' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 09:30 ngày 26-03-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 6)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (116, CAST(N'2022-03-25' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 12:30 ngày 26-03-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức. Nhớ đến đúng giờ nhé <3.', 7)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (117, CAST(N'2022-03-25' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 13:00 ngày 26-03-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 8)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (118, CAST(N'2022-03-25' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 10:30 ngày 26-03-2022 tại trung tâm nha khoa RaDe Chi nhánh 2. Nhớ đến đúng giờ nhé <3.', 9)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (119, CAST(N'2022-03-26' AS Date), N'Phản hồi của bạn đã được gửi tới trung tâm, cảm ơn bạn đã để lại đánh giá cho RaDe.', 7)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (120, CAST(N'2022-03-26' AS Date), N'Phản hồi cho lịch hẹn vào lúc 12:30 ngày 26-03-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức đã được phê duyệt, xin cảm ơn quý khách đã để lại phản hồi tới trung tâm nha khoa RaDe.', 7)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (121, CAST(N'2022-04-01' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 10:30 ngày 02-04-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức. Nhớ đến đúng giờ nhé <3.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (122, CAST(N'2022-04-01' AS Date), N'Phản hồi của bạn đã được gửi tới trung tâm, cảm ơn bạn đã để lại đánh giá cho RaDe.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (123, CAST(N'2022-04-01' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 09:30 ngày 02-04-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (124, CAST(N'2022-04-01' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 09:30 ngày 02-04-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 6)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (125, CAST(N'2022-04-01' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 11:30 ngày 02-04-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức. Nhớ đến đúng giờ nhé <3.', 7)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (126, CAST(N'2022-04-01' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 07:30 ngày 02-04-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 8)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (127, CAST(N'2022-04-01' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 08:30 ngày 02-04-2022 tại trung tâm nha khoa RaDe Chi nhánh 2. Nhớ đến đúng giờ nhé <3.', 9)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (128, CAST(N'2022-04-07' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 12:30 ngày 08-04-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức. Nhớ đến đúng giờ nhé <3.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (129, CAST(N'2022-04-07' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 08:30 ngày 08-04-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức. Nhớ đến đúng giờ nhé <3.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (130, CAST(N'2022-04-07' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 07:30 ngày 08-04-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (131, CAST(N'2022-04-07' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 10:00 ngày 08-04-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức. Nhớ đến đúng giờ nhé <3.', 7)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (132, CAST(N'2022-07-21' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 07:30 ngày 08-04-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (133, CAST(N'2022-07-21' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 08:30 ngày 08-04-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức. Nhớ đến đúng giờ nhé <3.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (134, CAST(N'2022-04-07' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 09:00 ngày 08-04-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức. Nhớ đến đúng giờ nhé <3.', 8)
GO
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (135, CAST(N'2022-04-07' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 10:30 ngày 08-04-2022 tại trung tâm nha khoa RaDe Chi nhánh 2. Nhớ đến đúng giờ nhé <3.', 9)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (136, CAST(N'2022-04-07' AS Date), N'Phản hồi cho lịch hẹn vào lúc 12:00 ngày 26-03-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức đã được phê duyệt, xin cảm ơn quý khách đã để lại phản hồi tới trung tâm nha khoa RaDe.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (137, CAST(N'2022-04-14' AS Date), N'Phản hồi của bạn đã được gửi tới trung tâm, cảm ơn bạn đã để lại đánh giá cho RaDe.', 9)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (138, CAST(N'2022-04-14' AS Date), N'Phản hồi cho lịch hẹn vào lúc 10:30 ngày 08-04-2022 tại trung tâm nha khoa RaDe Chi nhánh 2 đã được phê duyệt, xin cảm ơn quý khách đã để lại phản hồi tới trung tâm nha khoa RaDe.', 9)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (139, CAST(N'2022-04-14' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 07:30 ngày 15-04-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (140, CAST(N'2022-04-13' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 09:30 ngày 13-04-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 6)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (141, CAST(N'2022-04-13' AS Date), N'Lịch hẹn khám răng vào lúc 09:30 ngày 13-04-2022 tại trung tâm nha khoa RaDe Chi nhánh 1 đã bị hủy do: Bác sĩ bận. Xin quý khách thông cảm vì sự bất tiện này.', 6)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (142, CAST(N'2022-04-14' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 09:30 ngày 15-04-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 6)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (143, CAST(N'2022-04-14' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 08:00 ngày 15-04-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức. Nhớ đến đúng giờ nhé <3.', 7)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (144, CAST(N'2022-04-14' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 16:00 ngày 15-04-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 8)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (145, CAST(N'2022-04-14' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 12:30 ngày 15-04-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 9)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (146, CAST(N'2022-04-21' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 07:00 ngày 22-04-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (147, CAST(N'2022-04-21' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 08:30 ngày 22-04-2022 tại trung tâm nha khoa RaDe Chi nhánh 2. Nhớ đến đúng giờ nhé <3.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (148, CAST(N'2022-04-21' AS Date), N'Phản hồi của bạn đã được gửi tới trung tâm, cảm ơn bạn đã để lại đánh giá cho RaDe.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (149, CAST(N'2022-04-21' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 08:30 ngày 22-04-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 6)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (150, CAST(N'2022-04-21' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 17:30 ngày 22-04-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 7)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (151, CAST(N'2022-04-21' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 09:30 ngày 22-04-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 8)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (152, CAST(N'2022-04-21' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 16:30 ngày 22-04-2022 tại trung tâm nha khoa RaDe Chi nhánh 2. Nhớ đến đúng giờ nhé <3.', 9)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (153, CAST(N'2022-04-22' AS Date), N'Phản hồi cho lịch hẹn vào lúc 07:30 ngày 16-04-2022 tại trung tâm nha khoa RaDe Chi nhánh 1 đã được phê duyệt, xin cảm ơn quý khách đã để lại phản hồi tới trung tâm nha khoa RaDe.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (154, CAST(N'2022-05-10' AS Date), N'Lịch hẹn khám răng vào lúc 19:30 ngày 10-05-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức đã bị hủy do: Bác sĩ trực ca vắng mặt vì 1 số lý do ngoài ý muốn. Xin quý khách thông cảm vì sự bất tiện này.', 8)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (155, CAST(N'2022-05-10' AS Date), N'Lịch hẹn khám răng vào lúc 18:30 ngày 12-05-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức đã bị hủy do: Trung tâm xảy ra sự cố ngoài ý muốn. Xin quý khách thông cảm vì sự bất tiện này.', 7)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (156, CAST(N'2022-05-30' AS Date), N'Lịch hẹn khám răng vào lúc 07:00 ngày 30-05-2022 tại trung tâm nha khoa RaDe Chi nhánh 1 đã bị hủy do bạn không có mặt quá 15 phút.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (157, CAST(N'2022-06-01' AS Date), N'Lịch hẹn khám răng vào lúc 07:00 ngày 01-06-2022 tại trung tâm nha khoa RaDe Chi nhánh 1 đã bị hủy do bạn không có mặt quá 15 phút.', 9)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (158, CAST(N'2022-06-10' AS Date), N'Lịch hẹn khám răng vào lúc 08:00 ngày 10-06-2022 tại trung tâm nha khoa RaDe Chi nhánh 1 đã bị hủy do bạn không có mặt quá 15 phút.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (159, CAST(N'2022-06-11' AS Date), N'Lịch hẹn khám răng vào lúc 18:30 ngày 11-06-2022 tại trung tâm nha khoa RaDe Chi nhánh 2 đã bị hủy do: Trung tâm xảy ra sự cố ngoài ý muốn. Xin quý khách thông cảm vì sự bất tiện này.', 6)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (160, CAST(N'2022-06-15' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 17:00 ngày 16-06-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức. Nhớ đến đúng giờ nhé <3.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (161, CAST(N'2022-06-15' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 17:30 ngày 16-06-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (163, CAST(N'2022-06-22' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 13:00 ngày 23-06-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức. Nhớ đến đúng giờ nhé <3.', 7)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (165, CAST(N'2022-06-22' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 15:00 ngày 23-06-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức. Nhớ đến đúng giờ nhé <3.', 7)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (167, CAST(N'2022-06-22' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 17:00 ngày 23-06-2022 tại trung tâm nha khoa RaDe Chi nhánh 2. Nhớ đến đúng giờ nhé <3.', 9)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (168, CAST(N'2022-07-06' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 07:00 ngày 07-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 1. Nhớ đến đúng giờ nhé <3.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (169, CAST(N'2022-07-06' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 08:00 ngày 04-07-2022 tại trung tâm nha khoa RaDe Chi nhánh 2. Nhớ đến đúng giờ nhé <3.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (170, CAST(N'2022-07-06' AS Date), N'Nhắc yêu: Bạn có lịch hẹn khám răng vào lúc 08:00 ngày 07-07-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức. Nhớ đến đúng giờ nhé <3.', 7)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (171, CAST(N'2022-07-21' AS Date), N'Phản hồi của bạn đã được gửi tới trung tâm, cảm ơn bạn đã để lại đánh giá cho RaDe.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (172, CAST(N'2022-07-21' AS Date), N'Phản hồi của bạn đã được gửi tới trung tâm, cảm ơn bạn đã để lại đánh giá cho RaDe.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (173, CAST(N'2022-07-21' AS Date), N'Phản hồi của bạn đã được gửi tới trung tâm, cảm ơn bạn đã để lại đánh giá cho RaDe.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (174, CAST(N'2022-07-21' AS Date), N'Phản hồi của bạn đã được gửi tới trung tâm, cảm ơn bạn đã để lại đánh giá cho RaDe.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (175, CAST(N'2022-07-21' AS Date), N'Phản hồi của bạn đã được gửi tới trung tâm, cảm ơn bạn đã để lại đánh giá cho RaDe.', 6)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (176, CAST(N'2022-07-21' AS Date), N'Phản hồi của bạn đã được gửi tới trung tâm, cảm ơn bạn đã để lại đánh giá cho RaDe.', 6)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (177, CAST(N'2022-07-21' AS Date), N'Phản hồi của bạn đã được gửi tới trung tâm, cảm ơn bạn đã để lại đánh giá cho RaDe.', 7)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (178, CAST(N'2022-07-21' AS Date), N'Phản hồi của bạn đã được gửi tới trung tâm, cảm ơn bạn đã để lại đánh giá cho RaDe.', 8)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (179, CAST(N'2022-07-21' AS Date), N'Phản hồi của bạn đã được gửi tới trung tâm, cảm ơn bạn đã để lại đánh giá cho RaDe.', 9)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (180, CAST(N'2022-07-21' AS Date), N'Phản hồi cho lịch hẹn vào lúc 08:00 ngày 25-01-2022 tại trung tâm nha khoa RaDe Chi nhánh 2 đã được phê duyệt, xin cảm ơn quý khách đã để lại phản hồi tới trung tâm nha khoa RaDe.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (181, CAST(N'2022-07-21' AS Date), N'Phản hồi cho lịch hẹn vào lúc 19:30 ngày 10-06-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức đã được phê duyệt, xin cảm ơn quý khách đã để lại phản hồi tới trung tâm nha khoa RaDe.', 4)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (182, CAST(N'2022-07-21' AS Date), N'Phản hồi cho lịch hẹn vào lúc 07:00 ngày 03-05-2022 tại trung tâm nha khoa RaDe Chi nhánh 1 đã được phê duyệt, xin cảm ơn quý khách đã để lại phản hồi tới trung tâm nha khoa RaDe.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (183, CAST(N'2022-07-21' AS Date), N'Phản hồi cho lịch hẹn vào lúc 17:30 ngày 16-06-2022 tại trung tâm nha khoa RaDe Chi nhánh 1 đã được phê duyệt, xin cảm ơn quý khách đã để lại phản hồi tới trung tâm nha khoa RaDe.', 5)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (184, CAST(N'2022-07-21' AS Date), N'Phản hồi cho lịch hẹn vào lúc 08:30 ngày 03-02-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức đã được phê duyệt, xin cảm ơn quý khách đã để lại phản hồi tới trung tâm nha khoa RaDe.', 6)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (185, CAST(N'2022-07-21' AS Date), N'Phản hồi cho lịch hẹn vào lúc 16:30 ngày 22-06-2022 tại trung tâm nha khoa RaDe Chi nhánh 2 đã được phê duyệt, xin cảm ơn quý khách đã để lại phản hồi tới trung tâm nha khoa RaDe.', 6)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (186, CAST(N'2022-07-21' AS Date), N'Phản hồi cho lịch hẹn vào lúc 17:00 ngày 13-06-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức đã được phê duyệt, xin cảm ơn quý khách đã để lại phản hồi tới trung tâm nha khoa RaDe.', 7)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (187, CAST(N'2022-07-21' AS Date), N'Phản hồi cho lịch hẹn vào lúc 17:30 ngày 29-06-2022 tại trung tâm nha khoa RaDe Chi nhánh thủ đức đã được phê duyệt, xin cảm ơn quý khách đã để lại phản hồi tới trung tâm nha khoa RaDe.', 8)
INSERT [dbo].[Notification] ([id], [date], [description], [account_id]) VALUES (188, CAST(N'2022-07-21' AS Date), N'Phản hồi cho lịch hẹn vào lúc 18:30 ngày 13-06-2022 tại trung tâm nha khoa RaDe Chi nhánh 2 đã được phê duyệt, xin cảm ơn quý khách đã để lại phản hồi tới trung tâm nha khoa RaDe.', 9)
SET IDENTITY_INSERT [dbo].[Notification] OFF
GO
SET IDENTITY_INSERT [dbo].[Province] ON 

INSERT [dbo].[Province] ([id], [name]) VALUES (3, N'Đà Nẵng')
INSERT [dbo].[Province] ([id], [name]) VALUES (4, N'Đồng Nai')
INSERT [dbo].[Province] ([id], [name]) VALUES (2, N'Hà Nội')
INSERT [dbo].[Province] ([id], [name]) VALUES (5, N'Hải Phòng')
INSERT [dbo].[Province] ([id], [name]) VALUES (1, N'TP Hồ Chí Minh')
SET IDENTITY_INSERT [dbo].[Province] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([id], [name]) VALUES (1, N'ROLE_ADMIN')
INSERT [dbo].[Role] ([id], [name]) VALUES (2, N'ROLE_USER')
INSERT [dbo].[Role] ([id], [name]) VALUES (3, N'ROLE_STAFF')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([id], [description], [estimated_time], [max_price], [min_price], [name], [status], [url], [service_type_id]) VALUES (1, N'<p>Răng sâu là hậu quả tất yếu nếu như chúng ta không chú ý đến vấn đề chăm sóc, vệ sinh răng miệng đúng cách. Trong trường hợp bệnh nhân chủ quan không điều trị sâu răng sớm sẽ dẫn đến tình trạng răng sâu nặng chỉ còn chân răng.<br>&nbsp;</p><p><strong>Quy trình nhổ chân răng sâu tại Nha khoa RaDe sẽ được diễn ra như sau:</strong><br><strong>&nbsp; &nbsp; &nbsp;Bước 1:</strong> Thăm khám và chụp X – Quang xác định tình trạng chân răng của bệnh nhân.<br><strong>&nbsp; &nbsp; &nbsp;Bước 2:</strong> Tiến hành vệ sinh răng miệng.<br><strong>&nbsp; &nbsp; &nbsp;Bước 3:</strong> Tiến hành gây tê.<br><strong>&nbsp; &nbsp; &nbsp;Bước 4:</strong> Làm lung lay chân răng.<br><strong>&nbsp; &nbsp; &nbsp;Bước 5:</strong> Nhổ chân răng.<br><strong>&nbsp; &nbsp; &nbsp;Bước 6:</strong> Cầm máu và hoàn tất quá trình nhổ răng.</p><p><br>Để đảm bảo an toàn trong quá trình nhổ chân răng sâu không thể thiếu được vai trò của các bác sĩ tại Phòng khám. Các bác sĩ tại Nha khoa RaDe đều là những bác sĩ giỏi chuyên môn, giàu kinh nghiệm và có thời gian dài tu nghiệp ở nước ngoài.</p>', 0.5, 150000, 100000, N'Nhổ răng sâu', CAST(1 AS Decimal(1, 0)), N'19ybgS94JDVX4ZVh7gGqGD8g7NUMoLo88', 1)
INSERT [dbo].[Service] ([id], [description], [estimated_time], [max_price], [min_price], [name], [status], [url], [service_type_id]) VALUES (2, N'<p>Việc nhổ răng khôn được coi là một ca tiểu phẫu trong nha khoa, bởi vậy đòi hỏi sức khỏe bệnh nhân phải đủ để đáp ứng trong suốt quá trình.</p><p><br><strong>Quy trình nhổ răng khôn tại Nha khoa RaDe sẽ được diễn ra như sau:</strong><br><strong>&nbsp; &nbsp; &nbsp;Bước 1:</strong> Thăm khám, chụp X- Quang và tư vấn.<br><strong>&nbsp; &nbsp; &nbsp;Bước 2:</strong> Tiến hành sát khuẩn và gây tê/ gây mê.<br><strong>&nbsp; &nbsp; &nbsp;Bước 3:</strong> Rạch lợi, mở xương.<br><strong>&nbsp; &nbsp; &nbsp;Bước 4:</strong> Nhổ răng khôn.<br><strong>&nbsp; &nbsp; &nbsp;Bước 5:</strong> Khâu, đóng vết thương.</p><p><br>Bác sĩ sẽ làm sạch thương lần cuối bằng nước tinh khiết. Sau đó khâu vết thương lại với chỉ nha khoa. Cuối cùng khách hàng sẽ cắn một miếng bông gòn để cầm máu &amp; lưu lại nha khoa khoảng 30 phút để theo dõi. Sau đó, bác sĩ sẽ kê đơn thuốc giảm đau và dặn dò một vài lưu ý để chăm sóc răng khôn.</p>', 1, 800000, 500000, N'Nhổ răng khôn', CAST(1 AS Decimal(1, 0)), N'1Hw2Fksh9hR18a7Q6ebLyK4UQJHPN9by-', 1)
INSERT [dbo].[Service] ([id], [description], [estimated_time], [max_price], [min_price], [name], [status], [url], [service_type_id]) VALUES (3, N'<p>Trám răng là phương pháp giúp hồi phục tính thẩm mỹ cho những chiếc răng bị tổn thương và mang lại vẻ đẹp tự nhiên ban đầu.</p><p><br><strong>Quy trình trám răng tại Nha khoa RaDe sẽ được diễn ra như sau:</strong><br><strong>&nbsp; &nbsp; &nbsp;Bước 1:</strong> Thăm khám tổng quát<br><strong>&nbsp; &nbsp; &nbsp;Bước 2:</strong> Sửa soạn xoang trám<br><strong>&nbsp; &nbsp; &nbsp;Bước 3:</strong> So màu răng&nbsp;<br><strong>&nbsp; &nbsp; &nbsp;Bước 4:</strong> Đặt khuôn trám hoặc dùng chỉ co nướu<br><strong>&nbsp; &nbsp; &nbsp;Bước 5:</strong> Tiến hành thực hiện trám răng<br><strong>&nbsp; &nbsp; &nbsp;Bước 6:</strong> Kiểm tra lại<br><strong>&nbsp; &nbsp; &nbsp;Bước 7:</strong> Hoàn thiện quy trình hàn răng</p><p><br>Tuy đây là kỹ thuật đơn giản nhưng cũng cần một quy trình trám răng thẩm mỹ đúng chuẩn nha khoa, để bảo đảm an toàn cho sức khoẻ và hiệu quả sử dụng bền lâu.</p>', 0.5, 500000, 300000, N'Trám răng', CAST(1 AS Decimal(1, 0)), N'1oglU928Upk4Nlc8m-gglpPBzUV77CqzM', 2)
INSERT [dbo].[Service] ([id], [description], [estimated_time], [max_price], [min_price], [name], [status], [url], [service_type_id]) VALUES (4, N'<p>Trám răng là phương pháp giúp hồi phục tính thẩm mỹ cho những chiếc răng bị tổn thương và mang lại vẻ đẹp tự nhiên ban đầu.</p><p><br><strong>Quy trình trám răng tại Nha khoa RaDe sẽ được diễn ra như sau:</strong><br><strong>&nbsp; &nbsp; &nbsp;Bước 1:</strong> Thăm khám tổng quát<br><strong>&nbsp; &nbsp; &nbsp;Bước 2:</strong> Sửa soạn xoang trám<br><strong>&nbsp; &nbsp; &nbsp;Bước 3:</strong> So màu răng&nbsp;<br><strong>&nbsp; &nbsp; &nbsp;Bước 4:</strong> Đặt khuôn trám hoặc dùng chỉ co nướu<br><strong>&nbsp; &nbsp; &nbsp;Bước 5:</strong> Tiến hành thực hiện trám răng<br><strong>&nbsp; &nbsp; &nbsp;Bước 6:</strong> Kiểm tra lại<br><strong>&nbsp; &nbsp; &nbsp;Bước 7:</strong> Hoàn thiện quy trình hàn răng</p><p><br>Tuy đây là kỹ thuật đơn giản nhưng cũng cần một quy trình trám răng thẩm mỹ đúng chuẩn nha khoa, để bảo đảm an toàn cho sức khoẻ và hiệu quả sử dụng bền lâu.</p>', 1, 800000, 600000, N'Trám răng cao cấp', CAST(1 AS Decimal(1, 0)), N'1n5O_52Yl0I3E5FK2pcYLoYkoHFt2gifM', 2)
INSERT [dbo].[Service] ([id], [description], [estimated_time], [max_price], [min_price], [name], [status], [url], [service_type_id]) VALUES (5, N'<p>Tại thời điểm này, tẩy trắng răng chính là phương án tốt nhất để khắc phục tình trạng răng nhiễm màu nhanh chóng. Càng ngày, khách hàng lại càng ưa chuộng phương pháp tẩy trắng răng hơn hẳn trước đây. Chỉ cần lựa chọn cơ sở chuyên nghiệp, đảm bảo quá trình tẩy trắng răng tại phòng khám sẽ diễn ra suôn sẻ.<br>&nbsp;</p><p><strong>Quy trình làm trắng răng tại Nha khoa RaDe sẽ được diễn ra như sau:</strong><br><strong>&nbsp; &nbsp; &nbsp;Bước 1:</strong> Thăm khám và tư vấn<br><strong>&nbsp; &nbsp; &nbsp;Bước 2:</strong> Làm sạch răng miệng và cạo vôi răng<br><strong>&nbsp; &nbsp; &nbsp;Bước 3:</strong> Cách ly nướu<br><strong>&nbsp; &nbsp; &nbsp;Bước 4:</strong> Vào thuốc tẩy và chiếu Plasma lần 1<br><strong>&nbsp; &nbsp; &nbsp;Bước 5:</strong> Chiếu Plasma lần 2 và 3<br><strong>&nbsp; &nbsp; &nbsp;Bước 6:</strong> So sánh hiệu quả trước và sau khi tẩy trắng<br>&nbsp;</p><p>Quá trình tẩy trắng răng tại phòng khám không mất quá nhiều thời gian. Hiện nay đây chính là giải pháp hoàn hảo nhất đối với những khách hàng mong muốn tẩy trắng răng nhanh chóng.</p>', 0.5, 250000, 100000, N'Làm trắng răng siêu tốc', CAST(1 AS Decimal(1, 0)), N'15oZRQGHAOcms6_Jeo2czmEsUdCRHN7s-', 6)
INSERT [dbo].[Service] ([id], [description], [estimated_time], [max_price], [min_price], [name], [status], [url], [service_type_id]) VALUES (6, N'<p>Việc nhổ răng khôn được coi là một ca tiểu phẫu trong nha khoa, bởi vậy đòi hỏi sức khỏe bệnh nhân phải đủ để đáp ứng trong suốt quá trình.</p><p><br><strong>Quy trình nhổ răng khôn tại Nha khoa RaDe sẽ được diễn ra như sau:</strong><br><strong>&nbsp; &nbsp; &nbsp;Bước 1:</strong> Thăm khám, chụp X- Quang và tư vấn.<br><strong>&nbsp; &nbsp; &nbsp;Bước 2:</strong> Tiến hành sát khuẩn và gây tê/ gây mê.<br><strong>&nbsp; &nbsp; &nbsp;Bước 3:</strong> Rạch lợi, mở xương.<br><strong>&nbsp; &nbsp; &nbsp;Bước 4:</strong> Nhổ răng khôn.<br><strong>&nbsp; &nbsp; &nbsp;Bước 5:</strong> Khâu, đóng vết thương.</p><p><br>Bác sĩ sẽ làm sạch thương lần cuối bằng nước tinh khiết. Sau đó khâu vết thương lại với chỉ nha khoa. Cuối cùng khách hàng sẽ cắn một miếng bông gòn để cầm máu &amp; lưu lại nha khoa khoảng 30 phút để theo dõi. Sau đó, bác sĩ sẽ kê đơn thuốc giảm đau và dặn dò một vài lưu ý để chăm sóc răng khôn.</p>', 0.5, 350000, 200000, N'Nhổ răng khôn cao cấp', CAST(1 AS Decimal(1, 0)), N'16rAf4hqzNGSUEfaWjZtCYl1xBZhWIV63', 1)
INSERT [dbo].[Service] ([id], [description], [estimated_time], [max_price], [min_price], [name], [status], [url], [service_type_id]) VALUES (7, N'<p>Cấy ghép Implant là một quy trình đòi hỏi cao về trình độ cũng như kỹ năng tay nghề của bác sĩ. Mặc dù có tỷ lệ thành công cao nhất so với tất cả các loại phục hình khác, quy trình cấy ghép Implant có thành công hay không phụ thuộc rất nhiều vào chất lượng trụ implant đươc cấy ghép, loại xương ghép được chọn, chuyên môn và kinh nghiệm của bác sĩ phẫu thuật nha khoa.</p><p><br><strong>Quy trình implant tại Nha khoa RaDe sẽ được diễn ra như sau:</strong><br><strong>&nbsp; &nbsp; &nbsp;Bước 1:</strong> Đặt implant vào xương hàm.<br><strong>&nbsp; &nbsp; &nbsp;Bước 2:</strong> Thời gian chờ đặt trụ lành thương.<br><strong>&nbsp; &nbsp; &nbsp;Bước 3:</strong> Làm răng giả gắn trên implant (3 tuần sau khi trụ implant lành thương).</p><p><br>Thời gian chính xác để hoàn thành Implant còn tùy theo từng trường hợp: mất bao nhiêu răng, tình trạng xương, nướu nơi mất răng, tình trạng sức khỏe răng miệng, sức khỏe toàn thân và kỹ thuật thực hiện của bác sĩ nha khoa, loại implant bác sĩ nha khoa lựa chọn… , do đó thời gian điều trị có thể rút ngắn chỉ trong vòng một vài ngày hoặc có khi phải kéo dài 1-2 năm.</p>', 0.5, 200000, 100000, N'Implant công nghệ cao', CAST(1 AS Decimal(1, 0)), N'1M0NK4Ltt4w9livCuNZi-GeW8Y67iyt_G', 2)
INSERT [dbo].[Service] ([id], [description], [estimated_time], [max_price], [min_price], [name], [status], [url], [service_type_id]) VALUES (8, N'<p>Việc để vôi răng bám đầy là một trong những nguyên nhân dẫn đến các bệnh lý răng miệng. Ngoài ra còn có thể gây kích ứng đến mô nướu. Là nguyên nhân dẫn đến dẫn đến các bệnh lý như sâu răng, viêm nướu, viêm nha chu,…&nbsp;<br>&nbsp;</p><p><strong>Quy trình cạo vôi răng tại Nha khoa RaDe sẽ được diễn ra như sau:</strong><br><strong>&nbsp; &nbsp; &nbsp;Bước 1:</strong> Thăm khám và tư vấn.<br><strong>&nbsp; &nbsp; &nbsp;Bước 2:</strong> Tiến hành quy trình cạo vôi răng.<br><strong>&nbsp; &nbsp; &nbsp;Bước 3:</strong> Đánh bóng bề mặt răng.<br><strong>&nbsp; &nbsp; &nbsp;Bước 4:</strong> Hoàn thành, dặn dò cách chăm sóc răng miệng.<br>&nbsp;</p><p>Quá trình cạo vôi răng kết thúc, bác sĩ sẽ dặn dò khách hàng cách chăm sóc răng miệng chu đáo. Giúp khách hàng nắm được những kiến thức cần thiết để hạn chế mảng bám tích tụ. Đồng thời hướng dẫn cách vệ sinh và chế độ ăn uống hợp lý hơn cho từng khách hàng.</p>', 1, 200000, 100000, N'Cạo vôi răng', CAST(1 AS Decimal(1, 0)), N'1w2Mh5CLz3m3nTRWWcqLrRxOUCEt5NA_Y', 2)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceType] ON 

INSERT [dbo].[ServiceType] ([id], [description], [name]) VALUES (1, N'Các dịch vụ nhổ răng', N'Nhổ răng')
INSERT [dbo].[ServiceType] ([id], [description], [name]) VALUES (2, N'Các dịch vụ trám răng', N'Trám răng')
INSERT [dbo].[ServiceType] ([id], [description], [name]) VALUES (3, N'Các dịch vụ trồng răng, cấy ghép', N'Trồng răng')
INSERT [dbo].[ServiceType] ([id], [description], [name]) VALUES (4, N'Các dịch vụ chỉnh răng, niềng răng', N'Chỉnh răng')
INSERT [dbo].[ServiceType] ([id], [description], [name]) VALUES (5, N'Các dịch vụ phục hồi, chỉnh lại hàm', N'Phục hình hàm')
INSERT [dbo].[ServiceType] ([id], [description], [name]) VALUES (6, N'Các dịch vụ khác như cạo vôi, tẩy trắng răng, ...', N'Khác')
SET IDENTITY_INSERT [dbo].[ServiceType] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_elcfjc29glu61lscdlpll66fp]    Script Date: 7/31/2022 3:20:28 PM ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [UK_elcfjc29glu61lscdlpll66fp] UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_o9khk7fnh8j9cmaklyoeoj3g2]    Script Date: 7/31/2022 3:20:28 PM ******/
ALTER TABLE [dbo].[Branch] ADD  CONSTRAINT [UK_o9khk7fnh8j9cmaklyoeoj3g2] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_4cdggnrid9j1nx0qtsktqyueq]    Script Date: 7/31/2022 3:20:28 PM ******/
ALTER TABLE [dbo].[Discount] ADD  CONSTRAINT [UK_4cdggnrid9j1nx0qtsktqyueq] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UK6o8cjcs39a18p0jrqs8wx06ha]    Script Date: 7/31/2022 3:20:28 PM ******/
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [UK6o8cjcs39a18p0jrqs8wx06ha] UNIQUE NONCLUSTERED 
(
	[appointment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_moejme3ohebd07k2d4b70l8vh]    Script Date: 7/31/2022 3:20:28 PM ******/
ALTER TABLE [dbo].[Province] ADD  CONSTRAINT [UK_moejme3ohebd07k2d4b70l8vh] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_ms3hqgo39rpomrb6nt0hjx11b]    Script Date: 7/31/2022 3:20:28 PM ******/
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [UK_ms3hqgo39rpomrb6nt0hjx11b] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_88yki4qnw3n0ib5v5n5fwdmsf]    Script Date: 7/31/2022 3:20:28 PM ******/
ALTER TABLE [dbo].[ServiceType] ADD  CONSTRAINT [UK_88yki4qnw3n0ib5v5n5fwdmsf] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FKhhhehphq3hucqxdff9270cxlv] FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FKhhhehphq3hucqxdff9270cxlv]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FKq51sw4psvf6bx7o09xat6n3lg] FOREIGN KEY([district_id])
REFERENCES [dbo].[District] ([id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FKq51sw4psvf6bx7o09xat6n3lg]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FKa1svmrj6xe1st6edidh4oixbx] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FKa1svmrj6xe1st6edidh4oixbx]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FKbtwn9jhf6wx7ewe6jxn8rq1kg] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[Doctor] ([id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FKbtwn9jhf6wx7ewe6jxn8rq1kg]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FKp1q0ek0mlf6rh24s4gw1lv5x4] FOREIGN KEY([branch_id])
REFERENCES [dbo].[Branch] ([id])
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FKp1q0ek0mlf6rh24s4gw1lv5x4]
GO
ALTER TABLE [dbo].[Appointment_Detail]  WITH CHECK ADD  CONSTRAINT [FKf9hobdab2vn3li2fdyjdmci5q] FOREIGN KEY([appointment_id])
REFERENCES [dbo].[Appointment] ([id])
GO
ALTER TABLE [dbo].[Appointment_Detail] CHECK CONSTRAINT [FKf9hobdab2vn3li2fdyjdmci5q]
GO
ALTER TABLE [dbo].[Appointment_Detail]  WITH CHECK ADD  CONSTRAINT [FKfjgr840659vo0br1mygl67lot] FOREIGN KEY([service_id])
REFERENCES [dbo].[Service] ([id])
GO
ALTER TABLE [dbo].[Appointment_Detail] CHECK CONSTRAINT [FKfjgr840659vo0br1mygl67lot]
GO
ALTER TABLE [dbo].[Appointment_Detail]  WITH CHECK ADD  CONSTRAINT [FKjlrlshern26egt0n3gfn8ckem] FOREIGN KEY([discount_id])
REFERENCES [dbo].[Discount] ([id])
GO
ALTER TABLE [dbo].[Appointment_Detail] CHECK CONSTRAINT [FKjlrlshern26egt0n3gfn8ckem]
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD  CONSTRAINT [FKmbvfqpaty4jqc8hxjnciysgr3] FOREIGN KEY([district_id])
REFERENCES [dbo].[District] ([id])
GO
ALTER TABLE [dbo].[Branch] CHECK CONSTRAINT [FKmbvfqpaty4jqc8hxjnciysgr3]
GO
ALTER TABLE [dbo].[Discount_Service]  WITH CHECK ADD  CONSTRAINT [FK62axrxg71d2firieyj4qf5bbj] FOREIGN KEY([service_id])
REFERENCES [dbo].[Service] ([id])
GO
ALTER TABLE [dbo].[Discount_Service] CHECK CONSTRAINT [FK62axrxg71d2firieyj4qf5bbj]
GO
ALTER TABLE [dbo].[Discount_Service]  WITH CHECK ADD  CONSTRAINT [FKg4rda7f81jxd1c5jd4dbecvyw] FOREIGN KEY([discount_id])
REFERENCES [dbo].[Discount] ([id])
GO
ALTER TABLE [dbo].[Discount_Service] CHECK CONSTRAINT [FKg4rda7f81jxd1c5jd4dbecvyw]
GO
ALTER TABLE [dbo].[District]  WITH CHECK ADD  CONSTRAINT [FKjxyk2jiq1rpxyv76da9sn1ygc] FOREIGN KEY([province_id])
REFERENCES [dbo].[Province] ([id])
GO
ALTER TABLE [dbo].[District] CHECK CONSTRAINT [FKjxyk2jiq1rpxyv76da9sn1ygc]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD  CONSTRAINT [FKsh99lptu4mnm5mxccfvouwigx] FOREIGN KEY([branch_id])
REFERENCES [dbo].[Branch] ([id])
GO
ALTER TABLE [dbo].[Doctor] CHECK CONSTRAINT [FKsh99lptu4mnm5mxccfvouwigx]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FKf6xuqfcus280w4gl5t5r99aqn] FOREIGN KEY([appointment_id])
REFERENCES [dbo].[Appointment] ([id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FKf6xuqfcus280w4gl5t5r99aqn]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FKsk8oc04n2cm5gy00cegjiygpr] FOREIGN KEY([account_id])
REFERENCES [dbo].[Account] ([id])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FKsk8oc04n2cm5gy00cegjiygpr]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK7iw2mhpgrgh7q84e8ersmnwn4] FOREIGN KEY([service_type_id])
REFERENCES [dbo].[ServiceType] ([id])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK7iw2mhpgrgh7q84e8ersmnwn4]
GO
USE [master]
GO
ALTER DATABASE [dentist] SET  READ_WRITE 
GO
