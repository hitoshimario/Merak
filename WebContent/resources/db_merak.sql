-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 29, 2013 at 06:19 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_merak`
--

-- --------------------------------------------------------

--
-- Table structure for table `alat`
--

CREATE TABLE IF NOT EXISTS `alat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_alat` varchar(100) NOT NULL,
  `jml_alat` int(11) NOT NULL,
  `id_satuan` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_satuan` (`id_satuan`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `alat`
--

INSERT INTO `alat` (`id`, `nama_alat`, `jml_alat`, `id_satuan`) VALUES
(1, 'gunting', 5, 1),
(2, 'hitter', 7, 3),
(5, 'Jarum Suntik SS', 100, 6),
(6, 'saset', 90, 1);

-- --------------------------------------------------------

--
-- Table structure for table `distributor`
--

CREATE TABLE IF NOT EXISTS `distributor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_distributor` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telepon` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `distributor`
--

INSERT INTO `distributor` (`id`, `nama_distributor`, `alamat`, `telepon`, `email`) VALUES
(1, 'contoh', 'ee', '45466', 'ddsf');

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE IF NOT EXISTS `dokter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nip_dokter` varchar(100) NOT NULL,
  `nama_awal` varchar(100) NOT NULL,
  `nama_akhir` varchar(100) NOT NULL,
  `jns_kelamin` int(1) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `tmp_lahir` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telepon` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id`, `nip_dokter`, `nama_awal`, `nama_akhir`, `jns_kelamin`, `tgl_lahir`, `tmp_lahir`, `alamat`, `telepon`, `email`) VALUES
(2, 'D0001', 'Andi', 'Wijaya', 0, '2013-07-16', 'Jakarta', 'Sukabumi', '08991234567', 'andi@gmail.com'),
(3, 'D0002', 'Budi', 'Susilo', 0, '2013-07-24', 'Jakarta', 'Sukabumi', '08991234569', 'budi@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama_kategori`) VALUES
(1, 'single'),
(2, 'bundle'),
(3, 'dus'),
(6, 'loli pop'),
(7, 'salon'),
(8, 'kategori baru ni'),
(10, 'baru loh yoyoi yes'),
(12, 'test 1'),
(13, 'test 2'),
(14, 'test 14'),
(15, 'test 15');

-- --------------------------------------------------------

--
-- Table structure for table `laporan`
--

CREATE TABLE IF NOT EXISTS `laporan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tgl_transaksi` date NOT NULL,
  `waktu_transaksi` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `jml_barang` int(11) NOT NULL,
  `asal` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `paket_perawatan`
--

CREATE TABLE IF NOT EXISTS `paket_perawatan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_paket_perawatan` varchar(100) NOT NULL,
  `harga` double NOT NULL,
  `durasi` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `paket_perawatan`
--

INSERT INTO `paket_perawatan` (`id`, `nama_paket_perawatan`, `harga`, `durasi`) VALUES
(10, 'Spa', 50000, '30 menit'),
(14, 'Potong rambut', 100000, '40 menit'),
(15, 'Relaxing', 150000, '50 menit'),
(16, 'pedicure', 200000, '60 menit'),
(17, 'medicure', 250000, '90 menit'),
(19, 'Test', 10000, '40 menit');

-- --------------------------------------------------------

--
-- Table structure for table `paket_perawatan_alat`
--

