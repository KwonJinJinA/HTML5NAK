<?php
error_reporting(0);
        //奖品列表，weight为权重  PrizeCode为编号   编号不能重复   xb为中奖获得的星币  item为中奖获得的物品  
        $prizes = [
            ['PrizeCode'=>'2','PrizeName' => '一代宗师','Weight' => 50,'xb' => 88888,'itme' => 'dj11988,1','img' => 'http://img1.gamedog.cn/2020/12/11/5140612-2012111PZ80.gif'],
            ['PrizeCode'=>'4','PrizeName' => '高级圣币宝箱','Weight' => 50,'xb' => 88888,'itme' => 'dj12374,5','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'5','PrizeName' => '桃李满天下','Weight' => 50,'xb' => 88888,'itme' => 'dj12072,1','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'6','PrizeName' => '100级直升丹','Weight' => 50,'xb' => 88888,'itme' => 'dj1043,1','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'7','PrizeName' => '单身王老五','Weight' => 50,'xb' => 88888,'itme' => 'dj12095,1','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'8','PrizeName' => '单身贵族','Weight' => 50,'xb' => 88888,'itme' => 'dj12094,1','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'9','PrizeName' => '雪花飘飘','Weight' => 50,'xb' => 88888,'itme' => 'dj12093,1','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'10','PrizeName' => '不给糖果就捣乱','Weight' => 50,'xb' => 88888,'itme' => 'dj12087,1','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'11','PrizeName' => '春风满园','Weight' => 50,'xb' => 88888,'itme' => 'dj102127,1','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'12','PrizeName' => '夜阑人静','Weight' => 50,'xb' => 88888,'itme' => 'dj4064,1','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'13','PrizeName' => '圣诞快乐','Weight' => 50,'xb' => 88888,'itme' => 'dj4074,1','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'14','PrizeName' => '战骑随机外显宝箱','Weight' => 50,'xb' => 88888,'itme' => 'dj12352,5','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'15','PrizeName' => '翅膀随机外显宝箱','Weight' => 50,'xb' => 88888,'itme' => 'dj12353,5','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'16','PrizeName' => '御灵可选包','Weight' => 50,'xb' => 88888,'itme' => 'dj50002,1','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'19','PrizeName' => '注灵可选包','Weight' => 50,'xb' => 88888,'itme' => 'dj50001,5','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'20','PrizeName' => '红色随机注灵丹','Weight' => 50,'xb' => 88888,'itme' => 'dj4460,5','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'21','PrizeName' => '传说战骑礼包','Weight' => 50,'xb' => 88888,'itme' => 'dj9952,5','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'22','PrizeName' => '传说翅膀礼包','Weight' => 50,'xb' => 88888,'itme' => 'dj9960,5','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'23','PrizeName' => '传说神兵礼包','Weight' => 50,'xb' => 88888,'itme' => 'dj9968,5','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'23','PrizeName' => '传说时装礼包','Weight' => 50,'xb' => 88888,'itme' => 'dj9976,5','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'24','PrizeName' => '传说外显任选包','Weight' => 50,'xb' => 88888,'itme' => 'dj13400,3','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'25','PrizeName' => '传说外显随机包','Weight' => 50,'xb' => 88888,'itme' => 'dj13406,3','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'26','PrizeName' => '典藏外显任选包','Weight' => 50,'xb' => 88888,'itme' => 'dj13403,1','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'27','PrizeName' => '典藏外显礼包','Weight' => 50,'xb' => 88888,'itme' => 'dj9949,1','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'28','PrizeName' => '祈福袋','Weight' => 50,'xb' => 88888,'itme' => 'dj2185,50','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'29','PrizeName' => '圣品精石宝箱','Weight' => 50,'xb' => 88888,'itme' => 'dj12512,2','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'30','PrizeName' => '神兵龙渊','Weight' => 30,'xb' => 88888,'itme' => 'dj12182,1','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'31','PrizeName' => '神兵龙灵','Weight' => 30,'xb' => 88888,'itme' => 'dj12183,1','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'32','PrizeName' => '神兵彼岸','Weight' => 30,'xb' => 88888,'itme' => 'dj12184,1','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'33','PrizeName' => '神兵守护','Weight' => 30,'xb' => 88888,'itme' => 'dj12185,1','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'34','PrizeName' => '神兵星斩','Weight' => 30,'xb' => 88888,'itme' => 'dj12186,1','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'35','PrizeName' => '经验副本卷轴','Weight' => 50,'xb' => 88888,'itme' => 'dj1740,3','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'36','PrizeName' => '欢乐狗子','Weight' => 50,'xb' => 88888,'itme' => 'dj4105,1','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'37','PrizeName' => '随机高级丹药','Weight' => 50,'xb' => 88888,'itme' => 'dj2899,20','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],
            ['PrizeCode'=>'38','PrizeName' => '15级神石宝箱','Weight' => 50,'xb' => 88888,'itme' => 'dj2703,1','img' => 'http://img1.gamedog.cn/2022/09/09/5635080-220Z91502140.png'],


            
        ];
