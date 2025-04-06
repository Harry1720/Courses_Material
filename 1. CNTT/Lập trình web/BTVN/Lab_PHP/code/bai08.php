<?php
$count = 0;
for($i=2839; $i<=7827;$i++){
    if($i%13 == 0){
        $count++;
    }
};
echo "Số từ 2839 đến 7827 có $count số chia hết cho 13.";
?>