<!-- membuat proteksi sistem pada setiap sesi login -->
<?php 
    if (!isset($_SESSION['login'])) {
        echo "<script>location='login.php';</script>";
        exit();
    }
?>