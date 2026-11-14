/*
 Navicat Premium Data Transfer

 Source Server         : 阴阳界
 Source Server Type    : MySQL
 Source Server Version : 50650
 Source Host           : localhost:3306
 Source Schema         : xkm_cab_charge

 Target Server Type    : MySQL
 Target Server Version : 50650
 File Encoding         : 65001

 Date: 20/02/2023 16:11:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
  `openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `entertimecost` int(11) NULL DEFAULT NULL,
  `yuanbao` int(11) NULL DEFAULT NULL,
  `stagewidth` int(11) NULL DEFAULT NULL,
  `stageheight` int(11) NULL DEFAULT NULL,
  `viplevel` int(11) NULL DEFAULT NULL,
  `useragent` varchar(350) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `other` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
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
