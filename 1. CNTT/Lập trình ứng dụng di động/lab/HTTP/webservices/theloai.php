<?php
include("connect.php");
if(isset($_GET['id']))
{
	$sl="select * from theloai where idTL=".$_GET['id'];
	$kq=mysqli_query($link,$sl);
	$arr=mysqli_fetch_assoc($kq);
	echo json_encode($arr);
}
else{
	$sl="select * from theloai";
	$kq=mysqli_query($link,$sl);
	while($d=mysqli_fetch_assoc($kq))
		$arr[]=$d;
	echo json_encode($arr);
}
?>