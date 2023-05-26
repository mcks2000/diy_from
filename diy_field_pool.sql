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

 Date: 26/05/2023 15:25:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for diy_field_pool
-- ----------------------------
DROP TABLE IF EXISTS `diy_field_pool`;
CREATE TABLE `diy_field_pool` (
  `id` bigint NOT NULL COMMENT 'id',
  `field_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '字段名称',
  `field_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表单字段标题',
  `field_tip` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '文字提示',
  `data_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '数据类型，前端使用',
  `input_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '前端输入框类型text,select,button,upload等input输入类型',
  `validate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '校验类型',
  `language_json` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '语言json',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `is_delete` tinyint(1) DEFAULT NULL COMMENT '是否删除(0：否，1：是)',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='字段池（我们定义好的字段类型）\n';

-- ----------------------------
-- Records of diy_field_pool
-- ----------------------------
BEGIN;
INSERT INTO `diy_field_pool` (`id`, `field_name`, `field_title`, `field_tip`, `data_type`, `input_type`, `validate`, `language_json`, `created_at`, `updated_at`, `is_delete`, `remark`) VALUES (1, 'documentType', '证件类型', '请选择证件类型', 'number', 'select', NULL, '{\"en\":{\"fieldTitle\":\"ID Type\", \"fieldTip\":\"Select the ID type\"}, \"zh\":{\"fieldTitle\":\"证件类型\", \"fieldTip\":\"请选择证件类型\"}}', '2022-08-16 15:41:31', '2022-08-16 15:41:31', 0, '默认配置');
INSERT INTO `diy_field_pool` (`id`, `field_name`, `field_title`, `field_tip`, `data_type`, `input_type`, `validate`, `language_json`, `created_at`, `updated_at`, `is_delete`, `remark`) VALUES (2, 'documentNo', '证件号码', '请输入证件号码', 'number', 'input', '{\"type\":\"range\",\"val\":\"10-18\",\"errMsg\":\"联系电话应为10-18位数\"}', '{\"en\":{\"fieldTitle\":\"ID Number\", \"fieldTip\":\"Please enter your ID number\"}, \"zh\":{\"fieldTitle\":\"证件号码\", \"fieldTip\":\"请输入证件号码\"}}', '2022-08-16 15:41:31', '2022-08-16 15:41:31', 0, '默认配置');
INSERT INTO `diy_field_pool` (`id`, `field_name`, `field_title`, `field_tip`, `data_type`, `input_type`, `validate`, `language_json`, `created_at`, `updated_at`, `is_delete`, `remark`) VALUES (3, 'realName', '真实姓名', '请输入真实姓名', 'text', 'input', NULL, '{\"en\":{\"fieldTitle\":\"realName\", \"fieldTip\":\"Please enter your real name\"}, \"zh\":{\"fieldTitle\":\"姓名\", \"fieldTip\":\"请输入真实姓名\"}}', '2022-08-16 15:41:31', '2022-08-16 15:41:31', 0, '默认配置');
INSERT INTO `diy_field_pool` (`id`, `field_name`, `field_title`, `field_tip`, `data_type`, `input_type`, `validate`, `language_json`, `created_at`, `updated_at`, `is_delete`, `remark`) VALUES (4, 'sex', '性别', '请选择性别', 'number', 'single', NULL, '{\"en\":{\"fieldTitle\":\"Gender\", \"fieldTip\":\"Please select your gender\"}, \"zh\":{\"fieldTitle\":\"性别\", \"fieldTip\":\"请选择性别\"}}', '2022-08-16 15:41:31', '2022-08-16 15:41:31', 0, '默认配置');
INSERT INTO `diy_field_pool` (`id`, `field_name`, `field_title`, `field_tip`, `data_type`, `input_type`, `validate`, `language_json`, `created_at`, `updated_at`, `is_delete`, `remark`) VALUES (5, 'mobile', '手机号码', '请输入手机号码', 'number', 'input', '{\"type\":\"pattern\",\"val\":\"/^1(3[0-9]|4[01456879]|5[0-35-9]|6[2567]|7[0-8]|8[0-9]|9[0-35-9])\\d{8}$/\",\"errMsg\":\"请输入正确的联系电话\"}', '{\"en\":{\"fieldTitle\":\"Phone Number\", \"fieldTip\":\"Please enter phone number\"}, \"zh\":{\"fieldTitle\":\"手机号码\", \"fieldTip\":\"请输入手机号码\"}}', '2022-08-16 15:41:31', '2022-08-16 15:41:31', 0, '默认配置');
INSERT INTO `diy_field_pool` (`id`, `field_name`, `field_title`, `field_tip`, `data_type`, `input_type`, `validate`, `language_json`, `created_at`, `updated_at`, `is_delete`, `remark`) VALUES (6, 'email', '邮箱', '请输入邮箱', 'text', 'input', '{\"type\":\"pattern\",\"val\":\"/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$/\",\"errMsg\":\"请输入正确的电子邮箱\"}', '{\"en\":{\"fieldTitle\":\"Email\", \"fieldTip\":\"Please enter valid email address\"}, \"zh\":{\"fieldTitle\":\"邮箱\", \"fieldTip\":\"请输入邮箱\"}}', '2022-08-16 15:41:31', '2022-08-16 15:41:31', 0, '默认配置');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
