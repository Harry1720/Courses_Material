<?php
include("connect.php");
$sl="delete from theloai where idTL=".$_GET['id'];
if(mysqli_query($link,$sl))
	echo "OK";
else echo "Error";
?>