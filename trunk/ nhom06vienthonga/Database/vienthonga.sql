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
INSERT INTO `chitietdienthoai` VALUES ('MCTDT1','	GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 900 / 1700 / 1900 / 2100 ','Có Tiếng Việt','	AMOLED cảm ứng điện dung, 16 triệu màu','	480 x 854 pixels, 3.9 inches - Mặt kính Gorilla chống trầy xướt - Chống chói dưới ánh sáng mặt trời - Chạm đa điểm - Xoay màn hình tự động - Cảm biến tự động tắt màn hình','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	Bluetooth USB','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 1 GB RAM','Có','Có','Có','Không','Có','Có','Không','Có','Có','Không','Có','Không','Có','Có','Không','Không',0,'MSP31'),('MCTDT10','GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 1900 / 2100 ','Có Tiếng Việt','TFT cảm ứng điện dung, 16 triệu màu','Trắng đen','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	Bluetooth USB ','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 1 GB RAM','Có','Có','Có','Có','Có','Có','Không','Có','Có','Có','Có','Có','Có','Không','Có','Có',0,'MSP40'),('MCTDT11','	GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 900 / 1700 / 1900 / 2100 ','Tiếng Anh','	AMOLED cảm ứng điện dung, 16 triệu màu','	480 x 854 pixels, 3.9 inches - Mặt kính Gorilla chống trầy xướt - Chống chói dưới ánh sáng mặt trời - Chạm đa điểm - Xoay màn hình tự động - Cảm biến tự động tắt màn hình','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	Bluetooth USB ','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 1 GB RAM','Có','Không','Có','Không','Có','Có','Không','Có','Có','Có','Không','Không','Có','Có','Có','Không',0,'MSP41'),('MCTDT12','	GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 900 / 1700 / 1900 / 2100 ','Có Tiếng Việt','	AMOLED cảm ứng điện dung, 16 triệu màu','TFT 65.536 màu','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	-','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 1 GB RAM','Có','Có','Có','Không','Có','Có','Không','Không','Có','Không','Có','Không','Không','Có','Không','Có',0,'MSP42'),('MCTDT13','	GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 900 / 1700 / 1900 / 2100 ','Có Tiếng Việt','TFT cảm ứng điện dung, 16 triệu màu','TFT 65.536 màu','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	-','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 1 GB RAM','Có','Có','Có','Không','Có','Có','Không','Có','Có','Có','Có','Có','Có','Có','Không','Không',0,'MSP43'),('MCTDT14','	GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 900 / 1700 / 1900 / 2100 ','Tiếng Anh','	AMOLED cảm ứng điện dung, 16 triệu màu','	480 x 854 pixels, 3.9 inches - Mặt kính Gorilla chống trầy xướt - Chống chói dưới ánh sáng mặt trời - Chạm đa điểm - Xoay màn hình tự động - Cảm biến tự động tắt màn hình','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	Bluetooth USB ','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 1 GB RAM','Có','Không','Có','Không','Có','Không','Không','Có','Có','Có','Có','Không','Có','Có','Có','Không',0,'MSP44'),('MCTDT15','	GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 900 / 1700 / 1900 / 2100 ','Có Tiếng Việt','AMOLED cảm ứng điện dung, 16 triệu màu','Trắng đen','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	Bluetooth USB ','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 1 GB RAM','Có','Có','Có','Không','Có','Có','Không','Có','Không','Có','Có','Không','Có','Có','Có','Không',0,'MSP45'),('MCTDT16','	GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 900 / 1700 / 1900 / 2100 ','Có Tiếng Việt','TFT cảm ứng điện dung, 16 triệu màu','	480 x 854 pixels, 3.9 inches - Mặt kính Gorilla chống trầy xướt - Chống chói dưới ánh sáng mặt trời - Chạm đa điểm - Xoay màn hình tự động - Cảm biến tự động tắt màn hình','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	Bluetooth USB ','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 1 GB RAM','Có','Có','Có','Có','Không','Có','Không','Có','Có','Có','Không','Không','Có','Không','Không','Có',0,'MSP46'),('MCTDT17','	GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 900 / 1700 / 1900 / 2100 ','Tiếng Anh','TFT cảm ứng điện dung, 16 triệu màu','TFT 65.536 màu','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	-','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 1 GB RAM','Có','Có','Có','Không','Có','Có','Không','Có','Có','Có','Có','Có','Có','Có','Có','Không',0,'MSP47'),('MCTDT18','	GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 900 / 1700 / 1900 / 2100 ','Có Tiếng Việt','	AMOLED cảm ứng điện dung, 16 triệu màu','	480 x 854 pixels, 3.9 inches - Mặt kính Gorilla chống trầy xướt - Chống chói dưới ánh sáng mặt trời - Chạm đa điểm - Xoay màn hình tự động - Cảm biến tự động tắt màn hình','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	-','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 1 GB RAM','Có','Không','Có','Không','Có','Có','Không','Có','Có','Có','Có','Không','Có','Có','Có','Không',0,'MSP48'),('MCTDT19','	GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 900 / 1700 / 1900 / 2100 ','Có Tiếng Việt','TFT cảm ứng điện dung, 16 triệu màu','TFT 65.536 màu','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	Bluetooth USB ','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 1 GB RAM','Có','Có','Có','Không','Có','Có','Không','Có','Có','Có','Có','Có','Có','Có','Có','Có',0,'MSP49'),('MCTDT2','	GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 900 / 1700 / 1900 / 2100 ','Tiếng Anh','	LED-backlit IPS TFT, cảm ứng điện dung, 16 triệu m','	480 x 854 pixels, 3.9 inches - Mặt kính Gorilla chống trầy xướt - Chống chói dưới ánh sáng mặt trời - Chạm đa điểm - Xoay màn hình tự động - Cảm biến tự động tắt màn hình','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	Bluetooth USB','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 2 GB RAM','Có','Có','Có','Không','Có','Có','Không','Có','Có','Có','Có','Không','Không','Có','Có','Không',0,'MSP32'),('MCTDT20','	GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 900 / 1700 / 1900 / 2100 ','Có Tiếng Việt','	AMOLED cảm ứng điện dung, 16 triệu màu','Trắng đen','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	Bluetooth USB ','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 1 GB RAM','Có','Có','Có','Có','Có','Có','Không','Không','Không','Có','Có','Không','Có','Có','Có','Không',0,'MSP50'),('MCTDT21','	GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 900 / 1700 / 1900 / 2100 ','Có Tiếng Việt','	AMOLED cảm ứng điện dung, 16 triệu màu','	480 x 854 pixels, 3.9 inches - Mặt kính Gorilla chống trầy xướt - Chống chói dưới ánh sáng mặt trời - Chạm đa điểm - Xoay màn hình tự động - Cảm biến tự động tắt màn hình','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	-','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 1 GB RAM','Có','Không','Có','Không','Có','Có','Không','Có','Có','Có','Có','Không','Có','Có','Có','Không',0,'MSP51'),('MCTDT22','	GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 900 / 1700 / 1900 / 2100 ','Có Tiếng Việt','	AMOLED cảm ứng điện dung, 16 triệu màu','	480 x 854 pixels, 3.9 inches - Mặt kính Gorilla chống trầy xướt - Chống chói dưới ánh sáng mặt trời - Chạm đa điểm - Xoay màn hình tự động - Cảm biến tự động tắt màn hình','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	-','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 1 GB RAM','Có','Có','Có','Có','Có','Không','Không','Có','Không','Có','Không','Có','Có','Có','Có','Không',0,'MSP52'),('MCTDT23','	GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 900 / 1700 / 1900 / 2100 ','Có Tiếng Việt','	AMOLED cảm ứng điện dung, 16 triệu màu','	480 x 854 pixels, 3.9 inches - Mặt kính Gorilla chống trầy xướt - Chống chói dưới ánh sáng mặt trời - Chạm đa điểm - Xoay màn hình tự động - Cảm biến tự động tắt màn hình','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	Bluetooth USB ','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 1 GB RAM','Có','Có','Có','Không','Có','Có','Không','Có','Có','Có','Có','Không','Có','Có','Có','Có',0,'MSP53'),('MCTDT24','	GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 900 / 1700 / 1900 / 2100 ','Có Tiếng Việt','TFT cảm ứng điện dung, 16 triệu màu','Trắng đen','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	Bluetooth USB ','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 1 GB RAM','Có','Không','Có','Không','Có','Không','Không','Có','Có','Không','Có','Không','Có','Có','Có','Không',0,'MSP54'),('MCTDT25','	GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 900 / 1700 / 1900 / 2100 ','Có Tiếng Việt','	AMOLED cảm ứng điện dung, 16 triệu màu','	480 x 854 pixels, 3.9 inches - Mặt kính Gorilla chống trầy xướt - Chống chói dưới ánh sáng mặt trời - Chạm đa điểm - Xoay màn hình tự động - Cảm biến tự động tắt màn hình','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	Bluetooth USB ','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 1 GB RAM','Có','Có','Có','Có','Có','Có','Không','Không','Có','Có','Có','Không','Có','Có','Có','Không',0,'MSP55'),('MCTDT26','	GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 900 / 1700 / 1900 / 2100 ','Có Tiếng Việt','	AMOLED cảm ứng điện dung, 16 triệu màu','	480 x 854 pixels, 3.9 inches - Mặt kính Gorilla chống trầy xướt - Chống chói dưới ánh sáng mặt trời - Chạm đa điểm - Xoay màn hình tự động - Cảm biến tự động tắt màn hình','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	Bluetooth USB ','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 1 GB RAM','Có','Có','Có','Không','Có','Có','Không','Có','Có','Có','Có','Có','Có','Có','Có','Có',0,'MSP56'),('MCTDT27','	GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 900 / 1700 / 1900 / 2100 ','Có Tiếng Việt','	AMOLED cảm ứng điện dung, 16 triệu màu','TFT 65.536 màu','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	-','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 1 GB RAM','Có','Không','Có','Có','Có','Có','Không','Có','Có','Có','Có','Không','Có','Có','Không','Không',0,'MSP57'),('MCTDT28','	GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 900 / 1700 / 1900 / 2100 ','Có Tiếng Việt','	AMOLED cảm ứng điện dung, 16 triệu màu','	480 x 854 pixels, 3.9 inches - Mặt kính Gorilla chống trầy xướt - Chống chói dưới ánh sáng mặt trời - Chạm đa điểm - Xoay màn hình tự động - Cảm biến tự động tắt màn hình','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	-','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 1 GB RAM','Có','Có','Có','Không','Có','Không','Không','Có','Có','Có','Có','Có','Không','Có','Có','Có',0,'MSP58'),('MCTDT29','	GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 900 / 1700 / 1900 / 2100 ','Tiếng Anh','TFT cảm ứng điện dung, 16 triệu màu','	480 x 854 pixels, 3.9 inches - Mặt kính Gorilla chống trầy xướt - Chống chói dưới ánh sáng mặt trời - Chạm đa điểm - Xoay màn hình tự động - Cảm biến tự động tắt màn hình','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	Bluetooth USB ','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 1 GB RAM','Có','Có','Có','Không','Có','Có','Không','Có','Không','Có','Có','Có','Có','Có','Có','Không',0,'MSP59'),('MCTDT3','GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 1900 / 2100 ','Có Tiếng Việt','	AMOLED cảm ứng điện dung, 16 triệu màu','	480 x 854 pixels, 3.9 inches - Mặt kính Gorilla chống trầy xướt - Chống chói dưới ánh sáng mặt trời - Chạm đa điểm - Xoay màn hình tự động - Cảm biến tự động tắt màn hình','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	Bluetooth USB','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 1 GB RAM','Có','Không','Có','Có','Có','Có','Không','Có','Có','Có','Có','Không','Có','Có','Có','Không',0,'MSP33'),('MCTDT30','	GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 900 / 1700 / 1900 / 2100 ','Có Tiếng Việt','	AMOLED cảm ứng điện dung, 16 triệu màu','Trắng đen','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	Bluetooth USB ','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 1 GB RAM','Có','Có','Có','Không','Có','Có','Không','Có','Có','Có','Có','Có','Có','Có','Không','Có',0,'MSP60'),('MCTDT4','	GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 900 / 1700 / 1900 / 2100 ','Tiếng Anh','	LED-backlit IPS TFT, cảm ứng điện dung, 16 triệu m','	480 x 854 pixels, 3.9 inches - Mặt kính Gorilla chống trầy xướt - Chống chói dưới ánh sáng mặt trời - Chạm đa điểm - Xoay màn hình tự động - Cảm biến tự động tắt màn hình','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	Bluetooth USB','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 1 GB RAM','Có','Có','Có','Không','Không','Có','Không','Có','Có','Có','Không','Không','Có','Không','Có','Không',0,'MSP34'),('MCTDT5','GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 1900 / 2100 ','Có Tiếng Việt','	AMOLED cảm ứng điện dung, 16 triệu màu','	480 x 854 pixels, 3.9 inches - Mặt kính Gorilla chống trầy xướt - Chống chói dưới ánh sáng mặt trời - Chạm đa điểm - Xoay màn hình tự động - Cảm biến tự động tắt màn hình','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	Bluetooth USB','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 1 GB RAM','Có','Không','Có','Không','Có','Có','Không','Có','Không','Có','Có','Có','Có','Có','Có','Có',0,'MSP35'),('MCTDT6','	GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 900 / 1700 / 1900 / 2100 ','Tiếng Anh','	AMOLED cảm ứng điện dung, 16 triệu màu','TFT 65.536 màu','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	Bluetooth USB ','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 1 GB RAM','Có','Có','Có','Có','Có','Có','Không','Có','Có','Có','Không','Không','Có','Có','Có','Không',0,'MSP36'),('MCTDT7','GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 1900 / 2100 ','Có Tiếng Việt','TFT cảm ứng điện dung, 16 triệu màu','	480 x 854 pixels, 3.9 inches - Mặt kính Gorilla chống trầy xướt - Chống chói dưới ánh sáng mặt trời - Chạm đa điểm - Xoay màn hình tự động - Cảm biến tự động tắt màn hình','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	-','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 1 GB RAM','Có','Có','Có','Không','Có','Có','Không','Có','Có','Có','Có','Không','Không','Có','Có','Không',0,'MSP37'),('MCTDT8','	GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 900 / 1700 / 1900 / 2100 ','Có Tiếng Việt','	AMOLED cảm ứng điện dung, 16 triệu màu','TFT 65.536 màu','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	-','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 1 GB RAM','Có','Không','Có','Có','Có','Không','Không','Có','Có','Không','Có','Có','Có','Có','Không','Có',0,'MSP38'),('MCTDT9','GSM 850 / 900 / 1800 / 1900 ; HSDPA 850 / 1900 / 2100 ','Tiếng Anh','	AMOLED cảm ứng điện dung, 16 triệu màu','	480 x 854 pixels, 3.9 inches - Mặt kính Gorilla chống trầy xướt - Chống chói dưới ánh sáng mặt trời - Chạm đa điểm - Xoay màn hình tự động - Cảm biến tự động tắt màn hình','	Rung, Đa âm điệu ( MIDI), MP3','	SMS (threaded view), MMS, Email, Push Email, IM','	Bluetooth USB ','8 MP, 3264x2448 pixels, Carl Zeiss optics, autofocus, dual LED flash. Geo-tagging, face detection, touch-focus','	Rất nhiều, Danh bạ hình ảnh','	16GB dùng chung, 1 GB RAM','Có','Có','Có','Không','Có','Có','Không','Có','Không','Có','Có','Không','Có','Không','Có','Không',0,'MSP39');
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
INSERT INTO `chitietlaptop` VALUES ('MCTLT1','TFT cảm ứng điện dung, 16 triệu màu','2.0 GHz','2MB L3 cache','1066MHz FBS','INTEL','Mobile Intel® HM55 Express Chipset','2GB','DDR III','1333MHz','6 GB','500GB','Đĩa từ (HDD)','SATA','7200 prm','15.0 inch','16:9 HD (1366x768) LED backlit ','Intel® HD Graphics 3000','Onboard','Shared with memory','SonicFocus','2.0','Altec Lansing® speakers,Headphones, Microphone','Đang cập nhật','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','6-Cell Lithium-Ion','Đang cập nhật','Free Dos',0,'MSP1'),('MCTLT10','INTEL Core i5-2537M Sandy Bridge','2.0 GHz','3MB L3 cache','1066MHz FBS','INTEL','Mobile Intel® HM55 Express Chipset','2GB','DDR III','1066 Mbit/s','6 GB','120GB','Đĩa từ (HDD)','SATA','Đang cập nhật','15.0 inch','SuperBright HD LED Display (1366 x 768)','Intel® HD Graphics','Onboard','Shared with memory','Tích hợp','2.0','2 Speaker,Headphones, Microphone','Bluetooth 3.0+HS','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','12-Cell Lithium-Ion','2h','WIN7',0,'MSP10'),('MCTLT11','INTEL Core i5-2537M Sandy Bridge','1.4 GHz','2MB L3 cache','1066MHz FBS','AMD','Mobile Intel® HM65 Express Chipset','4GB','DDR III','1333MHz','6 GB','500GB','Đĩa từ (HDD)','SATA','5400 prm','14.0 inch','16:9 HD (1366x768) LED backlit ','Intel® HD Graphics','Onboard','Shared with memory','SonicFocus','2.0','2 Speaker,Headphones, Microphone','Đang cập nhật','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','6-Cell Lithium-Ion','3.5h','Free Dos',0,'MSP11'),('MCTLT12','TFT cảm ứng điện dung, 16 triệu màu','2.0 GHz','3MB L3 cache','1066MHz FBS','INTEL','Mobile Intel® HM55 Express Chipset','2GB','DDR III','1066 Mbit/s','6 GB','120GB','Đĩa từ (HDD)','SATA','5400 prm','16.0 inch','16:9 HD (1366x768) LED backlit ','Intel® HD Graphics 3000','Onboard','Shared with memory','Tích hợp','2.0','Altec Lansing® speakers,Headphones, Microphone','Đang cập nhật','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','6-Cell Lithium-Ion','Đang cập nhật','WIN7',0,'MSP12'),('MCTLT13','INTEL Core i5-2537M Sandy Bridge','2.0 GHz','2MB L3 cache','1066MHz FBS','INTEL','Mobile Intel® HM55 Express Chipset','2GB','DDR III','1066 Mbit/s','6 GB','500GB','Đĩa từ (HDD)','SATA','5400 prm','16.5 inch','SuperBright HD LED Display (1366 x 768)','Intel® HD Graphics','Onboard','Shared with memory','SonicFocus','2.0','Altec Lansing® speakers,Headphones, Microphone','Đang cập nhật','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','6-Cell Lithium-Ion','3.5h','Free Dos',0,'MSP13'),('MCTLT14','TFT cảm ứng điện dung, 16 triệu màu','1.4 GHz','2MB L3 cache','1066MHz FBS','AMD','Mobile Intel® HM55 Express Chipset','4GB','DDR III','1333MHz','6 GB','120GB','Đĩa từ (HDD)','SATA','7200 prm','16.0 inch','SuperBright HD LED Display (1366 x 768)','Intel® HD Graphics 3000','Onboard','Shared with memory','Tích hợp','2.0','2 Speaker,Headphones, Microphone','Đang cập nhật','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','12-Cell Lithium-Ion','3.5h','WIN7',0,'MSP14'),('MCTLT15','TFT cảm ứng điện dung, 16 triệu màu','2.0 GHz','3MB L3 cache','1066MHz FBS','INTEL','Mobile Intel® HM55 Express Chipset','2GB','DDR III','1333MHz','6 GB','500GB','Đĩa từ (HDD)','SATA','5400 prm','14.0 inch','16:9 HD (1366x768) LED backlit ','Intel® HD Graphics','Onboard','Shared with memory','SonicFocus','2.0','Altec Lansing® speakers,Headphones, Microphone','Bluetooth 3.0+HS','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','6-Cell Lithium-Ion','3.5h','Free Dos',0,'MSP15'),('MCTLT16','TFT cảm ứng điện dung, 16 triệu màu','2.0 GHz','2MB L3 cache','1066MHz FBS','INTEL','Mobile Intel® HM55 Express Chipset','2GB','DDR III','1066 Mbit/s','6 GB','120GB','Đĩa từ (HDD)','SATA','5400 prm','15.0 inch','16:9 HD (1366x768) LED backlit ','Intel® HD Graphics','Onboard','Shared with memory','SonicFocus','2.0','Altec Lansing® speakers,Headphones, Microphone','Đang cập nhật','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','6-Cell Lithium-Ion','Đang cập nhật','Free Dos',0,'MSP16'),('MCTLT17','INTEL Core i5-2537M Sandy Bridge','2.0 GHz','2MB L3 cache','1066MHz FBS','INTEL','Mobile Intel® HM65 Express Chipset','2GB','DDR III','1333MHz','6 GB','500GB','Đĩa từ (HDD)','SATA','Đang cập nhật','16.5 inch','SuperBright HD LED Display (1366 x 768)','Intel® HD Graphics','Onboard','Shared with memory','SonicFocus','4.1','Altec Lansing® speakers,Headphones, Microphone','Đang cập nhật','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','12-Cell Lithium-Ion','3.5h','Free Dos',0,'MSP17'),('MCTLT18','TFT cảm ứng điện dung, 16 triệu màu','1.4 GHz','2MB L3 cache','1066MHz FBS','AMD','Mobile Intel® HM55 Express Chipset','4GB','DDR III','1333MHz','6 GB','120GB','Đĩa từ (HDD)','SATA','5400 prm','14.0 inch','SuperBright HD LED Display (1366 x 768)','Intel® HD Graphics','Onboard','Shared with memory','Tích hợp','4.1','Altec Lansing® speakers,Headphones, Microphone','Bluetooth 3.0+HS','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','6-Cell Lithium-Ion','Đang cập nhật','WIN7',0,'MSP18'),('MCTLT19','INTEL Core i5-2537M Sandy Bridge','2.0 GHz','2MB L3 cache','1066MHz FBS','INTEL','Mobile Intel® HM55 Express Chipset','4GB','DDR III','1066 Mbit/s','6 GB','500GB','Đĩa từ (HDD)','SATA','5400 prm','16.5 inch','16:9 HD (1366x768) LED backlit ','Intel® HD Graphics 3000','Onboard','Shared with memory','SonicFocus','4.1','2 Speaker,Headphones, Microphone','Đang cập nhật','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','12-Cell Lithium-Ion','Đang cập nhật','Free Dos',0,'MSP19'),('MCTLT2','TFT cảm ứng điện dung, 16 triệu màu','2.0 GHz','2MB L3 cache','1066MHz FBS','INTEL','Mobile Intel® HM65 Express Chipset','2GB','DDR III','1066 Mbit/s','6 GB','500GB','Đĩa từ (HDD)','SATA','7200 prm','16.5 inch','16:9 HD (1366x768) LED backlit ','Intel® HD Graphics','Onboard','Shared with memory','SonicFocus','2.0','2 Speaker,Headphones, Microphone','Đang cập nhật','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','6-Cell Lithium-Ion','2h','Free Dos',0,'MSP2'),('MCTLT20','TFT cảm ứng điện dung, 16 triệu màu','2.0 GHz','2MB L3 cache','1066MHz FBS','AMD','Mobile Intel® HM55 Express Chipset','2GB','DDR III','1333MHz','6 GB','120GB','Đĩa từ (HDD)','SATA','5400 prm','14.0 inch','16:9 HD (1366x768) LED backlit ','Intel® HD Graphics','Onboard','Shared with memory','SonicFocus','2.0','Altec Lansing® speakers,Headphones, Microphone','Bluetooth 3.0+HS','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','12-Cell Lithium-Ion','Đang cập nhật','WIN7',0,'MSP20'),('MCTLT21','TFT cảm ứng điện dung, 16 triệu màu','2.0 GHz','2MB L3 cache','1066MHz FBS','INTEL','Mobile Intel® HM55 Express Chipset','4GB','DDR III','1333MHz','6 GB','500GB','Đĩa từ (HDD)','SATA','Đang cập nhật','14.0 inch','16:9 HD (1366x768) LED backlit ','Intel® HD Graphics','Onboard','Shared with memory','SonicFocus','2.0','2 Speaker,Headphones, Microphone','Đang cập nhật','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','6-Cell Lithium-Ion','2h','Free Dos',0,'MSP21'),('MCTLT22','TFT cảm ứng điện dung, 16 triệu màu','1.4 GHz','2MB L3 cache','1066MHz FBS','AMD','Mobile Intel® HM65 Express Chipset','2GB','DDR III','1333MHz','6 GB','500GB','Đĩa từ (HDD)','SATA','5400 prm','16.5 inch','16:9 HD (1366x768) LED backlit ','Intel® HD Graphics','Onboard','Shared with memory','Tích hợp','2.0','Altec Lansing® speakers,Headphones, Microphone','Bluetooth 3.0+HS','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','12-Cell Lithium-Ion','2h','Free Dos',0,'MSP22'),('MCTLT23','TFT cảm ứng điện dung, 16 triệu màu','2.0 GHz','2MB L3 cache','1066MHz FBS','INTEL','Mobile Intel® HM55 Express Chipset','2GB','DDR III','1066 Mbit/s','6 GB','500GB','Đĩa từ (HDD)','SATA','5400 prm','16.0 inch','16:9 HD (1366x768) LED backlit ','Intel® HD Graphics','Onboard','Shared with memory','SonicFocus','4.1','2 Speaker,Headphones, Microphone','Đang cập nhật','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','6-Cell Lithium-Ion','Đang cập nhật','Free Dos',0,'MSP23'),('MCTLT24','TFT cảm ứng điện dung, 16 triệu màu','2.0 GHz','2MB L3 cache','1066MHz FBS','INTEL','Mobile Intel® HM55 Express Chipset','4GB','DDR III','1333MHz','6 GB','500GB','Đĩa từ (HDD)','SATA','7200 prm','15.0 inch','16:9 HD (1366x768) LED backlit ','Intel® HD Graphics','Onboard','Shared with memory','Tích hợp','2.0','Altec Lansing® speakers,Headphones, Microphone','Đang cập nhật','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','12-Cell Lithium-Ion','Đang cập nhật','Free Dos',0,'MSP24'),('MCTLT25','TFT cảm ứng điện dung, 16 triệu màu','2.0 GHz','2MB L3 cache','1066MHz FBS','AMD','Mobile Intel® HM55 Express Chipset','2GB','DDR III','1333MHz','6 GB','500GB','Đĩa từ (HDD)','SATA','5400 prm','16.5 inch','16:9 HD (1366x768) LED backlit ','Intel® HD Graphics','Onboard','Shared with memory','SonicFocus','2.0','Altec Lansing® speakers,Headphones, Microphone','Đang cập nhật','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','6-Cell Lithium-Ion','Đang cập nhật','Free Dos',0,'MSP25'),('MCTLT26','TFT cảm ứng điện dung, 16 triệu màu','1.4 GHz','2MB L3 cache','1066MHz FBS','INTEL','Mobile Intel® HM55 Express Chipset','2GB','DDR III','1333MHz','6 GB','120GB','Đĩa từ (HDD)','SATA','Đang cập nhật','14.0 inch','16:9 HD (1366x768) LED backlit ','Intel® HD Graphics 3000','Onboard','Shared with memory','SonicFocus','2.0','Altec Lansing® speakers,Headphones, Microphone','Bluetooth 3.0+HS','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','6-Cell Lithium-Ion','2h','Free Dos',0,'MSP26'),('MCTLT27','TFT cảm ứng điện dung, 16 triệu màu','2.0 GHz','3MB L3 cache','1066MHz FBS','INTEL','Mobile Intel® HM55 Express Chipset','2GB','DDR III','1066 Mbit/s','6 GB','120GB','Đĩa từ (HDD)','SATA','7200 prm','15.0 inch','16:9 HD (1366x768) LED backlit ','Intel® HD Graphics','Onboard','Shared with memory','Tích hợp','4.1','2 Speaker,Headphones, Microphone','Đang cập nhật','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','6-Cell Lithium-Ion','3.5h','WIN7',0,'MSP27'),('MCTLT28','TFT cảm ứng điện dung, 16 triệu màu','2.0 GHz','2MB L3 cache','1066MHz FBS','AMD','Mobile Intel® HM65 Express Chipset','2GB','DDR III','1333MHz','6 GB','120GB','Đĩa từ (HDD)','SATA','5400 prm','16.0 inch','16:9 HD (1366x768) LED backlit ','Intel® HD Graphics','Onboard','Shared with memory','SonicFocus','4.1','Altec Lansing® speakers,Headphones, Microphone','Bluetooth 3.0+HS','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','12-Cell Lithium-Ion','3.5h','Free Dos',0,'MSP28'),('MCTLT29','INTEL Core i5-2537M Sandy Bridge','2.0 GHz','2MB L3 cache','1066MHz FBS','INTEL','Mobile Intel® HM55 Express Chipset','4GB','DDR III','1066 Mbit/s','6 GB','500GB','Đĩa từ (HDD)','SATA','Đang cập nhật','14.0 inch','16:9 HD (1366x768) LED backlit ','Intel® HD Graphics','Onboard','Shared with memory','Tích hợp','4.1','Altec Lansing® speakers,Headphones, Microphone','Đang cập nhật','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','6-Cell Lithium-Ion','Đang cập nhật','Free Dos',0,'MSP29'),('MCTLT3','TFT cảm ứng điện dung, 16 triệu màu','1.4 GHz','2MB L3 cache','1066MHz FBS','INTEL','Mobile Intel® HM55 Express Chipset','4GB','DDR III','1333MHz','6 GB','120GB','Đĩa từ (HDD)','SATA','7200 prm','15.0 inch','SuperBright HD LED Display (1366 x 768)','Intel® HD Graphics 3000','Onboard','Shared with memory','SonicFocus','2.0','Altec Lansing® speakers,Headphones, Microphone','Bluetooth 3.0+HS','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','12-Cell Lithium-Ion','2h','WIN7',0,'MSP3'),('MCTLT30','TFT cảm ứng điện dung, 16 triệu màu','2.0 GHz','3MB L3 cache','1066MHz FBS','AMD','Mobile Intel® HM65 Express Chipset','2GB','DDR III','1066 Mbit/s','6 GB','500GB','Đĩa từ (HDD)','SATA','5400 prm','14.0 inch','16:9 HD (1366x768) LED backlit ','Intel® HD Graphics','Onboard','Shared with memory','SonicFocus','2.0','2 Speaker,Headphones, Microphone','Đang cập nhật','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','6-Cell Lithium-Ion','2h','Free Dos',0,'MSP30'),('MCTLT4','INTEL Core i5-2537M Sandy Bridge','2.0 GHz','2MB L3 cache','1066MHz FBS','INTEL','Mobile Intel® HM55 Express Chipset','2GB','DDR III','1333MHz','6 GB','500GB','Đĩa từ (HDD)','SATA','Đang cập nhật','16.5 inch','16:9 HD (1366x768) LED backlit ','Intel® HD Graphics 3000','Onboard','Shared with memory','Tích hợp','2.0','Altec Lansing® speakers,Headphones, Microphone','Đang cập nhật','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','6-Cell Lithium-Ion','3.5h','Free Dos',0,'MSP4'),('MCTLT5','TFT cảm ứng điện dung, 16 triệu màu','1.4 GHz','2MB L3 cache','1066MHz FBS','INTEL','Mobile Intel® HM55 Express Chipset','4GB','DDR III','1333MHz','6 GB','120GB','Đĩa từ (HDD)','SATA','5400 prm','15.0 inch','16:9 HD (1366x768) LED backlit ','Intel® HD Graphics 3000','Onboard','Shared with memory','SonicFocus','4.1','Altec Lansing® speakers,Headphones, Microphone','Bluetooth 3.0+HS','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','6-Cell Lithium-Ion','3.5h','WIN7',0,'MSP5'),('MCTLT6','TFT cảm ứng điện dung, 16 triệu màu','2.0 GHz','2MB L3 cache','1066MHz FBS','AMD','Mobile Intel® HM65 Express Chipset','2GB','DDR III','1066 Mbit/s','6 GB','500GB','Đĩa từ (HDD)','SATA','7200 prm','14.0 inch','16:9 HD (1366x768) LED backlit ','Intel® HD Graphics','Onboard','Shared with memory','SonicFocus','2.0','Altec Lansing® speakers,Headphones, Microphone','Bluetooth 3.0+HS','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','6-Cell Lithium-Ion','2h','Free Dos',0,'MSP6'),('MCTLT7','INTEL Core i5-2537M Sandy Bridge','2.0 GHz','3MB L3 cache','1066MHz FBS','INTEL','Mobile Intel® HM55 Express Chipset','4GB','DDR III','1333MHz','6 GB','500GB','Đĩa từ (HDD)','SATA','7200 prm','14.0 inch','SuperBright HD LED Display (1366 x 768)','Intel® HD Graphics 3000','Onboard','Shared with memory','Tích hợp','2.0','2 Speaker,Headphones, Microphone','Đang cập nhật','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','12-Cell Lithium-Ion','Đang cập nhật','Free Dos',0,'MSP7'),('MCTLT8','TFT cảm ứng điện dung, 16 triệu màu','2.0 GHz','2MB L3 cache','1066MHz FBS','AMD','Mobile Intel® HM55 Express Chipset','4GB','DDR III','1333MHz','6 GB','500GB','Đĩa từ (HDD)','SATA','Đang cập nhật','15.0 inch','16:9 HD (1366x768) LED backlit ','Intel® HD Graphics','Onboard','Shared with memory','SonicFocus','2.0','2 Speaker,Headphones, Microphone','Bluetooth 3.0+HS','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','6-Cell Lithium-Ion','2h','WIN7',0,'MSP8'),('MCTLT9','TFT cảm ứng điện dung, 16 triệu màu','1.4 GHz','2MB L3 cache','1066MHz FBS','INTEL','Mobile Intel® HM65 Express Chipset','2GB','DDR III','1333MHz','6 GB','120GB','Đĩa từ (HDD)','SATA','5400 prm','14.0 inch','16:9 HD (1366x768) LED backlit ','Intel® HD Graphics','Onboard','Shared with memory','SonicFocus','4.1','Altec Lansing® speakers,Headphones, Microphone','Đang cập nhật','0.3 Mega Pixel Fixed web camera','HDMI port with HDCP support, External display (VGA) port','3 x USB 2.0 ports','3 in 1 card reader, SD,MMC,MS','220v','6-Cell Lithium-Ion','Đang cập nhật','Free Dos',0,'MSP9');
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
INSERT INTO `giohang` VALUES ('MGH1','MSP8',1,3.35e+007,0,0,'MND1');
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
INSERT INTO `hang` VALUES ('MH1','Nokia',0),('MH10','Motorola',0),('MH11','Malata',0),('MH12','F-Moblie',0),('MH13','Dell',0),('MH14','Acer',0),('MH15','IBM',0),('MH16','Lenovo',0),('MH17','HP',0),('MH18','Apple',0),('MH19','Asus',0),('MH2','SamSung',0),('MH20','Toshiba',0),('MH21','NEC',0),('MH22','Sony',0),('MH23','Gateway',0),('MH3','Sony Ericssion',0),('MH4','K-Touch',0),('MH5','Mobell',0),('MH6','Q-Mobile',0),('MH7','LG',0),('MH8','HTC',0),('MH9','BlackBerry',0);
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
INSERT INTO `hinhanhkhuyenmai` VALUES ('MHAKM1','http://static.hnammobile.com/images/stories/news/5633_large.jpg','MKM1',0);
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
INSERT INTO `hinhanhsanpham` VALUES ('MHASP1','1.jpg','MSP1',0),('MHASP10','10.jpg','MSP2',0),('MHASP100','100.jpg','MSP17',0),('MHASP101','101.jpg','MSP17',0),('MHASP102','102.jpg','MSP17',0),('MHASP103','103.jpg','MSP18',0),('MHASP104','104.jpg','MSP18',0),('MHASP105','105.jpg','MSP18',0),('MHASP106','106.jpg','MSP18',0),('MHASP107','107.jpg','MSP18',0),('MHASP108','108.jpg','MSP18',0),('MHASP109','109.jpg','MSP19',0),('MHASP11','11.jpg','MSP2',0),('MHASP110','110.jpg','MSP19',0),('MHASP111','111.jpg','MSP19',0),('MHASP112','112.jpg','MSP19',0),('MHASP113','113.jpg','MSP19',0),('MHASP114','114.jpg','MSP19',0),('MHASP115','115.jpg','MSP20',0),('MHASP116','116.jpg','MSP20',0),('MHASP117','117.jpg','MSP20',0),('MHASP118','118.jpg','MSP20',0),('MHASP119','119.jpg','MSP20',0),('MHASP12','12.jpg','MSP2',0),('MHASP120','120.jpg','MSP20',0),('MHASP121','121.jpg','MSP21',0),('MHASP122','122.jpg','MSP21',0),('MHASP123','123.jpg','MSP21',0),('MHASP124','124.jpg','MSP21',0),('MHASP125','125.jpg','MSP21',0),('MHASP126','126.jpg','MSP21',0),('MHASP127','127.jpg','MSP22',0),('MHASP128','128.jpg','MSP22',0),('MHASP129','129.jpg','MSP22',0),('MHASP13','13.jpg','MSP3',0),('MHASP130','130.jpg','MSP22',0),('MHASP131','131.jpg','MSP22',0),('MHASP132','132.jpg','MSP22',0),('MHASP133','133.jpg','MSP23',0),('MHASP134','134.jpg','MSP23',0),('MHASP135','135.jpg','MSP23',0),('MHASP136','136.jpg','MSP23',0),('MHASP137','137.jpg','MSP23',0),('MHASP138','138.jpg','MSP23',0),('MHASP139','139.jpg','MSP24',0),('MHASP14','14.jpg','MSP3',0),('MHASP140','140.jpg','MSP24',0),('MHASP141','141.jpg','MSP24',0),('MHASP142','142.jpg','MSP24',0),('MHASP143','143.jpg','MSP24',0),('MHASP144','144.jpg','MSP24',0),('MHASP145','145.jpg','MSP25',0),('MHASP146','146.jpg','MSP25',0),('MHASP147','147.jpg','MSP25',0),('MHASP148','148.jpg','MSP25',0),('MHASP149','149.jpg','MSP25',0),('MHASP15','15.jpg','MSP3',0),('MHASP150','150.jpg','MSP25',0),('MHASP151','151.jpg','MSP26',0),('MHASP152','152.jpg','MSP26',0),('MHASP153','153.jpg','MSP26',0),('MHASP154','154.jpg','MSP26',0),('MHASP155','155.jpg','MSP26',0),('MHASP156','156.jpg','MSP26',0),('MHASP157','157.jpg','MSP27',0),('MHASP158','158.jpg','MSP27',0),('MHASP159','159.jpg','MSP27',0),('MHASP16','16.jpg','MSP3',0),('MHASP160','160.jpg','MSP27',0),('MHASP161','161.jpg','MSP27',0),('MHASP162','162.jpg','MSP27',0),('MHASP163','163.jpg','MSP28',0),('MHASP164','164.jpg','MSP28',0),('MHASP165','165.jpg','MSP28',0),('MHASP166','166.jpg','MSP28',0),('MHASP167','167.jpg','MSP28',0),('MHASP168','168.jpg','MSP28',0),('MHASP169','169.jpg','MSP29',0),('MHASP17','17.jpg','MSP3',0),('MHASP170','170.jpg','MSP29',0),('MHASP171','171.jpg','MSP29',0),('MHASP172','172.jpg','MSP29',0),('MHASP173','173.jpg','MSP29',0),('MHASP174','174.jpg','MSP29',0),('MHASP175','175.jpg','MSP30',0),('MHASP176','176.jpg','MSP30',0),('MHASP177','177.jpg','MSP30',0),('MHASP178','178.jpg','MSP30',0),('MHASP179','179.jpg','MSP30',0),('MHASP18','18.jpg','MSP3',0),('MHASP180','180.jpg','MSP30',0),('MHASP181','268.jpg','MSP31',0),('MHASP182','269.jpg','MSP31',0),('MHASP183','270.jpg','MSP31',0),('MHASP184','271.jpg','MSP31',0),('MHASP185','272.jpg','MSP31',0),('MHASP186','273.jpg','MSP31',0),('MHASP187','274.jpg','MSP32',0),('MHASP188','275.jpg','MSP32',0),('MHASP189','276.jpg','MSP32',0),('MHASP19','19.jpg','MSP4',0),('MHASP190','277.jpg','MSP32',0),('MHASP191','278.jpg','MSP32',0),('MHASP192','279.jpg','MSP32',0),('MHASP193','280.jpg','MSP33',0),('MHASP194','281.jpg','MSP33',0),('MHASP195','282.jpg','MSP33',0),('MHASP196','283.jpg','MSP33',0),('MHASP197','284.jpg','MSP33',0),('MHASP198','285.jpg','MSP33',0),('MHASP199','286.jpg','MSP34',0),('MHASP2','2.jpg','MSP1',0),('MHASP20','20.jpg','MSP4',0),('MHASP200','287.jpg','MSP34',0),('MHASP201','288.jpg','MSP34',0),('MHASP202','289.jpg','MSP34',0),('MHASP203','290.jpg','MSP34',0),('MHASP204','291.jpg','MSP34',0),('MHASP205','292.jpg','MSP35',0),('MHASP206','293.jpg','MSP35',0),('MHASP207','294.jpg','MSP35',0),('MHASP208','295.jpg','MSP35',0),('MHASP209','296.jpg','MSP35',0),('MHASP21','21.jpg','MSP4',0),('MHASP210','297.jpg','MSP35',0),('MHASP211','298.jpg','MSP36',0),('MHASP212','299.jpg','MSP36',0),('MHASP213','300.jpg','MSP36',0),('MHASP214','301.jpg','MSP36',0),('MHASP215','302.jpg','MSP36',0),('MHASP216','303.jpg','MSP36',0),('MHASP217','304.jpg','MSP37',0),('MHASP218','305.jpg','MSP37',0),('MHASP219','306.jpg','MSP37',0),('MHASP22','22.jpg','MSP4',0),('MHASP220','307.jpg','MSP37',0),('MHASP221','308.jpg','MSP37',0),('MHASP222','309.jpg','MSP37',0),('MHASP223','310.jpg','MSP38',0),('MHASP224','311.jpg','MSP38',0),('MHASP225','312.jpg','MSP38',0),('MHASP226','313.jpg','MSP38',0),('MHASP227','314.jpg','MSP38',0),('MHASP228','315.jpg','MSP38',0),('MHASP229','316.jpg','MSP39',0),('MHASP23','23.jpg','MSP4',0),('MHASP230','317.jpg','MSP39',0),('MHASP231','318.jpg','MSP39',0),('MHASP232','319.jpg','MSP39',0),('MHASP233','320.jpg','MSP39',0),('MHASP234','321.jpg','MSP39',0),('MHASP235','322.jpg','MSP40',0),('MHASP236','323.jpg','MSP40',0),('MHASP237','324.jpg','MSP40',0),('MHASP238','325.jpg','MSP40',0),('MHASP239','326.jpg','MSP40',0),('MHASP24','24.jpg','MSP4',0),('MHASP240','327.jpg','MSP40',0),('MHASP241','328.jpg','MSP41',0),('MHASP242','329.jpg','MSP41',0),('MHASP243','330.jpg','MSP41',0),('MHASP244','331.jpg','MSP41',0),('MHASP245','332.jpg','MSP41',0),('MHASP246','333.jpg','MSP41',0),('MHASP247','334.jpg','MSP42',0),('MHASP248','335.jpg','MSP42',0),('MHASP249','336.jpg','MSP42',0),('MHASP25','25.jpg','MSP5',0),('MHASP250','337.jpg','MSP42',0),('MHASP251','338.jpg','MSP42',0),('MHASP252','339.jpg','MSP42',0),('MHASP253','340.jpg','MSP43',0),('MHASP254','341.jpg','MSP43',0),('MHASP255','342.jpg','MSP43',0),('MHASP256','343.jpg','MSP43',0),('MHASP257','344.jpg','MSP43',0),('MHASP258','345.jpg','MSP43',0),('MHASP259','346.jpg','MSP44',0),('MHASP26','26.jpg','MSP5',0),('MHASP260','347.jpg','MSP44',0),('MHASP261','348.jpg','MSP44',0),('MHASP262','349.jpg','MSP44',0),('MHASP263','350.jpg','MSP44',0),('MHASP264','351.jpg','MSP44',0),('MHASP265','352.jpg','MSP45',0),('MHASP266','353.jpg','MSP45',0),('MHASP267','354.jpg','MSP45',0),('MHASP268','355.jpg','MSP45',0),('MHASP269','356.jpg','MSP45',0),('MHASP27','27.jpg','MSP5',0),('MHASP270','357.jpg','MSP45',0),('MHASP271','358.jpg','MSP46',0),('MHASP272','359.jpg','MSP46',0),('MHASP273','360.jpg','MSP46',0),('MHASP274','361.jpg','MSP46',0),('MHASP275','362.jpg','MSP46',0),('MHASP276','363.jpg','MSP46',0),('MHASP277','364.jpg','MSP47',0),('MHASP278','365.jpg','MSP47',0),('MHASP279','366.jpg','MSP47',0),('MHASP28','28.jpg','MSP5',0),('MHASP280','367.jpg','MSP47',0),('MHASP281','368.jpg','MSP47',0),('MHASP282','369.jpg','MSP47',0),('MHASP283','370.jpg','MSP48',0),('MHASP284','371.jpg','MSP48',0),('MHASP285','372.jpg','MSP48',0),('MHASP286','373.jpg','MSP48',0),('MHASP287','374.jpg','MSP48',0),('MHASP288','375.jpg','MSP48',0),('MHASP289','268.jpg','MSP49',0),('MHASP29','29.jpg','MSP5',0),('MHASP290','269.jpg','MSP49',0),('MHASP291','270.jpg','MSP49',0),('MHASP292','271.jpg','MSP49',0),('MHASP293','272.jpg','MSP49',0),('MHASP294','273.jpg','MSP49',0),('MHASP295','274.jpg','MSP50',0),('MHASP296','275.jpg','MSP50',0),('MHASP297','276.jpg','MSP50',0),('MHASP298','277.jpg','MSP50',0),('MHASP299','278.jpg','MSP50',0),('MHASP3','3.jpg','MSP1',0),('MHASP30','30.jpg','MSP5',0),('MHASP300','279.jpg','MSP50',0),('MHASP301','280.jpg','MSP51',0),('MHASP302','281.jpg','MSP51',0),('MHASP303','282.jpg','MSP51',0),('MHASP304','283.jpg','MSP51',0),('MHASP305','284.jpg','MSP51',0),('MHASP306','285.jpg','MSP51',0),('MHASP307','286.jpg','MSP52',0),('MHASP308','287.jpg','MSP52',0),('MHASP309','288.jpg','MSP52',0),('MHASP31','31.jpg','MSP6',0),('MHASP310','289.jpg','MSP52',0),('MHASP311','290.jpg','MSP52',0),('MHASP312','291.jpg','MSP52',0),('MHASP313','292.jpg','MSP53',0),('MHASP314','293.jpg','MSP53',0),('MHASP315','294.jpg','MSP53',0),('MHASP316','295.jpg','MSP53',0),('MHASP317','296.jpg','MSP53',0),('MHASP318','297.jpg','MSP53',0),('MHASP319','298.jpg','MSP54',0),('MHASP32','32.jpg','MSP6',0),('MHASP320','299.jpg','MSP54',0),('MHASP321','300.jpg','MSP54',0),('MHASP322','301.jpg','MSP54',0),('MHASP323','302.jpg','MSP54',0),('MHASP324','303.jpg','MSP54',0),('MHASP325','304.jpg','MSP55',0),('MHASP326','305.jpg','MSP55',0),('MHASP327','306.jpg','MSP55',0),('MHASP328','307.jpg','MSP55',0),('MHASP329','308.jpg','MSP55',0),('MHASP33','33.jpg','MSP6',0),('MHASP330','309.jpg','MSP55',0),('MHASP331','310.jpg','MSP56',0),('MHASP332','311.jpg','MSP56',0),('MHASP333','312.jpg','MSP56',0),('MHASP334','313.jpg','MSP56',0),('MHASP335','314.jpg','MSP56',0),('MHASP336','315.jpg','MSP56',0),('MHASP337','316.jpg','MSP57',0),('MHASP338','317.jpg','MSP57',0),('MHASP339','318.jpg','MSP57',0),('MHASP34','34.jpg','MSP6',0),('MHASP340','319.jpg','MSP57',0),('MHASP341','320.jpg','MSP57',0),('MHASP342','321.jpg','MSP57',0),('MHASP343','322.jpg','MSP58',0),('MHASP344','323.jpg','MSP58',0),('MHASP345','324.jpg','MSP58',0),('MHASP346','325.jpg','MSP58',0),('MHASP347','326.jpg','MSP58',0),('MHASP348','327.jpg','MSP58',0),('MHASP349','328.jpg','MSP59',0),('MHASP35','35.jpg','MSP6',0),('MHASP350','329.jpg','MSP59',0),('MHASP351','330.jpg','MSP59',0),('MHASP352','331.jpg','MSP59',0),('MHASP353','332.jpg','MSP59',0),('MHASP354','333.jpg','MSP59',0),('MHASP355','334.jpg','MSP60',0),('MHASP356','335.jpg','MSP60',0),('MHASP357','336.jpg','MSP60',0),('MHASP358','337.jpg','MSP60',0),('MHASP359','338.jpg','MSP60',0),('MHASP36','36.jpg','MSP6',0),('MHASP360','339.jpg','MSP60',0),('MHASP37','37.jpg','MSP7',0),('MHASP38','38.jpg','MSP7',0),('MHASP39','39.jpg','MSP7',0),('MHASP4','4.jpg','MSP1',0),('MHASP40','40.jpg','MSP7',0),('MHASP41','41.jpg','MSP7',0),('MHASP42','42.jpg','MSP7',0),('MHASP43','43.jpg','MSP8',0),('MHASP44','44.jpg','MSP8',0),('MHASP45','45.jpg','MSP8',0),('MHASP46','46.jpg','MSP8',0),('MHASP47','47.jpg','MSP8',0),('MHASP48','48.jpg','MSP8',0),('MHASP49','49.jpg','MSP9',0),('MHASP5','5.jpg','MSP1',0),('MHASP50','50.jpg','MSP9',0),('MHASP51','51.jpg','MSP9',0),('MHASP52','52.jpg','MSP9',0),('MHASP53','53.jpg','MSP9',0),('MHASP54','54.jpg','MSP9',0),('MHASP55','55.jpg','MSP10',0),('MHASP56','56.jpg','MSP10',0),('MHASP57','57.jpg','MSP10',0),('MHASP58','58.jpg','MSP10',0),('MHASP59','59.jpg','MSP10',0),('MHASP6','6.jpg','MSP1',0),('MHASP60','60.jpg','MSP10',0),('MHASP61','61.jpg','MSP11',0),('MHASP62','62.jpg','MSP11',0),('MHASP63','63.jpg','MSP11',0),('MHASP64','64.jpg','MSP11',0),('MHASP65','65.jpg','MSP11',0),('MHASP66','66.jpg','MSP11',0),('MHASP67','67.jpg','MSP12',0),('MHASP68','68.jpg','MSP12',0),('MHASP69','69.jpg','MSP12',0),('MHASP7','7.jpg','MSP2',0),('MHASP70','70.jpg','MSP12',0),('MHASP71','71.jpg','MSP12',0),('MHASP72','72.jpg','MSP12',0),('MHASP73','73.jpg','MSP13',0),('MHASP74','74.jpg','MSP13',0),('MHASP75','75.jpg','MSP13',0),('MHASP76','76.jpg','MSP13',0),('MHASP77','77.jpg','MSP13',0),('MHASP78','78.jpg','MSP13',0),('MHASP79','79.jpg','MSP14',0),('MHASP8','8.jpg','MSP2',0),('MHASP80','80.jpg','MSP14',0),('MHASP81','81.jpg','MSP14',0),('MHASP82','82.jpg','MSP14',0),('MHASP83','83.jpg','MSP14',0),('MHASP84','84.jpg','MSP14',0),('MHASP85','85.jpg','MSP15',0),('MHASP86','86.jpg','MSP15',0),('MHASP87','87.jpg','MSP15',0),('MHASP88','88.jpg','MSP15',0),('MHASP89','89.jpg','MSP15',0),('MHASP9','9.jpg','MSP2',0),('MHASP90','90.jpg','MSP15',0),('MHASP91','91.jpg','MSP16',0),('MHASP92','92.jpg','MSP16',0),('MHASP93','93.jpg','MSP16',0),('MHASP94','94.jpg','MSP16',0),('MHASP95','95.jpg','MSP16',0),('MHASP96','96.jpg','MSP16',0),('MHASP97','97.jpg','MSP17',0),('MHASP98','98.jpg','MSP17',0),('MHASP99','99.jpg','MSP17',0);
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
  `TenHinhAnh` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DuongDan` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
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
INSERT INTO `khuyenmai` VALUES ('MKM1','Xả hàng tồn','<p>\n        <span style=\"font-size: 12pt; line-height: 115%; font-family: Arial;\">\n            <strong>Chương trình khuyến mãi bao gồm các sản phẩm thuộc dòng Walkman: Sony Ericsson W8 Walkman, Sony Ericsson Mix Walkman, Sony Ericsson Zylo (W20i), Sony Ericsson Yendo (W150i), Sony Ericsson Spiro (W100i).</strong>\n        </span>\n        </p>\n\n        <p>&nbsp;</p>\n\n        <div style=\"text-align: center;\">\n            <img height=\"600\" width=\"370\" alt=\" \" src=\"http://static.hnammobile.com/images/khuyenmai/km_rock.jpg\" />\n        </div>\n\n        <p>&nbsp;</p>\n\n        <p>\n        <br><span style=\"font-size: 12pt; line-height: 115%; font-family: Arial,sans-serif;\">Sony Ericsson giới thiệu chương trình khuyến mại đặc biệt - “Rock thật đã với Walkman” - cho loạt sản phẩm điện thoại Sony Ericsson chính hãng thuộc dòng Walkman từ ngày 15/09/2011 - 31/10/2011.<br><br>Cụ thể, giá của Sony Ericsson W8 Walkman chỉ còn 4.550.000 VND. Giá của Sony Erisson Mix Walkman với thiết kế uốn cong và giao diện 4 góc trẻ trung chỉ có 3.290.000 VND. Các mẫu điện thoại nghe nhạc dành cho giới trẻ như Zylo (W20i), Spiro (W100i), Yendo (W150i) cũng được ưu đãi đặc biệt với mức giá lần lượt là 2.850.000 VND; 1.570.000 VND và 2.130.000 VND. Ngoài ra, tặng kèm với mỗi điện thoại trên là chiếc áo thun phong cách Rock cực sành điệu.</span>\n        </p>\n        <p>\n            <img height=\"356\" width=\"500\" alt=\" \" src=\"http://static.hnammobile.com/images/khuyenmai/ao_sony.jpg\">\n        </p>\n        <p>\n            <strong><span style=\"font-size: 12pt; line-height: 115%; font-family: Arial,sans-serif;\">Ngoài ra chỉ riêng tại Hnam Mobile có triển khai thêm chương trình mua Sony Ericsson X8 chính hãng với giá ưu đãi 4.290.000 VNđ còn được tặng thêm 1 balo thời trang, từ ngày 15/9 đến 31/10/2011 </span></strong>\n        </p>\n\n        <p>&nbsp;</p>\n\n        <div style=\"text-align: center;\">\n            <img height=\"400\" width=\"316\" alt=\" \" src=\"http://static.hnammobile.com/images/khuyenmai/balo_sony.jpg\">\n        </div>\n\n        <p>&nbsp;</p>\n\n        <strong>\n            <span style=\"font-family: Arial,sans-serif; font-size: 12pt; line-height: 115%; color: rgb(0, 0, 255);\">\n                <u>Lưu ý</u>: Khuyến mãi chỉ áp dụng cho hàng công ty, có V.A.T \n            </span>\n        </strong>','2011-10-06 00:00:00','2011-11-06 00:00:00',0);
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
  `CMND` int(11) DEFAULT NULL,
  `DienThoai` int(11) DEFAULT NULL,
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
INSERT INTO `nguoidung` VALUES ('MND1','user1','123','Hoàng Thị Kim Như','hoangthikimnhu@yahoo.com',285150590,908021098,'Hồng Bàng, Q6. HCm','MLND1','2011-09-27 00:00:00',0),('MND2','user2','123','Trần Ngọc Long','nhatlong1505@gmail.com',258159560,1685301683,'Trần Hưng Đạo, Q.1, HCM','MLND3','2011-09-27 00:00:00',0),('MND3','user3','123','Nguyễn Trần Thị Thu Hà','nguyentran.thuha151189@yahoo.com',266456789,974567576,'Nguyễn Văn Cừ, Q.5, HCM','MLND3','2011-09-27 00:00:00',0),('MND4','user4','123','Nguyễn Hải Bình','sau_con_89@yahoo,com',345678345,976589899,'Nguyễn Tất Thành, Q.4, HCM','MLND1','2011-09-27 00:00:00',0),('MND5','user5','123','Nguyễn Thiên Anh','thienanh_89@yahoo.com',567898989,974345345,'Cầu Ông Luông, Q6, HCM','MLND2','2011-09-27 00:00:00',0);
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
  CONSTRAINT `FK_SanPham_Hang` FOREIGN KEY (`MaHang`) REFERENCES `hang` (`MaHang`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SanPham_LoaiSanPham` FOREIGN KEY (`MaLoaiSanPham`) REFERENCES `loaisanpham` (`MaLoaiSanPham`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanpham`
--

LOCK TABLES `sanpham` WRITE;
/*!40000 ALTER TABLE `sanpham` DISABLE KEYS */;
INSERT INTO `sanpham` VALUES ('MSP1','Laptop vip','LT','MH1',1,3e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0),('MSP10','Laptop chém gió','LT','MH19',1,3.45e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0),('MSP11','Laptop packjiwan','LT','MH21',1,3.5e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0),('MSP12','Laptop tình yêu','LT','MH23',1,3.55e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0),('MSP13','Laptop doanh nhân','LT','MH1',1,3.6e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0),('MSP14','Laptop bay','LT','MH3',1,3.65e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0),('MSP15','Laptop 1','LT','MH5',1,3.7e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0),('MSP16','Laptop 1','LT','MH7',1,3.75e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0),('MSP17','Laptop 1','LT','MH9',1,3.8e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0),('MSP18','Laptop 1','LT','MH11',1,3.85e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0),('MSP19','Laptop 1','LT','MH13',1,3.9e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0),('MSP2','Laptop 1','LT','MH3',1,3.05e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0),('MSP20','Laptop 1','LT','MH15',1,3.95e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0),('MSP21','Laptop 1','LT','MH17',1,4e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0),('MSP22','Laptop 1','LT','MH19',1,4.05e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0),('MSP23','Laptop 1','LT','MH21',1,4.1e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0),('MSP24','Laptop 1','LT','MH23',1,4.15e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0),('MSP25','Laptop 1','LT','MH1',1,4.2e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0),('MSP26','Laptop 1','LT','MH3',1,4.25e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0),('MSP27','Laptop 1','LT','MH5',1,4.3e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0),('MSP28','Laptop 1','LT','MH7',1,4.35e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0),('MSP29','Laptop 1','LT','MH9',1,4.4e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0),('MSP3','Laptop 1','LT','MH5',1,3.1e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0),('MSP30','Laptop 1','LT','MH11',1,4.45e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0),('MSP31','Điện thoại ăn hại','DT','MH1',1,3e+006,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP32','Điện thoại cùi bắp','DT','MH3',1,3.5e+006,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP33','Điện thoại chết ngắt','DT','MH5',1,4e+006,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP34','Điện thoại vip','DT','MH7',1,4.5e+006,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP35','Điện thoại doanh nghiệp','DT','MH9',1,5e+006,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP36','Điện thoại bàn','DT','MH11',1,5.5e+006,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP37','Điện thoại 1','DT','MH13',1,6e+006,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP38','Điện thoại 1','DT','MH15',1,6.5e+006,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP39','Điện thoại 1','DT','MH17',1,7e+006,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP4','Laptop 1','LT','MH7',1,3.15e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0),('MSP40','Điện thoại 1','DT','MH19',1,7.5e+006,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP41','Điện thoại 1','DT','MH21',1,8e+006,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP42','Điện thoại 1','DT','MH23',1,8.5e+006,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP43','Điện thoại 1','DT','MH1',1,9e+006,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP44','Điện thoại 1','DT','MH3',1,9.5e+006,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP45','Điện thoại 1','DT','MH5',1,1e+007,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP46','Điện thoại 1','DT','MH7',1,1.05e+007,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP47','Điện thoại 1','DT','MH9',1,1.1e+007,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP48','Điện thoại 1','DT','MH11',1,1.15e+007,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP49','Điện thoại 1','DT','MH13',1,1.2e+007,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP5','Laptop 1','LT','MH9',1,3.2e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0),('MSP50','Điện thoại 1','DT','MH15',1,1.25e+007,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP51','Điện thoại 1','DT','MH17',1,1.3e+007,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP52','Điện thoại 1','DT','MH19',1,1.35e+007,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP53','Điện thoại 1','DT','MH21',1,1.4e+007,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP54','Điện thoại 1','DT','MH23',1,1.45e+007,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP55','Điện thoại 1','DT','MH1',1,1.5e+007,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP56','Điện thoại 1','DT','MH3',1,1.55e+007,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP57','Điện thoại 1','DT','MH5',1,1.6e+007,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP58','Điện thoại 1','DT','MH7',1,1.65e+007,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP59','Điện thoại 1','DT','MH9',1,1.7e+007,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP6','Laptop 1','LT','MH11',1,3.25e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0),('MSP60','Điện thoại 1','DT','MH11',1,1.75e+007,'Đen','1 năm','88 x 52 x 16 mm','3 kg',0),('MSP7','Laptop 1','LT','MH13',1,3.3e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0),('MSP8','Laptop 1','LT','MH15',1,3.35e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0),('MSP9','Laptop 1','LT','MH17',1,3.4e+007,'Hồng','1 năm','327 x 226 x 15 mm','2,2 kg',0);
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
  `NoiDungtTinTuc` longtext COLLATE utf8_unicode_ci,
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

-- Dump completed on 2011-10-07 15:45:08