CREATE TABLE IF NOT EXISTS `paket_perawatan_alat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_paket_perawatan` int(11) NOT NULL,
  `id_alat` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_paket_perawatan` (`id_paket_perawatan`),
  KEY `id_alat` (`id_alat`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=58 ;

--
-- Dumping data for table `paket_perawatan_alat`
--

INSERT INTO `paket_perawatan_alat` (`id`, `id_paket_perawatan`, `id_alat`) VALUES
(37, 10, 2),
(38, 10, 1),
(39, 14, 1),
(40, 14, 2),
(41, 15, 2),
(42, 15, 1),
(43, 16, 1),
(51, 17, 6),
(52, 17, 2),
(56, 19, 2),
(57, 19, 1);

-- --------------------------------------------------------

--
-- Table structure for table `paket_perawatan_produk`
--

CREATE TABLE IF NOT EXISTS `paket_perawatan_produk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_paket_perawatan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_paket_perawatan` (`id_paket_perawatan`),
  KEY `id_produk` (`id_produk`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=58 ;

--
-- Dumping data for table `paket_perawatan_produk`
--

INSERT INTO `paket_perawatan_produk` (`id`, `id_paket_perawatan`, `id_produk`) VALUES
(37, 10, 2),
(38, 10, 5),
(39, 14, 8),
(40, 14, 6),
(41, 15, 2),
(42, 15, 8),
(43, 16, 2),
(51, 17, 2),
(52, 17, 8),
(56, 19, 5),
(57, 19, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE IF NOT EXISTS `pelanggan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nmr_pelanggan` varchar(100) NOT NULL,
  `nama_awal` varchar(100) NOT NULL,
  `nama_akhir` varchar(100) NOT NULL,
  `jns_kelamin` int(1) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `tmp_lahir` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telepon` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id`, `nmr_pelanggan`, `nama_awal`, `nama_akhir`, `jns_kelamin`, `tgl_lahir`, `tmp_lahir`, `alamat`, `telepon`, `email`) VALUES
(10, 'P0001', 'Marc', 'Marquez', 0, '1987-07-15', 'Jakarta', 'Jakarta', '08568808888', 'marc@gmail.com'),
(11, 'P0002', 'Jorge', 'Lorenzo', 0, '1985-07-17', 'Jakarta', 'Jakarta', '08991234567', 'jorge@gmail.com'),
(13, 'P0003', 'Lisa', 'Dorius', 1, '2013-07-23', 'Bekasi', 'Cibubur', '08990556677', 'lisa@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan_paket_perawatan`
--

