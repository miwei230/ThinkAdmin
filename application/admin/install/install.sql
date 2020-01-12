/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50726
Source Host           : 127.0.0.1:3306
Source Database       : thinkadmin

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-01-12 10:46:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `system_auth`
-- ----------------------------
DROP TABLE IF EXISTS `system_auth`;
CREATE TABLE `system_auth` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL COMMENT '权限名称',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '权限状态',
  `sort` bigint(20) unsigned DEFAULT '0' COMMENT '排序权重',
  `desc` varchar(255) DEFAULT '' COMMENT '备注说明',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_system_auth_status` (`status`) USING BTREE,
  KEY `idx_system_auth_title` (`title`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统-权限';

-- ----------------------------
-- Records of system_auth
-- ----------------------------

-- ----------------------------
-- Table structure for `system_auth_node`
-- ----------------------------
DROP TABLE IF EXISTS `system_auth_node`;
CREATE TABLE `system_auth_node` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `auth` bigint(20) unsigned DEFAULT NULL COMMENT '角色',
  `node` varchar(200) DEFAULT NULL COMMENT '节点',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_system_auth_auth` (`auth`) USING BTREE,
  KEY `idx_system_auth_node` (`node`(191)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统-权限-授权';

-- ----------------------------
-- Records of system_auth_node
-- ----------------------------

-- ----------------------------
-- Table structure for `system_config`
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '' COMMENT '配置名',
  `value` varchar(500) DEFAULT '' COMMENT '配置值',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_system_config_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COMMENT='系统-配置';

-- ----------------------------
-- Records of system_config
-- ----------------------------
INSERT INTO `system_config` VALUES ('1', 'app_name', 'jm-iframe');
INSERT INTO `system_config` VALUES ('2', 'site_name', 'JMiframe');
INSERT INTO `system_config` VALUES ('3', 'app_version', '2.0dev');
INSERT INTO `system_config` VALUES ('4', 'site_copy', 'Copyright 2014-2019 三牛犇（深圳）控股有限公司');
INSERT INTO `system_config` VALUES ('5', 'site_icon', '/upload/decb0fe26fa3f486/b3f6521bf29403c8.png');
INSERT INTO `system_config` VALUES ('7', 'miitbeian', '粤ICP备15008493号-3');
INSERT INTO `system_config` VALUES ('8', 'storage_type', 'local');
INSERT INTO `system_config` VALUES ('9', 'storage_local_exts', 'doc,gif,icon,jpg,mp3,mp4,p12,pem,png,rar');
INSERT INTO `system_config` VALUES ('10', 'storage_qiniu_bucket', 'https');
INSERT INTO `system_config` VALUES ('11', 'storage_qiniu_domain', '用你自己的吧');
INSERT INTO `system_config` VALUES ('12', 'storage_qiniu_access_key', '用你自己的吧');
INSERT INTO `system_config` VALUES ('13', 'storage_qiniu_secret_key', '用你自己的吧');
INSERT INTO `system_config` VALUES ('14', 'storage_oss_bucket', 'cuci-mytest');
INSERT INTO `system_config` VALUES ('15', 'storage_oss_endpoint', 'oss-cn-hangzhou.aliyuncs.com');
INSERT INTO `system_config` VALUES ('16', 'storage_oss_domain', '用你自己的吧');
INSERT INTO `system_config` VALUES ('17', 'storage_oss_keyid', '用你自己的吧');
INSERT INTO `system_config` VALUES ('18', 'storage_oss_secret', '用你自己的吧');
INSERT INTO `system_config` VALUES ('36', 'storage_oss_is_https', 'http');
INSERT INTO `system_config` VALUES ('43', 'storage_qiniu_region', '华东');
INSERT INTO `system_config` VALUES ('44', 'storage_qiniu_is_https', 'https');
INSERT INTO `system_config` VALUES ('45', 'wechat_mch_id', '1332187001');
INSERT INTO `system_config` VALUES ('46', 'wechat_mch_key', 'A82DC5BD1F3359081049C568D8502BC5');
INSERT INTO `system_config` VALUES ('47', 'wechat_mch_ssl_type', 'p12');
INSERT INTO `system_config` VALUES ('48', 'wechat_mch_ssl_p12', '65b8e4f56718182d/1bc857ee646aa15d.p12');
INSERT INTO `system_config` VALUES ('49', 'wechat_mch_ssl_key', 'cc2e3e1345123930/c407d033294f283d.pem');
INSERT INTO `system_config` VALUES ('50', 'wechat_mch_ssl_cer', '966eaf89299e9c95/7014872cc109b29a.pem');
INSERT INTO `system_config` VALUES ('51', 'wechat_token', 'mytoken');
INSERT INTO `system_config` VALUES ('52', 'wechat_appid', 'wx60a43dd8161666d4');
INSERT INTO `system_config` VALUES ('53', 'wechat_appsecret', '9978422e0e431643d4b42868d183d60b');
INSERT INTO `system_config` VALUES ('54', 'wechat_encodingaeskey', '');
INSERT INTO `system_config` VALUES ('55', 'wechat_push_url', '消息推送地址：http://127.0.0.1:8000/wechat/api.push');
INSERT INTO `system_config` VALUES ('56', 'wechat_type', 'thr');
INSERT INTO `system_config` VALUES ('57', 'wechat_thr_appid', 'wx60a43dd8161666d4');
INSERT INTO `system_config` VALUES ('58', 'wechat_thr_appkey', '5caf4b0727f6e46a7e6ccbe773cc955d');
INSERT INTO `system_config` VALUES ('60', 'wechat_thr_appurl', '消息推送地址：http://127.0.0.1:2314/wechat/api.push');
INSERT INTO `system_config` VALUES ('61', 'component_appid', 'wx28b58798480874f9');
INSERT INTO `system_config` VALUES ('62', 'component_appsecret', '8d0e1ec14ea0adc5027dd0ad82c64bc9');
INSERT INTO `system_config` VALUES ('63', 'component_token', 'P8QHTIxpBEq88IrxatqhgpBm2OAQROkI');
INSERT INTO `system_config` VALUES ('64', 'component_encodingaeskey', 'L5uFIa0U6KLalPyXckyqoVIJYLhsfrg8k9YzybZIHsx');
INSERT INTO `system_config` VALUES ('65', 'system_message_state', '0');
INSERT INTO `system_config` VALUES ('66', 'sms_zt_username', '可以找CUCI申请');
INSERT INTO `system_config` VALUES ('67', 'sms_zt_password', '可以找CUCI申请');
INSERT INTO `system_config` VALUES ('68', 'sms_reg_template', '您的验证码为{code}，请在十分钟内完成操作！');
INSERT INTO `system_config` VALUES ('69', 'sms_secure', '可以找CUCI申请');
INSERT INTO `system_config` VALUES ('70', 'store_title', '测试商城');
INSERT INTO `system_config` VALUES ('71', 'store_order_wait_time', '0.50');
INSERT INTO `system_config` VALUES ('72', 'store_order_clear_time', '24.00');
INSERT INTO `system_config` VALUES ('73', 'store_order_confirm_time', '60.00');
INSERT INTO `system_config` VALUES ('74', 'sms_zt_username2', '可以找CUCI申请2');
INSERT INTO `system_config` VALUES ('75', 'sms_zt_password2', '可以找CUCI申请2');
INSERT INTO `system_config` VALUES ('76', 'sms_secure2', '可以找CUCI申请2');
INSERT INTO `system_config` VALUES ('77', 'sms_reg_template2', '您的验证码为{code}，请在十分钟内完成操作！2');
INSERT INTO `system_config` VALUES ('78', 'michat_appid', '2882303761518074614');
INSERT INTO `system_config` VALUES ('79', 'michat_appkey', '5861807470614');
INSERT INTO `system_config` VALUES ('80', 'michat_appsecert', 'CP/WUTUgDuyOxgLQ5ztesg==');

-- ----------------------------
-- Table structure for `system_data`
-- ----------------------------
DROP TABLE IF EXISTS `system_data`;
CREATE TABLE `system_data` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '配置名',
  `value` longtext COMMENT '配置值',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_system_data_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='系统-数据';

-- ----------------------------
-- Records of system_data
-- ----------------------------
INSERT INTO `system_data` VALUES ('1', 'menudata', '[{\"name\":\"请输入名称\",\"type\":\"scancode_push\",\"key\":\"scancode_push\"}]');

-- ----------------------------
-- Table structure for `system_log`
-- ----------------------------
DROP TABLE IF EXISTS `system_log`;
CREATE TABLE `system_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `node` varchar(200) NOT NULL DEFAULT '' COMMENT '当前操作节点',
  `geoip` varchar(15) NOT NULL DEFAULT '' COMMENT '操作者IP地址',
  `action` varchar(200) NOT NULL DEFAULT '' COMMENT '操作行为名称',
  `content` varchar(1024) NOT NULL DEFAULT '' COMMENT '操作内容描述',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人用户名',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COMMENT='系统-日志';

-- ----------------------------
-- Records of system_log
-- ----------------------------
INSERT INTO `system_log` VALUES ('1', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-10-14 16:59:25');
INSERT INTO `system_log` VALUES ('2', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-10-14 19:31:26');
INSERT INTO `system_log` VALUES ('3', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-10-15 11:21:15');
INSERT INTO `system_log` VALUES ('4', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-10-15 11:34:02');
INSERT INTO `system_log` VALUES ('5', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-10-15 14:18:33');
INSERT INTO `system_log` VALUES ('6', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-10-16 09:15:53');
INSERT INTO `system_log` VALUES ('7', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-10-16 09:16:53');
INSERT INTO `system_log` VALUES ('8', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-10-22 15:12:17');
INSERT INTO `system_log` VALUES ('9', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-10-24 09:22:12');
INSERT INTO `system_log` VALUES ('10', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-10-25 09:24:32');
INSERT INTO `system_log` VALUES ('11', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-11-08 17:47:02');
INSERT INTO `system_log` VALUES ('12', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-11-11 15:22:00');
INSERT INTO `system_log` VALUES ('13', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-11-11 17:34:04');
INSERT INTO `system_log` VALUES ('14', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-11-12 14:12:34');
INSERT INTO `system_log` VALUES ('15', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-11-22 10:06:45');
INSERT INTO `system_log` VALUES ('16', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-11-25 09:45:08');
INSERT INTO `system_log` VALUES ('17', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-12-06 18:17:13');
INSERT INTO `system_log` VALUES ('18', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-12-07 11:32:20');
INSERT INTO `system_log` VALUES ('19', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-12-13 09:29:47');
INSERT INTO `system_log` VALUES ('20', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-12-16 15:33:26');
INSERT INTO `system_log` VALUES ('21', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-12-17 10:41:37');
INSERT INTO `system_log` VALUES ('22', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-12-18 10:20:30');
INSERT INTO `system_log` VALUES ('23', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-12-19 10:24:23');
INSERT INTO `system_log` VALUES ('24', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-12-20 09:31:58');
INSERT INTO `system_log` VALUES ('25', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-12-20 16:29:59');
INSERT INTO `system_log` VALUES ('26', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-12-21 09:16:09');
INSERT INTO `system_log` VALUES ('27', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-12-23 11:25:50');
INSERT INTO `system_log` VALUES ('28', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-12-23 19:28:47');
INSERT INTO `system_log` VALUES ('29', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-12-24 09:36:57');
INSERT INTO `system_log` VALUES ('30', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-12-25 10:58:23');
INSERT INTO `system_log` VALUES ('31', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2019-12-27 13:55:22');
INSERT INTO `system_log` VALUES ('32', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2020-01-10 14:44:01');
INSERT INTO `system_log` VALUES ('33', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2020-01-11 13:52:16');
INSERT INTO `system_log` VALUES ('34', 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统成功', 'admin', '2020-01-12 09:10:26');

-- ----------------------------
-- Table structure for `system_menu`
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) unsigned DEFAULT '0' COMMENT '父ID',
  `title` varchar(100) DEFAULT '' COMMENT '名称',
  `node` varchar(200) DEFAULT '' COMMENT '节点代码',
  `icon` varchar(100) DEFAULT '' COMMENT '菜单图标',
  `url` varchar(400) DEFAULT '' COMMENT '链接',
  `params` varchar(500) DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) DEFAULT '_self' COMMENT '打开方式',
  `sort` int(11) unsigned DEFAULT '100' COMMENT '菜单排序',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_system_menu_node` (`node`(191)) USING BTREE,
  KEY `idx_system_menu_status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COMMENT='系统-菜单';

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES ('1', '0', '后台首页', '', '', 'admin/index/main', '', '_self', '500', '1', '2018-09-05 17:59:38');
INSERT INTO `system_menu` VALUES ('2', '0', '系统管理', '', '', '#', '', '_self', '100', '1', '2018-09-05 18:04:52');
INSERT INTO `system_menu` VALUES ('3', '4', '系统菜单管理', '', 'layui-icon layui-icon-layouts', 'admin/menu/index', '', '_self', '1', '1', '2018-09-05 18:05:26');
INSERT INTO `system_menu` VALUES ('4', '2', '系统配置', '', '', '#', '', '_self', '20', '1', '2018-09-05 18:07:17');
INSERT INTO `system_menu` VALUES ('5', '12', '系统用户管理', '', 'layui-icon layui-icon-username', 'admin/user/index', '', '_self', '1', '1', '2018-09-06 11:10:42');
INSERT INTO `system_menu` VALUES ('7', '12', '访问权限管理', '', 'layui-icon layui-icon-vercode', 'admin/auth/index', '', '_self', '2', '1', '2018-09-06 15:17:14');
INSERT INTO `system_menu` VALUES ('11', '4', '系统参数配置', '', 'layui-icon layui-icon-set', 'admin/config/info', '', '_self', '4', '1', '2018-09-06 16:43:47');
INSERT INTO `system_menu` VALUES ('12', '2', '权限管理', '', '', '#', '', '_self', '10', '1', '2018-09-06 18:01:31');
INSERT INTO `system_menu` VALUES ('27', '4', '系统任务管理', '', 'layui-icon layui-icon-log', 'admin/queue/index', '', '_self', '3', '1', '2018-11-29 11:13:34');
INSERT INTO `system_menu` VALUES ('49', '4', '系统日志管理', '', 'layui-icon layui-icon-form', 'admin/oplog/index', '', '_self', '2', '1', '2019-02-18 12:56:56');
INSERT INTO `system_menu` VALUES ('50', '4', '系统插件', '', 'layui-icon layui-icon-diamond', 'admin/plugs/index', '', '_self', '100', '0', '2019-10-24 09:43:54');
INSERT INTO `system_menu` VALUES ('63', '0', '商城管理', '', '', '#', '', '_self', '100', '0', '2019-10-25 11:24:21');
INSERT INTO `system_menu` VALUES ('64', '63', '商城配置', '', '', '#', '', '_self', '100', '0', '2019-10-25 11:25:44');
INSERT INTO `system_menu` VALUES ('65', '63', '商品管理', '', '', '#', '', '_self', '100', '0', '2019-10-25 11:26:02');
INSERT INTO `system_menu` VALUES ('66', '65', '商品列表', '', 'layui-icon layui-icon-auz', 'store/goods/index', '', '_self', '100', '0', '2019-10-25 11:26:47');
INSERT INTO `system_menu` VALUES ('67', '65', '商品分类', '', 'layui-icon layui-icon-theme', 'store/goods_cate/index', '', '_self', '100', '0', '2019-10-25 11:29:40');
INSERT INTO `system_menu` VALUES ('68', '64', '商城参数配置', '', 'layui-icon layui-icon-fire', 'store/config/index', '', '_self', '100', '0', '2019-10-25 11:33:42');
INSERT INTO `system_menu` VALUES ('116', '4', '系统插件', '', 'layui-icon layui-icon-diamond', '@addons/manager-plugs-index', '', '_self', '100', '1', '2019-12-17 16:54:40');
INSERT INTO `system_menu` VALUES ('117', '4', '系统插件', '', 'layui-icon layui-icon-diamond', '@addons/manager-plugs-index', '', '_self', '100', '1', '2019-12-18 10:16:25');
INSERT INTO `system_menu` VALUES ('118', '4', '自动构建', '', 'layui-icon layui-icon-diamond', '@addons/build-index-index', '', '_self', '100', '1', '2019-12-18 10:23:09');
INSERT INTO `system_menu` VALUES ('120', '4', '一键CRUD', '', 'fa fa-cc-stripe', '@addons/build-index-index', '', '_self', '100', '1', '2020-01-12 10:30:40');

-- ----------------------------
-- Table structure for `system_queue`
-- ----------------------------
DROP TABLE IF EXISTS `system_queue`;
CREATE TABLE `system_queue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '任务名称',
  `data` longtext NOT NULL COMMENT '执行参数',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '任务状态(1新任务,2处理中,3成功,4失败)',
  `preload` varchar(500) DEFAULT '' COMMENT '执行内容',
  `time` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '执行时间',
  `double` tinyint(1) DEFAULT '1' COMMENT '单例模式',
  `desc` varchar(500) DEFAULT '' COMMENT '状态描述',
  `start_at` varchar(20) DEFAULT '' COMMENT '开始时间',
  `end_at` varchar(20) DEFAULT '' COMMENT '结束时间',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_system_queue_double` (`double`) USING BTREE,
  KEY `idx_system_queue_time` (`time`) USING BTREE,
  KEY `idx_system_queue_title` (`title`) USING BTREE,
  KEY `idx_system_queue_create_at` (`create_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统-任务';

-- ----------------------------
-- Records of system_queue
-- ----------------------------

-- ----------------------------
-- Table structure for `system_user`
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT '' COMMENT '用户账号',
  `password` varchar(32) DEFAULT '' COMMENT '用户密码',
  `qq` varchar(16) DEFAULT '' COMMENT '联系QQ',
  `mail` varchar(32) DEFAULT '' COMMENT '联系邮箱',
  `phone` varchar(16) DEFAULT '' COMMENT '联系手机',
  `login_at` datetime DEFAULT NULL COMMENT '登录时间',
  `login_ip` varchar(255) DEFAULT '' COMMENT '登录IP',
  `login_num` bigint(20) unsigned DEFAULT '0' COMMENT '登录次数',
  `authorize` varchar(255) DEFAULT '' COMMENT '权限授权',
  `tags` varchar(255) DEFAULT '' COMMENT '用户标签',
  `desc` varchar(255) DEFAULT '' COMMENT '备注说明',
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态(0禁用,1启用)',
  `is_deleted` tinyint(1) unsigned DEFAULT '0' COMMENT '删除(1删除,0未删)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_system_user_username` (`username`) USING BTREE,
  KEY `idx_system_user_status` (`status`) USING BTREE,
  KEY `idx_system_user_deleted` (`is_deleted`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8mb4 COMMENT='系统-用户';

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES ('10000', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '22222222', 'admin@admin.com', '', '2020-01-12 09:10:26', '127.0.0.1', '31', '', '', '', '1', '0', '2019-10-15 11:32:42');
