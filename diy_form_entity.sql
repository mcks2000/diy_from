/*
 Navicat Premium Data Transfer

 Source Server         : docker_local_8.0.32
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : localhost:3307
 Source Schema         : diy_form

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 26/05/2023 15:26:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for diy_form_entity
-- ----------------------------
DROP TABLE IF EXISTS `diy_form_entity`;
CREATE TABLE `diy_form_entity` (
  `id` int NOT NULL COMMENT 'id',
  `form_entity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '表单实例',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='表单实例表（记录某张表单中的某条数据实例）';

-- ----------------------------
-- Records of diy_form_entity
-- ----------------------------
BEGIN;
INSERT INTO `diy_form_entity` (`id`, `form_entity`) VALUES (1, '{\"documentType\":\"身份证\",\"documentNo\":\"1321321\"}');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
