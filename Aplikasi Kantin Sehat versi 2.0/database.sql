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
(2, 'Gado gado', 8000, 10, 'gado2.jpg', 'gado2 adalah makanan yaitu sayur2 an yang juga ditambah dengan telur rebus . Makanan ini dapat membantu pasien dan pelanggan untuk meningkatkan selera makan, dan juga gado2 ini dicampur dengan bumbu kacang yang tidak di goreng sehingga tidak mengandung minyak.', 4, 1),
(3, 'Salmon Saus Bawang Putih dan Madu', 20000, 5, 'salmon.jpg', 'Salmon kaya akan asam lemak omega-3 yang telah terbukti mengurangi peradangan, menurunkan tekanan darah, dan menurunkan faktor risiko penyakit. Makanan ini sangat di rekomendasikan untuk kesehatan', 8, 1),
(4, 'Sate Daging Sapi Tanpa Lemak dengan Selada Air dan Timun', 15000, 5, 'Sate_Daging.jpg', 'sate daging, makanan ini merupakan makanan yang digemari banyak orang karena rasanya yang nikmat namun banyak yang belum tahu tentang kasiat makanan ini, yaitu seperti mencegah anemia , memelihara system kekebalan tubuh. Tapi alangkah baiknya makanan ini tidak dikonsumsi secara berlebihan.', 6, 1),
(5, 'Tuna dengan Kacang Putih dan Salad Adas', 20000, 5, 'ikan tuna.jpg', 'Ikan tuna yang disediakan kali ini adalah ikan tuna panggang dan tidak mengandung minyak sehingga baik untuk kesehatan. Ikan tuna mengandung lemak, protein, dab asam lemak omega-3 yang tinggi. Ikan tuna memiliki beberapa manfaat bagi Kesehatan tubuh yaitu membantu memenuhi kebutuhan protein, menyehatkan jantung, mencegah anemia, mengatasi stress, menjaga Kesehatan tulang, dan lain sebagainya. Informasi ini sudah di verifikasi oleh ahli ortopedi.', 6, 1),
(6, 'Sup Sayuran Bening', 15000, 10, 'sup sayur.jpg', 'Sup sayur banyak merupakan makanan yang paling umum dikonsumsi oleh pasien ataupun orang yang sedang sakit, dikarnakan sup sayur memiliki banyak manfaat seperti menhangatkan badan dan mengandung banyak vitamin dan protein karena dalam sup sayur terkandung banyak sayur dan biasanya dicampur dengan ayam cincang. ', 8, 1),
(7, 'Oatmeal Panggang Blueberry', 10000, 15, 'Outmeal Panggang Blueberry.jpg', 'Outmeal panggang blueberry adalah makanan ringan yang dipanggang dengan topping blueberry diatasnya. Outmeal ini mengandung banyak serat, kalsium, zat besi, dan vitamin B komploks. Dalam 100 gram oat mengandung 7 gram serat. Sehingga oat berkhasiat membantu menurunkan kadar gula, serta tekanan darah. Tak heran jika oat dinobatkan sebagai salah satu makanan sehat yang ramah jantung. Informasi ini di verifikasi oleh ahli bedah jantung.', 10, 1),
(8, 'Roti Panggang Telur', 8000, 10, 'roti panggang.jpg', 'Roti merupakan salah satu jenis makanan yang baik untuk sarapan. Apalagi kandungan roti tersebut dari gandum atau whole grain, yang lebih rendah kalori dan lebih sehat.', 8, 1),
(9, 'Smoothies', 9000, 10, 'Smoothies.jpg', 'Hidangan ini mampu memberikan manfaat yang sangat banyak untuk tubuh. Karena campuran buah, sayur dan juga biji-bijian dapat memberikan asupan nutrisi seimbang bagi tubuh.', 10, 1),
(10, 'Infused water', 6000, 20, 'Infused water.jpg', 'Infused water adalah air mineral yang dicampurkan dengan irisan buah-buahan segar, sayuran, herbal, hingga rempah-rempah.  Infused water memiliki banyak manfaat seperti menjaga berat badan, mencegah penuaan dini, membuang racun dalam tubuh, membantu melancarkan pencernaan, dan lain sebagainya. Informasi ini telah di verifikasi oleh ahli penyakit dalam.', 15,1),
(11, 'Air kelapa', 8000, 30, 'Air kelapa.jpg', 'Air kelapa adalah salah satu minuman sehat selain air putih yang baik dikonsumsi rutin. Pilih air kelapa yang benar-benar murni dan tidak diberi pemanis tambahan. Tak hanya rasanya segar, di dalamnya juga mengandung banyak nutrisi, antioksidan, dan mineral yang diperlukan tubuh.', 10, 1),
(12, 'Air Mineral', 3000, 50, 'air mineral.jpg', 'Air mineral ini kaya akan mineral, seperti kalsium, magnesium, dan natrium. Berkat kandungan inilah air mineral memiliki banyak manfaat baik untuk tubuh, seperti meningkatkan Kesehatan tulang, menurunkan tekanan darah, menurunkan tingkat kolesterol, menjaga sistem pencernaan, menjaga kecantikan kulit, dan lain sebagainya. Informasi ini telah di verifikasi oleh ahli gizi.', 15, 1),
(13, 'Jahe Hangat', 5000, 20, 'jahe hangat.jpg', 'Minum air jahe hangat atau teh jahe sangat baik untuk sistem pencernaan. Aman dikonsumsi pagi hari saat perut kosong, bahkan jahe hangat bisa meredakan mual, muntah, dan juga diare. Jika ingin lebih manis, tambahkan madu sebagai penyeimbang rasa.', 9, 1),
(14, 'Teh Hijau', 5000, 20, 'teh hijau.jpg', 'Teh hijau merupakan minuman sehat yang mengandung energi, protein, magnesium, kalium, kafein, antioksidan, antiradang, dan antibakteri yang sangat baik untuk Kesehatan. Teh hijau memiliki banyak manfaat seperti mencegah resiko penyakit jantung, mencegah kanker, mencegah diabetes, menjaga tekanan darah, meningkatkan fungsi otak, meningkatkan kesuburan, mencegah infeksi, mencegah peradangan otak, dan masih banyak lagi. Informasi ini telah di verifikasi oleh ahli gizi.', 9, 1),
(15, 'paket 1', 17000, 20, 'paket 1.jpg', 'Nasi merah, Adapun makanan ini adalah nasi yang kemudian di tambahkan sayur2an yang bergizi dan beberapa buah buahan, makanan ini bermanfaat bagi Kesehatan jantung dan juga nasi merah mengandung kadar gula yang lebih sedikit dari nasi putih biasanya. Sehingga tidak menyebabkan pertambahan berat badan dan lebih sedikit mengurangi penyebab penyakit diabetes karena gula yang dikandungnya sedikit', 16, 1),
(16, 'paket 2', 35000, 8, 'Salmon dengan Saus Krim, Nasi, Sup, dan Kue pisang.jpg', 'Biji-bijian adalah makanan sehat yang didalamnya terdapat serat, buah dan biji-bijian . Yang mana makanan ini mengandung banyak vitamin dan kalsium sehingga baik di konsumsi oleh pasien dan setiap orng baik dari anak2 sampai orng dewasa . Makanan ini juga low calori jadi tidak menyebabkan gemuk karena lemak.', 16, 1);
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
