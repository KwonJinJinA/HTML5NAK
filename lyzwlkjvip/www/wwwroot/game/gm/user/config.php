<?php
error_reporting(0);
header("Content-type: text/html; charset=utf-8");
ini_set('date.timezone','Asia/Shanghai');
session_start();
//==================================================
$key='// 版本 2022 Powered by 阿泽源码网 www.lyzwlkj.vip 勿改';
//==================================================
//仅供本地学习！！！！
//仅供本地学习！！！！
//仅供本地学习！！！！
//==================================================
    $_SESSION['gmbt'] ='WWW.LYZWLKJ.VIP';
	$gmbt = '阴阳界';  //标题	
	$gmcodeb = 'lyzwlkj.vip';  //GM码
	$gmkey="a7ffdc234e7ece749ec3f0a6c97c6af4";
	$sa="%2F%2F%20%E7%89%88%E6%9C%AC%20%32%30%32%32%20%50%6F%77%65%72%65%64%20%62%79%20%E9%98%BF%E6%B3%BD%E6%BA%90%E7%A0%81%E7%BD%91%20%77%77%77%2E%6C%79%7A%77%6C%6B%6A%2E%76%69%70%20%E5%8B%BF%E6%94%B9";
	$xname="游戏账号";// 界面显示的 授权游戏账号 这里方便统一
	$disables=array();
	$vip='yyj_';
	$frefresh=3;//防刷新间隔 单位秒
    $title   = '系统邮件';
    $contents = '阴阳界-系统官方给您发邮件了！';
	$chargemax=999999;//充值数量限制
	$mailmax=999999;//物品数量限制
	$yzfvip=array(//自行修改VIP权限
	'1'=>'VIP1只充值',   
	'2'=>'VIP2充值+物品',
	);
	/*
	 * 区服相关
	 */
	$quarr=array(
		'1'=>array(
			'name'=>'阿泽源码网1区',
			'db_ip'=>'127.0.0.1',
			'db_port'=>3306,
			'db_name'=>'account',
			'db_name1'=>'game_manager',
			'db_name2'=>'xkm_server_1001',
			'db_user'=>'root',
			'db_pswd'=>'game10086...A123456...',
			'serverid'=>1001,
            'hidde'=>false // false是开 true是关
		),
      	'2'=>array(
			'name'=>'阿泽源码网2区',
			'db_ip'=>'127.0.0.1',
			'db_port'=>3306,
			'db_name'=>'account',
			'db_name1'=>'game_manager',
			'db_name2'=>'xkm_server_1001',
			'db_user'=>'root',
			'db_pswd'=>'game10086...A123456...',
			'serverid'=>1002,
            'hidde'=>true // false是开 true是关
		),
	);

include_once 'conn.php';