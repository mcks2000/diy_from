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

 Date: 26/05/2023 15:26:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for diy_form_field
-- ----------------------------
DROP TABLE IF EXISTS `diy_form_field`;
CREATE TABLE `diy_form_field` (
  `id` int NOT NULL COMMENT 'id',
  `form_id` bigint NOT NULL COMMENT '表单表id',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '是否删除',
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '字段名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='表单字段表（记录某张表单中有哪些字段）';

-- ----------------------------
-- Records of diy_form_field
-- ----------------------------
BEGIN;
INSERT INTO `diy_form_field` (`id`, `form_id`, `is_delete`, `field`) VALUES (1, 1, 0, 'documentType');
INSERT INTO `diy_form_field` (`id`, `form_id`, `is_delete`, `field`) VALUES (2, 2, 0, 'documentNo');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
