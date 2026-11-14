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

// 执行更新操作
$sql = "UPDATE `account` SET `money` = `money` + 64800 WHERE `quid` IS NOT NULL";
if ($conn->query($sql) === TRUE) {
    echo "更新成功，发放奖励的玩家账号数：" . $conn->affected_rows;
} else {
    echo "更新失败：" . $conn->error;
}

// 关闭数据库连接
$conn->close();
?>