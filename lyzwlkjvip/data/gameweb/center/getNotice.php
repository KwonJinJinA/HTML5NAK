<?php
header('Access-Control-Allow-Origin:*');
include_once "config.php";

global $noticeConfig;
global $gameConfig;
$platform=$_GET['platform'];
if(empty($platform)){
	return;
}
$platform = substr($platform,0,strrpos($platform,"?"));
$noticeVer = $noticeVer;
$noticeFile = "./temp/notice_{$platform}_{$noticeVer}.json";

if(!file_exists($noticeFile))
{
	//$noticeNum = $noticeConfig['noticeNum'];
	$cdn = $gameConfig['cdn'];
	$noticeStr=[];
	$noticeStr['noticeId'] = (string)$noticeVer;
	
	$noticeStr['content'] = [];
	//for($i=1;$i<=$noticeNum;$i++){
	$num = 0;
	foreach($noticeConfig as $key){
		$file = "{$platform}_{$num}.txt";
		$content['title'] = $key[0];
		if(empty($content['title']))continue;
		$fh= file_get_contents("{$cdn}notice/{$file}?".time());
		
		if(!$fh)continue;
		$content['notice'] = $fh;
		$content['show_time'] = $key[1];
		
		if(empty($content['show_time']))continue;
		$showTimeTamp = strtotime($content['show_time']);
		if($showTimeTamp > time())continue;
		$content['end_time'] = $key[2];
		
		if(empty($content['end_time']))continue;
		$showTimeTamp = strtotime($content['end_time']);
		if($showTimeTamp < time())continue;
		//print_r($content);
		array_push($noticeStr['content'],$content);
		$num++;
	}
	//}

	$json = json_encode($noticeStr, JSON_UNESCAPED_UNICODE);
	$json = str_ireplace("\\r\\n","\\r\\n<br\\/>",$json);
	$json = str_ireplace(" ","&nbsp;",$json);
	file_put_contents($noticeFile, $json . PHP_EOL, FILE_APPEND);
}
$fh= file_get_contents($noticeFile);
echo($fh);
?>