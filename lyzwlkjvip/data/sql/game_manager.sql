/*
 Navicat Premium Data Transfer

 Source Server         : 阴阳界
 Source Server Type    : MySQL
 Source Server Version : 50650
 Source Host           : localhost:3306
 Source Schema         : game_manager

 Target Server Type    : MySQL
 Target Server Version : 50650
 File Encoding         : 65001

 Date: 20/02/2023 16:38:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for gm_apply_exchange_code
-- ----------------------------
DROP TABLE IF EXISTS `gm_apply_exchange_code`;
CREATE TABLE `gm_apply_exchange_code`  (
  `id` bigint(20) NOT NULL,
  `user` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请人账户',
  `apply_time` bigint(20) NULL DEFAULT NULL COMMENT '申请时间',
  `plat_id` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道',
  `code_name` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '礼包名称',
  `code_items` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '礼包内容格式：道具id:数量;道具id:数量',
  `code_num` int(11) NULL DEFAULT NULL COMMENT '礼包数量',
  `use_level` int(11) NULL DEFAULT NULL COMMENT '使用等级限制',
  `start_time` bigint(20) NULL DEFAULT NULL COMMENT '礼包码开始有效期',
  `end_time` bigint(20) NULL DEFAULT NULL COMMENT '礼包码结束有效期',
  `apply_state` int(11) NULL DEFAULT NULL COMMENT '申请状态 0申请未审批，1审批通过，2审批不通过',
  `option_state` int(11) NULL DEFAULT NULL COMMENT '处理状态 0未处理 1处理成功 2处理失败',
  `use_num` int(11) NULL DEFAULT NULL COMMENT '单人可使用礼包次数',
  `code_type` int(11) NULL DEFAULT NULL COMMENT '兑换码类型',
  `log_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gm_apply_exchange_code
-- ----------------------------

-- ----------------------------
-- Table structure for gm_apply_option
-- ----------------------------
DROP TABLE IF EXISTS `gm_apply_option`;
CREATE TABLE `gm_apply_option`  (
  `id` bigint(20) NOT NULL,
  `user` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请人账户',
  `apply_time` bigint(20) NULL DEFAULT NULL COMMENT '申请时间',
  `apply_type` int(11) NULL DEFAULT NULL COMMENT '申请类型',
  `be_apply_role` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '被申请的角色信息',
  `apply_data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '申请的数据',
  `apply_state` int(11) NULL DEFAULT NULL COMMENT '申请状态 0申请未审批，1审批通过，2审批不通过',
  `option_state` int(11) NULL DEFAULT NULL COMMENT '处理状态 0未处理 1处理成功 2处理失败',
  `log_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gm_apply_option
-- ----------------------------

-- ----------------------------
-- Table structure for gm_chat_log
-- ----------------------------
DROP TABLE IF EXISTS `gm_chat_log`;
CREATE TABLE `gm_chat_log`  (
  `id` bigint(20) NOT NULL,
  `role_id` bigint(20) NULL DEFAULT NULL,
  `userId` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `serverId` int(11) NULL DEFAULT NULL,
  `platFormId` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `chatType` int(11) NULL DEFAULT NULL,
  `ext` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` bigint(20) NULL DEFAULT NULL,
  `log_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of gm_chat_log
-- ----------------------------

-- ----------------------------
-- Table structure for gm_feed_back
-- ----------------------------
DROP TABLE IF EXISTS `gm_feed_back`;
CREATE TABLE `gm_feed_back`  (
  `id` bigint(20) NOT NULL,
  `role_id` bigint(20) NULL DEFAULT NULL,
  `userId` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `serverId` int(11) NULL DEFAULT NULL,
  `platFormId` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `feedBackType` int(11) NULL DEFAULT NULL,
  `ext` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` bigint(20) NULL DEFAULT NULL,
  `log_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gm_feed_back
-- ----------------------------

-- ----------------------------
-- Table structure for gm_feed_back_reply
-- ----------------------------
DROP TABLE IF EXISTS `gm_feed_back_reply`;
CREATE TABLE `gm_feed_back_reply`  (
  `id` bigint(20) NOT NULL,
  `feed_back_id` bigint(20) NULL DEFAULT NULL,
  `content` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` bigint(20) NULL DEFAULT NULL,
  `user_id` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复的客服账号',
  `log_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `INDEX_gm_feed_back_reply_id`(`id`) USING BTREE,
  INDEX `INDEX_gm_feed_back_reply_feed_back_id`(`feed_back_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gm_feed_back_reply
-- ----------------------------

-- ----------------------------
-- Table structure for gm_game_servers
-- ----------------------------
DROP TABLE IF EXISTS `gm_game_servers`;
CREATE TABLE `gm_game_servers`  (
  `id` bigint(20) NOT NULL,
  `game` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏标识',
  `app` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'APP标识',
  `platform` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道标识',
  `server` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Server标识',
  `prefix` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前缀',
  `server_name` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器名字',
  `merge` int(11) NULL DEFAULT NULL COMMENT '0表示为和服，否则表示ID',
  `database_ip` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据IP',
  `database_name` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据名称',
  `server_ip` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'serverIP',
  `info_port` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏服端口',
  `web_port` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏服Web端口',
  `openTime` timestamp NULL DEFAULT NULL COMMENT '开服时间',
  `log_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gm_game_servers
-- ----------------------------

-- ----------------------------
-- Table structure for gm_op_activity_time
-- ----------------------------
DROP TABLE IF EXISTS `gm_op_activity_time`;
CREATE TABLE `gm_op_activity_time`  (
  `id` bigint(20) NOT NULL,
  `plat` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台',
  `addTime` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `userId` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '添加者账号',
  `servers` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器列表',
  `actType` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动类型',
  `actName` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '策划自定义活动名称',
  `flag` int(11) NULL DEFAULT NULL COMMENT '版本',
  `startTime` timestamp NULL DEFAULT NULL COMMENT '开始时间',
  `endTime` timestamp NULL DEFAULT NULL COMMENT '结束时间',
  `state` int(11) NULL DEFAULT NULL COMMENT '0新添加未同步1已同步2新更新未同步',
  `log_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `limitDay` int(11) NULL DEFAULT NULL COMMENT '开服时间限制',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of gm_op_activity_time
-- ----------------------------

-- ----------------------------
-- Table structure for gm_send_mail
-- ----------------------------
DROP TABLE IF EXISTS `gm_send_mail`;
CREATE TABLE `gm_send_mail`  (
  `id` bigint(20) NOT NULL,
  `user` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送人账户',
  `send_time` bigint(20) NULL DEFAULT NULL COMMENT '发送邮件时间',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '邮件信息',
  `fail_msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '发送失败的服务器',
  `log_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `approval_user` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审批通过的账户',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gm_send_mail
-- ----------------------------

-- ----------------------------
-- Table structure for gm_send_mail_apply_option
-- ----------------------------
DROP TABLE IF EXISTS `gm_send_mail_apply_option`;
CREATE TABLE `gm_send_mail_apply_option`  (
  `id` bigint(20) NOT NULL,
  `user` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请人账户',
  `apply_time` bigint(20) NULL DEFAULT NULL COMMENT '申请时间',
  `apply_type` int(11) NULL DEFAULT NULL COMMENT '申请类型',
  `apply_state` int(11) NULL DEFAULT NULL COMMENT '申请状态 0申请未审批，1审批通过，2审批不通过',
  `option_state` int(11) NULL DEFAULT NULL COMMENT '处理状态 0未处理 1处理成功 2处理失败',
  `mail_title` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件标题',
  `mail_content` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件内容',
  `mail_attach` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件附件',
  `mail_send_time` bigint(20) NULL DEFAULT NULL COMMENT '邮件发送时间戳',
  `mail_remark` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件备注',
  `mail_send_type` int(11) NULL DEFAULT NULL COMMENT '邮件发送类型',
  `mail_servers` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发送服务器id列表',
  `mail_recivers` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收到邮件的玩家id们',
  `log_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mail_recivers_name` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收到邮件的玩家名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of gm_send_mail_apply_option
-- ----------------------------

-- ----------------------------
-- Table structure for host
-- ----------------------------
DROP TABLE IF EXISTS `host`;
CREATE TABLE `host`  (
  `id` bigint(20) NOT NULL,
  `host_name` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '主机名称',
  `ip` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'linux服务器连接地址,即外网ip',
  `ip_in` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内网IP',
  `user_name` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '连接账号',
  `password` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '连接密码',
  `game_root` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏服的根目录',
  `redis_root` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'redis的根目录',
  `merge_root` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'merge的根目录',
  `cfg_root` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cfg的根目录',
  `log_root` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'log的根目录',
  `domain` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '域名地址',
  `port_start` int(11) NULL DEFAULT NULL COMMENT '起始端口',
  `port_end` int(11) NULL DEFAULT NULL COMMENT '终止端口',
  `port_next` int(11) NULL DEFAULT NULL COMMENT '下一个可分配的端口,初始值为起始端口',
  `nginx_cfg_root` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'nginx配置目录',
  `redis_index_next` int(11) NULL DEFAULT NULL COMMENT '下一个可分配的redisIndex',
  `redis_index_max` int(11) NULL DEFAULT NULL COMMENT '最大可分配的 redis_index,如果达到最大需要运维.手动清理redis或扩大redis',
  `mysql_user` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库账号',
  `mysql_pwd` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据库密码',
  `log_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `state` int(11) NULL DEFAULT NULL COMMENT '主机状态,0正常 ，1停止运行',
  `mysql_root` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/data/mysql_data' COMMENT '数据库所在的根目录',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of host
-- ----------------------------
INSERT INTO `host` VALUES (1616036154892, '1', '122.51.27.223', '127.0.0.1', 'root', 'Aa123456', '/data/game/openservers/', '/data/', '/data/game/merge-server/', '/data/game/cfgs/', '/data/game/', '122.51.27.223', 9500, 12000, 9584, '/www/server/panel/vhost/nginx/', 69, 1024, 'root', 'game10086...A123456...', '2023-02-13 14:46:05', 0, '/www/server/data/');

-- ----------------------------
-- Table structure for ip
-- ----------------------------
DROP TABLE IF EXISTS `ip`;
CREATE TABLE `ip`  (
  `ip` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `redis` int(11) NULL DEFAULT NULL COMMENT '记录这台ip地址的redis使用增长',
  `log_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ip`) USING BTREE,
  UNIQUE INDEX `ip`(`ip`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ip
-- ----------------------------

-- ----------------------------
-- Table structure for platform
-- ----------------------------
DROP TABLE IF EXISTS `platform`;
CREATE TABLE `platform`  (
  `id` bigint(20) NOT NULL,
  `platform_id` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台渠道ID',
  `platform_name` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台渠道名称',
  `global_redis` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '全局Redis',
  `global_redis_password` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '全局Redis',
  `code_template_name` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '代码模板名称',
  `log_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cross_code_template_name` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跨服代码模板名称',
  `game_id` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏表id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of platform
-- ----------------------------
INSERT INTO `platform` VALUES (1668154354817, 'xiyou_uc', '西游UC', '127.0.0.1:6379:30', 'game10086...A123456...', 'xy-server-template', '2023-02-13 01:43:20', 'cross-server-template-xy', '10002');

-- ----------------------------
-- Table structure for platform_child
-- ----------------------------
DROP TABLE IF EXISTS `platform_child`;
CREATE TABLE `platform_child`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `platform_id` bigint(20) NULL DEFAULT NULL COMMENT '主渠道表唯一主键',
  `platform_id_child` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子渠道id，字母编号',
  `platform_id_child_name` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '渠道中文说明',
  `log_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of platform_child
-- ----------------------------
INSERT INTO `platform_child` VALUES (8, 1616036154892, 'xiyou_uc', '', '2023-02-12 22:45:32');
INSERT INTO `platform_child` VALUES (9, 1668154354817, 'xiyou_uc_changwei', '西游-UC-长尾', '2023-01-30 16:14:28');
INSERT INTO `platform_child` VALUES (10, 1668154354817, 'xiyou_uc_shouQyddt', '西游-UC-手Q移动大厅', '2023-01-30 16:14:36');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `trigger_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `trigger_group` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `blob_data` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for server
-- ----------------------------
DROP TABLE IF EXISTS `server`;
CREATE TABLE `server`  (
  `server_id` bigint(20) NOT NULL,
  `host_id` bigint(20) NULL DEFAULT NULL COMMENT '物理服务器id',
  `platform_id` bigint(20) NULL DEFAULT NULL COMMENT '平台渠道ID',
  `serverName` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器名称',
  `server_dir` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器安装目录',
  `cfg_name` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置表的存储名字',
  `open_time` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开服时间',
  `debug` tinyint(1) NULL DEFAULT NULL COMMENT '调试模式',
  `separate_time` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分天的时间',
  `server_suffix` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器前缀名称',
  `devlopment` int(11) NULL DEFAULT NULL COMMENT '部署状态：0未部署，1已部署',
  `server_state` int(11) NULL DEFAULT NULL COMMENT '服务器状态：0关闭 ，1开启，2被合服了',
  `web_port` int(11) NULL DEFAULT NULL COMMENT 'web监控端口',
  `wssUrl` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'wssUrl',
  `redis_index` int(11) NULL DEFAULT NULL COMMENT 'redis用的index',
  `address_port` int(11) NULL DEFAULT NULL COMMENT '游戏服务器监听端口',
  `cross` tinyint(1) NULL DEFAULT NULL COMMENT '是否跨服',
  `targetId` bigint(20) NULL DEFAULT NULL COMMENT '合到了哪个服？0代表没合服',
  `server_type` int(11) NULL DEFAULT 1 COMMENT '服务器类型:1游戏服、2跨服',
  `log_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delstate` int(11) NULL DEFAULT NULL COMMENT '删除状态：0未删除，1删除',
  `cross_type` tinyint(1) NULL DEFAULT NULL COMMENT '是否跨服',
  PRIMARY KEY (`server_id`) USING BTREE,
  UNIQUE INDEX `server_id`(`server_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of server
-- ----------------------------
INSERT INTO `server` VALUES (10001, 1616036154892, 1668154354817, '跨服1区', 'cross-server-1', 'xycfg', '2023-02-13 00:00:00', 0, NULL, NULL, 2, 0, 9578, NULL, 30, 9579, 0, 0, 2, '2023-02-16 18:58:06', 0, NULL);
INSERT INTO `server` VALUES (2, 1616036154892, 1668154354817, '内网2服', 'game-server-2', 'xycfg', '2023-02-13 00:00:00', 0, '24:00', 's2', 2, 0, 9582, 'ws://122.51.27.223:9583', 68, 9583, 1, 0, 1, '2023-02-16 18:49:06', 0, NULL);
INSERT INTO `server` VALUES (1001, 1616036154892, 1668154354817, '双线1服', 'game-server-1', 'xycfg', '2023-02-05 00:00:00', 0, '24:00', 's1', 2, 1, 9580, 'ws://122.51.27.223:9581', 67, 9581, 1, 0, 1, '2023-02-17 21:25:07', 0, NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-red', 'Y', 'admin', '2022-11-21 18:05:24', 'admin', '2022-11-22 15:32:45', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-11-21 18:05:24', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-11-21 18:05:24', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'false', 'Y', 'admin', '2022-11-21 18:05:24', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-11-21 18:05:24', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '云帆科技', 0, '向佳', '15888888888', 'jeethinkvip@163.com', '0', '0', 'admin', '2022-11-21 18:05:23', 'admin', '2022-12-16 16:13:09');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '吉想', '15888888888', 'jeethinkvip@163.com', '0', '0', 'admin', '2022-11-21 18:05:23', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '吉想', '15888888888', 'jeethinkvip@163.com', '0', '2', 'admin', '2022-11-21 18:05:23', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '甘丰瑞', '15888888888', 'jeethinkvip@163.com', '0', '0', 'admin', '2022-11-21 18:05:23', 'admin', '2022-12-16 16:13:58');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '策划部门', 2, '刘庆涛', '15888888888', 'jeethinkvip@163.com', '0', '0', 'admin', '2022-11-21 18:05:23', 'admin', '2022-12-16 16:13:48');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '', '15888888888', 'jeethinkvip@163.com', '0', '0', 'admin', '2022-11-21 18:05:23', 'admin', '2022-12-16 16:14:10');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '吉想', '15888888888', 'jeethinkvip@163.com', '0', '2', 'admin', '2022-11-21 18:05:23', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '吉想', '15888888888', 'jeethinkvip@163.com', '0', '2', 'admin', '2022-11-21 18:05:23', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '吉想', '15888888888', 'jeethinkvip@163.com', '0', '2', 'admin', '2022-11-21 18:05:23', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '吉想', '15888888888', 'jeethinkvip@163.com', '0', '2', 'admin', '2022-11-21 18:05:23', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-11-21 18:05:24', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-11-21 18:05:24', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-11-21 18:05:24', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-11-21 18:05:24', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1137 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-11-21 18:05:23', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2022-11-21 18:05:23', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2022-11-21 18:05:23', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-11-21 18:05:23', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-11-21 18:05:23', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-11-21 18:05:23', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-11-21 18:05:23', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-11-21 18:05:23', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-11-21 18:05:23', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-11-21 18:05:23', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-11-21 18:05:23', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2022-11-21 18:05:23', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-11-21 18:05:23', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2022-11-21 18:05:23', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2022-11-21 18:05:23', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-11-21 18:05:23', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-11-21 18:05:23', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2022-11-21 18:05:23', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-11-21 18:05:23', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-11-21 18:05:23', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2022-11-21 18:05:23', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2022-11-21 18:05:23', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2022-11-21 18:05:23', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '任务导出', 110, 7, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1065, 'B:物品流水查询', 0, 14, 'gamelog', '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-01-03 16:48:21', '', NULL, 'B:物品流水查询');
INSERT INTO `sys_menu` VALUES (1066, '物品流水查询', 1065, 15, 'goodsflow', 'gamelog/goodsflow/index', '', 1, 0, 'C', '0', '0', 'gamelog:goodsflow', 'system', 'admin', '2023-01-03 16:48:21', '', NULL, '物品流水查询');
INSERT INTO `sys_menu` VALUES (1067, '物品流水查询List', 1066, 16, '#', '', '', 1, 0, 'F', '0', '0', 'gamelog:goodsflow:list', 'system', 'admin', '2023-01-03 16:48:21', '', NULL, '物品流水查询List');
INSERT INTO `sys_menu` VALUES (1068, '物品日志查询导出', 1066, 17, '#', '', '', 1, 0, 'F', '0', '0', 'gamelog:goodsflow:export', 'system', 'admin', '2023-01-03 16:48:21', '', NULL, '物品日志查询导出');
INSERT INTO `sys_menu` VALUES (1069, '货币流水查询', 1065, 18, 'moneyflow', 'gamelog/moneyflow/index', '', 1, 0, 'C', '0', '0', 'gamelog:moneyflow', 'system', 'admin', '2023-01-03 16:48:21', '', NULL, '货币流水查询');
INSERT INTO `sys_menu` VALUES (1070, '货币流水导出', 1069, 19, '#', '', '', 1, 0, 'F', '0', '0', 'gamelog:moneyflow:export', 'system', 'admin', '2023-01-03 16:48:21', '', NULL, '货币流水导出');
INSERT INTO `sys_menu` VALUES (1071, '货币流水查询List', 1069, 20, '#', '', '', 1, 0, 'F', '0', '0', 'gamelog:moneyflow:list', 'system', 'admin', '2023-01-03 16:48:21', '', NULL, '货币流水查询List');
INSERT INTO `sys_menu` VALUES (1072, 'B:礼包码查询', 0, 28, 'gameoperation', '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-01-04 14:47:11', '', NULL, 'B:礼包码查询');
INSERT INTO `sys_menu` VALUES (1073, '礼包码查询', 1072, 29, 'giftcode', 'gameoperation/giftcode/index', '', 1, 0, 'C', '0', '0', 'gameoperation:giftcode', 'system', 'admin', '2023-01-04 14:47:11', '', NULL, '礼包码查询');
INSERT INTO `sys_menu` VALUES (1074, '礼包码查询List', 1073, 30, '#', '', '', 1, 0, 'F', '0', '0', 'gameoperation:gifcodecheck:list', 'system', 'admin', '2023-01-04 14:47:11', '', NULL, '礼包码查询List');
INSERT INTO `sys_menu` VALUES (1077, '礼包码过期设置', 1073, 56, '#', '', '', 1, 0, 'F', '0', '0', 'gameoperation:giftexpire:set', 'system', 'admin', '2023-01-06 15:32:16', '', NULL, '礼包码过期设置');
INSERT INTO `sys_menu` VALUES (1078, '礼包码详情', 1073, 57, '#', '', '', 1, 0, 'F', '0', '0', 'gameoperation:giftinfo:lookup', 'system', 'admin', '2023-01-06 15:32:16', '', NULL, '礼包码详情');
INSERT INTO `sys_menu` VALUES (1079, 'B:渠道管理', 0, 56, 'game', '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-01-29 16:09:25', '', NULL, 'B:渠道管理');
INSERT INTO `sys_menu` VALUES (1080, '渠道管理', 1079, 57, 'gamequdao', 'game/gamequdao/index', '', 1, 0, 'C', '0', '0', 'game:gamequdao', 'system', 'admin', '2023-01-29 16:09:25', '', NULL, '渠道管理');
INSERT INTO `sys_menu` VALUES (1081, '渠道信息删除', 1080, 58, '#', '', '', 1, 0, 'F', '0', '0', 'game:gamequdao:remove', 'system', 'admin', '2023-01-29 16:09:25', '', NULL, '渠道信息删除');
INSERT INTO `sys_menu` VALUES (1082, '渠道List导出', 1080, 59, '#', '', '', 1, 0, 'F', '0', '0', 'game:gamequdao:export', 'system', 'admin', '2023-01-29 16:09:25', '', NULL, '渠道List导出');
INSERT INTO `sys_menu` VALUES (1083, '渠道信息修改', 1080, 60, '#', '', '', 1, 0, 'F', '0', '0', 'game:gamequdao:edit', 'system', 'admin', '2023-01-29 16:09:25', '', NULL, '渠道信息修改');
INSERT INTO `sys_menu` VALUES (1084, '据游戏查询渠道', 1080, 61, '#', '', '', 1, 0, 'F', '0', '0', 'game:gamequdao:query', 'system', 'admin', '2023-01-29 16:09:25', '', NULL, '据游戏查询渠道');
INSERT INTO `sys_menu` VALUES (1085, '主渠道新增', 1080, 62, '#', '', '', 1, 0, 'F', '0', '0', 'game:gamequdao:add', 'system', 'admin', '2023-01-29 16:09:25', '', NULL, '主渠道新增');
INSERT INTO `sys_menu` VALUES (1086, '区服ServerID', 1080, 63, '#', '', '', 1, 0, 'F', '0', '0', 'game:gameserver:list', 'system', 'admin', '2023-01-29 16:09:25', '', NULL, '区服ServerID');
INSERT INTO `sys_menu` VALUES (1087, '据gameid查询PID', 1080, 64, '#', '', '', 1, 0, 'F', '0', '0', 'game:gamequdao:distinctPID', 'system', 'admin', '2023-01-29 16:09:25', '', NULL, '据gameid查询PID');
INSERT INTO `sys_menu` VALUES (1088, '渠道查询List', 1080, 65, '#', '', '', 1, 0, 'F', '0', '0', 'game:gamequdao:list', 'system', 'admin', '2023-01-29 16:09:25', '', NULL, '渠道查询List');
INSERT INTO `sys_menu` VALUES (1089, 'B:LTV数据', 0, 105, 'data', '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-01-29 16:13:14', '', NULL, 'B:LTV数据');
INSERT INTO `sys_menu` VALUES (1090, '每日数据报表', 1089, 106, 'everydaydata', 'data/everydaydata/index', '', 1, 0, 'C', '0', '0', 'data:everydaydata', 'system', 'admin', '2023-01-29 16:13:14', '', NULL, '每日数据报表');
INSERT INTO `sys_menu` VALUES (1091, '每日数据报表List', 1090, 107, '#', '', '', 1, 0, 'F', '0', '0', 'data:erverdaydata:list', 'system', 'admin', '2023-01-29 16:13:14', '', NULL, '每日数据报表List');
INSERT INTO `sys_menu` VALUES (1092, 'LTV数据', 1089, 108, 'ltvdata', 'data/ltvdata/index', '', 1, 0, 'C', '0', '0', 'data:ltvdata', 'system', 'admin', '2023-01-29 16:13:14', '', NULL, 'LTV数据');
INSERT INTO `sys_menu` VALUES (1093, 'LTV数据List', 1092, 109, '#', '', '', 1, 0, 'F', '0', '0', 'data:ltvdata:list', 'system', 'admin', '2023-01-29 16:13:14', '', NULL, 'LTV数据List');
INSERT INTO `sys_menu` VALUES (1094, '渠道每日充值', 1089, 210, 'qudaosum', 'data/qudaosum/index', '', 1, 0, 'C', '0', '0', 'data:qudaosum', 'system', 'admin', '2023-01-29 19:16:09', '', NULL, '渠道每日充值');
INSERT INTO `sys_menu` VALUES (1095, '渠道每日充值list', 1094, 211, '#', '', '', 1, 0, 'F', '0', '0', 'data:qudaosum:list', 'system', 'admin', '2023-01-29 19:16:09', '', NULL, '渠道每日充值list');
INSERT INTO `sys_menu` VALUES (1096, '服务器表', 1079, 210, 'gameserver', 'game/gameserver/index', '', 1, 0, 'C', '0', '0', 'game:gameserver', 'system', 'admin', '2023-01-30 18:12:56', '', NULL, '服务器表');
INSERT INTO `sys_menu` VALUES (1097, '服务器修改', 1096, 211, '#', '', '', 1, 0, 'F', '0', '0', 'game:gameserver:edit', 'system', 'admin', '2023-01-30 18:12:56', '', NULL, '服务器修改');
INSERT INTO `sys_menu` VALUES (1098, '服务器export', 1096, 212, '#', '', '', 1, 0, 'F', '0', '0', 'game:gameserver:export', 'system', 'admin', '2023-01-30 18:12:56', '', NULL, '服务器export');
INSERT INTO `sys_menu` VALUES (1099, '服务器删除', 1096, 213, '#', '', '', 1, 0, 'F', '0', '0', 'game:gameserver:remove', 'system', 'admin', '2023-01-30 18:12:56', '', NULL, '服务器删除');
INSERT INTO `sys_menu` VALUES (1100, '服务器详情', 1096, 214, '#', '', '', 1, 0, 'F', '0', '0', 'game:gameserver:query', 'system', 'admin', '2023-01-30 18:12:56', '', NULL, '服务器详情');
INSERT INTO `sys_menu` VALUES (1101, '服务器List', 1096, 215, '#', '', '', 1, 0, 'F', '0', '0', 'game:gameserver:list', 'system', 'admin', '2023-01-30 18:12:56', '', NULL, '服务器List');
INSERT INTO `sys_menu` VALUES (1102, '服务器新增', 1096, 216, '#', '', '', 1, 0, 'F', '0', '0', 'game:gameserver:add', 'system', 'admin', '2023-01-30 18:12:56', '', NULL, '服务器新增');
INSERT INTO `sys_menu` VALUES (1103, '游戏列表', 1079, 217, 'gameadd', 'game/gameadd/index', '', 1, 0, 'C', '0', '0', 'game:gameadd', 'system', 'admin', '2023-01-30 18:12:56', '', NULL, '游戏列表');
INSERT INTO `sys_menu` VALUES (1104, '游戏列表详情', 1103, 218, '#', '', '', 1, 0, 'F', '0', '0', 'game:gameadd:query', 'system', 'admin', '2023-01-30 18:12:56', '', NULL, '游戏列表详情');
INSERT INTO `sys_menu` VALUES (1105, '游戏删除', 1103, 219, '#', '', '', 1, 0, 'F', '0', '0', 'game:gameadd:remove', 'system', 'admin', '2023-01-30 18:12:56', '', NULL, '游戏删除');
INSERT INTO `sys_menu` VALUES (1106, '游戏列表export', 1103, 220, '#', '', '', 1, 0, 'F', '0', '0', 'game:gameadd:export', 'system', 'admin', '2023-01-30 18:12:56', '', NULL, '游戏列表export');
INSERT INTO `sys_menu` VALUES (1107, '游戏列表List', 1103, 221, '#', '', '', 1, 0, 'F', '0', '0', 'game:gameadd:list', 'system', 'admin', '2023-01-30 18:12:56', '', NULL, '游戏列表List');
INSERT INTO `sys_menu` VALUES (1108, '游戏修改', 1103, 222, '#', '', '', 1, 0, 'F', '0', '0', 'game:gameadd:edit', 'system', 'admin', '2023-01-30 18:12:56', '', NULL, '游戏修改');
INSERT INTO `sys_menu` VALUES (1109, '游戏新增', 1103, 223, '#', '', '', 1, 0, 'F', '0', '0', 'game:gameadd:add', 'system', 'admin', '2023-01-30 18:12:56', '', NULL, '游戏新增');
INSERT INTO `sys_menu` VALUES (1110, '主渠道管理', 1079, 224, 'masterqudao', 'game/masterqudao/index', '', 1, 0, 'C', '0', '0', 'game:masterqudao', 'system', 'admin', '2023-01-30 18:12:56', '', NULL, '主渠道管理');
INSERT INTO `sys_menu` VALUES (1111, '主渠道信息详情', 1110, 225, '#', '', '', 1, 0, 'F', '0', '0', 'game:masterqudao:query', 'system', 'admin', '2023-01-30 18:12:56', '', NULL, '主渠道信息详情');
INSERT INTO `sys_menu` VALUES (1112, '主渠道信息导出', 1110, 226, '#', '', '', 1, 0, 'F', '0', '0', 'game:masterqudao:export', 'system', 'admin', '2023-01-30 18:12:56', '', NULL, '主渠道信息导出');
INSERT INTO `sys_menu` VALUES (1113, '主渠道管理List', 1110, 227, '#', '', '', 1, 0, 'F', '0', '0', 'game:masterqudao:list', 'system', 'admin', '2023-01-30 18:12:56', '', NULL, '主渠道管理List');
INSERT INTO `sys_menu` VALUES (1114, '主渠道删除', 1110, 228, '#', '', '', 1, 0, 'F', '0', '0', 'game:masterqudao:remove', 'system', 'admin', '2023-01-30 18:12:56', '', NULL, '主渠道删除');
INSERT INTO `sys_menu` VALUES (1115, '主渠道新增', 1110, 229, '#', '', '', 1, 0, 'F', '0', '0', 'game:masterqudao:add', 'system', 'admin', '2023-01-30 18:12:56', '', NULL, '主渠道新增');
INSERT INTO `sys_menu` VALUES (1116, '主渠道信息修改', 1110, 230, '#', '', '', 1, 0, 'F', '0', '0', 'game:masterqudao:edit', 'system', 'admin', '2023-01-30 18:12:56', '', NULL, '主渠道信息修改');
INSERT INTO `sys_menu` VALUES (1117, '游戏主机', 1079, 231, 'gamehost', 'game/gamehost/index', '', 1, 0, 'C', '0', '0', 'game:gamehost', 'system', 'admin', '2023-01-30 18:12:56', '', NULL, '游戏主机');
INSERT INTO `sys_menu` VALUES (1118, '游戏主机新增', 1117, 232, '#', '', '', 1, 0, 'F', '0', '0', 'game:gamehost:add', 'system', 'admin', '2023-01-30 18:12:56', '', NULL, '游戏主机新增');
INSERT INTO `sys_menu` VALUES (1119, '游戏主机List', 1117, 233, '#', '', '', 1, 0, 'F', '0', '0', 'game:gamehost:list', 'system', 'admin', '2023-01-30 18:12:56', '', NULL, '游戏主机List');
INSERT INTO `sys_menu` VALUES (1120, '游戏主机export', 1117, 234, '#', '', '', 1, 0, 'F', '0', '0', 'game:gamehost:export', 'system', 'admin', '2023-01-30 18:12:56', '', NULL, '游戏主机export');
INSERT INTO `sys_menu` VALUES (1121, '游戏主机修改', 1117, 235, '#', '', '', 1, 0, 'F', '0', '0', 'game:gamehost:edit', 'system', 'admin', '2023-01-30 18:12:56', '', NULL, '游戏主机修改');
INSERT INTO `sys_menu` VALUES (1122, '游戏主机删除', 1117, 236, '#', '', '', 1, 0, 'F', '0', '0', 'game:gamehost:remove', 'system', 'admin', '2023-01-30 18:12:56', '', NULL, '游戏主机删除');
INSERT INTO `sys_menu` VALUES (1123, '游戏主机详情', 1117, 237, '#', '', '', 1, 0, 'F', '0', '0', 'game:gamehost:query', 'system', 'admin', '2023-01-30 18:12:56', '', NULL, '游戏主机详情');
INSERT INTO `sys_menu` VALUES (1124, '子渠道管理', 1079, 210, 'qudaochild', 'game/qudaochild/index', '', 1, 0, 'C', '0', '0', 'game:qudaochild', 'system', 'admin', '2023-01-31 14:20:14', '', NULL, '子渠道管理');
INSERT INTO `sys_menu` VALUES (1125, '子渠道修改', 1124, 211, '#', '', '', 1, 0, 'F', '0', '0', 'game:qudaochild:edit', 'system', 'admin', '2023-01-31 14:20:14', '', NULL, '子渠道修改');
INSERT INTO `sys_menu` VALUES (1126, '子渠道List', 1124, 212, '#', '', '', 1, 0, 'F', '0', '0', 'game:qudaochild:list', 'system', 'admin', '2023-01-31 14:20:14', '', NULL, '子渠道List');
INSERT INTO `sys_menu` VALUES (1127, '子渠道删除', 1124, 213, '#', '', '', 1, 0, 'F', '0', '0', 'game:qudaochild:remove', 'system', 'admin', '2023-01-31 14:20:14', '', NULL, '子渠道删除');
INSERT INTO `sys_menu` VALUES (1128, '子渠道新增', 1124, 214, '#', '', '', 1, 0, 'F', '0', '0', 'game:qudaochild:add', 'system', 'admin', '2023-01-31 14:20:14', '', NULL, '子渠道新增');
INSERT INTO `sys_menu` VALUES (1129, '根据游戏id获取所有子渠道id', 1124, 215, '#', '', '', 1, 0, 'F', '0', '0', 'game:allqudaochild:list', 'system', 'admin', '2023-01-31 14:20:14', '', NULL, '根据游戏id获取所有子渠道id');
INSERT INTO `sys_menu` VALUES (1130, '子渠道export', 1124, 216, '#', '', '', 1, 0, 'F', '0', '0', 'game:qudaochild:export', 'system', 'admin', '2023-01-31 14:20:14', '', NULL, '子渠道export');
INSERT INTO `sys_menu` VALUES (1131, '子渠道详情', 1124, 217, '#', '', '', 1, 0, 'F', '0', '0', 'game:qudaochild:query', 'system', 'admin', '2023-01-31 14:20:14', '', NULL, '子渠道详情');
INSERT INTO `sys_menu` VALUES (1132, '渠道每日数据', 1089, 210, 'qudaoeverydata', 'data/qudaoeverydata/index', '', 1, 0, 'C', '0', '0', 'data:qudaoeverydata', 'system', 'admin', '2023-02-02 16:00:09', '', NULL, '渠道每日数据');
INSERT INTO `sys_menu` VALUES (1133, '渠道每日充值list', 1132, 211, '#', '', '', 1, 0, 'F', '0', '0', 'data:qudaosum:list', 'system', 'admin', '2023-02-02 16:00:09', '', NULL, '渠道每日充值list');
INSERT INTO `sys_menu` VALUES (1134, '留存数据报表', 1089, 210, 'keeprate', 'data/keeprate/index', '', 1, 0, 'C', '0', '0', 'data:keeprate', 'system', 'admin', '2023-02-07 10:56:06', '', NULL, '留存数据报表');
INSERT INTO `sys_menu` VALUES (1135, '留存数据list', 1134, 211, '#', '', '', 1, 0, 'F', '0', '0', 'data:keeprate:list', 'system', 'admin', '2023-02-07 10:56:06', '', NULL, '留存数据list');
INSERT INTO `sys_menu` VALUES (1136, '留存数据详情export1', 1134, 212, '#', '', '', 1, 0, 'F', '0', '0', 'data:keeprate:export1', 'system', 'admin', '2023-02-07 10:56:06', '', NULL, '留存数据详情export1');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (27, '11', '2', 0x31, '0', 'admin', '2022-12-15 11:54:05', '', NULL, NULL);
INSERT INTO `sys_notice` VALUES (28, '1', '1', 0x31, '0', 'admin', '2022-12-15 11:54:09', '', NULL, NULL);
INSERT INTO `sys_notice` VALUES (29, '1', '2', 0x31, '0', 'admin', '2022-12-15 11:54:14', '', NULL, NULL);
INSERT INTO `sys_notice` VALUES (30, '1', '2', 0x31, '0', 'admin', '2022-12-15 11:54:18', '', NULL, NULL);
INSERT INTO `sys_notice` VALUES (31, '1', '2', 0x31, '0', 'admin', '2022-12-15 11:54:24', '', NULL, NULL);
INSERT INTO `sys_notice` VALUES (32, '22', '1', 0x3232, '0', 'admin', '2022-12-15 11:54:30', '', NULL, NULL);
INSERT INTO `sys_notice` VALUES (33, '22', '2', 0x3232, '0', 'admin', '2022-12-15 11:54:35', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2022-11-21 18:05:23', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'cto', '技术总监', 3, '0', 'admin', '2022-12-16 16:14:58', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (4, 'clientMainProgramer', '前端主程', 5, '0', 'admin', '2022-12-16 16:15:42', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (5, 'serverMainProgrammer', '后端主程', 4, '0', 'admin', '2022-12-16 16:16:05', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (6, 'clientProgrammer', '前端程序', 0, '0', 'admin', '2022-12-16 16:16:50', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (7, 'serverProgrammer', '后端程序', 0, '0', 'admin', '2022-12-16 16:17:33', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (8, 'artDirector', '美术总监', 0, '0', 'admin', '2022-12-16 16:18:22', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (9, 'leadDesigner', '主策划', 0, '0', 'admin', '2022-12-16 16:18:58', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (10, 'designer', '策划', 0, '0', 'admin', '2022-12-16 16:19:23', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (11, 'tester', '测试', 0, '0', 'admin', '2022-12-16 16:19:55', '', NULL, NULL);
INSERT INTO `sys_post` VALUES (12, 'arter', '美术', 0, '0', 'admin', '2022-12-16 16:20:11', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-11-21 18:05:23', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2022-11-21 18:05:23', '', NULL, '普通角色');
INSERT INTO `sys_role` VALUES (101, 'test', 'test', 4, '1', 1, 1, '0', '2', 'admin', '2022-11-21 19:36:51', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (104, '策划', 'cehua', 0, '1', 1, 1, '0', '0', 'admin', '2022-12-12 16:35:05', 'admin', '2023-01-29 19:28:36', NULL);
INSERT INTO `sys_role` VALUES (105, '系统开发', 'program', 0, '1', 1, 1, '0', '0', 'admin', '2022-12-16 16:47:52', 'admin', '2023-02-01 10:21:20', NULL);
INSERT INTO `sys_role` VALUES (106, '测试', 'ceshi', 4, '1', 1, 1, '0', '0', 'admin', '2023-01-09 14:43:57', 'admin', '2023-02-01 19:33:23', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (104, 1065);
INSERT INTO `sys_role_menu` VALUES (104, 1066);
INSERT INTO `sys_role_menu` VALUES (104, 1067);
INSERT INTO `sys_role_menu` VALUES (104, 1068);
INSERT INTO `sys_role_menu` VALUES (104, 1069);
INSERT INTO `sys_role_menu` VALUES (104, 1070);
INSERT INTO `sys_role_menu` VALUES (104, 1071);
INSERT INTO `sys_role_menu` VALUES (104, 1072);
INSERT INTO `sys_role_menu` VALUES (104, 1073);
INSERT INTO `sys_role_menu` VALUES (104, 1074);
INSERT INTO `sys_role_menu` VALUES (104, 1077);
INSERT INTO `sys_role_menu` VALUES (104, 1078);
INSERT INTO `sys_role_menu` VALUES (104, 1079);
INSERT INTO `sys_role_menu` VALUES (104, 1080);
INSERT INTO `sys_role_menu` VALUES (104, 1082);
INSERT INTO `sys_role_menu` VALUES (104, 1086);
INSERT INTO `sys_role_menu` VALUES (104, 1087);
INSERT INTO `sys_role_menu` VALUES (104, 1088);
INSERT INTO `sys_role_menu` VALUES (105, 1);
INSERT INTO `sys_role_menu` VALUES (105, 2);
INSERT INTO `sys_role_menu` VALUES (105, 3);
INSERT INTO `sys_role_menu` VALUES (105, 100);
INSERT INTO `sys_role_menu` VALUES (105, 101);
INSERT INTO `sys_role_menu` VALUES (105, 102);
INSERT INTO `sys_role_menu` VALUES (105, 103);
INSERT INTO `sys_role_menu` VALUES (105, 104);
INSERT INTO `sys_role_menu` VALUES (105, 105);
INSERT INTO `sys_role_menu` VALUES (105, 106);
INSERT INTO `sys_role_menu` VALUES (105, 107);
INSERT INTO `sys_role_menu` VALUES (105, 108);
INSERT INTO `sys_role_menu` VALUES (105, 109);
INSERT INTO `sys_role_menu` VALUES (105, 110);
INSERT INTO `sys_role_menu` VALUES (105, 111);
INSERT INTO `sys_role_menu` VALUES (105, 112);
INSERT INTO `sys_role_menu` VALUES (105, 113);
INSERT INTO `sys_role_menu` VALUES (105, 114);
INSERT INTO `sys_role_menu` VALUES (105, 115);
INSERT INTO `sys_role_menu` VALUES (105, 116);
INSERT INTO `sys_role_menu` VALUES (105, 117);
INSERT INTO `sys_role_menu` VALUES (105, 500);
INSERT INTO `sys_role_menu` VALUES (105, 501);
INSERT INTO `sys_role_menu` VALUES (105, 1000);
INSERT INTO `sys_role_menu` VALUES (105, 1001);
INSERT INTO `sys_role_menu` VALUES (105, 1002);
INSERT INTO `sys_role_menu` VALUES (105, 1003);
INSERT INTO `sys_role_menu` VALUES (105, 1004);
INSERT INTO `sys_role_menu` VALUES (105, 1005);
INSERT INTO `sys_role_menu` VALUES (105, 1006);
INSERT INTO `sys_role_menu` VALUES (105, 1007);
INSERT INTO `sys_role_menu` VALUES (105, 1008);
INSERT INTO `sys_role_menu` VALUES (105, 1009);
INSERT INTO `sys_role_menu` VALUES (105, 1010);
INSERT INTO `sys_role_menu` VALUES (105, 1011);
INSERT INTO `sys_role_menu` VALUES (105, 1012);
INSERT INTO `sys_role_menu` VALUES (105, 1013);
INSERT INTO `sys_role_menu` VALUES (105, 1014);
INSERT INTO `sys_role_menu` VALUES (105, 1015);
INSERT INTO `sys_role_menu` VALUES (105, 1016);
INSERT INTO `sys_role_menu` VALUES (105, 1017);
INSERT INTO `sys_role_menu` VALUES (105, 1018);
INSERT INTO `sys_role_menu` VALUES (105, 1019);
INSERT INTO `sys_role_menu` VALUES (105, 1020);
INSERT INTO `sys_role_menu` VALUES (105, 1021);
INSERT INTO `sys_role_menu` VALUES (105, 1022);
INSERT INTO `sys_role_menu` VALUES (105, 1023);
INSERT INTO `sys_role_menu` VALUES (105, 1024);
INSERT INTO `sys_role_menu` VALUES (105, 1025);
INSERT INTO `sys_role_menu` VALUES (105, 1026);
INSERT INTO `sys_role_menu` VALUES (105, 1027);
INSERT INTO `sys_role_menu` VALUES (105, 1028);
INSERT INTO `sys_role_menu` VALUES (105, 1029);
INSERT INTO `sys_role_menu` VALUES (105, 1030);
INSERT INTO `sys_role_menu` VALUES (105, 1031);
INSERT INTO `sys_role_menu` VALUES (105, 1032);
INSERT INTO `sys_role_menu` VALUES (105, 1033);
INSERT INTO `sys_role_menu` VALUES (105, 1034);
INSERT INTO `sys_role_menu` VALUES (105, 1035);
INSERT INTO `sys_role_menu` VALUES (105, 1036);
INSERT INTO `sys_role_menu` VALUES (105, 1037);
INSERT INTO `sys_role_menu` VALUES (105, 1038);
INSERT INTO `sys_role_menu` VALUES (105, 1039);
INSERT INTO `sys_role_menu` VALUES (105, 1040);
INSERT INTO `sys_role_menu` VALUES (105, 1041);
INSERT INTO `sys_role_menu` VALUES (105, 1042);
INSERT INTO `sys_role_menu` VALUES (105, 1043);
INSERT INTO `sys_role_menu` VALUES (105, 1044);
INSERT INTO `sys_role_menu` VALUES (105, 1045);
INSERT INTO `sys_role_menu` VALUES (105, 1046);
INSERT INTO `sys_role_menu` VALUES (105, 1047);
INSERT INTO `sys_role_menu` VALUES (105, 1048);
INSERT INTO `sys_role_menu` VALUES (105, 1049);
INSERT INTO `sys_role_menu` VALUES (105, 1050);
INSERT INTO `sys_role_menu` VALUES (105, 1051);
INSERT INTO `sys_role_menu` VALUES (105, 1052);
INSERT INTO `sys_role_menu` VALUES (105, 1053);
INSERT INTO `sys_role_menu` VALUES (105, 1054);
INSERT INTO `sys_role_menu` VALUES (105, 1055);
INSERT INTO `sys_role_menu` VALUES (105, 1056);
INSERT INTO `sys_role_menu` VALUES (105, 1057);
INSERT INTO `sys_role_menu` VALUES (105, 1058);
INSERT INTO `sys_role_menu` VALUES (105, 1059);
INSERT INTO `sys_role_menu` VALUES (105, 1065);
INSERT INTO `sys_role_menu` VALUES (105, 1066);
INSERT INTO `sys_role_menu` VALUES (105, 1067);
INSERT INTO `sys_role_menu` VALUES (105, 1068);
INSERT INTO `sys_role_menu` VALUES (105, 1069);
INSERT INTO `sys_role_menu` VALUES (105, 1070);
INSERT INTO `sys_role_menu` VALUES (105, 1071);
INSERT INTO `sys_role_menu` VALUES (105, 1072);
INSERT INTO `sys_role_menu` VALUES (105, 1073);
INSERT INTO `sys_role_menu` VALUES (105, 1074);
INSERT INTO `sys_role_menu` VALUES (105, 1077);
INSERT INTO `sys_role_menu` VALUES (105, 1078);
INSERT INTO `sys_role_menu` VALUES (105, 1079);
INSERT INTO `sys_role_menu` VALUES (105, 1080);
INSERT INTO `sys_role_menu` VALUES (105, 1081);
INSERT INTO `sys_role_menu` VALUES (105, 1082);
INSERT INTO `sys_role_menu` VALUES (105, 1083);
INSERT INTO `sys_role_menu` VALUES (105, 1084);
INSERT INTO `sys_role_menu` VALUES (105, 1085);
INSERT INTO `sys_role_menu` VALUES (105, 1086);
INSERT INTO `sys_role_menu` VALUES (105, 1087);
INSERT INTO `sys_role_menu` VALUES (105, 1088);
INSERT INTO `sys_role_menu` VALUES (105, 1089);
INSERT INTO `sys_role_menu` VALUES (105, 1090);
INSERT INTO `sys_role_menu` VALUES (105, 1091);
INSERT INTO `sys_role_menu` VALUES (105, 1092);
INSERT INTO `sys_role_menu` VALUES (105, 1093);
INSERT INTO `sys_role_menu` VALUES (105, 1094);
INSERT INTO `sys_role_menu` VALUES (105, 1095);
INSERT INTO `sys_role_menu` VALUES (105, 1096);
INSERT INTO `sys_role_menu` VALUES (105, 1097);
INSERT INTO `sys_role_menu` VALUES (105, 1098);
INSERT INTO `sys_role_menu` VALUES (105, 1099);
INSERT INTO `sys_role_menu` VALUES (105, 1100);
INSERT INTO `sys_role_menu` VALUES (105, 1101);
INSERT INTO `sys_role_menu` VALUES (105, 1102);
INSERT INTO `sys_role_menu` VALUES (105, 1103);
INSERT INTO `sys_role_menu` VALUES (105, 1104);
INSERT INTO `sys_role_menu` VALUES (105, 1105);
INSERT INTO `sys_role_menu` VALUES (105, 1106);
INSERT INTO `sys_role_menu` VALUES (105, 1107);
INSERT INTO `sys_role_menu` VALUES (105, 1108);
INSERT INTO `sys_role_menu` VALUES (105, 1109);
INSERT INTO `sys_role_menu` VALUES (105, 1110);
INSERT INTO `sys_role_menu` VALUES (105, 1111);
INSERT INTO `sys_role_menu` VALUES (105, 1112);
INSERT INTO `sys_role_menu` VALUES (105, 1113);
INSERT INTO `sys_role_menu` VALUES (105, 1114);
INSERT INTO `sys_role_menu` VALUES (105, 1115);
INSERT INTO `sys_role_menu` VALUES (105, 1116);
INSERT INTO `sys_role_menu` VALUES (105, 1117);
INSERT INTO `sys_role_menu` VALUES (105, 1118);
INSERT INTO `sys_role_menu` VALUES (105, 1119);
INSERT INTO `sys_role_menu` VALUES (105, 1120);
INSERT INTO `sys_role_menu` VALUES (105, 1121);
INSERT INTO `sys_role_menu` VALUES (105, 1122);
INSERT INTO `sys_role_menu` VALUES (105, 1123);
INSERT INTO `sys_role_menu` VALUES (105, 1124);
INSERT INTO `sys_role_menu` VALUES (105, 1125);
INSERT INTO `sys_role_menu` VALUES (105, 1126);
INSERT INTO `sys_role_menu` VALUES (105, 1127);
INSERT INTO `sys_role_menu` VALUES (105, 1128);
INSERT INTO `sys_role_menu` VALUES (105, 1129);
INSERT INTO `sys_role_menu` VALUES (105, 1130);
INSERT INTO `sys_role_menu` VALUES (105, 1131);
INSERT INTO `sys_role_menu` VALUES (106, 1065);
INSERT INTO `sys_role_menu` VALUES (106, 1066);
INSERT INTO `sys_role_menu` VALUES (106, 1067);
INSERT INTO `sys_role_menu` VALUES (106, 1068);
INSERT INTO `sys_role_menu` VALUES (106, 1069);
INSERT INTO `sys_role_menu` VALUES (106, 1070);
INSERT INTO `sys_role_menu` VALUES (106, 1071);
INSERT INTO `sys_role_menu` VALUES (106, 1072);
INSERT INTO `sys_role_menu` VALUES (106, 1073);
INSERT INTO `sys_role_menu` VALUES (106, 1074);
INSERT INTO `sys_role_menu` VALUES (106, 1077);
INSERT INTO `sys_role_menu` VALUES (106, 1078);
INSERT INTO `sys_role_menu` VALUES (106, 1079);
INSERT INTO `sys_role_menu` VALUES (106, 1080);
INSERT INTO `sys_role_menu` VALUES (106, 1083);
INSERT INTO `sys_role_menu` VALUES (106, 1084);
INSERT INTO `sys_role_menu` VALUES (106, 1086);
INSERT INTO `sys_role_menu` VALUES (106, 1087);
INSERT INTO `sys_role_menu` VALUES (106, 1088);
INSERT INTO `sys_role_menu` VALUES (106, 1096);
INSERT INTO `sys_role_menu` VALUES (106, 1101);
INSERT INTO `sys_role_menu` VALUES (106, 1103);
INSERT INTO `sys_role_menu` VALUES (106, 1107);
INSERT INTO `sys_role_menu` VALUES (106, 1110);
INSERT INTO `sys_role_menu` VALUES (106, 1113);
INSERT INTO `sys_role_menu` VALUES (106, 1117);
INSERT INTO `sys_role_menu` VALUES (106, 1119);
INSERT INTO `sys_role_menu` VALUES (106, 1124);
INSERT INTO `sys_role_menu` VALUES (106, 1126);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'test', '1', '00', '111111@163.com', '', '1', '/profile/avatar/2023/02/07/blob_20230207153050A001.jpeg', '$2a$10$k8XINbFjYVM2x1MsrnGaieraJTvrthJCrDEx6ouUYLuhmvwlMhw0i', '0', '0', '127.0.0.1', '2023-02-09 11:07:09', 'admin', '2022-11-21 18:05:23', '', '2023-02-09 11:07:09', '管理员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (104, 10);
INSERT INTO `sys_user_post` VALUES (105, 9);
INSERT INTO `sys_user_post` VALUES (106, 10);
INSERT INTO `sys_user_post` VALUES (107, 1);
INSERT INTO `sys_user_post` VALUES (109, 10);
INSERT INTO `sys_user_post` VALUES (110, 11);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (100, 2);
INSERT INTO `sys_user_role` VALUES (104, 104);
INSERT INTO `sys_user_role` VALUES (105, 104);
INSERT INTO `sys_user_role` VALUES (106, 104);
INSERT INTO `sys_user_role` VALUES (106, 106);
INSERT INTO `sys_user_role` VALUES (107, 104);
INSERT INTO `sys_user_role` VALUES (107, 105);
INSERT INTO `sys_user_role` VALUES (108, 105);
INSERT INTO `sys_user_role` VALUES (109, 104);
INSERT INTO `sys_user_role` VALUES (110, 106);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL,
  `user_name` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_group` int(11) NULL DEFAULT NULL,
  `user_title` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `log_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `INDEX_user_id`(`id`) USING BTREE,
  INDEX `INDEX_user_user_name`(`user_name`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'a66abb5684c45962d887564f08346e8d', 1, '管理员', '2023-02-20 16:38:21');

-- ----------------------------
-- Table structure for yf_game
-- ----------------------------
DROP TABLE IF EXISTS `yf_game`;
CREATE TABLE `yf_game`  (
  `gameId` bigint(20) NOT NULL,
  `gameName` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏名称',
  `gameRemark` varchar(190) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游戏备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `log_update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`gameId`) USING BTREE,
  UNIQUE INDEX `gameId`(`gameId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '游戏表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of yf_game
-- ----------------------------
INSERT INTO `yf_game` VALUES (10001, '侠客梦', '', '2022-12-09 12:08:42', '2023-01-31 10:35:28');
INSERT INTO `yf_game` VALUES (10002, '西游', NULL, '2022-12-09 19:21:05', '2022-12-09 11:21:05');

SET FOREIGN_KEY_CHECKS = 1;
