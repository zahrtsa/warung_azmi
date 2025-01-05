# DATABASE : Warung_sembako_azmi

Projek uas basis data, membuat database berdasarkan implementasi pada situasi nyata. Contohnya warung sembako yang akan mengimplementasikannya menjadi relasi-relasi terkait entitas dalam tabel di database. Berikut step by step nya :

## Membuat database warung sembako azmi

```sql
  --membuat database warung sembako azmi
  CREATE DATABASE warung_azmi
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;
```

#### Screenshoot Command

<img src="img/create db.png" width="100%" height="100%">

## Membuat Tabel-tabel database

Command-comand dibawah digunakan untuk membuat tabel database beserta relasinya terhadap setiap entitas-entitas dengan menggunakan foreign key di tabel relasinya. Dengan referensi kepada id utama dari tabel masternya, kemudian diberikan <b>ON DELETE CASCADE</b> berguna dalam hubungan induk-anak yang ketika data pada parent dihapus maka data pada anaknya juga.

```sql
  --membuat tabel barang
  CREATE TABLE barangs (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    harga_beli DOUBLE NOT NULL,
    harga_jual DOUBLE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  ) ENGINE=InnoDB
    DEFAULT CHARSET=utf8mb4
    COLLATE=utf8mb4_general_ci;


  --membuat tabel karyawan
  CREATE TABLE karyawans (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    gaji DOUBLE NOT NULL,
    shift ENUM('pagi', 'siang', 'malam'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  ) ENGINE=InnoDB
    DEFAULT CHARSET=utf8mb4
    COLLATE=utf8mb4_general_ci;

  --membuat tabel pemasok
  CREATE TABLE pemasoks (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nama VARCHAR(100) NOT NULL,
    telpon VARCHAR(50) NOT NULL,
    alamat TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
  ) ENGINE=InnoDB
    DEFAULT CHARSET=utf8mb4
    COLLATE=utf8mb4_general_ci;

  --membuat tabel pembelian
  CREATE TABLE pembelians (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    barang_id INT NOT NULL,
    pemasok_id INT NOT NULL,
    karyawan_id INT NOT NULL,
    jumlah INT NOT NULL,
    total_harga DOUBLE NOT NULL,
    tanggal DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (barang_id) REFERENCES barangs (id) ON DELETE CASCADE,
    FOREIGN KEY (pemasok_id) REFERENCES pemasoks (id) ON DELETE CASCADE,
    FOREIGN KEY (karyawan_id) REFERENCES karyawans (id) ON DELETE CASCADE
  ) ENGINE=InnoDB
    DEFAULT CHARSET=utf8mb4
    COLLATE=utf8mb4_general_ci;

  --membuat tabel stok
  CREATE TABLE stoks (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    barang_id INT NOT NULL,
    karyawan_id INT NOT NULL,
    jumlah_barang INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (barang_id) REFERENCES barangs (id) ON DELETE CASCADE,
    FOREIGN KEY (karyawan_id) REFERENCES karyawans (id) ON DELETE CASCADE
  ) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_general_ci;

  --membuat tabel penjualan
  CREATE TABLE penjualans (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    barang_id INT NOT NULL,
    karyawan_id INT NOT NULL,
    nomor_penjualan INT NOT NULL,
    jumlah INT NOT NULL,
    total_harga DOUBLE NOT NULL,
    status ENUM('lunas', 'hutang') NOT NULL,
    metode_bayar ENUM('cash', 'qris') DEFAULT NULL,
    tanggal DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (barang_id) REFERENCES barangs (id) ON DELETE CASCADE,
    FOREIGN KEY (karyawan_id) REFERENCES karyawans (id) ON DELETE CASCADE
  ) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4=
  COLLATE=utf8mb4_general_ci;

  --membuat tabel hutang
  CREATE TABLE hutangs (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    penjualan_id INT NOT NULL,
    karyawan_id INT NOT NULL,
    nama_penghutang VARCHAR(100) NOT NULL,
    tanggal_lunas DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (penjualan_id) REFERENCES penjualans (id) ON DELETE CASCADE,
    FOREIGN KEY (karyawan_id) REFERENCES karyawans (id) ON DELETE CASCADE
  ) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_general_ci;

  --membuat tabel keuangan
  CREATE TABLE keuangans (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    pembelian_id INT NOT NULL,
    penjualan_id INT NOT NULL,
    karyawan_id INT NOT NULL,
    pengeluaran DOUBLE NOT NULL DEFAULT 0,
    pemasukan DOUBLE NOT NULL DEFAULT 0,
    tanggal DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (pembelian_id) REFERENCES pembelians (id) ON DELETE CASCADE,
    FOREIGN KEY (penjualan_id) REFERENCES penjualans (id) ON DELETE CASCADE,
    FOREIGN KEY (karyawan_id) REFERENCES karyawans (id) ON DELETE CASCADE
  ) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_general_ci;

```

