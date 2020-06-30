/*
 Navicat Premium Data Transfer

 Source Server         : localhost-3306
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : db_asuka

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 30/06/2020 09:06:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary`;
CREATE TABLE `sys_dictionary`  (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典id',
  `dict_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典标识',
  `dict_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典名称',
  `sort_number` int(11) NOT NULL DEFAULT 1 COMMENT '排序号',
  `comments` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` int(1) NOT NULL DEFAULT 0 COMMENT '是否删除,0否,1是',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dictionary
-- ----------------------------
INSERT INTO `sys_dictionary` VALUES (1, 'sex', '性别', 1, '', 0, '2020-03-15 13:04:39', '2020-03-15 13:04:39');
INSERT INTO `sys_dictionary` VALUES (2, 'organization_type', '机构类型', 2, '', 0, '2020-03-16 00:32:36', '2020-03-16 00:32:36');

-- ----------------------------
-- Table structure for sys_dictionary_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionary_data`;
CREATE TABLE `sys_dictionary_data`  (
  `dict_data_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典项id',
  `dict_id` int(11) NOT NULL COMMENT '字典id',
  `dict_data_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典项标识',
  `dict_data_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字典项名称',
  `sort_number` int(11) NOT NULL DEFAULT 1 COMMENT '排序号',
  `comments` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` int(1) NOT NULL DEFAULT 0 COMMENT '是否删除,0否,1是',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`dict_data_id`) USING BTREE,
  INDEX `dict_id`(`dict_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典项' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dictionary_data
-- ----------------------------
INSERT INTO `sys_dictionary_data` VALUES (1, 1, 'male', '男', 1, '', 0, '2020-03-15 13:07:28', '2020-03-15 13:07:28');
INSERT INTO `sys_dictionary_data` VALUES (2, 1, 'female', '女', 2, '', 0, '2020-03-15 13:07:41', '2020-03-15 15:58:04');
INSERT INTO `sys_dictionary_data` VALUES (3, 2, 'company', '公司', 1, '', 0, '2020-03-16 00:34:32', '2020-03-16 00:34:32');
INSERT INTO `sys_dictionary_data` VALUES (4, 2, 'subsidiary', '子公司', 2, '', 0, '2020-03-16 00:35:02', '2020-03-16 00:35:02');
INSERT INTO `sys_dictionary_data` VALUES (5, 2, 'department', '部门', 3, '', 0, '2020-03-16 00:35:18', '2020-03-16 00:35:18');
INSERT INTO `sys_dictionary_data` VALUES (6, 2, 'group', '小组', 4, '', 0, '2020-03-16 00:35:36', '2020-03-16 00:35:36');

-- ----------------------------
-- Table structure for sys_login_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_record`;
CREATE TABLE `sys_login_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `os` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `device` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备名',
  `browser` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器类型',
  `ip` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `oper_type` int(11) NOT NULL COMMENT '操作类型,0登录成功,1登录失败,2退出登录,3刷新token',
  `comments` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '操作时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '登录日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login_record
-- ----------------------------
INSERT INTO `sys_login_record` VALUES (1, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.56.1', 0, NULL, '2020-06-28 21:41:51', '2020-06-28 21:41:51');
INSERT INTO `sys_login_record` VALUES (2, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.56.1', 0, NULL, '2020-06-29 22:49:45', '2020-06-29 22:49:45');
INSERT INTO `sys_login_record` VALUES (3, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.56.1', 0, NULL, '2020-06-29 22:51:04', '2020-06-29 22:51:04');
INSERT INTO `sys_login_record` VALUES (4, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.56.1', 0, NULL, '2020-06-29 22:58:03', '2020-06-29 22:58:03');
INSERT INTO `sys_login_record` VALUES (5, 'admin', 'Windows 10', 'Windows 10', 'Chrome 8', '192.168.56.1', 0, NULL, '2020-06-29 22:59:09', '2020-06-29 22:59:09');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '上级id,0是顶级',
  `menu_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `menu_icon` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单地址',
  `menu_type` int(11) NULL DEFAULT 0 COMMENT '类型,0菜单,1按钮',
  `sort_number` int(11) NOT NULL DEFAULT 1 COMMENT '排序号',
  `authority` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `target` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '_self' COMMENT '打开位置',
  `icon_color` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标颜色',
  `hide` int(11) NOT NULL DEFAULT 0 COMMENT '是否隐藏,0否,1是',
  `deleted` int(1) NOT NULL DEFAULT 0 COMMENT '是否删除,0否,1是',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
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
INSERT INTO `sys_menu` VALUES (27, 0, '日志管理', 'layui-icon layui-icon-list', NULL, 0, 2, NULL, '_self', NULL, 0, 0, '2020-03-21 18:24:32', '2020-03-21 18:46:07');
INSERT INTO `sys_menu` VALUES (28, 27, '登录日志', NULL, 'sys/loginRecord', 0, 1, 'sys:login_record:view', '_self', NULL, 0, 0, '2020-03-21 18:24:33', '2020-03-21 18:44:52');
INSERT INTO `sys_menu` VALUES (29, 27, '操作日志', NULL, 'sys/operRecord', 0, 2, 'sys:oper_record:view', '_self', NULL, 0, 0, '2020-03-21 18:24:34', '2020-03-21 18:46:10');
INSERT INTO `sys_menu` VALUES (30, 27, '数据监控', NULL, 'druid', 0, 3, NULL, '_self', NULL, 0, 0, '2020-03-21 18:24:35', '2020-03-22 14:46:21');
INSERT INTO `sys_menu` VALUES (31, 0, '系统工具', 'layui-icon layui-icon-slider', NULL, 0, 3, NULL, '_self', NULL, 0, 0, '2020-03-21 18:24:36', '2020-03-22 14:47:49');
INSERT INTO `sys_menu` VALUES (32, 31, '文件管理', NULL, 'file/manage', 0, 1, 'sys:file:view', '_self', NULL, 0, 0, '2020-03-21 18:24:38', '2020-03-22 14:46:57');
INSERT INTO `sys_menu` VALUES (33, 32, '查询文件', NULL, NULL, 1, 1, 'sys:file:list', '_self', NULL, 0, 0, '2020-03-21 18:24:39', '2020-03-22 14:47:32');
INSERT INTO `sys_menu` VALUES (34, 32, '删除文件', NULL, NULL, 1, 2, 'sys:file:remove', '_self', NULL, 0, 0, '2020-03-21 18:24:40', '2020-03-22 14:46:54');
INSERT INTO `sys_menu` VALUES (35, 31, '发送邮件', NULL, 'sys/email', 0, 2, 'sys:email:view', '_self', NULL, 0, 0, '2020-03-21 18:24:41', '2020-03-22 14:47:35');
INSERT INTO `sys_menu` VALUES (36, 31, '项目生成', NULL, NULL, 0, 3, NULL, '_self', NULL, 0, 0, '2020-03-21 18:24:42', '2020-03-22 14:47:36');

-- ----------------------------
-- Table structure for sys_oper_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_record`;
CREATE TABLE `sys_oper_record`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `model` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作模块',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作方法',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求地址',
  `request_method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方式',
  `oper_method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调用方法',
  `param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '返回结果',
  `ip` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `comments` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `spend_time` int(11) NULL DEFAULT NULL COMMENT '请求耗时,单位毫秒',
  `state` int(11) NOT NULL DEFAULT 0 COMMENT '状态,0成功,1异常',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '操作时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_record
-- ----------------------------
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

-- ----------------------------
-- Table structure for sys_organization
-- ----------------------------
DROP TABLE IF EXISTS `sys_organization`;
CREATE TABLE `sys_organization`  (
  `organization_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '机构id',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '上级id,0是顶级',
  `organization_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '机构名称',
  `organization_full_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构全称',
  `organization_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构代码',
  `organization_type` int(11) NOT NULL COMMENT '机构类型',
  `leader_id` int(11) NULL DEFAULT NULL COMMENT '负责人id',
  `sort_number` int(11) NOT NULL DEFAULT 1 COMMENT '排序号',
  `comments` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` int(1) NOT NULL DEFAULT 0 COMMENT '是否删除,0否,1是',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`organization_id`) USING BTREE,
  INDEX `leader_id`(`leader_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织机构' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_organization
-- ----------------------------
INSERT INTO `sys_organization` VALUES (1, 0, 'XXX公司', 'XXXXXXXXX科技有限公司', NULL, 3, NULL, 1, '', 0, '2020-03-15 13:14:55', '2020-03-21 15:12:49');
INSERT INTO `sys_organization` VALUES (2, 1, '研发部', '研发部', NULL, 5, NULL, 2, '', 0, '2020-03-15 13:15:16', '2020-03-16 00:43:09');
INSERT INTO `sys_organization` VALUES (3, 2, '高教组', '高等教育行业项目组', NULL, 6, NULL, 3, '', 0, '2020-03-15 13:15:45', '2020-03-16 00:42:49');
INSERT INTO `sys_organization` VALUES (4, 2, '政务组', '政务行业项目组', NULL, 6, NULL, 4, '', 0, '2020-03-15 13:16:15', '2020-03-16 00:42:54');
INSERT INTO `sys_organization` VALUES (5, 2, '制造组', '生产制造行业项目组', NULL, 6, NULL, 5, '', 0, '2020-03-15 13:16:37', '2020-03-21 15:13:05');
INSERT INTO `sys_organization` VALUES (6, 2, '仿真组', '虚拟仿真行业项目组', NULL, 6, NULL, 6, '', 0, '2020-03-15 13:16:57', '2020-03-16 00:43:03');
INSERT INTO `sys_organization` VALUES (7, 1, '测试部', '测试部', NULL, 5, NULL, 6, '', 0, '2020-03-15 13:17:19', '2020-03-16 00:43:14');
INSERT INTO `sys_organization` VALUES (8, 1, '设计部', 'UI设计部门', NULL, 5, NULL, 7, '', 0, '2020-03-15 13:17:56', '2020-03-16 00:43:18');
INSERT INTO `sys_organization` VALUES (9, 1, '市场部', '市场部', NULL, 5, NULL, 8, '', 0, '2020-03-15 13:18:15', '2020-03-16 00:43:23');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色标识',
  `comments` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `deleted` int(1) NOT NULL DEFAULT 0 COMMENT '是否删除,0否,1是',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', '管理员', 0, '2020-02-26 15:18:37', '2020-03-21 15:15:54');
INSERT INTO `sys_role` VALUES (2, '普通用户', 'user', '普通用户', 0, '2020-02-26 15:18:52', '2020-03-21 15:16:02');
INSERT INTO `sys_role` VALUES (3, '游客', 'guest', '游客', 0, '2020-02-26 15:19:49', '2020-03-21 15:16:57');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `menu_id` int(11) NOT NULL COMMENT '菜单id',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_sys_role_permission_role`(`role_id`) USING BTREE,
  INDEX `menu_id`(`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1, 1, '2020-02-27 00:43:06', '2020-03-20 17:54:04');
INSERT INTO `sys_role_menu` VALUES (2, 1, 2, '2020-03-20 17:59:53', '2020-03-20 18:00:30');
INSERT INTO `sys_role_menu` VALUES (3, 1, 3, '2020-03-20 17:59:55', '2020-03-20 18:00:30');
INSERT INTO `sys_role_menu` VALUES (4, 1, 4, '2020-03-20 17:59:57', '2020-03-20 18:00:32');
INSERT INTO `sys_role_menu` VALUES (5, 1, 5, '2020-03-20 17:59:59', '2020-03-20 18:00:33');
INSERT INTO `sys_role_menu` VALUES (6, 1, 6, '2020-03-20 18:00:03', '2020-03-20 18:00:34');
INSERT INTO `sys_role_menu` VALUES (7, 1, 7, '2020-03-20 18:00:05', '2020-03-20 18:00:35');
INSERT INTO `sys_role_menu` VALUES (8, 1, 8, '2020-03-20 18:00:08', '2020-03-20 18:00:36');
INSERT INTO `sys_role_menu` VALUES (9, 1, 9, '2020-03-20 18:00:10', '2020-03-20 18:00:37');
INSERT INTO `sys_role_menu` VALUES (10, 1, 10, '2020-03-20 18:00:13', '2020-03-20 18:00:39');
INSERT INTO `sys_role_menu` VALUES (11, 1, 11, '2020-03-20 18:00:15', '2020-03-20 18:00:40');
INSERT INTO `sys_role_menu` VALUES (12, 1, 12, '2020-03-21 01:07:50', '2020-03-21 15:19:57');
INSERT INTO `sys_role_menu` VALUES (13, 1, 13, '2020-03-21 16:47:41', '2020-03-21 16:47:41');
INSERT INTO `sys_role_menu` VALUES (14, 1, 14, '2020-03-21 16:47:47', '2020-03-21 16:47:47');
INSERT INTO `sys_role_menu` VALUES (15, 1, 15, '2020-03-22 00:23:11', '2020-03-22 00:23:11');
INSERT INTO `sys_role_menu` VALUES (16, 1, 16, '2020-03-22 00:23:13', '2020-03-22 00:23:13');
INSERT INTO `sys_role_menu` VALUES (17, 1, 17, '2020-03-22 00:23:16', '2020-03-22 00:23:16');
INSERT INTO `sys_role_menu` VALUES (18, 1, 18, '2020-03-22 00:23:18', '2020-03-22 00:23:18');
INSERT INTO `sys_role_menu` VALUES (19, 1, 19, '2020-03-22 00:23:20', '2020-03-22 00:23:20');
INSERT INTO `sys_role_menu` VALUES (20, 1, 20, '2020-03-22 00:23:22', '2020-03-22 00:23:22');
INSERT INTO `sys_role_menu` VALUES (21, 1, 21, '2020-03-22 00:23:25', '2020-03-22 00:23:25');
INSERT INTO `sys_role_menu` VALUES (22, 1, 22, '2020-03-22 00:23:26', '2020-03-22 00:23:26');
INSERT INTO `sys_role_menu` VALUES (23, 1, 23, '2020-03-22 00:23:29', '2020-03-22 00:23:29');
INSERT INTO `sys_role_menu` VALUES (24, 1, 24, '2020-03-22 00:23:31', '2020-03-22 00:23:31');
INSERT INTO `sys_role_menu` VALUES (25, 1, 25, '2020-03-22 00:23:33', '2020-03-22 00:23:33');
INSERT INTO `sys_role_menu` VALUES (26, 1, 26, '2020-03-22 00:23:37', '2020-03-22 00:23:37');
INSERT INTO `sys_role_menu` VALUES (27, 1, 27, '2020-03-22 00:23:40', '2020-03-22 00:23:40');
INSERT INTO `sys_role_menu` VALUES (28, 1, 28, '2020-03-22 00:23:42', '2020-03-22 00:23:42');
INSERT INTO `sys_role_menu` VALUES (29, 1, 29, '2020-03-22 00:23:46', '2020-03-22 00:23:46');
INSERT INTO `sys_role_menu` VALUES (30, 1, 30, '2020-03-22 00:23:48', '2020-03-22 00:23:48');
INSERT INTO `sys_role_menu` VALUES (31, 1, 31, '2020-03-22 00:23:51', '2020-03-22 00:23:51');
INSERT INTO `sys_role_menu` VALUES (32, 1, 32, '2020-03-22 00:23:54', '2020-03-22 00:23:54');
INSERT INTO `sys_role_menu` VALUES (33, 1, 33, '2020-03-22 00:23:56', '2020-03-22 00:23:56');
INSERT INTO `sys_role_menu` VALUES (34, 1, 34, '2020-03-22 00:24:00', '2020-03-22 00:24:00');
INSERT INTO `sys_role_menu` VALUES (35, 1, 35, '2020-03-22 00:24:02', '2020-03-22 00:24:02');
INSERT INTO `sys_role_menu` VALUES (36, 1, 36, '2020-03-22 00:24:06', '2020-03-22 00:24:06');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `nick_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '昵称',
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `sex` int(11) NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `email_verified` int(1) NOT NULL DEFAULT 0 COMMENT '邮箱是否验证,0否,1是',
  `true_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `id_card` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `introduction` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人简介',
  `organization_id` int(11) NULL DEFAULT NULL COMMENT '机构id',
  `state` int(1) NOT NULL DEFAULT 0 COMMENT '状态,0正常,1冻结',
  `deleted` int(1) NOT NULL DEFAULT 0 COMMENT '是否删除,0否,1是',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '注册时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '管理员', NULL, 1, '', NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 0, '2020-01-13 14:43:52', '2020-03-21 12:49:48');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_sys_user_role`(`user_id`) USING BTREE,
  INDEX `FK_sys_user_role_role`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1, 1, '2020-03-12 23:20:08', '2020-03-21 15:18:00');

SET FOREIGN_KEY_CHECKS = 1;
