<?php
include("connect.php");
if(isset($_POST['id']))
{
	$id=$_POST['id'];
	$tentl=$_POST['tentl'];
	$thutu=$_POST['thutu'];
	$anhien=$_POST['anhien'];
	$sl="update theloai set TenTL='$tentl',ThuTu=$thutu, AnHien=$anhien where idTL=$id";
	if(mysqli_query($link,$sl))
		echo "OK";
	else echo "Error";
}
?>