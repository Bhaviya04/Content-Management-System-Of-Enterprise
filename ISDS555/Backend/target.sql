USE [master]
GO
/****** Object:  Database [targeting]    Script Date: 6/27/2017 11:41:31 PM ******/
CREATE DATABASE [targeting]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'targeting', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\targeting.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'targeting_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\targeting_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [targeting] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [targeting].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [targeting] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [targeting] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [targeting] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [targeting] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [targeting] SET ARITHABORT OFF 
GO
ALTER DATABASE [targeting] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [targeting] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [targeting] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [targeting] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [targeting] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [targeting] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [targeting] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [targeting] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [targeting] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [targeting] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [targeting] SET  ENABLE_BROKER 
GO
ALTER DATABASE [targeting] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [targeting] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [targeting] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [targeting] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [targeting] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [targeting] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [targeting] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [targeting] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [targeting] SET  MULTI_USER 
GO
ALTER DATABASE [targeting] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [targeting] SET DB_CHAINING OFF 
GO
ALTER DATABASE [targeting] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [targeting] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [targeting]
GO
/****** Object:  Table [dbo].[Catalogs]    Script Date: 6/27/2017 11:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Catalogs](
	[Catalog_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Customer_ID] [bigint] NOT NULL,
	[First_Name] [varchar](max) NOT NULL,
	[Last_Name] [varchar](max) NOT NULL,
	[Address] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Credit_Card_Info]    Script Date: 6/27/2017 11:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Credit_Card_Info](
	[Credit_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Credit_Card_No] [bigint] NOT NULL,
	[Customer_ID] [bigint] NOT NULL,
	[Cvv] [bigint] NOT NULL,
	[Expiry_Date] [datetime] NOT NULL,
	[Cardholder_Name] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6/27/2017 11:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[First_Name] [varchar](max) NOT NULL,
	[Last_Name] [varchar](max) NOT NULL,
	[Address] [varchar](max) NOT NULL,
	[ZipCode] [bigint] NOT NULL,
	[Mobile_Number] [bigint] NOT NULL,
	[Email_Address] [varchar](max) NOT NULL,
	[Shipping_Address] [varchar](max) NOT NULL,
	[Is_Using_Credit_Card] [bigint] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Delivery_Type]    Script Date: 6/27/2017 11:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Delivery_Type](
	[Delivery_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Delivery] [varchar](max) NOT NULL,
	[Delivery_Price] [bigint] NOT NULL,
	[Estimated_Delivery_Days] [bigint] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 6/27/2017 11:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inventory](
	[Item_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[Color] [varchar](max) NOT NULL,
	[Size] [varchar](max) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[Price] [bigint] NOT NULL,
	[Available_Count] [bigint] NOT NULL,
	[Modified_Date] [datetime] NOT NULL,
	[Threshold_Flag] [bigint] NOT NULL,
	[Threshold_Limit] [bigint] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inventory_Order_Relation]    Script Date: 6/27/2017 11:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory_Order_Relation](
	[Relation_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Order_ID] [bigint] NOT NULL,
	[Item_ID] [bigint] NOT NULL,
	[Item_Quantity] [bigint] NOT NULL,
	[Item_Quantity_Cancelled] [bigint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order_Backlog]    Script Date: 6/27/2017 11:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Backlog](
	[Backlog_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Order_ID] [bigint] NOT NULL,
	[Item_ID] [bigint] NOT NULL,
	[Quantity] [bigint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order_Status]    Script Date: 6/27/2017 11:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order_Status](
	[Status_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order_Type]    Script Date: 6/27/2017 11:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order_Type](
	[Order_Type_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Mode] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 6/27/2017 11:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Order_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Customer_ID] [bigint] NOT NULL,
	[Order_Type_ID] [bigint] NOT NULL,
	[Payment_ID] [bigint] NOT NULL,
	[Status_ID] [bigint] NOT NULL,
	[Delivery_ID] [bigint] NOT NULL,
	[Order_Date] [datetime] NOT NULL,
	[Total_Price] [bigint] NOT NULL,
	[Payment_Received_Date] [datetime] NULL,
	[Dispatch_Date] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment_Type]    Script Date: 6/27/2017 11:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Payment_Type](
	[Payment_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Mode] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Shipment_Received]    Script Date: 6/27/2017 11:41:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shipment_Received](
	[Received_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Item_ID] [bigint] NOT NULL,
	[Item_Count_Received] [bigint] NOT NULL,
	[Received_Date] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Catalogs] ON 

INSERT [dbo].[Catalogs] ([Catalog_ID], [Customer_ID], [First_Name], [Last_Name], [Address]) VALUES (28, 1, N'Bhaviya', N'Gandani', N'2404 Nutwood Avenue')
INSERT [dbo].[Catalogs] ([Catalog_ID], [Customer_ID], [First_Name], [Last_Name], [Address]) VALUES (29, 2, N'julie', N'zhu', N'1234 state college blvd')
INSERT [dbo].[Catalogs] ([Catalog_ID], [Customer_ID], [First_Name], [Last_Name], [Address]) VALUES (30, 0, N'aamir', N'jones', N'2403 UCA Aparments Fullerton 92832')
INSERT [dbo].[Catalogs] ([Catalog_ID], [Customer_ID], [First_Name], [Last_Name], [Address]) VALUES (31, 0, N'saif', N'James', N'2402 Homestead Aparments Fullerton 92832')
INSERT [dbo].[Catalogs] ([Catalog_ID], [Customer_ID], [First_Name], [Last_Name], [Address]) VALUES (32, 0, N'srk', N'aryan', N'bandstand fullerton')
INSERT [dbo].[Catalogs] ([Catalog_ID], [Customer_ID], [First_Name], [Last_Name], [Address]) VALUES (33, 3, N'Chirag', N'Padsala', N'Mahim Matunga')
INSERT [dbo].[Catalogs] ([Catalog_ID], [Customer_ID], [First_Name], [Last_Name], [Address]) VALUES (34, 4, N'Rahul', N'Dravid', N'London')
INSERT [dbo].[Catalogs] ([Catalog_ID], [Customer_ID], [First_Name], [Last_Name], [Address]) VALUES (35, 5, N'MS', N'Dhoni', N'Mumbai')
INSERT [dbo].[Catalogs] ([Catalog_ID], [Customer_ID], [First_Name], [Last_Name], [Address]) VALUES (36, 6, N'Kapil', N'Dev', N'South Africa')
INSERT [dbo].[Catalogs] ([Catalog_ID], [Customer_ID], [First_Name], [Last_Name], [Address]) VALUES (37, 7, N'Saurav', N'Ganguly', N'Kolkata')
INSERT [dbo].[Catalogs] ([Catalog_ID], [Customer_ID], [First_Name], [Last_Name], [Address]) VALUES (38, 8, N'Sachin', N'Tendulkar', N'Mumbnai')
INSERT [dbo].[Catalogs] ([Catalog_ID], [Customer_ID], [First_Name], [Last_Name], [Address]) VALUES (39, 9, N'Virat', N'Kohli', N'Badlapur')
INSERT [dbo].[Catalogs] ([Catalog_ID], [Customer_ID], [First_Name], [Last_Name], [Address]) VALUES (40, 10, N'Virendra', N'Sehwag', N'8192 Anaheim')
INSERT [dbo].[Catalogs] ([Catalog_ID], [Customer_ID], [First_Name], [Last_Name], [Address]) VALUES (41, 11, N'Harbhajan', N'Singh', N'San Francisco')
SET IDENTITY_INSERT [dbo].[Catalogs] OFF
SET IDENTITY_INSERT [dbo].[Credit_Card_Info] ON 

INSERT [dbo].[Credit_Card_Info] ([Credit_ID], [Credit_Card_No], [Customer_ID], [Cvv], [Expiry_Date], [Cardholder_Name]) VALUES (1, 1234123412341235, 1, 124, CAST(0x0000A83300000000 AS DateTime), N'Srk')
INSERT [dbo].[Credit_Card_Info] ([Credit_ID], [Credit_Card_No], [Customer_ID], [Cvv], [Expiry_Date], [Cardholder_Name]) VALUES (2, 2341654651231, 2, 123, CAST(0x0000A79A00000000 AS DateTime), N'zhuxinbei')
INSERT [dbo].[Credit_Card_Info] ([Credit_ID], [Credit_Card_No], [Customer_ID], [Cvv], [Expiry_Date], [Cardholder_Name]) VALUES (3, 9182918291829182, 9, 342, CAST(0x0000A9A700000000 AS DateTime), N'Kohli')
INSERT [dbo].[Credit_Card_Info] ([Credit_ID], [Credit_Card_No], [Customer_ID], [Cvv], [Expiry_Date], [Cardholder_Name]) VALUES (4, 8172817281728172, 10, 789, CAST(0x0000A81900000000 AS DateTime), N'Virendra Sehwag')
SET IDENTITY_INSERT [dbo].[Credit_Card_Info] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Customer_ID], [First_Name], [Last_Name], [Address], [ZipCode], [Mobile_Number], [Email_Address], [Shipping_Address], [Is_Using_Credit_Card]) VALUES (1, N'Bhaviya', N'Gandani', N'2404 Nutwood Avenue', 92832, 1234512345, N'b@gmail.com', N'2808 UCA Apartments', 1)
INSERT [dbo].[Customer] ([Customer_ID], [First_Name], [Last_Name], [Address], [ZipCode], [Mobile_Number], [Email_Address], [Shipping_Address], [Is_Using_Credit_Card]) VALUES (2, N'julie', N'zhu', N'1234 state college blvd', 92831, 7141234567, N'zhuxbei@gmail.com', N'1234 state college blvd', 1)
INSERT [dbo].[Customer] ([Customer_ID], [First_Name], [Last_Name], [Address], [ZipCode], [Mobile_Number], [Email_Address], [Shipping_Address], [Is_Using_Credit_Card]) VALUES (3, N'Chirag', N'Padsala', N'Mahim Matunga', 91821, 9182819281, N'a@g.com', N'Brandra', 0)
INSERT [dbo].[Customer] ([Customer_ID], [First_Name], [Last_Name], [Address], [ZipCode], [Mobile_Number], [Email_Address], [Shipping_Address], [Is_Using_Credit_Card]) VALUES (4, N'Rahul', N'Dravid', N'London', 817281, 9182781928, N'r@u.com', N'America', 0)
INSERT [dbo].[Customer] ([Customer_ID], [First_Name], [Last_Name], [Address], [ZipCode], [Mobile_Number], [Email_Address], [Shipping_Address], [Is_Using_Credit_Card]) VALUES (5, N'MS', N'Dhoni', N'Mumbai', 817281, 7182781728, N'd@y.com', N'Chennai', 0)
INSERT [dbo].[Customer] ([Customer_ID], [First_Name], [Last_Name], [Address], [ZipCode], [Mobile_Number], [Email_Address], [Shipping_Address], [Is_Using_Credit_Card]) VALUES (6, N'Kapil', N'Dev', N'South Africa', 8172817, 8172871827, N'k@w.com', N'West Indies', 0)
INSERT [dbo].[Customer] ([Customer_ID], [First_Name], [Last_Name], [Address], [ZipCode], [Mobile_Number], [Email_Address], [Shipping_Address], [Is_Using_Credit_Card]) VALUES (7, N'Saurav', N'Ganguly', N'Kolkata', 71872, 78172817218, N's@h.com', N'Mumbai', 0)
INSERT [dbo].[Customer] ([Customer_ID], [First_Name], [Last_Name], [Address], [ZipCode], [Mobile_Number], [Email_Address], [Shipping_Address], [Is_Using_Credit_Card]) VALUES (8, N'Sachin', N'Tendulkar', N'Mumbnai', 81728, 8192819281, N'ss@g.com', N'Mumbai', 0)
INSERT [dbo].[Customer] ([Customer_ID], [First_Name], [Last_Name], [Address], [ZipCode], [Mobile_Number], [Email_Address], [Shipping_Address], [Is_Using_Credit_Card]) VALUES (9, N'Virat', N'Kohli', N'Badlapur', 91829, 18927182918, N'v@m.com', N'Borivali', 1)
INSERT [dbo].[Customer] ([Customer_ID], [First_Name], [Last_Name], [Address], [ZipCode], [Mobile_Number], [Email_Address], [Shipping_Address], [Is_Using_Credit_Card]) VALUES (10, N'Virendra', N'Sehwag', N'8192 Anaheim', 18271, 9182718291, N'vs@w.com', N'San Diego', 1)
INSERT [dbo].[Customer] ([Customer_ID], [First_Name], [Last_Name], [Address], [ZipCode], [Mobile_Number], [Email_Address], [Shipping_Address], [Is_Using_Credit_Card]) VALUES (11, N'Harbhajan', N'Singh', N'San Francisco', 19281, 8127819281, N'hs@n.com', N'LA', 0)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Delivery_Type] ON 

INSERT [dbo].[Delivery_Type] ([Delivery_ID], [Delivery], [Delivery_Price], [Estimated_Delivery_Days]) VALUES (1, N'Express', 18, 21)
INSERT [dbo].[Delivery_Type] ([Delivery_ID], [Delivery], [Delivery_Price], [Estimated_Delivery_Days]) VALUES (2, N'SATS', 30, 25)
INSERT [dbo].[Delivery_Type] ([Delivery_ID], [Delivery], [Delivery_Price], [Estimated_Delivery_Days]) VALUES (3, N'Foreign', 30, 50)
SET IDENTITY_INSERT [dbo].[Delivery_Type] OFF
SET IDENTITY_INSERT [dbo].[Inventory] ON 

INSERT [dbo].[Inventory] ([Item_ID], [Name], [Color], [Size], [Description], [Price], [Available_Count], [Modified_Date], [Threshold_Flag], [Threshold_Limit]) VALUES (1, N'Apple Smartphone', N'White', N'Large', N'It is an awesome smartphone', 900, 24, CAST(0x0000A79E016CBB62 AS DateTime), 1, 31)
INSERT [dbo].[Inventory] ([Item_ID], [Name], [Color], [Size], [Description], [Price], [Available_Count], [Modified_Date], [Threshold_Flag], [Threshold_Limit]) VALUES (2, N'Samsung Tablet', N'Black', N'Small', N'It is an awesome tablet', 499, 54, CAST(0x0000A79E01560579 AS DateTime), 0, 32)
INSERT [dbo].[Inventory] ([Item_ID], [Name], [Color], [Size], [Description], [Price], [Available_Count], [Modified_Date], [Threshold_Flag], [Threshold_Limit]) VALUES (3, N'Mouse', N'Black', N'Small', N'It is an awesome mouse', 2000, 20, CAST(0x0000A79F0108CA9E AS DateTime), 0, 10)
INSERT [dbo].[Inventory] ([Item_ID], [Name], [Color], [Size], [Description], [Price], [Available_Count], [Modified_Date], [Threshold_Flag], [Threshold_Limit]) VALUES (4, N'Keyboard', N'Blue', N'Large', N'It is an awesome keyboard', 8000, 84, CAST(0x0000A79F0108EEDC AS DateTime), 0, 20)
INSERT [dbo].[Inventory] ([Item_ID], [Name], [Color], [Size], [Description], [Price], [Available_Count], [Modified_Date], [Threshold_Flag], [Threshold_Limit]) VALUES (5, N'Sony Laptop', N'White', N'Medium', N'It is an awesome laptop', 5000, 40, CAST(0x0000A79F01092FC8 AS DateTime), 0, 22)
INSERT [dbo].[Inventory] ([Item_ID], [Name], [Color], [Size], [Description], [Price], [Available_Count], [Modified_Date], [Threshold_Flag], [Threshold_Limit]) VALUES (6, N'Webcam', N'Black', N'Large', N'It is an awesome webcam', 10000, 26, CAST(0x0000A79F010967F5 AS DateTime), 0, 8)
INSERT [dbo].[Inventory] ([Item_ID], [Name], [Color], [Size], [Description], [Price], [Available_Count], [Modified_Date], [Threshold_Flag], [Threshold_Limit]) VALUES (7, N'Portable Charger', N'Blue', N'Large', N'It is an awesome charger', 800, 18, CAST(0x0000A79F010A88AF AS DateTime), 0, 5)
SET IDENTITY_INSERT [dbo].[Inventory] OFF
SET IDENTITY_INSERT [dbo].[Inventory_Order_Relation] ON 

INSERT [dbo].[Inventory_Order_Relation] ([Relation_ID], [Order_ID], [Item_ID], [Item_Quantity], [Item_Quantity_Cancelled]) VALUES (1, 1, 1, 11, 0)
INSERT [dbo].[Inventory_Order_Relation] ([Relation_ID], [Order_ID], [Item_ID], [Item_Quantity], [Item_Quantity_Cancelled]) VALUES (2, 2, 2, 2, 0)
INSERT [dbo].[Inventory_Order_Relation] ([Relation_ID], [Order_ID], [Item_ID], [Item_Quantity], [Item_Quantity_Cancelled]) VALUES (3, 3, 4, 4, 0)
INSERT [dbo].[Inventory_Order_Relation] ([Relation_ID], [Order_ID], [Item_ID], [Item_Quantity], [Item_Quantity_Cancelled]) VALUES (4, 3, 3, 10, 0)
INSERT [dbo].[Inventory_Order_Relation] ([Relation_ID], [Order_ID], [Item_ID], [Item_Quantity], [Item_Quantity_Cancelled]) VALUES (5, 1, 4, 2, 0)
INSERT [dbo].[Inventory_Order_Relation] ([Relation_ID], [Order_ID], [Item_ID], [Item_Quantity], [Item_Quantity_Cancelled]) VALUES (6, 4, 7, 1, 0)
INSERT [dbo].[Inventory_Order_Relation] ([Relation_ID], [Order_ID], [Item_ID], [Item_Quantity], [Item_Quantity_Cancelled]) VALUES (7, 5, 6, 4, 0)
SET IDENTITY_INSERT [dbo].[Inventory_Order_Relation] OFF
SET IDENTITY_INSERT [dbo].[Order_Backlog] ON 

INSERT [dbo].[Order_Backlog] ([Backlog_ID], [Order_ID], [Item_ID], [Quantity]) VALUES (1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Order_Backlog] OFF
SET IDENTITY_INSERT [dbo].[Order_Status] ON 

INSERT [dbo].[Order_Status] ([Status_ID], [Status]) VALUES (1, N'New')
INSERT [dbo].[Order_Status] ([Status_ID], [Status]) VALUES (2, N'Pending')
INSERT [dbo].[Order_Status] ([Status_ID], [Status]) VALUES (3, N'Incomplete')
INSERT [dbo].[Order_Status] ([Status_ID], [Status]) VALUES (4, N'Completed')
SET IDENTITY_INSERT [dbo].[Order_Status] OFF
SET IDENTITY_INSERT [dbo].[Order_Type] ON 

INSERT [dbo].[Order_Type] ([Order_Type_ID], [Mode]) VALUES (1, N'Mail')
INSERT [dbo].[Order_Type] ([Order_Type_ID], [Mode]) VALUES (2, N'Phone')
INSERT [dbo].[Order_Type] ([Order_Type_ID], [Mode]) VALUES (3, N'Fax')
SET IDENTITY_INSERT [dbo].[Order_Type] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Order_Type_ID], [Payment_ID], [Status_ID], [Delivery_ID], [Order_Date], [Total_Price], [Payment_Received_Date], [Dispatch_Date]) VALUES (1, 1, 2, 1, 2, 3, CAST(0x0000A7A100000000 AS DateTime), 0, CAST(0x0000A79F00000000 AS DateTime), NULL)
INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Order_Type_ID], [Payment_ID], [Status_ID], [Delivery_ID], [Order_Date], [Total_Price], [Payment_Received_Date], [Dispatch_Date]) VALUES (2, 2, 3, 1, 1, 1, CAST(0x0000A79E00000000 AS DateTime), 0, CAST(0x0000A79F00000000 AS DateTime), NULL)
INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Order_Type_ID], [Payment_ID], [Status_ID], [Delivery_ID], [Order_Date], [Total_Price], [Payment_Received_Date], [Dispatch_Date]) VALUES (3, 9, 2, 1, 1, 3, CAST(0x0000A7A100000000 AS DateTime), 0, CAST(0x0000A7A200000000 AS DateTime), NULL)
INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Order_Type_ID], [Payment_ID], [Status_ID], [Delivery_ID], [Order_Date], [Total_Price], [Payment_Received_Date], [Dispatch_Date]) VALUES (4, 9, 2, 1, 1, 1, CAST(0x0000A7A200000000 AS DateTime), 0, CAST(0x0000A7A200000000 AS DateTime), NULL)
INSERT [dbo].[Orders] ([Order_ID], [Customer_ID], [Order_Type_ID], [Payment_ID], [Status_ID], [Delivery_ID], [Order_Date], [Total_Price], [Payment_Received_Date], [Dispatch_Date]) VALUES (5, 11, 2, 2, 1, 2, CAST(0x0000A7A100000000 AS DateTime), 0, CAST(0x0000A7A200000000 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Payment_Type] ON 

INSERT [dbo].[Payment_Type] ([Payment_ID], [Mode]) VALUES (1, N'Credit Card')
INSERT [dbo].[Payment_Type] ([Payment_ID], [Mode]) VALUES (2, N'Check')
INSERT [dbo].[Payment_Type] ([Payment_ID], [Mode]) VALUES (3, N'Postal Order')
SET IDENTITY_INSERT [dbo].[Payment_Type] OFF
SET IDENTITY_INSERT [dbo].[Shipment_Received] ON 

INSERT [dbo].[Shipment_Received] ([Received_ID], [Item_ID], [Item_Count_Received], [Received_Date]) VALUES (1, 1, 4, CAST(0x0000A79E016CBB51 AS DateTime))
INSERT [dbo].[Shipment_Received] ([Received_ID], [Item_ID], [Item_Count_Received], [Received_Date]) VALUES (2, 7, 10, CAST(0x0000A79F010A889B AS DateTime))
SET IDENTITY_INSERT [dbo].[Shipment_Received] OFF
USE [master]
GO
ALTER DATABASE [targeting] SET  READ_WRITE 
GO
