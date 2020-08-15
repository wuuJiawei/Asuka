/*
 Navicat Premium Data Transfer

 Source Server         : docker@localhost@mysql8
 Source Server Type    : MySQL
 Source Server Version : 80021
 Source Host           : localhost:3306
 Source Schema         : db_asuka_bak

 Target Server Type    : MySQL
 Target Server Version : 80021
 File Encoding         : 65001

 Date: 15/08/2020 10:00:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 504832 kB; (`SCHED_NAME` `TRIGGER_NAME` `TRIGGE';

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CRON_EXPRESSION` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TIME_ZONE_ID` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 504832 kB; (`SCHED_NAME` `TRIGGER_NAME` `TRIGGE';

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ENTRY_ID` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `FIRED_TIME` bigint NOT NULL,
  `SCHED_TIME` bigint NOT NULL,
  `PRIORITY` int NOT NULL,
  `STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_DURABLE` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_NONCONCURRENT` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IS_UPDATE_DATA` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_jobs
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_jobs`;
CREATE TABLE `qrtz_jobs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `del_flag` int DEFAULT NULL COMMENT '删除状态',
  `update_by` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `job_class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '任务类名',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'cron表达式',
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parameter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '参数',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述',
  `status` int DEFAULT NULL COMMENT '状态 0正常 -1停止',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_jobs
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_jobs` VALUES (1, NULL, '2020-07-29 18:05:37', 0, NULL, '2020-07-29 18:34:32', 'QuartzTest', '0/3 * * * * ?', 'run', 'name=123123', '测试：带参Bean', 1);
INSERT INTO `qrtz_jobs` VALUES (2, NULL, '2020-07-29 18:37:02', 0, NULL, '2020-07-29 18:38:50', 'com.asuka.plugin.job.handler.SampleJob', '0/3 * * * * ?', 'execute', '', '测试：无参类', 1);
INSERT INTO `qrtz_jobs` VALUES (3, NULL, '2020-07-29 18:38:25', 0, NULL, '2020-08-01 11:00:46', 'com.asuka.plugin.job.handler.SampleParamJob', '0/5 * * * * ?', 'test', 'ads中文测试', '测试：带参类', 1);
COMMIT;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LOCK_NAME` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `INSTANCE_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `LAST_CHECKIN_TIME` bigint NOT NULL,
  `CHECKIN_INTERVAL` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `REPEAT_COUNT` bigint NOT NULL,
  `REPEAT_INTERVAL` bigint NOT NULL,
  `TIMES_TRIGGERED` bigint NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 504832 kB; (`SCHED_NAME` `TRIGGER_NAME` `TRIGGE';

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `STR_PROP_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `STR_PROP_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `STR_PROP_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `INT_PROP_1` int DEFAULT NULL,
  `INT_PROP_2` int DEFAULT NULL,
  `LONG_PROP_1` bigint DEFAULT NULL,
  `LONG_PROP_2` bigint DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 504832 kB; (`SCHED_NAME` `TRIGGER_NAME` `TRIGGE';

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOB_GROUP` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `DESCRIPTION` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint DEFAULT NULL,
  `PREV_FIRE_TIME` bigint DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TRIGGER_TYPE` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `START_TIME` bigint NOT NULL,
  `END_TIME` bigint DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `MISFIRE_INSTR` smallint DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 504832 kB; (`SCHED_NAME` `JOB_NAME` `JOB_GROUP`';

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary` (
  `dict_id` int NOT NULL AUTO_INCREMENT COMMENT '字典id',
  `dict_code` varchar(100) CHARACTER SET utf8mb4  NOT NULL COMMENT '字典标识',
  `dict_name` varchar(200) CHARACTER SET utf8mb4  NOT NULL COMMENT '字典名称',
  `sort_number` int NOT NULL DEFAULT '1' COMMENT '排序号',
  `comments` varchar(400) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '备注',
  `deleted` int NOT NULL DEFAULT '0' COMMENT '是否删除,0否,1是',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='字典';

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
BEGIN;
INSERT INTO `sys_dictionary` VALUES (1, 'sex', '性别', 1, '', 0, '2020-03-15 13:04:39', '2020-03-15 13:04:39');
INSERT INTO `sys_dictionary` VALUES (2, 'organization_type', '机构类型', 2, '', 0, '2020-03-16 00:32:36', '2020-03-16 00:32:36');
COMMIT;

-- ----------------------------
-- Table structure for sys_dictionary_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary_data`;
CREATE TABLE `sys_dictionary_data` (
  `dict_data_id` int NOT NULL AUTO_INCREMENT COMMENT '字典项id',
  `dict_id` int NOT NULL COMMENT '字典id',
  `dict_data_code` varchar(100) CHARACTER SET utf8mb4  NOT NULL COMMENT '字典项标识',
  `dict_data_name` varchar(200) CHARACTER SET utf8mb4  NOT NULL COMMENT '字典项名称',
  `sort_number` int NOT NULL DEFAULT '1' COMMENT '排序号',
  `comments` varchar(400) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '备注',
  `deleted` int NOT NULL DEFAULT '0' COMMENT '是否删除,0否,1是',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`dict_data_id`) USING BTREE,
  KEY `dict_id` (`dict_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='字典项';

-- ----------------------------
-- Records of sys_dictionary_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dictionary_data` VALUES (1, 1, 'male', '男', 1, '', 0, '2020-03-15 13:07:28', '2020-03-15 13:07:28');
INSERT INTO `sys_dictionary_data` VALUES (2, 1, 'female', '女', 2, '', 0, '2020-03-15 13:07:41', '2020-03-15 15:58:04');
INSERT INTO `sys_dictionary_data` VALUES (3, 2, 'company', '公司', 1, '', 0, '2020-03-16 00:34:32', '2020-03-16 00:34:32');
INSERT INTO `sys_dictionary_data` VALUES (4, 2, 'subsidiary', '子公司', 2, '', 0, '2020-03-16 00:35:02', '2020-03-16 00:35:02');
INSERT INTO `sys_dictionary_data` VALUES (5, 2, 'department', '部门', 3, '', 0, '2020-03-16 00:35:18', '2020-03-16 00:35:18');
INSERT INTO `sys_dictionary_data` VALUES (6, 2, 'group', '小组', 4, '', 0, '2020-03-16 00:35:36', '2020-03-16 00:35:36');
COMMIT;

-- ----------------------------
-- Table structure for sys_login_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_record`;
CREATE TABLE `sys_login_record` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) CHARACTER SET utf8mb4  NOT NULL COMMENT '用户账号',
  `os` varchar(200) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '操作系统',
  `device` varchar(200) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '设备名',
  `browser` varchar(200) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '浏览器类型',
  `ip` varchar(200) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT 'ip地址',
  `oper_type` int NOT NULL COMMENT '操作类型,0登录成功,1登录失败,2退出登录,3刷新token',
  `comments` text CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COMMENT='登录日志';

-- ----------------------------
-- Records of sys_login_record
-- ----------------------------
BEGIN;
INSERT INTO `sys_login_record` VALUES (1, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.56.1', 0, NULL, '2020-06-28 21:41:51', '2020-06-28 21:41:51');
INSERT INTO `sys_login_record` VALUES (2, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.56.1', 0, NULL, '2020-06-29 22:49:45', '2020-06-29 22:49:45');
INSERT INTO `sys_login_record` VALUES (3, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.56.1', 0, NULL, '2020-06-29 22:51:04', '2020-06-29 22:51:04');
INSERT INTO `sys_login_record` VALUES (4, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.56.1', 0, NULL, '2020-06-29 22:58:03', '2020-06-29 22:58:03');
INSERT INTO `sys_login_record` VALUES (5, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.56.1', 0, NULL, '2020-06-29 22:59:09', '2020-06-29 22:59:09');
INSERT INTO `sys_login_record` VALUES (6, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-07-04 21:11:47', '2020-07-04 21:11:47');
INSERT INTO `sys_login_record` VALUES (7, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-07-04 21:50:45', '2020-07-04 21:50:45');
INSERT INTO `sys_login_record` VALUES (8, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-07-05 10:20:53', '2020-07-05 10:20:53');
INSERT INTO `sys_login_record` VALUES (9, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-07-05 13:07:04', '2020-07-05 13:07:04');
INSERT INTO `sys_login_record` VALUES (10, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-07-05 15:17:33', '2020-07-05 15:17:33');
INSERT INTO `sys_login_record` VALUES (11, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-07-06 09:19:36', '2020-07-06 09:19:36');
INSERT INTO `sys_login_record` VALUES (12, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-07-06 14:20:18', '2020-07-06 14:20:18');
INSERT INTO `sys_login_record` VALUES (13, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-07-06 15:42:52', '2020-07-06 15:42:52');
INSERT INTO `sys_login_record` VALUES (14, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 1, '验证码错误', '2020-07-06 16:05:51', '2020-07-06 16:05:51');
INSERT INTO `sys_login_record` VALUES (15, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-07-06 16:06:11', '2020-07-06 16:06:11');
INSERT INTO `sys_login_record` VALUES (16, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-07-06 16:07:23', '2020-07-06 16:07:23');
INSERT INTO `sys_login_record` VALUES (17, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.56.1', 0, NULL, '2020-07-07 16:39:34', '2020-07-07 16:39:34');
INSERT INTO `sys_login_record` VALUES (18, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.56.1', 0, NULL, '2020-07-07 19:18:04', '2020-07-07 19:18:04');
INSERT INTO `sys_login_record` VALUES (19, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.56.1', 0, NULL, '2020-07-07 20:48:34', '2020-07-07 20:48:34');
INSERT INTO `sys_login_record` VALUES (20, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.56.1', 0, NULL, '2020-07-07 22:55:25', '2020-07-07 22:55:25');
INSERT INTO `sys_login_record` VALUES (21, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.56.1', 0, NULL, '2020-07-08 09:23:42', '2020-07-08 09:23:42');
INSERT INTO `sys_login_record` VALUES (22, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.56.1', 0, NULL, '2020-07-08 12:32:31', '2020-07-08 12:32:31');
INSERT INTO `sys_login_record` VALUES (23, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.56.1', 1, '验证码错误', '2020-07-08 17:59:41', '2020-07-08 17:59:41');
INSERT INTO `sys_login_record` VALUES (24, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.56.1', 0, NULL, '2020-07-08 17:59:52', '2020-07-08 17:59:52');
INSERT INTO `sys_login_record` VALUES (25, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.56.1', 0, NULL, '2020-07-10 12:54:17', '2020-07-10 12:54:17');
INSERT INTO `sys_login_record` VALUES (26, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.56.1', 0, NULL, '2020-07-10 14:08:10', '2020-07-10 14:08:10');
INSERT INTO `sys_login_record` VALUES (27, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.31.178', 0, NULL, '2020-07-11 21:46:59', '2020-07-11 21:46:59');
INSERT INTO `sys_login_record` VALUES (28, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '192.168.31.174', 0, NULL, '2020-07-11 21:48:12', '2020-07-11 21:48:12');
INSERT INTO `sys_login_record` VALUES (29, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.31.178', 0, NULL, '2020-07-12 10:34:26', '2020-07-12 10:34:26');
INSERT INTO `sys_login_record` VALUES (30, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.31.178', 1, 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 192.168.31.178:6379', '2020-07-12 10:34:27', '2020-07-12 10:34:27');
INSERT INTO `sys_login_record` VALUES (31, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '192.168.31.174', 0, NULL, '2020-07-12 10:36:31', '2020-07-12 10:36:31');
INSERT INTO `sys_login_record` VALUES (32, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '192.168.31.174', 0, NULL, '2020-07-12 11:11:01', '2020-07-12 11:11:01');
INSERT INTO `sys_login_record` VALUES (33, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '192.168.31.174', 1, '验证码错误', '2020-07-12 11:48:26', '2020-07-12 11:48:26');
INSERT INTO `sys_login_record` VALUES (34, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '192.168.31.174', 0, NULL, '2020-07-12 11:49:04', '2020-07-12 11:49:04');
INSERT INTO `sys_login_record` VALUES (35, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '192.168.31.174', 0, NULL, '2020-07-13 10:56:01', '2020-07-13 10:56:01');
INSERT INTO `sys_login_record` VALUES (36, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '192.168.31.174', 1, 'Unable to connect to Redis; nested exception is io.lettuce.core.RedisConnectionException: Unable to connect to 127.0.0.1:6379', '2020-07-13 10:56:01', '2020-07-13 10:56:01');
INSERT INTO `sys_login_record` VALUES (37, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '192.168.31.174', 0, NULL, '2020-07-13 10:59:57', '2020-07-13 10:59:57');
INSERT INTO `sys_login_record` VALUES (38, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '192.168.31.174', 1, '验证码错误', '2020-07-13 11:40:11', '2020-07-13 11:40:11');
INSERT INTO `sys_login_record` VALUES (39, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '192.168.31.174', 0, NULL, '2020-07-13 11:40:19', '2020-07-13 11:40:19');
INSERT INTO `sys_login_record` VALUES (40, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '192.168.31.174', 0, NULL, '2020-07-13 14:16:46', '2020-07-13 14:16:46');
INSERT INTO `sys_login_record` VALUES (41, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '192.168.31.174', 0, NULL, '2020-07-13 23:34:23', '2020-07-13 23:34:23');
INSERT INTO `sys_login_record` VALUES (42, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '192.168.31.174', 0, NULL, '2020-07-16 15:57:24', '2020-07-16 15:57:24');
INSERT INTO `sys_login_record` VALUES (43, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '192.168.31.174', 0, NULL, '2020-07-16 17:03:17', '2020-07-16 17:03:17');
INSERT INTO `sys_login_record` VALUES (44, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '192.168.31.174', 0, NULL, '2020-07-16 17:42:31', '2020-07-16 17:42:31');
INSERT INTO `sys_login_record` VALUES (45, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '192.168.31.174', 0, NULL, '2020-07-16 17:44:02', '2020-07-16 17:44:02');
INSERT INTO `sys_login_record` VALUES (46, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '192.168.31.174', 0, NULL, '2020-07-16 18:06:01', '2020-07-16 18:06:01');
INSERT INTO `sys_login_record` VALUES (47, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '192.168.31.174', 0, NULL, '2020-07-16 19:05:06', '2020-07-16 19:05:06');
INSERT INTO `sys_login_record` VALUES (48, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '192.168.31.174', 0, NULL, '2020-07-16 19:56:17', '2020-07-16 19:56:17');
INSERT INTO `sys_login_record` VALUES (49, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '192.168.31.174', 0, NULL, '2020-07-16 21:03:40', '2020-07-16 21:03:40');
INSERT INTO `sys_login_record` VALUES (50, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '192.168.31.174', 0, NULL, '2020-07-16 22:24:53', '2020-07-16 22:24:53');
INSERT INTO `sys_login_record` VALUES (51, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '192.168.31.174', 0, NULL, '2020-07-17 13:06:20', '2020-07-17 13:06:20');
INSERT INTO `sys_login_record` VALUES (52, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '192.168.31.174', 0, NULL, '2020-07-17 14:56:43', '2020-07-17 14:56:43');
INSERT INTO `sys_login_record` VALUES (53, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '192.168.31.174', 0, NULL, '2020-07-17 16:05:07', '2020-07-17 16:05:07');
INSERT INTO `sys_login_record` VALUES (54, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '192.168.31.174', 0, NULL, '2020-07-20 10:38:30', '2020-07-20 10:38:30');
INSERT INTO `sys_login_record` VALUES (55, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-07-20 14:35:44', '2020-07-20 14:35:44');
INSERT INTO `sys_login_record` VALUES (56, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-07-20 14:40:44', '2020-07-20 14:40:44');
INSERT INTO `sys_login_record` VALUES (57, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 1, '验证码错误', '2020-07-20 14:42:01', '2020-07-20 14:42:01');
INSERT INTO `sys_login_record` VALUES (58, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-07-20 14:43:09', '2020-07-20 14:43:09');
INSERT INTO `sys_login_record` VALUES (59, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-07-20 14:44:06', '2020-07-20 14:44:06');
INSERT INTO `sys_login_record` VALUES (60, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-07-27 17:15:17', '2020-07-27 17:15:17');
INSERT INTO `sys_login_record` VALUES (61, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-07-28 21:37:45', '2020-07-28 21:37:45');
INSERT INTO `sys_login_record` VALUES (62, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-07-28 22:22:24', '2020-07-28 22:22:24');
INSERT INTO `sys_login_record` VALUES (63, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-07-29 10:31:12', '2020-07-29 10:31:12');
INSERT INTO `sys_login_record` VALUES (64, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-07-29 12:16:34', '2020-07-29 12:16:34');
INSERT INTO `sys_login_record` VALUES (65, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-07-29 14:24:06', '2020-07-29 14:24:06');
INSERT INTO `sys_login_record` VALUES (66, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-07-29 17:50:08', '2020-07-29 17:50:08');
INSERT INTO `sys_login_record` VALUES (67, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-07-29 18:53:50', '2020-07-29 18:53:50');
INSERT INTO `sys_login_record` VALUES (68, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-07-29 22:09:51', '2020-07-29 22:09:51');
INSERT INTO `sys_login_record` VALUES (69, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-07-30 11:11:33', '2020-07-30 11:11:33');
INSERT INTO `sys_login_record` VALUES (70, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-07-31 10:59:33', '2020-07-31 10:59:33');
INSERT INTO `sys_login_record` VALUES (71, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-07-31 14:08:17', '2020-07-31 14:08:17');
INSERT INTO `sys_login_record` VALUES (72, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-07-31 18:15:29', '2020-07-31 18:15:29');
INSERT INTO `sys_login_record` VALUES (73, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-07-31 20:38:45', '2020-07-31 20:38:45');
INSERT INTO `sys_login_record` VALUES (74, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-08-01 10:36:41', '2020-08-01 10:36:41');
INSERT INTO `sys_login_record` VALUES (75, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-08-02 10:34:48', '2020-08-02 10:34:48');
INSERT INTO `sys_login_record` VALUES (76, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-08-02 18:04:58', '2020-08-02 18:04:58');
INSERT INTO `sys_login_record` VALUES (77, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-08-03 09:07:47', '2020-08-03 09:07:47');
INSERT INTO `sys_login_record` VALUES (78, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 0, NULL, '2020-08-03 09:41:27', '2020-08-03 09:41:27');
INSERT INTO `sys_login_record` VALUES (79, 'admin', 'Mac OS X', 'Mac OS X', 'Chrome 8', '127.0.0.1', 1, '密码错误', '2020-08-09 14:51:23', '2020-08-09 14:51:23');
INSERT INTO `sys_login_record` VALUES (80, '123123', 'Unknown', 'Unknown', 'Unknown', '127.0.0.1', 1, '密码错误', '2020-08-10 17:58:13', '2020-08-10 17:58:13');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` int NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `parent_id` int NOT NULL DEFAULT '0' COMMENT '上级id,0是顶级',
  `menu_name` varchar(200) CHARACTER SET utf8mb4  NOT NULL COMMENT '菜单名称',
  `menu_icon` varchar(200) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '菜单图标',
  `path` varchar(200) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '菜单地址',
  `menu_type` int DEFAULT '0' COMMENT '类型,0菜单,1按钮',
  `sort_number` int NOT NULL DEFAULT '1' COMMENT '排序号',
  `authority` varchar(200) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '权限标识',
  `target` varchar(200) CHARACTER SET utf8mb4  DEFAULT '_self' COMMENT '打开位置',
  `icon_color` varchar(200) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '图标颜色',
  `hide` int NOT NULL DEFAULT '0' COMMENT '是否隐藏,0否,1是',
  `deleted` int NOT NULL DEFAULT '0' COMMENT '是否删除,0否,1是',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COMMENT='菜单';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', 'layui-icon layui-icon-set-sm', NULL, 0, 1, NULL, '_self', NULL, 0, 0, '2020-02-26 12:51:23', '2020-03-21 18:47:00');
INSERT INTO `sys_menu` VALUES (2, 1, '用户管理', NULL, 'sys/user', 0, 1, 'sys:user:view', '_self', NULL, 0, 0, '2020-02-26 12:51:55', '2020-03-21 18:45:26');
INSERT INTO `sys_menu` VALUES (3, 2, '查询用户', NULL, NULL, 1, 1, 'sys:user:list', '_self', NULL, 0, 0, '2020-02-26 12:52:06', '2020-03-21 18:45:28');
INSERT INTO `sys_menu` VALUES (4, 2, '添加用户', NULL, NULL, 1, 2, 'sys:user:save', '_self', NULL, 0, 0, '2020-02-26 12:52:26', '2020-03-21 18:45:29');
INSERT INTO `sys_menu` VALUES (5, 2, '修改用户', NULL, NULL, 1, 3, 'sys:user:update', '_self', NULL, 0, 0, '2020-02-26 12:52:50', '2020-03-21 18:45:30');
INSERT INTO `sys_menu` VALUES (6, 2, '删除用户', NULL, NULL, 1, 4, 'sys:user:remove', '_self', NULL, 0, 0, '2020-02-26 12:53:13', '2020-03-21 18:45:32');
INSERT INTO `sys_menu` VALUES (7, 1, '角色管理', NULL, 'sys/role', 0, 2, 'sys:role:view', '_self', NULL, 0, 0, '2020-03-13 13:29:08', '2020-03-21 18:45:33');
INSERT INTO `sys_menu` VALUES (8, 7, '查询角色', NULL, NULL, 1, 1, 'sys:role:list', '_self', NULL, 0, 0, '2020-03-13 13:30:41', '2020-03-21 18:45:34');
INSERT INTO `sys_menu` VALUES (9, 7, '添加角色', NULL, NULL, 1, 2, 'sys:role:save', '_self', NULL, 0, 0, '2020-03-15 13:02:07', '2020-03-21 18:45:35');
INSERT INTO `sys_menu` VALUES (10, 7, '修改角色', NULL, NULL, 1, 3, 'sys:role:update', '_self', NULL, 0, 0, '2020-03-15 13:02:49', '2020-03-21 18:45:36');
INSERT INTO `sys_menu` VALUES (11, 7, '删除角色', NULL, NULL, 1, 4, 'sys:role:remove', '_self', NULL, 0, 0, '2020-03-20 17:58:51', '2020-03-21 18:45:38');
INSERT INTO `sys_menu` VALUES (12, 1, '菜单管理', NULL, 'sys/menu', 0, 3, 'sys:menu:view', '_self', NULL, 0, 0, '2020-03-21 01:07:13', '2020-03-21 18:45:39');
INSERT INTO `sys_menu` VALUES (13, 12, '查询菜单', NULL, NULL, 1, 1, 'sys:menu:list', '_self', NULL, 0, 0, '2020-03-21 16:43:30', '2020-03-21 18:45:40');
INSERT INTO `sys_menu` VALUES (14, 12, '添加菜单', NULL, NULL, 1, 2, 'sys:menu:save', '_self', NULL, 0, 0, '2020-03-21 16:43:54', '2020-03-21 18:45:41');
INSERT INTO `sys_menu` VALUES (15, 12, '修改菜单', NULL, NULL, 1, 3, 'sys:menu:update', '_self', NULL, 0, 0, '2020-03-21 18:24:17', '2020-03-21 18:45:43');
INSERT INTO `sys_menu` VALUES (16, 12, '删除菜单', NULL, NULL, 1, 4, 'sys:menu:remove', '_self', NULL, 0, 0, '2020-03-21 18:24:18', '2020-03-21 18:45:44');
INSERT INTO `sys_menu` VALUES (17, 1, '机构管理', NULL, 'sys/organization', 0, 4, 'sys:org:view', '_self', NULL, 0, 0, '2020-03-21 18:24:20', '2020-03-21 18:45:49');
INSERT INTO `sys_menu` VALUES (18, 17, '查询机构', NULL, NULL, 1, 1, 'sys:org:list', '_self', NULL, 0, 0, '2020-03-21 18:24:21', '2020-03-21 18:44:36');
INSERT INTO `sys_menu` VALUES (19, 17, '添加机构', NULL, NULL, 1, 2, 'sys:org:save', '_self', NULL, 0, 0, '2020-03-21 18:24:22', '2020-03-21 18:45:51');
INSERT INTO `sys_menu` VALUES (20, 17, '修改机构', NULL, NULL, 1, 3, 'sys:org:update', '_self', NULL, 0, 0, '2020-03-21 18:24:24', '2020-03-21 18:45:52');
INSERT INTO `sys_menu` VALUES (21, 17, '删除机构', NULL, NULL, 1, 4, 'sys:org:remove', '_self', NULL, 0, 0, '2020-03-21 18:24:25', '2020-03-21 18:45:54');
INSERT INTO `sys_menu` VALUES (22, 1, '字典管理', NULL, 'sys/dict', 0, 5, 'sys:dict:view', '_self', NULL, 0, 0, '2020-03-21 18:24:26', '2020-03-21 18:45:56');
INSERT INTO `sys_menu` VALUES (23, 22, '查询字典', NULL, NULL, 1, 1, 'sys:dict:list', '_self', NULL, 0, 0, '2020-03-21 18:24:27', '2020-03-21 18:44:42');
INSERT INTO `sys_menu` VALUES (24, 22, '添加字典', NULL, NULL, 1, 2, 'sys:dict:save', '_self', NULL, 0, 0, '2020-03-21 18:24:28', '2020-03-21 18:45:59');
INSERT INTO `sys_menu` VALUES (25, 22, '修改字典', NULL, NULL, 1, 3, 'sys:dict:update', '_self', NULL, 0, 0, '2020-03-21 18:24:29', '2020-03-21 18:46:01');
INSERT INTO `sys_menu` VALUES (26, 22, '删除字典', NULL, NULL, 1, 4, 'sys:dict:remove', '_self', NULL, 0, 0, '2020-03-21 18:24:31', '2020-03-21 18:46:02');
INSERT INTO `sys_menu` VALUES (28, 31, '登录日志', '', 'sys/loginRecord', 0, 1, 'sys:login_record:view', '_self', NULL, 0, 0, '2020-03-21 18:24:33', '2020-07-31 15:22:16');
INSERT INTO `sys_menu` VALUES (29, 31, '操作日志', '', 'sys/operRecord', 0, 2, 'sys:oper_record:view', '_self', NULL, 0, 0, '2020-03-21 18:24:34', '2020-07-31 15:22:11');
INSERT INTO `sys_menu` VALUES (31, 0, '系统监控', 'layui-icon layui-icon-slider', '', 0, 3, '', '_self', NULL, 0, 0, '2020-03-21 18:24:36', '2020-07-06 16:23:16');
INSERT INTO `sys_menu` VALUES (32, 31, '文件管理', '', 'file/manage', 0, 1, 'sys:file:view', '_self', NULL, 1, 0, '2020-03-21 18:24:38', '2020-07-30 11:26:43');
INSERT INTO `sys_menu` VALUES (33, 32, '查询文件', NULL, NULL, 1, 1, 'sys:file:list', '_self', NULL, 0, 0, '2020-03-21 18:24:39', '2020-03-22 14:47:32');
INSERT INTO `sys_menu` VALUES (34, 32, '删除文件', NULL, NULL, 1, 2, 'sys:file:remove', '_self', NULL, 0, 0, '2020-03-21 18:24:40', '2020-03-22 14:46:54');
INSERT INTO `sys_menu` VALUES (36, 31, '项目生成', '', '/sys/generator/', 0, 3, '', '_self', NULL, 0, 0, '2020-03-21 18:24:42', '2020-07-04 21:42:06');
INSERT INTO `sys_menu` VALUES (37, 1, '全局配置', '', 'sys/option', 0, 6, 'sys:option:view', NULL, NULL, 0, 0, '2020-07-16 15:58:25', '2020-07-16 16:06:33');
INSERT INTO `sys_menu` VALUES (38, 31, '定时任务', '', '/sys/QrtzJobs', 0, 3, '', NULL, NULL, 0, 0, '2020-07-16 17:43:01', '2020-07-29 14:24:41');
INSERT INTO `sys_menu` VALUES (40, 0, '演示', 'layui-icon layui-icon-theme', '', 0, 4, '', NULL, NULL, 0, 0, '2020-07-20 10:40:16', '2020-07-20 10:40:16');
INSERT INTO `sys_menu` VALUES (41, 40, '富文本编辑器', 'layui-icon layui-icon-theme', '/sys/demo/richtext', 0, 0, '', NULL, NULL, 0, 0, '2020-07-20 10:41:07', '2020-07-20 10:41:07');
INSERT INTO `sys_menu` VALUES (42, 40, 'Markdown编辑器', 'layui-icon layui-icon-theme', '/sys/demo/markdown', 0, 1, '', NULL, NULL, 0, 0, '2020-07-20 10:41:43', '2020-07-20 10:41:43');
INSERT INTO `sys_menu` VALUES (43, 0, '首页', 'layui-icon layui-icon-home', '/sys/dashboard', 0, 0, '', NULL, NULL, 0, 0, '2020-07-31 15:16:26', '2020-07-31 15:16:26');
INSERT INTO `sys_menu` VALUES (44, 40, '更多示例', '', 'https://www.layui.com/demo/', 0, 6, '', NULL, NULL, 0, 0, '2020-07-31 16:04:31', '2020-07-31 16:04:31');
INSERT INTO `sys_menu` VALUES (45, 40, '按钮 Button', '', '/sys/demo/button.html', 0, 0, '', NULL, NULL, 0, 0, '2020-07-31 21:30:42', '2020-07-31 21:49:46');
INSERT INTO `sys_menu` VALUES (46, 40, '空状态 Empty', '', '/sys/demo/empty.html', 0, 1, '', NULL, NULL, 0, 0, '2020-07-31 21:49:28', '2020-07-31 21:49:28');
INSERT INTO `sys_menu` VALUES (47, 40, '表单 Form', '', '/sys/demo/form.html', 0, 2, '', NULL, NULL, 0, 0, '2020-07-31 22:26:18', '2020-07-31 22:26:18');
INSERT INTO `sys_menu` VALUES (48, 0, '异常页', 'layui-icon layui-icon-about', '', 0, 5, '', NULL, NULL, 0, 0, '2020-08-02 10:46:25', '2020-08-02 10:46:25');
INSERT INTO `sys_menu` VALUES (49, 48, '404', 'layui-icon layui-icon-about', '/sys/demo/error/404', 0, 0, '', NULL, NULL, 0, 0, '2020-08-02 10:46:36', '2020-08-02 10:46:36');
INSERT INTO `sys_menu` VALUES (50, 48, '403', 'layui-icon layui-icon-about', '/sys/demo/error/403', 0, 1, '', NULL, NULL, 0, 0, '2020-08-02 10:46:47', '2020-08-02 10:46:47');
INSERT INTO `sys_menu` VALUES (51, 48, '500', 'layui-icon layui-icon-about', '/sys/demo/error/500', 0, 2, '', NULL, NULL, 0, 0, '2020-08-02 10:47:07', '2020-08-02 10:47:07');
INSERT INTO `sys_menu` VALUES (52, 40, '文件上传 Upload', 'layui-icon-about', '/sys/demo/upload.html', 0, 5, '', NULL, NULL, 0, 0, '2020-08-02 11:10:49', '2020-08-02 11:10:49');
INSERT INTO `sys_menu` VALUES (53, 40, '日期和时间选择 DatePicker', '', '/sys/demo/datePicker.html', 0, 6, '', NULL, NULL, 0, 0, '2020-08-03 09:42:18', '2020-08-03 09:42:18');
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_record`;
CREATE TABLE `sys_oper_record` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int DEFAULT NULL COMMENT '用户id',
  `model` varchar(200) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '操作模块',
  `description` varchar(200) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '操作方法',
  `url` varchar(200) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '请求地址',
  `request_method` varchar(200) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '请求方式',
  `oper_method` varchar(200) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '调用方法',
  `param` varchar(2000) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '请求参数',
  `result` varchar(2000) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '返回结果',
  `ip` varchar(200) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT 'ip地址',
  `comments` varchar(2000) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '备注',
  `spend_time` int DEFAULT NULL COMMENT '请求耗时,单位毫秒',
  `state` int NOT NULL DEFAULT '0' COMMENT '状态,0成功,1异常',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=767 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志';

-- ----------------------------
-- Records of sys_oper_record
-- ----------------------------
BEGIN;
INSERT INTO `sys_oper_record` VALUES (1, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.56.1', NULL, 73, 0, '2020-06-28 21:41:57', '2020-06-28 21:41:57');
INSERT INTO `sys_oper_record` VALUES (2, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.56.1', NULL, 21, 0, '2020-06-28 21:42:08', '2020-06-28 21:42:08');
INSERT INTO `sys_oper_record` VALUES (3, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.common.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '192.168.56.1', NULL, 38, 0, '2020-06-28 21:42:12', '2020-06-28 21:42:12');
INSERT INTO `sys_oper_record` VALUES (4, 1, '字典管理', '查询全部', '/sys/dict/list', 'GET', 'com.asuka.common.system.controller.DictionaryController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.56.1', NULL, 25, 0, '2020-06-28 21:42:35', '2020-06-28 21:42:35');
INSERT INTO `sys_oper_record` VALUES (5, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.common.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictId\":[\"1\"]}', NULL, '192.168.56.1', NULL, 22, 0, '2020-06-28 21:42:35', '2020-06-28 21:42:35');
INSERT INTO `sys_oper_record` VALUES (6, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.common.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictId\":[\"1\"]}', NULL, '192.168.56.1', NULL, 17, 0, '2020-06-28 21:42:36', '2020-06-28 21:42:36');
INSERT INTO `sys_oper_record` VALUES (7, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.common.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictId\":[\"2\"]}', NULL, '192.168.56.1', NULL, 20, 0, '2020-06-28 21:42:37', '2020-06-28 21:42:37');
INSERT INTO `sys_oper_record` VALUES (8, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.common.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictId\":[\"1\"]}', NULL, '192.168.56.1', NULL, 17, 0, '2020-06-28 21:42:41', '2020-06-28 21:42:41');
INSERT INTO `sys_oper_record` VALUES (9, 1, '机构管理', '查询全部', '/sys/organization/list', 'GET', 'com.asuka.common.system.controller.OrganizationController.list', '{}', NULL, '192.168.56.1', NULL, 24, 0, '2020-06-28 21:42:43', '2020-06-28 21:42:43');
INSERT INTO `sys_oper_record` VALUES (10, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.common.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"organizationId\":[\"1\"]}', NULL, '192.168.56.1', NULL, 10, 0, '2020-06-28 21:42:43', '2020-06-28 21:42:43');
INSERT INTO `sys_oper_record` VALUES (11, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.common.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"organizationId\":[\"2\"]}', NULL, '192.168.56.1', NULL, 10, 0, '2020-06-28 21:42:44', '2020-06-28 21:42:44');
INSERT INTO `sys_oper_record` VALUES (12, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.common.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"organizationId\":[\"3\"]}', NULL, '192.168.56.1', NULL, 9, 0, '2020-06-28 21:42:44', '2020-06-28 21:42:44');
INSERT INTO `sys_oper_record` VALUES (13, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.common.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"organizationId\":[\"4\"]}', NULL, '192.168.56.1', NULL, 10, 0, '2020-06-28 21:42:45', '2020-06-28 21:42:45');
INSERT INTO `sys_oper_record` VALUES (14, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.common.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"organizationId\":[\"5\"]}', NULL, '192.168.56.1', NULL, 10, 0, '2020-06-28 21:42:45', '2020-06-28 21:42:45');
INSERT INTO `sys_oper_record` VALUES (15, 1, '操作日志', '分页查询', '/sys/operRecord/page', 'GET', 'com.asuka.common.system.controller.OperRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.56.1', NULL, 20, 0, '2020-06-28 21:42:47', '2020-06-28 21:42:47');
INSERT INTO `sys_oper_record` VALUES (16, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.common.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.56.1', NULL, 17, 0, '2020-06-28 21:42:49', '2020-06-28 21:42:49');
INSERT INTO `sys_oper_record` VALUES (17, 1, '文件管理', '查询全部', '/file/list', 'GET', 'com.asuka.common.system.controller.FileController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.56.1', NULL, 4, 0, '2020-06-28 21:43:02', '2020-06-28 21:43:02');
INSERT INTO `sys_oper_record` VALUES (18, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.56.1', 'java.lang.NullPointerException', 1, 1, '2020-06-29 22:58:19', '2020-06-29 22:58:19');
INSERT INTO `sys_oper_record` VALUES (19, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.56.1', 'java.lang.NullPointerException', 29420, 1, '2020-06-29 22:59:43', '2020-06-29 22:59:43');
INSERT INTO `sys_oper_record` VALUES (20, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.56.1', 'org.beetl.sql.core.BeetlSQLException: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'1\r\n        AND b.deleted=0\' at line 4', 20910, 1, '2020-06-29 23:19:59', '2020-06-29 23:19:59');
INSERT INTO `sys_oper_record` VALUES (21, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.common.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.56.1', NULL, 29, 0, '2020-06-29 23:24:37', '2020-06-29 23:24:37');
INSERT INTO `sys_oper_record` VALUES (22, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.common.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.56.1', NULL, 15, 0, '2020-06-29 23:24:42', '2020-06-29 23:24:42');
INSERT INTO `sys_oper_record` VALUES (23, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.common.system.controller.MenuController.list', '{}', NULL, '192.168.56.1', NULL, 19, 0, '2020-06-29 23:24:44', '2020-06-29 23:24:44');
INSERT INTO `sys_oper_record` VALUES (24, 1, '机构管理', '查询全部', '/sys/organization/list', 'GET', 'com.asuka.common.system.controller.OrganizationController.list', '{}', NULL, '192.168.56.1', NULL, 29, 0, '2020-06-29 23:24:52', '2020-06-29 23:24:52');
INSERT INTO `sys_oper_record` VALUES (25, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.common.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"organizationId\":[\"1\"]}', NULL, '192.168.56.1', NULL, 7, 0, '2020-06-29 23:24:52', '2020-06-29 23:24:52');
INSERT INTO `sys_oper_record` VALUES (26, 1, '字典管理', '查询全部', '/sys/dict/list', 'GET', 'com.asuka.common.system.controller.DictionaryController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.56.1', NULL, 6, 0, '2020-06-29 23:24:56', '2020-06-29 23:24:56');
INSERT INTO `sys_oper_record` VALUES (27, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.common.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictId\":[\"2\"]}', NULL, '192.168.56.1', NULL, 16, 0, '2020-06-29 23:24:56', '2020-06-29 23:24:56');
INSERT INTO `sys_oper_record` VALUES (28, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.common.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictId\":[\"1\"]}', NULL, '192.168.56.1', NULL, 12, 0, '2020-06-29 23:24:58', '2020-06-29 23:24:58');
INSERT INTO `sys_oper_record` VALUES (29, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.common.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictId\":[\"2\"]}', NULL, '192.168.56.1', NULL, 13, 0, '2020-06-29 23:24:59', '2020-06-29 23:24:59');
INSERT INTO `sys_oper_record` VALUES (30, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.common.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictId\":[\"1\"]}', NULL, '192.168.56.1', NULL, 15, 0, '2020-06-29 23:24:59', '2020-06-29 23:24:59');
INSERT INTO `sys_oper_record` VALUES (31, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.common.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"dictId\":[\"2\"]}', NULL, '192.168.56.1', NULL, 14, 0, '2020-06-29 23:25:00', '2020-06-29 23:25:00');
INSERT INTO `sys_oper_record` VALUES (32, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.common.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.56.1', NULL, 81, 0, '2020-06-29 23:25:02', '2020-06-29 23:25:02');
INSERT INTO `sys_oper_record` VALUES (33, 1, '操作日志', '分页查询', '/sys/operRecord/page', 'GET', 'com.asuka.common.system.controller.OperRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.56.1', NULL, 13, 0, '2020-06-29 23:25:03', '2020-06-29 23:25:03');
INSERT INTO `sys_oper_record` VALUES (34, 1, '文件管理', '查询全部', '/file/list', 'GET', 'com.asuka.common.system.controller.FileController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.56.1', NULL, 1, 0, '2020-06-29 23:25:08', '2020-06-29 23:25:08');
INSERT INTO `sys_oper_record` VALUES (35, 1, '文件管理', '查询全部', '/file/list', 'GET', 'com.asuka.common.system.controller.FileController.list', '{\"dir\":[\"/\"]}', NULL, '192.168.56.1', NULL, 1, 0, '2020-06-29 23:25:10', '2020-06-29 23:25:10');
INSERT INTO `sys_oper_record` VALUES (36, 1, '文件管理', '查询全部', '/file/list', 'GET', 'com.asuka.common.system.controller.FileController.list', '{\"dir\":[\"/\"]}', NULL, '192.168.56.1', NULL, 0, 0, '2020-06-29 23:25:14', '2020-06-29 23:25:14');
INSERT INTO `sys_oper_record` VALUES (37, 1, '机构管理', '查询全部', '/sys/organization/list', 'GET', 'com.asuka.common.system.controller.OrganizationController.list', '{}', NULL, '192.168.56.1', NULL, 11, 0, '2020-06-29 23:26:32', '2020-06-29 23:26:32');
INSERT INTO `sys_oper_record` VALUES (38, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.common.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"organizationId\":[\"1\"]}', NULL, '192.168.56.1', NULL, 6, 0, '2020-06-29 23:26:32', '2020-06-29 23:26:32');
INSERT INTO `sys_oper_record` VALUES (39, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 784, 0, '2020-07-06 09:19:44', '2020-07-06 09:19:44');
INSERT INTO `sys_oper_record` VALUES (40, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 670, 0, '2020-07-06 14:25:54', '2020-07-06 14:25:54');
INSERT INTO `sys_oper_record` VALUES (41, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 1685, 0, '2020-07-06 14:58:44', '2020-07-06 14:58:44');
INSERT INTO `sys_oper_record` VALUES (42, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 835, 0, '2020-07-06 15:00:20', '2020-07-06 15:00:20');
INSERT INTO `sys_oper_record` VALUES (43, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 1577, 0, '2020-07-06 15:00:23', '2020-07-06 15:00:23');
INSERT INTO `sys_oper_record` VALUES (44, 1, '文件管理', '查询全部', '/file/list', 'GET', 'com.asuka.module.system.controller.FileController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 522, 0, '2020-07-06 15:52:49', '2020-07-06 15:52:49');
INSERT INTO `sys_oper_record` VALUES (45, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 1511, 0, '2020-07-06 15:53:03', '2020-07-06 15:53:03');
INSERT INTO `sys_oper_record` VALUES (46, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 1494, 0, '2020-07-06 15:53:17', '2020-07-06 15:53:17');
INSERT INTO `sys_oper_record` VALUES (47, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 501, 0, '2020-07-06 16:07:48', '2020-07-06 16:07:48');
INSERT INTO `sys_oper_record` VALUES (48, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 38, 0, '2020-07-06 16:22:33', '2020-07-06 16:22:33');
INSERT INTO `sys_oper_record` VALUES (49, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.asuka.module.system.controller.MenuController.update', NULL, '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 421, 0, '2020-07-06 16:23:16', '2020-07-06 16:23:16');
INSERT INTO `sys_oper_record` VALUES (50, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 232, 0, '2020-07-06 16:23:16', '2020-07-06 16:23:16');
INSERT INTO `sys_oper_record` VALUES (51, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 125, 0, '2020-07-06 16:23:38', '2020-07-06 16:23:38');
INSERT INTO `sys_oper_record` VALUES (52, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.56.1', NULL, 82, 0, '2020-07-07 16:39:43', '2020-07-07 16:39:43');
INSERT INTO `sys_oper_record` VALUES (53, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.56.1', NULL, 56, 0, '2020-07-07 16:39:44', '2020-07-07 16:39:44');
INSERT INTO `sys_oper_record` VALUES (54, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '192.168.56.1', NULL, 44, 0, '2020-07-07 16:39:46', '2020-07-07 16:39:46');
INSERT INTO `sys_oper_record` VALUES (55, 1, '机构管理', '查询全部', '/sys/organization/list', 'GET', 'com.asuka.module.system.controller.OrganizationController.list', '{}', NULL, '192.168.56.1', NULL, 92, 0, '2020-07-07 16:39:48', '2020-07-07 16:39:48');
INSERT INTO `sys_oper_record` VALUES (56, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"1\"]}', NULL, '192.168.56.1', NULL, 29, 0, '2020-07-07 16:39:48', '2020-07-07 16:39:48');
INSERT INTO `sys_oper_record` VALUES (57, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"9\"]}', NULL, '192.168.56.1', NULL, 41, 0, '2020-07-07 16:39:50', '2020-07-07 16:39:50');
INSERT INTO `sys_oper_record` VALUES (58, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"8\"]}', NULL, '192.168.56.1', NULL, 43, 0, '2020-07-07 16:39:50', '2020-07-07 16:39:50');
INSERT INTO `sys_oper_record` VALUES (59, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"7\"]}', NULL, '192.168.56.1', NULL, 30, 0, '2020-07-07 16:39:51', '2020-07-07 16:39:51');
INSERT INTO `sys_oper_record` VALUES (60, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"2\"]}', NULL, '192.168.56.1', NULL, 47, 0, '2020-07-07 16:39:51', '2020-07-07 16:39:51');
INSERT INTO `sys_oper_record` VALUES (61, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"6\"]}', NULL, '192.168.56.1', NULL, 41, 0, '2020-07-07 16:39:52', '2020-07-07 16:39:52');
INSERT INTO `sys_oper_record` VALUES (62, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"5\"]}', NULL, '192.168.56.1', NULL, 29, 0, '2020-07-07 16:39:52', '2020-07-07 16:39:52');
INSERT INTO `sys_oper_record` VALUES (63, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"4\"]}', NULL, '192.168.56.1', NULL, 31, 0, '2020-07-07 16:39:52', '2020-07-07 16:39:52');
INSERT INTO `sys_oper_record` VALUES (64, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"3\"]}', NULL, '192.168.56.1', NULL, 40, 0, '2020-07-07 16:39:53', '2020-07-07 16:39:53');
INSERT INTO `sys_oper_record` VALUES (65, 1, '字典管理', '查询全部', '/sys/dict/list', 'GET', 'com.asuka.module.system.controller.DictionaryController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.56.1', NULL, 43, 0, '2020-07-07 16:39:54', '2020-07-07 16:39:54');
INSERT INTO `sys_oper_record` VALUES (66, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.module.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@dictId\":[\"2\"]}', NULL, '192.168.56.1', NULL, 55, 0, '2020-07-07 16:39:54', '2020-07-07 16:39:54');
INSERT INTO `sys_oper_record` VALUES (67, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.module.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@dictId\":[\"1\"]}', NULL, '192.168.56.1', NULL, 57, 0, '2020-07-07 16:39:56', '2020-07-07 16:39:56');
INSERT INTO `sys_oper_record` VALUES (68, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.56.1', NULL, 67, 0, '2020-07-07 16:40:05', '2020-07-07 16:40:05');
INSERT INTO `sys_oper_record` VALUES (69, 1, '操作日志', '分页查询', '/sys/operRecord/page', 'GET', 'com.asuka.module.system.controller.OperRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.56.1', NULL, 89, 0, '2020-07-07 16:40:05', '2020-07-07 16:40:05');
INSERT INTO `sys_oper_record` VALUES (70, 1, '文件管理', '查询全部', '/file/list', 'GET', 'com.asuka.module.system.controller.FileController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.56.1', NULL, 37, 0, '2020-07-07 16:40:08', '2020-07-07 16:40:08');
INSERT INTO `sys_oper_record` VALUES (71, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 4984, 0, '2020-07-11 21:48:33', '2020-07-11 21:48:33');
INSERT INTO `sys_oper_record` VALUES (72, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"2\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 961, 0, '2020-07-11 21:48:46', '2020-07-11 21:48:46');
INSERT INTO `sys_oper_record` VALUES (73, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 2387, 0, '2020-07-11 21:48:50', '2020-07-11 21:48:50');
INSERT INTO `sys_oper_record` VALUES (74, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"2\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 2390, 0, '2020-07-11 21:48:53', '2020-07-11 21:48:53');
INSERT INTO `sys_oper_record` VALUES (75, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 3484, 0, '2020-07-11 21:48:57', '2020-07-11 21:48:57');
INSERT INTO `sys_oper_record` VALUES (76, 1, '操作日志', '分页查询', '/sys/operRecord/page', 'GET', 'com.asuka.module.system.controller.OperRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 3617, 0, '2020-07-11 21:52:09', '2020-07-11 21:52:09');
INSERT INTO `sys_oper_record` VALUES (77, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 1090, 0, '2020-07-12 11:22:14', '2020-07-12 11:22:14');
INSERT INTO `sys_oper_record` VALUES (78, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', 'java.lang.ClassCastException: com.alibaba.fastjson.JSONObject cannot be cast to com.asuka.module.system.entity.Role', 920, 1, '2020-07-12 11:28:49', '2020-07-12 11:28:49');
INSERT INTO `sys_oper_record` VALUES (79, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', 'java.lang.ClassCastException: com.alibaba.fastjson.JSONObject cannot be cast to com.asuka.module.system.entity.Role', 693, 1, '2020-07-12 11:28:58', '2020-07-12 11:28:58');
INSERT INTO `sys_oper_record` VALUES (80, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 115, 0, '2020-07-12 11:29:57', '2020-07-12 11:29:57');
INSERT INTO `sys_oper_record` VALUES (81, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', 'java.lang.ClassCastException: com.alibaba.fastjson.JSONObject cannot be cast to com.asuka.module.system.entity.Role', 49, 1, '2020-07-12 11:30:00', '2020-07-12 11:30:00');
INSERT INTO `sys_oper_record` VALUES (82, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 5709, 0, '2020-07-12 11:51:58', '2020-07-12 11:51:58');
INSERT INTO `sys_oper_record` VALUES (83, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', 'java.lang.ClassCastException: com.alibaba.fastjson.JSONObject cannot be cast to com.asuka.module.system.entity.Role', 477, 1, '2020-07-12 11:52:09', '2020-07-12 11:52:09');
INSERT INTO `sys_oper_record` VALUES (84, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 41, 0, '2020-07-12 22:39:02', '2020-07-12 22:39:02');
INSERT INTO `sys_oper_record` VALUES (85, 1, '操作日志', '分页查询', '/sys/operRecord/page', 'GET', 'com.asuka.module.system.controller.OperRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 33, 0, '2020-07-12 22:39:04', '2020-07-12 22:39:04');
INSERT INTO `sys_oper_record` VALUES (86, 1, '文件管理', '查询全部', '/file/list', 'GET', 'com.asuka.module.system.controller.FileController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 8, 0, '2020-07-12 22:39:07', '2020-07-12 22:39:07');
INSERT INTO `sys_oper_record` VALUES (87, 1, '文件管理', '查询全部', '/file/list', 'GET', 'com.asuka.plugin.upload.controller.$FileController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 11, 0, '2020-07-13 10:59:47', '2020-07-13 10:59:47');
INSERT INTO `sys_oper_record` VALUES (88, 1, '文件管理', '查询全部', '/file/list', 'GET', 'com.asuka.plugin.upload.controller.$FileController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 2, 0, '2020-07-13 11:00:02', '2020-07-13 11:00:02');
INSERT INTO `sys_oper_record` VALUES (89, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 14, 0, '2020-07-13 11:00:08', '2020-07-13 11:00:08');
INSERT INTO `sys_oper_record` VALUES (90, 1, '操作日志', '分页查询', '/sys/operRecord/page', 'GET', 'com.asuka.module.system.controller.OperRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 35, 0, '2020-07-13 11:00:09', '2020-07-13 11:00:09');
INSERT INTO `sys_oper_record` VALUES (91, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '192.168.31.174', NULL, 6, 0, '2020-07-13 11:00:12', '2020-07-13 11:00:12');
INSERT INTO `sys_oper_record` VALUES (92, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 5, 0, '2020-07-13 11:00:14', '2020-07-13 11:00:14');
INSERT INTO `sys_oper_record` VALUES (93, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 23, 0, '2020-07-13 11:00:15', '2020-07-13 11:00:15');
INSERT INTO `sys_oper_record` VALUES (94, 1, '机构管理', '查询全部', '/sys/organization/list', 'GET', 'com.asuka.module.system.controller.OrganizationController.list', '{}', NULL, '192.168.31.174', NULL, 16, 0, '2020-07-13 11:00:22', '2020-07-13 11:00:22');
INSERT INTO `sys_oper_record` VALUES (95, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"1\"]}', NULL, '192.168.31.174', NULL, 5, 0, '2020-07-13 11:00:22', '2020-07-13 11:00:22');
INSERT INTO `sys_oper_record` VALUES (96, 1, '字典管理', '查询全部', '/sys/dict/list', 'GET', 'com.asuka.module.system.controller.DictionaryController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 5, 0, '2020-07-13 11:00:24', '2020-07-13 11:00:24');
INSERT INTO `sys_oper_record` VALUES (97, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.module.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@dictId\":[\"2\"]}', NULL, '192.168.31.174', NULL, 14, 0, '2020-07-13 11:00:24', '2020-07-13 11:00:24');
INSERT INTO `sys_oper_record` VALUES (98, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 11, 0, '2020-07-13 11:40:26', '2020-07-13 11:40:26');
INSERT INTO `sys_oper_record` VALUES (99, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 11, 0, '2020-07-13 11:43:42', '2020-07-13 11:43:42');
INSERT INTO `sys_oper_record` VALUES (100, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 9, 0, '2020-07-13 11:52:09', '2020-07-13 11:52:09');
INSERT INTO `sys_oper_record` VALUES (101, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 9, 0, '2020-07-13 11:52:27', '2020-07-13 11:52:27');
INSERT INTO `sys_oper_record` VALUES (102, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 11, 0, '2020-07-13 11:57:14', '2020-07-13 11:57:14');
INSERT INTO `sys_oper_record` VALUES (103, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 11, 0, '2020-07-13 11:58:20', '2020-07-13 11:58:20');
INSERT INTO `sys_oper_record` VALUES (104, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 25, 0, '2020-07-13 12:03:23', '2020-07-13 12:03:23');
INSERT INTO `sys_oper_record` VALUES (105, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 21, 0, '2020-07-13 12:08:09', '2020-07-13 12:08:09');
INSERT INTO `sys_oper_record` VALUES (106, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 17, 0, '2020-07-13 12:11:23', '2020-07-13 12:11:23');
INSERT INTO `sys_oper_record` VALUES (107, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 26, 0, '2020-07-13 12:38:54', '2020-07-13 12:38:54');
INSERT INTO `sys_oper_record` VALUES (108, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 26, 0, '2020-07-13 12:41:20', '2020-07-13 12:41:20');
INSERT INTO `sys_oper_record` VALUES (109, 1, '用户管理', '修改', '/sys/user/update', 'POST', 'com.asuka.module.system.controller.UserController.update', NULL, NULL, '192.168.31.174', 'org.beetl.sql.core.BeetlSQLException: java.sql.BatchUpdateException: Column \'update_time\' cannot be null', 135, 1, '2020-07-13 12:43:36', '2020-07-13 12:43:36');
INSERT INTO `sys_oper_record` VALUES (110, 1, '用户管理', '修改', '/sys/user/update', 'POST', 'com.asuka.module.system.controller.UserController.update', NULL, NULL, '192.168.31.174', 'org.beetl.sql.core.BeetlSQLException: java.sql.BatchUpdateException: Column \'update_time\' cannot be null', 4009, 1, '2020-07-13 12:45:07', '2020-07-13 12:45:07');
INSERT INTO `sys_oper_record` VALUES (111, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 24, 0, '2020-07-13 14:16:55', '2020-07-13 14:16:55');
INSERT INTO `sys_oper_record` VALUES (112, 1, '用户管理', '修改', '/sys/user/update', 'POST', 'com.asuka.module.system.controller.UserController.update', NULL, '{\"code\":0,\"msg\":\"修改成功\"}', '192.168.31.174', NULL, 2896, 0, '2020-07-13 14:17:05', '2020-07-13 14:17:05');
INSERT INTO `sys_oper_record` VALUES (113, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 17, 0, '2020-07-13 14:17:06', '2020-07-13 14:17:06');
INSERT INTO `sys_oper_record` VALUES (114, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 11, 0, '2020-07-13 14:19:37', '2020-07-13 14:19:37');
INSERT INTO `sys_oper_record` VALUES (115, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 14, 0, '2020-07-13 14:21:38', '2020-07-13 14:21:38');
INSERT INTO `sys_oper_record` VALUES (116, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 12, 0, '2020-07-13 14:25:31', '2020-07-13 14:25:31');
INSERT INTO `sys_oper_record` VALUES (117, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 22, 0, '2020-07-13 15:13:21', '2020-07-13 15:13:21');
INSERT INTO `sys_oper_record` VALUES (118, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 12, 0, '2020-07-13 15:14:12', '2020-07-13 15:14:12');
INSERT INTO `sys_oper_record` VALUES (119, 1, '用户管理', '修改', '/sys/user/update', 'POST', 'com.asuka.module.system.controller.UserController.update', NULL, '{\"code\":0,\"msg\":\"修改成功\"}', '192.168.31.174', NULL, 2686, 0, '2020-07-13 15:14:30', '2020-07-13 15:14:30');
INSERT INTO `sys_oper_record` VALUES (120, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 54, 0, '2020-07-13 15:14:30', '2020-07-13 15:14:30');
INSERT INTO `sys_oper_record` VALUES (121, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 24, 0, '2020-07-13 23:35:08', '2020-07-13 23:35:08');
INSERT INTO `sys_oper_record` VALUES (122, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 9, 0, '2020-07-13 23:35:24', '2020-07-13 23:35:24');
INSERT INTO `sys_oper_record` VALUES (123, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 12, 0, '2020-07-13 23:36:44', '2020-07-13 23:36:44');
INSERT INTO `sys_oper_record` VALUES (124, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 13, 0, '2020-07-13 23:37:29', '2020-07-13 23:37:29');
INSERT INTO `sys_oper_record` VALUES (125, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '192.168.31.174', NULL, 8, 0, '2020-07-16 15:57:32', '2020-07-16 15:57:32');
INSERT INTO `sys_oper_record` VALUES (126, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.asuka.module.system.controller.MenuController.save', NULL, '{\"code\":0,\"msg\":\"添加成功\"}', '192.168.31.174', NULL, 13, 0, '2020-07-16 15:58:25', '2020-07-16 15:58:25');
INSERT INTO `sys_oper_record` VALUES (127, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '192.168.31.174', NULL, 7, 0, '2020-07-16 15:58:25', '2020-07-16 15:58:25');
INSERT INTO `sys_oper_record` VALUES (128, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.asuka.module.system.controller.MenuController.update', NULL, '{\"code\":0,\"msg\":\"修改成功\"}', '192.168.31.174', NULL, 27, 0, '2020-07-16 15:59:02', '2020-07-16 15:59:02');
INSERT INTO `sys_oper_record` VALUES (129, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '192.168.31.174', NULL, 6, 0, '2020-07-16 15:59:02', '2020-07-16 15:59:02');
INSERT INTO `sys_oper_record` VALUES (130, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 14, 0, '2020-07-16 15:59:04', '2020-07-16 15:59:04');
INSERT INTO `sys_oper_record` VALUES (131, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '192.168.31.174', NULL, 20, 0, '2020-07-16 15:59:07', '2020-07-16 15:59:07');
INSERT INTO `sys_oper_record` VALUES (132, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/1', 'POST', 'com.asuka.module.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '192.168.31.174', 'org.beetl.sql.core.BeetlSQLException: java.sql.BatchUpdateException: Column \'update_time\' cannot be null', 79, 1, '2020-07-16 15:59:11', '2020-07-16 15:59:11');
INSERT INTO `sys_oper_record` VALUES (133, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '192.168.31.174', NULL, 64, 0, '2020-07-16 16:00:50', '2020-07-16 16:00:50');
INSERT INTO `sys_oper_record` VALUES (134, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/1', 'POST', 'com.asuka.module.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '192.168.31.174', 'org.beetl.sql.core.BeetlSQLException: java.sql.BatchUpdateException: Column \'update_time\' cannot be null', 67, 1, '2020-07-16 16:00:53', '2020-07-16 16:00:53');
INSERT INTO `sys_oper_record` VALUES (135, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 16, 0, '2020-07-16 16:03:09', '2020-07-16 16:03:09');
INSERT INTO `sys_oper_record` VALUES (136, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '192.168.31.174', NULL, 22, 0, '2020-07-16 16:03:10', '2020-07-16 16:03:10');
INSERT INTO `sys_oper_record` VALUES (137, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/1', 'POST', 'com.asuka.module.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '192.168.31.174', NULL, 43, 0, '2020-07-16 16:03:15', '2020-07-16 16:03:15');
INSERT INTO `sys_oper_record` VALUES (138, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '192.168.31.174', NULL, 7, 0, '2020-07-16 16:03:17', '2020-07-16 16:03:17');
INSERT INTO `sys_oper_record` VALUES (139, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 8, 0, '2020-07-16 16:05:55', '2020-07-16 16:05:55');
INSERT INTO `sys_oper_record` VALUES (140, 1, '机构管理', '查询全部', '/sys/organization/list', 'GET', 'com.asuka.module.system.controller.OrganizationController.list', '{}', NULL, '192.168.31.174', NULL, 20, 0, '2020-07-16 16:05:57', '2020-07-16 16:05:57');
INSERT INTO `sys_oper_record` VALUES (141, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"1\"]}', NULL, '192.168.31.174', NULL, 5, 0, '2020-07-16 16:05:57', '2020-07-16 16:05:57');
INSERT INTO `sys_oper_record` VALUES (142, 1, '字典管理', '查询全部', '/sys/dict/list', 'GET', 'com.asuka.module.system.controller.DictionaryController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 4, 0, '2020-07-16 16:05:58', '2020-07-16 16:05:58');
INSERT INTO `sys_oper_record` VALUES (143, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.module.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@dictId\":[\"2\"]}', NULL, '192.168.31.174', NULL, 15, 0, '2020-07-16 16:05:58', '2020-07-16 16:05:58');
INSERT INTO `sys_oper_record` VALUES (144, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '192.168.31.174', NULL, 8, 0, '2020-07-16 16:06:18', '2020-07-16 16:06:18');
INSERT INTO `sys_oper_record` VALUES (145, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.asuka.module.system.controller.MenuController.update', NULL, '{\"code\":0,\"msg\":\"修改成功\"}', '192.168.31.174', NULL, 24, 0, '2020-07-16 16:06:33', '2020-07-16 16:06:33');
INSERT INTO `sys_oper_record` VALUES (146, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '192.168.31.174', NULL, 6, 0, '2020-07-16 16:06:33', '2020-07-16 16:06:33');
INSERT INTO `sys_oper_record` VALUES (147, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '192.168.31.174', NULL, 5, 0, '2020-07-16 16:06:37', '2020-07-16 16:06:37');
INSERT INTO `sys_oper_record` VALUES (148, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '192.168.31.174', NULL, 1698, 0, '2020-07-16 17:42:45', '2020-07-16 17:42:45');
INSERT INTO `sys_oper_record` VALUES (149, NULL, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.asuka.module.system.controller.MenuController.save', NULL, '{\"code\":0,\"msg\":\"添加成功\"}', '192.168.31.174', NULL, 47269, 0, '2020-07-16 17:43:48', '2020-07-16 17:43:48');
INSERT INTO `sys_oper_record` VALUES (150, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '192.168.31.174', NULL, 3099, 0, '2020-07-16 17:44:44', '2020-07-16 17:44:44');
INSERT INTO `sys_oper_record` VALUES (151, NULL, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.asuka.module.system.controller.MenuController.save', NULL, '{\"code\":0,\"msg\":\"添加成功\"}', '192.168.31.174', NULL, 383340, 0, '2020-07-16 18:03:34', '2020-07-16 18:03:34');
INSERT INTO `sys_oper_record` VALUES (152, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', 'org.beetl.sql.core.BeetlSQLException: table \"option\" not exist', 12, 1, '2020-07-16 18:12:40', '2020-07-16 18:12:40');
INSERT INTO `sys_oper_record` VALUES (153, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', 'org.beetl.sql.core.BeetlSQLException: table \"sys_option\" not exist', 14, 1, '2020-07-16 19:05:53', '2020-07-16 19:05:53');
INSERT INTO `sys_oper_record` VALUES (154, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', 'org.beetl.sql.core.BeetlSQLException: table \"sys_option\" not exist', 3, 1, '2020-07-16 19:08:10', '2020-07-16 19:08:10');
INSERT INTO `sys_oper_record` VALUES (155, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', 'org.beetl.sql.core.BeetlSQLException: table \"sys_option\" not exist', 3, 1, '2020-07-16 19:08:17', '2020-07-16 19:08:17');
INSERT INTO `sys_oper_record` VALUES (156, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 48, 0, '2020-07-16 19:09:03', '2020-07-16 19:09:03');
INSERT INTO `sys_oper_record` VALUES (157, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 10, 0, '2020-07-16 19:56:52', '2020-07-16 19:56:52');
INSERT INTO `sys_oper_record` VALUES (158, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"2\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 34, 0, '2020-07-16 19:57:25', '2020-07-16 19:57:25');
INSERT INTO `sys_oper_record` VALUES (159, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 7, 0, '2020-07-16 19:57:26', '2020-07-16 19:57:26');
INSERT INTO `sys_oper_record` VALUES (160, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"2\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 6, 0, '2020-07-16 19:57:27', '2020-07-16 19:57:27');
INSERT INTO `sys_oper_record` VALUES (161, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 7, 0, '2020-07-16 19:57:28', '2020-07-16 19:57:28');
INSERT INTO `sys_oper_record` VALUES (162, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '192.168.31.174', NULL, 7, 0, '2020-07-16 20:12:07', '2020-07-16 20:12:07');
INSERT INTO `sys_oper_record` VALUES (163, 1, '系统配置管理', '修改', '/sys/option/update', 'POST', 'com.asuka.module.system.controller.OptionController.update', NULL, NULL, '192.168.31.174', 'org.beetl.sql.core.BeetlSQLException: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'AND `id` <> 11\' at line 1', 74, 1, '2020-07-16 20:16:25', '2020-07-16 20:16:25');
INSERT INTO `sys_oper_record` VALUES (164, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '192.168.31.174', NULL, 38, 0, '2020-07-16 20:23:26', '2020-07-16 20:23:26');
INSERT INTO `sys_oper_record` VALUES (165, 1, '系统配置管理', '修改', '/sys/option/update', 'POST', 'com.asuka.module.system.controller.OptionController.update', NULL, NULL, '192.168.31.174', 'org.beetl.sql.core.BeetlSQLException: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'AND `id` <> 11\' at line 1', 30386, 1, '2020-07-16 20:24:18', '2020-07-16 20:24:18');
INSERT INTO `sys_oper_record` VALUES (166, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '192.168.31.174', NULL, 8, 0, '2020-07-16 20:28:17', '2020-07-16 20:28:17');
INSERT INTO `sys_oper_record` VALUES (167, 1, '系统配置管理', '修改', '/sys/option/update', 'POST', 'com.asuka.module.system.controller.OptionController.update', NULL, '{\"code\":0,\"msg\":\"修改成功\"}', '192.168.31.174', NULL, 16008, 0, '2020-07-16 20:28:35', '2020-07-16 20:28:35');
INSERT INTO `sys_oper_record` VALUES (168, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '192.168.31.174', NULL, 6, 0, '2020-07-16 20:28:39', '2020-07-16 20:28:39');
INSERT INTO `sys_oper_record` VALUES (169, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"],\"sort\":[\"optionKey\"],\"order\":[\"asc\"]}', NULL, '192.168.31.174', NULL, 7, 0, '2020-07-16 20:28:43', '2020-07-16 20:28:43');
INSERT INTO `sys_oper_record` VALUES (170, 1, '系统配置管理', '修改', '/sys/option/update', 'POST', 'com.asuka.module.system.controller.OptionController.update', NULL, '{\"code\":0,\"msg\":\"修改成功\"}', '192.168.31.174', NULL, 2232, 0, '2020-07-16 20:29:04', '2020-07-16 20:29:04');
INSERT INTO `sys_oper_record` VALUES (171, 1, '系统配置管理', '修改', '/sys/option/update', 'POST', 'com.asuka.module.system.controller.OptionController.update', NULL, '{\"code\":0,\"msg\":\"修改成功\"}', '192.168.31.174', NULL, 6396, 0, '2020-07-16 20:29:15', '2020-07-16 20:29:15');
INSERT INTO `sys_oper_record` VALUES (172, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '192.168.31.174', NULL, 17, 0, '2020-07-16 20:29:17', '2020-07-16 20:29:17');
INSERT INTO `sys_oper_record` VALUES (173, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '192.168.31.174', NULL, 44, 0, '2020-07-16 20:29:32', '2020-07-16 20:29:32');
INSERT INTO `sys_oper_record` VALUES (174, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '192.168.31.174', NULL, 11, 0, '2020-07-16 21:04:00', '2020-07-16 21:04:00');
INSERT INTO `sys_oper_record` VALUES (175, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '192.168.31.174', NULL, 20, 0, '2020-07-16 21:08:23', '2020-07-16 21:08:23');
INSERT INTO `sys_oper_record` VALUES (176, 1, '系统配置管理', '修改', '/sys/option/update', 'POST', 'com.asuka.module.system.controller.OptionController.update', NULL, '{\"code\":0,\"msg\":\"修改成功\"}', '192.168.31.174', NULL, 9115, 0, '2020-07-16 21:08:50', '2020-07-16 21:08:50');
INSERT INTO `sys_oper_record` VALUES (177, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '192.168.31.174', NULL, 8, 0, '2020-07-16 21:09:09', '2020-07-16 21:09:09');
INSERT INTO `sys_oper_record` VALUES (178, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '192.168.31.174', NULL, 10, 0, '2020-07-16 21:37:04', '2020-07-16 21:37:04');
INSERT INTO `sys_oper_record` VALUES (179, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"40\"]}', NULL, '192.168.31.174', NULL, 7, 0, '2020-07-16 21:37:23', '2020-07-16 21:37:23');
INSERT INTO `sys_oper_record` VALUES (180, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 6, 0, '2020-07-16 21:37:52', '2020-07-16 21:37:52');
INSERT INTO `sys_oper_record` VALUES (181, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"2\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 11, 0, '2020-07-16 21:37:55', '2020-07-16 21:37:55');
INSERT INTO `sys_oper_record` VALUES (182, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '192.168.31.174', NULL, 71507, 0, '2020-07-16 21:39:24', '2020-07-16 21:39:24');
INSERT INTO `sys_oper_record` VALUES (183, 1, '系统配置管理', '修改', '/sys/option/update', 'POST', 'com.asuka.module.system.controller.OptionController.update', NULL, '{\"code\":0,\"msg\":\"修改成功\"}', '192.168.31.174', NULL, 6759, 0, '2020-07-16 21:40:02', '2020-07-16 21:40:02');
INSERT INTO `sys_oper_record` VALUES (184, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 22, 0, '2020-07-16 21:40:13', '2020-07-16 21:40:13');
INSERT INTO `sys_oper_record` VALUES (185, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 24, 0, '2020-07-16 21:40:50', '2020-07-16 21:40:50');
INSERT INTO `sys_oper_record` VALUES (186, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '192.168.31.174', NULL, 2747, 0, '2020-07-16 21:44:57', '2020-07-16 21:44:57');
INSERT INTO `sys_oper_record` VALUES (187, 1, '用户管理', '修改', '/sys/user/update', 'POST', 'com.asuka.module.system.controller.UserController.update', NULL, '{\"code\":0,\"msg\":\"修改成功\"}', '192.168.31.174', NULL, 69, 0, '2020-07-16 21:52:01', '2020-07-16 21:52:01');
INSERT INTO `sys_oper_record` VALUES (188, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 15, 0, '2020-07-16 21:52:01', '2020-07-16 21:52:01');
INSERT INTO `sys_oper_record` VALUES (189, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '192.168.31.174', NULL, 35, 0, '2020-07-16 22:24:58', '2020-07-16 22:24:58');
INSERT INTO `sys_oper_record` VALUES (190, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 14, 0, '2020-07-16 22:25:02', '2020-07-16 22:25:02');
INSERT INTO `sys_oper_record` VALUES (191, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 24, 0, '2020-07-16 22:25:56', '2020-07-16 22:25:56');
INSERT INTO `sys_oper_record` VALUES (192, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 18, 0, '2020-07-16 22:26:50', '2020-07-16 22:26:50');
INSERT INTO `sys_oper_record` VALUES (193, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 17, 0, '2020-07-16 22:28:58', '2020-07-16 22:28:58');
INSERT INTO `sys_oper_record` VALUES (194, 1, '用户管理', '修改', '/sys/user/update', 'POST', 'com.asuka.module.system.controller.UserController.update', NULL, '{\"code\":0,\"msg\":\"修改成功\"}', '192.168.31.174', NULL, 60, 0, '2020-07-16 22:30:20', '2020-07-16 22:30:20');
INSERT INTO `sys_oper_record` VALUES (195, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 15, 0, '2020-07-16 22:30:22', '2020-07-16 22:30:22');
INSERT INTO `sys_oper_record` VALUES (196, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '192.168.31.174', NULL, 41, 0, '2020-07-20 10:38:39', '2020-07-20 10:38:39');
INSERT INTO `sys_oper_record` VALUES (197, 1, '字典管理', '查询全部', '/sys/dict/list', 'GET', 'com.asuka.module.system.controller.DictionaryController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 6, 0, '2020-07-20 10:38:43', '2020-07-20 10:38:43');
INSERT INTO `sys_oper_record` VALUES (198, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.module.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@dictId\":[\"2\"]}', NULL, '192.168.31.174', NULL, 24, 0, '2020-07-20 10:38:43', '2020-07-20 10:38:43');
INSERT INTO `sys_oper_record` VALUES (199, 1, '文件管理', '查询全部', '/file/list', 'GET', 'com.asuka.plugin.file.controller.$FileController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 21, 0, '2020-07-20 10:38:48', '2020-07-20 10:38:48');
INSERT INTO `sys_oper_record` VALUES (200, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '192.168.31.174', NULL, 9, 0, '2020-07-20 10:39:01', '2020-07-20 10:39:01');
INSERT INTO `sys_oper_record` VALUES (201, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.asuka.module.system.controller.MenuController.save', NULL, '{\"code\":0,\"msg\":\"添加成功\"}', '192.168.31.174', NULL, 14, 0, '2020-07-20 10:40:16', '2020-07-20 10:40:16');
INSERT INTO `sys_oper_record` VALUES (202, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '192.168.31.174', NULL, 8, 0, '2020-07-20 10:40:16', '2020-07-20 10:40:16');
INSERT INTO `sys_oper_record` VALUES (203, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.asuka.module.system.controller.MenuController.save', NULL, '{\"code\":0,\"msg\":\"添加成功\"}', '192.168.31.174', NULL, 8, 0, '2020-07-20 10:41:07', '2020-07-20 10:41:07');
INSERT INTO `sys_oper_record` VALUES (204, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '192.168.31.174', NULL, 7, 0, '2020-07-20 10:41:07', '2020-07-20 10:41:07');
INSERT INTO `sys_oper_record` VALUES (205, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.asuka.module.system.controller.MenuController.save', NULL, '{\"code\":0,\"msg\":\"添加成功\"}', '192.168.31.174', NULL, 8, 0, '2020-07-20 10:41:43', '2020-07-20 10:41:43');
INSERT INTO `sys_oper_record` VALUES (206, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '192.168.31.174', NULL, 9, 0, '2020-07-20 10:41:43', '2020-07-20 10:41:43');
INSERT INTO `sys_oper_record` VALUES (207, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 10, 0, '2020-07-20 11:01:28', '2020-07-20 11:01:28');
INSERT INTO `sys_oper_record` VALUES (208, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '192.168.31.174', NULL, 29, 0, '2020-07-20 11:01:30', '2020-07-20 11:01:30');
INSERT INTO `sys_oper_record` VALUES (209, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/1', 'POST', 'com.asuka.module.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '192.168.31.174', NULL, 63, 0, '2020-07-20 11:01:36', '2020-07-20 11:01:36');
INSERT INTO `sys_oper_record` VALUES (210, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 7, 0, '2020-07-20 11:01:38', '2020-07-20 11:01:38');
INSERT INTO `sys_oper_record` VALUES (211, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 31, 0, '2020-07-20 14:50:12', '2020-07-20 14:50:12');
INSERT INTO `sys_oper_record` VALUES (212, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '127.0.0.1', NULL, 32, 0, '2020-07-20 15:14:41', '2020-07-20 15:14:41');
INSERT INTO `sys_oper_record` VALUES (213, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '127.0.0.1', NULL, 20, 0, '2020-07-20 15:17:12', '2020-07-20 15:17:12');
INSERT INTO `sys_oper_record` VALUES (214, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '127.0.0.1', NULL, 8, 0, '2020-07-20 15:18:06', '2020-07-20 15:18:06');
INSERT INTO `sys_oper_record` VALUES (215, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-20 15:18:09', '2020-07-20 15:18:09');
INSERT INTO `sys_oper_record` VALUES (216, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '127.0.0.1', NULL, 15, 0, '2020-07-20 15:28:39', '2020-07-20 15:28:39');
INSERT INTO `sys_oper_record` VALUES (217, 1, '系统配置管理', '修改', '/sys/option/update', 'POST', 'com.asuka.module.system.controller.OptionController.update', NULL, '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 23, 0, '2020-07-20 15:28:42', '2020-07-20 15:28:42');
INSERT INTO `sys_oper_record` VALUES (218, 1, '系统配置管理', '修改', '/sys/option/update', 'POST', 'com.asuka.module.system.controller.OptionController.update', NULL, '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 10, 0, '2020-07-20 15:29:03', '2020-07-20 15:29:03');
INSERT INTO `sys_oper_record` VALUES (219, 1, '文件管理', '查询全部', '/file/list', 'GET', 'com.asuka.plugin.file.controller.$FileController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 17, 0, '2020-07-28 22:22:36', '2020-07-28 22:22:36');
INSERT INTO `sys_oper_record` VALUES (220, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 24, 0, '2020-07-28 22:22:41', '2020-07-28 22:22:41');
INSERT INTO `sys_oper_record` VALUES (221, 1, '操作日志', '分页查询', '/sys/operRecord/page', 'GET', 'com.asuka.module.system.controller.OperRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 57, 0, '2020-07-28 22:22:42', '2020-07-28 22:22:42');
INSERT INTO `sys_oper_record` VALUES (222, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 24, 0, '2020-07-28 22:22:46', '2020-07-28 22:22:46');
INSERT INTO `sys_oper_record` VALUES (223, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 8, 0, '2020-07-28 22:22:47', '2020-07-28 22:22:47');
INSERT INTO `sys_oper_record` VALUES (224, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 8, 0, '2020-07-28 22:22:48', '2020-07-28 22:22:48');
INSERT INTO `sys_oper_record` VALUES (225, 1, '机构管理', '查询全部', '/sys/organization/list', 'GET', 'com.asuka.module.system.controller.OrganizationController.list', '{}', NULL, '127.0.0.1', NULL, 23, 0, '2020-07-28 22:22:48', '2020-07-28 22:22:48');
INSERT INTO `sys_oper_record` VALUES (226, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-28 22:22:48', '2020-07-28 22:22:48');
INSERT INTO `sys_oper_record` VALUES (227, 1, '字典管理', '查询全部', '/sys/dict/list', 'GET', 'com.asuka.module.system.controller.DictionaryController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-28 22:22:49', '2020-07-28 22:22:49');
INSERT INTO `sys_oper_record` VALUES (228, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.module.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@dictId\":[\"2\"]}', NULL, '127.0.0.1', NULL, 30, 0, '2020-07-28 22:22:49', '2020-07-28 22:22:49');
INSERT INTO `sys_oper_record` VALUES (229, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '127.0.0.1', NULL, 24, 0, '2020-07-28 22:22:51', '2020-07-28 22:22:51');
INSERT INTO `sys_oper_record` VALUES (230, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-29 10:33:54', '2020-07-29 10:33:54');
INSERT INTO `sys_oper_record` VALUES (231, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-29 10:33:58', '2020-07-29 10:33:58');
INSERT INTO `sys_oper_record` VALUES (232, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.asuka.module.system.controller.MenuController.update', NULL, '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 27, 0, '2020-07-29 10:35:45', '2020-07-29 10:35:45');
INSERT INTO `sys_oper_record` VALUES (233, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-29 10:35:45', '2020-07-29 10:35:45');
INSERT INTO `sys_oper_record` VALUES (234, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.asuka.module.system.controller.MenuController.update', NULL, '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 9, 0, '2020-07-29 10:36:02', '2020-07-29 10:36:02');
INSERT INTO `sys_oper_record` VALUES (235, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-29 10:36:02', '2020-07-29 10:36:02');
INSERT INTO `sys_oper_record` VALUES (236, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 10, 0, '2020-07-29 10:36:06', '2020-07-29 10:36:06');
INSERT INTO `sys_oper_record` VALUES (237, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 29, 0, '2020-07-29 10:36:08', '2020-07-29 10:36:08');
INSERT INTO `sys_oper_record` VALUES (238, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/1', 'POST', 'com.asuka.module.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '127.0.0.1', NULL, 68, 0, '2020-07-29 10:36:13', '2020-07-29 10:36:13');
INSERT INTO `sys_oper_record` VALUES (239, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-29 10:36:15', '2020-07-29 10:36:15');
INSERT INTO `sys_oper_record` VALUES (240, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 66, 0, '2020-07-29 10:36:57', '2020-07-29 10:36:57');
INSERT INTO `sys_oper_record` VALUES (241, 1, '字典管理', '分页查询', '/sys/quartzJob', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{}', NULL, '127.0.0.1', NULL, 45, 0, '2020-07-29 10:37:27', '2020-07-29 10:37:27');
INSERT INTO `sys_oper_record` VALUES (242, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-29 14:24:12', '2020-07-29 14:24:12');
INSERT INTO `sys_oper_record` VALUES (243, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.asuka.module.system.controller.MenuController.update', NULL, '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 43, 0, '2020-07-29 14:24:21', '2020-07-29 14:24:21');
INSERT INTO `sys_oper_record` VALUES (244, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-29 14:24:21', '2020-07-29 14:24:21');
INSERT INTO `sys_oper_record` VALUES (245, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.asuka.module.system.controller.MenuController.update', NULL, '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 8, 0, '2020-07-29 14:24:41', '2020-07-29 14:24:41');
INSERT INTO `sys_oper_record` VALUES (246, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-29 14:24:41', '2020-07-29 14:24:41');
INSERT INTO `sys_oper_record` VALUES (247, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-29 14:24:48', '2020-07-29 14:24:48');
INSERT INTO `sys_oper_record` VALUES (248, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 2834, 0, '2020-07-29 14:24:55', '2020-07-29 14:24:55');
INSERT INTO `sys_oper_record` VALUES (249, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 3981, 0, '2020-07-29 14:49:33', '2020-07-29 14:49:33');
INSERT INTO `sys_oper_record` VALUES (250, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-29 15:02:07', '2020-07-29 15:02:07');
INSERT INTO `sys_oper_record` VALUES (251, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 8, 0, '2020-07-29 15:04:18', '2020-07-29 15:04:18');
INSERT INTO `sys_oper_record` VALUES (252, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-29 17:57:51', '2020-07-29 17:57:51');
INSERT INTO `sys_oper_record` VALUES (253, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-29 17:58:04', '2020-07-29 17:58:04');
INSERT INTO `sys_oper_record` VALUES (254, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 9, 0, '2020-07-29 18:00:31', '2020-07-29 18:00:31');
INSERT INTO `sys_oper_record` VALUES (255, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 11, 0, '2020-07-29 18:01:26', '2020-07-29 18:01:26');
INSERT INTO `sys_oper_record` VALUES (256, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-29 18:01:37', '2020-07-29 18:01:37');
INSERT INTO `sys_oper_record` VALUES (257, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 26, 0, '2020-07-29 18:05:10', '2020-07-29 18:05:10');
INSERT INTO `sys_oper_record` VALUES (258, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 14, 0, '2020-07-29 18:05:12', '2020-07-29 18:05:12');
INSERT INTO `sys_oper_record` VALUES (259, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-29 18:05:37', '2020-07-29 18:05:37');
INSERT INTO `sys_oper_record` VALUES (260, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-29 18:12:19', '2020-07-29 18:12:19');
INSERT INTO `sys_oper_record` VALUES (261, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-29 18:13:22', '2020-07-29 18:13:22');
INSERT INTO `sys_oper_record` VALUES (262, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-29 18:13:26', '2020-07-29 18:13:26');
INSERT INTO `sys_oper_record` VALUES (263, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-29 18:13:36', '2020-07-29 18:13:36');
INSERT INTO `sys_oper_record` VALUES (264, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 13, 0, '2020-07-29 18:13:49', '2020-07-29 18:13:49');
INSERT INTO `sys_oper_record` VALUES (265, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 13, 0, '2020-07-29 18:14:26', '2020-07-29 18:14:26');
INSERT INTO `sys_oper_record` VALUES (266, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 26, 0, '2020-07-29 18:16:02', '2020-07-29 18:16:02');
INSERT INTO `sys_oper_record` VALUES (267, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 26, 0, '2020-07-29 18:26:26', '2020-07-29 18:26:26');
INSERT INTO `sys_oper_record` VALUES (268, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-29 18:27:17', '2020-07-29 18:27:17');
INSERT INTO `sys_oper_record` VALUES (269, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-29 18:28:43', '2020-07-29 18:28:43');
INSERT INTO `sys_oper_record` VALUES (270, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 9, 0, '2020-07-29 18:28:50', '2020-07-29 18:28:50');
INSERT INTO `sys_oper_record` VALUES (271, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-29 18:28:51', '2020-07-29 18:28:51');
INSERT INTO `sys_oper_record` VALUES (272, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 8, 0, '2020-07-29 18:28:59', '2020-07-29 18:28:59');
INSERT INTO `sys_oper_record` VALUES (273, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 43, 0, '2020-07-29 18:29:11', '2020-07-29 18:29:11');
INSERT INTO `sys_oper_record` VALUES (274, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 16, 0, '2020-07-29 18:30:04', '2020-07-29 18:30:04');
INSERT INTO `sys_oper_record` VALUES (275, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 20, 0, '2020-07-29 18:31:16', '2020-07-29 18:31:16');
INSERT INTO `sys_oper_record` VALUES (276, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 26, 0, '2020-07-29 18:34:02', '2020-07-29 18:34:02');
INSERT INTO `sys_oper_record` VALUES (277, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-29 18:37:02', '2020-07-29 18:37:02');
INSERT INTO `sys_oper_record` VALUES (278, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-29 18:37:04', '2020-07-29 18:37:04');
INSERT INTO `sys_oper_record` VALUES (279, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-29 18:37:13', '2020-07-29 18:37:13');
INSERT INTO `sys_oper_record` VALUES (280, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-29 18:38:25', '2020-07-29 18:38:25');
INSERT INTO `sys_oper_record` VALUES (281, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@like@jobClassName\":[\"test\"]}', NULL, '127.0.0.1', NULL, 9, 0, '2020-07-29 18:38:57', '2020-07-29 18:38:57');
INSERT INTO `sys_oper_record` VALUES (282, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@like@jobClassName\":[\"\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-29 18:38:58', '2020-07-29 18:38:58');
INSERT INTO `sys_oper_record` VALUES (283, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 21, 0, '2020-07-29 18:55:23', '2020-07-29 18:55:23');
INSERT INTO `sys_oper_record` VALUES (284, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-29 18:55:25', '2020-07-29 18:55:25');
INSERT INTO `sys_oper_record` VALUES (285, 1, '字典管理', '查询全部', '/sys/dict/list', 'GET', 'com.asuka.module.system.controller.DictionaryController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-29 18:56:03', '2020-07-29 18:56:03');
INSERT INTO `sys_oper_record` VALUES (286, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.module.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@dictId\":[\"2\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-29 18:56:03', '2020-07-29 18:56:03');
INSERT INTO `sys_oper_record` VALUES (287, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-29 18:56:35', '2020-07-29 18:56:35');
INSERT INTO `sys_oper_record` VALUES (288, 1, '操作日志', '分页查询', '/sys/operRecord/page', 'GET', 'com.asuka.module.system.controller.OperRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 33, 0, '2020-07-29 18:56:36', '2020-07-29 18:56:36');
INSERT INTO `sys_oper_record` VALUES (289, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-29 18:56:47', '2020-07-29 18:56:47');
INSERT INTO `sys_oper_record` VALUES (290, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 20, 0, '2020-07-29 22:10:57', '2020-07-29 22:10:57');
INSERT INTO `sys_oper_record` VALUES (291, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-29 22:10:58', '2020-07-29 22:10:58');
INSERT INTO `sys_oper_record` VALUES (292, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-29 22:13:27', '2020-07-29 22:13:27');
INSERT INTO `sys_oper_record` VALUES (293, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 11, 0, '2020-07-29 22:14:05', '2020-07-29 22:14:05');
INSERT INTO `sys_oper_record` VALUES (294, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 12, 0, '2020-07-29 22:14:06', '2020-07-29 22:14:06');
INSERT INTO `sys_oper_record` VALUES (295, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 13, 0, '2020-07-29 22:19:33', '2020-07-29 22:19:33');
INSERT INTO `sys_oper_record` VALUES (296, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 9, 0, '2020-07-29 22:23:59', '2020-07-29 22:23:59');
INSERT INTO `sys_oper_record` VALUES (297, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-29 22:24:41', '2020-07-29 22:24:41');
INSERT INTO `sys_oper_record` VALUES (298, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 10, 0, '2020-07-29 22:26:29', '2020-07-29 22:26:29');
INSERT INTO `sys_oper_record` VALUES (299, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-29 22:26:40', '2020-07-29 22:26:40');
INSERT INTO `sys_oper_record` VALUES (300, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-29 22:26:41', '2020-07-29 22:26:41');
INSERT INTO `sys_oper_record` VALUES (301, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 8, 0, '2020-07-29 22:32:21', '2020-07-29 22:32:21');
INSERT INTO `sys_oper_record` VALUES (302, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-29 22:32:21', '2020-07-29 22:32:21');
INSERT INTO `sys_oper_record` VALUES (303, 1, '机构管理', '查询全部', '/sys/organization/list', 'GET', 'com.asuka.module.system.controller.OrganizationController.list', '{}', NULL, '127.0.0.1', NULL, 21, 0, '2020-07-29 22:32:22', '2020-07-29 22:32:22');
INSERT INTO `sys_oper_record` VALUES (304, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-29 22:32:22', '2020-07-29 22:32:22');
INSERT INTO `sys_oper_record` VALUES (305, 1, '机构管理', '查询全部', '/sys/organization/list', 'GET', 'com.asuka.module.system.controller.OrganizationController.list', '{}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-29 22:33:14', '2020-07-29 22:33:14');
INSERT INTO `sys_oper_record` VALUES (306, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-29 22:33:14', '2020-07-29 22:33:14');
INSERT INTO `sys_oper_record` VALUES (307, 1, '机构管理', '查询全部', '/sys/organization/list', 'GET', 'com.asuka.module.system.controller.OrganizationController.list', '{}', NULL, '127.0.0.1', NULL, 11, 0, '2020-07-29 22:37:04', '2020-07-29 22:37:04');
INSERT INTO `sys_oper_record` VALUES (308, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 2, 0, '2020-07-29 22:37:04', '2020-07-29 22:37:04');
INSERT INTO `sys_oper_record` VALUES (309, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-29 22:37:05', '2020-07-29 22:37:05');
INSERT INTO `sys_oper_record` VALUES (310, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-29 22:37:06', '2020-07-29 22:37:06');
INSERT INTO `sys_oper_record` VALUES (311, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-29 22:37:06', '2020-07-29 22:37:06');
INSERT INTO `sys_oper_record` VALUES (312, 1, '字典管理', '查询全部', '/sys/dict/list', 'GET', 'com.asuka.module.system.controller.DictionaryController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-29 22:39:48', '2020-07-29 22:39:48');
INSERT INTO `sys_oper_record` VALUES (313, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.module.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@dictId\":[\"2\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-29 22:39:48', '2020-07-29 22:39:48');
INSERT INTO `sys_oper_record` VALUES (314, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.asuka.module.system.controller.MenuController.remove', '{\"id\":[\"39\"]}', '{\"code\":0,\"msg\":\"删除成功\"}', '127.0.0.1', NULL, 8, 0, '2020-07-29 22:40:27', '2020-07-29 22:40:27');
INSERT INTO `sys_oper_record` VALUES (315, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-29 22:40:27', '2020-07-29 22:40:27');
INSERT INTO `sys_oper_record` VALUES (316, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.asuka.module.system.controller.MenuController.remove', '{\"id\":[\"30\"]}', '{\"code\":0,\"msg\":\"删除成功\"}', '127.0.0.1', NULL, 6, 0, '2020-07-29 22:40:39', '2020-07-29 22:40:39');
INSERT INTO `sys_oper_record` VALUES (317, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-29 22:40:39', '2020-07-29 22:40:39');
INSERT INTO `sys_oper_record` VALUES (318, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-30 11:11:42', '2020-07-30 11:11:42');
INSERT INTO `sys_oper_record` VALUES (319, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-30 11:11:43', '2020-07-30 11:11:43');
INSERT INTO `sys_oper_record` VALUES (320, 1, '机构管理', '查询全部', '/sys/organization/list', 'GET', 'com.asuka.module.system.controller.OrganizationController.list', '{}', NULL, '127.0.0.1', NULL, 2, 0, '2020-07-30 11:11:45', '2020-07-30 11:11:45');
INSERT INTO `sys_oper_record` VALUES (321, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 2, 0, '2020-07-30 11:11:45', '2020-07-30 11:11:45');
INSERT INTO `sys_oper_record` VALUES (322, 1, '字典管理', '查询全部', '/sys/dict/list', 'GET', 'com.asuka.module.system.controller.DictionaryController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-30 11:11:46', '2020-07-30 11:11:46');
INSERT INTO `sys_oper_record` VALUES (323, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.module.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@dictId\":[\"2\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-30 11:11:46', '2020-07-30 11:11:46');
INSERT INTO `sys_oper_record` VALUES (324, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-30 11:11:46', '2020-07-30 11:11:46');
INSERT INTO `sys_oper_record` VALUES (325, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-30 11:11:49', '2020-07-30 11:11:49');
INSERT INTO `sys_oper_record` VALUES (326, 1, '操作日志', '分页查询', '/sys/operRecord/page', 'GET', 'com.asuka.module.system.controller.OperRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 39, 0, '2020-07-30 11:11:49', '2020-07-30 11:11:49');
INSERT INTO `sys_oper_record` VALUES (327, 1, '文件管理', '查询全部', '/file/list', 'GET', 'com.asuka.plugin.file.controller.$FileController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-30 11:11:51', '2020-07-30 11:11:51');
INSERT INTO `sys_oper_record` VALUES (328, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-30 11:15:28', '2020-07-30 11:15:28');
INSERT INTO `sys_oper_record` VALUES (329, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-30 11:16:20', '2020-07-30 11:16:20');
INSERT INTO `sys_oper_record` VALUES (330, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-30 11:16:45', '2020-07-30 11:16:45');
INSERT INTO `sys_oper_record` VALUES (331, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-30 11:17:49', '2020-07-30 11:17:49');
INSERT INTO `sys_oper_record` VALUES (332, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-30 11:17:50', '2020-07-30 11:17:50');
INSERT INTO `sys_oper_record` VALUES (333, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 8, 0, '2020-07-30 11:17:50', '2020-07-30 11:17:50');
INSERT INTO `sys_oper_record` VALUES (334, 1, '机构管理', '查询全部', '/sys/organization/list', 'GET', 'com.asuka.module.system.controller.OrganizationController.list', '{}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-30 11:17:55', '2020-07-30 11:17:55');
INSERT INTO `sys_oper_record` VALUES (335, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-30 11:17:55', '2020-07-30 11:17:55');
INSERT INTO `sys_oper_record` VALUES (336, 1, '字典管理', '查询全部', '/sys/dict/list', 'GET', 'com.asuka.module.system.controller.DictionaryController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-30 11:17:56', '2020-07-30 11:17:56');
INSERT INTO `sys_oper_record` VALUES (337, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.module.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@dictId\":[\"2\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-30 11:17:56', '2020-07-30 11:17:56');
INSERT INTO `sys_oper_record` VALUES (338, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-30 11:17:56', '2020-07-30 11:17:56');
INSERT INTO `sys_oper_record` VALUES (339, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 11, 0, '2020-07-30 11:18:02', '2020-07-30 11:18:02');
INSERT INTO `sys_oper_record` VALUES (340, 1, '操作日志', '分页查询', '/sys/operRecord/page', 'GET', 'com.asuka.module.system.controller.OperRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 41, 0, '2020-07-30 11:18:02', '2020-07-30 11:18:02');
INSERT INTO `sys_oper_record` VALUES (341, 1, '文件管理', '查询全部', '/file/list', 'GET', 'com.asuka.plugin.file.controller.$FileController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 2, 0, '2020-07-30 11:18:25', '2020-07-30 11:18:25');
INSERT INTO `sys_oper_record` VALUES (342, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-30 11:20:15', '2020-07-30 11:20:15');
INSERT INTO `sys_oper_record` VALUES (343, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-30 11:21:21', '2020-07-30 11:21:21');
INSERT INTO `sys_oper_record` VALUES (344, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 9, 0, '2020-07-30 11:21:32', '2020-07-30 11:21:32');
INSERT INTO `sys_oper_record` VALUES (345, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 10, 0, '2020-07-30 11:21:34', '2020-07-30 11:21:34');
INSERT INTO `sys_oper_record` VALUES (346, 1, '机构管理', '查询全部', '/sys/organization/list', 'GET', 'com.asuka.module.system.controller.OrganizationController.list', '{}', NULL, '127.0.0.1', NULL, 2, 0, '2020-07-30 11:21:38', '2020-07-30 11:21:38');
INSERT INTO `sys_oper_record` VALUES (347, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 2, 0, '2020-07-30 11:21:38', '2020-07-30 11:21:38');
INSERT INTO `sys_oper_record` VALUES (348, 1, '字典管理', '查询全部', '/sys/dict/list', 'GET', 'com.asuka.module.system.controller.DictionaryController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 2, 0, '2020-07-30 11:21:43', '2020-07-30 11:21:43');
INSERT INTO `sys_oper_record` VALUES (349, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.module.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@dictId\":[\"2\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-30 11:21:43', '2020-07-30 11:21:43');
INSERT INTO `sys_oper_record` VALUES (350, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-30 11:21:53', '2020-07-30 11:21:53');
INSERT INTO `sys_oper_record` VALUES (351, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-30 11:21:55', '2020-07-30 11:21:55');
INSERT INTO `sys_oper_record` VALUES (352, 1, '操作日志', '分页查询', '/sys/operRecord/page', 'GET', 'com.asuka.module.system.controller.OperRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 35, 0, '2020-07-30 11:21:59', '2020-07-30 11:21:59');
INSERT INTO `sys_oper_record` VALUES (353, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-30 11:22:54', '2020-07-30 11:22:54');
INSERT INTO `sys_oper_record` VALUES (354, 1, '操作日志', '分页查询', '/sys/operRecord/page', 'GET', 'com.asuka.module.system.controller.OperRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 34, 0, '2020-07-30 11:22:58', '2020-07-30 11:22:58');
INSERT INTO `sys_oper_record` VALUES (355, 1, '操作日志', '分页查询', '/sys/operRecord/page', 'GET', 'com.asuka.module.system.controller.OperRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@like@userId\":[\"\"],\"search@like@model\":[\"\"],\"search@between@createTime\":[\"\"],\"createTimeStart\":[\"\"],\"createTimeEnd\":[\"\"]}', NULL, '127.0.0.1', NULL, 24, 0, '2020-07-30 11:23:00', '2020-07-30 11:23:00');
INSERT INTO `sys_oper_record` VALUES (356, 1, '文件管理', '查询全部', '/file/list', 'GET', 'com.asuka.plugin.file.controller.$FileController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 1, 0, '2020-07-30 11:23:04', '2020-07-30 11:23:04');
INSERT INTO `sys_oper_record` VALUES (357, 1, '文件管理', '查询全部', '/file/list', 'GET', 'com.asuka.plugin.file.controller.$FileController.list', '{\"dir\":[\"/\"]}', NULL, '127.0.0.1', NULL, 1, 0, '2020-07-30 11:23:05', '2020-07-30 11:23:05');
INSERT INTO `sys_oper_record` VALUES (358, 1, '文件管理', '查询全部', '/file/list', 'GET', 'com.asuka.plugin.file.controller.$FileController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 1, 0, '2020-07-30 11:25:58', '2020-07-30 11:25:58');
INSERT INTO `sys_oper_record` VALUES (359, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-30 11:26:01', '2020-07-30 11:26:01');
INSERT INTO `sys_oper_record` VALUES (360, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-30 11:26:10', '2020-07-30 11:26:10');
INSERT INTO `sys_oper_record` VALUES (361, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-30 11:26:13', '2020-07-30 11:26:13');
INSERT INTO `sys_oper_record` VALUES (362, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 2, 0, '2020-07-30 11:26:15', '2020-07-30 11:26:15');
INSERT INTO `sys_oper_record` VALUES (363, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.asuka.module.system.controller.MenuController.remove', '{\"id\":[\"35\"]}', '{\"code\":0,\"msg\":\"删除成功\"}', '127.0.0.1', NULL, 8, 0, '2020-07-30 11:26:22', '2020-07-30 11:26:22');
INSERT INTO `sys_oper_record` VALUES (364, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-30 11:26:22', '2020-07-30 11:26:22');
INSERT INTO `sys_oper_record` VALUES (365, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-30 11:26:31', '2020-07-30 11:26:31');
INSERT INTO `sys_oper_record` VALUES (366, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.asuka.module.system.controller.MenuController.update', NULL, '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 21, 0, '2020-07-30 11:26:43', '2020-07-30 11:26:43');
INSERT INTO `sys_oper_record` VALUES (367, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 2, 0, '2020-07-30 11:26:43', '2020-07-30 11:26:43');
INSERT INTO `sys_oper_record` VALUES (368, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-30 11:26:46', '2020-07-30 11:26:46');
INSERT INTO `sys_oper_record` VALUES (369, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-30 11:33:38', '2020-07-30 11:33:38');
INSERT INTO `sys_oper_record` VALUES (370, 1, '机构管理', '查询全部', '/sys/organization/list', 'GET', 'com.asuka.module.system.controller.OrganizationController.list', '{}', NULL, '127.0.0.1', NULL, 2, 0, '2020-07-30 11:33:39', '2020-07-30 11:33:39');
INSERT INTO `sys_oper_record` VALUES (371, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 2, 0, '2020-07-30 11:33:39', '2020-07-30 11:33:39');
INSERT INTO `sys_oper_record` VALUES (372, 1, '字典管理', '查询全部', '/sys/dict/list', 'GET', 'com.asuka.module.system.controller.DictionaryController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 1, 0, '2020-07-30 11:33:40', '2020-07-30 11:33:40');
INSERT INTO `sys_oper_record` VALUES (373, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.module.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@dictId\":[\"2\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-30 11:33:40', '2020-07-30 11:33:40');
INSERT INTO `sys_oper_record` VALUES (374, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-30 11:33:41', '2020-07-30 11:33:41');
INSERT INTO `sys_oper_record` VALUES (375, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 8, 0, '2020-07-30 11:33:41', '2020-07-30 11:33:41');
INSERT INTO `sys_oper_record` VALUES (376, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 9, 0, '2020-07-31 11:05:22', '2020-07-31 11:05:22');
INSERT INTO `sys_oper_record` VALUES (377, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 8, 0, '2020-07-31 11:06:07', '2020-07-31 11:06:07');
INSERT INTO `sys_oper_record` VALUES (378, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 29, 0, '2020-07-31 14:33:12', '2020-07-31 14:33:12');
INSERT INTO `sys_oper_record` VALUES (379, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-31 14:36:19', '2020-07-31 14:36:19');
INSERT INTO `sys_oper_record` VALUES (380, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 11, 0, '2020-07-31 14:36:20', '2020-07-31 14:36:20');
INSERT INTO `sys_oper_record` VALUES (381, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-31 14:36:39', '2020-07-31 14:36:39');
INSERT INTO `sys_oper_record` VALUES (382, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 11, 0, '2020-07-31 14:37:43', '2020-07-31 14:37:43');
INSERT INTO `sys_oper_record` VALUES (383, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 15, 0, '2020-07-31 14:38:17', '2020-07-31 14:38:17');
INSERT INTO `sys_oper_record` VALUES (384, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-31 14:38:57', '2020-07-31 14:38:57');
INSERT INTO `sys_oper_record` VALUES (385, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 8, 0, '2020-07-31 14:39:33', '2020-07-31 14:39:33');
INSERT INTO `sys_oper_record` VALUES (386, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-31 14:40:45', '2020-07-31 14:40:45');
INSERT INTO `sys_oper_record` VALUES (387, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 8, 0, '2020-07-31 14:41:20', '2020-07-31 14:41:20');
INSERT INTO `sys_oper_record` VALUES (388, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-31 14:42:09', '2020-07-31 14:42:09');
INSERT INTO `sys_oper_record` VALUES (389, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-31 14:43:17', '2020-07-31 14:43:17');
INSERT INTO `sys_oper_record` VALUES (390, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-31 14:44:02', '2020-07-31 14:44:02');
INSERT INTO `sys_oper_record` VALUES (391, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-31 14:44:30', '2020-07-31 14:44:30');
INSERT INTO `sys_oper_record` VALUES (392, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 14, 0, '2020-07-31 14:44:39', '2020-07-31 14:44:39');
INSERT INTO `sys_oper_record` VALUES (393, 1, '操作日志', '分页查询', '/sys/operRecord/page', 'GET', 'com.asuka.module.system.controller.OperRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 65, 0, '2020-07-31 14:44:40', '2020-07-31 14:44:40');
INSERT INTO `sys_oper_record` VALUES (394, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 14:59:23', '2020-07-31 14:59:23');
INSERT INTO `sys_oper_record` VALUES (395, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-31 15:00:13', '2020-07-31 15:00:13');
INSERT INTO `sys_oper_record` VALUES (396, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-31 15:01:59', '2020-07-31 15:01:59');
INSERT INTO `sys_oper_record` VALUES (397, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-31 15:02:32', '2020-07-31 15:02:32');
INSERT INTO `sys_oper_record` VALUES (398, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-31 15:02:37', '2020-07-31 15:02:37');
INSERT INTO `sys_oper_record` VALUES (399, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-31 15:03:18', '2020-07-31 15:03:18');
INSERT INTO `sys_oper_record` VALUES (400, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-31 15:04:04', '2020-07-31 15:04:04');
INSERT INTO `sys_oper_record` VALUES (401, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-31 15:05:20', '2020-07-31 15:05:20');
INSERT INTO `sys_oper_record` VALUES (402, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 15:06:10', '2020-07-31 15:06:10');
INSERT INTO `sys_oper_record` VALUES (403, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 41, 0, '2020-07-31 15:09:38', '2020-07-31 15:09:38');
INSERT INTO `sys_oper_record` VALUES (404, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 8, 0, '2020-07-31 15:10:10', '2020-07-31 15:10:10');
INSERT INTO `sys_oper_record` VALUES (405, 1, '机构管理', '查询全部', '/sys/organization/list', 'GET', 'com.asuka.module.system.controller.OrganizationController.list', '{}', NULL, '127.0.0.1', NULL, 25, 0, '2020-07-31 15:10:11', '2020-07-31 15:10:11');
INSERT INTO `sys_oper_record` VALUES (406, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 15:10:11', '2020-07-31 15:10:11');
INSERT INTO `sys_oper_record` VALUES (407, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 15:10:13', '2020-07-31 15:10:13');
INSERT INTO `sys_oper_record` VALUES (408, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 21, 0, '2020-07-31 15:10:14', '2020-07-31 15:10:14');
INSERT INTO `sys_oper_record` VALUES (409, 1, '字典管理', '查询全部', '/sys/dict/list', 'GET', 'com.asuka.module.system.controller.DictionaryController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 15:10:15', '2020-07-31 15:10:15');
INSERT INTO `sys_oper_record` VALUES (410, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.module.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@dictId\":[\"2\"]}', NULL, '127.0.0.1', NULL, 24, 0, '2020-07-31 15:10:15', '2020-07-31 15:10:15');
INSERT INTO `sys_oper_record` VALUES (411, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 14, 0, '2020-07-31 15:10:59', '2020-07-31 15:10:59');
INSERT INTO `sys_oper_record` VALUES (412, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 15, 0, '2020-07-31 15:12:14', '2020-07-31 15:12:14');
INSERT INTO `sys_oper_record` VALUES (413, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 18, 0, '2020-07-31 15:12:25', '2020-07-31 15:12:25');
INSERT INTO `sys_oper_record` VALUES (414, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 12, 0, '2020-07-31 15:13:18', '2020-07-31 15:13:18');
INSERT INTO `sys_oper_record` VALUES (415, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 15:13:25', '2020-07-31 15:13:25');
INSERT INTO `sys_oper_record` VALUES (416, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 15:13:27', '2020-07-31 15:13:27');
INSERT INTO `sys_oper_record` VALUES (417, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 9, 0, '2020-07-31 15:15:25', '2020-07-31 15:15:25');
INSERT INTO `sys_oper_record` VALUES (418, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 15:15:53', '2020-07-31 15:15:53');
INSERT INTO `sys_oper_record` VALUES (419, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.asuka.module.system.controller.MenuController.save', NULL, '{\"code\":0,\"msg\":\"添加成功\"}', '127.0.0.1', NULL, 13, 0, '2020-07-31 15:16:26', '2020-07-31 15:16:26');
INSERT INTO `sys_oper_record` VALUES (420, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 15:16:26', '2020-07-31 15:16:26');
INSERT INTO `sys_oper_record` VALUES (421, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 33, 0, '2020-07-31 15:16:29', '2020-07-31 15:16:29');
INSERT INTO `sys_oper_record` VALUES (422, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/1', 'POST', 'com.asuka.module.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '127.0.0.1', NULL, 72, 0, '2020-07-31 15:16:32', '2020-07-31 15:16:32');
INSERT INTO `sys_oper_record` VALUES (423, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 10, 0, '2020-07-31 15:16:34', '2020-07-31 15:16:34');
INSERT INTO `sys_oper_record` VALUES (424, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 12, 0, '2020-07-31 15:21:28', '2020-07-31 15:21:28');
INSERT INTO `sys_oper_record` VALUES (425, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 15:21:28', '2020-07-31 15:21:28');
INSERT INTO `sys_oper_record` VALUES (426, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 15:21:29', '2020-07-31 15:21:29');
INSERT INTO `sys_oper_record` VALUES (427, 1, '机构管理', '查询全部', '/sys/organization/list', 'GET', 'com.asuka.module.system.controller.OrganizationController.list', '{}', NULL, '127.0.0.1', NULL, 43, 0, '2020-07-31 15:21:29', '2020-07-31 15:21:29');
INSERT INTO `sys_oper_record` VALUES (428, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-31 15:21:29', '2020-07-31 15:21:29');
INSERT INTO `sys_oper_record` VALUES (429, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.asuka.module.system.controller.MenuController.update', NULL, '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 94, 0, '2020-07-31 15:22:11', '2020-07-31 15:22:11');
INSERT INTO `sys_oper_record` VALUES (430, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 15:22:11', '2020-07-31 15:22:11');
INSERT INTO `sys_oper_record` VALUES (431, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.asuka.module.system.controller.MenuController.update', NULL, '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 9, 0, '2020-07-31 15:22:16', '2020-07-31 15:22:16');
INSERT INTO `sys_oper_record` VALUES (432, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-31 15:22:16', '2020-07-31 15:22:16');
INSERT INTO `sys_oper_record` VALUES (433, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-31 15:22:18', '2020-07-31 15:22:18');
INSERT INTO `sys_oper_record` VALUES (434, 1, '菜单管理', '删除', '/sys/menu/remove', 'GET', 'com.asuka.module.system.controller.MenuController.remove', '{\"id\":[\"27\"]}', '{\"code\":0,\"msg\":\"删除成功\"}', '127.0.0.1', NULL, 10, 0, '2020-07-31 15:22:46', '2020-07-31 15:22:46');
INSERT INTO `sys_oper_record` VALUES (435, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 15:22:46', '2020-07-31 15:22:46');
INSERT INTO `sys_oper_record` VALUES (436, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-31 15:23:01', '2020-07-31 15:23:01');
INSERT INTO `sys_oper_record` VALUES (437, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '127.0.0.1', NULL, 10, 0, '2020-07-31 15:23:02', '2020-07-31 15:23:02');
INSERT INTO `sys_oper_record` VALUES (438, 1, '字典管理', '查询全部', '/sys/dict/list', 'GET', 'com.asuka.module.system.controller.DictionaryController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-31 15:23:06', '2020-07-31 15:23:06');
INSERT INTO `sys_oper_record` VALUES (439, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.module.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@dictId\":[\"2\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 15:23:06', '2020-07-31 15:23:06');
INSERT INTO `sys_oper_record` VALUES (440, 1, '机构管理', '查询全部', '/sys/organization/list', 'GET', 'com.asuka.module.system.controller.OrganizationController.list', '{}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-31 15:23:08', '2020-07-31 15:23:08');
INSERT INTO `sys_oper_record` VALUES (441, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-31 15:23:08', '2020-07-31 15:23:08');
INSERT INTO `sys_oper_record` VALUES (442, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"9\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-31 15:24:48', '2020-07-31 15:24:48');
INSERT INTO `sys_oper_record` VALUES (443, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"8\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-31 15:24:48', '2020-07-31 15:24:48');
INSERT INTO `sys_oper_record` VALUES (444, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"2\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-31 15:24:49', '2020-07-31 15:24:49');
INSERT INTO `sys_oper_record` VALUES (445, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"6\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-31 15:24:50', '2020-07-31 15:24:50');
INSERT INTO `sys_oper_record` VALUES (446, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"5\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-31 15:24:52', '2020-07-31 15:24:52');
INSERT INTO `sys_oper_record` VALUES (447, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"4\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-31 15:24:53', '2020-07-31 15:24:53');
INSERT INTO `sys_oper_record` VALUES (448, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"3\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-31 15:24:53', '2020-07-31 15:24:53');
INSERT INTO `sys_oper_record` VALUES (449, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 9, 0, '2020-07-31 15:24:58', '2020-07-31 15:24:58');
INSERT INTO `sys_oper_record` VALUES (450, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 15:25:01', '2020-07-31 15:25:01');
INSERT INTO `sys_oper_record` VALUES (451, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 17, 0, '2020-07-31 15:28:01', '2020-07-31 15:28:01');
INSERT INTO `sys_oper_record` VALUES (452, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 20, 0, '2020-07-31 15:28:36', '2020-07-31 15:28:36');
INSERT INTO `sys_oper_record` VALUES (453, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 12, 0, '2020-07-31 15:31:43', '2020-07-31 15:31:43');
INSERT INTO `sys_oper_record` VALUES (454, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 14, 0, '2020-07-31 15:32:59', '2020-07-31 15:32:59');
INSERT INTO `sys_oper_record` VALUES (455, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 17, 0, '2020-07-31 15:33:02', '2020-07-31 15:33:02');
INSERT INTO `sys_oper_record` VALUES (456, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 14, 0, '2020-07-31 15:33:17', '2020-07-31 15:33:17');
INSERT INTO `sys_oper_record` VALUES (457, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 12, 0, '2020-07-31 15:34:30', '2020-07-31 15:34:30');
INSERT INTO `sys_oper_record` VALUES (458, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 11, 0, '2020-07-31 15:38:03', '2020-07-31 15:38:03');
INSERT INTO `sys_oper_record` VALUES (459, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 15, 0, '2020-07-31 15:38:14', '2020-07-31 15:38:14');
INSERT INTO `sys_oper_record` VALUES (460, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 15, 0, '2020-07-31 15:39:20', '2020-07-31 15:39:20');
INSERT INTO `sys_oper_record` VALUES (461, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 15:40:03', '2020-07-31 15:40:03');
INSERT INTO `sys_oper_record` VALUES (462, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"3\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-31 15:40:07', '2020-07-31 15:40:07');
INSERT INTO `sys_oper_record` VALUES (463, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 8, 0, '2020-07-31 15:40:46', '2020-07-31 15:40:46');
INSERT INTO `sys_oper_record` VALUES (464, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"3\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-31 15:40:47', '2020-07-31 15:40:47');
INSERT INTO `sys_oper_record` VALUES (465, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 15:41:37', '2020-07-31 15:41:37');
INSERT INTO `sys_oper_record` VALUES (466, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"2\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-31 15:41:38', '2020-07-31 15:41:38');
INSERT INTO `sys_oper_record` VALUES (467, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"3\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-31 15:41:42', '2020-07-31 15:41:42');
INSERT INTO `sys_oper_record` VALUES (468, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 15:44:07', '2020-07-31 15:44:07');
INSERT INTO `sys_oper_record` VALUES (469, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"3\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-31 15:44:13', '2020-07-31 15:44:13');
INSERT INTO `sys_oper_record` VALUES (470, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"3\"]}', NULL, '127.0.0.1', NULL, 8, 0, '2020-07-31 15:45:08', '2020-07-31 15:45:08');
INSERT INTO `sys_oper_record` VALUES (471, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-31 15:45:23', '2020-07-31 15:45:23');
INSERT INTO `sys_oper_record` VALUES (472, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-31 15:46:14', '2020-07-31 15:46:14');
INSERT INTO `sys_oper_record` VALUES (473, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 9, 0, '2020-07-31 15:53:54', '2020-07-31 15:53:54');
INSERT INTO `sys_oper_record` VALUES (474, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 12, 0, '2020-07-31 16:03:09', '2020-07-31 16:03:09');
INSERT INTO `sys_oper_record` VALUES (475, 1, '机构管理', '查询全部', '/sys/organization/list', 'GET', 'com.asuka.module.system.controller.OrganizationController.list', '{}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-31 16:03:10', '2020-07-31 16:03:10');
INSERT INTO `sys_oper_record` VALUES (476, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-31 16:03:10', '2020-07-31 16:03:10');
INSERT INTO `sys_oper_record` VALUES (477, 1, '字典管理', '查询全部', '/sys/dict/list', 'GET', 'com.asuka.module.system.controller.DictionaryController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-31 16:03:11', '2020-07-31 16:03:11');
INSERT INTO `sys_oper_record` VALUES (478, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.module.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@dictId\":[\"2\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-31 16:03:11', '2020-07-31 16:03:11');
INSERT INTO `sys_oper_record` VALUES (479, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-31 16:03:12', '2020-07-31 16:03:12');
INSERT INTO `sys_oper_record` VALUES (480, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 8, 0, '2020-07-31 16:03:18', '2020-07-31 16:03:18');
INSERT INTO `sys_oper_record` VALUES (481, 1, '操作日志', '分页查询', '/sys/operRecord/page', 'GET', 'com.asuka.module.system.controller.OperRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 53, 0, '2020-07-31 16:03:19', '2020-07-31 16:03:19');
INSERT INTO `sys_oper_record` VALUES (482, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 16:03:22', '2020-07-31 16:03:22');
INSERT INTO `sys_oper_record` VALUES (483, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.asuka.module.system.controller.MenuController.save', NULL, '{\"code\":0,\"msg\":\"添加成功\"}', '127.0.0.1', NULL, 9, 0, '2020-07-31 16:04:31', '2020-07-31 16:04:31');
INSERT INTO `sys_oper_record` VALUES (484, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-31 16:04:31', '2020-07-31 16:04:31');
INSERT INTO `sys_oper_record` VALUES (485, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 9, 0, '2020-07-31 16:04:37', '2020-07-31 16:04:37');
INSERT INTO `sys_oper_record` VALUES (486, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/1', 'POST', 'com.asuka.module.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '127.0.0.1', NULL, 64, 0, '2020-07-31 16:04:43', '2020-07-31 16:04:43');
INSERT INTO `sys_oper_record` VALUES (487, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 16:04:46', '2020-07-31 16:04:46');
INSERT INTO `sys_oper_record` VALUES (488, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 18, 0, '2020-07-31 18:16:35', '2020-07-31 18:16:35');
INSERT INTO `sys_oper_record` VALUES (489, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 56, 0, '2020-07-31 18:19:47', '2020-07-31 18:19:47');
INSERT INTO `sys_oper_record` VALUES (490, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 8, 0, '2020-07-31 18:22:24', '2020-07-31 18:22:24');
INSERT INTO `sys_oper_record` VALUES (491, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 10, 0, '2020-07-31 18:22:48', '2020-07-31 18:22:48');
INSERT INTO `sys_oper_record` VALUES (492, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 9, 0, '2020-07-31 18:23:09', '2020-07-31 18:23:09');
INSERT INTO `sys_oper_record` VALUES (493, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 9, 0, '2020-07-31 18:24:10', '2020-07-31 18:24:10');
INSERT INTO `sys_oper_record` VALUES (494, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 10, 0, '2020-07-31 18:25:05', '2020-07-31 18:25:05');
INSERT INTO `sys_oper_record` VALUES (495, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 9, 0, '2020-07-31 18:25:13', '2020-07-31 18:25:13');
INSERT INTO `sys_oper_record` VALUES (496, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 17, 0, '2020-07-31 18:25:49', '2020-07-31 18:25:49');
INSERT INTO `sys_oper_record` VALUES (497, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '192.168.31.174', NULL, 7, 0, '2020-07-31 18:26:05', '2020-07-31 18:26:05');
INSERT INTO `sys_oper_record` VALUES (498, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 13, 0, '2020-07-31 18:27:05', '2020-07-31 18:27:05');
INSERT INTO `sys_oper_record` VALUES (499, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 8, 0, '2020-07-31 18:28:05', '2020-07-31 18:28:05');
INSERT INTO `sys_oper_record` VALUES (500, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 11, 0, '2020-07-31 18:28:12', '2020-07-31 18:28:12');
INSERT INTO `sys_oper_record` VALUES (501, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"2\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-31 18:28:20', '2020-07-31 18:28:20');
INSERT INTO `sys_oper_record` VALUES (502, 1, '操作日志', '分页查询', '/sys/operRecord/page', 'GET', 'com.asuka.module.system.controller.OperRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 54, 0, '2020-07-31 18:28:26', '2020-07-31 18:28:26');
INSERT INTO `sys_oper_record` VALUES (503, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 24, 0, '2020-07-31 20:38:50', '2020-07-31 20:38:50');
INSERT INTO `sys_oper_record` VALUES (504, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 11, 0, '2020-07-31 20:39:35', '2020-07-31 20:39:35');
INSERT INTO `sys_oper_record` VALUES (505, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 15, 0, '2020-07-31 20:41:12', '2020-07-31 20:41:12');
INSERT INTO `sys_oper_record` VALUES (506, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 16, 0, '2020-07-31 20:41:14', '2020-07-31 20:41:14');
INSERT INTO `sys_oper_record` VALUES (507, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 14, 0, '2020-07-31 20:43:06', '2020-07-31 20:43:06');
INSERT INTO `sys_oper_record` VALUES (508, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"sort\":[\"roleName\"],\"order\":[\"asc\"]}', NULL, '127.0.0.1', 'org.beetl.sql.core.BeetlSQLException: java.sql.SQLSyntaxErrorException: Unknown column \'role_name\' in \'order clause\'', 42, 1, '2020-07-31 20:43:21', '2020-07-31 20:43:21');
INSERT INTO `sys_oper_record` VALUES (509, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 13, 0, '2020-07-31 20:43:27', '2020-07-31 20:43:27');
INSERT INTO `sys_oper_record` VALUES (510, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-31 20:43:41', '2020-07-31 20:43:41');
INSERT INTO `sys_oper_record` VALUES (511, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-31 20:44:34', '2020-07-31 20:44:34');
INSERT INTO `sys_oper_record` VALUES (512, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 8, 0, '2020-07-31 20:45:58', '2020-07-31 20:45:58');
INSERT INTO `sys_oper_record` VALUES (513, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 50, 0, '2020-07-31 20:48:19', '2020-07-31 20:48:19');
INSERT INTO `sys_oper_record` VALUES (514, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"3\"]}', NULL, '127.0.0.1', NULL, 19, 0, '2020-07-31 20:50:36', '2020-07-31 20:50:36');
INSERT INTO `sys_oper_record` VALUES (515, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 10, 0, '2020-07-31 20:52:50', '2020-07-31 20:52:50');
INSERT INTO `sys_oper_record` VALUES (516, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-31 20:53:42', '2020-07-31 20:53:42');
INSERT INTO `sys_oper_record` VALUES (517, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 11, 0, '2020-07-31 20:54:12', '2020-07-31 20:54:12');
INSERT INTO `sys_oper_record` VALUES (518, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 8, 0, '2020-07-31 20:56:26', '2020-07-31 20:56:26');
INSERT INTO `sys_oper_record` VALUES (519, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 20:57:03', '2020-07-31 20:57:03');
INSERT INTO `sys_oper_record` VALUES (520, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 8, 0, '2020-07-31 20:57:31', '2020-07-31 20:57:31');
INSERT INTO `sys_oper_record` VALUES (521, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-31 20:57:48', '2020-07-31 20:57:48');
INSERT INTO `sys_oper_record` VALUES (522, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-31 20:57:50', '2020-07-31 20:57:50');
INSERT INTO `sys_oper_record` VALUES (523, 1, '机构管理', '查询全部', '/sys/organization/list', 'GET', 'com.asuka.module.system.controller.OrganizationController.list', '{}', NULL, '127.0.0.1', NULL, 24, 0, '2020-07-31 20:58:01', '2020-07-31 20:58:01');
INSERT INTO `sys_oper_record` VALUES (524, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-31 20:58:01', '2020-07-31 20:58:01');
INSERT INTO `sys_oper_record` VALUES (525, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"9\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-31 20:58:03', '2020-07-31 20:58:03');
INSERT INTO `sys_oper_record` VALUES (526, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"8\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-31 20:58:03', '2020-07-31 20:58:03');
INSERT INTO `sys_oper_record` VALUES (527, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"7\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-31 20:58:04', '2020-07-31 20:58:04');
INSERT INTO `sys_oper_record` VALUES (528, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"2\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-31 20:58:04', '2020-07-31 20:58:04');
INSERT INTO `sys_oper_record` VALUES (529, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"6\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-31 20:58:05', '2020-07-31 20:58:05');
INSERT INTO `sys_oper_record` VALUES (530, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"5\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-31 20:58:05', '2020-07-31 20:58:05');
INSERT INTO `sys_oper_record` VALUES (531, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"4\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-31 20:58:06', '2020-07-31 20:58:06');
INSERT INTO `sys_oper_record` VALUES (532, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"3\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-31 20:58:06', '2020-07-31 20:58:06');
INSERT INTO `sys_oper_record` VALUES (533, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"2\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-31 20:58:07', '2020-07-31 20:58:07');
INSERT INTO `sys_oper_record` VALUES (534, 1, '字典管理', '查询全部', '/sys/dict/list', 'GET', 'com.asuka.module.system.controller.DictionaryController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-31 20:58:13', '2020-07-31 20:58:13');
INSERT INTO `sys_oper_record` VALUES (535, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.module.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@dictId\":[\"2\"]}', NULL, '127.0.0.1', NULL, 14, 0, '2020-07-31 20:58:13', '2020-07-31 20:58:13');
INSERT INTO `sys_oper_record` VALUES (536, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.module.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@dictId\":[\"2\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-31 20:58:26', '2020-07-31 20:58:26');
INSERT INTO `sys_oper_record` VALUES (537, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.module.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@dictId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-31 20:58:26', '2020-07-31 20:58:26');
INSERT INTO `sys_oper_record` VALUES (538, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '127.0.0.1', NULL, 8, 0, '2020-07-31 20:58:36', '2020-07-31 20:58:36');
INSERT INTO `sys_oper_record` VALUES (539, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-31 20:59:23', '2020-07-31 20:59:23');
INSERT INTO `sys_oper_record` VALUES (540, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-31 20:59:27', '2020-07-31 20:59:27');
INSERT INTO `sys_oper_record` VALUES (541, 1, '操作日志', '分页查询', '/sys/operRecord/page', 'GET', 'com.asuka.module.system.controller.OperRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 41, 0, '2020-07-31 20:59:37', '2020-07-31 20:59:37');
INSERT INTO `sys_oper_record` VALUES (542, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 21:00:00', '2020-07-31 21:00:00');
INSERT INTO `sys_oper_record` VALUES (543, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 9, 0, '2020-07-31 21:04:37', '2020-07-31 21:04:37');
INSERT INTO `sys_oper_record` VALUES (544, 1, '用户管理', '修改状态', '/sys/user/state/update', 'POST', 'com.asuka.module.system.controller.UserController.updateState', '{\"id\":[\"1\"],\"state\":[\"1\"]}', '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 43, 0, '2020-07-31 21:06:27', '2020-07-31 21:06:27');
INSERT INTO `sys_oper_record` VALUES (545, 1, '用户管理', '修改状态', '/sys/user/state/update', 'POST', 'com.asuka.module.system.controller.UserController.updateState', '{\"id\":[\"1\"],\"state\":[\"0\"]}', '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 6, 0, '2020-07-31 21:06:28', '2020-07-31 21:06:28');
INSERT INTO `sys_oper_record` VALUES (546, 1, '用户管理', '修改状态', '/sys/user/state/update', 'POST', 'com.asuka.module.system.controller.UserController.updateState', '{\"id\":[\"1\"],\"state\":[\"1\"]}', '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 7, 0, '2020-07-31 21:06:57', '2020-07-31 21:06:57');
INSERT INTO `sys_oper_record` VALUES (547, 1, '用户管理', '修改状态', '/sys/user/state/update', 'POST', 'com.asuka.module.system.controller.UserController.updateState', '{\"id\":[\"1\"],\"state\":[\"0\"]}', '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 5, 0, '2020-07-31 21:06:57', '2020-07-31 21:06:57');
INSERT INTO `sys_oper_record` VALUES (548, 1, '用户管理', '修改状态', '/sys/user/state/update', 'POST', 'com.asuka.module.system.controller.UserController.updateState', '{\"id\":[\"1\"],\"state\":[\"1\"]}', '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 6, 0, '2020-07-31 21:06:59', '2020-07-31 21:06:59');
INSERT INTO `sys_oper_record` VALUES (549, 1, '用户管理', '修改状态', '/sys/user/state/update', 'POST', 'com.asuka.module.system.controller.UserController.updateState', '{\"id\":[\"1\"],\"state\":[\"0\"]}', '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 7, 0, '2020-07-31 21:06:59', '2020-07-31 21:06:59');
INSERT INTO `sys_oper_record` VALUES (550, 1, '用户管理', '修改状态', '/sys/user/state/update', 'POST', 'com.asuka.module.system.controller.UserController.updateState', '{\"id\":[\"1\"],\"state\":[\"1\"]}', '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 7, 0, '2020-07-31 21:07:01', '2020-07-31 21:07:01');
INSERT INTO `sys_oper_record` VALUES (551, 1, '用户管理', '修改状态', '/sys/user/state/update', 'POST', 'com.asuka.module.system.controller.UserController.updateState', '{\"id\":[\"1\"],\"state\":[\"0\"]}', '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 10, 0, '2020-07-31 21:07:01', '2020-07-31 21:07:01');
INSERT INTO `sys_oper_record` VALUES (552, 1, '用户管理', '修改状态', '/sys/user/state/update', 'POST', 'com.asuka.module.system.controller.UserController.updateState', '{\"id\":[\"1\"],\"state\":[\"1\"]}', '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 7, 0, '2020-07-31 21:07:44', '2020-07-31 21:07:44');
INSERT INTO `sys_oper_record` VALUES (553, 1, '用户管理', '修改状态', '/sys/user/state/update', 'POST', 'com.asuka.module.system.controller.UserController.updateState', '{\"id\":[\"1\"],\"state\":[\"0\"]}', '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 7, 0, '2020-07-31 21:07:45', '2020-07-31 21:07:45');
INSERT INTO `sys_oper_record` VALUES (554, 1, '用户管理', '修改状态', '/sys/user/state/update', 'POST', 'com.asuka.module.system.controller.UserController.updateState', '{\"id\":[\"1\"],\"state\":[\"1\"]}', '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 6, 0, '2020-07-31 21:08:04', '2020-07-31 21:08:04');
INSERT INTO `sys_oper_record` VALUES (555, 1, '用户管理', '修改状态', '/sys/user/state/update', 'POST', 'com.asuka.module.system.controller.UserController.updateState', '{\"id\":[\"1\"],\"state\":[\"0\"]}', '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 6, 0, '2020-07-31 21:08:04', '2020-07-31 21:08:04');
INSERT INTO `sys_oper_record` VALUES (556, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 14, 0, '2020-07-31 21:08:22', '2020-07-31 21:08:22');
INSERT INTO `sys_oper_record` VALUES (557, 1, '用户管理', '修改状态', '/sys/user/state/update', 'POST', 'com.asuka.module.system.controller.UserController.updateState', '{\"id\":[\"1\"],\"state\":[\"1\"]}', '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 7, 0, '2020-07-31 21:08:30', '2020-07-31 21:08:30');
INSERT INTO `sys_oper_record` VALUES (558, 1, '用户管理', '修改状态', '/sys/user/state/update', 'POST', 'com.asuka.module.system.controller.UserController.updateState', '{\"id\":[\"1\"],\"state\":[\"0\"]}', '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 8, 0, '2020-07-31 21:08:31', '2020-07-31 21:08:31');
INSERT INTO `sys_oper_record` VALUES (559, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 11, 0, '2020-07-31 21:08:37', '2020-07-31 21:08:37');
INSERT INTO `sys_oper_record` VALUES (560, 1, '用户管理', '修改状态', '/sys/user/state/update', 'POST', 'com.asuka.module.system.controller.UserController.updateState', '{\"id\":[\"1\"],\"state\":[\"1\"]}', '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 6, 0, '2020-07-31 21:08:39', '2020-07-31 21:08:39');
INSERT INTO `sys_oper_record` VALUES (561, 1, '用户管理', '修改状态', '/sys/user/state/update', 'POST', 'com.asuka.module.system.controller.UserController.updateState', '{\"id\":[\"1\"],\"state\":[\"0\"]}', '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 6, 0, '2020-07-31 21:08:40', '2020-07-31 21:08:40');
INSERT INTO `sys_oper_record` VALUES (562, 1, '用户管理', '修改状态', '/sys/user/state/update', 'POST', 'com.asuka.module.system.controller.UserController.updateState', '{\"id\":[\"1\"],\"state\":[\"1\"]}', '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 5, 0, '2020-07-31 21:08:45', '2020-07-31 21:08:45');
INSERT INTO `sys_oper_record` VALUES (563, 1, '用户管理', '修改状态', '/sys/user/state/update', 'POST', 'com.asuka.module.system.controller.UserController.updateState', '{\"id\":[\"1\"],\"state\":[\"0\"]}', '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 5, 0, '2020-07-31 21:08:45', '2020-07-31 21:08:45');
INSERT INTO `sys_oper_record` VALUES (564, 1, '用户管理', '修改状态', '/sys/user/state/update', 'POST', 'com.asuka.module.system.controller.UserController.updateState', '{\"id\":[\"1\"],\"state\":[\"1\"]}', '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 7, 0, '2020-07-31 21:09:26', '2020-07-31 21:09:26');
INSERT INTO `sys_oper_record` VALUES (565, 1, '用户管理', '修改状态', '/sys/user/state/update', 'POST', 'com.asuka.module.system.controller.UserController.updateState', '{\"id\":[\"1\"],\"state\":[\"0\"]}', '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 7, 0, '2020-07-31 21:09:27', '2020-07-31 21:09:27');
INSERT INTO `sys_oper_record` VALUES (566, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 21:09:32', '2020-07-31 21:09:32');
INSERT INTO `sys_oper_record` VALUES (567, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-31 21:11:16', '2020-07-31 21:11:16');
INSERT INTO `sys_oper_record` VALUES (568, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 21:13:36', '2020-07-31 21:13:36');
INSERT INTO `sys_oper_record` VALUES (569, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 21:17:50', '2020-07-31 21:17:50');
INSERT INTO `sys_oper_record` VALUES (570, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-07-31 21:18:04', '2020-07-31 21:18:04');
INSERT INTO `sys_oper_record` VALUES (571, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-31 21:19:04', '2020-07-31 21:19:04');
INSERT INTO `sys_oper_record` VALUES (572, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 21:20:30', '2020-07-31 21:20:30');
INSERT INTO `sys_oper_record` VALUES (573, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 21:21:01', '2020-07-31 21:21:01');
INSERT INTO `sys_oper_record` VALUES (574, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-31 21:23:27', '2020-07-31 21:23:27');
INSERT INTO `sys_oper_record` VALUES (575, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-31 21:23:33', '2020-07-31 21:23:33');
INSERT INTO `sys_oper_record` VALUES (576, 1, '机构管理', '查询全部', '/sys/organization/list', 'GET', 'com.asuka.module.system.controller.OrganizationController.list', '{}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-31 21:23:41', '2020-07-31 21:23:41');
INSERT INTO `sys_oper_record` VALUES (577, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-31 21:23:41', '2020-07-31 21:23:41');
INSERT INTO `sys_oper_record` VALUES (578, 1, '字典管理', '查询全部', '/sys/dict/list', 'GET', 'com.asuka.module.system.controller.DictionaryController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 2, 0, '2020-07-31 21:23:43', '2020-07-31 21:23:43');
INSERT INTO `sys_oper_record` VALUES (579, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.module.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@dictId\":[\"2\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-31 21:23:43', '2020-07-31 21:23:43');
INSERT INTO `sys_oper_record` VALUES (580, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-31 21:23:46', '2020-07-31 21:23:46');
INSERT INTO `sys_oper_record` VALUES (581, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-31 21:25:07', '2020-07-31 21:25:07');
INSERT INTO `sys_oper_record` VALUES (582, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 8, 0, '2020-07-31 21:25:39', '2020-07-31 21:25:39');
INSERT INTO `sys_oper_record` VALUES (583, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-31 21:25:43', '2020-07-31 21:25:43');
INSERT INTO `sys_oper_record` VALUES (584, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"sort\":[\"createTime\"],\"order\":[\"asc\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 21:25:59', '2020-07-31 21:25:59');
INSERT INTO `sys_oper_record` VALUES (585, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-07-31 21:26:07', '2020-07-31 21:26:07');
INSERT INTO `sys_oper_record` VALUES (586, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-31 21:26:14', '2020-07-31 21:26:14');
INSERT INTO `sys_oper_record` VALUES (587, 1, '字典管理', '查询全部', '/sys/dict/list', 'GET', 'com.asuka.module.system.controller.DictionaryController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 2, 0, '2020-07-31 21:26:18', '2020-07-31 21:26:18');
INSERT INTO `sys_oper_record` VALUES (588, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.module.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@dictId\":[\"2\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-31 21:26:18', '2020-07-31 21:26:18');
INSERT INTO `sys_oper_record` VALUES (589, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.module.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@dictId\":[\"2\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-31 21:26:24', '2020-07-31 21:26:24');
INSERT INTO `sys_oper_record` VALUES (590, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.asuka.module.system.controller.MenuController.save', NULL, '{\"code\":0,\"msg\":\"添加成功\"}', '127.0.0.1', NULL, 41, 0, '2020-07-31 21:30:42', '2020-07-31 21:30:42');
INSERT INTO `sys_oper_record` VALUES (591, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-31 21:30:42', '2020-07-31 21:30:42');
INSERT INTO `sys_oper_record` VALUES (592, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-31 21:30:50', '2020-07-31 21:30:50');
INSERT INTO `sys_oper_record` VALUES (593, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-31 21:30:51', '2020-07-31 21:30:51');
INSERT INTO `sys_oper_record` VALUES (594, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"sort\":[\"createTime\"],\"order\":[\"asc\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-31 21:30:54', '2020-07-31 21:30:54');
INSERT INTO `sys_oper_record` VALUES (595, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"sort\":[\"createTime\"],\"order\":[\"desc\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-31 21:30:54', '2020-07-31 21:30:54');
INSERT INTO `sys_oper_record` VALUES (596, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 21:30:55', '2020-07-31 21:30:55');
INSERT INTO `sys_oper_record` VALUES (597, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/1', 'POST', 'com.asuka.module.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '127.0.0.1', NULL, 54, 0, '2020-07-31 21:31:02', '2020-07-31 21:31:02');
INSERT INTO `sys_oper_record` VALUES (598, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 8, 0, '2020-07-31 21:31:08', '2020-07-31 21:31:08');
INSERT INTO `sys_oper_record` VALUES (599, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-31 21:48:47', '2020-07-31 21:48:47');
INSERT INTO `sys_oper_record` VALUES (600, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.asuka.module.system.controller.MenuController.save', NULL, '{\"code\":0,\"msg\":\"添加成功\"}', '127.0.0.1', NULL, 6, 0, '2020-07-31 21:49:28', '2020-07-31 21:49:28');
INSERT INTO `sys_oper_record` VALUES (601, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-31 21:49:28', '2020-07-31 21:49:28');
INSERT INTO `sys_oper_record` VALUES (602, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 21:49:32', '2020-07-31 21:49:32');
INSERT INTO `sys_oper_record` VALUES (603, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/1', 'POST', 'com.asuka.module.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '127.0.0.1', NULL, 58, 0, '2020-07-31 21:49:38', '2020-07-31 21:49:38');
INSERT INTO `sys_oper_record` VALUES (604, 1, '菜单管理', '修改', '/sys/menu/update', 'POST', 'com.asuka.module.system.controller.MenuController.update', NULL, '{\"code\":0,\"msg\":\"修改成功\"}', '127.0.0.1', NULL, 10, 0, '2020-07-31 21:49:46', '2020-07-31 21:49:46');
INSERT INTO `sys_oper_record` VALUES (605, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-31 21:49:46', '2020-07-31 21:49:46');
INSERT INTO `sys_oper_record` VALUES (606, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-31 21:49:49', '2020-07-31 21:49:49');
INSERT INTO `sys_oper_record` VALUES (607, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 3, 0, '2020-07-31 22:25:55', '2020-07-31 22:25:55');
INSERT INTO `sys_oper_record` VALUES (608, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.asuka.module.system.controller.MenuController.save', NULL, '{\"code\":0,\"msg\":\"添加成功\"}', '127.0.0.1', NULL, 5, 0, '2020-07-31 22:26:18', '2020-07-31 22:26:18');
INSERT INTO `sys_oper_record` VALUES (609, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 2, 0, '2020-07-31 22:26:18', '2020-07-31 22:26:18');
INSERT INTO `sys_oper_record` VALUES (610, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 14, 0, '2020-07-31 22:26:20', '2020-07-31 22:26:20');
INSERT INTO `sys_oper_record` VALUES (611, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-31 22:26:20', '2020-07-31 22:26:20');
INSERT INTO `sys_oper_record` VALUES (612, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-07-31 22:26:21', '2020-07-31 22:26:21');
INSERT INTO `sys_oper_record` VALUES (613, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/1', 'POST', 'com.asuka.module.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '127.0.0.1', NULL, 54, 0, '2020-07-31 22:26:25', '2020-07-31 22:26:25');
INSERT INTO `sys_oper_record` VALUES (614, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-07-31 22:26:28', '2020-07-31 22:26:28');
INSERT INTO `sys_oper_record` VALUES (615, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 21, 0, '2020-08-01 10:36:52', '2020-08-01 10:36:52');
INSERT INTO `sys_oper_record` VALUES (616, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@like@username\":[\"\"],\"search@like@nickName\":[\"\"],\"search@eq@sex\":[\"2\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-01 10:36:58', '2020-08-01 10:36:58');
INSERT INTO `sys_oper_record` VALUES (617, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@like@username\":[\"\"],\"search@like@nickName\":[\"\"],\"search@eq@sex\":[\"\"]}', NULL, '127.0.0.1', NULL, 9, 0, '2020-08-01 10:37:00', '2020-08-01 10:37:00');
INSERT INTO `sys_oper_record` VALUES (618, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@like@username\":[\"\"],\"search@like@nickName\":[\"\"],\"search@eq@sex\":[\"\"],\"sort\":[\"phone\"],\"order\":[\"asc\"]}', NULL, '127.0.0.1', NULL, 12, 0, '2020-08-01 10:37:01', '2020-08-01 10:37:01');
INSERT INTO `sys_oper_record` VALUES (619, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@like@username\":[\"\"],\"search@like@nickName\":[\"\"],\"search@eq@sex\":[\"\"],\"sort\":[\"phone\"],\"order\":[\"desc\"]}', NULL, '127.0.0.1', NULL, 9, 0, '2020-08-01 10:37:01', '2020-08-01 10:37:01');
INSERT INTO `sys_oper_record` VALUES (620, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@like@username\":[\"\"],\"search@like@nickName\":[\"\"],\"search@eq@sex\":[\"\"],\"sort\":[\"roleName\"],\"order\":[\"asc\"]}', NULL, '127.0.0.1', 'org.beetl.sql.core.BeetlSQLException: java.sql.SQLSyntaxErrorException: Unknown column \'role_name\' in \'order clause\'', 29, 1, '2020-08-01 10:37:02', '2020-08-01 10:37:02');
INSERT INTO `sys_oper_record` VALUES (621, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@like@username\":[\"\"],\"search@like@nickName\":[\"\"],\"search@eq@sex\":[\"\"],\"sort\":[\"roleName\"],\"order\":[\"desc\"]}', NULL, '127.0.0.1', 'org.beetl.sql.core.BeetlSQLException: java.sql.SQLSyntaxErrorException: Unknown column \'role_name\' in \'order clause\'', 6, 1, '2020-08-01 10:37:04', '2020-08-01 10:37:04');
INSERT INTO `sys_oper_record` VALUES (622, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 8, 0, '2020-08-01 10:37:25', '2020-08-01 10:37:25');
INSERT INTO `sys_oper_record` VALUES (623, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"sort\":[\"createTime\"],\"order\":[\"asc\"]}', NULL, '127.0.0.1', NULL, 12, 0, '2020-08-01 10:37:27', '2020-08-01 10:37:27');
INSERT INTO `sys_oper_record` VALUES (624, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"sort\":[\"createTime\"],\"order\":[\"desc\"]}', NULL, '127.0.0.1', NULL, 9, 0, '2020-08-01 10:37:27', '2020-08-01 10:37:27');
INSERT INTO `sys_oper_record` VALUES (625, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"sort\":[\"state\"],\"order\":[\"asc\"]}', NULL, '127.0.0.1', NULL, 8, 0, '2020-08-01 10:37:28', '2020-08-01 10:37:28');
INSERT INTO `sys_oper_record` VALUES (626, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"sort\":[\"state\"],\"order\":[\"desc\"]}', NULL, '127.0.0.1', NULL, 9, 0, '2020-08-01 10:37:28', '2020-08-01 10:37:28');
INSERT INTO `sys_oper_record` VALUES (627, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"sort\":[\"nickName\"],\"order\":[\"asc\"]}', NULL, '127.0.0.1', NULL, 9, 0, '2020-08-01 10:37:30', '2020-08-01 10:37:30');
INSERT INTO `sys_oper_record` VALUES (628, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"sort\":[\"nickName\"],\"order\":[\"desc\"]}', NULL, '127.0.0.1', NULL, 9, 0, '2020-08-01 10:37:30', '2020-08-01 10:37:30');
INSERT INTO `sys_oper_record` VALUES (629, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"sort\":[\"username\"],\"order\":[\"asc\"]}', NULL, '127.0.0.1', NULL, 9, 0, '2020-08-01 10:37:31', '2020-08-01 10:37:31');
INSERT INTO `sys_oper_record` VALUES (630, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"sort\":[\"username\"],\"order\":[\"desc\"]}', NULL, '127.0.0.1', NULL, 8, 0, '2020-08-01 10:37:32', '2020-08-01 10:37:32');
INSERT INTO `sys_oper_record` VALUES (631, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-01 10:37:38', '2020-08-01 10:37:38');
INSERT INTO `sys_oper_record` VALUES (632, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"3\"]}', NULL, '127.0.0.1', NULL, 17, 0, '2020-08-01 10:37:39', '2020-08-01 10:37:39');
INSERT INTO `sys_oper_record` VALUES (633, 1, '机构管理', '查询全部', '/sys/organization/list', 'GET', 'com.asuka.module.system.controller.OrganizationController.list', '{}', NULL, '127.0.0.1', NULL, 19, 0, '2020-08-01 10:37:46', '2020-08-01 10:37:46');
INSERT INTO `sys_oper_record` VALUES (634, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-08-01 10:37:46', '2020-08-01 10:37:46');
INSERT INTO `sys_oper_record` VALUES (635, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 5, 0, '2020-08-01 10:37:47', '2020-08-01 10:37:47');
INSERT INTO `sys_oper_record` VALUES (636, 1, '字典管理', '查询全部', '/sys/dict/list', 'GET', 'com.asuka.module.system.controller.DictionaryController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-08-01 10:38:06', '2020-08-01 10:38:06');
INSERT INTO `sys_oper_record` VALUES (637, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.module.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@dictId\":[\"2\"]}', NULL, '127.0.0.1', NULL, 15, 0, '2020-08-01 10:38:06', '2020-08-01 10:38:06');
INSERT INTO `sys_oper_record` VALUES (638, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-08-01 10:38:08', '2020-08-01 10:38:08');
INSERT INTO `sys_oper_record` VALUES (639, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 4, 0, '2020-08-01 10:41:00', '2020-08-01 10:41:00');
INSERT INTO `sys_oper_record` VALUES (640, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-08-01 10:43:08', '2020-08-01 10:43:08');
INSERT INTO `sys_oper_record` VALUES (641, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 56, 0, '2020-08-01 10:52:07', '2020-08-01 10:52:07');
INSERT INTO `sys_oper_record` VALUES (642, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-01 10:52:22', '2020-08-01 10:52:22');
INSERT INTO `sys_oper_record` VALUES (643, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-01 10:55:05', '2020-08-01 10:55:05');
INSERT INTO `sys_oper_record` VALUES (644, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-08-01 10:55:09', '2020-08-01 10:55:09');
INSERT INTO `sys_oper_record` VALUES (645, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-01 10:55:17', '2020-08-01 10:55:17');
INSERT INTO `sys_oper_record` VALUES (646, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-01 10:57:02', '2020-08-01 10:57:02');
INSERT INTO `sys_oper_record` VALUES (647, 1, '操作日志', '分页查询', '/sys/operRecord/page', 'GET', 'com.asuka.module.system.controller.OperRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 53, 0, '2020-08-01 10:57:59', '2020-08-01 10:57:59');
INSERT INTO `sys_oper_record` VALUES (648, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-01 11:00:26', '2020-08-01 11:00:26');
INSERT INTO `sys_oper_record` VALUES (649, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-01 11:00:26', '2020-08-01 11:00:26');
INSERT INTO `sys_oper_record` VALUES (650, 1, '机构管理', '查询全部', '/sys/organization/list', 'GET', 'com.asuka.module.system.controller.OrganizationController.list', '{}', NULL, '127.0.0.1', NULL, 7, 0, '2020-08-01 11:00:27', '2020-08-01 11:00:27');
INSERT INTO `sys_oper_record` VALUES (651, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-08-01 11:00:27', '2020-08-01 11:00:27');
INSERT INTO `sys_oper_record` VALUES (652, 1, '字典管理', '查询全部', '/sys/dict/list', 'GET', 'com.asuka.module.system.controller.DictionaryController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 3, 0, '2020-08-01 11:00:29', '2020-08-01 11:00:29');
INSERT INTO `sys_oper_record` VALUES (653, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.module.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@dictId\":[\"2\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-08-01 11:00:29', '2020-08-01 11:00:29');
INSERT INTO `sys_oper_record` VALUES (654, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-08-01 11:00:30', '2020-08-01 11:00:30');
INSERT INTO `sys_oper_record` VALUES (655, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-08-01 11:00:33', '2020-08-01 11:00:33');
INSERT INTO `sys_oper_record` VALUES (656, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 21, 0, '2020-08-02 10:35:08', '2020-08-02 10:35:08');
INSERT INTO `sys_oper_record` VALUES (657, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-02 10:35:23', '2020-08-02 10:35:23');
INSERT INTO `sys_oper_record` VALUES (658, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-02 10:35:24', '2020-08-02 10:35:24');
INSERT INTO `sys_oper_record` VALUES (659, 1, '机构管理', '查询全部', '/sys/organization/list', 'GET', 'com.asuka.module.system.controller.OrganizationController.list', '{}', NULL, '127.0.0.1', NULL, 20, 0, '2020-08-02 10:35:25', '2020-08-02 10:35:25');
INSERT INTO `sys_oper_record` VALUES (660, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-08-02 10:35:25', '2020-08-02 10:35:25');
INSERT INTO `sys_oper_record` VALUES (661, 1, '字典管理', '查询全部', '/sys/dict/list', 'GET', 'com.asuka.module.system.controller.DictionaryController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-08-02 10:35:26', '2020-08-02 10:35:26');
INSERT INTO `sys_oper_record` VALUES (662, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.module.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@dictId\":[\"2\"]}', NULL, '127.0.0.1', NULL, 17, 0, '2020-08-02 10:35:26', '2020-08-02 10:35:26');
INSERT INTO `sys_oper_record` VALUES (663, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '127.0.0.1', NULL, 12, 0, '2020-08-02 10:35:27', '2020-08-02 10:35:27');
INSERT INTO `sys_oper_record` VALUES (664, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.module.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@dictId\":[\"2\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-02 10:35:30', '2020-08-02 10:35:30');
INSERT INTO `sys_oper_record` VALUES (665, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-02 10:35:49', '2020-08-02 10:35:49');
INSERT INTO `sys_oper_record` VALUES (666, 1, '操作日志', '分页查询', '/sys/operRecord/page', 'GET', 'com.asuka.module.system.controller.OperRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 21, 0, '2020-08-02 10:35:52', '2020-08-02 10:35:52');
INSERT INTO `sys_oper_record` VALUES (667, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 9, 0, '2020-08-02 10:35:56', '2020-08-02 10:35:56');
INSERT INTO `sys_oper_record` VALUES (668, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 39, 0, '2020-08-02 10:45:05', '2020-08-02 10:45:05');
INSERT INTO `sys_oper_record` VALUES (669, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.asuka.module.system.controller.MenuController.save', NULL, '{\"code\":0,\"msg\":\"添加成功\"}', '127.0.0.1', NULL, 17, 0, '2020-08-02 10:46:25', '2020-08-02 10:46:25');
INSERT INTO `sys_oper_record` VALUES (670, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 12, 0, '2020-08-02 10:46:25', '2020-08-02 10:46:25');
INSERT INTO `sys_oper_record` VALUES (671, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.asuka.module.system.controller.MenuController.save', NULL, '{\"code\":0,\"msg\":\"添加成功\"}', '127.0.0.1', NULL, 10, 0, '2020-08-02 10:46:36', '2020-08-02 10:46:36');
INSERT INTO `sys_oper_record` VALUES (672, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 10, 0, '2020-08-02 10:46:36', '2020-08-02 10:46:36');
INSERT INTO `sys_oper_record` VALUES (673, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.asuka.module.system.controller.MenuController.save', NULL, '{\"code\":0,\"msg\":\"添加成功\"}', '127.0.0.1', NULL, 9, 0, '2020-08-02 10:46:47', '2020-08-02 10:46:47');
INSERT INTO `sys_oper_record` VALUES (674, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 9, 0, '2020-08-02 10:46:47', '2020-08-02 10:46:47');
INSERT INTO `sys_oper_record` VALUES (675, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.asuka.module.system.controller.MenuController.save', NULL, '{\"code\":0,\"msg\":\"添加成功\"}', '127.0.0.1', NULL, 9, 0, '2020-08-02 10:47:08', '2020-08-02 10:47:08');
INSERT INTO `sys_oper_record` VALUES (676, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 8, 0, '2020-08-02 10:47:08', '2020-08-02 10:47:08');
INSERT INTO `sys_oper_record` VALUES (677, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 10, 0, '2020-08-02 10:47:09', '2020-08-02 10:47:09');
INSERT INTO `sys_oper_record` VALUES (678, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 37, 0, '2020-08-02 10:47:11', '2020-08-02 10:47:11');
INSERT INTO `sys_oper_record` VALUES (679, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/1', 'POST', 'com.asuka.module.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '127.0.0.1', NULL, 77, 0, '2020-08-02 10:47:16', '2020-08-02 10:47:16');
INSERT INTO `sys_oper_record` VALUES (680, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-08-02 10:47:22', '2020-08-02 10:47:22');
INSERT INTO `sys_oper_record` VALUES (681, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 11, 0, '2020-08-02 10:52:16', '2020-08-02 10:52:16');
INSERT INTO `sys_oper_record` VALUES (682, 1, '字典管理', '查询全部', '/sys/dict/list', 'GET', 'com.asuka.module.system.controller.DictionaryController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-08-02 10:52:19', '2020-08-02 10:52:19');
INSERT INTO `sys_oper_record` VALUES (683, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.module.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@dictId\":[\"2\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-08-02 10:52:19', '2020-08-02 10:52:19');
INSERT INTO `sys_oper_record` VALUES (684, 1, '字典管理', '查询全部', '/sys/dict/list', 'GET', 'com.asuka.module.system.controller.DictionaryController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-02 10:54:17', '2020-08-02 10:54:17');
INSERT INTO `sys_oper_record` VALUES (685, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.module.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@dictId\":[\"2\"]}', NULL, '127.0.0.1', NULL, 9, 0, '2020-08-02 10:54:17', '2020-08-02 10:54:17');
INSERT INTO `sys_oper_record` VALUES (686, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '127.0.0.1', NULL, 9, 0, '2020-08-02 10:54:56', '2020-08-02 10:54:56');
INSERT INTO `sys_oper_record` VALUES (687, 1, '机构管理', '查询全部', '/sys/organization/list', 'GET', 'com.asuka.module.system.controller.OrganizationController.list', '{}', NULL, '127.0.0.1', NULL, 9, 0, '2020-08-02 10:54:57', '2020-08-02 10:54:57');
INSERT INTO `sys_oper_record` VALUES (688, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-08-02 10:54:57', '2020-08-02 10:54:57');
INSERT INTO `sys_oper_record` VALUES (689, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-02 10:54:57', '2020-08-02 10:54:57');
INSERT INTO `sys_oper_record` VALUES (690, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '127.0.0.1', NULL, 34, 0, '2020-08-02 11:08:28', '2020-08-02 11:08:28');
INSERT INTO `sys_oper_record` VALUES (691, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 9, 0, '2020-08-02 11:08:30', '2020-08-02 11:08:30');
INSERT INTO `sys_oper_record` VALUES (692, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.asuka.module.system.controller.MenuController.save', NULL, '{\"code\":0,\"msg\":\"添加成功\"}', '127.0.0.1', NULL, 17, 0, '2020-08-02 11:10:50', '2020-08-02 11:10:50');
INSERT INTO `sys_oper_record` VALUES (693, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 8, 0, '2020-08-02 11:10:50', '2020-08-02 11:10:50');
INSERT INTO `sys_oper_record` VALUES (694, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-08-02 11:10:52', '2020-08-02 11:10:52');
INSERT INTO `sys_oper_record` VALUES (695, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 21, 0, '2020-08-02 11:10:53', '2020-08-02 11:10:53');
INSERT INTO `sys_oper_record` VALUES (696, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/1', 'POST', 'com.asuka.module.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '127.0.0.1', NULL, 75, 0, '2020-08-02 11:11:00', '2020-08-02 11:11:00');
INSERT INTO `sys_oper_record` VALUES (697, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-02 11:11:10', '2020-08-02 11:11:10');
INSERT INTO `sys_oper_record` VALUES (698, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 10, 0, '2020-08-02 11:25:55', '2020-08-02 11:25:55');
INSERT INTO `sys_oper_record` VALUES (699, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 31, 0, '2020-08-02 11:26:20', '2020-08-02 11:26:20');
INSERT INTO `sys_oper_record` VALUES (700, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"3\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-08-02 11:29:33', '2020-08-02 11:29:33');
INSERT INTO `sys_oper_record` VALUES (701, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 15, 0, '2020-08-02 11:30:06', '2020-08-02 11:30:06');
INSERT INTO `sys_oper_record` VALUES (702, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-02 11:30:18', '2020-08-02 11:30:18');
INSERT INTO `sys_oper_record` VALUES (703, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 4, 0, '2020-08-02 11:30:20', '2020-08-02 11:30:20');
INSERT INTO `sys_oper_record` VALUES (704, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 4, 0, '2020-08-02 11:30:26', '2020-08-02 11:30:26');
INSERT INTO `sys_oper_record` VALUES (705, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-02 11:46:12', '2020-08-02 11:46:12');
INSERT INTO `sys_oper_record` VALUES (706, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 10, 0, '2020-08-02 11:47:05', '2020-08-02 11:47:05');
INSERT INTO `sys_oper_record` VALUES (707, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 4, 0, '2020-08-02 11:47:10', '2020-08-02 11:47:10');
INSERT INTO `sys_oper_record` VALUES (708, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-08-02 11:47:15', '2020-08-02 11:47:15');
INSERT INTO `sys_oper_record` VALUES (709, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-08-02 11:47:20', '2020-08-02 11:47:20');
INSERT INTO `sys_oper_record` VALUES (710, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"3\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-08-02 11:47:21', '2020-08-02 11:47:21');
INSERT INTO `sys_oper_record` VALUES (711, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-08-02 11:47:30', '2020-08-02 11:47:30');
INSERT INTO `sys_oper_record` VALUES (712, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"3\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-02 11:47:31', '2020-08-02 11:47:31');
INSERT INTO `sys_oper_record` VALUES (713, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-02 11:49:03', '2020-08-02 11:49:03');
INSERT INTO `sys_oper_record` VALUES (714, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-08-02 11:49:25', '2020-08-02 11:49:25');
INSERT INTO `sys_oper_record` VALUES (715, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"3\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-02 11:49:26', '2020-08-02 11:49:26');
INSERT INTO `sys_oper_record` VALUES (716, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-02 11:49:37', '2020-08-02 11:49:37');
INSERT INTO `sys_oper_record` VALUES (717, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"3\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-02 11:49:38', '2020-08-02 11:49:38');
INSERT INTO `sys_oper_record` VALUES (718, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-08-02 11:52:31', '2020-08-02 11:52:31');
INSERT INTO `sys_oper_record` VALUES (719, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"3\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-02 11:52:33', '2020-08-02 11:52:33');
INSERT INTO `sys_oper_record` VALUES (720, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 10, 0, '2020-08-02 11:53:39', '2020-08-02 11:53:39');
INSERT INTO `sys_oper_record` VALUES (721, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"3\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-08-02 11:53:41', '2020-08-02 11:53:41');
INSERT INTO `sys_oper_record` VALUES (722, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-02 11:53:53', '2020-08-02 11:53:53');
INSERT INTO `sys_oper_record` VALUES (723, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"3\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-02 11:53:54', '2020-08-02 11:53:54');
INSERT INTO `sys_oper_record` VALUES (724, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 9, 0, '2020-08-02 11:57:19', '2020-08-02 11:57:19');
INSERT INTO `sys_oper_record` VALUES (725, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"3\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-08-02 11:57:20', '2020-08-02 11:57:20');
INSERT INTO `sys_oper_record` VALUES (726, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-08-02 11:59:03', '2020-08-02 11:59:03');
INSERT INTO `sys_oper_record` VALUES (727, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"3\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-02 11:59:04', '2020-08-02 11:59:04');
INSERT INTO `sys_oper_record` VALUES (728, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-08-02 11:59:19', '2020-08-02 11:59:19');
INSERT INTO `sys_oper_record` VALUES (729, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-08-02 11:59:22', '2020-08-02 11:59:22');
INSERT INTO `sys_oper_record` VALUES (730, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"3\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-08-02 11:59:36', '2020-08-02 11:59:36');
INSERT INTO `sys_oper_record` VALUES (731, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"3\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-08-02 11:59:42', '2020-08-02 11:59:42');
INSERT INTO `sys_oper_record` VALUES (732, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"3\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-08-02 11:59:44', '2020-08-02 11:59:44');
INSERT INTO `sys_oper_record` VALUES (733, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"3\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-08-02 11:59:53', '2020-08-02 11:59:53');
INSERT INTO `sys_oper_record` VALUES (734, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-02 11:59:59', '2020-08-02 11:59:59');
INSERT INTO `sys_oper_record` VALUES (735, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 30, 0, '2020-08-02 18:34:26', '2020-08-02 18:34:26');
INSERT INTO `sys_oper_record` VALUES (736, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 23, 0, '2020-08-03 09:07:53', '2020-08-03 09:07:53');
INSERT INTO `sys_oper_record` VALUES (737, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 7, 0, '2020-08-03 09:07:58', '2020-08-03 09:07:58');
INSERT INTO `sys_oper_record` VALUES (738, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 10, 0, '2020-08-03 09:07:59', '2020-08-03 09:07:59');
INSERT INTO `sys_oper_record` VALUES (739, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"3\"]}', NULL, '127.0.0.1', NULL, 20, 0, '2020-08-03 09:08:00', '2020-08-03 09:08:00');
INSERT INTO `sys_oper_record` VALUES (740, 1, '机构管理', '查询全部', '/sys/organization/list', 'GET', 'com.asuka.module.system.controller.OrganizationController.list', '{}', NULL, '127.0.0.1', NULL, 25, 0, '2020-08-03 09:08:12', '2020-08-03 09:08:12');
INSERT INTO `sys_oper_record` VALUES (741, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-08-03 09:08:12', '2020-08-03 09:08:12');
INSERT INTO `sys_oper_record` VALUES (742, 1, '字典管理', '查询全部', '/sys/dict/list', 'GET', 'com.asuka.module.system.controller.DictionaryController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-08-03 09:08:13', '2020-08-03 09:08:13');
INSERT INTO `sys_oper_record` VALUES (743, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.module.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@dictId\":[\"2\"]}', NULL, '127.0.0.1', NULL, 19, 0, '2020-08-03 09:08:14', '2020-08-03 09:08:14');
INSERT INTO `sys_oper_record` VALUES (744, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '127.0.0.1', NULL, 9, 0, '2020-08-03 09:08:14', '2020-08-03 09:08:14');
INSERT INTO `sys_oper_record` VALUES (745, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-03 09:08:17', '2020-08-03 09:08:17');
INSERT INTO `sys_oper_record` VALUES (746, 1, '操作日志', '分页查询', '/sys/operRecord/page', 'GET', 'com.asuka.module.system.controller.OperRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 24, 0, '2020-08-03 09:08:18', '2020-08-03 09:08:18');
INSERT INTO `sys_oper_record` VALUES (747, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 10, 0, '2020-08-03 09:08:19', '2020-08-03 09:08:19');
INSERT INTO `sys_oper_record` VALUES (748, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 9, 0, '2020-08-03 09:41:57', '2020-08-03 09:41:57');
INSERT INTO `sys_oper_record` VALUES (749, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 5, 0, '2020-08-03 09:41:57', '2020-08-03 09:41:57');
INSERT INTO `sys_oper_record` VALUES (750, 1, '菜单管理', '添加', '/sys/menu/save', 'POST', 'com.asuka.module.system.controller.MenuController.save', NULL, '{\"code\":0,\"msg\":\"添加成功\"}', '127.0.0.1', NULL, 10, 0, '2020-08-03 09:42:18', '2020-08-03 09:42:18');
INSERT INTO `sys_oper_record` VALUES (751, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 7, 0, '2020-08-03 09:42:18', '2020-08-03 09:42:18');
INSERT INTO `sys_oper_record` VALUES (752, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-03 09:43:19', '2020-08-03 09:43:19');
INSERT INTO `sys_oper_record` VALUES (753, 1, '角色管理', '查询角色菜单', '/sys/role/menu/list', 'GET', 'com.asuka.module.system.controller.RoleMenuController.list', '{\"roleId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 8, 0, '2020-08-03 09:43:20', '2020-08-03 09:43:20');
INSERT INTO `sys_oper_record` VALUES (754, 1, '角色管理', '修改角色菜单', '/sys/role/menu/update/1', 'POST', 'com.asuka.module.system.controller.RoleMenuController.setRoleAuth', '{}', NULL, '127.0.0.1', NULL, 62, 0, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_oper_record` VALUES (755, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-08-03 09:43:30', '2020-08-03 09:43:30');
INSERT INTO `sys_oper_record` VALUES (756, 1, '用户管理', '分页查询', '/sys/user/page', 'GET', 'com.asuka.module.system.controller.UserController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 14, 0, '2020-08-03 11:25:15', '2020-08-03 11:25:15');
INSERT INTO `sys_oper_record` VALUES (757, 1, '菜单管理', '查询全部', '/sys/menu/list', 'GET', 'com.asuka.module.system.controller.MenuController.list', '{}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-03 11:25:15', '2020-08-03 11:25:15');
INSERT INTO `sys_oper_record` VALUES (758, 1, '角色管理', '分页查询', '/sys/role/page', 'GET', 'com.asuka.module.system.controller.RoleController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 11, 0, '2020-08-03 11:25:16', '2020-08-03 11:25:16');
INSERT INTO `sys_oper_record` VALUES (759, 1, '机构管理', '查询全部', '/sys/organization/list', 'GET', 'com.asuka.module.system.controller.OrganizationController.list', '{}', NULL, '127.0.0.1', NULL, 10, 0, '2020-08-03 11:25:16', '2020-08-03 11:25:16');
INSERT INTO `sys_oper_record` VALUES (760, 1, '用户管理', '查询全部', '/sys/user/list', 'GET', 'com.asuka.module.system.controller.UserController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@organizationId\":[\"1\"]}', NULL, '127.0.0.1', NULL, 4, 0, '2020-08-03 11:25:16', '2020-08-03 11:25:16');
INSERT INTO `sys_oper_record` VALUES (761, 1, '字典管理', '查询全部', '/sys/dict/list', 'GET', 'com.asuka.module.system.controller.DictionaryController.list', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-08-03 11:25:17', '2020-08-03 11:25:17');
INSERT INTO `sys_oper_record` VALUES (762, 1, '字典项管理', '分页查询', '/sys/dictdata/page', 'GET', 'com.asuka.module.system.controller.DictionaryDataController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"],\"search@eq@dictId\":[\"2\"]}', NULL, '127.0.0.1', NULL, 6, 0, '2020-08-03 11:25:17', '2020-08-03 11:25:17');
INSERT INTO `sys_oper_record` VALUES (763, 1, '系统配置管理', '分页查询', '/sys/option/page', 'GET', 'com.asuka.module.system.controller.OptionController.page', '{\"page\":[\"1\"],\"limit\":[\"20\"]}', NULL, '127.0.0.1', NULL, 9, 0, '2020-08-03 11:25:17', '2020-08-03 11:25:17');
INSERT INTO `sys_oper_record` VALUES (764, 1, '登录日志', '分页查询', '/sys/loginRecord/page', 'GET', 'com.asuka.module.system.controller.LoginRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 10, 0, '2020-08-03 11:25:18', '2020-08-03 11:25:18');
INSERT INTO `sys_oper_record` VALUES (765, 1, '操作日志', '分页查询', '/sys/operRecord/page', 'GET', 'com.asuka.module.system.controller.OperRecordController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 50, 0, '2020-08-03 11:25:19', '2020-08-03 11:25:19');
INSERT INTO `sys_oper_record` VALUES (766, 1, '字典管理', '分页查询', '/sys/QrtzJobs/page', 'GET', 'com.asuka.plugin.job.quartz.web.QuartzJobController.page', '{\"page\":[\"1\"],\"limit\":[\"10\"]}', NULL, '127.0.0.1', NULL, 5, 0, '2020-08-03 11:25:20', '2020-08-03 11:25:20');
COMMIT;

-- ----------------------------
-- Table structure for sys_option
-- ----------------------------
DROP TABLE IF EXISTS `sys_option`;
CREATE TABLE `sys_option` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `option_key` varchar(50) CHARACTER SET utf8mb4  DEFAULT NULL,
  `option_value` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `option_description` varchar(255) CHARACTER SET utf8mb4  DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 ;

-- ----------------------------
-- Records of sys_option
-- ----------------------------
BEGIN;
INSERT INTO `sys_option` VALUES (1, 'oss_type', 'QINIUOSS', '文件存储类型', NULL, '2020-07-16 21:40:02');
INSERT INTO `sys_option` VALUES (2, 'oss_local_dir', '/tmp/asuka/upload', '本地上传路径（只读）', NULL, NULL);
INSERT INTO `sys_option` VALUES (3, 'oss_locla_cdn_host', '', '本地文件CDN域名', NULL, '2020-07-16 20:29:15');
INSERT INTO `sys_option` VALUES (4, 'oss_qiniu_domain_protocol', 'http://', '七牛域名协议头', NULL, NULL);
INSERT INTO `sys_option` VALUES (5, 'oss_qiniu_domain', 'qiniulive.taqu.show', '七牛域名', NULL, NULL);
INSERT INTO `sys_option` VALUES (6, 'oss_qiniu_zone', 'z2', '七牛地域', NULL, NULL);
INSERT INTO `sys_option` VALUES (7, 'oss_qiniu_access_key', 'OWRZpe7g1J7jig51JVIRIFv8O6lFbazzNCC_zdQZ', '七牛AccessKey', NULL, NULL);
INSERT INTO `sys_option` VALUES (8, 'oss_qiniu_secret_key', '3mK5GCzULJ9V2okQJdxSVQ8XbqJk4v3yAQaWknWM', '七牛SecretKey', NULL, NULL);
INSERT INTO `sys_option` VALUES (9, 'oss_qiniu_source', '', '七牛资源', NULL, NULL);
INSERT INTO `sys_option` VALUES (10, 'oss_qiniu_bucket', 'beike', '七牛Bucket', NULL, NULL);
INSERT INTO `sys_option` VALUES (11, 'oss_qiniu_style_rule', '', '七牛文件样式规则', NULL, '2020-07-16 21:08:50');
INSERT INTO `sys_option` VALUES (12, 'oss_ali_domain_protocol', 'http://', '阿里云OSS域名协议头', NULL, NULL);
INSERT INTO `sys_option` VALUES (13, 'oss_ali_domain', 'video.wc857.cn', '阿里云OSS域名', NULL, NULL);
INSERT INTO `sys_option` VALUES (14, 'oss_ali_bucket_name', 'video-image-1', '阿里云OSS Bucket名称', NULL, NULL);
INSERT INTO `sys_option` VALUES (15, 'oss_ali_endpoint', 'oss-cn-hongkong.aliyuncs.com', '阿里云OSS EndPoint', NULL, NULL);
INSERT INTO `sys_option` VALUES (16, 'oss_ali_access_key', 'LTAI4FcvQW5UjpRNjV5DynBn', '阿里云OSS AccessKey', NULL, NULL);
INSERT INTO `sys_option` VALUES (17, 'oss_ali_access_secret', 'CDgXO7Eezpa3LE7Y27CEGU1R07wd1B', '阿里云OSS AccessSecret', NULL, NULL);
INSERT INTO `sys_option` VALUES (19, 'response_body_encrypt', 'false', '返回值是否加密', NULL, '2020-07-20 15:29:03');
COMMIT;

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization` (
  `organization_id` int NOT NULL AUTO_INCREMENT COMMENT '机构id',
  `parent_id` int NOT NULL DEFAULT '0' COMMENT '上级id,0是顶级',
  `organization_name` varchar(200) CHARACTER SET utf8mb4  NOT NULL COMMENT '机构名称',
  `organization_full_name` varchar(200) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '机构全称',
  `organization_code` varchar(100) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '机构代码',
  `organization_type` int NOT NULL COMMENT '机构类型',
  `leader_id` int DEFAULT NULL COMMENT '负责人id',
  `sort_number` int NOT NULL DEFAULT '1' COMMENT '排序号',
  `comments` varchar(400) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '备注',
  `deleted` int NOT NULL DEFAULT '0' COMMENT '是否删除,0否,1是',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`organization_id`) USING BTREE,
  KEY `leader_id` (`leader_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='组织机构';

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
BEGIN;
INSERT INTO `sys_organization` VALUES (1, 0, 'XXX公司', 'XXXXXXXXX科技有限公司', NULL, 3, NULL, 1, '', 0, '2020-03-15 13:14:55', '2020-03-21 15:12:49');
INSERT INTO `sys_organization` VALUES (2, 1, '研发部', '研发部', NULL, 5, NULL, 2, '', 0, '2020-03-15 13:15:16', '2020-03-16 00:43:09');
INSERT INTO `sys_organization` VALUES (3, 2, '高教组', '高等教育行业项目组', NULL, 6, NULL, 3, '', 0, '2020-03-15 13:15:45', '2020-03-16 00:42:49');
INSERT INTO `sys_organization` VALUES (4, 2, '政务组', '政务行业项目组', NULL, 6, NULL, 4, '', 0, '2020-03-15 13:16:15', '2020-03-16 00:42:54');
INSERT INTO `sys_organization` VALUES (5, 2, '制造组', '生产制造行业项目组', NULL, 6, NULL, 5, '', 0, '2020-03-15 13:16:37', '2020-03-21 15:13:05');
INSERT INTO `sys_organization` VALUES (6, 2, '仿真组', '虚拟仿真行业项目组', NULL, 6, NULL, 6, '', 0, '2020-03-15 13:16:57', '2020-03-16 00:43:03');
INSERT INTO `sys_organization` VALUES (7, 1, '测试部', '测试部', NULL, 5, NULL, 6, '', 0, '2020-03-15 13:17:19', '2020-03-16 00:43:14');
INSERT INTO `sys_organization` VALUES (8, 1, '设计部', 'UI设计部门', NULL, 5, NULL, 7, '', 0, '2020-03-15 13:17:56', '2020-03-16 00:43:18');
INSERT INTO `sys_organization` VALUES (9, 1, '市场部', '市场部', NULL, 5, NULL, 8, '', 0, '2020-03-15 13:18:15', '2020-03-16 00:43:23');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(200) CHARACTER SET utf8mb4  NOT NULL COMMENT '角色名称',
  `role_code` varchar(200) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '角色标识',
  `comments` varchar(400) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '备注',
  `deleted` int NOT NULL DEFAULT '0' COMMENT '是否删除,0否,1是',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', '管理员', 0, '2020-02-26 15:18:37', '2020-03-21 15:15:54');
INSERT INTO `sys_role` VALUES (2, '普通用户', 'user', '普通用户', 0, '2020-02-26 15:18:52', '2020-03-21 15:16:02');
INSERT INTO `sys_role` VALUES (3, '游客', 'guest', '游客', 0, '2020-02-26 15:19:49', '2020-03-21 15:16:57');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` int NOT NULL COMMENT '角色id',
  `menu_id` int NOT NULL COMMENT '菜单id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_sys_role_permission_role` (`role_id`) USING BTREE,
  KEY `menu_id` (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=505 DEFAULT CHARSET=utf8mb4 COMMENT='角色权限';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (456, 1, 43, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (457, 1, 1, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (458, 1, 2, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (459, 1, 3, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (460, 1, 4, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (461, 1, 5, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (462, 1, 6, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (463, 1, 7, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (464, 1, 8, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (465, 1, 9, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (466, 1, 10, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (467, 1, 11, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (468, 1, 12, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (469, 1, 13, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (470, 1, 14, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (471, 1, 15, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (472, 1, 16, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (473, 1, 17, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (474, 1, 18, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (475, 1, 19, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (476, 1, 20, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (477, 1, 21, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (478, 1, 22, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (479, 1, 23, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (480, 1, 24, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (481, 1, 25, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (482, 1, 26, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (483, 1, 37, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (484, 1, 31, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (485, 1, 32, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (486, 1, 33, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (487, 1, 34, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (488, 1, 28, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (489, 1, 29, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (490, 1, 36, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (491, 1, 38, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (492, 1, 40, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (493, 1, 45, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (494, 1, 41, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (495, 1, 46, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (496, 1, 42, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (497, 1, 47, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (498, 1, 52, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (499, 1, 44, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (500, 1, 53, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (501, 1, 48, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (502, 1, 49, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (503, 1, 50, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
INSERT INTO `sys_role_menu` VALUES (504, 1, 51, '2020-08-03 09:43:24', '2020-08-03 09:43:24');
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(100) CHARACTER SET utf8mb4  NOT NULL COMMENT '账号',
  `password` varchar(200) CHARACTER SET utf8mb4  NOT NULL COMMENT '密码',
  `nick_name` varchar(200) CHARACTER SET utf8mb4  NOT NULL COMMENT '昵称',
  `avatar` varchar(200) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '头像',
  `sex` int DEFAULT NULL COMMENT '性别',
  `phone` varchar(200) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '手机号',
  `email` varchar(200) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '邮箱',
  `email_verified` int NOT NULL DEFAULT '0' COMMENT '邮箱是否验证,0否,1是',
  `true_name` varchar(200) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '真实姓名',
  `id_card` varchar(200) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '身份证号',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `introduction` varchar(200) CHARACTER SET utf8mb4  DEFAULT NULL COMMENT '个人简介',
  `organization_id` int DEFAULT NULL COMMENT '机构id',
  `state` int NOT NULL DEFAULT '0' COMMENT '状态,0正常,1冻结',
  `deleted` int NOT NULL DEFAULT '0' COMMENT '是否删除,0否,1是',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `organization_id` (`organization_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '管理员', 'sky-690293_1920.QINIUOSS.jpg', 1, '', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, '2020-01-13 14:43:52', '2020-07-31 21:09:27');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int NOT NULL COMMENT '用户id',
  `role_id` int NOT NULL COMMENT '角色id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_sys_user_role` (`user_id`) USING BTREE,
  KEY `FK_sys_user_role_role` (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='用户角色';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (5, 1, 1, '2020-07-16 22:30:20', '2020-07-16 22:30:20');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
