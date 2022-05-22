<?php
session_start();
error_reporting(0);
header("Content-type: application/force-download");
header("Content-Disposition: attachment; filename=E-CANHEAL_notapembelian_".$_GET[id].".xls");
?>

<center><h2>Nota Pembelian #<?php echo $_GET['id']?></h2></center>
    
<table border="1" cellpadding="5">
  <tr>
    <th>No</th>
    <th>Menu</th>
    <th>Info Warung</th>
    <th>Harga</th>
    <th>Jumlah</th>
    <th>Subtotal</th>
  </tr>
  <?php
  
  include "koneksi.php";
  
  
  $query = $conn->query("SELECT * FROM pembelian_produk JOIN produk 
    ON pembelian_produk.id_produk=produk.id_produk JOIN warung ON produk.id_warung=warung.id_warung
    WHERE pembelian_produk.id_pembelian='$_GET[id]'");

  $no = 1; 
  while($data = $query->fetch_assoc()){ 
    ?>
    <tr>
      <td><?php echo $no++; ?></td>
      <td><?php echo $data['nama_produk']; ?></td>
      <td><?php echo $data['nama_warung']; ?> (<?php echo $data['telepon_warung']; ?>)</td>
      <td>Rp.<?php echo number_format($data['harga_produk']); ?></td>
      <td><?php echo $data['jumlah'] ?></td>
      <td>Rp.<?php echo number_format($data['harga_produk']*$data['jumlah']); ?></td>
    </tr>
    <?php
  }
  $query2=$conn->query("SELECT * FROM pembelian WHERE id_pembelian=$_GET[id]");
  $data2=$query2->fetch_assoc();
  ?>
  <tr>
    <th colspan="5" class="text-right">Total Pembelian</th>
    <th>Rp.<?php echo number_format($data2['jumlah_pembelian']); ?></th>
  </tr>
  <tr>
    <th colspan="5" class="text-right">Ongkos Kirim</th>
    <th>Rp.<?php echo number_format($data2['ongkir']); ?></th>
  </tr>
  <tr>
    <th colspan="5" class="text-right"><b><font color='#FF0000'>Total</b></th>
    <th><b><font color='#FF0000'>Rp.<?php echo number_format($data2['total_pembelian']); ?></b></th>
  </tr>
  <?php
  ?>
</table>
<h4><b><i><font color='#000000'>Silahkan hubungi CP untuk menyampaikan keluhan</i></b></h4>
<h4><b><i><font color='#000000'>Terima Kasih Telah Membeli dan Menjadi Pelanggan Kami</i></b></h4>
