USE [master]
GO
/****** Object:  Database [CTQLSach]    Script Date: 12/19/2021 1:38:30 PM ******/
CREATE DATABASE [CTQLSach]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLSach_Data', FILENAME = N'D:\PHÁT TRIỂN ỨNG DỤNG\QLSach_Data.mdf' , SIZE = 20480KB , MAXSIZE = 51200KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLSach_Log', FILENAME = N'D:\PHÁT TRIỂN ỨNG DỤNG\QLSach_Log.ldf' , SIZE = 10240KB , MAXSIZE = 15360KB , FILEGROWTH = 1024KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CTQLSach] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CTQLSach].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CTQLSach] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CTQLSach] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CTQLSach] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CTQLSach] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CTQLSach] SET ARITHABORT OFF 
GO
ALTER DATABASE [CTQLSach] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CTQLSach] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CTQLSach] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CTQLSach] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CTQLSach] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CTQLSach] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CTQLSach] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CTQLSach] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CTQLSach] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CTQLSach] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CTQLSach] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CTQLSach] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CTQLSach] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CTQLSach] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CTQLSach] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CTQLSach] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CTQLSach] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CTQLSach] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CTQLSach] SET  MULTI_USER 
GO
ALTER DATABASE [CTQLSach] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CTQLSach] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CTQLSach] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CTQLSach] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CTQLSach] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CTQLSach] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CTQLSach] SET QUERY_STORE = OFF
GO
USE [CTQLSach]
GO
/****** Object:  Table [dbo].[CT_HoaDon]    Script Date: 12/19/2021 1:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_HoaDon](
	[maHoaDon] [nvarchar](50) NOT NULL,
	[maSach] [nvarchar](10) NOT NULL,
	[soLuong] [int] NULL,
	[donGia] [money] NULL,
	[thanhTien] [money] NULL,
 CONSTRAINT [CTHD_PK] PRIMARY KEY CLUSTERED 
(
	[maHoaDon] ASC,
	[maSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/19/2021 1:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[maHoaDon] [nvarchar](50) NOT NULL,
	[maNhanVien] [nvarchar](50) NOT NULL,
	[ngayLapHD] [date] NOT NULL,
	[maKhachHang] [nvarchar](50) NULL,
	[tongTien] [money] NULL,
	[ghiChu] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[maHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/19/2021 1:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[maKhachHang] [nvarchar](50) NOT NULL,
	[tenKhachHang] [nvarchar](80) NOT NULL,
	[sdt] [varchar](12) NULL,
	[diaChi] [nvarchar](80) NULL,
PRIMARY KEY CLUSTERED 
(
	[maKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 12/19/2021 1:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[maNCC] [nvarchar](50) NOT NULL,
	[tenNCC] [nvarchar](80) NOT NULL,
	[diaChi] [nvarchar](80) NULL,
	[sdt] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[maNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 12/19/2021 1:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[maNhanVien] [nvarchar](50) NOT NULL,
	[tenNhanVien] [nvarchar](80) NOT NULL,
	[ngaySinh] [date] NOT NULL,
	[ngayDauLamViec] [date] NOT NULL,
	[sdt] [varchar](12) NULL,
	[email] [nvarchar](50) NULL,
	[gioiTinh] [bit] NOT NULL,
	[diaChi] [nvarchar](80) NOT NULL,
	[chucVu] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sach]    Script Date: 12/19/2021 1:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[maSach] [nvarchar](10) NOT NULL,
	[tenSach] [nvarchar](80) NOT NULL,
	[maLoai] [nvarchar](50) NOT NULL,
	[donGia] [money] NOT NULL,
	[namXuatBan] [int] NULL,
	[namSanXuat] [int] NULL,
	[maNCC] [nvarchar](50) NULL,
	[tenTacGia] [nvarchar](80) NOT NULL,
	[soLuong] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 12/19/2021 1:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[maNhanVien] [nvarchar](50) NOT NULL,
	[tenDangNhap] [nvarchar](80) NOT NULL,
	[matKhau] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 12/19/2021 1:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[maLoai] [nvarchar](50) NOT NULL,
	[tenTheLoai] [nvarchar](80) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CT_HoaDon]  WITH CHECK ADD  CONSTRAINT [CTHD_FK] FOREIGN KEY([maHoaDon])
REFERENCES [dbo].[HoaDon] ([maHoaDon])
GO
ALTER TABLE [dbo].[CT_HoaDon] CHECK CONSTRAINT [CTHD_FK]
GO
ALTER TABLE [dbo].[CT_HoaDon]  WITH CHECK ADD  CONSTRAINT [CTHDS_FK] FOREIGN KEY([maSach])
REFERENCES [dbo].[Sach] ([maSach])
GO
ALTER TABLE [dbo].[CT_HoaDon] CHECK CONSTRAINT [CTHDS_FK]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([maKhachHang])
REFERENCES [dbo].[KhachHang] ([maKhachHang])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([maNhanVien])
REFERENCES [dbo].[NhanVien] ([maNhanVien])
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD FOREIGN KEY([maLoai])
REFERENCES [dbo].[TheLoai] ([maLoai])
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD FOREIGN KEY([maNCC])
REFERENCES [dbo].[NhaCungCap] ([maNCC])
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD FOREIGN KEY([maNhanVien])
REFERENCES [dbo].[NhanVien] ([maNhanVien])
GO
USE [master]
GO
ALTER DATABASE [CTQLSach] SET  READ_WRITE 
GO
