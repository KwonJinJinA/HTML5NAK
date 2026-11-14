/*
 Navicat Premium Data Transfer

 Source Server         : 阴阳界
 Source Server Type    : MySQL
 Source Server Version : 50650
 Source Host           : localhost:3306
 Source Schema         : xkm_cab_recharge

 Target Server Type    : MySQL
 Target Server Version : 50650
 File Encoding         : 65001

 Date: 20/02/2023 16:11:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for charge
-- ----------------------------
DROP TABLE IF EXISTS `charge`;
CREATE TABLE `charge`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `server_id` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '服务器ID',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `order_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单玩家IP',
  `amount` float NULL DEFAULT NULL COMMENT '金额',
  `charge_yb` int(16) NULL DEFAULT 0 COMMENT '充值元宝数',
  `gift_yb` int(11) NULL DEFAULT 0 COMMENT '赠送元宝数',
  `currency` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '币种',
  `result` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理结果 1成功 -1失败 各种原因',
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `platform` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '平台',
  `order_time` datetime NULL DEFAULT NULL,
  `content` varchar(8192) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '充值请求全文',
  `log_time` datetime NOT NULL COMMENT '入库时间'
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of charge
-- ----------------------------

-- ----------------------------
-- Table structure for loading_step
-- ----------------------------
DROP TABLE IF EXISTS `loading_step`;
CREATE TABLE `loading_step`  (
  `id` bigint(20) NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `platform` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `step0` smallint(4) NULL DEFAULT 0,
  `step1` smallint(4) NULL DEFAULT 0,
  `step1B` smallint(4) NULL DEFAULT 0,
  `step1C` smallint(4) NULL DEFAULT 0,
  `step1A` smallint(4) NULL DEFAULT 0,
  `step2` smallint(4) NULL DEFAULT 0,
  `step3` smallint(4) NULL DEFAULT 0,
  `step4` smallint(4) NULL DEFAULT 0,
  `step5` smallint(4) NULL DEFAULT 0,
  `step6` smallint(4) NULL DEFAULT 0,
  `step7` smallint(4) NULL DEFAULT 0,
  `step8` smallint(4) NULL DEFAULT 0,
  `step9` smallint(4) NULL DEFAULT 0,
  `step10` smallint(4) NULL DEFAULT 0,
  `step11` smallint(4) NULL DEFAULT 0,
  `step12` smallint(4) NULL DEFAULT 0,
  `step13` smallint(4) NULL DEFAULT 0,
  `step14` smallint(4) NULL DEFAULT 0,
  `step15` smallint(4) NULL DEFAULT 0,
  `step16` smallint(4) NULL DEFAULT NULL,
  `step17` smallint(4) NULL DEFAULT NULL,
  `step18` smallint(4) NULL DEFAULT NULL,
  `step19` smallint(4) NULL DEFAULT NULL,
  `step20` smallint(4) NULL DEFAULT NULL,
  `step21` smallint(4) NULL DEFAULT NULL,
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `entertimecost` int(11) NULL DEFAULT NULL,
  `yuanbao` int(11) NULL DEFAULT NULL,
  `stagewidth` int(11) NULL DEFAULT NULL,
  `stageheight` int(11) NULL DEFAULT NULL,
  `viplevel` int(11) NULL DEFAULT NULL,
  `useragent` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `other` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `inserttime` datetime NULL DEFAULT NULL,
  `isnewrole` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rolelevel` int(11) NULL DEFAULT NULL,
  `rendermode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roleguid` bigint(20) NULL DEFAULT NULL,
  `tongban` varchar(350) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of loading_step
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
