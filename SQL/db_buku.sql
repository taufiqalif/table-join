-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 16, 2022 at 04:52 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_buku`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `buku_isbn` char(13) NOT NULL,
  `buku_judul` varchar(75) DEFAULT NULL,
  `penerbit_id` char(4) DEFAULT NULL,
  `buku_tglterbit` date DEFAULT NULL,
  `buku_jmlhalaman` int(11) DEFAULT NULL,
  `buku_harga` decimal(10,0) DEFAULT NULL,
  `pengarang_id` char(3) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `stok` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`buku_isbn`, `buku_judul`, `penerbit_id`, `buku_tglterbit`, `buku_jmlhalaman`, `buku_harga`, `pengarang_id`, `kategori_id`, `stok`) VALUES
('222-34222-1-0', 'Mudah Belajar Photoshop', 'PB01', '2003-07-07', 300, '42000', 'ASW', 1, '20'),
('222-34222-1-1', 'Panduan Praktis Menggunakan Corel Draw', 'PB02', '2004-03-15', 400, '55000', 'BRH', 2, '50'),
('666-96771-2-0', 'Panduan Membangun Jaringan TCP/IP', 'PB03', '2006-08-02', 200, '60000', 'BTO', 3, '32'),
('666-96771-2-1', 'Cara Belajar Cepat PHP 6', 'PB08', '2008-11-21', 230, '35000', 'DAR', 4, '15'),
('777-76723-5-0', 'Membuat Aplikasi Web dengan ASP', 'PB07', '2010-06-02', 600, '95000', 'ERD', 5, '24'),
('979-96446-9-0', 'Menguasai SQL', NULL, NULL, NULL, NULL, 'ERK', 6, '10');

--
-- Triggers `buku`
--
DELIMITER $$
CREATE TRIGGER `updt_stok` AFTER UPDATE ON `buku` FOR EACH ROW BEGIN
IF OLD.stok <> NEW.stok THEN
INSERT INTO log_stok_buku VALUES('','NEW.judul_buku','OLD.stok','NEW.stok','NOW()','NEW.buku_isbn');
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `kategori_id` int(11) NOT NULL,
  `kategori_nama` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kategori_id`, `kategori_nama`) VALUES
(1, 'Basis Data'),
(2, 'Desain Grafis'),
(3, 'Jaringan Komputer'),
(4, 'Pemrograman'),
(5, 'Web dan Internet');

-- --------------------------------------------------------

--
-- Table structure for table `link_buku_kategori`
--

