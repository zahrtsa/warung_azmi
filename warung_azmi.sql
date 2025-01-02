-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 27, 2024 at 11:16 AM
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
-- Database: `warung_azmi`
--

-- --------------------------------------------------------

--
-- Table structure for table `barangs`
--

CREATE TABLE `barangs` (
  `id` int NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `harga_beli` double NOT NULL,
  `harga_jual` double NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barangs`
--

INSERT INTO `barangs` (`id`, `nama`, `harga_beli`, `harga_jual`, `created_at`) VALUES
(1, 'Indomie kari ayam', 2450, 3500, '2024-12-22 14:50:02'),
(2, 'Minyak Goreng', 14000, 16000, '2024-12-22 14:50:02'),
(3, 'Gula Pasir', 12000, 15000, '2024-12-22 14:50:02'),
(4, 'Tepung Terigu', 9000, 12000, '2024-12-22 14:50:02'),
(5, 'Kopi Instan', 2500, 3000, '2024-12-22 14:50:02'),
(6, 'Susu Bubuk', 45000, 55000, '2024-12-22 14:50:02'),
(7, 'Mie Instan', 2500, 3000, '2024-12-22 14:50:02'),
(8, 'Cokelat Batang', 15000, 18000, '2024-12-22 14:50:02'),
(9, 'Keju Parut', 35000, 45000, '2024-12-22 14:50:02'),
(10, 'Sabun Mandi', 7000, 8500, '2024-12-22 14:50:02'),
(11, 'Shampo Sachet', 2000, 2500, '2024-12-22 14:50:02'),
(12, 'Tisu Gulung', 12000, 15000, '2024-12-22 14:50:02'),
(13, 'Air Mineral Galon', 15000, 20000, '2024-12-22 14:50:02'),
(14, 'Roti Tawar', 12000, 14000, '2024-12-22 14:50:02'),
(15, 'Sosis Ayam', 40000, 50000, '2024-12-22 14:50:02'),
(16, 'Kentang Goreng', 25000, 32000, '2024-12-22 14:50:02'),
(17, 'Telur Ayam', 20000, 25000, '2024-12-22 14:50:02'),
(18, 'Kecap Manis', 12000, 15000, '2024-12-22 14:50:02'),
(19, 'Saos Sambal', 10000, 12000, '2024-12-22 14:50:02');

-- --------------------------------------------------------

--
-- Table structure for table `hutangs`
--

CREATE TABLE `hutangs` (
  `id` int NOT NULL,
  `penjualan_id` int NOT NULL,
  `karyawan_id` int NOT NULL,
  `nama_penghutang` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal_lunas` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hutangs`
--

INSERT INTO `hutangs` (`id`, `penjualan_id`, `karyawan_id`, `nama_penghutang`, `tanggal_lunas`, `created_at`) VALUES
(2, 4, 4, 'Budi Santoso', '2025-12-23', '2024-12-22 17:29:26'),
(3, 6, 6, 'Citra Dewi', '2025-12-24', '2024-12-22 17:29:26'),
(4, 8, 1, 'Jin Hidayah Wahid', '2025-12-25', '2024-12-22 17:29:26'),
(5, 10, 10, 'Eko Wijaya', '2025-12-26', '2024-12-22 17:29:26'),
(6, 12, 12, 'Faisal Rahman', '2025-12-27', '2024-12-22 17:29:26'),
(7, 14, 14, 'Gina Kurniawati', '2025-12-28', '2024-12-22 17:29:26'),
(8, 16, 16, 'Hendra Setiawan', '2025-12-29', '2024-12-22 17:29:26'),
(9, 18, 18, 'Ika Lestari', '2025-12-30', '2024-12-22 17:29:26'),
(11, 1, 1, 'Kiki Setyani', '2025-01-01', '2024-12-22 17:29:26'),
(12, 3, 3, 'Lina Maharani', '2025-01-02', '2024-12-22 17:29:26'),
(13, 5, 5, 'Maya Sari', '2025-01-03', '2024-12-22 17:29:26'),
(14, 7, 7, 'Nina Salim', '2025-01-04', '2024-12-22 17:29:26'),
(15, 9, 9, 'Oka Laksana', '2025-01-05', '2024-12-22 17:29:26'),
(16, 11, 11, 'Putu Suryani', '2025-01-06', '2024-12-22 17:29:26'),
(17, 13, 13, 'Qori Zainuddin', '2025-01-07', '2024-12-22 17:29:26'),
(18, 15, 15, 'Rina Anggraeni', '2025-01-08', '2024-12-22 17:29:26'),
(20, 19, 19, 'Teguh Priyono', '2025-01-10', '2024-12-22 17:29:26');

-- --------------------------------------------------------

--
-- Table structure for table `karyawans`
--

CREATE TABLE `karyawans` (
  `id` int NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gaji` double NOT NULL,
  `shift` enum('pagi','siang','malam') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `karyawans`
--

INSERT INTO `karyawans` (`id`, `nama`, `gaji`, `shift`, `created_at`) VALUES
(1, 'Roesdi Imoet', 3000000, 'malam', '2024-12-22 14:53:15'),
(2, 'Roesdi Imoet', 3000000, 'malam', '2024-12-22 14:53:15'),
(3, 'Roesdi Imoet', 3000000, 'malam', '2024-12-22 14:53:15'),
(4, 'Roesdi Imoet', 3000000, 'malam', '2024-12-22 14:53:15'),
(5, 'Roesdi Imoet', 3000000, 'malam', '2024-12-22 14:53:15'),
(6, 'Roesdi Imoet', 3000000, 'malam', '2024-12-22 14:53:15'),
(7, 'Roesdi Imoet', 3000000, 'malam', '2024-12-22 14:53:15'),
(8, 'Roesdi Imoet', 3000000, 'malam', '2024-12-22 14:53:15'),
(9, 'Roesdi Imoet', 3000000, 'malam', '2024-12-22 14:53:15'),
(10, 'Roesdi Imoet', 3000000, 'malam', '2024-12-22 14:53:15'),
(11, 'Roesdi Imoet', 3000000, 'malam', '2024-12-22 14:53:15'),
(12, 'Roesdi Imoet', 3000000, 'malam', '2024-12-22 14:53:15'),
(13, 'Roesdi Imoet', 3000000, 'malam', '2024-12-22 14:53:15'),
(14, 'Roesdi Imoet', 3000000, 'malam', '2024-12-22 14:53:15'),
(15, 'Roesdi Imoet', 3000000, 'malam', '2024-12-22 14:53:15'),
(16, 'Roesdi Imoet', 3000000, 'malam', '2024-12-22 14:53:15'),
(17, 'Roesdi Imoet', 3000000, 'malam', '2024-12-22 14:53:15'),
(18, 'Roesdi Imoet', 3000000, 'malam', '2024-12-22 14:53:15'),
(19, 'Roesdi Imoet', 3000000, 'malam', '2024-12-22 14:53:15');

-- --------------------------------------------------------

--
-- Table structure for table `keuangans`
--

CREATE TABLE `keuangans` (
  `id` int NOT NULL,
  `pembelian_id` int NOT NULL,
  `penjualan_id` int NOT NULL,
  `karyawan_id` int NOT NULL,
  `pengeluaran` double NOT NULL DEFAULT '0',
  `pemasukan` double NOT NULL DEFAULT '0',
  `tanggal` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `keuangans`
--

INSERT INTO `keuangans` (`id`, `pembelian_id`, `penjualan_id`, `karyawan_id`, `pengeluaran`, `pemasukan`, `tanggal`, `created_at`) VALUES
(3, 3, 3, 3, 200000, 400000, '2024-12-03', '2024-12-22 19:02:06'),
(4, 4, 4, 4, 400000, 600000, '2024-12-04', '2024-12-22 19:02:06'),
(5, 5, 5, 5, 250000, 550000, '2024-12-05', '2024-12-22 19:02:06'),
(6, 6, 6, 6, 300000, 700000, '2024-12-06', '2024-12-22 19:02:06'),
(7, 7, 7, 7, 500000, 1000000, '2024-12-07', '2024-12-22 19:02:06'),
(8, 8, 8, 8, 200000, 450000, '2024-12-08', '2024-12-22 19:02:06'),
(9, 9, 9, 9, 400000, 800000, '2024-12-09', '2024-12-22 19:02:06'),
(12, 12, 12, 12, 450000, 850000, '2024-12-12', '2024-12-22 19:02:06'),
(13, 13, 13, 13, 500000, 1000000, '2024-12-13', '2024-12-22 19:02:06'),
(14, 14, 14, 14, 250000, 550000, '2024-12-14', '2024-12-22 19:02:06'),
(15, 15, 15, 15, 300000, 600000, '2024-12-15', '2024-12-22 19:02:06'),
(16, 16, 16, 16, 400000, 700000, '2024-12-16', '2024-12-22 19:02:06'),
(17, 17, 17, 17, 350000, 750000, '2024-12-17', '2024-12-22 19:02:06'),
(18, 18, 18, 18, 200000, 500000, '2024-12-18', '2024-12-22 19:02:06');

-- --------------------------------------------------------

--
-- Table structure for table `pemasoks`
--

CREATE TABLE `pemasoks` (
  `id` int NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telpon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pemasoks`
--

INSERT INTO `pemasoks` (`id`, `nama`, `telpon`, `alamat`, `created_at`) VALUES
(2, 'Budi', '082345678901', 'Jl. Pahlawan No. 5, Bandung', '2024-12-22 14:56:19'),
(3, 'Citra', '083456789012', 'Jl. Raya No. 20, Surabaya', '2024-12-22 14:56:19'),
(4, 'Dani', '084567890123', 'Jl. Suka No. 30, Yogyakarta', '2024-12-22 14:56:19'),
(5, 'Eka', '085678901234', 'Jl. Cendana No. 15, Semarang', '2024-12-22 14:56:19'),
(6, 'Fikri', '086789012345', 'Jl. Anggrek No. 25, Malang', '2024-12-22 14:56:19'),
(7, 'Gina', '087890123456', 'Jl. Mawar No. 35, Medan', '2024-12-22 14:56:19'),
(8, 'Hadi', '088901234567', 'Jl. Kembang No. 40, Makassar', '2024-12-22 14:56:19'),
(9, 'Indah', '089012345678', 'Jl. Sumber No. 45, Bali', '2024-12-22 14:56:19'),
(10, 'Joko', '081112233445', 'Jl. Senopati No. 50, Jakarta', '2024-12-22 14:56:19'),
(11, 'Kiki', '082223344556', 'Jl. Gunung No. 60, Bandung', '2024-12-22 14:56:19'),
(12, 'Lina', '083334455667', 'Jl. Laut No. 70, Surabaya', '2024-12-22 14:56:19'),
(13, 'Mira', '084445566778', 'Jl. Teluk No. 80, Yogyakarta', '2024-12-22 14:56:19'),
(14, 'Nina', '085556677889', 'Jl. Jaya No. 90, Semarang', '2024-12-22 14:56:19'),
(15, 'Omar', '086667788990', 'Jl. Hijau No. 100, Malang', '2024-12-22 14:56:19'),
(16, 'Putri', '087778899001', 'Jl. Taman No. 110, Medan', '2024-12-22 14:56:19'),
(17, 'Rudi', '088889900112', 'Jl. Rimba No. 120, Makassar', '2024-12-22 14:56:19'),
(18, 'Siti', '089990011223', 'Jl. Pelita No. 130, Bali', '2024-12-22 14:56:19'),
(19, 'Tono', '081223344556', 'Jl. Sejahtera No. 140, Jakarta', '2024-12-22 14:56:19'),
(20, 'Umar', '082334455667', 'Jl. Persada No. 150, Bandung', '2024-12-22 14:56:19');

-- --------------------------------------------------------

--
-- Table structure for table `pembelians`
--

CREATE TABLE `pembelians` (
  `id` int NOT NULL,
  `barang_id` int NOT NULL,
  `pemasok_id` int NOT NULL,
  `karyawan_id` int NOT NULL,
  `jumlah` int NOT NULL,
  `total_harga` double NOT NULL,
  `tanggal` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembelians`
--

INSERT INTO `pembelians` (`id`, `barang_id`, `pemasok_id`, `karyawan_id`, `jumlah`, `total_harga`, `tanggal`, `created_at`) VALUES
(2, 1, 3, 2, 3, 300000, '2024-12-02', '2024-12-22 15:11:18'),
(3, 3, 3, 3, 7, 700000, '2024-12-03', '2024-12-22 15:11:18'),
(4, 4, 4, 4, 2, 200000, '2024-12-04', '2024-12-22 15:11:18'),
(5, 5, 5, 5, 10, 1000000, '2024-12-05', '2024-12-22 15:11:18'),
(6, 6, 6, 6, 6, 600000, '2024-12-06', '2024-12-22 15:11:18'),
(7, 7, 7, 7, 8, 800000, '2024-12-07', '2024-12-22 15:11:18'),
(8, 8, 8, 8, 4, 400000, '2024-12-08', '2024-12-22 15:11:18'),
(9, 9, 9, 9, 12, 1200000, '2024-12-09', '2024-12-22 15:11:18'),
(10, 10, 10, 10, 9, 900000, '2024-12-10', '2024-12-22 15:11:18'),
(12, 12, 2, 2, 5, 500000, '2024-12-12', '2024-12-22 15:11:18'),
(13, 13, 3, 3, 6, 600000, '2024-12-13', '2024-12-22 15:11:18'),
(14, 14, 4, 4, 7, 700000, '2024-12-14', '2024-12-22 15:11:18'),
(15, 15, 5, 5, 2, 200000, '2024-12-15', '2024-12-22 15:11:18'),
(16, 16, 6, 6, 8, 800000, '2024-12-16', '2024-12-22 15:11:18'),
(17, 17, 7, 7, 4, 400000, '2024-12-17', '2024-12-22 15:11:18'),
(18, 18, 8, 8, 9, 900000, '2024-12-18', '2024-12-22 15:11:18'),
(20, 10, 10, 10, 10, 1000000, '2024-12-20', '2024-12-22 15:11:18');

-- --------------------------------------------------------

--
-- Table structure for table `penjualans`
--

CREATE TABLE `penjualans` (
  `id` int NOT NULL,
  `barang_id` int NOT NULL,
  `karyawan_id` int NOT NULL,
  `nomor_penjualan` int NOT NULL,
  `jumlah` int NOT NULL,
  `total_harga` double NOT NULL,
  `status` enum('lunas','hutang') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `metode_bayar` enum('cash','qris') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tanggal` date NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualans`
--

INSERT INTO `penjualans` (`id`, `barang_id`, `karyawan_id`, `nomor_penjualan`, `jumlah`, `total_harga`, `status`, `metode_bayar`, `tanggal`, `created_at`) VALUES
(1, 1, 1, 1001, 5, 500000, 'lunas', 'cash', '2024-12-22', '2024-12-22 15:30:13'),
(3, 3, 3, 1003, 3, 300000, 'lunas', 'cash', '2024-12-24', '2024-12-22 15:30:13'),
(4, 4, 4, 1004, 8, 800000, 'hutang', NULL, '2024-12-25', '2024-12-22 15:30:13'),
(5, 5, 5, 1005, 2, 200000, 'lunas', 'qris', '2024-12-26', '2024-12-22 15:30:13'),
(6, 6, 6, 1006, 4, 400000, 'hutang', NULL, '2024-12-27', '2024-12-22 15:30:13'),
(7, 7, 7, 1007, 6, 600000, 'lunas', 'cash', '2024-12-28', '2024-12-22 15:30:13'),
(8, 8, 8, 1008, 9, 900000, 'hutang', NULL, '2024-12-29', '2024-12-22 15:30:13'),
(9, 9, 9, 1009, 1, 100000, 'lunas', 'cash', '2024-12-30', '2024-12-22 15:30:13'),
(10, 10, 10, 1010, 7, 700000, 'hutang', NULL, '2024-12-31', '2024-12-22 15:30:13'),
(11, 11, 11, 1011, 5, 500000, 'lunas', 'qris', '2025-01-01', '2024-12-22 15:30:13'),
(12, 12, 12, 1012, 10, 1000000, 'hutang', NULL, '2025-01-02', '2024-12-22 15:30:13'),
(13, 13, 13, 1013, 3, 300000, 'lunas', 'cash', '2025-01-03', '2024-12-22 15:30:13'),
(14, 14, 14, 1014, 8, 800000, 'hutang', NULL, '2025-01-04', '2024-12-22 15:30:13'),
(15, 15, 15, 1015, 2, 200000, 'lunas', 'cash', '2025-01-05', '2024-12-22 15:30:13'),
(16, 16, 16, 1016, 4, 400000, 'hutang', NULL, '2025-01-06', '2024-12-22 15:30:13'),
(17, 17, 17, 1017, 6, 600000, 'lunas', 'qris', '2025-01-07', '2024-12-22 15:30:13'),
(18, 18, 18, 1018, 9, 900000, 'hutang', NULL, '2025-01-08', '2024-12-22 15:30:13'),
(19, 19, 19, 1019, 1, 100000, 'lunas', 'qris', '2025-01-09', '2024-12-22 15:30:13');

-- --------------------------------------------------------

--
-- Table structure for table `stoks`
--

CREATE TABLE `stoks` (
  `id` int NOT NULL,
  `barang_id` int NOT NULL,
  `karyawan_id` int NOT NULL,
  `jumlah_barang` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stoks`
--

INSERT INTO `stoks` (`id`, `barang_id`, `karyawan_id`, `jumlah_barang`, `created_at`) VALUES
(1, 1, 19, 100, '2024-12-22 15:18:42'),
(2, 2, 2, 200, '2024-12-22 15:18:42'),
(3, 3, 3, 150, '2024-12-22 15:18:42'),
(4, 4, 4, 50, '2024-12-22 15:18:42'),
(5, 5, 5, 300, '2024-12-22 15:18:42'),
(6, 6, 6, 120, '2024-12-22 15:18:42'),
(7, 7, 7, 250, '2024-12-22 15:18:42'),
(8, 8, 8, 180, '2024-12-22 15:18:42'),
(9, 9, 9, 90, '2024-12-22 15:18:42'),
(10, 10, 10, 210, '2024-12-22 15:18:42'),
(11, 11, 11, 130, '2024-12-22 15:18:42'),
(12, 12, 12, 75, '2024-12-22 15:18:42'),
(13, 13, 13, 160, '2024-12-22 15:18:42'),
(14, 14, 14, 240, '2024-12-22 15:18:42'),
(16, 16, 16, 190, '2024-12-22 15:18:42'),
(17, 17, 17, 220, '2024-12-22 15:18:42'),
(18, 18, 18, 80, '2024-12-22 15:18:42'),
(19, 19, 19, 140, '2024-12-22 15:18:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barangs`
--
ALTER TABLE `barangs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hutangs`
--
ALTER TABLE `hutangs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penjualan_id` (`penjualan_id`),
  ADD KEY `karyawan_id` (`karyawan_id`);

--
-- Indexes for table `karyawans`
--
ALTER TABLE `karyawans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keuangans`
--
ALTER TABLE `keuangans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pembelian_id` (`pembelian_id`),
  ADD KEY `penjualan_id` (`penjualan_id`),
  ADD KEY `karyawan_id` (`karyawan_id`);

--
-- Indexes for table `pemasoks`
--
ALTER TABLE `pemasoks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembelians`
--
ALTER TABLE `pembelians`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barang_id` (`barang_id`),
  ADD KEY `pemasok_id` (`pemasok_id`),
  ADD KEY `karyawan_id` (`karyawan_id`);

--
-- Indexes for table `penjualans`
--
ALTER TABLE `penjualans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barang_id` (`barang_id`),
  ADD KEY `karyawan_id` (`karyawan_id`);

--
-- Indexes for table `stoks`
--
ALTER TABLE `stoks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barang_id` (`barang_id`),
  ADD KEY `karyawan_id` (`karyawan_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barangs`
--
ALTER TABLE `barangs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `hutangs`
--
ALTER TABLE `hutangs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `karyawans`
--
ALTER TABLE `karyawans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `keuangans`
--
ALTER TABLE `keuangans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pemasoks`
--
ALTER TABLE `pemasoks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pembelians`
--
ALTER TABLE `pembelians`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `penjualans`
--
ALTER TABLE `penjualans`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `stoks`
--
ALTER TABLE `stoks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hutangs`
--
ALTER TABLE `hutangs`
  ADD CONSTRAINT `hutangs_ibfk_1` FOREIGN KEY (`penjualan_id`) REFERENCES `penjualans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hutangs_ibfk_2` FOREIGN KEY (`karyawan_id`) REFERENCES `karyawans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `keuangans`
--
ALTER TABLE `keuangans`
  ADD CONSTRAINT `keuangans_ibfk_1` FOREIGN KEY (`pembelian_id`) REFERENCES `pembelians` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `keuangans_ibfk_2` FOREIGN KEY (`penjualan_id`) REFERENCES `penjualans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `keuangans_ibfk_3` FOREIGN KEY (`karyawan_id`) REFERENCES `karyawans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pembelians`
--
ALTER TABLE `pembelians`
  ADD CONSTRAINT `pembelians_ibfk_1` FOREIGN KEY (`barang_id`) REFERENCES `barangs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pembelians_ibfk_2` FOREIGN KEY (`pemasok_id`) REFERENCES `pemasoks` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pembelians_ibfk_3` FOREIGN KEY (`karyawan_id`) REFERENCES `karyawans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `penjualans`
--
ALTER TABLE `penjualans`
  ADD CONSTRAINT `penjualans_ibfk_1` FOREIGN KEY (`barang_id`) REFERENCES `barangs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `penjualans_ibfk_2` FOREIGN KEY (`karyawan_id`) REFERENCES `karyawans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stoks`
--
ALTER TABLE `stoks`
  ADD CONSTRAINT `stoks_ibfk_1` FOREIGN KEY (`barang_id`) REFERENCES `barangs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stoks_ibfk_2` FOREIGN KEY (`karyawan_id`) REFERENCES `karyawans` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
