<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form method="post">
        <label>Nhập số dòng của bảng:</label>
        <input type="number" name="rows">
        <input type="submit">
    </form>

    <?php
    $a = 0; //cần khởi tạo để không bị cảnh báo rằng biến $a bị mập mờ ở dòng for
     if (isset($_POST["rows"])) {
        $a = (int)$_POST["rows"];
     };
     if($a>0){
        echo "<table border = '1' width='200px' >";
        for ($i = 1; $i <= $a; $i++){
            echo "<tr>";
            echo "<td>$i</td>";
            echo "</tr>";
        };
        echo "</table>";

     }
    ?>
</body>
</html>