CREATE TABLE IF NOT EXISTS `pelanggan_paket_perawatan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pelanggan` int(11) NOT NULL,
  `id_paket_perawatan` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pelanggan` (`id_pelanggan`),
  KEY `id_paket_perawatan` (`id_paket_perawatan`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=104 ;

--
-- Dumping data for table `pelanggan_paket_perawatan`
--

INSERT INTO `pelanggan_paket_perawatan` (`id`, `id_pelanggan`, `id_paket_perawatan`) VALUES
(68, 11, 14),
(82, 10, 10),
(83, 10, 14),
(86, 11, 14),
(87, 11, 15),
(88, 11, 15),
(91, 13, 10),
(92, 13, 14),
(93, 13, 15),
(95, 13, 17),
(98, 10, 16),
(99, 10, 10),
(103, 10, 16);

-- --------------------------------------------------------

--
-- Table structure for table `perawatan`
--

CREATE TABLE IF NOT EXISTS `perawatan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tgl_perawatan` date NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_akhir` time NOT NULL,
  `visit_ke` int(11) NOT NULL,
  `id_pelanggan_paket_perawatan` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_pelanggan_paket_perawatan` (`id_pelanggan_paket_perawatan`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `perawatan`
--

INSERT INTO `perawatan` (`id`, `tgl_perawatan`, `jam_mulai`, `jam_akhir`, `visit_ke`, `id_pelanggan_paket_perawatan`) VALUES
(1, '2013-07-24', '17:00:00', '18:00:00', 1, 82),
(2, '2013-07-25', '11:00:00', '12:00:00', 2, 82),
(6, '2013-07-25', '10:00:00', '11:00:00', 3, 82),
(7, '2013-07-23', '11:00:00', '12:00:00', 1, 83);

-- --------------------------------------------------------

--
-- Table structure for table `perawatan_dokter`
--

CREATE TABLE IF NOT EXISTS `perawatan_dokter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_perawatan` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_perawatan` (`id_perawatan`),
  KEY `id_dokter` (`id_dokter`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `perawatan_dokter`
--

INSERT INTO `perawatan_dokter` (`id`, `id_perawatan`, `id_dokter`) VALUES
(1, 1, 3),
(7, 2, 2),
(9, 6, 3),
(11, 7, 3);

-- --------------------------------------------------------

--
-- Table structure for table `perawatan_suster`
--

CREATE TABLE IF NOT EXISTS `perawatan_suster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_perawatan` int(10) NOT NULL,
  `id_suster` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_perawatan` (`id_perawatan`),
  KEY `id_suster` (`id_suster`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `perawatan_suster`
--

INSERT INTO `perawatan_suster` (`id`, `id_perawatan`, `id_suster`) VALUES
(1, 1, 2),
(6, 2, 2),
(8, 6, 2),
(10, 7, 3);

-- --------------------------------------------------------

--
-- Table structure for table `po`
--

CREATE TABLE IF NOT EXISTS `po` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nmr_po` varchar(100) NOT NULL,
  `tgl_po` date NOT NULL,
  `id_distributor` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `po`
--

INSERT INTO `po` (`id`, `nmr_po`, `tgl_po`, `id_distributor`) VALUES
(2, 'PO0001', '2013-07-29', 1);

-- --------------------------------------------------------

--
-- Table structure for table `po_detail`
--

CREATE TABLE IF NOT EXISTS `po_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_produk` int(11) NOT NULL,
  `id_po` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_produk` (`id_produk`),
  KEY `id_po` (`id_po`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `po_detail`
--

INSERT INTO `po_detail` (`id`, `id_produk`, `id_po`, `stok`, `harga`, `total`) VALUES
(3, 5, 2, 10, 300000, 3000000);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE IF NOT EXISTS `produk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_produk` varchar(100) NOT NULL,
  `jml_produk` int(11) NOT NULL,
  `id_satuan` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `harga` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_satuan` (`id_satuan`),
  KEY `id_kategori` (`id_kategori`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id`, `nama_produk`, `jml_produk`, `id_satuan`, `id_kategori`, `harga`) VALUES
(2, 'hair', 10, 1, 1, 100000),
(5, 'handuk', 70, 3, 1, 300000),
(6, 'pisau cukur', 10, 1, 1, 150000),
(7, 'jarum', 100, 1, 1, 200000),
(8, 'minyak rambut', 100, 1, 1, 250000);

-- --------------------------------------------------------

--
-- Table structure for table `rekam_medik`
--

CREATE TABLE IF NOT EXISTS `rekam_medik` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `progress` varchar(100) NOT NULL,
  `catatan` varchar(100) NOT NULL,
  `id_perawatan` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_perawatan` (`id_perawatan`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `rekam_medik`
--

INSERT INTO `rekam_medik` (`id`, `progress`, `catatan`, `id_perawatan`) VALUES
(1, 'Mulai Halus', 'Berikutnya perwarnaan', 6),
(3, 'Test 1', 'Test 2', 1),
(4, 'test 2', 'test 2', 2);

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE IF NOT EXISTS `satuan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama_satuan` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`id`, `nama_satuan`) VALUES
(1, 'Unit'),
(3, 'Rim'),
(6, 'File'),
(7, 'Lusin an'),
(8, 'test');

-- --------------------------------------------------------

--
-- Table structure for table `stok`
--

CREATE TABLE IF NOT EXISTS `stok` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_produk` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `tgl_stok` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_produk` (`id_produk`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `stok`
--

INSERT INTO `stok` (`id`, `id_produk`, `stok`, `tgl_stok`) VALUES
(1, 5, 10, '2013-07-29');

-- --------------------------------------------------------

--
-- Table structure for table `suster`
--

CREATE TABLE IF NOT EXISTS `suster` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nip_suster` varchar(100) NOT NULL,
  `nama_awal` varchar(100) NOT NULL,
  `nama_akhir` varchar(100) NOT NULL,
  `jns_kelamin` int(1) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `tmp_lahir` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `telepon` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `suster`
--

INSERT INTO `suster` (`id`, `nip_suster`, `nama_awal`, `nama_akhir`, `jns_kelamin`, `tgl_lahir`, `tmp_lahir`, `alamat`, `telepon`, `email`) VALUES
(2, 'S0001', 'Belinda', 'Asri', 1, '2013-07-23', 'Jakarta', 'Sukabumi', '08991234569', 'belinda@gmail.com'),
(3, 'S0002', 'Anty', 'Rahma', 1, '2013-07-26', 'Jakarta', 'Sukabumi', '081200121212', 'anty@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `t_role`
--

CREATE TABLE IF NOT EXISTS `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authority` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `t_role`
--

INSERT INTO `t_role` (`id`, `authority`) VALUES
(1, 'ROLE_ADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `t_user`
--

CREATE TABLE IF NOT EXISTS `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `t_user`
--

INSERT INTO `t_user` (`id`, `username`, `password`, `enabled`) VALUES
(1, 'admin', 'admin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_user_role`
--

CREATE TABLE IF NOT EXISTS `t_user_role` (
  `id_user` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  KEY `id_user` (`id_user`),
  KEY `id_role` (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_user_role`
--

INSERT INTO `t_user_role` (`id_user`, `id_role`) VALUES
(1, 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alat`
--
ALTER TABLE `alat`
  ADD CONSTRAINT `alat_ibfk_1` FOREIGN KEY (`id_satuan`) REFERENCES `satuan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `paket_perawatan_alat`
--
ALTER TABLE `paket_perawatan_alat`
  ADD CONSTRAINT `paket_perawatan_alat_ibfk_1` FOREIGN KEY (`id_paket_perawatan`) REFERENCES `paket_perawatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paket_perawatan_alat_ibfk_2` FOREIGN KEY (`id_alat`) REFERENCES `alat` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `paket_perawatan_produk`
--
ALTER TABLE `paket_perawatan_produk`
  ADD CONSTRAINT `paket_perawatan_produk_ibfk_1` FOREIGN KEY (`id_paket_perawatan`) REFERENCES `paket_perawatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `paket_perawatan_produk_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pelanggan_paket_perawatan`
--
ALTER TABLE `pelanggan_paket_perawatan`
  ADD CONSTRAINT `pelanggan_paket_perawatan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pelanggan_paket_perawatan_ibfk_2` FOREIGN KEY (`id_paket_perawatan`) REFERENCES `paket_perawatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `perawatan`
--
ALTER TABLE `perawatan`
  ADD CONSTRAINT `perawatan_ibfk_1` FOREIGN KEY (`id_pelanggan_paket_perawatan`) REFERENCES `pelanggan_paket_perawatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `perawatan_dokter`
--
ALTER TABLE `perawatan_dokter`
  ADD CONSTRAINT `perawatan_dokter_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `perawatan_dokter_ibfk_3` FOREIGN KEY (`id_perawatan`) REFERENCES `perawatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `perawatan_suster`
--
ALTER TABLE `perawatan_suster`
  ADD CONSTRAINT `perawatan_suster_ibfk_1` FOREIGN KEY (`id_perawatan`) REFERENCES `perawatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `perawatan_suster_ibfk_2` FOREIGN KEY (`id_suster`) REFERENCES `suster` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `po_detail`
--
ALTER TABLE `po_detail`
  ADD CONSTRAINT `po_detail_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `po_detail_ibfk_2` FOREIGN KEY (`id_po`) REFERENCES `po` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_3` FOREIGN KEY (`id_satuan`) REFERENCES `satuan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `produk_ibfk_4` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rekam_medik`
--
ALTER TABLE `rekam_medik`
  ADD CONSTRAINT `rekam_medik_ibfk_1` FOREIGN KEY (`id_perawatan`) REFERENCES `perawatan` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stok`
--
ALTER TABLE `stok`
  ADD CONSTRAINT `stok_ibfk_1` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `t_user_role`
--
ALTER TABLE `t_user_role`
  ADD CONSTRAINT `t_user_role_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `t_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `t_user_role_ibfk_2` FOREIGN KEY (`id_role`) REFERENCES `t_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
