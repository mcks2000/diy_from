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

 Date: 26/05/2023 15:25:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for diy_form_data
-- ----------------------------
DROP TABLE IF EXISTS `diy_form_data`;
CREATE TABLE `diy_form_data` (
  `id` bigint NOT NULL COMMENT '表单数据表id',
  `form_id` bigint NOT NULL COMMENT '表单表id',
  `field_id` bigint NOT NULL COMMENT '表单字段表id',
  `entity_id` bigint NOT NULL COMMENT '表单实例表id',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='表单数据表（记录某张表单在某条实例下，哪些字段对应的数据）';

-- ----------------------------
-- Records of diy_form_data
-- ----------------------------
BEGIN;
INSERT INTO `diy_form_data` (`id`, `form_id`, `field_id`, `entity_id`, `content`, `created_at`, `updated_at`, `is_delete`) VALUES (1, 1, 1, 1, '身份证', NULL, NULL, 0);
INSERT INTO `diy_form_data` (`id`, `form_id`, `field_id`, `entity_id`, `content`, `created_at`, `updated_at`, `is_delete`) VALUES (22, 2, 2, 1, '1213212312313', NULL, NULL, 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
