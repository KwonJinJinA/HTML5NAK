-- 2015年7月2日 14:43:47
drop table server_real_time_total_data;


-- 2015-06-29 14:05:02 添加字段记录打劫所得
ALTER TABLE `role_husong` ADD COLUMN `dajie_axp`  int(11) NULL AFTER `dajie_cishu`,
ADD COLUMN `dajie_exp`  bigint(20) NULL AFTER `dajie_axp`,
ADD COLUMN `dajie_money`  bigint(20) NULL AFTER `dajie_exp`;

-- 2015-07-02 14:45:20 跨服pvp表
CREATE TABLE `role_kuafupvp` (
`role_id`  bigint(20) NOT NULL ,
`score`  int(11) NULL DEFAULT 0 COMMENT '积分' ,
`now_liansheng`  int(11) NULL DEFAULT 0 COMMENT '当前连胜场数' ,
`max_liansheng`  int(11) NULL DEFAULT 0 COMMENT '最大连胜' ,
`join_count`  int(11) NULL DEFAULT 0 COMMENT '参加场数' ,
`win_count`  int(11) NULL DEFAULT 0 COMMENT '获胜场数' 
);

-- 2015-07-02 16:40:00 添加主键
ALTER TABLE `role_kuafupvp`
ADD PRIMARY KEY (`role_id`);

-- 2015-07-08 13:34:24 跨服pvp记录每日挑战次数
ALTER TABLE `role_kuafupvp`
ADD COLUMN `today_count`  int(2) NULL DEFAULT 0 COMMENT '今日挑战次数' AFTER `win_count`;

-- 2015-07-09 18:00:12 跨服pvp领奖
ALTER TABLE `role_kuafupvp`
ADD COLUMN `today_lingjiang`  int(1) NULL DEFAULT 0 COMMENT '今日是否领过奖';

-- 2015-07-09 18:03:05 上次领奖时间
ALTER TABLE `role_kuafupvp`
CHANGE COLUMN `today_lingjiang` `lingjiang_time`  bigint(20) NULL DEFAULT 0 COMMENT '上次领奖的时间' AFTER `log_update_time`;

-- 2015-07-10 16:45:26 添加武魂字段
ALTER TABLE `role_juexing`
ADD COLUMN `wuhun`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '武魂' AFTER `skills`;

-- 2015-07-15 14:18:10 神将宝石表
CREATE TABLE `role_shengjiang_slot` (
`id`  bigint(20) NOT NULL ,
`role_id`  bigint(20) NOT NULL ,
`shenjiang_id`  varchar(36) NOT NULL ,
`slot_num`  int(11) NOT NULL ,
`goods_id`  varchar(36) NOT NULL ,
`count`  int(11) NOT NULL DEFAULT 0 ,
`bind`  int(11) NOT NULL DEFAULT 0 ,
`expire_time`  bigint(20) NULL DEFAULT NULL ,
`rare_level`  int(11) NULL ,
`item_level`  int(11) NULL ,
`attributes`  text NULL ,
PRIMARY KEY (`id`)
);

-- 2015-07-21 16:18:04 采集尸体限制
CREATE TABLE `role_shiti` (
`role_id`  bigint(20) NOT NULL ,
`monster_id`  varchar(50) NOT NULL ,
`count`  int(10) NOT NULL DEFAULT 0 ,
`refresh_time`  bigint(20) NOT NULL ,
PRIMARY KEY (`role_id`)
);

-- 2015-07-21 16:20:55 修改尸体表
ALTER TABLE `role_shiti`
DROP COLUMN `count`,
CHANGE COLUMN `monster_id` `shiti_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL AFTER `role_id`,
MODIFY COLUMN `refresh_time`  bigint(20) NOT NULL AFTER `shiti_info`;

-- 2015-07-21 16:23:23 尸体
ALTER TABLE `role_shiti`
MODIFY COLUMN `shiti_info`  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `role_id`;

-- 2015-07-30 13:37:19 浮游炮
CREATE TABLE `role_sailgun` (
`role_id`  bigint(20) NOT NULL ,
`level`  int(5) NOT NULL DEFAULT 0 ,
`exp`  int(10) NOT NULL DEFAULT 0 ,
`jinjie_time`  bigint(20) NOT NULL ,
PRIMARY KEY (`role_id`)
);

-- 2015-07-30 18:22:41 浮游炮
ALTER TABLE `role_sailgun`
ADD COLUMN `jinjie_count`  int(10) NOT NULL DEFAULT 0 AFTER `jinjie_time`;
