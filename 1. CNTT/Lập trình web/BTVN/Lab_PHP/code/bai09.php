<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<form method="post">
        <label>Nhập số tự nhiên n:</label>
        <input type="number" name="number" max = "20" min = "0">
        <!-- Đặt max="20" trong trường nhập số để hạn chế người dùng nhập các số quá lớn gây tràn bộ nhớ khi tính toán. -->
        <input type="submit">
    </form>


<?php
    $n = 0;
     if (isset($_POST["number"])) {
        $n = (int)$_POST["number"];
     };

    function Factorial ($n){
        if($n==1 || $n==0){
            return 1;
        }
        return $n * Factorial($n-1);
    }
    echo "$n! = ".Factorial($n);
?>
</body>
</html>