#### Screenshoot Command dan Hasil Tabel Barang

<div align="center">
  <div>
    <a href="#">
      <img src="img/create tb barang.png" alt="Create Table Barang" width="500px">
    </a>
    <a href="#">
      <img src="img/struct tb.png" alt="Create Table Barang" width="500px">
    </a>
  </div>
  <div>
    <img src="img/create tb karyawan.png" alt="Create Table Barang" width="500px">
    <img src="img/struct tb karywan.png" alt="Create Table Barang" width="500px">
  </div>
</div>
<img src="img/create tb karyawan.png" alt="Create Table Karyawan" width="45%">
<img src="img/create tb pemasok.png" alt="Create Table Pemasok" width="45%">
<img src="img/create tb stok.png" alt="Create Table Stok" width="45%">
<img src="img/create tb pembelian.png" alt="Create Table Pembelian" width="45%">
<img src="img/create tb penjualan.png" alt="Create Table Penjualan" width="45%">
<img src="img/create tb hutang.png" alt="Create Table Hutang" width="45%">
<img src="img/create tb keuangan.png" alt="Create Table Keuangan" width="45%">

## Melakukan Insert 20 Data Dummy Setiap Tabel

```sql
  --insert data/record ke tabel barang
  INSERT INTO barangs (nama, harga_beli, harga_jual) VALUES
  ('Beras Premium', 10000, 12000), ('Minyak Goreng', 14000, 16000), ('Gula Pasir', 12000, 15000), ('Tepung Terigu', 9000, 12000),
  ('Kopi Instan', 2500, 3000), ('Susu Bubuk', 45000, 55000), ('Mie Instan', 2500, 3000), ('Cokelat Batang', 15000, 18000),
  ('Keju Parut', 35000, 45000), ('Sabun Mandi', 7000, 8500), ('Shampo Sachet', 2000, 2500), ('Tisu Gulung', 12000, 15000),
  ('Air Mineral Galon', 15000, 20000), ('Roti Tawar', 12000, 14000), ('Sosis Ayam', 40000, 50000), ('Kentang Goreng', 25000, 32000),
  ('Telur Ayam', 20000, 25000), ('Kecap Manis', 12000, 15000), ('Saos Sambal', 10000, 12000), ('Biskuit Kaleng', 40000, 50000);

  --insert data/record ke tabel pemasok
  INSERT INTO pemasoks (nama, telpon, alamat) VALUES
  ('Ali', '081234567890', 'Jl. Merdeka No. 10, Jakarta'),
  ('Budi', '082345678901', 'Jl. Pahlawan No. 5, Bandung'),
  ('Citra', '083456789012', 'Jl. Raya No. 20, Surabaya'),
  ('Dani', '084567890123', 'Jl. Suka No. 30, Yogyakarta'),
  ('Eka', '085678901234', 'Jl. Cendana No. 15, Semarang'),
  ('Fikri', '086789012345', 'Jl. Anggrek No. 25, Malang'),
  ('Gina', '087890123456', 'Jl. Mawar No. 35, Medan'),
  ('Hadi', '088901234567', 'Jl. Kembang No. 40, Makassar'),
  ('Indah', '089012345678', 'Jl. Sumber No. 45, Bali'),
  ('Joko', '081112233445', 'Jl. Senopati No. 50, Jakarta'),
  ('Kiki', '082223344556', 'Jl. Gunung No. 60, Bandung'),
  ('Lina', '083334455667', 'Jl. Laut No. 70, Surabaya'),
  ('Mira', '084445566778', 'Jl. Teluk No. 80, Yogyakarta'),
  ('Nina', '085556677889', 'Jl. Jaya No. 90, Semarang'),
  ('Omar', '086667788990', 'Jl. Hijau No. 100, Malang'),
  ('Putri', '087778899001', 'Jl. Taman No. 110, Medan'),
  ('Rudi', '088889900112', 'Jl. Rimba No. 120, Makassar'),
  ('Siti', '089990011223', 'Jl. Pelita No. 130, Bali'),
  ('Tono', '081223344556', 'Jl. Sejahtera No. 140, Jakarta'),
  ('Umar', '082334455667', 'Jl. Persada No. 150, Bandung');

  --insert data/record ke tabel karyawan
  INSERT INTO karyawans (nama, gaji, shift) VALUES
  ('Andi', 3000000, 'pagi'),('Budi', 3000000, 'siang'),('Citra', 3000000, 'malam'),('Dani', 3000000, 'pagi'),('Eka', 3000000, 'siang'),
  ('Fikri', 3000000, 'malam'),('Gina', 3000000, 'pagi'),('Hadi', 3000000, 'siang'),('Indah', 3000000, 'malam'),('Joko', 3000000, 'pagi'),
  ('Kiki', 3000000, 'siang'),('Lina', 3000000, 'malam'),('Mira', 3000000, 'pagi'),('Nina', 3000000, 'siang'),('Omar', 3000000, 'malam'),
  ('Putri', 3000000, 'pagi'),('Rudi', 3000000, 'siang'),('Siti', 3000000, 'malam'),('Tono', 3000000, 'pagi'),('Umar', 3000000, 'siang');

  --insert data/record ke tabel pembelian dengan foreign key tabel lainnya
  INSERT INTO pembelians (barang_id, pemasok_id, karyawan_id, jumlah, total_harga, tanggal) VALUES
  (1, 1, 1, 5, 500000, '2024-12-01'),
  (2, 2, 2, 3, 300000, '2024-12-02'),
  (3, 3, 3, 7, 700000, '2024-12-03'),
  (4, 4, 4, 2, 200000, '2024-12-04'),
  (5, 5, 5, 10, 1000000, '2024-12-05'),
  (6, 6, 6, 6, 600000, '2024-12-06'),
  (7, 7, 7, 8, 800000, '2024-12-07'),
  (8, 8, 8, 4, 400000, '2024-12-08'),
  (9, 9, 9, 12, 1200000, '2024-12-09'),
  (10, 10, 10, 9, 900000, '2024-12-10'),
  (11, 1, 1, 3, 300000, '2024-12-11'),
  (12, 2, 2, 5, 500000, '2024-12-12'),
  (13, 3, 3, 6, 600000, '2024-12-13'),
  (14, 4, 4, 7, 700000, '2024-12-14'),
  (15, 5, 5, 2, 200000, '2024-12-15'),
  (16, 6, 6, 8, 800000, '2024-12-16'),
  (17, 7, 7, 4, 400000, '2024-12-17'),
  (18, 8, 8, 9, 900000, '2024-12-18'),
  (19, 9, 9, 6, 600000, '2024-12-19'),
  (20, 10, 10, 10, 1000000, '2024-12-20');

  --insert data/record tabel stok
  INSERT INTO stoks (barang_id, karyawan_id, jumlah_barang) VALUES
  (1, 1, 100), (2, 2, 200), (3, 3, 150), (4, 4, 50), (5, 5, 300), (6, 6, 120), (7, 7, 250), (8, 8, 180), (9, 9, 90),(10, 10, 210),
  (11, 11, 130),(12, 12, 75),(13, 13, 160),(14, 14, 240),(15, 15, 110),(16, 16, 190),(17, 17, 220),(18, 18, 80),(19, 19, 140),(20, 20, 160);

  --insert data/record tabel penjualan dengan foreign key tabel lainnya
  INSERT INTO penjualans (barang_id, karyawan_id, nomor_penjualan, jumlah, total_harga, status, metode_bayar, tanggal)
  VALUES
  (1, 1, 1001, 5, 500000.00, 'lunas', 'cash', '2024-12-22'),
  (2, 2, 1002, 10, 1000000.00, 'hutang', NULL, '2024-12-23'),
  (3, 3, 1003, 3, 300000.00, 'lunas', 'cash', '2024-12-24'),
  (4, 4, 1004, 8, 800000.00, 'hutang', NULL, '2024-12-25'),
  (5, 5, 1005, 2, 200000.00, 'lunas', 'qris', '2024-12-26'),
  (6, 6, 1006, 4, 400000.00, 'hutang', NULL, '2024-12-27'),
  (7, 7, 1007, 6, 600000.00, 'lunas', 'cash', '2024-12-28'),
  (8, 8, 1008, 9, 900000.00, 'hutang', NULL, '2024-12-29'),
  (9, 9, 1009, 1, 100000.00, 'lunas', 'cash', '2024-12-30'),
  (10, 10, 1010, 7, 700000.00, 'hutang', NULL, '2024-12-31'),
  (11, 11, 1011, 5, 500000.00, 'lunas', 'qris', '2025-01-01'),
  (12, 12, 1012, 10, 1000000.00, 'hutang', NULL, '2025-01-02'),
  (13, 13, 1013, 3, 300000.00, 'lunas', 'cash', '2025-01-03'),
  (14, 14, 1014, 8, 800000.00, 'hutang', NULL, '2025-01-04'),
  (15, 15, 1015, 2, 200000.00, 'lunas', 'cash', '2025-01-05'),
  (16, 16, 1016, 4, 400000.00, 'hutang', NULL, '2025-01-06'),
  (17, 17, 1017, 6, 600000.00, 'lunas', 'qris', '2025-01-07'),
  (18, 18, 1018, 9, 900000.00, 'hutang', NULL, '2025-01-08'),
  (19, 19, 1019, 1, 100000.00, 'lunas', 'qris', '2025-01-09'),
  (20, 20, 1020, 7, 700000.00, 'hutang', NULL, '2025-01-10');

  --insert data/record ke tabel hutang
  INSERT INTO hutangs (penjualan_id, karyawan_id, nama_penghutang, tanggal_lunas)
  VALUES
  (2, 2, 'Ahmad Zaki', '2025-12-22'),
  (4, 4, 'Budi Santoso', '2025-12-23'),
  (6, 6, 'Citra Dewi', '2025-12-24'),
  (8, 8, 'Dewi Susanti', '2025-12-25'),
  (10, 10, 'Eko Wijaya', '2025-12-26'),
  (12, 12, 'Faisal Rahman', '2025-12-27'),
  (14, 14, 'Gina Kurniawati', '2025-12-28'),
  (16, 16, 'Hendra Setiawan', '2025-12-29'),
  (18, 18, 'Ika Lestari', '2025-12-30'),
  (20, 20, 'Joko Prabowo', '2025-12-31'),
  (1, 1, 'Kiki Setyani', '2025-01-01'),
  (3, 3, 'Lina Maharani', '2025-01-02'),
  (5, 5, 'Maya Sari', '2025-01-03'),
  (7, 7, 'Nina Salim', '2025-01-04'),
  (9, 9, 'Oka Laksana', '2025-01-05'),
  (11, 11, 'Putu Suryani', '2025-01-06'),
  (13, 13, 'Qori Zainuddin', '2025-01-07'),
  (15, 15, 'Rina Anggraeni', '2025-01-08'),
  (17, 17, 'Satria Gunawan', '2025-01-09'),
  (19, 19, 'Teguh Priyono', '2025-01-10');

  --insert data/record ke tabel keuangan
  INSERT INTO keuangans (pembelian_id, penjualan_id, karyawan_id, pengeluaran, pemasukan, tanggal) VALUES
  (1, 1, 1, 300000.00, 500000.00, '2024-12-01'),
  (2, 2, 2, 500000.00, 700000.00, '2024-12-02'),
  (3, 3, 3, 200000.00, 400000.00, '2024-12-03'),
  (4, 4, 4, 400000.00, 600000.00, '2024-12-04'),
  (5, 5, 5, 250000.00, 550000.00, '2024-12-05'),
  (6, 6, 6, 300000.00, 700000.00, '2024-12-06'),
  (7, 7, 7, 500000.00, 1000000.00, '2024-12-07'),
  (8, 8, 8, 200000.00, 450000.00, '2024-12-08'),
  (9, 9, 9, 400000.00, 800000.00, '2024-12-09'),
  (10, 10, 10, 300000.00, 650000.00, '2024-12-10'),
  (11, 11, 11, 350000.00, 750000.00, '2024-12-11'),
  (12, 12, 12, 450000.00, 850000.00, '2024-12-12'),
  (13, 13, 13, 500000.00, 1000000.00, '2024-12-13'),
  (14, 14, 14, 250000.00, 550000.00, '2024-12-14'),
  (15, 15, 15, 300000.00, 600000.00, '2024-12-15'),
  (16, 16, 16, 400000.00, 700000.00, '2024-12-16'),
  (17, 17, 17, 350000.00, 750000.00, '2024-12-17'),
  (18, 18, 18, 200000.00, 500000.00, '2024-12-18'),
  (19, 19, 19, 300000.00, 600000.00, '2024-12-19'),
  (20, 20, 20, 500000.00, 800000.00, '2024-12-20');
```

