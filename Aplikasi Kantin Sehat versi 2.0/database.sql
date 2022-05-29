-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Server version: 10.1.29-MariaDB
-- PHP Version: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `database`
--

-- --------------------------------------------------------

--
-- struktur data untuk table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `nama_lengkap` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- memasukkan data dalam table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Admin');
-- --------------------------------------------------------

--
-- struktur data untuk table `likes`
--

CREATE TABLE `likes` (
  `id_likes` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- struktur data untuk table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `email_pelanggan` varchar(100) DEFAULT NULL,
  `password_pelanggan` varchar(50) DEFAULT NULL,
  `nama_pelanggan` varchar(100) DEFAULT NULL,
  `telepon_pelanggan` varchar(15) DEFAULT NULL,
  `alamat_pelanggan` varchar(100) NOT NULL,
  `ruang_pelanggan` varchar(100) NOT NULL,
  `foto_profil` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- memasukkan data dalam table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `telepon_pelanggan`, `alamat_pelanggan`, `ruang_pelanggan`, `foto_profil`) VALUES
(1, 'customer@gmail.com', '91ec1f9324753048c0096d036a694f86', 'Ahmad Mufadhdhal', '085155328822', 'Darussalam, Banda Aceh', 'arrahman 7', 'ahmad.jpg');

-- --------------------------------------------------------

--
-- struktur data untuk table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `tanggal_pembelian` date DEFAULT NULL,
  `jumlah_pembelian` int(11) NOT NULL,
  `ongkir` int(11) NOT NULL,
  `total_pembelian` int(11) DEFAULT NULL,
  `id_pelanggan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- struktur data untuk table `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `id_pembelian` int(11) DEFAULT NULL,
  `id_produk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- struktur data untuk table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) DEFAULT NULL,
  `harga_produk` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `foto_produk` varchar(100) DEFAULT NULL,
  `deskripsi_produk` text,
  `likes` int(11) NOT NULL,
  `id_warung` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- masukkan barang --
INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga_produk`, `stok`, `foto_produk`, `deskripsi_produk`, `likes`, `id_warung`) VALUES
(1, 'Salad', 15000, 10, 'salad.jpg', 'Salad terdiri dari tomat, selada, timun, wortel, madu, minyak zaitun, dan campuran mayonaise', 10, 1),
(2, 'Gado gado', 8000, 10, 'gado2.jpg', 'Gado gado merupakan salah satu menu sarapan sehat yang cocok dikonsumsi oleh anda yang saat ini sedang melakukan diet.', 4, 1),
(3, 'Salmon Saus Bawang Putih dan Madu', 20000, 5, 'salmon.jpg', 'Salmon kaya akan asam lemak omega-3 yang telah terbukti mengurangi peradangan, menurunkan tekanan darah, dan menurunkan faktor risiko penyakit. Makanan ini sangat di rekomendasikan untuk kesehatan', 8, 1),
(4, 'Sate Daging Sapi Tanpa Lemak dengan Selada Air dan Timun', 15000, 5, 'Sate_Daging.jpg', 'Daging sapi merupakan salah satu sumber protein hewani yang baik untuk tubuh. Dengan kandungan lemaknya yang rendah Rasa daging sapi yang gurih akan semakin nikmat jika disantap dengan selada dan juga timun. ', 6, 1),
(5, 'Tuna dengan Kacang Putih dan Salad Adas', 20000, 5, 'ikan tuna.jpg', 'Kandungan Omega-3 yang ada di dalam tuna juga memiliki banyak sekali manfaat untuk tubuh apalagi ditambah dengan campuran kacang putih, tuna dan juga bawang Bombay', 6, 1),
(6, 'Sup Sayuran Bening', 15000, 10, 'sup sayur.jpg', 'Sup sayur bening sangatlah bermanfaat bagi tubuh. Campuran wortel, buncis, kentang dan daun bawang dapat memberikan asupan nutrisi yang sesuai kebutuhan. Mulai dari karbohidrat, protein hingga serat terdapat dalam hidangan ini.', 8, 1),
(7, 'Oatmeal Panggang Blueberry', 10000, 15, 'Outmeal Panggang Blueberry.jpg', 'Outmeal merupakan makanan yang enak di santap. Nutrisi yang ada di dalam oatmeal sangat baik untuk tubuh. Karena satu porsi oatmeal mengandung sekitar 60 gram karbohidrat, 16 gram protein dan juga 10 gram serat. Kandungan ini akan semakin bagus manfaatnya jika ditambah dengan blueberry yang mengandung 14 gram gula alami dan juga 21 gram karbohidrat.', 10, 1),
(8, 'Roti Panggang Telur', 8000, 10, 'roti panggang.jpg', 'Roti merupakan salah satu jenis makanan yang baik untuk sarapan. Apalagi kandungan roti tersebut dari gandum atau whole grain, yang lebih rendah kalori dan lebih sehat.', 8, 1),
(9, 'Smoothies', 9000, 10, 'Smoothies.jpg', 'Hidangan ini mampu memberikan manfaat yang sangat banyak untuk tubuh. Karena campuran buah, sayur dan juga biji-bijian dapat memberikan asupan nutrisi seimbang bagi tubuh.', 10, 1),
(10, 'Infused water', 6000, 20, 'Infused water.jpg', 'Infused Water ini sangat menyehatkan bagi tubuh dengan campuran lemon, kiwi, dan daun mint. Tak hanya memastikan tubuh terhidrasi dengan baik, infused water dari air lemon maupun buah lainnya juga bisa memperkuat kekebalan tubuh karen tinggi kandungan vitamin C.', 15,1),
(11, 'Air kelapa', 8000, 30, 'Air kelapa.jpg', 'Air kelapa adalah salah satu minuman sehat selain air putih yang baik dikonsumsi rutin. Pilih air kelapa yang benar-benar murni dan tidak diberi pemanis tambahan. Tak hanya rasanya segar, di dalamnya juga mengandung banyak nutrisi, antioksidan, dan mineral yang diperlukan tubuh.', 10, 1),
(12, 'Air Mineral', 3000, 50, 'air mineral.jpg', 'Air mineral sangat bagus bagi kesehatan. Tak hanya bisa menghilangkan dahaga dan haus, tetapi juga bisa mencegah dehidrasi, menjaga kesehatan sendi dan otot, dan juga menurunkan berat badan.', 15, 1),
(13, 'Jahe Hangat', 5000, 20, 'jahe hangat.jpg', 'Minum air jahe hangat atau teh jahe sangat baik untuk sistem pencernaan. Aman dikonsumsi pagi hari saat perut kosong, bahkan jahe hangat bisa meredakan mual, muntah, dan juga diare. Jika ingin lebih manis, tambahkan madu sebagai penyeimbang rasa.', 9, 1),
(14, 'Teh Hijau', 5000, 20, 'teh hijau.jpg', 'Teh hijau merupakan minuman sehat yang mengandung energi, protein, magnesium, kalium, kafein, antioksidan, antiradang, dan antibakteri yang sangat baik untuk Kesehatan. Teh hijau memiliki banyak manfaat seperti mencegah resiko penyakit jantung, mencegah kanker, mencegah diabetes, menjaga tekanan darah, meningkatkan fungsi otak, meningkatkan kesuburan, mencegah infeksi, mencegah peradangan otak, dan masih banyak lagi. Informasi ini telah di verifikasi oleh ahli gizi.', 9, 1),
(15, 'paket 1', 17000, 20, 'paket 1.jpg', 'paket ini terdiri dari nasi merah dan bermacam - macam sayuran. Dengan memesan paket ini kebutuhan makanan bergizi akan seimbang dan sudah cukup komplit.', 16, 1),
(16, 'paket 2', 35000, 8, 'Salmon dengan Saus Krim, Nasi, Sup, dan Kue pisang.jpg', 'paket ini terdiri dari ikan salmon yaang sehat bagi tubuh dan bermacam - macam sayuran. sehingga dapat membantu penyembuhan dengan waktu yang relatif cepat dan menjaga organ penting seperti jantung untuk tetap stabil dan lancar.', 16, 1);
--
-- struktur data untuk table `warung`
--

