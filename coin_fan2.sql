/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : coin_fan2

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-05-25 15:14:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `pwd` char(32) DEFAULT NULL,
  `last_log_ip` varchar(15) DEFAULT NULL,
  `last_log_time` char(10) DEFAULT NULL,
  `descript` varchar(50) DEFAULT NULL COMMENT '管理员描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '115.57.150.188', '1527150914', '超级管理员');

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `image` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banner
-- ----------------------------

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `descript` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `copyright` varchar(100) DEFAULT NULL,
  `tel` varchar(18) DEFAULT NULL,
  `fax` varchar(18) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `logo` varchar(30) DEFAULT NULL,
  `banner` varchar(30) DEFAULT NULL,
  `price` decimal(16,4) DEFAULT '1.0000',
  `total` int(11) DEFAULT '0' COMMENT '预设数量',
  `days` int(8) DEFAULT '0' COMMENT '预设天数',
  `users` int(8) DEFAULT '0' COMMENT '人数',
  `xishu` decimal(7,5) DEFAULT '1.00000' COMMENT '难度系数',
  `invite` int(5) DEFAULT '0' COMMENT '给自己返多少',
  `invite1` int(5) DEFAULT '0' COMMENT '给上级返多少',
  `invite2` int(5) DEFAULT '0' COMMENT '给上上级返多少',
  `register_suanli` int(10) DEFAULT '0' COMMENT '注册送算力',
  `invite1_suanli` int(5) DEFAULT '0' COMMENT '直推的人获得多少算力，即上级',
  `invite2_suanli` int(5) DEFAULT '0' COMMENT '简介推荐人获得算力',
  `login_suanli` int(10) DEFAULT '0' COMMENT '登录加算力',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', '', '', '', '', '', '', '', '', '', '1.0000', '200', '2', '100', '0.10000', '0', '10', '5', '50', '10', '5', '1');

-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `max` int(2) DEFAULT '0' COMMENT '最多可绑定多少个',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态 1可用 0不可用',
  `yuanlibi` varchar(10) DEFAULT '0' COMMENT '原力币 绑定后给自己返多少个原力币',
  `yuanlibi_2` varchar(10) DEFAULT '0' COMMENT '不用',
  `suanli` varchar(10) DEFAULT '0' COMMENT '绑定设备给自己返多少个算力',
  `charge` varchar(10) DEFAULT '0' COMMENT '手续费多少才算激活 （pos）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device
-- ----------------------------
INSERT INTO `device` VALUES ('1', 'Pos机', '1', '1', '420', '2', '50.0000', '30.5');
INSERT INTO `device` VALUES ('2', '路由器', '100', '1', '420', '0', '60.0000', '0');