#### Screenshoot Command

<img src="img/insert tb barang.png" alt="Create Table Barang" width="45%">
<img src="img/insert tb karyawan.png" alt="Create Table Karyawan" width="45%">
<img src="img/insert tb pemasok.png" alt="Create Table Pemasok" width="45%">
<img src="img/insert tb stok.png" alt="Create Table Stok" width="45%">
<img src="img/insert tb pembelian.png" alt="Create Table Pembelian" width="45%">
<img src="img/insert tb penjualan.png" alt="Create Table Penjualan" width="45%">
<img src="img/insert tb hutang.png" alt="Create Table Hutang" width="45%">
<img src="img/insert tb keuangan.png" alt="Create Table Keuangan" width="45%">

## Manipulasi Data Setiap Tabel (SELECT, EDIT, UPDATE dan DELETE)

### Tabel barang

```sql
  --menampilkan data barang terlebih dahulu
  SELECT * FROM barangs
  --melakukan update data/record terhadap tabel barang yaitu mengubah [nama, harga_beli, harga_jual] berdasarkan id
  UPDATE barangs SET nama = 'Indomie kari ayam', harga_beli = 2450, harga_jual = 3500 WHERE id = 1
  --melakukan penghapusan data/record berdasarkan id
  DELETE FROM barangs WHERE id = 20
```

