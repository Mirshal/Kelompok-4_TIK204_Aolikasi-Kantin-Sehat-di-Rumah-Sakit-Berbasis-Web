<?php
	session_start();
	session_unset(); 
	session_destroy();

	echo "<script>alert('Berhasil Logout Dari Aplikasi E-CANHEAL');</script>";
	echo "<script>location='login.php';</script>";
?>