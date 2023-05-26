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

 Date: 26/05/2023 15:25:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for diy_form
-- ----------------------------
DROP TABLE IF EXISTS `diy_form`;
CREATE TABLE `diy_form` (
  `id` bigint NOT NULL COMMENT 'id',
  `form_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '模板类型，比如新闻模板，注册模板，登记模板',
  `field_id` bigint DEFAULT NULL COMMENT '表单 id',
  `field_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表单字段标题',
  `field_tip` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文字提示',
  `required` tinyint DEFAULT '0' COMMENT '是否必填，0：非必填，1：必填',
  `sort_index` int DEFAULT NULL COMMENT '排列顺序',
  `validate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '校验类型',
  `language_json` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '语言json',
  `data_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '数据类型，前端使用',
  `input_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '前端输入框类型text,select,button,upload等input输入类型',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='表单表（记录用户自定义的表单）\n';

-- ----------------------------
-- Records of diy_form
-- ----------------------------
BEGIN;
INSERT INTO `diy_form` (`id`, `form_type`, `field_id`, `field_title`, `field_tip`, `required`, `sort_index`, `validate`, `language_json`, `data_type`, `input_type`, `is_delete`) VALUES (1, 'user_register', 1, '证件类型', '请选择证件类型', 0, 2, '{\"type\":\"maxLen\",\"val\":\"5\",\"errMsg\":\"不能超过30个字\"}', '{\"en\":{\"fieldTitle\":\"ID Type\", \"fieldTip\":\"Select the ID type\"}, \"zh\":{\"fieldTitle\":\"证件类型\", \"fieldTip\":\"请选择证件类型\"}}', 'text', 'select', 0);
INSERT INTO `diy_form` (`id`, `form_type`, `field_id`, `field_title`, `field_tip`, `required`, `sort_index`, `validate`, `language_json`, `data_type`, `input_type`, `is_delete`) VALUES (2, 'user_register', 2, '证件号码', '请输入证件号码', 0, 3, '{\"type\":\"range\",\"val\":\"10-18\",\"errMsg\":\"联系电话应为10-18位数\"}', '{\"en\":{\"fieldTitle\":\"ID Number\", \"fieldTip\":\"Please enter your ID number\"}, \"zh\":{\"fieldTitle\":\"证件号码\", \"fieldTip\":\"请输入证件号码\"}}', 'number', 'input', 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
