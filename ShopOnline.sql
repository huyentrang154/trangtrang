USE [master]
GO
/****** Object:  Database [ShopOnline]    Script Date: 7/9/2021 10:14:29 AM ******/
CREATE DATABASE [ShopOnline]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopOnline', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShopOnline.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopOnline_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShopOnline_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShopOnline] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopOnline].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopOnline] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopOnline] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopOnline] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopOnline] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopOnline] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopOnline] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopOnline] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopOnline] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopOnline] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopOnline] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopOnline] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopOnline] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopOnline] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopOnline] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopOnline] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShopOnline] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopOnline] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopOnline] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopOnline] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopOnline] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopOnline] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopOnline] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopOnline] SET RECOVERY FULL 
GO
ALTER DATABASE [ShopOnline] SET  MULTI_USER 
GO
ALTER DATABASE [ShopOnline] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopOnline] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopOnline] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopOnline] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopOnline] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopOnline] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShopOnline', N'ON'
GO
ALTER DATABASE [ShopOnline] SET QUERY_STORE = OFF
GO
USE [ShopOnline]
GO
/****** Object:  User [CHUHUONG]    Script Date: 7/9/2021 10:14:30 AM ******/
CREATE USER [CHUHUONG] FOR LOGIN [CHUHUONG] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 7/9/2021 10:14:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDM] [int] NOT NULL,
	[TenDM] [nvarchar](50) NULL,
	[SL] [int] NULL,
 CONSTRAINT [PK_DanhMuc] PRIMARY KEY CLUSTERED 
