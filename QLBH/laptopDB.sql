USE [master]
GO
/****** Object:  Database [QLBH]    Script Date: 4/24/2015 7:54:51 AM ******/
CREATE DATABASE [QLBH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLBH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QLBH.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLBH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QLBH_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLBH] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLBH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLBH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLBH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLBH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLBH] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLBH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLBH] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QLBH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLBH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLBH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLBH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLBH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLBH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLBH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLBH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLBH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLBH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLBH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLBH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLBH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLBH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLBH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLBH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLBH] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLBH] SET  MULTI_USER 
GO
ALTER DATABASE [QLBH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLBH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLBH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLBH] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QLBH]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/24/2015 7:54:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CatID] [int] IDENTITY(1,1) NOT NULL,
	[CatName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 4/24/2015 7:54:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Amount] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 4/24/2015 7:54:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[UserID] [int] NOT NULL,
	[Total] [money] NOT NULL,
	[Status] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/24/2015 7:54:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProID] [int] IDENTITY(1,1) NOT NULL,
	[ProName] [nvarchar](100) NULL,
	[TinyDes] [nvarchar](100) NULL,
	[FullDes] [ntext] NOT NULL,
	[Price] [money] NOT NULL,
	[CatID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[PageView] [int] NULL,
	[SaleQuantity] [int] NULL,
	[TypeID] [int] NULL,
	[Origin] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TypeProducts]    Script Date: 4/24/2015 7:54:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeProducts](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nchar](20) NULL,
 CONSTRAINT [PK_TypeProducts] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/24/2015 7:54:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[f_ID] [int] IDENTITY(1,1) NOT NULL,
	[f_Username] [nvarchar](50) NOT NULL,
	[f_Password] [nvarchar](255) NOT NULL,
	[f_Name] [nvarchar](50) NOT NULL,
	[f_Email] [nvarchar](50) NOT NULL,
	[f_DOB] [datetime] NOT NULL,
	[f_Permission] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[f_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CatID], [CatName]) VALUES (2, N'ASUS')
