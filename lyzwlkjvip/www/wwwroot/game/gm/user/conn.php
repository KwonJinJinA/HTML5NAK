<?php

function getHexGuid($a){
	$r='';
	while($a){
		$r = sprintf("%02X%s",bcmod($a,256),$r);
		$a = bcdiv($a,256);
	}
	return $r;
}

function mima($data,$key) {
    $signbb = md5($data.$key);
    return $signbb;
}
//更多资源下载 www.lyzwlkj.vip
function exit_notice($message,$errno){
		$return=array(
			'errcode'=>intval($errno),
			'info'=>$message,
		);
		exit(json_encode($return));
		
}
