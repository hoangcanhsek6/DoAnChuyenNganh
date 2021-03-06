USE [master]
GO
/****** Object:  Database [TRACKING_DEFACE]    Script Date: 6/18/2015 1:36:27 AM ******/
CREATE DATABASE [TRACKING_DEFACE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TRACKING_DEFACE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TRACKING_DEFACE.mdf' , SIZE = 5312KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TRACKING_DEFACE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TRACKING_DEFACE_log.ldf' , SIZE = 4736KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TRACKING_DEFACE] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TRACKING_DEFACE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TRACKING_DEFACE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TRACKING_DEFACE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TRACKING_DEFACE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TRACKING_DEFACE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TRACKING_DEFACE] SET ARITHABORT OFF 
GO
ALTER DATABASE [TRACKING_DEFACE] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TRACKING_DEFACE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TRACKING_DEFACE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TRACKING_DEFACE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TRACKING_DEFACE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TRACKING_DEFACE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TRACKING_DEFACE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TRACKING_DEFACE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TRACKING_DEFACE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TRACKING_DEFACE] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TRACKING_DEFACE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TRACKING_DEFACE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TRACKING_DEFACE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TRACKING_DEFACE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TRACKING_DEFACE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TRACKING_DEFACE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TRACKING_DEFACE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TRACKING_DEFACE] SET RECOVERY FULL 
GO
ALTER DATABASE [TRACKING_DEFACE] SET  MULTI_USER 
GO
ALTER DATABASE [TRACKING_DEFACE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TRACKING_DEFACE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TRACKING_DEFACE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TRACKING_DEFACE] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TRACKING_DEFACE] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TRACKING_DEFACE', N'ON'
GO
USE [TRACKING_DEFACE]
GO
/****** Object:  Table [dbo].[DATA_TRACKING]    Script Date: 6/18/2015 1:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DATA_TRACKING](
	[DataID] [int] NOT NULL,
	[HTTPweb] [nvarchar](25) NULL,
	[Redirect] [nvarchar](25) NULL,
	[IP] [nvarchar](25) NULL,
	[timeCheck] [nvarchar](25) NULL,
	[lengthText] [nvarchar](25) NULL,
	[existsText] [nvarchar](2000) NULL,
	[result] [nvarchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[DataID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EMAIL]    Script Date: 6/18/2015 1:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMAIL](
	[id] [int] NOT NULL,
	[port] [nvarchar](10) NULL,
	[host] [nvarchar](50) NULL,
	[timeSend] [int] NULL,
	[email] [nvarchar](100) NULL,
	[passWords] [nvarchar](100) NULL,
	[enableSSL] [bit] NULL,
	[isHost] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[IMAGE_CONTENT]    Script Date: 6/18/2015 1:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMAGE_CONTENT](
	[ID] [int] NOT NULL,
	[Content] [xml] NULL,
	[WebID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TEXT_CONTENT]    Script Date: 6/18/2015 1:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TEXT_CONTENT](
	[ContentID] [int] NOT NULL,
	[Content] [ntext] NULL,
	[TimeCheck] [datetime] NULL,
	[TextResult] [nvarchar](255) NULL,
	[WebID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[USERS]    Script Date: 6/18/2015 1:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[UserID] [int] NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[PassWords] [nvarchar](50) NULL,
	[FullName] [nvarchar](100) NULL,
	[Email] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WEB]    Script Date: 6/18/2015 1:36:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WEB](
	[WebID] [int] NOT NULL,
	[NameSite] [nvarchar](200) NULL,
	[URL] [nvarchar](200) NULL,
	[IPPublic] [nvarchar](15) NULL,
	[IPPrivate] [nvarchar](15) NULL,
	[WebPriority] [int] NULL,
	[Phones] [nvarchar](15) NULL,
	[Emails] [nvarchar](50) NULL,
	[searchText] [nvarchar](2000) NULL,
	[WebStatus] [nvarchar](20) NULL,
	[BanText] [nvarchar](2000) NULL,
	[isEnable] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[WebID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[EMAIL] ([id], [port], [host], [timeSend], [email], [passWords], [enableSSL], [isHost]) VALUES (1, N'587', N'smtp.gmail.com', 10000, N'hoangcanhsek6@gmail.com', N'hoangcanh', 1, 1)
INSERT [dbo].[IMAGE_CONTENT] ([ID], [Content], [WebID]) VALUES (1, N'<ArrayOfString xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><string>http://www.quan2.hochiminhcity.gov.vn//_layouts/images/gosearch.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//Hnh nh bn tin/banner-40nam.png</string><string>http://www.quan2.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/123image_gallery.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/bangtinq2-13-page-001.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn/_Layouts/LacVietBio/eofficeimg/hotnewsdefault.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/photo_daiquangminh.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/duoc-pham.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/tu%20sach%20pl.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/chủ%20tọa%20hoi%20%20nghi.JPG</string><string>http://www.quan2.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/1614769.JPG</string><string>http://quan2.hochiminhcity.gov.vn/Hnh%20nh%20bn%20tin/2015-6/12234500000.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://quan2.hochiminhcity.gov.vn/Hnh nh bn tin/Banner tong hop/hien phap VN.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://quan2.hochiminhcity.gov.vn/Hnh%20nh%20bn%20tin/dao-duc-ho-chi-minh.jpg</string><string>http://quan2.hochiminhcity.gov.vn/Hnh%20nh%20bn%20tin/dhdang.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/tu%20sach%20pl.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/duoc-pham.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/123image_gallery.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/image1%20(35).JPG</string><string>http://www.quan2.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/photo_daiquangminh.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/RightMenu/VanbanchidaoDH.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/RightMenu/nghiquyetcuadang.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/RightMenu/xuctiendaututhm.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/RightMenu/Tracuuhosohanhchinh.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/RightMenu/dangkyhokinhdoang.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/RightMenu/hopthu.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/RightMenu/thongtintruyenthong.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/RightMenu/lichlanhdao.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/RightMenu/diembao.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/RightMenu/thongbao.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/RightMenu/LOGO CS PCCC CHINH SUA.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/RightMenu/Tiep%20nhan%20phan%20anh.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/RightMenu/banner-lds.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan2.hochiminhcity.gov.vn/Th%20vin%20hnh%20nh/Bộ%20sưu%20tập%20ảnh/_w/IMG_0010(1)_jpg.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn/Th%20vin%20hnh%20nh/Bộ%20sưu%20tập%20ảnh/_w/HO%20TRO%20VON%20DN%20(3)_jpg.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn/Th%20vin%20hnh%20nh/Bộ%20sưu%20tập%20ảnh/_w/CT30%20(3)_JPG.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn/Th%20vin%20hnh%20nh/Bộ%20sưu%20tập%20ảnh/_w/CT30%20(2)_JPG.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn/Th%20vin%20hnh%20nh/Bộ%20sưu%20tập%20ảnh/_w/CT30%20(1)_JPG.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn/Th%20vin%20hnh%20nh/Bộ%20sưu%20tập%20ảnh/_w/Hội%20nghị%20điển%20hình%20tiên%20tiến%20tại%20phường%20Cát%20Lái_jpg.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn/Th%20vin%20hnh%20nh/Bộ%20sưu%20tập%20ảnh/_w/HO%20TRO%20VON%20DN%20(2)_jpg.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn/Th%20vin%20hnh%20nh/Bộ%20sưu%20tập%20ảnh/_w/CB%20TTBDCT%2011032755_560920560677154_377164257141507553_n_jpg.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn/Th%20vin%20hnh%20nh/Bộ%20sưu%20tập%20ảnh/_w/3_jpg_jpg.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn/Th%20vin%20hnh%20nh/Bộ%20sưu%20tập%20ảnh/_w/HO%20TRO%20VON%20DN%20(1)_jpg.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn/Th%20vin%20hnh%20nh/Bộ%20sưu%20tập%20ảnh/_w/Họp%20mặt%20kiều%20bào%20mừng%20xuân%20Ất%20Mùi%202015_jpg.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//RightMenuHinhQuangCao/CHAO MUNG DH DANG 12-2014.JPG</string><string>http://www.quan2.hochiminhcity.gov.vn//RightMenuHinhQuangCao/hcm2014.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//RightMenuHinhQuangCao/nguoi-viet-dung-hang-viet.png</string><string>http://www.quan2.hochiminhcity.gov.vn//RightMenuHinhQuangCao/Tien-toi-DH-mat tran-to-quoc.png</string><string>http://www.quan2.hochiminhcity.gov.vn//RightMenuHinhQuangCao/cmdhhlhtnq2.png</string><string>http://www.quan2.hochiminhcity.gov.vn//RightMenuHinhQuangCao/cai cach hanh chinh.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//RightMenuHinhQuangCao/thuchienatgt.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//RightMenuHinhQuangCao/dmdiB.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//RightMenuHinhQuangCao/30-4-1-5-2014.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//RightMenuHinhQuangCao/60_nam_dbp.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//RightMenuHinhQuangCao/TTHCkhung.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//RightMenuHinhQuangCao/banner1.png</string><string>http://www.quan2.hochiminhcity.gov.vn//RightMenuHinhQuangCao/HPN.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//RightMenuHinhQuangCao/banner3.png</string><string>http://www.quan2.hochiminhcity.gov.vn//RightMenuHinhQuangCao/banner4.png</string><string>http://www.quan2.hochiminhcity.gov.vn//RightMenuHinhQuangCao/hlg.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//RightMenuHinhQuangCao/banner7.png</string><string>http://www.quan2.hochiminhcity.gov.vn//RightMenuHinhQuangCao/CAO%20DANG%20NGHE.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//RightMenuHinhQuangCao/duan.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//RightMenuHinhQuangCao/cchc.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//RightMenuHinhQuangCao/MEDINET.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//RightMenuHinhQuangCao/doan-thanh-nien.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//RightMenuHinhQuangCao/Thua-phat-lai.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//RightMenuHinhQuangCao/hien mau.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//RightMenuHinhQuangCao/Bien dao.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//RightMenuHinhQuangCao/chuc-mung-nam-moi.jpg</string><string>http://www.quan2.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//_layouts/images/gosearch.gif</string><string>http://www.quan2.hochiminhcity.gov.vn//_layouts/images/titlegraphic.gif</string><string>829cc256347bc22df031ac30b780bbba</string><string>6ff852dd47b09ac4f92fe57885a3339e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>36549f91728c6e406282d21c28bf9324</string><string>26be8716c76f5000e861419bb7cdffeb</string><string>02635891d99367bb65de611ca6ac57eb</string><string>0301b6644c0a472320163e32d8101452</string><string>2f3efbfcd49ba5f11e6789bd7f51a37a</string><string>d186238f6ea50e71203a76a6a9777381</string><string>e6465d4fc72b17f3bd0f1c537c985b13</string><string>f8a2d8d499fc72acdf8fbae752a0940e</string><string>0a2d2a5bfd769f19e2cc1db69c6e230b</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>b51c8343a0f1c935fe273ef8c6b3e15e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>d485f9303d7bc8e6ab6a944b742f2a35</string><string>d1fbc39d9d992d8bdcda3710be12cac7</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>d186238f6ea50e71203a76a6a9777381</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>2f3efbfcd49ba5f11e6789bd7f51a37a</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>36549f91728c6e406282d21c28bf9324</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>2cf71b3c96bdf10222fa6b52a2ad190a</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>0301b6644c0a472320163e32d8101452</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>6db4361d184358571b9deeda72a19628</string><string>33cf89d0b955396d05882453b8948f32</string><string>c219577747e06763142c61f9edf53888</string><string>1545dafdd21503fa5e5d28d707b439e5</string><string>5dccd82f89a9d349e29d398fc8ce2a5b</string><string>032977e4d175698ffc140a9c22a4212c</string><string>9a4dc0076b3dbb18079df64381086637</string><string>583dfe6473e30f666a229ccdaf9321fc</string><string>b89a735122fbf072b21d466e671d88a5</string><string>8ade63da537e8e13fdf0ad40efee8e60</string><string>993a61ce986776229a90d02e591852d8</string><string>26cf2df98ca60dd61ac0a03637238839</string><string>be1c9d75bcd738393cb09c026376c3d8</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>f304469190fda45d1818d87ea8654825</string><string>7c8b4358109bfdf6ced774e26253d042</string><string>6fe0a838aefe42f19ac1bc4dbb99571d</string><string>de1e428a527b6bc0bddefd977ef4f15b</string><string>2cf86c50bc87ed36b7c0b53d6ff6d24d</string><string>2c9632cb2cb5d3a72240dfb545a9f340</string><string>e1b0ab3fa80eb555f042d5fb39e386d7</string><string>f02d5d1e6a2b089338f7fe984c1ac0bf</string><string>4136fd0a5e1f2e78868a91facdd59837</string><string>52c3d01185591503683903a2df55ed0e</string><string>d77ff471fce5d99ddab1f790fb961b9b</string><string>033e1aade5eea9edb016c94d24b8a108</string><string>1d53e27b47a0d804d1bf421f6514eb64</string><string>062400d8836c5b2ebb49b068a8b1e1d1</string><string>d838f2cd176efeefede591ae31ee12df</string><string>c3928cd90e9a3eecd2a53025c70d15bd</string><string>a9de93eb925e0a2685402341cb38cfa5</string><string>2c7b274860d7154f053a2ee3965241ef</string><string>833713c966952fbae9fff05159e2bd79</string><string>d8fc0cd513e1275dc6a9ddcffcb6f956</string><string>605707ba075a38f2098feb90e113c7c4</string><string>fc4c1e13f746401ea67ff78b0ba1fb2e</string><string>c3ca27f6d4ef038167b6dc642eeffe13</string><string>6e1c3c6ccc5cb5f02a5803656ae4a041</string><string>35d4fefbc15231fbd3434743acfc1922</string><string>e3fc03423a868d5423e7d142a6d19c8f</string><string>c710817ae022fa62cbf8654e5543ec5d</string><string>e3213c3945cf44da9caa20045ffda7d4</string><string>4234a264b1638ddb04cdcfb2f4fc0981</string><string>d699111079fa83de846370e675c51697</string><string>faf0b9e211d8c3157649384b1e55fb76</string><string>77ad07ef400576e77007dd93399a6de3</string><string>fedfd971514e918e4729dcfbd9199318</string><string>6f99f96a7f6c90dd38d2103d08bdc5b1</string><string>fafff342304f0bb51fc5a71047435790</string><string>3cf033810878cc1c8f754a59e19bac6f</string><string>8e5bb596feafd6d78423b4dfede4da33</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>829cc256347bc22df031ac30b780bbba</string><string>ee6540087771b84ff8d8de074f6807b4</string></ArrayOfString>', 1)
INSERT [dbo].[IMAGE_CONTENT] ([ID], [Content], [WebID]) VALUES (2, N'<ArrayOfString xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><string>http://www.quan1.hochiminhcity.gov.vn/portal/Images/mail.gif</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/Images/home.gif</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/Images/sitemap.gif</string><string>http://www.quan1.hochiminhcity.gov.vn/portal//Images/fw_dotbott.gif</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/News_Images/thumbnail415x270_616201582644909.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/News_Images/thumbnail415x270_518201510041752.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/News_Images/thumbnail415x270_518201510758350.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/News_Images/thumbnail415x270_5182015101739342.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/News_Images/thumbnail415x270_5182015102322683.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/News_Images/thumbnail415x270_642015134221563.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/News_Images/thumbnail415x270_521201516374586.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/News_Images/thumbnail415x270_5212015163239918.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/News_Images/thumbnail54x54_815201492622967.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/News_Images/thumbnail54x54_112201511239523.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/News_Images/thumbnail54x54_1132015913912.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/News_Images/thumbnail54x54_126201515722388.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/News_Images/thumbnail54x54_414201594923939.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/News_Images/thumbnail54x54_5182015102343821.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/./</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/News_Images/thumbnail54x54_616201582744736.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/News_Images/thumbnail54x54_3212015225545790.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/News_Images/thumbnail54x54_3212015225545790.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/News_Images/thumbnail54x54_331201511654191.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/News_Images/thumbnail54x54_331201511654191.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/News_Images/thumbnail54x54_319201510621170.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/News_Images/thumbnail54x54_319201510621170.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/News_Images/thumbnail54x54_3192015132819583.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/News_Images/thumbnail54x54_3192015132819583.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/News_Images/thumbnail54x54_316201581258839.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/News_Images/thumbnail54x54_316201581258839.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal//files/Content_Docs/kehoachsddat2015/sdd2015.png</string><string>http://www.quan1.hochiminhcity.gov.vn/portal//files/Content_Images/quy che quan ly quy hoach.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal//files/Content_Images/TL phong chong tham nhung.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/Portal/files/Content_Images/aaa.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/Portal/files/Content_Images/images.png</string><string>http://www.quan1.hochiminhcity.gov.vn/portal//files/Content_Images/thuaphatlai.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal//files/Content_Images/CONG BAO TP.png</string><string>http://www.quan1.hochiminhcity.gov.vn/portal//files/content_images/CPXD copy.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal//files/content_images/1215200995250921.gif</string><string>http://www.quan1.hochiminhcity.gov.vn/portal//files/content_images/1215200995439531.gif</string><string>http://www.quan1.hochiminhcity.gov.vn/portal//files/content_images/1215200995619437.gif</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/files/Content_Images/duongdaynong.gif</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/files/Content_Images/10142009144913812.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/files/Content_Images/gopyboluatdansu.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/files/Content_Images/ada.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/files/Content_Images/logotuphap.png</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/files/Content_Images/bothutuchanhchinhmoi.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/files/Content_Images/do an thiet ke do thi.png</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/files/Content_Images/quy hoach su dung dat.png</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/files/Content_Images/1900571517.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/files/Content_Images/bothutuchanhchinh.png</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/files/Content_Images/38247247.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/files/Content_Images/1080.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/files/Content_Images/BỘ TIÊU CHÍ QUỐC GIA.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/files/Content_Images/lich ct tuan copy.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/files/Content_Images/bdqh2013.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/files/Content_Images/logo dk thanh tra copy.png</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/files/Content_Images/lay so thu tu sms.png</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/files/Content_Images/cbcc%20than%20thien%204.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal//files/Content_Images/CPXD copy.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/files/Content_Images/mau%20cac%20vb.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal//files/Content_Images/ibhxh.gif</string><string>http://www.quan1.hochiminhcity.gov.vn/portal//files/Content_Images/dacum.gif</string><string>http://www.quan1.hochiminhcity.gov.vn/portal/files/content_images/logo_DA30.png</string><string>http://www.quan1.hochiminhcity.gov.vn/portal//files/content_images/1019200916365593.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal//files/content_images/10192009163716921.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal//files/content_images/1019200916373715.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal//files/content_images/10192009163759484.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal//files/content_images/10302009154916937.jpg</string><string>http://www.quan1.hochiminhcity.gov.vn/portal//files/Content_Images/tuyen_truyen_pl_copy.jpg</string><string>d41d1c81eff492e1b93ad034fa365a79</string><string>17cfb77e01a31481d4c8334ce78b635e</string><string>9e2164bebda8809b157be0e468395d30</string><string>bcaa97ff814375a10292b9b016dd6a58</string><string>20076a2e1e9c8f6a7d09589751ad39aa</string><string>de602b378c5a9e4fb34f73feeed233ee</string><string>32453acf75ae146bd3b2878402fc43fb</string><string>50434453513ca1eb0f0906d869abb0fe</string><string>e0fc07f165b1a4e0e7446ca72b387a98</string><string>cdd1d224a21f29718537fc76016c9fbb</string><string>1185e19ca6e11002a087477d89be3c4f</string><string>22b50510d64c1674d34e81e2a06b712e</string><string>cfa356066fca8aee7c1a66a10a9e39dc</string><string>3d463ff1ed74060ea51dff362258a078</string><string>745e9a7cc55aa9ed7c23abb3ce26c1a1</string><string>5a36a992ae063156edfab6f06479a7e2</string><string>abb34396ab2e4d89d49c0bb3d1f3602e</string><string>7642599335dd26fec6850af63aab344d</string><string>5594bb78de30d117221a42cb6c9cd037</string><string>5816c6de8e1828a21980b910fe812c77</string><string>1cdb523a6fb9242b109d69cfae733774</string><string>1cdb523a6fb9242b109d69cfae733774</string><string>10d0f7068ab80c0e65388bd40461e192</string><string>10d0f7068ab80c0e65388bd40461e192</string><string>3ee0023edc349bc46b3cc550a9a5e96e</string><string>3ee0023edc349bc46b3cc550a9a5e96e</string><string>10832e8c201b501b35b0d6ee7a7caecd</string><string>10832e8c201b501b35b0d6ee7a7caecd</string><string>df814953cda890476a8fbd879a4cec79</string><string>df814953cda890476a8fbd879a4cec79</string><string>06e75f5fbff21b74634f05b9fe9b55b0</string><string>d9cd52469690ec3b27d99e77026a24b5</string><string>abe03c07be391cf452be8639ef8da7da</string><string>f40ffdf4a269783cdfd0a914e255e2da</string><string>c11a2476e2936399eaa42cc11470b632</string><string>c0c097411d63add4c456e6839724c2f2</string><string>324dc74788c2d5be6306b85753b7506f</string><string>1d57d7b78d59c49216e80c377d9636b3</string><string>a3faffebf05f42102c6f20bf85c89cad</string><string>1b7d5fd3353642b0fc72060c14875475</string><string>08e57791904275fae250db29de08f639</string><string>46f3df7ae0faaab45dca1e3046b16787</string><string>928652442014e69284b85541b6638569</string><string>05d06b9cd5ac2ce35503c7bedcd9d3eb</string><string>57d49716e5b13a824b4f1c17db73efc1</string><string>16f850f1724d81eae28d559f9f9bfdeb</string><string>0fe5e86dc4d1d15383a051640f5e1287</string><string>9ac2fcf07118e1e2e979120528f1ac6b</string><string>e59652fc6165a06e773a1f614b2babea</string><string>c49da19abf458f615af9e169b0e44f22</string><string>c79d5a8d53ff1aedaccac84dfcdffa51</string><string>dcb9fa3819fb88511e1ad46d6a850151</string><string>1c3b6c84a522c31032266cac79fe7aec</string><string>6b68477703f5d7263e4f8ef80ab2867b</string><string>db76a2d854c571606476bf34864bd324</string><string>b486392b953fd056a1c08a60004687bb</string><string>e09c7b81777cfda4403e3c0e00b9200c</string><string>1833719fc7d25612c49d766b5f909ed6</string><string>c71d41049032db0cf2d546fbf911ee9d</string><string>1d57d7b78d59c49216e80c377d9636b3</string><string>3a088ccc9c1c08308d2ef512f5efa08d</string><string>0b9fb17c35909135c9f32fa7d528a772</string><string>0587dcaa40868aa5b99304e40a462bf9</string><string>87ed01f08431c53b8d38bd9d67ea3de9</string><string>3329ece4b105b8f7bb8605bc47552328</string><string>e0393bcdbb234a05f0607e190e3c0b07</string><string>a3b169c34b44d9a81cd30f04590400d8</string><string>5c9d0ac76f99e491b45ba9b6c0cb40da</string><string>735c225fa5764edc7c45a3ce6daef37b</string><string>2729b579d49d7634b885b99e7f8aaff0</string></ArrayOfString>', 2)
INSERT [dbo].[IMAGE_CONTENT] ([ID], [Content], [WebID]) VALUES (3, N'<ArrayOfString xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><string>http://www.quan4.hochiminhcity.gov.vn//_layouts/images/gosearch.gif</string><string>http://www.quan4.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan4.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan4.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/BANNERHoithiLSDjpg_new.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/congbao.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/Tiep%20nhan%20phan%20anh.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/hcm.gif</string><string>http://www.quan4.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/layykienduthao.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/thuaphatlai.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/thutuchanhchinh-small.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/congkhaingansach_200.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/htgy.png</string><string>http://www.quan4.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan4.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan4.hochiminhcity.gov.vn//Hnh nh bn tin/banner-40nam.png</string><string>http://www.quan4.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan4.hochiminhcity.gov.vn/_Layouts/LacVietBio/eofficeimg/hotnewsdefault.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn/_Layouts/LacVietBio/eofficeimg/hotnewsdefault.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/hoithaodanso.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/xxld.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn/_Layouts/LacVietBio/eofficeimg/hotnewsdefault.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/ccb.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/DHDN.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/DHP9.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/DHP14.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-3/gop-y-du-thao-vbpl.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan4.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/ccb.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.quan4.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan4.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/hoithaodanso.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.quan4.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan4.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/DHP9.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.quan4.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan4.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2011-10/TVSRAC.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.quan4.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan4.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2013-12/pcccmk.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.quan4.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan4.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan4.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan4.hochiminhcity.gov.vn//RightMenuHinhQuangCao/banner-Hopthu.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn//RightMenuHinhQuangCao/tamguong-hcm.gif</string><string>http://www.quan4.hochiminhcity.gov.vn//RightMenuHinhQuangCao/dichvucong.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn//RightMenuHinhQuangCao/antoangiaothong.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn//RightMenuHinhQuangCao/hoi-dap.png</string><string>http://www.quan4.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan4.hochiminhcity.gov.vn/HNH%20NH%20TUYN%20TRUYN/_w/6-19t5_jpg.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn/HNH%20NH%20TUYN%20TRUYN/_w/4-30t4-2_jpg.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn/HNH%20NH%20TUYN%20TRUYN/_w/3-30t4-1_jpg.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn/HNH%20NH%20TUYN%20TRUYN/_w/2-Gioto_jpg.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn/HNH%20NH%20TUYN%20TRUYN/_w/5-Quoctelaodong_jpg.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn/HNH%20NH%20TUYN%20TRUYN/_w/1-VHcacDantoc_jpg.jpg</string><string>http://www.quan4.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan4.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan4.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan4.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan4.hochiminhcity.gov.vn//_layouts/images/gosearch.gif</string><string>http://www.quan4.hochiminhcity.gov.vn//_layouts/images/titlegraphic.gif</string><string>829cc256347bc22df031ac30b780bbba</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>a7b2285fe775fa4733d5bdaf6621ce80</string><string>d80fd7ea051dc753f35b13e5fa6e19f5</string><string>1bc5ccf5dae8cf6bdf196c72f1679fab</string><string>080402615e4dda57fd1fa170111d1304</string><string>fc0252d8bb4c6c0a191a4218cf29a5f9</string><string>c0c097411d63add4c456e6839724c2f2</string><string>f2f39d9ba1cf613e1a8bff2a2c5d48e8</string><string>13916ee0482bd6d6d94597757daf0ccb</string><string>a941c445d3cce8f6b545a73a79db25c7</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>6ff852dd47b09ac4f92fe57885a3339e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>02635891d99367bb65de611ca6ac57eb</string><string>02635891d99367bb65de611ca6ac57eb</string><string>1575f8f04cb3fa9703c77e62428c9740</string><string>6a6e5dd2024cad669677b6d61d13a78b</string><string>02635891d99367bb65de611ca6ac57eb</string><string>57d5a679beef38723d273eda88f5085c</string><string>5e769ae5f0171f442ff5c3fc6b835516</string><string>5034ecf7ffa34c04aa3e242d751cbded</string><string>433c4e690132cf50809f4fc84e249b37</string><string>3d2567a3b42dee00ba660d4d1c3dee77</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>57d5a679beef38723d273eda88f5085c</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>1575f8f04cb3fa9703c77e62428c9740</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>5034ecf7ffa34c04aa3e242d751cbded</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>21bd71dbf8bdf188523731fd2fab9881</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>f153efd881f8c19e5ffd9d20029bb15d</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>784d2d29d63b4e9f268a0fb41bc9c6ed</string><string>a45afd73810fc645293f6c4b828f146b</string><string>f9d6e79966b024885d23be7358dd2951</string><string>d4418af41f56ef4ed9d93307bb85ce00</string><string>2f991528f8e40e5c4e13f0bad0ace840</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>1417df6ad20c5cff69ace5d4f9d6cf81</string><string>7a16f9829fea5a78e068de955fcacb72</string><string>5f2e8a9578ac40a46417345577f7af34</string><string>c612200d046ccd93c5a32f09b4bb9fee</string><string>97c049e77e41d14236cc7a31f91920cd</string><string>7e6b832c324c1f87bb945743f38d192b</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>829cc256347bc22df031ac30b780bbba</string><string>ee6540087771b84ff8d8de074f6807b4</string></ArrayOfString>', 3)
INSERT [dbo].[IMAGE_CONTENT] ([ID], [Content], [WebID]) VALUES (4, N'<ArrayOfString xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><string>http://www.quan5.hochiminhcity.gov.vn//_layouts/images/gosearch.gif</string><string>http://www.quan5.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan5.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/hcm.gif</string><string>http://www.quan5.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/BACHO.gif</string><string>http://www.quan5.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/BANGGIADAT.png</string><string>http://www.quan5.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/CONGBAO%20(2).png</string><string>http://www.quan5.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/dichvucong.jpg</string><string>http://www.quan5.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan5.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://quan5.hochiminhcity.gov.vn/Hnh%20nh%20bn%20tin/2015-5/chao-mung-dai-hoi-dang.jpg</string><string>http://www.quan5.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan5.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-5/IMG_2533.JPG</string><string>http://www.quan5.hochiminhcity.gov.vn/_Layouts/LacVietBio/eofficeimg/hotnewsdefault.jpg</string><string>http://www.quan5.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-5/a5.JPG</string><string>http://www.quan5.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-4/P1010016.jpg</string><string>http://www.quan5.hochiminhcity.gov.vn/_Layouts/LacVietBio/eofficeimg/hotnewsdefault.jpg</string><string>http://www.quan5.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-4/IMG_9825.JPG</string><string>http://www.quan5.hochiminhcity.gov.vn/_Layouts/LacVietBio/eofficeimg/hotnewsdefault.jpg</string><string>http://www.quan5.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-4/IMG_9253.JPG</string><string>http://www.quan5.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-4/banner-40nam.png</string><string>http://www.quan5.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan5.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.quan5.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan5.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan5.hochiminhcity.gov.vn//RightMenuHinhQuangCao/Lichlamviec.jpg</string><string>http://www.quan5.hochiminhcity.gov.vn//RightMenuHinhQuangCao/TTHCchung1.jpg</string><string>http://www.quan5.hochiminhcity.gov.vn//RightMenuHinhQuangCao/y-kien-nguoi-dan_06.jpg</string><string>http://www.quan5.hochiminhcity.gov.vn//RightMenuHinhQuangCao/gopynew.jpg</string><string>http://www.quan5.hochiminhcity.gov.vn//RightMenuHinhQuangCao/tnpa.jpg</string><string>http://www.quan5.hochiminhcity.gov.vn//RightMenuHinhQuangCao/thuaphatlai.jpg</string><string>http://www.quan5.hochiminhcity.gov.vn//RightMenuHinhQuangCao/banner_thongtinvieclam.jpg</string><string>http://www.quan5.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan5.hochiminhcity.gov.vn/Th%20vin%20hnh%20nh/_w/hmhctd64n_jpg.jpg</string><string>http://www.quan5.hochiminhcity.gov.vn/Th%20vin%20hnh%20nh/_w/q5tdhq_jpg.jpg</string><string>http://www.quan5.hochiminhcity.gov.vn/Th%20vin%20hnh%20nh/_w/nhddktdtq5_jpg.jpg</string><string>http://www.quan5.hochiminhcity.gov.vn/Th%20vin%20hnh%20nh/_w/kn28nnngvn_jpg.jpg</string><string>http://www.quan5.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan5.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan5.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan5.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan5.hochiminhcity.gov.vn//_layouts/images/gosearch.gif</string><string>http://www.quan5.hochiminhcity.gov.vn//_layouts/images/titlegraphic.gif</string><string>829cc256347bc22df031ac30b780bbba</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>080402615e4dda57fd1fa170111d1304</string><string>58061b3b374fcf451363ee473a7b81c8</string><string>f8cbd63e516f37cc44ff13fed88a3cd3</string><string>068b52b5f03b49d8894bbf76bd3abd43</string><string>43c50679aa9cbefcf2dc5824cd6c6787</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>56c313e6b2d351e0f2039e2f8de02d95</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>a6dc2f952e0a111f11064f61b5055531</string><string>02635891d99367bb65de611ca6ac57eb</string><string>34f09ab4c43bb1d00b943312f4cc90bb</string><string>66aa4613b70b841c3b69037be3c90379</string><string>02635891d99367bb65de611ca6ac57eb</string><string>4b0efdb1f5a3994cfdf44cad5c3b3ab4</string><string>02635891d99367bb65de611ca6ac57eb</string><string>c35f3185842179450fb520b9019a984d</string><string>6ff852dd47b09ac4f92fe57885a3339e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>77467abdcb66056c00cbb534990d252e</string><string>967bc41fc9228c37e46f748e272d176c</string><string>725acf65a9db915979f1ccfb8ddc3f09</string><string>ea6fe259100a32e58758d63cb53c0bcf</string><string>1bc5ccf5dae8cf6bdf196c72f1679fab</string><string>c0c097411d63add4c456e6839724c2f2</string><string>6a2e9aa8b7f49fb7a993345b392b3b10</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>7f5f0ddf473ae0f00265e504ac9cdef1</string><string>d67f0c7324e8345bc6083118b3411e0c</string><string>059bd264648ede5f6af407be33fbf01f</string><string>8cbcc1193cc8be6741fd0d6381059c84</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>829cc256347bc22df031ac30b780bbba</string><string>ee6540087771b84ff8d8de074f6807b4</string></ArrayOfString>', 4)
INSERT [dbo].[IMAGE_CONTENT] ([ID], [Content], [WebID]) VALUES (5, N'<ArrayOfString xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><string>http://www.quan7.hochiminhcity.gov.vn//_layouts/images/gosearch.gif</string><string>http://www.quan7.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan7.hochiminhcity.gov.vn//Hnh nh bn tin/banner-40nam.png</string><string>http://www.quan7.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan7.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/T3.jpg</string><string>http://www.quan7.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-5/T1-30.4.jpg</string><string>http://www.quan7.hochiminhcity.gov.vn/_Layouts/LacVietBio/eofficeimg/hotnewsdefault.jpg</string><string>http://www.quan7.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-4/T6.jpg</string><string>http://www.quan7.hochiminhcity.gov.vn/_Layouts/LacVietBio/eofficeimg/hotnewsdefault.jpg</string><string>http://www.quan7.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-3/T14.jpg</string><string>http://www.quan7.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-3/T5.jpg</string><string>http://www.quan7.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-3/T4.jpg</string><string>http://www.quan7.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.quan7.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan7.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.quan7.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan7.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.quan7.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan7.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.quan7.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan7.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.quan7.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan7.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-2/T6-15.jpg</string><string>http://www.quan7.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.quan7.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan7.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan7.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan7.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/thongtincanbiet.jpg</string><string>http://www.quan7.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/thongtinchidaodieuhanh.jpg</string><string>http://www.quan7.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/thongtintuyentruyen--.jpg</string><string>http://www.quan7.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/tracuuhanhchinh.jpg</string><string>http://www.quan7.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/Hoi%20thi%20tu%20hao%20su%20viet%20-%20fn%20-%20fn.jpg</string><string>http://www.quan7.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/tracuukhieunai.jpg</string><string>http://www.quan7.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/duan.jpg</string><string>http://www.quan7.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/thuaphatlai.jpg</string><string>http://www.quan7.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/hopthu.jpg</string><string>http://www.quan7.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/bothutuchanhchinhchung.jpg</string><string>http://www.quan7.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/ykiennguoidan_250.jpg</string><string>http://www.quan7.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/congbao_250.jpg</string><string>http://www.quan7.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/HINH%20CHUNG%20TAY%20CCHC.jpg</string><string>http://www.quan7.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan7.hochiminhcity.gov.vn/Th%20vin%20hnh%20nh/_w/hinh-minh-hoa-10-nam---2__jpg.jpg</string><string>http://www.quan7.hochiminhcity.gov.vn/Th%20vin%20hnh%20nh/_w/aa5a239f-8114-41ae-82c2-ccbb4f2cfde1_jpg.jpg</string><string>http://www.quan7.hochiminhcity.gov.vn/Th%20vin%20hnh%20nh/_w/hinh%20minh%20hoa%2010%20nam%20-%201_jpg.jpg</string><string>http://www.quan7.hochiminhcity.gov.vn/Th%20vin%20hnh%20nh/_w/hinh-minh-hoa-10-nam---2_jpg.jpg</string><string>http://quan7.hochiminhcity.gov.vn/Hnh%20nh%20bn%20tin/2011-10/bando.jpg</string><string>http://www.quan7.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan7.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan7.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan7.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan7.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan7.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan7.hochiminhcity.gov.vn//_layouts/images/gosearch.gif</string><string>http://www.quan7.hochiminhcity.gov.vn//_layouts/images/titlegraphic.gif</string><string>829cc256347bc22df031ac30b780bbba</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>6ff852dd47b09ac4f92fe57885a3339e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>5c176a98149b8f32300491a2f6200e79</string><string>82bbebc5675538e884445cd9cad8eb28</string><string>02635891d99367bb65de611ca6ac57eb</string><string>f12ff44d8bb03a32b2dcd1c91969c862</string><string>02635891d99367bb65de611ca6ac57eb</string><string>27708b77531b8a50ec2d3877070e2123</string><string>09514833e07df2564cf1ce9d08f3977e</string><string>a48044e30f096e8b7801fdb76ccfa28d</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>22146f45437501292ec937243802331b</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>6934e8a857d0962310b2a7ab274bbec0</string><string>e735de9d62244363038f83652a5e5d46</string><string>a73a20a5ddcce6bf6b52a4b60a7c8b98</string><string>65108f8d695872d4bb9d4c3e6c6f2971</string><string>ee017b824930ab125dda8296b657d0ca</string><string>dd1dd7586f982993605feda82dc3befd</string><string>fb2225186c6da4caaeeca38aabe63e4a</string><string>c0c097411d63add4c456e6839724c2f2</string><string>6e09b5016fa44204601b3bd0cef9fd94</string><string>a7d77ebad527c53d01055f5e8b842263</string><string>94cd5871ad5555bfdd9b793b5b7683bd</string><string>6908141b25fb48b1f6f15717cf9c3eeb</string><string>d8d862fc1fd1076bafc835a8bf26ba33</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>7b28d2c73866b46c3a0a1ad4c3f314fc</string><string>69d2f0e547af86d97054fbe88cac37c2</string><string>efa62ceded1b1fb5e710e782cc69fb8a</string><string>f47be5333628aed8043f99e01560c4ca</string><string>fdbdf4e8f6f66477e12ade3500a523ac</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>829cc256347bc22df031ac30b780bbba</string><string>ee6540087771b84ff8d8de074f6807b4</string></ArrayOfString>', 5)
INSERT [dbo].[IMAGE_CONTENT] ([ID], [Content], [WebID]) VALUES (6, N'<ArrayOfString xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><string>http://www.binhthanh.hochiminhcity.gov.vn//_layouts/images/gosearch.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/hcm.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/hoc-tap-lam-theo-tam-guong-BH-bt.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/hopthudientu.png</string><string>http://www.binhthanh.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/Tr%c6%b0%e1%bb%9dng%20Trung%20C%e1%ba%a5p%20Ngh%e1%bb%81%20B%c3%acnh%20Th%e1%ba%a1nh.png</string><string>http://www.binhthanh.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/TTHCCHUNG.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/dichvucong.jpg</string><string>http://www.binhthanh.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/thuaphatlai.jpg</string><string>http://www.binhthanh.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/LDLDQUANBT.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/LHPN.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/pgd.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/pccc-hcm.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/UBMT-BT.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn/AlbumBox/_w/1_jpg.jpg</string><string>http://www.binhthanh.hochiminhcity.gov.vn/AlbumBox/_w/DuongNguyenHuuCanh_png.jpg</string><string>http://www.binhthanh.hochiminhcity.gov.vn/AlbumBox/_w/DSC05501_JPG.jpg</string><string>http://www.binhthanh.hochiminhcity.gov.vn/AlbumBox/_w/2_jpg.jpg</string><string>http://www.binhthanh.hochiminhcity.gov.vn/AlbumBox/_w/Hamchuivanthanh_png.jpg</string><string>http://www.binhthanh.hochiminhcity.gov.vn/AlbumBox/_w/dacauSaiGon_png.jpg</string><string>http://www.binhthanh.hochiminhcity.gov.vn/AlbumBox/_w/3_jpg.jpg</string><string>http://www.binhthanh.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//Hnh nh bn tin/banner-40nam.png</string><string>http://www.binhthanh.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn/_Layouts/LacVietBio/eofficeimg/hotnewsdefault.jpg</string><string>http://www.binhthanh.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-5/in%202%20trang%201%20kỷ%20niệm%20125%20năm%20ngày%20sinh%20chủ%20tịc.jpg</string><string>http://www.binhthanh.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-5/Đồng%20chí2%20Nguyễn%20Thị%20Thu%20Hà,%20Bí%20thư%20Quận%20ủy%20phát%20biểu%20chỉ%20đạo%20tại%20hội%20nghị%20giao%20ban.jpg</string><string>http://www.binhthanh.hochiminhcity.gov.vn/_Layouts/LacVietBio/eofficeimg/hotnewsdefault.jpg</string><string>http://www.binhthanh.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-5/_DS2%20C1835%20-%209.3x4.64cm.jpg</string><string>http://www.binhthanh.hochiminhcity.gov.vn/_Layouts/LacVietBio/eofficeimg/hotnewsdefault.jpg</string><string>http://www.binhthanh.hochiminhcity.gov.vn/_Layouts/LacVietBio/eofficeimg/hotnewsdefault.jpg</string><string>http://www.binhthanh.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-5/Đồng%20chí2%20Nguyễn%20Thị%20Thu%20Hà,%20Bí%20thư%20Quận%20ủy%20phát%20biểu%20chỉ%20đạo%20tại%20hội%20nghị%20giao%20ban.jpg</string><string>http://www.binhthanh.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-5/_DS2%20C1835%20-%209.3x4.64cm.jpg</string><string>http://www.binhthanh.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//_layouts/images/gosearch.gif</string><string>http://www.binhthanh.hochiminhcity.gov.vn//_layouts/images/titlegraphic.gif</string><string>829cc256347bc22df031ac30b780bbba</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>080402615e4dda57fd1fa170111d1304</string><string>1195dadc724d692ba44df83b9d223dea</string><string>293f21790877560b0fdef28f017ce158</string><string>83a83caa4f84dbb9c0235f6def08a19c</string><string>3fb702cd0c8e6caf13eada0ac5261a20</string><string>f9d6e79966b024885d23be7358dd2951</string><string>c0c097411d63add4c456e6839724c2f2</string><string>44bdc4217aa16367438a892a03009268</string><string>bdd43b4076f66fa11bc0b7b81b4ac132</string><string>11ab01fb2260ab6d922303ddb904ead1</string><string>5fb3c6b0d97b84585e1e453e06ac47bf</string><string>e947dfea124e0428991d0b8a7a6bb4b9</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>e8967a22121b711cce91e4c7755b88c8</string><string>e1b97a9cd03a51b41139b38b79f2c3c7</string><string>dc73c15bab01db9ff9b99f29c56da097</string><string>2d0d34f6bf7760236f4fc5e9e4cfed67</string><string>26e2ebadf3890414eab32174fe7f6348</string><string>f68201a3c524f67a7d5ab6d07e82e8bc</string><string>fe9be0543198709a6f7e46b12980ee78</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>6ff852dd47b09ac4f92fe57885a3339e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>02635891d99367bb65de611ca6ac57eb</string><string>2bc2a869250ea506570dadffb0995003</string><string>048eb419c42bcb5138ed2724f84e57d7</string><string>02635891d99367bb65de611ca6ac57eb</string><string>d3aac441096dd703804fc9f3b6a7d1a6</string><string>02635891d99367bb65de611ca6ac57eb</string><string>02635891d99367bb65de611ca6ac57eb</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>048eb419c42bcb5138ed2724f84e57d7</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>d3aac441096dd703804fc9f3b6a7d1a6</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>829cc256347bc22df031ac30b780bbba</string><string>ee6540087771b84ff8d8de074f6807b4</string></ArrayOfString>', 6)
INSERT [dbo].[IMAGE_CONTENT] ([ID], [Content], [WebID]) VALUES (7, N'<ArrayOfString xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><string>http://tanbinh.hochiminhcity.gov.vn//_layouts/images/fgimg.png</string><string>http://tanbinh.hochiminhcity.gov.vn//_layouts/images/fgimg.png</string><string>http://tanbinh.hochiminhcity.gov.vn//_layouts/images/fgimg.png</string><string>http://tanbinh.hochiminhcity.gov.vn//_layouts/images/fgimg.png</string><string>http://tanbinh.hochiminhcity.gov.vn//_layouts/images/fgimg.png</string><string>http://tanbinh.hochiminhcity.gov.vn//_layouts/images/siteIcon.png</string><string>http://tanbinh.hochiminhcity.gov.vn//_layouts/images/fgimg.png</string><string>http://tanbinh.hochiminhcity.gov.vn//_layouts/images/gosearch15.png</string><string>http://tanbinh.hochiminhcity.gov.vn//HinhAnhLienKet/DCSVN.gif</string><string>http://tanbinh.hochiminhcity.gov.vn//HinhAnhLienKet/trang dien tu chinh phu.gif</string><string>http://tanbinh.hochiminhcity.gov.vn//HinhAnhLienKet/DichVuCong.gif</string><string>http://tanbinh.hochiminhcity.gov.vn//HinhAnhLienKet/HCM Cityweb.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//HinhAnhLienKet/MatTRanTQVN.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//HinhAnhLienKet/LichTuan.gif</string><string>http://tanbinh.hochiminhcity.gov.vn//HinhAnhLienKet/2.gif</string><string>http://tanbinh.hochiminhcity.gov.vn//HinhAnhLienKet/phananh_Quydinhhanhchinh.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//HinhAnhLienKet/phobienGDphapluat.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//HinhAnhLienKet/quandoantanbinh.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//HinhAnhLienKet/TTHC1.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//HinhAnhLienKet/thuaphatlai.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//HinhAnhLienKet/DDN.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//HinhAnhLienKet/KNTC.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.hochiminhcity.gov.vn//HoatDongAnh/Lists/HtmlEditorDB/EditForm/banner-40nam1.png</string><string>http://tanbinh.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://tanbinh.hochiminhcity.gov.vn//_controltemplates/lacviet.cms.unionnews/EOFFICEIMG/newsdefault.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//_CONTROLTEMPLATES/LacViet.CMS.UnionNews/eofficeimg/Giaodien/cityweb/icon-pre.png</string><string>http://tanbinh.hochiminhcity.gov.vn//_CONTROLTEMPLATES/LacViet.CMS.UnionNews/eofficeimg/Giaodien/cityweb/icon-next.png</string><string>http://tanbinh.hochiminhcity.gov.vn//HoatDongAnh/Luat cong chung 2015/_w/Luat cong chung 205-2_jpg.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//_controltemplates/lacviet.cms.unionnews/EOFFICEIMG/newsdefault.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//_controltemplates/lacviet.cms.unionnews/EOFFICEIMG/newsdefault.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//_controltemplates/lacviet.cms.unionnews/EOFFICEIMG/newsdefault.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//_controltemplates/lacviet.cms.unionnews/EOFFICEIMG/newsdefault.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//_controltemplates/lacviet.cms.unionnews/EOFFICEIMG/newsdefault.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//_controltemplates/lacviet.cms.unionnews/EOFFICEIMG/newsdefault.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//HoatDongAnh/PCTL-T5-2015/PCTL-T5-2015.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//HoatDongAnh/The duc co dong toan thanh 2015/_w/hinh the duc co dong (7)_jpg.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//HoatDongAnh/Luat cong chung 2015/_w/Luat cong chung 205-2_jpg.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//_controltemplates/lacviet.cms.unionnews/EOFFICEIMG/newsdefault.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//_controltemplates/lacviet.cms.unionnews/EOFFICEIMG/newsdefault.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//HoatDongAnh/Lay%20y%20kien%20bo%20luat%20dan%20su/Bo%20luat%20dan%20su%20banner%20ngoai.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//HoatDongAnh/banner-hoi-thi-tu-hao-su-viet.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//SiteAssets/Lists/HtmlEditorDB/EditForm/banner-du%20thao%20dai%20hoi-1.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://tanbinh.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://tanbinh.hochiminhcity.gov.vn//HinhDaiDienVideo/_t/UBNDHCM PHI_jpg.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn/_Layouts/lacvietbio/eofficeimg/play_icon.png</string><string>http://tanbinh.hochiminhcity.gov.vn/HoatDongAnh/Tin%20ảnh/_w/vinhhalong_jpg.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn/HoatDongAnh/Tin%20ảnh/_w/Q3-LeQuyDon2_jpg.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn/HoatDongAnh/Tin%20ảnh/_w/Tp.Ho_Chi_Min_jpg.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn/HoatDongAnh/Tin%20ảnh/_w/causaigon_jpg.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn/HoatDongAnh/Tin%20ảnh/_w/xh-tet-tphcm-trong-1_jpg.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn/HoatDongAnh/Tin%20ảnh/_w/nhahattp_jpg.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn/HoatDongAnh/Tin%20ảnh/_w/1317577205.nv_jpg.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn/HoatDongAnh/Tin%20ảnh/_w/nhathodem_jpg.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn/HoatDongAnh/Tin%20ảnh/_w/UBND-TP_HCM_jpg.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//HinhAnhLienKet/Map.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//HinhAnhLienKet/2014-01-02 (1).jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//HinhAnhLienKet/hop thu dien tu.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//HinhAnhLienKet/NOXH.jpg</string><string>http://tanbinh.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>14fac318ab6dfcdf688f178bbdf92a14</string><string>14fac318ab6dfcdf688f178bbdf92a14</string><string>14fac318ab6dfcdf688f178bbdf92a14</string><string>14fac318ab6dfcdf688f178bbdf92a14</string><string>14fac318ab6dfcdf688f178bbdf92a14</string><string>a2256762a18590c27c9f91e2c9002e57</string><string>14fac318ab6dfcdf688f178bbdf92a14</string><string>087353bd38cb27bae4756c6b49454977</string><string>7e2368c9024452ae13f1c630b576b980</string><string>8cfa6bc7514dcb230358bdebf0719d7d</string><string>d39246189397031e9731c2d4616f76a8</string><string>862a6ea0c946ca44ec0d06866ca4e8e0</string><string>3649dc70bbfb98c6bd547eaaf463bd49</string><string>c93a110a7c11af2f4d3078f1b6fde4d3</string><string>f811e43c511ae1e14479a3a970a06c9a</string><string>828426256daa4712380cb7f674cd231c</string><string>2202c0d9e4cd3c0f6fd8f1c35f62baab</string><string>a65c2f88034a30bd7971837a86d560a5</string><string>258c6ffe9433988d8864d8142fe8e007</string><string>c0c097411d63add4c456e6839724c2f2</string><string>2096a6f449d71b613062550ce42ce114</string><string>f9b23b3705ad4126a4db1a15828e9d26</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>5c185d9edf9d9b7ef0613c18bb9bd392</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>d3f7f56d30227e7e52658b96e7862fae</string><string>8b4a6f4f452d27d4b01e24552f5b8b7d</string><string>8b4a6f4f452d27d4b01e24552f5b8b7d</string><string>6663589a6a327f0805baa1ae63489fca</string><string>d3f7f56d30227e7e52658b96e7862fae</string><string>d3f7f56d30227e7e52658b96e7862fae</string><string>d3f7f56d30227e7e52658b96e7862fae</string><string>d3f7f56d30227e7e52658b96e7862fae</string><string>d3f7f56d30227e7e52658b96e7862fae</string><string>d3f7f56d30227e7e52658b96e7862fae</string><string>7db1bf10fcae83f0870af870f4a26ca5</string><string>5ca019c54873b062422774805f9ca255</string><string>6663589a6a327f0805baa1ae63489fca</string><string>d3f7f56d30227e7e52658b96e7862fae</string><string>d3f7f56d30227e7e52658b96e7862fae</string><string>3a7d7cff38ee2735fc711d7e6bb53016</string><string>3fd05b76600e19e8295f980dbb3b2c01</string><string>2892b927de225cda0d93ec5593b01d2b</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>ddb68ead202bc30ad474e58b35efc011</string><string>34f913cb4287eda8b1d2bdae00347e1f</string><string>7edb04f7af5786b95ea441c2a0fc03db</string><string>67a9807d12caf28a8d43cfbe79bc98b7</string><string>56acaaed30ca734f921f6eb45a88080b</string><string>b43305dc8299489b5276aaaa5b10e369</string><string>9bf2ac85f063a943dfed6b820110897b</string><string>ec8d58e2d51515c372182b9fe4c06a90</string><string>93843346afc300572dfe3ca9813d7ca6</string><string>3ba0eb9c2fa7f917104449a6e61d578e</string><string>1e711b089cdc31c749fe503623a80595</string><string>627dcd5d37748350aaf6971bc1a9061c</string><string>5f5fa54fb32dce55a4202b39742f7026</string><string>9b9d9caf48ac71be7aed9d22c45dd7c6</string><string>d44bf3daed7b6b86caec427969c5d765</string><string>81a04e8d9b37abc0952210b969c6498e</string></ArrayOfString>', 7)
INSERT [dbo].[IMAGE_CONTENT] ([ID], [Content], [WebID]) VALUES (8, N'<ArrayOfString xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><string>http://www.quan9.hochiminhcity.gov.vn//_layouts/images/gosearch.gif</string><string>http://www.quan9.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan9.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/DSC00914.JPG</string><string>http://www.quan9.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/DSC00915.JPG</string><string>http://www.quan9.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/DSC00942.JPG</string><string>http://www.quan9.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/DSC00895.JPG</string><string>http://www.quan9.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/Lephatdong.jpg</string><string>http://www.quan9.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/DSC00362.JPG</string><string>http://www.quan9.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/hcm.gif</string><string>http://www.quan9.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/BACHO.gif</string><string>http://www.quan9.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/vbpq.gif</string><string>http://www.quan9.hochiminhcity.gov.vn//LeftMenuHinhQuangCao/thuaphatlai.jpg</string><string>http://www.quan9.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan9.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan9.hochiminhcity.gov.vn//Hnh nh bn tin/banner-40nam.png</string><string>http://www.quan9.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan9.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/htnbich.jpg</string><string>http://www.quan9.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/pccc/pccc1.jpg</string><string>http://www.quan9.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/moitruong5.6/tsub1.jpg</string><string>http://www.quan9.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/ldtnct.jpg</string><string>http://www.quan9.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/caothingocchau.jpg</string><string>http://www.quan9.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/HCM/hcm6.jpg</string><string>http://www.quan9.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/HCM/hcm4.jpg</string><string>http://www.quan9.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan9.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/TuyenduongDN/dn1.jpg</string><string>http://www.quan9.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.quan9.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan9.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-5/ttdt2.jpg</string><string>http://www.quan9.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.quan9.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan9.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/moitruong5.6/tsub1.jpg</string><string>http://www.quan9.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.quan9.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan9.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/pccc/pccc1.jpg</string><string>http://www.quan9.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.quan9.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan9.hochiminhcity.gov.vn//Hnh%20nh%20bn%20tin/2015-6/htnbich.jpg</string><string>http://www.quan9.hochiminhcity.gov.vn//_Layouts/LacVietBio/eofficeimg/rss2.gif</string><string>http://www.quan9.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan9.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan9.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan9.hochiminhcity.gov.vn//RightMenuHinhQuangCao/DSC00941.JPG</string><string>http://www.quan9.hochiminhcity.gov.vn//RightMenuHinhQuangCao/DSC00888.JPG</string><string>http://www.quan9.hochiminhcity.gov.vn//RightMenuHinhQuangCao/DSC_4243.JPG</string><string>http://www.quan9.hochiminhcity.gov.vn//RightMenuHinhQuangCao/DSC00909.JPG</string><string>http://www.quan9.hochiminhcity.gov.vn//RightMenuHinhQuangCao/DSC00856.jpg2.jpg</string><string>http://www.quan9.hochiminhcity.gov.vn//RightMenuHinhQuangCao/DSC00718.JPG</string><string>http://www.quan9.hochiminhcity.gov.vn//RightMenuHinhQuangCao/DSC00569-1.jpg</string><string>http://www.quan9.hochiminhcity.gov.vn//RightMenuHinhQuangCao/DSC00397.JPG</string><string>http://www.quan9.hochiminhcity.gov.vn//RightMenuHinhQuangCao/lich-lam-viec.png</string><string>http://www.quan9.hochiminhcity.gov.vn//RightMenuHinhQuangCao/hoi-dap.png</string><string>http://www.quan9.hochiminhcity.gov.vn//RightMenuHinhQuangCao/cong-bao.png</string><string>http://www.quan9.hochiminhcity.gov.vn//RightMenuHinhQuangCao/htdt.jpg</string><string>http://www.quan9.hochiminhcity.gov.vn//RightMenuHinhQuangCao/tiemnangdulichquan9.png</string><string>http://www.quan9.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan9.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan9.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan9.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan9.hochiminhcity.gov.vn//_layouts/images/blank.gif</string><string>http://www.quan9.hochiminhcity.gov.vn//_layouts/images/gosearch.gif</string><string>http://www.quan9.hochiminhcity.gov.vn//_layouts/images/titlegraphic.gif</string><string>829cc256347bc22df031ac30b780bbba</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>3517c032907e2c1e95cf4c4b6bba3f3d</string><string>cedb1f7670a58a1c9669dc3eec4d2d11</string><string>8852d18f573e1f260066f4f82a913740</string><string>db076fc36bf37ee4e6e30f2b9b28d4b2</string><string>6f5f1f6d603c275cb152975543f67d10</string><string>fa108357bb540ac32dfa0f5ea6176226</string><string>080402615e4dda57fd1fa170111d1304</string><string>58061b3b374fcf451363ee473a7b81c8</string><string>3e0c78dffec4f75b93b92ca3acaf1693</string><string>c0c097411d63add4c456e6839724c2f2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>6ff852dd47b09ac4f92fe57885a3339e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>af10561641ee5f787d9f633176c3a795</string><string>23b0f836a21611e45727e4b6628d232b</string><string>a3cf2c3c21c1ef84987f05b98943da51</string><string>97411c0e719643a445e66c400a8774da</string><string>2200d71e307c5dd075c66860de8646df</string><string>f5dc88c85397983a5b2a36d1f89f4c9c</string><string>73850c0615ad7729481c634e2b6ee4af</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>d5e032c3809d401a7f3ef4f906b6f0a6</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>3a79a66c9c52ee7e7d40c1d6d6527bb0</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>a3cf2c3c21c1ef84987f05b98943da51</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>23b0f836a21611e45727e4b6628d232b</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>af10561641ee5f787d9f633176c3a795</string><string>1fd0e2488557ea594d9a981a7dd7dad2</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>3c40bf6a14a53a4482c6d950802235d6</string><string>69b80dc32b142878d4f6506f263a66bc</string><string>8188db4a79a500c3def85fb013b5385d</string><string>9a9cc7255ee0a729115cd28664cb4613</string><string>090fe128eb159933dc008ae545ba4737</string><string>baf25be45c470281fe4e0c1e67dd14a8</string><string>4511b0453bd794f241cc8b0f34a669cb</string><string>a20416049927e273877afacd3dfb884b</string><string>adba63767215538ca39eec3b24cb0f8e</string><string>ae8fd4abfc95fefb998572e3caf39f57</string><string>946627ee13c80bdde7688a75433f20ce</string><string>f0a6319ca4beb6708142a63369265acf</string><string>605376faac303cd671cb6be12a82cc80</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>81a04e8d9b37abc0952210b969c6498e</string><string>829cc256347bc22df031ac30b780bbba</string><string>ee6540087771b84ff8d8de074f6807b4</string></ArrayOfString>', 8)
INSERT [dbo].[TEXT_CONTENT] ([ContentID], [Content], [TimeCheck], [TextResult], [WebID]) VALUES (1, N'Trang chủ 
	- UBND QUẬN 2





	
	
	var navBarHelpOverrideKey = "wssmain";
	

	
	




















 var MSOWebPartPageFormName = ''aspnetForm'';

function _spNavigateHierarchy(nodeDiv, dataSourceId, dataPath, url, listInContext, type) {
    ProcessDefaultNavigateHierarchy(nodeDiv, dataSourceId, dataPath, url, listInContext, type, document.forms.aspnetForm, "", "\u002fdefault.aspx");
}



	
	
	
	
	
		
			
			
		
		
		 
			
			   
			Bật chế độ truy cập dễ dàng hơn
			
			
			Bỏ qua nội dung chính
		 
		   
			
			 
			  
				
				Tắt chế độ truy cập dễ dàng hơn
			  
			  
				UBND QUẬN 2
			  
			  
			 
		   
		 		 
			
		   
	   
	  
			
		
		
			
				
		   		
		  				            							
                        function tS(){ x=new Date(); x.setTime(x.getTime()); return x; }
                        function y2(x){ x=(x<500)?x+1900:x; return String(x).substring(0,4) }
                        function k(){var ap="AM";
						 if ((tS().getHours())   > 11) { ap ="PM"; };return ap;}
                        function dT(){                      
						  if(fr==0){ fr=1; document.write(''''+eval(oT)+''''); } tP.innerText=eval(oT); setTimeout(''dT()'',1000); }
                        var dN=new Array(''Chủ nhật'',''Thứ hai'',''Thứ ba'',''Thứ tư'',''Thứ năm'',''Thứ sáu'',''Thứ bảy''),mN=new Array(''1'',''2'',''3'',''4'',''5'',''6'',''7'',''8'',''9'',''10'',''11'',''12''),fr=0,oT="dN[tS().getDay()]+'', ''+tS().getDate()+''/''+mN[tS().getMonth()]+''/''+y2(tS().getYear())+''-''+tS().getHours()+'':''+tS().getMinutes()+'' ''+k()";
                     
                     dT();
		  		
		   	
			
				
					
					
Đăng nhập

					
					
						
							
							
						
					
					
				
			
			
		
		
			
			
		

	
			
	
	
			
		
		
			
			
				
					
					
					
					
			
		   UBND QUẬN 2
		  
		  
					
				
			
			
		
		
			
			  
			
		
			
		
		
			
			
			
			
				
					
				
			
		   			
			
				
	
		
		
		 -->
		 
		 
			
		
		 
			 
			    $(document).ready(function(){ 
			        $("#topnav_3").superfish({ 
			            pathClass:  ''current'' 
			        }); 
			    }); 
			 
		

		
		
		
	 -->
		    
		        
		        
		      
		                
		                    TRANG CHỦ 
							
		            
		        
		        
		        
		      
		                
		                    GIỚI THIỆU 
							
		            
		            
		                
		                
		                    Giới thiệu tổng quát
		                
		                    
							
		                
		                
		                
		                    Chức năng, nhiệm vụ, quyền hạn
		                
		                    
							
		                
		                
		                
		                    Thông tin giao dịch
		                
		                    
							
		                
		                
		                
		                    Thông tin cán bộ công chức
		                
		                    
							
		                
		                
		                
		                    Sơ đồ tổ chức
		                
		                    
							
		                
		                
		                
		                    Bản đồ hành chính
		                
		                    
							
		                
		                
		                
		                    Bản đồ quy hoạch
		                
		                    
							
		                    
		                        
		                        
		                            Quy hoạch sử dụng đất 2020
		                        
								
							
								
		                        
		                        
		                            Dự thảo kế hoạch sdd 2015
		                        
								
							
								
		                        
		                        
		                            KDC phường Bình Trưng Đông
		                        
								
							
								
		                        
		                        
		                            KDC phường Bình Trưng Tây
		                        
								
							
								
		                        
		                        
		                            KDC phường Cát Lái
		                        
								
							
								
		                        
		                        
		                            KDC phường Thạnh Mỹ Lợi
		                        
								
							
								
		                        
		                        
		                            KDC phường Thảo Điền
		                        
								
							
								
		                        
		                        
		                            Bản đồ kiến trúc không gian và xây dựng cảnh quan
		                        
								
							
								
		                        
		                        
		                            Bản đồ tổng mặt bằng quy hoạch sử dụng đất
		                        
								
							
								
		                        
		                        
		                            Bản đồ hiện trạng kiến trúc cảnh quan và đánh giá đất xây dựng
		                        
								
							
								
		                        
		                    
		                    
		                
		                
		                
		                    Địa chỉ cần biết
		                
		                    
							
		                
		                
		                
		                    Thông báo về người phát ngôn UBND Q2
		                
		                    
							
		                
		                
		            
		            
		        
		        
		        
		      
		                
		                    TIN TỨC SỰ KIỆN 
							
		            
		            
		                
		                
		                    Hoạt động Đảng - Đoàn thể
		                
		                    
							
		                
		                
		                
		                    Chỉ đạo điều hành
		                
		                    
							
		                    
		                        
		                        
		                            Ý kiến chỉ đạo của lãnh đạo đơn vị
		                        
								
							
								
		                        
		                        
		                            Ý kiến xử lý, phản hồi yêu cầu tổ chức - cá nhân
		                        
								
							
								
		                        
		                        
		                            Văn hóa - xã hội & Văn hóa - Cơ sở
		                        
								
							
								
		                        
		                        
		                            Văn hóa cơ sở
		                        
								
							
								
		                        
		                        
		                            Kinh tế
		                        
								
							
								
		                        
		                        
		                            Quản lý đô thị
		                        
								
							
								
		                        
		                        
		                            An ninh - quốc phòng
		                        
								
							
								
		                        
		                    
		                    
		                
		                
		                
		                    Thông tin tổng hợp
		                
		                    
							
		                
		                
		                
		                    Khen thưởng - xử phạt
		                
		                    
							
		                
		                
		                
		                    Báo cáo thống kê
		                
		                    
							
		                
		                
		                
		                    Thông tin tuyển dụng
		                
		                    
							
		                
		                
		            
		            
		        
		        
		        
		      
		                
		                    QUY HOẠCH & PHÁT TRIỂN 
							
		            
		            
		                
		                
		                    Thông tin quy hoạch
		                
		                    
							
		                
		                
		                
		                    Chiến lược - định hướng
		                
		                    
							
		                
		                
		                
		                    Quy hoạch phân khu
		                
		                    
							
		                
		                
		                
		                    Quy hoạch giáo dục
		                
		                    
							
		                
		                
		                
		                    Quy hoạch chung
		                
		                    
							
		                
		                
		                
		                    Quy trình liên quan lĩnh vực đô thị
		                
		                    
							
		                
		                
		                
		                    Quy hoạch thu gom, tái chế, xử lý chất thải
		                
		                    
							
		                
		                
		            
		            
		        
		        
		        
		      
		                
		                    THỦ TỤC HÀNH CHÍNH 
							
		            
		            
		                
		                
		                    Thủ tục áp dụng tại Quận
		                
		                    
							
		                
		                
		                
		                    Thủ tục áp dụng tại Phường
		                
		                    
							
		                
		                
		                
		                    Thủ tục hành chính khác
		                
		                    
							
		                
		                
		            
		            
		        
		        
		        
		      
		                
		                    VĂN BẢN PHÁP LUẬT 
							
		            
		            
		                
		                
		                    Trung Ương
		                
		                    
							
		                
		                
		                
		                    Thành phố
		                
		                    
							
		                
		                
		                
		                    Văn bản liên quan TTHC
		                
		                    
							
		                
		                
		                
		                    Tuyên truyền phổ biến pháp luật
		                
		                    
							
		                
		                
		            
		            
		        
		        
		        
		      
		                
		                    QUẢN TRỊ 
							
		            
		        
		        
		    
		 -->
		


						
		   
		   
		   	
		   	
	 
		   		   	
		   	
	
		 
			
				
					
				
			
		
	
 	
		   	
		   	
		   
		  
		  			
			
				
					
					
					
					
					
						
							
							
							
						
						
							
							
							
			
			UBND QUẬN 2

							
							
							
						
					
					
					
						

					
					
					
					
					
						
								

	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveLink(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }




						
					

 
						
    
        
            
             
        
        
    

					

				
			
		
	
		
			
				
					





 var jHotNews = jQuery.noConflict();
  function slideSwitch() 
  {
      var jQueryActive = jHotNews(''#slideshow DIV.active'');
     
      if ( jQueryActive.length == 0 ) jQueryActive = jHotNews(''#slideshow DIV:last'');
      var jQueryNext =  jQueryActive.next().length ? jQueryActive.next(): jHotNews(''#slideshow DIV:first'');
      jQueryActive.addClass(''last-active'');
      
      jQueryNext.css({opacity: 0.0})
          .addClass(''active'')
          .animate({opacity: 1.0}, 1000, function() {
          jQueryActive.removeClass(''active last-active'');
          
          });
  }
  jHotNews(function($) {
  var cmshotnewsrefreshIntervalId=setInterval( "slideSwitch()", "4000" );
          $(".a-hot-link").mouseover(function() {

            var kq = $(this).attr(''id'');

            $(''div.hl-latestnews3'').each(function() {
                if ($(this).attr(''idItem'') == kq) {
                    $(this).addClass(''active'');
                    clearInterval(cmshotnewsrefreshIntervalId);
                }
                else {
                    $(this).removeClass(''active'');
                }
            });
        }).mouseout(function() {
            cmshotnewsrefreshIntervalId = setInterval("slideSwitch()", "4000");
        });
  });



/**Tin noi bat***/
/*#slideshow{width:295px;float:left;height:380px;position:relative;}
#slideshow DIV{position:absolute;top:0;left:0;z-index:80;opacity:.0;width:295px;background-color:#FFF;height:100%;}
#slideshow DIV.active{z-index:100;opacity:1.0;width:295px;height:100%;}
#slideshow DIV.last-active{z-index:90;height:100%;}
#slideshow DIV IMG{display:block;border:0;margin-bottom:10px;}*/


    
        
            
                
                    
                    
                    
                        
                        
                            
                        
                         
                        
                            
                                Triển khai nạo vét rạch trong Khu đô thị mới Thủ Thiêm
                            
                        
                        
                            (Website Quận 2) - UBND TP đã chấp thuận cho Ban Quản lý Đầu tư - Xây dựng Khu đô thị mới Thủ Thiêm triển khai đầu tư xây dựng dự án nạo vét rạch, đào hồ trung tâm và các kênh mới kết hợp với xây dựng kè bờ, công viên, cây xanh ven các kênh, rạch và hồ; trong đó có thiết kế hệ thống tưới tự động, sử dụng nguồn nước từ hồ trung tâm - hồ cảnh quan ...
                        
                       
                    
                    
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Bản Tin Quận 2 tháng 5/2015
                            
                        
                        
                             













 
 
 
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Tuyên truyền phòng, chống ma túy
                            
                        
                        
                            (Website Quận 2)-Ủy ban nhân dân quận vừa ban hành Kế hoạch triển khai thực hiện công tác tuyên truyền phòng, chống ma túy hưởng ứng “Tháng hành động phòng, chống ma túy, mại dâm” và “Ngày toàn dân phòng, chống ma túy 26 tháng 6” Năm 2015.
 
Theo đó, Nâng cao ý thức, trách nhiệm đấu tranh phòng, chống ma túy trong toàn hệ thống chính trị trên ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Tiếp xúc, vận động các hộ dân có nhà đất giải tỏa tại phường An Lợi Đông
                            
                        
                        
                            (Website Quận 2)-Ủy ban nhân dân quận vừa ban hành Kế hoạch tổ chức tiếp xúc, vận động các hộ dân có nhà đất giải tỏa trong Khu đô mới Thủ Thiêm đang ở Khu tạm cư An Lợi Đông, phường An Lợi Đông, quận 2 nhận căn hộ chung cư theo tiêu chuẩn tái định cư được hưởng.
 
Theo đó, Để chấm dứt việc ở nhà tạm cư tại Khu tạm cư An Lợi Đông, phường An Lợi ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Bình ổn thị trường các mặt hàng dược phẩm thiết yếu
                            
                        
                        
                            (Website Quận 2)-Ủy ban nhân dân quận 2 vừa ban hành kế hoạch thực hiện Chương trình bình ổn thị trường các mặt hàng dược phẩm thiết yếu trên địa bàn quận năm 2015 - 2016. 
 
Theo đó, Chương trình bình ổn thị trường các mặt hàng thuốc thiết yếu trên địa bàn quận năm 2015 - 2016 triển khai để đảm bảo cân đối cung - cầu hàng hóa, ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Xây dựng, quản lý và khai thác tủ sách pháp luật
                            
                        
                        
                            (Website Quận 2)-Ủy ban nhân dân quận 2 vừa ban hành Kế hoạch tổ chức thực hiện công tác xây dựng, quản lý và khai thác tủ sách pháp luật trên địa bàn quận 2 năm 2015.
 
Theo đó, Đảm bảo Tủ sách pháp luật được bổ sung hàng năm theo quy định tại Quyết định số 06/2010/QĐ-TTg ngày 25/01/2010 của Thủ tướng Chính phủ; Loại bỏ các loại sách đã hết ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Quận 2 tổ chức hội nghị chuyên đề nâng cao chất lượng  Cuộc vận động Vì người nghèo
                            
                        
                        
                            (Website Quận 2)-Nhằm đánh giá, rút kinh nghiệm những mặt làm được, những mặt hạn chế trong công tác thực hiện cuộc vận động “Vì người nghèo” năm 2014; bàn giải pháp, biện pháp để nâng cao hiệu quả cuộc vận động trong thời gian tới; sáng ngày 26/5/2015 Ban Thường trực Ủy ban Mặt trận Tổ quốc quận 2 tổ chức hội nghị ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Sinh hoạt chuyên đề “Mỗi thanh niên hãy sống những ngày đẹp nhất; Hãy bắt tay vào những công việc nhỏ, bình thường hàng ngày nhưng có ích cho đời”
                            
                        
                        
                            (Website Quận 2)-Hơn 97 bạn đoàn viên, thanh niên Quận 2 đã tham gia buổi sinh hoạt chuyên đề Câu lạc bộ Lý luận trẻ quý II, năm 2015 vào sáng ngày 13/6. Chương trình hướng tới kỷ niệm 100 năm Ngày sinh Tổng Bí thư Nguyễn Văn Linh (01/7/1915 – 01/7/2015). 
Thạc sĩ Đoàn Hùng Vũ Hưng, Phó Giám đốc Trung tâm Thông tin công tác tư tưởng – Ban Tuyên ...
                        
                        
                    
                    
                
            
        
        
            
            
                
                    
                        
                            TIN NỔI BẬT
                        
                    
                
                 

                
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            
                                Triển khai nạo vét rạch trong Khu đô thị mới Thủ Thiêm
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            
                                Bản Tin Quận 2 tháng 5/2015
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews2" href="http://www.quan2.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=V%c4%83n+h%c3%b3a+-+x%c3%a3+h%e1%bb%99i&ItemID=7049&Mode=1" class="a-hot-link" title="(Website Quận 2)-Ủy ban nhân dân quận vừa ban hành Kế hoạch triển khai thực hiện công tác tuyên truyền phòng, chống ma túy hưởng ứng “Tháng hành động phòng, chống ma túy, mại dâm” và “Ngày toàn dân phòng, chống ma túy 26 tháng 6” Năm 2015.
 
Theo đó, Nâng cao ý thức, trách nhiệm đấu tranh phòng, chống ma túy trong toàn hệ thống chính trị trên ...">
                                Tuyên truyền phòng, chống ma túy
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews3" href="http://www.quan2.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=To%c3%a0n+d%c3%a2n+%c4%91o%c3%a0n+k%e1%ba%bft+x%c3%a2y+d%e1%bb%b1ng+%c4%91%e1%bb%9di+s%e1%bb%91ng+v%c4%83n+h%c3%b3a&ItemID=7048&Mode=1" class="a-hot-link" title="(Website Quận 2)-Ủy ban nhân dân quận vừa ban hành Kế hoạch tổ chức tiếp xúc, vận động các hộ dân có nhà đất giải tỏa trong Khu đô mới Thủ Thiêm đang ở Khu tạm cư An Lợi Đông, phường An Lợi Đông, quận 2 nhận căn hộ chung cư theo tiêu chuẩn tái định cư được hưởng.
 
Theo đó, Để chấm dứt việc ở nhà tạm cư tại Khu tạm cư An Lợi Đông, phường An Lợi ...">
                                Tiếp xúc, vận động các hộ dân có nhà đất giải tỏa tại phường An Lợi Đông
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews4" href="http://www.quan2.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=Kinh+t%e1%ba%bf&ItemID=7047&Mode=1" class="a-hot-link" title="(Website Quận 2)-Ủy ban nhân dân quận 2 vừa ban hành kế hoạch thực hiện Chương trình bình ổn thị trường các mặt hàng dược phẩm thiết yếu trên địa bàn quận năm 2015 - 2016. 
 
Theo đó, Chương trình bình ổn thị trường các mặt hàng thuốc thiết yếu trên địa bàn quận năm 2015 - 2016 triển khai để đảm bảo cân đối cung - cầu hàng hóa, ...">
                                Bình ổn thị trường các mặt hàng dược phẩm thiết yếu
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews5" href="http://www.quan2.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=Th%c3%b4ng+tin+t%e1%bb%95ng+h%e1%bb%a3p&ItemID=7046&Mode=1" class="a-hot-link" title="(Website Quận 2)-Ủy ban nhân dân quận 2 vừa ban hành Kế hoạch tổ chức thực hiện công tác xây dựng, quản lý và khai thác tủ sách pháp luật trên địa bàn quận 2 năm 2015.
 
Theo đó, Đảm bảo Tủ sách pháp luật được bổ sung hàng năm theo quy định tại Quyết định số 06/2010/QĐ-TTg ngày 25/01/2010 của Thủ tướng Chính phủ; Loại bỏ các loại sách đã hết ...">
                                Xây dựng, quản lý và khai thác tủ sách pháp luật
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            
                                Quận 2 tổ chức hội nghị chuyên đề nâng cao chất lượng  Cuộc vận động Vì người nghèo
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews7" href="http://www.quan2.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=Ho%e1%ba%a1t+%c4%91%e1%bb%99ng+%c4%90%e1%ba%a3ng+-+%c4%90o%c3%a0n+th%e1%bb%83&ItemID=7051&Mode=1" class="a-hot-link" title="(Website Quận 2)-Hơn 97 bạn đoàn viên, thanh niên Quận 2 đã tham gia buổi sinh hoạt chuyên đề Câu lạc bộ Lý luận trẻ quý II, năm 2015 vào sáng ngày 13/6. Chương trình hướng tới kỷ niệm 100 năm Ngày sinh Tổng Bí thư Nguyễn Văn Linh (01/7/1915 – 01/7/2015). 
Thạc sĩ Đoàn Hùng Vũ Hưng, Phó Giám đốc Trung tâm Thông tin công tác tư tưởng – Ban Tuyên ...">
                                Sinh hoạt chuyên đề “Mỗi thanh niên hãy sống những ngày đẹp nhất; Hãy bắt tay vào những công việc nhỏ, bình thường hàng ngày nhưng có ích cho đời”
                            
                        
                    
                    
                
                
            
            
        
    


				
			
		
	


						
						
						
								

	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveLink(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }




						
    
        
            
            
            
            
            
            
        
    

					

 
						
    
        
            
             
        
        
    

					

				
			
		
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveLink(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }




						
					

 
						
    
        
            
             
        
        
    

					

				
			
		
	


						

						
						
					
						
							
									

							
								
									
									
										
											&nbsp;
											
											
												
													
														
				
				
				
				Khởi chạy Nhanh
				Xem Tất cả Nội dung trang Web
		   



    
        Hạn chế tối đa tình trạng giải quyết đơn kéo dài, quá hạn và vượt cấp
    &nbsp;*&nbsp;

    
        Triển khai nạo vét rạch trong Khu đô thị mới Thủ Thiêm
    &nbsp;*&nbsp;

    
        Hội nghị chuyên đề thực hiện nếp sống văn minh  trong việc cưới – việc tang
    &nbsp;*&nbsp;
                       


				
				
				
		
		
		
		
		
		
				
				
			  
														
														
													
												
												
													
													
													
												
											
										
										
										
										
										
									
								
								
								
								

								
								
								
		
								
									
										
										
										
											
													
	
		
							
			
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveLink(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }




						&nbsp;

					

 
						
    
        
            
             
        
        
    

					

				
			
		
	
				
			
		
		
			
	
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=Th%c3%b4ng+tin+t%e1%bb%95ng+h%e1%bb%a3p&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    Thông tin tổng hợp
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Xây dựng, quản lý và khai thác tủ sách pháp luật
                            
                            
                        
                    
                    
                        
                            
                            
                                
                                    
                                        
                                            
                                        
                                    
                                
                            
                            
                            
                                (Website Quận 2)-Ủy ban nhân dân quận 2 vừa ban hành Kế hoạch tổ chức thực hiện công tác xây dựng, quản lý và khai thác tủ sách pháp luật trên địa bàn quận 2 năm 2015.
 
Theo đó, Đảm bảo Tủ sách pháp luật được bổ sung hàng năm theo quy định tại Quyết định số 06/2010/QĐ-TTg ngày 25/01/2010 của Thủ tướng Chính phủ; Loại bỏ các loại sách đã hết ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Phòng, chống tác hại thuốc lá
                            
                            
                            &nbsp;(05/06)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Trường Cao Đẳng Nghề thông tin tuyển sinh năm 2015
                            
                            
                            &nbsp;(02/06)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Quận 2 tiếp và làm việc Đoàn công tác quận Nam-gu, thành phố Gwanju, Hàn Quốc
                            
                            
                            &nbsp;(26/05)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	

			
			
							
			
	
		
			
				
					
			
			
			
		
            
                <a class="a_header_style1" href="/pages/van-hoa-xa-hoi-co-so.aspx" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    VĂN HÓA - XÃ HỘI VÀ VĂN HÓA CƠ SỞ
                
                      
        
    
	
				
			
		
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=v%c4%83n+h%c3%b3a+-+x%c3%a3+h%e1%bb%99i&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    VĂN HÓA - XÃ HỘI VÀ VĂN HÓA CƠ SỞ
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Tuyên truyền phòng, chống ma túy
                            
                            
                        
                    
                    
                        
                            
                            
                                (Website Quận 2)-Ủy ban nhân dân quận vừa ban hành Kế hoạch triển khai thực hiện công tác tuyên truyền phòng, chống ma túy hưởng ứng “Tháng hành động phòng, chống ma túy, mại dâm” và “Ngày toàn dân phòng, chống ma túy 26 tháng 6” Năm 2015.
 
Theo đó, Nâng cao ý thức, trách nhiệm đấu tranh phòng, chống ma túy trong toàn hệ thống chính trị trên ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Tuyển 2 chức danh lãnh đạo, quản lý cấp phòng
                            
                            
                            &nbsp;(05/06)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                4 đoàn thăm cơ sở tôn giáo nhân dịp ngày lễ Phật đản PL: 2559 - DL: 2015
                            
                            
                            &nbsp;(02/06)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Khai mạc hè năm 2015
                            
                            
                            &nbsp;(01/06)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	
		
			
				
					




                    				Xem tiếp
                				 
								
				
			
		
	
				
			
		
		
							
			
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=Kinh+t%e1%ba%bf&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    Kinh tế
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Bình ổn thị trường các mặt hàng dược phẩm thiết yếu
                            
                            
                        
                    
                    
                        
                            
                            
                                
                                    
                                        
                                            
                                        
                                    
                                
                            
                            
                            
                                (Website Quận 2)-Ủy ban nhân dân quận 2 vừa ban hành kế hoạch thực hiện Chương trình bình ổn thị trường các mặt hàng dược phẩm thiết yếu trên địa bàn quận năm 2015 - 2016. 
 
Theo đó, Chương trình bình ổn thị trường các mặt hàng thuốc thiết yếu trên địa bàn quận năm 2015 - 2016 triển khai để đảm bảo cân đối cung - cầu hàng hóa, ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Kéo dài thời gian trả nợ
                            
                            
                            &nbsp;(11/06)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Triển khai vớt lục bình, rác thải trên sông, kênh, rạch
                            
                            
                            &nbsp;(05/06)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Cho kéo dài thời gian trả nợ đối với người có đất bị thu hồi
                            
                            
                            &nbsp;(02/06)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	

			
			
							
			
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=Qu%e1%ba%a3n+l%c3%bd+%c4%91%c3%b4+th%e1%bb%8b&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    Quản lý đô thị
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Triển khai nạo vét rạch trong Khu đô thị mới Thủ Thiêm
                            
                            
                        
                    
                    
                        
                            
                            
                                
                                    
                                        
                                            
                                        
                                    
                                
                            
                            
                            
                                (Website Quận 2) - UBND TP đã chấp thuận cho Ban Quản lý Đầu tư - Xây dựng Khu đô thị mới Thủ Thiêm triển khai đầu tư xây dựng dự án nạo vét rạch, đào hồ trung tâm và các kênh mới kết hợp với xây dựng kè bờ, công viên, cây xanh ven các kênh, rạch và hồ; trong đó có thiết kế hệ thống tưới tự động, sử dụng nguồn nước từ hồ trung tâm - hồ cảnh quan ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Đẩy nhanh tiến độ thi công dự án mở rộng Xa lộ Hà Nội
                            
                            
                            &nbsp;(12/06)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Phân luồng giao thông phục vụ thi công nâng cấp phần đường Trần Não
                            
                            
                            &nbsp;(05/06)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Cho đầu tư Dự án tại 02 Lô đất số 1-3 và 3-5 trong Khu đô thị mới Thủ Thiêm
                            
                            
                            &nbsp;(02/06)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	

			
		
			
							
			
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=An+ninh+-+qu%e1%bb%91c+ph%c3%b2ng&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    An ninh - quốc phòng
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Hạn chế tối đa tình trạng giải quyết đơn kéo dài, quá hạn và vượt cấp
                            
                            
                        
                    
                    
                        
                            
                            
                                (Website Quận 2) - UBND TP đã chỉ đạo các UBND các quận-huyện tăng cường công tác tiếp công dân, giải quyết khiếu nại, tố cáo; nắm chắc tình hình khiếu nại đông người để kịp thời giải quyết tại cơ sở; thực hiện nghiêm túc việc tổ chức đối thoại và tái đối thoại với công dân trong quá trình giải quyết; hạn chế tối đa tình trạng đơn giải quyết tồn ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Khắc phục hư hỏng mặt đường trên đại lộ Mai Chí Thọ
                            
                            
                            &nbsp;(05/06)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Phường Bình An: Hướng dẫn, cấp mới, đổi chứng minh nhân dân cho hơn 40 trường hợp
                            
                            
                            &nbsp;(25/05)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Tập trung chuyển hóa các địa bàn phức tạp về ma túy
                            
                            
                            &nbsp;(22/05)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=Tin+V%e1%ba%afn&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    Tin Vắn
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Hội nghị chuyên đề thực hiện nếp sống văn minh  trong việc cưới – việc tang
                            
                            
                        
                    
                    
                        
                            
                            
                                
                                    
                                        
                                            
                                        
                                    
                                
                            
                            
                            
                                 Nhằm thực hiện tốt cuộc vận động “Toàn dân đoàn kết xây dựng đời sống văn hóa ở khu dân cư”, nâng cao nhận thức và tạo sự chuyển biến mạnh mẽ trong các tầng lớp nhân dân về thực hiện nếp sống văn minh trong việc cưới, việc tang tại khu dân cư. Vào lúc 17h30 ngày 15/6/2015, tại Ban điều hành khu phố 4 (chung cư Bình Trưng) phường Bình Trưng Đông ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Quận 2 tổ chức hội nghị chuyên đề nâng cao chất lượng  Cuộc vận động Vì người nghèo
                            
                            
                            &nbsp;(12/06)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Tăng cường công tác đấu tranh chống buôn lậu, gian lận thương mại và hàng giả
                            
                            
                            &nbsp;(11/06)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Tập huấn nâng cao kỹ năng  tổ chức xây dựng đời sống văn hóa ở cơ sở năm 2015
                            
                            
                            &nbsp;(10/06)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	
			
			
			
							
			
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=Ho%e1%ba%a1t+%c4%91%e1%bb%99ng+%c4%90%e1%ba%a3ng+-+%c4%90o%c3%a0n+th%e1%bb%83&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    Hoạt động Đảng - Đoàn thể
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Các hoạt động Ngày Gia đình Việt Nam 28/6
                            
                            
                        
                    
                    
                        
                            
                            
                                (Website Quận 2)-Ủy ban nhân dân quận 2 vừa ban hành kế hoạch tổ chức hoạt động Ngày Gia đình Việt Nam 28/6.
 
Theo đó, nâng cao nhận thức của xã hội về vị trí, vai trò của gia đình, về chủ trương, pháp luật, chính sách của Đảng và nhà nước liên quan đến gia đình; về quyền, nghĩa vụ của gia đình, các cơ quan liên quan đến gia đình; về kỹ năng ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Sinh hoạt chuyên đề “Mỗi thanh niên hãy sống những ngày đẹp nhất; Hãy bắt tay vào những công việc nhỏ, bình thường hàng ngày nhưng có ích cho đời”
                            
                            
                            &nbsp;(12/06)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Từ nay đến hết năm 2016: Không tăng biên chế công chức, viên chức
                            
                            
                            &nbsp;(11/06)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Ngày 06/06/2015, ra quân tổng vệ sinh
                            
                            
                            &nbsp;(05/06)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=To%c3%a0n+d%c3%a2n+%c4%91o%c3%a0n+k%e1%ba%bft+x%c3%a2y+d%e1%bb%b1ng+%c4%91%e1%bb%9di+s%e1%bb%91ng+v%c4%83n+h%c3%b3a&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    Toàn dân đoàn kết xây dựng đời sống văn hóa
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Tiếp xúc, vận động các hộ dân có nhà đất giải tỏa tại phường An Lợi Đông
                            
                            
                        
                    
                    
                        
                            
                            
                                
                                    
                                        
                                            
                                        
                                    
                                
                            
                            
                            
                                (Website Quận 2)-Ủy ban nhân dân quận vừa ban hành Kế hoạch tổ chức tiếp xúc, vận động các hộ dân có nhà đất giải tỏa trong Khu đô mới Thủ Thiêm đang ở Khu tạm cư An Lợi Đông, phường An Lợi Đông, quận 2 nhận căn hộ chung cư theo tiêu chuẩn tái định cư được hưởng.
 
Theo đó, Để chấm dứt việc ở nhà tạm cư tại Khu tạm cư An Lợi Đông, phường An Lợi ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Phân luồng giao thông nhánh cầu B nút giao thông Cát Lái
                            
                            
                            &nbsp;(05/06)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Xử lý các phương tiện vận chuyển vật liệu làm rơi vãi trên đường gây ô nhiễm môi trường
                            
                            
                            &nbsp;(01/06)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Kết nối đường tạm từ đường Trịnh Khắc Lập ra đường Đồng Văn Cống
                            
                            
                            &nbsp;(15/05)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	
	
			
		
		
							
				
			
				
	
	

											
										
										
									
		
	  														
								
								
									
								
								
	
	
		
			
				
					
    
    
    


    var jLeftMenu = jQuery.noConflict();
    jLeftMenu(function($) {

        $("div.ms-navheader").mouseover(function() {

            $(this).addClass("heading-hover");

        }).mouseout(function() {
            $(this).removeClass("heading-hover");
        });
        $("div.ms-navheader-icon").mouseover(function() {
            $(this).addClass("heading-hover");

        }).mouseout(function() {
            $(this).removeClass("heading-hover");
        });
        $("div.ms-navItem").mouseover(function() {
            $(this).addClass("ms-navItem-hover");
        }).mouseout(function() {
            $(this).removeClass("ms-navItem-hover");
        });
        $("div.ms-navItem-icon").mouseover(function() {
            $(this).addClass("ms-navItem-hover");
        }).mouseout(function() {
            $(this).removeClass("ms-navItem-hover");
        });
    });

    
   
 

						DỊCH VỤ C&#212;NGGiới thiệu dịch vụ c&#244;ngHướng dẫn quy tr&#236;nh DVC cấp 3Dịch vụ c&#244;ng trực tuyến cấp 3Đăng k&#253; dịch vụ c&#244;ngG&#211;P &#221;G&#243;p &#253; văn bản quy phạm ph&#225;p luậtG&#243;p &#253; văn bản dự thảo
					



				
			
		
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveLink(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }




						



    
        
            
            Trang web li&ecirc;n kết
            Hồ Ch&iacute; Minh city web
            Bộ Tư Ph&aacute;p
            B&aacute;o Ph&aacute;p Luật TPHCM
            Trung T&acirc;m Dịch Vụ Đấu Gi&aacute;
            Quận 1
            Quận 2
            Quận 3
            Quận 4
            Quận 5
            Quận 6
            Quận 7
            Quận 8
            Quận 9
            Quận 10
            Quận 11
            Quận 12
            Quận B&igrave;nh T&acirc;n
            Quận B&igrave;nh Thạnh
            Quận G&ograve; Vấp
            Quận Ph&uacute; Nhuận
            Quận T&acirc;n B&igrave;nh
            Quận T&acirc;n Ph&uacute;
            Quận Thủ Đức
            Huyện B&igrave;nh Ch&aacute;nh
            Huyện Cần Giờ
            Huyện Củ Chi
            Huyện H&oacute;c M&ocirc;n
            Huyện Nh&agrave; B&egrave;
            Sở T&agrave;i ch&iacute;nh
            Sở Nội vụ
            Sở Y tế
            Sở C&ocirc;ng Thương
            Sở Tư ph&aacute;p
            Sở X&acirc;y dựng
            Sở N&ocirc;ng nghiệp v&agrave; PTNT
            Sở Gi&aacute;o dục v&agrave; &ETH;&agrave;o tạo
            Sở T&agrave;i nguy&ecirc;n v&agrave; M&ocirc;i trường
            Sở Kế hoạch v&agrave; &ETH;ầu tư
            Sở Khoa học v&agrave; C&ocirc;ng nghệ
            Sở Văn h&oacute;a, Thể thao v&agrave; Du lịch
            Sở Giao th&ocirc;ng Vận tải
            Sở LĐ-TB-XH
            Sở Quy hoạch Kiến tr&uacute;c
            Sở Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng
            Cục Thống k&ecirc;
            Sở CS PCCC
            
        
    




					

 
						
    
        
            
             
        
        
    

					

				
			
		
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveLink(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }




						-->













					

 
						
    
        
            
             
        
        
    

					

				
			
		
	
		
			
				
					


  










    var transiteTime = parseInt(''3500'');

    var albumbox = jQuery.noConflict();
    albumbox(document).ready(function() {

        var optionsLeft = {
            caption: ''hover'',
            opacity: 0.8,
            easing: ''swing'',
            widthimg:''194'',
            duration: 240
        }

        var optionsRight = {
            caption: ''hover'',
            opacity: 0.8,
            navigation: ''hover'',
            direction: ''left'',
            easing: ''swing'',
            widthimg: ''194'',
            duration: 240
        }
        var gt = albumbox(''#ppy1'').position().left;

        var duy;
        if (gt > 500)
            albumbox(''div#ppy1'').popeye(optionsRight);
        else
            albumbox(''div#ppy1'').popeye(optionsLeft);

        albumbox(''div.ppy-nav'').hide();
        var flag = true;

        albumbox.doTimeout(transiteTime, function() {
            if (flag == false)
                return false;

            
            albumbox(''a.ppy-next1'').click();
            return true;
        });

        albumbox(''a.ppy-next'').click(function() {
            flag = false;
        });
        albumbox(''a.ppy-prev'').click(function() {
            flag = false;
        });

    });
    
   



        
            
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
            
            
                
                    
                        HÌNH ẢNH HOẠT ĐỘNG
                
                
                    
                
                
                    
                        Previous image 
                        Next image 
                        Enlarge
                        Close
                    
                
                
                
                    Xem tất cả
                
            
        
        Next image
        
				
			
		
	
		
			
				
					









    var vbox = jQuery.noConflict();

        var width = ''220'' + "px";
        var height = ''220'' + "px";
        vbox(document).ready(function() {

        if (vbox("#ctl00_m_g_562fc11f_c876_4be9_972c_545f4ad1c13f_ctl00_listvideobox").children("li").length <= 1) {
            vbox("#ctl00_m_g_562fc11f_c876_4be9_972c_545f4ad1c13f_ctl00_listvideobox").parent().hide();
        }
        
        if (''True'' == ''True'') {

                vbox(''li.item-videobox'').live(''click'', function() {
                    var gt = vbox(this).attr(''linkVideo'');
                    var thumbnail = vbox(this).attr(''thumbnail'');
                    var videoplayer = vbox(this).attr(''videoplayer'');

                    jwplayer(videoplayer).setup({
                        flashplayer: "/_LAYOUTS/LacVietBio/UserControls/PhotoAlbum/images/player4.6.swf",
                        autostart: true,
                        file: gt,
                        image: thumbnail,
                        height: height,
                        width: width
                    });
                });
           
            
        }
    });
    





    
         VIDEO HOẠT ĐỘNG
        
        
        
            
                
                
                    KỶ NIỆM 15 NĂM THÀNH LẬP QUẬN 2 - P.1
             
                
                    KỶ NIỆM 15 NĂM THÀNH LẬP QUẬN 2 - P.2
             
                
                    Bắn pháo hoa dịp tết Quý Tỵ 2013
             
                
                    Hội thi nấu bánh tét xuân Quý Tỵ 2013
             
                
                    Hội xuân Quý Tỵ 2013-Quận đoàn
             
                
                    Khai mạc hội xuân chợ hoa tết Quý Tỵ 2013
             
                
                    Chuyện về vùng đất mới quận 2
             
                
                    Bước chuyển mới trong việc xây dựng Chính quyền điện tử 
             
                
                    Đảng bộ Quận 2 với chương trình "Vì dân phục vụ"
             
                
                    Quận 2: Chuyển biến trong công tác giải quyết đơn thu khiếu nại của người dân
             
                
                    Gương học tập và làm theo tấm gương đạo đức, phong cách Hồ Chí Minh
             
                
                    Tuyên truyền tiết kiệm điện P.1
             
                
                    Tuyên truyền tiết kiệm điện P.2
             
                
                    KT-XH 9 thang 2014
             
                
                    Thành phố Hồ Chí Minh
             
        
    





    var linkFirstVideo = vbox("#ctl00_m_g_562fc11f_c876_4be9_972c_545f4ad1c13f_ctl00_listvideobox").children("li").eq(0).attr(''linkvideo'');
    var firstThumbnail = vbox("#ctl00_m_g_562fc11f_c876_4be9_972c_545f4ad1c13f_ctl00_listvideobox").children("li").eq(0).attr(''thumbnail'');
    jwplayer("ctl00_m_g_562fc11f_c876_4be9_972c_545f4ad1c13f_ctl00_dvnduymainvideo").setup({
        flashplayer: "/_LAYOUTS/LacVietBio/UserControls/PhotoAlbum/images/player4.6.swf",
        file: linkFirstVideo,
        image: firstThumbnail,
        height: height,
        width: width
    });



				
			
		
	
		
			
				
					

 VIDEO CẢI C&Aacute;CH H&Agrave;NH CH&Iacute;NH



&nbsp;
&nbsp;
&nbsp;
				
			
		
	


								
								
							
							
						
						
						
							
			
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveLink(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }




						
.midlebota li img{
	
}



 
    
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    
     								
    
    
					

 
						
    
        
            
             
        
        
    

					

				
			
		
	
	

						
						
						
								
								
									
									
								  www.quan2.hochiminhcity.gov.vn thuộc 
									Ủy ban nhân dân Quận 2 
									ỦY BAN NHÂN DÂN QUẬN 2 -CÁC PHÒNG BAN CHUYÊN 
									MÔN VÀ VĂN PHÒNG ĐĂNG KÝ SỬ DỤNG ĐẤT
									168 Trương Văn Bang, khu phố 1, P.Thạnh Mỹ 
									Lợi, Q.2, TP.HCM
									ĐT: (84.8).37400509; Fax: (84.8).37470225; 
									Email: q2@tphcm.gov.vn
									KHU HC – TIẾP CÔNG DÂN 45 Nguyễn Thanh Sơn, 
									khu phố 1, P.Thạnh Mỹ Lợi, Q.2 ĐT: 
									(84.8).3747 0174
								
															
				
							
																						
									
	
		
			
				&nbsp;
			
		
	
		
			


    
        
            
                SỐ LƯỢT TRUY CẬP
        
        
            
                
                    
                        
				
					
                                
                                    
                                        
                                            
                                                1
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                2
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                5
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                4
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                5
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                8
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                5
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                3
                                        
                                    
                                
                            
				
			
                    
                
            
        
    
 

    
		
	

								
																								

						
						
							
							
							
							
						
					
					
						
							

.ms-bodyareaframe {	padding: 0px;}


								

TD.ms-titleareaframe, .ms-pagetitleareaframe {	height: 10px;}
Div.ms-titleareaframe {	height: 100%;}
.ms-pagetitleareaframe table {	background: none;	height: 0px;}


									
	
	
		 
			
				
					
						Trang web Này: UBND QUẬN 2

					
				
			
		
	


									
									
									
	


										
	
									
		 							

								
		
  
								
								
							


//<![CDATA[
var __wpmExportWarning=''This Web Part Page has been personalized. As a result, one or more Web Part properties may contain confidential information. Make sure the properties contain information that is safe for others to read. After exporting this Web Part, view properties in the Web Part description file (.WebPart) by using a text editor such as Microsoft Notepad.'';var __wpmCloseProviderWarning=''You are about to close this Web Part.  It is currently providing data to other Web Parts, and these connections will be deleted if this Web Part is closed.  To close this Web Part, click OK.  To keep this Web Part, click Cancel.'';var __wpmDeleteWarning=''You are about to permanently delete this Web Part.  Are you sure you want to do this?  To delete this Web Part, click OK.  To keep this Web Part, click Cancel.'';_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;//]]>

 

             
          
            function checkUrl(myArray) {

                
                if (!document.getElementById || !document.getElementsByTagName) return false;
                if (!document.getElementById(myArray)) return false;
                var links = document.getElementById(myArray);
                var node = findNode(links);
                
                if (node!=''-1'') {
                    var node_temp = node;
                    if (location.href.indexOf(''?'') != -1) {
                        var indexClass = jLeftMenu(node).parent().attr(''class'');
                       
                        if (indexClass.indexOf("ms-navItem") != -1) {

                            addClass(node_temp.parentNode, ''ms-navItem-selected'');
                            
                        }
                        if (indexClass.indexOf(''ms-navheader'') != -1) {

                            addClass(node_temp.parentNode, ''ms-navheader-selected'');
                            
                        }
                        while (node_temp.parentNode.id != myArray) {

                            if (node_temp.parentNode.id.split(''_'')[0].match(''ul'')) {

                                showMenu(node_temp.parentNode);
                            }
                            if (node_temp.parentNode.parentNode.id == myArray) {

                                if (node_temp.parentNode.id.split(''_'')[0].match(''li'')) {
                                    var temp = node_temp.parentNode.getElementsByTagName(''UL'');

                                    for (var i = 0; i < temp.length; i++) {

                                        if (node.parentNode.parentNode.id == temp[i].parentNode.id) {

                                            showMenu(temp[i]);
                                        }
                                    }
                                }
                            }

                            node_temp = node_temp.parentNode;
                        }
                    }
                    else {
                        var indexClass = $(node).parent().attr(''class'');
                        if (indexClass.indexOf(''ms-navItem'') != -1) {

                            addClass(node_temp.parentNode, ''ms-navItem-selected'');
                            
                        }
                        if (indexClass.indexOf(''ms-navheader'') != -1) {

                            addClass(node_temp.parentNode, ''ms-navheader-selected'');
                            
                        }
                        while (node_temp.parentNode.id != myArray) {

                            if (node_temp.parentNode.id.split(''_'')[0].match(''ul'')) {

                                showMenu(node_temp.parentNode);
                            }
                            if (node_temp.parentNode.parentNode.id ==myArray) {

                                if (node_temp.parentNode.id.split(''_'')[0].match(''li'')) {
                                    var temp = node_temp.parentNode.getElementsByTagName(''UL'');

                                    for (var i = 0; i < temp.length; i++) {

                                        if (node.parentNode.parentNode.id == temp[i].parentNode.id) {

                                            showMenu(temp[i]);
                                        }
                                    }
                                }
                            }
                            node_temp = node_temp.parentNode;
                        }
                    }
                }
            }
     
    
    function toggleMenu2param(node, link) {
        
        if (!document.getElementById) return false;
        if (!link) return false;
        hideallmenusamelevel(node);
        if (!node) location.href = link;

        var old_class;
        old_class=node.parentNode.className;
        if (node.className == ''classhide'') {
            node.className = ''classshow'';
            
            node.parentNode.className=old_class + '' seleted-leftmenu'';
        }
        else {
            node.className = ''classhide'';
          
            node.parentNode.className=old_class.split('' '')[0] ;
        }
    }
    function toggleMenu(node) {
     
        if (!document.getElementById) return false;
        hideallmenusamelevel(node);
        var old_class;
        old_class=node.parentNode.className;

        if (node.className == ''classhide'') {
            node.className = ''classshow'';
            
       
            
            node.parentNode.className= old_class + '' seleted-leftmenu'';

        }
        else {
            node.className = ''classhide'';
            //alert(old_class.split('' '')[0]);
            node.parentNode.className=old_class.split('' '')[0] ;
        }
    }
    function findNode(obj) {
        if (obj == null) return false;
        var elements = obj.getElementsByTagName(''a'');
        if (location.href.indexOf(''?'') != -1) {
            for (i = 0; i < elements.length; i++) {
                if (elements[i].href.indexOf(''?'') != -1) {
                    if (location.href.toLowerCase().match(elements[i].href.split(''?'')[0].toLowerCase()) && location.href.split(''?'')[1].toLowerCase() == elements[i].href.split(''?'')[1].toLowerCase() && elements[i].href.split(''?'')[1].length == location.href.split(''?'')[1].length) {

                        return elements[i];
                    }
                }
            }
        }
        else {
            for (i = 0; i < elements.length; i++) {
                if (location.href.toLowerCase().match(elements[i].href.toLowerCase())) {

                    return elements[i];
                }
            }
        }
        return ''-1'';
    }

    function showMenu(node) {
        if (!document.getElementById) return false;

        if (node.className == ''classhide'') {
            node.className = ''classshow'';
        }
        else {
            node.className = ''classshow'';
        }
    }
    function hideallmenusamelevel(currentnode) {
 
        var currentlevel = currentnode.id.split(''ul'')[1].split(''_'')[0];

        var links = currentnode.parentNode.parentNode.getElementsByTagName(''ul'');


        for (var i = 0; i < links.length; i++) {


            oneul = links[i];

            if (oneul) {

                oneid = oneul.id;
                onelevel = oneul.id.split(''ul'')[1].split(''_'')[0];
                if (onelevel >= currentlevel && oneul != currentnode) {
                    hideonemenu(oneul);
                }
            }
        }
    }
    function hideonemenu(node) {
        if (!document.getElementById) return false;
        if (!node) return false;

        node.className = ''classhide'';
    }
   function addClass(element, value) {

            if (!element.className) {
                element.className = value;
            } else {
                newClassName = element.className;
                newClassName += '' '';
                newClassName += value;
                element.className = newClassName;
            }
        }
        



checkUrl(''menuproduct_156accf2-fb75-433d-bf3b-4439c842a2e5'');


//<![CDATA[
_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;//]]>


<!--
function S3ECAFFF8_Submit() {GoSearch(null,''ctl00_g_27b21a40_cc5a_4b2b_ad2f_45cfe4fe8a5e_S3ECAFFF8_InputKeywords'',null,true,false,null,null,null,null,''\u002fpages\u002fketquatk.aspx'', ''Trang web Này'',''Danh sách Này'', ''Thư mục Này'', ''Trang web Có liên quan'', ''\u002f_layouts\u002fOSSSearchResults.aspx'');}
// -->

// append an onload event handler
var S3ECAFFF8__onload= document.body.onload;
if(typeof document.body.onload == ''function'')
{
 document.body.onload = function()
 {
S3ECAFFF8__onload();        
  document.getElementById(''ctl00_g_27b21a40_cc5a_4b2b_ad2f_45cfe4fe8a5e_S3ECAFFF8_InputKeywords'').name = ''InputKeywords'';
 }
}
else
{
 document.body.onload = function()
 {
  eval(S3ECAFFF8__onload);        
  document.getElementById(''ctl00_g_27b21a40_cc5a_4b2b_ad2f_45cfe4fe8a5e_S3ECAFFF8_InputKeywords'').name = ''InputKeywords'';
 }
}

function S3ECAFFF8_OSBEK(event1) { 
if((event1.which == 10) || (event1.which == 13))
{   
S3ECAFFF8_Submit();
}
}
// -->

<!--
function S3031AEBB_Submit() {GoSearch(null,''ctl00_PlaceHolderSearchArea_ctl01_S3031AEBB_InputKeywords'',null,true,true,''ctl00_PlaceHolderSearchArea_ctl01_SBScopesDDL'',''ctl00_PlaceHolderSearchArea_ctl01_ctl00'',null,null,''http:\u002f\u002fwww.quan2.hochiminhcity.gov.vn\u002f_layouts\u002fOSSSearchResults.aspx'', ''Trang web Này'',''Danh sách Này'', ''Thư mục Này'', ''Trang web Có liên quan'', ''\u002f_layouts\u002fOSSSearchResults.aspx'');}
// -->

// append an onload event handler
var S3031AEBB__onload= document.body.onload;
if(typeof document.body.onload == ''function'')
{
 document.body.onload = function()
 {
S3031AEBB__onload();        
  document.getElementById(''ctl00_PlaceHolderSearchArea_ctl01_S3031AEBB_InputKeywords'').name = ''InputKeywords'';
 }
}
else
{
 document.body.onload = function()
 {
  eval(S3031AEBB__onload);        
  document.getElementById(''ctl00_PlaceHolderSearchArea_ctl01_S3031AEBB_InputKeywords'').name = ''InputKeywords'';
 }
}

function S3031AEBB_OSBEK(event1) { 
if((event1.which == 10) || (event1.which == 13))
{   
S3031AEBB_Submit();
}
}
// -->




//<![CDATA[
Sys.Application.initialize();
//]]>', CAST(N'2015-06-18 00:58:37.333' AS DateTime), N'Safe', 1)
INSERT [dbo].[TEXT_CONTENT] ([ContentID], [Content], [TimeCheck], [TextResult], [WebID]) VALUES (2, N'window.status = "";

    dauCu = 0;
    setMethod(0);

    function printDate (){
	    var the_date = new Date();
	    var day=new Array("Ch&#7911; nh&#7853;t","Th&#7913; hai","Th&#7913; ba","Th&#7913; t&#432;","Th&#7913; n&#259;m","Th&#7913; s&aacute;u","Th&#7913; b&#7843;y");
	    var date=the_date.getDate();
	    var month=new Array("1","2","3","4","5","6","7","8","9","10","11","12");
	    if(date<10){date="0"+date};
		    document.write(day[the_date.getDay()]+", ng&agrave;y "+date+" th&aacute;ng "+month[the_date.getMonth()]+" n&#259;m "+the_date.getFullYear())
		}
		function displayOption(td) {		
		 window.location = "http://www.quan1.hochiminhcity.gov.vn/Portal/vanbanquyphamphapluat/default.aspx?keyword=1?chuyenmuc=175?thang=" + td + "?nam=" + document.getElementById(''select100000000'').options[document.getElementById(''select100000000'').selectedIndex].value;
		}
    
    




	UBND Quan 1 - Trang chủ

  


 
    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/vi_VN/all.js#xfbml=1&appId=1461583574128954";
        fjs.parentNode.insertBefore(js, fjs);
    } (document, ''script'', ''facebook-jssdk''));
    







//<![CDATA[
function SurveyDisplay_CallServer(arg, context) { WebForm_DoCallback(''ctl00$MiddlePlaceHolder$WebPartManagerPanel1$WebPartController1$wp1788598134$wp2143517606'',arg,SurveyDisplay_ReceiveServerData,context,null,false)} ;function BottomHomeDisplay_CallServer(arg, context) { WebForm_DoCallback(''ctl00$MiddlePlaceHolder$WebPartManagerPanel1$WebPartController1$wp963569413$wp1664732039'',arg,BottomHomeDisplay_ReceiveServerData,context,null,false)} ;//]]>




//<![CDATA[
if (typeof(Sys) === ''undefined'') throw new Error(''ASP.NET Ajax client-side framework failed to load.'');
//]]>











	
	
 
    
        
           
			Số lượng truy cập: 5535147
        
        
            
                       
                
                       
                
                           
                
                       
            	
            
                
                    
                        printDate();
		            
			    
                
                    http://www.quan1.hochiminhcity.gov.vn
                            
			
        
        TIN TỨC - SỰ KIỆNChính trị - Xã hộiTuyên truyền Pháp luậtHội thi phòng cháy chữa cháy An ninh - Trật tựKinh tếCải cách hành chínhBộ thủ tục hành chính chungMẫu văn bản thông tư số 01/2011/TT-BNVVB của các phòng thuộc QuậnVB của PhườngVB của QuậnVB QPPL của Quận Hội thi CBCC thân thiệnNhắn tin SMS Kiểm soát thủ tục hành chínhNếp sống văn minh đô thịHàng rong Phòng cháy chữa cháyPhong trào - Đoàn thểTruyền thốngVăn hóa - Nghệ ThuậtCông khai ngân sáchNông thôn mới GIỚI THIỆU QUẬN 1Thông tin chungBản đồ quận 1Sơ đồ tổ chức Địa điểm tham quanDi tíchCơ sở tôn giáoCông viênKhu vui chơi, giải tríKhách sạnNhà hàng, quán ănMua sắmDịch vụ lữ hành Công trình phúc lợi xã hộiQuy hoạch phát triểnĐịnh hướng phát triểnQuy mô - Chức năngThông tin quy hoạch  HÀNH CHÍNH VÀ DỊCH VỤ CÔNGHướng dẫn thủ tụcĐăng ký kinh doanhXây dựng - Đô thịTài nguyên - Môi trườngQuảng cáo - VHTTLao động - TBXHChứng thực - Hộ tịchY tếPCCCThống kêLĩnh vực Văn phòng Dịch vụ trực tuyếnĐăng ký lao độngĐăng ký kinh doanhCấp bản sao hộ tịchTra cứu thông tin hồ sơĐăng ký kinh doanh Hồ sơ xây dựng Đăng ký lao động Hồ sơ văn hóa Hồ sơ hợp thức hóa  Đăng ký mua hóa đơnTra cứu tình trạng hồ sơ  Văn bản quy phạm pháp luậtKinh tếVăn hóa và Thông tinĐô thị - Xây dựngLao động - BHXHChứng thực - Hộ tịchThống kêTài nguyên - Môi trườngSao lục văn bảnY tếPhòng cháy chữa cháyThuếLĩnh vực khác Câu hỏi thường gặpKinh tếThuếQuản lý đô thịTài nguyên - Môi trườngTư pháp - Hộ tịchVăn hóa thông tinLao động - BHXHY tếQuản lý nhàCông trình công cộngHành chính phườngLĩnh vực khác  CÁC ĐƠN VỊ QUẬN 1Giáo dục đào tạoThông tin hoạt độngThông tin cần biếtVăn bản chỉ đạoLịch công tác Chi Cục thuếHướng dẫn thủ tục thuếTra cứu - Tiện íchLiên hệ    
        
             if (document.getElementById(''ctl00_MainMenu'').innerHTML != "") {
                 var menu = new menu.dd("menu");
                 menu.init("menu", "menuhover");
             }
            
        
            
                
                    &nbsp;RSS
                    
                        &nbsp;&nbsp;Liên hệ ban biên tập&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;Ðặt 
                            Trang tin Quận 1 làm trang chủ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;Sơ đồ site&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                      
                                        
                    
                    
                        


.search_textbox
{
	font-size:11px;
	color:#AAAAAA;
    width:125px;
}



    
        
            
        
        
                        
        
    


                    
                            
            
        
        
        
            
    
    

    

	
					
			
			{1}				
			
			
			
				
					
						##LOC[OK]##
					
								
			
		
		
		 			
			    
			    {1}				
			    		
			    
				    
				    function RadWindowprompt_detectenter(id, ev, input)
				    {							
					    if (!ev) ev = window.event;                
					    if (ev.keyCode == 13)
					    {															        
					        var but = input.parentNode.parentNode.getElementsByTagName("A")[0];					        
					        if (but)
						    {							
							    if (but.click) but.click();
							    else if (but.onclick)
							    {
							        but.focus(); var click = but.onclick; but.onclick = null; if (click) click.call(but);							 
							    }
						    }
					       return false;
					    } 
					    else return true;
				    }	 
				    
				    
			    
			    
				    ##LOC[OK]##
				    ##LOC[Cancel]##
			    
		    				       
		
					
			
			{1}				
									
			
				##LOC[OK]##
				##LOC[Cancel]##
			
				
		


    
        function Form_OpenRadWindow(url, width, height) {
        var oWnd = $find(''ctl00_MiddlePlaceHolder_WebPartManagerPanel1_Form_WindowManager'');
        oWnd.setUrl(url);
        oWnd.center();
        oWnd.add_close(OnClientClose);
        oWnd.setSize(width, height);
        oWnd.show();
    }

    function OnClientClose(sender, eventArgs) {
    
    }
    


    
        
        
            
	
		
			
				
					
						




    
        
        
        
        
        
                
    
    
        
        
                    
            
                &nbsp;&nbsp;&nbsp;&nbsp;Phòng cháy chữa cháyTăng cường các biện pháp đảm bảo an toàn phòng ...Hàng năm vào mùa mưa trên địa bàn thành phố nói chung và địa bàn Quận ...Hàng năm vào mùa mưa trên địa bàn thành phố nói chung và địa bàn Quận ...6/17/2015 7:39:18 PM&nbsp;Chính trị - Xã hộiĐại hội Cháu ngoan Bác HồNgày 15/5/2015, Hội đồng Đội - Nhà Thiếu nhi Quận 1 tổ chức Đại hội ...Ngày 15/5/2015, Hội đồng Đội - Nhà Thiếu nhi Quận 1 tổ chức Đại hội ...5/25/2015 6:35:31 PM&nbsp;Chính trị - Xã hộiĐại hội Đảng bộ phường Cầu Ông LãnhNgày 15 - 16/5/2015, Đảng bộ phường Cầu Ông Lãnh tổ chức Đại hội đại ...Ngày 15 - 16/5/2015, Đảng bộ phường Cầu Ông Lãnh tổ chức Đại hội đại ...5/25/2015 6:35:28 PM&nbsp;Chính trị - Xã hộiĐại hội Đảng bộ Doanh nghiệp quậnNgày 15- 6/5/2015, Đảng bộ Doanh nghiệp quận tổ chức Đại hội đại biểu ...Ngày 15- 6/5/2015, Đảng bộ Doanh nghiệp quận tổ chức Đại hội đại biểu ...5/25/2015 6:35:25 PM&nbsp;Phong trào - Đoàn thểGiải cờ tướng công nhân viên chức lao độngNgày 12-14/5/2015, Liên đoàn Lao động - Trung tâm Thể dục Thể thao ...Ngày 12-14/5/2015, Liên đoàn Lao động - Trung tâm Thể dục Thể thao ...5/25/2015 6:35:22 PM&nbsp;AP.Core.JS.Initialization.call(_initDynamicLead);AP.Core.JS.Initialization.call(_initHomeAdv);AP.Core.JS.Initialization.add(_initboxInfo);function _initDynamicLead(){AP.Core.JS.DynamicLead.GB = true;AP.Core.JS.DynamicLead.globalSlidePause = 6.5;AP.Core.JS.DynamicLead.globalTitleTransition = 1.4;AP.Core.JS.DynamicLead.init();}function _initboxInfo(){AP.Core.JS.DynamicTab.init({id:''boxInfo'', ajaxRequest: ''/ajax/BoxInfo/get.html'', cache: true, data: {ns:''boxInfo''}});}function _initHomeAdv(){AP.Core.JS.PhotoSlide.init({id:''headAdv'', autoStart: true, slidePause: 15.0, direction: AP.Core.JS.PhotoSlide.Direction.Horizontal});}
            
            
                    
							
								
                            
                                 &nbsp;
                                
                                    
                                
                                                              
                                
                                    Thu hồi đất tại dự án xây ...
                                
                                
                                    Căn cứ Điều 69 Luật Đất đai năm 2013, UBND Q1 thông báo thu hồi đất ...                                     
                                    
                                
                                
                                                                
                                
                                    Còn tiếp
                                
                            
                            
                        
                            
                                 &nbsp;
                                
                                    
                                
                                                              
                                
                                    Nâng cao chất lượng giáo dục ...
                                
                                
                                    Ngày 13/5/2015, Hội đồng Giáo dục quốc phòng và an ninh Quận 1 triển ...                                     
                                    
                                
                                
                                                                
                                
                                    Còn tiếp
                                
                            
                            
                        
                            
                                 &nbsp;
                                
                                    
                                
                                                              
                                
                                    Hội thi Chữ thập đỏ khối ...
                                
                                
                                    Ngày 12/5/2015, 180 học sinh thuộc 25 trường Tiểu học và Trung học cơ ...                                     
                                    
                                
                                
                                                                
                                
                                    Còn tiếp
                                
                            
                            
                        
							
						
            
         
         
        
     
     
        
        
        
        
        
        
    
   

					
				
			
				
					
						


    function Content_2Display_GetText(controlID) {
        
        return document.getElementById(controlID).innerHTML;
    }

    function Content_2Display_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1220544108_wp803411138_Content_2Display_DialogWindow");
        oWnd.setUrl(url);        
        oWnd.show();
    }

    //Ham lay gia tri tra ve tu server
    function Content_2Display_ReceiveServerData(rValue) {      
        document.forms[0].submit();
    }	

    function Content_2Display_CallBackFunction(radWindow, returnValue) {
        if (returnValue != "") {          
            var Arr = returnValue.split(''|'');
            var Content_2List = Arr[0]; //Du lieu text duoc tra ve
            var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
            
            //truyen gia tri tra ve truc tiep vao input 
            document.getElementById(''ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1220544108_wp803411138_txtValue'').value = Content_2List + "|" + WebpartID;
            document.forms[0].submit();
            //Content_2Display_CallServer(Content_2List + "|" + WebpartID, "");
        }
    } 
    



    
        
        
        
            
        
        
                
    
    
                
        
        
                    
            
                    
                    
                    
							
								
                            
                                
                                    01                                    
                                  
                                
                                
                                
                                
                                   " style="width:100%">                                        
                                       
                                            AN NINH - TRẬT TỰ
                                        
                                        
                                            AN NINH - TRẬT TỰ
                                        
                                       
                                                                                         
                                        
                                            
                                        
                                        
                                            
                                                Ngày hội toàn dân bảo vệ an ninh Tổ quốc ...
                                               
                                            
                                                Ngày hội toàn dân bảo vệ an ninh Tổ quốc ...
                                               
                                                         
                                            Ngày 14/8/2014, quận 1 tổ chức “Ngày  ...
                                        
                                    
                                 
                                 
                                 
                                    TIN ĐÃ ĐĂNG
                                        
                                            
                                            
                                            
									
										
                                                                                                      
                                                                                                                
                                                            
                                                                
                                                                    Xử án lưu động ...
                                                                
                                                                
                                                             
                                                                                                            
                                                     
                                                 
									
										
                                                                                                      
                                                                                                                
                                                            
                                                                
                                                                    Xét xử lưu động ...
                                                                
                                                                
                                                             
                                                                                                            
                                                     
                                                 
									
										
                                                                                                      
                                                                                                                
                                                            
                                                                
                                                                    Hưởng ứng tháng hành động phòng,  ...
                                                                
                                                                
                                                             
                                                                                                            
                                                     
                                                 
									
								                
                                            
                                            
                                        
                                        
                                              
                                            
                                            
									
										
                                                                                                        
                                                            
                                                                                                                        
                                                                
                                                                    Xử án lưu động ...
                                                                
                                                                
                                                            
                                                                                                            
                                                     
                                                 
									
										
                                                                                                        
                                                            
                                                                                                                        
                                                                
                                                                    Xét xử lưu động ...
                                                                
                                                                
                                                            
                                                                                                            
                                                     
                                                 
									
										
                                                                                                        
                                                            
                                                                                                                        
                                                                
                                                                    Hưởng ứng tháng hành động phòng,  ...
                                                                
                                                                
                                                            
                                                                                                            
                                                     
                                                 
									
								                
                                            
                                            
                                        
                                  
                            
                        
							
								
                            
                                
                                    02                                    
                                  
                                
                                
                                
                                
                                   " style="width:100%">                                        
                                       
                                            NẾP SỐNG VĂN MINH ĐÔ THỊ
                                        
                                        
                                            NẾP SỐNG VĂN MINH ĐÔ THỊ
                                        
                                       
                                                                                         
                                        
                                            
                                        
                                        
                                            
                                                Chuyển hóa địa bàn xây dựng đời sống  ...
                                               
                                            
                                                Chuyển hóa địa bàn xây dựng đời sống  ...
                                               
                                                         
                                            Phong trào Toàn dân đoàn kết xây dựng  ...
                                        
                                    
                                 
                                 
                                 
                                    TIN ĐÃ ĐĂNG
                                        
                                            
                                            
                                            
									
										
                                                                                                      
                                                                                                                
                                                            
                                                                
                                                                    Để dòng kênh mãi xanh ...
                                                                
                                                                
                                                             
                                                                                                            
                                                     
                                                 
									
										
                                                                                                      
                                                                                                                
                                                            
                                                                
                                                                    Mô hình thí điểm phân loại chất  ...
                                                                
                                                                
                                                             
                                                                                                            
                                                     
                                                 
									
										
                                                                                                      
                                                                                                                
                                                            
                                                                
                                                                    Tập huấn kỹ năng bán hàng ...
                                                                
                                                                
                                                             
                                                                                                            
                                                     
                                                 
									
								                
                                            
                                            
                                        
                                        
                                              
                                            
                                            
									
										
                                                                                                        
                                                            
                                                                                                                        
                                                                
                                                                    Để dòng kênh mãi xanh ...
                                                                
                                                                
                                                            
                                                                                                            
                                                     
                                                 
									
										
                                                                                                        
                                                            
                                                                                                                        
                                                                
                                                                    Mô hình thí điểm phân loại chất  ...
                                                                
                                                                
                                                            
                                                                                                            
                                                     
                                                 
									
										
                                                                                                        
                                                            
                                                                                                                        
                                                                
                                                                    Tập huấn kỹ năng bán hàng ...
                                                                
                                                                
                                                            
                                                                                                            
                                                     
                                                 
									
								                
                                            
                                            
                                        
                                  
                            
                        
							
								
                            
                                
                                    03                                    
                                  
                                
                                
                                
                                
                                   " style="width:100%">                                        
                                       
                                            KINH TẾ
                                        
                                        
                                            KINH TẾ
                                        
                                       
                                                                                         
                                        
                                            
                                        
                                        
                                            
                                                Tổng kết công tác thuế ...
                                               
                                            
                                                Tổng kết công tác thuế ...
                                               
                                                         
                                            Ngày 8/1/2015, Chi cục thuế quận tổ  ...
                                        
                                    
                                 
                                 
                                 
                                    TIN ĐÃ ĐĂNG
                                        
                                            
                                            
                                            
									
										
                                                                                                      
                                                                                                                
                                                            
                                                                
                                                                    Hội thi “Tôi yêu thương hiệu Việt  ...
                                                                
                                                                
                                                             
                                                                                                            
                                                     
                                                 
									
										
                                                                                                      
                                                                                                                
                                                            
                                                                
                                                                    Đối thoại doanh nghiệp ...
                                                                
                                                                
                                                             
                                                                                                            
                                                     
                                                 
									
										
                                                                                                      
                                                                                                                
                                                            
                                                                
                                                                    Hội thi "Tôi yêu thương hiệu  ...
                                                                
                                                                
                                                             
                                                                                                            
                                                     
                                                 
									
								                
                                            
                                            
                                        
                                        
                                              
                                            
                                            
									
										
                                                                                                        
                                                            
                                                                                                                        
                                                                
                                                                    Hội thi “Tôi yêu thương hiệu Việt  ...
                                                                
                                                                
                                                            
                                                                                                            
                                                     
                                                 
									
										
                                                                                                        
                                                            
                                                                                                                        
                                                                
                                                                    Đối thoại doanh nghiệp ...
                                                                
                                                                
                                                            
                                                                                                            
                                                     
                                                 
									
										
                                                                                                        
                                                            
                                                                                                                        
                                                                
                                                                    Hội thi "Tôi yêu thương hiệu  ...
                                                                
                                                                
                                                            
                                                                                                            
                                                     
                                                 
									
								                
                                            
                                            
                                        
                                  
                            
                        
							
								
                            
                                
                                    04                                    
                                  
                                
                                
                                
                                
                                   " style="width:100%">                                        
                                       
                                            TRUYỀN THỐNG
                                        
                                        
                                            TRUYỀN THỐNG
                                        
                                       
                                                                                         
                                        
                                            
                                        
                                        
                                            
                                                Nêu cao truyền thống cách mạng ...
                                               
                                            
                                                Nêu cao truyền thống cách mạng ...
                                               
                                                         
                                            Câu lạc bộ truyền thống kháng chiến  ...
                                        
                                    
                                 
                                 
                                 
                                    TIN ĐÃ ĐĂNG
                                        
                                            
                                            
                                            
									
										
                                                                                                      
                                                                                                                
                                                            
                                                                
                                                                    Chăm sóc và phát huy vai trò  ...
                                                                
                                                                
                                                             
                                                                                                            
                                                     
                                                 
									
										
                                                                                                      
                                                                                                                
                                                            
                                                                
                                                                    Tự hào những nhân chứng lịch sử ...
                                                                
                                                                
                                                             
                                                                                                            
                                                     
                                                 
									
										
                                                                                                      
                                                                                                                
                                                            
                                                                
                                                                    Quyết giữ gìn từng tấc đất quê  ...
                                                                
                                                                
                                                             
                                                                                                            
                                                     
                                                 
									
								                
                                            
                                            
                                        
                                        
                                              
                                            
                                            
									
										
                                                                                                        
                                                            
                                                                                                                        
                                                                
                                                                    Chăm sóc và phát huy vai trò  ...
                                                                
                                                                
                                                            
                                                                                                            
                                                     
                                                 
									
										
                                                                                                        
                                                            
                                                                                                                        
                                                                
                                                                    Tự hào những nhân chứng lịch sử ...
                                                                
                                                                
                                                            
                                                                                                            
                                                     
                                                 
									
										
                                                                                                        
                                                            
                                                                                                                        
                                                                
                                                                    Quyết giữ gìn từng tấc đất quê  ...
                                                                
                                                                
                                                            
                                                                                                            
                                                     
                                                 
									
								                
                                            
                                            
                                        
                                  
                            
                        
							
								
                            
                                
                                    05                                    
                                  
                                
                                
                                
                                
                                   " style="width:100%">                                        
                                       
                                            VĂN HÓA - NGHỆ THUẬT
                                        
                                        
                                            VĂN HÓA - NGHỆ THUẬT
                                        
                                       
                                                                                         
                                        
                                            
                                        
                                        
                                            
                                                Hội thi Nét vẽ Xanh Quận 1 năm 2015 ...
                                               
                                            
                                                Hội thi Nét vẽ Xanh Quận 1 năm 2015 ...
                                               
                                                         
                                            Ngày 4/4/2015, Trung tâm Văn hóa Quận  ...
                                        
                                    
                                 
                                 
                                 
                                    TIN ĐÃ ĐĂNG
                                        
                                            
                                            
                                            
									
										
                                                                                                      
                                                                                                                
                                                            
                                                                
                                                                    Ca múa nhạc phục vụ tại trường  ...
                                                                
                                                                
                                                             
                                                                                                            
                                                     
                                                 
									
										
                                                                                                      
                                                                                                                
                                                            
                                                                
                                                                    Hội thi “Tiếng hát quê hương” ...
                                                                
                                                                
                                                             
                                                                                                            
                                                     
                                                 
									
										
                                                                                                      
                                                                                                                
                                                            
                                                                
                                                                    Giao lưu đờn ca tài tử quận 1 ...
                                                                
                                                                
                                                             
                                                                                                            
                                                     
                                                 
									
								                
                                            
                                            
                                        
                                        
                                              
                                            
                                            
									
										
                                                                                                        
                                                            
                                                                                                                        
                                                                
                                                                    Ca múa nhạc phục vụ tại trường  ...
                                                                
                                                                
                                                            
                                                                                                            
                                                     
                                                 
									
										
                                                                                                        
                                                            
                                                                                                                        
                                                                
                                                                    Hội thi “Tiếng hát quê hương” ...
                                                                
                                                                
                                                            
                                                                                                            
                                                     
                                                 
									
										
                                                                                                        
                                                            
                                                                                                                        
                                                                
                                                                    Giao lưu đờn ca tài tử quận 1 ...
                                                                
                                                                
                                                            
                                                                                                            
                                                     
                                                 
									
								                
                                            
                                            
                                        
                                  
                            
                        
							
								
                            
                                
                                    06                                    
                                  
                                
                                
                                
                                
                                   " style="width:100%">                                        
                                       
                                            PHONG TRÀO - ĐOÀN THỂ
                                        
                                        
                                            PHONG TRÀO - ĐOÀN THỂ
                                        
                                       
                                                                                         
                                        
                                            
                                        
                                        
                                            
                                                Giải cờ tướng công nhân viên chức lao  ...
                                               
                                            
                                                Giải cờ tướng công nhân viên chức lao  ...
                                               
                                                         
                                            Ngày 12-14/5/2015, Liên đoàn Lao động -  ...
                                        
                                    
                                 
                                 
                                 
                                    TIN ĐÃ ĐĂNG
                                        
                                            
                                            
                                            
									
										
                                                                                                      
                                                                                                                
                                                            
                                                                
                                                                    Đi bộ đồng hành và tổng vệ sinh,  ...
                                                                
                                                                
                                                             
                                                                                                            
                                                     
                                                 
									
										
                                                                                                      
                                                                                                                
                                                            
                                                                
                                                                    GIẢI BOWLING CÔNG NHÂN VIÊN CHỨC  ...
                                                                
                                                                
                                                             
                                                                                                            
                                                     
                                                 
									
										
                                                                                                      
                                                                                                                
                                                            
                                                                
                                                                    Thanh niên hoạt động vì cộng đồng ...
                                                                
                                                                
                                                             
                                                                                                            
                                                     
                                                 
									
								                
                                            
                                            
                                        
                                        
                                              
                                            
                                            
									
										
                                                                                                        
                                                            
                                                                                                                        
                                                                
                                                                    Đi bộ đồng hành và tổng vệ sinh,  ...
                                                                
                                                                
                                                            
                                                                                                            
                                                     
                                                 
									
										
                                                                                                        
                                                            
                                                                                                                        
                                                                
                                                                    GIẢI BOWLING CÔNG NHÂN VIÊN CHỨC  ...
                                                                
                                                                
                                                            
                                                                                                            
                                                     
                                                 
									
										
                                                                                                        
                                                            
                                                                                                                        
                                                                
                                                                    Thanh niên hoạt động vì cộng đồng ...
                                                                
                                                                
                                                            
                                                                                                            
                                                     
                                                 
									
								                
                                            
                                            
                                        
                                  
                            
                        
							
								
                            
                                
                                    07                                    
                                  
                                
                                
                                
                                
                                   " style="width:100%">                                        
                                       
                                            CHÍNH TRỊ - XÃ HỘI
                                        
                                        
                                            CHÍNH TRỊ - XÃ HỘI
                                        
                                       
                                                                                         
                                        
                                            
                                        
                                        
                                            
                                                Công ty TNHH Dịch vụ bảo vệ TNXP tuyển  ...
                                               
                                            
                                                Công ty TNHH Dịch vụ bảo vệ TNXP tuyển  ...
                                               
                                                         
                                            Công ty TNHH Dịch vụ bảo vệ TNXP có nhu  ...
                                        
                                    
                                 
                                 
                                 
                                    TIN ĐÃ ĐĂNG
                                        
                                            
                                            
                                            
									
										
                                                                                                      
                                                                                                                
                                                            
                                                                
                                                                    Tuyển sinh trình độ Trung cấp  ...
                                                                
                                                                
                                                             
                                                                                                            
                                                     
                                                 
									
										
                                                                                                      
                                                                                                                
                                                            
                                                                
                                                                    Tuyên truyền, vận động người lao  ...
                                                                
                                                                
                                                             
                                                                                                            
                                                     
                                                 
									
										
                                                                                                      
                                                                                                                
                                                            
                                                                
                                                                    Đại hội Cháu ngoan Bác Hồ ...
                                                                
                                                                
                                                             
                                                                                                            
                                                     
                                                 
									
								                
                                            
                                            
                                        
                                        
                                              
                                            
                                            
									
										
                                                                                                        
                                                            
                                                                                                                        
                                                                
                                                                    Tuyển sinh trình độ Trung cấp  ...
                                                                
                                                                
                                                            
                                                                                                            
                                                     
                                                 
									
										
                                                                                                        
                                                            
                                                                                                                        
                                                                
                                                                    Tuyên truyền, vận động người lao  ...
                                                                
                                                                
                                                            
                                                                                                            
                                                     
                                                 
									
										
                                                                                                        
                                                            
                                                                                                                        
                                                                
                                                                    Đại hội Cháu ngoan Bác Hồ ...
                                                                
                                                                
                                                            
                                                                                                            
                                                     
                                                 
									
								                
                                            
                                            
                                        
                                  
                            
                        
							
								
                            
                                
                                    08                                    
                                  
                                
                                
                                
                                
                                   " style="width:100%">                                        
                                       
                                            PHÒNG CHÁY CHỮA CHÁY
                                        
                                        
                                            PHÒNG CHÁY CHỮA CHÁY
                                        
                                       
                                                                                         
                                        
                                            
                                        
                                        
                                            
                                                Tăng cường các biện pháp đảm bảo an  ...
                                               
                                            
                                                Tăng cường các biện pháp đảm bảo an  ...
                                               
                                                         
                                            Hàng năm vào mùa mưa trên địa bàn thành  ...
                                        
                                    
                                 
                                 
                                 
                                    TIN ĐÃ ĐĂNG
                                        
                                            
                                            
                                            
									
										
                                                                                                      
                                                                                                                
                                                            
                                                                
                                                                    Tập huấn công tác phòng cháy chữa  ...
                                                                
                                                                
                                                             
                                                                                                            
                                                     
                                                 
									
										
                                                                                                      
                                                                                                                
                                                            
                                                                
                                                                    Tập huấn công tác phòng cháy chữa  ...
                                                                
                                                                
                                                             
                                                                                                            
                                                     
                                                 
									
										
                                                                                                      
                                                                                                                
                                                            
                                                                
                                                                    Thực tập phương pháp chữa cháy và  ...
                                                                
                                                                
                                                             
                                                                                                            
                                                     
                                                 
									
								                
                                            
                                            
                                        
                                        
                                              
                                            
                                            
									
										
                                                                                                        
                                                            
                                                                                                                        
                                                                
                                                                    Tập huấn công tác phòng cháy chữa  ...
                                                                
                                                                
                                                            
                                                                                                            
                                                     
                                                 
									
										
                                                                                                        
                                                            
                                                                                                                        
                                                                
                                                                    Tập huấn công tác phòng cháy chữa  ...
                                                                
                                                                
                                                            
                                                                                                            
                                                     
                                                 
									
										
                                                                                                        
                                                            
                                                                                                                        
                                                                
                                                                    Thực tập phương pháp chữa cháy và  ...
                                                                
                                                                
                                                            
                                                                                                            
                                                     
                                                 
									
								                
                                            
                                            
                                        
                                  
                            
                        
							
						 
                                                  
                    
                        
                        
                  
                        
        
        
        
    
    
        
        
        
        
        
        
        





							
								
    
							
					
			
			{1}				
			
			
			
				
					
						##LOC[OK]##
					
								
			
		
		
		 			
			    
			    {1}				
			    		
			    
				    
				    function RadWindowprompt_detectenter(id, ev, input)
				    {							
					    if (!ev) ev = window.event;                
					    if (ev.keyCode == 13)
					    {															        
					        var but = input.parentNode.parentNode.getElementsByTagName("A")[0];					        
					        if (but)
						    {							
							    if (but.click) but.click();
							    else if (but.onclick)
							    {
							        but.focus(); var click = but.onclick; but.onclick = null; if (click) click.call(but);							 
							    }
						    }
					       return false;
					    } 
					    else return true;
				    }	 
				    
				    
			    
			    
				    ##LOC[OK]##
				    ##LOC[Cancel]##
			    
		    				       
		
					
			
			{1}				
									
			
				##LOC[OK]##
				##LOC[Cancel]##
			
				
		
						
					
				
			
				
			
		
	

            
        
        
            
	
		
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1000086812_wp1047212934_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                

            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                                            
                        
                            Giới thiệu Quận 1 
                                                        
                                                
                    
                
             
            
            
                   
                    
                    
							
								                            
                            
                                
                                    
                                        
                                    
                                    
                                       Giới thiệu Quận 1
                                                                    
                                
                                        
                            
                            
									
										
                                    
                                        
                                            
                                                
                                                                                        
                                            
                                                Quy hoạch phát triển
                                                                            
                                        
                                     
									
                                
									
										
                                    
                                        
                                            
                                                
                                                                                        
                                            
                                                Công trình phúc lợi xã hội
                                                                            
                                        
                                     
									
                                
									
										
                                    
                                        
                                            
                                                
                                                                                        
                                            
                                                Địa điểm tham quan
                                                                            
                                        
                                     
									
                                
									
										
                                    
                                        
                                            
                                                
                                                                                        
                                            
                                                Thông tin chung
                                                                            
                                        
                                     
									
                                
									
								
                                                                                    
                                                                                  
                        
							
						
                
            
        
        
        
    
    
        
        
        
        
        
        
    
    


					
				
			
				
					
						


    
        
        
        
        
        
                
    
    
        
        
        
            
                
                                            
                        
                            
                        
                                                
                        
                    
                
             
            
            
                                                  
                    
                                                    
                             
                                Tư tưởng Hồ Chí Minh
                                Những câu chuyện kể
                                                            
                        
                                         
                
            
        
        
        
    
    
        
        
        
        
        
        
    


					
				
			
				
					
						

" style="height:auto">
    
        
            
            
                Thông báo    
                              
            
            
                      
        
            
                        
            
        
        
    

    
        
        
        
        
        
                
    
    
        
        
                    
            
                    
							
								
                            
                                
	                                
	                                
	                                    _Data_Img" src="News_Images/thumbnail54x54_3212015225545790.jpg" style="height:100px;width:130px;border-width:0px;" />
	                                
	                                
	                                
	                                
	                                    _Data_Img" src="News_Images/thumbnail54x54_3212015225545790.jpg" style="height:54px;width:54px;border-width:0px;" />
	                                
	                                
	                                
	                                    Ngày hội pháp luật Quận 1 - Năm 2015	                                    
	                                
	                                
	                            
                            
                        
							
								
                            
                                
	                                
	                                
	                                    _Data_Img" src="News_Images/thumbnail54x54_331201511654191.jpg" style="height:100px;width:130px;border-width:0px;" />
	                                
	                                
	                                
	                                
	                                    _Data_Img" src="News_Images/thumbnail54x54_331201511654191.jpg" style="height:54px;width:54px;border-width:0px;" />
	                                
	                                
	                                
	                                    Đi bộ đồng hành và ra quân tổng vệ sinh, chấn chỉnh trật tự đô thị 	                                    
	                                
	                                
	                            
                            
                        
							
								
                            
                                
	                                
	                                
	                                    _Data_Img" src="News_Images/thumbnail54x54_319201510621170.jpg" style="height:100px;width:130px;border-width:0px;" />
	                                
	                                
	                                
	                                
	                                    _Data_Img" src="News_Images/thumbnail54x54_319201510621170.jpg" style="height:54px;width:54px;border-width:0px;" />
	                                
	                                
	                                
	                                    Thi tuyển công chức làm việc tại các cơ quan hành chính Nhà nước thuộc Quận 1 năm 2015	                                    
	                                
	                                
	                            
                            
                        
							
								
                            
                                
	                                
	                                
	                                    _Data_Img" src="News_Images/thumbnail54x54_3192015132819583.jpg" style="height:100px;width:130px;border-width:0px;" />
	                                
	                                
	                                
	                                
	                                    _Data_Img" src="News_Images/thumbnail54x54_3192015132819583.jpg" style="height:54px;width:54px;border-width:0px;" />
	                                
	                                
	                                
	                                    Tuyển dụng lao động	                                    
	                                
	                                
	                            
                            
                        
							
								
                            
                                
	                                
	                                
	                                    _Data_Img" src="News_Images/thumbnail54x54_316201581258839.jpg" style="height:100px;width:130px;border-width:0px;" />
	                                
	                                
	                                
	                                
	                                    _Data_Img" src="News_Images/thumbnail54x54_316201581258839.jpg" style="height:54px;width:54px;border-width:0px;" />
	                                
	                                
	                                
	                                    Tổng điều tra quân nhân dự bị và phương tiện kỹ thuật	                                    
	                                
	                                
	                            
                            
                        
							
						
            
        
        
        
    
    
        
        
        
        
        
        
    



					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp260391721_wp1393647424_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                
    
        
            
        
    


            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1851157061_wp1115875751_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                
    
        
            
        
    


            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp2010671376_wp551589528_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                
    
        
            
        
    


            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp2022642678_wp84292567_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            Đoàn cơ sở UBND Quận 1 &nbsp;&nbsp;&nbsp;Công trình TN 2011
                        
                    
                
                
            
            
                
    
        
            TRA CỨU VĂN BẢN QPPL
        
        
            
            Năm :
            
            2011
            2012
            2013
            2014
            2015
             
            
            
             
            
            
                
                
                
                    
                        1
                        2
                        3
                        4
                    
                    
                        5
                        6
                        7
                        8
                    
                    
                        9
                        10
                        11
                        12
                    
                
            
            
             Tra cứu 
            
        
    


            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp2117114286_wp1910276795_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                
    
        
            
        
    


            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1280165890_wp1107908946_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                

    
        
            
        
    



            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1366142038_wp194009423_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                

    
        
             
        
    


            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1873582325_wp969317894_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                

    
        
             
        
    


            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1586692922_wp880186170_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                

    
        
             
        
    


            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp802091_wp399151120_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                

    
        
             
        
    


            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1644303181_wp326876223_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                 

            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1501484043_wp1683032223_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                

            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp187522801_wp1704181207_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            Liên kết
                        
                    
                
                
            
            
                
<select tabindex="-1" style="width: 137px;" onchange="window.open(this.value,null,
&quot;height=200,width=200,status=yes,toolbar=no,resizable=1,scrollbars=1,menubar=no,location=yes&quot;);" width="100px">
--Website liên kết--
...
Đảng Bộ Quận 1
UB Mặt trận TQ Q1
Quận 2
Quận 4
Quận 5
Quận 6
Quận 7
Quận 8
Quận 9
Quận 10
Quận 11
Quận 12
Quận Bình Tân
Huyện Bình Chánh
Quận Bình Thạnh
Quận Tân Bình
Quận Tân Phú
Quận Gò Vấp
Huyện Củ Chi
Quận Thủ Đức
Huyện Cần Giờ
Huyện Hóc Môn
Huyện Nhà Bè
Liên đoàn lao động Quận 1
TP.Hồ Chí Minh
Nhà hát Bến Thành
Quận Bình Thạnh
Sở KHCN TP.Hồ Chí Minh
Viện Công Nghệ Thông Tin
Hội doanh nghiệp Quận 1
 


            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
			
		
	

        
        
            
	
		
			
				
					
						

_Title" style="height:30px; padding-top:20px;">
    
                                
            
               Tin được quan tâm   
               
            
        
        
            
                           
            
        
     
       

    
        
            
                
                    
                    
                    
                    
                    
                            
                
                
                    
                    
                                            
                        
                            
							
								
                                        
                                            
                                            
                                                Thông tư số 03/2015/TT-BNV ngày 10/03/2015 của Bộ Nội vụ
                                            
                                                                                
                                        
                                
							
								
                                        
                                            
                                            
                                                Thông tư số 11/2015/TT-BCA ngày 02/03/2015 của Bộ Công an
                                            
                                                                                
                                        
                                
							
								
                                        
                                            
                                            
                                                Thông tư số 12/2015/TT-BCA ngày 02/03/2015 của Bộ công an
                                            
                                                                                
                                        
                                
							
								
                                        
                                            
                                            
                                                Thông tư số 26/2015/TT-BTC ngày 27/02/2015 của Bộ Tài chính
                                            
                                                                                
                                        
                                
							
								
                                        
                                            
                                            
                                                Quyết định số 14/2015/QĐ-UBND ngày 10/03/2015 của UBND TP. Hồ Chí Minh
                                            
                                                                                
                                        
                                
							
								
                                        
                                            
                                            
                                                Nghị định số 24/2015/NĐ-CP ngày 27/02/2015 của Chính phủ của Chính phủ
                                            
                                                                                
                                        
                                
							
						 
                        
                    
                    
                    
                
                
                    
                    
                    
                    
                    
                    
                
            
            
        
    




					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1422508930_wp2074328384_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                 

            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1486217924_wp987482916_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                 

            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1551967217_wp1743660683_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                 

            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1535998766_wp1724009140_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                 

            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp343980139_wp713290673_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                 

            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp136572371_wp1859684632_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                 

            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp2050144738_wp760621956_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                 

            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp510985634_wp1670355323_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                 

            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1497113699_wp1116445389_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                 

            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1449317459_wp301471069_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                 

            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp2023887362_wp220916938_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                 

            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1227987208_wp728619845_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                 

            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1731975622_wp1636517138_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                 

            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp894754662_wp823738150_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                



            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1978122978_wp1451867627_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                 

            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp592776227_wp914797455_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                 

            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						


    function SurveyDisplay_GetText(controlID) {
        
        return document.getElementById(controlID).innerHTML;
    }

    function SurveyDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1788598134_wp2143517606_SurveyDisplay_DialogWindow");
        oWnd.setUrl(url);
        oWnd.show();
    }

    function SurveyDisplay_CallBackFunction(radWindow, returnValue) {
        if (returnValue != "") {
            var Arr = returnValue.split(''|'');
            var SurveyList = Arr[0]; //Du lieu text duoc tra ve
            var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
            SurveyDisplay_CallServer(SurveyList + "|" + WebpartID, "");
        }
    } 

    //Ham lay gia tri tra ve tu server
    function SurveyDisplay_ReceiveServerData(rValue) {
        document.forms[0].submit();        
    }	


    
                         
                            
                   
            
                THĂM DÒ Ý KIẾN
            
        
    


    
        
        
        
        
        
                
    
    
        
        
        
            
				
					
						
							
						
						
							
								
									
										
										    
										    Ý kiến của bạn về thủ tục hồ sơ hành chính tại Quận 1:
										
									
								
							
						
						
							
						
						
							
							Đơn giản Công khai, đầy đủ Phức tạp Rườm rà, cần cải tiến. 
						
						
							
						
						
							
						
						
							
							    
						    	    
							        
							            Lựa chọn
							         
                                    
                                
                                
							
							    
							        
							        
							            Xem kết quả
							        
                                    
                                
								
				                function OpenWindow(act)
				                {
				                    //var mPath = /Portal;
				                    switch (act){
				                    case ''update'':
					                    a='''';
					                    for ( i=0 ;i <document.getElementsByName(''rdYkien'').length ; i++)
					                    {
						                    if (document.getElementsByName(''rdYkien'')[i].checked==true)
						                    {
							                    a =document.getElementsByName(''rdYkien'')[i].value;
						                    }
					                    }
					                    if (a=='''') 
						                    alert(''Mời bạn chọn ý kiến'');
					                    else
					                        //alert(''/Portal'' + ''/Pages/surveyresult.aspx?act=''+ act +''&Sid='' + 23 + ''&pid=''+a ,'''', ''address=no,status=no,resizable=no,scrollbars=no,toolbar=no,location=no,fullscreen=no,titlebar=yes,height=250px,width=500px'');
						                    window.open(''/Portal'' + ''/Pages/surveyresult.aspx?act=''+ act +''&Sid='' + 23 + ''&pid=''+a ,'''', ''address=no,status=no,resizable=no,scrollbars=no,toolbar=no,location=no,fullscreen=no,titlebar=yes,height=250px,width=500px'');
						                    //window.showModalDialog(''surveyresult.aspx?act=''+ act +''&Sid='' + 23 + ''&pid=''+a,null,''status:no;dialogWidth:370px;dialogHeight:220px;dialogHide:true;help:no;scroll:no'');
						                    break;
				                    case ''show'':
					                    window.open(''/Portal'' + ''/Pages/surveyresult.aspx?act=''+ act +''&Sid='' + 23  ,'''', ''address=no,status=no,resizable=no,scrollbars=no,toolbar=no,location=no,fullscreen=no,titlebar=yes,height=250px,width=500px'');
					                    //window.showModalDialog(''surveyresult.aspx?act=''+ act +''&Sid='' + 23,'''',''status:no;dialogWidth:370px;dialogHeight:220px;dialogHide:true;help:no;scroll:no'');
					                    break;
				                    }
                				}
								
							
						
						
							
						
					
				
			          
         
         
        
     
     
        
        
        
        
        
        
    
   


							
								
    
							
					
			
			{1}				
			
			
			
				
					
						##LOC[OK]##
					
								
			
		
		
		 			
			    
			    {1}				
			    		
			    
				    
				    function RadWindowprompt_detectenter(id, ev, input)
				    {							
					    if (!ev) ev = window.event;                
					    if (ev.keyCode == 13)
					    {															        
					        var but = input.parentNode.parentNode.getElementsByTagName("A")[0];					        
					        if (but)
						    {							
							    if (but.click) but.click();
							    else if (but.onclick)
							    {
							        but.focus(); var click = but.onclick; but.onclick = null; if (click) click.call(but);							 
							    }
						    }
					       return false;
					    } 
					    else return true;
				    }	 
				    
				    
			    
			    
				    ##LOC[OK]##
				    ##LOC[Cancel]##
			    
		    				       
		
					
			
			{1}				
									
			
				##LOC[OK]##
				##LOC[Cancel]##
			
				
		
						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1449912535_wp1613867813_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                

            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1445768999_wp608034136_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                 

            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp2125145428_wp1114164825_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                 

            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1675572811_wp1253780657_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                 

            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1847660956_wp372689960_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                 

            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp2118886241_wp111825250_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                
    
        
            
            
        
        
            
            
        
    


            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1406166179_wp563303012_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                
    
        
            
        
    


            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
					
						



    // Replaces all instances of the given substring.
    String.prototype.replaceAll = function(
        strTarget, // The substring you want to replace
        strSubString // The string you want to replace in.
    ){
        var strText = this;
        var intIndexOfMatch = strText.indexOf( strTarget );
         
        // Keep looping while an instance of the target string
        // still exists in the string.
        while (intIndexOfMatch >0 || intIndexOfMatch == null){
            // Relace out the current instance.
            strText = strText.replace( strTarget, strSubString )
             
            // Get the index of any next matching substring.
            intIndexOfMatch = strText.indexOf( strTarget );
        }
         
        // Return the updated string with ALL the target strings
        // replaced out with the new substring.
        return( strText );
    }

    function ContentDisplay_GetText(controlID) {
        var s=new String;
        s=document.getElementById(controlID).innerHTML;
        var AP=new String;
        AP="";
        //s=s.replace(/ + "" + /g,''../../../'');
//        s=s.replaceAll(AP + ''files/Content_'',''../../../../files/Content_'');
//        s=s.replaceAll("(''" & AP & "/mediaplayer","(''../../../../mediaplayer");
        s=s.replaceAll(AP,''../../../../'');
        return s;
    }
//    function ContentDisplay_GetText(controlID) {
//        var s = document.getElementById(controlID).innerHTML;
//        return s;
//    }
//    
    function ContentDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1834941289_wp1444880723_ContentDisplay_DialogWindow");
        oWnd.show();
        oWnd.setUrl(url);
        oWnd.setSize(800, 500);
    }

    
    function ContentDisplay_CallBackFunction(radWindow, returnValue) {
        try
        {
            if (returnValue != "") {
                var Arr = returnValue.split(''|'');
                var ResultText = Arr[0]; //Du lieu text duoc tra ve
                var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
                var ControlID_Source = Arr[2]; //ControlID_Source chua thong tin can cap nhat
                document.getElementById(ControlID_Source).value = encodeURI(ResultText);
                document.forms[0].submit();
            }
        }
        catch(err)
        {}
    }





    
        
        
        
        
        
                
    
    
        
        
        
            
                
                    
                        
                        
                        
                            
                        
                    
                
                
            
            
                
    
        
            
        
    

 

            
            
         
         
        
     
     
        
        
        
        
        
        
    
   



							

						

					
				
			
				
			
		
	

        
        
        
        
        
            
	
		
			
				
					
						


    function BottomHomeDisplay_GetText(controlID) {
        
        return document.getElementById(controlID).innerHTML;
    }

    function BottomHomeDisplay_OpenRadWindow(url) {
        var oWnd = $find("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp963569413_wp1664732039_BottomHomeDisplay_DialogWindow");
        oWnd.setUrl(url);
        oWnd.show();
    }

    function BottomHomeDisplay_CallBackFunction(radWindow, returnValue) {
        if (returnValue != "") {
            var Arr = returnValue.split(''|'');
            var BottomHomeList = Arr[0]; //Du lieu text duoc tra ve
            alert(BottomHomeList);
            var WebpartID = Arr[1]; //WebpartID dang duoc thuc hien
            BottomHomeDisplay_CallServer(BottomHomeList + "|" + WebpartID, "");
        }
    } 

    //Ham lay gia tri tra ve tu server
    function BottomHomeDisplay_ReceiveServerData(rValue) {
        document.forms[0].submit();        
    }	


    
        
        
        
            
        
        
                
    
    
                
        
                    
            
                
                    
							
								
                            
                                
                                    
                                    
                                        Công ty TNHH Dịch vụ ...
                                                                        
                                                                
                                
                                    Công ty TNHH Dịch vụ bảo vệ TNXP có nhu cầu tuyển dụng số lượng ...
                                
                            
                            
                        
                            
                                
                                    
                                    
                                        Kế hoạch công tác tuần ...
                                                                        
                                                                
                                
                                    Tuần 25, năm 2015 (từ ngày 15/6 – ngày 21/6/2015) ...
                                
                            
                            
                        
                            
                                
                                    
                                    
                                        Tăng cường các biện ...
                                                                        
                                                                
                                
                                    Hàng năm vào mùa mưa trên địa bàn thành phố nói chung và địa bàn ...
                                
                            
                            
                        
							
						                    
                                     
                
                    (08)38 225 561
                 
                        
        
        
        
    
    
        
        
        
        
        
        
    
    






							
								
    
							
					
			
			{1}				
			
			
			
				
					
						##LOC[OK]##
					
								
			
		
		
		 			
			    
			    {1}				
			    		
			    
				    
				    function RadWindowprompt_detectenter(id, ev, input)
				    {							
					    if (!ev) ev = window.event;                
					    if (ev.keyCode == 13)
					    {															        
					        var but = input.parentNode.parentNode.getElementsByTagName("A")[0];					        
					        if (but)
						    {							
							    if (but.click) but.click();
							    else if (but.onclick)
							    {
							        but.focus(); var click = but.onclick; but.onclick = null; if (click) click.call(but);							 
							    }
						    }
					       return false;
					    } 
					    else return true;
				    }	 
				    
				    
			    
			    
				    ##LOC[OK]##
				    ##LOC[Cancel]##
			    
		    				       
		
					
			
			{1}				
									
			
				##LOC[OK]##
				##LOC[Cancel]##
			
				
		
						
					
				
			
				
			
		
	

        
        
            
        
        
            
        
        
        
        
        
            
        
        
            
        
        
            
        
        
    
            
                        
    
    
            
                                    
                
                © 2009 Ủy ban nhân dân Quận 1 - 47 Lê Duẩn, Phường Bến Nghé, Quận 1, Tp Hồ Chí Minh
                Thiết kế & Phát triển bởi Trung tâm ứng dụng CNTT Quận 1
            
        
    


//<![CDATA[
var __wpmExportWarning=''This Web Part Page has been personalized. As a result, one or more Web Part properties may contain confidential information. Make sure the properties contain information that is safe for others to read. After exporting this Web Part, view properties in the Web Part description file (.WebPart) by using a text editor such as Microsoft Notepad.'';var __wpmCloseProviderWarning=''You are about to close this Web Part.  It is currently providing data to other Web Parts, and these connections will be deleted if this Web Part is closed.  To close this Web Part, click OK.  To keep this Web Part, click Cancel.'';var __wpmDeleteWarning=''You are about to permanently delete this Web Part.  Are you sure you want to do this?  To delete this Web Part, click OK.  To keep this Web Part, click Cancel.'';Sys.Application.initialize();
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindowManager, {"behaviors":36,"clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_Form_WindowManager_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","name":"Form_WindowManager","skin":"Web20","top":"","visibleStatusbar":false,"windowControls":"[]"}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_Form_WindowManager"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"behaviors":32,"clientCallBackFunction":"Content_2Display_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1220544108_wp803411138_Content_2Display_DialogWindow_ClientState","formID":"aspnetForm","height":"600px","iconUrl":"","left":"150px","minimizeIconUrl":"","modal":true,"name":"Content_2Display_DialogWindow","navigateUrl":"","skin":"Vista","title":"Site Collections","top":"","visibleStatusbar":false,"width":"400px"}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1220544108_wp803411138_Content_2Display_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindowManager, {"clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1220544108_wp803411138_Content_2Display_Singleton_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","name":"Content_2Display_Singleton","skin":"Default","top":"","windowControls":"[''ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1220544108_wp803411138_Content_2Display_DialogWindow'']"}, null, {"child":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1220544108_wp803411138_Content_2Display_DialogWindow"}, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1220544108_wp803411138_Content_2Display_Singleton"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1000086812_wp1047212934_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1000086812_wp1047212934_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp260391721_wp1393647424_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp260391721_wp1393647424_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1851157061_wp1115875751_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1851157061_wp1115875751_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp2010671376_wp551589528_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp2010671376_wp551589528_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp2022642678_wp84292567_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp2022642678_wp84292567_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp2117114286_wp1910276795_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp2117114286_wp1910276795_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1280165890_wp1107908946_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1280165890_wp1107908946_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1366142038_wp194009423_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1366142038_wp194009423_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1873582325_wp969317894_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1873582325_wp969317894_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1586692922_wp880186170_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1586692922_wp880186170_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp802091_wp399151120_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp802091_wp399151120_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1644303181_wp326876223_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1644303181_wp326876223_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1501484043_wp1683032223_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1501484043_wp1683032223_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp187522801_wp1704181207_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp187522801_wp1704181207_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1422508930_wp2074328384_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1422508930_wp2074328384_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1486217924_wp987482916_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1486217924_wp987482916_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1551967217_wp1743660683_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1551967217_wp1743660683_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1535998766_wp1724009140_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1535998766_wp1724009140_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp343980139_wp713290673_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp343980139_wp713290673_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp136572371_wp1859684632_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp136572371_wp1859684632_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp2050144738_wp760621956_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp2050144738_wp760621956_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp510985634_wp1670355323_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp510985634_wp1670355323_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1497113699_wp1116445389_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1497113699_wp1116445389_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1449317459_wp301471069_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1449317459_wp301471069_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp2023887362_wp220916938_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp2023887362_wp220916938_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1227987208_wp728619845_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1227987208_wp728619845_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1731975622_wp1636517138_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1731975622_wp1636517138_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp894754662_wp823738150_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp894754662_wp823738150_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1978122978_wp1451867627_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1978122978_wp1451867627_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp592776227_wp914797455_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp592776227_wp914797455_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"behaviors":32,"clientCallBackFunction":"SurveyDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1788598134_wp2143517606_SurveyDisplay_DialogWindow_ClientState","formID":"aspnetForm","height":"400px","iconUrl":"","left":"250px","minimizeIconUrl":"","modal":true,"name":"SurveyDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Survey Collections","top":"","width":"500px"}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1788598134_wp2143517606_SurveyDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindowManager, {"clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1788598134_wp2143517606_surveyDisplay_Singleton_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","name":"surveyDisplay_Singleton","skin":"Default","top":"","windowControls":"[''ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1788598134_wp2143517606_SurveyDisplay_DialogWindow'']"}, null, {"child":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1788598134_wp2143517606_SurveyDisplay_DialogWindow"}, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1788598134_wp2143517606_surveyDisplay_Singleton"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1449912535_wp1613867813_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1449912535_wp1613867813_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1445768999_wp608034136_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1445768999_wp608034136_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp2125145428_wp1114164825_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp2125145428_wp1114164825_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1675572811_wp1253780657_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1675572811_wp1253780657_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1847660956_wp372689960_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1847660956_wp372689960_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp2118886241_wp111825250_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp2118886241_wp111825250_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1406166179_wp563303012_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1406166179_wp563303012_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"autoSize":true,"clientCallBackFunction":"ContentDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1834941289_wp1444880723_ContentDisplay_DialogWindow_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","modal":true,"name":"ContentDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Editor Dialog","top":"","visibleStatusbar":false}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp1834941289_wp1444880723_ContentDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindow, {"behaviors":32,"clientCallBackFunction":"BottomHomeDisplay_CallBackFunction","clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp963569413_wp1664732039_BottomHomeDisplay_DialogWindow_ClientState","formID":"aspnetForm","height":"400px","iconUrl":"","left":"250px","minimizeIconUrl":"","modal":true,"name":"BottomHomeDisplay_DialogWindow","navigateUrl":"","skin":"Vista","title":"Site Collections","top":"","visibleStatusbar":false,"width":"500px"}, null, null, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp963569413_wp1664732039_BottomHomeDisplay_DialogWindow"));
});
Sys.Application.add_init(function() {
    $create(Telerik.Web.UI.RadWindowManager, {"clientStateFieldID":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp963569413_wp1664732039_BottomHomeDisplay_Singleton_ClientState","formID":"aspnetForm","iconUrl":"","left":"","minimizeIconUrl":"","name":"BottomHomeDisplay_Singleton","skin":"Default","top":"","windowControls":"[''ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp963569413_wp1664732039_BottomHomeDisplay_DialogWindow'']"}, null, {"child":"ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp963569413_wp1664732039_BottomHomeDisplay_DialogWindow"}, $get("ctl00_MiddlePlaceHolder_WebPartManagerPanel1_WebPartController1_wp963569413_wp1664732039_BottomHomeDisplay_Singleton"));
});
//]]>', CAST(N'2015-06-18 00:59:15.387' AS DateTime), N'', 2)
INSERT [dbo].[TEXT_CONTENT] ([ContentID], [Content], [TimeCheck], [TextResult], [WebID]) VALUES (3, N'Trang chủ 
	- UBND QUẬN 4







	
	
	var navBarHelpOverrideKey = "wssmain";
	

	























 var MSOWebPartPageFormName = ''aspnetForm'';

function _spNavigateHierarchy(nodeDiv, dataSourceId, dataPath, url, listInContext, type) {
    ProcessDefaultNavigateHierarchy(nodeDiv, dataSourceId, dataPath, url, listInContext, type, document.forms.aspnetForm, "", "\u002fdefault.aspx");
}



	
	
	
	
		
			
			
		
		
		 
			
			   
			Bật chế độ truy cập dễ dàng hơn
			
			
			Bỏ qua nội dung chính
		 
		   
			
			 
			  
				
				Tắt chế độ truy cập dễ dàng hơn
			  
			  
				UBND QUẬN 4
			  
			  
			 
		   
		 
		 
			
		   
	   
	  
			
		
		
			
			
				
					
					
Đăng nhập

					
					
						
							
							
						
					
					
				
			
			
		
		
			
			
		

	
			
	
	
			
		
		
			
			
				
					
					
					
					
			
		   
			 UBND QUẬN 4
		   
		  
		  
					
				
			
			
		
		
			
			
			
			
				
				
				
			
		   
			
			
			
			
			
			
			
	
		 -->
		 
		 
			
		


 -->


/default.aspx





    
        
        
            
                
                    Trang chủ
            
        
        
        
            
                
                    Sơ đồ site
            
        
        
    



	//iclude file js
	function loadjscssfile(filename, filetype){
		 if (filetype=="js"){ //if filename is a external JavaScript file
		  var fileref=document.createElement(''script'')
		  fileref.setAttribute("type","text/javascript")
		  fileref.setAttribute("src", filename)
		 }
		 else if (filetype=="css"){ //if filename is an external CSS file
		  var fileref=document.createElement("link")
		  fileref.setAttribute("rel", "stylesheet")
		  fileref.setAttribute("type", "text/css")
		  fileref.setAttribute("href", filename)
		 }
		 if (typeof fileref!="undefined")
		  document.getElementsByTagName("head")[0].appendChild(fileref)
	}

	//test
	function dosomething() {
	 if (checkobject("test")) {
	  alert("This object exists");
	   document.getElementById("test").value = "It Existed";
	 }
	}
	
	//check element
	function checkobject(obj) {
		if (document.getElementById(obj)) { return true; } else { return false; }
	}
	
	//load file js
	if (checkobject("topnav_7")==false) {
	  loadjscssfile("/_layouts/LacVietBio/UserControls/TopMenu/jquery-1.4.1.js", "js") //dynamically load and add this .js file
	}




    $(document).ready(function() {


        var CurrentPath = $.trim($("div#dvnduyPath").text());
        $("a[href=''" + CurrentPath + "'']").parent(".main-level").parent(".parent").attr("id", "LvSelected");
		//$("#topnav").children().attr("id", "LvSelected");
        // Xác định tọa độ trong menu


        $("div").children("ul").children("li").each(function(e) {
           
            var p = $(this).position().left + ($(this).outerWidth() / 2);
            $(this).children("ul").css("display", "none");

            if (p >= 350 && p <=500 ) 
            {
               /* $(this).children("ul.children").children().css("float", "right");*/
				
				 $(this).children("ul.children").css("top", "30px");
				  $(this).children("ul.children").css("position", "absolute");
            }
             if (p > 500 ) 
            {
                $(this).children("ul.children").children().css("float", "right");
            }
        });
        // Xác định vị trí của Tab đang được chọn
        var index = $("li#LvSelected").attr("duy");


        $("#wrapper").mouseleave(function() {

            $("ul#topnav li ul.children").css("display", "none");
            $("ul#topnav").children("li").eq(parseInt(index)).attr("id", "LvSelected");
            $("li#LvSelected").children().css("display", "block");

        });

        $("li.parent").hover
        (
               function() {

                   $("ul#topnav").children("li").children("ul").css("display", "none");
                   $(this).children().css("display", "block");
                   $("li#LvSelected").attr("id", "");
                   $(this).attr("id", "LvSelected");

               },
               function() {

                   $(this).attr("id", "");


               });


        $("ul#LvSelected").css("display", "block");
        $("ul#LvSelected").children().css("display", "block");

        $("ul#topnav li ul.children").css("display", "none");
        $("ul#topnav").children("li").eq(parseInt(index)).attr("id", "LvSelected");
        $("li#LvSelected").children().css("display", "block");

    });
        





			
			
				
					
				
						
		   
		   
		   	
		   	
		   		
		  				            							
                        function tS(){ x=new Date(); x.setTime(x.getTime()); return x; }
                        function y2(x){ x=(x<500)?x+1900:x; return String(x).substring(0,4) }
                        function k(){var ap="AM";
						 if ((tS().getHours())   > 11) { ap ="PM"; };return ap;}
                        function dT(){ 
                        
						  if(fr==0){ fr=1; document.write(''''+eval(oT)+''''); } tP.innerText=eval(oT); setTimeout(''dT()'',1000); }
                        var dN=new Array(''Chủ nhật'',''Thứ hai'',''Thứ ba'',''Thứ tư'',''Thứ năm'',''Thứ sáu'',''Thứ bảy''),mN=new Array(''1'',''2'',''3'',''4'',''5'',''6'',''7'',''8'',''9'',''10'',''11'',''12''),fr=0,oT="dN[tS().getDay()]+'', ''+tS().getDate()+''/''+mN[tS().getMonth()]+''/''+y2(tS().getYear())+''-''+tS().getHours()+'':''+tS().getMinutes()+'' ''+k()";
                     
                     dT();
		  		

		   	
		   	
				
				
		   	
		   	
	
		 
			
				
					
				
			
		
	

				
				
		   	
		   	
		   	
		   
		  
		
			
		
		
			
			
				
					
					
					
					
					
						
							
							
							
						
						
							
							
							
			
			UBND QUẬN 4

							
							
							
						
					
					
					
						

					
					
					
						
							
								

	
	
		
			
				
					
  -->
    
 -->


    var jLeftMenu = jQuery.noConflict();
    jLeftMenu(function($) {

        $("div.ms-navheader").mouseover(function() {

            $(this).addClass("heading-hover");

        }).mouseout(function() {
            $(this).removeClass("heading-hover");
        });
        $("div.ms-navheader-icon").mouseover(function() {
            $(this).addClass("heading-hover");

        }).mouseout(function() {
            $(this).removeClass("heading-hover");
        });
        $("div.ms-navItem").mouseover(function() {
            $(this).addClass("ms-navItem-hover");
        }).mouseout(function() {
            $(this).removeClass("ms-navItem-hover");
        });
        $("div.ms-navItem-icon").mouseover(function() {
            $(this).addClass("ms-navItem-hover");
        }).mouseout(function() {
            $(this).removeClass("ms-navItem-hover");
        });
    });

    
   


						GIỚI THIỆUGiới thiệu chungĐịa giới h&#224;nh ch&#237;nhCơ cấu tổ chứcĐỊA ĐIỂM THAM QUANBến Nh&#224; Rồng - Bảo t&#224;ng Hồ Ch&#237; MinhĐ&#236;nh - Ch&#249;a - Nh&#224; thờTH&#212;NG TIN CẦN BIẾTTuyển dụng c&#244;ng chứcTh&#244;ng tin b&#225;o c&#225;o thống k&#234;QUY HOẠCH PH&#193;T TRIỂNĐịnh hướng ph&#225;t triển kinh tếLĩnh vực quản l&#253; đ&#244; thịCh&#237;nh s&#225;ch ưu đ&#227;iDự &#225;n mời gọi đầu tưDự &#225;n, hạn mục đầu tưQuy hoạch đ&#244; thị, kế hoạch sử dụng đấtCHỈ ĐẠO ĐIỀU H&#192;NHVăn bản chỉ đạo điều h&#224;nh&#221; kiến - Phản hồiTIN TỨC SỰ KIỆNĐảng - Mặt trận Tổ quốc v&#224; c&#225;c Đo&#224;n thểCh&#237;nh quyềnKhối phườngVĂN BẢN PH&#193;P LUẬTQuậnTh&#224;nh phốTrung ươngCẢI C&#193;CH H&#192;NH CH&#205;NHTHỦ TỤC H&#192;NH CH&#205;NHTRA CỨU HỒ SƠ H&#192;NH CH&#205;NHKẾ HOẠCH C&#212;NG T&#193;C
					



				
			
		
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveLink(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }




						
LI&Ecirc;N KẾT WEB



    
        
            
            Trang web li&ecirc;n kết
              Hồ Ch&iacute; Minh city web
            Quận 1
            Quận 2
            Quận 3
            Quận 4
            Quận 5
            Quận 6
            Quận 7
            Quận 8
            Quận 9
            Quận 10
            Quận 11
            Quận 12
            Quận B&igrave;nh T&acirc;n
            Quận B&igrave;nh Thạnh
            Quận G&ograve; Vấp
            Quận Ph&uacute; Nhuận
            Quận T&acirc;n B&igrave;nh
            Quận T&acirc;n Ph&uacute;
            Quận Thủ Đức
            Huyện B&igrave;nh Ch&aacute;nh
            Huyện Cần Giờ
            Huyện Củ Chi
            Huyện H&oacute;c M&ocirc;n
            Huyện Nh&agrave; B&egrave;
            
        
    




					

 
						
    
        
            
             
        
        
    

					

				
			
		
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveLink(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }




						
					

 
						
    
        
            
             
        
        
    

					

				
			
		
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveQC(right, newsid, menuid, img) {

        if (right == ''true'') {

            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }


 
						
 
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
						
					   
 
						
    
        
            
        
    

					

				
			
		
	

	

							
								
									
									
										
											&nbsp;
											
											
												
													
														
				
				
				
				Khởi chạy Nhanh
				
				Xem Tất cả Nội dung trang Web
				
				
				
	
				
					
						
					 
				
				

				
				
				
		
		
		
		
		
		
				
				
			  
														

														
													
												
												
													
													
													
												
											
										
										
										
										
										
									
								
								
								
								

								
								
								
		
								
									
										
										
										
											
													

	
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveLink(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }




						
					

 
						
    
        
            
             
        
        
    

					

				
			
		
	
		
			
				
					





 var jHotNews = jQuery.noConflict();
  function slideSwitch() 
  {
      var jQueryActive = jHotNews(''#slideshow DIV.active'');
     
      if ( jQueryActive.length == 0 ) jQueryActive = jHotNews(''#slideshow DIV:last'');
      var jQueryNext =  jQueryActive.next().length ? jQueryActive.next(): jHotNews(''#slideshow DIV:first'');
      jQueryActive.addClass(''last-active'');
      
      jQueryNext.css({opacity: 0.0})
          .addClass(''active'')
          .animate({opacity: 1.0}, 1000, function() {
          jQueryActive.removeClass(''active last-active'');
          
          });
  }
  jHotNews(function($) {
  var cmshotnewsrefreshIntervalId=setInterval( "slideSwitch()", "4000" );
          $(".a-hot-link").mouseover(function() {

            var kq = $(this).attr(''id'');

            $(''div.hl-latestnews3'').each(function() {
                if ($(this).attr(''idItem'') == kq) {
                    $(this).addClass(''active'');
                    clearInterval(cmshotnewsrefreshIntervalId);
                }
                else {
                    $(this).removeClass(''active'');
                }
            });
        }).mouseout(function() {
            cmshotnewsrefreshIntervalId = setInterval("slideSwitch()", "4000");
        });
  });



/**Tin noi bat***/
/*#slideshow{width:295px;float:left;height:380px;position:relative;}
#slideshow DIV{position:absolute;top:0;left:0;z-index:80;opacity:.0;width:295px;background-color:#FFF;height:100%;}
#slideshow DIV.active{z-index:100;opacity:1.0;width:295px;height:100%;}
#slideshow DIV.last-active{z-index:90;height:100%;}
#slideshow DIV IMG{display:block;border:0;margin-bottom:10px;}*/


    
        
            
                
                    
                    
                    
                        
                        
                            
                        
                         
                        
                            
                                Công khai kết quả sơ tuyển ngày 12/6/2015
                            
                        
                        
                             
Hội đồng sơ tuyển Quận 4 công khai kết quả sơ tuyển ngày 12/6/2015

(Xem toàn văn kết quả sơ tuyển tại đây)
                        
                       
                    
                    
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Công khai kết quả sơ tuyển ngày 13/6/2015
                            
                        
                        
                             
Hội đồng sơ tuyển Quận 4 công khai kết quả sơ tuyển ngày 13/6/2015

(Xem toàn văn kết quả sơ tuyển tại đây)
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Tăng cường thực hiện công tác truyền thông Dân số - Kế hoạch hóa gia đình
                            
                        
                        
                            
Sáng 16/6/2015, Vụ Truyền thông- giáo dục (TT-GD) Tổng cục Dân số- Kế hoạch hóa gia đình (Bộ y tế) phối hợp với Ủy ban nhân dân Quận 4 tổ chức Hội thảo thu thập thông tin tổng kết chương trình hành động truyền thông về hành vi dân số và Kế hoạch hóa gia đình giai đoạn 2011-2015. Đến dự có các đồng chí: Đinh Huy Dương- Vụ trưởng TT-GD; Lâm Hùng ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                3 năm tù cho hành vi cướp giật tài sản
                            
                        
                        
                            
Sáng ngày 16/6/2015, tại Trường tiểu học Nguyễn Trường Tộ, Phường 16, Quận 4, Tòa án nhân dân Quận 4 tổ chức phiên tòa xét xử lưu động đối với 2 bị cáo Nguyễn Thanh Tuấn (sinh năm 1986, ngụ tại Phường 15, Quận 8) can tội cướp giật tài sản và bị cáo Nguyễn Huy Điền (sinh năm 1974, ngụ tại Phường 18, Quận 4) với tội danh mua bán trái phép chất ma ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Kế hoạch công tác tuần của Thường trực Ủy ban nhân dân Quận 4 - Tuần 21, năm 2015 (Từ ngày 15/6/2015 đến ngày 20/6/2015)
                            
                        
                        
                             


 
 
 
 STT
 
 
 Công tác tuần
 
 
 
 
 1
 
 
 Dự hội nghị tuyên dương gương “người tốt việc tốt” giai đoạn 2010-2015
 
 
 
 
 2
 
 
 Nghe Phòng Nội vụ báo cáo việc triển khai Nghị định 108 về tinh giản biên chế; kế hoạch tổ chức lớp trung cấp Chính trị - Hành chính; việc chuyển giao Văn phòng đăng ký quyền sử dụng ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Hội Cựu Chiến binh Quận 4 phối hợp Tập đoàn thiết bị y tế Bộ quốc phòng Tuyên truyền an toàn thực phẩm trên địa bàn Quận 4
                            
                        
                        
                            
Căn cứ Công văn chỉ đạo của Hội Cựu Chiến binh Thành phố Hồ Chí Minh về việc tuyên truyền tư vấn, phổ biến, nhằm tăng cường kiến thức về an toàn vệ sinh thực phẩm cho cán bộ, hội viên Cựu chiến binh trên toàn Thành phố, trong hai ngày 13, 14 tháng 6 năm 2015, Tập đoàn Thiết bị Y tế Bộ quốc phòng phối hợp với Hội CCB cơ sở các Phường 1, 2, 5, 6, ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Đảng bộ Doanh nghiệp Quận 4: Phấn đấu trong nhiệm kỳ phát triển 25 đảng viên
                            
                        
                        
                            
Sáng 14/6/2015, Đảng bộ Doanh Nghiệp Quận 4 đã tổ chức Đại hội Đảng bộ lần thứ III, nhiệm kỳ 2015 – 2020. 73 đảng viên tham dự.

Nhiệm kỳ qua, Đảng bộ Doanh nghiệp đã tập trung lãnh đạo, thực hiện có hiệu quả các nhiệm vụ sản xuất kinh doanh, xây dựng đảng mang lại nhiều kết quả tích cực. Hiện Đảng bộ có 08 chi bộ doanh nghiệp; đã thành lập ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Phường 9: Phấn đấu trong nhiệm kỳ 100% hẻm được sửa chữa nâng cấp
                            
                        
                        
                            
Sáng 13/6/2015, Đảng bộ Phường 9, Quận 4 tổ chức thành công Đại hội Đảng bộ lần thứ XIII nhiệm kỳ 2015 – 2020. 141 đảng viên tham gia đại hội.

Nhiệm kỳ qua, Đảng bộ phường đã cơ bản hoàn thành các chỉ tiêu đề ra, các công trình phúc lợi, dân sinh, cơ sở hạ tầng phát triển đã góp phần cải thiện đời sống vật chất, tinh thần của nhân dân. Công ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Phường 14: Phấn đấu 100% tổ dân phố đạt chuẩn tự quản về an ninh trật tự
                            
                        
                        
                            

Đảng bộ Phường 14, Quận 4 đã tổ chức thành công Đại hội lần thứ XIII, nhiệm kỳ 2015 – 2020 vào sáng 12/6/2015. 121 đảng viên tham dự đại hội.
 

 
 
 
 Đồng chí Trần Hoàng Danh, Bí thư Quận ủy tặng lẵng hoa chúc mừng đại hội Đảng bộ 
 Phường 14
 
 


Trong nhiệm kỳ 2010 - 2015, Đảng bộ Phường 14 đã nổ lực phấn đấu cao và đạt được ...
                        
                        
                    
                    
                
            
        
        
            
            
                
                    
                        
                            TIN NỔI BẬT
                        
                    
                
                 

                
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews0" href="http://www.quan4.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=Tuy%e1%bb%83n+d%e1%bb%a5ng+c%c3%b4ng+ch%e1%bb%a9c&ItemID=2677&Mode=1" class="a-hot-link" title="Hội đồng sơ tuyển Quận 4 công khai kết quả sơ tuyển ngày 12/6/2015

(Xem toàn văn kết quả sơ tuyển tại đây)">
                                Công khai kết quả sơ tuyển ngày 12/6/2015
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews1" href="http://www.quan4.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=Tuy%e1%bb%83n+d%e1%bb%a5ng+c%c3%b4ng+ch%e1%bb%a9c&ItemID=2678&Mode=1" class="a-hot-link" title="Hội đồng sơ tuyển Quận 4 công khai kết quả sơ tuyển ngày 13/6/2015

(Xem toàn văn kết quả sơ tuyển tại đây)">
                                Công khai kết quả sơ tuyển ngày 13/6/2015
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            
                                Tăng cường thực hiện công tác truyền thông Dân số - Kế hoạch hóa gia đình
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            
                                3 năm tù cho hành vi cướp giật tài sản
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews4" href="http://www.quan4.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=K%e1%ba%bf+ho%e1%ba%a1ch+c%c3%b4ng+t%c3%a1c+tu%e1%ba%a7n+c%e1%bb%a7a+TTUB&ItemID=2674&Mode=1" class="a-hot-link" title="STT
 
 
 Công tác tuần
 
 
 
 
 1
 
 
 Dự hội nghị tuyên dương gương “người tốt việc tốt” giai đoạn 2010-2015
 
 
 
 
 2
 
 
 Nghe Phòng Nội vụ báo cáo việc triển khai Nghị định 108 về tinh giản biên chế; kế hoạch tổ chức lớp trung cấp Chính trị - Hành chính; việc chuyển giao Văn phòng đăng ký quyền sử dụng ...">
                                Kế hoạch công tác tuần của Thường trực Ủy ban nhân dân Quận 4 - Tuần 21, năm 2015 (Từ ngày 15/6/2015 đến ngày 20/6/2015)
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            
                                Hội Cựu Chiến binh Quận 4 phối hợp Tập đoàn thiết bị y tế Bộ quốc phòng Tuyên truyền an toàn thực phẩm trên địa bàn Quận 4
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews6" href="http://www.quan4.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=%c4%90%e1%ba%a3ng+-+%c4%90o%c3%a0n+th%e1%bb%83&ItemID=2672&Mode=1" class="a-hot-link" title="Sáng 14/6/2015, Đảng bộ Doanh Nghiệp Quận 4 đã tổ chức Đại hội Đảng bộ lần thứ III, nhiệm kỳ 2015 – 2020. 73 đảng viên tham dự.

Nhiệm kỳ qua, Đảng bộ Doanh nghiệp đã tập trung lãnh đạo, thực hiện có hiệu quả các nhiệm vụ sản xuất kinh doanh, xây dựng đảng mang lại nhiều kết quả tích cực. Hiện Đảng bộ có 08 chi bộ doanh nghiệp; đã thành lập ...">
                                Đảng bộ Doanh nghiệp Quận 4: Phấn đấu trong nhiệm kỳ phát triển 25 đảng viên
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews7" href="http://www.quan4.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=Kh%e1%bb%91i+ph%c6%b0%e1%bb%9dng&ItemID=2671&Mode=1" class="a-hot-link" title="Sáng 13/6/2015, Đảng bộ Phường 9, Quận 4 tổ chức thành công Đại hội Đảng bộ lần thứ XIII nhiệm kỳ 2015 – 2020. 141 đảng viên tham gia đại hội.

Nhiệm kỳ qua, Đảng bộ phường đã cơ bản hoàn thành các chỉ tiêu đề ra, các công trình phúc lợi, dân sinh, cơ sở hạ tầng phát triển đã góp phần cải thiện đời sống vật chất, tinh thần của nhân dân. Công ...">
                                Phường 9: Phấn đấu trong nhiệm kỳ 100% hẻm được sửa chữa nâng cấp
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews8" href="http://www.quan4.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=Kh%e1%bb%91i+ph%c6%b0%e1%bb%9dng&ItemID=2670&Mode=1" class="a-hot-link" title="Đảng bộ Phường 14, Quận 4 đã tổ chức thành công Đại hội lần thứ XIII, nhiệm kỳ 2015 – 2020 vào sáng 12/6/2015. 121 đảng viên tham dự đại hội.
 

 
 
 
 Đồng chí Trần Hoàng Danh, Bí thư Quận ủy tặng lẵng hoa chúc mừng đại hội Đảng bộ 
 Phường 14
 
 


Trong nhiệm kỳ 2010 - 2015, Đảng bộ Phường 14 đã nổ lực phấn đấu cao và đạt được ...">
                                Phường 14: Phấn đấu 100% tổ dân phố đạt chuẩn tự quản về an ninh trật tự
                            
                        
                    
                    
                
                
            
            
        
    


				
			
		
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveLink(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }




						
&nbsp;
					

 
						
    
        
            
             
        
        
    

					

				
			
		
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=%c4%90%e1%ba%a3ng+-+%c4%90o%c3%a0n+th%e1%bb%83&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    Đảng - Mặt trận Tổ quốc và các Đoàn thể
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Hội Cựu Chiến binh Quận 4 phối hợp Tập đoàn thiết bị y tế Bộ quốc phòng Tuyên truyền an toàn thực phẩm trên địa bàn Quận 4
                            
                            
                        
                    
                    
                        
                            
                            
                                
                                    
                                        
                                            
                                        
                                    
                                
                            
                            
                            
                                
Căn cứ Công văn chỉ đạo của Hội Cựu Chiến binh Thành phố Hồ Chí Minh về việc tuyên truyền tư vấn, phổ biến, nhằm tăng cường kiến thức về an toàn vệ sinh thực phẩm cho cán bộ, hội viên Cựu chiến binh trên toàn Thành phố, trong hai ngày 13, 14 tháng 6 năm 2015, Tập đoàn Thiết bị Y tế Bộ quốc phòng phối hợp với Hội CCB cơ sở các Phường 1, 2, 5, 6, ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Đảng bộ Doanh nghiệp Quận 4: Phấn đấu trong nhiệm kỳ phát triển 25 đảng viên
                            
                            
                            &nbsp;(15/06)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Lãnh đạo Quận 4 các nhiệm kỳ góp ý văn kiện đại hội Đảng bộ Quận 4  lần thứ XI, nhiệm kỳ 2015-2020
                            
                            
                            &nbsp;(10/06)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=Ch%c3%adnh+quy%e1%bb%81n&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    Chính quyền
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Tăng cường thực hiện công tác truyền thông Dân số - Kế hoạch hóa gia đình
                            
                            
                        
                    
                    
                        
                            
                            
                                
                                    
                                        
                                            
                                        
                                    
                                
                            
                            
                            
                                
Sáng 16/6/2015, Vụ Truyền thông- giáo dục (TT-GD) Tổng cục Dân số- Kế hoạch hóa gia đình (Bộ y tế) phối hợp với Ủy ban nhân dân Quận 4 tổ chức Hội thảo thu thập thông tin tổng kết chương trình hành động truyền thông về hành vi dân số và Kế hoạch hóa gia đình giai đoạn 2011-2015. Đến dự có các đồng chí: Đinh Huy Dương- Vụ trưởng TT-GD; Lâm Hùng ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                3 năm tù cho hành vi cướp giật tài sản
                            
                            
                            &nbsp;(17/06)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Phường 3 không còn hộ nghèo có thu nhập dưới 16 triệu đồng/người/năm
                            
                            
                            &nbsp;(15/06)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=KH%e1%bb%90I+PH%c6%af%e1%bb%9cNG&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    Khối phường
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Phường 9: Phấn đấu trong nhiệm kỳ 100% hẻm được sửa chữa nâng cấp
                            
                            
                        
                    
                    
                        
                            
                            
                                
                                    
                                        
                                            
                                        
                                    
                                
                            
                            
                            
                                
Sáng 13/6/2015, Đảng bộ Phường 9, Quận 4 tổ chức thành công Đại hội Đảng bộ lần thứ XIII nhiệm kỳ 2015 – 2020. 141 đảng viên tham gia đại hội.

Nhiệm kỳ qua, Đảng bộ phường đã cơ bản hoàn thành các chỉ tiêu đề ra, các công trình phúc lợi, dân sinh, cơ sở hạ tầng phát triển đã góp phần cải thiện đời sống vật chất, tinh thần của nhân dân. Công ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Phường 14: Phấn đấu 100% tổ dân phố đạt chuẩn tự quản về an ninh trật tự
                            
                            
                            &nbsp;(15/06)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Phường 12: Phấn đấu đạt 100% tổng thu ngân sách Nhà nước hàng năm
                            
                            
                            &nbsp;(11/06)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=N%e1%ba%bfp+s%e1%bb%91ng+v%c4%83n+minh+%c4%91%c3%b4+th%e1%bb%8b+-+M%e1%bb%b9+quan+%c4%91%c3%b4+th%e1%bb%8b&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    Nếp sống văn minh đô thị - Mỹ quan đô thị
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Phường 1 tổ chức tổng vệ sinh môi trường hưởng ứng Chiến dịch làm cho thế giới sạch hơn năm 2011
                            
                            
                        
                    
                    
                        
                            
                            
                                
                                    
                                        
                                            
                                        
                                    
                                
                            
                            
                            
                                Thực hiện Kế hoạch số 106/KH-UBND ngày 20/9/2011 của Ủy ban nhân dân quận 4, tổ chức các hoạt động hưởng ứng Chiến dịch làm cho thế giới sạch hơn trên địa bàn quận 4 năm 2011, phường 1 đã huy động lực lượng gồm các ngành, các Đoàn thể phường, Ban điều hành khu phố, Tổ dân phố và vận động nhân dân tổ chức ra quân tổng vệ sinh môi trường trên toàn ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Phường 1 tuyên truyền vận động nhân dân thực hiện nếp sống văn minh trong việc cưới, việc tang, Lễ hội
                            
                            
                            &nbsp;(15/09)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Tổng kết 15 năm cuộc vận động “Toàn dân đoàn kết xây dựng đời sống văn hóa ở khu dân cư” giai đoạn 1995 - 2010 và 10 năm thực hiện cuộc vận động “Vì người nghèo” giai đoạn 2001 - 2010
                            
                            
                            &nbsp;(08/11)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=Ph%c3%b2ng+ch%e1%bb%91ng+ch%c3%a1y+n%e1%bb%95%2c+l%e1%bb%a5t+b%c3%a3o%2c+an+to%c3%a0n+giao+th%c3%b4ng&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    Phòng chống cháy nổ, lụt bão, an toàn giao thông
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Triển khai các biện pháp đảm bảo an toàn phòng cháy và chữa cháy trong mùa khô và dịp tết Nguyên đán năm 2014
                            
                            
                        
                    
                    
                        
                            
                            
                                
                                    
                                        
                                            
                                        
                                    
                                
                            
                            
                            
                                
Chiều ngày 06/12/2013, đồng chí Nguyễn Anh Tuấn - Phó Chủ tịch Ủy ban nhân dân quận 4, Trưởng Ban chỉ đạo công tác phòng cháy và chữa cháy (PCCC)đã triển khai kế hoạch phòng cháy và chữa cháy trong các ngày Lễ, Tết và mùa khô năm 2014 trên địa bàn. 

Đại diện Phòng Cảnh sát PCCC quận 4 đã báo cáo triển khai những nội dung chính của Kế hoạch ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Phường 18 tập huấn công tác phòng cháy chữa cháy- chuyên đề dành cho phụ nữ
                            
                            
                            &nbsp;(09/08)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Phường 18 họp giao ban kết quả triển khai thực hiện xây dựng khu phố 2 đạt chuẩn khu phố an toàn về phòng cháy chữa cháy
                            
                            
                            &nbsp;(07/07)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=M%e1%bb%a4C+TIN&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    Mẫu Webpart
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	

	

											
										
										
									
		
	  							
								
								
									
								
								
	
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveQC(right, newsid, menuid, img) {

        if (right == ''true'') {

            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }


 
						
 
							
								
							
								
							
								
							
								
							
								
							
						
					   
 
						
    
        
            
        
    

					

				
			
		
	
		
			
				
					


  










    var transiteTime = parseInt(''3500'');

    var albumbox = jQuery.noConflict();
    albumbox(document).ready(function() {

        var optionsLeft = {
            caption: ''hover'',
            opacity: 0.8,
            easing: ''swing'',
            widthimg:''194'',
            duration: 240
        }

        var optionsRight = {
            caption: ''hover'',
            opacity: 0.8,
            navigation: ''hover'',
            direction: ''left'',
            easing: ''swing'',
            widthimg: ''194'',
            duration: 240
        }
        var gt = albumbox(''#ppy1'').position().left;

        var duy;
        if (gt > 500)
            albumbox(''div#ppy1'').popeye(optionsRight);
        else
            albumbox(''div#ppy1'').popeye(optionsLeft);

        albumbox(''div.ppy-nav'').hide();
        var flag = true;

        albumbox.doTimeout(transiteTime, function() {
            if (flag == false)
                return false;

            
            albumbox(''a.ppy-next1'').click();
            return true;
        });

        albumbox(''a.ppy-next'').click(function() {
            flag = false;
        });
        albumbox(''a.ppy-prev'').click(function() {
            flag = false;
        });

    });
    
   



        
            
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
            
            
                
                    
                        HÌNH ẢNH TUYÊN TRUYỀN
                
                
                    
                
                
                    
                        Previous image 
                        Next image 
                        Enlarge
                        Close
                    
                
                
                
                    Xem tất cả
                
            
        
        Next image
        
				
			
		
	
		
			
				
					









    var vbox = jQuery.noConflict();

        var width = ''194'' + "px";
        var height = ''194'' + "px";
        vbox(document).ready(function() {

        if (vbox("#ctl00_m_g_d36bb607_76c5_494a_ab25_99c6359daa14_ctl00_listvideobox").children("li").length <= 1) {
            vbox("#ctl00_m_g_d36bb607_76c5_494a_ab25_99c6359daa14_ctl00_listvideobox").parent().hide();
        }
        
        if (''True'' == ''True'') {

                vbox(''li.item-videobox'').live(''click'', function() {
                    var gt = vbox(this).attr(''linkVideo'');
                    var thumbnail = vbox(this).attr(''thumbnail'');
                    var videoplayer = vbox(this).attr(''videoplayer'');

                    jwplayer(videoplayer).setup({
                        flashplayer: "/_LAYOUTS/LacVietBio/UserControls/PhotoAlbum/images/player4.6.swf",
                        autostart: true,
                        file: gt,
                        image: thumbnail,
                        height: height,
                        width: width
                    });
                });
           
            
        }
    });
    





    
         
        
        
        
            
                
                
                    Bản tin Hoạt động Quận 4 từ 18/5 đến 31/5/2015 
             
                
                    Bản tin Hoạt động Quận 4 từ 11/5 đến 17/5/2015 
             
                
                    Bản tin Hoạt động Quận 4 từ 04/5 đến 10/5/2015 
             
                
                    Bản tin Hoạt động Quận 4 từ 06/4 đến 30/4/2015 
             
                
                    Bản tin Hoạt động Quận 4 từ 25/3 đến 05/4/2015 
             
                
                    Bản tin Hoạt động Quận 4 từ 09/3 đến 22/3/2015 
             
                
                    Bản tin Hoạt động Quận 4 từ 01/3 đến 08/3/2015 
             
                
                    Bản tin Hoạt động Quận 4 từ 08/02 đến 25/02/2015 
             
                
                    Bản tin Hoạt động Quận 4 từ 25/01 đến 08/02/2015 
             
                
                    Bản tin Hoạt động Quận 4 từ 12/01 đến 25/01/2015 
             
                
                    Bản tin Hoạt động Quận 4 từ 05 đến 11/01/2015 
             
                
                    Bản tin Hoạt động Quận 4-29/12/2014-04/01/2015 
             
                
                    Bản tin Hoạt động Quận 4-22/12-28/12/2014
             
                
                    Bản tin Hoạt động Quận 4-15/12-21/12/2014 
             
                
                    Bản tin Hoạt động Quận 4-08/12-14/12/2014 
             
                
                    Bản tin Hoạt động Quận 4-01/12-07/12/2014 
             
                
                    Bản tin Hoạt động Quận 4-24/11-30/11/2014 
             
                
                    Bản tin Hoạt động Quận 4-17/11-23/11/2014 
             
                
                    Bản tin Hoạt động Quận 4-10/11-16/11/2014 
             
                
                    Bản tin Hoạt động Quận 4-03/11-09/11/2014 
             
                
                    Bản tin Hoạt động Quận 4-27/10-02/11/2014 
             
                
                    Bản tin Hoạt động Quận 4-20/10-26/10/2014 
             
                
                    Thông báo dịch vụ sử dụng điện qua SMS của Điện lực
             
                
                    Bản tin Hoạt động Quận 4-13/10-19/10/2014 
             
                
                    Bản tin Hoạt động Quận 4 - 06/10-12/10/2014 
             
                
                    Bản tin Hoạt động Quận 4-15/9-21/9/2014 
             
                
                    Bản tin Hoạt động Quận 4-01/9-07/9/2014 
             
                
                    Bản tin Hoạt động Quận 4-11/8-17/8/2014 
             
                
                    Bản tin Hoạt động Quận 4-21/7-28/7/2014 
             
                
                    Bản tin Hoạt động Quận 4-14/7-20/7/2014 
             
                
                    Bản tin Hoạt động Quận 4-07/7-13/7/2014 
             
                
                    Bản tin Hoạt động Quận 4-23/6-30/6/2014 
             
                
                    Bản tin Hoạt động Quận 4-16/6-22/6/2014 
             
                
                    Bản tin Hoạt động Quận 4-09/6-15/6/2014 
             
                
                    Bản tin Hoạt động Quận 4-02/6-08/6/2014 
             
                
                    Bản tin Hoạt động Quận 4-05/05-11/05/2014
             
                
                    Bản tin Hoạt động Quận 4-31/03-16/04/2014 
             
                
                    Bản tin Hoạt động Quận 4-24/03-30/03/2014 
             
                
                    Bản tin Hoạt động Quận 4-17/03-23/03/2014 
             
                
                    Bản tin Hoạt động Quận 4-10/03-16/03/2014 
             
                
                    Bản tin Hoạt động Quận 4-27/02-07/03/2014 
             
                
                    Bản tin Hoạt động Quận 4-17/02-23/02/2014 
             
                
                    Bản tin Hoạt động Quận 4-13/01-19/01/2014
             
                
                    Bản tin Hoạt động Quận 4-06/01-12/01/2014
             
                
                    Bản tin Hoạt động Quận 4-30/12/2013-05/01/2014
             
                
                    Bản tin Hoạt động Quận 4-23/12-29/12/2013 
             
                
                    Bản tin Hoạt động Quận 4-16/12-22/12/2013 
             
                
                    Bản tin Hoạt động Quận 4-09/12-15/12/2013 
             
                
                    Bản tin Hoạt động Quận 4-02/12-08/12/2013 
             
                
                    Bản tin Hoạt động Quận 4-18/11-24/11/2013 
             
                
                    Bản tin Hoạt động Quận 4-15/11-17/11/2013 
             
                
                    Bản tin Hoạt động Quận 4-11/11-14/11/2013 
             
                
                    Bản tin Hoạt động Quận 4-04/11-10/11/2013 
             
                
                    Bản tin Hoạt động Quận 4-28/10-03/11/2013 
             
                
                    Bản tin Hoạt động Quận 4-21/10-27/10/2013 
             
                
                    Bản tin Hoạt động Quận 4-16/10-20/10/2013
             
                
                    Bản tin Hoạt động Quận 4-06/10-13/10/2013
             
                
                    Bản tin Hoạt động Quận 4-03/10-06/10/2013
             
                
                    Bản tin Hoạt động Quận 4-01/10/2013
             
                
                    Bản tin Hoạt động Quận 4-23/9-01/10/2013 
             
                
                    Bản tin Hoạt động Quận 4-17/9-20/9/2013 
             
                
                    Bản tin Hoạt động Quận 4-10/9-14/9/2013 
             
                
                    Bản tin Hoạt động Quận 4-05/9-06/9/2013 
             
                
                    Bản tin Hoạt động Quận 4-03/9-05/9/2013 
             
                
                    Bản tin Hoạt động Quận 4-27/8-31/8/2013 
             
                
                    Bản tin Hoạt động Quận 4-20/8-25/8/2013 
             
                
                    Bản tin Hoạt động Quận 4-13/8-16/8/2013 
             
                
                    Bản tin Hoạt động Quận 4-06/8-09/8/2013 
             
                
                    Bản tin Hoạt động Quận 4-05/8-06/8/2013 
             
                
                    Bản tin Hoạt động Quận 4-31/7-01/8/2013 
             
                
                    Bản tin Hoạt động Quận 4-25/7-26/7/2013 
             
                
                    Bản tin Hoạt động Quận 4-24/7-25/7/2013 
             
                
                    Bản tin Hoạt động Quận 4-17/7-19/7/2013 
             
                
                    Bản tin Hoạt động Quận 4-10/7-13/7/2013
             
                
                    Bản tin Hoạt động Quận 4-09/7-10/7/2013 
             
                
                    Bản tin Hoạt động Quận 4-02/7-05/7/2013 
             
                
                    Bản tin Hoạt động Quận 4-22/6-29/6/2013 
             
                
                    Bản tin Hoạt động Quận 4-14/6-21/6/2013
             
                
                    Bản tin Hoạt động Quận 4-11/6-16/6/2013 
             
                
                    Bản tin Hoạt động Quận 4-02/6-07/6/2013 
             
                
                    Bản tin Hoạt động Quận 4-04/5-18/5/2013 
             
                
                    Bản tin Hoạt động Quận 4-23/4-27/4/2013 
             
                
                    Bản tin Hoạt động Quận 4-10/4-18/4/2013 
             
                
                    Bản tin Hoạt động Quận 4-02/4-05/4/2013 
             
                
                    Bản tin Hoạt động Quận 4-06/03-16/03/2013 
             
                
                    Bản tin Hoạt động Quận 4-26/02-03/03/2013 
             
                
                    Bản tin Hoạt động Quận 4-29/01-23/02/2013 
             
                
                    Bản tin Hoạt động Quận 4-23/01-25/01/2013 
             
                
                    Bản tin Hoạt động Quận 4-17/01-22/01/2013 
             
                
                    Bản tin Hoạt động Quận 4-04/01-12/01/2013
             
                
                    Bản tin Hoạt động Quận 4-27/12-30/12/2012 
             
                
                    Bản tin Hoạt động Quận 4-09/12-25/12/2012 
             
                
                    Bản tin Hoạt động Quận 4-05/12-07/12/2012 
             
                
                    Bản tin Hoạt động Quận 4-26/11-03/12/2012 
             
                
                    Bản tin Hoạt động Quận 4-20/11-25/11/2012 
             
                
                    Bản tin Hoạt động Quận 4-06/11-15/11/2012 
             
                
                    Bản tin Hoạt động Quận 4-30/10-02/11/2012 
             
                
                    Bản tin Hoạt động Quận 4-24/10-26/10/2012 
             
                
                    Bản tin Hoạt động Quận 4-15/10-20/10/2012 
             
                
                    Bản tin Hoạt động Quận 4-10/10-12/10/2012 
             
                
                    Bản tin Hoạt động Quận 4-02/10-06/10/2012 
             
                
                    Bản tin Hoạt động Quận 4-26/9-30/9/2012 
             
        
    





    var linkFirstVideo = vbox("#ctl00_m_g_d36bb607_76c5_494a_ab25_99c6359daa14_ctl00_listvideobox").children("li").eq(0).attr(''linkvideo'');
    var firstThumbnail = vbox("#ctl00_m_g_d36bb607_76c5_494a_ab25_99c6359daa14_ctl00_listvideobox").children("li").eq(0).attr(''thumbnail'');
    jwplayer("ctl00_m_g_d36bb607_76c5_494a_ab25_99c6359daa14_ctl00_dvnduymainvideo").setup({
        flashplayer: "/_LAYOUTS/LacVietBio/UserControls/PhotoAlbum/images/player4.6.swf",
        file: linkFirstVideo,
        image: firstThumbnail,
        height: height,
        width: width
    });



				
			
		
	

	

								
								
								
										


    
        
            
                SỐ LƯỢT TRUY CẬP
        
        
            
                
                    
                        
	
		
                                
                                    
                                        
                                            
                                                6
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                0
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                8
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                5
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                9
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                1
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                9
                                        
                                    
                                
                            
	

                    
                
            
        
    
 

    
								
								
								
								
							
							
						
						
								
							
													
								
								 ỦY BAN NHÂN DÂN QUẬN 4, THÀNH PHỐ HỒ CHÍ MINH
								Số 5 Đoàn Như Hài, Phường 12, Quận 4, Thành phố Hồ Chí Minh.
								Tel: (84.8) 39400437 - Fax: (84.8) 39400064
								
								
																											
							
						
						
	
	
	
	


					
					
						
							

.ms-bodyareaframe {
	padding: 0px;
}


								

TD.ms-titleareaframe, .ms-pagetitleareaframe {
	height: 10px;
}
Div.ms-titleareaframe {
	height: 100%;
}
.ms-pagetitleareaframe table {
	background: none;
	height: 0px;
}


									
	
	
		 
			
				
					
						Trang web Này: UBND QUẬN 4

					
				
			
		
	


									
									
									
	


										
	
									
								
								
		
  
								
								
							


//<![CDATA[
var __wpmExportWarning=''This Web Part Page has been personalized. As a result, one or more Web Part properties may contain confidential information. Make sure the properties contain information that is safe for others to read. After exporting this Web Part, view properties in the Web Part description file (.WebPart) by using a text editor such as Microsoft Notepad.'';var __wpmCloseProviderWarning=''You are about to close this Web Part.  It is currently providing data to other Web Parts, and these connections will be deleted if this Web Part is closed.  To close this Web Part, click OK.  To keep this Web Part, click Cancel.'';var __wpmDeleteWarning=''You are about to permanently delete this Web Part.  Are you sure you want to do this?  To delete this Web Part, click OK.  To keep this Web Part, click Cancel.'';_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;//]]>

 

             
          
            function checkUrl(myArray) {

                
                if (!document.getElementById || !document.getElementsByTagName) return false;
                if (!document.getElementById(myArray)) return false;
                var links = document.getElementById(myArray);
                var node = findNode(links);
                
                if (node!=''-1'') {
                    var node_temp = node;
                    if (location.href.indexOf(''?'') != -1) {
                        var indexClass = jLeftMenu(node).parent().attr(''class'');
                       
                        if (indexClass.indexOf("ms-navItem") != -1) {

                            addClass(node_temp.parentNode, ''ms-navItem-selected'');
                            
                        }
                        if (indexClass.indexOf(''ms-navheader'') != -1) {

                            addClass(node_temp.parentNode, ''ms-navheader-selected'');
                            
                        }
                        while (node_temp.parentNode.id != myArray) {

                            if (node_temp.parentNode.id.split(''_'')[0].match(''ul'')) {

                                showMenu(node_temp.parentNode);
                            }
                            if (node_temp.parentNode.parentNode.id == myArray) {

                                if (node_temp.parentNode.id.split(''_'')[0].match(''li'')) {
                                    var temp = node_temp.parentNode.getElementsByTagName(''UL'');

                                    for (var i = 0; i < temp.length; i++) {

                                        if (node.parentNode.parentNode.id == temp[i].parentNode.id) {

                                            showMenu(temp[i]);
                                        }
                                    }
                                }
                            }

                            node_temp = node_temp.parentNode;
                        }
                    }
                    else {
                        var indexClass = $(node).parent().attr(''class'');
                        if (indexClass.indexOf(''ms-navItem'') != -1) {

                            addClass(node_temp.parentNode, ''ms-navItem-selected'');
                            
                        }
                        if (indexClass.indexOf(''ms-navheader'') != -1) {

                            addClass(node_temp.parentNode, ''ms-navheader-selected'');
                            
                        }
                        while (node_temp.parentNode.id != myArray) {

                            if (node_temp.parentNode.id.split(''_'')[0].match(''ul'')) {

                                showMenu(node_temp.parentNode);
                            }
                            if (node_temp.parentNode.parentNode.id ==myArray) {

                                if (node_temp.parentNode.id.split(''_'')[0].match(''li'')) {
                                    var temp = node_temp.parentNode.getElementsByTagName(''UL'');

                                    for (var i = 0; i < temp.length; i++) {

                                        if (node.parentNode.parentNode.id == temp[i].parentNode.id) {

                                            showMenu(temp[i]);
                                        }
                                    }
                                }
                            }
                            node_temp = node_temp.parentNode;
                        }
                    }
                }
            }
     
    
    function toggleMenu2param(node, link) {
        
        if (!document.getElementById) return false;
        if (!link) return false;
        hideallmenusamelevel(node);
        if (!node) location.href = link;

        var old_class;
        old_class=node.parentNode.className;
        if (node.className == ''classhide'') {
            node.className = ''classshow'';
            
            node.parentNode.className=old_class + '' seleted-leftmenu'';
        }
        else {
            node.className = ''classhide'';
          
            node.parentNode.className=old_class.split('' '')[0] ;
        }
    }
    function toggleMenu(node) {
     
        if (!document.getElementById) return false;
        hideallmenusamelevel(node);
        var old_class;
        old_class=node.parentNode.className;

        if (node.className == ''classhide'') {
            node.className = ''classshow'';
            
       
            
            node.parentNode.className= old_class + '' seleted-leftmenu'';

        }
        else {
            node.className = ''classhide'';
            //alert(old_class.split('' '')[0]);
            node.parentNode.className=old_class.split('' '')[0] ;
        }
    }
    function findNode(obj) {
        if (obj == null) return false;
        var elements = obj.getElementsByTagName(''a'');
        if (location.href.indexOf(''?'') != -1) {
            for (i = 0; i < elements.length; i++) {
                if (elements[i].href.indexOf(''?'') != -1) {
                    if (location.href.toLowerCase().match(elements[i].href.split(''?'')[0].toLowerCase()) && location.href.split(''?'')[1].toLowerCase() == elements[i].href.split(''?'')[1].toLowerCase() && elements[i].href.split(''?'')[1].length == location.href.split(''?'')[1].length) {

                        return elements[i];
                    }
                }
            }
        }
        else {
            for (i = 0; i < elements.length; i++) {
                if (location.href.toLowerCase().match(elements[i].href.toLowerCase())) {

                    return elements[i];
                }
            }
        }
        return ''-1'';
    }

    function showMenu(node) {
        if (!document.getElementById) return false;

        if (node.className == ''classhide'') {
            node.className = ''classshow'';
        }
        else {
            node.className = ''classshow'';
        }
    }
    function hideallmenusamelevel(currentnode) {
 
        var currentlevel = currentnode.id.split(''ul'')[1].split(''_'')[0];

        var links = currentnode.parentNode.parentNode.getElementsByTagName(''ul'');


        for (var i = 0; i < links.length; i++) {


            oneul = links[i];

            if (oneul) {

                oneid = oneul.id;
                onelevel = oneul.id.split(''ul'')[1].split(''_'')[0];
                if (onelevel >= currentlevel && oneul != currentnode) {
                    hideonemenu(oneul);
                }
            }
        }
    }
    function hideonemenu(node) {
        if (!document.getElementById) return false;
        if (!node) return false;

        node.className = ''classhide'';
    }
   function addClass(element, value) {

            if (!element.className) {
                element.className = value;
            } else {
                newClassName = element.className;
                newClassName += '' '';
                newClassName += value;
                element.className = newClassName;
            }
        }
        



checkUrl(''menuproduct_baa03ef3-be12-48d8-b2fe-2889a2da5bb2'');


//<![CDATA[
_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;//]]>


<!--
function S8571A02A_Submit() {GoSearch(null,''ctl00_PlaceHolderTopNavBar_g_34f029f8_aaee_4ca4_b0e0_85c139edd1d5_S8571A02A_InputKeywords'',null,true,false,null,null,null,null,''http:\u002f\u002fquan4.hochiminhcity.gov.vn\u002fpages\u002fketquatk.aspx'', ''Trang web Này'',''Danh sách Này'', ''Thư mục Này'', ''Trang web Có liên quan'', ''\u002f_layouts\u002fOSSSearchResults.aspx'');}
// -->

// append an onload event handler
var S8571A02A__onload= document.body.onload;
if(typeof document.body.onload == ''function'')
{
 document.body.onload = function()
 {
S8571A02A__onload();        
  document.getElementById(''ctl00_PlaceHolderTopNavBar_g_34f029f8_aaee_4ca4_b0e0_85c139edd1d5_S8571A02A_InputKeywords'').name = ''InputKeywords'';
 }
}
else
{
 document.body.onload = function()
 {
  eval(S8571A02A__onload);        
  document.getElementById(''ctl00_PlaceHolderTopNavBar_g_34f029f8_aaee_4ca4_b0e0_85c139edd1d5_S8571A02A_InputKeywords'').name = ''InputKeywords'';
 }
}

function S8571A02A_OSBEK(event1) { 
if((event1.which == 10) || (event1.which == 13))
{   
S8571A02A_Submit();
}
}
// -->

<!--
function S3031AEBB_Submit() {GoSearch(null,''ctl00_PlaceHolderSearchArea_ctl01_S3031AEBB_InputKeywords'',null,true,true,''ctl00_PlaceHolderSearchArea_ctl01_SBScopesDDL'',''ctl00_PlaceHolderSearchArea_ctl01_ctl00'',null,null,''http:\u002f\u002fwww.quan4.hochiminhcity.gov.vn\u002f_layouts\u002fOSSSearchResults.aspx'', ''Trang web Này'',''Danh sách Này'', ''Thư mục Này'', ''Trang web Có liên quan'', ''\u002f_layouts\u002fOSSSearchResults.aspx'');}
// -->

// append an onload event handler
var S3031AEBB__onload= document.body.onload;
if(typeof document.body.onload == ''function'')
{
 document.body.onload = function()
 {
S3031AEBB__onload();        
  document.getElementById(''ctl00_PlaceHolderSearchArea_ctl01_S3031AEBB_InputKeywords'').name = ''InputKeywords'';
 }
}
else
{
 document.body.onload = function()
 {
  eval(S3031AEBB__onload);        
  document.getElementById(''ctl00_PlaceHolderSearchArea_ctl01_S3031AEBB_InputKeywords'').name = ''InputKeywords'';
 }
}

function S3031AEBB_OSBEK(event1) { 
if((event1.which == 10) || (event1.which == 13))
{   
S3031AEBB_Submit();
}
}
// -->


//<![CDATA[
Sys.Application.initialize();
//]]>', CAST(N'2015-06-18 00:59:24.890' AS DateTime), N'Safe', 3)
INSERT [dbo].[TEXT_CONTENT] ([ContentID], [Content], [TimeCheck], [TextResult], [WebID]) VALUES (4, N'Trang chủ 
	- UBND QUẬN 5





	
	
	var navBarHelpOverrideKey = "wssmain";
	

	






















 var MSOWebPartPageFormName = ''aspnetForm'';

function _spNavigateHierarchy(nodeDiv, dataSourceId, dataPath, url, listInContext, type) {
    ProcessDefaultNavigateHierarchy(nodeDiv, dataSourceId, dataPath, url, listInContext, type, document.forms.aspnetForm, "", "\u002fdefault.aspx");
}



	
	
	
	
		
			
			
		
		
		 
			
			   
			Bật chế độ truy cập dễ dàng hơn
			
			
			Bỏ qua nội dung chính
		 
		   
			
			 
			  
				
				Tắt chế độ truy cập dễ dàng hơn
			  
			  
				UBND QUẬN 5
			  
			  
			 
		   
		 
		 
			
		   
	   
	  
			
		
		
			
			
				
					
					
Đăng nhập

					
					
						
							
							
						
					
					
				
			
			
		
		
			
			
		

	
			
	
	
			
		
		
			
			
				
					
					
					
					
			
		   
			 UBND QUẬN 5
		   
		  
		  
					
				
			
			
		
		
			
			
			
			
				
				
			
				
			
		   
			
			
			
			
			
			
			
	






    $(document).ready(function() {


        var CurrentPath = $.trim($("div#dvnduyPath").text());
        $("a[href=''" + CurrentPath + "'']").parent().parent().attr("id", "LvSelected");
        // Xác định tọa độ trong menu


        $("div").children("ul").children("li").each(function(e) {
           
            var p = $(this).position().left + ($(this).outerWidth() / 2);
            $(this).children("ul").css("display", "none");

            if (p >= 550) 
            {
                $(this).children("ul.children").children().css("float", "right");
            }
            
        });
        // Xác định vị trí của Tab đang được chọn
        var index = $("li#LvSelected").attr("duy");


        $("#wrapper").mouseleave(function() {

            $("ul#topnav li ul.children").css("display", "none");
            $("ul#topnav").children("li").eq(parseInt(index)).attr("id", "LvSelected");
            $("li#LvSelected").children().css("display", "block");

        });

        $("li.parent").hover
        (
               function() {

                   $("ul#topnav").children("li").children("ul").css("display", "none");
                   $(this).children().css("display", "block");
                   $("li#LvSelected").attr("id", "");
                   $(this).attr("id", "LvSelected");

               },
               function() {

                   $(this).attr("id", "");


               });


        $("ul#LvSelected").css("display", "block");
        $("ul#LvSelected").children().css("display", "block");

        $("ul#topnav li ul.children").css("display", "none");
        $("ul#topnav").children("li").eq(parseInt(index)).attr("id", "LvSelected");
        $("li#LvSelected").children().css("display", "block");

    });
        


/default.aspx





    
        
        
            
                
                    Trang chủ
            
        
        
        
            
                
                    Liên hệ
            
        
        
        
            
                
                    Sơ đồ website
            
        
        
        
            
                
                    Tải về
            
        
        
    





			
			
				
					
				
						
		   
		   
		   	
		   	
		   		
		  				            							
                        function tS(){ x=new Date(); x.setTime(x.getTime()); return x; }
                        function y2(x){ x=(x<500)?x+1900:x; return String(x).substring(0,4) }
                        function k(){var ap="AM";
						 if ((tS().getHours())   > 11) { ap ="PM"; };return ap;}
                        function dT(){ 
                        
						  if(fr==0){ fr=1; document.write(''''+eval(oT)+''''); } tP.innerText=eval(oT); setTimeout(''dT()'',1000); }
                        var dN=new Array(''Chủ nhật'',''Thứ hai'',''Thứ ba'',''Thứ tư'',''Thứ năm'',''Thứ sáu'',''Thứ bảy''),mN=new Array(''1'',''2'',''3'',''4'',''5'',''6'',''7'',''8'',''9'',''10'',''11'',''12''),fr=0,oT="dN[tS().getDay()]+'', ''+tS().getDate()+''/''+mN[tS().getMonth()]+''/''+y2(tS().getYear())+''-''+tS().getHours()+'':''+tS().getMinutes()+'' ''+k()";
                     
                     dT();
		  		

		   	
		   	
				

		   	
		   	
	
		 
			
				
					
				
			
		
	

				

		   	
		   	
		   	
		   
		  
		
			
		
		
			
			
				
					
					
					
					
					
						
							
							
							
						
						
							
							
							
			
			UBND QUẬN 5

							
							
							
						
					
					
					
						

					
					
					
						
							
								

	
	
		
			
				
					
    
    
    


    var jLeftMenu = jQuery.noConflict();
    jLeftMenu(function($) {

        $("div.ms-navheader").mouseover(function() {

            $(this).addClass("heading-hover");

        }).mouseout(function() {
            $(this).removeClass("heading-hover");
        });
        $("div.ms-navheader-icon").mouseover(function() {
            $(this).addClass("heading-hover");

        }).mouseout(function() {
            $(this).removeClass("heading-hover");
        });
        $("div.ms-navItem").mouseover(function() {
            $(this).addClass("ms-navItem-hover");
        }).mouseout(function() {
            $(this).removeClass("ms-navItem-hover");
        });
        $("div.ms-navItem-icon").mouseover(function() {
            $(this).addClass("ms-navItem-hover");
        }).mouseout(function() {
            $(this).removeClass("ms-navItem-hover");
        });
    });

    
   
 

						GIỚI THIỆUGiới thiệu chungĐịa l&#253;Sơ đồ tổ chứcBản đồ h&#224;nh ch&#237;nhĐường phốC&#225;c địa chỉ cần biếtSố điện thoại li&#234;n hệTh&#244;ng tin b&#225;o c&#225;o thống k&#234;TIN TỨC SỰ KIỆNTH&#212;NG TIN CHỈ ĐẠO&#221; kiến chỉ đạo của l&#227;nh đạo&#221; kiến xử l&#253;, phản hồi y&#234;u cầu tổ chức - c&#225; nh&#226;nTH&#212;NG C&#193;O B&#193;O CH&#205;Văn bản tham khảoTH&#212;NG TIN TUY&#202;N TRUYỀNHướng dẫn thực hiện ph&#225;p luậtTH&#212;NG TIN CẦN BIẾTTuyển dụngTHỦ TỤC H&#192;NH CH&#205;NHVĂN BẢN PH&#193;P LUẬTTh&#224;nh phốC&#244;ng b&#225;oĐƠN VỊ SỰ NGHIỆPTrung t&#226;m văn ho&#225;Nh&#224; thiếu nhiTrung t&#226;m TDTTBệnh viện QuậnTrường KTCN H&#249;ng VươngQUY HOẠCH &amp; PH&#193;T TRIỂNDự &#225;n mời gọi đầu tưDỰ &#193;N HẠNG MỤCDanh s&#225;ch c&#225;c dự &#225;n chuẩn bị đầu tưĐỊA ĐIỂM THAM QUANMua sắmVui chơi giải tr&#237;Di t&#237;ch văn ho&#225;TRA CỨU HỒ SƠ&#221; KIẾN - PHẢN HỒIGửi &#253; kiến
					



				
			
		
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveLink(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }




						
LI&Ecirc;N KẾT WEB



    
        
            
            Trang web li&ecirc;n kết
            Hồ Ch&iacute; Minh city web
            Quận 1
            Quận 2
            Quận 3
            Quận 4
            Quận 5
            Quận 6
            Quận 7
            Quận 8
            Quận 9
            Quận 10
            Quận 11
            Quận 12
            Quận B&igrave;nh T&acirc;n
            Quận B&igrave;nh Thạnh
            Quận G&ograve; Vấp
            Quận Ph&uacute; Nhuận
            Quận T&acirc;n B&igrave;nh
            Quận T&acirc;n Ph&uacute;
            Quận Thủ Đức
            Huyện B&igrave;nh Ch&aacute;nh
            Huyện Cần Giờ
            Huyện Củ Chi
            Huyện H&oacute;c M&ocirc;n
            Huyện Nh&agrave; B&egrave;
            Sở T&agrave;i ch&iacute;nh
            Sở Nội vụ
            Sở Y tế
            Sở C&ocirc;ng Thương
            Sở Tư ph&aacute;p
            Sở X&acirc;y dựng
            Sở N&ocirc;ng nghiệp v&agrave; PTNT
            Sở Gi&aacute;o dục v&agrave; &ETH;&agrave;o tạo
            Sở T&agrave;i nguy&ecirc;n v&agrave; M&ocirc;i trường
            Sở Kế hoạch v&agrave; &ETH;ầu tư
            Sở Khoa học v&agrave; C&ocirc;ng nghệ
            Sở Văn h&oacute;a, Thể thao v&agrave; Du lịch
            Sở Giao th&ocirc;ng Vận tải
            Sở LĐ-TB-XH
            Sở Quy hoạch Kiến tr&uacute;c
            Sở Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng
            Cục Thống k&ecirc;
            Sở CS PCCC
            
        
    




&nbsp;
					

 
						
    
        
            
             
        
        
    

					

				
			
		
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveQC(right, newsid, menuid, img) {

        if (right == ''true'') {

            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }


 
						
 
							
								
							
								
							
								
							
								
							
								
							
						
					   
 
						
    
        
            
        
    

					

				
			
		
	

	

							
								
									
									
										
											&nbsp;
											
											
												
													
														
				
				
				
				Khởi chạy Nhanh
				
				Xem Tất cả Nội dung trang Web
				
				
				
				
				
		
		
		
		
		
		
				
				
			  
														
														
															


    
        
            
                SỐ LƯỢT TRUY CẬP
        
        
            
                
                    
                        
	
		
                                
                                    
                                        
                                            
                                                5
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                4
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                9
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                3
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                7
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                8
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                8
                                        
                                    
                                
                            
	

                    
                
            
        
    
 

    
													
												
												
													
													
													
												
											
										
										
										
										
										
									
								
								
								
								
									

								
								
								
		
								
									
										
										
										
											
													

	
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveLink(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }




						&nbsp;

&nbsp;
					

 
						
    
        
            
             
        
        
    

					

				
			
		
	
		
			
				
					





 var jHotNews = jQuery.noConflict();
  function slideSwitch() 
  {
      var jQueryActive = jHotNews(''#slideshow DIV.active'');
     
      if ( jQueryActive.length == 0 ) jQueryActive = jHotNews(''#slideshow DIV:last'');
      var jQueryNext =  jQueryActive.next().length ? jQueryActive.next(): jHotNews(''#slideshow DIV:first'');
      jQueryActive.addClass(''last-active'');
      
      jQueryNext.css({opacity: 0.0})
          .addClass(''active'')
          .animate({opacity: 1.0}, 1000, function() {
          jQueryActive.removeClass(''active last-active'');
          
          });
  }
  jHotNews(function($) {
  var cmshotnewsrefreshIntervalId=setInterval( "slideSwitch()", "4000" );
          $(".a-hot-link").mouseover(function() {

            var kq = $(this).attr(''id'');

            $(''div.hl-latestnews3'').each(function() {
                if ($(this).attr(''idItem'') == kq) {
                    $(this).addClass(''active'');
                    clearInterval(cmshotnewsrefreshIntervalId);
                }
                else {
                    $(this).removeClass(''active'');
                }
            });
        }).mouseout(function() {
            cmshotnewsrefreshIntervalId = setInterval("slideSwitch()", "4000");
        });
  });



/**Tin noi bat***/
/*#slideshow{width:295px;float:left;height:380px;position:relative;}
#slideshow DIV{position:absolute;top:0;left:0;z-index:80;opacity:.0;width:295px;background-color:#FFF;height:100%;}
#slideshow DIV.active{z-index:100;opacity:1.0;width:295px;height:100%;}
#slideshow DIV.last-active{z-index:90;height:100%;}
#slideshow DIV IMG{display:block;border:0;margin-bottom:10px;}*/


    
        
            
                
                    
                    
                    
                        
                        
                            
                        
                         
                        
                            
                                Quận 5 tổ chức kỷ niệm 125 năm ngày sinh Chủ tịch Hồ Chí Minh
                            
                        
                        
                             
Sáng 19/5/2015, Quận ủy - Ủy ban nhân dân - Ủy ban Mặt trận Tổ quốc Việt Nam quận 5 đã tổ chức lễ Kỷ niệm 125 năm ngày sinh Chủ tịch Hồ Chí Minh, trao huy hiệu đảng và tuyên dương gương điển hình “Học tập và làm theo tấm gương đạo đức Hồ Chí Minh” năm 2014 – 2015.
 

Ông Sử Ngọc Anh – Thành ủy viên, Bí thư Quận ủy trao huy hiệu đảng
 
 Đến ...
                        
                       
                    
                    
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Tổ đại biểu Quốc hội đơn vị 4 tiếp xúc với cử tri quận 5
                            
                        
                        
                             
Sáng ngày 11/5/2015, Tổ đại biểu Quốc hội đơn vị 4 gồm ông Lê Thanh Hải - Ủy viên Bộ Chính trị, Bí thư Thành ủy thành phố Hồ Chí Minh, ông Nguyễn Phước Lộc - Vụ Trưởng Vụ Tôn giáo, Ban Dân vận Trung ương đã có buổi tiếp xúc với cử tri quận 5.
 
 
Quang cảnh buổi tiếp xúc
 
Thay mặt tổ đại biểu, ông Nguyễn Phước Lộc đã thông báo chương ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Quận 5 kỷ niệm 40 năm ngày miền Nam giải phóng thống nhất đất nước
                            
                        
                        
                             
Nhân kỷ niệm 40 năm ngày miền Nam giải phóng thống nhất đất nước, Quận ủy – Ủy ban nhân dân – Ủy ban Mặt trận Tổ quốc quận 5 tổ chức Lễ kỷ niệm và tuyên dương điển hình tiến tiến giai đoạn 2010 – 2014. 
 

Lãnh đạo Quận ủy – Ủy ban nhân dân – Ủy ban Mặt trận Tổ quốc quận 5 chụp ảnh lưu niệm cùng các vị đại biểu
 
Đến dự có ông Sử Ngọc Anh ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Quận ủy – Ủy ban nhân dân – Ủy ban Mặt trận tổ quốc Việt Nam Quận 5 thăm và tặng quà gia đình chính sách có công với cách mạng
                            
                        
                        
                             
 
Nhân kỷ niệm 40 năm Ngày giải phóng miền Nam, thống nhất đất nước (30/4/1975 – 30/4/2015); từ ngày 320/4 đến 25/4/2015, Quận ủy – Ủy ban nhân dân – Ủy ban Mặt trận tổ quốc, các ban ngành, đoàn thể quận tổ chức 21 đoàn đại biểu đến thăm và tặng quà 96 gia đình chính sách có công với cách mạng. Trong đó, có đến thăm 32 gia đình Mẹ Việt Nam anh ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Thông báo nghỉ Lễ và treo cờ Tổ quốc
                            
                        
                        
                             
Ngày 07/4/2015, Ủy ban nhân dân thành phố Hồ Chí Minh ban hành Thông báo số 48/TB-UBND về nghỉ Lễ và treo cờ Tổ quốc Ngày Giỗ Tổ Hùng Vương, Ngày Giải phóng miền Nam, thống nhất đất nước 30 tháng 4 và Ngày Quốc tế Lao động 01 tháng 5 năm 2015.
 
Theo đó, Cán bộ, công chức, viên chức lực lượng vũ trang, người lao động trong các cơ quan hành ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Đại hội Đại biểu Đảng bộ Công an quận 5 lần thứ XIV nhiệm kỳ 2015 – 2020
                            
                        
                        
                             
Ngày 15/4/2015, Công an quận 5 tổ chức Đại hội Đại biểu Đảng bộ Công an quận 5 lần thứ XIV nhiệm kỳ 2015 – 2020 tại Hội trường Công an quận 5, số 359 Trần Hưng Đạo, phường 10 quận 5. 
 

Các đại biểu dự Đại hội biểu quyết thông qua dự thảo báo cáo kiểm điểm
 
 
Đến dự có ông Sử Ngọc Anh - Thành ủy viên, Bí thư quận ủy quận 5, bà Huỳnh Thị ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Thông báo thời gian chiếu phim tư liệu về quận 5
                            
                        
                        
                             
Thiết thực kỷ niệm 40 năm Ngày giải phóng miền Nam, thống nhất đất nước (30/4/1975 – 30/4/2015), Quận ủy quận 5 đã phối hợp cùng đài truyền hình Thành phố Hồ Chí Minh thực hiện thước phim tư liệu “Quận 5 – góp phần vào thành tựu chung của Thành phố Hồ Chí Minh”. Thước phim đã hoàn thành vào ngày 19/3/2015; được chiếu trên đài truyền hình Thành ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Sơ kết 5 năm thực hiện công tác vận động nữ công nhân, viên chức, lao động thời kỳ đẩy mạnh công nghiệp hóa, hiện đại hóa đất nước
                            
                        
                        
                             
Vừa qua, Liên đoàn Lao động quận 5 tổ chức hội nghị Sơ kết 5 năm thực hiện công tác vận động nữ công nhân, viên chức, lao động thời kỳ đẩy mạnh công nghiệp hóa, hiện đại hóa đất nước. Đến dự có bà Đinh Thị Thái Hiền – Ủy viên Ban thường vụ, Trưởng ban Tổ chức Liên đoàn Lao động Thành phố, bà Huỳnh Ngọc Nữ Phương Hồng – Trưởng ban Dân vận, ông ...
                        
                        
                    
                    
                
            
        
        
            
            
                
                    
                        
                            TIN NỔI BẬT
                        
                    
                
                 

                
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews0" href="http://www.quan5.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=B%e1%ba%a3n+tin+qu%e1%ba%adn&ItemID=3097&Mode=1" class="a-hot-link" title="Sáng 19/5/2015, Quận ủy - Ủy ban nhân dân - Ủy ban Mặt trận Tổ quốc Việt Nam quận 5 đã tổ chức lễ Kỷ niệm 125 năm ngày sinh Chủ tịch Hồ Chí Minh, trao huy hiệu đảng và tuyên dương gương điển hình “Học tập và làm theo tấm gương đạo đức Hồ Chí Minh” năm 2014 – 2015.
 

Ông Sử Ngọc Anh – Thành ủy viên, Bí thư Quận ủy trao huy hiệu đảng
 
 Đến ...">
                                Quận 5 tổ chức kỷ niệm 125 năm ngày sinh Chủ tịch Hồ Chí Minh
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews1" href="http://www.quan5.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=B%e1%ba%a3n+tin+qu%e1%ba%adn&ItemID=3103&Mode=1" class="a-hot-link" title="Sáng ngày 11/5/2015, Tổ đại biểu Quốc hội đơn vị 4 gồm ông Lê Thanh Hải - Ủy viên Bộ Chính trị, Bí thư Thành ủy thành phố Hồ Chí Minh, ông Nguyễn Phước Lộc - Vụ Trưởng Vụ Tôn giáo, Ban Dân vận Trung ương đã có buổi tiếp xúc với cử tri quận 5.
 
 
Quang cảnh buổi tiếp xúc
 
Thay mặt tổ đại biểu, ông Nguyễn Phước Lộc đã thông báo chương ...">
                                Tổ đại biểu Quốc hội đơn vị 4 tiếp xúc với cử tri quận 5
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews2" href="http://www.quan5.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=B%e1%ba%a3n+tin+qu%e1%ba%adn&ItemID=3110&Mode=1" class="a-hot-link" title="Nhân kỷ niệm 40 năm ngày miền Nam giải phóng thống nhất đất nước, Quận ủy – Ủy ban nhân dân – Ủy ban Mặt trận Tổ quốc quận 5 tổ chức Lễ kỷ niệm và tuyên dương điển hình tiến tiến giai đoạn 2010 – 2014. 
 

Lãnh đạo Quận ủy – Ủy ban nhân dân – Ủy ban Mặt trận Tổ quốc quận 5 chụp ảnh lưu niệm cùng các vị đại biểu
 
Đến dự có ông Sử Ngọc Anh ...">
                                Quận 5 kỷ niệm 40 năm ngày miền Nam giải phóng thống nhất đất nước
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            
                                Quận ủy – Ủy ban nhân dân – Ủy ban Mặt trận tổ quốc Việt Nam Quận 5 thăm và tặng quà gia đình chính sách có công với cách mạng
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews4" href="http://www.quan5.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=B%e1%ba%a3n+tin+qu%e1%ba%adn&ItemID=3091&Mode=1" class="a-hot-link" title="Ngày 07/4/2015, Ủy ban nhân dân thành phố Hồ Chí Minh ban hành Thông báo số 48/TB-UBND về nghỉ Lễ và treo cờ Tổ quốc Ngày Giỗ Tổ Hùng Vương, Ngày Giải phóng miền Nam, thống nhất đất nước 30 tháng 4 và Ngày Quốc tế Lao động 01 tháng 5 năm 2015.
 
Theo đó, Cán bộ, công chức, viên chức lực lượng vũ trang, người lao động trong các cơ quan hành ...">
                                Thông báo nghỉ Lễ và treo cờ Tổ quốc
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews5" href="http://www.quan5.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=B%e1%ba%a3n+tin+qu%e1%ba%adn&ItemID=3090&Mode=1" class="a-hot-link" title="Ngày 15/4/2015, Công an quận 5 tổ chức Đại hội Đại biểu Đảng bộ Công an quận 5 lần thứ XIV nhiệm kỳ 2015 – 2020 tại Hội trường Công an quận 5, số 359 Trần Hưng Đạo, phường 10 quận 5. 
 

Các đại biểu dự Đại hội biểu quyết thông qua dự thảo báo cáo kiểm điểm
 
 
Đến dự có ông Sử Ngọc Anh - Thành ủy viên, Bí thư quận ủy quận 5, bà Huỳnh Thị ...">
                                Đại hội Đại biểu Đảng bộ Công an quận 5 lần thứ XIV nhiệm kỳ 2015 – 2020
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            
                                Thông báo thời gian chiếu phim tư liệu về quận 5
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            
                                Sơ kết 5 năm thực hiện công tác vận động nữ công nhân, viên chức, lao động thời kỳ đẩy mạnh công nghiệp hóa, hiện đại hóa đất nước
                            
                        
                    
                    
                
                
            
            
        
    


				
			
		
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveLink(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }




						&nbsp;&nbsp;&nbsp;&nbsp;
					

 
						
    
        
            
             
        
        
    

					

				
			
		
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=B%e1%ba%a3n+tin+qu%e1%ba%adn&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    Bản tin quận
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Sinh hoạt Câu lạc bộ Lý luận trẻ quận 5 quý 1 năm 2015
                            
                            
                        
                    
                    
                        
                            
                            
                                 
 
Sáng 20/03/2015, Ban Chủ nhiệm Câu lạc bộ Lý luận trẻ Quận 5 đã tổ chức Buổi sinh hoạt Câu lạc bộ quý 1 năm 2015 với chủ đề “Niềm tin của thế hệ trẻ đối với sự lãnh đạo của Đảng và sự đổi mới của đất nước” nhằm nâng cao khả năng lý luận chính trị cũng như tư duy phản biện nhằm nắm bắt kịp thời diễn biến phức tạp, các thế lực thù địch thường ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Ngày hội  “Sách - chìa khóa vạn năng của tri thức”
                            
                            
                            &nbsp;(22/05)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Số hóa truyền hình mặt đất
                            
                            
                            &nbsp;(22/05)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Những hình ảnh tiêu biểu tại lễ kỷ niệm 125 năm Ngày sinh Chủ tịch Hồ Chí Minh (19/5/1890 – 19/5/2015)
                            
                            
                            &nbsp;(22/05)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Những hình ảnh tiêu biểu tại lễ kỷ niệm 125 năm Ngày sinh Chủ tịch Hồ Chí Minh (19/5/1890 – 19/5/2015)
                            
                            
                            &nbsp;(22/05)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Đoàn đại biểu QU - UBND - UBMTTQ quận 5 đến viếng và dâng hoa tại Tượng đài Chủ tịch Hồ Chí Minh
                            
                            
                            &nbsp;(22/05)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	

	

											
										
										
									
		
	  							
								
								
									
										
								
								
	
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveQC(right, newsid, menuid, img) {

        if (right == ''true'') {

            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }


 
						
 
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
						
					   
 
						
    
        
            
        
    

					

				
			
		
	
		
			
				
					


  










    var transiteTime = parseInt(''3500'');

    var albumbox = jQuery.noConflict();
    albumbox(document).ready(function() {

        var optionsLeft = {
            caption: ''hover'',
            opacity: 0.8,
            easing: ''swing'',
            widthimg:''200'',
            duration: 240
        }

        var optionsRight = {
            caption: ''hover'',
            opacity: 0.8,
            navigation: ''hover'',
            direction: ''left'',
            easing: ''swing'',
            widthimg: ''200'',
            duration: 240
        }
        var gt = albumbox(''#ppy1'').position().left;

        var duy;
        if (gt > 500)
            albumbox(''div#ppy1'').popeye(optionsRight);
        else
            albumbox(''div#ppy1'').popeye(optionsLeft);

        albumbox(''div.ppy-nav'').hide();
        var flag = true;

        albumbox.doTimeout(transiteTime, function() {
            if (flag == false)
                return false;

            
            albumbox(''a.ppy-next1'').click();
            return true;
        });

        albumbox(''a.ppy-next'').click(function() {
            flag = false;
        });
        albumbox(''a.ppy-prev'').click(function() {
            flag = false;
        });

    });
    
   



        
            
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
            
            
                
                    
                        THƯ VIỆN HÌNH ẢNH
                
                
                    
                
                
                    
                        Previous image 
                        Next image 
                        Enlarge
                        Close
                    
                
                
                
                    Xem tất cả
                
            
        
        Next image
        
				
			
		
	
		
			
				
					









    var vbox = jQuery.noConflict();

        var width = ''200'' + "px";
        var height = ''200'' + "px";
        vbox(document).ready(function() {

        if (vbox("#ctl00_m_g_183b8cc0_182f_4a02_aafe_1bb6d0b6a3ef_ctl00_listvideobox").children("li").length <= 1) {
            vbox("#ctl00_m_g_183b8cc0_182f_4a02_aafe_1bb6d0b6a3ef_ctl00_listvideobox").parent().hide();
        }
        
        if (''True'' == ''True'') {

                vbox(''li.item-videobox'').live(''click'', function() {
                    var gt = vbox(this).attr(''linkVideo'');
                    var thumbnail = vbox(this).attr(''thumbnail'');
                    var videoplayer = vbox(this).attr(''videoplayer'');

                    jwplayer(videoplayer).setup({
                        flashplayer: "/_LAYOUTS/LacVietBio/UserControls/PhotoAlbum/images/player4.6.swf",
                        autostart: true,
                        file: gt,
                        image: thumbnail,
                        height: height,
                        width: width
                    });
                });
           
            
        }
    });
    





    
         
        
        
        
            
                
                
                    Video demo
             
        
    





    var linkFirstVideo = vbox("#ctl00_m_g_183b8cc0_182f_4a02_aafe_1bb6d0b6a3ef_ctl00_listvideobox").children("li").eq(0).attr(''linkvideo'');
    var firstThumbnail = vbox("#ctl00_m_g_183b8cc0_182f_4a02_aafe_1bb6d0b6a3ef_ctl00_listvideobox").children("li").eq(0).attr(''thumbnail'');
    jwplayer("ctl00_m_g_183b8cc0_182f_4a02_aafe_1bb6d0b6a3ef_ctl00_dvnduymainvideo").setup({
        flashplayer: "/_LAYOUTS/LacVietBio/UserControls/PhotoAlbum/images/player4.6.swf",
        file: linkFirstVideo,
        image: firstThumbnail,
        height: height,
        width: width
    });



				
			
		
	

	

								
								
							
							
						
						
								
							
								
					
								
														
									
										
											TRANG CHỦ
											 LIÊN HỆ  
											 QUẢN TRỊ  										
										
									
									
										QUAY VỀ TRANG ĐẦU
									
									-->
								
								 © Ủy Ban Nhân Dân Quận 5 Thành Phố Hồ 
									Chí Minh
									Địa chỉ: 203 An Dương Vương Q5 TP.HCM.
									&nbsp;Tel (84-8) 3.8550250, Fax: (84-8) 
									3.8559895
									
							
						
						
	
	
	
	


					
					
						
							

.ms-bodyareaframe {
	padding: 0px;
}


								

TD.ms-titleareaframe, .ms-pagetitleareaframe {
	height: 10px;
}
Div.ms-titleareaframe {
	height: 100%;
}
.ms-pagetitleareaframe table {
	background: none;
	height: 0px;
}


									
	
	
		 
			
				
					
						Trang web Này: UBND QUẬN 5
						All Sites
						People

					Tìm kiếm Nâng cao
				
			
		
	


									
									
									
	


										
	
									
								
								
		
  
								
								
							


//<![CDATA[
var __wpmExportWarning=''This Web Part Page has been personalized. As a result, one or more Web Part properties may contain confidential information. Make sure the properties contain information that is safe for others to read. After exporting this Web Part, view properties in the Web Part description file (.WebPart) by using a text editor such as Microsoft Notepad.'';var __wpmCloseProviderWarning=''You are about to close this Web Part.  It is currently providing data to other Web Parts, and these connections will be deleted if this Web Part is closed.  To close this Web Part, click OK.  To keep this Web Part, click Cancel.'';var __wpmDeleteWarning=''You are about to permanently delete this Web Part.  Are you sure you want to do this?  To delete this Web Part, click OK.  To keep this Web Part, click Cancel.'';_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;//]]>

 

             
          
            function checkUrl(myArray) {

                
                if (!document.getElementById || !document.getElementsByTagName) return false;
                if (!document.getElementById(myArray)) return false;
                var links = document.getElementById(myArray);
                var node = findNode(links);
                
                if (node!=''-1'') {
                    var node_temp = node;
                    if (location.href.indexOf(''?'') != -1) {
                        var indexClass = jLeftMenu(node).parent().attr(''class'');
                       
                        if (indexClass.indexOf("ms-navItem") != -1) {

                            addClass(node_temp.parentNode, ''ms-navItem-selected'');
                            
                        }
                        if (indexClass.indexOf(''ms-navheader'') != -1) {

                            addClass(node_temp.parentNode, ''ms-navheader-selected'');
                            
                        }
                        while (node_temp.parentNode.id != myArray) {

                            if (node_temp.parentNode.id.split(''_'')[0].match(''ul'')) {

                                showMenu(node_temp.parentNode);
                            }
                            if (node_temp.parentNode.parentNode.id == myArray) {

                                if (node_temp.parentNode.id.split(''_'')[0].match(''li'')) {
                                    var temp = node_temp.parentNode.getElementsByTagName(''UL'');

                                    for (var i = 0; i < temp.length; i++) {

                                        if (node.parentNode.parentNode.id == temp[i].parentNode.id) {

                                            showMenu(temp[i]);
                                        }
                                    }
                                }
                            }

                            node_temp = node_temp.parentNode;
                        }
                    }
                    else {
                        var indexClass = $(node).parent().attr(''class'');
                        if (indexClass.indexOf(''ms-navItem'') != -1) {

                            addClass(node_temp.parentNode, ''ms-navItem-selected'');
                            
                        }
                        if (indexClass.indexOf(''ms-navheader'') != -1) {

                            addClass(node_temp.parentNode, ''ms-navheader-selected'');
                            
                        }
                        while (node_temp.parentNode.id != myArray) {

                            if (node_temp.parentNode.id.split(''_'')[0].match(''ul'')) {

                                showMenu(node_temp.parentNode);
                            }
                            if (node_temp.parentNode.parentNode.id ==myArray) {

                                if (node_temp.parentNode.id.split(''_'')[0].match(''li'')) {
                                    var temp = node_temp.parentNode.getElementsByTagName(''UL'');

                                    for (var i = 0; i < temp.length; i++) {

                                        if (node.parentNode.parentNode.id == temp[i].parentNode.id) {

                                            showMenu(temp[i]);
                                        }
                                    }
                                }
                            }
                            node_temp = node_temp.parentNode;
                        }
                    }
                }
            }
     
    
    function toggleMenu2param(node, link) {
        
        if (!document.getElementById) return false;
        if (!link) return false;
        hideallmenusamelevel(node);
        if (!node) location.href = link;

        var old_class;
        old_class=node.parentNode.className;
        if (node.className == ''classhide'') {
            node.className = ''classshow'';
            
            node.parentNode.className=old_class + '' seleted-leftmenu'';
        }
        else {
            node.className = ''classhide'';
          
            node.parentNode.className=old_class.split('' '')[0] ;
        }
    }
    function toggleMenu(node) {
     
        if (!document.getElementById) return false;
        hideallmenusamelevel(node);
        var old_class;
        old_class=node.parentNode.className;

        if (node.className == ''classhide'') {
            node.className = ''classshow'';
            
       
            
            node.parentNode.className= old_class + '' seleted-leftmenu'';

        }
        else {
            node.className = ''classhide'';
            //alert(old_class.split('' '')[0]);
            node.parentNode.className=old_class.split('' '')[0] ;
        }
    }
    function findNode(obj) {
        if (obj == null) return false;
        var elements = obj.getElementsByTagName(''a'');
        if (location.href.indexOf(''?'') != -1) {
            for (i = 0; i < elements.length; i++) {
                if (elements[i].href.indexOf(''?'') != -1) {
                    if (location.href.toLowerCase().match(elements[i].href.split(''?'')[0].toLowerCase()) && location.href.split(''?'')[1].toLowerCase() == elements[i].href.split(''?'')[1].toLowerCase() && elements[i].href.split(''?'')[1].length == location.href.split(''?'')[1].length) {

                        return elements[i];
                    }
                }
            }
        }
        else {
            for (i = 0; i < elements.length; i++) {
                if (location.href.toLowerCase().match(elements[i].href.toLowerCase())) {

                    return elements[i];
                }
            }
        }
        return ''-1'';
    }

    function showMenu(node) {
        if (!document.getElementById) return false;

        if (node.className == ''classhide'') {
            node.className = ''classshow'';
        }
        else {
            node.className = ''classshow'';
        }
    }
    function hideallmenusamelevel(currentnode) {
 
        var currentlevel = currentnode.id.split(''ul'')[1].split(''_'')[0];

        var links = currentnode.parentNode.parentNode.getElementsByTagName(''ul'');


        for (var i = 0; i < links.length; i++) {


            oneul = links[i];

            if (oneul) {

                oneid = oneul.id;
                onelevel = oneul.id.split(''ul'')[1].split(''_'')[0];
                if (onelevel >= currentlevel && oneul != currentnode) {
                    hideonemenu(oneul);
                }
            }
        }
    }
    function hideonemenu(node) {
        if (!document.getElementById) return false;
        if (!node) return false;

        node.className = ''classhide'';
    }
   function addClass(element, value) {

            if (!element.className) {
                element.className = value;
            } else {
                newClassName = element.className;
                newClassName += '' '';
                newClassName += value;
                element.className = newClassName;
            }
        }
        



checkUrl(''menuproduct_6e4dd65e-d082-4599-bfc5-f6337b6ffbeb'');


//<![CDATA[
_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;//]]>


<!--
function S857FF42A_Submit() {GoSearch(null,''ctl00_PlaceHolderTopNavBar_g_02e42127_c469_44cb_b988_c8dfe526a193_S857FF42A_InputKeywords'',null,true,false,null,null,null,null,''\u002fpages\u002fketquatk.aspx'', ''Trang web Này'',''Danh sách Này'', ''Thư mục Này'', ''Trang web Có liên quan'', ''\u002f_layouts\u002fOSSSearchResults.aspx'');}
// -->

// append an onload event handler
var S857FF42A__onload= document.body.onload;
if(typeof document.body.onload == ''function'')
{
 document.body.onload = function()
 {
S857FF42A__onload();        
  document.getElementById(''ctl00_PlaceHolderTopNavBar_g_02e42127_c469_44cb_b988_c8dfe526a193_S857FF42A_InputKeywords'').name = ''InputKeywords'';
 }
}
else
{
 document.body.onload = function()
 {
  eval(S857FF42A__onload);        
  document.getElementById(''ctl00_PlaceHolderTopNavBar_g_02e42127_c469_44cb_b988_c8dfe526a193_S857FF42A_InputKeywords'').name = ''InputKeywords'';
 }
}

function S857FF42A_OSBEK(event1) { 
if((event1.which == 10) || (event1.which == 13))
{   
S857FF42A_Submit();
}
}
// -->

<!--
function S6AE27B38_Submit() {GoSearch(null,''ctl00_PlaceHolderSearchArea_ctl01_S6AE27B38_InputKeywords'',null,true,true,''ctl00_PlaceHolderSearchArea_ctl01_SBScopesDDL'',''ctl00_PlaceHolderSearchArea_ctl01_ctl00'',null,null,''\u002fpages\u002fketquatk.aspx\u002fResults.aspx'', ''Trang web Này'',''Danh sách Này'', ''Thư mục Này'', ''Trang web Có liên quan'', ''\u002f_layouts\u002fOSSSearchResults.aspx'');}
// -->

// append an onload event handler
var S6AE27B38__onload= document.body.onload;
if(typeof document.body.onload == ''function'')
{
 document.body.onload = function()
 {
S6AE27B38__onload();        
  document.getElementById(''ctl00_PlaceHolderSearchArea_ctl01_S6AE27B38_InputKeywords'').name = ''InputKeywords'';
 }
}
else
{
 document.body.onload = function()
 {
  eval(S6AE27B38__onload);        
  document.getElementById(''ctl00_PlaceHolderSearchArea_ctl01_S6AE27B38_InputKeywords'').name = ''InputKeywords'';
 }
}

function S6AE27B38_OSBEK(event1) { 
if((event1.which == 10) || (event1.which == 13))
{   
S6AE27B38_Submit();
}
}
// -->




//<![CDATA[
Sys.Application.initialize();
//]]>', CAST(N'2015-06-18 00:59:31.067' AS DateTime), N'Safe', 4)
INSERT [dbo].[TEXT_CONTENT] ([ContentID], [Content], [TimeCheck], [TextResult], [WebID]) VALUES (5, N'Trang chủ 
	- Trang  chủ





	
	
	var navBarHelpOverrideKey = "wssmain";
	

	






















 var MSOWebPartPageFormName = ''aspnetForm'';

function _spNavigateHierarchy(nodeDiv, dataSourceId, dataPath, url, listInContext, type) {
    ProcessDefaultNavigateHierarchy(nodeDiv, dataSourceId, dataPath, url, listInContext, type, document.forms.aspnetForm, "", "\u002fdefault.aspx");
}



	
	
	
	
		
			
			
		
		
		 
			
			   
			Bật chế độ truy cập dễ dàng hơn
			
			
			Bỏ qua nội dung chính
		 
		   
			
			 
			  
				
				Tắt chế độ truy cập dễ dàng hơn
			  
			  
				Trang  chủ
			  
			  
			 
		   
		 
		 
			
		   
	   
	  
			
		
		
			
			
				
					
					
Đăng nhập

					
					
						
							
							
						
					
					
				
			
			
		
		
			
			
		

	
			
	
	
			
		
		
			
			
				
					
					
					
					
			
		   
			 Trang  chủ
		   
		  
		  
					
				
			
			
		
		
			
			
			
			
				
				

				
			
		   
			
			
			
			
			
			
			
	
		 -->
		 
		 
			
		


 -->


/default.aspx





    
        
        
            
                
                    Trang chủ
            
        
        
        
            
                
                    Giới thiệu
            
            
                
                
                    Giới thiệu chung
                
                    
                
                
                
                    Sơ đồ tổ chức
                
                    
                
                
                
                    Bản đồ hành chính
                
                    
                
                
                
                    Phúc lợi xã hội
                
                    
                
                
                
                    Kinh tế
                
                    
                
                
                
                    Các địa chỉ cần biết
                
                    
                
                
                
                    Địa điểm tham quan
                
                    
                
                
                
                    Di tích lịch sử
                
                    
                
                
                
                    Ban biên tập website
                
                    
                
                
            
            
        
        
        
            
                
                    Hoạt động UBND
            
            
                
                
                    Ủy ban Nhân Dân
                
                    
                
                
                
                    Chào mừng kỹ niệm 10 năm thành lập Quận 7
                
                    
                
                
            
            
        
        
        
            
                
                    Quy hoạch và phát triển
            
            
                
                
                    Định hướng phát triển
                
                    
                
                
                
                    Tình hình KT-XH hằng năm
                
                    
                
                
                
                    Thông tin Quy hoạch
                
                    
                
                
            
            
        
        
        
            
                
                    Văn bản Quy phạm
            
            
                
                
                    Văn bản của Chính phủ
                
                    
                
                
                
                    Văn bản của Thành phố
                
                    
                
                
                
                    Văn bản của Quận 7
                
                    
                
                
                
                    Văn bản khác
                
                    
                
                
                
                    Văn bản dự thảo văn bản pháp luật
                
                    
                
                
            
            
        
        
        
            
                
                    Thủ tục hành chính
            
            
                
                
                    Công bố thủ tục hành chính của Quận
                
                    
                
                
                
                    Công bố thủ tục hành chính của Thành phố
                
                    
                
                
            
            
        
        
        
            
                
                    Thông tin tổng hợp
            
            
                
                
                    Cải cách hành chính
                
                    
                
                
                
                    Nội chính
                
                    
                
                
                
                    Văn hóa - Xã hội
                
                    
                
                
                
                    Quản lý đô thị
                
                    
                
                
                
                    Kinh tế
                
                    
                
                
                
                    Thời sự - Chính trị
                
                    
                
                
            
            
        
        
    



	//iclude file js
	function loadjscssfile(filename, filetype){
		 if (filetype=="js"){ //if filename is a external JavaScript file
		  var fileref=document.createElement(''script'')
		  fileref.setAttribute("type","text/javascript")
		  fileref.setAttribute("src", filename)
		 }
		 else if (filetype=="css"){ //if filename is an external CSS file
		  var fileref=document.createElement("link")
		  fileref.setAttribute("rel", "stylesheet")
		  fileref.setAttribute("type", "text/css")
		  fileref.setAttribute("href", filename)
		 }
		 if (typeof fileref!="undefined")
		  document.getElementsByTagName("head")[0].appendChild(fileref)
	}

	//test
	function dosomething() {
	 if (checkobject("test")) {
	  alert("This object exists");
	   document.getElementById("test").value = "It Existed";
	 }
	}
	
	//check element
	function checkobject(obj) {
		if (document.getElementById(obj)) { return true; } else { return false; }
	}
	
	//load file js
	if (checkobject("topnav_7")==false) {
	  loadjscssfile("/_layouts/LacVietBio/UserControls/TopMenu/jquery-1.4.1.js", "js") //dynamically load and add this .js file
	}




    $(document).ready(function() {


        var CurrentPath = $.trim($("div#dvnduyPath").text());
        $("a[href=''" + CurrentPath + "'']").parent(".main-level").parent(".parent").attr("id", "LvSelected");
		//$("#topnav").children().attr("id", "LvSelected");
        // Xác định tọa độ trong menu


        $("div").children("ul").children("li").each(function(e) {
           
            var p = $(this).position().left + ($(this).outerWidth() / 2);
            $(this).children("ul").css("display", "none");

            if (p >= 350 && p <=500 ) 
            {
               /* $(this).children("ul.children").children().css("float", "right");*/
				
				 $(this).children("ul.children").css("top", "30px");
				  $(this).children("ul.children").css("position", "absolute");
            }
             if (p > 500 ) 
            {
                $(this).children("ul.children").children().css("float", "right");
            }
        });
        // Xác định vị trí của Tab đang được chọn
        var index = $("li#LvSelected").attr("duy");


        $("#wrapper").mouseleave(function() {

            $("ul#topnav li ul.children").css("display", "none");
            $("ul#topnav").children("li").eq(parseInt(index)).attr("id", "LvSelected");
            $("li#LvSelected").children().css("display", "block");

        });

        $("li.parent").hover
        (
               function() {

                   $("ul#topnav").children("li").children("ul").css("display", "none");
                   $(this).children().css("display", "block");
                   $("li#LvSelected").attr("id", "");
                   $(this).attr("id", "LvSelected");

               },
               function() {

                   $(this).attr("id", "");


               });


        $("ul#LvSelected").css("display", "block");
        $("ul#LvSelected").children().css("display", "block");

        $("ul#topnav li ul.children").css("display", "none");
        $("ul#topnav").children("li").eq(parseInt(index)).attr("id", "LvSelected");
        $("li#LvSelected").children().css("display", "block");

    });
        





			
			
				
					
				
						
		   
		   
		   	
		   	
		   		
		  				            							
                        function tS(){ x=new Date(); x.setTime(x.getTime()); return x; }
                        function y2(x){ x=(x<500)?x+1900:x; return String(x).substring(0,4) }
                        function k(){var ap="AM";
						 if ((tS().getHours())   > 11) { ap ="PM"; };return ap;}
                        function dT(){ 
                        
						  if(fr==0){ fr=1; document.write(''''+eval(oT)+''''); } tP.innerText=eval(oT); setTimeout(''dT()'',1000); }
                        var dN=new Array(''Chủ nhật'',''Thứ hai'',''Thứ ba'',''Thứ tư'',''Thứ năm'',''Thứ sáu'',''Thứ bảy''),mN=new Array(''1'',''2'',''3'',''4'',''5'',''6'',''7'',''8'',''9'',''10'',''11'',''12''),fr=0,oT="dN[tS().getDay()]+'', ''+tS().getDate()+''/''+mN[tS().getMonth()]+''/''+y2(tS().getYear())+''-''+tS().getHours()+'':''+tS().getMinutes()+'' ''+k()";
                     
                     dT();
		  		

		   	
		   	
				
				
	
		 
			
				
					
				
			
		
	

		   	
		   	
		   	
		   
		  
		
			
		
		
			
			
				
					
					
					
					
					
						
							
							
							
						
						
							
							
							
			
			Trang  chủ

							
							
							
						
					
					
					
						

					
					
					
						
							
								

	
	

							
								
									
									
										
											&nbsp;
											
											
												
													
														
				
				
				
				Khởi chạy Nhanh
				
				Xem Tất cả Nội dung trang Web
				
				
				
				
				
		
		
		
		
		
		
				
				
			  
														
												
														
													
												
												
													
													
													
												
											
										
										
										
										
										
									
								
								
								
								

								
								
								
		
								
									
										
										
										
											
													
	
		
			
	
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveLink(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }




						
					

 
						
    
        
            
             
        
        
    

					

				
			
		
	
		
			
				
					





 var jHotNews = jQuery.noConflict();
  function slideSwitch() 
  {
      var jQueryActive = jHotNews(''#slideshow DIV.active'');
     
      if ( jQueryActive.length == 0 ) jQueryActive = jHotNews(''#slideshow DIV:last'');
      var jQueryNext =  jQueryActive.next().length ? jQueryActive.next(): jHotNews(''#slideshow DIV:first'');
      jQueryActive.addClass(''last-active'');
      
      jQueryNext.css({opacity: 0.0})
          .addClass(''active'')
          .animate({opacity: 1.0}, 1000, function() {
          jQueryActive.removeClass(''active last-active'');
          
          });
  }
  jHotNews(function($) {
  var cmshotnewsrefreshIntervalId=setInterval( "slideSwitch()", "4000" );
          $(".a-hot-link").mouseover(function() {

            var kq = $(this).attr(''id'');

            $(''div.hl-latestnews3'').each(function() {
                if ($(this).attr(''idItem'') == kq) {
                    $(this).addClass(''active'');
                    clearInterval(cmshotnewsrefreshIntervalId);
                }
                else {
                    $(this).removeClass(''active'');
                }
            });
        }).mouseout(function() {
            cmshotnewsrefreshIntervalId = setInterval("slideSwitch()", "4000");
        });
  });



/**Tin noi bat***/
/*#slideshow{width:295px;float:left;height:380px;position:relative;}
#slideshow DIV{position:absolute;top:0;left:0;z-index:80;opacity:.0;width:295px;background-color:#FFF;height:100%;}
#slideshow DIV.active{z-index:100;opacity:1.0;width:295px;height:100%;}
#slideshow DIV.last-active{z-index:90;height:100%;}
#slideshow DIV IMG{display:block;border:0;margin-bottom:10px;}*/


    
        
            
                
                    
                    
                    
                        
                        
                            
                        
                         
                        
                            
                                Họp mặt 80 cựu tù chính trị - tù binh Quận 7: Trao 66 phiên bản danh hiệu anh hùng lực lượng vũ trang nhân dân
                            
                        
                        
                            
 
 
 
 
 
 Đ/c Đỗ Thị Thảo - Phó Bí thư Thường trực Quận ủy trao phiên bản Anh hùng Lực lượng Vũ trang Nhân dân cho các cựu tù.
 
 

Vừa qua, hơn 80 cựu tù chính trị - tù binh tham gia kháng chiến bị địch bắt, tù đày thuộc Ban Liên lạc Cựu tù chính trị - tù binh Quận 7 đã tham dự họp mặt kỷ niệm 40 năm Ngày giải phóng miền Nam ...
                        
                       
                    
                    
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                40 năm ngày giải phóng Miền Nam: chiến thắng vĩ đại Mùa Xuân 1975
                            
                        
                        
                            

 
 
 
 
 
 Bốn chiến sĩ cắm cờ trên nóc phủ Tổng thống ngụy Sài Gòn ngày 30/04/1975.
 
 

Chiến dịch Hồ Chí Minh (26 đến 30/4/1975) là đỉnh cao của cuộc Tổng tiến công và nổi dậy mùa Xuân năm 1975. Thắng lợi của Chiến dịch Hồ Chí Minh là thắng lợi vĩ đại nhất, trọn vẹn nhất, kết thúc 30 năm chiến tranh lâu dài, gian khổ chống ngoại ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                LỊCH TIẾP DÂN CỦA LÃNH ĐẠO QUẬN 7 THÁNG 05 NĂM 2015
                            
                        
                        
                            

 
 
 
 Ngày tiếp dân
 
 
 Giờ tiếp
 
 
 Lãnh đạo tiếp
 
 
 Địa điểm tiếp
 
 
 
 
 Thứ Sáu
 01/5/2015
 
 
 Nghĩ Lễ Quốc tế Lao động
 
 
 
 
 Thứ Sáu
 08/5/2015
 
 
 8g00 - 11g30
 
 
 Đ/c Lê Trọng Hiếu 
 Chủ Tịch UBND Q7
 
 
 Văn phòng tiếp dân Quận 7
 
 
 
 
 Thứ Sáu
 15/5/2015
 
 
 8g00 - 11g30
 ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Đại hội chi bộ trường THPT Lê Thánh Tôn lần thứ XV, nhiệm kỳ 2015 - 2020
                            
                        
                        
                            * 100% Giáo Viên Thực Hiện Đổi Mới Phương Pháp Giảng Dạy Ngày 6/3, Chi bộ Trường Trung học phổ thông Lê Thánh Tôn tổ chức Đại hội Chi bộ lần thứ XV, nhiệm kỳ 2015 - 2020. Đồng chí Đỗ Thị Thảo, Phó Bí thư thường trực Quận ủy đã đến tham dự. Đây là Chi bộ được Quận chọn làm Đại hội điểm khối trường học. 

 
 
 
 
 
 Ban chấp hành nhiệm kỳ mới ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                LỊCH TIẾP DÂN CỦA LÃNH ĐẠO QUẬN 7 THÁNG 04 NĂM 2015
                            
                        
                        
                            

 
 
 
 Ngày tiếp dân
 
 
 Giờ tiếp
 
 
 Lãnh đạo tiếp
 
 
 Địa điểm tiếp
 
 
 
 
 Thứ Sáu
 03/4/2015
 
 
 8g00 - 11g30
 
 
 Đ/c Lê Trọng Hiếu 
 Chủ Tịch UBND Q7
 
 
 Văn phòng tiếp dân 
 Quận 7
 
 
 
 
 Thứ Sáu
 10/4/2015
 
 
 8g00 - 11g30
 
 
 Đ/c Lê Trọng Hiếu 
 Chủ Tịch UBND Q7
 
 
 Văn phòng ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Tổng kết phong trào thi đua yêu nước 2014 và khánh thành trung tâm bồi dưỡng chính trị quận 7
                            
                        
                        
                            Quận ủy-UBND-UB MTTQ VN Quận 7 vừa tổ chức hội nghị tổng kết 5 năm phong trào thi đua yêu nước - điển hình tiên tiến giai đoạn 2010-2014 và tổng kết phong trào thi đua yêu nước, khen thưởng năm 2014. Đến tham dự buổi lễ có đồng chí Lâm Trung Nhân, Phó Giám đốc Sở Nội vụ Thành phố; đồng chí Lê Thành Danh, Phó Trưởng Phòng Phong trào Ban thi đua ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Đại hội đại biểu phường Tân Thuận Tây lần thứ V, nhiệm kỳ 2015 – 2020
                            
                        
                        
                            Ngày 05/3, Đảng bộ Phường Tân Thuận Tây tổ chức Đại hội đại biểu lần thứ V, nhiệm kỳ 2015-2020. Về dự Đại hội có đồng chí Lê Văn Lắm - TUV, Giám đốc Sở Nội Vụ thành phố; đồng chí Lê Trọng Hiếu - TUV, Bí thư - chủ tịch UBND Quận cùng các đồng chí trong Ban thường vụ Quận uỷ. Đảng bộ Phường Tân Thuận Tây được Quận chọn làm Đại hội điểm khối phường. ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Đảng bộ cơ quan chính quyền quận 7 tổ chức đại hội nhiệm kỳ 2015-2020
                            
                        
                        
                            Ngày 7/3, Đảng bộ Cơ quan chính quyền Quận 7 tổ chức đại hội lần thứ IV, nhiệm kỳ 2015-2020. Tham dự có đồng chí Lê Văn Lắm, Thành ủy viên, Giám đốc Sở Nội vụ; đồng chí Trần Văn Ước, Phó Trưởng ban Tổ chức Thành ủy; đồng chí Lê Trọng Hiếu, Thành ủy viên, Bí thư, Chủ tịch UBND Quận đã đến tham dự. 
Trong nhiệm kỳ qua, hầu hết các chi bộ trong đảng ...
                        
                        
                    
                    
                
            
        
        
            
            
                
                    
                        
                            TIN NỔI BẬT
                        
                    
                
                 

                
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews0" href="http://www.quan7.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=Th%e1%bb%9di+s%e1%bb%b1+-+Ch%c3%adnh+tr%e1%bb%8b&ItemID=3679&Mode=1" class="a-hot-link" title="Đ/c Đỗ Thị Thảo - Phó Bí thư Thường trực Quận ủy trao phiên bản Anh hùng Lực lượng Vũ trang Nhân dân cho các cựu tù.
 
 

Vừa qua, hơn 80 cựu tù chính trị - tù binh tham gia kháng chiến bị địch bắt, tù đày thuộc Ban Liên lạc Cựu tù chính trị - tù binh Quận 7 đã tham dự họp mặt kỷ niệm 40 năm Ngày giải phóng miền Nam ...">
                                Họp mặt 80 cựu tù chính trị - tù binh Quận 7: Trao 66 phiên bản danh hiệu anh hùng lực lượng vũ trang nhân dân
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews1" href="http://www.quan7.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=V%c4%83n+ho%c3%a1+-+X%c3%a3+h%e1%bb%99i&ItemID=3612&Mode=1" class="a-hot-link" title="Bốn chiến sĩ cắm cờ trên nóc phủ Tổng thống ngụy Sài Gòn ngày 30/04/1975.
 
 

Chiến dịch Hồ Chí Minh (26 đến 30/4/1975) là đỉnh cao của cuộc Tổng tiến công và nổi dậy mùa Xuân năm 1975. Thắng lợi của Chiến dịch Hồ Chí Minh là thắng lợi vĩ đại nhất, trọn vẹn nhất, kết thúc 30 năm chiến tranh lâu dài, gian khổ chống ngoại ...">
                                40 năm ngày giải phóng Miền Nam: chiến thắng vĩ đại Mùa Xuân 1975
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews2" href="http://www.quan7.hochiminhcity.gov.vn/gioithieu?Source=%2fgioithieu&Category=%e1%bb%a6y+ban+Nh%c3%a2n+D%c3%a2n&ItemID=111&Mode=1" class="a-hot-link" title="Ngày tiếp dân
 
 
 Giờ tiếp
 
 
 Lãnh đạo tiếp
 
 
 Địa điểm tiếp
 
 
 
 
 Thứ Sáu
 01/5/2015
 
 
 Nghĩ Lễ Quốc tế Lao động
 
 
 
 
 Thứ Sáu
 08/5/2015
 
 
 8g00 - 11g30
 
 
 Đ/c Lê Trọng Hiếu 
 Chủ Tịch UBND Q7
 
 
 Văn phòng tiếp dân Quận 7
 
 
 
 
 Thứ Sáu
 15/5/2015
 
 
 8g00 - 11g30
 ...">
                                LỊCH TIẾP DÂN CỦA LÃNH ĐẠO QUẬN 7 THÁNG 05 NĂM 2015
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews3" href="http://www.quan7.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=Th%e1%bb%9di+s%e1%bb%b1+-+Ch%c3%adnh+tr%e1%bb%8b&ItemID=3577&Mode=1" class="a-hot-link" title="* 100% Giáo Viên Thực Hiện Đổi Mới Phương Pháp Giảng Dạy Ngày 6/3, Chi bộ Trường Trung học phổ thông Lê Thánh Tôn tổ chức Đại hội Chi bộ lần thứ XV, nhiệm kỳ 2015 - 2020. Đồng chí Đỗ Thị Thảo, Phó Bí thư thường trực Quận ủy đã đến tham dự. Đây là Chi bộ được Quận chọn làm Đại hội điểm khối trường học. 

 
 
 
 
 
 Ban chấp hành nhiệm kỳ mới ...">
                                Đại hội chi bộ trường THPT Lê Thánh Tôn lần thứ XV, nhiệm kỳ 2015 - 2020
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews4" href="http://www.quan7.hochiminhcity.gov.vn/gioithieu?Source=%2fgioithieu&Category=%e1%bb%a6y+ban+Nh%c3%a2n+D%c3%a2n&ItemID=110&Mode=1" class="a-hot-link" title="Ngày tiếp dân
 
 
 Giờ tiếp
 
 
 Lãnh đạo tiếp
 
 
 Địa điểm tiếp
 
 
 
 
 Thứ Sáu
 03/4/2015
 
 
 8g00 - 11g30
 
 
 Đ/c Lê Trọng Hiếu 
 Chủ Tịch UBND Q7
 
 
 Văn phòng tiếp dân 
 Quận 7
 
 
 
 
 Thứ Sáu
 10/4/2015
 
 
 8g00 - 11g30
 
 
 Đ/c Lê Trọng Hiếu 
 Chủ Tịch UBND Q7
 
 
 Văn phòng ...">
                                LỊCH TIẾP DÂN CỦA LÃNH ĐẠO QUẬN 7 THÁNG 04 NĂM 2015
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            
                                Tổng kết phong trào thi đua yêu nước 2014 và khánh thành trung tâm bồi dưỡng chính trị quận 7
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            
                                Đại hội đại biểu phường Tân Thuận Tây lần thứ V, nhiệm kỳ 2015 – 2020
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews7" href="http://www.quan7.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=Th%e1%bb%9di+s%e1%bb%b1+-+Ch%c3%adnh+tr%e1%bb%8b&ItemID=3573&Mode=1" class="a-hot-link" title="Ngày 7/3, Đảng bộ Cơ quan chính quyền Quận 7 tổ chức đại hội lần thứ IV, nhiệm kỳ 2015-2020. Tham dự có đồng chí Lê Văn Lắm, Thành ủy viên, Giám đốc Sở Nội vụ; đồng chí Trần Văn Ước, Phó Trưởng ban Tổ chức Thành ủy; đồng chí Lê Trọng Hiếu, Thành ủy viên, Bí thư, Chủ tịch UBND Quận đã đến tham dự. 
Trong nhiệm kỳ qua, hầu hết các chi bộ trong đảng ...">
                                Đảng bộ cơ quan chính quyền quận 7 tổ chức đại hội nhiệm kỳ 2015-2020
                            
                        
                    
                    
                
                
            
            
        
    


				
			
		
	

			
		
		
			
				
			
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=Th%e1%bb%9di+s%e1%bb%b1+-+Ch%c3%adnh+tr%e1%bb%8b++&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    Thời sự - Chính trị
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Tổ chức thực hiện công tác quản lý nhà nước về khoa học và công nghệ trên địa bàn quận 7
                            
                            
                        
                    
                    
                        
                            
                            
                                Vừa qua, UBND Quận 7 đã tổ chức thực hiện công tác quản lý nhà nước về khoa học và công nghệ trên địa bàn Quận 7 năm 2015. 
Mục đích và yêu cầu như sau: Tăng cường công tác quản lý nhà nước đối với lĩnh vực khoa học và công nghệ góp phần thúc đẩy phát triển kinh tế - xã hội trên địa bàn. Tuyên truyền, hướng dẫn, phổ biến các quy định pháp luật về ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Quận 7 trao tặng 74 huy hiệu đảng đợt 19/5/2015
                            
                            
                            &nbsp;(09/06)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Cơ quan Đảng - Đoàn thể: hội nghị cán bộ công chức năm 2015
                            
                            
                            &nbsp;(08/06)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	

				
			
			&nbsp;
			
				
			
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=Kinh+t%e1%ba%bf&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    Kinh tế
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Tăng cường hàng bình ổn giá trên địa bàn quận 7
                            
                            
                        
                    
                    
                        
                            
                            
                                Theo kế hoạch thực hiện chương trình bình ổn giá các mặt hàng lương thực, thực phẩm thiết yếu do UBND Quận phát hành, hàng hóa thực phẩm thiết yếu phục vụ bình ổn thị trường năm 2015 và 2016 gồm 09 nhóm mặt hàng: lương thực (gạo, mì gói, bún khô, cháo dinh dưỡng, miến, phở, hủ tiếu kho và tươi), đường (RE và RS), dầu ăn, thịt gia súc, thịt gia ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Tăng cường trách nhiệm của nhà sản xuất, kinh doanh và người tiêu dùng trong việc bảo đảm chất lượng an toàn thực phẩm
                            
                            
                            &nbsp;(04/06)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Quận 7 vươn lên thoát nghèo bền vững
                            
                            
                            &nbsp;(14/05)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	

				
			
		
		
			
				
							
			
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=Qu%e1%ba%a3n+l%c3%bd+%c4%91%c3%b4+th%e1%bb%8b&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    Quản lý đô thị
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Tuyên truyền, phổ biến pháp luật về trật tự an toàn giao thông năm 2015
                            
                            
                        
                    
                    
                        
                            
                            
                                Vừa qua, UBND Quận 7 phối hợp với Ban An toàn giao thông triển khai Kế hoạch tuyên truyền, phổ biến pháp luật về trật tự an toàn giao thông năm 2015. Nội dung tuyên truyền gồm có: Tuyên truyền các chủ trương, giải pháp của Chính phủ, Ủy ban An toàn giao thông Quốc gia, Ban ATGTTP trong công tác bảo đảm TTATGT đường bộ; Tuyên truyền, phổ biến các ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Thực tập phương án chữa cháy và cứu nạn - cứu hộ tại công ty TNHH Pungkook Sài Gòn
                            
                            
                            &nbsp;(15/06)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Triển khai công tác bảo đảm trật tự an toàn giao thông năm 2015
                            
                            
                            &nbsp;(27/05)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	

				
							
			
			&nbsp;
			
				
							
			
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=V%c4%83n+ho%c3%a1+-+X%c3%a3+h%e1%bb%99i&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    Văn hoá - Xã hội
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Phẫu thuật thành công ca mổ nội soi đầu tiên
                            
                            
                        
                    
                    
                        
                            
                            
                                Vừa qua, tại Bệnh viện Quận 7 đã diễn ra ca mổ nội soi đầu tiên do bệnh viên quận 7 phối hợp với Bệnh viện nhân dân 115 thực hiện. Tham gia ca phẫu thuật có bác sĩ Trần Dư Đông, Giám đốc Bệnh viện Quận 7. Bệnh nhân là anh Đặng Hùng Phương (20 tuổi), bị đứt dây chằng trước gối. Các bác sĩ đã phẫu thuật tái tạo lại dây chằng khớp gối bằng nội soi ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Hơn 200 nhi đồng tham dự hội quân “em là chiến sĩ giải phóng quân”
                            
                            
                            &nbsp;(17/06)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Hơn 3.000 đội viên và học sinh tham gia ngày hội đội viên
                            
                            
                            &nbsp;(17/06)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	

				
							
			
		
		
			
				
							
			
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=N%e1%bb%99i+ch%c3%adnh&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    Nội chính
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Công an quận 7 tuyên dương 26 tập thể và 27 cá nhân điển hình tiên tiến
                            
                            
                        
                    
                    
                        
                            
                            
                                Vừa qua, Công an Quận 7 tổ chức Hội nghị điển hình tiên tiến giai đoạn 2010 - 2014. Đồng chí Huỳnh Văn Hùng, Ủy viên Thường vụ, Phó Chủ tịch Thường trực UBND Quận đã đến tham dự. 
Trong phong trào thi đua “Vì an ninh Tổ quốc” giai đoạn 2010 - 2014, Công an Quận 7 đã nỗ lực thi đua nâng cao hiệu quả công tác và chiến đấu, tận tụy phục vụ nhân dân, ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Hơn hai tỷ đồng chăm lo cho người nghèo
                            
                            
                            &nbsp;(12/05)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Phường Tân Thuận Tây: 08 cá nhân đạt danh hiệu chiến sĩ thi đua cơ sở năm 2014
                            
                            
                            &nbsp;(16/04)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	

				
							
			
			&nbsp;
			
			
				
			
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=C%e1%ba%a3i+c%c3%a1ch+h%c3%a0nh+ch%c3%adnh&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    Cải cách hành chính
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Tiếp tục tạo mọi điều kiện về quy hoạch, cải cách hành chính
                            
                            
                        
                    
                    
                        
                            
                            
                                
                                    
                                        
                                            
                                        
                                    
                                
                            
                            
                            
                                

 
 
 
 
 
 Đồng chí Dương Minh Thuỳ - Phó Chủ tịch UBND Quận trao Quyết định Lộ giới hẻm cho lãnh đạo Phường Tân Thuận Tây.
 
 

Nằm ở phía Nam Thành phố, từ một địa bàn trũng, đầm lầy, kênh rạch chằng chịt ngày nào, sau 18 năm thành lập, Quận 7 giờ đây đã hoàn toàn đổi thay với những khu đô thị mới văn minh, hiện đại và đã khẳng định ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Chi cục thuế quận 7 tập huấn về cải cách, đơn giản hóa thủ tục hành chính
                            
                            
                            &nbsp;(13/11)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Ứng dụng công nghệ thông tin sâu rộng tại UBND 10 phường
                            
                            
                            &nbsp;(10/04)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	

			
				
			
		

	

											
										
										
									
		
	  							
								
								
									
								
								
	
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveLink(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }




						
    
        
            
            
            
        
    

					

 
						
    
        
            
             
        
        
    

					

				
			
		
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveQC(right, newsid, menuid, img) {

        if (right == ''true'') {

            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }


 
						
 
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
						
					   
 
						
    
        
            
        
    

					

				
			
		
	
		
			
				
					


  










    var transiteTime = parseInt(''4000'');

    var albumbox = jQuery.noConflict();
    albumbox(document).ready(function() {

        var optionsLeft = {
            caption: ''hover'',
            opacity: 0.8,
            easing: ''swing'',
            widthimg:''220'',
            duration: 240
        }

        var optionsRight = {
            caption: ''hover'',
            opacity: 0.8,
            navigation: ''hover'',
            direction: ''left'',
            easing: ''swing'',
            widthimg: ''220'',
            duration: 240
        }
        var gt = albumbox(''#ppy1'').position().left;

        var duy;
        if (gt > 500)
            albumbox(''div#ppy1'').popeye(optionsRight);
        else
            albumbox(''div#ppy1'').popeye(optionsLeft);

        albumbox(''div.ppy-nav'').hide();
        var flag = true;

        albumbox.doTimeout(transiteTime, function() {
            if (flag == false)
                return false;

            
            albumbox(''a.ppy-next1'').click();
            return true;
        });

        albumbox(''a.ppy-next'').click(function() {
            flag = false;
        });
        albumbox(''a.ppy-prev'').click(function() {
            flag = false;
        });

    });
    
   



        
            
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
            
            
                
                    
                        Hoạt động ảnh
                
                
                    
                
                
                    
                        Previous image 
                        Next image 
                        Enlarge
                        Close
                    
                
                
                
                    Xem tất cả
                
            
        
        Next image
        
				
			
		
	
		
			
				
					









    var vbox = jQuery.noConflict();

        var width = ''250'' + "px";
        var height = ''198'' + "px";
        vbox(document).ready(function() {

        if (vbox("#ctl00_m_g_21fe90ff_2fff_4a73_b509_251680489206_ctl00_listvideobox").children("li").length <= 1) {
            vbox("#ctl00_m_g_21fe90ff_2fff_4a73_b509_251680489206_ctl00_listvideobox").parent().hide();
        }
        
        if (''True'' == ''True'') {

                vbox(''li.item-videobox'').live(''click'', function() {
                    var gt = vbox(this).attr(''linkVideo'');
                    var thumbnail = vbox(this).attr(''thumbnail'');
                    var videoplayer = vbox(this).attr(''videoplayer'');

                    jwplayer(videoplayer).setup({
                        flashplayer: "/_LAYOUTS/LacVietBio/UserControls/PhotoAlbum/images/player4.6.swf",
                        autostart: true,
                        file: gt,
                        image: thumbnail,
                        height: height,
                        width: width
                    });
                });
           
            
        }
    });
    





    
         THƯ VIỆN VIDEO
        
        
        
            
                
                
                    Quận 7, 15 năm xây dựng và phát triển - Phần 2 (phóng sự tài liệu 15 năm)
             
                
                    Quận 7, 15 năm xây dựng và phát triển - Phần 1 (phóng sự tài liệu 15 năm)
             
                
                    Sức bật từ một vùng ven - phần 1 (phim tài liệu 10 năm thành lập quận)
             
                
                    Sức bật từ một vùng ven - phần 2 (phim tài liệu 10 năm thành lập quận)
             
        
    





    var linkFirstVideo = vbox("#ctl00_m_g_21fe90ff_2fff_4a73_b509_251680489206_ctl00_listvideobox").children("li").eq(0).attr(''linkvideo'');
    var firstThumbnail = vbox("#ctl00_m_g_21fe90ff_2fff_4a73_b509_251680489206_ctl00_listvideobox").children("li").eq(0).attr(''thumbnail'');
    jwplayer("ctl00_m_g_21fe90ff_2fff_4a73_b509_251680489206_ctl00_dvnduymainvideo").setup({
        flashplayer: "/_LAYOUTS/LacVietBio/UserControls/PhotoAlbum/images/player4.6.swf",
        file: linkFirstVideo,
        image: firstThumbnail,
        height: height,
        width: width
    });



				
			
		
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveLink(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }




						TH&Ocirc;NG TIN QUY HOẠCH

					

 
						
    
        
            
             
        
        
    

					

				
			
		
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveLink(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }




						
LI&Ecirc;N KẾT WEB



    
        
            
            Trang web li&ecirc;n kết
            Hồ Ch&iacute; Minh city web
            Tạp ch&iacute; Cộng Sản Đảng
            Quốc Hội
            Văn ph&ograve;ng Ch&iacute;nh phủ
            Đảng bộ TPHCM
            Sở Quy hoạch đầu tư
            Sở Quy hoạch kiến tr&uacute;c
            Sở T&agrave;i nguy&ecirc;n m&ocirc;i trường
            Sở Giao th&ocirc;ng vận tải
            Quận 1
            Quận 2
            Quận 3
            Quận 4
            Quận 5
            Quận 6
            Quận 7
            Quận 8
            Quận 9
            Quận 10
            Quận 11
            Quận 12
            Quận B&igrave;nh T&acirc;n
            Quận B&igrave;nh Thạnh
            Quận G&ograve; Vấp
            Quận Ph&uacute; Nhuận
            Quận T&acirc;n B&igrave;nh
            Quận T&acirc;n Ph&uacute;
            Quận Thủ Đức
            Huyện B&igrave;nh Ch&aacute;nh
            Huyện Cần Giờ
            Huyện Củ Chi
            Huyện H&oacute;c M&ocirc;n
            Huyện Nh&agrave; B&egrave;
            
        
    




					

 
						
    
        
            
             
        
        
    

					

				
			
		
	

	

															
								
	
		
			
				&nbsp;
			
		
	
		
			


    
        
            
                SỐ LƯỢT TRUY CẬP
        
        
            
                
                    
                        
				
					
                                
                                    
                                        
                                            
                                                9
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                9
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                8
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                0
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                9
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                3
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                1
                                        
                                    
                                
                            
				
			
                    
                
            
        
    
 

    
		
	

									
								
								
							
							
						
						
									
							
											
									
								 ©   ỦY BAN NHÂN DÂN QUẬN 7, THÀNH PHỐ HỒ CHÍ MINH
								Địa chỉ: Số 07 đường Tân Phú, Phường Tân Phú, Quận 7, Thành phố Hồ Chí Minh
								Tel: (08)3 785 1032 - 3 785 1032    - Mail: q7@tphcm.gov.vn
								
									
																												
							
						
						
	
	
	
	


					
					
						
							

.ms-bodyareaframe {
	padding: 0px;
}


								

TD.ms-titleareaframe, .ms-pagetitleareaframe {
	height: 10px;
}
Div.ms-titleareaframe {
	height: 100%;
}
.ms-pagetitleareaframe table {
	background: none;
	height: 0px;
}


									
	
	
		 
			
				
					
						Trang web Này: Trang  chủ

					
				
			
		
	


									
									
									
	


										
	
									
								
								
		
  
								
								
							


//<![CDATA[
var __wpmExportWarning=''This Web Part Page has been personalized. As a result, one or more Web Part properties may contain confidential information. Make sure the properties contain information that is safe for others to read. After exporting this Web Part, view properties in the Web Part description file (.WebPart) by using a text editor such as Microsoft Notepad.'';var __wpmCloseProviderWarning=''You are about to close this Web Part.  It is currently providing data to other Web Parts, and these connections will be deleted if this Web Part is closed.  To close this Web Part, click OK.  To keep this Web Part, click Cancel.'';var __wpmDeleteWarning=''You are about to permanently delete this Web Part.  Are you sure you want to do this?  To delete this Web Part, click OK.  To keep this Web Part, click Cancel.'';_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;//]]>


<!--
function SA4E64389_Submit() {GoSearch(null,''ctl00_PlaceHolderTopNavBar_g_b900ae80_a010_4f8e_a737_58fab2902f70_SA4E64389_InputKeywords'',null,true,false,null,null,null,null,''\u002fpages\u002fketquatk.aspx'', ''Trang web Này'',''Danh sách Này'', ''Thư mục Này'', ''Trang web Có liên quan'', ''\u002f_layouts\u002fOSSSearchResults.aspx'');}
// -->

// append an onload event handler
var SA4E64389__onload= document.body.onload;
if(typeof document.body.onload == ''function'')
{
 document.body.onload = function()
 {
SA4E64389__onload();        
  document.getElementById(''ctl00_PlaceHolderTopNavBar_g_b900ae80_a010_4f8e_a737_58fab2902f70_SA4E64389_InputKeywords'').name = ''InputKeywords'';
 }
}
else
{
 document.body.onload = function()
 {
  eval(SA4E64389__onload);        
  document.getElementById(''ctl00_PlaceHolderTopNavBar_g_b900ae80_a010_4f8e_a737_58fab2902f70_SA4E64389_InputKeywords'').name = ''InputKeywords'';
 }
}

function SA4E64389_OSBEK(event1) { 
if((event1.which == 10) || (event1.which == 13))
{   
SA4E64389_Submit();
}
}
// -->

<!--
function S3031AEBB_Submit() {GoSearch(null,''ctl00_PlaceHolderSearchArea_ctl01_S3031AEBB_InputKeywords'',null,true,true,''ctl00_PlaceHolderSearchArea_ctl01_SBScopesDDL'',''ctl00_PlaceHolderSearchArea_ctl01_ctl00'',null,null,''http:\u002f\u002fwww.quan7.hochiminhcity.gov.vn\u002f_layouts\u002fOSSSearchResults.aspx'', ''Trang web Này'',''Danh sách Này'', ''Thư mục Này'', ''Trang web Có liên quan'', ''\u002f_layouts\u002fOSSSearchResults.aspx'');}
// -->

// append an onload event handler
var S3031AEBB__onload= document.body.onload;
if(typeof document.body.onload == ''function'')
{
 document.body.onload = function()
 {
S3031AEBB__onload();        
  document.getElementById(''ctl00_PlaceHolderSearchArea_ctl01_S3031AEBB_InputKeywords'').name = ''InputKeywords'';
 }
}
else
{
 document.body.onload = function()
 {
  eval(S3031AEBB__onload);        
  document.getElementById(''ctl00_PlaceHolderSearchArea_ctl01_S3031AEBB_InputKeywords'').name = ''InputKeywords'';
 }
}

function S3031AEBB_OSBEK(event1) { 
if((event1.which == 10) || (event1.which == 13))
{   
S3031AEBB_Submit();
}
}
// -->




//<![CDATA[
Sys.Application.initialize();
//]]>', CAST(N'2015-06-18 00:58:36.610' AS DateTime), N'Safe', 5)
INSERT [dbo].[TEXT_CONTENT] ([ContentID], [Content], [TimeCheck], [TextResult], [WebID]) VALUES (6, N'Trang chủ 
	- UBND QUẬN BÌNH THẠNH





	
	
	var navBarHelpOverrideKey = "wssmain";
	

	






















 var MSOWebPartPageFormName = ''aspnetForm'';

function _spNavigateHierarchy(nodeDiv, dataSourceId, dataPath, url, listInContext, type) {
    ProcessDefaultNavigateHierarchy(nodeDiv, dataSourceId, dataPath, url, listInContext, type, document.forms.aspnetForm, "", "\u002fdefault.aspx");
}



	
	
	
	
		
			
			
		
		
		 
			
			   
			Bật chế độ truy cập dễ dàng hơn
			
			
			Bỏ qua nội dung chính
		 
		   
			
			 
			  
				
				Tắt chế độ truy cập dễ dàng hơn
			  
			  
				UBND QUẬN B&#204;NH THẠNH
			  
			  
			 
		   
		 
		 
			
		   
	   
	  
			
		
		
			
			
				
					
					
Đăng nhập

					
					
					
						
							
							
						
					
					
				
			
			
		
		
			
			
		

	
			
	
	
			
		
		
			
			
				
					
					
					
					
			
		   
			 UBND QUẬN BÌNH THẠNH
		   
		  
		  
					
				
			
			
		
		
			
			
			
			
				
			
				
			
		   
			
			
			
			
			
			
			
	






    $(document).ready(function() {


        var CurrentPath = $.trim($("div#dvnduyPath").text());
        $("a[href=''" + CurrentPath + "'']").parent().parent().attr("id", "LvSelected");
        // Xác định tọa độ trong menu


        $("div").children("ul").children("li").each(function(e) {
           
            var p = $(this).position().left + ($(this).outerWidth() / 2);
            $(this).children("ul").css("display", "none");

            if (p >= 550) 
            {
                $(this).children("ul.children").children().css("float", "right");
            }
            
        });
        // Xác định vị trí của Tab đang được chọn
        var index = $("li#LvSelected").attr("duy");


        $("#wrapper").mouseleave(function() {

            $("ul#topnav li ul.children").css("display", "none");
            $("ul#topnav").children("li").eq(parseInt(index)).attr("id", "LvSelected");
            $("li#LvSelected").children().css("display", "block");

        });

        $("li.parent").hover
        (
               function() {

                   $("ul#topnav").children("li").children("ul").css("display", "none");
                   $(this).children().css("display", "block");
                   $("li#LvSelected").attr("id", "");
                   $(this).attr("id", "LvSelected");

               },
               function() {

                   $(this).attr("id", "");


               });


        $("ul#LvSelected").css("display", "block");
        $("ul#LvSelected").children().css("display", "block");

        $("ul#topnav li ul.children").css("display", "none");
        $("ul#topnav").children("li").eq(parseInt(index)).attr("id", "LvSelected");
        $("li#LvSelected").children().css("display", "block");

    });
        


/default.aspx





    
        
        
            
                
                    Trang chủ
            
        
        
        
            
                
                    LIÊN HỆ
            
        
        
        
            
                
                    SƠ ĐỒ SITE
            
        
        
    





			
			
				
					
				
						
		   
		   
		   	
		   	
		   		
		  				            							
                        function tS(){ x=new Date(); x.setTime(x.getTime()); return x; }
                        function y2(x){ x=(x<500)?x+1900:x; return String(x).substring(0,4) }
                        function k(){var ap="AM";
						 if ((tS().getHours())   > 11) { ap ="PM"; };return ap;}
                        function dT(){ 
                        
						  if(fr==0){ fr=1; document.write(''''+eval(oT)+''''); } tP.innerText=eval(oT); setTimeout(''dT()'',1000); }
                        var dN=new Array(''Chủ nhật'',''Thứ hai'',''Thứ ba'',''Thứ tư'',''Thứ năm'',''Thứ sáu'',''Thứ bảy''),mN=new Array(''1'',''2'',''3'',''4'',''5'',''6'',''7'',''8'',''9'',''10'',''11'',''12''),fr=0,oT="dN[tS().getDay()]+'', ''+tS().getDate()+''/''+mN[tS().getMonth()]+''/''+y2(tS().getYear())+''-''+tS().getHours()+'':''+tS().getMinutes()+'' ''+k()";
                     
                     dT();
		  		

		   	
		   	
				
	
		 
			
				
					
				
			
		
	


		   	
		   	
		   	
		   
		  
		
			
		
		
			
			
				
					
					
					
					
					
						
							
							
							
						
						
							
							
							
			
			UBND QUẬN BÌNH THẠNH

							
							
							
						
					
					
					
						

					
					
					
						
							
								

	
	
		
			
				
					
    
    
    


    var jLeftMenu = jQuery.noConflict();
    jLeftMenu(function($) {

        $("div.ms-navheader").mouseover(function() {

            $(this).addClass("heading-hover");

        }).mouseout(function() {
            $(this).removeClass("heading-hover");
        });
        $("div.ms-navheader-icon").mouseover(function() {
            $(this).addClass("heading-hover");

        }).mouseout(function() {
            $(this).removeClass("heading-hover");
        });
        $("div.ms-navItem").mouseover(function() {
            $(this).addClass("ms-navItem-hover");
        }).mouseout(function() {
            $(this).removeClass("ms-navItem-hover");
        });
        $("div.ms-navItem-icon").mouseover(function() {
            $(this).addClass("ms-navItem-hover");
        }).mouseout(function() {
            $(this).removeClass("ms-navItem-hover");
        });
    });

    
   
 

						GIỚI THIỆUGiới thiệu chungBản đồ h&#224;nh ch&#237;nhLịch sử văn h&#243;aMẹ Việt Nam anh h&#249;ngDi t&#237;ch lịch sửCơ sở t&#237;n ngưỡng d&#226;n gianBia đ&#224;i tưởng niệmNh&#224; cổCơ sở t&#244;n gi&#225;oSơ đồ tổ chức bộ m&#225;yKẾ HOẠCH PH&#193;T TRIỂN KT - XHPh&#225;t triển Kinh tế X&#227; hộiQuản l&#253; đ&#244; thịVăn h&#243;a - X&#227; hộiAn ninh quốc ph&#242;ngTH&#212;NG TIN QUY HOẠCHChiến lược định hướngBản đồ quy hoạch quậnQuy hoạch X&#226;y dựng v&#224; Đ&#244; thịQuy hoạch kế hoạch sử dụng đấtQuy hoạch &amp; Kế hoạch khai th&#225;c t&#224;i nguy&#234;n thi&#234;n nhi&#234;nQuy hoạch thu gom t&#225;i chế xử l&#253; chất thảiTHỦ TỤC H&#192;NH CH&#205;NHKinh tếQuản l&#253; đ&#244; thịT&#224;i nguy&#234;n m&#244;i trườngVăn h&#243;a - X&#227; hộiTư ph&#225;p - Hộ tịchXử phạt h&#224;nh ch&#237;nhTIN TỨC SỰ KIỆNHoạt động Đảng - Đo&#224;n thểHoạt động ĐảngHoạt động Đo&#224;n thểHoạt động ch&#237;nh quyềnTuy&#234;n truyền, phổ biến, hướng dẫn thực hiện ph&#225;p luật, chế độ, ch&#237;nh s&#225;chPh&#225;t triển Kinh tế - X&#227; hộiQuản l&#253; đ&#244; thịVăn h&#243;a - X&#227; hộiAn ninh quốc ph&#242;ngVĂN BẢN PH&#193;P LUẬTVăn bản từ Th&#224;nh phốVăn bản do đơn vị ban h&#224;nhLỊCH TIẾP D&#194;NTH&#212;NG TIN DỰ &#193;NDự &#225;n chuẩn bị đầu tưDự &#225;n đang triển khaiDự &#225;n đ&#227; ho&#224;n tấtĐẤU THẦU - MUA SẮM C&#212;NGĐấu thầu - Mua sắm c&#244;ng
					



				
			
		
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveLink(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }




						
LI&Ecirc;N KẾT WEB



    
        
            
            Trang web li&ecirc;n kết
             Hồ Ch&iacute; Minh city web
            Quận 1
            Quận 2
            Quận 3
            Quận 4
            Quận 5
            Quận 6
            Quận 7
            Quận 8
            Quận 9
            Quận 10
            Quận 11
            Quận 12
            Quận B&igrave;nh T&acirc;n
            Quận B&igrave;nh Thạnh
            Quận G&ograve; Vấp
            Quận Ph&uacute; Nhuận
            Quận T&acirc;n B&igrave;nh
            Quận T&acirc;n Ph&uacute;
            Quận Thủ Đức
            Huyện B&igrave;nh Ch&aacute;nh
            Huyện Cần Giờ
            Huyện Củ Chi
            Huyện H&oacute;c M&ocirc;n
            Huyện Nh&agrave; B&egrave;
            
        
    




					

 
						
    
        
            
             
        
        
    

					

				
			
		
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveQC(right, newsid, menuid, img) {

        if (right == ''true'') {

            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }


 
						
 
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
						
					   
 
						
    
        
            
        
    

					

				
			
		
	
		
			
				
					


  










    var transiteTime = parseInt(''3500'');

    var albumbox = jQuery.noConflict();
    albumbox(document).ready(function() {

        var optionsLeft = {
            caption: ''hover'',
            opacity: 0.8,
            easing: ''swing'',
            widthimg:''200'',
            duration: 240
        }

        var optionsRight = {
            caption: ''hover'',
            opacity: 0.8,
            navigation: ''hover'',
            direction: ''left'',
            easing: ''swing'',
            widthimg: ''200'',
            duration: 240
        }
        var gt = albumbox(''#ppy1'').position().left;

        var duy;
        if (gt > 500)
            albumbox(''div#ppy1'').popeye(optionsRight);
        else
            albumbox(''div#ppy1'').popeye(optionsLeft);

        albumbox(''div.ppy-nav'').hide();
        var flag = true;

        albumbox.doTimeout(transiteTime, function() {
            if (flag == false)
                return false;

            
            albumbox(''a.ppy-next1'').click();
            return true;
        });

        albumbox(''a.ppy-next'').click(function() {
            flag = false;
        });
        albumbox(''a.ppy-prev'').click(function() {
            flag = false;
        });

    });
    
   



        
            
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
            
            
                
                    
                        THƯ VIỆN HÌNH ẢNH
                
                
                    
                
                
                    
                        Previous image 
                        Next image 
                        Enlarge
                        Close
                    
                
                
                
                    Xem tất cả
                
            
        
        Next image
        
				
			
		
	

	

							
								
									
									
										
											&nbsp;
											
											
												
													
														
				
				
				
				Khởi chạy Nhanh
				
				Xem Tất cả Nội dung trang Web
				
				
				
				
				
		
		
		
		
		
		
				
				
			  
														
														


    
        
            
                SỐ LƯỢT TRUY CẬP
        
        
            
                
                    
                        
	
		
                                
                                    
                                        
                                            
                                                1
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                0
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                3
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                1
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                8
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                0
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                0
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                2
                                        
                                    
                                
                            
	

                    
                
            
        
    
 

    
													
												
												
													
													
													
												
											
										
										
										
										
										
									
								
								
								
								
									

								
								
								
		
								
									
										
										
										
											
													

	
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveLink(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }




						

					

 
						
    
        
            
             
        
        
    

					

				
			
		
	
		
			
				
					





 var jHotNews = jQuery.noConflict();
  function slideSwitch() 
  {
      var jQueryActive = jHotNews(''#slideshow DIV.active'');
     
      if ( jQueryActive.length == 0 ) jQueryActive = jHotNews(''#slideshow DIV:last'');
      var jQueryNext =  jQueryActive.next().length ? jQueryActive.next(): jHotNews(''#slideshow DIV:first'');
      jQueryActive.addClass(''last-active'');
      
      jQueryNext.css({opacity: 0.0})
          .addClass(''active'')
          .animate({opacity: 1.0}, 1000, function() {
          jQueryActive.removeClass(''active last-active'');
          
          });
  }
  jHotNews(function($) {
  var cmshotnewsrefreshIntervalId=setInterval( "slideSwitch()", "4000" );
          $(".a-hot-link").mouseover(function() {

            var kq = $(this).attr(''id'');

            $(''div.hl-latestnews3'').each(function() {
                if ($(this).attr(''idItem'') == kq) {
                    $(this).addClass(''active'');
                    clearInterval(cmshotnewsrefreshIntervalId);
                }
                else {
                    $(this).removeClass(''active'');
                }
            });
        }).mouseout(function() {
            cmshotnewsrefreshIntervalId = setInterval("slideSwitch()", "4000");
        });
  });



/**Tin noi bat***/
/*#slideshow{width:295px;float:left;height:380px;position:relative;}
#slideshow DIV{position:absolute;top:0;left:0;z-index:80;opacity:.0;width:295px;background-color:#FFF;height:100%;}
#slideshow DIV.active{z-index:100;opacity:1.0;width:295px;height:100%;}
#slideshow DIV.last-active{z-index:90;height:100%;}
#slideshow DIV IMG{display:block;border:0;margin-bottom:10px;}*/


    
        
            
                
                    
                    
                    
                        
                        
                            
                        
                         
                        
                            
                                Kỷ niệm 104 năm Ngày Bác Hồ ra đi tìm đường cứu nước (05/6/1911 - 05/6/2015)
                            
                        
                        
                            Bác Hồ ra đi tìm đường cứu nước, mở hướng tương lai tươi sáng cho dân tộc
                        
                       
                    
                    
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Lễ kỷ niệm 125 năm Ngày sinh Chủ tịch Hồ Chí Minh (19/5/1890 - 19/5/2015) & Tuyên dương gương điển hình học tập và làm theo tấm gương đạo đức Hồ Chí Minh năm 2015
                            
                        
                        
                            

.ExternalClass70F01910328841E39279166DD4BF8218 .shape
{;}




 




Ngày 19/5/2015 Quận ủy - UBND - UBMTTQ Việt Nam quận Bình Thạnh tổ chức lễ kỷ niệm 125 năm Ngày sinh Chủ tịch Hồ Chí Minh (19/5/1890 - 19/5/2015) & Tuyên dương gương điển hình học tập và làm theo tấm gương đạo đức Hồ Chí Minh năm 2015. 
 

 

Đến dự có quý Mẹ ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Giao ban chuyên đề cách làm, kinh nghiệm trong việc phòng, chống biểu hiện suy thoái về tư tưởng chính trị, “tự diễn biến”, “tự chuyển hóa” trong nội bộ Đảng và phản bác các quan điểm sai trái
                            
                        
                        
                            

.ExternalClass2B4230FA32A3425CBC803269FA5FFAAD .shape
{;}



Ngày 06/5/2015, Quận ủy Bình Thạnh tổ chức hội nghị giao ban chuyên đề "cách làm, kinh nghiệm trong việc phòng, chống biểu hiện suy thoái về tư tưởng chính trị, "tự diễn biến", "tự chuyển hóa" trong nội bộ Đảng và phản bác các quan điểm sai trái. 
Tham dự có đồng chí Tô Đại ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Hội thi kể chuyện tấm gương đạo đức Hồ Chí Minh
                            
                        
                        
                            

.ExternalClass2BE724DEAC4B4AEAAE4DB4479CD301DE .shape
{;}




 




Ngày 09/5/2015, Đảng ủy Khối cơ quan UBND quận Bình Thạnh tổ chức hội thi kể chuyện tấm gương đạo đức Hồ Chí Minh chuyên đề năm 2015 "Học tập và làm theo tấm gương đạo đức Hồ Chí Minh về trung thực, trách nhiệm, gắn bó với nhân dân; đoàn kết xây dựng Đảng trong ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Tổng kết công tác giáo dục quốc phòng và an ninh năm 2014
                            
                        
                        
                            

.ExternalClass34EF77E452424D928E40F230B7D269D7 .shape
{;}




 




Ngày 12/5/2015, UBND quận Bình Thạnh tổ chức hội nghị tổng kết công tác giáo dục quốc phòng và an ninh năm 2014, triển khai nhiệm vụ năm 2015. 
Tham dự có đại diện Hội đồng Giáo dục quốc phòng - an ninh và lãnh đạo Bộ Tư lệnh thành phố; Quận ủy; Ban CHQS quận; Hội ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Lễ trao tặng Huy hiệu Đảng
                            
                        
                        
                            

.ExternalClass22857CEFA05E4205A5D5E2AD9657274D .shape
{;}

 
Ngày 14/5/2015 Quận ủy Bình Thạnh tổ chức lễ trao tặng Huy hiệu 55, 50, 40, 30 năm tuổi Đảng đợt 19/5/2015 cho 138 đảng viên.
Đợt này, có 14 đồng chí nhận Huy hiệu 55 năm tuổi Đảng, 30 đồng chí nhận Huy hiệu 50 năm tuổi Đảng, 36 đồng chí nhận Huy hiệu 40 năm tuổi Đảng và 58 đồng ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Một số hoạt động sôi nổi, thiết thực, ý nghĩa trong dịp kỷ niệm 125 năm Ngày sinh Chủ tịch Hồ Chí Minh (19/5/1890 - 19/5/2015)
                            
                        
                        
                            

.ExternalClass8A23950928B34794864346BEB82888B5 .shape
{;}

 
Ngày 14/5/2015 Ban Liên lạc Cựu tù chính trị - tù binh quận phối hợp Quận đoàn tổ chức họp mặt, giao lưu giữa cựu tù chính trị với đoàn viên thanh niên quận Bình Thạnh, với chủ đề "Bác Hồ trong trái tim tôi".
Dịp này, đại biểu giao lưu với các đồng chí Đặng Hồng Nhựt, Nguyễn Thị ...
                        
                        
                    
                    
                
            
        
        
            
            
                
                    
                        
                            TIN NỔI BẬT
                        
                    
                
                 

                
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            
                                Kỷ niệm 104 năm Ngày Bác Hồ ra đi tìm đường cứu nước (05/6/1911 - 05/6/2015)
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews1" href="http://www.binhthanh.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=H%e1%bb%8dc+t%e1%ba%adp+v%c3%a0+l%c3%a0m+theo+t%e1%ba%a5m+g%c6%b0%c6%a1ng+%c4%91%e1%ba%a1o+%c4%91%e1%bb%a9c+H%e1%bb%93+Ch%c3%ad+Minh&ItemID=6152&Mode=1" class="a-hot-link" title=".ExternalClass70F01910328841E39279166DD4BF8218 .shape
{;}




 




Ngày 19/5/2015 Quận ủy - UBND - UBMTTQ Việt Nam quận Bình Thạnh tổ chức lễ kỷ niệm 125 năm Ngày sinh Chủ tịch Hồ Chí Minh (19/5/1890 - 19/5/2015) & Tuyên dương gương điển hình học tập và làm theo tấm gương đạo đức Hồ Chí Minh năm 2015. 
 

 

Đến dự có quý Mẹ ...">
                                Lễ kỷ niệm 125 năm Ngày sinh Chủ tịch Hồ Chí Minh (19/5/1890 - 19/5/2015) & Tuyên dương gương điển hình học tập và làm theo tấm gương đạo đức Hồ Chí Minh năm 2015
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews2" href="http://www.binhthanh.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=Ho%e1%ba%a1t+%c4%91%e1%bb%99ng+%c4%90%e1%ba%a3ng&ItemID=6151&Mode=1" class="a-hot-link" title=".ExternalClass2B4230FA32A3425CBC803269FA5FFAAD .shape
{;}



Ngày 06/5/2015, Quận ủy Bình Thạnh tổ chức hội nghị giao ban chuyên đề " cách="" làm,="" kinh="" nghiệm="" trong="" việc="" phòng,="" chống="" biểu="" hiện="" suy="" thoái="" về="" tư="" tưởng="" chính="" trị,="" "tự="" diễn="" biến",="" "tự="" chuyển="" hóa"="" trong="" nội="" bộ="" đảng="" và="" phản="" bác="" các="" quan="" điểm="" sai="" trái.="" tham="" dự="" có="" đồng="" chí="" tô="" đại="" ..."="">
                                Giao ban chuyên đề cách làm, kinh nghiệm trong việc phòng, chống biểu hiện suy thoái về tư tưởng chính trị, “tự diễn biến”, “tự chuyển hóa” trong nội bộ Đảng và phản bác các quan điểm sai trái
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews3" href="http://www.binhthanh.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=H%e1%bb%8dc+t%e1%ba%adp+v%c3%a0+l%c3%a0m+theo+t%e1%ba%a5m+g%c6%b0%c6%a1ng+%c4%91%e1%ba%a1o+%c4%91%e1%bb%a9c+H%e1%bb%93+Ch%c3%ad+Minh&ItemID=6149&Mode=1" class="a-hot-link" title=".ExternalClass2BE724DEAC4B4AEAAE4DB4479CD301DE .shape
{;}




 




Ngày 09/5/2015, Đảng ủy Khối cơ quan UBND quận Bình Thạnh tổ chức hội thi kể chuyện tấm gương đạo đức Hồ Chí Minh chuyên đề năm 2015 " học="" tập="" và="" làm="" theo="" tấm="" gương="" đạo="" đức="" hồ="" chí="" minh="" về="" trung="" thực,="" trách="" nhiệm,="" gắn="" bó="" với="" nhân="" dân;="" đoàn="" kết="" xây="" dựng="" đảng="" trong="" ..."="">
                                Hội thi kể chuyện tấm gương đạo đức Hồ Chí Minh
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews4" href="http://www.binhthanh.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=An+ninh+qu%e1%bb%91c+ph%c3%b2ng&ItemID=6150&Mode=1" class="a-hot-link" title=".ExternalClass34EF77E452424D928E40F230B7D269D7 .shape
{;}




 




Ngày 12/5/2015, UBND quận Bình Thạnh tổ chức hội nghị tổng kết công tác giáo dục quốc phòng và an ninh năm 2014, triển khai nhiệm vụ năm 2015. 
Tham dự có đại diện Hội đồng Giáo dục quốc phòng - an ninh và lãnh đạo Bộ Tư lệnh thành phố; Quận ủy; Ban CHQS quận; Hội ...">
                                Tổng kết công tác giáo dục quốc phòng và an ninh năm 2014
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews5" href="http://www.binhthanh.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=Ho%e1%ba%a1t+%c4%91%e1%bb%99ng+%c4%90%e1%ba%a3ng&ItemID=6147&Mode=1" class="a-hot-link" title=".ExternalClass22857CEFA05E4205A5D5E2AD9657274D .shape
{;}

 
Ngày 14/5/2015 Quận ủy Bình Thạnh tổ chức lễ trao tặng Huy hiệu 55, 50, 40, 30 năm tuổi Đảng đợt 19/5/2015 cho 138 đảng viên.
Đợt này, có 14 đồng chí nhận Huy hiệu 55 năm tuổi Đảng, 30 đồng chí nhận Huy hiệu 50 năm tuổi Đảng, 36 đồng chí nhận Huy hiệu 40 năm tuổi Đảng và 58 đồng ...">
                                Lễ trao tặng Huy hiệu Đảng
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews6" href="http://www.binhthanh.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=H%e1%bb%8dc+t%e1%ba%adp+v%c3%a0+l%c3%a0m+theo+t%e1%ba%a5m+g%c6%b0%c6%a1ng+%c4%91%e1%ba%a1o+%c4%91%e1%bb%a9c+H%e1%bb%93+Ch%c3%ad+Minh&ItemID=6148&Mode=1" class="a-hot-link" title=".ExternalClass8A23950928B34794864346BEB82888B5 .shape
{;}

 
Ngày 14/5/2015 Ban Liên lạc Cựu tù chính trị - tù binh quận phối hợp Quận đoàn tổ chức họp mặt, giao lưu giữa cựu tù chính trị với đoàn viên thanh niên quận Bình Thạnh, với chủ đề " bác="" hồ="" trong="" trái="" tim="" tôi".="" dịp="" này,="" đại="" biểu="" giao="" lưu="" với="" các="" đồng="" chí="" đặng="" hồng="" nhựt,="" nguyễn="" thị="" ..."="">
                                Một số hoạt động sôi nổi, thiết thực, ý nghĩa trong dịp kỷ niệm 125 năm Ngày sinh Chủ tịch Hồ Chí Minh (19/5/1890 - 19/5/2015)
                            
                        
                    
                    
                
                
            
            
        
    


				
			
		
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveLink(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }




						
					

 
						
    
        
            
             
        
        
    

					

				
			
		
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=Ho%e1%ba%a1t+%c4%91%e1%bb%99ng+%c4%90%e1%ba%a3ng&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    Hoạt động Đảng
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Giao ban chuyên đề cách làm, kinh nghiệm trong việc phòng, chống biểu hiện suy thoái về tư tưởng chính trị, “tự diễn biến”, “tự chuyển hóa” trong nội bộ Đảng và phản bác các quan điểm sai trái
                            
                            
                        
                    
                    
                        
                            
                            
                                
                                    
                                        
                                            
                                        
                                    
                                
                            
                            
                            
                                

.ExternalClass2B4230FA32A3425CBC803269FA5FFAAD .shape
{;}



Ngày 06/5/2015, Quận ủy Bình Thạnh tổ chức hội nghị giao ban chuyên đề "cách làm, kinh nghiệm trong việc phòng, chống biểu hiện suy thoái về tư tưởng chính trị, "tự diễn biến", "tự chuyển hóa" trong nội bộ Đảng và phản bác các quan điểm sai trái. 
Tham dự có đồng chí Tô Đại ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Lễ trao tặng Huy hiệu Đảng
                            
                            
                            &nbsp;(28/05)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Tổng kết công tác phòng, chống tham nhũng năm 2014
                            
                            
                            &nbsp;(28/05)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Trao quyết định điều động, bổ nhiệm cán bộ
                            
                            
                            &nbsp;(28/05)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=Ho%e1%ba%a1t+%c4%91%c3%b4ng+%c4%90o%c3%a0n+th%e1%bb%83&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    Hoạt đông Đoàn thể
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Họp mặt kỷ niệm 20 năm Ngày thành lập Hội Người cao tuổi Việt Nam (10/5)
                            
                            
                        
                    
                    
                        
                            
                            
                                

.ExternalClass57DE4D8BA53B4CE3980141F838E3B6CE .shape
{;}



Ngày 07/5/2015, Ban Đại diện Hội Người cao tuổi (NCT) quận Bình Thạnh tổ chức họp mặt kỷ niệm 20 năm Ngày thành lập Hội Người cao tuổi (NCT) Việt Nam(10/5) và tổng kết phong trào thi đua yêu nước "Tuổi cao gương sáng" điển hình tiên tiến 5 năm (2010 - 2015). 
Đến dự, có các ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Kỷ niệm 74 năm Ngày truyền thống Người cao tuổi Việt Nam (06/6/1941 - 06/6/2015)
                            
                            
                            &nbsp;(28/05)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Đại hội Cháu ngoan Bác Hồ năm học 2014 - 2015
                            
                            
                            &nbsp;(28/05)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Hội trại truyền thống “Nguyễn Văn Trỗi” lần 1, năm 2015
                            
                            
                            &nbsp;(28/05)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=Ph%c3%a1t+tri%e1%bb%83n+Kinh+t%e1%ba%bf+-+X%c3%a3+h%e1%bb%99i&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    Phát triển Kinh tế - Xã hội
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Triển khai quyết định tuyển dụng công chức hành chính
                            
                            
                        
                    
                    
                        
                            
                            
                                

.ExternalClassCF6C23F556814D49866D94BB3F481F5C .shape
{;}



Ngày 07/5/2015, Phòng Nội vụ triển khai quyết định tuyển dụng công chức hành chính đối với thí sinh trúng tuyển trong kỳ thi tuyển công chức thành phố năm 2014.
Trong kỳ thi tuyển công chức thành phố năm 2014 quận có 23/29 thí sinh trúng tuyển được phân bổ về các đơn vị, phòng: ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Triển khai chương trình “Tháng khuyến mại”
                            
                            
                            &nbsp;(28/05)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Hướng dẫn điều tra doanh nghiệp
                            
                            
                            &nbsp;(28/05)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Hội nghị triển khai Thông tư liên tịch số 71/2014
                            
                            
                            &nbsp;(27/05)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=Qu%e1%ba%a3n+l%c3%bd+%c4%91%c3%b4+th%e1%bb%8b&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    Quản lý đô thị
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Chấn chỉnh, giải tỏa các điểm kinh doanh tự phát
                            
                            
                        
                    
                    
                        
                            
                            
                                
 
 
Ngày 04/5/2015, UBND quận Bình Thạnh triển khai kế hoạch chấn chỉnh, giải tỏa các điểm kinh doanh tự phát trên địa bàn quận trong năm 2015.
Đối với các khu vực đã thực hiện giải tỏa; cần tổ chức tuyên truyền vận động người dân không kinh doanh tự phát và các hộ dân trong khu vực không mua bán hàng hóa của những trường hợp kinh doanh tự ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Tập trung giải tỏa các điểm kinh doanh tự phát và lấn chiếm vỉa hè trên địa bàn Phường 19
                            
                            
                            &nbsp;(11/02)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Công bố công khai các đồ án quy hoạch trên địa bàn quận Bình Thạnh
                            
                            
                            &nbsp;(03/12)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Thành phố giám sát thực hiện chương trình giảm ngập nước
                            
                            
                            &nbsp;(22/10)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=+V%c4%83n+h%c3%b3a+-+X%c3%a3+h%e1%bb%99i&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                     Văn hóa - Xã hội
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Triển khai Đề án “Xóa mù chữ giai đoạn 2014 - 2020”
                            
                            
                        
                    
                    
                        
                            
                            
                                
 


Ngày 06/5/2015 UBND quận Bình Thạnh triển khai kế hoạch thực hiện Đề án "Xóa mù chữ giai đoạn 2014 - 2020" trên địa bàn quận.
Đối tượng của Đề án là những người trong độ tuổi từ 15 đến 60 chưa biết chữ, đã bỏ học lớp 4, 5 đang sinh sống, làm việc tại quận Bình Thạnh.
Đối với cá nhân, là người lao động trong độ tuổi phải hoàn thành ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Hội nghị triển khai, phổ biến Luật Công chứng
                            
                            
                            &nbsp;(28/05)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Tổ chức tiếp xúc cử tri quận với đại biểu Quốc hội Khóa XIII (đơn vị 6)
                            
                            
                            &nbsp;(28/05)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=An+ninh+qu%e1%bb%91c+ph%c3%b2ng&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    An ninh quốc phòng
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Tổng kết công tác giáo dục quốc phòng và an ninh năm 2014
                            
                            
                        
                    
                    
                        
                            
                            
                                
                                    
                                        
                                            
                                        
                                    
                                
                            
                            
                            
                                

.ExternalClass34EF77E452424D928E40F230B7D269D7 .shape
{;}




 




Ngày 12/5/2015, UBND quận Bình Thạnh tổ chức hội nghị tổng kết công tác giáo dục quốc phòng và an ninh năm 2014, triển khai nhiệm vụ năm 2015. 
Tham dự có đại diện Hội đồng Giáo dục quốc phòng - an ninh và lãnh đạo Bộ Tư lệnh thành phố; Quận ủy; Ban CHQS quận; Hội ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Tổng kết công tác tuyên truyền vận động, quản lý, sử dụng quỹ “Vì biển, đảo quê hương - Vì tuyến đầu Tổ quốc”
                            
                            
                            &nbsp;(28/05)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Lễ trao tặng Huân chương bảo vệ Tổ quốc và tuyên dương điển hình tiên tiến giai đoạn 2010 – 2014
                            
                            
                            &nbsp;(28/05)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	

	

											
										
										
									
		
	  							
								
								
									
										
								
								
	
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveLink(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }




						&nbsp;

    
        
            
            
            
        
    

					

 
						
    
        
            
             
        
        
    

					

				
			
		
	
		
			
				
					
    
    
    


    var jLeftMenu = jQuery.noConflict();
    jLeftMenu(function($) {

        $("div.ms-navheader").mouseover(function() {

            $(this).addClass("heading-hover");

        }).mouseout(function() {
            $(this).removeClass("heading-hover");
        });
        $("div.ms-navheader-icon").mouseover(function() {
            $(this).addClass("heading-hover");

        }).mouseout(function() {
            $(this).removeClass("heading-hover");
        });
        $("div.ms-navItem").mouseover(function() {
            $(this).addClass("ms-navItem-hover");
        }).mouseout(function() {
            $(this).removeClass("ms-navItem-hover");
        });
        $("div.ms-navItem-icon").mouseover(function() {
            $(this).addClass("ms-navItem-hover");
        }).mouseout(function() {
            $(this).removeClass("ms-navItem-hover");
        });
    });

    
   
 

						LỊCH L&#192;M VIỆCLịch tiếp c&#244;ng d&#226;nCHỈ ĐẠO ĐIỀU H&#192;NH&#221; kiến chỉ đạo của l&#227;nh đạoPhản hồi kiến nghị của tổ chức, c&#225; nh&#226;nTH&#212;NG TIN CẦN BIẾTTuyển dụng c&#244;ng chứcTh&#244;ng tin B&#225;o c&#225;o thống k&#234;Khen thưởng xử phạtTH&#212;NG TIN TUY&#202;N TRUYỀNPhổ biến chế độ ch&#237;nh s&#225;chHướng dẫn thực hiện ph&#225;p luậtG&#211;P &#221; TỔ CHỨC &amp; C&#193; NH&#194;NG&#243;p &#253; văn bản dự thảoG&#243;p &#253; văn bản quy phạm ph&#225;p luậtHỎI Đ&#193;PC&#212;NG B&#193;OỦY BAN NH&#194;N D&#194;N PHƯỜNGPhường 1Giới thiệu chungBộ m&#225;y tổ chứcTin tứcPhường 2Giới thiệu chungBộ m&#225;y tổ chứcTin tứcPhường 3Giới thiệu chungBộ m&#225;y tổ chứcTin tứcPhường 5Giới thiệuBộ m&#225;y tổ chứcTin tứcPhường 6Giới thiệuBộ m&#225;y tổ chứcTin tứcPhường 7Giới thiệuBộ m&#225;y tổ chứcTin tứcPhường 11Giới thiệuBộ m&#225;y tổ chứcTin tứcPhường 12Giới thiệuBộ m&#225;y tổ chứcTin tứcPhường 13Giới thiệuBộ m&#225;y tổ chứcTin tứcPhường 14Giới thiệuBộ m&#225;y tổ chứcTin tứcPhường 15Giới thiệuBộ m&#225;y tổ chứcTin tứcPhường 17Giới thiệuBộ m&#225;y tổ chứcTin tứcPhường 19Giới thiệuBộ m&#225;y tổ chứcTin tứcPhường 21Giới thiệuBộ m&#225;y tổ chứcTin tứcPhường 22Giới thiệuBộ m&#225;y tổ chứcTin tứcPhường 24Giới thiệuBộ m&#225;y tổ chứcTin tứcPhường 25Giới thiệuBộ m&#225;y tổ chứcTin tứcPhường 26Giới thiệuBộ m&#225;y tổ chứcTin tứcPhường 27Giới thiệuBộ m&#225;y tổ chứcTin tứcPhường 28Giới thiệuBộ m&#225;y tổ chứcTin tức
					



				
			
		
	
		
			
				
					









    var vbox = jQuery.noConflict();

        var width = ''194'' + "px";
        var height = ''194'' + "px";
        vbox(document).ready(function() {

        if (vbox("#ctl00_m_g_9ad75284_022f_494b_8dc4_54306f5bd72f_ctl00_listvideobox").children("li").length <= 1) {
            vbox("#ctl00_m_g_9ad75284_022f_494b_8dc4_54306f5bd72f_ctl00_listvideobox").parent().hide();
        }
        
        if (''True'' == ''True'') {

                vbox(''li.item-videobox'').live(''click'', function() {
                    var gt = vbox(this).attr(''linkVideo'');
                    var thumbnail = vbox(this).attr(''thumbnail'');
                    var videoplayer = vbox(this).attr(''videoplayer'');

                    jwplayer(videoplayer).setup({
                        flashplayer: "/_LAYOUTS/LacVietBio/UserControls/PhotoAlbum/images/player4.6.swf",
                        autostart: true,
                        file: gt,
                        image: thumbnail,
                        height: height,
                        width: width
                    });
                });
           
            
        }
    });
    





    
         
        
        
        
            
                
                
                    Không tiêu đề
             
        
    





    var linkFirstVideo = vbox("#ctl00_m_g_9ad75284_022f_494b_8dc4_54306f5bd72f_ctl00_listvideobox").children("li").eq(0).attr(''linkvideo'');
    var firstThumbnail = vbox("#ctl00_m_g_9ad75284_022f_494b_8dc4_54306f5bd72f_ctl00_listvideobox").children("li").eq(0).attr(''thumbnail'');
    jwplayer("ctl00_m_g_9ad75284_022f_494b_8dc4_54306f5bd72f_ctl00_dvnduymainvideo").setup({
        flashplayer: "/_LAYOUTS/LacVietBio/UserControls/PhotoAlbum/images/player4.6.swf",
        file: linkFirstVideo,
        image: firstThumbnail,
        height: height,
        width: width
    });



				
			
		
	

	

								
								
							
							
						
						
								
							
									
														
									
										
											TRANG CHỦ
											
											 LIÊN HỆ  
											 SITE MAP  	-->										
										
									
								
										QUAY VỀ TRANG ĐẦU
									-->
									
								
								 ỦY BAN NHÂN DÂN QUẬN BÌNH THẠNH, THÀNH PHỐ HỒ CHÍ MINH
								  	       Địa chỉ: 6 Phan Đăng Lưu, P.14, Quận Bình Thạnh 
								  	       Để biết thêm thông tin, xin vui lòng liên hệ:
										Ông Phan Văn Định - Chánh Văn phòng 
										Điện thoại: (08) 38412366 	E-mail: binhthanh@tphcm.gov.vn								  	 
									
																											
							
						
						
	
	
	
	


					
					
						
							

.ms-bodyareaframe {
	padding: 0px;
}


								

TD.ms-titleareaframe, .ms-pagetitleareaframe {
	height: 10px;
}
Div.ms-titleareaframe {
	height: 100%;
}
.ms-pagetitleareaframe table {
	background: none;
	height: 0px;
}


									
	
	
		 
			
				
					
						Trang web Này: UBND QUẬN B&#204;NH THẠNH

					
				
			
		
	


									
									
									
	


										
	
									
								
								
		
  
								
								
							


//<![CDATA[
var __wpmExportWarning=''This Web Part Page has been personalized. As a result, one or more Web Part properties may contain confidential information. Make sure the properties contain information that is safe for others to read. After exporting this Web Part, view properties in the Web Part description file (.WebPart) by using a text editor such as Microsoft Notepad.'';var __wpmCloseProviderWarning=''You are about to close this Web Part.  It is currently providing data to other Web Parts, and these connections will be deleted if this Web Part is closed.  To close this Web Part, click OK.  To keep this Web Part, click Cancel.'';var __wpmDeleteWarning=''You are about to permanently delete this Web Part.  Are you sure you want to do this?  To delete this Web Part, click OK.  To keep this Web Part, click Cancel.'';_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;//]]>

 

             
          
            function checkUrl(myArray) {

                
                if (!document.getElementById || !document.getElementsByTagName) return false;
                if (!document.getElementById(myArray)) return false;
                var links = document.getElementById(myArray);
                var node = findNode(links);
                
                if (node!=''-1'') {
                    var node_temp = node;
                    if (location.href.indexOf(''?'') != -1) {
                        var indexClass = jLeftMenu(node).parent().attr(''class'');
                       
                        if (indexClass.indexOf("ms-navItem") != -1) {

                            addClass(node_temp.parentNode, ''ms-navItem-selected'');
                            
                        }
                        if (indexClass.indexOf(''ms-navheader'') != -1) {

                            addClass(node_temp.parentNode, ''ms-navheader-selected'');
                            
                        }
                        while (node_temp.parentNode.id != myArray) {

                            if (node_temp.parentNode.id.split(''_'')[0].match(''ul'')) {

                                showMenu(node_temp.parentNode);
                            }
                            if (node_temp.parentNode.parentNode.id == myArray) {

                                if (node_temp.parentNode.id.split(''_'')[0].match(''li'')) {
                                    var temp = node_temp.parentNode.getElementsByTagName(''UL'');

                                    for (var i = 0; i < temp.length; i++) {

                                        if (node.parentNode.parentNode.id == temp[i].parentNode.id) {

                                            showMenu(temp[i]);
                                        }
                                    }
                                }
                            }

                            node_temp = node_temp.parentNode;
                        }
                    }
                    else {
                        var indexClass = $(node).parent().attr(''class'');
                        if (indexClass.indexOf(''ms-navItem'') != -1) {

                            addClass(node_temp.parentNode, ''ms-navItem-selected'');
                            
                        }
                        if (indexClass.indexOf(''ms-navheader'') != -1) {

                            addClass(node_temp.parentNode, ''ms-navheader-selected'');
                            
                        }
                        while (node_temp.parentNode.id != myArray) {

                            if (node_temp.parentNode.id.split(''_'')[0].match(''ul'')) {

                                showMenu(node_temp.parentNode);
                            }
                            if (node_temp.parentNode.parentNode.id ==myArray) {

                                if (node_temp.parentNode.id.split(''_'')[0].match(''li'')) {
                                    var temp = node_temp.parentNode.getElementsByTagName(''UL'');

                                    for (var i = 0; i < temp.length; i++) {

                                        if (node.parentNode.parentNode.id == temp[i].parentNode.id) {

                                            showMenu(temp[i]);
                                        }
                                    }
                                }
                            }
                            node_temp = node_temp.parentNode;
                        }
                    }
                }
            }
     
    
    function toggleMenu2param(node, link) {
        
        if (!document.getElementById) return false;
        if (!link) return false;
        hideallmenusamelevel(node);
        if (!node) location.href = link;

        var old_class;
        old_class=node.parentNode.className;
        if (node.className == ''classhide'') {
            node.className = ''classshow'';
            
            node.parentNode.className=old_class + '' seleted-leftmenu'';
        }
        else {
            node.className = ''classhide'';
          
            node.parentNode.className=old_class.split('' '')[0] ;
        }
    }
    function toggleMenu(node) {
     
        if (!document.getElementById) return false;
        hideallmenusamelevel(node);
        var old_class;
        old_class=node.parentNode.className;

        if (node.className == ''classhide'') {
            node.className = ''classshow'';
            
       
            
            node.parentNode.className= old_class + '' seleted-leftmenu'';

        }
        else {
            node.className = ''classhide'';
            //alert(old_class.split('' '')[0]);
            node.parentNode.className=old_class.split('' '')[0] ;
        }
    }
    function findNode(obj) {
        if (obj == null) return false;
        var elements = obj.getElementsByTagName(''a'');
        if (location.href.indexOf(''?'') != -1) {
            for (i = 0; i < elements.length; i++) {
                if (elements[i].href.indexOf(''?'') != -1) {
                    if (location.href.toLowerCase().match(elements[i].href.split(''?'')[0].toLowerCase()) && location.href.split(''?'')[1].toLowerCase() == elements[i].href.split(''?'')[1].toLowerCase() && elements[i].href.split(''?'')[1].length == location.href.split(''?'')[1].length) {

                        return elements[i];
                    }
                }
            }
        }
        else {
            for (i = 0; i < elements.length; i++) {
                if (location.href.toLowerCase().match(elements[i].href.toLowerCase())) {

                    return elements[i];
                }
            }
        }
        return ''-1'';
    }

    function showMenu(node) {
        if (!document.getElementById) return false;

        if (node.className == ''classhide'') {
            node.className = ''classshow'';
        }
        else {
            node.className = ''classshow'';
        }
    }
    function hideallmenusamelevel(currentnode) {
 
        var currentlevel = currentnode.id.split(''ul'')[1].split(''_'')[0];

        var links = currentnode.parentNode.parentNode.getElementsByTagName(''ul'');


        for (var i = 0; i < links.length; i++) {


            oneul = links[i];

            if (oneul) {

                oneid = oneul.id;
                onelevel = oneul.id.split(''ul'')[1].split(''_'')[0];
                if (onelevel >= currentlevel && oneul != currentnode) {
                    hideonemenu(oneul);
                }
            }
        }
    }
    function hideonemenu(node) {
        if (!document.getElementById) return false;
        if (!node) return false;

        node.className = ''classhide'';
    }
   function addClass(element, value) {

            if (!element.className) {
                element.className = value;
            } else {
                newClassName = element.className;
                newClassName += '' '';
                newClassName += value;
                element.className = newClassName;
            }
        }
        



checkUrl(''menuproduct_922476ce-5bd9-4fe8-99b9-890bdeb093e9'');


//<![CDATA[
_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;//]]>


checkUrl(''menuproduct_3dd15e84-9787-4c2b-82c7-8d91c8bfaf3c'');


//<![CDATA[
_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;//]]>


<!--
function S30311265_Submit() {GoSearch(null,''ctl00_PlaceHolderTopNavBar_g_a5dc9d03_7009_4e0a_a8bb_7882ec34d9b2_S30311265_InputKeywords'',null,true,false,null,null,null,null,''http:\u002f\u002fwww.binhthanh.hochiminhcity.gov.vn\u002fpages\u002fketquatk.aspx'', ''Trang web Này'',''Danh sách Này'', ''Thư mục Này'', ''Trang web Có liên quan'', ''\u002f_layouts\u002fOSSSearchResults.aspx'');}
// -->

// append an onload event handler
var S30311265__onload= document.body.onload;
if(typeof document.body.onload == ''function'')
{
 document.body.onload = function()
 {
S30311265__onload();        
  document.getElementById(''ctl00_PlaceHolderTopNavBar_g_a5dc9d03_7009_4e0a_a8bb_7882ec34d9b2_S30311265_InputKeywords'').name = ''InputKeywords'';
 }
}
else
{
 document.body.onload = function()
 {
  eval(S30311265__onload);        
  document.getElementById(''ctl00_PlaceHolderTopNavBar_g_a5dc9d03_7009_4e0a_a8bb_7882ec34d9b2_S30311265_InputKeywords'').name = ''InputKeywords'';
 }
}

function S30311265_OSBEK(event1) { 
if((event1.which == 10) || (event1.which == 13))
{   
S30311265_Submit();
}
}
// -->

<!--
function S6AE27B38_Submit() {GoSearch(null,''ctl00_PlaceHolderSearchArea_ctl01_S6AE27B38_InputKeywords'',null,true,true,''ctl00_PlaceHolderSearchArea_ctl01_SBScopesDDL'',''ctl00_PlaceHolderSearchArea_ctl01_ctl00'',null,null,''http:\u002f\u002fwww.binhthanh.hochiminhcity.gov.vn\u002f_layouts\u002fOSSSearchResults.aspx'', ''Trang web Này'',''Danh sách Này'', ''Thư mục Này'', ''Trang web Có liên quan'', ''\u002f_layouts\u002fOSSSearchResults.aspx'');}
// -->

// append an onload event handler
var S6AE27B38__onload= document.body.onload;
if(typeof document.body.onload == ''function'')
{
 document.body.onload = function()
 {
S6AE27B38__onload();        
  document.getElementById(''ctl00_PlaceHolderSearchArea_ctl01_S6AE27B38_InputKeywords'').name = ''InputKeywords'';
 }
}
else
{
 document.body.onload = function()
 {
  eval(S6AE27B38__onload);        
  document.getElementById(''ctl00_PlaceHolderSearchArea_ctl01_S6AE27B38_InputKeywords'').name = ''InputKeywords'';
 }
}

function S6AE27B38_OSBEK(event1) { 
if((event1.which == 10) || (event1.which == 13))
{   
S6AE27B38_Submit();
}
}
// -->




//<![CDATA[
Sys.Application.initialize();
//]]>', CAST(N'2015-06-18 00:58:56.763' AS DateTime), N'', 6)
INSERT [dbo].[TEXT_CONTENT] ([ContentID], [Content], [TimeCheck], [TextResult], [WebID]) VALUES (7, N'<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">


	
	UBND Quận Tân Bình - Trang chủ







	
	var _fV4UI = true;
	
	
// <![CDATA[
document.write('''');
document.write('''');
document.write('''');
// ]]>



	

	
		
	
	.s4-skipribbonshortcut { display:none; }



    
  























//<![CDATA[
var MSOWebPartPageFormName = ''aspnetForm'';
var g_presenceEnabled = true;
var g_wsaEnabled = false;
var g_wsaLCID = 1066;
var g_wsaSiteTemplateId = ''BLANKINTERNET#0'';
var g_wsaListTemplateId = 850;
var _fV4UI=true;var _spPageContextInfo = {webServerRelativeUrl: "\u002f", webLanguage: 1033, currentLanguage: 1066, webUIVersion:4,pageListId:"{966097ee-3c0e-45f5-aa19-d1c505e7a339}",pageItemId:6, alertsEnabled:true, siteServerRelativeUrl: "\u002f", allowSilverlightPrompt:''True''};document.onreadystatechange=fnRemoveAllStatus; function fnRemoveAllStatus(){removeAllStatus(true)};var _spWebPartComponents = new Object();var __cultureInfo = ''{"name":"vi-VN","numberFormat":{"CurrencyDecimalDigits":2,"CurrencyDecimalSeparator":",","IsReadOnly":true,"CurrencyGroupSizes":[3],"NumberGroupSizes":[3],"PercentGroupSizes":[3],"CurrencyGroupSeparator":".","CurrencySymbol":"₫","NaNSymbol":"NaN","CurrencyNegativePattern":8,"NumberNegativePattern":1,"PercentPositivePattern":0,"PercentNegativePattern":0,"NegativeInfinitySymbol":"-Infinity","NegativeSign":"-","NumberDecimalDigits":2,"NumberDecimalSeparator":",","NumberGroupSeparator":".","CurrencyPositivePattern":3,"PositiveInfinitySymbol":"Infinity","PositiveSign":"+","PercentDecimalDigits":2,"PercentDecimalSeparator":",","PercentGroupSeparator":".","PercentSymbol":"%","PerMilleSymbol":"‰","NativeDigits":["0","1","2","3","4","5","6","7","8","9"],"DigitSubstitution":1},"dateTimeFormat":{"AMDesignator":"SA","Calendar":{"MinSupportedDateTime":"\/Date(-62135596800000)\/","MaxSupportedDateTime":"\/Date(253402275599999)\/","AlgorithmType":1,"CalendarType":1,"Eras":[1],"TwoDigitYearMax":2029,"IsReadOnly":true},"DateSeparator":"/","FirstDayOfWeek":1,"CalendarWeekRule":0,"FullDateTimePattern":"dd MMMM yyyy h:mm:ss tt","LongDatePattern":"dd MMMM yyyy","LongTimePattern":"h:mm:ss tt","MonthDayPattern":"dd MMMM","PMDesignator":"CH","RFC1123Pattern":"ddd, dd MMM yyyy HH\u0027:\u0027mm\u0027:\u0027ss \u0027GMT\u0027","ShortDatePattern":"dd/MM/yyyy","ShortTimePattern":"h:mm tt","SortableDateTimePattern":"yyyy\u0027-\u0027MM\u0027-\u0027dd\u0027T\u0027HH\u0027:\u0027mm\u0027:\u0027ss","TimeSeparator":":","UniversalSortableDateTimePattern":"yyyy\u0027-\u0027MM\u0027-\u0027dd HH\u0027:\u0027mm\u0027:\u0027ss\u0027Z\u0027","YearMonthPattern":"MMMM yyyy","AbbreviatedDayNames":["CN","Hai","Ba","Tư","Năm","Sáu","Bảy"],"ShortestDayNames":["C","H","B","T","N","S","B"],"DayNames":["Chủ Nhật","Thứ Hai","Thứ Ba","Thứ Tư","Thứ Năm","Thứ Sáu","Thứ Bảy"],"AbbreviatedMonthNames":["Thg1","Thg2","Thg3","Thg4","Thg5","Thg6","Thg7","Thg8","Thg9","Thg10","Thg11","Thg12",""],"MonthNames":["Tháng Giêng","Tháng Hai","Tháng Ba","Tháng Tư","Tháng Năm","Tháng Sáu","Tháng Bảy","Tháng Tám","Tháng Chín","Tháng Mười","Tháng Mười Một","Tháng Mười Hai",""],"IsReadOnly":true,"NativeCalendarName":"Dương Lịch","AbbreviatedMonthGenitiveNames":["Thg1","Thg2","Thg3","Thg4","Thg5","Thg6","Thg7","Thg8","Thg9","Thg10","Thg11","Thg12",""],"MonthGenitiveNames":["Tháng Giêng","Tháng Hai","Tháng Ba","Tháng Tư","Tháng Năm","Tháng Sáu","Tháng Bảy","Tháng Tám","Tháng Chín","Tháng Mười","Tháng Mười Một","Tháng Mười Hai",""]}}'';//]]>




//<![CDATA[
if (typeof(DeferWebFormInitCallback) == ''function'') DeferWebFormInitCallback();//]]>



   

                
                
  

	
  

	
  

	
  

  
	
	
	
You may be trying to access this site from a secured browser on the server. Please enable scripts and reload this page.

	
	Bật chế độ truy nhập dễ dàng hơn


	
	Tắt chế độ truy nhập dễ dàng hơn


	
	Bỏ qua Lệnh Ruy-băng


	
	Bỏ qua nội dung chính




	
		
					   
					   
				
						
							
								Vị trí trang này là:
							
							
								
	quan triHomeTrangdefault

								
						
						
							
						
				
				
			
	

	 
	 
		 
			
Đăng nhập

			

// <![CDATA[
function OnSelectionChange(value)
{
	var today = new Date();
	var oneYear = new Date(today.getTime() + 365 * 24 * 60 * 60 * 1000);
	var url = window.location.href;
	document.cookie = "lcid=" + value + ";path=/;expires=" + oneYear.toGMTString();
	window.location.href = url;
}
// ]]>



		
	
	
	
		
			
		
	
			

//<![CDATA[
var g_commandUIHandlers = {"name":"CommandHandlers","attrs":{},"children":[]};
//]]>

	
	
	
	
			




	
	
		
	
				
			

	



		
			
				
					
						
							
								
									
										
											
										
									
									
										
											
												Home
											
										
										
										 
										
											
										
										
											
										
									
									
										
									
								
							
						
					
					
						
													
							
						
						
							
								
	




    var dmenu = jQuery.noConflict();
    dmenu(document).ready(function () {

        dmenu(''.main-level'').eq(0).addClass(''levelnext'');

        //Kiểm tra FullPath
        var CurrentPath = dmenu.trim(dmenu("div#PathFull").text());
        var CurrentHomeChild = dmenu("a.tmenu[href*=''" + CurrentPath + "'']");
        var CurrentHome = dmenu("li.parent").has(CurrentHomeChild).eq(0).addClass("LvSelected");

        //Kiểm tra Path
        if (CurrentHomeChild.text() == '''') {
            CurrentPath = dmenu.trim(dmenu("div#Path").text());
            CurrentHomeChild = dmenu("a.tmenu[href*=''" + CurrentPath + "'']");
            CurrentHome = dmenu("li.parent").has(CurrentHomeChild).eq(0).addClass("LvSelected");
        }

        //Kiểm tra Path2
        if (CurrentHomeChild.text() == '''') {
            CurrentPath = dmenu.trim(dmenu("div#Path2").text());
            CurrentHomeChild = dmenu("a.tmenu[href*=''" + CurrentPath + "'']");
            CurrentHome = dmenu("li.parent").has(CurrentHomeChild).eq(0).addClass("LvSelected");
        }

        // Không tìm thấy liên kết con nào trong menu.
        if (CurrentHomeChild.text() == '''') {
            CurrentHome = dmenu("li.parent").eq(0).addClass("LvSelected");
        }

        dmenu("#wrapper").mouseleave(function () {

            dmenu("ul#topnav > li > ul.children").css("display", "none");
            dmenu("li").removeClass("LvSelected");
            CurrentHome.addClass("LvSelected");

        });

        dmenu("li.parent").hover
        (
               function () {

                   dmenu("li").removeClass("LvSelected");
                   dmenu(this).addClass("LvSelected");
                   dmenu("ul#topnav").children("li").children("ul").css("display", "none");
                   dmenu(this).children().css("display", "block");
               }
               , function () { }

        );

    });
        



    //Pages/default.aspx/



    //Pages/default.aspx



    /Pages/default.aspx




    
        
        
            
                
                                          Trang chủ
            
            
        
        
        
            
                
                                          Giới thiệu
            
            
        
        
        
            
                
                                          Tin tức
            
            
        
        
        
            
                
                                          Dịch vụ công
            
            
        
        
        
            
                
                                          Văn bản pháp luật
            
            
        
        
        
            
                
                                          Hướng dẫn thủ tục
            
            
        
        
        
            
                
                                          Công trình phúc lợi
            
            
        
        
    



							
							
						
						
						

	
		
			Hỏi đáp chính sáchCâu hỏi thường gặpĐịa điểm tham quanQuy hoạch &amp; phát triển&nbsp;Dự án Khu C30 phường 6Ý kiến công dân
		
	


						
						

						
													
								
										
							
	
		 
			
				
					
				
			
		
	
	
										
							
							
						
							
						
				
			
				
					
					
	
					
						
								
	
	
		
			HomeCurrently selected
				Giới thiệu
					Testing
				Dịch vụ côngHệ thống văn bảnQuản trịThủ tục hành chínhTin tức
					Tin chuyên ngànhTin khác
				
			
		
	

	
								
						
					
					

					
				
				
			
			
			
			

	



				
			
			

		
		

	
		
			









    var jLeftMenu = jQuery.noConflict();
    jLeftMenu(function ($) {

        $(document).ready(function () {

            $(''div.ms-navheader'').each(function () {
                var childs = $(this).siblings(''ul'');
                if (childs.html() == null || childs.html() == "")
                    $(this).attr("onclick", "#");

            });

            var CurrentPath = jLeftMenu.trim(jLeftMenu("div#LeftMenuWebName").text());
            var CurrentHomeChild = jLeftMenu("a.leftsubmenu[href*=''" + CurrentPath + "'']");
            CurrentHomeChild.parent().parent().parent().addClass("classshow");

        });


        $("div.ms-navheader").mouseover(function () {

            $(this).addClass("heading-hover");

        }).mouseout(function () {
            $(this).removeClass("heading-hover");
        });
        $("div.ms-navheader-icon").mouseover(function () {
            $(this).addClass("heading-hover");

        }).mouseout(function () {
            $(this).removeClass("heading-hover");
        });
        $("div.ms-navItem").mouseover(function () {
            $(this).addClass("ms-navItem-hover");
        }).mouseout(function () {
            $(this).removeClass("ms-navItem-hover");
        });
        $("div.ms-navItem-icon").mouseover(function () {
            $(this).addClass("ms-navItem-hover");
        }).mouseout(function () {
            $(this).removeClass("ms-navItem-hover");
        });
    });

    


    var jMiddleMenu = jQuery.noConflict();
    jMiddleMenu(function ($) {

        $(''.middleMenu'').tabs();
    });


    /Pages/default.aspx


				
Giới thiệuTin tức sự kiệnDịch vụ c&#244;ngVăn bản ph&#225;p luậtHướng dẫn thủ tụcC&#244;ng tr&#236;nh ph&#250;c lợiHỏi đ&#225;p ch&#237;nh s&#225;chC&#226;u hỏi thường gặpĐịa điểm tham quanQuy hoạch &amp; ph&#225;t triểnBản đồ quy hoạch sử dụng đấtDự &#225;n TSN-BL-VDNQuyết định ph&#234; duyệtSơ đồ thiết kế đ&#244; thịBản vẽ hướng dẫn thiết kế đ&#244; thịDự &#225;n Khu C30 phường 6.&#221; kiến c&#244;ng d&#226;nVăn bản dự thảoDự &#225;n hạng mục đầu tưDự &#225;n đang chuẩn bị đầu tưDự &#225;n đang triển khaiDự &#225;n đ&#227; ho&#224;n tấtĐấu thầuMua sắm c&#244;ngTh&#244;ng tin cần biếtTuyển dụng c&#244;ng chứcB&#225;o c&#225;o thống k&#234;Chỉ đạo - điều h&#224;nh&#221; kiến chỉ đạo của l&#227;nh đạo&#221; kiến xử l&#253;, phản hồi y&#234;u cầu tổ chức - c&#225; nh&#226;nTh&#244;ng c&#225;o b&#225;o ch&#237;Người ph&#225;t ng&#244;nTh&#244;ng c&#225;o b&#225;o ch&#237;
			

		
	
			

	
		
			




    $(document).ready(function() {

        $(''#ctl00_g_e71031cd_dfde_4dbd_87e3_7bc106a13b54_ctl00_DropDownList1'').change(function() {
            var codelocation = $(this).val();

            // Mở ra một trang mới ngay tại trang hiện hành
            //window.location = codelocation;
            // Mở ra một tab mới kế bên trang hiện hành
            // window.open(codelocation)
            // Mở ra một popup
            //window.open(codelocation, "poop", "height=200,width=200,modal=yes,alwaysRaised=yes");

            if (codelocation != '''') {

                var expression = ''1'';
                switch (expression) {
                    case ''0'':
                        window.location = codelocation;
                        break;
                    case ''1'':
                        window.open(codelocation);
                        break;
                    case ''2'':
                        window.open(codelocation, "poop", "height=600,width=800,modal=yes,alwaysRaised=yes");
                        break;
                    default: alert(''Ko co gi het'');
                }
            }

        });
    });
    
    


    
        Liên kết web
    
    
        
				-------- Li&#234;n kết web --------
				Hồ ch&#237; minh city web
				UBND Quận 1
				Sở t&#224;i nguy&#234;n m&#244;i trường
				Sở quy hoạch kiến tr&#250;c
				UBND B&#236;nh Thạnh
				B&#225;o tuổi trẻ
				B&#225;o người lao động
				B&#225;o S&#224;i g&#242;n tiếp thị
				Tạp ch&#237; vi t&#237;nh PC Word
				Tạp ch&#237; Echip

			
    



		
	
	

	
		
			




    
        
            
                SỐ LƯỢT TRUY CẬP
        
        
            
                
                    
                        
				
					
                                
                                    
                                        
                                            
                                                1
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                6
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                7
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                8
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                1
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                4
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                4
                                        
                                    
                                
                            
				
			
                    
                
            
        
    


    


    
        
            
                SỐ LƯỢT ĐANG ONLINE
        
        
            
                
                    
                        
				
					
                                
                                    
                                        
                                            
                                                0
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                0
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                0
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                0
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                0
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                3
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                0
                                        
                                    
                                
                            
				
			
                    
                
            
        
    



		
	


	
		
			var i1 = 0;var i2 = 0;
                $(document).ready(function() {

                // Xử lý hiệu ứng khi click chuột phải để edit bài viết :: BEGIN
                $(".allowMenu").contextMenu({
                menu: ''myMenu''
                },
                function(action, el, pos) {

                if (action == "postbyword") {
                parent.location = ''/Hinh lien ket trang chu/Forms/Chinhsua.aspx'';
                }
                if (action == ''postbyweb'') {
                parent.location = '''';
                }
                if (action == ''editbyweb'') {
                parent.location = '''';
                }

                });
                });
                // Xử lý hiệu ứng khi click chuột phải để edit bài viết :: END
          Chỉnh sửa liên kết ảnh
      
        
          
            
              
            
          
        
      
       
      
		
	

		
		

		
	

	


	
	
	
						
						Chào mừng các bạn đến với Website Quận Tân Bình
						
						
		
		
		function tS(){ x=new Date(); x.setTime(x.getTime()); return x; }
		function y2(x){ x=(x<500)?x+1900:x; return String(x).substring(0,4) }
		function k(){var ap="AM";
		if ((tS().getHours())   > 11) { ap ="PM"; };return ap;}
		function dT(){ 
		
		if(fr==0){ fr=1; document.write(''''+eval(oT)+''''); } tP.innerText=eval(oT); setTimeout(''dT()'',1000); }
		var dN=new Array(''Chủ nhật'',''Thứ hai'',''Thứ ba'',''Thứ tư'',''Thứ năm'',''Thứ sáu'',''Thứ bảy''),mN=new Array(''1'',''2'',''3'',''4'',''5'',''6'',''7'',''8'',''9'',''10'',''11'',''12''),fr=0,oT="dN[tS().getDay()]+'', ''+tS().getDate()+''/''+mN[tS().getMonth()]+''/''+y2(tS().getYear())+''-''+tS().getHours()+'':''+tS().getMinutes()+'' ''+k()";
		
		dT();
	

					
	
	
		


			
	
		
			
				
					 


    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }

        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveLink(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }




						
					

 
						
    
        
            
						
             
						
        
        
    

					

				
			
		
	
		
			
				
					var a1 = 0;var a2 = 0
      
        var jUnionNews = jQuery.noConflict();
        var UnionNewsRefreshInterval2;
        function displayInfo(tabId) {

            if (document.getElementById) {
                for (i = 1; i <= 2; i++) {

                    var infoId = ''Tr'' + i;
                    var info = ''menu'' + i;

                    if (tabId == i) {

                        document.getElementById(infoId).style.display = '''';
                        if (document.getElementById(info) != null)
                            document.getElementById(info).className = ''tabselected'';

                    }
                    else {

                        document.getElementById(infoId).style.display = ''none'';
                        if (document.getElementById(info) != null)
                            document.getElementById(info).className = ''tabnormal'';
                    }
                }

                jUnionNews(".lv_union_table_menuheader tr td:first").toggleClass("lv_menuheader_first");
                jUnionNews(".lv_union_table_menuheader tr td:last").toggleClass("lv_menuheader_last");
            }
        }
        function FirstDisplayInfo() {

            if ("True" == ''true'' || "True" == ''True'') {

                displayInfo(''1'');

            }else
                if ("True" == ''true'' || "True" == ''True'') {

                displayInfo(''2'');
            }
        }
        function DoAction(webid, listid, numrow, linkview, action, mode) {

            var dataString = "{''WebID'': ''" + webid + "'', ''ListID'': ''" + listid + "'', ''NumRow'':''" + numrow + "'',''LinkView'':''" + linkview + "'',''Action'':''" + action + "'',''mode'':''" + mode + "'',''MyThumbnail'':''false''}";
            jUnionNews(".union_image_thumb ul li").removeClass(''active'');
            var ajax_load = "Loading....";


            //jUnionNews("#UnionNews_main_mode2").html(ajax_load);
            jUnionNews.ajax({
                type: "POST",
                url: ''/_CONTROLTEMPLATES/LacViet.CMS.UnionNews/UnionNewsUserControl.ascx/Load_UnionNews'',
                data: dataString,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                cache: false,
                beforeSend: function() {

                },
                success: function(result) {
            if (action == ''1'') {
                        jUnionNews("#divNew1").eq(0).html(result.d).fadeIn(200);
                        jUnionNews("#divNew1 ul li:first").addClass(''active'');
                        jUnionNews("#divNew1 ul li:first").addClass(''firstflag'');
                    }if (action == ''2'') {
                        jUnionNews("#divNew2").eq(0).html(result.d).fadeIn(200);
                        jUnionNews("#divNew2 ul li:first").addClass(''active'');
                        jUnionNews("#divNew2 ul li:first").addClass(''firstflag'');
                    }
                },
                error: function() {
                }
            });
        }
        function UnionSwitchMode2(bPrev) {
            var id = TabSelected();
            var idUnion_image_thumb;

            if (id == ''menu1'')
                idUnion_image_thumb = ''divNew1'';if (id == ''menu2'')
                idUnion_image_thumb = ''divNew2'';

            var jQueryActive = jUnionNews("#" + idUnion_image_thumb + '' .active'');

            var jQueryNext;

            if (bPrev == ''true'' && bPrev != undefined)
                jQueryNext = jQueryActive.prev().length ? jQueryActive.prev() : jUnionNews("#" + idUnion_image_thumb + '' ul li:last'');
            else {
                jQueryNext = jQueryActive.next().length ? jQueryActive.next() : jUnionNews("#" + idUnion_image_thumb + '' ul li:first'');

            }
            //animation
            var imgAlt = jQueryNext.find(''img'').attr("alt"); //Get Alt Tag of Image
            var imgTitle = jQueryNext.find(''img'').attr("src"); //Get Main Image URL
            var imgDesc = jQueryNext.find(''.Union_block h2'').html(); 	//Get HTML of block

            var imgDescHeight = jUnionNews(".union_main_image").find(''.Union_block'').height(); //Calculate height of block

            jUnionNews(".union_main_image .Union_block").animate({ opacity: 0, marginBottom: -imgDescHeight }, 0, function() {


                jQueryActive.removeClass(''active'')
                jQueryNext.addClass(''active'');
                jUnionNews(".union_main_image .Union_block h2").html(imgDesc);
                jUnionNews(".union_main_image .Union_block").animate({ opacity: 0.7, marginBottom: "0" }, 0);
                jUnionNews(".union_main_image img").attr({ src: imgTitle, alt: imgAlt });

                if (jUnionNews(".union_main_image a.collapse").is(".show")) {
                    jUnionNews(".union_main_image a.collapse").toggleClass("show");
                }
            });

        }
        function TabSelected() {
            return jUnionNews(".lv_union_table_menuheader .tabselected").attr("id");
        }
        jUnionNews(document).ready(function($) {

            $(".union_image_thumb ul li:first").addClass(''firstflag'');

            $(".union_main_image .Union_desc").show(); //Show Banner
            $(".union_main_image .Union_block").animate({ opacity: 0.7 }, 1); //Set Opacity

            //Click and Hover events for thumbnail list
            FirstDisplayInfo();

            $(".union_image_thumb ul li:first").addClass(''active'');
            UnionNewsRefreshInterval2 = setInterval("UnionSwitchMode2()", "4000");

            $(".union_image_thumb ul")
	    .live(''mouseenter'', function() {

	        clearInterval(UnionNewsRefreshInterval2);
	    })
	    .live(''mouseleave'', function() {
	        UnionNewsRefreshInterval2 = setInterval("UnionSwitchMode2()", "4000");

	    });

            $(".union_image_thumb ul li")
	    .click(function() {


	    })
	    .live(''mouseenter'', function() {

	        $(this).addClass(''hover'');
	        var imgAlt = $(this).find(''img'').attr("alt"); //Get Alt Tag of Image
	        var imgTitle = $(this).find(''img'').attr("src"); //Get Main Image URL
	        var imgDesc = $(this).find(''.Union_block h2'').html(); 	//Get HTML of block
	        //var imgOverDesc = $(this).find(''.Union_block p'').html();

	        var imgDescHeight = $(".union_main_image").find(''.Union_block h2'').height(); //Calculate height of block

	        if ($(".Union_desc a.collapse").is(".show")) {  //If it''s already active, then...

	            //View an khi nhấn -
	            //$(".main_image .block").html(imgDesc);
	            //imgDescHeight = $(".main_image .block").height();
	            //$(".main_image .block").css({ marginBottom: -imgDescHeight});
	            //$(".main_image img").attr({ src: imgTitle , alt: imgAlt});

	            //View hien khi hover

	            $(".union_main_image .Union_block").animate({ opacity: 0, marginBottom: -imgDescHeight }, 0, function() {
	                $(".union_main_image .Union_block h2").html(imgDesc);
	                $(".union_main_image .Union_block").animate({ opacity: 0.7, marginBottom: "0" }, 0);
	                $(".union_main_image img").attr({ src: imgTitle, alt: imgAlt });
	                $("a.collapse").toggleClass("show");
	                //$(".itemDesc").html(imgOverDesc);
	            });

	        } else {

	            //Animate the Teaser
	            $(".union_main_image .Union_block").animate({ opacity: 0, marginBottom: -imgDescHeight }, 0, function() {
	                $(".union_main_image .Union_block h2").html(imgDesc);
	                $(".union_main_image .Union_block").animate({ opacity: 0.7, marginBottom: "0" }, 0);
	                $(".union_main_image img").attr({ src: imgTitle, alt: imgAlt });
	                // $(".itemDesc").html(imgOverDesc);
	            });
	        }


	    })
	    .live("mouseleave", function() {


	        $(this).removeClass(''hover'');
	        $(".union_main_image .Union_block").stop(true, true);


	    });
            //Toggle button close
            $(".union_main_image a.collapse").click(function() {
                var imgDescHeight = $(".union_main_image").find(''.Union_block'').height();
                if ($(this).is(".show")) {
                    //alert(2);
                    $(".union_main_image .Union_block").animate({ opacity: 0.7, marginBottom: "0" }, 0, function() {

                    });
                } else {
                    //alert(1);
                    $(".union_main_image .Union_block").animate({ opacity: 0, marginBottom: -imgDescHeight }, 0, function() {

                    });
                }
                $(".union_main_image a.collapse").toggleClass("show");
            });

            $(''#menu1'').click(function() {

                refreshUnionIntervalId = DoAction(''403801ec-b85b-41d6-993c-048fb0c0699a'', ''369536af-0833-44d1-be52-02564ab70a9c'', ''6'', '''', ''1'', ''2'');
            });
            $(''#menu2'').click(function() {

                refreshUnionIntervalId = DoAction(''403801ec-b85b-41d6-993c-048fb0c0699a'', ''369536af-0833-44d1-be52-02564ab70a9c'', ''6'', '''', ''2'', ''2'');
            });
            $(''#Union_bttNext'').click(function() {

                UnionSwitchMode2();

            })
         .hover(function() {
             clearInterval(UnionNewsRefreshInterval2);
         }, function() {
             UnionNewsRefreshInterval2 = setInterval("UnionSwitchMode2()", "4000");
         });

            $(''#Union_bttPrevious'').click(function() {
                UnionSwitchMode2(''true'');
            })
         .hover(function() {
             clearInterval(UnionNewsRefreshInterval2);
         }, function() {
             UnionNewsRefreshInterval2 = setInterval("UnionSwitchMode2()", "4000");
         });
        });
     
ĐóngLỊCH  LÀM  VIỆC CỦA  BAN THƯỜNG  VỤ QUẬN  ỦY  VÀ THƯỜNG  TRỰC  ỦY  BAN  NHÂN  DÂN  QUẬN TÂN  BÌNH  Tuần 23, năm 2015 (từ ngày 08/06/2015 đến 13/06//2015)Tin nổi bậtTin mới nhấtHội nghị phổ biến Luật Công chứng và Nghị định 23/2015/NĐ-CP về cấp bản sao từ sổ gốc, chứng thực bản sao từ bản chính, chứng thực chữ ký và chứng thực hợp đồng giao dịch.LUẬN CỨ PHÊ PHÁN QUAN ĐIỂM CHO RẰNG: “VIỆT NAM LỰA CHỌN CON ĐƯỜNG ĐỘC LẬP DÂN TỘC GẮN LIỀN VỚI CHỦ NGHĨA XÃ HỘI LÀ SAI LẦM LỊCH SỬ; NHÀ NƯỚC NÀO, CHẾ ĐỘ NÀO CŨNG ĐƯỢC MIỄN LÀ DÂN GIÀU, NƯỚC MẠNH”Thông báo nội dung liên quan giải quyết các hồ sơ pháp lý về môi trườngQuyết định về việc bãi bỏ văn bảnLỊCH  LÀM  VIỆC CỦA  BAN THƯỜNG  VỤ QUẬN  ỦY  VÀ THƯỜNG  TRỰC  ỦY  BAN  NHÂN  DÂN  QUẬN TÂN  BÌNH  Tuần 23, năm 2015 (từ ngày 08/06/2015 đến 13/06//2015)Thông báo mời thầuĐăng ký thông tin thuê bao di động trả trước đúng quy định để được bảo vệ quyền lợi khi sử dụngPhối hợp tổ chức hưởng ứng Tuần lễ Quốc gia không thuốc lá 25-31/5 và ngày Thế giới không thuốc lá 31/05 năm 2015Liên hoan Thể dục cổ động các Nhà Thiếu nhi toàn thành năm 2015Hội nghị phổ biến Luật Công chứng và Nghị định 23/2015/NĐ-CP về cấp bản sao từ sổ gốc, chứng thực bản sao từ bản chính, chứng thực chữ ký và chứng thực hợp đồng giao dịch.LUẬN CỨ PHÊ PHÁN QUAN ĐIỂM CHO RẰNG: “VIỆT NAM LỰA CHỌN CON ĐƯỜNG ĐỘC LẬP DÂN TỘC GẮN LIỀN VỚI CHỦ NGHĨA XÃ HỘI LÀ SAI LẦM LỊCH SỬ; NHÀ NƯỚC NÀO, CHẾ ĐỘ NÀO CŨNG ĐƯỢC MIỄN LÀ DÂN GIÀU, NƯỚC MẠNH”LỊCH  LÀM  VIỆC CỦA  BAN THƯỜNG  VỤ QUẬN  ỦY  VÀ THƯỜNG  TRỰC  ỦY  BAN  NHÂN  DÂN  QUẬN TÂN  BÌNH  Tuần 23, năm 2015 (từ ngày 08/06/2015 đến 13/06//2015)
				
			
		
	
		
			
				
					 


    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }

        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveLink(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }




						


					

 
						
    
        
            
						
             
						
        
        
    

					

				
			
		
	
		
			
				









    
        
            
       var dtabmenu = jQuery.noConflict();
       dtabmenu(document).ready(function () {
           dtabmenu("#ctl00_m_g_4adf20e6_6d4e_4b28_a982_202fb6cd8803_ctl00_tabs").tabs({
               show: function (event, ui) {

                   var selected = dtabmenu(this).tabs(''option'', ''selected'');
                   var blogguid = dtabmenu(ui.panel).attr(''blogguid'');
                   var objthis = dtabmenu(this).find("#tabs-ctl00_m_g_4adf20e6_6d4e_4b28_a982_202fb6cd8803_ctl00_tabs" + selected);

                   var categoryname = dtabmenu(ui.panel).attr(''categoryname'');
                   var categoryid = dtabmenu(ui.panel).attr(''categoryid'');
                   var categorytitle = dtabmenu(ui.panel).attr(''categorytitle'');
                   var categorylink = dtabmenu(ui.panel).attr(''categorylink'');
                   var hasdata = dtabmenu(ui.panel).attr(''hasdata'');

                   var soapmessage =
                ''\' + N'
                  \' + N'
                    \' + N'
                      topnews\' + N'
                      /tintuc/tinchuyennganh/Lists/Posts/Post.aspx\' + N'
                      '' + blogguid + ''\' + N'
                      '' + categoryname + ''\' + N'
                      '' + categoryid + ''\' + N'
                      1\' + N'
                      2\' + N'
                      '' + categorytitle + ''\' + N'
                      '' + categorylink + ''\' + N'
                    \' + N'
                  \' + N'
                '';


                   // Call Ajax here

                   if (hasdata == "no") {

                       dataString = "modeldata=topnews&formdetailview=/tintuc/tinchuyennganh/Lists/Posts/Post.aspx&blogguid=" + blogguid + "&categoryname=" + categoryname + "&categoryid=" +
                        categoryid + "&numthumbnail=1&numtitle=2&categorytitle=" + categorytitle + "&categorylink=" + categorylink;

                       dtabmenu.ajax({
                           type: "POST",
                           url: ''http://tanbinh.hochiminhcity.gov.vn/_layouts/lacvietbio/webservices/TabNewsServices.asmx?op=GetDataByCategory'',
                           data: soapmessage,
                           dataType: "xml",
                           contentType: "text/xml; charset=\"utf-8\"",
                           cache: false,
                           beforeSend: function () {

                               //nothing
                           },
                           success: function (xml) {

                               var htmlThumbnailItem0 = "";
                               var htmlThumbnailItem = "";
                               var htmlTitleItem = "";
                               var htmlOtherTab = "";
                               var dem = 0;
                               var rss = dtabmenu(xml).find(''Category'').attr(''RSS'');
                               var viewnext = dtabmenu(xml).find(''Category'').attr(''VIEWNEXT'');

                               if (dtabmenu.trim(dtabmenu(xml).find(''Category'').text()) == '''')
                                   return;

                               if (''True'' == ''True'') {

                                   htmlOtherTab += "" +
                                                    "RSS" +
                                                "";
                               }
                               if (''True'' == ''True'') {

                                   htmlOtherTab += "" +
                                                   "Xem tiếp" +
                                                "";
                               }

                               dtabmenu(xml).find(''Item'').each(function () {


                                   var title = dtabmenu(this).find(''Title'').text();
				   var d=new Date(dtabmenu(this).find(''PublishedDate'').text());
                                   var publisheddate = ''('' + d.getDate() + ''/'' + (d.getMonth() + 1) + ''/'' + d.getFullYear() + '')'';
                                   var itemimg = dtabmenu(this).find(''ItemImg'').text();
                                   var itemshortcontent = dtabmenu(this).find(''ItemShortContent'').text();
                                   var url = dtabmenu(this).find(''Url'').text();

                                   if (''True'' == ''False'') {
                                       publisheddate = "";
                                   }


                                   if (dem < ''1'') {
                                       if (dem == 0) {
                                           htmlThumbnailItem0 += "" +
                                                            "" +
                                                                "" +
                                                                    "" +
                                                                "" +
                                                            "" +
                                                            "" +
                                                                "" +
                                                                    "" + title + publisheddate + " " +
                                                                "" +
                                                                "" +
                                                                   itemshortcontent +
                                                                "" +
                                                            "" +
                                                        "";
                                       }
                                       else {
                                           htmlThumbnailItem += "" +
                                                            "" +
                                                                "" +
                                                                    "" +
                                                                "" +
                                                            "" +
                                                            "" +
                                                                "" +
                                                                    "" + title + publisheddate + " " +
                                                                "" +
                                                                "" +
                                                                   itemshortcontent +
                                                                "" +
                                                            "" +
                                                        "";

                                       }
                                   }

                                   else {

                                       htmlTitleItem += "" +
                                                            "" +
                                                                "" + title + "" +
                                                            "" +
                                                            "" +
                                                               publisheddate +
                                                            "" +
                                                        "";
                                   }

                                   dem++;

                               });


                               objthis.find(".news-tab").prepend(htmlThumbnailItem0);
                               objthis.find(".news-tab-thumb").prepend(htmlThumbnailItem);
                               objthis.find(".news-tab-li").html(htmlTitleItem);
                               objthis.find(".news-tab-other").html(htmlOtherTab);
                               dtabmenu(ui.panel).attr(''hasdata'', ''yes'');
                               dtabmenu(".lacviet-tabsnews").show();

                           },
                           error: function (xhr, ajaxOptions, thrownError) {
                               //alert(xhr.responseText);
                               //alert(thrownError);
                           }
                       });
                   }
               }
           });
       });


   


    
        
            
                    
                            Văn hóa thông tin và thể dục thể thao
            
                    
                            Giáo dục
            
        
        
            
                
                        
                    
                        
                            
                            
                            
                            
                        
                    
                    
                
        
            
                
                        
                    
                        
                            
                            
                            
                            
                        
                    
                    
                
        






			
		
	
		
			
				









    
        
            
       var dtabmenu = jQuery.noConflict();
       dtabmenu(document).ready(function () {
           dtabmenu("#ctl00_m_g_190ba712_dd75_48fc_8d1b_b511735a777e_ctl00_tabs").tabs({
               show: function (event, ui) {

                   var selected = dtabmenu(this).tabs(''option'', ''selected'');
                   var blogguid = dtabmenu(ui.panel).attr(''blogguid'');
                   var objthis = dtabmenu(this).find("#tabs-ctl00_m_g_190ba712_dd75_48fc_8d1b_b511735a777e_ctl00_tabs" + selected);

                   var categoryname = dtabmenu(ui.panel).attr(''categoryname'');
                   var categoryid = dtabmenu(ui.panel).attr(''categoryid'');
                   var categorytitle = dtabmenu(ui.panel).attr(''categorytitle'');
                   var categorylink = dtabmenu(ui.panel).attr(''categorylink'');
                   var hasdata = dtabmenu(ui.panel).attr(''hasdata'');

                   var soapmessage =
                ''\' + N'
                  \' + N'
                    \' + N'
                      topnews\' + N'
                      /tintuc/tinchuyennganh/Lists/Posts/Post.aspx\' + N'
                      '' + blogguid + ''\' + N'
                      '' + categoryname + ''\' + N'
                      '' + categoryid + ''\' + N'
                      1\' + N'
                      5\' + N'
                      '' + categorytitle + ''\' + N'
                      '' + categorylink + ''\' + N'
                    \' + N'
                  \' + N'
                '';


                   // Call Ajax here

                   if (hasdata == "no") {

                       dataString = "modeldata=topnews&formdetailview=/tintuc/tinchuyennganh/Lists/Posts/Post.aspx&blogguid=" + blogguid + "&categoryname=" + categoryname + "&categoryid=" +
                        categoryid + "&numthumbnail=1&numtitle=5&categorytitle=" + categorytitle + "&categorylink=" + categorylink;

                       dtabmenu.ajax({
                           type: "POST",
                           url: ''http://tanbinh.hochiminhcity.gov.vn/_layouts/lacvietbio/webservices/TabNewsServices.asmx?op=GetDataByCategory'',
                           data: soapmessage,
                           dataType: "xml",
                           contentType: "text/xml; charset=\"utf-8\"",
                           cache: false,
                           beforeSend: function () {

                               //nothing
                           },
                           success: function (xml) {

                               var htmlThumbnailItem0 = "";
                               var htmlThumbnailItem = "";
                               var htmlTitleItem = "";
                               var htmlOtherTab = "";
                               var dem = 0;
                               var rss = dtabmenu(xml).find(''Category'').attr(''RSS'');
                               var viewnext = dtabmenu(xml).find(''Category'').attr(''VIEWNEXT'');

                               if (dtabmenu.trim(dtabmenu(xml).find(''Category'').text()) == '''')
                                   return;

                               if (''True'' == ''True'') {

                                   htmlOtherTab += "" +
                                                    "RSS" +
                                                "";
                               }
                               if (''True'' == ''True'') {

                                   htmlOtherTab += "" +
                                                   "Xem tiếp" +
                                                "";
                               }

                               dtabmenu(xml).find(''Item'').each(function () {


                                   var title = dtabmenu(this).find(''Title'').text();
				   var d=new Date(dtabmenu(this).find(''PublishedDate'').text());
                                   var publisheddate = ''('' + d.getDate() + ''/'' + (d.getMonth() + 1) + ''/'' + d.getFullYear() + '')'';
                                   var itemimg = dtabmenu(this).find(''ItemImg'').text();
                                   var itemshortcontent = dtabmenu(this).find(''ItemShortContent'').text();
                                   var url = dtabmenu(this).find(''Url'').text();

                                   if (''True'' == ''False'') {
                                       publisheddate = "";
                                   }


                                   if (dem < ''1'') {
                                       if (dem == 0) {
                                           htmlThumbnailItem0 += "" +
                                                            "" +
                                                                "" +
                                                                    "" +
                                                                "" +
                                                            "" +
                                                            "" +
                                                                "" +
                                                                    "" + title + publisheddate + " " +
                                                                "" +
                                                                "" +
                                                                   itemshortcontent +
                                                                "" +
                                                            "" +
                                                        "";
                                       }
                                       else {
                                           htmlThumbnailItem += "" +
                                                            "" +
                                                                "" +
                                                                    "" +
                                                                "" +
                                                            "" +
                                                            "" +
                                                                "" +
                                                                    "" + title + publisheddate + " " +
                                                                "" +
                                                                "" +
                                                                   itemshortcontent +
                                                                "" +
                                                            "" +
                                                        "";

                                       }
                                   }

                                   else {

                                       htmlTitleItem += "" +
                                                            "" +
                                                                "" + title + "" +
                                                            "" +
                                                            "" +
                                                               publisheddate +
                                                            "" +
                                                        "";
                                   }

                                   dem++;

                               });


                               objthis.find(".news-tab").prepend(htmlThumbnailItem0);
                               objthis.find(".news-tab-thumb").prepend(htmlThumbnailItem);
                               objthis.find(".news-tab-li").html(htmlTitleItem);
                               objthis.find(".news-tab-other").html(htmlOtherTab);
                               dtabmenu(ui.panel).attr(''hasdata'', ''yes'');
                               dtabmenu(".lacviet-tabsnews").show();

                           },
                           error: function (xhr, ajaxOptions, thrownError) {
                               //alert(xhr.responseText);
                               //alert(thrownError);
                           }
                       });
                   }
               }
           });
       });


   


    
        
            
                    
                            Quản lý đô thị - Tài nguyên môi trường
            
                    
                            Kinh tế
            
        
        
            
                
                        
                    
                        
                            
                            
                            
                            
                        
                    
                    
                
        
            
                
                        
                    
                        
                            
                            
                            
                            
                        
                    
                    
                
        






			
		
	
		
			
				









    
        
            
       var dtabmenu = jQuery.noConflict();
       dtabmenu(document).ready(function () {
           dtabmenu("#ctl00_m_g_6727597b_48a2_4193_af9d_68af35d37ecd_ctl00_tabs").tabs({
               show: function (event, ui) {

                   var selected = dtabmenu(this).tabs(''option'', ''selected'');
                   var blogguid = dtabmenu(ui.panel).attr(''blogguid'');
                   var objthis = dtabmenu(this).find("#tabs-ctl00_m_g_6727597b_48a2_4193_af9d_68af35d37ecd_ctl00_tabs" + selected);

                   var categoryname = dtabmenu(ui.panel).attr(''categoryname'');
                   var categoryid = dtabmenu(ui.panel).attr(''categoryid'');
                   var categorytitle = dtabmenu(ui.panel).attr(''categorytitle'');
                   var categorylink = dtabmenu(ui.panel).attr(''categorylink'');
                   var hasdata = dtabmenu(ui.panel).attr(''hasdata'');

                   var soapmessage =
                ''\' + N'
                  \' + N'
                    \' + N'
                      topnews\' + N'
                      /tintuc/tinchuyennganh/Lists/Posts/Post.aspx\' + N'
                      '' + blogguid + ''\' + N'
                      '' + categoryname + ''\' + N'
                      '' + categoryid + ''\' + N'
                      1\' + N'
                      5\' + N'
                      '' + categorytitle + ''\' + N'
                      '' + categorylink + ''\' + N'
                    \' + N'
                  \' + N'
                '';


                   // Call Ajax here

                   if (hasdata == "no") {

                       dataString = "modeldata=topnews&formdetailview=/tintuc/tinchuyennganh/Lists/Posts/Post.aspx&blogguid=" + blogguid + "&categoryname=" + categoryname + "&categoryid=" +
                        categoryid + "&numthumbnail=1&numtitle=5&categorytitle=" + categorytitle + "&categorylink=" + categorylink;

                       dtabmenu.ajax({
                           type: "POST",
                           url: ''http://tanbinh.hochiminhcity.gov.vn/_layouts/lacvietbio/webservices/TabNewsServices.asmx?op=GetDataByCategory'',
                           data: soapmessage,
                           dataType: "xml",
                           contentType: "text/xml; charset=\"utf-8\"",
                           cache: false,
                           beforeSend: function () {

                               //nothing
                           },
                           success: function (xml) {

                               var htmlThumbnailItem0 = "";
                               var htmlThumbnailItem = "";
                               var htmlTitleItem = "";
                               var htmlOtherTab = "";
                               var dem = 0;
                               var rss = dtabmenu(xml).find(''Category'').attr(''RSS'');
                               var viewnext = dtabmenu(xml).find(''Category'').attr(''VIEWNEXT'');

                               if (dtabmenu.trim(dtabmenu(xml).find(''Category'').text()) == '''')
                                   return;

                               if (''True'' == ''True'') {

                                   htmlOtherTab += "" +
                                                    "RSS" +
                                                "";
                               }
                               if (''True'' == ''True'') {

                                   htmlOtherTab += "" +
                                                   "Xem tiếp" +
                                                "";
                               }

                               dtabmenu(xml).find(''Item'').each(function () {


                                   var title = dtabmenu(this).find(''Title'').text();
				   var d=new Date(dtabmenu(this).find(''PublishedDate'').text());
                                   var publisheddate = ''('' + d.getDate() + ''/'' + (d.getMonth() + 1) + ''/'' + d.getFullYear() + '')'';
                                   var itemimg = dtabmenu(this).find(''ItemImg'').text();
                                   var itemshortcontent = dtabmenu(this).find(''ItemShortContent'').text();
                                   var url = dtabmenu(this).find(''Url'').text();

                                   if (''True'' == ''False'') {
                                       publisheddate = "";
                                   }


                                   if (dem < ''1'') {
                                       if (dem == 0) {
                                           htmlThumbnailItem0 += "" +
                                                            "" +
                                                                "" +
                                                                    "" +
                                                                "" +
                                                            "" +
                                                            "" +
                                                                "" +
                                                                    "" + title + publisheddate + " " +
                                                                "" +
                                                                "" +
                                                                   itemshortcontent +
                                                                "" +
                                                            "" +
                                                        "";
                                       }
                                       else {
                                           htmlThumbnailItem += "" +
                                                            "" +
                                                                "" +
                                                                    "" +
                                                                "" +
                                                            "" +
                                                            "" +
                                                                "" +
                                                                    "" + title + publisheddate + " " +
                                                                "" +
                                                                "" +
                                                                   itemshortcontent +
                                                                "" +
                                                            "" +
                                                        "";

                                       }
                                   }

                                   else {

                                       htmlTitleItem += "" +
                                                            "" +
                                                                "" + title + "" +
                                                            "" +
                                                            "" +
                                                               publisheddate +
                                                            "" +
                                                        "";
                                   }

                                   dem++;

                               });


                               objthis.find(".news-tab").prepend(htmlThumbnailItem0);
                               objthis.find(".news-tab-thumb").prepend(htmlThumbnailItem);
                               objthis.find(".news-tab-li").html(htmlTitleItem);
                               objthis.find(".news-tab-other").html(htmlOtherTab);
                               dtabmenu(ui.panel).attr(''hasdata'', ''yes'');
                               dtabmenu(".lacviet-tabsnews").show();

                           },
                           error: function (xhr, ajaxOptions, thrownError) {
                               //alert(xhr.responseText);
                               //alert(thrownError);
                           }
                       });
                   }
               }
           });
       });


   


    
        
            
                    
                            Lao động - Thương binh xã hội
            
                    
                            An ninh trật tự
            
        
        
            
                
                        
                    
                        
                            
                            
                            
                            
                        
                    
                    
                
        
            
                
                        
                    
                        
                            
                            
                            
                            
                        
                    
                    
                
        






			
		
	
		
			
				









    
        
            
       var dtabmenu = jQuery.noConflict();
       dtabmenu(document).ready(function () {
           dtabmenu("#ctl00_m_g_9cd3041e_27b6_48f6_96b1_2f9d121362d0_ctl00_tabs").tabs({
               show: function (event, ui) {

                   var selected = dtabmenu(this).tabs(''option'', ''selected'');
                   var blogguid = dtabmenu(ui.panel).attr(''blogguid'');
                   var objthis = dtabmenu(this).find("#tabs-ctl00_m_g_9cd3041e_27b6_48f6_96b1_2f9d121362d0_ctl00_tabs" + selected);

                   var categoryname = dtabmenu(ui.panel).attr(''categoryname'');
                   var categoryid = dtabmenu(ui.panel).attr(''categoryid'');
                   var categorytitle = dtabmenu(ui.panel).attr(''categorytitle'');
                   var categorylink = dtabmenu(ui.panel).attr(''categorylink'');
                   var hasdata = dtabmenu(ui.panel).attr(''hasdata'');

                   var soapmessage =
                ''\' + N'
                  \' + N'
                    \' + N'
                      topnews\' + N'
                      /TinTuc/tinchuyennganh/Lists/Posts/Post.aspx\' + N'
                      '' + blogguid + ''\' + N'
                      '' + categoryname + ''\' + N'
                      '' + categoryid + ''\' + N'
                      1\' + N'
                      2\' + N'
                      '' + categorytitle + ''\' + N'
                      '' + categorylink + ''\' + N'
                    \' + N'
                  \' + N'
                '';


                   // Call Ajax here

                   if (hasdata == "no") {

                       dataString = "modeldata=topnews&formdetailview=/TinTuc/tinchuyennganh/Lists/Posts/Post.aspx&blogguid=" + blogguid + "&categoryname=" + categoryname + "&categoryid=" +
                        categoryid + "&numthumbnail=1&numtitle=2&categorytitle=" + categorytitle + "&categorylink=" + categorylink;

                       dtabmenu.ajax({
                           type: "POST",
                           url: ''http://tanbinh.hochiminhcity.gov.vn/_layouts/lacvietbio/webservices/TabNewsServices.asmx?op=GetDataByCategory'',
                           data: soapmessage,
                           dataType: "xml",
                           contentType: "text/xml; charset=\"utf-8\"",
                           cache: false,
                           beforeSend: function () {

                               //nothing
                           },
                           success: function (xml) {

                               var htmlThumbnailItem0 = "";
                               var htmlThumbnailItem = "";
                               var htmlTitleItem = "";
                               var htmlOtherTab = "";
                               var dem = 0;
                               var rss = dtabmenu(xml).find(''Category'').attr(''RSS'');
                               var viewnext = dtabmenu(xml).find(''Category'').attr(''VIEWNEXT'');

                               if (dtabmenu.trim(dtabmenu(xml).find(''Category'').text()) == '''')
                                   return;

                               if (''True'' == ''True'') {

                                   htmlOtherTab += "" +
                                                    "RSS" +
                                                "";
                               }
                               if (''True'' == ''True'') {

                                   htmlOtherTab += "" +
                                                   "Xem tiếp" +
                                                "";
                               }

                               dtabmenu(xml).find(''Item'').each(function () {


                                   var title = dtabmenu(this).find(''Title'').text();
				   var d=new Date(dtabmenu(this).find(''PublishedDate'').text());
                                   var publisheddate = ''('' + d.getDate() + ''/'' + (d.getMonth() + 1) + ''/'' + d.getFullYear() + '')'';
                                   var itemimg = dtabmenu(this).find(''ItemImg'').text();
                                   var itemshortcontent = dtabmenu(this).find(''ItemShortContent'').text();
                                   var url = dtabmenu(this).find(''Url'').text();

                                   if (''True'' == ''False'') {
                                       publisheddate = "";
                                   }


                                   if (dem < ''1'') {
                                       if (dem == 0) {
                                           htmlThumbnailItem0 += "" +
                                                            "" +
                                                                "" +
                                                                    "" +
                                                                "" +
                                                            "" +
                                                            "" +
                                                                "" +
                                                                    "" + title + publisheddate + " " +
                                                                "" +
                                                                "" +
                                                                   itemshortcontent +
                                                                "" +
                                                            "" +
                                                        "";
                                       }
                                       else {
                                           htmlThumbnailItem += "" +
                                                            "" +
                                                                "" +
                                                                    "" +
                                                                "" +
                                                            "" +
                                                            "" +
                                                                "" +
                                                                    "" + title + publisheddate + " " +
                                                                "" +
                                                                "" +
                                                                   itemshortcontent +
                                                                "" +
                                                            "" +
                                                        "";

                                       }
                                   }

                                   else {

                                       htmlTitleItem += "" +
                                                            "" +
                                                                "" + title + "" +
                                                            "" +
                                                            "" +
                                                               publisheddate +
                                                            "" +
                                                        "";
                                   }

                                   dem++;

                               });


                               objthis.find(".news-tab").prepend(htmlThumbnailItem0);
                               objthis.find(".news-tab-thumb").prepend(htmlThumbnailItem);
                               objthis.find(".news-tab-li").html(htmlTitleItem);
                               objthis.find(".news-tab-other").html(htmlOtherTab);
                               dtabmenu(ui.panel).attr(''hasdata'', ''yes'');
                               dtabmenu(".lacviet-tabsnews").show();

                           },
                           error: function (xhr, ajaxOptions, thrownError) {
                               //alert(xhr.responseText);
                               //alert(thrownError);
                           }
                       });
                   }
               }
           });
       });


   


    
        
            
                    
                            Tin khác
            
                    
                            Chi cục thuế
            
        
        
            
                
                        
                    
                        
                            
                            
                            
                            
                        
                    
                    
                
        
            
                
                        
                    
                        
                            
                            
                            
                            
                        
                    
                    
                
        






			
		
	
		
			
				









    
        
            
       var dtabmenu = jQuery.noConflict();
       dtabmenu(document).ready(function () {
           dtabmenu("#ctl00_m_g_2522cde6_6b29_4cb4_849f_ef17af715a1c_ctl00_tabs").tabs({
               show: function (event, ui) {

                   var selected = dtabmenu(this).tabs(''option'', ''selected'');
                   var blogguid = dtabmenu(ui.panel).attr(''blogguid'');
                   var objthis = dtabmenu(this).find("#tabs-ctl00_m_g_2522cde6_6b29_4cb4_849f_ef17af715a1c_ctl00_tabs" + selected);

                   var categoryname = dtabmenu(ui.panel).attr(''categoryname'');
                   var categoryid = dtabmenu(ui.panel).attr(''categoryid'');
                   var categorytitle = dtabmenu(ui.panel).attr(''categorytitle'');
                   var categorylink = dtabmenu(ui.panel).attr(''categorylink'');
                   var hasdata = dtabmenu(ui.panel).attr(''hasdata'');

                   var soapmessage =
                ''\' + N'
                  \' + N'
                    \' + N'
                      topnews\' + N'
                      /TinTuc/tinkhac/Lists/Posts/Post.aspx\' + N'
                      '' + blogguid + ''\' + N'
                      '' + categoryname + ''\' + N'
                      '' + categoryid + ''\' + N'
                      1\' + N'
                      5\' + N'
                      '' + categorytitle + ''\' + N'
                      '' + categorylink + ''\' + N'
                    \' + N'
                  \' + N'
                '';


                   // Call Ajax here

                   if (hasdata == "no") {

                       dataString = "modeldata=topnews&formdetailview=/TinTuc/tinkhac/Lists/Posts/Post.aspx&blogguid=" + blogguid + "&categoryname=" + categoryname + "&categoryid=" +
                        categoryid + "&numthumbnail=1&numtitle=5&categorytitle=" + categorytitle + "&categorylink=" + categorylink;

                       dtabmenu.ajax({
                           type: "POST",
                           url: ''http://tanbinh.hochiminhcity.gov.vn/_layouts/lacvietbio/webservices/TabNewsServices.asmx?op=GetDataByCategory'',
                           data: soapmessage,
                           dataType: "xml",
                           contentType: "text/xml; charset=\"utf-8\"",
                           cache: false,
                           beforeSend: function () {

                               //nothing
                           },
                           success: function (xml) {

                               var htmlThumbnailItem0 = "";
                               var htmlThumbnailItem = "";
                               var htmlTitleItem = "";
                               var htmlOtherTab = "";
                               var dem = 0;
                               var rss = dtabmenu(xml).find(''Category'').attr(''RSS'');
                               var viewnext = dtabmenu(xml).find(''Category'').attr(''VIEWNEXT'');

                               if (dtabmenu.trim(dtabmenu(xml).find(''Category'').text()) == '''')
                                   return;

                               if (''True'' == ''True'') {

                                   htmlOtherTab += "" +
                                                    "RSS" +
                                                "";
                               }
                               if (''True'' == ''True'') {

                                   htmlOtherTab += "" +
                                                   "Xem tiếp" +
                                                "";
                               }

                               dtabmenu(xml).find(''Item'').each(function () {


                                   var title = dtabmenu(this).find(''Title'').text();
				   var d=new Date(dtabmenu(this).find(''PublishedDate'').text());
                                   var publisheddate = ''('' + d.getDate() + ''/'' + (d.getMonth() + 1) + ''/'' + d.getFullYear() + '')'';
                                   var itemimg = dtabmenu(this).find(''ItemImg'').text();
                                   var itemshortcontent = dtabmenu(this).find(''ItemShortContent'').text();
                                   var url = dtabmenu(this).find(''Url'').text();

                                   if (''True'' == ''False'') {
                                       publisheddate = "";
                                   }


                                   if (dem < ''1'') {
                                       if (dem == 0) {
                                           htmlThumbnailItem0 += "" +
                                                            "" +
                                                                "" +
                                                                    "" +
                                                                "" +
                                                            "" +
                                                            "" +
                                                                "" +
                                                                    "" + title + publisheddate + " " +
                                                                "" +
                                                                "" +
                                                                   itemshortcontent +
                                                                "" +
                                                            "" +
                                                        "";
                                       }
                                       else {
                                           htmlThumbnailItem += "" +
                                                            "" +
                                                                "" +
                                                                    "" +
                                                                "" +
                                                            "" +
                                                            "" +
                                                                "" +
                                                                    "" + title + publisheddate + " " +
                                                                "" +
                                                                "" +
                                                                   itemshortcontent +
                                                                "" +
                                                            "" +
                                                        "";

                                       }
                                   }

                                   else {

                                       htmlTitleItem += "" +
                                                            "" +
                                                                "" + title + "" +
                                                            "" +
                                                            "" +
                                                               publisheddate +
                                                            "" +
                                                        "";
                                   }

                                   dem++;

                               });


                               objthis.find(".news-tab").prepend(htmlThumbnailItem0);
                               objthis.find(".news-tab-thumb").prepend(htmlThumbnailItem);
                               objthis.find(".news-tab-li").html(htmlTitleItem);
                               objthis.find(".news-tab-other").html(htmlOtherTab);
                               dtabmenu(ui.panel).attr(''hasdata'', ''yes'');
                               dtabmenu(".lacviet-tabsnews").show();

                           },
                           error: function (xhr, ajaxOptions, thrownError) {
                               //alert(xhr.responseText);
                               //alert(thrownError);
                           }
                       });
                   }
               }
           });
       });


   


    
        
            
                    
                            Phản bác đấu tranh những quan điểm sai trái
            
        
        
            
                
                        
                    
                        
                            
                            
                            
                            
                        
                    
                    
                
        






			
		
	
		
			
				









    
        
            
       var dtabmenu = jQuery.noConflict();
       dtabmenu(document).ready(function () {
           dtabmenu("#ctl00_m_g_b030e709_f2fe_46fa_bf6d_546c04f9440c_ctl00_tabs").tabs({
               show: function (event, ui) {

                   var selected = dtabmenu(this).tabs(''option'', ''selected'');
                   var blogguid = dtabmenu(ui.panel).attr(''blogguid'');
                   var objthis = dtabmenu(this).find("#tabs-ctl00_m_g_b030e709_f2fe_46fa_bf6d_546c04f9440c_ctl00_tabs" + selected);

                   var categoryname = dtabmenu(ui.panel).attr(''categoryname'');
                   var categoryid = dtabmenu(ui.panel).attr(''categoryid'');
                   var categorytitle = dtabmenu(ui.panel).attr(''categorytitle'');
                   var categorylink = dtabmenu(ui.panel).attr(''categorylink'');
                   var hasdata = dtabmenu(ui.panel).attr(''hasdata'');

                   var soapmessage =
                ''\' + N'
                  \' + N'
                    \' + N'
                      topnews\' + N'
                      /TinTuc/tinkhac/Lists/Posts/Post.aspx\' + N'
                      '' + blogguid + ''\' + N'
                      '' + categoryname + ''\' + N'
                      '' + categoryid + ''\' + N'
                      1\' + N'
                      2\' + N'
                      '' + categorytitle + ''\' + N'
                      '' + categorylink + ''\' + N'
                    \' + N'
                  \' + N'
                '';


                   // Call Ajax here

                   if (hasdata == "no") {

                       dataString = "modeldata=topnews&formdetailview=/TinTuc/tinkhac/Lists/Posts/Post.aspx&blogguid=" + blogguid + "&categoryname=" + categoryname + "&categoryid=" +
                        categoryid + "&numthumbnail=1&numtitle=2&categorytitle=" + categorytitle + "&categorylink=" + categorylink;

                       dtabmenu.ajax({
                           type: "POST",
                           url: ''http://tanbinh.hochiminhcity.gov.vn/_layouts/lacvietbio/webservices/TabNewsServices.asmx?op=GetDataByCategory'',
                           data: soapmessage,
                           dataType: "xml",
                           contentType: "text/xml; charset=\"utf-8\"",
                           cache: false,
                           beforeSend: function () {

                               //nothing
                           },
                           success: function (xml) {

                               var htmlThumbnailItem0 = "";
                               var htmlThumbnailItem = "";
                               var htmlTitleItem = "";
                               var htmlOtherTab = "";
                               var dem = 0;
                               var rss = dtabmenu(xml).find(''Category'').attr(''RSS'');
                               var viewnext = dtabmenu(xml).find(''Category'').attr(''VIEWNEXT'');

                               if (dtabmenu.trim(dtabmenu(xml).find(''Category'').text()) == '''')
                                   return;

                               if (''True'' == ''True'') {

                                   htmlOtherTab += "" +
                                                    "RSS" +
                                                "";
                               }
                               if (''True'' == ''True'') {

                                   htmlOtherTab += "" +
                                                   "Xem tiếp" +
                                                "";
                               }

                               dtabmenu(xml).find(''Item'').each(function () {


                                   var title = dtabmenu(this).find(''Title'').text();
				   var d=new Date(dtabmenu(this).find(''PublishedDate'').text());
                                   var publisheddate = ''('' + d.getDate() + ''/'' + (d.getMonth() + 1) + ''/'' + d.getFullYear() + '')'';
                                   var itemimg = dtabmenu(this).find(''ItemImg'').text();
                                   var itemshortcontent = dtabmenu(this).find(''ItemShortContent'').text();
                                   var url = dtabmenu(this).find(''Url'').text();

                                   if (''True'' == ''False'') {
                                       publisheddate = "";
                                   }


                                   if (dem < ''1'') {
                                       if (dem == 0) {
                                           htmlThumbnailItem0 += "" +
                                                            "" +
                                                                "" +
                                                                    "" +
                                                                "" +
                                                            "" +
                                                            "" +
                                                                "" +
                                                                    "" + title + publisheddate + " " +
                                                                "" +
                                                                "" +
                                                                   itemshortcontent +
                                                                "" +
                                                            "" +
                                                        "";
                                       }
                                       else {
                                           htmlThumbnailItem += "" +
                                                            "" +
                                                                "" +
                                                                    "" +
                                                                "" +
                                                            "" +
                                                            "" +
                                                                "" +
                                                                    "" + title + publisheddate + " " +
                                                                "" +
                                                                "" +
                                                                   itemshortcontent +
                                                                "" +
                                                            "" +
                                                        "";

                                       }
                                   }

                                   else {

                                       htmlTitleItem += "" +
                                                            "" +
                                                                "" + title + "" +
                                                            "" +
                                                            "" +
                                                               publisheddate +
                                                            "" +
                                                        "";
                                   }

                                   dem++;

                               });


                               objthis.find(".news-tab").prepend(htmlThumbnailItem0);
                               objthis.find(".news-tab-thumb").prepend(htmlThumbnailItem);
                               objthis.find(".news-tab-li").html(htmlTitleItem);
                               objthis.find(".news-tab-other").html(htmlOtherTab);
                               dtabmenu(ui.panel).attr(''hasdata'', ''yes'');
                               dtabmenu(".lacviet-tabsnews").show();

                           },
                           error: function (xhr, ajaxOptions, thrownError) {
                               //alert(xhr.responseText);
                               //alert(thrownError);
                           }
                       });
                   }
               }
           });
       });


   


    
        
            
                    
                            Định hướng nhận thức về tư tưởng chính trị 
            
        
        
            
                
                        
                    
                        
                            
                            
                            
                            
                        
                    
                    
                
        






			
		
	

	
			

	
	
	  

	
		
			 


    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }

        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveLink(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }




				&#160;
			

 
				
    
        
            
				
             
				
        
        
    

			

		
	


	
		
			var a = 1;
          function playMedia(mediaItem) {

            $(''.videobox-image'').hide();
            $("#MediaPlayerZone").show();

            var m_MediaPlayer = document.getElementById(''MediaPlayer'');
            m_MediaPlayer.style.display = ''block'';
            m_MediaPlayer.FileName = mediaItem.getAttribute("Url");
            m_MediaPlayer.AutoStart = "True";
            m_MediaPlayer.Pause();

          };

          $(document).ready(function(){
              
              $("#MediaPlayerZone").hide();                

              $(".videobox-image").click(function(){

                  $("#MediaPlayerZone").show();
                  $(''.videobox-image'').hide();
                  var urlVideo= $(this).children("div.p-videobox-thumb").children("img.videobox-thumb").attr("srcMedia");
                  document.getElementById(''MediaPlayer'').FileName = urlVideo;
                  document.getElementById(''MediaPlayer'').AutoStart = "True";
                  document.getElementById(''MediaPlayer'').Pause();
              });
          });
        Tin VideoThành phố Hồ Chí Minh ngày nay
		
	


	
		
			


  










    var transiteTime = parseInt(''3500'');

    var albumbox = jQuery.noConflict();

    
    
    
    albumbox(document).ready(function() {

        var optionsLeft = {
            caption: ''hover'',
            opacity: 0.8,
            easing: ''swing'',
            widthimg:''220'',
            duration: 240
        }

        var optionsRight = {
            caption: ''hover'',
            opacity: 0.8,
            navigation: ''hover'',
            direction: ''left'',
            easing: ''swing'',
            widthimg: ''220'',
            duration: 240
        }
        var gt = albumbox(''#ppy1'').position().left;

        var duy;
        if (gt > 500)
            albumbox(''div#ppy1'').popeye(optionsRight);
        else
            albumbox(''div#ppy1'').popeye(optionsLeft);

        albumbox(''div.ppy-nav'').hide();
        var flag = true;

        albumbox.doTimeout(transiteTime, function() {
            if (flag == false)
                return false;

            
            albumbox(''a.ppy-next1'').click();
            return true;
        });

        albumbox(''a.ppy-next'').click(function() {
            flag = false;
        });
        albumbox(''a.ppy-prev'').click(function() {
            flag = false;
        });

    });
    
   



        
            
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
                
                    
                
                    
                    
                
                
            
            
                
                    
                        AlbumBox
                
                
                    
                
                
                    
                        Previous image 
                        Next image 
                        Enlarge
                        Close
                    
                
                
                
                    Xem tất cả
                
            
        
        Next image
        
		
	

 
 


	
		
			var i1 = 0;var i2 = 0;
                $(document).ready(function() {

                // Xử lý hiệu ứng khi click chuột phải để edit bài viết :: BEGIN
                $(".allowMenu").contextMenu({
                menu: ''myMenu''
                },
                function(action, el, pos) {

                if (action == "postbyword") {
                parent.location = ''/Hinh lien ket trang chu/Forms/Chinhsua.aspx'';
                }
                if (action == ''postbyweb'') {
                parent.location = '''';
                }
                if (action == ''editbyweb'') {
                parent.location = '''';
                }

                });
                });
                // Xử lý hiệu ứng khi click chuột phải để edit bài viết :: END
          Chỉnh sửa liên kết ảnh
      
        
          
            
              
            
          
        
      
       
      
		
	

 
 

		

		




			
						
				
					
						
						
							
						
						
							
						
						
							
						
						
					
					
						
					
						
						
					
				
			
			
		
		
	


		


	
		





Page, 

Untitled 1







	TRANG CHỦ|LIÊN HỆ|GÓP 
		Ý|SƠ ĐỒ SITE 
	

UỶ BAN NHÂN DÂN QUẬN TÂN BÌNH - 
	THÀNH PHỐ HỒ CHÍ MINH
	Địa chỉ: 387A Trường Chinh, Phường 14, quận Tân Bình, 
	TPHCM
	Điện thoại: (84-8) 54341498- 54341499&nbsp;&nbsp; Fax: 
	(84-8) 54341510
	Tổ Tiếp nhận &amp; Hoàn trả HSHC: (84-8) 54341501






	



	


  
		
  
   
    
  
	



//<![CDATA[
var _spFormDigestRefreshInterval = 1440000;
function EnsureScripts(scriptInfoList, finalFunction)
{
if (scriptInfoList.length == 0)
{
finalFunction();
}
else
{
var scriptInfo = scriptInfoList.shift();
var rest = function () { EnsureScripts(scriptInfoList, finalFunction); };
var defd;
try
{
eval(''defd = typeof('' + scriptInfo[1] + '');'');
}
catch (e)
{
defd = ''undefined'';
}
if (scriptInfo[2])
{
EnsureScript(scriptInfo[0], defd, null);
ExecuteOrDelayUntilScriptLoaded(rest, scriptInfo[0]);
}
else
{
EnsureScript(scriptInfo[0], defd, rest);
}
}
}
function PublishingRibbonUpdateRibbon()
{
var pageManager = SP.Ribbon.PageManager.get_instance();
if (pageManager)
{
pageManager.get_commandDispatcher().executeCommand(''appstatechanged'', null);
}
}var _fV4UI = true;
function _RegisterWebPartPageCUI()
{
    var initInfo = {editable: false,isEditMode: false,allowWebPartAdder: false,listId: "{966097ee-3c0e-45f5-aa19-d1c505e7a339}",itemId: 6,recycleBinEnabled: true,enableMinorVersioning: false,enableModeration: false,forceCheckout: false,rootFolderUrl: "\u002fPages",itemPermissions:{High:16,Low:196673}};
    SP.Ribbon.WebPartComponent.registerWithPageManager(initInfo);
    var wpcomp = SP.Ribbon.WebPartComponent.get_instance();
    var hid;
    hid = document.getElementById("_wpSelected");
    if (hid != null)
    {
        var wpid = hid.value;
        if (wpid.length > 0)
        {
            var zc = document.getElementById(wpid);
            if (zc != null)
                wpcomp.selectWebPart(zc, false);
        }
    }
    hid = document.getElementById("_wzSelected");
    if (hid != null)
    {
        var wzid = hid.value;
        if (wzid.length > 0)
        {
            wpcomp.selectWebPartZone(null, wzid);
        }
    }
}
ExecuteOrDelayUntilScriptLoaded(_RegisterWebPartPageCUI, "sp.ribbon.js"); var __wpmExportWarning=''This Web Part Page has been personalized. As a result, one or more Web Part properties may contain confidential information. Make sure the properties contain information that is safe for others to read. After exporting this Web Part, view properties in the Web Part description file (.WebPart) by using a text editor such as Microsoft Notepad.'';var __wpmCloseProviderWarning=''You are about to close this Web Part.  It is currently providing data to other Web Parts, and these connections will be deleted if this Web Part is closed.  To close this Web Part, click OK.  To keep this Web Part, click Cancel.'';var __wpmDeleteWarning=''You are about to permanently delete this Web Part.  Are you sure you want to do this?  To delete this Web Part, click OK.  To keep this Web Part, click Cancel.'';_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;
ExecuteOrDelayUntilScriptLoaded(
function()
{
var initInfo = 
{
itemPermMasks: {High:16,Low:196673},
listPermMasks: {High:16,Low:196673},
listId: "966097ee-3c0e-45f5-aa19-d1c505e7a339",
itemId: 6,
workflowsAssociated: true,
editable: false,
doNotShowProperties: false,
enableVersioning: false
};
SP.Ribbon.DocLibAspxPageComponent.registerWithPageManager(initInfo);
},
"sp.ribbon.js");
var g_disableCheckoutInEditMode = false;
var _spWebPermMasks = {High:16,Low:200769};_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;//]]>


<!--
function SearchEnsureSOD() { EnsureScript(''search.js'',typeof(GoSearch)); } _spBodyOnLoadFunctionNames.push(''SearchEnsureSOD'');function S3F5AE4C3_Submit() {if (document.getElementById(''ctl00_g_62b1b6bf_9557_4807_ae98_427bbc5d489e_ctl04'').value == ''0'') { document.getElementById(''ctl00_g_62b1b6bf_9557_4807_ae98_427bbc5d489e_S3F5AE4C3_InputKeywords'').value=''''; }SearchEnsureSOD();GoSearch(''ctl00_g_62b1b6bf_9557_4807_ae98_427bbc5d489e_ctl04'',''ctl00_g_62b1b6bf_9557_4807_ae98_427bbc5d489e_S3F5AE4C3_InputKeywords'',null,true,false,null,''ctl00_g_62b1b6bf_9557_4807_ae98_427bbc5d489e_ctl00'',null,null,''Trang web Na\u0300y'',''\u002fpages\u002fsearchresults.aspx'', ''Trang web Na\u0300y'',''Danh sa\u0301ch Na\u0300y'', ''C\u0103\u0323p Na\u0300y'', ''Trang web Co\u0301 li\u00EAn quan'', ''\u002fpages\u002fsearchresults.aspx'', '''', ''Vui lo\u0300ng nh\u00E2\u0323p m\u00F4\u0323t ho\u0103\u0323c nhi\u00EA\u0300u t\u01B0\u0300 ti\u0300m ki\u00EA\u0301m.'');if (document.getElementById(''ctl00_g_62b1b6bf_9557_4807_ae98_427bbc5d489e_ctl04'').value == ''0'') { document.getElementById(''ctl00_g_62b1b6bf_9557_4807_ae98_427bbc5d489e_S3F5AE4C3_InputKeywords'').value=''''; }}
// -->

// append an onload event handler
var S3F5AE4C3__onload= document.body.onload;
if(typeof document.body.onload == ''function'')
{
 document.body.onload = function()
 {
S3F5AE4C3__onload();        
  document.getElementById(''ctl00_g_62b1b6bf_9557_4807_ae98_427bbc5d489e_S3F5AE4C3_InputKeywords'').name = ''InputKeywords'';
 }
}
else
{
 document.body.onload = function()
 {
  eval(S3F5AE4C3__onload);        
  document.getElementById(''ctl00_g_62b1b6bf_9557_4807_ae98_427bbc5d489e_S3F5AE4C3_InputKeywords'').name = ''InputKeywords'';
 }
}

function S3F5AE4C3_OSBEK(event1) { 
if((event1.which == 10) || (event1.which == 13))
{   
S3F5AE4C3_Submit();return false;
}
}
{ var searchTextBox = document.getElementById(''ctl00_g_62b1b6bf_9557_4807_ae98_427bbc5d489e_S3F5AE4C3_InputKeywords'');if (searchTextBox.className.indexOf(''s4-searchbox-QueryPrompt'') == -1) searchTextBox.className += searchTextBox.className?'' s4-searchbox-QueryPrompt'':''s4-searchbox-QueryPrompt''; }// -->


//<![CDATA[
_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;//]]>

 

             
          
            function checkUrl(myArray) {

                
                if (!document.getElementById || !document.getElementsByTagName) return false;
                if (!document.getElementById(myArray)) return false;
                var links = document.getElementById(myArray);
                var node = findNode(links);
                
                if (node) {
                    var node_temp = node;
                    if (location.href.indexOf(''?'') != -1) {
                        var indexClass = jLeftMenu(node).parent().attr(''class'');
                       
                        if (indexClass.indexOf("ms-navItem") != -1) {

                            addClass(node_temp.parentNode, ''ms-navItem-selected'');
                            
                        }
                        if (indexClass.indexOf(''ms-navheader'') != -1) {

                            addClass(node_temp.parentNode, ''ms-navheader-selected'');
                            
                        }
                        while (node_temp.parentNode.id != myArray) {

                            if (node_temp.parentNode.id.split(''_'')[0].match(''ul'')) {

                                showMenu(node_temp.parentNode);
                            }
                            if (node_temp.parentNode.parentNode.id == myArray) {

                                if (node_temp.parentNode.id.split(''_'')[0].match(''li'')) {
                                    var temp = node_temp.parentNode.getElementsByTagName(''UL'');

                                    for (var i = 0; i < temp.length; i++) {

                                        if (node.parentNode.parentNode.id == temp[i].parentNode.id) {

                                            showMenu(temp[i]);
                                        }
                                    }
                                }
                            }

                            node_temp = node_temp.parentNode;
                        }
                    }
                    else {
                        var indexClass = $(node).parent().attr(''class'');
                        if (indexClass.indexOf(''ms-navItem'') != -1) {

                            addClass(node_temp.parentNode, ''ms-navItem-selected'');
                            
                        }
                        if (indexClass.indexOf(''ms-navheader'') != -1) {

                            addClass(node_temp.parentNode, ''ms-navheader-selected'');
                            
                        }
                        while (node_temp.parentNode.id != myArray) {

                            if (node_temp.parentNode.id.split(''_'')[0].match(''ul'')) {

                                showMenu(node_temp.parentNode);
                            }
                            if (node_temp.parentNode.parentNode.id ==myArray) {

                                if (node_temp.parentNode.id.split(''_'')[0].match(''li'')) {
                                    var temp = node_temp.parentNode.getElementsByTagName(''UL'');

                                    for (var i = 0; i < temp.length; i++) {

                                        if (node.parentNode.parentNode.id == temp[i].parentNode.id) {

                                            showMenu(temp[i]);
                                        }
                                    }
                                }
                            }
                            node_temp = node_temp.parentNode;
                        }
                    }
                }
            }
     
    
    function toggleMenu2param(node, link) {
        
        if (!document.getElementById) return false;
        if (!link) return false;
        hideallmenusamelevel(node);
        if (!node) location.href = link;

        var old_class;
        old_class=node.parentNode.className;
        if (node.className == ''classhide'') {
            node.className = ''classshow'';
            
            node.parentNode.className=old_class + '' seleted-leftmenu'';
        }
        else {
            node.className = ''classhide'';
          
            node.parentNode.className=old_class.split('' '')[0] ;
        }
    }
    function toggleMenu(node) {
     
        if (!document.getElementById) return false;
        hideallmenusamelevel(node);
        var old_class;
        old_class=node.parentNode.className;

        if (node.className == ''classhide'') {
            node.className = ''classshow'';
            
       
            
            node.parentNode.className= old_class + '' seleted-leftmenu'';

        }
        else {
            node.className = ''classhide'';
            //alert(old_class.split('' '')[0]);
            node.parentNode.className=old_class.split('' '')[0] ;
        }
    }
    function findNode(obj) {
        if (obj == null) return false;
        var elements = obj.getElementsByTagName(''a'');
        if (location.href.indexOf(''?'') != -1) {
            for (i = 0; i < elements.length; i++) {
                if (elements[i].href.indexOf(''?'') != -1) {
                    if (location.href.toLowerCase().match(elements[i].href.split(''?'')[0].toLowerCase()) && location.href.split(''?'')[1].toLowerCase() == elements[i].href.split(''?'')[1].toLowerCase() && elements[i].href.split(''?'')[1].length == location.href.split(''?'')[1].length) {

                        return elements[i];
                    }
                }
            }
        }
        else {
            for (i = 0; i < elements.length; i++) {
                if (location.href.toLowerCase().match(elements[i].href.toLowerCase())) {

                    return elements[i];
                }
            }
        }
        return null;
    }

    function showMenu(node) {
        if (!document.getElementById) return false;

        if (node.className == ''classhide'') {
            node.className = ''classshow'';
        }
        else {
            node.className = ''classshow'';
        }
    }
    function hideallmenusamelevel(currentnode) {
 
        var currentlevel = currentnode.id.split(''ul'')[1].split(''_'')[0];

        var links = currentnode.parentNode.parentNode.getElementsByTagName(''ul'');


        for (var i = 0; i < links.length; i++) {


            oneul = links[i];

            if (oneul) {

                oneid = oneul.id;
                onelevel = oneul.id.split(''ul'')[1].split(''_'')[0];
                if (onelevel >= currentlevel && oneul != currentnode) {
                    hideonemenu(oneul);
                }
            }
        }
    }
    function hideonemenu(node) {
        if (!document.getElementById) return false;
        if (!node) return false;

        node.className = ''classhide'';
    }
   function addClass(element, value) {

            if (!element.className) {
                element.className = value;
            } else {
                newClassName = element.className;
                newClassName += '' '';
                newClassName += value;
                element.className = newClassName;
            }
        }
        



checkUrl(''menuproduct_2a68f120-4e90-40de-8550-41cce9f699da'');


//<![CDATA[
_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;//]]>


// <![CDATA[
// ]]>

RegisterSod("sp.core.js", "\u002f_layouts\u002fsp.core.js?rev=7ByNlH\u00252BvcgRJg\u00252BRCctdC0w\u00253D\u00253D");
RegisterSod("sp.res.resx", "\u002f_layouts\u002fScriptResx.ashx?culture=vi\u00252Dvn\u0026name=SP\u00252ERes\u0026rev=7TabbLtM9EijPcqf46sldw\u00253D\u00253D");
RegisterSod("sp.ui.dialog.js", "\u002f_layouts\u002fsp.ui.dialog.js?rev=IuXtJ2CrScK6oX4zOTTy\u00252BA\u00253D\u00253D");RegisterSodDep("sp.ui.dialog.js", "sp.core.js");RegisterSodDep("sp.ui.dialog.js", "sp.res.resx");
RegisterSod("core.js", "\u002f_layouts\u002f1066\u002fcore.js?rev=HNl5OavLeTAyI0Y9VCDJdQ\u00253D\u00253D");
RegisterSod("sp.runtime.js", "\u002f_layouts\u002fsp.runtime.js?rev=9sKdsC9N6p2BiRk3313M7Q\u00253D\u00253D");RegisterSodDep("sp.runtime.js", "sp.core.js");RegisterSodDep("sp.runtime.js", "sp.res.resx");
RegisterSod("sp.js", "\u002f_layouts\u002fsp.js?rev=JmFQMEfR9bYx6G6TrWzSLw\u00253D\u00253D");RegisterSodDep("sp.js", "sp.core.js");RegisterSodDep("sp.js", "sp.runtime.js");RegisterSodDep("sp.js", "sp.ui.dialog.js");RegisterSodDep("sp.js", "sp.res.resx");
RegisterSod("cui.js", "\u002f_layouts\u002fcui.js?rev=wvoVpqlQb30nGo4DjDk8Kg\u00253D\u00253D");
RegisterSod("inplview", "\u002f_layouts\u002finplview.js?rev=AohvE9XEf\u00252FI78tuaw1TGAA\u00253D\u00253D");RegisterSodDep("inplview", "core.js");RegisterSodDep("inplview", "sp.js");
RegisterSod("ribbon", "\u002f_layouts\u002fsp.ribbon.js?rev=F\u00252BUEJ66rbXzSvpf7nN69wQ\u00253D\u00253D");RegisterSodDep("ribbon", "core.js");RegisterSodDep("ribbon", "sp.core.js");RegisterSodDep("ribbon", "sp.js");RegisterSodDep("ribbon", "cui.js");RegisterSodDep("ribbon", "sp.res.resx");RegisterSodDep("ribbon", "sp.runtime.js");RegisterSodDep("ribbon", "inplview");
RegisterSod("sp.publishing.resources.resx", "\u002f_layouts\u002fScriptResx.ashx?culture=vi\u00252Dvn\u0026name=SP\u00252EPublishing\u00252EResources\u0026rev=JDmJjRWJO\u00252FQyOvJholyviw\u00253D\u00253D");
RegisterSod("sp.ui.pub.ribbon.js", "\u002f_layouts\u002fsp.ui.pub.ribbon.js?rev=RGQSBI9Dm0E345iq\u00252FxUpHg\u00253D\u00253D");
RegisterSod("msstring.js", "\u002f_layouts\u002f1066\u002fmsstring.js?rev=Am7AXJUcI3L\u00252BIjy6aIL8Kg\u00253D\u00253D");
RegisterSod("browserScript", "\u002f_layouts\u002f1066\u002fnon_ie.js?rev=f2kBY9hL5p1OItWycrU5cw\u00253D\u00253D");
RegisterSod("WPAdderClass", "\u002f_layouts\u002fwpadder.js?rev=hnGJJEMcU5XH\u00252BCq7PlSxJw\u00253D\u00253D");
RegisterSod("search.js", "\u002f_layouts\u002fsearch.js?rev=jVFJXbMq\u00252BMZOs11kluPWwQ\u00253D\u00253D");
RegisterSodDep("browserScript", "msstring.js");

//<![CDATA[
Sys.Application.initialize();
function init_zz1_TopNavigationMenuV4() {$create(SP.UI.AspMenu, null, null, null, $get(''zz1_TopNavigationMenuV4''));}ExecuteOrDelayUntilScriptLoaded(init_zz1_TopNavigationMenuV4, ''sp.js'');
//]]>', CAST(N'2015-06-18 00:59:07.183' AS DateTime), N'Safe', 7)
INSERT [dbo].[TEXT_CONTENT] ([ContentID], [Content], [TimeCheck], [TextResult], [WebID]) VALUES (8, N'Trang chủ 
	- UBND QUẬN 9





	
	
	var navBarHelpOverrideKey = "wssmain";
	

	






















 var MSOWebPartPageFormName = ''aspnetForm'';

function _spNavigateHierarchy(nodeDiv, dataSourceId, dataPath, url, listInContext, type) {
    ProcessDefaultNavigateHierarchy(nodeDiv, dataSourceId, dataPath, url, listInContext, type, document.forms.aspnetForm, "", "\u002fdefault.aspx");
}



	
	
	
	
		
			
			
		
		
		 
			
			   
			Bật chế độ truy cập dễ dàng hơn
			
			
			Bỏ qua nội dung chính
		 
		   
			
			 
			  
				
				Tắt chế độ truy cập dễ dàng hơn
			  
			  
				UBND QUẬN 9
			  
			  
			 
		   
		 
		 
			
		   
	   
	  
			
		
		
			
			
				
					
					
Đăng nhập

					
					
						
							
							
						
					
					
				
			
			
		
		
			
			
		

	
			
	
	
			
		
		
			
			
				
					
					
					
					
			
		   
			 UBND QUẬN 9
		   
		  
		  
					
				
			
			
		
		
			
			
			
			
				
			
				
			
		   
			
			
			
			
			
			
			
	






    $(document).ready(function() {


        var CurrentPath = $.trim($("div#dvnduyPath").text());
        $("a[href=''" + CurrentPath + "'']").parent().parent().attr("id", "LvSelected");
        // Xác định tọa độ trong menu


        $("div").children("ul").children("li").each(function(e) {
           
            var p = $(this).position().left + ($(this).outerWidth() / 2);
            $(this).children("ul").css("display", "none");

            if (p >= 550) 
            {
                $(this).children("ul.children").children().css("float", "right");
            }
            
        });
        // Xác định vị trí của Tab đang được chọn
        var index = $("li#LvSelected").attr("duy");


        $("#wrapper").mouseleave(function() {

            $("ul#topnav li ul.children").css("display", "none");
            $("ul#topnav").children("li").eq(parseInt(index)).attr("id", "LvSelected");
            $("li#LvSelected").children().css("display", "block");

        });

        $("li.parent").hover
        (
               function() {

                   $("ul#topnav").children("li").children("ul").css("display", "none");
                   $(this).children().css("display", "block");
                   $("li#LvSelected").attr("id", "");
                   $(this).attr("id", "LvSelected");

               },
               function() {

                   $(this).attr("id", "");


               });


        $("ul#LvSelected").css("display", "block");
        $("ul#LvSelected").children().css("display", "block");

        $("ul#topnav li ul.children").css("display", "none");
        $("ul#topnav").children("li").eq(parseInt(index)).attr("id", "LvSelected");
        $("li#LvSelected").children().css("display", "block");

    });
        


/default.aspx





    
        
        
            
                
                    Trang chủ
            
        
        
        
            
                
                    Liên hệ
            
        
        
        
            
                
                    Download
            
        
        
    





			
			
				
					
				
						
		   
		   
		   	
		   	
		   		
		  				            							
                        function tS(){ x=new Date(); x.setTime(x.getTime()); return x; }
                        function y2(x){ x=(x<500)?x+1900:x; return String(x).substring(0,4) }
                        function k(){var ap="AM";
						 if ((tS().getHours())   > 11) { ap ="PM"; };return ap;}
                        function dT(){ 
                        
						  if(fr==0){ fr=1; document.write(''''+eval(oT)+''''); } tP.innerText=eval(oT); setTimeout(''dT()'',1000); }
                        var dN=new Array(''Chủ nhật'',''Thứ hai'',''Thứ ba'',''Thứ tư'',''Thứ năm'',''Thứ sáu'',''Thứ bảy''),mN=new Array(''1'',''2'',''3'',''4'',''5'',''6'',''7'',''8'',''9'',''10'',''11'',''12''),fr=0,oT="dN[tS().getDay()]+'', ''+tS().getDate()+''/''+mN[tS().getMonth()]+''/''+y2(tS().getYear())+''-''+tS().getHours()+'':''+tS().getMinutes()+'' ''+k()";
                     
                     dT();
		  		

		   	
		   	
				

		   	
		   	
	
		 
			
				
					
				
			
		
	

				

		   	
		   	
		   	
		   
		  
		
			
		
		
			
			
				
					
					
					
					
					
						
							
							
							
						
						
							
							
							
			
			UBND QUẬN 9

							
							
							
						
					
					
					
						

					
					
					
						
							
								

	
	
		
			
				
					
    
    
    


    var jLeftMenu = jQuery.noConflict();
    jLeftMenu(function($) {

        $("div.ms-navheader").mouseover(function() {

            $(this).addClass("heading-hover");

        }).mouseout(function() {
            $(this).removeClass("heading-hover");
        });
        $("div.ms-navheader-icon").mouseover(function() {
            $(this).addClass("heading-hover");

        }).mouseout(function() {
            $(this).removeClass("heading-hover");
        });
        $("div.ms-navItem").mouseover(function() {
            $(this).addClass("ms-navItem-hover");
        }).mouseout(function() {
            $(this).removeClass("ms-navItem-hover");
        });
        $("div.ms-navItem-icon").mouseover(function() {
            $(this).addClass("ms-navItem-hover");
        }).mouseout(function() {
            $(this).removeClass("ms-navItem-hover");
        });
    });

    
   
 

						GIỚI THIỆUGiới thiệu chungĐịa l&#253;Sơ đồ tổ chứcBản đồ h&#224;nh ch&#237;nhC&#225;c địa chỉ cần biếtTIN TỨC SỰ KIỆNTin kinh tếQuản l&#253; đ&#244; thịTin gi&#225;o dụcTin văn h&#243;a - x&#227; hộiBản tin quậnCải c&#225;ch h&#224;nh ch&#237;nhTh&#244;ng tin b&#225;o ch&#237;TH&#212;NG TIN CẦN BIẾTTh&#244;ng tin b&#225;o ch&#237;Tuyển dụng c&#244;ng chứcTh&#244;ng tin b&#225;o c&#225;o thống k&#234;VĂN BẢN PH&#193;P LUẬTTHỦ TỤC H&#192;NH CH&#205;NHC&#212;NG TR&#204;NH PH&#218;C LỢITrung t&#226;m dạy nghềTrung t&#226;m TDTTTrung t&#226;m Y Tế dự ph&#242;ngBệnh viện Quận 9Trung t&#226;m văn h&#243;aDU LỊCH QUẬN 9Video du lịch sinh th&#225;iĐịa điểm tham quanDu lịch sinh th&#225;iQUY HOẠCH &amp; PH&#193;T TRIỂNĐịnh hướng ph&#225;t triểnT&#236;nh h&#236;nh kinh tếTh&#244;ng tin quy hoạchDỰ &#193;N ĐẦU TƯ, ĐẤU THẦU - MUA SẮM C&#212;NGĐấu thầu&#221; KIẾN C&#212;NG D&#194;NTRA CỨU HỒ SƠ H&#192;NH CH&#205;NHDịch Vụ C&#244;ng Mức Độ 3
					



				
			
		
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveLink(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }




						
LI&Ecirc;N KẾT WEB



    
        
            
            Trang web li&ecirc;n kết
            Hồ Ch&iacute; Minh city web
            Quận 1
            Quận 2
            Quận 3
            Quận 4
            Quận 5
            Quận 6
            Quận 7
            Quận 8
            Quận 9
            Quận 10
            Quận 11
            Quận 12
            Quận B&igrave;nh T&acirc;n
            Quận B&igrave;nh Thạnh
            Quận G&ograve; Vấp
            Quận Ph&uacute; Nhuận
            Quận T&acirc;n B&igrave;nh
            Quận T&acirc;n Ph&uacute;
            Quận Thủ Đức
            Huyện B&igrave;nh Ch&aacute;nh
            Huyện Cần Giờ
            Huyện Củ Chi
            Huyện H&oacute;c M&ocirc;n
            Huyện Nh&agrave; B&egrave;
            
        
    




					

 
						
    
        
            
             
        
        
    

					

				
			
		
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveQC(right, newsid, menuid, img) {

        if (right == ''true'') {

            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }


 
						
 
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
						
					   
 
						
    
        
            
        
    

					

				
			
		
	

	

							
								
									
									
										
											&nbsp;
											
											
												
													
														
				
				
				
				Khởi chạy Nhanh
				
				Xem Tất cả Nội dung trang Web
				
				
				
				
				
				
		
		
		
		
		
		
				
				
			  
														
														


    
        
            
                SỐ LƯỢT TRUY CẬP
        
        
            
                
                    
                        
	
		
                                
                                    
                                        
                                            
                                                4
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                5
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                5
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                0
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                9
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                5
                                        
                                    
                                
                            
                                
                                    
                                        
                                            
                                                8
                                        
                                    
                                
                            
	

                    
                
            
        
    
 

    
													
												
												
													
													
													
												
											
										
										
										
										
										
									
								
								
								
								
									

								
								
								
		
								
									
										
										
										
											
													

	
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveLink(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }




						
					

 
						
    
        
            
             
        
        
    

					

				
			
		
	
		
			
				
					





 var jHotNews = jQuery.noConflict();
  function slideSwitch() 
  {
      var jQueryActive = jHotNews(''#slideshow DIV.active'');
     
      if ( jQueryActive.length == 0 ) jQueryActive = jHotNews(''#slideshow DIV:last'');
      var jQueryNext =  jQueryActive.next().length ? jQueryActive.next(): jHotNews(''#slideshow DIV:first'');
      jQueryActive.addClass(''last-active'');
      
      jQueryNext.css({opacity: 0.0})
          .addClass(''active'')
          .animate({opacity: 1.0}, 1000, function() {
          jQueryActive.removeClass(''active last-active'');
          
          });
  }
  jHotNews(function($) {
  var cmshotnewsrefreshIntervalId=setInterval( "slideSwitch()", "4000" );
          $(".a-hot-link").mouseover(function() {

            var kq = $(this).attr(''id'');

            $(''div.hl-latestnews3'').each(function() {
                if ($(this).attr(''idItem'') == kq) {
                    $(this).addClass(''active'');
                    clearInterval(cmshotnewsrefreshIntervalId);
                }
                else {
                    $(this).removeClass(''active'');
                }
            });
        }).mouseout(function() {
            cmshotnewsrefreshIntervalId = setInterval("slideSwitch()", "4000");
        });
  });



/**Tin noi bat***/
/*#slideshow{width:295px;float:left;height:380px;position:relative;}
#slideshow DIV{position:absolute;top:0;left:0;z-index:80;opacity:.0;width:295px;background-color:#FFF;height:100%;}
#slideshow DIV.active{z-index:100;opacity:1.0;width:295px;height:100%;}
#slideshow DIV.last-active{z-index:90;height:100%;}
#slideshow DIV IMG{display:block;border:0;margin-bottom:10px;}*/


    
        
            
                
                    
                    
                    
                        
                        
                            
                        
                         
                        
                            
                                Bà Huỳnh Thị Ngọc Bích được bổ nhiệm giữ chức vụ Chánh Văn phòng UBND Quận
                            
                        
                        
                            

Đ/c Đặng Thị Hồng Liên, Phó Bí thư Quận ủy, Chủ tịch UBND Quận 9(bìa trái) trao quyết định.
 Căn cứ Quyết định số 27/2003/QĐ-TTg ngày 19 tháng 02 năm 2003 của Thủ tướng Chính phủ về ban hành Quy chế bổ nhiệm, bổ nhiệm lại, luân chuyển, từ chức, miễn nhiệm cán bộ, công chức lãnh đạo; 
Căn cứ Thông báo số 569-TB/QU ngày 04 tháng 6 năm ...
                        
                       
                    
                    
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Phòng Cảnh sát PCCC Quận 9 huấn luyện sử dụng trang thiết bị mới
                            
                        
                        
                             Vừa qua,Cảnh sát phòng cháy và chữa cháy Thành phố Hồ Chí Minh đã tiếp nhận 12 xe chữa cháy từ tập đoàn Gimaex của Pháp. Trong đó, Phòng Cảnh sát phòng cháy và chữa cháy được nhận 01 xe chữa cháy đa năng và phá dỡ công trình.Đây là loại xe rôbốt chữa cháy hiện đại được trang bị bơm chữa cháy công suất lớn kèm theo hệ thống tạo bọt hòa khí nén ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                HƯỞNG ỨNG NGÀY MÔI TRƯỜNG THẾ GIỚI 05/6 CHỦ ĐỀ “Cùng nhau tiêu dùng có trách nhiệm - Vì một trái đất bền vững”
                            
                        
                        
                             
Ngày 05 tháng 6 hàng năm được Chương trình Môi trường Liên hợp quốc (UNEP) chọn là Ngày Môi trường thế giới. Đây là một sự kiện môi trường quốc tế thường niên quan trọng được Việt Nam hưởng ứng từ năm 1982 và đã trở thành hoạt động cụ thể, thiết thực góp phần nâng cao nhận thức cộng đồng về bảo vệ môi trường và phát triển bền vững.
 
 Chủ đề ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Lãnh đạo TP.HCH – Thăm chúc thọ các cụ cao niên
                            
                        
                        
                             
 Nhân kỷ niệm 74 năm ngày truyền thống người cao tuổi ( 6/6/1941-6/6/2015). Ngày 4/6/2015 đồng chí Võ Văn Thưởng, ủy viên Trung ương Đảng, phó bí thư thường trực Thành ủy TP.HCM, đã đến thăm hỏi mẹ Việt Nam anh hùng Hồ Thị Vị và cụ bà Dương Thị Bán là 2 cụ bà cao niên (90 tuổi) trên địa bàn quận 9.

Đồng chí Võ Văn Thưởng, ủy viên Trung ương ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Nhân sự mới
                            
                        
                        
                            
 
Chiều ngày 03/6/2015, tại phòng họp Ban Thường vụ Quận ủy, đồng chí Võ Văn Hoang, Ủy viên Thường vụ, Trưởng Ban Tổ chức Quận ủy công bố quyết định về công tác cán bộ. Tham dự buổi công bố quyết định, có đồng chí Nguyễn Hữu Việt – Bí thư Quận ủy; đồng chí Đặng Thị Hồng Liên – Phó Bí thư, Chủ tịch Ủy ban nhân dân quận và lãnh đạo Ban Dân vận ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                CHỦ TỊCH HỒ CHÍ MINH Hành trình ra đi tìm đường cứu nước ( 05/6/1911)
                            
                        
                        
                             
Chủ tịch Hồ Chí Minh sinh ngày 19 tháng 5 nǎm 1890 tại quê ngoại làng Hoàng Trù, xã Kim Liên, huyện Nam Đàn, tỉnh Nghệ An, trong một gia đình nhà nho yêu nước.
CHỦ TỊCH HỒ CHÍ MINH: Tiếp nhận Chủ nghĩa Mác – Lênin và khẳng định con đường cách mạng Việt Nam(1911-1920)
Cách đây tròn 1 thế kỷ, ngày 5/6/1911, người thanh niên Nguyễn Tất Thành, ...
                        
                        
                    
                    
                    
                        
                        
                            
                        
                        
                        
                            
                                Sự giản dị của Bác Hồ
                            
                        
                        
                             
Qua bao năm tháng bôn ba hải ngoại tìm đường cứu nước, Chủ tịch Hồ Chí Minh đã tích lũy được vốn kiến thức rất uyên thâm, nhưng khi đến với cán bộ, quần chúng nhân dân, Bác đã chuyển hóa những kiến thức đó thành những câu chuyện nhẹ nhàng, dễ hiểu, rất bình dị và gần gũi.
 Đầu năm 1946, có cuộc họp cán bộ từ trung ương đến các địa phương, Bác ...
                        
                        
                    
                    
                
            
        
        
            
            
                
                    
                        
                            TIN NỔI BẬT
                        
                    
                
                 

                
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews0" href="http://www.quan9.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=B%e1%ba%a3n+tin+qu%e1%ba%adn&ItemID=1609&Mode=1" class="a-hot-link" title="Đ/c Đặng Thị Hồng Liên, Phó Bí thư Quận ủy, Chủ tịch UBND Quận 9(bìa trái) trao quyết định.
 Căn cứ Quyết định số 27/2003/QĐ-TTg ngày 19 tháng 02 năm 2003 của Thủ tướng Chính phủ về ban hành Quy chế bổ nhiệm, bổ nhiệm lại, luân chuyển, từ chức, miễn nhiệm cán bộ, công chức lãnh đạo; 
Căn cứ Thông báo số 569-TB/QU ngày 04 tháng 6 năm ...">
                                Bà Huỳnh Thị Ngọc Bích được bổ nhiệm giữ chức vụ Chánh Văn phòng UBND Quận
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            
                                Phòng Cảnh sát PCCC Quận 9 huấn luyện sử dụng trang thiết bị mới
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews2" href="http://www.quan9.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=Tin+gi%c3%a1o+d%e1%bb%a5c&ItemID=1607&Mode=1" class="a-hot-link" title="Ngày 05 tháng 6 hàng năm được Chương trình Môi trường Liên hợp quốc (UNEP) chọn là Ngày Môi trường thế giới. Đây là một sự kiện môi trường quốc tế thường niên quan trọng được Việt Nam hưởng ứng từ năm 1982 và đã trở thành hoạt động cụ thể, thiết thực góp phần nâng cao nhận thức cộng đồng về bảo vệ môi trường và phát triển bền vững.
 
 Chủ đề ...">
                                HƯỞNG ỨNG NGÀY MÔI TRƯỜNG THẾ GIỚI 05/6 CHỦ ĐỀ “Cùng nhau tiêu dùng có trách nhiệm - Vì một trái đất bền vững”
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews3" href="http://www.quan9.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=Tin+v%c4%83n+h%c3%b3a+-+x%c3%a3+h%e1%bb%99i&ItemID=1606&Mode=1" class="a-hot-link" title="Nhân kỷ niệm 74 năm ngày truyền thống người cao tuổi ( 6/6/1941-6/6/2015). Ngày 4/6/2015 đồng chí Võ Văn Thưởng, ủy viên Trung ương Đảng, phó bí thư thường trực Thành ủy TP.HCM, đã đến thăm hỏi mẹ Việt Nam anh hùng Hồ Thị Vị và cụ bà Dương Thị Bán là 2 cụ bà cao niên (90 tuổi) trên địa bàn quận 9.

Đồng chí Võ Văn Thưởng, ủy viên Trung ương ...">
                                Lãnh đạo TP.HCH – Thăm chúc thọ các cụ cao niên
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            
                                Nhân sự mới
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews5" href="http://www.quan9.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=H%e1%bb%8dc+t%e1%ba%adp+v%c3%a0+l%c3%a0m+theo+t%e1%ba%a5m+g%c6%b0%c6%a1ng+%c4%91%e1%ba%a1o+%c4%91%e1%bb%a9c+H%e1%bb%93+Ch%c3%ad+Minh&ItemID=1601&Mode=1" class="a-hot-link" title="Chủ tịch Hồ Chí Minh sinh ngày 19 tháng 5 nǎm 1890 tại quê ngoại làng Hoàng Trù, xã Kim Liên, huyện Nam Đàn, tỉnh Nghệ An, trong một gia đình nhà nho yêu nước.
CHỦ TỊCH HỒ CHÍ MINH: Tiếp nhận Chủ nghĩa Mác – Lênin và khẳng định con đường cách mạng Việt Nam(1911-1920)
Cách đây tròn 1 thế kỷ, ngày 5/6/1911, người thanh niên Nguyễn Tất Thành, ...">
                                CHỦ TỊCH HỒ CHÍ MINH Hành trình ra đi tìm đường cứu nước ( 05/6/1911)
                            
                        
                    
                    
                    
                         
				         <!--   
                        	            
                            	            
                        	            
                       	 	            
							-->
			            
                        
                            <a id="cmshotNews6" href="http://www.quan9.hochiminhcity.gov.vn/tintuc?Source=%2ftintuc&Category=H%e1%bb%8dc+t%e1%ba%adp+v%c3%a0+l%c3%a0m+theo+t%e1%ba%a5m+g%c6%b0%c6%a1ng+%c4%91%e1%ba%a1o+%c4%91%e1%bb%a9c+H%e1%bb%93+Ch%c3%ad+Minh&ItemID=1598&Mode=1" class="a-hot-link" title="Qua bao năm tháng bôn ba hải ngoại tìm đường cứu nước, Chủ tịch Hồ Chí Minh đã tích lũy được vốn kiến thức rất uyên thâm, nhưng khi đến với cán bộ, quần chúng nhân dân, Bác đã chuyển hóa những kiến thức đó thành những câu chuyện nhẹ nhàng, dễ hiểu, rất bình dị và gần gũi.
 Đầu năm 1946, có cuộc họp cán bộ từ trung ương đến các địa phương, Bác ...">
                                Sự giản dị của Bác Hồ
                            
                        
                    
                    
                
                
            
            
        
    


				
			
		
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveLink(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }




						
					

 
						
    
        
            
             
        
        
    

					

				
			
		
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=Tin+kinh+t%e1%ba%bf&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    Tin kinh tế
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Tuyên dương 26 doanh nghiệp tiêu biểu thực hiện tốt nghĩa vụ thuế năm 2014
                            
                            
                        
                    
                    
                        
                            
                            
                                
                                    
                                        
                                            
                                        
                                    
                                
                            
                            
                            
                                 
 Sáng 22/5, Chi Cục thuế Quận 9 tổ chức Hội nghị tuyên dương doanh nghiệp tiêu biểu thực hiện tốt nghĩa vụ thuế năm 2014. Tham dự có đồng chí Lê Đình Hiếu, Phó Trưởng phòng Kế hoạch Tài chính Công thương Chi Cục thuế thành phố; đồng chí Đỗ Quốc Tuấn, Phó Trưởng phòng tuyên truyền hỗ trợ Chi Cục thuế thành phố; đồng chí Ngô Anh Tuấn,Quận Ủy ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Quận 9 Tổng kết công tác chăm lo Tết Nguyên đán năm 2015
                            
                            
                            &nbsp;(09/03)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Tuyên dương 19 doanh nghiệp tiêu biểu thực hiện tốt nghĩa vụ thuế năm 2012
                            
                            
                            &nbsp;(02/07)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=Qu%e1%ba%a3n+l%c3%bd+%c4%91%c3%b4+th%e1%bb%8b&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    Quản lý đô thị
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Ủy ban nhân dân Quận 9: Ra quân thiết lập trật tự đô thị năm 2015
                            
                            
                        
                    
                    
                        
                            
                            
                                
                                    
                                        
                                            
                                        
                                    
                                
                            
                            
                            
                                 
 Trong những năm qua tình trật tự đô thị đã có nhiều chuyển biến tích cực. Tình trạng mua bán lấn chiếm lòng lề đường, trước cổng trường học đã giảm hẳn, đa số các con đường tường bước được được chỉnh trang…
Tuy nhiên, địa bàn Quận 9 là cửa ngỏ phía Đông Bắc của Thành phố, mật độ các phương tiện từ Tỉnh, Thành phố khác tham gia lưu thông hàng ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Nhà ở xã hội trên địa bàn thành phố Hồ Chí Minh năm 2014
                            
                            
                            &nbsp;(29/12)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=Tin+gi%c3%a1o+d%e1%bb%a5c&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    Tin giáo dục
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                HƯỞNG ỨNG NGÀY MÔI TRƯỜNG THẾ GIỚI 05/6 CHỦ ĐỀ “Cùng nhau tiêu dùng có trách nhiệm - Vì một trái đất bền vững”
                            
                            
                        
                    
                    
                        
                            
                            
                                
                                    
                                        
                                            
                                        
                                    
                                
                            
                            
                            
                                 
Ngày 05 tháng 6 hàng năm được Chương trình Môi trường Liên hợp quốc (UNEP) chọn là Ngày Môi trường thế giới. Đây là một sự kiện môi trường quốc tế thường niên quan trọng được Việt Nam hưởng ứng từ năm 1982 và đã trở thành hoạt động cụ thể, thiết thực góp phần nâng cao nhận thức cộng đồng về bảo vệ môi trường và phát triển bền vững.
 
 Chủ đề ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Quận 9 tổ chức hội thi “Giới thiệu về gương sáng quanh tôi”
                            
                            
                            &nbsp;(15/05)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Ngày của Mẹ
                            
                            
                            &nbsp;(09/05)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=Tin+v%c4%83n+h%c3%b3a+-+x%c3%a3+h%e1%bb%99i&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    Tin văn hóa - xã hội
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Phòng Cảnh sát PCCC Quận 9 huấn luyện sử dụng trang thiết bị mới
                            
                            
                        
                    
                    
                        
                            
                            
                                
                                    
                                        
                                            
                                        
                                    
                                
                            
                            
                            
                                 Vừa qua,Cảnh sát phòng cháy và chữa cháy Thành phố Hồ Chí Minh đã tiếp nhận 12 xe chữa cháy từ tập đoàn Gimaex của Pháp. Trong đó, Phòng Cảnh sát phòng cháy và chữa cháy được nhận 01 xe chữa cháy đa năng và phá dỡ công trình.Đây là loại xe rôbốt chữa cháy hiện đại được trang bị bơm chữa cháy công suất lớn kèm theo hệ thống tạo bọt hòa khí nén ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Lãnh đạo TP.HCH – Thăm chúc thọ các cụ cao niên
                            
                            
                            &nbsp;(05/06)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Nhân sự mới
                            
                            
                            &nbsp;(04/06)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	
		
			
				


.news-popupmenu
{
    padding-top:3px;
    padding-bottom:3px;
}



    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        var scrOfX = 0, scrOfY = 0;
        if (typeof (window.pageYOffset) == ''number'') {
            //Netscape compliant
            scrOfY = window.pageYOffset;
            scrOfX = window.pageXOffset;
        } else if (document.body && (document.body.scrollLeft || document.body.scrollTop)) {
            //DOM compliant
            scrOfY = document.body.scrollTop;
            scrOfX = document.body.scrollLeft;
        } else if (document.documentElement && (document.documentElement.scrollLeft || document.documentElement.scrollTop)) {
            //IE6 standards compliant mode
            scrOfY = document.documentElement.scrollTop;
            scrOfX = document.documentElement.scrollLeft;
        }
        x = (window.Event) ? this.pageX : event.clientX + scrOfX;
        y = (window.Event) ? this.pageY : event.clientY + scrOfY;


        tb.style.left = x;
        tb.style.top = y;
    }

    function main_popupactive(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);
            //setCurrentNewsId(newsid);
            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }



			
			
			
		
            
                <a class="a_header_style1" href="/tintuc/lists/posts/post.aspx?Source=%2ftintuc&Category=B%e1%ba%a3n+tin+qu%e1%ba%adn&Mode=2" style="font-weight: bold;
                    font-size: 11px; text-decoration: none; text-transform: uppercase;">
                    Bản tin quận
                
            
            
        
        
        
        
        
    
    
    
        
            
                
                
                    
                    
                        
                            
                                Bà Huỳnh Thị Ngọc Bích được bổ nhiệm giữ chức vụ Chánh Văn phòng UBND Quận
                            
                            
                        
                    
                    
                        
                            
                            
                                
                                    
                                        
                                            
                                        
                                    
                                
                            
                            
                            
                                

Đ/c Đặng Thị Hồng Liên, Phó Bí thư Quận ủy, Chủ tịch UBND Quận 9(bìa trái) trao quyết định.
 Căn cứ Quyết định số 27/2003/QĐ-TTg ngày 19 tháng 02 năm 2003 của Thủ tướng Chính phủ về ban hành Quy chế bổ nhiệm, bổ nhiệm lại, luân chuyển, từ chức, miễn nhiệm cán bộ, công chức lãnh đạo; 
Căn cứ Thông báo số 569-TB/QU ngày 04 tháng 6 năm ...
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Đồng chí Lê Thị Kim Chi, được bầu giữ chức vụ Chủ tịch Ủy ban Mặt trận Tổ quốc Việt Nam Quận 9 nhiệm kỳ (2014- 2019).
                            
                            
                            &nbsp;(27/05)
                            
                        
                    
                    
                    
                        
                            &nbsp;
                        
                            
                                Miễn nhiệm và điều động cán bộ, công chức khối Chính quyền Quận 9
                            
                            
                            &nbsp;(27/05)
                            
                        
                    
                    
                    
                        
                           
                    				Xem tiếp
                				 
                           
                    
                
                
                
            
        
    
    
      
    
        
        
        
        
        
        
    



					
    
        
            
            
        
    

				


			
		
	

	

											
										
										
									
		
	  							
								
								
									
										
								
								
	
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveLink(right, newsid, menuid, img) {
        if (right == ''true'') {
            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }




						
					

 
						
    
        
            
             
        
        
    

					

				
			
		
	
		
			
				
					

    function get_ElementById(id) {
        var tmp;
        // detect browser
        NS4 = (document.layers) ? 1 : 0;
        IE4 = (document.all) ? 1 : 0;
        // W3C stands for the W3C standard, implemented in Mozilla (and Netscape 6) and IE5
        W3C = (document.getElementById) ? 1 : 0;
        if (W3C) {
            tmp = document.getElementById(id);
        } else if (NS4) {
            tmp = document.layers[id];
        } else { // IE4
            tmp = document.all[id];
        }
        return tmp;
    }
    function setposimg(id) {
        tb = get_ElementById(id);
        x = (window.Event) ? this.pageX : event.clientX + document.body.scrollLeft;
        y = (window.Event) ? this.pageY : event.clientY + document.body.scrollTop;
        tb.style.left = x;
        tb.style.top = y;
    }
    function popupactiveQC(right, newsid, menuid, img) {

        if (right == ''true'') {

            setposimg(img);

            MMU_Open(byid(menuid), MMU_GetMenuFromClientId(img), event, false, null, 0);
        }
    }


 
						
 
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
								
							
						
					   
 
						
    
        
            
        
    

					

				
			
		
	
		
			
				
					









    var vbox = jQuery.noConflict();

        var width = ''194'' + "px";
        var height = ''194'' + "px";
        vbox(document).ready(function() {

        if (vbox("#ctl00_m_g_07e4f2d0_b50e_4315_af6a_0f0539bc17c7_ctl00_listvideobox").children("li").length <= 1) {
            vbox("#ctl00_m_g_07e4f2d0_b50e_4315_af6a_0f0539bc17c7_ctl00_listvideobox").parent().hide();
        }
        
        if (''True'' == ''True'') {

                vbox(''li.item-videobox'').live(''click'', function() {
                    var gt = vbox(this).attr(''linkVideo'');
                    var thumbnail = vbox(this).attr(''thumbnail'');
                    var videoplayer = vbox(this).attr(''videoplayer'');

                    jwplayer(videoplayer).setup({
                        flashplayer: "/_LAYOUTS/LacVietBio/UserControls/PhotoAlbum/images/player4.6.swf",
                        autostart: true,
                        file: gt,
                        image: thumbnail,
                        height: height,
                        width: width
                    });
                });
           
            
        }
    });
    





    
         
        
        
        
            
                
                
                    Bài ca Quận 9
             
                
                    Bên kia một dòng sông
             
                
                    Vùng bưng quê em
             
                
                    Đây là quê hương
             
                
                    Em về Quận 9 áo hoàng hôn
             
                
                    Ký ức đồng bưng
             
                
                    Ngày về quê em
             
                
                    Quận 9 rạng rỡ xuân hồng
             
                
                    Quê mình thắm tươi
             
                
                    Tiền duyên
             
        
    





    var linkFirstVideo = vbox("#ctl00_m_g_07e4f2d0_b50e_4315_af6a_0f0539bc17c7_ctl00_listvideobox").children("li").eq(0).attr(''linkvideo'');
    var firstThumbnail = vbox("#ctl00_m_g_07e4f2d0_b50e_4315_af6a_0f0539bc17c7_ctl00_listvideobox").children("li").eq(0).attr(''thumbnail'');
    jwplayer("ctl00_m_g_07e4f2d0_b50e_4315_af6a_0f0539bc17c7_ctl00_dvnduymainvideo").setup({
        flashplayer: "/_LAYOUTS/LacVietBio/UserControls/PhotoAlbum/images/player4.6.swf",
        file: linkFirstVideo,
        image: firstThumbnail,
        height: height,
        width: width
    });



				
			
		
	

	

								
								
							
							
						
						
									
							
								
				
									
														
									
										
											TRANG CHỦ
											
											 LIÊN HỆ  
																						
										
									
								
								
								 © UBND Quận 9, Thành phố Hồ Chí Minh

								
								Địa chỉ: 2/304 Xa lộ Hà Nội, Phường Hiệp Phú, Quận 9 
								Tel: (84-8)-8973056 Fax: (084)-8973293 Email:Q9@tphcm.gov.vn
 
  									
  																										
							
						
						
	
	
	
	


					
					
						
							

.ms-bodyareaframe {
	padding: 0px;
}


								

TD.ms-titleareaframe, .ms-pagetitleareaframe {
	height: 10px;
}
Div.ms-titleareaframe {
	height: 100%;
}
.ms-pagetitleareaframe table {
	background: none;
	height: 0px;
}


									
	
	
		 
			
				
					
						Trang web Này: UBND QUẬN 9

					
				
			
		
	


									
									
									
	


										
	
									
								
								
		
  
								
								
							


//<![CDATA[
var __wpmExportWarning=''This Web Part Page has been personalized. As a result, one or more Web Part properties may contain confidential information. Make sure the properties contain information that is safe for others to read. After exporting this Web Part, view properties in the Web Part description file (.WebPart) by using a text editor such as Microsoft Notepad.'';var __wpmCloseProviderWarning=''You are about to close this Web Part.  It is currently providing data to other Web Parts, and these connections will be deleted if this Web Part is closed.  To close this Web Part, click OK.  To keep this Web Part, click Cancel.'';var __wpmDeleteWarning=''You are about to permanently delete this Web Part.  Are you sure you want to do this?  To delete this Web Part, click OK.  To keep this Web Part, click Cancel.'';_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;//]]>

 

             
          
            function checkUrl(myArray) {

                
                if (!document.getElementById || !document.getElementsByTagName) return false;
                if (!document.getElementById(myArray)) return false;
                var links = document.getElementById(myArray);
                var node = findNode(links);
                
                if (node!=''-1'') {
                    var node_temp = node;
                    if (location.href.indexOf(''?'') != -1) {
                        var indexClass = jLeftMenu(node).parent().attr(''class'');
                       
                        if (indexClass.indexOf("ms-navItem") != -1) {

                            addClass(node_temp.parentNode, ''ms-navItem-selected'');
                            
                        }
                        if (indexClass.indexOf(''ms-navheader'') != -1) {

                            addClass(node_temp.parentNode, ''ms-navheader-selected'');
                            
                        }
                        while (node_temp.parentNode.id != myArray) {

                            if (node_temp.parentNode.id.split(''_'')[0].match(''ul'')) {

                                showMenu(node_temp.parentNode);
                            }
                            if (node_temp.parentNode.parentNode.id == myArray) {

                                if (node_temp.parentNode.id.split(''_'')[0].match(''li'')) {
                                    var temp = node_temp.parentNode.getElementsByTagName(''UL'');

                                    for (var i = 0; i < temp.length; i++) {

                                        if (node.parentNode.parentNode.id == temp[i].parentNode.id) {

                                            showMenu(temp[i]);
                                        }
                                    }
                                }
                            }

                            node_temp = node_temp.parentNode;
                        }
                    }
                    else {
                        var indexClass = $(node).parent().attr(''class'');
                        if (indexClass.indexOf(''ms-navItem'') != -1) {

                            addClass(node_temp.parentNode, ''ms-navItem-selected'');
                            
                        }
                        if (indexClass.indexOf(''ms-navheader'') != -1) {

                            addClass(node_temp.parentNode, ''ms-navheader-selected'');
                            
                        }
                        while (node_temp.parentNode.id != myArray) {

                            if (node_temp.parentNode.id.split(''_'')[0].match(''ul'')) {

                                showMenu(node_temp.parentNode);
                            }
                            if (node_temp.parentNode.parentNode.id ==myArray) {

                                if (node_temp.parentNode.id.split(''_'')[0].match(''li'')) {
                                    var temp = node_temp.parentNode.getElementsByTagName(''UL'');

                                    for (var i = 0; i < temp.length; i++) {

                                        if (node.parentNode.parentNode.id == temp[i].parentNode.id) {

                                            showMenu(temp[i]);
                                        }
                                    }
                                }
                            }
                            node_temp = node_temp.parentNode;
                        }
                    }
                }
            }
     
    
    function toggleMenu2param(node, link) {
        
        if (!document.getElementById) return false;
        if (!link) return false;
        hideallmenusamelevel(node);
        if (!node) location.href = link;

        var old_class;
        old_class=node.parentNode.className;
        if (node.className == ''classhide'') {
            node.className = ''classshow'';
            
            node.parentNode.className=old_class + '' seleted-leftmenu'';
        }
        else {
            node.className = ''classhide'';
          
            node.parentNode.className=old_class.split('' '')[0] ;
        }
    }
    function toggleMenu(node) {
     
        if (!document.getElementById) return false;
        hideallmenusamelevel(node);
        var old_class;
        old_class=node.parentNode.className;

        if (node.className == ''classhide'') {
            node.className = ''classshow'';
            
       
            
            node.parentNode.className= old_class + '' seleted-leftmenu'';

        }
        else {
            node.className = ''classhide'';
            //alert(old_class.split('' '')[0]);
            node.parentNode.className=old_class.split('' '')[0] ;
        }
    }
    function findNode(obj) {
        if (obj == null) return false;
        var elements = obj.getElementsByTagName(''a'');
        if (location.href.indexOf(''?'') != -1) {
            for (i = 0; i < elements.length; i++) {
                if (elements[i].href.indexOf(''?'') != -1) {
                    if (location.href.toLowerCase().match(elements[i].href.split(''?'')[0].toLowerCase()) && location.href.split(''?'')[1].toLowerCase() == elements[i].href.split(''?'')[1].toLowerCase() && elements[i].href.split(''?'')[1].length == location.href.split(''?'')[1].length) {

                        return elements[i];
                    }
                }
            }
        }
        else {
            for (i = 0; i < elements.length; i++) {
                if (location.href.toLowerCase().match(elements[i].href.toLowerCase())) {

                    return elements[i];
                }
            }
        }
        return ''-1'';
    }

    function showMenu(node) {
        if (!document.getElementById) return false;

        if (node.className == ''classhide'') {
            node.className = ''classshow'';
        }
        else {
            node.className = ''classshow'';
        }
    }
    function hideallmenusamelevel(currentnode) {
 
        var currentlevel = currentnode.id.split(''ul'')[1].split(''_'')[0];

        var links = currentnode.parentNode.parentNode.getElementsByTagName(''ul'');


        for (var i = 0; i < links.length; i++) {


            oneul = links[i];

            if (oneul) {

                oneid = oneul.id;
                onelevel = oneul.id.split(''ul'')[1].split(''_'')[0];
                if (onelevel >= currentlevel && oneul != currentnode) {
                    hideonemenu(oneul);
                }
            }
        }
    }
    function hideonemenu(node) {
        if (!document.getElementById) return false;
        if (!node) return false;

        node.className = ''classhide'';
    }
   function addClass(element, value) {

            if (!element.className) {
                element.className = value;
            } else {
                newClassName = element.className;
                newClassName += '' '';
                newClassName += value;
                element.className = newClassName;
            }
        }
        



checkUrl(''menuproduct_28510335-50e1-4822-aedc-544ad44c6f6e'');


//<![CDATA[
_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;_spOriginalFormAction = document.forms[0].action; _spSuppressFormOnSubmitWrapper=true;//]]>


<!--
function S16862886_Submit() {GoSearch(null,''ctl00_PlaceHolderTopNavBar_g_5e7fb9af_198a_403d_8d7b_7aba80cbe200_S16862886_InputKeywords'',null,true,false,null,null,null,null,''\u002fpages\u002fketquatk.aspx'', ''Trang web Này'',''Danh sách Này'', ''Thư mục Này'', ''Trang web Có liên quan'', ''\u002f_layouts\u002fOSSSearchResults.aspx'');}
// -->

// append an onload event handler
var S16862886__onload= document.body.onload;
if(typeof document.body.onload == ''function'')
{
 document.body.onload = function()
 {
S16862886__onload();        
  document.getElementById(''ctl00_PlaceHolderTopNavBar_g_5e7fb9af_198a_403d_8d7b_7aba80cbe200_S16862886_InputKeywords'').name = ''InputKeywords'';
 }
}
else
{
 document.body.onload = function()
 {
  eval(S16862886__onload);        
  document.getElementById(''ctl00_PlaceHolderTopNavBar_g_5e7fb9af_198a_403d_8d7b_7aba80cbe200_S16862886_InputKeywords'').name = ''InputKeywords'';
 }
}

function S16862886_OSBEK(event1) { 
if((event1.which == 10) || (event1.which == 13))
{   
S16862886_Submit();
}
}
// -->

<!--
function S3031AEBB_Submit() {GoSearch(null,''ctl00_PlaceHolderSearchArea_ctl01_S3031AEBB_InputKeywords'',null,true,true,''ctl00_PlaceHolderSearchArea_ctl01_SBScopesDDL'',''ctl00_PlaceHolderSearchArea_ctl01_ctl00'',null,null,''http:\u002f\u002fwww.quan9.hochiminhcity.gov.vn\u002f_layouts\u002fOSSSearchResults.aspx'', ''Trang web Này'',''Danh sách Này'', ''Thư mục Này'', ''Trang web Có liên quan'', ''\u002f_layouts\u002fOSSSearchResults.aspx'');}
// -->

// append an onload event handler
var S3031AEBB__onload= document.body.onload;
if(typeof document.body.onload == ''function'')
{
 document.body.onload = function()
 {
S3031AEBB__onload();        
  document.getElementById(''ctl00_PlaceHolderSearchArea_ctl01_S3031AEBB_InputKeywords'').name = ''InputKeywords'';
 }
}
else
{
 document.body.onload = function()
 {
  eval(S3031AEBB__onload);        
  document.getElementById(''ctl00_PlaceHolderSearchArea_ctl01_S3031AEBB_InputKeywords'').name = ''InputKeywords'';
 }
}

function S3031AEBB_OSBEK(event1) { 
if((event1.which == 10) || (event1.which == 13))
{   
S3031AEBB_Submit();
}
}
// -->




//<![CDATA[
Sys.Application.initialize();
//]]>', CAST(N'2015-06-18 00:59:22.380' AS DateTime), N'Safe', 8)
INSERT [dbo].[USERS] ([UserID], [UserName], [PassWords], [FullName], [Email]) VALUES (1, N'admin', N'admin', N'Tran Hoang Canh', N'hoangcanhsek6')
INSERT [dbo].[USERS] ([UserID], [UserName], [PassWords], [FullName], [Email]) VALUES (2, N'hoangcanhsek6', N'hoangcanhsek6', N'Royal Canh', N'11520028@gm.uit.edu.vn')
INSERT [dbo].[WEB] ([WebID], [NameSite], [URL], [IPPublic], [IPPrivate], [WebPriority], [Phones], [Emails], [searchText], [WebStatus], [BanText], [isEnable]) VALUES (1, N'Quan 2', N'http://www.quan2.hochiminhcity.gov.vn/', N'116.193.64.28', N' ', 5, N'1212312132', N'11520028@gm.uit.edu.vn', N'13212313123dasdsad', N'Safe', N'Hack', 1)
INSERT [dbo].[WEB] ([WebID], [NameSite], [URL], [IPPublic], [IPPrivate], [WebPriority], [Phones], [Emails], [searchText], [WebStatus], [BanText], [isEnable]) VALUES (2, N'Quan 1', N'http://www.quan1.hochiminhcity.gov.vn/portal/', N'125.234.8.82', N'255.255.255.0', 1, N'0979999999', N'11520028@gm.uit.edu.vn', N'hacker', N'Safe', N'Hack', 1)
INSERT [dbo].[WEB] ([WebID], [NameSite], [URL], [IPPublic], [IPPrivate], [WebPriority], [Phones], [Emails], [searchText], [WebStatus], [BanText], [isEnable]) VALUES (3, N'Quan 4', N'http://www.quan4.hochiminhcity.gov.vn/', N'116.193.65.6', N' ', 5, N'1212312132', N'11520028@gm.uit.edu.vn', N'13212313123dasdsad', N'Safe', N'Hack', 1)
INSERT [dbo].[WEB] ([WebID], [NameSite], [URL], [IPPublic], [IPPrivate], [WebPriority], [Phones], [Emails], [searchText], [WebStatus], [BanText], [isEnable]) VALUES (4, N'Quan 5', N'http://www.quan5.hochiminhcity.gov.vn/', N'116.193.64.31', NULL, NULL, NULL, N'11520028@gm.uit.edu.vn', NULL, N'Safe', N'Hack', 1)
INSERT [dbo].[WEB] ([WebID], [NameSite], [URL], [IPPublic], [IPPrivate], [WebPriority], [Phones], [Emails], [searchText], [WebStatus], [BanText], [isEnable]) VALUES (5, N'Quan 7', N'http://www.quan7.hochiminhcity.gov.vn/', N'116.193.64.29', NULL, NULL, NULL, N'11520028@gm.uit.edu.vn', NULL, N'Safe', N'Hack', 1)
INSERT [dbo].[WEB] ([WebID], [NameSite], [URL], [IPPublic], [IPPrivate], [WebPriority], [Phones], [Emails], [searchText], [WebStatus], [BanText], [isEnable]) VALUES (6, N'Binh Thanh', N'http://www.binhthanh.hochiminhcity.gov.vn/', NULL, NULL, NULL, NULL, N'11520028@gm.uit.edu.vn', NULL, N'Safe', N'Hack', 1)
INSERT [dbo].[WEB] ([WebID], [NameSite], [URL], [IPPublic], [IPPrivate], [WebPriority], [Phones], [Emails], [searchText], [WebStatus], [BanText], [isEnable]) VALUES (7, N'Tan Binh', N'http://tanbinh.hochiminhcity.gov.vn/', NULL, NULL, NULL, NULL, N'11520028@gm.uit.edu.vn', NULL, N'Safe', N'Hack', 1)
INSERT [dbo].[WEB] ([WebID], [NameSite], [URL], [IPPublic], [IPPrivate], [WebPriority], [Phones], [Emails], [searchText], [WebStatus], [BanText], [isEnable]) VALUES (8, N'Quan 9', N'http://www.quan9.hochiminhcity.gov.vn/default.aspx', NULL, NULL, NULL, NULL, N'11520028@gm.uit.edu.vn', NULL, N'Safe', N'Hack', 1)
USE [master]
GO
ALTER DATABASE [TRACKING_DEFACE] SET  READ_WRITE 
GO