INSERT [dbo].[Categories] ([CatID], [CatName]) VALUES (3, N'DELL')
INSERT [dbo].[Categories] ([CatID], [CatName]) VALUES (4, N'HP')
INSERT [dbo].[Categories] ([CatID], [CatName]) VALUES (5, N'SONY')
INSERT [dbo].[Categories] ([CatID], [CatName]) VALUES (40, N'ACER')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Quantity], [Price], [Amount]) VALUES (1, 1, 1, 2, 1500000.0000, 3000000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Quantity], [Price], [Amount]) VALUES (2, 1, 2, 2, 300000.0000, 600000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Quantity], [Price], [Amount]) VALUES (3, 2, 1, 1, 1500000.0000, 1500000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Quantity], [Price], [Amount]) VALUES (4, 2, 2, 1, 300000.0000, 300000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Quantity], [Price], [Amount]) VALUES (9, 4, 14, 1, 1200000.0000, 1200000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Quantity], [Price], [Amount]) VALUES (10, 4, 15, 1, 1925000.0000, 1925000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Quantity], [Price], [Amount]) VALUES (11, 5, 15, 45, 1925000.0000, 86625000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Quantity], [Price], [Amount]) VALUES (12, 5, 16, 1, 3200000.0000, 3200000.0000)
INSERT [dbo].[OrderDetails] ([ID], [OrderID], [ProID], [Quantity], [Price], [Amount]) VALUES (14, 7, 8, 2, 270000.0000, 540000.0000)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [OrderDate], [UserID], [Total], [Status]) VALUES (4, CAST(0x0000A4750164A017 AS DateTime), 10, 3125000.0000, 0)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [UserID], [Total], [Status]) VALUES (5, CAST(0x0000A4760119CBD8 AS DateTime), 10, 89825000.0000, 0)
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (1, N'ACER Aspire E1', N'CORE I3- 3217U - 4GB - 500GB', N'<UL><LI>CPU: Intel i3-2350M (2.3GHz /3MB Cache)</LI><LI>RAM: 2Gb</li><li>Ổ cứng:: 640GB</li><li>Màn hình: 14.0-inch LED-backlit Display (1366 x 768)</LI><LI>VGA: Intel Graphic HD3000 upto 1649MB Share</li><li>Weight: 2.2 Kg</li><li>Bảo hành: 12 Tháng</LI></UL>', 1500000.0000, 40, 82, 6, 0, 1, N'Taiwan')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (2, N'ACER Aspire 4752 ', N'Core i3 2350 - 2GB - 640GB', N'<ul><li>CPU: Intel i3-2350M (2.3GHz /3MB Cache)</li><li>RAM: 2Gb)</li><li>Ổ cứng: 640GB)</li><li>Màn Hình: 14.0-inch LED-backlit Display (1366 x 768) )</li><li>VGA: Intel Graphic HD3000 upto 1649MB Share)</li><li>Weight: 2.2 Kg)</li><li>Bảo hành: 12 Tháng</li></ul>', 300000.0000, 40, 64, 3, 0, 1, N'Taiwan')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (3, N'ACER ASPIRE E5 ', N' Core i5 4210U - 4GB - 1TB - GT 840M 2GB', N'<UL><LI>CPU: Intel Core i5-4210U Processor (2 x 1.70GHz), Max Turbo Frequency: 2.70GHz</LI><LI>RAM: 1 x 4GB DDR3L/ 1600MHz (2 slots)</li><li>Ổ cứng:: 1TB SATA3 (5400rpm)</li><li>Màn hình: 15.6\" HD 1366 x 768 resolution Acer CineCrystal LED-backlit TFT LCD</LI><LI>VGA: NVIDIA GeForce 840M (2GB of dedicated DDR3 VRAM, Bus Width: 64-Bit) with NVIDIA Optimus technology ; Intel HD Graphics 4600 – WIN8.1 x64 : 1792MB</li><li>Weight: 2.50 kg</li><li>Bảo hành: 12 Tháng</LI></UL>', 1600000000.0000, 40, 86, 8, 0, 2, N'Taiwan')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (4, N'Acer Aspire V5', N'Core i7-4500U - 4GB - 1TB - VGA Nvidia Geforce 720M GT 2GB', N'&lt;ul&gt;
&lt;li&gt;CPU: Intel Core i7 4500U (1.8Ghz Max Turbo Frequency 3.0GHz, 4Mb Cache L3), 4th Generation, Haswell&lt;/li&gt;
&lt;li&gt;RAM: 4 GB DDR3 1600 MHz&lt;/li&gt;
&lt;li&gt;Ổ cứng:: 1TB HDD&lt;/li&gt;
&lt;li&gt;M&amp;agrave;n h&amp;igrave;nh: 15.6\&quot; LED backlight 1366 x 768 / HD&lt;/li&gt;
&lt;li&gt;VGA: NVIDIA GeForce GT 720M 2GB&lt;/li&gt;
&lt;li&gt;Weight: 2.1 Kg&lt;/li&gt;
&lt;li&gt;Bảo h&amp;agrave;nh: 12 Th&amp;aacute;ng&lt;/li&gt;
&lt;/ul&gt;', 42000000.0000, 40, 63, 3, 0, 3, N'Taiwan')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (5, N'Acer Aspire E1', N' - Core i5-4200U - 4GB - 500GB - VGA Radeon 8750M', N'<UL><LI>CPU: Intel® Core™ i5-4200U 1.60GHz with Intel® Turbo Boost Technology up to 2.60GHz, 3MB cache</LI><LI>RAM: 4GB DDR3</li><li>Ổ cứng:: 500GB 5400RPM SATA</li><li>Màn hình: 15.6\" LED backlight 1366 x 768 / HD</LI><LI>VGA: Radeon HD 8670M 1GB + Intel HD 4000 series</li><li>Weight: 2.2 kg</li><li>Bảo hành: 12 Tháng</LI></UL>', 2900000.0000, 40, 0, 2, 0, 2, N'Taiwan')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (6, N'ACER ASPIRE NITRO', N'Core i7 4710H - 16GB - 1TB - GTX 860M 4GB - W 8.1 - BL', N'<UL><LI>CPU: Intel® Core™ i7-4710HQ Processor (6M Cache, up to 3.50 GHz)</LI><LI>RAM: 16GB DDR3L 1600 MHz SDRam</li><li>Ổ cứng:: 1000 GB</li><li>Màn hình: 17.3 inch - FullHD (1920x1080) IPS Acer ComfyView™ LCD Panel</LI><LI>VGA: NVIDIA® GeForce® GTX 860M with 4GB GDDR5 VRAM / Intel® HD Graphics 4600</li><li>Weight:</li><li>Bảo hành: 12 Tháng</LI></UL>', 180000.0000, 40, 62, 0, NULL, 3, N'Taiwan')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (7, N'ACER ASPIRE V3 ', N' Core i7-4510U - 4GB - 500GB - GT 840M 2GB', N'<UL><LI>CPU: Intel Core i7-4510U Processor (2 x 2.00GHz), Max Turbo Frequency: 3.10GHz</LI><LI>RAM: 1 x 4GB DDR3L/ 1600MHz (2 slots)</li><li>Ổ cứng:: 500GB Hard Drive SATA3</li><li>Màn hình: 15.6\" HD 1366 x 768 resolution Acer CineCrystal LED-backlit TFT LCD</LI><LI>VGA: NVIDIA GeForce 840M (2GB of dedicated DDR3 VRAM, Bus Width: 64-Bit) with NVIDIA Optimus technology ; Intel HD Graphics 4600 – WIN8.1 x64 : 1792MB</li><li>Weight: 2.50 kg</li><li>Bảo hành: 12 Tháng</LI></UL>', 2800000.0000, 40, 15, 0, NULL, 3, N'Taiwan')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (8, N'ASUS ZENBOOK', N'Intel® Core™ i5 _ 4210U _ 4GB _ 128GB SSD ', N'<UL><LI>CPU: 1.5GHz Intel 1007U Dual-Core</LI><LI>RAM: 2GB</li><li>Ổ cứng:: 500GB Hard Drive</li><li>Màn hình: 14\" HD CineCrystal LED-Backlit Display</LI><LI>VGA: Intel Graphic HD</li><li>Weight: 2.2 Kg</li><li>Bảo hành: 12 Tháng</LI></UL>', 270000.0000, 2, 68, 64, 2, 2, N'Taiwan')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (9, N'ASUS G551JM', N'Core i7 _ 4710HQ _ 8GB _ 1TB _ VGA GTX 860M _ Full HD', N'<UL><LI>CPU: Intel® Haswell Core™ i5 - 4210U Processor ( 1.7Ghz, 3M Cache, up to 2.70 GHz)</LI><LI>RAM: 4GB DDR3L / BUS 1600MHz</li><li>Ổ cứng:: 128GB SSD</li><li>Màn hình: 13.3\" IPS, FHD (1920x1080) TOUCH</LI><LI>VGA: NVIDIA® GeForce® GT 820M 2GB / Intel® HD Graphics 4400</li><li>Weight: 1.45 KG</li><li>Bảo hành: 24 Tháng</LI></UL>', 2400000.0000, 2, 43, 9, 0, 3, N'Taiwan')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (10, N'Asus Transformer Book', N' Core™ i3-4030U _ 4GB _ 500GB_24GB SSD _ VGA INTEL', N'<UL><LI>CPU: Intel Haswell Core i7-4710HQ 2.50GHz (6MB cache, Max Turbo 3.5GHz)</LI><LI>RAM: 8GB DDR3L/1600 MHz ( Khuyến mãi năm mới: nâng cấp lên 16GB Ram miễn phí, từ 18-12 đến 30-12)</li><li>Ổ cứng:: 1TB (1000GB) 7200rpm</li><li>Màn hình: 15.6\" 16:9 HD with EWV FHD LED (1920x1080)</LI><LI>VGA: Nvidia GeForce GTX 860M 2GB GDDR5 / Intel HD 4600 ( GPU Maxwell thế hệ mới nhất )</li><li>Weight: 2.5kg</li><li>Bảo hành: 24 Tháng</LI></UL>', 2800000.0000, 2, 80, 12, 0, 1, N'Taiwan')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (11, N'Asus  Flip TP300LA ', N'Core™ i5_4210U_4GB_500GB_VGA INTEL_13,3\" HD', N'<UL><LI>CPU: Intel® Core™ i3-4030U ( 1.9Ghz, 3MB cache )</LI><LI>RAM: 4GB DDR3L / BUS 1600MHz</li><li>Ổ cứng:: 500GB 5400 rpm SATA_24GB SSD</li><li>Màn hình: 15.6\" LED HD backlight (1366 x 768) Touch</LI><LI>VGA: Integrated Intel® HD Graphics 4400</li><li>Weight: 2.4KG</li><li>Bảo hành: 24 Tháng</LI></UL>', 250000.0000, 2, 88, 1, 0, 2, N'Taiwan')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (12, N'Asus X451CA', N' Core™ i3-4030U _ 4GB _ 500GB_24GB SSD _ VGA INTEL', N'<UL><LI>CPU: Intel® Haswell Core™ i5-4210U Processor (3MB Cache, 1.7Ghz up to 2.7GHz)</LI><LI>RAM: 4GB DDR3 Buss 1600Mhz</li><li>Ổ cứng:: 500GB Hard Drive</li><li>Màn hình: 13.3 inch HD LED (1366x768) Touch - Xoay 360 độ</LI><LI>VGA: Intel® HD graphics 4400</li><li>Weight: 1.7kg</li><li>Bảo hành: 24 Tháng</LI></UL>', 120000.0000, 2, 61, 1, 0, 1, N'Taiwan')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (13, N'Asus F200MA', N'Core i3-3217U/ 4GB/ 500GB', N'<UL><LI>CPU: Intel Pentium 2117U 1.8Ghz 2MB Cache L3</LI><LI>RAM: 2GB DDR3 1333Mhz *1</li><li>Ổ cứng:: 500GB 5400 rpm</li><li>Màn hình: 14.0\" LED HD (1366 x 768)</LI><LI>VGA: Intel HD Graphics 4000</li><li>Weight: 2.0Kg</li><li>Bảo hành: 24 Tháng</LI></UL>', 2600000.0000, 2, 92, 5, 0, 1, N'Taiwan')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (14, N'ASUS P450LA ', N'Core i5 Haswell - 4200U - 4GB - 500GB', N'<UL><LI>CPU: Intel® Pentium® N3530 (2.1GHz up to 2.5GHz, 2M cache)</LI><LI>RAM: 2GB DDR3/ Bus 1600</li><li>Ổ cứng:: 500GB 5400rpm SATA</li><li>Màn hình: 11.6\" HD wide LED (1366x768).</LI><LI>VGA: Integrated Intel HD Graphics</li><li>Weight: 1.5kg</li><li>Bảo hành: 24 Tháng</LI></UL>', 1200000.0000, 2, 0, 0, NULL, 2, N'Taiwan')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (15, N'Dell Vostro 5560 ', N'Core i5 3230 - 4G- 1TG- VGA Geforce 630M ', N'<UL><LI>CPU: Intel Ivy Haswell Core i5- 4200U 1.6GHz (3MB L3 cache, Max Turbo Frequency 2.6GHz) Thế hệ mới nhất</LI><LI>RAM: 4 GB DDR3 1600 MHz</li><li>Ổ cứng:: 500GB Hard Drive</li><li>Màn hình: 14.0-inch Display (1366 x 768) Anti Glare</LI><LI>VGA: Intel HD Graphics</li><li>Weight: 2.2 Kg</li><li>Bảo hành: 24 Tháng</LI></UL>', 1925000.0000, 3, 20, 16, 2, 2, N'USA')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (16, N'DELL Vostro 5470 ', N'Core i3 Haswell - 4030U - 4GB - 500GB', N'<UL><LI>CPU: Intel Core i5-3230M 2.6GHz (3MB L3 cache, Max Turbo Frequency 3.2GHz) Ivy Bridge thế hệ thứ 3 mới nhất</LI><LI>RAM: 4GB DDR3 Bus 1600 Mhz</li><li>Ổ cứng:: 1TB SATA</li><li>Màn hình: 15 inch LED Backlit Display with Truelife and HD resolution</LI><LI>VGA: NVIDIA GeForce 630M GT, with 2G VRAM, Optimus</li><li>Weight: 2.2 kg</li><li>Bảo hành: 12 Tháng</LI></UL>', 3200000.0000, 3, 81, 2, 0, 1, N'USA')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (17, N'DELL Vostro 3560 ', N'Core i5 3230M - 4GB - 500GB - VGA Radeon HD 7670M 1GB', N'<UL><LI>CPU: Intel, Core i3 Haswell, 4030U 1.90 GHz , 3MB Cache</LI><LI>RAM: 4 GB DDR3L 1600 MHz</li><li>Ổ cứng:: 500GB Hard Drive</li><li>Màn hình: 14\" HD LED Display ( 1366x768 )</LI><LI>VGA: Intel® HD graphics 4400</li><li>Weight: 1.5kg</li><li>Bảo hành: 12 Tháng</LI></UL>', 1820000.0000, 3, 33, 1, 0, 2, N'USA')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (18, N'Dell Inspiron 7737 ', N'Core i5 4200U - 6GB - 1TB - VGA Geforce 750M GT 2GB Touch - Win 8.1', N'<UL><LI>CPU: Intel Core i5-3230M 2.6GHz (3MB L3 cache, Max Turbo Frequency 3.2GHz) Ivy Bridge thế hệ thứ 3 mới nhất</LI><LI>RAM: 4GB DDR3 Bus 1600 Mhz</li><li>Ổ cứng:: 500 GB SATA 7200rpm</li><li>Màn hình: LCD 15.6\" WXGA HD LED</LI><LI>VGA: Radeon HD 7670M - 1024MB RỜI + VGA Intel HD 4000 Series</li><li>Weight: 2.4 kg</li><li>Bảo hành: 12 Tháng</LI></UL>', 3400000.0000, 3, 10, 0, NULL, 2, N'USA')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (19, N'Dell Inspiron 14 3421', N'Core i3 3227U - 4GB - 750GB HDD - VGA Intel HD Graphics 4000 - Dos', N'<UL><LI>CPU: 4rd generation Haswell Intel(R) Core(TM) i5-4200U (1.6 GHz, 3MB L3 Cache) w/Turbo Boost up to 2.6GHz</LI><LI>RAM: 6GB DDR3L 1600Mhz</li><li>Ổ cứng:: 1TB</li><li>Màn hình: 17.3\" LED backlight 1366 x 768, with touch screen ( màn hình cảm ứng )</LI><LI>VGA: NVIDIA GeForce GT 750M 2GB with Optimus technology/ Intel HD 4400</li><li>Weight: 3.29Kg</li><li>Bảo hành: 12 Tháng</LI></UL>', 1820000.0000, 3, 17, 0, NULL, 1, N'USA')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (20, N'Dell Latitude E7240', N'Core i5-4300U - 4GB - 128GB SSD - LCD 12.5\" - VGA Intel - Win 8.1', N'<UL><LI>CPU: Intel Core i3-3227U (2 x 1.90GHz) , 3MB cache</LI><LI>RAM: 4 GB DDR3 1600 MHz</li><li>Ổ cứng:: 750 GB SATA</li><li>Màn hình: 14.0\" HD LED Display (1366x768), Anti Galre</LI><LI>VGA: Intel Graphics HD 4000</li><li>Weight: 2.1 Kg</li><li>Bảo hành: 12 Tháng</LI></UL>', 540000.0000, 3, 0, 1, 0, 2, N'USA')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (21, N'Dell Latitude E6230 ', N'Core i5-3320M - 4GB - 128GB SSD - LCD 12.5\" - VGA Intel - Win 7', N'<UL><LI>CPU: Intel Core i5-4300U 1.9GHz (3MB L3 cache, Max Turbo Frequency 2.9GHz)</LI><LI>RAM: 4GB DDR3 Bus 1600 Mhz</li><li>Ổ cứng:: 128 GBF SSD</li><li>Màn hình: 12.5\" Anti-glare, LED backlight,(1366x768)</LI><LI>VGA: Intel Graphics HD 4400</li><li>Weight: 1.5 Kg</li><li>Bảo hành: 12 Tháng</LI></UL>', 300000.0000, 3, 74, 0, NULL, 2, N'USA')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (22, N'DELL Audi A4 N5421', N'Core i5 - 3337 - 4GB - 750GB - VGA GeForce 625M 1GB - cảm ứng', N'<UL><LI>CPU: Intel Core i5-3320M 2.6GHz (3MB L3 cache, Max Turbo Frequency 3.2GHz) Ivy Bridge thế hệ thứ 3 mới nhất</LI><LI>RAM: 4GB DDR3 Bus 1600 Mhz</li><li>Ổ cứng:: 128 GB SSD</li><li>Màn hình: 12.5\" Anti-glare, LED backlight,(1366x768)</LI><LI>VGA: Intel Graphics HD 4000</li><li>Weight: 1.5kg</li><li>Bảo hành: 12 Tháng</LI></UL>', 290000.0000, 3, 30, 0, NULL, 2, N'USA')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (23, N'New HP Pavilion 15', N'Core i7 4500U - 4GB - 500GB - VGA Geforce 740M 2GB', N'<UL><LI>CPU: Intel Core i5-3337U 4x1.8GHz, 3M Cache L3 turbo boost up 2.7GHz</LI><LI>RAM: 4Gb</li><li>Ổ cứng:: 750 GB SATA</li><li>Màn hình: 14.0-inch LED-backlit Display (1366 x 768) with touch screen ( màn hình cảm ứng )</LI><LI>VGA: NVIDIA GeForce 625M GT, with 1G VRAM, Optimus</li><li>Weight: 2.1 Kg</li><li>Bảo hành: 12 Tháng</LI></UL>', 3600000.0000, 4, 5, 3, 0, 3, N'China')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (24, N'HP Pavilion 14', N'Core i3-3217U/ 4GB/ 500GB', N'<UL><LI>CPU: 4rd generation Haswell Intel(R) Quad Core(TM) i7-4500U (1.8 GHz, 4MB L3 Cache) w/Turbo Boost up to 3.0GHz</LI><LI>RAM: 4 GB DDR3 1600 MHz</li><li>Ổ cứng:: 500GB 5400rpm Hard Drive</li><li>Màn hình: 15.6 inch HD (1366 x 768) Led backlit display</LI><LI>VGA: NVIDIA GeForce GT 740M 2GB with Optimus technology/ Intel HD 4400</li><li>Weight: 2.5 kg</li><li>Bảo hành: 24 Tháng</LI></UL>', 14900000.0000, 4, 22, 0, NULL, 1, N'China')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (25, N'New HP Pavilion 14', N'Core i5 4200U - 4GB - 750GB - VGA Radeon 8670M 2GB', N'<UL><LI>CPU: Intel Core i3-3217U (3M Cache, 1.80 GHz)</LI><LI>RAM: 4GB DDR3 1600Mhz</li><li>Ổ cứng:: 500GB 5400 rpm</li><li>Màn hình: 14\" HD BrightView LED-backlit (1366 x 768)</LI><LI>VGA: Intel HD GraPhics 4000</li><li>Weight: 2.1kg</li><li>Bảo hành: 12 Tháng</LI></UL>', 2400000000.0000, 4, 52, 0, NULL, 2, N'China')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (26, N'HP Pavilion 14-N21', N'Core i3-3217U/ 4GB/ 500GB', N'<UL><LI>CPU: 4rd generation Haswell Intel(R) Core(TM) i5-4200U (1.6 GHz, 3MB L3 Cache) w/Turbo Boost up to 2.6GHz</LI><LI>RAM: 4 GB DDR3 1600 MHz</li><li>Ổ cứng:: 750 GB SATA</li><li>Màn hình: 14\" diagonal HD BrightView LED-backlit (1366 x 768)</LI><LI>VGA: Radeon HD 8670M 2GB + Intel HD 4400 series</li><li>Weight: 2.3kg</li><li>Bảo hành: 24 Tháng</LI></UL>', 1850000000.0000, 4, 11, 0, NULL, 1, N'China')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (27, N'HP Probook 430 G2', N'Core I5 4210U / 4GB / 500GB / Intel HD Graphics / 13.3\"', N'<UL><LI>CPU: Intel Haswell Core i3- 4005U 1.7GHz (3MB L3 cache, 64-bit) Thế hệ mới nhất</LI><LI>RAM: 4 GB DDR3L 1600 MHz</li><li>Ổ cứng:: 500GB Hard Drive</li><li>Màn hình: 15.6\" LED backlight 1366 x 768</LI><LI>VGA: Intel Graphic HD4400 upto 1649MB Share</li><li>Weight: 2.2 kg</li><li>Bảo hành: 12 Tháng</LI></UL>', 3100000000.0000, 4, 28, 3, 0, 2, N'China')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (28, N'ACER V34592', N'Core i7-4510U - 4GB - 500GB - GT 840M 2GB', N'&lt;ul&gt;
&lt;li&gt;CPU: Intel&amp;reg; Core&amp;trade; i5-4210U Processor (3M Cache, up to 2.70 GHz)&lt;/li&gt;
&lt;li&gt;RAM: 4GB DDR3L- 1600 MHz&lt;/li&gt;
&lt;li&gt;Ổ cứng:: 500GB HDD&lt;/li&gt;
&lt;li&gt;M&amp;agrave;n h&amp;igrave;nh: 13.3 Inchs HD&lt;/li&gt;
&lt;li&gt;VGA: Intel HD Graphics&lt;/li&gt;
&lt;li&gt;Weight: 1,80 Kg&lt;/li&gt;
&lt;li&gt;Bảo h&amp;agrave;nh: 12 Th&amp;aacute;ng&lt;/li&gt;
&lt;/ul&gt;', 1800000000.0000, 40, 29, 1, 0, 3, N'Taiwan')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (29, N'HP ENVY 17 2014 ', N'Core i7 4712HQ - 6GB - 1TB - Geforce 840M - Full HD - Win 8.1 - USA', N'<UL><LI>CPU: 4rd generation Haswell Intel(R) Quad Core(TM) i7-4712HQ (2.3 GHz, 6MB L3 Cache) w/Turbo Boost up to 3.3GHz</LI><LI>RAM: 6GB DDR3L Bus 1600 Mhz</li><li>Ổ cứng:: 1TB 5400rpm Hard Drive with HP ProtectSmart Hard Drive Protection</li><li>Màn hình: 17.3-inch diagonal HD BrightView LED-backlit Display Full HD (1920x1080)</LI><LI>VGA: NVIDIA GeForce GT 840M Graphics with 2048MB of dedicated video memory/ Intel HD 4600</li><li>Weight: 2.8 kg</li><li>Bảo hành: 12 Tháng</LI></UL>', 500000000.0000, 4, 49, 0, NULL, 3, N'China')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (30, N'HP EliteBook 8460P ', N'Core i5 2520 2.5GHz - 4GB - 320GB - LCD 14.0\" HD-VGA Intel - Win 7', N'<UL><LI>CPU: Intel Core i5-2520M (2.5GHz, 3MB Cache, upto 3.2Ghz ),Intel vPro Technology</LI><LI>RAM: 4 GB DDR3 Bus 1333 Mhz</li><li>Ổ cứng:: 320 GB SATA 7200rpm</li><li>Màn hình: 14.0\" HD WLED Anti-Glare (1366x768)</LI><LI>VGA: Intel Graphic HD3000 upto 1649MB Share</li><li>Weight: 2.2 kg</li><li>Bảo hành: 12 Tháng</LI></UL>', 2400000.0000, 4, 12, NULL, NULL, 2, N'China')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (40, N'HP EliteBook 8440P ', N'Core i5 520 2.4GHz - 4GB - 250GB - VGA NVIDIA NVS 3100M - LCD 900P', N'<UL><LI>CPU: Intel Core i5 520M 2,4GHz , TurboBoots 2.93GHz, cache 3MB</LI><LI>RAM: 4 GB DDR3 Bus 1333 Mhz</li><li>Ổ cứng:: 250GB SATA 7200 rpm</li><li>Màn hình: 14.0\" Anti-glare LED backlit High Definition + (1600X900)</LI><LI>VGA: NVIDIA NVS 3100M 512MB upto 2223MB</li><li>Weight: 2.2 kg</li><li>Bảo hành: 3 Tháng</LI></UL>', 24000.0000, 4, 7, NULL, NULL, 2, N'China')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (54, N'VAIO Pro 11/13', N'Core i3 4200U - 4GB - 750GB - VGA Radeon 8670M 2GB', N'<UL><LI>CPU: Intel Core i5 520M 2,4GHz , TurboBoots 2.93GHz, cache 3MB</LI><LI>RAM: 4 GB DDR3 Bus 1333 Mhz</li><li>Ổ cứng:: 250GB SATA 7200 rpm</li><li>Màn hình: 14.0\" Anti-glare LED backlit High Definition + (1600X900)</LI><LI>VGA: NVIDIA NVS 3100M 512MB upto 2223MB</li><li>Weight: 2.2 kg</li><li>Bảo hành: 3 Tháng</LI></UL>', 2525.0000, 5, 36, 6, 0, 1, N'USA')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (58, N'Sony Vaio SVF14', N'Core i5 2520 2.5GHz - 4GB - 320GB - LCD 14.0\" HD-VGA Intel - Win 7', N'<UL><LI>CPU: Intel Haswell Core i3- 4005U 1.7GHz (3MB L3 cache, 64-bit) Thế hệ mới nhất</LI><LI>RAM: 4 GB DDR3L 1600 MHz</li><li>Ổ cứng:: 500GB Hard Drive</li><li>Màn hình: 15.6\" LED backlight 1366 x 768</LI><LI>VGA: Intel Graphic HD4400 upto 1649MB Share</li><li>Weight: 2.2 kg</li><li>Bảo hành: 12 Tháng</LI></UL>', 55656.0000, 5, 40, 7, 0, 1, N'USA')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (95, N'Vaio Pro SVP13', N'Core i5 / 13.3″ / 4GB / 128GB SSD', N'&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;CPU:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;Intel Core i5 4200U 4x1.6GHz, 3MB Cache L3 Turbo boost up to 2.6GHz&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;Ổ cứng:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;128GB SSD&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row  &quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;RAM:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;04Gb DDR3 Bus 1600Mhz&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row  &quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;Card m&amp;agrave;n h&amp;igrave;nh:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;1792MB Intel Graphic HD4400&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;M&amp;agrave;n h&amp;igrave;nh:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;13.3 inch cảm ứng, Triluminos Display Full HD (1920x1080)&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;Ổ Đĩa:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;Option&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;Mạng:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;LAN 10/1000, Wireless 802.11BGN, Bluetooth&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;Pin:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;5 giờ&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;Hệ điều h&amp;agrave;nh:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;Windows 8 (64bit)&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;Thiết bị kh&amp;aacute;c:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;Webcam 1.3MP, Backlit Keyboard, 03 USB3.0, HDMI, SD Slot,&lt;/p&gt;
&lt;/div&gt;', 1500000.0000, 5, 5, 7, 0, 2, N'Japan')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (96, N'Vaio SVF1421PSGW', N'Core i3 1.8GHz, Hdd 500G, 14 inch', N'&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;CPU:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;Intel&amp;reg; Pentium 2117U 4x1.8GHz 2MB Cache L3&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;Ổ cứng:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;500G 5400rpm SATA&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row  &quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;RAM:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;02Gb DDR3 Bus 1600Mhz&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row  &quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;Card m&amp;agrave;n h&amp;igrave;nh:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;1729MB Intel Graphics HD4000&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;M&amp;agrave;n h&amp;igrave;nh:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;14 inch WLED Xbrite (1366x768)&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;Ổ Đĩa:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;DVD+/-RW (DVD/CD read/write)&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;Mạng:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;LAN 10/1000, Wireless 802.11BGN, Bluetooth&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;Pin:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;Lithium Ion 4Cell ~ 4.0 giờ sử dụng&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;Hệ điều h&amp;agrave;nh:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;Windows 8 (64bit)&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;Thiết bị kh&amp;aacute;c:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;Webcam 1.3MP, Backlit Keyboard, 03 USB3.0, CRT Out, HDMI, 4 in 1 (SD/MMC/MS/MS Pro),&lt;/p&gt;
&lt;/div&gt;', 8990000.0000, 5, 7, 3, 0, 1, N'Japan')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (97, N'Vaio SVF1521DSG', N'core i3 3227U, 500G, 2G, 15.6 inch', N'&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;CPU:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;Intel Core i3 3227U 4x1.9GHz 3MB Cache L3&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;Ổ cứng:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;500G 5400rpm SATA&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row  &quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;RAM:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;02Gb DDR3 Bus 1600Mhz&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row  &quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;Card m&amp;agrave;n h&amp;igrave;nh:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;1729MB Intel Graphics HD4000&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;M&amp;agrave;n h&amp;igrave;nh:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;15.6 inch WLED Xbrite (1366x768)&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;Ổ Đĩa:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;DVD+/-RW (DVD/CD read/write)&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;Mạng:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;LAN 10/1000, Wireless 802.11BGN, Bluetooth&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;Pin:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;Lithium Ion 4Cell ~ 4.0 giờ sử dụng&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;Hệ điều h&amp;agrave;nh:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;Windows 8 (64bit)&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;Thiết bị kh&amp;aacute;c:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;Webcam 1.3MP, 03 USB3.0, HDMI, 4 in 1 (SD/MMC/MS/MS Pro),&lt;/p&gt;
&lt;/div&gt;', 11299000.0000, 5, 4, 1, 0, 1, N'USA')
INSERT [dbo].[Products] ([ProID], [ProName], [TinyDes], [FullDes], [Price], [CatID], [Quantity], [PageView], [SaleQuantity], [TypeID], [Origin]) VALUES (98, N'Vaio SVF15328SG', N'Core i5 4200U, 500G, 4G', N'&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;CPU:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;Intel Core i5 4200U 4x1.6GHz 3MB Cache L3 Turbo boost up to 2.6GHz&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;Ổ cứng:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;500G 5400rpm SATA&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row  &quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;RAM:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;04Gb DDR3 Bus 1600Mhz&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row  &quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;Card m&amp;agrave;n h&amp;igrave;nh:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;01GB GeForce GT740&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;M&amp;agrave;n h&amp;igrave;nh:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;15.6 inch WLED Xbrite (1366x768)&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;Ổ Đĩa:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;DVD+/-RW (DVD/CD read/write)&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;Mạng:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;LAN 10/1000, Wireless 802.11BGN, Bluetooth&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;Pin:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;Lithium Ion 4Cell ~ 4.0 giờ sử dụng&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;Hệ điều h&amp;agrave;nh:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;Windows 8 (64bit)&lt;/p&gt;
&lt;div class=&quot;clearfix&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; clear: both;&quot;&gt;&amp;nbsp;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;row&quot; style=&quot;margin: 0px; padding: 3px 0px 3px 5px; border-width: 0px 0px 1px; border-bottom-style: dotted; border-bottom-color: #cccccc; font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 12px; font-stretch: inherit; line-height: 17px; vertical-align: baseline; color: #414141;&quot;&gt;&lt;span class=&quot;fea_title&quot; style=&quot;margin: 0px; padding: 0px 0px 0px 10px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: bold; font-stretch: inherit; line-height: inherit; vertical-align: baseline; display: block; float: left; width: 140px; background: none;&quot;&gt;Thiết bị kh&amp;aacute;c:&lt;/span&gt;
&lt;p class=&quot;fea_content&quot; style=&quot;margin: 0px; padding: 0px; border: 0px; font-family: inherit; font-size: inherit; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: baseline; float: left; width: 250px;&quot;&gt;Webcam 1.3MP, 03 USB3.0, HDMI, 4 in 1 (SD/MMC/MS/MS Pro),&lt;/p&gt;
&lt;/div&gt;', 16799000.0000, 5, 8, 6, 0, 2, N'USA')
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[TypeProducts] ON 

INSERT [dbo].[TypeProducts] ([TypeID], [TypeName]) VALUES (1, N'Core i3             ')
INSERT [dbo].[TypeProducts] ([TypeID], [TypeName]) VALUES (2, N'Core i5             ')
INSERT [dbo].[TypeProducts] ([TypeID], [TypeName]) VALUES (3, N'Core i7             ')
SET IDENTITY_INSERT [dbo].[TypeProducts] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([f_ID], [f_Username], [f_Password], [f_Name], [f_Email], [f_DOB], [f_Permission]) VALUES (10, N'tdkhuyen', N'D11044A6B30E846D75F83FC29437BF0B', N'Anh Hai', N'tdkhuyen@g.c', CAST(0x0000A41700000000 AS DateTime), 0)
INSERT [dbo].[Users] ([f_ID], [f_Username], [f_Password], [f_Name], [f_Email], [f_DOB], [f_Permission]) VALUES (12, N'admin1', N'E00CF25AD42683B3DF678C61F42C6BDA', N'Admin', N'admin@gmail.com', CAST(0x0000A41600000000 AS DateTime), 1)
INSERT [dbo].[Users] ([f_ID], [f_Username], [f_Password], [f_Name], [f_Email], [f_DOB], [f_Permission]) VALUES (13, N'tdkhuyen2', N'E5241341021DF1EB2F7AA5FD149576CB', N'tdkhuyen2', N'tdkhuyen2@g.c', CAST(0x0000A41600000000 AS DateTime), 0)
INSERT [dbo].[Users] ([f_ID], [f_Username], [f_Password], [f_Name], [f_Email], [f_DOB], [f_Permission]) VALUES (16, N'phatphat', N'D3C883C17BC8560F3295B3DE68F345EE', N'phatphat', N'phatphat@v.c', CAST(0x0000A47500000000 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [f_Permission]
GO
USE [master]
GO
ALTER DATABASE [QLBH] SET  READ_WRITE 
GO
