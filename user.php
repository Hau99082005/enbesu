<?php 
 include('inc/database.php');
 ob_start();
 _header('Tài khoản của tôi');
 _navbar();
 user();
 _footer();

?>