-- ----------------------------
-- Table structure for device_sn
-- ----------------------------
DROP TABLE IF EXISTS `device_sn`;
CREATE TABLE `device_sn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(2) DEFAULT NULL COMMENT '设备id',
  `sn` varchar(50) DEFAULT NULL COMMENT 'sn码',
  `mima` varchar(50) DEFAULT NULL COMMENT '密码',
  `status` tinyint(4) DEFAULT '1' COMMENT '1未用 0已用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`),
  KEY `comp` (`device_id`,`sn`,`mima`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_sn
-- ----------------------------
INSERT INTO `device_sn` VALUES ('1', '1', '8850001106735250', '123456', '0');
INSERT INTO `device_sn` VALUES ('2', '1', '8850001109968485', '123456', '0');
INSERT INTO `device_sn` VALUES ('3', '1', '8850001106735009', '123456', '1');
INSERT INTO `device_sn` VALUES ('5', '2', 'dddd', '2222123123', '1');
INSERT INTO `device_sn` VALUES ('6', '1', '885000112243197', '123456', '1');
INSERT INTO `device_sn` VALUES ('7', '2', '123456789987', '', '1');
INSERT INTO `device_sn` VALUES ('8', '1', '8850001106735251', 'z123123', '1');
INSERT INTO `device_sn` VALUES ('9', '1', '8850001106735252', 'z123123', '1');
INSERT INTO `device_sn` VALUES ('19', '2', '88500011067352501', 'z123123', '1');
INSERT INTO `device_sn` VALUES ('20', '2', '88500011067352502', 'z123123', '1');
INSERT INTO `device_sn` VALUES ('21', '2', '88500011067352503', 'z123123', '1');
INSERT INTO `device_sn` VALUES ('22', '2', '88500011067352504', 'z123123', '1');
INSERT INTO `device_sn` VALUES ('73', '1', '8850001106735253', 'z123123', '1');
INSERT INTO `device_sn` VALUES ('74', '1', '8850001106735254', 'z123456', '1');
INSERT INTO `device_sn` VALUES ('75', '1', '8850001106735255', 'z123444', '1');
INSERT INTO `device_sn` VALUES ('76', '1', '8850001106735256', 'z223212', '1');
INSERT INTO `device_sn` VALUES ('77', '2', '88500011067352506', 'z22345', '1');
INSERT INTO `device_sn` VALUES ('78', '2', '88500011067352507', 'z22355', '1');
INSERT INTO `device_sn` VALUES ('79', '1', '88500011067352508', 'fd45555', '1');
INSERT INTO `device_sn` VALUES ('145', '1', '852621', '', '1');
INSERT INTO `device_sn` VALUES ('146', '1', '13300001', '13300001', '1');
INSERT INTO `device_sn` VALUES ('147', '1', '13300002', '13300002', '1');
INSERT INTO `device_sn` VALUES ('148', '1', '13300003', '13300003', '1');
INSERT INTO `device_sn` VALUES ('149', '1', '13300004', '13300004', '1');
INSERT INTO `device_sn` VALUES ('150', '1', '13300005', '13300005', '1');
INSERT INTO `device_sn` VALUES ('151', '1', '13300006', '13300006', '1');
INSERT INTO `device_sn` VALUES ('152', '2', '13300007', '13300007', '0');
INSERT INTO `device_sn` VALUES ('153', '2', '13300008', '13300008', '1');
INSERT INTO `device_sn` VALUES ('154', '2', '13300009', '13300009', '1');
INSERT INTO `device_sn` VALUES ('155', '2', '1330001', '1330001', '1');
INSERT INTO `device_sn` VALUES ('156', '2', '1330002', '1330002', '1');
INSERT INTO `device_sn` VALUES ('157', '2', '1330003', '1330003', '1');
INSERT INTO `device_sn` VALUES ('158', '2', '19900211', '19900211', '1');
INSERT INTO `device_sn` VALUES ('159', '2', '19910211', '19910211', '1');
INSERT INTO `device_sn` VALUES ('160', '2', '12355556', '12355556', '0');
INSERT INTO `device_sn` VALUES ('161', '2', '12355557', '12355557', '0');
INSERT INTO `device_sn` VALUES ('162', '2', '18236777562', '18236777562', '0');

-- ----------------------------
-- Table structure for device_xiaofei_log
-- ----------------------------
DROP TABLE IF EXISTS `device_xiaofei_log`;
CREATE TABLE `device_xiaofei_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_sn` varchar(50) DEFAULT NULL COMMENT '设备sn码',
  `order_sn` varchar(50) DEFAULT NULL COMMENT '交易流水号',
  `day` varchar(10) DEFAULT NULL,
  `time` varchar(10) DEFAULT NULL,
  `money` decimal(12,4) DEFAULT NULL,
  `fee` decimal(10,4) DEFAULT NULL,
  `createdate` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT '0是未匹配 1是已匹配，2是无效',
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sn` (`order_sn`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_xiaofei_log
-- ----------------------------
INSERT INTO `device_xiaofei_log` VALUES ('1', '8850001109968485', '741445', '20180401', null, '1599.0000', '11.6000', '1526873677', '1');
INSERT INTO `device_xiaofei_log` VALUES ('2', '8850001109968485', '741446', '20180402', null, '1600.0000', '12.6000', '1526873677', '1');
INSERT INTO `device_xiaofei_log` VALUES ('3', null, null, null, null, null, null, '1526873677', '0');
INSERT INTO `device_xiaofei_log` VALUES ('4', null, null, null, null, null, null, '1526873677', '0');
INSERT INTO `device_xiaofei_log` VALUES ('5', null, null, null, null, null, null, '1526873677', '0');
INSERT INTO `device_xiaofei_log` VALUES ('6', null, null, null, null, null, null, '1526873677', '0');
INSERT INTO `device_xiaofei_log` VALUES ('7', null, null, null, null, null, null, '1526873677', '0');
INSERT INTO `device_xiaofei_log` VALUES ('8', null, null, null, null, null, null, '1526873677', '0');
INSERT INTO `device_xiaofei_log` VALUES ('9', null, null, null, null, null, null, '1526873677', '0');
INSERT INTO `device_xiaofei_log` VALUES ('10', null, null, null, null, null, null, '1526873677', '0');
INSERT INTO `device_xiaofei_log` VALUES ('11', null, null, null, null, null, null, '1526873677', '0');
INSERT INTO `device_xiaofei_log` VALUES ('12', null, null, null, null, null, null, '1526873677', '0');
INSERT INTO `device_xiaofei_log` VALUES ('13', null, null, null, null, null, null, '1526873677', '0');
INSERT INTO `device_xiaofei_log` VALUES ('14', null, null, null, null, null, null, '1526873677', '0');
INSERT INTO `device_xiaofei_log` VALUES ('15', null, null, null, null, null, null, '1526873677', '0');
INSERT INTO `device_xiaofei_log` VALUES ('16', null, null, null, null, null, null, '1526873677', '0');
INSERT INTO `device_xiaofei_log` VALUES ('17', null, null, null, null, null, null, '1526873677', '0');
INSERT INTO `device_xiaofei_log` VALUES ('18', null, null, null, null, null, null, '1526873677', '0');
INSERT INTO `device_xiaofei_log` VALUES ('19', null, null, null, null, null, null, '1526873677', '0');
INSERT INTO `device_xiaofei_log` VALUES ('20', '8850001109968485', '741447', '20180405', null, '2000.0000', '10.0000', '1526873810', '1');
INSERT INTO `device_xiaofei_log` VALUES ('21', null, null, null, null, null, null, '1526873810', '0');
INSERT INTO `device_xiaofei_log` VALUES ('22', null, null, null, null, null, null, '1526873810', '0');
INSERT INTO `device_xiaofei_log` VALUES ('23', null, null, null, null, null, null, '1526873810', '0');
INSERT INTO `device_xiaofei_log` VALUES ('24', null, null, null, null, null, null, '1526873810', '0');
INSERT INTO `device_xiaofei_log` VALUES ('25', null, null, null, null, null, null, '1526873810', '0');
INSERT INTO `device_xiaofei_log` VALUES ('26', null, null, null, null, null, null, '1526873810', '0');
INSERT INTO `device_xiaofei_log` VALUES ('27', null, null, null, null, null, null, '1526873810', '0');
INSERT INTO `device_xiaofei_log` VALUES ('28', null, null, null, null, null, null, '1526873810', '0');
INSERT INTO `device_xiaofei_log` VALUES ('29', null, null, null, null, null, null, '1526873810', '0');
INSERT INTO `device_xiaofei_log` VALUES ('30', null, null, null, null, null, null, '1526873810', '0');
INSERT INTO `device_xiaofei_log` VALUES ('31', null, null, null, null, null, null, '1526873810', '0');
INSERT INTO `device_xiaofei_log` VALUES ('32', null, null, null, null, null, null, '1526873810', '0');
INSERT INTO `device_xiaofei_log` VALUES ('33', null, null, null, null, null, null, '1526873810', '0');
INSERT INTO `device_xiaofei_log` VALUES ('34', null, null, null, null, null, null, '1526873810', '0');
INSERT INTO `device_xiaofei_log` VALUES ('35', null, null, null, null, null, null, '1526873810', '0');
INSERT INTO `device_xiaofei_log` VALUES ('36', null, null, null, null, null, null, '1526873810', '0');

-- ----------------------------
-- Table structure for mycz
-- ----------------------------
DROP TABLE IF EXISTS `mycz`;
CREATE TABLE `mycz` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `num` decimal(16,4) DEFAULT NULL,
  `createdate` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mycz
-- ----------------------------

-- ----------------------------
-- Table structure for myinvite
-- ----------------------------
DROP TABLE IF EXISTS `myinvite`;
CREATE TABLE `myinvite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `from_id` int(11) DEFAULT NULL COMMENT '来源自谁返的 ',
  `device_id` int(11) DEFAULT NULL COMMENT '这个对应我的设备id user_device',
  `type` tinyint(4) DEFAULT NULL COMMENT '1是原力币 2是算力',
  `num` decimal(10,4) DEFAULT '0.0000' COMMENT '0是未激活 1是已激活',
  `status` tinyint(4) DEFAULT NULL COMMENT '0未成功返 1成功返',
  `createdate` int(11) DEFAULT NULL,
  `channel` tinyint(4) DEFAULT '0' COMMENT '来源 1注册 2邀请好友 3消费4,登录',
  PRIMARY KEY (`id`),
  KEY `rex` (`userid`,`createdate`,`channel`),
  KEY `rex1` (`from_id`,`status`),
  KEY `device_id` (`device_id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COMMENT='邀请返利记录';

-- ----------------------------
-- Records of myinvite
-- ----------------------------
INSERT INTO `myinvite` VALUES ('1', '1', '1', null, '1', '20.0000', '0', '1526870341', '1');
INSERT INTO `myinvite` VALUES ('2', '1', '0', null, '2', '50.0000', '1', '1526870341', '1');
INSERT INTO `myinvite` VALUES ('3', '2', '2', null, '1', '20.0000', '1', '1526870399', '1');
INSERT INTO `myinvite` VALUES ('4', '2', '0', null, '2', '50.0000', '1', '1526870399', '1');
INSERT INTO `myinvite` VALUES ('5', '3', '3', null, '1', '20.0000', '0', '1526870496', '1');
INSERT INTO `myinvite` VALUES ('6', '3', '0', null, '2', '50.0000', '1', '1526870496', '1');
INSERT INTO `myinvite` VALUES ('7', '1', '3', null, '1', '10.0000', '0', '1526870496', '2');
INSERT INTO `myinvite` VALUES ('8', '2', null, '1', '1', '450.0000', '0', '1526871175', '0');
INSERT INTO `myinvite` VALUES ('9', '2', null, '2', '1', '450.0000', '1', '1526871373', '0');
INSERT INTO `myinvite` VALUES ('10', '2', null, '2', '2', '60.0000', '1', '1526871373', '0');
INSERT INTO `myinvite` VALUES ('11', '4', '4', null, '1', '20.0000', '1', '1526872234', '1');
INSERT INTO `myinvite` VALUES ('12', '4', '0', null, '2', '50.0000', '1', '1526872234', '1');
INSERT INTO `myinvite` VALUES ('13', '5', '5', null, '1', '20.0000', '1', '1526872441', '1');
INSERT INTO `myinvite` VALUES ('14', '5', '0', null, '2', '50.0000', '1', '1526872441', '1');
INSERT INTO `myinvite` VALUES ('15', '4', '5', null, '1', '10.0000', '1', '1526872441', '2');
INSERT INTO `myinvite` VALUES ('16', '5', null, '3', '1', '450.0000', '1', '1526872942', '0');
INSERT INTO `myinvite` VALUES ('17', '5', null, '3', '2', '60.0000', '1', '1526872942', '0');
INSERT INTO `myinvite` VALUES ('18', '4', null, '4', '1', '450.0000', '1', '1526873065', '0');
INSERT INTO `myinvite` VALUES ('19', '6', '6', null, '1', '20.0000', '1', '1526873237', '1');
INSERT INTO `myinvite` VALUES ('20', '6', '0', null, '2', '50.0000', '1', '1526873237', '1');
INSERT INTO `myinvite` VALUES ('21', '5', '6', null, '1', '10.0000', '1', '1526873237', '2');
INSERT INTO `myinvite` VALUES ('22', '4', '6', null, '1', '5.0000', '1', '1526873237', '2');
INSERT INTO `myinvite` VALUES ('23', '6', null, '5', '1', '450.0000', '1', '1526873770', '0');
INSERT INTO `myinvite` VALUES ('24', '6', null, '5', '2', '60.0000', '1', '1526873770', '0');
INSERT INTO `myinvite` VALUES ('28', '7', '7', null, '1', '20.0000', '0', '1526882238', '1');
INSERT INTO `myinvite` VALUES ('29', '7', '0', null, '2', '50.0000', '1', '1526882238', '1');
INSERT INTO `myinvite` VALUES ('30', '8', '8', null, '1', '20.0000', '0', '1526882436', '1');
INSERT INTO `myinvite` VALUES ('31', '8', '0', null, '2', '50.0000', '1', '1526882436', '1');
INSERT INTO `myinvite` VALUES ('32', '9', '9', null, '1', '20.0000', '0', '1526882665', '1');
INSERT INTO `myinvite` VALUES ('33', '9', '0', null, '2', '50.0000', '1', '1526882665', '1');
INSERT INTO `myinvite` VALUES ('34', '10', '10', null, '1', '20.0000', '0', '1526883056', '1');
INSERT INTO `myinvite` VALUES ('35', '10', '0', null, '2', '50.0000', '1', '1526883056', '1');
INSERT INTO `myinvite` VALUES ('36', '9', '10', null, '1', '10.0000', '0', '1526883056', '2');
INSERT INTO `myinvite` VALUES ('41', '4', null, '4', '2', '3.0000', '1', '1526883769', '3');
INSERT INTO `myinvite` VALUES ('42', '11', '11', null, '1', '20.0000', '0', '1526887735', '1');
INSERT INTO `myinvite` VALUES ('43', '11', '0', null, '2', '50.0000', '1', '1526887735', '1');
INSERT INTO `myinvite` VALUES ('44', '4', null, '6', '1', '450.0000', '1', '1526891683', '0');
INSERT INTO `myinvite` VALUES ('45', '4', null, '6', '2', '60.0000', '1', '1526891683', '0');
INSERT INTO `myinvite` VALUES ('46', '12', '12', null, '1', '20.0000', '0', '1526896625', '1');
INSERT INTO `myinvite` VALUES ('47', '12', '0', null, '2', '50.0000', '1', '1526896625', '1');
INSERT INTO `myinvite` VALUES ('48', '13', '13', null, '1', '20.0000', '0', '1526897596', '1');
INSERT INTO `myinvite` VALUES ('49', '13', '0', null, '2', '50.0000', '1', '1526897596', '1');
INSERT INTO `myinvite` VALUES ('50', '14', '14', null, '1', '20.0000', '0', '1526951432', '1');
INSERT INTO `myinvite` VALUES ('51', '14', '0', null, '2', '50.0000', '1', '1526951432', '1');
INSERT INTO `myinvite` VALUES ('52', '15', '15', null, '1', '20.0000', '0', '1526954274', '1');
INSERT INTO `myinvite` VALUES ('53', '15', '0', null, '2', '50.0000', '1', '1526954274', '1');
INSERT INTO `myinvite` VALUES ('54', '16', '16', null, '1', '20.0000', '0', '1526954710', '1');
INSERT INTO `myinvite` VALUES ('55', '16', '0', null, '2', '50.0000', '1', '1526954710', '1');
INSERT INTO `myinvite` VALUES ('56', '17', '17', null, '1', '20.0000', '0', '1526963093', '1');
INSERT INTO `myinvite` VALUES ('57', '17', '0', null, '2', '50.0000', '1', '1526963093', '1');
INSERT INTO `myinvite` VALUES ('58', '18', '18', null, '1', '20.0000', '0', '1526964460', '1');
INSERT INTO `myinvite` VALUES ('59', '18', '0', null, '2', '50.0000', '1', '1526964460', '1');
INSERT INTO `myinvite` VALUES ('60', '19', '19', null, '1', '20.0000', '0', '1526968244', '1');
INSERT INTO `myinvite` VALUES ('61', '19', '0', null, '2', '50.0000', '1', '1526968244', '1');
INSERT INTO `myinvite` VALUES ('62', '20', '20', null, '1', '20.0000', '0', '1526969832', '1');
INSERT INTO `myinvite` VALUES ('63', '20', '0', null, '2', '50.0000', '1', '1526969832', '1');
INSERT INTO `myinvite` VALUES ('64', '21', '21', null, '1', '20.0000', '0', '1526981496', '1');
INSERT INTO `myinvite` VALUES ('65', '21', '0', null, '2', '50.0000', '1', '1526981496', '1');
INSERT INTO `myinvite` VALUES ('66', '11', '21', null, '1', '10.0000', '0', '1526981496', '2');
INSERT INTO `myinvite` VALUES ('67', '11', '21', null, '2', '10.0000', '1', '1526981496', '1');
INSERT INTO `myinvite` VALUES ('68', '11', null, null, '2', '1.0000', '1', '1526981596', '4');
INSERT INTO `myinvite` VALUES ('69', '21', null, null, '2', '1.0000', '1', '1526981909', '4');
INSERT INTO `myinvite` VALUES ('70', '20', null, null, '2', '1.0000', '1', '1526982380', '4');
INSERT INTO `myinvite` VALUES ('71', '13', null, null, '2', '1.0000', '1', '1526982999', '4');
INSERT INTO `myinvite` VALUES ('72', '15', null, null, '2', '1.0000', '1', '1526983754', '4');
INSERT INTO `myinvite` VALUES ('73', '1', null, null, '2', '1.0000', '1', '1526990721', '4');
INSERT INTO `myinvite` VALUES ('74', '8', null, null, '2', '1.0000', '1', '1526995798', '4');
INSERT INTO `myinvite` VALUES ('75', '18', null, null, '2', '1.0000', '1', '1527000140', '4');
INSERT INTO `myinvite` VALUES ('76', '10', null, null, '2', '1.0000', '1', '1527000290', '4');
INSERT INTO `myinvite` VALUES ('77', '9', null, null, '2', '1.0000', '1', '1527000539', '4');
INSERT INTO `myinvite` VALUES ('78', '22', '22', null, '1', '0.0000', '0', '1527000682', '1');
INSERT INTO `myinvite` VALUES ('79', '22', '0', null, '2', '50.0000', '1', '1527000682', '1');
INSERT INTO `myinvite` VALUES ('80', '22', null, null, '2', '1.0000', '1', '1527000700', '4');
INSERT INTO `myinvite` VALUES ('81', '6', null, null, '2', '1.0000', '1', '1527001377', '4');
INSERT INTO `myinvite` VALUES ('82', '18', null, null, '2', '1.0000', '1', '1527028902', '4');
INSERT INTO `myinvite` VALUES ('83', '10', null, null, '2', '1.0000', '1', '1527030777', '4');
INSERT INTO `myinvite` VALUES ('84', '6', null, null, '2', '1.0000', '1', '1527032490', '4');
INSERT INTO `myinvite` VALUES ('85', '13', null, null, '2', '1.0000', '1', '1527033050', '4');
INSERT INTO `myinvite` VALUES ('86', '8', null, null, '2', '1.0000', '1', '1527036039', '4');
INSERT INTO `myinvite` VALUES ('87', '12', null, null, '2', '1.0000', '1', '1527036381', '4');
INSERT INTO `myinvite` VALUES ('88', '1', null, null, '2', '1.0000', '1', '1527036395', '4');
INSERT INTO `myinvite` VALUES ('89', '5', null, null, '2', '1.0000', '1', '1527037039', '4');
INSERT INTO `myinvite` VALUES ('90', '21', null, null, '2', '1.0000', '1', '1527038879', '4');
INSERT INTO `myinvite` VALUES ('91', '22', null, null, '2', '1.0000', '1', '1527042728', '4');
INSERT INTO `myinvite` VALUES ('92', '4', null, null, '2', '1.0000', '1', '1527043290', '4');
INSERT INTO `myinvite` VALUES ('93', '14', null, null, '2', '1.0000', '1', '1527044967', '4');
INSERT INTO `myinvite` VALUES ('94', '23', '23', null, '1', '0.0000', '0', '1527045457', '1');
INSERT INTO `myinvite` VALUES ('95', '23', '0', null, '2', '50.0000', '1', '1527045457', '1');
INSERT INTO `myinvite` VALUES ('96', '14', '23', null, '1', '10.0000', '0', '1527045457', '2');
INSERT INTO `myinvite` VALUES ('97', '14', '23', null, '2', '10.0000', '1', '1527045457', '2');
INSERT INTO `myinvite` VALUES ('98', '24', '24', null, '1', '0.0000', '0', '1527053873', '1');
INSERT INTO `myinvite` VALUES ('99', '24', '0', null, '2', '50.0000', '1', '1527053873', '1');
INSERT INTO `myinvite` VALUES ('100', '10', '24', null, '1', '10.0000', '0', '1527053873', '2');
INSERT INTO `myinvite` VALUES ('101', '10', '24', null, '2', '10.0000', '1', '1527053873', '2');
INSERT INTO `myinvite` VALUES ('102', '9', '24', null, '1', '5.0000', '0', '1527053873', '2');
INSERT INTO `myinvite` VALUES ('103', '9', '24', null, '2', '5.0000', '1', '1527053873', '2');
INSERT INTO `myinvite` VALUES ('104', '24', null, null, '2', '1.0000', '1', '1527053889', '4');
INSERT INTO `myinvite` VALUES ('105', '25', '25', null, '1', '0.0000', '0', '1527063863', '1');
INSERT INTO `myinvite` VALUES ('106', '25', '0', null, '2', '50.0000', '1', '1527063863', '1');
INSERT INTO `myinvite` VALUES ('107', '5', '25', null, '1', '10.0000', '0', '1527063863', '2');
INSERT INTO `myinvite` VALUES ('108', '5', '25', null, '2', '10.0000', '1', '1527063863', '2');
INSERT INTO `myinvite` VALUES ('109', '4', '25', null, '1', '5.0000', '0', '1527063863', '2');
INSERT INTO `myinvite` VALUES ('110', '4', '25', null, '2', '5.0000', '1', '1527063863', '2');
INSERT INTO `myinvite` VALUES ('111', '25', null, null, '2', '1.0000', '1', '1527064002', '4');
INSERT INTO `myinvite` VALUES ('112', '7', null, null, '2', '1.0000', '1', '1527064565', '4');
INSERT INTO `myinvite` VALUES ('113', '18', null, null, '2', '1.0000', '1', '1527116058', '4');
INSERT INTO `myinvite` VALUES ('114', '10', null, null, '2', '1.0000', '1', '1527116859', '4');
INSERT INTO `myinvite` VALUES ('115', '6', null, null, '2', '1.0000', '1', '1527121235', '4');
INSERT INTO `myinvite` VALUES ('116', '12', null, null, '2', '1.0000', '1', '1527124920', '4');
INSERT INTO `myinvite` VALUES ('117', '21', null, null, '2', '1.0000', '1', '1527125476', '4');
INSERT INTO `myinvite` VALUES ('118', '5', null, null, '2', '1.0000', '1', '1527126860', '4');
INSERT INTO `myinvite` VALUES ('119', '15', null, null, '2', '1.0000', '1', '1527127240', '4');
INSERT INTO `myinvite` VALUES ('120', '14', null, null, '2', '1.0000', '1', '1527129259', '4');
INSERT INTO `myinvite` VALUES ('121', '24', null, null, '2', '1.0000', '1', '1527129851', '4');
INSERT INTO `myinvite` VALUES ('122', '9', null, null, '2', '1.0000', '1', '1527140045', '4');
INSERT INTO `myinvite` VALUES ('123', '4', null, null, '2', '1.0000', '1', '1527148145', '4');
INSERT INTO `myinvite` VALUES ('124', '1', null, null, '2', '1.0000', '1', '1527148620', '4');
INSERT INTO `myinvite` VALUES ('125', '25', null, null, '2', '1.0000', '1', '1527150936', '4');
INSERT INTO `myinvite` VALUES ('126', '3', null, null, '2', '1.0000', '1', '1527151274', '4');
INSERT INTO `myinvite` VALUES ('127', '1', null, null, '2', '1.0000', '1', '1527184524', '4');
INSERT INTO `myinvite` VALUES ('128', '18', null, null, '2', '1.0000', '1', '1527218183', '4');
INSERT INTO `myinvite` VALUES ('129', '10', null, null, '2', '1.0000', '1', '1527218520', '4');
INSERT INTO `myinvite` VALUES ('130', '14', null, null, '2', '1.0000', '1', '1527218601', '4');
INSERT INTO `myinvite` VALUES ('131', '26', '26', null, '1', '0.0000', '0', '1527218606', '1');
INSERT INTO `myinvite` VALUES ('132', '26', '0', null, '2', '50.0000', '1', '1527218606', '1');
INSERT INTO `myinvite` VALUES ('133', '18', '26', null, '1', '10.0000', '0', '1527218606', '2');
INSERT INTO `myinvite` VALUES ('134', '18', '26', null, '2', '10.0000', '1', '1527218606', '2');
INSERT INTO `myinvite` VALUES ('135', '6', null, null, '2', '1.0000', '1', '1527219265', '4');
INSERT INTO `myinvite` VALUES ('136', '13', null, null, '2', '1.0000', '1', '1527221061', '4');
INSERT INTO `myinvite` VALUES ('137', '7', null, null, '2', '1.0000', '1', '1527231743', '4');

-- ----------------------------
-- Table structure for mytransfer
-- ----------------------------
DROP TABLE IF EXISTS `mytransfer`;
CREATE TABLE `mytransfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `peerid` int(11) DEFAULT NULL COMMENT '对方userid',
  `num` decimal(10,4) DEFAULT NULL,
  `createdate` int(11) DEFAULT NULL,
  `realname` varchar(30) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mytransfer
-- ----------------------------

-- ----------------------------
-- Table structure for myzc
-- ----------------------------
DROP TABLE IF EXISTS `myzc`;
CREATE TABLE `myzc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(6) NOT NULL,
  `address` varchar(100) DEFAULT NULL COMMENT '转出地址',
  `txid` varchar(200) DEFAULT NULL,
  `num` decimal(16,4) DEFAULT NULL,
  `createdate` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT '0未到账 1到账 2是拒绝',
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `address` (`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myzc
-- ----------------------------

-- ----------------------------
-- Table structure for myzr
-- ----------------------------
DROP TABLE IF EXISTS `myzr`;
CREATE TABLE `myzr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(6) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `txid` varchar(200) DEFAULT NULL,
  `num` decimal(16,4) DEFAULT NULL,
  `createdate` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `zuhe1` (`txid`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myzr
-- ----------------------------

-- ----------------------------
-- Table structure for sys_cookie
-- ----------------------------
DROP TABLE IF EXISTS `sys_cookie`;
CREATE TABLE `sys_cookie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `identifier` varchar(100) DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`) USING BTREE,
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_cookie
-- ----------------------------
INSERT INTO `sys_cookie` VALUES ('2', '2', '48ad972e136999e7a1d6fe206df6bc97', 'c21f02d34ccd846cebd4e5da305caa22', '1527130853');
INSERT INTO `sys_cookie` VALUES ('6', '3', '05002aacd4c7ea449b71f9fb9fffdb6c', '5d7c9d5ceb17b7206621148616c0a865', '1527410472');
INSERT INTO `sys_cookie` VALUES ('7', '7', 'a2dfbbe33fd5791125eda3b772f26085', '2eec53b5ddc22857b153dea1d7f87332', '1527490941');
INSERT INTO `sys_cookie` VALUES ('8', '8', '00e00a5c43fab44658bb75860a7d670c', '0bc33b2617b03218463c0e60fcac3681', '1527141655');
INSERT INTO `sys_cookie` VALUES ('9', '9', '7830ac198f2c4baf42c8eee18a8662db', 'a19697ef626998e2f4936ae236637cae', '1527141878');
INSERT INTO `sys_cookie` VALUES ('15', '13', 'c9f285c63c38fbe9e9560165cd4776db', '5e5adbcee2d9619ef34d9482f21c15e1', '1527480259');
INSERT INTO `sys_cookie` VALUES ('17', '15', '79d740612af75ac6cac09301d5b1acbd', '282b5f32727ba31129c020ebeb404973', '1527213489');
INSERT INTO `sys_cookie` VALUES ('22', '17', '4fdf5510e71af85bc4fb70ed15fe4303', '6a87f4606047bdd1a30c84a4d0b81ec8', '1527222309');
INSERT INTO `sys_cookie` VALUES ('23', '18', '7ae8b5815a0abc4edc14d74fbf715993', '662afc922052562ee23ef167f4fde17a', '1527485562');
INSERT INTO `sys_cookie` VALUES ('25', '20', '32d3e5b5cd24e4ba73bb1e94bf568022', 'c0f9c4c4d33e36fc6deb015aa7af1a3c', '1527229050');
INSERT INTO `sys_cookie` VALUES ('29', '22', 'bed3a7db9e6e8b0d4abfb8c50e993fb0', 'c45b5685cd84271bd5d3a8615058db4d', '1527259897');
INSERT INTO `sys_cookie` VALUES ('30', '14', '2fd17fc7853fc4617b3f19ca848c4576', 'db02a3c42258e3099b867eb8c7ca1197', '1527304538');
INSERT INTO `sys_cookie` VALUES ('31', '10', '6218867a411cb3ea512debba2acac149', '560590730fe3f0521859661ace140b54', '1527477708');
INSERT INTO `sys_cookie` VALUES ('32', '24', '9ac369e2f222c72892a0f7639be5c152', 'e2f675cdacc4c5323e5d62b36447dbb3', '1527313086');
INSERT INTO `sys_cookie` VALUES ('37', '12', '994cd6033be0ac056e6735f8626292d6', 'c9ef8fd6ee2f4bb0e2f39099c9822a70', '1527409660');
INSERT INTO `sys_cookie` VALUES ('38', '4', '49bc15c9346b8b977c730d61fdcde951', '260048c1793d5bf31b576088f89ed6b8', '1527407343');
INSERT INTO `sys_cookie` VALUES ('39', '21', 'f0f2c5a21ad203edfc8abd5cf3fea563', '7b41d8321c09461659b110a66279367d', '1527329525');
INSERT INTO `sys_cookie` VALUES ('41', '6', '860f00c1993f09818b5f515189b92c45', '63b56c5de22c864f8d9dec7cd457b542', '1527334926');
INSERT INTO `sys_cookie` VALUES ('42', '5', '820bab64c9ac6de547eede8d3ae1d0c5', '95c1aaa1ed09e1b4099aabb3f3f8a4f9', '1527410570');
INSERT INTO `sys_cookie` VALUES ('43', '1', 'aaf8ec34428b197f1425338251558eb4', 'c9f3bf2645c2cd629896f60883f97c55', '1527443824');

-- ----------------------------
-- Table structure for sys_fl_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_fl_log`;
CREATE TABLE `sys_fl_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `nandu` varchar(20) DEFAULT NULL,
  `suanli` varchar(15) DEFAULT NULL,
  `num` decimal(15,8) DEFAULT NULL,
  `createdate` int(11) DEFAULT NULL,
  `status` tinyint(2) DEFAULT '2' COMMENT '1是已收取 0是作废 2是待收取',
  `updatedate` int(11) DEFAULT '0' COMMENT '收取时间',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`,`status`,`createdate`)
) ENGINE=InnoDB AUTO_INCREMENT=891 DEFAULT CHARSET=utf8 COMMENT='每天返利记录';