CREATE TABLE `warung` (
  `id_warung` int(11) NOT NULL,
  `nama_warung` varchar(50) DEFAULT NULL,
  `alamat_warung` varchar(100) NOT NULL,
  `telepon_warung` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- memasukkan data dalam table `warung`
--

INSERT INTO `warung` (`id_warung`, `nama_warung`, `alamat_warung`, `telepon_warung`) VALUES
(1, 'KANTIN SEHAT RUMAH SAKIT', 'Darussalam, Banda Aceh', '085213251');
--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id_likes`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indexes for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`),
  ADD KEY `id_pembelian` (`id_pembelian`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`),
  ADD KEY `id_warung` (`id_warung`);

--
-- Indexes for table `warung`
--
ALTER TABLE `warung`
  ADD PRIMARY KEY (`id_warung`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id_likes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `warung`
--
ALTER TABLE `warung`
  MODIFY `id_warung` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);

--
-- Constraints for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD CONSTRAINT `pembelian_produk_ibfk_1` FOREIGN KEY (`id_pembelian`) REFERENCES `pembelian` (`id_pembelian`),
  ADD CONSTRAINT `pembelian_produk_ibfk_2` FOREIGN KEY (`id_produk`) REFERENCES `produk` (`id_produk`);

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`id_warung`) REFERENCES `warung` (`id_warung`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