#### ScreenShoot Command

<img src="img/select barang.png" alt="Create Table Barang" width="45%">
<img src="img/update barang.png" alt="Create Table Barang" width="45%">
<img src="img/delete barang.png" alt="Create Table Barang" width="45%">

### Tabel karyawan

```sql
  --menampilkan data karyawan terlebih dahulu
  SELECT * FROM karyawans
  --melakukan update data/record terhadap tabel karyawan yaitu mengubah [nama,shift] berdasarkan id
  UPDATE karyawans SET nama = ‘Roesdi Imoet’,  shift = ‘malam’ WHERE id = 1
  --melakukan penghapusan data/record berdasarkan id
  DELETE FROM karyawans WHERE id = 20
```

#### ScreenShoot Command

<img src="img/select karyawan.png" alt="Create Table Barang" width="45%">
<img src="img/update karyawan.png" alt="Create Table Barang" width="45%">
<img src="img/delete karyawan.png" alt="Create Table Barang" width="45%">

### Tabel pemasok

```sql
  --menampilkan data pemasok terlebih dahulu
  SELECT * FROM pemasoks
  --melakukan update data/record terhadap tabel karyawan yaitu mengubah [nama,telepon] berdasarkan id
  UPDATE pemasoks SET nama = "PT Sinar Gurih", telpon = "021222333" WHERE id = 1
  --melakukan penghapusan data/record berdasarkan id
  DELETE FROM pemasoks WHERE id = 1
```

