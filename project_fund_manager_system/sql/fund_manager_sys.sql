/*
 Navicat Premium Data Transfer

 Source Server         : ECS
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : fund_manager_sys

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 30/06/2020 20:44:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fund_cost
-- ----------------------------
DROP TABLE IF EXISTS `fund_cost`;
CREATE TABLE `fund_cost`  (
  `projectId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目编号',
  `projectBudget` double(32, 0) DEFAULT NULL COMMENT '预算额度',
  `projectBalance` double(32, 0) DEFAULT NULL COMMENT '项目余额',
  `projectTotalAmount` double(32, 0) DEFAULT NULL COMMENT '已用额度',
  `tempBanlance` double(32, 0) DEFAULT NULL COMMENT '缓冲余额，用于经费审核',
  `thisYear` int(4) DEFAULT NULL COMMENT '创建年份',
  `whereBalance` int(1) DEFAULT NULL COMMENT '是否计入资产 1计入  500不计入',
  PRIMARY KEY (`projectId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fund_detail
-- ----------------------------
DROP TABLE IF EXISTS `fund_detail`;
CREATE TABLE `fund_detail`  (
  `projectId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目编号',
  `fundId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '科目编号',
  `fundName` int(1) DEFAULT NULL COMMENT '科目名称',
  `fundDesc` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '科目摘要',
  `fundAmountOut` double(255, 0) UNSIGNED DEFAULT NULL COMMENT '项目支出',
  `fundAmountIn` double(255, 0) UNSIGNED DEFAULT 0 COMMENT '项目收入',
  `fundBalance` double(255, 0) UNSIGNED DEFAULT 0 COMMENT '项目余额',
  `commitMain` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '提交人',
  `commitUserId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '提交人编号',
  `commitTime` datetime(0) DEFAULT NULL COMMENT '提交时间',
  `futureTime` date DEFAULT NULL COMMENT '预计使用时间',
  `fundStatus` int(1) DEFAULT NULL COMMENT '科目申请状态',
  `fundInOrOut` int(1) DEFAULT NULL COMMENT '科目收支状态',
  `askStatus` int(1) DEFAULT NULL COMMENT '申请状态   ',
  `fundType` int(1) DEFAULT NULL COMMENT '经费性质',
  `toDoMark` int(1) UNSIGNED DEFAULT 0 COMMENT '待办标识',
  PRIMARY KEY (`fundId`, `projectId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fund_person
-- ----------------------------
DROP TABLE IF EXISTS `fund_person`;
CREATE TABLE `fund_person`  (
  `projectId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目编号',
  `projectGroup` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '项目成员',
  `groupName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '成员名字',
  PRIMARY KEY (`projectId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fund_project
-- ----------------------------
DROP TABLE IF EXISTS `fund_project`;
CREATE TABLE `fund_project`  (
  `projectId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目编号',
  `projectName` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目名称',
  `projectStatus` int(2) DEFAULT NULL COMMENT '项目状态',
  `projectType` int(1) DEFAULT NULL COMMENT '项目性质  0个人  1团队',
  `projectMain` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '负责人',
  `userId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '负责人id',
  `applicatType` int(2) DEFAULT NULL COMMENT '申请状态',
  `createTime` datetime(0) DEFAULT NULL COMMENT '申请时间',
  `toDoMark` int(1) DEFAULT NULL COMMENT '待办标识',
  PRIMARY KEY (`projectId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fund_relat
-- ----------------------------
DROP TABLE IF EXISTS `fund_relat`;
CREATE TABLE `fund_relat`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户编号',
  `projectId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '项目编号',
  `relatStatus` int(1) DEFAULT NULL COMMENT '关联状态  0自有   1共有',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 147 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for redis_conf
-- ----------------------------
DROP TABLE IF EXISTS `redis_conf`;
CREATE TABLE `redis_conf`  (
  `id` int(11) NOT NULL COMMENT '主键自增',
  `rkey` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'redis  键   系统运行必须参数',
  `rvalue` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'redis  值   系统运行必须参数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `userId` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户号    职工编号  学生号',
  `userName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `userPwd` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户密码',
  `userStatus` int(1) DEFAULT NULL COMMENT '用户状态  0 已停用   1 待通过   2 已通过 ',
  `userMark` int(1) DEFAULT NULL COMMENT '用户标识  0 职工编号  1 学生号',
  `userMail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户邮箱',
  `roles` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '角色  [\'admin\']      [\'editor\']',
  `createTime` datetime(0) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yearTab
-- ----------------------------
DROP TABLE IF EXISTS `yearTab`;
CREATE TABLE `yearTab`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thisYear` int(4) DEFAULT NULL,
  `allBalance` double(255, 0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;
INSERT INTO `user` VALUES (1, 'admin', '超级管理员', '3Nwr8SbLHcQ=', 2, 0, '', '[\'admin\']', NOW());
SET FOREIGN_KEY_CHECKS = 1;
