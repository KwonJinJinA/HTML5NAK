/*
 Navicat Premium Data Transfer

 Source Server         : 阴阳界
 Source Server Type    : MySQL
 Source Server Version : 50650
 Source Host           : localhost:3306
 Source Schema         : cabal_log

 Target Server Type    : MySQL
 Target Server Version : 50650
 File Encoding         : 65001

 Date: 20/02/2023 16:38:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gather_log
-- ----------------------------
DROP TABLE IF EXISTS `gather_log`;
CREATE TABLE `gather_log`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_id` bigint(20) NULL DEFAULT NULL,
  `role_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_level` int(11) NULL DEFAULT NULL COMMENT '玩家等级',
  `vip_level` int(11) NULL DEFAULT NULL COMMENT 'VIP等级',
  `reg_time` bigint(20) NULL DEFAULT NULL,
  `reg_day` int(11) NULL DEFAULT NULL COMMENT '注册时间（精确到天）',
  `is_gunfu` int(11) NULL DEFAULT NULL COMMENT '滚服标志（1为滚服，0为非滚服）',
  `pid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server_id` int(11) NULL DEFAULT NULL,
  `gather_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '采集ID',
  `map_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'mapID',
  `event_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `log_day` int(11) NULL DEFAULT NULL COMMENT '日志记录时间（精确到天,20140202）',
  `log_minute` bigint(20) NULL DEFAULT NULL COMMENT '日志记录时间（精确到分钟,201402031503）',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gather_log
-- ----------------------------

-- ----------------------------
-- Table structure for monitor_login
-- ----------------------------
DROP TABLE IF EXISTS `monitor_login`;
CREATE TABLE `monitor_login`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server_id` int(11) NULL DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '帐号',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `role_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名',
  `level` int(11) NULL DEFAULT NULL COMMENT '玩家等级',
  `vip_level` int(11) NOT NULL COMMENT 'vip等级',
  `interval_time` int(11) NOT NULL COMMENT '时长（秒）',
  `times` bigint(20) NOT NULL COMMENT '登陆次数',
  `first_time` bigint(20) NOT NULL COMMENT '第一次登陆时间',
  `last_time` bigint(20) NOT NULL COMMENT '最后一次登陆时间',
  `log_day` int(11) NULL DEFAULT NULL COMMENT '日志记录时间（精确到天,20140202）',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of monitor_login
-- ----------------------------

-- ----------------------------
-- Table structure for role_chat_record
-- ----------------------------
DROP TABLE IF EXISTS `role_chat_record`;
CREATE TABLE `role_chat_record`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `area_id` int(11) NULL DEFAULT NULL,
  `chat_time` bigint(20) NULL DEFAULT NULL COMMENT '说话时间',
  `chat_channel` int(11) NULL DEFAULT NULL COMMENT '说话频道(0场景内聊天相关,1私聊,2队伍聊天,3公会聊天,4世界,5喇叭,6怪物聊天,7GM命令,8活动聊天,9公会团队聊天)',
  `role_id` bigint(20) NULL DEFAULT NULL,
  `role_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `chat_with_id` bigint(20) NULL DEFAULT NULL COMMENT '聊天对象的id',
  `chat_with_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '聊天对象的名字',
  `chat_content` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '聊天内容',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_chat_record
-- ----------------------------

-- ----------------------------
-- Table structure for role_login
-- ----------------------------
DROP TABLE IF EXISTS `role_login`;
CREATE TABLE `role_login`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_id` bigint(20) NULL DEFAULT NULL,
  `role_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` int(11) NULL DEFAULT NULL COMMENT '玩家等级',
  `reg_time` bigint(20) NULL DEFAULT NULL,
  `reg_day` int(11) NULL DEFAULT NULL COMMENT '注册时间（精确到天）',
  `is_gunfu` int(11) NULL DEFAULT NULL COMMENT '滚服标志（1为滚服，0为非滚服）',
  `login_time` bigint(20) NULL DEFAULT NULL COMMENT '用户登录时间',
  `pid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server_id` int(11) NULL DEFAULT NULL,
  `ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ip',
  `log_month` int(11) NULL DEFAULT NULL COMMENT '日志记录时间（精确到月份,201402）',
  `log_week` int(11) NULL DEFAULT NULL COMMENT '统计日所在周,例如：201452表示2014年52周，2014年12月29-31号算为2015年第一周',
  `log_day` int(11) NULL DEFAULT NULL COMMENT '日志记录时间（精确到天,20140202）',
  `log_hour` int(11) NULL DEFAULT NULL COMMENT '日志记录时间（精确到小时2014020202）',
  `log_minute` bigint(20) NULL DEFAULT NULL COMMENT '日志记录时间（精确到分钟,201402031503）',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_login
-- ----------------------------

-- ----------------------------
-- Table structure for role_logout
-- ----------------------------
DROP TABLE IF EXISTS `role_logout`;
CREATE TABLE `role_logout`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_id` bigint(20) NULL DEFAULT NULL,
  `role_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` int(11) NULL DEFAULT NULL COMMENT '玩家等级',
  `login_level` int(11) NULL DEFAULT NULL COMMENT '玩家登陆时等级',
  `login_time` bigint(20) NULL DEFAULT NULL COMMENT '用户登录时间',
  `logout_time` bigint(20) NULL DEFAULT NULL COMMENT '用户登出时间',
  `online_time` bigint(20) NULL DEFAULT NULL COMMENT '在线时长',
  `reg_time` bigint(20) NULL DEFAULT NULL,
  `reg_day` int(11) NULL DEFAULT NULL COMMENT '注册时间（精确到天）',
  `is_gunfu` int(11) NULL DEFAULT NULL COMMENT '滚服标志（1为滚服，0为非滚服）',
  `pid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server_id` int(11) NULL DEFAULT NULL,
  `log_time` bigint(20) NULL DEFAULT NULL COMMENT '日志记录时间',
  `ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ip',
  `province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `area` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `minute_of_hour` int(11) NULL DEFAULT NULL COMMENT '记录日志的时间分钟（1503为15点03分）',
  `log_month` int(11) NULL DEFAULT NULL COMMENT '日志记录时间（精确到月份,201402）',
  `log_week` int(11) NULL DEFAULT NULL COMMENT '统计日所在周,例如：201452表示2014年2周，2014年12月29-31号算为2015年第一周',
  `log_day` int(11) NULL DEFAULT NULL COMMENT '日志记录时间（精确到天,20140202）',
  `log_hour` int(11) NULL DEFAULT NULL COMMENT '日志记录时间（精确到小时2014020202）',
  `log_minute` bigint(20) NULL DEFAULT NULL COMMENT '日志记录时间（精确到分钟,201402031503）',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_logout
-- ----------------------------

-- ----------------------------
-- Table structure for role_online
-- ----------------------------
DROP TABLE IF EXISTS `role_online`;
CREATE TABLE `role_online`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server_id` int(11) NULL DEFAULT NULL,
  `count` int(11) NULL DEFAULT NULL COMMENT '在线人数',
  `gunfu_count` int(11) NULL DEFAULT NULL COMMENT '滚服在线人数',
  `vip_count` int(11) NULL DEFAULT NULL COMMENT 'vip在线数',
  `log_time` bigint(20) NULL DEFAULT NULL COMMENT '记录日志时间',
  `minute_of_hour` int(11) NULL DEFAULT NULL COMMENT '记录日志的时间分钟（1503为15点03分）',
  `log_month` int(11) NULL DEFAULT NULL COMMENT '日志记录时间（精确到月份）',
  `log_day` int(11) NULL DEFAULT NULL COMMENT '日志记录时间（精确到天）',
  `log_hour` int(11) NULL DEFAULT NULL COMMENT '日志记录时间（精确到小时）',
  `log_minute` bigint(20) NULL DEFAULT NULL COMMENT '日志记录时间（精确到分钟）',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '玩家在线数统计-每5分钟统计一次' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_online
-- ----------------------------

-- ----------------------------
-- Table structure for role_recharge
-- ----------------------------
DROP TABLE IF EXISTS `role_recharge`;
CREATE TABLE `role_recharge`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_id` bigint(20) NULL DEFAULT NULL,
  `role_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `level` int(11) NULL DEFAULT NULL COMMENT '角色等级',
  `vip_level` int(11) NULL DEFAULT NULL COMMENT 'VIP等级',
  `treasure_amount` int(11) NULL DEFAULT NULL COMMENT '本次充值获得元宝数',
  `rmb_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '本次充值花费的人民币',
  `max_rmb_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '最大充值RMB',
  `total_rmb_amount` decimal(11, 2) NULL DEFAULT NULL COMMENT '历史RMB充值总金额',
  `recharge_type` int(11) NULL DEFAULT NULL COMMENT '充值类型',
  `money_type` int(11) NULL DEFAULT NULL COMMENT '0,元宝;1绑定元宝;2金币',
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单id',
  `is_finish` int(11) NULL DEFAULT NULL COMMENT '充值状态，是否完成（1为完成，0为未完成）',
  `pid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server_id` int(11) NULL DEFAULT NULL,
  `total_treasure_amount` int(11) NULL DEFAULT NULL COMMENT '历史总充值金额',
  `surplus_treasure` int(11) NULL DEFAULT NULL COMMENT '剩余元宝',
  `recharge_time` bigint(20) NULL DEFAULT NULL COMMENT '充值时间',
  `first_recharge_time` bigint(20) NULL DEFAULT NULL COMMENT '首次充值时间',
  `registration_time` int(11) NULL DEFAULT NULL COMMENT '注册时间，精确到天（例如：20140101）',
  `reg_time` bigint(20) NULL DEFAULT NULL COMMENT '注册时间（毫秒值）',
  `last_login_time` bigint(20) NULL DEFAULT NULL,
  `is_first_recharge` int(11) NULL DEFAULT NULL COMMENT '是否为首次充值(第一次充值当天的每次充值都叫首次充值。1为首次充值，0为不是首次充值）',
  `is_first_week_recharge` int(11) NULL DEFAULT NULL COMMENT '是否为当周首充（1为是，0为否）',
  `is_first_month_recharge` int(11) NULL DEFAULT NULL COMMENT '是否为当周首充（1为是，0为否）',
  `is_new_week_registration` int(11) NULL DEFAULT NULL COMMENT '是否为本周新注册',
  `is_new_month_registration` int(11) NULL DEFAULT NULL COMMENT '是否为本月新注册',
  `is_gunfu` int(11) NULL DEFAULT NULL COMMENT '1为滚服，0为非滚服',
  `registration_days` bigint(20) NULL DEFAULT NULL COMMENT '注册天数(0表示为当天注册)',
  `recharge_count` int(11) NULL DEFAULT NULL COMMENT '充值次数',
  `log_month` int(11) NULL DEFAULT NULL COMMENT '日志记录时间（精确到月份）',
  `log_week` int(11) NULL DEFAULT NULL COMMENT '统计日所在周,例如：201452表示2014年52周，2014年12月29-31号算为2015年第一周',
  `log_day` int(11) NULL DEFAULT NULL COMMENT '日志记录时间（精确到天）',
  `log_hour` int(11) NULL DEFAULT NULL COMMENT '日志记录时间（精确到小时）',
  `log_minute` bigint(20) NULL DEFAULT NULL COMMENT '日志记录时间（精确到分钟）',
  `product_id` int(11) NULL DEFAULT NULL COMMENT '商品id',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_recharge
-- ----------------------------

-- ----------------------------
-- Table structure for role_registration
-- ----------------------------
DROP TABLE IF EXISTS `role_registration`;
CREATE TABLE `role_registration`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_id` bigint(20) NULL DEFAULT NULL,
  `role_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server_id` int(11) NULL DEFAULT NULL,
  `registration_time` bigint(20) NULL DEFAULT NULL COMMENT '注册时间',
  `gunfu_state` int(11) NULL DEFAULT NULL COMMENT '滚服状态（1为滚服，0为非滚服）',
  `registration_days` bigint(20) NULL DEFAULT NULL COMMENT '注册天数',
  `log_month` int(11) NULL DEFAULT NULL COMMENT '日志记录时间（精确到月份）',
  `log_week` int(11) NULL DEFAULT NULL COMMENT '统计日所在周,例如：201452表示2014年52周，2014年12月29-31号算为2015年第一周',
  `log_day` int(11) NULL DEFAULT NULL COMMENT '日志记录时间（精确到天）',
  `log_hour` int(11) NULL DEFAULT NULL COMMENT '日志记录时间（精确到小时）',
  `log_minute` bigint(20) NULL DEFAULT NULL COMMENT '日志记录时间（精确到分钟）',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_registration
-- ----------------------------

-- ----------------------------
-- Table structure for role_task_end
-- ----------------------------
DROP TABLE IF EXISTS `role_task_end`;
CREATE TABLE `role_task_end`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server_id` int(11) NULL DEFAULT NULL,
  `event_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_id` bigint(20) NULL DEFAULT NULL,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` int(11) NULL DEFAULT NULL,
  `task_limit` int(11) NULL DEFAULT NULL COMMENT '任务等级限制',
  `role_level` int(11) NULL DEFAULT NULL,
  `vip_level` int(11) NULL DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL COMMENT '任务开始时间',
  `event_time` timestamp NULL DEFAULT NULL COMMENT '任务结束时间',
  `money_before_task` bigint(20) NULL DEFAULT NULL,
  `money_after_task` bigint(20) NULL DEFAULT NULL,
  `task_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money_transfer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '玩家设计的任务金钱转移(得到金钱为整数,失去为负数)',
  `get_item_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '获得物品编号',
  `lost_item_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '失去物品编号',
  `get_item_num` int(11) NULL DEFAULT NULL COMMENT '获得物品数量',
  `lost_item_num` int(11) NULL DEFAULT NULL COMMENT '失去物品数量',
  `log_day` int(11) NULL DEFAULT NULL,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_task_end
-- ----------------------------

-- ----------------------------
-- Table structure for role_task_start
-- ----------------------------
DROP TABLE IF EXISTS `role_task_start`;
CREATE TABLE `role_task_start`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server_id` int(11) NULL DEFAULT NULL,
  `event_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role_id` bigint(20) NULL DEFAULT NULL,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `gender` int(11) NULL DEFAULT NULL,
  `task_limit` int(11) NULL DEFAULT NULL COMMENT '任务等级限制',
  `role_level` int(11) NULL DEFAULT NULL,
  `vip_level` int(11) NULL DEFAULT NULL,
  `event_time` timestamp NULL DEFAULT NULL COMMENT '任务开始时间',
  `money_before_task` bigint(20) NULL DEFAULT NULL,
  `money_after_task` bigint(20) NULL DEFAULT NULL,
  `task_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `money_transfer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '玩家设计的任务金钱转移(得到金钱为整数,失去为负数)',
  `get_item_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '获得物品编号',
  `lost_item_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '失去物品编号',
  `get_item_num` int(11) NULL DEFAULT NULL COMMENT '获得物品数量',
  `lost_item_num` int(11) NULL DEFAULT NULL COMMENT '失去物品数量',
  `log_day` int(11) NULL DEFAULT NULL,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_task_start
-- ----------------------------

-- ----------------------------
-- Table structure for role_upgrade
-- ----------------------------
DROP TABLE IF EXISTS `role_upgrade`;
CREATE TABLE `role_upgrade`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `role_id` bigint(20) NULL DEFAULT NULL,
  `role_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台id',
  `server_id` int(11) NULL DEFAULT NULL COMMENT '服务器id',
  `job` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色职业',
  `level` int(11) NULL DEFAULT NULL COMMENT '角色等级',
  `vip_level` int(11) NULL DEFAULT NULL COMMENT 'VIP等级',
  `upgrade_time` bigint(20) NULL DEFAULT NULL COMMENT '升级时间',
  `upgrade_cost_time` bigint(20) NULL DEFAULT NULL COMMENT '升级耗费时间',
  `log_month` int(11) NULL DEFAULT NULL COMMENT '日志记录时间（精确到月份）',
  `log_day` int(11) NULL DEFAULT NULL COMMENT '日志记录时间（精确到天）',
  `log_hour` int(11) NULL DEFAULT NULL COMMENT '日志记录时间（精确到小时）',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_3d` int(11) NULL DEFAULT NULL COMMENT '是不是3d'
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_upgrade
-- ----------------------------

-- ----------------------------
-- Table structure for stat_real_time_service
-- ----------------------------
DROP TABLE IF EXISTS `stat_real_time_service`;
CREATE TABLE `stat_real_time_service`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `area_id` int(11) NOT NULL,
  `ru` int(11) NOT NULL COMMENT '新注册用户数量',
  `au` int(11) NOT NULL COMMENT '日登陆用户数量',
  `num` int(11) NOT NULL COMMENT '当前在线用户数量',
  `pa` int(11) NOT NULL COMMENT '充值用户数量',
  `pay_times` int(11) NOT NULL COMMENT '充值次数',
  `income` decimal(11, 0) NOT NULL COMMENT '充值金额',
  `pay_coin` bigint(20) NOT NULL COMMENT '充值元宝数量',
  `pay_rate` float(9, 3) NOT NULL COMMENT '充值付费率',
  `arpu` int(9) NOT NULL COMMENT 'ARPU',
  `consume_account` int(11) NOT NULL COMMENT '消费人数(元宝)',
  `consume_times` int(11) NOT NULL COMMENT '消费次数（元宝）',
  `consume_amount` bigint(20) NOT NULL COMMENT '消费金额（元宝数量）',
  `consume_banding_account` int(11) NOT NULL COMMENT '消费绑定元宝人数',
  `consume_banding_times` int(11) NOT NULL COMMENT '消费绑定元宝次数',
  `consume_banding_amount` bigint(20) NOT NULL COMMENT '消费绑定元宝金额',
  `log_month` int(11) NOT NULL COMMENT '日志记录时间（精确到月份）',
  `log_day` int(11) NOT NULL COMMENT '日志记录时间（精确到天）',
  `log_hour` int(11) NOT NULL COMMENT '日志记录时间（精确到小时）',
  `log_minute` bigint(20) NOT NULL COMMENT '日志记录时间（精确到分钟）',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '实时分服数据-单服每隔5分钟一条记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stat_real_time_service
-- ----------------------------

-- ----------------------------
-- Table structure for user_registration
-- ----------------------------
DROP TABLE IF EXISTS `user_registration`;
CREATE TABLE `user_registration`  (
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pid` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `server_id` int(11) NULL DEFAULT NULL,
  `registration_time` bigint(20) NULL DEFAULT NULL COMMENT '注册时间',
  `log_month` int(11) NULL DEFAULT NULL COMMENT '日志记录时间（精确到月份）',
  `log_week` int(11) NULL DEFAULT NULL COMMENT '统计日所在周,例如：201452表示2014年52周，2014年12月29-31号算为2015年第一周',
  `log_day` int(11) NULL DEFAULT NULL COMMENT '日志记录时间（精确到天）',
  `log_hour` int(11) NULL DEFAULT NULL COMMENT '日志记录时间（精确到小时）',
  `log_minute` bigint(20) NULL DEFAULT NULL COMMENT '日志记录时间（精确到分钟）',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_registration
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