-- ----------------------------
-- Records of sys_fl_log
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `pid` int(6) DEFAULT '0',
  `username` varchar(30) NOT NULL,
  `phone` varchar(15) NOT NULL COMMENT '电话',
  `password` char(32) DEFAULT NULL,
  `paypassword` char(32) DEFAULT NULL,
  `realname` varchar(30) DEFAULT NULL COMMENT '姓名',
  `idcard` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `createdate` int(11) DEFAULT NULL,
  `status` tinyint(2) DEFAULT '1',
  `country` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `is_cert` tinyint(4) DEFAULT '0' COMMENT '是否实名认证 1已实名认证',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `phone` (`phone`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '0', '13140108021', '13140108021', 'e10adc3949ba59abbe56e057f20f883e', '25f9e794323b453885f5181f1b624d0b', '哈哈哈哈哈', null, '1526870341', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('3', '1', '16603848631', '16603848631', 'e10adc3949ba59abbe56e057f20f883e', '25f9e794323b453885f5181f1b624d0b', '刘义成', null, '1526870496', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('4', '0', '15036164378', '15036164378', 'e10adc3949ba59abbe56e057f20f883e', '33374c88e3a7570c211c203b4795fc24', '菜鸟', '411381199005250416', '1526872234', '1', null, null, null, '1');
INSERT INTO `user` VALUES ('5', '4', '18939238803', '18939238803', 'ab244795339868d6e9d35ed7e7de7e3b', 'f0209bf299524217a39c6f6ce6531d94', '009', '009000900090009999', '1526872441', '1', '8888', '8888', '8888', '1');
INSERT INTO `user` VALUES ('6', '5', '18236777562', '18236777562', 'dc483e80a7a0bd9ef71d8cf973673924', '9cbf8a4dcb8e30682b927f352d6559a0', '金子', '412728198806123456', '1526873237', '1', null, null, null, '1');
INSERT INTO `user` VALUES ('7', '0', '15515761553', '15515761553', '8e3c006c389424143cf8ba001e9621bd', 'c44a471bd78cc6c2fea32b9fe028d30a', '薛金梦', null, '1526882238', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('8', '0', '13183001708', '13183001708', 'f4e8f6ba054c8b754e13d4898f6a87ab', 'e1dc80d7a0af50b4675048fddeea0435', '从响峰', null, '1526882436', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('9', '0', '18530057188', '18530057188', 'ed334184594e29f7830b192943471704', '2bd12a930c3012f9bb4e0ea9bec9a3fc', '乔石', null, '1526882665', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('10', '9', '13083717777', '13083717777', 'e10adc3949ba59abbe56e057f20f883e', 'c33367701511b4f6020ec61ded352059', '张俊', null, '1526883056', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('11', '0', '15890143120', '15890143120', 'e10adc3949ba59abbe56e057f20f883e', '96e79218965eb72c92a549dd5a330112', '马帅', null, '1526887735', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('12', '0', '15617636330', '15617636330', '96e79218965eb72c92a549dd5a330112', 'e3ceb5881a0a1fdaad01296d7554868d', '张杰', null, '1526896625', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('13', '0', '17639222000', '17639222000', '114c8c9652af03f087a8b5c60c40abca', 'e3f025b7f98153a1e7a152bc4fc1c677', '喏孩儿', null, '1526897596', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('14', '0', '15039265067', '15039265067', '430d6cc76d8cab2e00f0277bb8826ae9', 'e087dae60e744ea80722b785a75adbb7', '范世杰', null, '1526951432', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('15', '0', '13282836329', '13282836329', 'dcee3048375575d6b8810573ffe94329', 'e93669b61aa64eca250e144146f31db0', 'han', null, '1526954274', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('16', '0', '15890143125', '15890143125', 'e10adc3949ba59abbe56e057f20f883e', '96e79218965eb72c92a549dd5a330112', '马帅', null, '1526954710', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('17', '0', '13664720800', '13664720800', '7b33af331b253ff53f8473c7eb6bac85', '89f8c01f36d1c843160a1460ab7f57c2', '万涛', null, '1526963093', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('18', '0', '13598808667', '13598808667', '889a145324cc0b54822d12ca2140e217', '2dc22add53605cdad306d37b0e4f0348', '欧文', null, '1526964460', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('19', '0', '18552440765', '18552440765', '511ed2f6d0841c0c71889f1bfa0504c0', 'ab244795339868d6e9d35ed7e7de7e3b', '殷庭庭', null, '1526968244', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('20', '0', '18612703559', '18612703559', '0782f57b1e01331a87fd35c0af9716db', '824a2468ceb4db549925f537127a780d', 'borch', null, '1526969832', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('21', '11', '15890143123', '15890143123', 'e10adc3949ba59abbe56e057f20f883e', '96e79218965eb72c92a549dd5a330112', '马帅', null, '1526981496', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('22', '0', '13674974801', '13674974801', 'b608b1e7cbb662a92184521d3dc18881', 'a688a47ac73fb58ce3828bcb184cb157', '殷雪涛', null, '1527000682', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('23', '14', '15225134067', '15225134067', 'e10adc3949ba59abbe56e057f20f883e', 'c33367701511b4f6020ec61ded352059', '我们', null, '1527045457', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('24', '10', '15333819133', '15333819133', '05036ca4a34a28bad4dad99af9ed62a4', '7d93a5f8b3d287771aa29d4834b3fd54', '葛荣伦', null, '1527053873', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('25', '5', '17630240712', '17630240712', 'dc483e80a7a0bd9ef71d8cf973673924', '5690dddfa28ae085d23518a035707282', '穆', null, '1527063863', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('26', '18', '13523492929', '13523492929', 'a63eb189313041d0a08c976acbd663ec', 'fae5f62373c9162ceb0f311319279856', 'MiaoGivenchy', null, '1527218606', '1', null, null, null, '0');

-- ----------------------------
-- Table structure for user_certification
-- ----------------------------
DROP TABLE IF EXISTS `user_certification`;
CREATE TABLE `user_certification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `zheng` varchar(50) DEFAULT NULL,
  `fan` varchar(50) DEFAULT NULL,
  `shou` varchar(50) DEFAULT NULL,
  `createdate` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT '0审核中 1已审核',
  `realname` varchar(30) DEFAULT NULL,
  `idcard` char(18) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_certification
-- ----------------------------
INSERT INTO `user_certification` VALUES ('2', '4', '2018-05-21/5b0239c6af550.jpg', '2018-05-21/5b0239c6afe23.jpg', '2018-05-21/5b0239c6b05cc.jpg', '1526872518', '1', '菜鸟', '411381199005250416');
INSERT INTO `user_certification` VALUES ('3', '5', '2018-05-21/5b023a9f95949.jpg', '2018-05-21/5b023a9f961a6.jpg', '2018-05-21/5b023a9f966e7.jpg', '1526872735', '1', '009', '009000900090009999');
INSERT INTO `user_certification` VALUES ('4', '6', '2018-05-21/5b023e630e62e.jpeg', '2018-05-21/5b023e630f89f.jpeg', '2018-05-21/5b023e63111cd.jpeg', '1526873699', '1', '金子', '412728198806123456');
INSERT INTO `user_certification` VALUES ('5', '8', '2018-05-22/5b03c8ff27a56.jpeg', '2018-05-22/5b03c8ff28f04.jpeg', '2018-05-22/5b03c8ff2a107.jpeg', '1526974719', '0', '从响峰', '320684198505016691');

-- ----------------------------
-- Table structure for user_coin
-- ----------------------------
DROP TABLE IF EXISTS `user_coin`;
CREATE TABLE `user_coin` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `userid` int(6) DEFAULT NULL,
  `lth` decimal(20,8) unsigned DEFAULT '0.00000000',
  `lthd` decimal(20,8) unsigned DEFAULT '0.00000000',
  `lthb` varchar(100) DEFAULT '',
  `lthz` decimal(20,8) unsigned DEFAULT '0.00000000' COMMENT '我的算力',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid` (`userid`) USING BTREE,
  KEY `lthb` (`lthb`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_coin
-- ----------------------------
INSERT INTO `user_coin` VALUES ('1', '1', '0.37060000', '30.00000000', 'j4s72NGGoDsn7hrxEf6jVIAR9p9ofPki', '54.00000000');
INSERT INTO `user_coin` VALUES ('3', '3', '0.14170000', '20.00000000', '', '51.00000000');
INSERT INTO `user_coin` VALUES ('4', '4', '935.90280000', '5.00000000', 'j1vATXMGEI9mFUGfEVbdDjJYj0FQDkLL', '157.00000000');
INSERT INTO `user_coin` VALUES ('5', '5', '480.69160000', '10.00000000', 'Y3ONnUxFhui1fe1RtcVfyGjALbp8brNf', '122.00000000');
INSERT INTO `user_coin` VALUES ('6', '6', '470.73590000', '0.00000000', '', '114.00000000');
INSERT INTO `user_coin` VALUES ('7', '7', '0.27750000', '20.00000000', '', '52.00000000');
INSERT INTO `user_coin` VALUES ('8', '8', '0.15320000', '20.00000000', '', '52.00000000');
INSERT INTO `user_coin` VALUES ('9', '9', '0.14420000', '35.00000000', '', '57.00000000');
INSERT INTO `user_coin` VALUES ('10', '10', '0.36420000', '30.00000000', '', '64.00000000');
INSERT INTO `user_coin` VALUES ('11', '11', '0.07920000', '30.00000000', '', '61.00000000');
INSERT INTO `user_coin` VALUES ('12', '12', '0.14400000', '20.00000000', '', '52.00000000');
INSERT INTO `user_coin` VALUES ('13', '13', '0.24330000', '20.00000000', '', '53.00000000');
INSERT INTO `user_coin` VALUES ('14', '14', '0.26400000', '30.00000000', '', '63.00000000');
INSERT INTO `user_coin` VALUES ('15', '15', '0.02640000', '20.00000000', '', '52.00000000');
INSERT INTO `user_coin` VALUES ('16', '16', '0.00000000', '20.00000000', '', '50.00000000');
INSERT INTO `user_coin` VALUES ('17', '17', '0.00000000', '20.00000000', '', '50.00000000');
INSERT INTO `user_coin` VALUES ('18', '18', '0.22600000', '30.00000000', '', '64.00000000');
INSERT INTO `user_coin` VALUES ('19', '19', '0.00000000', '20.00000000', '', '50.00000000');
INSERT INTO `user_coin` VALUES ('20', '20', '0.00000000', '20.00000000', '', '51.00000000');
INSERT INTO `user_coin` VALUES ('21', '21', '0.10030000', '20.00000000', '', '53.00000000');
INSERT INTO `user_coin` VALUES ('22', '22', '0.04430000', '0.00000000', '', '52.00000000');
INSERT INTO `user_coin` VALUES ('23', '23', '0.00000000', '0.00000000', '', '50.00000000');
INSERT INTO `user_coin` VALUES ('24', '24', '0.04650000', '0.00000000', '', '52.00000000');
INSERT INTO `user_coin` VALUES ('25', '25', '0.11310000', '0.00000000', '', '52.00000000');
INSERT INTO `user_coin` VALUES ('26', '26', '0.00000000', '0.00000000', '', '50.00000000');

-- ----------------------------
-- Table structure for user_device
-- ----------------------------
DROP TABLE IF EXISTS `user_device`;
CREATE TABLE `user_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `device_id` tinyint(4) DEFAULT NULL COMMENT '设备类型id ',
  `sn` varchar(50) DEFAULT NULL,
  `mima` varchar(50) DEFAULT NULL,
  `createdate` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT '0是未激活 1是已激活',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_device
-- ----------------------------
INSERT INTO `user_device` VALUES ('1', '2', '1', '8850001106735250', '123456', '1526871175', '0');
INSERT INTO `user_device` VALUES ('2', '2', '2', '12355556', '12355556', '1526871373', '1');
INSERT INTO `user_device` VALUES ('3', '5', '2', '12355557', '12355557', '1526872942', '1');
INSERT INTO `user_device` VALUES ('4', '4', '1', '8850001109968485', '123456', '1526873065', '1');
INSERT INTO `user_device` VALUES ('5', '6', '2', '18236777562', '18236777562', '1526873770', '1');
INSERT INTO `user_device` VALUES ('6', '4', '2', '13300007', '13300007', '1526891683', '1');

-- ----------------------------
-- Table structure for user_qianbao
-- ----------------------------
DROP TABLE IF EXISTS `user_qianbao`;
CREATE TABLE `user_qianbao` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `userid` int(6) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `createdate` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_qianbao
-- ----------------------------
INSERT INTO `user_qianbao` VALUES ('1', '4', '123', '456789', '1526958877', '1');

-- ----------------------------
-- Table structure for user_shenqing
-- ----------------------------
DROP TABLE IF EXISTS `user_shenqing`;
CREATE TABLE `user_shenqing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `shr` varchar(50) DEFAULT NULL COMMENT '收货人',
  `lxfs` varchar(20) DEFAULT NULL COMMENT '联系方式',
  `area` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `default` tinyint(2) DEFAULT '0' COMMENT '默认 1',
  `createdate` int(11) DEFAULT NULL,
  `type` tinyint(2) DEFAULT NULL COMMENT '类型 1是pos机 2是路由器',
  `status` tinyint(2) DEFAULT '2' COMMENT '2处理中 1已处理  0已作废',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`,`status`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='pos路由器申请记录';

-- ----------------------------
-- Records of user_shenqing
-- ----------------------------
INSERT INTO `user_shenqing` VALUES ('1', '4', '菜鸟', '15036164378', '河南省 郑州市 金水区', '123456789', '0', '1527148177', '1', '0');
INSERT INTO `user_shenqing` VALUES ('2', '4', '菜鸟', '15036164378', '河南省 郑州市 管城回族区', '703', '0', '1527148862', '2', '1');
INSERT INTO `user_shenqing` VALUES ('3', '4', '菜鸟1', '1503164378', '天津市 天津市 和平区', '707', '0', '1527149028', '2', '2');