#### ScreenShoot Command

<img src="img/select pemasok.png" alt="Create Table Barang" width="45%">
<img src="img/update pemasok.png" alt="Create Table Barang" width="45%">
<img src="img/delete pemasok.png" alt="Create Table Barang" width="45%">

### Tabel pembelian

```sql
  --menampilkan data pembelian terlebih dahulu
  SELECT * FROM pembelians
  --melakukan update data/record terhadap tabel karyawan yaitu mengubah [barang_id,pemasok_id] berdasarkan id
  UPDATE pembelians SET barang_id = 1, pemasok_id = 3 WHERE id = 2
  --melakukan penghapusan data/record berdasarkan id
  DELETE FROM pembelians WHERE id = 19
```

#### ScreenShoot Command

<img src="img/select pembelian.png" alt="Create Table Barang" width="45%">
<img src="img/update pembelian.png" alt="Create Table Barang" width="45%">
<img src="img/delete pembelian.png" alt="Create Table Barang" width="45%">

### Tabel stok

```sql
  --menampilkan data stok terlebih dahulu
  SELECT * FROM stoks
  --melakukan update data/record terhadap tabel karyawan yaitu mengubah [karyawan_id] berdasarkan id
  UPDATE stoks SET karyawan_id = 19 WHERE id = 1
  --melakukan penghapusan data/record berdasarkan id
  DELETE FROM stoks WHERE id = 15
```

