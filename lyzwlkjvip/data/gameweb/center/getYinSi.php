<?php
header('Access-Control-Allow-Origin:*');
include_once "config.php";
error_reporting(E_ERROR);
global $gameConfig;
$platform=$_GET['platform'];
$type=$_GET['type'];
if(empty($platform)||empty($type)){
	return;
}
$cdn = $gameConfig['cdn'];
$noticeId = $gameConfig['xieyiVer'];
$noticeFile = "./temp/{$type}_{$platform}_{$noticeId}.json";
//print_r($cdn);
//print_r($noticeFile);
if(!file_exists($noticeFile))
{
	$file = "{$platform}_{$type}.txt";
	//print_r($file);
	$fh= file_get_contents("{$cdn}xieyi/{$file}?".time());
	//print_r();
	if(!$fh){
		$fh= file_get_contents("{$cdn}xieyi/default_{$type}.txt?".time());
		if(!$fh)return;
	}
	$content['notice'] = $fh;
	$json = json_encode($content, JSON_UNESCAPED_UNICODE);
	$json = str_ireplace("\\r\\n","\\r\\n<br\\/>",$json);
	//$json = str_ireplace(" ","&nbsp;",$json);

	file_put_contents($noticeFile, $json . PHP_EOL, FILE_APPEND);
}
$fh= file_get_contents($noticeFile);
echo($fh);
//$noticeFile = "./temp/notice_{$platform}_{$noticeId}.json";


?>