CREATE TABLE `link_buku_kategori` (
  `buku_isbn` char(13) NOT NULL,
  `kategori_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `link_buku_kategori`
--

INSERT INTO `link_buku_kategori` (`buku_isbn`, `kategori_id`) VALUES
('222-34222-1-0', 2),
('222-34222-1-1', 2),
('666-96771-2-0', 3),
('666-96771-2-1', 3),
('777-76723-5-0', 4),
('777-76723-5-0', 5);

-- --------------------------------------------------------

--
-- Table structure for table `link_buku_pengarang`
--

CREATE TABLE `link_buku_pengarang` (
  `buku_isbn` char(13) NOT NULL,
  `pengarang_id` char(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `link_buku_pengarang`
--

INSERT INTO `link_buku_pengarang` (`buku_isbn`, `pengarang_id`) VALUES
('222-34222-1-0', 'ASW'),
('222-34222-1-1', 'DAR'),
('666-96771-2-0', 'ERD'),
('666-96771-2-0', 'ERK'),
('666-96771-2-0', 'FDY');

-- --------------------------------------------------------

--
-- Table structure for table `log_stok_buku`
--

CREATE TABLE `log_stok_buku` (
  `id_updt` int(11) NOT NULL,
  `judul_buku` varchar(75) DEFAULT NULL,
  `stok_lama` varchar(50) DEFAULT NULL,
  `stok_baru` varchar(50) DEFAULT NULL,
  `tgl_update` date DEFAULT NULL,
  `buku_isbn` char(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `log_stok_buku`
--

INSERT INTO `log_stok_buku` (`id_updt`, `judul_buku`, `stok_lama`, `stok_baru`, `tgl_update`, `buku_isbn`) VALUES
(1, 'Mudah Belajar Photoshop', '20', '60', '2022-07-16', '222-34222-1-0');

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE `penerbit` (
  `penerbit_id` char(4) NOT NULL,
  `penerbit_nama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penerbit`
--

INSERT INTO `penerbit` (`penerbit_id`, `penerbit_nama`) VALUES
('PB01', 'ANGKASA RAYA'),
('PB02', 'CAHAYA ILMU PERSADA'),
('PB03', 'SINAR ILMU PERKASA'),
('PB04', 'INTAN'),
('PB05', 'SINAR RAYA'),
('PB06', 'INFORMATIKA'),
('PB07', 'TIGA SEKAWAN'),
('PB08', 'CIPTA ILMU');

-- --------------------------------------------------------

--
-- Table structure for table `pengarang`
--

CREATE TABLE `pengarang` (
  `pengarang_id` char(3) NOT NULL,
  `pengarang_nama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengarang`
--

INSERT INTO `pengarang` (`pengarang_id`, `pengarang_nama`) VALUES
('ASW', 'Andi Setiawan'),
('BRH', 'Budi Raharjo'),
('BTO', 'Beni Tito'),
('DAR', 'Dewi Aulia Raharjo'),
('ERD', 'Erik Rusdianto'),
('ERK', 'E.Rosdiana K.'),
('FDY', 'Fredi Hidayat'),
('GZL', 'Abdul Ghozali'),
('HND', 'Hasanudin'),
('HNF', 'Ahmad Hanafi'),
('IGN', 'Iwan Gunardi'),
('IHR', 'Imam Heriyanto'),
('TIK', 'Totok Triwibowo');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`buku_isbn`),
  ADD KEY `penerbit_id` (`penerbit_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `link_buku_kategori`
--
ALTER TABLE `link_buku_kategori`
  ADD PRIMARY KEY (`buku_isbn`,`kategori_id`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Indexes for table `link_buku_pengarang`
--
ALTER TABLE `link_buku_pengarang`
  ADD PRIMARY KEY (`buku_isbn`,`pengarang_id`),
  ADD KEY `pengarang_id` (`pengarang_id`);

--
-- Indexes for table `log_stok_buku`
--
ALTER TABLE `log_stok_buku`
  ADD PRIMARY KEY (`id_updt`),
  ADD KEY `buku_isbn` (`buku_isbn`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`penerbit_id`);

--
-- Indexes for table `pengarang`
--
ALTER TABLE `pengarang`
  ADD PRIMARY KEY (`pengarang_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `log_stok_buku`
--
ALTER TABLE `log_stok_buku`
  MODIFY `id_updt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `buku_ibfk_1` FOREIGN KEY (`penerbit_id`) REFERENCES `penerbit` (`penerbit_id`);

--
-- Constraints for table `link_buku_kategori`
--
ALTER TABLE `link_buku_kategori`
  ADD CONSTRAINT `link_buku_kategori_ibfk_1` FOREIGN KEY (`buku_isbn`) REFERENCES `buku` (`buku_isbn`),
  ADD CONSTRAINT `link_buku_kategori_ibfk_2` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`kategori_id`);

--
-- Constraints for table `link_buku_pengarang`
--
ALTER TABLE `link_buku_pengarang`
  ADD CONSTRAINT `link_buku_pengarang_ibfk_1` FOREIGN KEY (`buku_isbn`) REFERENCES `buku` (`buku_isbn`),
  ADD CONSTRAINT `link_buku_pengarang_ibfk_2` FOREIGN KEY (`pengarang_id`) REFERENCES `pengarang` (`pengarang_id`);

--
-- Constraints for table `log_stok_buku`
--
ALTER TABLE `log_stok_buku`
  ADD CONSTRAINT `log_stok_buku_ibfk_1` FOREIGN KEY (`buku_isbn`) REFERENCES `buku` (`buku_isbn`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