#### ScreenShoot Command

<img src="img/select stok.png" alt="Create Table Barang" width="45%">
<img src="img/update stok.png" alt="Create Table Barang" width="45%">
<img src="img/delete stock.png" alt="Create Table Barang" width="45%">

### Tabel penjualan

```sql
  --menampilkan data penjualan terlebih dahulu
  SELECT * FROM penjualans
  --melakukan update data/record terhadap tabel karyawan yaitu mengubah [karyawan_id, status] berdasarkan id
  UPDATE penjualans SET karyawan_id = 1, status = "lunas" WHERE id = 2
  --melakukan penghapusan data/record berdasarkan id
  DELETE FROM penjualans WHERE id = 2
```

#### ScreenShoot Command

<img src="img/select penjualan.png" alt="Create Table Barang" width="45%">
<img src="img/update penjualan.png" alt="Create Table Barang" width="45%">
<img src="img/delete penjualan.png" alt="Create Table Barang" width="45%">

### Tabel hutang

```sql
  --menampilkan data hutang terlebih dahulu
  SELECT * FROM hutangs
  --melakukan update data/record terhadap tabel karyawan yaitu mengubah [karyawan_id, nama_penghutang] berdasarkan id
  UPDATE hutangs SET karyawan_id = 1, nama_penghutang = 'Jin Hidayah Wahid' WHERE id = 4
  --melakukan penghapusan data/record berdasarkan id
  DELETE FROM hutangs WHERE id = 19
```

#### ScreenShoot Command

<img src="img/select hutang.png" alt="Create Table Barang" width="45%">
<img src="img/update hutang.png" alt="Create Table Barang" width="45%">
<img src="img/delete hutang.png" alt="Create Table Barang" width="45%">

### Tabel keuangan

```sql
  --menampilkan data keuangan terlebih dahulu
  SELECT * FROM keuangans
  --melakukan update data/record terhadap tabel karyawan yaitu mengubah [karyawan_id, pemasukan, pengeluaran] berdasarkan id
  UPDATE keuangans SET karyawan_id = 16, pemasukan = 1000000, pengeluaran = 90000000 WHERE id = 10
  --melakukan penghapusan data/record berdasarkan id
  DELETE FROM keuangans WHERE id = 10
```

#### ScreenShoot Command

<img src="img/select keuangan.png" alt="Create Table Barang" width="45%">
<img src="img/update keuangan.png" alt="Create Table Barang" width="45%">
<img src="img/delete keuangan.png" alt="Create Table Barang" width="45%">

## Melakukan Konsep Transaksi

```sql
--memulai transaksi dengan metode ACID
START TRANSACTION;
--melakukan pembelian dengan query [INSERT]
INSERT INTO pembelians (id, barang_id, pemasok_id, karyawan_id, jumlah, total_harga, tanggal)
    VALUES (1, 1, 4, 10, 20, 200000, '2024-12-29');
--melakukan pengecheckan dengan atribut 'jumlah_barang' menggunakan query [SELECT] pada tabel stok berdasarkan foreign key barang_id = 1
SELECT jumlah_barang,
   IF ( jumlah_barang = 0, 'Kosong',
       IF ( jumlah_barang < 50, 'Low',
           IF ( jumlah_barang < 100, 'Mid', 'Over' ))) AS Kategori
FROM stoks WHERE barang_id = 1;
--jika jumlah barang = over  maka rollback atau data tidak jadi dimasukan alias di cancel
ROLLBACK;
--jika tidak dilakukan ROLLBACK, maka query dibawah ini akan dijalankan
--melakukan update pada tabel stok dibagian atribut 'jumlah_barang'
UPDATE stoks SET jumlah_barang = jumlah_barang + 20 WHERE barang_id = 1;
--melakukan pengechekan pada tabel stok setelah dilakukan transaksi pembelian barang, menggunakan foreign key barang_id. Untuk mengecheck apakah data sudah terupdate
SELECT * FROM stoks WHERE barang_id = 1;
--setelahnya dilakukan COMMIT untuk menyimpan seluruh perubahan ke database
COMMIT;
```

