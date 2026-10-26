-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 26, 2026 at 02:24 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_rumah_sakit`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int NOT NULL,
  `nama_dokter` varchar(100) NOT NULL,
  `id_poli` int NOT NULL,
  `spesialisasi` varchar(100) NOT NULL,
  `tarif_konsultasi` decimal(12,2) NOT NULL DEFAULT '0.00',
  `status_dokter` varchar(20) DEFAULT NULL
) ;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_dokter`, `id_poli`, `spesialisasi`, `tarif_konsultasi`, `status_dokter`) VALUES
(1, 'dr. Andi Wijaya', 1, 'Dokter Umum', 100000.00, 'Aktif'),
(2, 'dr. Budi Santoso, Sp.A', 2, 'Spesialis Anak', 150000.00, 'Aktif'),
(3, 'dr. Citra Dewi, Sp.PD', 3, 'Spesialis Penyakit Dalam', 200000.00, 'Aktif'),
(4, 'dr. Doni Prasetyo, Sp.B', 4, 'Spesialis Bedah', 250000.00, 'Aktif'),
(5, 'dr. Eka Putri, Sp.KG', 5, 'Spesialis Gigi', 120000.00, 'Aktif'),
(6, 'dr. Farhan Ahmad, Sp.M', 6, 'Spesialis Mata', 175000.00, 'Aktif'),
(7, 'dr. Gita Gutawa, Sp.S', 7, 'Spesialis Saraf', 220000.00, 'Aktif'),
(8, 'dr. Hendra Kurnia, Sp.THT', 8, 'Spesialis THT', 160000.00, 'Aktif'),
(9, 'dr. Indah Permata, Sp.KK', 9, 'Spesialis Kulit', 180000.00, 'Cuti'),
(10, 'dr. Joko Susilo, Sp.KJ', 10, 'Spesialis Jiwa', 200000.00, 'Nonaktif');

-- --------------------------------------------------------

--
-- Table structure for table `kunjungan`
--

CREATE TABLE `kunjungan` (
  `id_kunjungan` int NOT NULL,
  `id_pasien` int NOT NULL,
  `id_dokter` int NOT NULL,
  `tanggal_kunjungan` date NOT NULL,
  `jenis_kunjungan` varchar(30) DEFAULT NULL,
  `diagnosis` varchar(200) DEFAULT NULL,
  `status_kunjungan` varchar(30) DEFAULT NULL
) ;

--
-- Dumping data for table `kunjungan`
--

