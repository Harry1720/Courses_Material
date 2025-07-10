<?php
if(isset($_GET['id']))
{
include("connect.php");
$sl="select * from theloai where idTL=".$_GET['id'];
$kq=mysqli_query($link,$sl);
$arr=mysqli_fetch_assoc($kq);
echo json_encode($arr);
}
?>