#### ScreenShoot Command

<img src="img/commit 1.png" alt="Create Table Barang" width="45%">
<img src="img/commit 2.png" alt="Create Table Barang" width="45%">

## Membuat User Management dengan Privileged (Akses DB, INSERT, SELECT)

Pada langkah ini, konsep <b>Data Control Language (DCL)</b> digunakan untuk manajemen pengguna. Konsep ini memungkinkan pemberian akses kepada setiap pengguna dengan perintah <b>GRANT</b>, <i>yang digunakan untuk memberikan hak akses kepada pengguna ke database</i>, serta <b>REVOKE</b>, <i>yang digunakan untuk mencabut hak akses yang sebelumnya telah diberikan dengan perintah GRANT</i>. Penerapan konsep ini mempermudah pengelolaan database saat bekerja dalam tim, sehingga setiap anggota hanya dapat melakukan tindakan sesuai dengan hak akses yang diberikan. Selain itu, akses dapat dikontrol lebih ketat dengan menggunakan alamat IP dari setiap perangkat pengguna. Akan tetapi untuk saat ini, akan dicontohkan hanya dengan ip local.

### 1. Membuat User

Perlu dilakukan pembuatan user untuk melakukan percobaan ini, karena by default hanya muncul 1 user yaitu root.

#### Command Default

```sql
  --Syntax Utama
  CREATE USER 'username'@'host' IDENTIFIED BY 'password';
  --CREATE USER -> membuat user
  --username -> Nama pengguna yang ingin dibuat.
  --host -> Lokasi dari mana pengguna dapat mengakses database.
  --password -> Kata sandi yang akan digunakan pengguna untuk mengakses database.
```

#### Membuat 3 User

```sql
  --melakukan 3 pembuatan user dengan hostname localhost [127.0.0.1]
  CREATE USER 'budi'@'localhost' IDENTIFIED BY 'budi123';
  CREATE USER 'fitri'@'localhost' IDENTIFIED BY 'fitri123';
  CREATE USER 'zahra'@'localhost' IDENTIFIED BY 'zahra123';
```

#### ScreenShoot Command

<img src="img/create budi.png" alt="Create Table Barang" width="45%">
<img src="img/create fitri.png" alt="Create Table Barang" width="45%">
<img src="img/create zahra.png" alt="Create Table Barang" width="45%">

### 2. Memberikan Akses User

Sekarang akan dilakukan pemberian akses user, dengan kondisi bermacam-macam.

#### Command Default

```sql
--Syntax Utama
GRANT [privileges] ON [database].[table] TO 'username'@'host';
--GRANT -> Command Untuk memberikan akses
--privileges -> Hak akses yang ingin diberikan, seperti SELECT, INSERT, UPDATE, DELETE, atau ALL PRIVILEGES.
--database -> Nama database tempat hak akses akan diterapkan.
--table -> Nama tabel dalam database. Gunakan * untuk semua tabel di database.
--username -> Nama pengguna yang akan menerima hak akses.
--host -> Lokasi dari mana pengguna dapat mengakses database. Gunakan localhost untuk akses lokal.
```

#### Memberikan akses

```sql
--memberikan akses untuk 3 user
--memberikan akses input data/record seluruh tabel pada database [warung_azmi]
GRANT INSERT ON warung_azmi.* TO 'budi'@'localhost';
--memberikan akses menampilkan data/record seluruh tabel pada database [warung_azmi]
GRANT SELECT ON warung_azmi.* TO 'zahra'@'localhost';
--memberikan seluruh akses ke seluruh tabel pada database [warung_azmi]
GRANT ALL PRIVILEGES ON warung_azmi.* TO 'fitri'@'localhost';
```

