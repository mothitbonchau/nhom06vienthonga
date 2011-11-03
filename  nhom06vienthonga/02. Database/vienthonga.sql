-- MySQL dump 10.13  Distrib 5.5.9, for Win32 (x86)
--
-- Host: localhost    Database: vienthonga
-- ------------------------------------------------------
-- Server version	5.1.30-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `vienthonga`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `vienthonga` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `vienthonga`;

--
-- Table structure for table `chitietdienthoai`
--

DROP TABLE IF EXISTS `chitietdienthoai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chitietdienthoai` (
  `MaChiTietDienThoai` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `Mang` longtext COLLATE utf8_unicode_ci,
  `NgonNgu` longtext COLLATE utf8_unicode_ci,
  `LoaiManHinh` longtext COLLATE utf8_unicode_ci,
  `KichThuocHienThi` longtext COLLATE utf8_unicode_ci,
  `KieuChuong` longtext COLLATE utf8_unicode_ci,
  `TinNhan` longtext COLLATE utf8_unicode_ci,
  `KetNoi` longtext COLLATE utf8_unicode_ci,
  `Camera` longtext COLLATE utf8_unicode_ci,
  `DanhBa` longtext COLLATE utf8_unicode_ci,
  `BoNhoTrong` longtext COLLATE utf8_unicode_ci,
  `Rung` longtext COLLATE utf8_unicode_ci,
  `GPGS` longtext COLLATE utf8_unicode_ci,
  `m3G` longtext COLLATE utf8_unicode_ci,
  `WLan` longtext COLLATE utf8_unicode_ci,
  `DongHo` longtext COLLATE utf8_unicode_ci,
  `BaoThuc` longtext COLLATE utf8_unicode_ci,
  `DaiFM` longtext COLLATE utf8_unicode_ci,
  `TroChoi` longtext COLLATE utf8_unicode_ci,
  `TrinhDuyet` longtext COLLATE utf8_unicode_ci,
  `JaVa` longtext COLLATE utf8_unicode_ci,
  `QuayPhim` longtext COLLATE utf8_unicode_ci,
  `GhiAm` longtext COLLATE utf8_unicode_ci,
  `NgheNhac` longtext COLLATE utf8_unicode_ci,
  `XemPhim` longtext COLLATE utf8_unicode_ci,
  `GhiAmCuocGoi` longtext COLLATE utf8_unicode_ci,
  `LoaNgoai` longtext COLLATE utf8_unicode_ci,
  `TinhTrang` int(11) DEFAULT NULL,
  `MaSanPham` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaChiTietDienThoai`),
  KEY `FK_ChiTietDienThoai_SanPham` (`MaSanPham`),
  CONSTRAINT `FK_ChiTietDienThoai_SanPham` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietdienthoai`
--

LOCK TABLES `chitietdienthoai` WRITE;
/*!40000 ALTER TABLE `chitietdienthoai` DISABLE KEYS */;
INSERT INTO `chitietdienthoai` VALUES ('MCTDT1','Full mạng','Đa ngôn ngữ','Full ngang',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MSP1'),('MCTDT2','3g','Campuchia','HD720',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MSP3'),('MCTDT3','3G','Tiếng Việt','Ngang',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MSP5'),('MCTDT4','2G','tiếng mọi','Trắng đen',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MSP7'),('MCTDT5','5G','Đa ngôn ngữ','Siêu phẳng',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MSP9');
/*!40000 ALTER TABLE `chitietdienthoai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitietdonhang`
--

DROP TABLE IF EXISTS `chitietdonhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chitietdonhang` (
  `MaChiTietDonHang` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `MaDonHang` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaSanPham` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `DonGia` float DEFAULT NULL,
  `GiamGia` float DEFAULT NULL,
  `ThanhTien` float DEFAULT NULL,
  `TrangThai` int(11) DEFAULT NULL,
  `TinhTrang` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaChiTietDonHang`),
  KEY `FK_ChiTietDonHang_DonHang` (`MaDonHang`),
  KEY `FK_ChiTietDonHang_SanPham` (`MaSanPham`),
  CONSTRAINT `FK_ChiTietDonHang_DonHang` FOREIGN KEY (`MaDonHang`) REFERENCES `donhang` (`MaDonHang`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_ChiTietDonHang_SanPham` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietdonhang`
--

LOCK TABLES `chitietdonhang` WRITE;
/*!40000 ALTER TABLE `chitietdonhang` DISABLE KEYS */;
INSERT INTO `chitietdonhang` VALUES ('MCTDH1','MDH1','MSP2',1,1.7e+007,150000,1.685e+007,0,0),('MCTDH2','MDH1','MSP1',2,2.5e+006,100000,4.9e+006,0,0);
/*!40000 ALTER TABLE `chitietdonhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitietlaptop`
--

DROP TABLE IF EXISTS `chitietlaptop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chitietlaptop` (
  `MaChiTietLaptop` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `CongNgheCPU` longtext COLLATE utf8_unicode_ci,
  `TocDoCPU` longtext COLLATE utf8_unicode_ci,
  `BoNhoDem` longtext COLLATE utf8_unicode_ci,
  `FortSizeBus` longtext COLLATE utf8_unicode_ci,
  `HangCPU` longtext COLLATE utf8_unicode_ci,
  `ThongTinMotherBoard` longtext COLLATE utf8_unicode_ci,
  `DungLuongRam` longtext COLLATE utf8_unicode_ci,
  `CongNgheRam` longtext COLLATE utf8_unicode_ci,
  `BusRam` longtext COLLATE utf8_unicode_ci,
  `MucRamToiDa` longtext COLLATE utf8_unicode_ci,
  `DungLuongOCung` longtext COLLATE utf8_unicode_ci,
  `CongNgheOCung` longtext COLLATE utf8_unicode_ci,
  `GiaoThucKetNoi` longtext COLLATE utf8_unicode_ci,
  `SoVongQuay` longtext COLLATE utf8_unicode_ci,
  `KichThuocManHinh` longtext COLLATE utf8_unicode_ci,
  `ChuanManHinh` longtext COLLATE utf8_unicode_ci,
  `CardDoHoa` longtext COLLATE utf8_unicode_ci,
  `LoaiCard` longtext COLLATE utf8_unicode_ci,
  `DungLuongCard` longtext COLLATE utf8_unicode_ci,
  `CardAmThanh` longtext COLLATE utf8_unicode_ci,
  `ChuanAmThanh` longtext COLLATE utf8_unicode_ci,
  `KetNoi` longtext COLLATE utf8_unicode_ci,
  `Bluetooth` longtext COLLATE utf8_unicode_ci,
  `Camera` longtext COLLATE utf8_unicode_ci,
  `VideoOut` longtext COLLATE utf8_unicode_ci,
  `USB` longtext COLLATE utf8_unicode_ci,
  `CardReader` longtext COLLATE utf8_unicode_ci,
  `Adapter` longtext COLLATE utf8_unicode_ci,
  `CongNghePin` longtext COLLATE utf8_unicode_ci,
  `ThoiGianSuDungPin` longtext COLLATE utf8_unicode_ci,
  `ThongTinHeDieuHanh` longtext COLLATE utf8_unicode_ci,
  `TinhTrang` int(11) DEFAULT NULL,
  `MaSanPham` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaChiTietLaptop`),
  KEY `FK_ChiTietLaptop_SanPham` (`MaSanPham`),
  CONSTRAINT `FK_ChiTietLaptop_SanPham` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietlaptop`
--

LOCK TABLES `chitietlaptop` WRITE;
/*!40000 ALTER TABLE `chitietlaptop` DISABLE KEYS */;
INSERT INTO `chitietlaptop` VALUES ('MCTLT1','Core i 10','3 x 10^8 m/s','Full server',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MSP2'),('MCTLT2','Core i 10','2.54 Ghz','10 Mb',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MSP4'),('MCTLT3','Core i 10','3 Ghz','5 Mb',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MSP6'),('MCTLT4','Core i 15','5 Ghz','5 Mb',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MSP8'),('MCTLT5','Core i 7','2,54 Ghz','3 Mb',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'MSP10');
/*!40000 ALTER TABLE `chitietlaptop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `congty`
--

DROP TABLE IF EXISTS `congty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `congty` (
  `MaCongTy` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `TenCongTy` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DiaChi` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DienThoai` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HotLine` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Website` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GioiThieu` longtext COLLATE utf8_unicode_ci,
  `Fax` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaCongTy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `congty`
--

LOCK TABLES `congty` WRITE;
/*!40000 ALTER TABLE `congty` DISABLE KEYS */;
INSERT INTO `congty` VALUES ('1041','Viễn Thông A','HCM','0907272011','19001080','shophoa@yahoo,com','www.vienthonga.com','Hàng chính hãng con gà cồ','(084) 272011');
/*!40000 ALTER TABLE `congty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donhang`
--

DROP TABLE IF EXISTS `donhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `donhang` (
  `MaDonHang` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `NgayDat` datetime DEFAULT NULL,
  `MaNguoiDung` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TongTien` float DEFAULT NULL,
  `GiamGia` float DEFAULT NULL,
  `ThanhTien` float DEFAULT NULL,
  `MaHinhThucThanhToan` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TinhTrang` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaDonHang`),
  KEY `Fk_DonHang_NguoiDung` (`MaNguoiDung`),
  KEY `FK_DonHang_HinhThucThanhToan` (`MaHinhThucThanhToan`),
  CONSTRAINT `FK_DonHang_HinhThucThanhToan` FOREIGN KEY (`MaHinhThucThanhToan`) REFERENCES `hinhthucthanhtoan` (`MaHinhThucThanhToan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Fk_DonHang_NguoiDung` FOREIGN KEY (`MaNguoiDung`) REFERENCES `nguoidung` (`MaNguoiDung`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donhang`
--

LOCK TABLES `donhang` WRITE;
/*!40000 ALTER TABLE `donhang` DISABLE KEYS */;
INSERT INTO `donhang` VALUES ('MDH1','2011-10-31 08:26:45','MND1',1.7e+007,250000,1.675e+007,'GN',0);
/*!40000 ALTER TABLE `donhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giamgia`
--

DROP TABLE IF EXISTS `giamgia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `giamgia` (
  `MaGiamGia` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `GiaGiam` int(11) DEFAULT NULL,
  `NgayBatDau` datetime DEFAULT NULL,
  `NgayKetThuc` datetime DEFAULT NULL,
  `MaSanPham` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TinhTrang` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaGiamGia`),
  KEY `FK_GiamGia_SanPham` (`MaSanPham`),
  CONSTRAINT `FK_GiamGia_SanPham` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giamgia`
--

LOCK TABLES `giamgia` WRITE;
/*!40000 ALTER TABLE `giamgia` DISABLE KEYS */;
INSERT INTO `giamgia` VALUES ('GG1',100000,'2011-10-25 00:00:00','2011-11-25 00:00:00','MSP1',0),('GG2',150000,'2011-10-25 00:00:00','2011-11-30 00:00:00','MSP2',0);
/*!40000 ALTER TABLE `giamgia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giohang`
--

DROP TABLE IF EXISTS `giohang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `giohang` (
  `MaGioHang` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `MaSanPham` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `DonGia` float DEFAULT NULL,
  `ThanhTien` float DEFAULT NULL,
  `TinhTrang` int(11) DEFAULT NULL,
  `MaNguoiDung` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaGioHang`),
  KEY `FK_GioHang_NguoiDung` (`MaNguoiDung`),
  KEY `FK_GioHang_SanPham` (`MaSanPham`),
  CONSTRAINT `FK_GioHang_NguoiDung` FOREIGN KEY (`MaNguoiDung`) REFERENCES `nguoidung` (`MaNguoiDung`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_GioHang_SanPham` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giohang`
--

LOCK TABLES `giohang` WRITE;
/*!40000 ALTER TABLE `giohang` DISABLE KEYS */;
INSERT INTO `giohang` VALUES ('MGH1','MSP2',1,1.7e+007,1.7e+007,1,'MND1'),('MGH2','MSP1',2,2.5e+006,5e+006,1,'MND1');
/*!40000 ALTER TABLE `giohang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gopy`
--

DROP TABLE IF EXISTS `gopy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gopy` (
  `MaGopY` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `HoTen` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DiaChi` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TieuDe` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NoiDung` longtext COLLATE utf8_unicode_ci,
  `NgayGopY` datetime DEFAULT NULL,
  `TinhTrang` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaGopY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gopy`
--

LOCK TABLES `gopy` WRITE;
/*!40000 ALTER TABLE `gopy` DISABLE KEYS */;
INSERT INTO `gopy` VALUES ('MGY1','Nguyễn Văn Tèo','Phụ Thọ, Q.3,HCM','teo_sung_rang@yahoo.com','Giao diện xấu','Thằng nào làm giám đốc vậy ? Giao diện xấu quá, ai mà dám mua hàng','2011-09-27 00:00:00',0),('MGY2','Bành Thị Nở','Gầm Cầu, Q.15, HCM','no_coi_suong@yahoo.com','Thêm chức năng đi anh ơi','em là nở. Em góp ý là mấy anh nên thêm nhiều chức năng hơn nữa. Ví dụ chức năng. Cho nở mua thiếu. cúm ơn mấy anh','2011-09-27 00:00:00',0);
/*!40000 ALTER TABLE `gopy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hang`
--

DROP TABLE IF EXISTS `hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hang` (
  `MaHang` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `TenHang` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TinhTrang` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaHang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hang`
--

LOCK TABLES `hang` WRITE;
/*!40000 ALTER TABLE `hang` DISABLE KEYS */;
INSERT INTO `hang` VALUES ('MH1','Nokia',0),('MH10','Motorola',0),('MH11','Malata',0),('MH12','F-Moblie',0),('MH13','Dell',0),('MH14','Acer',0),('MH15','IBM',0),('MH16','Lenovo',0),('MH17','HP',0),('MH18','Apple',0),('MH19','Asus',0),('MH2','SamSung',0),('MH20','Toshiba',0),('MH21','NEC',0),('MH22','Sony',0),('MH23','Gateway',0),('MH3','Sony Ericsson',0),('MH4','K-Touch',0),('MH5','Mobell',0),('MH6','Q-Mobile',0),('MH7','LG',0),('MH8','HTC',0),('MH9','BlackBerry',0);
/*!40000 ALTER TABLE `hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hinhanhcongty`
--

DROP TABLE IF EXISTS `hinhanhcongty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hinhanhcongty` (
  `MaHinhAnhCongTy` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `TenHinhAnhCongTy` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DuongDan` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaCongTy` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TinhTrang` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaHinhAnhCongTy`),
  KEY `FK_HinhAnhCongTy_CongTy` (`MaCongTy`),
  CONSTRAINT `FK_HinhAnhCongTy_CongTy` FOREIGN KEY (`MaCongTy`) REFERENCES `congty` (`MaCongTy`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hinhanhcongty`
--

LOCK TABLES `hinhanhcongty` WRITE;
/*!40000 ALTER TABLE `hinhanhcongty` DISABLE KEYS */;
/*!40000 ALTER TABLE `hinhanhcongty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hinhanhkhuyenmai`
--

DROP TABLE IF EXISTS `hinhanhkhuyenmai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hinhanhkhuyenmai` (
  `MaHinhAnhKhuyenMai` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `DuongDan` mediumtext COLLATE utf8_unicode_ci,
  `MaKhuyenMai` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TinhTrang` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaHinhAnhKhuyenMai`),
  KEY `FK_HinhAnhKhuyenMai_KhuyenMai` (`MaKhuyenMai`),
  CONSTRAINT `FK_HinhAnhKhuyenMai_KhuyenMai` FOREIGN KEY (`MaKhuyenMai`) REFERENCES `khuyenmai` (`MaKhuyenMai`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hinhanhkhuyenmai`
--

LOCK TABLES `hinhanhkhuyenmai` WRITE;
/*!40000 ALTER TABLE `hinhanhkhuyenmai` DISABLE KEYS */;
INSERT INTO `hinhanhkhuyenmai` VALUES ('MHAKM1','1156262528.jpg','MKM1',0);
/*!40000 ALTER TABLE `hinhanhkhuyenmai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hinhanhsanpham`
--

DROP TABLE IF EXISTS `hinhanhsanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hinhanhsanpham` (
  `MaHinhAnhSanPham` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `DuongDan` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaSanPham` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TinhTrang` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaHinhAnhSanPham`),
  KEY `FK_HinhAnhSanPham_SanPham` (`MaSanPham`),
  CONSTRAINT `FK_HinhAnhSanPham_SanPham` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hinhanhsanpham`
--

LOCK TABLES `hinhanhsanpham` WRITE;
/*!40000 ALTER TABLE `hinhanhsanpham` DISABLE KEYS */;
INSERT INTO `hinhanhsanpham` VALUES ('MHASP1','121.jpg','MSP1',0),('MHASP10','293.jpg','MSP10',0),('MHASP2','319.jpg','MSP2',0),('MHASP3','160.jpg','MSP3',0),('MHASP4','353.jpg','MSP4',0),('MHASP5','48.jpg','MSP5',0),('MHASP6','339.jpg','MSP6',0),('MHASP7','166.jpg','MSP7',0),('MHASP8','363.jpg','MSP8',0),('MHASP9','197.jpg','MSP9',0);
/*!40000 ALTER TABLE `hinhanhsanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hinhanhtintuc`
--

DROP TABLE IF EXISTS `hinhanhtintuc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hinhanhtintuc` (
  `MaHinhAnhTinTuc` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `DuongDan` mediumtext COLLATE utf8_unicode_ci,
  `MaTinTuc` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TinhTrang` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaHinhAnhTinTuc`),
  KEY `FK_HinhAnhTinTuc_TinTuc` (`MaTinTuc`),
  CONSTRAINT `FK_HinhAnhTinTuc_TinTuc` FOREIGN KEY (`MaTinTuc`) REFERENCES `tintuc` (`MaTinTuc`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hinhanhtintuc`
--

LOCK TABLES `hinhanhtintuc` WRITE;
/*!40000 ALTER TABLE `hinhanhtintuc` DISABLE KEYS */;
INSERT INTO `hinhanhtintuc` VALUES ('MHATT1','http://www.vienthonga.com/App_Themes/SanphamDienThoai/News/Optimus-Black-man-hinh-NOVA.jpg','MTT2',0),('MHATT2','http://static.hnammobile.com/images/stories/news/5633_large.jpg','MTT1',0);
/*!40000 ALTER TABLE `hinhanhtintuc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hinhthucthanhtoan`
--

DROP TABLE IF EXISTS `hinhthucthanhtoan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hinhthucthanhtoan` (
  `MaHinhThucThanhToan` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `TenHinhThucThanhToan` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NoiDungThanhToan` longtext COLLATE utf8_unicode_ci,
  `TinhTrang` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaHinhThucThanhToan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hinhthucthanhtoan`
--

LOCK TABLES `hinhthucthanhtoan` WRITE;
/*!40000 ALTER TABLE `hinhthucthanhtoan` DISABLE KEYS */;
INSERT INTO `hinhthucthanhtoan` VALUES ('CK','Chuyển Khoản','Nội dung gửi tiền quý khách vui lòng ghi theo mẫu (nếu chuyển qua phòng giao dịch, internet banking): <Tên khách đặt hàng> - <Số điện thoại đặt hàng> - <Model đặt hàng>Ví dụ:  Nguyễn Văn A – 0909152355 – samsung galaxy SII *Lưu ý: Sau khi chuyển tiền thành công, quý khách cần xác nhận chuyển khoản bằng 1 trong 2 cách sau:  (1)   Điện thoại thông báo đến số (84-8) 38633333 để được xử lý nhanh nhất. Thông tin quý khách cần cung cấp cho chúng tôi bao gồm: <Tên khách đặt hàng> <Ngân hàng đã chuyển tiền> <Số tiền đã chuyển> <Tên người chuyển tiền> (Nếu chuyển qua phòng giao dịch, internet banking) <Số tài khoản thẻ ATM hoặc tên chủ tài khoản ATM> (nếu chuyển qua máy ATM) (2)   Nhắn tin theo cú pháp và gửi tới số 0909.460.567: Nếu chuyển qua phòng giao dịch hoặc internet banking: <Mã ngân hàng> - < Tên người chuyển tiền > - <Số tiền đã chuyển> - < Tên khách đặt hàng > Ví dụ:  VCB - Nguyen Van A – 3.000.000vnd – Nguyen Van BNếu chuyển qua máy ATM: <Mã ngân hàng> - <Mã số tài khoản ATM hoặc Tên chủ tk ATM> - <Số tiền đã chuyển> - <Tên khách đặt hàng> Ví dụ:  VCB - Nguyen Van A (0071002185469) - 3.000.000vnd - Nguyen Van B',0),('GN','Giao Nhận','Nội dung gửi tiền quý khách vui lòng ghi theo mẫu (nếu chuyển qua phòng giao dịch, internet banking): <Tên khách đặt hàng> - <Số điện thoại đặt hàng> - <Model đặt hàng>Ví dụ:  Nguyễn Văn A – 0909152355 – samsung galaxy SII *Lưu ý: Sau khi chuyển tiền thành công, quý khách cần xác nhận chuyển khoản bằng 1 trong 2 cách sau:  (1)   Điện thoại thông báo đến số (84-8) 38633333 để được xử lý nhanh nhất. Thông tin quý khách cần cung cấp cho chúng tôi bao gồm: <Tên khách đặt hàng> <Ngân hàng đã chuyển tiền> <Số tiền đã chuyển> <Tên người chuyển tiền> (Nếu chuyển qua phòng giao dịch, internet banking) <Số tài khoản thẻ ATM hoặc tên chủ tài khoản ATM> (nếu chuyển qua máy ATM) (2)   Nhắn tin theo cú pháp và gửi tới số 0909.460.567: Nếu chuyển qua phòng giao dịch hoặc internet banking: <Mã ngân hàng> - < Tên người chuyển tiền > - <Số tiền đã chuyển> - < Tên khách đặt hàng > Ví dụ:  VCB - Nguyen Van A – 3.000.000vnd – Nguyen Van BNếu chuyển qua máy ATM: <Mã ngân hàng> - <Mã số tài khoản ATM hoặc Tên chủ tk ATM> - <Số tiền đã chuyển> - <Tên khách đặt hàng> Ví dụ:  VCB - Nguyen Van A (0071002185469) - 3.000.000vnd - Nguyen Van B',0);
/*!40000 ALTER TABLE `hinhthucthanhtoan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khuyenmai`
--

DROP TABLE IF EXISTS `khuyenmai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `khuyenmai` (
  `MaKhuyenMai` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `TenKhuyenMai` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NoiDungKhuyenMai` longtext COLLATE utf8_unicode_ci,
  `NgayBatDau` datetime DEFAULT NULL,
  `NgayKetThuc` datetime DEFAULT NULL,
  `TinhTrang` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaKhuyenMai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khuyenmai`
--

LOCK TABLES `khuyenmai` WRITE;
/*!40000 ALTER TABLE `khuyenmai` DISABLE KEYS */;
INSERT INTO `khuyenmai` VALUES ('MKM1','Xả hàng tồn','<p><span style=\"font-size: 12pt; line-height: 115%; font-family: Arial;\">            <strong>Chương tr&igrave;nh khuyến m&atilde;i bao gồm c&aacute;c sản phẩm thuộc d&ograve;ng Walkman: Sony Ericsson W8 Walkman, Sony Ericsson Mix Walkman, Sony Ericsson Zylo (W20i), Sony Ericsson Yendo (W150i), Sony Ericsson Spiro (W100i).</strong>        </span></p>\r<p>&nbsp;</p>\r<div style=\"text-align: center;\"><img height=\"600\" width=\"370\" alt=\" \" src=\"http://static.hnammobile.com/images/khuyenmai/km_rock.jpg\" /></div>\r<p>&nbsp;</p>\r<p><span style=\"font-size: 12pt; line-height: 115%; font-family: Arial,sans-serif;\">Sony Ericsson giới thiệu chương tr&igrave;nh khuyến mại đặc biệt - &ldquo;Rock thật đ&atilde; với Walkman&rdquo; - cho loạt sản phẩm điện thoại Sony Ericsson ch&iacute;nh h&atilde;ng thuộc d&ograve;ng Walkman từ ng&agrave;y 15/09/2011 - 31/10/2011.Cụ thể, gi&aacute; của Sony Ericsson W8 Walkman chỉ c&ograve;n 4.550.000 VND. Gi&aacute; của Sony Erisson Mix Walkman với thiết kế uốn cong v&agrave; giao diện 4 g&oacute;c trẻ trung chỉ c&oacute; 3.290.000 VND. C&aacute;c mẫu điện thoại nghe nhạc d&agrave;nh cho giới trẻ như Zylo (W20i), Spiro (W100i), Yendo (W150i) cũng được ưu đ&atilde;i đặc biệt với mức gi&aacute; lần lượt l&agrave; 2.850.000 VND; 1.570.000 VND v&agrave; 2.130.000 VND. Ngo&agrave;i ra, tặng k&egrave;m với mỗi điện thoại tr&ecirc;n l&agrave; chiếc &aacute;o thun phong c&aacute;ch Rock cực s&agrave;nh điệu.</span></p>\r<p><img height=\"356\" width=\"500\" alt=\" \" src=\"http://static.hnammobile.com/images/khuyenmai/ao_sony.jpg\" /></p>\r<p><strong><span style=\"font-size: 12pt; line-height: 115%; font-family: Arial,sans-serif;\">Ngo&agrave;i ra chỉ ri&ecirc;ng tại Hnam Mobile c&oacute; triển khai th&ecirc;m chương tr&igrave;nh mua Sony Ericsson X8 ch&iacute;nh h&atilde;ng với gi&aacute; ưu đ&atilde;i 4.290.000 VNđ c&ograve;n được tặng th&ecirc;m 1 balo thời trang, từ ng&agrave;y 15/9 đến 31/10/2011 </span></strong></p>\r<p>&nbsp;</p>\r<div style=\"text-align: center;\"><img height=\"400\" width=\"316\" alt=\" \" src=\"http://static.hnammobile.com/images/khuyenmai/balo_sony.jpg\" /></div>\r<p>&nbsp;</p>\r<p><strong>            <span style=\"font-family: Arial,sans-serif; font-size: 12pt; line-height: 115%; color: rgb(0, 0, 255);\">                <u>Lưu &yacute;</u>: Khuyến m&atilde;i chỉ &aacute;p dụng cho h&agrave;ng c&ocirc;ng ty, c&oacute; V.A.T             </span>        </strong></p>','2011-10-06 00:00:00','2011-11-06 00:00:00',0);
/*!40000 ALTER TABLE `khuyenmai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loainguoidung`
--

DROP TABLE IF EXISTS `loainguoidung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loainguoidung` (
  `MaLoaiNguoiDung` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `TenLoaiNguoiDung` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TinhTrang` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaLoaiNguoiDung`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loainguoidung`
--

LOCK TABLES `loainguoidung` WRITE;
/*!40000 ALTER TABLE `loainguoidung` DISABLE KEYS */;
INSERT INTO `loainguoidung` VALUES ('MLND1','Admin',0),('MLND2','Thành Viên',0),('MLND3','Nhân Viên',0);
/*!40000 ALTER TABLE `loainguoidung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaisanpham`
--

DROP TABLE IF EXISTS `loaisanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loaisanpham` (
  `MaLoaiSanPham` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `TenLoaiSanPham` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TinhTrang` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaLoaiSanPham`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaisanpham`
--

LOCK TABLES `loaisanpham` WRITE;
/*!40000 ALTER TABLE `loaisanpham` DISABLE KEYS */;
INSERT INTO `loaisanpham` VALUES ('DT','Điện Thoại',0),('LT','Laptop',0);
/*!40000 ALTER TABLE `loaisanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaisanphamhang`
--

DROP TABLE IF EXISTS `loaisanphamhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loaisanphamhang` (
  `MaLoaiSanPhamHang` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `MaLoaiSanPham` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaHang` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaLoaiSanPhamHang`),
  KEY `FK_LoaiSanPhamHang_LoaiSanPham` (`MaLoaiSanPham`),
  KEY `FK_LoaiSanPhamHang_Hang` (`MaHang`),
  CONSTRAINT `FK_LoaiSanPhamHang_Hang` FOREIGN KEY (`MaHang`) REFERENCES `hang` (`MaHang`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_LoaiSanPhamHang_LoaiSanPham` FOREIGN KEY (`MaLoaiSanPham`) REFERENCES `loaisanpham` (`MaLoaiSanPham`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaisanphamhang`
--

LOCK TABLES `loaisanphamhang` WRITE;
/*!40000 ALTER TABLE `loaisanphamhang` DISABLE KEYS */;
INSERT INTO `loaisanphamhang` VALUES ('MLSPH1','DT','MH1'),('MLSPH10','LT','MH19'),('MLSPH11','LT','MH16'),('MLSPH3','LT','MH20'),('MLSPH4','LT','MH17'),('MLSPH6','LT','MH22'),('MLSPH7','DT','MH4'),('MLSPH8','DT','MH5'),('MLSPH9','DT','MH9');
/*!40000 ALTER TABLE `loaisanphamhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nganhang`
--

DROP TABLE IF EXISTS `nganhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nganhang` (
  `MaNganHang` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `TenNganHang` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SoTaiKhoan` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DiaChi` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TinhTrang` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaNganHang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nganhang`
--

LOCK TABLES `nganhang` WRITE;
/*!40000 ALTER TABLE `nganhang` DISABLE KEYS */;
INSERT INTO `nganhang` VALUES ('ANZ','Ngân Hàng ANZ','586.5006','Ngân Hàng ANZ - HCM',0),('DAB','Ngân Hàng DongABank','000.238.550.003','Đông Á - Tân Bình, HCM',0),('MLB','Ngân Hàng Quân Đội','701.110.037.3839','Ngân Hàng Quân Đội - Chợ Lớn, HCM',0),('SCB','Ngân Hàng Sacombank','060.007.113.156','Sacombank - Điện Biên Phủ, HCM',0),('VCB','Ngân Hàng Vietcombank','0421.003.791.572','Vietcombank - Phú Thọ, HCM',0);
/*!40000 ALTER TABLE `nganhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoidung`
--

DROP TABLE IF EXISTS `nguoidung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nguoidung` (
  `MaNguoiDung` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `TenDangNhap` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MatKhau` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TenNguoiDung` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CMND` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DienThoai` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DiaChi` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaLoaiNguoiDung` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NgayDangKy` datetime DEFAULT NULL,
  `TinhTrang` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaNguoiDung`),
  KEY `FK_NguoiDung_LoaiNguoiDung` (`MaLoaiNguoiDung`),
  CONSTRAINT `FK_NguoiDung_LoaiNguoiDung` FOREIGN KEY (`MaLoaiNguoiDung`) REFERENCES `loainguoidung` (`MaLoaiNguoiDung`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoidung`
--

LOCK TABLES `nguoidung` WRITE;
/*!40000 ALTER TABLE `nguoidung` DISABLE KEYS */;
INSERT INTO `nguoidung` VALUES ('MND1','user1','e10adc3949ba59abbe56e057f20f883e','Hoàng Thị Kim Như','hoangthikimnhu@yahoo.com','285150590','908021098','Hồng Bàng, Q6. HCm','MLND1','2011-09-27 00:00:00',0),('MND2','user2','e10adc3949ba59abbe56e057f20f883e','Trần Ngọc Long','nhatlong1505@gmail.com','258159560','1685301683','Trần Hưng Đạo, Q.1, HCM','MLND2','2011-09-27 00:00:00',0),('MND3','user3','e10adc3949ba59abbe56e057f20f883e','Nguyễn Trần Thị Thu Hà','nguyentran.thuha151189@yahoo.com','266456789','974567576','Nguyễn Văn Cừ, Q.5, HCM','MLND2','2011-09-27 00:00:00',0),('MND4','user4','e10adc3949ba59abbe56e057f20f883e','Nguyễn Hải Bình','sau_con_89@yahoo,com','345678345','976589899','Nguyễn Tất Thành, Q.4, HCM','MLND3','2011-09-27 00:00:00',0),('MND5','user5','e10adc3949ba59abbe56e057f20f883e','Nguyễn Thiên Anh','thienanh_89@yahoo.com','567898989','974345345','Cầu Ông Luông, Q6, HCM','MLND3','2011-09-27 00:00:00',0),('MND6','user6','e10adc3949ba59abbe56e057f20f883e','Lê Văn L','lvl@yahoo.com','654651212','486512312','Việt Nam','MLND3','2011-10-12 01:16:46',0);
/*!40000 ALTER TABLE `nguoidung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sanpham` (
  `MaSanPham` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `TenSanPham` longtext COLLATE utf8_unicode_ci,
  `MaLoaiSanPham` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaHang` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `GiaBan` float DEFAULT NULL,
  `MauSac` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ThoiGianBaoHanh` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KichThuoc` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TrongLuong` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TinhTrang` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaSanPham`),
  KEY `FK_SanPham_Hang` (`MaHang`),
  KEY `FK_SanPham_LoaiSanPham` (`MaLoaiSanPham`),
  CONSTRAINT `FK_SanPham_Hang` FOREIGN KEY (`MaHang`) REFERENCES `hang` (`MaHang`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanpham`
--

LOCK TABLES `sanpham` WRITE;
/*!40000 ALTER TABLE `sanpham` DISABLE KEYS */;
INSERT INTO `sanpham` VALUES ('MSP1','Doanh nghiệp','DT','MH4',20,2.5e+006,'Đen xanh','1 năm','10 mm x 5 mm x 8 mm','70 g',0),('MSP10','CoXex X Teen','LT','MH19',36,1.7e+007,'Đỏ đậm','1 năm','25 x 30 x 20','2 kg',0),('MSP2','Doanh nhân','LT','MH17',50,1.7e+007,'Đỏ đen','1 năm','10 x 12 x 15','1,5 kg',0),('MSP3','Super rẻ','DT','MH5',25,5.3e+006,'Xanh lam','1 năm','10 x 25 x 32','0,5 kq',0),('MSP4','Laptop siêu rẻ','LT','MH22',50,2.5e+007,'Tím hồng','1 năm','10 x 25 x 36','2,2 kg',0),('MSP5','Trẻ Trung','DT','MH9',80,1.75e+006,'Đen','1 năm','15  x 25 x 65','0,2 kg',0),('MSP6','Phong Cách','LT','MH16',100,9.999e+006,'Vàng','1 năm','15 x 25 x 20','2,4 kg',0),('MSP7','Đồ đập đá','DT','MH5',50,1.7e+006,'Đen','1 năm','10 x 20 x 15','70g',0),('MSP8','Gammer','LT','MH22',45,2.5e+007,'Tím xanh','1 năm','25 x 30 x20','2,2 kg',0),('MSP9','Superman','DT','MH1',26,3e+006,'Đen trắng','1 năm','10 x 10 x 10','100g',0);
/*!40000 ALTER TABLE `sanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sieuthi`
--

DROP TABLE IF EXISTS `sieuthi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sieuthi` (
  `MaSieuThi` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `TenSieuThi` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaVung` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DiaChi` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TinhTrang` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaSieuThi`),
  KEY `FK_SieuThi_Vung` (`MaVung`),
  CONSTRAINT `FK_SieuThi_Vung` FOREIGN KEY (`MaVung`) REFERENCES `vung` (`MaVung`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sieuthi`
--

LOCK TABLES `sieuthi` WRITE;
/*!40000 ALTER TABLE `sieuthi` DISABLE KEYS */;
INSERT INTO `sieuthi` VALUES ('MST1','Viễn Thông A1','MV1','74, Cách Mạng Tháng 8',0),('MST10','Viễn Thông A10','MV10','36, Nguyễn Thái Học, Vũng Tàu',0),('MST11','Viễn Thông A11','MV11','46, Phố Thái Hà, Đống Đa, Hà Nội',0),('MST12','Viễn Thông A12','MV2','139, Phường Não, Q.2',0),('MST13','Viễn Thông A13','MV2','172, Phan Đăng Lưu, P.2  Q.Phú Nhuận',0),('MST14','Viễn Thông A14','MV2','74, CMT8, P.6, Q.2',0),('MST15','Viễn Thông A15','MV2','328-330, Đường 3 Tháng 2',0),('MST2','Viễn Thông A2','MV3','56/2b, Trần Hưng Đạo, Long Xuyên',0),('MST3','Viễn Thông A3','MV4','12, Nguyễn Huệ A, Long Xuyên',0),('MST4','Viễn Thông A4','MV5','12b-12c, Nguyễn Trãi, Q.Ninh Kiều, Cần Thơ',0),('MST5','Viễn Thông A5','MV6','Số 10, Trần Hưng Đạo, P5, TP.Cà Mau',0),('MST6','Viễn Thông A6','MV7','Số 6, Ngô Quyền, TP.Buôn Mê Thuột',0),('MST7','Viễn Thông A7','MV12','521, Đại Lộ Bình Dương, Thủ Dầu Một, Bình Dươ',0),('MST8','Viễn Thông A8','MV8','Số 19, Nguyễn Dình Chiểu, Thủ Dầu Một, Bình D',0),('MST9','Viễn Thông A9','MV9','246, QL.15, TP.Biên Hòa',0);
/*!40000 ALTER TABLE `sieuthi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thamso`
--

DROP TABLE IF EXISTS `thamso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thamso` (
  `MaThamSo` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `SoSanPhamTrenTrang` int(11) DEFAULT NULL,
  `DuongDanHinhAnh` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaThamSo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thamso`
--

LOCK TABLES `thamso` WRITE;
/*!40000 ALTER TABLE `thamso` DISABLE KEYS */;
INSERT INTO `thamso` VALUES ('TS1',5,'images/');
/*!40000 ALTER TABLE `thamso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tintuc`
--

DROP TABLE IF EXISTS `tintuc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tintuc` (
  `MaTinTuc` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `TenTinTuc` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NoiDungTinTuc` longtext COLLATE utf8_unicode_ci,
  `NgayDang` datetime DEFAULT NULL,
  `TinhTrang` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaTinTuc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tintuc`
--

LOCK TABLES `tintuc` WRITE;
/*!40000 ALTER TABLE `tintuc` DISABLE KEYS */;
INSERT INTO `tintuc` VALUES ('MTT1','Xả hàng tồn','<p>\n        <span style=\"font-size: 12pt; line-height: 115%; font-family: Arial;\">\n            <strong>Chương trình khuyến mãi bao gồm các sản phẩm thuộc dòng Walkman: Sony Ericsson W8 Walkman, Sony Ericsson Mix Walkman, Sony Ericsson Zylo (W20i), Sony Ericsson Yendo (W150i), Sony Ericsson Spiro (W100i).</strong>\n        </span>\n        </p>\n\n        <p>&nbsp;</p>\n\n        <div style=\"text-align: center;\">\n            <img height=\"600\" width=\"370\" alt=\" \" src=\"http://static.hnammobile.com/images/khuyenmai/km_rock.jpg\" />\n        </div>\n\n        <p>&nbsp;</p>\n\n        <p>\n        <br><span style=\"font-size: 12pt; line-height: 115%; font-family: Arial,sans-serif;\">Sony Ericsson giới thiệu chương trình khuyến mại đặc biệt - “Rock thật đã với Walkman” - cho loạt sản phẩm điện thoại Sony Ericsson chính hãng thuộc dòng Walkman từ ngày 15/09/2011 - 31/10/2011.<br><br>Cụ thể, giá của Sony Ericsson W8 Walkman chỉ còn 4.550.000 VND. Giá của Sony Erisson Mix Walkman với thiết kế uốn cong và giao diện 4 góc trẻ trung chỉ có 3.290.000 VND. Các mẫu điện thoại nghe nhạc dành cho giới trẻ như Zylo (W20i), Spiro (W100i), Yendo (W150i) cũng được ưu đãi đặc biệt với mức giá lần lượt là 2.850.000 VND; 1.570.000 VND và 2.130.000 VND. Ngoài ra, tặng kèm với mỗi điện thoại trên là chiếc áo thun phong cách Rock cực sành điệu.</span>\n        </p>\n        <p>\n            <img height=\"356\" width=\"500\" alt=\" \" src=\"http://static.hnammobile.com/images/khuyenmai/ao_sony.jpg\">\n        </p>\n        <p>\n            <strong><span style=\"font-size: 12pt; line-height: 115%; font-family: Arial,sans-serif;\">Ngoài ra chỉ riêng tại Hnam Mobile có triển khai thêm chương trình mua Sony Ericsson X8 chính hãng với giá ưu đãi 4.290.000 VNđ còn được tặng thêm 1 balo thời trang, từ ngày 15/9 đến 31/10/2011 </span></strong>\n        </p>\n\n        <p>&nbsp;</p>\n\n        <div style=\"text-align: center;\">\n            <img height=\"400\" width=\"316\" alt=\" \" src=\"http://static.hnammobile.com/images/khuyenmai/balo_sony.jpg\">\n        </div>\n\n        <p>&nbsp;</p>\n\n        <strong>\n            <span style=\"font-family: Arial,sans-serif; font-size: 12pt; line-height: 115%; color: rgb(0, 0, 255);\">\n                <u>Lưu ý</u>: Khuyến mãi chỉ áp dụng cho hàng công ty, có V.A.T \n            </span>\n        </strong>','2011-10-13 00:00:00',0),('MTT2','Optimus Black chính hãng giá 8,9 triệu','<span style=\"font-weight: bold;\">Optimus Black chính hãng giá 8,9 triệu</span></font><br><br><span style=\"font-weight: bold;\">LG vừa đưa lên kệ chiếc di động màn hình Nova đầu tiên, Optimus Black với giá 8,9 triệu, thấp hơn 10 triệu như tiết lộ trước đó của hãng.<br><br></span></p><p class=\"Normal\"> Đây là mức giá tốt cho một chiếc smartphone chạy Android màn <span id=\"cpms_link0\" class=\"cmps_it_intextLink\"> hình</span>\n 4 inch, tốc độ 1GHz. Mức giá này tương đương chiếc Samsung Wave S8500 \nbán ra cách đây một năm và rẻ hơn chiếc Galaxy S 4GB hiện có giá 9,3 \ntriệu đồng.</p>\n<p class=\"Normal\">Optimus Black là mẫu smartphone cao cấp thứ hai của LG\n giới thiệu trong năm nay. Tháng trước, chiếc Optimus 2X cũng đã lên kệ \nvới giá 15 triệu đồng. Model mới không có vi xử lý lõi kép, nhưng bù lại\n máy sử dụng màn hình Nova, công nghệ dựa trên nền tảng LCD với độ sáng \ntốt.</p>\n<p class=\"Normal\">Optimus Black mỏng chỉ 9,2 mm, mỏng hơn cả iPhone 4. \nMáy có hai camera, phía trước là 2 Megapixel, trong khi máy ảnh 5 \"chấm\"\n phía sau hỗ trợ quay phim HD. Mẫu Android mới của LG nằm trong kế hoạch\n nâng cấp lên Android 2.3.</p>\n<p class=\"Normal\"><strong>Dưới đây hình ảnh thực tế Optimus Black chính hãng.</strong></p>\n\n<table width=\"1\" align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\n<tbody><tr>\n<td><img alt=\"Máy sở hữu màn hình rộng 4 inch, công nghệ Nova.\" src=\"http://sohoa.vnexpress.net/Files/Subject/3B/9B/45/5F/LG-OPTIMUS-BLACK-1.jpg\" width=\"480\" align=\"middle\" border=\"1\" height=\"320\"></td></tr>\n<tr>\n<td class=\"Image\">Máy sở hữu màn hình rộng 4 inch, công nghệ Nova.</td></tr></tbody></table>\n<table width=\"1\" align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\n<tbody><tr>\n<td><img alt=\"Phía dưới là 4 nút bấm cơ bản của Android.\" src=\"http://sohoa.vnexpress.net/Files/Subject/3B/9B/45/5F/LG-OPTIMUS-BLACK-2.jpg\" width=\"480\" align=\"middle\" border=\"1\" height=\"334\"></td></tr>\n<tr>\n<td class=\"Image\">Phía dưới là 4 nút bấm cơ bản của Android.</td></tr></tbody></table>\n<table width=\"1\" align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\n<tbody><tr>\n<td><img alt=\"Camera phía trước đàm thoại video.\" src=\"http://sohoa.vnexpress.net/Files/Subject/3B/9B/45/5F/LG-OPTIMUS-BLACK-3.jpg\" width=\"480\" align=\"middle\" border=\"1\" height=\"350\"></td></tr>\n<tr>\n<td class=\"Image\">Camera phía trước đàm thoại video.</td></tr></tbody></table>\n\n<table width=\"1\" align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\n<tbody><tr>\n<td><img alt=\"Menu chính.\" src=\"http://sohoa.vnexpress.net/Files/Subject/3B/9B/45/5F/LG-OPTIMUS-BLACK-4.jpg\" width=\"480\" align=\"middle\" border=\"1\" height=\"313\"></td></tr>\n<tr>\n<td class=\"Image\">Menu chính.</td></tr></tbody></table>\n<table width=\"1\" align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\n<tbody><tr>\n<td><img alt=\"Cạnh trái của máy là nút tăng giảm âm lượng, chụp ảnh.\" src=\"http://sohoa.vnexpress.net/Files/Subject/3B/9B/45/5F/LG-OPTIMUS-BLACK-5.jpg\" width=\"480\" align=\"middle\" border=\"1\" height=\"295\"></td></tr>\n<tr>\n<td class=\"Image\">Cạnh trái của máy là nút tăng giảm âm lượng, chụp ảnh.</td></tr></tbody></table>\n<table width=\"1\" align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\n<tbody><tr>\n<td><img alt=\"Cạnh phải.\" src=\"http://sohoa.vnexpress.net/Files/Subject/3B/9B/45/5F/LG-OPTIMUS-BLACK-6.jpg\" width=\"480\" align=\"middle\" border=\"1\" height=\"308\"></td></tr>\n<tr>\n<td class=\"Image\">Cạnh phải.</td></tr></tbody></table>\n\n<table width=\"1\" align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\n<tbody><tr>\n<td><img alt=\"Cổng microUSB, giắc cắm tai nghe 3,5 mm và phím nguồn trên đỉnh.\" src=\"http://sohoa.vnexpress.net/Files/Subject/3B/9B/45/5F/LG-OPTIMUS-BLACK-7.jpg\" width=\"480\" align=\"middle\" border=\"1\" height=\"323\"></td></tr>\n<tr>\n<td class=\"Image\">Cổng microUSB, giắc cắm tai nghe 3,5 mm và phím nguồn trên đỉnh.</td></tr></tbody></table>\n<table width=\"1\" align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\n<tbody><tr>\n<td><img alt=\"Mic dưới máy.\" src=\"http://sohoa.vnexpress.net/Files/Subject/3B/9B/45/5F/LG-OPTIMUS-BLACK-8.jpg\" width=\"480\" align=\"middle\" border=\"1\" height=\"367\"></td></tr>\n<tr>\n<td class=\"Image\">Mic dưới máy.</td></tr></tbody></table>\n<table width=\"1\" align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\n<tbody><tr>\n<td><img alt=\"Mặt sau model này với bộ vỏ nhựa, khá liền mạch.\" src=\"http://sohoa.vnexpress.net/Files/Subject/3B/9B/45/5F/LG-OPTIMUS-BLACK-9.jpg\" width=\"480\" align=\"middle\" border=\"1\" height=\"334\"></td></tr>\n<tr>\n<td class=\"Image\">Mặt sau model này với bộ vỏ nhựa, khá liền mạch.</td></tr></tbody></table>\n\n<table width=\"1\" align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\n<tbody><tr>\n<td><img alt=\"Loa ngoài nằm ở góc.\" src=\"http://sohoa.vnexpress.net/Files/Subject/3B/9B/45/5F/LG-OPTIMUS-BLACK-9-1.jpg\" width=\"480\" align=\"middle\" border=\"1\" height=\"348\"></td></tr>\n<tr>\n<td class=\"Image\">Loa ngoài nằm ở góc.</td></tr></tbody></table>\n<table width=\"1\" align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\n<tbody><tr>\n<td><img alt=\"Màn hình Home cho phép người dùng kéo trượt ngang...\" src=\"http://sohoa.vnexpress.net/Files/Subject/3B/9B/45/5F/LG-OPTIMUS-BLACK-10.jpg\" width=\"480\" align=\"middle\" border=\"1\" height=\"320\"></td></tr>\n<tr>\n<td class=\"Image\">Màn hình Home cho phép người dùng kéo trượt ngang...</td></tr></tbody></table>\n<table width=\"1\" align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\n<tbody><tr>\n<td class=\"Image\"><img alt=\"...đi vào các hiển thị khác nhau.\" src=\"http://sohoa.vnexpress.net/Files/Subject/3B/9B/45/5F/LG-OPTIMUS-BLACK-11.jpg\" width=\"480\" align=\"middle\" border=\"1\" height=\"320\"></td></tr>\n<tr>\n<td class=\"Image\">... đi vào các hiển thị khác nhau.</td></tr></tbody></table>\n\n<strong><br><span style=\"font-weight: normal;\">Nguồn tin Số Hóa</span></strong>','2011-10-13 00:00:00',0);
/*!40000 ALTER TABLE `tintuc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vung`
--

DROP TABLE IF EXISTS `vung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vung` (
  `MaVung` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `TenVung` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TinhTrang` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaVung`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vung`
--

LOCK TABLES `vung` WRITE;
/*!40000 ALTER TABLE `vung` DISABLE KEYS */;
INSERT INTO `vung` VALUES ('MV1','Hà Nội ',0),('MV10','Cần Thơ',0),('MV11','Kiên Giang',0),('MV12','Cà Mau',0),('MV2','Hồ Chí Minh',0),('MV3','Vĩnh Phúc',0),('MV4','Nghệ An',0),('MV5','Huế',0),('MV6','Bình Phước',0),('MV7','Đồng Nai',0),('MV8','Bình Dương',0),('MV9','Vũng Tàu',0);
/*!40000 ALTER TABLE `vung` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-11-03 11:05:48
