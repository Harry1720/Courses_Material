<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style type = "text/css">
        tr:nth-child(odd){ /*dùng tr do td chỉ có một, tr có nhiều nên mới dùng chẵn lẻ */
            background-color: yellow;
        }
        tr:nth-child(even){
            background-color:red;
        }
    </style>
</head>
<body>
    <form method="post">
        <label>Nhập số dòng của bảng:</label>
        <input type="number" name="rows">
        <label>Nhập số cột của bảng:</label>
        <input type="number" name="col">
        <input type="submit">
    </form>

    <?php
    $dong = 0;
    $cot=0;
     if (isset($_POST["rows"])) {
        $dong = (int)$_POST["rows"];
     };
     if (isset($_POST["col"])) {
        $cot = (int)$_POST["col"];
     };

     if($dong>0 && $cot>0){
        echo "<table border = '1' width='1000px' >";
        for ($i = 1; $i <= $dong; $i++){
            echo "<tr>";
            for($j=1;$j<=$cot;$j++){
                echo "<td>$i-$j</td>";
            }
            echo "</tr>";
        };
        echo "</table>";

     }
    ?>
</body>
</html>