#### ScreenShoot Command

<img src="img/grant budi.png" alt="Create Table Barang" width="45%">
<img src="img/grant fitri.png" alt="Create Table Barang" width="45%">
<img src="img/grant zahra.png" alt="Create Table Barang" width="45%">

### 3. Melihat Akses User

#### Command Default

```sql
--Sytanx default
SHOW GRANTS FOR 'username'@'host';
--show -> command untuk menampilkan akses
--for -> memberitahu untuk menampilkan akses pada user apa
```

#### Menampilkan akses pada 3 user

```sql
SHOW GRANTS FOR 'budi'@'localhost';
SHOW GRANTS FOR 'zahra'@'localhost';
SHOW GRANTS FOR 'fitri'@'localhost';
```

#### ScreenShoot Command

<img src="img/hasil show grant fitri.png" alt="Create Table Barang" width="45%">
<img src="img/hasil show grant zahra budi.png" alt="Create Table Barang" width="45%">

## Mencoba Hak Akses 3 User

### 1. User Budi

#### Melakukan Login dengan Kredensial Akun

<img src="img/login budi.png" alt="Create Table Barang" width="100%">

#### Mencoba Melakukan (SELECT & Hasilnya)

<img src="img/select budi.png" alt="Create Table Barang" width="45%">
<img src="img/gagal select budi.png" alt="Create Table Barang" width="45%">

#### Mencoba Melakukan (INSERT & Hasilnya)

<img src="img/insert budi.png" alt="Create Table Barang" width="45%">
<img src="img/hasil insert budi.png" alt="Create Table Barang" width="45%">

Berdasarkan hasil tersebut, user budi dapat masuk kedalam mysql dengan kredensial akunnya dan dapat mengakses database warung_azmi, serta dapat melakukan beberapa command query. Akan tetapi sesuai pada pemberian hak akses sebelumnya menggunakan query ini dibawah ini, user budi hany bisa melakukan query <b>INSERT</b>

```sql
GRANT INSERT ON warung_azmi.* TO 'budi'@'localhost';
```

### 2. User zahra

#### Melakukan Login dengan Kredensial Akun

<img src="img/login zahra.png" alt="Create Table Barang" width="100%">

#### Mencoba Melakukan (SELECT & Hasilnya)

<img src="img/select zahra.png" alt="Create Table Barang" width="45%">
<img src="img/hasil select zahra.png" alt="Create Table Barang" width="45%">

#### Mencoba Melakukan (INSERT & Hasilnya)

<img src="img/insert zahra.png" alt="Create Table Barang" width="45%">
<img src="img/gagal insert zahra.png" alt="Create Table Barang" width="45%">

Berdasarkan hasil tersebut, user zahra dapat masuk kedalam mysql dengan kredensial akunnya dan dapat mengakses database warung_azmi, serta dapat melakukan beberapa command query. Akan tetapi sesuai pada pemberian hak akses sebelumnya menggunakan query ini dibawah ini, userzahra hanya bisa melakukan query <b>SELECT</b>

```sql
GRANT SELECT ON warung_azmi.* TO 'zahra'@'localhost';
```

### 3. User fitri

#### Melakukan Login dengan Kredensial Akun

<img src="img/login fitri.png" alt="Create Table Barang" width="100%">

#### Mencoba Melakukan Query (CRUD: SELECT, INSERT, UPDATE, DELETE)

<img src="img/crud fitri.png" alt="Create Table Barang" width="45%">
<img src="img/hasil crud fitri 1.png" alt="Create Table Barang" width="45%">
<img src="img/hasil crud fitri 2.png" alt="Create Table Barang" width="45%">

Berdasarkan hasil tersebut, user fitri dapat masuk kedalam mysql dengan kredensial akunnya dan dapat mengakses database warung_azmi, serta dapat melakukan beberapa command query. User fitri ini memiliki hak akses dengan privileges lengkap sehingga dapat melakukan CRUD <i>(CREATE, READ, UPDATE, DELETE)</i> dengan command sql sebagai berikut : <b>SELECT, INSERT, UPDATE, DELETE</b>

```sql
GRANT ALL PRIVILEGES ON warung_azmi.* TO 'fitri'@'localhost';
```