INSERT INTO `kunjungan` (`id_kunjungan`, `id_pasien`, `id_dokter`, `tanggal_kunjungan`, `jenis_kunjungan`, `diagnosis`, `status_kunjungan`) VALUES
(1, 1, 1, '2026-10-01', 'Umum', 'Demam dan Flu', 'Selesai'),
(2, 2, 2, '2026-10-02', 'Kontrol', 'Asma Ringan', 'Selesai'),
(3, 3, 3, '2026-10-03', 'Darurat', 'Gastritis Akut', 'Selesai'),
(4, 4, 4, '2026-10-04', 'Umum', 'Usus Buntu', 'Selesai'),
(5, 5, 5, '2026-10-05', 'Umum', 'Karies Gigi', 'Selesai'),
(6, 6, 6, '2026-10-06', 'Kontrol', 'Miopia', 'Selesai'),
(7, 7, 7, '2026-10-07', 'Darurat', 'Migrain Berat', 'Diperiksa'),
(8, 8, 8, '2026-10-08', 'Umum', 'Otitis Media', 'Batal'),
(9, 1, 1, '2026-10-10', 'Kontrol', 'Pemeriksaan Lanjutan Flu', 'Menunggu'),
(10, 2, 2, '2026-10-12', 'Darurat', 'Demam Tinggi', 'Menunggu');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int NOT NULL,
  `nama_pasien` varchar(100) NOT NULL,
  `jenis_kelamin` char(1) DEFAULT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(200) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL
) ;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `jenis_kelamin`, `tanggal_lahir`, `alamat`, `no_hp`) VALUES
(1, 'Ahmad Dahlan', 'L', '1990-05-15', 'Jl. Merdeka No. 10', '081234567890'),
(2, 'Siti Nurhaliza', 'P', '1995-08-20', 'Jl. Mawar No. 5', '082345678901'),
(3, 'Rudi Hartono', 'L', '1988-12-01', 'Jl. Anggrek No. 12', '083456789012'),
(4, 'Dewi Sartika', 'P', '2000-01-10', 'Jl. Melati No. 8', '084567890123'),
(5, 'Eko Prasetyo', 'L', '1975-03-25', 'Jl. Dahlia No. 15', '085678901234'),
(6, 'Fitriani', 'P', '1992-07-18', 'Jl. Kenanga No. 3', '086789012345'),
(7, 'Giri Ginanjar', 'L', '1985-11-30', 'Jl. Flamboyan No. 7', '087890123456'),
(8, 'Hany Handayani', 'P', '1998-04-05', 'Jl. Kamboja No. 9', '088901234567'),
(9, 'Irfan Bachdim', 'L', '1993-09-09', 'Jl. Veteran No. 20', '089012345678'),
(10, 'Julia Perez', 'P', '1987-02-14', 'Jl. Pemuda No. 45', '081112223334');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int NOT NULL,
  `id_kunjungan` int NOT NULL,
  `tanggal_bayar` date NOT NULL,
  `biaya_konsultasi` decimal(12,2) NOT NULL DEFAULT '0.00',
  `biaya_obat` decimal(12,2) NOT NULL DEFAULT '0.00',
  `biaya_laboratorium` decimal(12,2) NOT NULL DEFAULT '0.00',
  `diskon` decimal(12,2) NOT NULL DEFAULT '0.00',
  `metode_bayar` varchar(30) DEFAULT NULL,
  `status_bayar` varchar(20) DEFAULT NULL
) ;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_kunjungan`, `tanggal_bayar`, `biaya_konsultasi`, `biaya_obat`, `biaya_laboratorium`, `diskon`, `metode_bayar`, `status_bayar`) VALUES
(1, 1, '2026-10-01', 100000.00, 50000.00, 0.00, 10000.00, 'Tunai', 'Lunas'),
(2, 2, '2026-10-02', 150000.00, 75000.00, 50000.00, 0.00, 'Transfer', 'Lunas'),
(3, 3, '2026-10-03', 200000.00, 150000.00, 100000.00, 50000.00, 'Asuransi', 'Lunas'),
(4, 4, '2026-10-04', 250000.00, 200000.00, 150000.00, 25000.00, 'Asuransi', 'Lunas'),
(5, 5, '2026-10-05', 120000.00, 30000.00, 0.00, 0.00, 'Tunai', 'Lunas'),
(6, 6, '2026-10-06', 175000.00, 60000.00, 0.00, 15000.00, 'Transfer', 'Lunas'),
(7, 7, '2026-10-07', 220000.00, 80000.00, 100000.00, 0.00, 'Tunai', 'Belum Lunas'),
(8, 8, '2026-10-08', 160000.00, 0.00, 0.00, 0.00, 'Tunai', 'Belum Lunas');

-- --------------------------------------------------------

--
-- Table structure for table `poli`
--

CREATE TABLE `poli` (
  `id_poli` int NOT NULL,
  `nama_poli` varchar(100) NOT NULL,
  `lantai` int NOT NULL,
  `status_poli` varchar(20) DEFAULT NULL
) ;

--
-- Dumping data for table `poli`
--

INSERT INTO `poli` (`id_poli`, `nama_poli`, `lantai`, `status_poli`) VALUES
(1, 'Poli Umum', 1, 'Aktif'),
(2, 'Poli Anak', 2, 'Aktif'),
(3, 'Poli Penyakit Dalam', 2, 'Aktif'),
(4, 'Poli Bedah', 3, 'Aktif'),
(5, 'Poli Gigi', 1, 'Aktif'),
(6, 'Poli Mata', 3, 'Aktif'),
(7, 'Poli Saraf', 4, 'Aktif'),
(8, 'Poli THT', 3, 'Aktif'),
(9, 'Poli Kulit', 4, 'Aktif'),
(10, 'Poli Jiwa', 5, 'Nonaktif');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_soal_4_inner_join`
-- (See below for the actual view)
--
CREATE TABLE `view_soal_4_inner_join` (
`id_pasien` int
,`nama_pasien` varchar(100)
,`id_dokter` int
,`nama_dokter` varchar(100)
,`nama_poli` varchar(100)
,`spesialisasi` varchar(100)
,`tanggal_kunjungan` date
,`status_kunjungan` varchar(30)
,`diagnosis` varchar(200)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_soal_5_left_join`
-- (See below for the actual view)
--
CREATE TABLE `view_soal_5_left_join` (
`nama_pasien` varchar(100)
,`no_hp` varchar(15)
,`jumlah_kunjungan` bigint
,`tanggal_kunjungan_terakhir` date
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_soal_6_right_join`
-- (See below for the actual view)
--
CREATE TABLE `view_soal_6_right_join` (
`nama_dokter` varchar(100)
,`spesialisasi` varchar(100)
,`nama_poli` varchar(100)
,`id_kunjungan` int
,`status_kunjungan` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_soal_7_kombinasi_join`
-- (See below for the actual view)
--
CREATE TABLE `view_soal_7_kombinasi_join` (
`nama_pasien` varchar(100)
,`nama_dokter` varchar(100)
,`nama_poli` varchar(100)
,`tanggal_kunjungan` date
,`diagnosis` varchar(200)
,`total_sebelum_diskon` decimal(14,2)
,`diskon` decimal(12,2)
,`total_setelah_diskon` decimal(15,2)
,`metode_pembayaran` varchar(30)
,`status_pembayaran` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_soal_8_if_tunggal`
-- (See below for the actual view)
--
CREATE TABLE `view_soal_8_if_tunggal` (
`id_pembayaran` int
,`id_kunjungan` int
,`diskon` decimal(12,2)
,`keterangan_diskon` varchar(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_soal_9_if_majemuk`
-- (See below for the actual view)
--
CREATE TABLE `view_soal_9_if_majemuk` (
`id_pembayaran` int
,`id_kunjungan` int
,`total_biaya` decimal(15,2)
,`klasifikasi_biaya` varchar(8)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_soal_10_if_logika`
-- (See below for the actual view)
--
CREATE TABLE `view_soal_10_if_logika` (
`id_kunjungan` int
,`jenis_kunjungan` varchar(30)
,`status_kunjungan` varchar(30)
,`status_prioritas` varchar(17)
);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`),
  ADD KEY `id_poli` (`id_poli`);

--
-- Indexes for table `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD PRIMARY KEY (`id_kunjungan`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD UNIQUE KEY `id_kunjungan` (`id_kunjungan`);

--
-- Indexes for table `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id_poli`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id_dokter` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kunjungan`
--
ALTER TABLE `kunjungan`
  MODIFY `id_kunjungan` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id_pasien` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `poli`
--
ALTER TABLE `poli`
  MODIFY `id_poli` int NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------

--
-- Structure for view `view_soal_4_inner_join`
--
DROP TABLE IF EXISTS `view_soal_4_inner_join`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_soal_4_inner_join`  AS SELECT `p`.`id_pasien` AS `id_pasien`, `p`.`nama_pasien` AS `nama_pasien`, `d`.`id_dokter` AS `id_dokter`, `d`.`nama_dokter` AS `nama_dokter`, `pl`.`nama_poli` AS `nama_poli`, `d`.`spesialisasi` AS `spesialisasi`, `k`.`tanggal_kunjungan` AS `tanggal_kunjungan`, `k`.`status_kunjungan` AS `status_kunjungan`, `k`.`diagnosis` AS `diagnosis` FROM (((`kunjungan` `k` join `pasien` `p` on((`k`.`id_pasien` = `p`.`id_pasien`))) join `dokter` `d` on((`k`.`id_dokter` = `d`.`id_dokter`))) join `poli` `pl` on((`d`.`id_poli` = `pl`.`id_poli`))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_soal_5_left_join`
--
DROP TABLE IF EXISTS `view_soal_5_left_join`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_soal_5_left_join`  AS SELECT `p`.`nama_pasien` AS `nama_pasien`, `p`.`no_hp` AS `no_hp`, count(`k`.`id_kunjungan`) AS `jumlah_kunjungan`, max(`k`.`tanggal_kunjungan`) AS `tanggal_kunjungan_terakhir` FROM (`pasien` `p` left join `kunjungan` `k` on((`p`.`id_pasien` = `k`.`id_pasien`))) GROUP BY `p`.`id_pasien`, `p`.`nama_pasien`, `p`.`no_hp` ;

-- --------------------------------------------------------

--
-- Structure for view `view_soal_6_right_join`
--
DROP TABLE IF EXISTS `view_soal_6_right_join`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_soal_6_right_join`  AS SELECT `d`.`nama_dokter` AS `nama_dokter`, `d`.`spesialisasi` AS `spesialisasi`, `pl`.`nama_poli` AS `nama_poli`, `k`.`id_kunjungan` AS `id_kunjungan`, `k`.`status_kunjungan` AS `status_kunjungan` FROM ((`dokter` `d` left join `kunjungan` `k` on((`k`.`id_dokter` = `d`.`id_dokter`))) left join `poli` `pl` on((`d`.`id_poli` = `pl`.`id_poli`))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_soal_7_kombinasi_join`
--
DROP TABLE IF EXISTS `view_soal_7_kombinasi_join`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_soal_7_kombinasi_join`  AS SELECT `pas`.`nama_pasien` AS `nama_pasien`, `dok`.`nama_dokter` AS `nama_dokter`, `pol`.`nama_poli` AS `nama_poli`, `kun`.`tanggal_kunjungan` AS `tanggal_kunjungan`, `kun`.`diagnosis` AS `diagnosis`, ((`pem`.`biaya_konsultasi` + `pem`.`biaya_obat`) + `pem`.`biaya_laboratorium`) AS `total_sebelum_diskon`, `pem`.`diskon` AS `diskon`, (((`pem`.`biaya_konsultasi` + `pem`.`biaya_obat`) + `pem`.`biaya_laboratorium`) - `pem`.`diskon`) AS `total_setelah_diskon`, ifnull(`pem`.`metode_bayar`,'Belum Ada Transaksi') AS `metode_pembayaran`, ifnull(`pem`.`status_bayar`,'Belum Dibayar') AS `status_pembayaran` FROM ((((`kunjungan` `kun` join `pasien` `pas` on((`kun`.`id_pasien` = `pas`.`id_pasien`))) join `dokter` `dok` on((`kun`.`id_dokter` = `dok`.`id_dokter`))) join `poli` `pol` on((`dok`.`id_poli` = `pol`.`id_poli`))) left join `pembayaran` `pem` on((`kun`.`id_kunjungan` = `pem`.`id_kunjungan`))) ;

-- --------------------------------------------------------

--
-- Structure for view `view_soal_8_if_tunggal`
--
DROP TABLE IF EXISTS `view_soal_8_if_tunggal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_soal_8_if_tunggal`  AS SELECT `pembayaran`.`id_pembayaran` AS `id_pembayaran`, `pembayaran`.`id_kunjungan` AS `id_kunjungan`, `pembayaran`.`diskon` AS `diskon`, if((`pembayaran`.`diskon` > 0),'Mendapat Diskon','Tidak Mendapat Diskon') AS `keterangan_diskon` FROM `pembayaran` ;

-- --------------------------------------------------------

--
-- Structure for view `view_soal_9_if_majemuk`
--
DROP TABLE IF EXISTS `view_soal_9_if_majemuk`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_soal_9_if_majemuk`  AS SELECT `pembayaran`.`id_pembayaran` AS `id_pembayaran`, `pembayaran`.`id_kunjungan` AS `id_kunjungan`, (((`pembayaran`.`biaya_konsultasi` + `pembayaran`.`biaya_obat`) + `pembayaran`.`biaya_laboratorium`) - `pembayaran`.`diskon`) AS `total_biaya`, if(((((`pembayaran`.`biaya_konsultasi` + `pembayaran`.`biaya_obat`) + `pembayaran`.`biaya_laboratorium`) - `pembayaran`.`diskon`) < 100000),'Ekonomis',if(((((`pembayaran`.`biaya_konsultasi` + `pembayaran`.`biaya_obat`) + `pembayaran`.`biaya_laboratorium`) - `pembayaran`.`diskon`) < 300000),'Menengah','Premium')) AS `klasifikasi_biaya` FROM `pembayaran` ;

-- --------------------------------------------------------

--
-- Structure for view `view_soal_10_if_logika`
--
DROP TABLE IF EXISTS `view_soal_10_if_logika`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_soal_10_if_logika`  AS SELECT `kunjungan`.`id_kunjungan` AS `id_kunjungan`, `kunjungan`.`jenis_kunjungan` AS `jenis_kunjungan`, `kunjungan`.`status_kunjungan` AS `status_kunjungan`, if(((`kunjungan`.`jenis_kunjungan` = 'Darurat') and (`kunjungan`.`status_kunjungan` <> 'Batal')),'Prioritas Tinggi',if(((`kunjungan`.`jenis_kunjungan` = 'Kontrol') and (`kunjungan`.`status_kunjungan` = 'Selesai')),'Kontrol Selesai',if((`kunjungan`.`status_kunjungan` = 'Batal'),'Tidak Dilayani','Pelayanan Reguler'))) AS `status_prioritas` FROM `kunjungan` ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `dokter_ibfk_1` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id_poli`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `kunjungan`
--
ALTER TABLE `kunjungan`
  ADD CONSTRAINT `kunjungan_ibfk_1` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `kunjungan_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_kunjungan`) REFERENCES `kunjungan` (`id_kunjungan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
