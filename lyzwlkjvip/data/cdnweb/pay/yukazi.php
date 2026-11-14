<?php
// 假设要更新的表名为 "my_table"，字段名为 "my_field"
$pass = $_GET['pass'];
$code = '052369zzzz';
if($pass != $code){
    die("无权！");
}
// 连接到数据库（请根据您自己的数据库配置修改以下参数）
$servername = "localhost";
$username = "root";
$password = "game10086...A123456...";
$dbname = "account";

// 创建数据库连接
$conn = new mysqli($servername, $username, $password, $dbname);

// 检查连接是否成功
if ($conn->connect_error) {
    die("数据库连接失败：" . $conn->connect_error);
}
$showtimea=date("Ymd");
// 执行更新操作
$sql = "UPDATE account SET money = money + 64800,zd = zd + 5 WHERE card1 >= $showtimea AND card1 != ''";
if ($conn->query($sql) === TRUE) {
    echo "更新黄金卡卡成功". $conn->affected_rows;
} else {
    echo "更新月卡失败：" . $conn->error;
}

$sql = "UPDATE account SET money = money + 40000,zd = zd + 15 WHERE card2 >= $showtimea AND card2 != ''";
if ($conn->query($sql) === TRUE) {
    echo "更新至尊卡成功". $conn->affected_rows;
} else {
    echo "更新至尊卡失败：" . $conn->error;
}
$sql = "UPDATE account SET money = money + 60000,zd = zd + 25 WHERE card3 >= $showtimea AND card3 != ''";
if ($conn->query($sql) === TRUE) {
    echo "更新钻石卡成功". $conn->affected_rows;
} else {
    echo "更新钻石卡失败：" . $conn->error;
}
// 关闭数据库连接
$conn->close();
?>