(
	[MaDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 7/9/2021 10:14:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [varchar](10) NOT NULL,
	[TenSP] [nvarchar](100) NULL,
	[UrlAnh] [nvarchar](50) NULL,
	[GiaSP] [int] NULL,
	[MoTa] [nvarchar](max) NULL,
	[MaDM] [int] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[SanPhamView]    Script Date: 7/9/2021 10:14:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SanPhamView]
AS
SELECT     dbo.SanPham.MaSP, dbo.SanPham.TenSP, dbo.SanPham.UrlAnh, dbo.SanPham.GiaSP, dbo.SanPham.MoTa, dbo.SanPham.MaDM, dbo.DanhMuc.TenDM
FROM         dbo.DanhMuc INNER JOIN
                      dbo.SanPham ON dbo.DanhMuc.MaDM = dbo.SanPham.MaDM
GO
/****** Object:  Table [dbo].[ChiTietHD]    Script Date: 7/9/2021 10:14:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHD](
	[MaHD] [int] NOT NULL,
	[MaSP] [varchar](10) NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [bigint] NOT NULL,
 CONSTRAINT [PK_CHITIETHD] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 7/9/2021 10:14:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[NgayHD] [date] NULL,
	[Hoten] [nvarchar](30) NULL,
	[DiaChi] [nvarchar](30) NULL,
	[DienThoai] [varchar](12) NULL,
	[Email] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](max) NULL,
	[Status] [smallint] NULL,
 CONSTRAINT [PK_tblHOADON] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 7/9/2021 10:14:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[UserName] [varchar](30) NOT NULL,
	[PassWord] [varchar](50) NULL,
	[HoTen] [nvarchar](50) NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/9/2021 10:14:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[IDRole] [int] NOT NULL,
	[RoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[IDRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInRole]    Script Date: 7/9/2021 10:14:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInRole](
	[UserName] [varchar](10) NOT NULL,
	[IDRole] [int] NOT NULL,
 CONSTRAINT [PK_UserInRole] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC,
	[IDRole] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (24, N' AsusNJ56', 1, 5690000)
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (24, N'IPhone6', 1, 6000000)
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (25, N'IPhone6', 5, 6000000)
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (201000, N'GalaxyA10s', 1, 2490)
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (201000, N'IPhone6', 1, 5200)
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (201001, N'iPhone6', 1, 5200)
INSERT [dbo].[ChiTietHD] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (201001, N'OPPOA5s', 1, 6300)
GO
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [SL]) VALUES (1, N'CDB', 0)
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [SL]) VALUES (2, N'Desktop', 2)
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [SL]) VALUES (3, N'Máy tính xách tay (Laptop)', NULL)
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [SL]) VALUES (4, N'ABC', 0)
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [SL]) VALUES (5, N'Test', NULL)
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [SL]) VALUES (6, N'Keyboard', NULL)
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [SL]) VALUES (7, N'Mouse - Chuột -- ABC', NULL)
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [SL]) VALUES (8, N'Mobile Phones new sa', NULL)
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [NgayHD], [Hoten], [DiaChi], [DienThoai], [Email], [GhiChu], [Status]) VALUES (1, CAST(N'2016-02-17' AS Date), N'A', N'ádfds', N'B', N'sf', NULL, 1)
INSERT [dbo].[HoaDon] ([MaHD], [NgayHD], [Hoten], [DiaChi], [DienThoai], [Email], [GhiChu], [Status]) VALUES (2, CAST(N'2016-02-19' AS Date), N'TH15', N'HQV', N'9087654321', N'TH15@mta.edu.vn', NULL, 1)
INSERT [dbo].[HoaDon] ([MaHD], [NgayHD], [Hoten], [DiaChi], [DienThoai], [Email], [GhiChu], [Status]) VALUES (3, CAST(N'2016-04-13' AS Date), N'a', N'rterytry', N'4346436', N'wtrey', NULL, 1)
INSERT [dbo].[HoaDon] ([MaHD], [NgayHD], [Hoten], [DiaChi], [DienThoai], [Email], [GhiChu], [Status]) VALUES (4, CAST(N'2016-04-13' AS Date), N'Chu Thi H][ngf', N'ABC', N'34365487658', N'huongktqs@gmail.com', NULL, 1)
INSERT [dbo].[HoaDon] ([MaHD], [NgayHD], [Hoten], [DiaChi], [DienThoai], [Email], [GhiChu], [Status]) VALUES (5, CAST(N'2016-04-14' AS Date), N'HUng', N'564576', N'26456457', N'54543', NULL, 1)
INSERT [dbo].[HoaDon] ([MaHD], [NgayHD], [Hoten], [DiaChi], [DienThoai], [Email], [GhiChu], [Status]) VALUES (6, CAST(N'2016-04-14' AS Date), N'HUng', N'56546', N'54745', N'45456', NULL, 1)
INSERT [dbo].[HoaDon] ([MaHD], [NgayHD], [Hoten], [DiaChi], [DienThoai], [Email], [GhiChu], [Status]) VALUES (7, CAST(N'2016-04-14' AS Date), N'Nguyen Cong Minh', N'etret', N'12345', N'trytu', NULL, 1)
INSERT [dbo].[HoaDon] ([MaHD], [NgayHD], [Hoten], [DiaChi], [DienThoai], [Email], [GhiChu], [Status]) VALUES (8, CAST(N'2019-10-18' AS Date), N'Thi Huong Chu', N'236 Hoang Quoc Viet, Cau Giay', N'0973080942', N'huongktqs@gmail.com', NULL, 1)
INSERT [dbo].[HoaDon] ([MaHD], [NgayHD], [Hoten], [DiaChi], [DienThoai], [Email], [GhiChu], [Status]) VALUES (9, CAST(N'2019-10-25' AS Date), N'Thi Huong Chu', N'236 Hoang Quoc Viet, Cau Giay', N'0973080942', N'huongktqs@gmail.com', NULL, 1)
INSERT [dbo].[HoaDon] ([MaHD], [NgayHD], [Hoten], [DiaChi], [DienThoai], [Email], [GhiChu], [Status]) VALUES (10, CAST(N'2019-11-01' AS Date), N'Thi Huong Chu', N'236 Hoang Quoc Viet, Cau Giay', N'0973080942', N'huongktqs@gmail.com', NULL, 1)
INSERT [dbo].[HoaDon] ([MaHD], [NgayHD], [Hoten], [DiaChi], [DienThoai], [Email], [GhiChu], [Status]) VALUES (11, CAST(N'2020-05-18' AS Date), N'Chu Thị Hường', N'236 Hoàng Quốc Việt', N'0973080 942', N'huongktqs@gmail.com', N' àdsfds', 0)
INSERT [dbo].[HoaDon] ([MaHD], [NgayHD], [Hoten], [DiaChi], [DienThoai], [Email], [GhiChu], [Status]) VALUES (12, CAST(N'2020-05-18' AS Date), N'Chu Thị Hường', N'236 Hoàng Quốc Việt', N'0973080942', N'huongktqs@gmail.com', N' Giao vào ngày trong tuần', 0)
INSERT [dbo].[HoaDon] ([MaHD], [NgayHD], [Hoten], [DiaChi], [DienThoai], [Email], [GhiChu], [Status]) VALUES (13, CAST(N'2020-05-18' AS Date), N'Chu Thị Hường', N'236 Hoàng Quốc Việt', N'0973080942', N'huongktqs@gmail.com', N' Giao vào ngày trong tuần', 0)
INSERT [dbo].[HoaDon] ([MaHD], [NgayHD], [Hoten], [DiaChi], [DienThoai], [Email], [GhiChu], [Status]) VALUES (14, CAST(N'2020-05-18' AS Date), N'Nguyễn Văn Mạnh', N'128 Lê Duẩn', N'0983546546', N'manh@gmail.com', N' Sau giờ hành chính', 0)
INSERT [dbo].[HoaDon] ([MaHD], [NgayHD], [Hoten], [DiaChi], [DienThoai], [Email], [GhiChu], [Status]) VALUES (15, CAST(N'2020-05-18' AS Date), N'Nguyễn Văn Mạnh', N'128 Lê Duẩn', N'0983546546', N'huongktqs@gmail.com', N' dsfdsg', 0)
INSERT [dbo].[HoaDon] ([MaHD], [NgayHD], [Hoten], [DiaChi], [DienThoai], [Email], [GhiChu], [Status]) VALUES (16, CAST(N'2020-05-18' AS Date), N'Chu Thị Hường', N'236 Hoàng Quốc Việt', N'0973080942', N'huongktqs@gmail.com', N' Ban ngày', 0)
INSERT [dbo].[HoaDon] ([MaHD], [NgayHD], [Hoten], [DiaChi], [DienThoai], [Email], [GhiChu], [Status]) VALUES (17, CAST(N'2020-05-18' AS Date), N'Chu Thị Hường', N'236 Hoàng Quốc Việt', N'0973080942', N'huongktqs@gmail.com', N' Ngoài giờ hành chính', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayHD], [Hoten], [DiaChi], [DienThoai], [Email], [GhiChu], [Status]) VALUES (18, CAST(N'2020-05-18' AS Date), N'Chu Thị Hường', N'236 Hoàng Quốc Việt', N'0973080942', N'huongktqs@gmail.com', N' Ban ngày', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayHD], [Hoten], [DiaChi], [DienThoai], [Email], [GhiChu], [Status]) VALUES (19, CAST(N'2020-05-18' AS Date), N'Nguyễn Văn Mạnh', N'128 Lê Duẩn', N'0983546546', N'huongktqs@gmail.com', N' Ngoài giờ hành chính', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayHD], [Hoten], [DiaChi], [DienThoai], [Email], [GhiChu], [Status]) VALUES (20, CAST(N'2020-05-21' AS Date), N'Chu Thị Hường', N'236 Hoàng Quốc Việt', N'0973080942', N'huongktqs@gmail.com', N' Giao hàng vào giờ hành chính', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayHD], [Hoten], [DiaChi], [DienThoai], [Email], [GhiChu], [Status]) VALUES (21, CAST(N'2020-05-26' AS Date), N'Nguyễn Văn Huy', N'236 Hoàng Quốc Việt', N'093545456', N'huongktqs@gmail.com', N'Giao hàng trong giờ hành chính', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayHD], [Hoten], [DiaChi], [DienThoai], [Email], [GhiChu], [Status]) VALUES (22, CAST(N'2020-05-26' AS Date), N'Trần Văn An', N'236 Hoàng Quốc Việt', N'2248779787', N'huongktqs@gmail.com', N' Vào giò HC', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayHD], [Hoten], [DiaChi], [DienThoai], [Email], [GhiChu], [Status]) VALUES (23, CAST(N'2020-10-19' AS Date), N'Chu Thị Hường', N'236 Hoàng Quốc Việt', N'0973080942', N'huongktqs@gmail.com', N' ABC', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayHD], [Hoten], [DiaChi], [DienThoai], [Email], [GhiChu], [Status]) VALUES (24, CAST(N'2020-10-19' AS Date), N'Chu Thị Hường', N'236 Hoàng Quốc Việt', N'0973080942', N'huongktqs@gmail.com', N' adsf', NULL)
INSERT [dbo].[HoaDon] ([MaHD], [NgayHD], [Hoten], [DiaChi], [DienThoai], [Email], [GhiChu], [Status]) VALUES (25, CAST(N'2021-04-06' AS Date), N'Nguyễn Văn Mạnh', N'236 Hoàng Quốc Việt', N'0973080942', N'huongktqs@gmail.com', N' qewtrewt', NULL)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
INSERT [dbo].[NguoiDung] ([UserName], [PassWord], [HoTen]) VALUES (N'Admin', N'123', N'Nguyễn Văn Anh')
INSERT [dbo].[NguoiDung] ([UserName], [PassWord], [HoTen]) VALUES (N'antran', N'1234', N'Nguyeenx Vawn An')
INSERT [dbo].[NguoiDung] ([UserName], [PassWord], [HoTen]) VALUES (N'Hung', N'123', N'Nguyễn Trần Hùng')
INSERT [dbo].[NguoiDung] ([UserName], [PassWord], [HoTen]) VALUES (N'Huongct', N'123', N'Chu Thị Hường')
GO
INSERT [dbo].[Roles] ([IDRole], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([IDRole], [RoleName]) VALUES (2, N'Custommer')
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlAnh], [GiaSP], [MoTa], [MaDM]) VALUES (N' Asus', N'Laptop Asus Vivobook ', N'feature-pic1.jpg', 12990000, N'Đặc điểm nổi bật của Asus Vivobook A412FA i3 8145U/4GB/512GB (EK342T)', 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlAnh], [GiaSP], [MoTa], [MaDM]) VALUES (N' AsusNJ56', N'Laptop Asus Vivobook ', N'new-pic1.jpg', 5000000, N'5000000', 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlAnh], [GiaSP], [MoTa], [MaDM]) VALUES (N'AS', N'Laptop Asus ', N'sen-voi-inax-lfv-1111s-bfv-1113s-8c-450x450.jpg', 1200000, N'Sen vòi', 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlAnh], [GiaSP], [MoTa], [MaDM]) VALUES (N'GalaxyA10s', N'Samsung Galaxy A10s', N'feature-pic2.jpg', 5690000, N'Đặc điểm nổi bật của Samsung Galaxy A10s', 8)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlAnh], [GiaSP], [MoTa], [MaDM]) VALUES (N'IPhone6', N'Điện thoại Iphone 6', N'feature-pic1.jpg', 6000000, N'Đặc điểm nổi bật của OPPO A5s', 8)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlAnh], [GiaSP], [MoTa], [MaDM]) VALUES (N'OPPOA5s', N'Điện thoại OPPO A5s', N'feature-pic4.jpg', 3690000, N'Đặc điểm nổi bật của OPPO A5s', 8)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [UrlAnh], [GiaSP], [MoTa], [MaDM]) VALUES (N'OPPOA6s', N'Điện thoại OPPO A6s', N'new-pic2.jpg', 5000000, N'Đặc điểm nổi bật của OPPO A5s', 2)
GO
INSERT [dbo].[UserInRole] ([UserName], [IDRole]) VALUES (N'Admin', 1)
INSERT [dbo].[UserInRole] ([UserName], [IDRole]) VALUES (N'Hung', 2)
INSERT [dbo].[UserInRole] ([UserName], [IDRole]) VALUES (N'Huongct', 1)
INSERT [dbo].[UserInRole] ([UserName], [IDRole]) VALUES (N'Huongct', 2)
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHD_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK_ChiTietHD_SanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_DanhMuc] FOREIGN KEY([MaDM])
REFERENCES [dbo].[DanhMuc] ([MaDM])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_DanhMuc]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD CHECK  (([Status]<(18)))
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [CK_SanPham] CHECK  (([GiaSP]>(0)))
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [CK_SanPham]
GO
/****** Object:  StoredProcedure [dbo].[CreateDM]    Script Date: 7/9/2021 10:14:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[CreateDM]
@MaDM int,
@TenDM nvarchar(50)
As
Begin

INSERT INTO DanhMuc
           ([MaDM]
           ,[TenDM])
     VALUES
           (@MaDM, @TenDM)
End
GO
/****** Object:  StoredProcedure [dbo].[DeleteDM]    Script Date: 7/9/2021 10:14:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[DeleteDM]
	@MaDM int
AS
BEGIN
	Delete from DanhMuc Where MaDM=@MaDM
END
GO
/****** Object:  StoredProcedure [dbo].[GetSach]    Script Date: 7/9/2021 10:14:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[GetSach]
@MaTL varchar(5), 
@Ten nvarchar

As
Begin
	Select * from SACH where (MaTL=@MaTL) and (TenSach like '%'+@Ten+'%')
End
GO
/****** Object:  StoredProcedure [dbo].[LocDM]    Script Date: 7/9/2021 10:14:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[LocDM]
@MaDM int
AS
Begin
	select MaSP, TenSP, UrlAnh,
	 case when GiaSP IS NULL then N'Liên hệ' else Convert(nvarchar(30),GiaSP) End As GiaBan 
	from SanPham 
	where MaDM=@MaDM
End
GO
/****** Object:  StoredProcedure [dbo].[prDanhMuc]    Script Date: 7/9/2021 10:14:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[prDanhMuc] 
AS
Begin
  
  Select dm.MaDM, dm.TenDM, COUNT(sp.MaSP) as SoLuong
  From  DanhMuc dm inner join SanPham sp on dm.MaDM=sp.MaDM
  Group By dm.MaDM, dm.TenDM
End
GO
/****** Object:  StoredProcedure [dbo].[proInsertDM]    Script Date: 7/9/2021 10:14:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[proInsertDM]
 @MaDM int,
 @TenDM nvarchar(50)
AS
Begin
INSERT INTO [TestMVC].[dbo].[DanhMuc]
           ([MaDM]
           ,[TenDM])
     VALUES (@MaDM, @TenDM)
 select * from DanhMuc       
End
GO
/****** Object:  StoredProcedure [dbo].[proTheoTenDM]    Script Date: 7/9/2021 10:14:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[proTheoTenDM]
	@TenDM nvarchar(20)
As
Begin
	SELECT     dbo.DanhMuc.MaDM, dbo.DanhMuc.TenDM, dbo.SanPham.MaSP, dbo.SanPham.TenSP, dbo.SanPham.UrlAnh, dbo.SanPham.GiaSP, dbo.SanPham.MoTa, 
                      dbo.SanPham.MaDM AS Expr1
	FROM         dbo.DanhMuc INNER JOIN
                      dbo.SanPham ON dbo.DanhMuc.MaDM = dbo.SanPham.MaDM
	WHERE     (dbo.DanhMuc.TenDM = @TenDM)

End
GO
/****** Object:  StoredProcedure [dbo].[SelectAll]    Script Date: 7/9/2021 10:14:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
Create Proc [dbo].[SelectAll]
As
Begin
SELECT [MaDM],[TenDM]
FROM [DanhMuc]
  
Where TenDM is not Null

End
GO
/****** Object:  StoredProcedure [dbo].[SelectID]    Script Date: 7/9/2021 10:14:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[SelectID]
@MaDM int
As
Begin

Select * from DanhMuc
 WHERE MaDM=@MaDM
End
GO
/****** Object:  StoredProcedure [dbo].[TheoDM]    Script Date: 7/9/2021 10:14:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[TheoDM]
@madm int
As
Begin
SELECT     TOP (100) PERCENT TenSP, MaDM, MaSP, UrlAnh, GiaSP, MoTa
FROM         dbo.SanPham
WHERE     (MaDM = @madm)

End
GO
/****** Object:  StoredProcedure [dbo].[ThongKe]    Script Date: 7/9/2021 10:14:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[ThongKe]

@startDate Date, @EndDate Date
As

Begin

SELECT     dbo.HoaDon.MaHD, SUM(dbo.ChiTietHD.SoLuong * dbo.ChiTietHD.DonGia) AS TongTien, dbo.HoaDon.NgayHD, dbo.HoaDon.Hoten, dbo.HoaDon.DiaChi, 
                      dbo.HoaDon.DienThoai
FROM         dbo.HoaDon INNER JOIN
                      dbo.ChiTietHD ON dbo.HoaDon.MaHD = dbo.ChiTietHD.MaHD
WHERE     dbo.HoaDon.NgayHD BETWEEN @startDate AND @EndDate
GROUP BY dbo.HoaDon.MaHD, dbo.HoaDon.NgayHD, dbo.HoaDon.Hoten, dbo.HoaDon.DiaChi, dbo.HoaDon.DienThoai

End
GO
/****** Object:  StoredProcedure [dbo].[TimGiá]    Script Date: 7/9/2021 10:14:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[TimGiá]
 @Canduoi int,
 @CanTren int
AS
Begin
  select MaSP, TenSP, UrlAnh,
	 case when GiaSP IS NULL then N'Liên hệ' else Convert(nvarchar(30),GiaSP) End As GiaBan 
	from SanPham 
	where GiaSP between @Canduoi and @CanTren
End
GO
/****** Object:  StoredProcedure [dbo].[TimTen]    Script Date: 7/9/2021 10:14:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[TimTen]
 @SearchKey nvarchar(30)
AS
Begin
  select MaSP, TenSP, UrlAnh,
	 case when GiaSP IS NULL then N'Liên hệ' else Convert(nvarchar(30),GiaSP) End As GiaBan 
	from SanPham 
	where TenSP like '%'+@SearchKey+'%'
End
GO
/****** Object:  StoredProcedure [dbo].[TongHD]    Script Date: 7/9/2021 10:14:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[TongHD]
AS
Begin
	select HOADON.MaHD, Hoten, DiaChi, DienThoai, SUM (SoLuong*DonGia) As TongGT
	from HOADON inner join CHITIETHD on HOADON.MaHD=CHITIETHD.MaHD
	Group By HOADON.MaHD, Hoten, DiaChi, DienThoai
End
GO
/****** Object:  StoredProcedure [dbo].[UpdateDM]    Script Date: 7/9/2021 10:14:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[UpdateDM]
@MaDM int,
@TenDM nvarchar(50)
As
Begin

UPDATE [DanhMuc]
   SET TenDM=@TenDM
 WHERE MaDM=@MaDM
End
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[9] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DanhMuc"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 95
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SanPham"
            Begin Extent = 
               Top = 6
               Left = 236
               Bottom = 178
               Right = 396
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 3570
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SanPhamView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SanPhamView'
GO
USE [master]
GO
ALTER DATABASE [ShopOnline] SET  READ_WRITE 
GO
