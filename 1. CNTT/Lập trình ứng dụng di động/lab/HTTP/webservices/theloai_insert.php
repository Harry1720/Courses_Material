<?php
include("connect.php");
if(isset($_POST['insert']))
{
	
	$tentl=$_POST['tentl'];
	$thutu=$_POST['thutu'];
	$anhien=$_POST['anhien'];
	$sl="insert into theloai values('$tentl',$thutu, $anhien)";
	if(mysqli_query($link,$sl))
		echo "OK";
	else echo "Error";
}
?>