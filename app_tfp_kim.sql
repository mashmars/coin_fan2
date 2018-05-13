/*
Navicat MySQL Data Transfer

Source Server         : tfc
Source Server Version : 50719
Source Host           : 47.89.23.187:3306
Source Database       : app_tfp_kim

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-05-13 18:38:09
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
INSERT INTO `admin` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '183.240.196.69', '1526086480', '超级管理员');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', '', '', '', '', '', '', '', '', '', '1.0000', '200', '2', '100', '1.00000', '20', '10', '5', '50');

-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `max` int(2) DEFAULT '0' COMMENT '最多可绑定多少个',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态 1可用 0不可用',
  `yuanlibi` varchar(10) DEFAULT '0' COMMENT '原力币 绑定后给邀请人返多少个原力币',
  `yuanlibi_2` varchar(10) DEFAULT '0' COMMENT '给邀请人的邀请人返利数量',
  `suanli` varchar(10) DEFAULT '0' COMMENT '绑定设备给自己返多少个算力',
  `charge` varchar(10) DEFAULT '0' COMMENT '手续费多少才算激活 （pos）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device
-- ----------------------------
INSERT INTO `device` VALUES ('1', 'Pos机', '1', '1', '10.0000', '2', '50.0000', '30.5');
INSERT INTO `device` VALUES ('2', '路由器', '100', '1', '0.0000', '0', '60.0000', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_sn
-- ----------------------------
INSERT INTO `device_sn` VALUES ('1', '1', '8850001106735250', '', '0');
INSERT INTO `device_sn` VALUES ('2', '1', '8850001109968485', '', '0');
INSERT INTO `device_sn` VALUES ('3', '1', '8850001106735009', '', '0');
INSERT INTO `device_sn` VALUES ('5', '2', 'dddd', '2222123123', '0');
INSERT INTO `device_sn` VALUES ('6', '1', '885000112243197', '', '0');
INSERT INTO `device_sn` VALUES ('7', '2', '123456789987', '', '0');
INSERT INTO `device_sn` VALUES ('8', '1', '8850001106735251', 'z123123', '0');
INSERT INTO `device_sn` VALUES ('9', '1', '8850001106735252', 'z123123', '0');
INSERT INTO `device_sn` VALUES ('19', '2', '88500011067352501', 'z123123', '0');
INSERT INTO `device_sn` VALUES ('20', '2', '88500011067352502', 'z123123', '0');
INSERT INTO `device_sn` VALUES ('21', '2', '88500011067352503', 'z123123', '0');
INSERT INTO `device_sn` VALUES ('22', '2', '88500011067352504', 'z123123', '0');
INSERT INTO `device_sn` VALUES ('73', '1', '8850001106735253', 'z123123', '0');
INSERT INTO `device_sn` VALUES ('74', '1', '8850001106735254', 'z123456', '0');
INSERT INTO `device_sn` VALUES ('75', '1', '8850001106735255', 'z123444', '0');
INSERT INTO `device_sn` VALUES ('76', '1', '8850001106735256', 'z223212', '0');
INSERT INTO `device_sn` VALUES ('77', '2', '88500011067352506', 'z22345', '0');
INSERT INTO `device_sn` VALUES ('78', '2', '88500011067352507', 'z22355', '0');
INSERT INTO `device_sn` VALUES ('79', '1', '88500011067352508', 'fd45555', '1');
INSERT INTO `device_sn` VALUES ('145', '1', '852621', '', '1');
INSERT INTO `device_sn` VALUES ('146', '1', '13300001', '13300001', '0');
INSERT INTO `device_sn` VALUES ('147', '1', '13300002', '13300002', '0');
INSERT INTO `device_sn` VALUES ('148', '1', '13300003', '13300003', '0');
INSERT INTO `device_sn` VALUES ('149', '1', '13300004', '13300004', '1');
INSERT INTO `device_sn` VALUES ('150', '1', '13300005', '13300005', '1');
INSERT INTO `device_sn` VALUES ('151', '1', '13300006', '13300006', '1');
INSERT INTO `device_sn` VALUES ('152', '2', '13300007', '13300007', '0');
INSERT INTO `device_sn` VALUES ('153', '2', '13300008', '13300008', '0');
INSERT INTO `device_sn` VALUES ('154', '2', '13300009', '13300009', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=179 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_xiaofei_log
-- ----------------------------
INSERT INTO `device_xiaofei_log` VALUES ('1', '8850001106735250', '741446', '20180302', '0.74167824', '1600.0000', '12.6000', '1524732813', '1');
INSERT INTO `device_xiaofei_log` VALUES ('2', '8850001109968485', '535873', '20180305', '0.39956018', '1100.0000', '9.0500', '1524732813', '1');
INSERT INTO `device_xiaofei_log` VALUES ('3', '8850001109968485', '85828', '20180304', '0.86204861', '200.0000', '4.1000', '1524732813', '1');
INSERT INTO `device_xiaofei_log` VALUES ('4', '8850001109968485', '771089', '20180304', '0.76251157', '1300.0000', '10.1500', '1524732813', '1');
INSERT INTO `device_xiaofei_log` VALUES ('5', '8850001109968485', '933305', '20180304', '0.81327546', '800.0000', '7.4000', '1524732813', '1');
INSERT INTO `device_xiaofei_log` VALUES ('6', '8850001109968485', '66652', '20180304', '0.85586805', '200.0000', '4.1000', '1524732813', '1');
INSERT INTO `device_xiaofei_log` VALUES ('7', '8850001109968485', '471691', '20180304', '0.67730324', '900.0000', '7.9500', '1524732813', '1');
INSERT INTO `device_xiaofei_log` VALUES ('8', '8850001109968485', '726995', '20180303', '0.75043981', '2000.0000', '14.0000', '1524732813', '1');
INSERT INTO `device_xiaofei_log` VALUES ('9', '8850001106735009', '227653', '20180306', '0.50994212', '4253.0000', '28.5200', '1524732813', '1');
INSERT INTO `device_xiaofei_log` VALUES ('10', '8850001106735009', '298659', '20180320', '0.46403935', '628.0000', '6.7700', '1524732813', '1');
INSERT INTO `device_xiaofei_log` VALUES ('11', '8850001109968877', '550827', '20180306', '0.59415509', '2980.0000', '19.3900', '1524732813', '2');
INSERT INTO `device_xiaofei_log` VALUES ('12', '8850001109968877', '456510', '20180327', '0.64119212', '3000.0000', '19.5000', '1524732813', '2');
INSERT INTO `device_xiaofei_log` VALUES ('13', '8850001109968877', 'SK2KJ548834', '20180327', '0.40142361', '1400.0000', '10.7000', '1524732813', '2');
INSERT INTO `device_xiaofei_log` VALUES ('14', '8850001101007109', 'SK2KJ598527', '20180304', '0.72429398', '9986.0000', '57.9200', '1524732813', '2');
INSERT INTO `device_xiaofei_log` VALUES ('15', '8850001101007109', '794783', '20180302', '0.49028935', '1525.0000', '11.3900', '1524732813', '2');
INSERT INTO `device_xiaofei_log` VALUES ('16', '设备sn码', '交易流水号', '日期', '分钟', '0.0000', '0.0000', '1525837820', '2');
INSERT INTO `device_xiaofei_log` VALUES ('17', null, null, null, null, null, null, '1525837820', '0');
INSERT INTO `device_xiaofei_log` VALUES ('18', null, null, null, null, null, null, '1525837820', '0');
INSERT INTO `device_xiaofei_log` VALUES ('19', null, null, null, null, null, null, '1525837820', '0');
INSERT INTO `device_xiaofei_log` VALUES ('20', '8850001106735250', '741445', '20180301', null, '1599.0000', '11.6000', '1525837935', '1');
INSERT INTO `device_xiaofei_log` VALUES ('21', '8850001106735252', '741447', '20180303', null, '1601.0000', '13.6000', '1525837935', '1');
INSERT INTO `device_xiaofei_log` VALUES ('22', '8850001106735250', '741448', '20180304', null, '1602.0000', '14.6000', '1525837935', '1');
INSERT INTO `device_xiaofei_log` VALUES ('23', '8850001106735251', '741449', '20180305', null, '1603.0000', '15.6000', '1525837935', '1');
INSERT INTO `device_xiaofei_log` VALUES ('24', '8850001106735252', '741450', '20180306', null, '1604.0000', '16.6000', '1525837935', '1');
INSERT INTO `device_xiaofei_log` VALUES ('25', '8850001106735250', '741451', '20180307', null, '1605.0000', '17.6000', '1525837935', '1');
INSERT INTO `device_xiaofei_log` VALUES ('26', '8850001106735251', '741452', '20180308', null, '1606.0000', '18.6000', '1525837935', '1');
INSERT INTO `device_xiaofei_log` VALUES ('27', '8850001106735252', '741453', '20180309', null, '1607.0000', '19.6000', '1525837935', '1');
INSERT INTO `device_xiaofei_log` VALUES ('28', '8850001106735250', '741454', '20180310', null, '1608.0000', '20.6000', '1525837935', '1');
INSERT INTO `device_xiaofei_log` VALUES ('29', '8850001106735254', '123456', '20180509', null, '50000.0000', '100.0000', '1525837988', '1');
INSERT INTO `device_xiaofei_log` VALUES ('30', '8850001106735254', '123457', '20180509', null, '50001.0000', '101.0000', '1525837988', '1');
INSERT INTO `device_xiaofei_log` VALUES ('31', '8850001106735254', '123458', '20180509', null, '50002.0000', '102.0000', '1525837988', '1');
INSERT INTO `device_xiaofei_log` VALUES ('32', '8850001106735254', '123459', '20180509', null, '50003.0000', '103.0000', '1525837988', '1');
INSERT INTO `device_xiaofei_log` VALUES ('33', '8850001106735254', '123460', '20180509', null, '50004.0000', '104.0000', '1525837988', '1');
INSERT INTO `device_xiaofei_log` VALUES ('34', '8850001106735254', '123461', '20180509', null, '50005.0000', '105.0000', '1525837988', '1');
INSERT INTO `device_xiaofei_log` VALUES ('35', '8850001106735254', '123462', '20180509', null, '50006.0000', '106.0000', '1525837988', '1');
INSERT INTO `device_xiaofei_log` VALUES ('36', '8850001106735254', '123463', '20180509', null, '50007.0000', '107.0000', '1525837988', '1');
INSERT INTO `device_xiaofei_log` VALUES ('37', '8850001106735254', '123464', '20180509', null, '50008.0000', '108.0000', '1525837988', '1');
INSERT INTO `device_xiaofei_log` VALUES ('38', '8850001106735254', '123465', '20180509', null, '50009.0000', '109.0000', '1525837988', '1');
INSERT INTO `device_xiaofei_log` VALUES ('39', '8850001106735254', '123466', '20180509', null, '50010.0000', '110.0000', '1525837988', '1');
INSERT INTO `device_xiaofei_log` VALUES ('40', '8850001106735254', '123467', '20180509', null, '50011.0000', '111.0000', '1525837988', '1');
INSERT INTO `device_xiaofei_log` VALUES ('41', '8850001106735254', '123468', '20180509', null, '50012.0000', '112.0000', '1525837988', '1');
INSERT INTO `device_xiaofei_log` VALUES ('42', '8850001106735254', '123469', '20180509', null, '50013.0000', '113.0000', '1525837988', '1');
INSERT INTO `device_xiaofei_log` VALUES ('43', '8850001106735254', '123470', '20180509', null, '50014.0000', '114.0000', '1525837988', '1');
INSERT INTO `device_xiaofei_log` VALUES ('44', '8850001106735254', '123471', '20180509', null, '50015.0000', '115.0000', '1525837988', '1');
INSERT INTO `device_xiaofei_log` VALUES ('45', '8850001106735254', '123472', '20180509', null, '50016.0000', '116.0000', '1525837988', '1');
INSERT INTO `device_xiaofei_log` VALUES ('46', '8850001106735254', '123473', '20180509', null, '50017.0000', '117.0000', '1525837988', '1');
INSERT INTO `device_xiaofei_log` VALUES ('47', '8850001106735254', '123474', '20180509', null, '50018.0000', '118.0000', '1525837988', '1');
INSERT INTO `device_xiaofei_log` VALUES ('48', '8850001106735254', '123475', '20180509', null, '50019.0000', '119.0000', '1525837988', '1');
INSERT INTO `device_xiaofei_log` VALUES ('49', '8850001106735254', '123476', '20180509', null, '50020.0000', '120.0000', '1525837988', '1');
INSERT INTO `device_xiaofei_log` VALUES ('50', '8850001106735254', '123477', '20180509', null, '50021.0000', '121.0000', '1525837988', '1');
INSERT INTO `device_xiaofei_log` VALUES ('51', '8850001106735254', '123478', '20180509', null, '50022.0000', '122.0000', '1525837988', '1');
INSERT INTO `device_xiaofei_log` VALUES ('52', '8850001106735254', '123479', '20180509', null, '50023.0000', '123.0000', '1525837988', '1');
INSERT INTO `device_xiaofei_log` VALUES ('53', '8850001106735254', '123480', '20180509', null, '50024.0000', '124.0000', '1525837988', '1');
INSERT INTO `device_xiaofei_log` VALUES ('54', '8850001106735254', '123481', '20180509', null, '50025.0000', '125.0000', '1525837988', '1');
INSERT INTO `device_xiaofei_log` VALUES ('55', '8850001106735254', '123482', '20180509', null, '50026.0000', '126.0000', '1525837988', '1');
INSERT INTO `device_xiaofei_log` VALUES ('56', '8850001106735254', '123483', '20180509', null, '50027.0000', '127.0000', '1525837988', '1');
INSERT INTO `device_xiaofei_log` VALUES ('57', '8850001106735254', '123484', '20180509', null, '50028.0000', '128.0000', '1525837988', '1');
INSERT INTO `device_xiaofei_log` VALUES ('58', '8850001106735253', '741455', '20180311', null, '1609.0000', '21.6000', '1525838093', '1');
INSERT INTO `device_xiaofei_log` VALUES ('59', '88500011067352555', '741456', '20180312', null, '1610.0000', '22.6000', '1525838093', '2');
INSERT INTO `device_xiaofei_log` VALUES ('60', '88500011067352555', '741457', '20180313', null, '1611.0000', '23.6000', '1525838093', '2');
INSERT INTO `device_xiaofei_log` VALUES ('61', '88500011067352555', '741458', '20180314', null, '1612.0000', '24.6000', '1525838093', '2');
INSERT INTO `device_xiaofei_log` VALUES ('62', '88500011067352555', '741459', '20180315', null, '1613.0000', '25.6000', '1525838093', '2');
INSERT INTO `device_xiaofei_log` VALUES ('63', '88500011067352555', '741460', '20180316', null, '1614.0000', '26.6000', '1525838093', '2');
INSERT INTO `device_xiaofei_log` VALUES ('64', '88500011067352555', '741461', '20180317', null, '1615.0000', '27.6000', '1525838093', '2');
INSERT INTO `device_xiaofei_log` VALUES ('65', '88500011067352555', '741462', '20180318', null, '1616.0000', '28.6000', '1525838093', '2');
INSERT INTO `device_xiaofei_log` VALUES ('66', '88500011067352555', '741463', '20180319', null, '1617.0000', '29.6000', '1525838093', '2');
INSERT INTO `device_xiaofei_log` VALUES ('67', '8850001106735250', '7414451', '20180401', null, '1599.0000', '11.6000', '1525848069', '1');
INSERT INTO `device_xiaofei_log` VALUES ('68', '8850001106735251', '7414452', '20180402', null, '1600.0000', '12.6000', '1525848069', '1');
INSERT INTO `device_xiaofei_log` VALUES ('69', '8850001106735252', '7414453', '20180403', null, '1601.0000', '13.6000', '1525848069', '1');
INSERT INTO `device_xiaofei_log` VALUES ('70', '8850001106735250', '7414454', '20180404', null, '1602.0000', '14.6000', '1525848069', '1');
INSERT INTO `device_xiaofei_log` VALUES ('71', '8850001106735251', '7414455', '20180405', null, '1603.0000', '15.6000', '1525848069', '1');
INSERT INTO `device_xiaofei_log` VALUES ('72', '8850001106735252', '7414456', '20180406', null, '1604.0000', '16.6000', '1525848069', '1');
INSERT INTO `device_xiaofei_log` VALUES ('73', '8850001106735250', '7414457', '20180407', null, '1605.0000', '17.6000', '1525848069', '1');
INSERT INTO `device_xiaofei_log` VALUES ('74', '8850001106735251', '7414458', '20180408', null, '1606.0000', '18.6000', '1525848069', '1');
INSERT INTO `device_xiaofei_log` VALUES ('75', '8850001106735252', '7414459', '20180409', null, '1607.0000', '19.6000', '1525848069', '1');
INSERT INTO `device_xiaofei_log` VALUES ('76', '8850001106735253', '7414460', '20180410', null, '1608.0000', '20.6000', '1525848069', '1');
INSERT INTO `device_xiaofei_log` VALUES ('77', '8850001106735253', '7414461', '20180411', null, '1609.0000', '21.6000', '1525848069', '1');
INSERT INTO `device_xiaofei_log` VALUES ('78', '8850001106735250', '7414462', '20180412', null, '1610.0000', '22.6000', '1525848069', '1');
INSERT INTO `device_xiaofei_log` VALUES ('79', '8850001106735250', '7414463', '20180413', null, '1611.0000', '23.6000', '1525848069', '1');
INSERT INTO `device_xiaofei_log` VALUES ('80', '8850001106735250', '7414464', '20180414', null, '1612.0000', '24.6000', '1525848069', '1');
INSERT INTO `device_xiaofei_log` VALUES ('81', '8850001106735250', '7414465', '20180415', null, '1613.0000', '25.6000', '1525848069', '1');
INSERT INTO `device_xiaofei_log` VALUES ('82', '8850001106735250', '7414466', '20180416', null, '1614.0000', '26.6000', '1525848069', '1');
INSERT INTO `device_xiaofei_log` VALUES ('83', '8850001106735250', '7414467', '20180417', null, '1615.0000', '27.6000', '1525848069', '1');
INSERT INTO `device_xiaofei_log` VALUES ('84', '88500011067352555', '7414468', '20180418', null, '1616.0000', '28.6000', '1525848069', '2');
INSERT INTO `device_xiaofei_log` VALUES ('85', '88500011067352555', '7414469', '20180419', null, '1617.0000', '29.6000', '1525848069', '2');
INSERT INTO `device_xiaofei_log` VALUES ('86', '8850001106735252', '7414470', '20180406', null, '1604.0000', '16.6000', '1525848069', '1');
INSERT INTO `device_xiaofei_log` VALUES ('87', '8850001106735250', '7414471', '20180407', null, '1605.0000', '17.6000', '1525848069', '1');
INSERT INTO `device_xiaofei_log` VALUES ('88', '8850001106735251', '7414472', '20180408', null, '1606.0000', '18.6000', '1525848069', '1');
INSERT INTO `device_xiaofei_log` VALUES ('89', '8850001106735252', '7414473', '20180409', null, '1607.0000', '19.6000', '1525848069', '1');
INSERT INTO `device_xiaofei_log` VALUES ('90', '8850001106735253', '7414474', '20180410', null, '1608.0000', '20.6000', '1525848069', '1');
INSERT INTO `device_xiaofei_log` VALUES ('91', '8850001106735253', '7414475', '20180411', null, '1609.0000', '21.6000', '1525848069', '1');
INSERT INTO `device_xiaofei_log` VALUES ('92', '8850001106735250', '7414476', '20180412', null, '1610.0000', '22.6000', '1525848069', '1');
INSERT INTO `device_xiaofei_log` VALUES ('93', '8850001106735250', '7414477', '20180413', null, '1611.0000', '23.6000', '1525848069', '1');
INSERT INTO `device_xiaofei_log` VALUES ('94', '8850001106735250', '7414478', '20180414', null, '1612.0000', '24.6000', '1525848069', '1');
INSERT INTO `device_xiaofei_log` VALUES ('95', '8850001106735250', '7414479', '20180415', null, '1613.0000', '25.6000', '1525848069', '1');
INSERT INTO `device_xiaofei_log` VALUES ('96', '8850001106735250', '7414480', '20180416', null, '1614.0000', '26.6000', '1525848070', '1');
INSERT INTO `device_xiaofei_log` VALUES ('97', '8850001106735250', '7414481', '20180417', null, '1615.0000', '27.6000', '1525848070', '1');
INSERT INTO `device_xiaofei_log` VALUES ('98', '88500011067352555', '7414482', '20180418', null, '1616.0000', '28.6000', '1525848070', '2');
INSERT INTO `device_xiaofei_log` VALUES ('99', '88500011067352555', '7414483', '20180419', null, '1617.0000', '29.6000', '1525848070', '2');
INSERT INTO `device_xiaofei_log` VALUES ('100', '8850001106710000', '245564', '20180509', null, '50000.0000', '100.0000', '1525848237', '2');
INSERT INTO `device_xiaofei_log` VALUES ('101', '8850001106735254', '245565', '20180509', null, '50001.0000', '1000.0000', '1525848237', '1');
INSERT INTO `device_xiaofei_log` VALUES ('102', '8850001106735254', '245566', '20180509', null, '50002.0000', '2000.0000', '1525848237', '1');
INSERT INTO `device_xiaofei_log` VALUES ('103', '13300001', '153415', '20180401', null, '1599.0000', '2.0000', '1525860179', '1');
INSERT INTO `device_xiaofei_log` VALUES ('104', '13300001', '153416', '20180402', null, '1600.0000', '5.0000', '1525860179', '1');
INSERT INTO `device_xiaofei_log` VALUES ('105', '13300001', '153417', '20180401', null, '1599.0000', '2.0000', '1525860352', '1');
INSERT INTO `device_xiaofei_log` VALUES ('106', '13300001', '153418', '20180402', null, '1600.0000', '5.0000', '1525860352', '1');
INSERT INTO `device_xiaofei_log` VALUES ('107', '13300001', '153419', '20180402', null, '1800.0000', '10.5000', '1525860352', '1');
INSERT INTO `device_xiaofei_log` VALUES ('108', '13300001', '153420', '20180402', null, '1900.0000', '3.0000', '1525860352', '1');
INSERT INTO `device_xiaofei_log` VALUES ('109', '13300001', '153421', '20180403', null, '3000.0000', '3.0000', '1525860352', '1');
INSERT INTO `device_xiaofei_log` VALUES ('110', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('111', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('112', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('113', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('114', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('115', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('116', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('117', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('118', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('119', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('120', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('121', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('122', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('123', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('124', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('125', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('126', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('127', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('128', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('129', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('130', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('131', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('132', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('133', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('134', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('135', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('136', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('137', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('138', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('139', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('140', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('141', null, null, null, null, null, null, '1525920325', '0');
INSERT INTO `device_xiaofei_log` VALUES ('142', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('143', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('144', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('145', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('146', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('147', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('148', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('149', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('150', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('151', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('152', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('153', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('154', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('155', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('156', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('157', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('158', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('159', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('160', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('161', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('162', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('163', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('164', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('165', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('166', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('167', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('168', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('169', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('170', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('171', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('172', null, null, null, null, null, null, '1525920487', '0');
INSERT INTO `device_xiaofei_log` VALUES ('173', '13300003', '1534222', '20180403', null, '3000.0000', '3.0000', '1525920672', '1');
INSERT INTO `device_xiaofei_log` VALUES ('174', '13300003', '1534223', '20180404', null, '3001.0000', '4.0000', '1525920672', '1');
INSERT INTO `device_xiaofei_log` VALUES ('175', '13300003', '1534224', '20180405', null, '3002.0000', '5.0000', '1525920672', '1');
INSERT INTO `device_xiaofei_log` VALUES ('176', '13300003', '1534225', '20180406', null, '3003.0000', '6.0000', '1525920672', '1');
INSERT INTO `device_xiaofei_log` VALUES ('177', '13300003', '1534226', '20180407', null, '3004.0000', '7.0000', '1525920672', '1');
INSERT INTO `device_xiaofei_log` VALUES ('178', '13300003', '1534227', '20180408', null, '3005.0000', '5.5000', '1525920672', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mycz
-- ----------------------------
INSERT INTO `mycz` VALUES ('1', '27', '50.0000', '1524535584');

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
  `channel` tinyint(4) DEFAULT '0' COMMENT '来源 1注册 2邀请好友 3消费',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COMMENT='邀请返利记录';

-- ----------------------------
-- Records of myinvite
-- ----------------------------
INSERT INTO `myinvite` VALUES ('34', '1', null, '10', '1', '10.0000', '1', '1524807190', '0');
INSERT INTO `myinvite` VALUES ('35', '1', null, '11', '1', '10.0000', '1', '1524807196', '0');
INSERT INTO `myinvite` VALUES ('36', '1', null, '12', '1', '10.0000', '1', '1524807203', '0');
INSERT INTO `myinvite` VALUES ('37', '27', null, '12', '2', '10.2900', '1', '1524807215', '0');
INSERT INTO `myinvite` VALUES ('38', '27', null, '11', '2', '31.7500', '1', '1524807215', '0');
INSERT INTO `myinvite` VALUES ('39', '37', null, '14', '2', '60.0000', '1', '1525766700', '0');
INSERT INTO `myinvite` VALUES ('40', '40', '40', null, '1', '1.0000', '1', '1525767418', '0');
INSERT INTO `myinvite` VALUES ('41', '41', '41', null, '1', '1.0000', '1', '1525827237', '0');
INSERT INTO `myinvite` VALUES ('42', '34', null, '15', '2', '60.0000', '1', '1525832221', '0');
INSERT INTO `myinvite` VALUES ('43', '34', null, '16', '2', '60.0000', '1', '1525832248', '0');
INSERT INTO `myinvite` VALUES ('44', '34', null, '20', '2', '60.0000', '1', '1525832434', '0');
INSERT INTO `myinvite` VALUES ('45', '34', null, '21', '2', '60.0000', '1', '1525832455', '0');
INSERT INTO `myinvite` VALUES ('46', '42', null, '23', '2', '50.0000', '1', '1525837468', '0');
INSERT INTO `myinvite` VALUES ('47', '43', '43', null, '1', '1.0000', '1', '1525837470', '0');
INSERT INTO `myinvite` VALUES ('48', '43', '0', null, '2', '0.0000', '1', '1525837470', '0');
INSERT INTO `myinvite` VALUES ('49', '40', '43', null, '1', '2.0000', '1', '1525837470', '0');
INSERT INTO `myinvite` VALUES ('50', '27', null, '10', '2', '12.6000', '1', '1525837854', '0');
INSERT INTO `myinvite` VALUES ('51', '27', null, '10', '2', '64.4000', '1', '1525837944', '0');
INSERT INTO `myinvite` VALUES ('52', '34', null, '17', '2', '34.2000', '1', '1525837944', '0');
INSERT INTO `myinvite` VALUES ('53', '34', null, '18', '2', '49.8000', '1', '1525837944', '0');
INSERT INTO `myinvite` VALUES ('54', '42', null, '23', '2', '3306.0000', '1', '1525838003', '0');
INSERT INTO `myinvite` VALUES ('55', '34', null, '19', '2', '21.6000', '1', '1525838100', '0');
INSERT INTO `myinvite` VALUES ('56', '36', null, '24', '2', '50.0000', '1', '1525846786', '0');
INSERT INTO `myinvite` VALUES ('57', '36', null, '25', '2', '60.0000', '1', '1525847101', '0');
INSERT INTO `myinvite` VALUES ('58', '27', null, '10', '2', '362.6000', '1', '1525848090', '0');
INSERT INTO `myinvite` VALUES ('59', '34', null, '17', '2', '65.4000', '1', '1525848090', '0');
INSERT INTO `myinvite` VALUES ('60', '34', null, '18', '2', '86.0000', '1', '1525848090', '0');
INSERT INTO `myinvite` VALUES ('61', '34', null, '19', '2', '84.4000', '1', '1525848090', '0');
INSERT INTO `myinvite` VALUES ('62', '42', null, '23', '2', '3000.0000', '1', '1525848290', '0');
INSERT INTO `myinvite` VALUES ('63', '46', '46', null, '1', '5.0000', '0', '1525857825', '0');
INSERT INTO `myinvite` VALUES ('64', '46', '0', null, '2', '50.0000', '1', '1525857825', '0');
INSERT INTO `myinvite` VALUES ('65', '35', '46', null, '1', '3.0000', '0', '1525857825', '0');
INSERT INTO `myinvite` VALUES ('66', '51', '51', null, '1', '5.0000', '1', '1525859145', '0');
INSERT INTO `myinvite` VALUES ('67', '51', '0', null, '2', '50.0000', '1', '1525859145', '0');
INSERT INTO `myinvite` VALUES ('68', '46', '51', null, '1', '3.0000', '1', '1525859145', '0');
INSERT INTO `myinvite` VALUES ('69', '35', '51', null, '1', '2.0000', '1', '1525859145', '0');
INSERT INTO `myinvite` VALUES ('70', '53', '53', null, '1', '5.0000', '0', '1525865229', '0');
INSERT INTO `myinvite` VALUES ('71', '53', '0', null, '2', '50.0000', '1', '1525865229', '0');
INSERT INTO `myinvite` VALUES ('72', '39', '53', null, '1', '3.0000', '0', '1525865229', '0');
INSERT INTO `myinvite` VALUES ('73', '36', '53', null, '1', '2.0000', '0', '1525865230', '0');
INSERT INTO `myinvite` VALUES ('74', '54', '54', null, '1', '5.0000', '0', '1525868849', '0');
INSERT INTO `myinvite` VALUES ('75', '54', '0', null, '2', '50.0000', '1', '1525868849', '0');
INSERT INTO `myinvite` VALUES ('76', '39', '54', null, '1', '3.0000', '0', '1525868849', '0');
INSERT INTO `myinvite` VALUES ('77', '36', '54', null, '1', '2.0000', '0', '1525868849', '0');
INSERT INTO `myinvite` VALUES ('78', '55', '55', null, '1', '5.0000', '0', '1525918500', '1');
INSERT INTO `myinvite` VALUES ('79', '55', '0', null, '2', '50.0000', '1', '1525918500', '1');
INSERT INTO `myinvite` VALUES ('80', '34', '55', null, '1', '3.0000', '0', '1525918500', '2');
INSERT INTO `myinvite` VALUES ('81', '32', '55', null, '1', '2.0000', '0', '1525918500', '2');
INSERT INTO `myinvite` VALUES ('82', '56', '56', null, '1', '5.0000', '0', '1525918635', '1');
INSERT INTO `myinvite` VALUES ('83', '56', '0', null, '2', '50.0000', '1', '1525918635', '1');
INSERT INTO `myinvite` VALUES ('84', '55', '56', null, '1', '3.0000', '0', '1525918635', '2');
INSERT INTO `myinvite` VALUES ('85', '34', '56', null, '1', '2.0000', '0', '1525918635', '2');
INSERT INTO `myinvite` VALUES ('86', '57', '57', null, '1', '5.0000', '0', '1525918898', '1');
INSERT INTO `myinvite` VALUES ('87', '57', '0', null, '2', '50.0000', '1', '1525918898', '1');
INSERT INTO `myinvite` VALUES ('88', '56', '57', null, '1', '3.0000', '0', '1525918898', '2');
INSERT INTO `myinvite` VALUES ('89', '55', '57', null, '1', '2.0000', '0', '1525918898', '2');
INSERT INTO `myinvite` VALUES ('90', '58', '58', null, '1', '5.0000', '0', '1525918936', '1');
INSERT INTO `myinvite` VALUES ('91', '58', '0', null, '2', '50.0000', '1', '1525918936', '1');
INSERT INTO `myinvite` VALUES ('92', '57', '58', null, '1', '3.0000', '0', '1525918936', '2');
INSERT INTO `myinvite` VALUES ('93', '56', '58', null, '1', '2.0000', '0', '1525918936', '2');
INSERT INTO `myinvite` VALUES ('94', '59', '59', null, '1', '5.0000', '0', '1525918964', '1');
INSERT INTO `myinvite` VALUES ('95', '59', '0', null, '2', '50.0000', '1', '1525918964', '1');
INSERT INTO `myinvite` VALUES ('96', '58', '59', null, '1', '3.0000', '0', '1525918964', '2');
INSERT INTO `myinvite` VALUES ('97', '57', '59', null, '1', '2.0000', '0', '1525918964', '2');
INSERT INTO `myinvite` VALUES ('98', '60', '60', null, '1', '5.0000', '1', '1525918989', '1');
INSERT INTO `myinvite` VALUES ('99', '60', '0', null, '2', '50.0000', '1', '1525918989', '1');
INSERT INTO `myinvite` VALUES ('100', '59', '60', null, '1', '3.0000', '1', '1525918989', '2');
INSERT INTO `myinvite` VALUES ('101', '58', '60', null, '1', '2.0000', '1', '1525918989', '2');
INSERT INTO `myinvite` VALUES ('102', '39', null, '28', '2', '60.0000', '1', '1525934218', '0');
INSERT INTO `myinvite` VALUES ('103', '61', '61', null, '1', '5.0000', '0', '1525938776', '1');
INSERT INTO `myinvite` VALUES ('104', '61', '0', null, '2', '50.0000', '1', '1525938776', '1');
INSERT INTO `myinvite` VALUES ('105', '36', null, '29', '2', '60.0000', '1', '1525939402', '0');
INSERT INTO `myinvite` VALUES ('106', '36', null, '30', '2', '60.0000', '1', '1525939422', '0');
INSERT INTO `myinvite` VALUES ('107', '36', null, '31', '2', '60.0000', '1', '1525939496', '0');
INSERT INTO `myinvite` VALUES ('108', '62', '62', null, '1', '5.0000', '0', '1525944175', '1');
INSERT INTO `myinvite` VALUES ('109', '62', '0', null, '2', '50.0000', '1', '1525944175', '1');
INSERT INTO `myinvite` VALUES ('110', '36', null, '32', '2', '60.0000', '1', '1525946956', '0');
INSERT INTO `myinvite` VALUES ('111', '63', '63', null, '1', '5.0000', '0', '1526009701', '1');
INSERT INTO `myinvite` VALUES ('112', '63', '0', null, '2', '50.0000', '1', '1526009701', '1');
INSERT INTO `myinvite` VALUES ('113', '64', '64', null, '1', '20.0000', '0', '1526011097', '1');
INSERT INTO `myinvite` VALUES ('114', '64', '0', null, '2', '50.0000', '1', '1526011097', '1');
INSERT INTO `myinvite` VALUES ('115', '65', '65', null, '1', '20.0000', '0', '1526011102', '1');
INSERT INTO `myinvite` VALUES ('116', '65', '0', null, '2', '50.0000', '1', '1526011102', '1');
INSERT INTO `myinvite` VALUES ('117', '41', '65', null, '1', '10.0000', '0', '1526011102', '2');
INSERT INTO `myinvite` VALUES ('118', '66', '66', null, '1', '20.0000', '0', '1526011545', '1');
INSERT INTO `myinvite` VALUES ('119', '66', '0', null, '2', '50.0000', '1', '1526011545', '1');
INSERT INTO `myinvite` VALUES ('120', '65', '66', null, '1', '10.0000', '0', '1526011545', '2');
INSERT INTO `myinvite` VALUES ('121', '41', '66', null, '1', '5.0000', '0', '1526011545', '2');
INSERT INTO `myinvite` VALUES ('122', '67', '67', null, '1', '20.0000', '0', '1526094086', '1');
INSERT INTO `myinvite` VALUES ('123', '67', '0', null, '2', '50.0000', '1', '1526094086', '1');
INSERT INTO `myinvite` VALUES ('124', '68', '68', null, '1', '20.0000', '0', '1526110764', '1');
INSERT INTO `myinvite` VALUES ('125', '68', '0', null, '2', '50.0000', '1', '1526110764', '1');
INSERT INTO `myinvite` VALUES ('126', '41', '68', null, '1', '10.0000', '0', '1526110764', '2');
INSERT INTO `myinvite` VALUES ('127', '69', '69', null, '1', '20.0000', '0', '1526111478', '1');
INSERT INTO `myinvite` VALUES ('128', '69', '0', null, '2', '50.0000', '1', '1526111478', '1');
INSERT INTO `myinvite` VALUES ('129', '41', '69', null, '1', '10.0000', '0', '1526111478', '2');
INSERT INTO `myinvite` VALUES ('130', '70', '70', null, '1', '20.0000', '0', '1526111575', '1');
INSERT INTO `myinvite` VALUES ('131', '70', '0', null, '2', '50.0000', '1', '1526111575', '1');
INSERT INTO `myinvite` VALUES ('132', '68', '70', null, '1', '10.0000', '0', '1526111575', '2');
INSERT INTO `myinvite` VALUES ('133', '41', '70', null, '1', '5.0000', '0', '1526111575', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mytransfer
-- ----------------------------
INSERT INTO `mytransfer` VALUES ('1', '27', '27', '40.0000', '1524723571', 'dd', '158');
INSERT INTO `mytransfer` VALUES ('2', '27', '28', '40.0000', '1524723705', 'aadf', '159');
INSERT INTO `mytransfer` VALUES ('3', '34', '42', '0.5000', '1525849825', '张杰', '15839876473');
INSERT INTO `mytransfer` VALUES ('4', '35', '46', '1.0000', '1525860698', 'xiaomu', '17630240711');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myzc
-- ----------------------------
INSERT INTO `myzc` VALUES ('1', '27', 'LVLxXuzR7GtYaXAg7yBy4TvxXnSRDH6Ts8', null, '11.0000', '1524206735', '2', null);
INSERT INTO `myzc` VALUES ('2', '34', '3585EB83-9E51-BD35-3584-32e8efd5c247', null, '1.0000', '1525849112', '2', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myzr
-- ----------------------------
INSERT INTO `myzr` VALUES ('1', '27', '1', '1', '1.0000', null, '1');
INSERT INTO `myzr` VALUES ('2', '27', '1', '1', '2.0000', null, '1');
INSERT INTO `myzr` VALUES ('3', '27', '1', '1', '3.0000', null, '1');
INSERT INTO `myzr` VALUES ('4', '27', '11', '1', '4.0000', null, '1');
INSERT INTO `myzr` VALUES ('5', '27', '1', '1', '2.0000', null, '1');
INSERT INTO `myzr` VALUES ('6', '27', '1', '1', '1.0000', null, '0');
INSERT INTO `myzr` VALUES ('7', '27', '1', '1', '3.0000', null, '1');
INSERT INTO `myzr` VALUES ('8', '27', '1', '1', '34.0000', null, '1');
INSERT INTO `myzr` VALUES ('9', '27', '1', '1', '24.0000', null, '1');
INSERT INTO `myzr` VALUES ('10', '27', '1', '1', '25.0000', null, '1');
INSERT INTO `myzr` VALUES ('11', '27', '1', '1', '21.0000', null, '1');
INSERT INTO `myzr` VALUES ('12', '27', '1', '1', '20.0000', null, '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=2506 DEFAULT CHARSET=utf8 COMMENT='每天返利记录';

-- ----------------------------
-- Records of sys_fl_log
-- ----------------------------
INSERT INTO `sys_fl_log` VALUES ('1', '1', '190000', '100.00000000', '0.00001096', '1525570201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2', '2', '190000', '200.00000000', '0.00002193', '1525570201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('3', '3', '190000', '350.00000000', '0.00003838', '1525570201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('4', '4', '190000', '440.00000000', '0.00004825', '1525570201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('5', '25', '190000', '550.00000000', '0.00006031', '1525570201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('6', '26', '190000', '50.00000000', '0.00000548', '1525570201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('7', '27', '190000', '42.04000000', '0.00000461', '1525570201', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('8', '28', '190000', '30.00000000', '0.00000329', '1525570201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('9', '29', '190000', '21.00000000', '0.00000230', '1525570201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('10', '30', '190000', '88.00000000', '0.00000965', '1525570201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('11', '1', '190000', '100.00000000', '0.00001096', '1525572001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('12', '2', '190000', '200.00000000', '0.00002193', '1525572001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('13', '3', '190000', '350.00000000', '0.00003838', '1525572001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('14', '4', '190000', '440.00000000', '0.00004825', '1525572001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('15', '25', '190000', '550.00000000', '0.00006031', '1525572001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('16', '26', '190000', '50.00000000', '0.00000548', '1525572001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('17', '27', '190000', '42.04000000', '0.00000461', '1525572001', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('18', '28', '190000', '30.00000000', '0.00000329', '1525572001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('19', '29', '190000', '21.00000000', '0.00000230', '1525572001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('20', '30', '190000', '88.00000000', '0.00000965', '1525572001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('21', '1', '190000', '100.00000000', '0.00001096', '1525573801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('22', '2', '190000', '200.00000000', '0.00002193', '1525573801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('23', '3', '190000', '350.00000000', '0.00003838', '1525573801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('24', '4', '190000', '440.00000000', '0.00004825', '1525573801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('25', '25', '190000', '550.00000000', '0.00006031', '1525573801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('26', '26', '190000', '50.00000000', '0.00000548', '1525573801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('27', '27', '190000', '42.04000000', '0.00000461', '1525573801', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('28', '28', '190000', '30.00000000', '0.00000329', '1525573801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('29', '29', '190000', '21.00000000', '0.00000230', '1525573801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('30', '30', '190000', '88.00000000', '0.00000965', '1525573801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('31', '1', '190000', '100.00000000', '0.00001096', '1525575601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('32', '2', '190000', '200.00000000', '0.00002193', '1525575601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('33', '3', '190000', '350.00000000', '0.00003838', '1525575601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('34', '4', '190000', '440.00000000', '0.00004825', '1525575601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('35', '25', '190000', '550.00000000', '0.00006031', '1525575601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('36', '26', '190000', '50.00000000', '0.00000548', '1525575601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('37', '27', '190000', '42.04000000', '0.00000461', '1525575601', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('38', '28', '190000', '30.00000000', '0.00000329', '1525575601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('39', '29', '190000', '21.00000000', '0.00000230', '1525575601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('40', '30', '190000', '88.00000000', '0.00000965', '1525575601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('41', '1', '190000', '100.00000000', '0.00001096', '1525577402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('42', '2', '190000', '200.00000000', '0.00002193', '1525577402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('43', '3', '190000', '350.00000000', '0.00003838', '1525577402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('44', '4', '190000', '440.00000000', '0.00004825', '1525577402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('45', '25', '190000', '550.00000000', '0.00006031', '1525577402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('46', '26', '190000', '50.00000000', '0.00000548', '1525577402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('47', '27', '190000', '42.04000000', '0.00000461', '1525577402', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('48', '28', '190000', '30.00000000', '0.00000329', '1525577402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('49', '29', '190000', '21.00000000', '0.00000230', '1525577402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('50', '30', '190000', '88.00000000', '0.00000965', '1525577402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('51', '1', '190000', '100.00000000', '0.00001096', '1525579201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('52', '2', '190000', '200.00000000', '0.00002193', '1525579201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('53', '3', '190000', '350.00000000', '0.00003838', '1525579201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('54', '4', '190000', '440.00000000', '0.00004825', '1525579201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('55', '25', '190000', '550.00000000', '0.00006031', '1525579201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('56', '26', '190000', '50.00000000', '0.00000548', '1525579201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('57', '27', '190000', '42.04000000', '0.00000461', '1525579201', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('58', '28', '190000', '30.00000000', '0.00000329', '1525579201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('59', '29', '190000', '21.00000000', '0.00000230', '1525579201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('60', '30', '190000', '88.00000000', '0.00000965', '1525579201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('61', '1', '190000', '100.00000000', '0.00001096', '1525581001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('62', '2', '190000', '200.00000000', '0.00002193', '1525581001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('63', '3', '190000', '350.00000000', '0.00003838', '1525581001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('64', '4', '190000', '440.00000000', '0.00004825', '1525581001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('65', '25', '190000', '550.00000000', '0.00006031', '1525581001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('66', '26', '190000', '50.00000000', '0.00000548', '1525581001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('67', '27', '190000', '42.04000000', '0.00000461', '1525581001', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('68', '28', '190000', '30.00000000', '0.00000329', '1525581001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('69', '29', '190000', '21.00000000', '0.00000230', '1525581002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('70', '30', '190000', '88.00000000', '0.00000965', '1525581002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('71', '1', '190000', '100.00000000', '0.00001096', '1525582801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('72', '2', '190000', '200.00000000', '0.00002193', '1525582801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('73', '3', '190000', '350.00000000', '0.00003838', '1525582801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('74', '4', '190000', '440.00000000', '0.00004825', '1525582801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('75', '25', '190000', '550.00000000', '0.00006031', '1525582801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('76', '26', '190000', '50.00000000', '0.00000548', '1525582801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('77', '27', '190000', '42.04000000', '0.00000461', '1525582801', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('78', '28', '190000', '30.00000000', '0.00000329', '1525582801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('79', '29', '190000', '21.00000000', '0.00000230', '1525582801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('80', '30', '190000', '88.00000000', '0.00000965', '1525582801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('81', '1', '190000', '100.00000000', '0.00001096', '1525584601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('82', '2', '190000', '200.00000000', '0.00002193', '1525584601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('83', '3', '190000', '350.00000000', '0.00003838', '1525584601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('84', '4', '190000', '440.00000000', '0.00004825', '1525584601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('85', '25', '190000', '550.00000000', '0.00006031', '1525584601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('86', '26', '190000', '50.00000000', '0.00000548', '1525584601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('87', '27', '190000', '42.04000000', '0.00000461', '1525584601', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('88', '28', '190000', '30.00000000', '0.00000329', '1525584601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('89', '29', '190000', '21.00000000', '0.00000230', '1525584601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('90', '30', '190000', '88.00000000', '0.00000965', '1525584601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('91', '1', '190000', '100.00000000', '0.00001096', '1525586401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('92', '2', '190000', '200.00000000', '0.00002193', '1525586401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('93', '3', '190000', '350.00000000', '0.00003838', '1525586401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('94', '4', '190000', '440.00000000', '0.00004825', '1525586401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('95', '25', '190000', '550.00000000', '0.00006031', '1525586401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('96', '26', '190000', '50.00000000', '0.00000548', '1525586401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('97', '27', '190000', '42.04000000', '0.00000461', '1525586401', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('98', '28', '190000', '30.00000000', '0.00000329', '1525586401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('99', '29', '190000', '21.00000000', '0.00000230', '1525586401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('100', '30', '190000', '88.00000000', '0.00000965', '1525586401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('101', '1', '190000', '100.00000000', '0.00001096', '1525588201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('102', '2', '190000', '200.00000000', '0.00002193', '1525588201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('103', '3', '190000', '350.00000000', '0.00003838', '1525588201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('104', '4', '190000', '440.00000000', '0.00004825', '1525588201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('105', '25', '190000', '550.00000000', '0.00006031', '1525588201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('106', '26', '190000', '50.00000000', '0.00000548', '1525588201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('107', '27', '190000', '42.04000000', '0.00000461', '1525588201', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('108', '28', '190000', '30.00000000', '0.00000329', '1525588201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('109', '29', '190000', '21.00000000', '0.00000230', '1525588201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('110', '30', '190000', '88.00000000', '0.00000965', '1525588201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('111', '1', '190000', '100.00000000', '0.00001096', '1525590001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('112', '2', '190000', '200.00000000', '0.00002193', '1525590001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('113', '3', '190000', '350.00000000', '0.00003838', '1525590001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('114', '4', '190000', '440.00000000', '0.00004825', '1525590001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('115', '25', '190000', '550.00000000', '0.00006031', '1525590001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('116', '26', '190000', '50.00000000', '0.00000548', '1525590001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('117', '27', '190000', '42.04000000', '0.00000461', '1525590001', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('118', '28', '190000', '30.00000000', '0.00000329', '1525590001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('119', '29', '190000', '21.00000000', '0.00000230', '1525590001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('120', '30', '190000', '88.00000000', '0.00000965', '1525590001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('121', '1', '190000', '100.00000000', '0.00001096', '1525591802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('122', '2', '190000', '200.00000000', '0.00002193', '1525591802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('123', '3', '190000', '350.00000000', '0.00003838', '1525591802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('124', '4', '190000', '440.00000000', '0.00004825', '1525591802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('125', '25', '190000', '550.00000000', '0.00006031', '1525591802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('126', '26', '190000', '50.00000000', '0.00000548', '1525591802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('127', '27', '190000', '42.04000000', '0.00000461', '1525591802', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('128', '28', '190000', '30.00000000', '0.00000329', '1525591802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('129', '29', '190000', '21.00000000', '0.00000230', '1525591802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('130', '30', '190000', '88.00000000', '0.00000965', '1525591802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('131', '1', '190000', '100.00000000', '0.00001096', '1525593601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('132', '2', '190000', '200.00000000', '0.00002193', '1525593601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('133', '3', '190000', '350.00000000', '0.00003838', '1525593601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('134', '4', '190000', '440.00000000', '0.00004825', '1525593601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('135', '25', '190000', '550.00000000', '0.00006031', '1525593601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('136', '26', '190000', '50.00000000', '0.00000548', '1525593601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('137', '27', '190000', '42.04000000', '0.00000461', '1525593601', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('138', '28', '190000', '30.00000000', '0.00000329', '1525593601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('139', '29', '190000', '21.00000000', '0.00000230', '1525593601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('140', '30', '190000', '88.00000000', '0.00000965', '1525593601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('141', '1', '190000', '100.00000000', '0.00001096', '1525595401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('142', '2', '190000', '200.00000000', '0.00002193', '1525595401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('143', '3', '190000', '350.00000000', '0.00003838', '1525595401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('144', '4', '190000', '440.00000000', '0.00004825', '1525595401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('145', '25', '190000', '550.00000000', '0.00006031', '1525595401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('146', '26', '190000', '50.00000000', '0.00000548', '1525595401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('147', '27', '190000', '42.04000000', '0.00000461', '1525595401', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('148', '28', '190000', '30.00000000', '0.00000329', '1525595401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('149', '29', '190000', '21.00000000', '0.00000230', '1525595401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('150', '30', '190000', '88.00000000', '0.00000965', '1525595401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('151', '1', '190000', '100.00000000', '0.00001096', '1525597201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('152', '2', '190000', '200.00000000', '0.00002193', '1525597201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('153', '3', '190000', '350.00000000', '0.00003838', '1525597201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('154', '4', '190000', '440.00000000', '0.00004825', '1525597201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('155', '25', '190000', '550.00000000', '0.00006031', '1525597201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('156', '26', '190000', '50.00000000', '0.00000548', '1525597201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('157', '27', '190000', '42.04000000', '0.00000461', '1525597201', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('158', '28', '190000', '30.00000000', '0.00000329', '1525597201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('159', '29', '190000', '21.00000000', '0.00000230', '1525597201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('160', '30', '190000', '88.00000000', '0.00000965', '1525597201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('161', '1', '190000', '100.00000000', '0.00001096', '1525599001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('162', '2', '190000', '200.00000000', '0.00002193', '1525599001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('163', '3', '190000', '350.00000000', '0.00003838', '1525599001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('164', '4', '190000', '440.00000000', '0.00004825', '1525599001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('165', '25', '190000', '550.00000000', '0.00006031', '1525599001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('166', '26', '190000', '50.00000000', '0.00000548', '1525599001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('167', '27', '190000', '42.04000000', '0.00000461', '1525599001', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('168', '28', '190000', '30.00000000', '0.00000329', '1525599001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('169', '29', '190000', '21.00000000', '0.00000230', '1525599001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('170', '30', '190000', '88.00000000', '0.00000965', '1525599001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('171', '1', '190000', '100.00000000', '0.00001096', '1525600801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('172', '2', '190000', '200.00000000', '0.00002193', '1525600801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('173', '3', '190000', '350.00000000', '0.00003838', '1525600801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('174', '4', '190000', '440.00000000', '0.00004825', '1525600801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('175', '25', '190000', '550.00000000', '0.00006031', '1525600801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('176', '26', '190000', '50.00000000', '0.00000548', '1525600801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('177', '27', '190000', '42.04000000', '0.00000461', '1525600801', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('178', '28', '190000', '30.00000000', '0.00000329', '1525600801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('179', '29', '190000', '21.00000000', '0.00000230', '1525600801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('180', '30', '190000', '88.00000000', '0.00000965', '1525600801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('181', '1', '190000', '100.00000000', '0.00001096', '1525602601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('182', '2', '190000', '200.00000000', '0.00002193', '1525602601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('183', '3', '190000', '350.00000000', '0.00003838', '1525602601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('184', '4', '190000', '440.00000000', '0.00004825', '1525602601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('185', '25', '190000', '550.00000000', '0.00006031', '1525602601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('186', '26', '190000', '50.00000000', '0.00000548', '1525602601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('187', '27', '190000', '42.04000000', '0.00000461', '1525602601', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('188', '28', '190000', '30.00000000', '0.00000329', '1525602601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('189', '29', '190000', '21.00000000', '0.00000230', '1525602601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('190', '30', '190000', '88.00000000', '0.00000965', '1525602601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('191', '1', '190000', '100.00000000', '0.00001096', '1525604402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('192', '2', '190000', '200.00000000', '0.00002193', '1525604402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('193', '3', '190000', '350.00000000', '0.00003838', '1525604402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('194', '4', '190000', '440.00000000', '0.00004825', '1525604402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('195', '25', '190000', '550.00000000', '0.00006031', '1525604402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('196', '26', '190000', '50.00000000', '0.00000548', '1525604402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('197', '27', '190000', '42.04000000', '0.00000461', '1525604402', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('198', '28', '190000', '30.00000000', '0.00000329', '1525604402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('199', '29', '190000', '21.00000000', '0.00000230', '1525604402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('200', '30', '190000', '88.00000000', '0.00000965', '1525604402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('201', '1', '190000', '100.00000000', '0.00001096', '1525606201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('202', '2', '190000', '200.00000000', '0.00002193', '1525606201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('203', '3', '190000', '350.00000000', '0.00003838', '1525606201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('204', '4', '190000', '440.00000000', '0.00004825', '1525606201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('205', '25', '190000', '550.00000000', '0.00006031', '1525606201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('206', '26', '190000', '50.00000000', '0.00000548', '1525606201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('207', '27', '190000', '42.04000000', '0.00000461', '1525606201', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('208', '28', '190000', '30.00000000', '0.00000329', '1525606201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('209', '29', '190000', '21.00000000', '0.00000230', '1525606201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('210', '30', '190000', '88.00000000', '0.00000965', '1525606201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('211', '1', '190000', '100.00000000', '0.00001096', '1525608001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('212', '2', '190000', '200.00000000', '0.00002193', '1525608001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('213', '3', '190000', '350.00000000', '0.00003838', '1525608001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('214', '4', '190000', '440.00000000', '0.00004825', '1525608001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('215', '25', '190000', '550.00000000', '0.00006031', '1525608001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('216', '26', '190000', '50.00000000', '0.00000548', '1525608001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('217', '27', '190000', '42.04000000', '0.00000461', '1525608001', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('218', '28', '190000', '30.00000000', '0.00000329', '1525608001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('219', '29', '190000', '21.00000000', '0.00000230', '1525608001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('220', '30', '190000', '88.00000000', '0.00000965', '1525608001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('221', '1', '190000', '100.00000000', '0.00001096', '1525609801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('222', '2', '190000', '200.00000000', '0.00002193', '1525609801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('223', '3', '190000', '350.00000000', '0.00003838', '1525609801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('224', '4', '190000', '440.00000000', '0.00004825', '1525609801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('225', '25', '190000', '550.00000000', '0.00006031', '1525609801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('226', '26', '190000', '50.00000000', '0.00000548', '1525609801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('227', '27', '190000', '42.04000000', '0.00000461', '1525609801', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('228', '28', '190000', '30.00000000', '0.00000329', '1525609801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('229', '29', '190000', '21.00000000', '0.00000230', '1525609801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('230', '30', '190000', '88.00000000', '0.00000965', '1525609801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('231', '1', '190000', '100.00000000', '0.00001096', '1525611602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('232', '2', '190000', '200.00000000', '0.00002193', '1525611602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('233', '3', '190000', '350.00000000', '0.00003838', '1525611602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('234', '4', '190000', '440.00000000', '0.00004825', '1525611602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('235', '25', '190000', '550.00000000', '0.00006031', '1525611602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('236', '26', '190000', '50.00000000', '0.00000548', '1525611602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('237', '27', '190000', '42.04000000', '0.00000461', '1525611602', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('238', '28', '190000', '30.00000000', '0.00000329', '1525611602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('239', '29', '190000', '21.00000000', '0.00000230', '1525611602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('240', '30', '190000', '88.00000000', '0.00000965', '1525611602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('241', '1', '190000', '100.00000000', '0.00001096', '1525613401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('242', '2', '190000', '200.00000000', '0.00002193', '1525613401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('243', '3', '190000', '350.00000000', '0.00003838', '1525613401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('244', '4', '190000', '440.00000000', '0.00004825', '1525613401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('245', '25', '190000', '550.00000000', '0.00006031', '1525613401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('246', '26', '190000', '50.00000000', '0.00000548', '1525613401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('247', '27', '190000', '42.04000000', '0.00000461', '1525613401', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('248', '28', '190000', '30.00000000', '0.00000329', '1525613401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('249', '29', '190000', '21.00000000', '0.00000230', '1525613401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('250', '30', '190000', '88.00000000', '0.00000965', '1525613401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('251', '1', '190000', '100.00000000', '0.00001096', '1525615201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('252', '2', '190000', '200.00000000', '0.00002193', '1525615201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('253', '3', '190000', '350.00000000', '0.00003838', '1525615201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('254', '4', '190000', '440.00000000', '0.00004825', '1525615201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('255', '25', '190000', '550.00000000', '0.00006031', '1525615201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('256', '26', '190000', '50.00000000', '0.00000548', '1525615201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('257', '27', '190000', '42.04000000', '0.00000461', '1525615201', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('258', '28', '190000', '30.00000000', '0.00000329', '1525615201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('259', '29', '190000', '21.00000000', '0.00000230', '1525615201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('260', '30', '190000', '88.00000000', '0.00000965', '1525615201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('261', '1', '190000', '100.00000000', '0.00001096', '1525617001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('262', '2', '190000', '200.00000000', '0.00002193', '1525617001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('263', '3', '190000', '350.00000000', '0.00003838', '1525617001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('264', '4', '190000', '440.00000000', '0.00004825', '1525617001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('265', '25', '190000', '550.00000000', '0.00006031', '1525617001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('266', '26', '190000', '50.00000000', '0.00000548', '1525617001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('267', '27', '190000', '42.04000000', '0.00000461', '1525617001', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('268', '28', '190000', '30.00000000', '0.00000329', '1525617001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('269', '29', '190000', '21.00000000', '0.00000230', '1525617001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('270', '30', '190000', '88.00000000', '0.00000965', '1525617001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('271', '1', '190000', '100.00000000', '0.00001096', '1525618801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('272', '2', '190000', '200.00000000', '0.00002193', '1525618801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('273', '3', '190000', '350.00000000', '0.00003838', '1525618801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('274', '4', '190000', '440.00000000', '0.00004825', '1525618801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('275', '25', '190000', '550.00000000', '0.00006031', '1525618801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('276', '26', '190000', '50.00000000', '0.00000548', '1525618801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('277', '27', '190000', '42.04000000', '0.00000461', '1525618801', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('278', '28', '190000', '30.00000000', '0.00000329', '1525618801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('279', '29', '190000', '21.00000000', '0.00000230', '1525618801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('280', '30', '190000', '88.00000000', '0.00000965', '1525618801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('281', '1', '190000', '100.00000000', '0.00001096', '1525620601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('282', '2', '190000', '200.00000000', '0.00002193', '1525620601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('283', '3', '190000', '350.00000000', '0.00003838', '1525620601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('284', '4', '190000', '440.00000000', '0.00004825', '1525620601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('285', '25', '190000', '550.00000000', '0.00006031', '1525620601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('286', '26', '190000', '50.00000000', '0.00000548', '1525620601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('287', '27', '190000', '42.04000000', '0.00000461', '1525620601', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('288', '28', '190000', '30.00000000', '0.00000329', '1525620601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('289', '29', '190000', '21.00000000', '0.00000230', '1525620601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('290', '30', '190000', '88.00000000', '0.00000965', '1525620601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('291', '1', '190000', '100.00000000', '0.00001096', '1525622401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('292', '2', '190000', '200.00000000', '0.00002193', '1525622401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('293', '3', '190000', '350.00000000', '0.00003838', '1525622401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('294', '4', '190000', '440.00000000', '0.00004825', '1525622401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('295', '25', '190000', '550.00000000', '0.00006031', '1525622401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('296', '26', '190000', '50.00000000', '0.00000548', '1525622401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('297', '27', '190000', '42.04000000', '0.00000461', '1525622401', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('298', '28', '190000', '30.00000000', '0.00000329', '1525622401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('299', '29', '190000', '21.00000000', '0.00000230', '1525622401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('300', '30', '190000', '88.00000000', '0.00000965', '1525622401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('301', '1', '190000', '100.00000000', '0.00001096', '1525624201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('302', '2', '190000', '200.00000000', '0.00002193', '1525624201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('303', '3', '190000', '350.00000000', '0.00003838', '1525624201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('304', '4', '190000', '440.00000000', '0.00004825', '1525624201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('305', '25', '190000', '550.00000000', '0.00006031', '1525624201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('306', '26', '190000', '50.00000000', '0.00000548', '1525624201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('307', '27', '190000', '42.04000000', '0.00000461', '1525624201', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('308', '28', '190000', '30.00000000', '0.00000329', '1525624201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('309', '29', '190000', '21.00000000', '0.00000230', '1525624201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('310', '30', '190000', '88.00000000', '0.00000965', '1525624201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('311', '1', '190000', '100.00000000', '0.00001096', '1525626002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('312', '2', '190000', '200.00000000', '0.00002193', '1525626002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('313', '3', '190000', '350.00000000', '0.00003838', '1525626002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('314', '4', '190000', '440.00000000', '0.00004825', '1525626002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('315', '25', '190000', '550.00000000', '0.00006031', '1525626002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('316', '26', '190000', '50.00000000', '0.00000548', '1525626002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('317', '27', '190000', '42.04000000', '0.00000461', '1525626002', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('318', '28', '190000', '30.00000000', '0.00000329', '1525626002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('319', '29', '190000', '21.00000000', '0.00000230', '1525626002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('320', '30', '190000', '88.00000000', '0.00000965', '1525626002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('321', '1', '190000', '100.00000000', '0.00001096', '1525627801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('322', '2', '190000', '200.00000000', '0.00002193', '1525627801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('323', '3', '190000', '350.00000000', '0.00003838', '1525627801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('324', '4', '190000', '440.00000000', '0.00004825', '1525627801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('325', '25', '190000', '550.00000000', '0.00006031', '1525627801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('326', '26', '190000', '50.00000000', '0.00000548', '1525627801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('327', '27', '190000', '42.04000000', '0.00000461', '1525627801', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('328', '28', '190000', '30.00000000', '0.00000329', '1525627801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('329', '29', '190000', '21.00000000', '0.00000230', '1525627801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('330', '30', '190000', '88.00000000', '0.00000965', '1525627801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('331', '1', '190000', '100.00000000', '0.00001096', '1525629601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('332', '2', '190000', '200.00000000', '0.00002193', '1525629601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('333', '3', '190000', '350.00000000', '0.00003838', '1525629601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('334', '4', '190000', '440.00000000', '0.00004825', '1525629601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('335', '25', '190000', '550.00000000', '0.00006031', '1525629601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('336', '26', '190000', '50.00000000', '0.00000548', '1525629601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('337', '27', '190000', '42.04000000', '0.00000461', '1525629601', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('338', '28', '190000', '30.00000000', '0.00000329', '1525629601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('339', '29', '190000', '21.00000000', '0.00000230', '1525629601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('340', '30', '190000', '88.00000000', '0.00000965', '1525629601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('341', '1', '190000', '100.00000000', '0.00001096', '1525631402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('342', '2', '190000', '200.00000000', '0.00002193', '1525631402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('343', '3', '190000', '350.00000000', '0.00003838', '1525631402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('344', '4', '190000', '440.00000000', '0.00004825', '1525631402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('345', '25', '190000', '550.00000000', '0.00006031', '1525631402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('346', '26', '190000', '50.00000000', '0.00000548', '1525631402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('347', '27', '190000', '42.04000000', '0.00000461', '1525631402', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('348', '28', '190000', '30.00000000', '0.00000329', '1525631402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('349', '29', '190000', '21.00000000', '0.00000230', '1525631402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('350', '30', '190000', '88.00000000', '0.00000965', '1525631402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('351', '1', '190000', '100.00000000', '0.00001096', '1525633202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('352', '2', '190000', '200.00000000', '0.00002193', '1525633202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('353', '3', '190000', '350.00000000', '0.00003838', '1525633202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('354', '4', '190000', '440.00000000', '0.00004825', '1525633202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('355', '25', '190000', '550.00000000', '0.00006031', '1525633202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('356', '26', '190000', '50.00000000', '0.00000548', '1525633202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('357', '27', '190000', '42.04000000', '0.00000461', '1525633202', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('358', '28', '190000', '30.00000000', '0.00000329', '1525633202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('359', '29', '190000', '21.00000000', '0.00000230', '1525633202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('360', '30', '190000', '88.00000000', '0.00000965', '1525633202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('361', '1', '190000', '100.00000000', '0.00001096', '1525635001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('362', '2', '190000', '200.00000000', '0.00002193', '1525635001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('363', '3', '190000', '350.00000000', '0.00003838', '1525635001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('364', '4', '190000', '440.00000000', '0.00004825', '1525635001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('365', '25', '190000', '550.00000000', '0.00006031', '1525635001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('366', '26', '190000', '50.00000000', '0.00000548', '1525635001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('367', '27', '190000', '42.04000000', '0.00000461', '1525635001', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('368', '28', '190000', '30.00000000', '0.00000329', '1525635001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('369', '29', '190000', '21.00000000', '0.00000230', '1525635001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('370', '30', '190000', '88.00000000', '0.00000965', '1525635001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('371', '1', '190000', '100.00000000', '0.00001096', '1525636801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('372', '2', '190000', '200.00000000', '0.00002193', '1525636801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('373', '3', '190000', '350.00000000', '0.00003838', '1525636801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('374', '4', '190000', '440.00000000', '0.00004825', '1525636801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('375', '25', '190000', '550.00000000', '0.00006031', '1525636801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('376', '26', '190000', '50.00000000', '0.00000548', '1525636801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('377', '27', '190000', '42.04000000', '0.00000461', '1525636801', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('378', '28', '190000', '30.00000000', '0.00000329', '1525636801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('379', '29', '190000', '21.00000000', '0.00000230', '1525636801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('380', '30', '190000', '88.00000000', '0.00000965', '1525636801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('381', '1', '190000', '100.00000000', '0.00001096', '1525638601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('382', '2', '190000', '200.00000000', '0.00002193', '1525638601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('383', '3', '190000', '350.00000000', '0.00003838', '1525638601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('384', '4', '190000', '440.00000000', '0.00004825', '1525638601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('385', '25', '190000', '550.00000000', '0.00006031', '1525638601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('386', '26', '190000', '50.00000000', '0.00000548', '1525638601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('387', '27', '190000', '42.04000000', '0.00000461', '1525638601', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('388', '28', '190000', '30.00000000', '0.00000329', '1525638601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('389', '29', '190000', '21.00000000', '0.00000230', '1525638601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('390', '30', '190000', '88.00000000', '0.00000965', '1525638601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('391', '1', '190000', '100.00000000', '0.00001096', '1525640401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('392', '2', '190000', '200.00000000', '0.00002193', '1525640401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('393', '3', '190000', '350.00000000', '0.00003838', '1525640401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('394', '4', '190000', '440.00000000', '0.00004825', '1525640401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('395', '25', '190000', '550.00000000', '0.00006031', '1525640401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('396', '26', '190000', '50.00000000', '0.00000548', '1525640401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('397', '27', '190000', '42.04000000', '0.00000461', '1525640401', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('398', '28', '190000', '30.00000000', '0.00000329', '1525640401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('399', '29', '190000', '21.00000000', '0.00000230', '1525640401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('400', '30', '190000', '88.00000000', '0.00000965', '1525640401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('401', '1', '190000', '100.00000000', '0.00001096', '1525642201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('402', '2', '190000', '200.00000000', '0.00002193', '1525642201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('403', '3', '190000', '350.00000000', '0.00003838', '1525642201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('404', '4', '190000', '440.00000000', '0.00004825', '1525642201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('405', '25', '190000', '550.00000000', '0.00006031', '1525642201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('406', '26', '190000', '50.00000000', '0.00000548', '1525642201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('407', '27', '190000', '42.04000000', '0.00000461', '1525642201', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('408', '28', '190000', '30.00000000', '0.00000329', '1525642201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('409', '29', '190000', '21.00000000', '0.00000230', '1525642201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('410', '30', '190000', '88.00000000', '0.00000965', '1525642201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('411', '1', '190000', '100.00000000', '0.00001096', '1525644002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('412', '2', '190000', '200.00000000', '0.00002193', '1525644002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('413', '3', '190000', '350.00000000', '0.00003838', '1525644002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('414', '4', '190000', '440.00000000', '0.00004825', '1525644002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('415', '25', '190000', '550.00000000', '0.00006031', '1525644002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('416', '26', '190000', '50.00000000', '0.00000548', '1525644002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('417', '27', '190000', '42.04000000', '0.00000461', '1525644002', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('418', '28', '190000', '30.00000000', '0.00000329', '1525644002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('419', '29', '190000', '21.00000000', '0.00000230', '1525644002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('420', '30', '190000', '88.00000000', '0.00000965', '1525644002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('421', '1', '190000', '100.00000000', '0.00001096', '1525645801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('422', '2', '190000', '200.00000000', '0.00002193', '1525645801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('423', '3', '190000', '350.00000000', '0.00003838', '1525645801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('424', '4', '190000', '440.00000000', '0.00004825', '1525645801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('425', '25', '190000', '550.00000000', '0.00006031', '1525645801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('426', '26', '190000', '50.00000000', '0.00000548', '1525645801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('427', '27', '190000', '42.04000000', '0.00000461', '1525645801', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('428', '28', '190000', '30.00000000', '0.00000329', '1525645801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('429', '29', '190000', '21.00000000', '0.00000230', '1525645801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('430', '30', '190000', '88.00000000', '0.00000965', '1525645801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('431', '1', '190000', '100.00000000', '0.00001096', '1525647601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('432', '2', '190000', '200.00000000', '0.00002193', '1525647601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('433', '3', '190000', '350.00000000', '0.00003838', '1525647601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('434', '4', '190000', '440.00000000', '0.00004825', '1525647601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('435', '25', '190000', '550.00000000', '0.00006031', '1525647601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('436', '26', '190000', '50.00000000', '0.00000548', '1525647601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('437', '27', '190000', '42.04000000', '0.00000461', '1525647601', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('438', '28', '190000', '30.00000000', '0.00000329', '1525647601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('439', '29', '190000', '21.00000000', '0.00000230', '1525647601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('440', '30', '190000', '88.00000000', '0.00000965', '1525647601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('441', '1', '190000', '100.00000000', '0.00001096', '1525649401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('442', '2', '190000', '200.00000000', '0.00002193', '1525649401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('443', '3', '190000', '350.00000000', '0.00003838', '1525649401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('444', '4', '190000', '440.00000000', '0.00004825', '1525649401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('445', '25', '190000', '550.00000000', '0.00006031', '1525649401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('446', '26', '190000', '50.00000000', '0.00000548', '1525649401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('447', '27', '190000', '42.04000000', '0.00000461', '1525649401', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('448', '28', '190000', '30.00000000', '0.00000329', '1525649401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('449', '29', '190000', '21.00000000', '0.00000230', '1525649401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('450', '30', '190000', '88.00000000', '0.00000965', '1525649401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('451', '1', '190000', '100.00000000', '0.00001096', '1525651201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('452', '2', '190000', '200.00000000', '0.00002193', '1525651201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('453', '3', '190000', '350.00000000', '0.00003838', '1525651201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('454', '4', '190000', '440.00000000', '0.00004825', '1525651201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('455', '25', '190000', '550.00000000', '0.00006031', '1525651201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('456', '26', '190000', '50.00000000', '0.00000548', '1525651201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('457', '27', '190000', '42.04000000', '0.00000461', '1525651201', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('458', '28', '190000', '30.00000000', '0.00000329', '1525651201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('459', '29', '190000', '21.00000000', '0.00000230', '1525651201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('460', '30', '190000', '88.00000000', '0.00000965', '1525651201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('461', '1', '190000', '100.00000000', '0.00001096', '1525653001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('462', '2', '190000', '200.00000000', '0.00002193', '1525653001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('463', '3', '190000', '350.00000000', '0.00003838', '1525653001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('464', '4', '190000', '440.00000000', '0.00004825', '1525653001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('465', '25', '190000', '550.00000000', '0.00006031', '1525653001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('466', '26', '190000', '50.00000000', '0.00000548', '1525653001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('467', '27', '190000', '42.04000000', '0.00000461', '1525653001', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('468', '28', '190000', '30.00000000', '0.00000329', '1525653001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('469', '29', '190000', '21.00000000', '0.00000230', '1525653001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('470', '30', '190000', '88.00000000', '0.00000965', '1525653001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('471', '1', '190000', '100.00000000', '0.00001096', '1525654801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('472', '2', '190000', '200.00000000', '0.00002193', '1525654801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('473', '3', '190000', '350.00000000', '0.00003838', '1525654801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('474', '4', '190000', '440.00000000', '0.00004825', '1525654801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('475', '25', '190000', '550.00000000', '0.00006031', '1525654801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('476', '26', '190000', '50.00000000', '0.00000548', '1525654801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('477', '27', '190000', '42.04000000', '0.00000461', '1525654801', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('478', '28', '190000', '30.00000000', '0.00000329', '1525654801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('479', '29', '190000', '21.00000000', '0.00000230', '1525654801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('480', '30', '190000', '88.00000000', '0.00000965', '1525654801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('481', '1', '190000', '100.00000000', '0.00006579', '1525665601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('482', '2', '190000', '200.00000000', '0.00013158', '1525665601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('483', '3', '190000', '350.00000000', '0.00023026', '1525665601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('484', '4', '190000', '440.00000000', '0.00028947', '1525665601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('485', '25', '190000', '550.00000000', '0.00036184', '1525665601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('486', '26', '190000', '50.00000000', '0.00003289', '1525665601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('487', '27', '190000', '42.04000000', '0.00002766', '1525665601', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('488', '28', '190000', '30.00000000', '0.00001974', '1525665601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('489', '29', '190000', '21.00000000', '0.00001382', '1525665601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('490', '30', '190000', '88.00000000', '0.00005789', '1525665601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('491', '1', '190000', '100.00000000', '0.00006579', '1525676401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('492', '2', '190000', '200.00000000', '0.00013158', '1525676401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('493', '3', '190000', '350.00000000', '0.00023026', '1525676401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('494', '4', '190000', '440.00000000', '0.00028947', '1525676401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('495', '25', '190000', '550.00000000', '0.00036184', '1525676401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('496', '26', '190000', '50.00000000', '0.00003289', '1525676401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('497', '27', '190000', '42.04000000', '0.00002766', '1525676401', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('498', '28', '190000', '30.00000000', '0.00001974', '1525676401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('499', '29', '190000', '21.00000000', '0.00001382', '1525676401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('500', '30', '190000', '88.00000000', '0.00005789', '1525676401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('501', '1', '190000', '100.00000000', '0.00006579', '1525687201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('502', '2', '190000', '200.00000000', '0.00013158', '1525687201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('503', '3', '190000', '350.00000000', '0.00023026', '1525687201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('504', '4', '190000', '440.00000000', '0.00028947', '1525687201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('505', '25', '190000', '550.00000000', '0.00036184', '1525687201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('506', '26', '190000', '50.00000000', '0.00003289', '1525687201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('507', '27', '190000', '42.04000000', '0.00002766', '1525687201', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('508', '28', '190000', '30.00000000', '0.00001974', '1525687201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('509', '29', '190000', '21.00000000', '0.00001382', '1525687201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('510', '30', '190000', '88.00000000', '0.00005789', '1525687201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('511', '1', '190000', '100.00000000', '0.00006579', '1525698002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('512', '2', '190000', '200.00000000', '0.00013158', '1525698002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('513', '3', '190000', '350.00000000', '0.00023026', '1525698002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('514', '4', '190000', '440.00000000', '0.00028947', '1525698002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('515', '25', '190000', '550.00000000', '0.00036184', '1525698002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('516', '26', '190000', '50.00000000', '0.00003289', '1525698002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('517', '27', '190000', '42.04000000', '0.00002766', '1525698002', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('518', '28', '190000', '30.00000000', '0.00001974', '1525698002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('519', '29', '190000', '21.00000000', '0.00001382', '1525698002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('520', '30', '190000', '88.00000000', '0.00005789', '1525698002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('521', '1', '190000', '100.00000000', '0.00006579', '1525708801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('522', '2', '190000', '200.00000000', '0.00013158', '1525708801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('523', '3', '190000', '350.00000000', '0.00023026', '1525708801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('524', '4', '190000', '440.00000000', '0.00028947', '1525708801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('525', '25', '190000', '550.00000000', '0.00036184', '1525708801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('526', '26', '190000', '50.00000000', '0.00003289', '1525708801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('527', '27', '190000', '42.04000000', '0.00002766', '1525708801', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('528', '28', '190000', '30.00000000', '0.00001974', '1525708801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('529', '29', '190000', '21.00000000', '0.00001382', '1525708801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('530', '30', '190000', '88.00000000', '0.00005789', '1525708801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('531', '1', '190000', '100.00000000', '0.00006579', '1525719601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('532', '2', '190000', '200.00000000', '0.00013158', '1525719601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('533', '3', '190000', '350.00000000', '0.00023026', '1525719601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('534', '4', '190000', '440.00000000', '0.00028947', '1525719601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('535', '25', '190000', '550.00000000', '0.00036184', '1525719601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('536', '26', '190000', '50.00000000', '0.00003289', '1525719601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('537', '27', '190000', '42.04000000', '0.00002766', '1525719601', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('538', '28', '190000', '30.00000000', '0.00001974', '1525719601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('539', '29', '190000', '21.00000000', '0.00001382', '1525719601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('540', '30', '190000', '88.00000000', '0.00005789', '1525719601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('541', '1', '190000', '100.00000000', '0.00006579', '1525730401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('542', '2', '190000', '200.00000000', '0.00013158', '1525730401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('543', '3', '190000', '350.00000000', '0.00023026', '1525730401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('544', '4', '190000', '440.00000000', '0.00028947', '1525730401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('545', '25', '190000', '550.00000000', '0.00036184', '1525730401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('546', '26', '190000', '50.00000000', '0.00003289', '1525730402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('547', '27', '190000', '42.04000000', '0.00002766', '1525730402', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('548', '28', '190000', '30.00000000', '0.00001974', '1525730402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('549', '29', '190000', '21.00000000', '0.00001382', '1525730402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('550', '30', '190000', '88.00000000', '0.00005789', '1525730402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('551', '1', '190000', '100.00000000', '0.00006579', '1525741201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('552', '2', '190000', '200.00000000', '0.00013158', '1525741201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('553', '3', '190000', '350.00000000', '0.00023026', '1525741201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('554', '4', '190000', '440.00000000', '0.00028947', '1525741201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('555', '25', '190000', '550.00000000', '0.00036184', '1525741201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('556', '26', '190000', '50.00000000', '0.00003289', '1525741201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('557', '27', '190000', '42.04000000', '0.00002766', '1525741201', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('558', '28', '190000', '30.00000000', '0.00001974', '1525741201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('559', '29', '190000', '21.00000000', '0.00001382', '1525741201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('560', '30', '190000', '88.00000000', '0.00005789', '1525741201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('561', '1', '190000', '100.00000000', '0.00006579', '1525752001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('562', '2', '190000', '200.00000000', '0.00013158', '1525752001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('563', '3', '190000', '350.00000000', '0.00023026', '1525752001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('564', '4', '190000', '440.00000000', '0.00028947', '1525752001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('565', '25', '190000', '550.00000000', '0.00036184', '1525752001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('566', '26', '190000', '50.00000000', '0.00003289', '1525752001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('567', '27', '190000', '42.04000000', '0.00002766', '1525752001', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('568', '28', '190000', '30.00000000', '0.00001974', '1525752001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('569', '29', '190000', '21.00000000', '0.00001382', '1525752001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('570', '30', '190000', '88.00000000', '0.00005789', '1525752001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('571', '1', '190000', '111.00000000', '0.00007303', '1525762801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('572', '2', '190000', '200.00000000', '0.00013158', '1525762801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('573', '3', '190000', '350.00000000', '0.00023026', '1525762801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('574', '4', '190000', '440.00000000', '0.00028947', '1525762801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('575', '25', '190000', '551.00000000', '0.00036250', '1525762801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('576', '26', '190000', '50.00000000', '0.00003289', '1525762801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('577', '27', '190000', '42.04000000', '0.00002766', '1525762801', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('578', '28', '190000', '30.00000000', '0.00001974', '1525762801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('579', '29', '190000', '21.00000000', '0.00001382', '1525762801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('580', '30', '190000', '88.00000000', '0.00005789', '1525762801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('581', '37', '190000', '1000.00000000', '0.00065789', '1525762801', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('582', '1', '190000', '111.00000000', '0.00007303', '1525762932', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('583', '2', '190000', '200.00000000', '0.00013158', '1525762932', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('584', '3', '190000', '350.00000000', '0.00023026', '1525762932', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('585', '4', '190000', '440.00000000', '0.00028947', '1525762932', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('586', '25', '190000', '551.00000000', '0.00036250', '1525762932', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('587', '26', '190000', '50.00000000', '0.00003289', '1525762932', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('588', '27', '190000', '42.04000000', '0.00002766', '1525762932', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('589', '28', '190000', '30.00000000', '0.00001974', '1525762932', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('590', '29', '190000', '21.00000000', '0.00001382', '1525762932', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('591', '30', '190000', '88.00000000', '0.00005789', '1525762932', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('592', '37', '190000', '1000.00000000', '0.00065789', '1525762932', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('593', '1', '190000', '111.00000000', '0.00007303', '1525762988', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('594', '2', '190000', '200.00000000', '0.00013158', '1525762988', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('595', '3', '190000', '350.00000000', '0.00023026', '1525762988', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('596', '4', '190000', '440.00000000', '0.00028947', '1525762988', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('597', '25', '190000', '551.00000000', '0.00036250', '1525762988', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('598', '26', '190000', '50.00000000', '0.00003289', '1525762988', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('599', '27', '190000', '42.04000000', '0.00002766', '1525762988', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('600', '28', '190000', '30.00000000', '0.00001974', '1525762988', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('601', '29', '190000', '21.00000000', '0.00001382', '1525762988', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('602', '30', '190000', '88.00000000', '0.00005789', '1525762988', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('603', '37', '190000', '1000.00000000', '0.00065789', '1525762988', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('604', '1', '190000', '111.00000000', '0.00007303', '1525762993', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('605', '2', '190000', '200.00000000', '0.00013158', '1525762993', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('606', '3', '190000', '350.00000000', '0.00023026', '1525762993', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('607', '4', '190000', '440.00000000', '0.00028947', '1525762993', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('608', '25', '190000', '551.00000000', '0.00036250', '1525762993', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('609', '26', '190000', '50.00000000', '0.00003289', '1525762993', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('610', '27', '190000', '42.04000000', '0.00002766', '1525762993', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('611', '28', '190000', '30.00000000', '0.00001974', '1525762993', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('612', '29', '190000', '21.00000000', '0.00001382', '1525762993', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('613', '30', '190000', '88.00000000', '0.00005789', '1525762993', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('614', '37', '190000', '1000.00000000', '0.00065789', '1525762993', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('615', '1', '200000', '111.00000000', '0.00006938', '1525773601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('616', '2', '200000', '200.00000000', '0.00012500', '1525773601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('617', '3', '200000', '350.00000000', '0.00021875', '1525773601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('618', '4', '200000', '440.00000000', '0.00027500', '1525773601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('619', '25', '200000', '551.00000000', '0.00034438', '1525773601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('620', '26', '200000', '50.00000000', '0.00003125', '1525773601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('621', '27', '200000', '42.04000000', '0.00020000', '1525773601', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('622', '28', '200000', '30.00000000', '0.00001875', '1525773601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('623', '29', '200000', '21.00000000', '0.00001313', '1525773601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('624', '30', '200000', '88.00000000', '0.00005500', '1525773601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('625', '37', '200000', '1060.00000000', '0.00066250', '1525773601', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('626', '1', '200000', '111.00000000', '0.00006938', '1525784401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('627', '2', '200000', '200.00000000', '0.00012500', '1525784401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('628', '3', '200000', '350.00000000', '0.00021875', '1525784401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('629', '4', '200000', '440.00000000', '0.00027500', '1525784401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('630', '25', '200000', '551.00000000', '0.00034438', '1525784401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('631', '26', '200000', '50.00000000', '0.00003125', '1525784401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('632', '27', '200000', '42.04000000', '0.00002628', '1525784401', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('633', '28', '200000', '30.00000000', '0.00001875', '1525784401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('634', '29', '200000', '21.00000000', '0.00001313', '1525784401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('635', '30', '200000', '88.00000000', '0.00005500', '1525784401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('636', '37', '200000', '1060.00000000', '0.00066250', '1525784401', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('637', '2', '200000', '200.00000000', '0.00010000', '1525786166', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('638', '3', '200000', '350.00000000', '0.00020000', '1525786166', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('639', '4', '200000', '440.00000000', '0.00020000', '1525786166', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('640', '25', '200000', '551.00000000', '0.00030000', '1525786166', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('641', '37', '200000', '1060.00000000', '0.00060000', '1525786166', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('642', '2', '200000', '200.00000000', '0.00010000', '1525795201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('643', '3', '200000', '350.00000000', '0.00020000', '1525795201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('644', '4', '200000', '440.00000000', '0.00020000', '1525795201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('645', '25', '200000', '551.00000000', '0.00030000', '1525795201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('646', '37', '200000', '1060.00000000', '0.00060000', '1525795201', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('647', '2', '200000', '200.00000000', '0.00010000', '1525806001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('648', '3', '200000', '350.00000000', '0.00020000', '1525806001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('649', '4', '200000', '440.00000000', '0.00020000', '1525806001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('650', '25', '200000', '551.00000000', '0.00030000', '1525806001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('651', '37', '200000', '1060.00000000', '0.00060000', '1525806001', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('652', '2', '200000', '200.00000000', '0.00010000', '1525816801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('653', '3', '200000', '350.00000000', '0.00020000', '1525816801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('654', '4', '200000', '440.00000000', '0.00020000', '1525816801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('655', '25', '200000', '551.00000000', '0.00030000', '1525816801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('656', '37', '200000', '1060.00000000', '0.00060000', '1525816801', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('657', '2', '210000', '200.00000000', '0.00010000', '1525827602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('658', '3', '210000', '350.00000000', '0.00020000', '1525827602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('659', '4', '210000', '440.00000000', '0.00020000', '1525827602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('660', '25', '210000', '551.00000000', '0.00030000', '1525827602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('661', '37', '210000', '1060.00000000', '0.00060000', '1525827602', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('662', '1', '23', '111.00000000', '0.60320000', '1525838401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('663', '2', '23', '200.00000000', '1.08690000', '1525838401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('664', '3', '23', '350.00000000', '1.90210000', '1525838401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('665', '4', '23', '440.00000000', '2.39130000', '1525838401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('666', '25', '23', '551.00000000', '2.99450000', '1525838401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('667', '26', '23', '50.00000000', '0.27170000', '1525838401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('668', '27', '23', '119.04000000', '0.64690000', '1525838401', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('669', '28', '23', '30.00000000', '0.16300000', '1525838401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('670', '29', '23', '21.00000000', '0.11410000', '1525838401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('671', '30', '23', '88.00000000', '0.47820000', '1525838401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('672', '34', '23', '345.60000000', '1.87820000', '1525838401', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('673', '37', '23', '1060.00000000', '5.76080000', '1525838401', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('674', '40', '23', '1000.00000000', '5.43470000', '1525838401', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('675', '41', '23', '1000.00000000', '5.43470000', '1525838401', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('676', '42', '23', '3356.00000000', '18.23910000', '1525838401', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('677', '1', '23', '111.00000000', '0.60320000', '1525849201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('678', '2', '23', '200.00000000', '1.08690000', '1525849201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('679', '3', '23', '350.00000000', '1.90210000', '1525849201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('680', '4', '23', '440.00000000', '2.39130000', '1525849201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('681', '25', '23', '551.00000000', '2.99450000', '1525849201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('682', '26', '23', '50.00000000', '0.27170000', '1525849201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('683', '27', '23', '481.64000000', '2.61760000', '1525849201', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('684', '28', '23', '30.00000000', '0.16300000', '1525849201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('685', '29', '23', '21.00000000', '0.11410000', '1525849201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('686', '30', '23', '88.00000000', '0.47820000', '1525849201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('687', '34', '23', '581.40000000', '3.15970000', '1525849201', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('688', '36', '23', '110.00000000', '0.59780000', '1525849201', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('689', '37', '23', '1060.00000000', '5.76080000', '1525849201', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('690', '40', '23', '1000.00000000', '5.43470000', '1525849201', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('691', '41', '23', '1000.00000000', '5.43470000', '1525849201', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('692', '42', '23', '6356.00000000', '34.54340000', '1525849201', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('693', '1', '12400', '111.00000000', '0.00110000', '1525860001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('694', '2', '12400', '200.00000000', '0.00200000', '1525860001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('695', '3', '12400', '350.00000000', '0.00350000', '1525860001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('696', '4', '12400', '440.00000000', '0.00440000', '1525860001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('697', '25', '12400', '551.00000000', '0.00550000', '1525860001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('698', '26', '12400', '50.00000000', '0.00050000', '1525860001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('699', '27', '12400', '481.64000000', '0.00480000', '1525860001', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('700', '28', '12400', '30.00000000', '0.00030000', '1525860001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('701', '29', '12400', '21.00000000', '0.00020000', '1525860001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('702', '30', '12400', '88.00000000', '0.00080000', '1525860001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('703', '34', '12400', '581.40000000', '0.00580000', '1525860001', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('704', '36', '12400', '110.00000000', '0.00110000', '1525860001', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('705', '37', '12400', '1060.00000000', '0.01060000', '1525860001', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('706', '40', '12400', '1000.00000000', '0.01000000', '1525860001', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('707', '41', '12400', '1000.00000000', '0.01000000', '1525860001', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('708', '42', '12400', '6356.00000000', '0.06400000', '1525860001', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('709', '46', '12400', '50.00000000', '0.00050000', '1525860001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('710', '51', '12400', '50.00000000', '0.00050000', '1525860001', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('711', '1', '13200', '111.00000000', '0.00100000', '1525867510', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('712', '2', '13200', '200.00000000', '0.00180000', '1525867510', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('713', '3', '13200', '350.00000000', '0.00330000', '1525867510', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('714', '4', '13200', '440.00000000', '0.00410000', '1525867510', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('715', '25', '13200', '551.00000000', '0.00520000', '1525867510', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('716', '26', '13200', '50.00000000', '0.00040000', '1525867510', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('717', '27', '13200', '481.64000000', '0.00450000', '1525867510', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('718', '28', '13200', '30.00000000', '0.00020000', '1525867510', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('719', '29', '13200', '21.00000000', '0.00020000', '1525867510', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('720', '30', '13200', '88.00000000', '0.00080000', '1525867510', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('721', '34', '13200', '581.40000000', '0.00550000', '1525867510', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('722', '36', '13200', '110.00000000', '0.00100000', '1525867510', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('723', '37', '13200', '1060.00000000', '0.01000000', '1525867510', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('724', '40', '13200', '1000.00000000', '0.00940000', '1525867510', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('725', '41', '13200', '1000.00000000', '0.00940000', '1525867510', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('726', '42', '13200', '6356.00000000', '0.06010000', '1525867510', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('727', '46', '13200', '50.00000000', '0.00040000', '1525867510', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('728', '51', '13200', '50.00000000', '0.00040000', '1525867510', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('729', '53', '13200', '50.00000000', '0.00040000', '1525867510', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('730', '1', '13200', '111.00000000', '0.00100000', '1525867515', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('731', '2', '13200', '200.00000000', '0.00180000', '1525867515', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('732', '3', '13200', '350.00000000', '0.00330000', '1525867515', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('733', '4', '13200', '440.00000000', '0.00410000', '1525867515', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('734', '25', '13200', '551.00000000', '0.00520000', '1525867515', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('735', '26', '13200', '50.00000000', '0.00040000', '1525867515', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('736', '27', '13200', '481.64000000', '0.00450000', '1525867515', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('737', '28', '13200', '30.00000000', '0.00020000', '1525867515', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('738', '29', '13200', '21.00000000', '0.00020000', '1525867515', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('739', '30', '13200', '88.00000000', '0.00080000', '1525867515', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('740', '34', '13200', '581.40000000', '0.00550000', '1525867515', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('741', '36', '13200', '110.00000000', '0.00100000', '1525867515', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('742', '37', '13200', '1060.00000000', '0.01000000', '1525867515', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('743', '40', '13200', '1000.00000000', '0.00940000', '1525867515', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('744', '41', '13200', '1000.00000000', '0.00940000', '1525867515', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('745', '42', '13200', '6356.00000000', '0.06010000', '1525867515', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('746', '46', '13200', '50.00000000', '0.00040000', '1525867515', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('747', '51', '13200', '50.00000000', '0.00040000', '1525867515', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('748', '53', '13200', '50.00000000', '0.00040000', '1525867515', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('749', '1', '13200', '111.00000000', '0.00100000', '1525867533', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('750', '2', '13200', '200.00000000', '0.00180000', '1525867533', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('751', '3', '13200', '350.00000000', '0.00330000', '1525867533', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('752', '4', '13200', '440.00000000', '0.00410000', '1525867533', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('753', '25', '13200', '551.00000000', '0.00520000', '1525867533', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('754', '26', '13200', '50.00000000', '0.00040000', '1525867533', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('755', '27', '13200', '481.64000000', '0.00450000', '1525867533', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('756', '28', '13200', '30.00000000', '0.00020000', '1525867533', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('757', '29', '13200', '21.00000000', '0.00020000', '1525867533', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('758', '30', '13200', '88.00000000', '0.00080000', '1525867533', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('759', '34', '13200', '581.40000000', '0.00550000', '1525867533', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('760', '36', '13200', '110.00000000', '0.00100000', '1525867533', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('761', '37', '13200', '1060.00000000', '0.01000000', '1525867533', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('762', '40', '13200', '1000.00000000', '0.00940000', '1525867533', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('763', '41', '13200', '1000.00000000', '0.00940000', '1525867533', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('764', '42', '13200', '6356.00000000', '0.06010000', '1525867533', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('765', '46', '13200', '50.00000000', '0.00040000', '1525867533', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('766', '51', '13200', '50.00000000', '0.00040000', '1525867533', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('767', '53', '13200', '50.00000000', '0.00040000', '1525867533', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('768', '1', '13200', '111.00000000', '0.00100000', '1525867552', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('769', '2', '13200', '200.00000000', '0.00180000', '1525867552', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('770', '3', '13200', '350.00000000', '0.00330000', '1525867552', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('771', '4', '13200', '440.00000000', '0.00410000', '1525867552', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('772', '25', '13200', '551.00000000', '0.00520000', '1525867552', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('773', '26', '13200', '50.00000000', '0.00040000', '1525867552', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('774', '27', '13200', '481.64000000', '0.00450000', '1525867552', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('775', '28', '13200', '30.00000000', '0.00020000', '1525867552', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('776', '29', '13200', '21.00000000', '0.00020000', '1525867552', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('777', '30', '13200', '88.00000000', '0.00080000', '1525867552', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('778', '34', '13200', '581.40000000', '0.00550000', '1525867552', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('779', '36', '13200', '110.00000000', '0.00100000', '1525867552', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('780', '37', '13200', '1060.00000000', '0.01000000', '1525867552', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('781', '40', '13200', '1000.00000000', '0.00940000', '1525867552', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('782', '41', '13200', '1000.00000000', '0.00940000', '1525867552', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('783', '42', '13200', '6356.00000000', '0.06010000', '1525867552', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('784', '46', '13200', '50.00000000', '0.00040000', '1525867552', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('785', '51', '13200', '50.00000000', '0.00040000', '1525867552', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('786', '53', '13200', '50.00000000', '0.00040000', '1525867552', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('787', '1', '13200', '111.00000000', '0.00100000', '1525867590', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('788', '2', '13200', '200.00000000', '0.00180000', '1525867590', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('789', '3', '13200', '350.00000000', '0.00330000', '1525867590', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('790', '4', '13200', '440.00000000', '0.00410000', '1525867590', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('791', '25', '13200', '551.00000000', '0.00520000', '1525867590', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('792', '26', '13200', '50.00000000', '0.00040000', '1525867590', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('793', '27', '13200', '481.64000000', '0.00450000', '1525867590', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('794', '28', '13200', '30.00000000', '0.00020000', '1525867590', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('795', '29', '13200', '21.00000000', '0.00020000', '1525867590', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('796', '30', '13200', '88.00000000', '0.00080000', '1525867590', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('797', '34', '13200', '581.40000000', '0.00550000', '1525867590', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('798', '36', '13200', '110.00000000', '0.00100000', '1525867590', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('799', '37', '13200', '1060.00000000', '0.01000000', '1525867590', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('800', '40', '13200', '1000.00000000', '0.00940000', '1525867590', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('801', '41', '13200', '1000.00000000', '0.00940000', '1525867590', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('802', '42', '13200', '6356.00000000', '0.06010000', '1525867590', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('803', '46', '13200', '50.00000000', '0.00040000', '1525867590', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('804', '51', '13200', '50.00000000', '0.00040000', '1525867590', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('805', '53', '13200', '50.00000000', '0.00040000', '1525867590', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('806', '1', '13200', '111.00000000', '0.00100000', '1525867640', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('807', '2', '13200', '200.00000000', '0.00180000', '1525867640', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('808', '3', '13200', '350.00000000', '0.00330000', '1525867640', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('809', '4', '13200', '440.00000000', '0.00410000', '1525867640', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('810', '25', '13200', '551.00000000', '0.00520000', '1525867640', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('811', '26', '13200', '50.00000000', '0.00040000', '1525867640', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('812', '27', '13200', '481.64000000', '0.00450000', '1525867640', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('813', '28', '13200', '30.00000000', '0.00020000', '1525867640', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('814', '29', '13200', '21.00000000', '0.00020000', '1525867640', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('815', '30', '13200', '88.00000000', '0.00080000', '1525867640', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('816', '34', '13200', '581.40000000', '0.00550000', '1525867640', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('817', '36', '13200', '110.00000000', '0.00100000', '1525867640', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('818', '37', '13200', '1060.00000000', '0.01000000', '1525867640', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('819', '40', '13200', '1000.00000000', '0.00940000', '1525867640', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('820', '41', '13200', '1000.00000000', '0.00940000', '1525867640', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('821', '42', '13200', '6356.00000000', '0.06010000', '1525867640', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('822', '46', '13200', '50.00000000', '0.00040000', '1525867640', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('823', '51', '13200', '50.00000000', '0.00040000', '1525867640', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('824', '53', '13200', '50.00000000', '0.00040000', '1525867640', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('825', '1', '13200', '111.00000000', '0.00100000', '1525867661', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('826', '2', '13200', '200.00000000', '0.00180000', '1525867661', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('827', '3', '13200', '350.00000000', '0.00330000', '1525867661', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('828', '4', '13200', '440.00000000', '0.00410000', '1525867661', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('829', '25', '13200', '551.00000000', '0.00520000', '1525867661', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('830', '26', '13200', '50.00000000', '0.00040000', '1525867661', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('831', '27', '13200', '481.64000000', '0.00450000', '1525867661', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('832', '28', '13200', '30.00000000', '0.00020000', '1525867661', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('833', '29', '13200', '21.00000000', '0.00020000', '1525867661', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('834', '30', '13200', '88.00000000', '0.00080000', '1525867661', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('835', '34', '13200', '581.40000000', '0.00550000', '1525867661', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('836', '36', '13200', '110.00000000', '0.00100000', '1525867661', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('837', '37', '13200', '1060.00000000', '0.01000000', '1525867661', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('838', '40', '13200', '1000.00000000', '0.00940000', '1525867661', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('839', '41', '13200', '1000.00000000', '0.00940000', '1525867661', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('840', '42', '13200', '6356.00000000', '0.06010000', '1525867661', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('841', '46', '13200', '50.00000000', '0.00040000', '1525867661', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('842', '51', '13200', '50.00000000', '0.00040000', '1525867661', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('843', '53', '13200', '50.00000000', '0.00040000', '1525867661', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('844', '1', '13200', '111.00000000', '0.00100000', '1525867663', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('845', '2', '13200', '200.00000000', '0.00180000', '1525867663', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('846', '3', '13200', '350.00000000', '0.00330000', '1525867663', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('847', '4', '13200', '440.00000000', '0.00410000', '1525867663', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('848', '25', '13200', '551.00000000', '0.00520000', '1525867663', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('849', '26', '13200', '50.00000000', '0.00040000', '1525867663', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('850', '27', '13200', '481.64000000', '0.00450000', '1525867663', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('851', '28', '13200', '30.00000000', '0.00020000', '1525867663', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('852', '29', '13200', '21.00000000', '0.00020000', '1525867663', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('853', '30', '13200', '88.00000000', '0.00080000', '1525867663', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('854', '34', '13200', '581.40000000', '0.00550000', '1525867663', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('855', '36', '13200', '110.00000000', '0.00100000', '1525867663', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('856', '37', '13200', '1060.00000000', '0.01000000', '1525867663', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('857', '40', '13200', '1000.00000000', '0.00940000', '1525867663', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('858', '41', '13200', '1000.00000000', '0.00940000', '1525867663', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('859', '42', '13200', '6356.00000000', '0.06010000', '1525867663', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('860', '46', '13200', '50.00000000', '0.00040000', '1525867663', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('861', '51', '13200', '50.00000000', '0.00040000', '1525867663', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('862', '53', '13200', '50.00000000', '0.00040000', '1525867663', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('863', '1', '13200', '111.00000000', '0.00100000', '1525867694', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('864', '2', '13200', '200.00000000', '0.00180000', '1525867694', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('865', '3', '13200', '350.00000000', '0.00330000', '1525867694', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('866', '4', '13200', '440.00000000', '0.00410000', '1525867694', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('867', '25', '13200', '551.00000000', '0.00520000', '1525867694', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('868', '26', '13200', '50.00000000', '0.00040000', '1525867694', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('869', '27', '13200', '481.64000000', '0.00450000', '1525867694', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('870', '28', '13200', '30.00000000', '0.00020000', '1525867694', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('871', '29', '13200', '21.00000000', '0.00020000', '1525867694', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('872', '30', '13200', '88.00000000', '0.00080000', '1525867694', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('873', '34', '13200', '581.40000000', '0.00550000', '1525867694', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('874', '36', '13200', '110.00000000', '0.00100000', '1525867694', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('875', '37', '13200', '1060.00000000', '0.01000000', '1525867694', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('876', '40', '13200', '1000.00000000', '0.00940000', '1525867694', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('877', '41', '13200', '1000.00000000', '0.00940000', '1525867694', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('878', '42', '13200', '6356.00000000', '0.06010000', '1525867694', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('879', '46', '13200', '50.00000000', '0.00040000', '1525867694', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('880', '51', '13200', '50.00000000', '0.00040000', '1525867694', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('881', '53', '13200', '50.00000000', '0.00040000', '1525867694', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('882', '1', '13200', '111.00000000', '0.00100000', '1525867736', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('883', '2', '13200', '200.00000000', '0.00180000', '1525867736', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('884', '3', '13200', '350.00000000', '0.00330000', '1525867736', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('885', '4', '13200', '440.00000000', '0.00410000', '1525867736', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('886', '25', '13200', '551.00000000', '0.00520000', '1525867736', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('887', '26', '13200', '50.00000000', '0.00040000', '1525867736', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('888', '27', '13200', '481.64000000', '0.00450000', '1525867736', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('889', '28', '13200', '30.00000000', '0.00020000', '1525867736', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('890', '29', '13200', '21.00000000', '0.00020000', '1525867736', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('891', '30', '13200', '88.00000000', '0.00080000', '1525867736', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('892', '34', '13200', '581.40000000', '0.00550000', '1525867736', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('893', '36', '13200', '110.00000000', '0.00100000', '1525867736', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('894', '37', '13200', '1060.00000000', '0.01000000', '1525867736', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('895', '40', '13200', '1000.00000000', '0.00940000', '1525867736', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('896', '41', '13200', '1000.00000000', '0.00940000', '1525867736', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('897', '42', '13200', '6356.00000000', '0.06010000', '1525867736', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('898', '46', '13200', '50.00000000', '0.00040000', '1525867736', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('899', '51', '13200', '50.00000000', '0.00040000', '1525867736', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('900', '53', '13200', '50.00000000', '0.00040000', '1525867736', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('901', '1', '13600', '111.00000000', '0.00100000', '1525870802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('902', '2', '13600', '200.00000000', '0.00180000', '1525870802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('903', '3', '13600', '350.00000000', '0.00320000', '1525870802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('904', '4', '13600', '440.00000000', '0.00400000', '1525870802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('905', '25', '13600', '551.00000000', '0.00500000', '1525870802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('906', '26', '13600', '50.00000000', '0.00040000', '1525870802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('907', '27', '13600', '481.64000000', '0.00440000', '1525870802', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('908', '28', '13600', '30.00000000', '0.00020000', '1525870802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('909', '29', '13600', '21.00000000', '0.00010000', '1525870802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('910', '30', '13600', '88.00000000', '0.00080000', '1525870802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('911', '34', '13600', '581.40000000', '0.00530000', '1525870802', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('912', '36', '13600', '110.00000000', '0.00100000', '1525870802', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('913', '37', '13600', '1060.00000000', '0.00970000', '1525870802', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('914', '40', '13600', '1000.00000000', '0.00910000', '1525870802', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('915', '41', '13600', '1000.00000000', '0.00910000', '1525870802', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('916', '42', '13600', '6356.00000000', '0.05840000', '1525870802', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('917', '46', '13600', '50.00000000', '0.00040000', '1525870802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('918', '51', '13600', '50.00000000', '0.00040000', '1525870802', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('919', '53', '13600', '50.00000000', '0.00040000', '1525870802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('920', '54', '13600', '50.00000000', '0.00040000', '1525870802', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('921', '1', '13600', '111.00000000', '0.00100000', '1525872485', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('922', '2', '13600', '200.00000000', '0.00180000', '1525872485', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('923', '3', '13600', '350.00000000', '0.00320000', '1525872485', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('924', '4', '13600', '440.00000000', '0.00400000', '1525872485', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('925', '25', '13600', '551.00000000', '0.00500000', '1525872485', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('926', '26', '13600', '50.00000000', '0.00040000', '1525872485', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('927', '27', '13600', '481.64000000', '0.00440000', '1525872485', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('928', '28', '13600', '30.00000000', '0.00020000', '1525872485', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('929', '29', '13600', '21.00000000', '0.00010000', '1525872485', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('930', '30', '13600', '88.00000000', '0.00080000', '1525872485', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('931', '34', '13600', '581.40000000', '0.00530000', '1525872485', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('932', '36', '13600', '110.00000000', '0.00100000', '1525872485', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('933', '37', '13600', '1060.00000000', '0.00970000', '1525872485', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('934', '40', '13600', '1000.00000000', '0.00910000', '1525872485', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('935', '41', '13600', '1000.00000000', '0.00910000', '1525872485', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('936', '42', '13600', '6356.00000000', '0.05840000', '1525872485', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('937', '46', '13600', '50.00000000', '0.00040000', '1525872485', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('938', '51', '13600', '50.00000000', '0.00040000', '1525872485', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('939', '53', '13600', '50.00000000', '0.00040000', '1525872485', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('940', '54', '13600', '50.00000000', '0.00040000', '1525872485', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('941', '1', '13600', '111.00000000', '0.00100000', '1525872493', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('942', '2', '13600', '200.00000000', '0.00180000', '1525872493', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('943', '3', '13600', '350.00000000', '0.00320000', '1525872493', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('944', '4', '13600', '440.00000000', '0.00400000', '1525872493', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('945', '25', '13600', '551.00000000', '0.00500000', '1525872493', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('946', '26', '13600', '50.00000000', '0.00040000', '1525872493', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('947', '27', '13600', '481.64000000', '0.00440000', '1525872494', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('948', '28', '13600', '30.00000000', '0.00020000', '1525872494', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('949', '29', '13600', '21.00000000', '0.00010000', '1525872494', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('950', '30', '13600', '88.00000000', '0.00080000', '1525872494', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('951', '34', '13600', '581.40000000', '0.00530000', '1525872494', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('952', '36', '13600', '110.00000000', '0.00100000', '1525872494', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('953', '37', '13600', '1060.00000000', '0.00970000', '1525872494', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('954', '40', '13600', '1000.00000000', '0.00910000', '1525872494', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('955', '41', '13600', '1000.00000000', '0.00910000', '1525872494', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('956', '42', '13600', '6356.00000000', '0.05840000', '1525872494', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('957', '46', '13600', '50.00000000', '0.00040000', '1525872494', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('958', '51', '13600', '50.00000000', '0.00040000', '1525872494', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('959', '53', '13600', '50.00000000', '0.00040000', '1525872494', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('960', '54', '13600', '50.00000000', '0.00040000', '1525872494', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('961', '1', '13600', '111.00000000', '0.00100000', '1525872553', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('962', '2', '13600', '200.00000000', '0.00180000', '1525872553', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('963', '3', '13600', '350.00000000', '0.00320000', '1525872553', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('964', '4', '13600', '440.00000000', '0.00400000', '1525872553', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('965', '25', '13600', '551.00000000', '0.00500000', '1525872553', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('966', '26', '13600', '50.00000000', '0.00040000', '1525872553', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('967', '27', '13600', '481.64000000', '0.00440000', '1525872553', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('968', '28', '13600', '30.00000000', '0.00020000', '1525872553', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('969', '29', '13600', '21.00000000', '0.00010000', '1525872553', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('970', '30', '13600', '88.00000000', '0.00080000', '1525872553', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('971', '34', '13600', '581.40000000', '0.00530000', '1525872553', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('972', '36', '13600', '110.00000000', '0.00100000', '1525872553', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('973', '37', '13600', '1060.00000000', '0.00970000', '1525872553', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('974', '40', '13600', '1000.00000000', '0.00910000', '1525872553', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('975', '41', '13600', '1000.00000000', '0.00910000', '1525872553', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('976', '42', '13600', '6356.00000000', '0.05840000', '1525872553', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('977', '46', '13600', '50.00000000', '0.00040000', '1525872553', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('978', '51', '13600', '50.00000000', '0.00040000', '1525872553', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('979', '53', '13600', '50.00000000', '0.00040000', '1525872553', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('980', '54', '13600', '50.00000000', '0.00040000', '1525872553', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('981', '1', '13600', '111.00000000', '0.00100000', '1525881601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('982', '2', '13600', '200.00000000', '0.00180000', '1525881601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('983', '3', '13600', '350.00000000', '0.00320000', '1525881601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('984', '4', '13600', '440.00000000', '0.00400000', '1525881601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('985', '25', '13600', '551.00000000', '0.00500000', '1525881601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('986', '26', '13600', '50.00000000', '0.00040000', '1525881601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('987', '27', '13600', '481.64000000', '0.00440000', '1525881601', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('988', '28', '13600', '30.00000000', '0.00020000', '1525881601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('989', '29', '13600', '21.00000000', '0.00010000', '1525881601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('990', '30', '13600', '88.00000000', '0.00080000', '1525881601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('991', '34', '13600', '581.40000000', '0.00530000', '1525881601', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('992', '36', '13600', '110.00000000', '0.00100000', '1525881601', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('993', '37', '13600', '1060.00000000', '0.00970000', '1525881601', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('994', '40', '13600', '1000.00000000', '0.00910000', '1525881601', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('995', '41', '13600', '1000.00000000', '0.00910000', '1525881601', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('996', '42', '13600', '6356.00000000', '0.05840000', '1525881601', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('997', '46', '13600', '50.00000000', '0.00040000', '1525881601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('998', '51', '13600', '50.00000000', '0.00040000', '1525881601', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('999', '53', '13600', '50.00000000', '0.00040000', '1525881601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1000', '54', '13600', '50.00000000', '0.00040000', '1525881601', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1001', '1', '13600', '111.00000000', '0.00100000', '1525892401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1002', '2', '13600', '200.00000000', '0.00180000', '1525892402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1003', '3', '13600', '350.00000000', '0.00320000', '1525892402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1004', '4', '13600', '440.00000000', '0.00400000', '1525892402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1005', '25', '13600', '551.00000000', '0.00500000', '1525892402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1006', '26', '13600', '50.00000000', '0.00040000', '1525892402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1007', '27', '13600', '481.64000000', '0.00440000', '1525892402', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1008', '28', '13600', '30.00000000', '0.00020000', '1525892402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1009', '29', '13600', '21.00000000', '0.00010000', '1525892402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1010', '30', '13600', '88.00000000', '0.00080000', '1525892402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1011', '34', '13600', '581.40000000', '0.00530000', '1525892402', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1012', '36', '13600', '110.00000000', '0.00100000', '1525892402', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1013', '37', '13600', '1060.00000000', '0.00970000', '1525892402', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1014', '40', '13600', '1000.00000000', '0.00910000', '1525892402', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1015', '41', '13600', '1000.00000000', '0.00910000', '1525892402', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1016', '42', '13600', '6356.00000000', '0.05840000', '1525892402', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1017', '46', '13600', '50.00000000', '0.00040000', '1525892402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1018', '51', '13600', '50.00000000', '0.00040000', '1525892402', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1019', '53', '13600', '50.00000000', '0.00040000', '1525892402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1020', '54', '13600', '50.00000000', '0.00040000', '1525892402', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1021', '1', '13600', '111.00000000', '0.00100000', '1525903201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1022', '2', '13600', '200.00000000', '0.00180000', '1525903201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1023', '3', '13600', '350.00000000', '0.00320000', '1525903201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1024', '4', '13600', '440.00000000', '0.00400000', '1525903201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1025', '25', '13600', '551.00000000', '0.00500000', '1525903201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1026', '26', '13600', '50.00000000', '0.00040000', '1525903201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1027', '27', '13600', '481.64000000', '0.00440000', '1525903201', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1028', '28', '13600', '30.00000000', '0.00020000', '1525903201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1029', '29', '13600', '21.00000000', '0.00010000', '1525903201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1030', '30', '13600', '88.00000000', '0.00080000', '1525903201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1031', '34', '13600', '581.40000000', '0.00530000', '1525903201', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1032', '36', '13600', '110.00000000', '0.00100000', '1525903201', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1033', '37', '13600', '1060.00000000', '0.00970000', '1525903201', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1034', '40', '13600', '1000.00000000', '0.00910000', '1525903201', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1035', '41', '13600', '1000.00000000', '0.00910000', '1525903201', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1036', '42', '13600', '6356.00000000', '0.05840000', '1525903201', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1037', '46', '13600', '50.00000000', '0.00040000', '1525903201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1038', '51', '13600', '50.00000000', '0.00040000', '1525903201', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1039', '53', '13600', '50.00000000', '0.00040000', '1525903201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1040', '54', '13600', '50.00000000', '0.00040000', '1525903201', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1041', '1', '13600', '111.00000000', '0.00100000', '1525914001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1042', '2', '13600', '200.00000000', '0.00180000', '1525914001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1043', '3', '13600', '350.00000000', '0.00320000', '1525914001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1044', '4', '13600', '440.00000000', '0.00400000', '1525914001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1045', '25', '13600', '551.00000000', '0.00500000', '1525914001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1046', '26', '13600', '50.00000000', '0.00040000', '1525914001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1047', '27', '13600', '481.64000000', '0.00440000', '1525914001', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1048', '28', '13600', '30.00000000', '0.00020000', '1525914001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1049', '29', '13600', '21.00000000', '0.00010000', '1525914001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1050', '30', '13600', '88.00000000', '0.00080000', '1525914001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1051', '34', '13600', '581.40000000', '0.00530000', '1525914001', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1052', '36', '13600', '110.00000000', '0.00100000', '1525914001', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1053', '37', '13600', '1060.00000000', '0.00970000', '1525914001', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1054', '40', '13600', '1000.00000000', '0.00910000', '1525914001', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1055', '41', '13600', '1000.00000000', '0.00910000', '1525914001', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1056', '42', '13600', '6356.00000000', '0.05840000', '1525914001', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1057', '46', '13600', '50.00000000', '0.00040000', '1525914001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1058', '51', '13600', '50.00000000', '0.00040000', '1525914001', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1059', '53', '13600', '50.00000000', '0.00040000', '1525914001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1060', '54', '13600', '50.00000000', '0.00040000', '1525914001', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1061', '1', '13600', '111.00000000', '0.00100000', '1525917234', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1062', '2', '13600', '200.00000000', '0.00180000', '1525917234', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1063', '3', '13600', '350.00000000', '0.00320000', '1525917234', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1064', '4', '13600', '440.00000000', '0.00400000', '1525917234', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1065', '25', '13600', '551.00000000', '0.00500000', '1525917234', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1066', '26', '13600', '50.00000000', '0.00040000', '1525917234', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1067', '27', '13600', '481.64000000', '0.00440000', '1525917234', '1', '1525947806');
INSERT INTO `sys_fl_log` VALUES ('1068', '28', '13600', '30.00000000', '0.00020000', '1525917234', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1069', '29', '13600', '21.00000000', '0.00010000', '1525917234', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1070', '30', '13600', '88.00000000', '0.00080000', '1525917234', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1071', '34', '13600', '581.40000000', '0.00530000', '1525917234', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1072', '36', '13600', '110.00000000', '0.00100000', '1525917234', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1073', '37', '13600', '1060.00000000', '0.00970000', '1525917234', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1074', '40', '13600', '1000.00000000', '0.00910000', '1525917234', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1075', '41', '13600', '1000.00000000', '0.00910000', '1525917234', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1076', '42', '13600', '6356.00000000', '0.05840000', '1525917234', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1077', '46', '13600', '50.00000000', '0.00040000', '1525917234', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1078', '51', '13600', '50.00000000', '0.00040000', '1525917234', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1079', '53', '13600', '50.00000000', '0.00040000', '1525917234', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1080', '54', '13600', '50.00000000', '0.00040000', '1525917234', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1081', '1', '13600', '111.00000000', '0.00100000', '1525917237', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1082', '2', '13600', '200.00000000', '0.00180000', '1525917237', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1083', '3', '13600', '350.00000000', '0.00320000', '1525917237', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1084', '4', '13600', '440.00000000', '0.00400000', '1525917237', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1085', '25', '13600', '551.00000000', '0.00500000', '1525917237', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1086', '26', '13600', '50.00000000', '0.00040000', '1525917237', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1087', '27', '13600', '481.64000000', '0.00440000', '1525917237', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1088', '28', '13600', '30.00000000', '0.00020000', '1525917237', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1089', '29', '13600', '21.00000000', '0.00010000', '1525917237', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1090', '30', '13600', '88.00000000', '0.00080000', '1525917237', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1091', '34', '13600', '581.40000000', '0.00530000', '1525917237', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1092', '36', '13600', '110.00000000', '0.00100000', '1525917237', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1093', '37', '13600', '1060.00000000', '0.00970000', '1525917237', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1094', '40', '13600', '1000.00000000', '0.00910000', '1525917237', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1095', '41', '13600', '1000.00000000', '0.00910000', '1525917237', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1096', '42', '13600', '6356.00000000', '0.05840000', '1525917237', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1097', '46', '13600', '50.00000000', '0.00040000', '1525917237', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1098', '51', '13600', '50.00000000', '0.00040000', '1525917238', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1099', '53', '13600', '50.00000000', '0.00040000', '1525917238', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1100', '54', '13600', '50.00000000', '0.00040000', '1525917238', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1101', '1', '13600', '111.00000000', '0.00100000', '1525917318', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1102', '2', '13600', '200.00000000', '0.00180000', '1525917318', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1103', '3', '13600', '350.00000000', '0.00320000', '1525917318', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1104', '4', '13600', '440.00000000', '0.00400000', '1525917318', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1105', '25', '13600', '551.00000000', '0.00500000', '1525917318', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1106', '26', '13600', '50.00000000', '0.00040000', '1525917318', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1107', '27', '13600', '481.64000000', '0.00440000', '1525917318', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1108', '28', '13600', '30.00000000', '0.00020000', '1525917318', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1109', '29', '13600', '21.00000000', '0.00010000', '1525917318', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1110', '30', '13600', '88.00000000', '0.00080000', '1525917318', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1111', '34', '13600', '581.40000000', '0.00530000', '1525917318', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1112', '36', '13600', '110.00000000', '0.00100000', '1525917318', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1113', '37', '13600', '1060.00000000', '0.00970000', '1525917318', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1114', '40', '13600', '1000.00000000', '0.00910000', '1525917318', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1115', '41', '13600', '1000.00000000', '0.00910000', '1525917318', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1116', '42', '13600', '6356.00000000', '0.05840000', '1525917318', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1117', '46', '13600', '50.00000000', '0.00040000', '1525917318', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1118', '51', '13600', '50.00000000', '0.00040000', '1525917318', '1', '1526003678');
INSERT INTO `sys_fl_log` VALUES ('1119', '53', '13600', '50.00000000', '0.00040000', '1525917318', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1120', '54', '13600', '50.00000000', '0.00040000', '1525917318', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1121', '1', '13600', '111.00000000', '0.00100000', '1525917332', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1122', '2', '13600', '200.00000000', '0.00180000', '1525917332', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1123', '3', '13600', '350.00000000', '0.00320000', '1525917332', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1124', '4', '13600', '440.00000000', '0.00400000', '1525917332', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1125', '25', '13600', '551.00000000', '0.00500000', '1525917332', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1126', '26', '13600', '50.00000000', '0.00040000', '1525917332', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1127', '27', '13600', '481.64000000', '0.00440000', '1525917332', '1', '1525946213');
INSERT INTO `sys_fl_log` VALUES ('1128', '28', '13600', '30.00000000', '0.00020000', '1525917332', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1129', '29', '13600', '21.00000000', '0.00010000', '1525917332', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1130', '30', '13600', '88.00000000', '0.00080000', '1525917332', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1131', '34', '13600', '581.40000000', '0.00530000', '1525917332', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1132', '36', '13600', '110.00000000', '0.00100000', '1525917332', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1133', '37', '13600', '1060.00000000', '0.00970000', '1525917332', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1134', '40', '13600', '1000.00000000', '0.00910000', '1525917332', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1135', '41', '13600', '1000.00000000', '0.00910000', '1525917332', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1136', '42', '13600', '6356.00000000', '0.05840000', '1525917332', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1137', '46', '13600', '50.00000000', '0.00040000', '1525917332', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1138', '51', '13600', '50.00000000', '0.00040000', '1525917332', '1', '1526003671');
INSERT INTO `sys_fl_log` VALUES ('1139', '53', '13600', '50.00000000', '0.00040000', '1525917332', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1140', '54', '13600', '50.00000000', '0.00040000', '1525917332', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1141', '1', '13600', '111.00000000', '0.00100000', '1525917333', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1142', '2', '13600', '200.00000000', '0.00180000', '1525917333', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1143', '3', '13600', '350.00000000', '0.00320000', '1525917333', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1144', '4', '13600', '440.00000000', '0.00400000', '1525917333', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1145', '25', '13600', '551.00000000', '0.00500000', '1525917333', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1146', '26', '13600', '50.00000000', '0.00040000', '1525917333', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1147', '27', '13600', '481.64000000', '0.00440000', '1525917333', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1148', '28', '13600', '30.00000000', '0.00020000', '1525917333', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1149', '29', '13600', '21.00000000', '0.00010000', '1525917333', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1150', '30', '13600', '88.00000000', '0.00080000', '1525917333', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1151', '34', '13600', '581.40000000', '0.00530000', '1525917333', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1152', '36', '13600', '110.00000000', '0.00100000', '1525917333', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1153', '37', '13600', '1060.00000000', '0.00970000', '1525917333', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1154', '40', '13600', '1000.00000000', '0.00910000', '1525917333', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1155', '41', '13600', '1000.00000000', '0.00910000', '1525917333', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1156', '42', '13600', '6356.00000000', '0.05840000', '1525917333', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1157', '46', '13600', '50.00000000', '0.00040000', '1525917333', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1158', '51', '13600', '50.00000000', '0.00040000', '1525917333', '1', '1526003679');
INSERT INTO `sys_fl_log` VALUES ('1159', '53', '13600', '50.00000000', '0.00040000', '1525917333', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1160', '54', '13600', '50.00000000', '0.00040000', '1525917333', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1161', '1', '13600', '111.00000000', '0.00100000', '1525917334', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1162', '2', '13600', '200.00000000', '0.00180000', '1525917334', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1163', '3', '13600', '350.00000000', '0.00320000', '1525917334', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1164', '4', '13600', '440.00000000', '0.00400000', '1525917334', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1165', '25', '13600', '551.00000000', '0.00500000', '1525917334', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1166', '26', '13600', '50.00000000', '0.00040000', '1525917334', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1167', '27', '13600', '481.64000000', '0.00440000', '1525917334', '1', '1525945921');
INSERT INTO `sys_fl_log` VALUES ('1168', '28', '13600', '30.00000000', '0.00020000', '1525917334', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1169', '29', '13600', '21.00000000', '0.00010000', '1525917334', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1170', '30', '13600', '88.00000000', '0.00080000', '1525917334', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1171', '34', '13600', '581.40000000', '0.00530000', '1525917334', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1172', '36', '13600', '110.00000000', '0.00100000', '1525917334', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1173', '37', '13600', '1060.00000000', '0.00970000', '1525917334', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1174', '40', '13600', '1000.00000000', '0.00910000', '1525917334', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1175', '41', '13600', '1000.00000000', '0.00910000', '1525917334', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1176', '42', '13600', '6356.00000000', '0.05840000', '1525917334', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1177', '46', '13600', '50.00000000', '0.00040000', '1525917334', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1178', '51', '13600', '50.00000000', '0.00040000', '1525917334', '1', '1526003676');
INSERT INTO `sys_fl_log` VALUES ('1179', '53', '13600', '50.00000000', '0.00040000', '1525917334', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1180', '54', '13600', '50.00000000', '0.00040000', '1525917334', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1181', '1', '13600', '111.00000000', '0.00100000', '1525917334', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1182', '2', '13600', '200.00000000', '0.00180000', '1525917334', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1183', '3', '13600', '350.00000000', '0.00320000', '1525917334', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1184', '4', '13600', '440.00000000', '0.00400000', '1525917334', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1185', '25', '13600', '551.00000000', '0.00500000', '1525917334', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1186', '26', '13600', '50.00000000', '0.00040000', '1525917334', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1187', '27', '13600', '481.64000000', '0.00440000', '1525917334', '1', '1525945919');
INSERT INTO `sys_fl_log` VALUES ('1188', '28', '13600', '30.00000000', '0.00020000', '1525917334', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1189', '29', '13600', '21.00000000', '0.00010000', '1525917334', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1190', '30', '13600', '88.00000000', '0.00080000', '1525917334', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1191', '34', '13600', '581.40000000', '0.00530000', '1525917334', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1192', '36', '13600', '110.00000000', '0.00100000', '1525917334', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1193', '37', '13600', '1060.00000000', '0.00970000', '1525917334', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1194', '40', '13600', '1000.00000000', '0.00910000', '1525917334', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1195', '41', '13600', '1000.00000000', '0.00910000', '1525917334', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1196', '42', '13600', '6356.00000000', '0.05840000', '1525917334', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1197', '46', '13600', '50.00000000', '0.00040000', '1525917334', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1198', '51', '13600', '50.00000000', '0.00040000', '1525917334', '1', '1526003673');
INSERT INTO `sys_fl_log` VALUES ('1199', '53', '13600', '50.00000000', '0.00040000', '1525917334', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1200', '54', '13600', '50.00000000', '0.00040000', '1525917334', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1201', '1', '13600', '111.00000000', '0.00100000', '1525917380', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1202', '2', '13600', '200.00000000', '0.00180000', '1525917380', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1203', '3', '13600', '350.00000000', '0.00320000', '1525917380', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1204', '4', '13600', '440.00000000', '0.00400000', '1525917380', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1205', '25', '13600', '551.00000000', '0.00500000', '1525917380', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1206', '26', '13600', '50.00000000', '0.00040000', '1525917380', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1207', '27', '13600', '481.64000000', '0.00440000', '1525917380', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1208', '28', '13600', '30.00000000', '0.00020000', '1525917380', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1209', '29', '13600', '21.00000000', '0.00010000', '1525917380', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1210', '30', '13600', '88.00000000', '0.00080000', '1525917380', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1211', '34', '13600', '581.40000000', '0.00530000', '1525917380', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1212', '36', '13600', '110.00000000', '0.00100000', '1525917380', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1213', '37', '13600', '1060.00000000', '0.00970000', '1525917380', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1214', '40', '13600', '1000.00000000', '0.00910000', '1525917380', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1215', '41', '13600', '1000.00000000', '0.00910000', '1525917380', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1216', '42', '13600', '6356.00000000', '0.05840000', '1525917380', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1217', '46', '13600', '50.00000000', '0.00040000', '1525917380', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1218', '51', '13600', '50.00000000', '0.00040000', '1525917380', '1', '1526003668');
INSERT INTO `sys_fl_log` VALUES ('1219', '53', '13600', '50.00000000', '0.00040000', '1525917380', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1220', '54', '13600', '50.00000000', '0.00040000', '1525917380', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1221', '1', '16000', '111.00000000', '0.00080000', '1525924801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1222', '2', '16000', '200.00000000', '0.00150000', '1525924801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1223', '3', '16000', '350.00000000', '0.00270000', '1525924801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1224', '4', '16000', '440.00000000', '0.00340000', '1525924801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1225', '25', '16000', '551.00000000', '0.00430000', '1525924801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1226', '26', '16000', '50.00000000', '0.00030000', '1525924801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1227', '27', '16000', '481.64000000', '0.00370000', '1525924801', '1', '1525947792');
INSERT INTO `sys_fl_log` VALUES ('1228', '28', '16000', '30.00000000', '0.00020000', '1525924801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1229', '29', '16000', '21.00000000', '0.00010000', '1525924801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1230', '30', '16000', '88.00000000', '0.00060000', '1525924801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1231', '34', '16000', '581.40000000', '0.00450000', '1525924801', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1232', '36', '16000', '110.00000000', '0.00080000', '1525924801', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1233', '37', '16000', '1060.00000000', '0.00820000', '1525924801', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1234', '40', '16000', '1000.00000000', '0.00780000', '1525924801', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1235', '41', '16000', '1000.00000000', '0.00780000', '1525924801', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1236', '42', '16000', '6356.00000000', '0.04960000', '1525924801', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1237', '46', '16000', '50.00000000', '0.00030000', '1525924801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1238', '51', '16000', '50.00000000', '0.00030000', '1525924801', '1', '1526003680');
INSERT INTO `sys_fl_log` VALUES ('1239', '53', '16000', '50.00000000', '0.00030000', '1525924801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1240', '54', '16000', '50.00000000', '0.00030000', '1525924801', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1241', '55', '16000', '50.00000000', '0.00030000', '1525924801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1242', '56', '16000', '50.00000000', '0.00030000', '1525924801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1243', '57', '16000', '50.00000000', '0.00030000', '1525924801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1244', '58', '16000', '50.00000000', '0.00030000', '1525924801', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1245', '59', '16000', '50.00000000', '0.00030000', '1525924801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1246', '60', '16000', '50.00000000', '0.00030000', '1525924801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1247', '1', '16000', '111.00000000', '0.00080000', '1525935601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1248', '2', '16000', '200.00000000', '0.00150000', '1525935601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1249', '3', '16000', '350.00000000', '0.00270000', '1525935601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1250', '4', '16000', '440.00000000', '0.00340000', '1525935601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1251', '25', '16000', '551.00000000', '0.00430000', '1525935601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1252', '26', '16000', '50.00000000', '0.00030000', '1525935601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1253', '27', '16000', '481.64000000', '0.00370000', '1525935601', '1', '1525946201');
INSERT INTO `sys_fl_log` VALUES ('1254', '28', '16000', '30.00000000', '0.00020000', '1525935601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1255', '29', '16000', '21.00000000', '0.00010000', '1525935601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1256', '30', '16000', '88.00000000', '0.00060000', '1525935601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1257', '34', '16000', '581.40000000', '0.00450000', '1525935601', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1258', '36', '16000', '110.00000000', '0.00080000', '1525935601', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1259', '37', '16000', '1060.00000000', '0.00820000', '1525935601', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1260', '39', '16000', '60.00000000', '0.00040000', '1525935601', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1261', '40', '16000', '1000.00000000', '0.00780000', '1525935601', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1262', '41', '16000', '1000.00000000', '0.00780000', '1525935601', '1', '1526006400');
INSERT INTO `sys_fl_log` VALUES ('1263', '42', '16000', '6356.00000000', '0.04960000', '1525935601', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1264', '46', '16000', '50.00000000', '0.00030000', '1525935601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1265', '51', '16000', '50.00000000', '0.00030000', '1525935601', '1', '1526003685');
INSERT INTO `sys_fl_log` VALUES ('1266', '53', '16000', '50.00000000', '0.00030000', '1525935601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1267', '54', '16000', '50.00000000', '0.00030000', '1525935601', '1', '1525961052');
INSERT INTO `sys_fl_log` VALUES ('1268', '55', '16000', '50.00000000', '0.00030000', '1525935601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1269', '56', '16000', '50.00000000', '0.00030000', '1525935601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1270', '57', '16000', '50.00000000', '0.00030000', '1525935601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1271', '58', '16000', '50.00000000', '0.00030000', '1525935601', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1272', '59', '16000', '50.00000000', '0.00030000', '1525935601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1273', '60', '16000', '50.00000000', '0.00030000', '1525935601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1274', '1', '16400', '111.00000000', '0.00080000', '1525939540', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1275', '2', '16400', '200.00000000', '0.00150000', '1525939540', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1276', '3', '16400', '350.00000000', '0.00260000', '1525939540', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1277', '4', '16400', '440.00000000', '0.00330000', '1525939540', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1278', '25', '16400', '551.00000000', '0.00420000', '1525939540', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1279', '26', '16400', '50.00000000', '0.00030000', '1525939540', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1280', '27', '16400', '481.64000000', '0.00360000', '1525939540', '1', '1525946205');
INSERT INTO `sys_fl_log` VALUES ('1281', '28', '16400', '30.00000000', '0.00020000', '1525939540', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1282', '29', '16400', '21.00000000', '0.00010000', '1525939540', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1283', '30', '16400', '88.00000000', '0.00060000', '1525939540', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1284', '34', '16400', '581.40000000', '0.00440000', '1525939540', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1285', '36', '16400', '290.00000000', '0.00220000', '1525939540', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1286', '37', '16400', '1060.00000000', '0.00800000', '1525939540', '1', '1525958477');
INSERT INTO `sys_fl_log` VALUES ('1287', '39', '16400', '60.00000000', '0.00040000', '1525939540', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1288', '40', '16400', '1000.00000000', '0.00760000', '1525939540', '1', '1526003415');
INSERT INTO `sys_fl_log` VALUES ('1289', '41', '16400', '1000.00000000', '0.00760000', '1525939540', '1', '1526006397');
INSERT INTO `sys_fl_log` VALUES ('1290', '42', '16400', '6356.00000000', '0.04840000', '1525939540', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1291', '46', '16400', '50.00000000', '0.00030000', '1525939540', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1292', '51', '16400', '50.00000000', '0.00030000', '1525939540', '1', '1526003715');
INSERT INTO `sys_fl_log` VALUES ('1293', '53', '16400', '50.00000000', '0.00030000', '1525939540', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1294', '54', '16400', '50.00000000', '0.00030000', '1525939540', '1', '1525961047');
INSERT INTO `sys_fl_log` VALUES ('1295', '55', '16400', '50.00000000', '0.00030000', '1525939540', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1296', '56', '16400', '50.00000000', '0.00030000', '1525939540', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1297', '57', '16400', '50.00000000', '0.00030000', '1525939540', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1298', '58', '16400', '50.00000000', '0.00030000', '1525939540', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1299', '59', '16400', '50.00000000', '0.00030000', '1525939540', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1300', '60', '16400', '50.00000000', '0.00030000', '1525939540', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1301', '61', '16400', '50.00000000', '0.00030000', '1525939540', '1', '1526009648');
INSERT INTO `sys_fl_log` VALUES ('1302', '1', '16800', '111.00000000', '0.00080000', '1525944879', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1303', '2', '16800', '200.00000000', '0.00140000', '1525944879', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1304', '3', '16800', '350.00000000', '0.00260000', '1525944879', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1305', '4', '16800', '440.00000000', '0.00320000', '1525944879', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1306', '25', '16800', '551.00000000', '0.00410000', '1525944879', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1307', '26', '16800', '50.00000000', '0.00030000', '1525944879', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1308', '27', '16800', '481.64000000', '0.00350000', '1525944879', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1309', '28', '16800', '30.00000000', '0.00020000', '1525944879', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1310', '29', '16800', '21.00000000', '0.00010000', '1525944879', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1311', '30', '16800', '88.00000000', '0.00060000', '1525944879', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1312', '34', '16800', '581.40000000', '0.00430000', '1525944879', '1', '1525946563');
INSERT INTO `sys_fl_log` VALUES ('1313', '36', '16800', '290.00000000', '0.00210000', '1525944879', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1314', '37', '16800', '1060.00000000', '0.00780000', '1525944879', '1', '1525958474');
INSERT INTO `sys_fl_log` VALUES ('1315', '39', '16800', '60.00000000', '0.00040000', '1525944879', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1316', '40', '16800', '1000.00000000', '0.00740000', '1525944879', '1', '1526003412');
INSERT INTO `sys_fl_log` VALUES ('1317', '41', '16800', '1000.00000000', '0.00740000', '1525944879', '1', '1526006398');
INSERT INTO `sys_fl_log` VALUES ('1318', '42', '16800', '6356.00000000', '0.04720000', '1525944879', '1', '1525946594');
INSERT INTO `sys_fl_log` VALUES ('1319', '46', '16800', '50.00000000', '0.00030000', '1525944879', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1320', '51', '16800', '50.00000000', '0.00030000', '1525944879', '1', '1526003710');
INSERT INTO `sys_fl_log` VALUES ('1321', '53', '16800', '50.00000000', '0.00030000', '1525944879', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1322', '54', '16800', '50.00000000', '0.00030000', '1525944879', '1', '1525961046');
INSERT INTO `sys_fl_log` VALUES ('1323', '55', '16800', '50.00000000', '0.00030000', '1525944879', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1324', '56', '16800', '50.00000000', '0.00030000', '1525944879', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1325', '57', '16800', '50.00000000', '0.00030000', '1525944879', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1326', '58', '16800', '50.00000000', '0.00030000', '1525944879', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1327', '59', '16800', '50.00000000', '0.00030000', '1525944879', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1328', '60', '16800', '50.00000000', '0.00030000', '1525944879', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1329', '61', '16800', '50.00000000', '0.00030000', '1525944879', '1', '1526009644');
INSERT INTO `sys_fl_log` VALUES ('1330', '62', '16800', '50.00000000', '0.00030000', '1525944879', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1331', '1', '16800', '111.00000000', '0.00080000', '1525945464', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1332', '2', '16800', '200.00000000', '0.00140000', '1525945464', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1333', '3', '16800', '350.00000000', '0.00260000', '1525945464', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1334', '4', '16800', '440.00000000', '0.00320000', '1525945464', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1335', '25', '16800', '551.00000000', '0.00410000', '1525945464', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1336', '26', '16800', '50.00000000', '0.00030000', '1525945464', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1337', '27', '16800', '481.64000000', '0.00350000', '1525945464', '1', '1525947246');
INSERT INTO `sys_fl_log` VALUES ('1338', '28', '16800', '30.00000000', '0.00020000', '1525945464', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1339', '29', '16800', '21.00000000', '0.00010000', '1525945464', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1340', '30', '16800', '88.00000000', '0.00060000', '1525945464', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1341', '34', '16800', '581.40000000', '0.00430000', '1525945464', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1342', '36', '16800', '290.00000000', '0.00210000', '1525945464', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1343', '37', '16800', '1060.00000000', '0.00780000', '1525945464', '1', '1525958475');
INSERT INTO `sys_fl_log` VALUES ('1344', '39', '16800', '60.00000000', '0.00040000', '1525945464', '1', '0');
INSERT INTO `sys_fl_log` VALUES ('1345', '40', '16800', '1000.00000000', '0.00740000', '1525945464', '1', '1526003413');
INSERT INTO `sys_fl_log` VALUES ('1346', '41', '16800', '1000.00000000', '0.00740000', '1525945464', '1', '1526006399');
INSERT INTO `sys_fl_log` VALUES ('1347', '42', '16800', '6356.00000000', '0.04720000', '1525945464', '1', '1525946592');
INSERT INTO `sys_fl_log` VALUES ('1348', '46', '16800', '50.00000000', '0.00030000', '1525945464', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1349', '51', '16800', '50.00000000', '0.00030000', '1525945464', '1', '1526003710');
INSERT INTO `sys_fl_log` VALUES ('1350', '53', '16800', '50.00000000', '0.00030000', '1525945464', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1351', '54', '16800', '50.00000000', '0.00030000', '1525945464', '1', '1525961049');
INSERT INTO `sys_fl_log` VALUES ('1352', '55', '16800', '50.00000000', '0.00030000', '1525945464', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1353', '56', '16800', '50.00000000', '0.00030000', '1525945464', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1354', '57', '16800', '50.00000000', '0.00030000', '1525945464', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1355', '58', '16800', '50.00000000', '0.00030000', '1525945464', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1356', '59', '16800', '50.00000000', '0.00030000', '1525945464', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1357', '60', '16800', '50.00000000', '0.00030000', '1525945464', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1358', '61', '16800', '50.00000000', '0.00030000', '1525945464', '1', '1526009645');
INSERT INTO `sys_fl_log` VALUES ('1359', '62', '16800', '50.00000000', '0.00030000', '1525945464', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1360', '1', '16800', '111.00000000', '0.00080000', '1525946401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1361', '2', '16800', '200.00000000', '0.00140000', '1525946401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1362', '3', '16800', '350.00000000', '0.00260000', '1525946401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1363', '4', '16800', '440.00000000', '0.00320000', '1525946401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1364', '25', '16800', '551.00000000', '0.00410000', '1525946401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1365', '26', '16800', '50.00000000', '0.00030000', '1525946401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1366', '27', '16800', '481.64000000', '0.00350000', '1525946401', '1', '1525947362');
INSERT INTO `sys_fl_log` VALUES ('1367', '28', '16800', '30.00000000', '0.00020000', '1525946401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1368', '29', '16800', '21.00000000', '0.00010000', '1525946401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1369', '30', '16800', '88.00000000', '0.00060000', '1525946401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1370', '34', '16800', '581.40000000', '0.00430000', '1525946401', '1', '1526000981');
INSERT INTO `sys_fl_log` VALUES ('1371', '36', '16800', '290.00000000', '0.00210000', '1525946401', '1', '1525946931');
INSERT INTO `sys_fl_log` VALUES ('1372', '37', '16800', '1060.00000000', '0.00780000', '1525946401', '1', '1525958476');
INSERT INTO `sys_fl_log` VALUES ('1373', '39', '16800', '60.00000000', '0.00040000', '1525946401', '1', '1525946777');
INSERT INTO `sys_fl_log` VALUES ('1374', '40', '16800', '1000.00000000', '0.00740000', '1525946401', '1', '1526003414');
INSERT INTO `sys_fl_log` VALUES ('1375', '41', '16800', '1000.00000000', '0.00740000', '1525946401', '1', '1526006399');
INSERT INTO `sys_fl_log` VALUES ('1376', '42', '16800', '6356.00000000', '0.04720000', '1525946402', '1', '1525946593');
INSERT INTO `sys_fl_log` VALUES ('1377', '46', '16800', '50.00000000', '0.00030000', '1525946402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1378', '51', '16800', '50.00000000', '0.00030000', '1525946402', '1', '1526003712');
INSERT INTO `sys_fl_log` VALUES ('1379', '53', '16800', '50.00000000', '0.00030000', '1525946402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1380', '54', '16800', '50.00000000', '0.00030000', '1525946402', '1', '1525961050');
INSERT INTO `sys_fl_log` VALUES ('1381', '55', '16800', '50.00000000', '0.00030000', '1525946402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1382', '56', '16800', '50.00000000', '0.00030000', '1525946402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1383', '57', '16800', '50.00000000', '0.00030000', '1525946402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1384', '58', '16800', '50.00000000', '0.00030000', '1525946402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1385', '59', '16800', '50.00000000', '0.00030000', '1525946402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1386', '60', '16800', '50.00000000', '0.00030000', '1525946402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1387', '61', '16800', '50.00000000', '0.00030000', '1525946402', '1', '1526009648');
INSERT INTO `sys_fl_log` VALUES ('1388', '62', '16800', '50.00000000', '0.00030000', '1525946402', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1389', '1', '16800', '111.00000000', '0.00080000', '1525947872', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1390', '2', '16800', '200.00000000', '0.00140000', '1525947872', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1391', '3', '16800', '350.00000000', '0.00260000', '1525947872', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1392', '4', '16800', '440.00000000', '0.00320000', '1525947872', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1393', '25', '16800', '551.00000000', '0.00410000', '1525947872', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1394', '26', '16800', '50.00000000', '0.00030000', '1525947872', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1395', '27', '16800', '481.64000000', '0.00350000', '1525947872', '1', '1525947876');
INSERT INTO `sys_fl_log` VALUES ('1396', '28', '16800', '30.00000000', '0.00020000', '1525947872', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1397', '29', '16800', '21.00000000', '0.00010000', '1525947872', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1398', '30', '16800', '88.00000000', '0.00060000', '1525947872', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1399', '34', '16800', '581.40000000', '0.00430000', '1525947872', '1', '1526000986');
INSERT INTO `sys_fl_log` VALUES ('1400', '36', '16800', '350.00000000', '0.00260000', '1525947872', '1', '1526007966');
INSERT INTO `sys_fl_log` VALUES ('1401', '37', '16800', '1060.00000000', '0.00780000', '1525947872', '1', '1525958478');
INSERT INTO `sys_fl_log` VALUES ('1402', '39', '16800', '60.00000000', '0.00040000', '1525947872', '1', '1525948210');
INSERT INTO `sys_fl_log` VALUES ('1403', '40', '16800', '1000.00000000', '0.00740000', '1525947872', '1', '1526003416');
INSERT INTO `sys_fl_log` VALUES ('1404', '41', '16800', '1000.00000000', '0.00740000', '1525947872', '1', '1526006406');
INSERT INTO `sys_fl_log` VALUES ('1405', '42', '16800', '6356.00000000', '0.04720000', '1525947872', '1', '1525948281');
INSERT INTO `sys_fl_log` VALUES ('1406', '46', '16800', '50.00000000', '0.00030000', '1525947872', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1407', '51', '16800', '50.00000000', '0.00030000', '1525947872', '1', '1526003713');
INSERT INTO `sys_fl_log` VALUES ('1408', '53', '16800', '50.00000000', '0.00030000', '1525947872', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1409', '54', '16800', '50.00000000', '0.00030000', '1525947872', '1', '1525961048');
INSERT INTO `sys_fl_log` VALUES ('1410', '55', '16800', '50.00000000', '0.00030000', '1525947872', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1411', '56', '16800', '50.00000000', '0.00030000', '1525947872', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1412', '57', '16800', '50.00000000', '0.00030000', '1525947872', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1413', '58', '16800', '50.00000000', '0.00030000', '1525947872', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1414', '59', '16800', '50.00000000', '0.00030000', '1525947872', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1415', '60', '16800', '50.00000000', '0.00030000', '1525947872', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1416', '61', '16800', '50.00000000', '0.00030000', '1525947872', '1', '1526009646');
INSERT INTO `sys_fl_log` VALUES ('1417', '62', '16800', '50.00000000', '0.00030000', '1525947872', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1418', '1', '16800', '111.00000000', '0.00080000', '1525947901', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1419', '2', '16800', '200.00000000', '0.00140000', '1525947901', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1420', '3', '16800', '350.00000000', '0.00260000', '1525947901', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1421', '4', '16800', '440.00000000', '0.00320000', '1525947901', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1422', '25', '16800', '551.00000000', '0.00410000', '1525947901', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1423', '26', '16800', '50.00000000', '0.00030000', '1525947901', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1424', '27', '16800', '481.64000000', '0.00350000', '1525947901', '1', '1525948055');
INSERT INTO `sys_fl_log` VALUES ('1425', '28', '16800', '30.00000000', '0.00020000', '1525947901', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1426', '29', '16800', '21.00000000', '0.00010000', '1525947901', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1427', '30', '16800', '88.00000000', '0.00060000', '1525947901', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1428', '34', '16800', '581.40000000', '0.00430000', '1525947901', '1', '1526001014');
INSERT INTO `sys_fl_log` VALUES ('1429', '36', '16800', '350.00000000', '0.00260000', '1525947901', '1', '1526007958');
INSERT INTO `sys_fl_log` VALUES ('1430', '37', '16800', '1060.00000000', '0.00780000', '1525947901', '1', '1525958475');
INSERT INTO `sys_fl_log` VALUES ('1431', '39', '16800', '60.00000000', '0.00040000', '1525947901', '1', '1525948214');
INSERT INTO `sys_fl_log` VALUES ('1432', '40', '16800', '1000.00000000', '0.00740000', '1525947901', '1', '1526003412');
INSERT INTO `sys_fl_log` VALUES ('1433', '41', '16800', '1000.00000000', '0.00740000', '1525947901', '1', '1526006405');
INSERT INTO `sys_fl_log` VALUES ('1434', '42', '16800', '6356.00000000', '0.04720000', '1525947901', '1', '1525948276');
INSERT INTO `sys_fl_log` VALUES ('1435', '46', '16800', '50.00000000', '0.00030000', '1525947901', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1436', '51', '16800', '50.00000000', '0.00030000', '1525947901', '1', '1526003709');
INSERT INTO `sys_fl_log` VALUES ('1437', '53', '16800', '50.00000000', '0.00030000', '1525947901', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1438', '54', '16800', '50.00000000', '0.00030000', '1525947901', '1', '1525961049');
INSERT INTO `sys_fl_log` VALUES ('1439', '55', '16800', '50.00000000', '0.00030000', '1525947901', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1440', '56', '16800', '50.00000000', '0.00030000', '1525947901', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1441', '57', '16800', '50.00000000', '0.00030000', '1525947901', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1442', '58', '16800', '50.00000000', '0.00030000', '1525947901', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1443', '59', '16800', '50.00000000', '0.00030000', '1525947901', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1444', '60', '16800', '50.00000000', '0.00030000', '1525947901', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1445', '61', '16800', '50.00000000', '0.00030000', '1525947901', '1', '1526009647');
INSERT INTO `sys_fl_log` VALUES ('1446', '62', '16800', '50.00000000', '0.00030000', '1525947901', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1447', '1', '16800', '111.00000000', '0.00080000', '1525947901', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1448', '2', '16800', '200.00000000', '0.00140000', '1525947901', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1449', '3', '16800', '350.00000000', '0.00260000', '1525947901', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1450', '4', '16800', '440.00000000', '0.00320000', '1525947901', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1451', '25', '16800', '551.00000000', '0.00410000', '1525947901', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1452', '26', '16800', '50.00000000', '0.00030000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1453', '27', '16800', '481.64000000', '0.00350000', '1525947902', '1', '1525948075');
INSERT INTO `sys_fl_log` VALUES ('1454', '28', '16800', '30.00000000', '0.00020000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1455', '29', '16800', '21.00000000', '0.00010000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1456', '30', '16800', '88.00000000', '0.00060000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1457', '34', '16800', '581.40000000', '0.00430000', '1525947902', '1', '1526001015');
INSERT INTO `sys_fl_log` VALUES ('1458', '36', '16800', '350.00000000', '0.00260000', '1525947902', '1', '1526007959');
INSERT INTO `sys_fl_log` VALUES ('1459', '37', '16800', '1060.00000000', '0.00780000', '1525947902', '1', '1525958476');
INSERT INTO `sys_fl_log` VALUES ('1460', '39', '16800', '60.00000000', '0.00040000', '1525947902', '1', '1525948213');
INSERT INTO `sys_fl_log` VALUES ('1461', '40', '16800', '1000.00000000', '0.00740000', '1525947902', '1', '1526003414');
INSERT INTO `sys_fl_log` VALUES ('1462', '41', '16800', '1000.00000000', '0.00740000', '1525947902', '1', '1526006396');
INSERT INTO `sys_fl_log` VALUES ('1463', '42', '16800', '6356.00000000', '0.04720000', '1525947902', '1', '1525948278');
INSERT INTO `sys_fl_log` VALUES ('1464', '46', '16800', '50.00000000', '0.00030000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1465', '51', '16800', '50.00000000', '0.00030000', '1525947902', '1', '1526003713');
INSERT INTO `sys_fl_log` VALUES ('1466', '53', '16800', '50.00000000', '0.00030000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1467', '54', '16800', '50.00000000', '0.00030000', '1525947902', '1', '1525961047');
INSERT INTO `sys_fl_log` VALUES ('1468', '55', '16800', '50.00000000', '0.00030000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1469', '56', '16800', '50.00000000', '0.00030000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1470', '57', '16800', '50.00000000', '0.00030000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1471', '58', '16800', '50.00000000', '0.00030000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1472', '59', '16800', '50.00000000', '0.00030000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1473', '60', '16800', '50.00000000', '0.00030000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1474', '61', '16800', '50.00000000', '0.00030000', '1525947902', '1', '1526009651');
INSERT INTO `sys_fl_log` VALUES ('1475', '62', '16800', '50.00000000', '0.00030000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1476', '1', '16800', '111.00000000', '0.00080000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1477', '2', '16800', '200.00000000', '0.00140000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1478', '3', '16800', '350.00000000', '0.00260000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1479', '4', '16800', '440.00000000', '0.00320000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1480', '25', '16800', '551.00000000', '0.00410000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1481', '26', '16800', '50.00000000', '0.00030000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1482', '27', '16800', '481.64000000', '0.00350000', '1525947902', '1', '1525948051');
INSERT INTO `sys_fl_log` VALUES ('1483', '28', '16800', '30.00000000', '0.00020000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1484', '29', '16800', '21.00000000', '0.00010000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1485', '30', '16800', '88.00000000', '0.00060000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1486', '34', '16800', '581.40000000', '0.00430000', '1525947902', '1', '1526000979');
INSERT INTO `sys_fl_log` VALUES ('1487', '36', '16800', '350.00000000', '0.00260000', '1525947902', '1', '1526007960');
INSERT INTO `sys_fl_log` VALUES ('1488', '37', '16800', '1060.00000000', '0.00780000', '1525947902', '1', '1525958474');
INSERT INTO `sys_fl_log` VALUES ('1489', '39', '16800', '60.00000000', '0.00040000', '1525947902', '1', '1525948209');
INSERT INTO `sys_fl_log` VALUES ('1490', '40', '16800', '1000.00000000', '0.00740000', '1525947902', '1', '1526003412');
INSERT INTO `sys_fl_log` VALUES ('1491', '41', '16800', '1000.00000000', '0.00740000', '1525947902', '1', '1526006404');
INSERT INTO `sys_fl_log` VALUES ('1492', '42', '16800', '6356.00000000', '0.04720000', '1525947902', '1', '1525948279');
INSERT INTO `sys_fl_log` VALUES ('1493', '46', '16800', '50.00000000', '0.00030000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1494', '51', '16800', '50.00000000', '0.00030000', '1525947902', '1', '1526003711');
INSERT INTO `sys_fl_log` VALUES ('1495', '53', '16800', '50.00000000', '0.00030000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1496', '54', '16800', '50.00000000', '0.00030000', '1525947902', '1', '1525961061');
INSERT INTO `sys_fl_log` VALUES ('1497', '55', '16800', '50.00000000', '0.00030000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1498', '56', '16800', '50.00000000', '0.00030000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1499', '57', '16800', '50.00000000', '0.00030000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1500', '58', '16800', '50.00000000', '0.00030000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1501', '59', '16800', '50.00000000', '0.00030000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1502', '60', '16800', '50.00000000', '0.00030000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1503', '61', '16800', '50.00000000', '0.00030000', '1525947902', '1', '1526009643');
INSERT INTO `sys_fl_log` VALUES ('1504', '62', '16800', '50.00000000', '0.00030000', '1525947902', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1505', '1', '16800', '111.00000000', '0.00080000', '1525947903', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1506', '2', '16800', '200.00000000', '0.00140000', '1525947903', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1507', '3', '16800', '350.00000000', '0.00260000', '1525947903', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1508', '4', '16800', '440.00000000', '0.00320000', '1525947903', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1509', '25', '16800', '551.00000000', '0.00410000', '1525947903', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1510', '26', '16800', '50.00000000', '0.00030000', '1525947903', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1511', '27', '16800', '481.64000000', '0.00350000', '1525947903', '1', '1525948053');
INSERT INTO `sys_fl_log` VALUES ('1512', '28', '16800', '30.00000000', '0.00020000', '1525947903', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1513', '29', '16800', '21.00000000', '0.00010000', '1525947903', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1514', '30', '16800', '88.00000000', '0.00060000', '1525947903', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1515', '34', '16800', '581.40000000', '0.00430000', '1525947903', '1', '1526001031');
INSERT INTO `sys_fl_log` VALUES ('1516', '36', '16800', '350.00000000', '0.00260000', '1525947903', '1', '1526007967');
INSERT INTO `sys_fl_log` VALUES ('1517', '37', '16800', '1060.00000000', '0.00780000', '1525947903', '1', '1525958485');
INSERT INTO `sys_fl_log` VALUES ('1518', '39', '16800', '60.00000000', '0.00040000', '1525947903', '1', '1525948208');
INSERT INTO `sys_fl_log` VALUES ('1519', '40', '16800', '1000.00000000', '0.00740000', '1525947903', '1', '1526003432');
INSERT INTO `sys_fl_log` VALUES ('1520', '41', '16800', '1000.00000000', '0.00740000', '1525947903', '1', '1526006404');
INSERT INTO `sys_fl_log` VALUES ('1521', '42', '16800', '6356.00000000', '0.04720000', '1525947903', '1', '1525948280');
INSERT INTO `sys_fl_log` VALUES ('1522', '46', '16800', '50.00000000', '0.00030000', '1525947903', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1523', '51', '16800', '50.00000000', '0.00030000', '1525947903', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1524', '53', '16800', '50.00000000', '0.00030000', '1525947903', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1525', '54', '16800', '50.00000000', '0.00030000', '1525947903', '1', '1525961055');
INSERT INTO `sys_fl_log` VALUES ('1526', '55', '16800', '50.00000000', '0.00030000', '1525947903', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1527', '56', '16800', '50.00000000', '0.00030000', '1525947903', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1528', '57', '16800', '50.00000000', '0.00030000', '1525947903', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1529', '58', '16800', '50.00000000', '0.00030000', '1525947903', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1530', '59', '16800', '50.00000000', '0.00030000', '1525947903', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1531', '60', '16800', '50.00000000', '0.00030000', '1525947903', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1532', '61', '16800', '50.00000000', '0.00030000', '1525947903', '1', '1526009699');
INSERT INTO `sys_fl_log` VALUES ('1533', '62', '16800', '50.00000000', '0.00030000', '1525947903', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1534', '1', '16800', '111.00000000', '0.00080000', '1525947904', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1535', '2', '16800', '200.00000000', '0.00140000', '1525947904', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1536', '3', '16800', '350.00000000', '0.00260000', '1525947904', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1537', '4', '16800', '440.00000000', '0.00320000', '1525947904', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1538', '25', '16800', '551.00000000', '0.00410000', '1525947904', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1539', '26', '16800', '50.00000000', '0.00030000', '1525947904', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1540', '27', '16800', '481.64000000', '0.00350000', '1525947904', '1', '1525948062');
INSERT INTO `sys_fl_log` VALUES ('1541', '28', '16800', '30.00000000', '0.00020000', '1525947904', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1542', '29', '16800', '21.00000000', '0.00010000', '1525947904', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1543', '30', '16800', '88.00000000', '0.00060000', '1525947904', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1544', '34', '16800', '581.40000000', '0.00430000', '1525947904', '1', '1526000984');
INSERT INTO `sys_fl_log` VALUES ('1545', '36', '16800', '350.00000000', '0.00260000', '1525947904', '1', '1526007959');
INSERT INTO `sys_fl_log` VALUES ('1546', '37', '16800', '1060.00000000', '0.00780000', '1525947904', '1', '1525958484');
INSERT INTO `sys_fl_log` VALUES ('1547', '39', '16800', '60.00000000', '0.00040000', '1525947904', '1', '1525948215');
INSERT INTO `sys_fl_log` VALUES ('1548', '40', '16800', '1000.00000000', '0.00740000', '1525947904', '1', '1526003430');
INSERT INTO `sys_fl_log` VALUES ('1549', '41', '16800', '1000.00000000', '0.00740000', '1525947904', '1', '1526006404');
INSERT INTO `sys_fl_log` VALUES ('1550', '42', '16800', '6356.00000000', '0.04720000', '1525947904', '1', '1525948277');
INSERT INTO `sys_fl_log` VALUES ('1551', '46', '16800', '50.00000000', '0.00030000', '1525947904', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1552', '51', '16800', '50.00000000', '0.00030000', '1525947904', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1553', '53', '16800', '50.00000000', '0.00030000', '1525947904', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1554', '54', '16800', '50.00000000', '0.00030000', '1525947904', '1', '1525961054');
INSERT INTO `sys_fl_log` VALUES ('1555', '55', '16800', '50.00000000', '0.00030000', '1525947904', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1556', '56', '16800', '50.00000000', '0.00030000', '1525947904', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1557', '57', '16800', '50.00000000', '0.00030000', '1525947904', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1558', '58', '16800', '50.00000000', '0.00030000', '1525947904', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1559', '59', '16800', '50.00000000', '0.00030000', '1525947904', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1560', '60', '16800', '50.00000000', '0.00030000', '1525947904', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1561', '61', '16800', '50.00000000', '0.00030000', '1525947904', '1', '1526009698');
INSERT INTO `sys_fl_log` VALUES ('1562', '62', '16800', '50.00000000', '0.00030000', '1525947904', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1563', '1', '16800', '111.00000000', '0.00080000', '1525948047', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1564', '2', '16800', '200.00000000', '0.00140000', '1525948047', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1565', '3', '16800', '350.00000000', '0.00260000', '1525948047', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1566', '4', '16800', '440.00000000', '0.00320000', '1525948047', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1567', '25', '16800', '551.00000000', '0.00410000', '1525948047', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1568', '26', '16800', '50.00000000', '0.00030000', '1525948047', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1569', '27', '16800', '481.64000000', '0.00350000', '1525948047', '1', '1525948067');
INSERT INTO `sys_fl_log` VALUES ('1570', '28', '16800', '30.00000000', '0.00020000', '1525948047', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1571', '29', '16800', '21.00000000', '0.00010000', '1525948047', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1572', '30', '16800', '88.00000000', '0.00060000', '1525948047', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1573', '34', '16800', '581.40000000', '0.00430000', '1525948047', '1', '1526001031');
INSERT INTO `sys_fl_log` VALUES ('1574', '36', '16800', '350.00000000', '0.00260000', '1525948047', '1', '1526007960');
INSERT INTO `sys_fl_log` VALUES ('1575', '37', '16800', '1060.00000000', '0.00780000', '1525948047', '1', '1525958484');
INSERT INTO `sys_fl_log` VALUES ('1576', '39', '16800', '60.00000000', '0.00040000', '1525948047', '1', '1525948212');
INSERT INTO `sys_fl_log` VALUES ('1577', '40', '16800', '1000.00000000', '0.00740000', '1525948047', '1', '1526003431');
INSERT INTO `sys_fl_log` VALUES ('1578', '41', '16800', '1000.00000000', '0.00740000', '1525948047', '1', '1526006404');
INSERT INTO `sys_fl_log` VALUES ('1579', '42', '16800', '6356.00000000', '0.04720000', '1525948047', '1', '1525948280');
INSERT INTO `sys_fl_log` VALUES ('1580', '46', '16800', '50.00000000', '0.00030000', '1525948047', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1581', '51', '16800', '50.00000000', '0.00030000', '1525948047', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1582', '53', '16800', '50.00000000', '0.00030000', '1525948047', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1583', '54', '16800', '50.00000000', '0.00030000', '1525948047', '1', '1525961054');
INSERT INTO `sys_fl_log` VALUES ('1584', '55', '16800', '50.00000000', '0.00030000', '1525948047', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1585', '56', '16800', '50.00000000', '0.00030000', '1525948047', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1586', '57', '16800', '50.00000000', '0.00030000', '1525948047', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1587', '58', '16800', '50.00000000', '0.00030000', '1525948047', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1588', '59', '16800', '50.00000000', '0.00030000', '1525948047', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1589', '60', '16800', '50.00000000', '0.00030000', '1525948047', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1590', '61', '16800', '50.00000000', '0.00030000', '1525948047', '1', '1526009697');
INSERT INTO `sys_fl_log` VALUES ('1591', '62', '16800', '50.00000000', '0.00030000', '1525948047', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1592', '1', '16800', '111.00000000', '0.00080000', '1525948102', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1593', '2', '16800', '200.00000000', '0.00140000', '1525948102', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1594', '3', '16800', '350.00000000', '0.00260000', '1525948102', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1595', '4', '16800', '440.00000000', '0.00320000', '1525948102', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1596', '25', '16800', '551.00000000', '0.00410000', '1525948102', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1597', '26', '16800', '50.00000000', '0.00030000', '1525948102', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1598', '27', '16800', '481.64000000', '0.00350000', '1525948102', '1', '1525948109');
INSERT INTO `sys_fl_log` VALUES ('1599', '28', '16800', '30.00000000', '0.00020000', '1525948102', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1600', '29', '16800', '21.00000000', '0.00010000', '1525948102', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1601', '30', '16800', '88.00000000', '0.00060000', '1525948102', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1602', '34', '16800', '581.40000000', '0.00430000', '1525948102', '1', '1526001013');
INSERT INTO `sys_fl_log` VALUES ('1603', '36', '16800', '350.00000000', '0.00260000', '1525948102', '1', '1526007959');
INSERT INTO `sys_fl_log` VALUES ('1604', '37', '16800', '1060.00000000', '0.00780000', '1525948102', '1', '1525958483');
INSERT INTO `sys_fl_log` VALUES ('1605', '39', '16800', '60.00000000', '0.00040000', '1525948102', '1', '1525948213');
INSERT INTO `sys_fl_log` VALUES ('1606', '40', '16800', '1000.00000000', '0.00740000', '1525948102', '1', '1526003423');
INSERT INTO `sys_fl_log` VALUES ('1607', '41', '16800', '1000.00000000', '0.00740000', '1525948102', '1', '1526006404');
INSERT INTO `sys_fl_log` VALUES ('1608', '42', '16800', '6356.00000000', '0.04720000', '1525948103', '1', '1525948278');
INSERT INTO `sys_fl_log` VALUES ('1609', '46', '16800', '50.00000000', '0.00030000', '1525948103', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1610', '51', '16800', '50.00000000', '0.00030000', '1525948103', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1611', '53', '16800', '50.00000000', '0.00030000', '1525948103', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1612', '54', '16800', '50.00000000', '0.00030000', '1525948103', '1', '1525961054');
INSERT INTO `sys_fl_log` VALUES ('1613', '55', '16800', '50.00000000', '0.00030000', '1525948103', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1614', '56', '16800', '50.00000000', '0.00030000', '1525948103', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1615', '57', '16800', '50.00000000', '0.00030000', '1525948103', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1616', '58', '16800', '50.00000000', '0.00030000', '1525948103', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1617', '59', '16800', '50.00000000', '0.00030000', '1525948103', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1618', '60', '16800', '50.00000000', '0.00030000', '1525948103', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1619', '61', '16800', '50.00000000', '0.00030000', '1525948103', '1', '1526009695');
INSERT INTO `sys_fl_log` VALUES ('1620', '62', '16800', '50.00000000', '0.00030000', '1525948103', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1621', '1', '16800', '111.00000000', '0.00080000', '1525948861', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1622', '2', '16800', '200.00000000', '0.00140000', '1525948861', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1623', '3', '16800', '350.00000000', '0.00260000', '1525948861', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1624', '4', '16800', '440.00000000', '0.00320000', '1525948861', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1625', '25', '16800', '551.00000000', '0.00410000', '1525948861', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1626', '26', '16800', '50.00000000', '0.00030000', '1525948861', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1627', '27', '16800', '481.64000000', '0.00350000', '1525948861', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1628', '28', '16800', '30.00000000', '0.00020000', '1525948861', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1629', '29', '16800', '21.00000000', '0.00010000', '1525948861', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1630', '30', '16800', '88.00000000', '0.00060000', '1525948861', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1631', '34', '16800', '581.40000000', '0.00430000', '1525948861', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1632', '36', '16800', '350.00000000', '0.00260000', '1525948861', '1', '1526007966');
INSERT INTO `sys_fl_log` VALUES ('1633', '37', '16800', '1060.00000000', '0.00780000', '1525948861', '1', '1525958481');
INSERT INTO `sys_fl_log` VALUES ('1634', '39', '16800', '60.00000000', '0.00040000', '1525948861', '1', '1525955400');
INSERT INTO `sys_fl_log` VALUES ('1635', '40', '16800', '1000.00000000', '0.00740000', '1525948861', '1', '1526003422');
INSERT INTO `sys_fl_log` VALUES ('1636', '41', '16800', '1000.00000000', '0.00740000', '1525948861', '1', '1526006404');
INSERT INTO `sys_fl_log` VALUES ('1637', '42', '16800', '6356.00000000', '0.04720000', '1525948861', '1', '1526010025');
INSERT INTO `sys_fl_log` VALUES ('1638', '46', '16800', '50.00000000', '0.00030000', '1525948861', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1639', '51', '16800', '50.00000000', '0.00030000', '1525948861', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1640', '53', '16800', '50.00000000', '0.00030000', '1525948861', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1641', '54', '16800', '50.00000000', '0.00030000', '1525948861', '1', '1525961054');
INSERT INTO `sys_fl_log` VALUES ('1642', '55', '16800', '50.00000000', '0.00030000', '1525948861', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1643', '56', '16800', '50.00000000', '0.00030000', '1525948861', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1644', '57', '16800', '50.00000000', '0.00030000', '1525948861', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1645', '58', '16800', '50.00000000', '0.00030000', '1525948861', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1646', '59', '16800', '50.00000000', '0.00030000', '1525948861', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1647', '60', '16800', '50.00000000', '0.00030000', '1525948861', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1648', '61', '16800', '50.00000000', '0.00030000', '1525948861', '1', '1526009657');
INSERT INTO `sys_fl_log` VALUES ('1649', '62', '16800', '50.00000000', '0.00030000', '1525948861', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1650', '1', '16800', '111.00000000', '0.00080000', '1525948884', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1651', '2', '16800', '200.00000000', '0.00140000', '1525948884', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1652', '3', '16800', '350.00000000', '0.00260000', '1525948884', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1653', '4', '16800', '440.00000000', '0.00320000', '1525948884', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1654', '25', '16800', '551.00000000', '0.00410000', '1525948884', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1655', '26', '16800', '50.00000000', '0.00030000', '1525948884', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1656', '27', '16800', '481.64000000', '0.00350000', '1525948884', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1657', '28', '16800', '30.00000000', '0.00020000', '1525948884', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1658', '29', '16800', '21.00000000', '0.00010000', '1525948884', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1659', '30', '16800', '88.00000000', '0.00060000', '1525948884', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1660', '34', '16800', '581.40000000', '0.00430000', '1525948884', '1', '1526001014');
INSERT INTO `sys_fl_log` VALUES ('1661', '36', '16800', '350.00000000', '0.00260000', '1525948884', '1', '1526007965');
INSERT INTO `sys_fl_log` VALUES ('1662', '37', '16800', '1060.00000000', '0.00780000', '1525948884', '1', '1525958480');
INSERT INTO `sys_fl_log` VALUES ('1663', '39', '16800', '60.00000000', '0.00040000', '1525948884', '1', '1525955399');
INSERT INTO `sys_fl_log` VALUES ('1664', '40', '16800', '1000.00000000', '0.00740000', '1525948884', '1', '1526003419');
INSERT INTO `sys_fl_log` VALUES ('1665', '41', '16800', '1000.00000000', '0.00740000', '1525948884', '1', '1526006403');
INSERT INTO `sys_fl_log` VALUES ('1666', '42', '16800', '6356.00000000', '0.04720000', '1525948884', '1', '1526010022');
INSERT INTO `sys_fl_log` VALUES ('1667', '46', '16800', '50.00000000', '0.00030000', '1525948884', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1668', '51', '16800', '50.00000000', '0.00030000', '1525948884', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1669', '53', '16800', '50.00000000', '0.00030000', '1525948884', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1670', '54', '16800', '50.00000000', '0.00030000', '1525948884', '1', '1525961053');
INSERT INTO `sys_fl_log` VALUES ('1671', '55', '16800', '50.00000000', '0.00030000', '1525948884', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1672', '56', '16800', '50.00000000', '0.00030000', '1525948884', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1673', '57', '16800', '50.00000000', '0.00030000', '1525948884', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1674', '58', '16800', '50.00000000', '0.00030000', '1525948884', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1675', '59', '16800', '50.00000000', '0.00030000', '1525948884', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1676', '60', '16800', '50.00000000', '0.00030000', '1525948884', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1677', '61', '16800', '50.00000000', '0.00030000', '1525948884', '1', '1526009655');
INSERT INTO `sys_fl_log` VALUES ('1678', '62', '16800', '50.00000000', '0.00030000', '1525948884', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1679', '1', '16800', '111.00000000', '0.00080000', '1525957201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1680', '2', '16800', '200.00000000', '0.00140000', '1525957201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1681', '3', '16800', '350.00000000', '0.00260000', '1525957201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1682', '4', '16800', '440.00000000', '0.00320000', '1525957201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1683', '25', '16800', '551.00000000', '0.00410000', '1525957201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1684', '26', '16800', '50.00000000', '0.00030000', '1525957201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1685', '27', '16800', '481.64000000', '0.00350000', '1525957201', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1686', '28', '16800', '30.00000000', '0.00020000', '1525957201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1687', '29', '16800', '21.00000000', '0.00010000', '1525957201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1688', '30', '16800', '88.00000000', '0.00060000', '1525957201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1689', '34', '16800', '581.40000000', '0.00430000', '1525957201', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1690', '36', '16800', '350.00000000', '0.00260000', '1525957201', '1', '1526007964');
INSERT INTO `sys_fl_log` VALUES ('1691', '37', '16800', '1060.00000000', '0.00780000', '1525957201', '1', '1525958477');
INSERT INTO `sys_fl_log` VALUES ('1692', '39', '16800', '60.00000000', '0.00040000', '1525957201', '1', '1525974128');
INSERT INTO `sys_fl_log` VALUES ('1693', '40', '16800', '1000.00000000', '0.00740000', '1525957201', '1', '1526003419');
INSERT INTO `sys_fl_log` VALUES ('1694', '41', '16800', '1000.00000000', '0.00740000', '1525957201', '1', '1526006403');
INSERT INTO `sys_fl_log` VALUES ('1695', '42', '16800', '6356.00000000', '0.04720000', '1525957201', '1', '1526010023');
INSERT INTO `sys_fl_log` VALUES ('1696', '46', '16800', '50.00000000', '0.00030000', '1525957201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1697', '51', '16800', '50.00000000', '0.00030000', '1525957201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1698', '53', '16800', '50.00000000', '0.00030000', '1525957201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1699', '54', '16800', '50.00000000', '0.00030000', '1525957201', '1', '1525961052');
INSERT INTO `sys_fl_log` VALUES ('1700', '55', '16800', '50.00000000', '0.00030000', '1525957201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1701', '56', '16800', '50.00000000', '0.00030000', '1525957201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1702', '57', '16800', '50.00000000', '0.00030000', '1525957201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1703', '58', '16800', '50.00000000', '0.00030000', '1525957201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1704', '59', '16800', '50.00000000', '0.00030000', '1525957201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1705', '60', '16800', '50.00000000', '0.00030000', '1525957201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1706', '61', '16800', '50.00000000', '0.00030000', '1525957201', '1', '1526009654');
INSERT INTO `sys_fl_log` VALUES ('1707', '62', '16800', '50.00000000', '0.00030000', '1525957201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1708', '1', '16800', '111.00000000', '0.00080000', '1525968001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1709', '2', '16800', '200.00000000', '0.00140000', '1525968001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1710', '3', '16800', '350.00000000', '0.00260000', '1525968001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1711', '4', '16800', '440.00000000', '0.00320000', '1525968001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1712', '25', '16800', '551.00000000', '0.00410000', '1525968001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1713', '26', '16800', '50.00000000', '0.00030000', '1525968001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1714', '27', '16800', '481.64000000', '0.00350000', '1525968001', '1', '1526025023');
INSERT INTO `sys_fl_log` VALUES ('1715', '28', '16800', '30.00000000', '0.00020000', '1525968001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1716', '29', '16800', '21.00000000', '0.00010000', '1525968001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1717', '30', '16800', '88.00000000', '0.00060000', '1525968001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1718', '34', '16800', '581.40000000', '0.00430000', '1525968001', '1', '1526001032');
INSERT INTO `sys_fl_log` VALUES ('1719', '36', '16800', '350.00000000', '0.00260000', '1525968001', '1', '1526007964');
INSERT INTO `sys_fl_log` VALUES ('1720', '37', '16800', '1060.00000000', '0.00780000', '1525968001', '1', '1525997124');
INSERT INTO `sys_fl_log` VALUES ('1721', '39', '16800', '60.00000000', '0.00040000', '1525968001', '1', '1525974133');
INSERT INTO `sys_fl_log` VALUES ('1722', '40', '16800', '1000.00000000', '0.00740000', '1525968001', '1', '1526003418');
INSERT INTO `sys_fl_log` VALUES ('1723', '41', '16800', '1000.00000000', '0.00740000', '1525968001', '1', '1526006403');
INSERT INTO `sys_fl_log` VALUES ('1724', '42', '16800', '6356.00000000', '0.04720000', '1525968001', '1', '1526010023');
INSERT INTO `sys_fl_log` VALUES ('1725', '46', '16800', '50.00000000', '0.00030000', '1525968001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1726', '51', '16800', '50.00000000', '0.00030000', '1525968001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1727', '53', '16800', '50.00000000', '0.00030000', '1525968001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1728', '54', '16800', '50.00000000', '0.00030000', '1525968001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1729', '55', '16800', '50.00000000', '0.00030000', '1525968001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1730', '56', '16800', '50.00000000', '0.00030000', '1525968001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1731', '57', '16800', '50.00000000', '0.00030000', '1525968001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1732', '58', '16800', '50.00000000', '0.00030000', '1525968001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1733', '59', '16800', '50.00000000', '0.00030000', '1525968001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1734', '60', '16800', '50.00000000', '0.00030000', '1525968001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1735', '61', '16800', '50.00000000', '0.00030000', '1525968001', '1', '1526009654');
INSERT INTO `sys_fl_log` VALUES ('1736', '62', '16800', '50.00000000', '0.00030000', '1525968001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1737', '1', '16800', '111.00000000', '0.00080000', '1525978801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1738', '2', '16800', '200.00000000', '0.00140000', '1525978801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1739', '3', '16800', '350.00000000', '0.00260000', '1525978801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1740', '4', '16800', '440.00000000', '0.00320000', '1525978801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1741', '25', '16800', '551.00000000', '0.00410000', '1525978801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1742', '26', '16800', '50.00000000', '0.00030000', '1525978801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1743', '27', '16800', '481.64000000', '0.00350000', '1525978801', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1744', '28', '16800', '30.00000000', '0.00020000', '1525978801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1745', '29', '16800', '21.00000000', '0.00010000', '1525978801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1746', '30', '16800', '88.00000000', '0.00060000', '1525978801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1747', '34', '16800', '581.40000000', '0.00430000', '1525978801', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1748', '36', '16800', '350.00000000', '0.00260000', '1525978801', '1', '1526007963');
INSERT INTO `sys_fl_log` VALUES ('1749', '37', '16800', '1060.00000000', '0.00780000', '1525978801', '1', '1525997120');
INSERT INTO `sys_fl_log` VALUES ('1750', '39', '16800', '60.00000000', '0.00040000', '1525978801', '1', '1525994517');
INSERT INTO `sys_fl_log` VALUES ('1751', '40', '16800', '1000.00000000', '0.00740000', '1525978801', '1', '1526003417');
INSERT INTO `sys_fl_log` VALUES ('1752', '41', '16800', '1000.00000000', '0.00740000', '1525978801', '1', '1526006402');
INSERT INTO `sys_fl_log` VALUES ('1753', '42', '16800', '6356.00000000', '0.04720000', '1525978801', '1', '1526010024');
INSERT INTO `sys_fl_log` VALUES ('1754', '46', '16800', '50.00000000', '0.00030000', '1525978801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1755', '51', '16800', '50.00000000', '0.00030000', '1525978801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1756', '53', '16800', '50.00000000', '0.00030000', '1525978801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1757', '54', '16800', '50.00000000', '0.00030000', '1525978801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1758', '55', '16800', '50.00000000', '0.00030000', '1525978801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1759', '56', '16800', '50.00000000', '0.00030000', '1525978801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1760', '57', '16800', '50.00000000', '0.00030000', '1525978801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1761', '58', '16800', '50.00000000', '0.00030000', '1525978801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1762', '59', '16800', '50.00000000', '0.00030000', '1525978801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1763', '60', '16800', '50.00000000', '0.00030000', '1525978801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1764', '61', '16800', '50.00000000', '0.00030000', '1525978801', '1', '1526009652');
INSERT INTO `sys_fl_log` VALUES ('1765', '62', '16800', '50.00000000', '0.00030000', '1525978801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1766', '1', '16800', '111.00000000', '0.00080000', '1525989601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1767', '2', '16800', '200.00000000', '0.00140000', '1525989601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1768', '3', '16800', '350.00000000', '0.00260000', '1525989601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1769', '4', '16800', '440.00000000', '0.00320000', '1525989601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1770', '25', '16800', '551.00000000', '0.00410000', '1525989601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1771', '26', '16800', '50.00000000', '0.00030000', '1525989601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1772', '27', '16800', '481.64000000', '0.00350000', '1525989601', '1', '1526027291');
INSERT INTO `sys_fl_log` VALUES ('1773', '28', '16800', '30.00000000', '0.00020000', '1525989601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1774', '29', '16800', '21.00000000', '0.00010000', '1525989601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1775', '30', '16800', '88.00000000', '0.00060000', '1525989601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1776', '34', '16800', '581.40000000', '0.00430000', '1525989601', '1', '1526001029');
INSERT INTO `sys_fl_log` VALUES ('1777', '36', '16800', '350.00000000', '0.00260000', '1525989601', '1', '1526007962');
INSERT INTO `sys_fl_log` VALUES ('1778', '37', '16800', '1060.00000000', '0.00780000', '1525989601', '1', '1525997122');
INSERT INTO `sys_fl_log` VALUES ('1779', '39', '16800', '60.00000000', '0.00040000', '1525989601', '1', '1525994519');
INSERT INTO `sys_fl_log` VALUES ('1780', '40', '16800', '1000.00000000', '0.00740000', '1525989601', '1', '1526003415');
INSERT INTO `sys_fl_log` VALUES ('1781', '41', '16800', '1000.00000000', '0.00740000', '1525989601', '1', '1526006402');
INSERT INTO `sys_fl_log` VALUES ('1782', '42', '16800', '6356.00000000', '0.04720000', '1525989601', '1', '1526010022');
INSERT INTO `sys_fl_log` VALUES ('1783', '46', '16800', '50.00000000', '0.00030000', '1525989601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1784', '51', '16800', '50.00000000', '0.00030000', '1525989601', '1', '1526003682');
INSERT INTO `sys_fl_log` VALUES ('1785', '53', '16800', '50.00000000', '0.00030000', '1525989601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1786', '54', '16800', '50.00000000', '0.00030000', '1525989601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1787', '55', '16800', '50.00000000', '0.00030000', '1525989601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1788', '56', '16800', '50.00000000', '0.00030000', '1525989601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1789', '57', '16800', '50.00000000', '0.00030000', '1525989601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1790', '58', '16800', '50.00000000', '0.00030000', '1525989601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1791', '59', '16800', '50.00000000', '0.00030000', '1525989601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1792', '60', '16800', '50.00000000', '0.00030000', '1525989601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1793', '61', '16800', '50.00000000', '0.00030000', '1525989601', '1', '1526009650');
INSERT INTO `sys_fl_log` VALUES ('1794', '62', '16800', '50.00000000', '0.00030000', '1525989601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1795', '1', '16800', '111.00000000', '0.00080000', '1526000401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1796', '2', '16800', '200.00000000', '0.00140000', '1526000401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1797', '3', '16800', '350.00000000', '0.00260000', '1526000401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1798', '4', '16800', '440.00000000', '0.00320000', '1526000401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1799', '25', '16800', '551.00000000', '0.00410000', '1526000401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1800', '26', '16800', '50.00000000', '0.00030000', '1526000401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1801', '27', '16800', '481.64000000', '0.00350000', '1526000401', '1', '1526025025');
INSERT INTO `sys_fl_log` VALUES ('1802', '28', '16800', '30.00000000', '0.00020000', '1526000401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1803', '29', '16800', '21.00000000', '0.00010000', '1526000401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1804', '30', '16800', '88.00000000', '0.00060000', '1526000401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1805', '34', '16800', '581.40000000', '0.00430000', '1526000401', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1806', '36', '16800', '350.00000000', '0.00260000', '1526000401', '1', '1526007961');
INSERT INTO `sys_fl_log` VALUES ('1807', '37', '16800', '1060.00000000', '0.00780000', '1526000401', '1', '1526018179');
INSERT INTO `sys_fl_log` VALUES ('1808', '39', '16800', '60.00000000', '0.00040000', '1526000401', '1', '1526000991');
INSERT INTO `sys_fl_log` VALUES ('1809', '40', '16800', '1000.00000000', '0.00740000', '1526000401', '1', '1526003414');
INSERT INTO `sys_fl_log` VALUES ('1810', '41', '16800', '1000.00000000', '0.00740000', '1526000401', '1', '1526006401');
INSERT INTO `sys_fl_log` VALUES ('1811', '42', '16800', '6356.00000000', '0.04720000', '1526000401', '1', '1526010024');
INSERT INTO `sys_fl_log` VALUES ('1812', '46', '16800', '50.00000000', '0.00030000', '1526000401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1813', '51', '16800', '50.00000000', '0.00030000', '1526000401', '1', '1526003681');
INSERT INTO `sys_fl_log` VALUES ('1814', '53', '16800', '50.00000000', '0.00030000', '1526000401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1815', '54', '16800', '50.00000000', '0.00030000', '1526000401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1816', '55', '16800', '50.00000000', '0.00030000', '1526000401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1817', '56', '16800', '50.00000000', '0.00030000', '1526000401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1818', '57', '16800', '50.00000000', '0.00030000', '1526000401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1819', '58', '16800', '50.00000000', '0.00030000', '1526000401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1820', '59', '16800', '50.00000000', '0.00030000', '1526000401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1821', '60', '16800', '50.00000000', '0.00030000', '1526000401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1822', '61', '16800', '50.00000000', '0.00030000', '1526000401', '1', '1526009649');
INSERT INTO `sys_fl_log` VALUES ('1823', '62', '16800', '50.00000000', '0.00030000', '1526000401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1824', '1', '18000', '111.00000000', '0.00070000', '1526011201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1825', '2', '18000', '200.00000000', '0.00130000', '1526011201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1826', '3', '18000', '350.00000000', '0.00240000', '1526011201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1827', '4', '18000', '440.00000000', '0.00300000', '1526011201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1828', '25', '18000', '551.00000000', '0.00380000', '1526011201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1829', '26', '18000', '50.00000000', '0.00030000', '1526011201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1830', '27', '18000', '481.64000000', '0.00330000', '1526011201', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1831', '28', '18000', '30.00000000', '0.00020000', '1526011201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1832', '29', '18000', '21.00000000', '0.00010000', '1526011201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1833', '30', '18000', '88.00000000', '0.00060000', '1526011201', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1834', '34', '18000', '581.40000000', '0.00400000', '1526011201', '1', '1526087183');
INSERT INTO `sys_fl_log` VALUES ('1835', '36', '18000', '350.00000000', '0.00240000', '1526011201', '1', '1526024357');
INSERT INTO `sys_fl_log` VALUES ('1836', '37', '18000', '1060.00000000', '0.00730000', '1526011201', '1', '1526018177');
INSERT INTO `sys_fl_log` VALUES ('1837', '39', '18000', '60.00000000', '0.00040000', '1526011201', '1', '1526021721');
INSERT INTO `sys_fl_log` VALUES ('1838', '40', '18000', '1000.00000000', '0.00690000', '1526011201', '1', '1526011244');
INSERT INTO `sys_fl_log` VALUES ('1839', '41', '18000', '1000.00000000', '0.00690000', '1526011202', '1', '1526011617');
INSERT INTO `sys_fl_log` VALUES ('1840', '42', '18000', '6356.00000000', '0.04410000', '1526011202', '1', '1526092258');
INSERT INTO `sys_fl_log` VALUES ('1841', '46', '18000', '50.00000000', '0.00030000', '1526011202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1842', '51', '18000', '50.00000000', '0.00030000', '1526011202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1843', '53', '18000', '50.00000000', '0.00030000', '1526011202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1844', '54', '18000', '50.00000000', '0.00030000', '1526011202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1845', '55', '18000', '50.00000000', '0.00030000', '1526011202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1846', '56', '18000', '50.00000000', '0.00030000', '1526011202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1847', '57', '18000', '50.00000000', '0.00030000', '1526011202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1848', '58', '18000', '50.00000000', '0.00030000', '1526011202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1849', '59', '18000', '50.00000000', '0.00030000', '1526011202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1850', '60', '18000', '50.00000000', '0.00030000', '1526011202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1851', '61', '18000', '50.00000000', '0.00030000', '1526011202', '1', '1526034473');
INSERT INTO `sys_fl_log` VALUES ('1852', '62', '18000', '50.00000000', '0.00030000', '1526011202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1853', '63', '18000', '50.00000000', '0.00030000', '1526011202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1854', '64', '18000', '50.00000000', '0.00030000', '1526011202', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1855', '65', '18000', '50.00000000', '0.00030000', '1526011202', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1856', '1', '18400', '111.00000000', '0.00070000', '1526022001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1857', '2', '18400', '200.00000000', '0.00130000', '1526022001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1858', '3', '18400', '350.00000000', '0.00230000', '1526022001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1859', '4', '18400', '440.00000000', '0.00290000', '1526022001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1860', '25', '18400', '551.00000000', '0.00370000', '1526022001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1861', '26', '18400', '50.00000000', '0.00030000', '1526022001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1862', '27', '18400', '481.64000000', '0.00320000', '1526022001', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1863', '28', '18400', '30.00000000', '0.00020000', '1526022001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1864', '29', '18400', '21.00000000', '0.00010000', '1526022001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1865', '30', '18400', '88.00000000', '0.00060000', '1526022001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1866', '31', '18400', '50.00000000', '0.00030000', '1526022001', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1867', '34', '18400', '581.40000000', '0.00390000', '1526022001', '1', '1526087187');
INSERT INTO `sys_fl_log` VALUES ('1868', '36', '18400', '350.00000000', '0.00230000', '1526022001', '1', '1526024351');
INSERT INTO `sys_fl_log` VALUES ('1869', '37', '18400', '1060.00000000', '0.00720000', '1526022001', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1870', '39', '18400', '60.00000000', '0.00040000', '1526022001', '1', '1526024258');
INSERT INTO `sys_fl_log` VALUES ('1871', '40', '18400', '1000.00000000', '0.00670000', '1526022001', '1', '1526103622');
INSERT INTO `sys_fl_log` VALUES ('1872', '41', '18400', '1000.00000000', '0.00670000', '1526022001', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1873', '42', '18400', '6356.00000000', '0.04310000', '1526022001', '1', '1526092252');
INSERT INTO `sys_fl_log` VALUES ('1874', '46', '18400', '50.00000000', '0.00030000', '1526022001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1875', '51', '18400', '50.00000000', '0.00030000', '1526022001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1876', '53', '18400', '50.00000000', '0.00030000', '1526022001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1877', '54', '18400', '50.00000000', '0.00030000', '1526022001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1878', '55', '18400', '50.00000000', '0.00030000', '1526022001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1879', '56', '18400', '50.00000000', '0.00030000', '1526022001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1880', '57', '18400', '50.00000000', '0.00030000', '1526022001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1881', '58', '18400', '50.00000000', '0.00030000', '1526022001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1882', '59', '18400', '50.00000000', '0.00030000', '1526022001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1883', '60', '18400', '50.00000000', '0.00030000', '1526022001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1884', '61', '18400', '50.00000000', '0.00030000', '1526022001', '1', '1526034471');
INSERT INTO `sys_fl_log` VALUES ('1885', '62', '18400', '50.00000000', '0.00030000', '1526022001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1886', '63', '18400', '50.00000000', '0.00030000', '1526022001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1887', '64', '18400', '50.00000000', '0.00030000', '1526022001', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1888', '65', '18400', '50.00000000', '0.00030000', '1526022001', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1889', '66', '18400', '50.00000000', '0.00030000', '1526022001', '1', '1526028881');
INSERT INTO `sys_fl_log` VALUES ('1890', '1', '18400', '111.00000000', '0.00070000', '1526032801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1891', '2', '18400', '200.00000000', '0.00130000', '1526032801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1892', '3', '18400', '350.00000000', '0.00230000', '1526032801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1893', '4', '18400', '440.00000000', '0.00290000', '1526032801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1894', '25', '18400', '551.00000000', '0.00370000', '1526032801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1895', '26', '18400', '50.00000000', '0.00030000', '1526032801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1896', '27', '18400', '481.64000000', '0.00320000', '1526032801', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1897', '28', '18400', '30.00000000', '0.00020000', '1526032801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1898', '29', '18400', '21.00000000', '0.00010000', '1526032801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1899', '30', '18400', '88.00000000', '0.00060000', '1526032801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1900', '31', '18400', '50.00000000', '0.00030000', '1526032801', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1901', '34', '18400', '581.40000000', '0.00390000', '1526032801', '1', '1526087187');
INSERT INTO `sys_fl_log` VALUES ('1902', '36', '18400', '350.00000000', '0.00230000', '1526032801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1903', '37', '18400', '1060.00000000', '0.00720000', '1526032801', '1', '1526113705');
INSERT INTO `sys_fl_log` VALUES ('1904', '39', '18400', '60.00000000', '0.00040000', '1526032801', '1', '1526033506');
INSERT INTO `sys_fl_log` VALUES ('1905', '40', '18400', '1000.00000000', '0.00670000', '1526032801', '1', '1526103619');
INSERT INTO `sys_fl_log` VALUES ('1906', '41', '18400', '1000.00000000', '0.00670000', '1526032801', '1', '1526110423');
INSERT INTO `sys_fl_log` VALUES ('1907', '42', '18400', '6356.00000000', '0.04310000', '1526032801', '1', '1526092255');
INSERT INTO `sys_fl_log` VALUES ('1908', '46', '18400', '50.00000000', '0.00030000', '1526032801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1909', '51', '18400', '50.00000000', '0.00030000', '1526032801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1910', '53', '18400', '50.00000000', '0.00030000', '1526032801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1911', '54', '18400', '50.00000000', '0.00030000', '1526032801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1912', '55', '18400', '50.00000000', '0.00030000', '1526032801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1913', '56', '18400', '50.00000000', '0.00030000', '1526032801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1914', '57', '18400', '50.00000000', '0.00030000', '1526032801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1915', '58', '18400', '50.00000000', '0.00030000', '1526032801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1916', '59', '18400', '50.00000000', '0.00030000', '1526032801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1917', '60', '18400', '50.00000000', '0.00030000', '1526032801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1918', '61', '18400', '50.00000000', '0.00030000', '1526032801', '1', '1526034472');
INSERT INTO `sys_fl_log` VALUES ('1919', '62', '18400', '50.00000000', '0.00030000', '1526032801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1920', '63', '18400', '50.00000000', '0.00030000', '1526032801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1921', '64', '18400', '50.00000000', '0.00030000', '1526032801', '1', '1526111117');
INSERT INTO `sys_fl_log` VALUES ('1922', '65', '18400', '50.00000000', '0.00030000', '1526032801', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1923', '66', '18400', '50.00000000', '0.00030000', '1526032801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1924', '1', '18400', '111.00000000', '0.00070000', '1526043602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1925', '2', '18400', '200.00000000', '0.00130000', '1526043602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1926', '3', '18400', '350.00000000', '0.00230000', '1526043602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1927', '4', '18400', '440.00000000', '0.00290000', '1526043602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1928', '25', '18400', '551.00000000', '0.00370000', '1526043602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1929', '26', '18400', '50.00000000', '0.00030000', '1526043602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1930', '27', '18400', '481.64000000', '0.00320000', '1526043602', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1931', '28', '18400', '30.00000000', '0.00020000', '1526043602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1932', '29', '18400', '21.00000000', '0.00010000', '1526043602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1933', '30', '18400', '88.00000000', '0.00060000', '1526043602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1934', '31', '18400', '50.00000000', '0.00030000', '1526043602', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1935', '34', '18400', '581.40000000', '0.00390000', '1526043602', '1', '1526087185');
INSERT INTO `sys_fl_log` VALUES ('1936', '36', '18400', '350.00000000', '0.00230000', '1526043602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1937', '37', '18400', '1060.00000000', '0.00720000', '1526043602', '1', '1526113700');
INSERT INTO `sys_fl_log` VALUES ('1938', '39', '18400', '60.00000000', '0.00040000', '1526043602', '1', '1526054408');
INSERT INTO `sys_fl_log` VALUES ('1939', '40', '18400', '1000.00000000', '0.00670000', '1526043602', '1', '1526103620');
INSERT INTO `sys_fl_log` VALUES ('1940', '41', '18400', '1000.00000000', '0.00670000', '1526043602', '1', '1526110420');
INSERT INTO `sys_fl_log` VALUES ('1941', '42', '18400', '6356.00000000', '0.04310000', '1526043602', '1', '1526092255');
INSERT INTO `sys_fl_log` VALUES ('1942', '46', '18400', '50.00000000', '0.00030000', '1526043602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1943', '51', '18400', '50.00000000', '0.00030000', '1526043602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1944', '53', '18400', '50.00000000', '0.00030000', '1526043602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1945', '54', '18400', '50.00000000', '0.00030000', '1526043602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1946', '55', '18400', '50.00000000', '0.00030000', '1526043602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1947', '56', '18400', '50.00000000', '0.00030000', '1526043602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1948', '57', '18400', '50.00000000', '0.00030000', '1526043602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1949', '58', '18400', '50.00000000', '0.00030000', '1526043602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1950', '59', '18400', '50.00000000', '0.00030000', '1526043602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1951', '60', '18400', '50.00000000', '0.00030000', '1526043602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1952', '61', '18400', '50.00000000', '0.00030000', '1526043602', '1', '1526110900');
INSERT INTO `sys_fl_log` VALUES ('1953', '62', '18400', '50.00000000', '0.00030000', '1526043602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1954', '63', '18400', '50.00000000', '0.00030000', '1526043602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1955', '64', '18400', '50.00000000', '0.00030000', '1526043602', '1', '1526111120');
INSERT INTO `sys_fl_log` VALUES ('1956', '65', '18400', '50.00000000', '0.00030000', '1526043602', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1957', '66', '18400', '50.00000000', '0.00030000', '1526043602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1958', '1', '18400', '111.00000000', '0.00070000', '1526054401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1959', '2', '18400', '200.00000000', '0.00130000', '1526054401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1960', '3', '18400', '350.00000000', '0.00230000', '1526054401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1961', '4', '18400', '440.00000000', '0.00290000', '1526054401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1962', '25', '18400', '551.00000000', '0.00370000', '1526054401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1963', '26', '18400', '50.00000000', '0.00030000', '1526054401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1964', '27', '18400', '481.64000000', '0.00320000', '1526054401', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1965', '28', '18400', '30.00000000', '0.00020000', '1526054401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1966', '29', '18400', '21.00000000', '0.00010000', '1526054401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1967', '30', '18400', '88.00000000', '0.00060000', '1526054401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1968', '31', '18400', '50.00000000', '0.00030000', '1526054401', '1', '1526138550');
INSERT INTO `sys_fl_log` VALUES ('1969', '34', '18400', '581.40000000', '0.00390000', '1526054401', '1', '1526087186');
INSERT INTO `sys_fl_log` VALUES ('1970', '36', '18400', '350.00000000', '0.00230000', '1526054401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1971', '37', '18400', '1060.00000000', '0.00720000', '1526054401', '1', '1526113701');
INSERT INTO `sys_fl_log` VALUES ('1972', '39', '18400', '60.00000000', '0.00040000', '1526054401', '1', '1526054409');
INSERT INTO `sys_fl_log` VALUES ('1973', '40', '18400', '1000.00000000', '0.00670000', '1526054401', '1', '1526103621');
INSERT INTO `sys_fl_log` VALUES ('1974', '41', '18400', '1000.00000000', '0.00670000', '1526054401', '1', '1526110420');
INSERT INTO `sys_fl_log` VALUES ('1975', '42', '18400', '6356.00000000', '0.04310000', '1526054401', '1', '1526092257');
INSERT INTO `sys_fl_log` VALUES ('1976', '46', '18400', '50.00000000', '0.00030000', '1526054401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1977', '51', '18400', '50.00000000', '0.00030000', '1526054401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1978', '53', '18400', '50.00000000', '0.00030000', '1526054401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1979', '54', '18400', '50.00000000', '0.00030000', '1526054401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1980', '55', '18400', '50.00000000', '0.00030000', '1526054401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1981', '56', '18400', '50.00000000', '0.00030000', '1526054401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1982', '57', '18400', '50.00000000', '0.00030000', '1526054401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1983', '58', '18400', '50.00000000', '0.00030000', '1526054401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1984', '59', '18400', '50.00000000', '0.00030000', '1526054401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1985', '60', '18400', '50.00000000', '0.00030000', '1526054401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1986', '61', '18400', '50.00000000', '0.00030000', '1526054401', '1', '1526110904');
INSERT INTO `sys_fl_log` VALUES ('1987', '62', '18400', '50.00000000', '0.00030000', '1526054401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1988', '63', '18400', '50.00000000', '0.00030000', '1526054401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1989', '64', '18400', '50.00000000', '0.00030000', '1526054401', '1', '1526111119');
INSERT INTO `sys_fl_log` VALUES ('1990', '65', '18400', '50.00000000', '0.00030000', '1526054401', '1', '1526138038');
INSERT INTO `sys_fl_log` VALUES ('1991', '66', '18400', '50.00000000', '0.00030000', '1526054401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1992', '1', '18400', '111.00000000', '0.00070000', '1526065202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1993', '2', '18400', '200.00000000', '0.00130000', '1526065202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1994', '3', '18400', '350.00000000', '0.00230000', '1526065202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1995', '4', '18400', '440.00000000', '0.00290000', '1526065202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1996', '25', '18400', '551.00000000', '0.00370000', '1526065202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1997', '26', '18400', '50.00000000', '0.00030000', '1526065202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('1998', '27', '18400', '481.64000000', '0.00320000', '1526065202', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('1999', '28', '18400', '30.00000000', '0.00020000', '1526065202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2000', '29', '18400', '21.00000000', '0.00010000', '1526065202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2001', '30', '18400', '88.00000000', '0.00060000', '1526065202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2002', '31', '18400', '50.00000000', '0.00030000', '1526065202', '1', '1526138551');
INSERT INTO `sys_fl_log` VALUES ('2003', '34', '18400', '581.40000000', '0.00390000', '1526065202', '1', '1526087188');
INSERT INTO `sys_fl_log` VALUES ('2004', '36', '18400', '350.00000000', '0.00230000', '1526065202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2005', '37', '18400', '1060.00000000', '0.00720000', '1526065202', '1', '1526113704');
INSERT INTO `sys_fl_log` VALUES ('2006', '39', '18400', '60.00000000', '0.00040000', '1526065202', '1', '1526086969');
INSERT INTO `sys_fl_log` VALUES ('2007', '40', '18400', '1000.00000000', '0.00670000', '1526065202', '1', '1526103622');
INSERT INTO `sys_fl_log` VALUES ('2008', '41', '18400', '1000.00000000', '0.00670000', '1526065202', '1', '1526110422');
INSERT INTO `sys_fl_log` VALUES ('2009', '42', '18400', '6356.00000000', '0.04310000', '1526065202', '1', '1526092254');
INSERT INTO `sys_fl_log` VALUES ('2010', '46', '18400', '50.00000000', '0.00030000', '1526065202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2011', '51', '18400', '50.00000000', '0.00030000', '1526065202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2012', '53', '18400', '50.00000000', '0.00030000', '1526065202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2013', '54', '18400', '50.00000000', '0.00030000', '1526065202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2014', '55', '18400', '50.00000000', '0.00030000', '1526065202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2015', '56', '18400', '50.00000000', '0.00030000', '1526065202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2016', '57', '18400', '50.00000000', '0.00030000', '1526065202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2017', '58', '18400', '50.00000000', '0.00030000', '1526065202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2018', '59', '18400', '50.00000000', '0.00030000', '1526065202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2019', '60', '18400', '50.00000000', '0.00030000', '1526065202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2020', '61', '18400', '50.00000000', '0.00030000', '1526065202', '1', '1526110903');
INSERT INTO `sys_fl_log` VALUES ('2021', '62', '18400', '50.00000000', '0.00030000', '1526065202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2022', '63', '18400', '50.00000000', '0.00030000', '1526065202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2023', '64', '18400', '50.00000000', '0.00030000', '1526065202', '1', '1526111118');
INSERT INTO `sys_fl_log` VALUES ('2024', '65', '18400', '50.00000000', '0.00030000', '1526065202', '1', '1526138041');
INSERT INTO `sys_fl_log` VALUES ('2025', '66', '18400', '50.00000000', '0.00030000', '1526065202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2026', '1', '18400', '111.00000000', '0.00070000', '1526076001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2027', '2', '18400', '200.00000000', '0.00130000', '1526076001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2028', '3', '18400', '350.00000000', '0.00230000', '1526076001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2029', '4', '18400', '440.00000000', '0.00290000', '1526076001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2030', '25', '18400', '551.00000000', '0.00370000', '1526076001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2031', '26', '18400', '50.00000000', '0.00030000', '1526076001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2032', '27', '18400', '481.64000000', '0.00320000', '1526076001', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('2033', '28', '18400', '30.00000000', '0.00020000', '1526076001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2034', '29', '18400', '21.00000000', '0.00010000', '1526076001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2035', '30', '18400', '88.00000000', '0.00060000', '1526076001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2036', '31', '18400', '50.00000000', '0.00030000', '1526076001', '1', '1526138550');
INSERT INTO `sys_fl_log` VALUES ('2037', '34', '18400', '581.40000000', '0.00390000', '1526076001', '1', '1526087185');
INSERT INTO `sys_fl_log` VALUES ('2038', '36', '18400', '350.00000000', '0.00230000', '1526076001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2039', '37', '18400', '1060.00000000', '0.00720000', '1526076001', '1', '1526113705');
INSERT INTO `sys_fl_log` VALUES ('2040', '39', '18400', '60.00000000', '0.00040000', '1526076001', '1', '1526086971');
INSERT INTO `sys_fl_log` VALUES ('2041', '40', '18400', '1000.00000000', '0.00670000', '1526076001', '1', '1526103620');
INSERT INTO `sys_fl_log` VALUES ('2042', '41', '18400', '1000.00000000', '0.00670000', '1526076001', '1', '1526110423');
INSERT INTO `sys_fl_log` VALUES ('2043', '42', '18400', '6356.00000000', '0.04310000', '1526076001', '1', '1526092256');
INSERT INTO `sys_fl_log` VALUES ('2044', '46', '18400', '50.00000000', '0.00030000', '1526076001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2045', '51', '18400', '50.00000000', '0.00030000', '1526076001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2046', '53', '18400', '50.00000000', '0.00030000', '1526076001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2047', '54', '18400', '50.00000000', '0.00030000', '1526076001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2048', '55', '18400', '50.00000000', '0.00030000', '1526076001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2049', '56', '18400', '50.00000000', '0.00030000', '1526076001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2050', '57', '18400', '50.00000000', '0.00030000', '1526076001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2051', '58', '18400', '50.00000000', '0.00030000', '1526076001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2052', '59', '18400', '50.00000000', '0.00030000', '1526076001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2053', '60', '18400', '50.00000000', '0.00030000', '1526076001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2054', '61', '18400', '50.00000000', '0.00030000', '1526076001', '1', '1526110902');
INSERT INTO `sys_fl_log` VALUES ('2055', '62', '18400', '50.00000000', '0.00030000', '1526076001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2056', '63', '18400', '50.00000000', '0.00030000', '1526076001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2057', '64', '18400', '50.00000000', '0.00030000', '1526076001', '1', '1526111117');
INSERT INTO `sys_fl_log` VALUES ('2058', '65', '18400', '50.00000000', '0.00030000', '1526076001', '1', '1526138040');
INSERT INTO `sys_fl_log` VALUES ('2059', '66', '18400', '50.00000000', '0.00030000', '1526076001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2060', '1', '18400', '111.00000000', '0.00070000', '1526086801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2061', '2', '18400', '200.00000000', '0.00130000', '1526086801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2062', '3', '18400', '350.00000000', '0.00230000', '1526086801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2063', '4', '18400', '440.00000000', '0.00290000', '1526086801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2064', '25', '18400', '551.00000000', '0.00370000', '1526086801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2065', '26', '18400', '50.00000000', '0.00030000', '1526086802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2066', '27', '18400', '481.64000000', '0.00320000', '1526086802', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('2067', '28', '18400', '30.00000000', '0.00020000', '1526086802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2068', '29', '18400', '21.00000000', '0.00010000', '1526086802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2069', '30', '18400', '88.00000000', '0.00060000', '1526086802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2070', '31', '18400', '50.00000000', '0.00030000', '1526086802', '1', '1526138549');
INSERT INTO `sys_fl_log` VALUES ('2071', '34', '18400', '581.40000000', '0.00390000', '1526086802', '1', '1526087187');
INSERT INTO `sys_fl_log` VALUES ('2072', '36', '18400', '350.00000000', '0.00230000', '1526086802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2073', '37', '18400', '1060.00000000', '0.00720000', '1526086802', '1', '1526113702');
INSERT INTO `sys_fl_log` VALUES ('2074', '39', '18400', '60.00000000', '0.00040000', '1526086802', '1', '1526086970');
INSERT INTO `sys_fl_log` VALUES ('2075', '40', '18400', '1000.00000000', '0.00670000', '1526086802', '1', '1526103621');
INSERT INTO `sys_fl_log` VALUES ('2076', '41', '18400', '1000.00000000', '0.00670000', '1526086802', '1', '1526110421');
INSERT INTO `sys_fl_log` VALUES ('2077', '42', '18400', '6356.00000000', '0.04310000', '1526086802', '1', '1526092253');
INSERT INTO `sys_fl_log` VALUES ('2078', '46', '18400', '50.00000000', '0.00030000', '1526086802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2079', '51', '18400', '50.00000000', '0.00030000', '1526086802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2080', '53', '18400', '50.00000000', '0.00030000', '1526086802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2081', '54', '18400', '50.00000000', '0.00030000', '1526086802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2082', '55', '18400', '50.00000000', '0.00030000', '1526086802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2083', '56', '18400', '50.00000000', '0.00030000', '1526086802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2084', '57', '18400', '50.00000000', '0.00030000', '1526086802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2085', '58', '18400', '50.00000000', '0.00030000', '1526086802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2086', '59', '18400', '50.00000000', '0.00030000', '1526086802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2087', '60', '18400', '50.00000000', '0.00030000', '1526086802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2088', '61', '18400', '50.00000000', '0.00030000', '1526086802', '1', '1526110901');
INSERT INTO `sys_fl_log` VALUES ('2089', '62', '18400', '50.00000000', '0.00030000', '1526086802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2090', '63', '18400', '50.00000000', '0.00030000', '1526086802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2091', '64', '18400', '50.00000000', '0.00030000', '1526086802', '1', '1526111120');
INSERT INTO `sys_fl_log` VALUES ('2092', '65', '18400', '50.00000000', '0.00030000', '1526086802', '1', '1526138037');
INSERT INTO `sys_fl_log` VALUES ('2093', '66', '18400', '50.00000000', '0.00030000', '1526086802', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2094', '1', '18800', '111.00000000', '0.00070000', '1526097602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2095', '2', '18800', '200.00000000', '0.00130000', '1526097602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2096', '3', '18800', '350.00000000', '0.00230000', '1526097602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2097', '4', '18800', '440.00000000', '0.00290000', '1526097602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2098', '25', '18800', '551.00000000', '0.00360000', '1526097602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2099', '26', '18800', '50.00000000', '0.00030000', '1526097602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2100', '27', '18800', '481.64000000', '0.00320000', '1526097602', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('2101', '28', '18800', '30.00000000', '0.00020000', '1526097602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2102', '29', '18800', '21.00000000', '0.00010000', '1526097602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2103', '30', '18800', '88.00000000', '0.00050000', '1526097602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2104', '31', '18800', '50.00000000', '0.00030000', '1526097602', '1', '1526138549');
INSERT INTO `sys_fl_log` VALUES ('2105', '34', '18800', '581.40000000', '0.00380000', '1526097602', '1', '1526178211');
INSERT INTO `sys_fl_log` VALUES ('2106', '36', '18800', '350.00000000', '0.00230000', '1526097602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2107', '37', '18800', '1060.00000000', '0.00700000', '1526097602', '1', '1526113703');
INSERT INTO `sys_fl_log` VALUES ('2108', '39', '18800', '60.00000000', '0.00040000', '1526097602', '1', '1526106185');
INSERT INTO `sys_fl_log` VALUES ('2109', '40', '18800', '1000.00000000', '0.00660000', '1526097602', '1', '1526103619');
INSERT INTO `sys_fl_log` VALUES ('2110', '41', '18800', '1000.00000000', '0.00660000', '1526097602', '1', '1526110422');
INSERT INTO `sys_fl_log` VALUES ('2111', '42', '18800', '6356.00000000', '0.04220000', '1526097602', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('2112', '46', '18800', '50.00000000', '0.00030000', '1526097602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2113', '51', '18800', '50.00000000', '0.00030000', '1526097602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2114', '53', '18800', '50.00000000', '0.00030000', '1526097602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2115', '54', '18800', '50.00000000', '0.00030000', '1526097602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2116', '55', '18800', '50.00000000', '0.00030000', '1526097602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2117', '56', '18800', '50.00000000', '0.00030000', '1526097602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2118', '57', '18800', '50.00000000', '0.00030000', '1526097602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2119', '58', '18800', '50.00000000', '0.00030000', '1526097602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2120', '59', '18800', '50.00000000', '0.00030000', '1526097602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2121', '60', '18800', '50.00000000', '0.00030000', '1526097602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2122', '61', '18800', '50.00000000', '0.00030000', '1526097602', '1', '1526110905');
INSERT INTO `sys_fl_log` VALUES ('2123', '62', '18800', '50.00000000', '0.00030000', '1526097602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2124', '63', '18800', '50.00000000', '0.00030000', '1526097602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2125', '64', '18800', '50.00000000', '0.00030000', '1526097602', '1', '1526111119');
INSERT INTO `sys_fl_log` VALUES ('2126', '65', '18800', '50.00000000', '0.00030000', '1526097602', '1', '1526138039');
INSERT INTO `sys_fl_log` VALUES ('2127', '66', '18800', '50.00000000', '0.00030000', '1526097602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2128', '67', '18800', '50.00000000', '0.00030000', '1526097602', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2129', '1', '18800', '111.00000000', '0.00070000', '1526108401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2130', '2', '18800', '200.00000000', '0.00130000', '1526108401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2131', '3', '18800', '350.00000000', '0.00230000', '1526108401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2132', '4', '18800', '440.00000000', '0.00290000', '1526108401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2133', '25', '18800', '551.00000000', '0.00360000', '1526108401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2134', '26', '18800', '50.00000000', '0.00030000', '1526108401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2135', '27', '18800', '481.64000000', '0.00320000', '1526108401', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('2136', '28', '18800', '30.00000000', '0.00020000', '1526108401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2137', '29', '18800', '21.00000000', '0.00010000', '1526108401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2138', '30', '18800', '88.00000000', '0.00050000', '1526108401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2139', '31', '18800', '50.00000000', '0.00030000', '1526108401', '1', '1526138553');
INSERT INTO `sys_fl_log` VALUES ('2140', '34', '18800', '581.40000000', '0.00380000', '1526108401', '1', '1526178214');
INSERT INTO `sys_fl_log` VALUES ('2141', '36', '18800', '350.00000000', '0.00230000', '1526108401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2142', '37', '18800', '1060.00000000', '0.00700000', '1526108401', '1', '1526113699');
INSERT INTO `sys_fl_log` VALUES ('2143', '39', '18800', '60.00000000', '0.00040000', '1526108401', '1', '1526109018');
INSERT INTO `sys_fl_log` VALUES ('2144', '40', '18800', '1000.00000000', '0.00660000', '1526108401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2145', '41', '18800', '1000.00000000', '0.00660000', '1526108401', '1', '1526110419');
INSERT INTO `sys_fl_log` VALUES ('2146', '42', '18800', '6356.00000000', '0.04220000', '1526108401', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('2147', '46', '18800', '50.00000000', '0.00030000', '1526108401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2148', '51', '18800', '50.00000000', '0.00030000', '1526108401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2149', '53', '18800', '50.00000000', '0.00030000', '1526108401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2150', '54', '18800', '50.00000000', '0.00030000', '1526108401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2151', '55', '18800', '50.00000000', '0.00030000', '1526108401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2152', '56', '18800', '50.00000000', '0.00030000', '1526108401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2153', '57', '18800', '50.00000000', '0.00030000', '1526108401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2154', '58', '18800', '50.00000000', '0.00030000', '1526108401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2155', '59', '18800', '50.00000000', '0.00030000', '1526108401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2156', '60', '18800', '50.00000000', '0.00030000', '1526108401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2157', '61', '18800', '50.00000000', '0.00030000', '1526108401', '1', '1526110903');
INSERT INTO `sys_fl_log` VALUES ('2158', '62', '18800', '50.00000000', '0.00030000', '1526108401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2159', '63', '18800', '50.00000000', '0.00030000', '1526108401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2160', '64', '18800', '50.00000000', '0.00030000', '1526108401', '1', '1526111120');
INSERT INTO `sys_fl_log` VALUES ('2161', '65', '18800', '50.00000000', '0.00030000', '1526108401', '1', '1526138041');
INSERT INTO `sys_fl_log` VALUES ('2162', '66', '18800', '50.00000000', '0.00030000', '1526108401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2163', '67', '18800', '50.00000000', '0.00030000', '1526108401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2164', '1', '20000', '111.00000000', '0.00060000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2165', '2', '20000', '200.00000000', '0.00120000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2166', '3', '20000', '350.00000000', '0.00210000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2167', '4', '20000', '440.00000000', '0.00270000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2168', '25', '20000', '551.00000000', '0.00340000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2169', '26', '20000', '50.00000000', '0.00030000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2170', '27', '20000', '481.64000000', '0.00300000', '1526119202', '0', '0');
INSERT INTO `sys_fl_log` VALUES ('2171', '28', '20000', '30.00000000', '0.00010000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2172', '29', '20000', '21.00000000', '0.00010000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2173', '30', '20000', '88.00000000', '0.00050000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2174', '31', '20000', '50.00000000', '0.00030000', '1526119202', '1', '1526138549');
INSERT INTO `sys_fl_log` VALUES ('2175', '34', '20000', '581.40000000', '0.00360000', '1526119202', '1', '1526178213');
INSERT INTO `sys_fl_log` VALUES ('2176', '36', '20000', '350.00000000', '0.00210000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2177', '37', '20000', '1060.00000000', '0.00660000', '1526119202', '1', '1526139485');
INSERT INTO `sys_fl_log` VALUES ('2178', '39', '20000', '60.00000000', '0.00030000', '1526119202', '1', '1526120090');
INSERT INTO `sys_fl_log` VALUES ('2179', '40', '20000', '1000.00000000', '0.00620000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2180', '41', '20000', '1000.00000000', '0.00620000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2181', '42', '20000', '6356.00000000', '0.03970000', '1526119202', '1', '1526196462');
INSERT INTO `sys_fl_log` VALUES ('2182', '46', '20000', '50.00000000', '0.00030000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2183', '51', '20000', '50.00000000', '0.00030000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2184', '53', '20000', '50.00000000', '0.00030000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2185', '54', '20000', '50.00000000', '0.00030000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2186', '55', '20000', '50.00000000', '0.00030000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2187', '56', '20000', '50.00000000', '0.00030000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2188', '57', '20000', '50.00000000', '0.00030000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2189', '58', '20000', '50.00000000', '0.00030000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2190', '59', '20000', '50.00000000', '0.00030000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2191', '60', '20000', '50.00000000', '0.00030000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2192', '61', '20000', '50.00000000', '0.00030000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2193', '62', '20000', '50.00000000', '0.00030000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2194', '63', '20000', '50.00000000', '0.00030000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2195', '64', '20000', '50.00000000', '0.00030000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2196', '65', '20000', '50.00000000', '0.00030000', '1526119202', '1', '1526138038');
INSERT INTO `sys_fl_log` VALUES ('2197', '66', '20000', '50.00000000', '0.00030000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2198', '67', '20000', '50.00000000', '0.00030000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2199', '68', '20000', '50.00000000', '0.00030000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2200', '69', '20000', '50.00000000', '0.00030000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2201', '70', '20000', '50.00000000', '0.00030000', '1526119202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2202', '1', '20000', '111.00000000', '0.00060000', '1526130001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2203', '2', '20000', '200.00000000', '0.00120000', '1526130001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2204', '3', '20000', '350.00000000', '0.00210000', '1526130001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2205', '4', '20000', '440.00000000', '0.00270000', '1526130001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2206', '25', '20000', '551.00000000', '0.00340000', '1526130001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2207', '26', '20000', '50.00000000', '0.00030000', '1526130001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2208', '27', '20000', '481.64000000', '0.00300000', '1526130001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2209', '28', '20000', '30.00000000', '0.00010000', '1526130001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2210', '29', '20000', '21.00000000', '0.00010000', '1526130001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2211', '30', '20000', '88.00000000', '0.00050000', '1526130001', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2212', '31', '20000', '50.00000000', '0.00030000', '1526130001', '1', '1526138551');
INSERT INTO `sys_fl_log` VALUES ('2213', '34', '20000', '581.40000000', '0.00360000', '1526130002', '1', '1526178212');
INSERT INTO `sys_fl_log` VALUES ('2214', '36', '20000', '350.00000000', '0.00210000', '1526130002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2215', '37', '20000', '1060.00000000', '0.00660000', '1526130002', '1', '1526139483');
INSERT INTO `sys_fl_log` VALUES ('2216', '39', '20000', '60.00000000', '0.00030000', '1526130002', '1', '1526184495');
INSERT INTO `sys_fl_log` VALUES ('2217', '40', '20000', '1000.00000000', '0.00620000', '1526130002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2218', '41', '20000', '1000.00000000', '0.00620000', '1526130002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2219', '42', '20000', '6356.00000000', '0.03970000', '1526130002', '1', '1526196459');
INSERT INTO `sys_fl_log` VALUES ('2220', '46', '20000', '50.00000000', '0.00030000', '1526130002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2221', '51', '20000', '50.00000000', '0.00030000', '1526130002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2222', '53', '20000', '50.00000000', '0.00030000', '1526130002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2223', '54', '20000', '50.00000000', '0.00030000', '1526130002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2224', '55', '20000', '50.00000000', '0.00030000', '1526130002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2225', '56', '20000', '50.00000000', '0.00030000', '1526130002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2226', '57', '20000', '50.00000000', '0.00030000', '1526130002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2227', '58', '20000', '50.00000000', '0.00030000', '1526130002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2228', '59', '20000', '50.00000000', '0.00030000', '1526130002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2229', '60', '20000', '50.00000000', '0.00030000', '1526130002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2230', '61', '20000', '50.00000000', '0.00030000', '1526130002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2231', '62', '20000', '50.00000000', '0.00030000', '1526130002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2232', '63', '20000', '50.00000000', '0.00030000', '1526130002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2233', '64', '20000', '50.00000000', '0.00030000', '1526130002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2234', '65', '20000', '50.00000000', '0.00030000', '1526130002', '1', '1526138040');
INSERT INTO `sys_fl_log` VALUES ('2235', '66', '20000', '50.00000000', '0.00030000', '1526130002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2236', '67', '20000', '50.00000000', '0.00030000', '1526130002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2237', '68', '20000', '50.00000000', '0.00030000', '1526130002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2238', '69', '20000', '50.00000000', '0.00030000', '1526130002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2239', '70', '20000', '50.00000000', '0.00030000', '1526130002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2240', '1', '20000', '111.00000000', '0.00060000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2241', '2', '20000', '200.00000000', '0.00120000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2242', '3', '20000', '350.00000000', '0.00210000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2243', '4', '20000', '440.00000000', '0.00270000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2244', '25', '20000', '551.00000000', '0.00340000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2245', '26', '20000', '50.00000000', '0.00030000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2246', '27', '20000', '481.64000000', '0.00300000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2247', '28', '20000', '30.00000000', '0.00010000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2248', '29', '20000', '21.00000000', '0.00010000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2249', '30', '20000', '88.00000000', '0.00050000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2250', '31', '20000', '50.00000000', '0.00030000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2251', '34', '20000', '581.40000000', '0.00360000', '1526140801', '1', '1526178211');
INSERT INTO `sys_fl_log` VALUES ('2252', '36', '20000', '350.00000000', '0.00210000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2253', '37', '20000', '1060.00000000', '0.00660000', '1526140801', '1', '1526188056');
INSERT INTO `sys_fl_log` VALUES ('2254', '39', '20000', '60.00000000', '0.00030000', '1526140801', '1', '1526184498');
INSERT INTO `sys_fl_log` VALUES ('2255', '40', '20000', '1000.00000000', '0.00620000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2256', '41', '20000', '1000.00000000', '0.00620000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2257', '42', '20000', '6356.00000000', '0.03970000', '1526140801', '1', '1526196460');
INSERT INTO `sys_fl_log` VALUES ('2258', '46', '20000', '50.00000000', '0.00030000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2259', '51', '20000', '50.00000000', '0.00030000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2260', '53', '20000', '50.00000000', '0.00030000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2261', '54', '20000', '50.00000000', '0.00030000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2262', '55', '20000', '50.00000000', '0.00030000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2263', '56', '20000', '50.00000000', '0.00030000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2264', '57', '20000', '50.00000000', '0.00030000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2265', '58', '20000', '50.00000000', '0.00030000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2266', '59', '20000', '50.00000000', '0.00030000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2267', '60', '20000', '50.00000000', '0.00030000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2268', '61', '20000', '50.00000000', '0.00030000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2269', '62', '20000', '50.00000000', '0.00030000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2270', '63', '20000', '50.00000000', '0.00030000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2271', '64', '20000', '50.00000000', '0.00030000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2272', '65', '20000', '50.00000000', '0.00030000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2273', '66', '20000', '50.00000000', '0.00030000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2274', '67', '20000', '50.00000000', '0.00030000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2275', '68', '20000', '50.00000000', '0.00030000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2276', '69', '20000', '50.00000000', '0.00030000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2277', '70', '20000', '50.00000000', '0.00030000', '1526140801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2278', '1', '20000', '111.00000000', '0.00060000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2279', '2', '20000', '200.00000000', '0.00120000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2280', '3', '20000', '350.00000000', '0.00210000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2281', '4', '20000', '440.00000000', '0.00270000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2282', '25', '20000', '551.00000000', '0.00340000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2283', '26', '20000', '50.00000000', '0.00030000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2284', '27', '20000', '481.64000000', '0.00300000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2285', '28', '20000', '30.00000000', '0.00010000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2286', '29', '20000', '21.00000000', '0.00010000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2287', '30', '20000', '88.00000000', '0.00050000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2288', '31', '20000', '50.00000000', '0.00030000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2289', '34', '20000', '581.40000000', '0.00360000', '1526151601', '1', '1526178214');
INSERT INTO `sys_fl_log` VALUES ('2290', '36', '20000', '350.00000000', '0.00210000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2291', '37', '20000', '1060.00000000', '0.00660000', '1526151601', '1', '1526188053');
INSERT INTO `sys_fl_log` VALUES ('2292', '39', '20000', '60.00000000', '0.00030000', '1526151601', '1', '1526184497');
INSERT INTO `sys_fl_log` VALUES ('2293', '40', '20000', '1000.00000000', '0.00620000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2294', '41', '20000', '1000.00000000', '0.00620000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2295', '42', '20000', '6356.00000000', '0.03970000', '1526151601', '1', '1526196461');
INSERT INTO `sys_fl_log` VALUES ('2296', '46', '20000', '50.00000000', '0.00030000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2297', '51', '20000', '50.00000000', '0.00030000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2298', '53', '20000', '50.00000000', '0.00030000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2299', '54', '20000', '50.00000000', '0.00030000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2300', '55', '20000', '50.00000000', '0.00030000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2301', '56', '20000', '50.00000000', '0.00030000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2302', '57', '20000', '50.00000000', '0.00030000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2303', '58', '20000', '50.00000000', '0.00030000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2304', '59', '20000', '50.00000000', '0.00030000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2305', '60', '20000', '50.00000000', '0.00030000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2306', '61', '20000', '50.00000000', '0.00030000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2307', '62', '20000', '50.00000000', '0.00030000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2308', '63', '20000', '50.00000000', '0.00030000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2309', '64', '20000', '50.00000000', '0.00030000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2310', '65', '20000', '50.00000000', '0.00030000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2311', '66', '20000', '50.00000000', '0.00030000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2312', '67', '20000', '50.00000000', '0.00030000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2313', '68', '20000', '50.00000000', '0.00030000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2314', '69', '20000', '50.00000000', '0.00030000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2315', '70', '20000', '50.00000000', '0.00030000', '1526151601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2316', '1', '20000', '111.00000000', '0.00060000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2317', '2', '20000', '200.00000000', '0.00120000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2318', '3', '20000', '350.00000000', '0.00210000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2319', '4', '20000', '440.00000000', '0.00270000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2320', '25', '20000', '551.00000000', '0.00340000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2321', '26', '20000', '50.00000000', '0.00030000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2322', '27', '20000', '481.64000000', '0.00300000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2323', '28', '20000', '30.00000000', '0.00010000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2324', '29', '20000', '21.00000000', '0.00010000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2325', '30', '20000', '88.00000000', '0.00050000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2326', '31', '20000', '50.00000000', '0.00030000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2327', '34', '20000', '581.40000000', '0.00360000', '1526162401', '1', '1526178212');
INSERT INTO `sys_fl_log` VALUES ('2328', '36', '20000', '350.00000000', '0.00210000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2329', '37', '20000', '1060.00000000', '0.00660000', '1526162401', '1', '1526188054');
INSERT INTO `sys_fl_log` VALUES ('2330', '39', '20000', '60.00000000', '0.00030000', '1526162401', '1', '1526184496');
INSERT INTO `sys_fl_log` VALUES ('2331', '40', '20000', '1000.00000000', '0.00620000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2332', '41', '20000', '1000.00000000', '0.00620000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2333', '42', '20000', '6356.00000000', '0.03970000', '1526162401', '1', '1526196462');
INSERT INTO `sys_fl_log` VALUES ('2334', '46', '20000', '50.00000000', '0.00030000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2335', '51', '20000', '50.00000000', '0.00030000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2336', '53', '20000', '50.00000000', '0.00030000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2337', '54', '20000', '50.00000000', '0.00030000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2338', '55', '20000', '50.00000000', '0.00030000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2339', '56', '20000', '50.00000000', '0.00030000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2340', '57', '20000', '50.00000000', '0.00030000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2341', '58', '20000', '50.00000000', '0.00030000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2342', '59', '20000', '50.00000000', '0.00030000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2343', '60', '20000', '50.00000000', '0.00030000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2344', '61', '20000', '50.00000000', '0.00030000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2345', '62', '20000', '50.00000000', '0.00030000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2346', '63', '20000', '50.00000000', '0.00030000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2347', '64', '20000', '50.00000000', '0.00030000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2348', '65', '20000', '50.00000000', '0.00030000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2349', '66', '20000', '50.00000000', '0.00030000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2350', '67', '20000', '50.00000000', '0.00030000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2351', '68', '20000', '50.00000000', '0.00030000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2352', '69', '20000', '50.00000000', '0.00030000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2353', '70', '20000', '50.00000000', '0.00030000', '1526162401', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2354', '1', '20000', '111.00000000', '0.00060000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2355', '2', '20000', '200.00000000', '0.00120000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2356', '3', '20000', '350.00000000', '0.00210000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2357', '4', '20000', '440.00000000', '0.00270000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2358', '25', '20000', '551.00000000', '0.00340000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2359', '26', '20000', '50.00000000', '0.00030000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2360', '27', '20000', '481.64000000', '0.00300000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2361', '28', '20000', '30.00000000', '0.00010000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2362', '29', '20000', '21.00000000', '0.00010000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2363', '30', '20000', '88.00000000', '0.00050000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2364', '31', '20000', '50.00000000', '0.00030000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2365', '34', '20000', '581.40000000', '0.00360000', '1526173202', '1', '1526178213');
INSERT INTO `sys_fl_log` VALUES ('2366', '36', '20000', '350.00000000', '0.00210000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2367', '37', '20000', '1060.00000000', '0.00660000', '1526173202', '1', '1526188055');
INSERT INTO `sys_fl_log` VALUES ('2368', '39', '20000', '60.00000000', '0.00030000', '1526173202', '1', '1526184495');
INSERT INTO `sys_fl_log` VALUES ('2369', '40', '20000', '1000.00000000', '0.00620000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2370', '41', '20000', '1000.00000000', '0.00620000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2371', '42', '20000', '6356.00000000', '0.03970000', '1526173202', '1', '1526196459');
INSERT INTO `sys_fl_log` VALUES ('2372', '46', '20000', '50.00000000', '0.00030000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2373', '51', '20000', '50.00000000', '0.00030000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2374', '53', '20000', '50.00000000', '0.00030000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2375', '54', '20000', '50.00000000', '0.00030000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2376', '55', '20000', '50.00000000', '0.00030000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2377', '56', '20000', '50.00000000', '0.00030000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2378', '57', '20000', '50.00000000', '0.00030000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2379', '58', '20000', '50.00000000', '0.00030000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2380', '59', '20000', '50.00000000', '0.00030000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2381', '60', '20000', '50.00000000', '0.00030000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2382', '61', '20000', '50.00000000', '0.00030000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2383', '62', '20000', '50.00000000', '0.00030000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2384', '63', '20000', '50.00000000', '0.00030000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2385', '64', '20000', '50.00000000', '0.00030000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2386', '65', '20000', '50.00000000', '0.00030000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2387', '66', '20000', '50.00000000', '0.00030000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2388', '67', '20000', '50.00000000', '0.00030000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2389', '68', '20000', '50.00000000', '0.00030000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2390', '69', '20000', '50.00000000', '0.00030000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2391', '70', '20000', '50.00000000', '0.00030000', '1526173202', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2392', '1', '20000', '111.00000000', '0.00060000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2393', '2', '20000', '200.00000000', '0.00120000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2394', '3', '20000', '350.00000000', '0.00210000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2395', '4', '20000', '440.00000000', '0.00270000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2396', '25', '20000', '551.00000000', '0.00340000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2397', '26', '20000', '50.00000000', '0.00030000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2398', '27', '20000', '481.64000000', '0.00300000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2399', '28', '20000', '30.00000000', '0.00010000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2400', '29', '20000', '21.00000000', '0.00010000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2401', '30', '20000', '88.00000000', '0.00050000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2402', '31', '20000', '50.00000000', '0.00030000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2403', '34', '20000', '581.40000000', '0.00360000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2404', '36', '20000', '350.00000000', '0.00210000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2405', '37', '20000', '1060.00000000', '0.00660000', '1526184002', '1', '1526188057');
INSERT INTO `sys_fl_log` VALUES ('2406', '39', '20000', '60.00000000', '0.00030000', '1526184002', '1', '1526184499');
INSERT INTO `sys_fl_log` VALUES ('2407', '40', '20000', '1000.00000000', '0.00620000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2408', '41', '20000', '1000.00000000', '0.00620000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2409', '42', '20000', '6356.00000000', '0.03970000', '1526184002', '1', '1526196461');
INSERT INTO `sys_fl_log` VALUES ('2410', '46', '20000', '50.00000000', '0.00030000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2411', '51', '20000', '50.00000000', '0.00030000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2412', '53', '20000', '50.00000000', '0.00030000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2413', '54', '20000', '50.00000000', '0.00030000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2414', '55', '20000', '50.00000000', '0.00030000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2415', '56', '20000', '50.00000000', '0.00030000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2416', '57', '20000', '50.00000000', '0.00030000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2417', '58', '20000', '50.00000000', '0.00030000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2418', '59', '20000', '50.00000000', '0.00030000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2419', '60', '20000', '50.00000000', '0.00030000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2420', '61', '20000', '50.00000000', '0.00030000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2421', '62', '20000', '50.00000000', '0.00030000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2422', '63', '20000', '50.00000000', '0.00030000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2423', '64', '20000', '50.00000000', '0.00030000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2424', '65', '20000', '50.00000000', '0.00030000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2425', '66', '20000', '50.00000000', '0.00030000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2426', '67', '20000', '50.00000000', '0.00030000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2427', '68', '20000', '50.00000000', '0.00030000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2428', '69', '20000', '50.00000000', '0.00030000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2429', '70', '20000', '50.00000000', '0.00030000', '1526184002', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2430', '1', '20000', '111.00000000', '0.00060000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2431', '2', '20000', '200.00000000', '0.00120000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2432', '3', '20000', '350.00000000', '0.00210000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2433', '4', '20000', '440.00000000', '0.00270000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2434', '25', '20000', '551.00000000', '0.00340000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2435', '26', '20000', '50.00000000', '0.00030000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2436', '27', '20000', '481.64000000', '0.00300000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2437', '28', '20000', '30.00000000', '0.00010000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2438', '29', '20000', '21.00000000', '0.00010000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2439', '30', '20000', '88.00000000', '0.00050000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2440', '31', '20000', '50.00000000', '0.00030000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2441', '34', '20000', '581.40000000', '0.00360000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2442', '36', '20000', '350.00000000', '0.00210000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2443', '37', '20000', '1060.00000000', '0.00660000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2444', '39', '20000', '60.00000000', '0.00030000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2445', '40', '20000', '1000.00000000', '0.00620000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2446', '41', '20000', '1000.00000000', '0.00620000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2447', '42', '20000', '6356.00000000', '0.03970000', '1526194801', '1', '1526196460');
INSERT INTO `sys_fl_log` VALUES ('2448', '46', '20000', '50.00000000', '0.00030000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2449', '51', '20000', '50.00000000', '0.00030000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2450', '53', '20000', '50.00000000', '0.00030000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2451', '54', '20000', '50.00000000', '0.00030000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2452', '55', '20000', '50.00000000', '0.00030000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2453', '56', '20000', '50.00000000', '0.00030000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2454', '57', '20000', '50.00000000', '0.00030000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2455', '58', '20000', '50.00000000', '0.00030000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2456', '59', '20000', '50.00000000', '0.00030000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2457', '60', '20000', '50.00000000', '0.00030000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2458', '61', '20000', '50.00000000', '0.00030000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2459', '62', '20000', '50.00000000', '0.00030000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2460', '63', '20000', '50.00000000', '0.00030000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2461', '64', '20000', '50.00000000', '0.00030000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2462', '65', '20000', '50.00000000', '0.00030000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2463', '66', '20000', '50.00000000', '0.00030000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2464', '67', '20000', '50.00000000', '0.00030000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2465', '68', '20000', '50.00000000', '0.00030000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2466', '69', '20000', '50.00000000', '0.00030000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2467', '70', '20000', '50.00000000', '0.00030000', '1526194801', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2468', '1', '20000', '111.00000000', '0.00060000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2469', '2', '20000', '200.00000000', '0.00120000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2470', '3', '20000', '350.00000000', '0.00210000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2471', '4', '20000', '440.00000000', '0.00270000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2472', '25', '20000', '551.00000000', '0.00340000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2473', '26', '20000', '50.00000000', '0.00030000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2474', '27', '20000', '481.64000000', '0.00300000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2475', '28', '20000', '30.00000000', '0.00010000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2476', '29', '20000', '21.00000000', '0.00010000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2477', '30', '20000', '88.00000000', '0.00050000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2478', '31', '20000', '50.00000000', '0.00030000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2479', '34', '20000', '581.40000000', '0.00360000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2480', '36', '20000', '350.00000000', '0.00210000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2481', '37', '20000', '1060.00000000', '0.00660000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2482', '39', '20000', '60.00000000', '0.00030000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2483', '40', '20000', '1000.00000000', '0.00620000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2484', '41', '20000', '1000.00000000', '0.00620000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2485', '42', '20000', '6356.00000000', '0.03970000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2486', '46', '20000', '50.00000000', '0.00030000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2487', '51', '20000', '50.00000000', '0.00030000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2488', '53', '20000', '50.00000000', '0.00030000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2489', '54', '20000', '50.00000000', '0.00030000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2490', '55', '20000', '50.00000000', '0.00030000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2491', '56', '20000', '50.00000000', '0.00030000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2492', '57', '20000', '50.00000000', '0.00030000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2493', '58', '20000', '50.00000000', '0.00030000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2494', '59', '20000', '50.00000000', '0.00030000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2495', '60', '20000', '50.00000000', '0.00030000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2496', '61', '20000', '50.00000000', '0.00030000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2497', '62', '20000', '50.00000000', '0.00030000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2498', '63', '20000', '50.00000000', '0.00030000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2499', '64', '20000', '50.00000000', '0.00030000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2500', '65', '20000', '50.00000000', '0.00030000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2501', '66', '20000', '50.00000000', '0.00030000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2502', '67', '20000', '50.00000000', '0.00030000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2503', '68', '20000', '50.00000000', '0.00030000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2504', '69', '20000', '50.00000000', '0.00030000', '1526205601', '2', '0');
INSERT INTO `sys_fl_log` VALUES ('2505', '70', '20000', '50.00000000', '0.00030000', '1526205601', '2', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '0', '15890143120', '15890143120', 'e10adc3949ba59abbe56e057f20f883e', '96e79218965eb72c92a549dd5a330112', '马帅', '123', '1524118586', '1', '中国', '河南', '郑州', '0');
INSERT INTO `user` VALUES ('2', '1', '15890143121', '15890143121', 'e10adc3949ba59abbe56e057f20f883e', '96e79218965eb72c92a549dd5a330112', '马帅1', null, '1524118712', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('3', '1', '15890143122', '15890143122', 'e10adc3949ba59abbe56e057f20f883e', '96e79218965eb72c92a549dd5a330112', '马帅1', null, '1524118863', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('4', '1', '15890143124', '15890143124', 'e10adc3949ba59abbe56e057f20f883e', '96e79218965eb72c92a549dd5a330112', '马帅1', null, '1524118984', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('25', '1', '15890143125', '15890143125', 'e10adc3949ba59abbe56e057f20f883e', '96e79218965eb72c92a549dd5a330112', '马帅', null, '1524122672', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('26', '1', '15890143126', '15890143126', 'e10adc3949ba59abbe56e057f20f883e', '96e79218965eb72c92a549dd5a330112', '马帅', null, '1524122748', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('27', '1', '15890143123', '15890143123', 'e10adc3949ba59abbe56e057f20f883e', '96e79218965eb72c92a549dd5a330112', 'mash', '111', '1524122810', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('28', '1', '15890143127', '15890143127', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', 'adfa', null, '1524534028', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('29', '27', '15890143128', '15890143128', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', 'asdfasdf', null, null, '1', null, null, null, '0');
INSERT INTO `user` VALUES ('30', '27', '15890143129', '15890143129', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', 'sd撒旦法', null, null, '1', null, null, null, '0');
INSERT INTO `user` VALUES ('31', '0', '15515761553', '15515761553', '8e3c006c389424143cf8ba001e9621bd', 'db6d85f47254ff82b362db576b209e06', '薛金梦', null, '1524892576', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('32', '0', '15039265067', '15039265067', '430d6cc76d8cab2e00f0277bb8826ae9', 'e087dae60e744ea80722b785a75adbb7', '范世杰', null, '1524893743', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('33', '0', '16603848631', '16603848631', '25f9e794323b453885f5181f1b624d0b', '4607e782c4d86fd5364d7e4508bb10d9', '刘义成', null, '1525224050', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('34', '32', '18939238803', '18939238803', 'ab244795339868d6e9d35ed7e7de7e3b', 'f0209bf299524217a39c6f6ce6531d94', '范世英', '123456789012345678', '1525335262', '1', '中国', '河南', '郑州', '1');
INSERT INTO `user` VALUES ('35', '0', '18236777562', '18236777562', 'dc483e80a7a0bd9ef71d8cf973673924', '9cbf8a4dcb8e30682b927f352d6559a0', '金子', '41272819870617749x', '1525397891', '1', null, null, null, '1');
INSERT INTO `user` VALUES ('36', '32', '15036164378', '15036164378', '8a6f2805b4515ac12058e79e66539be9', 'f379eaf3c831b04de153469d1bec345e', '菜鸟', '411381199005250416', '1525400770', '1', '中国', '河南', '郑州', '1');
INSERT INTO `user` VALUES ('37', '0', '13598808667', '13598808667', '889a145324cc0b54822d12ca2140e217', '2dc22add53605cdad306d37b0e4f0348', '欧文', null, '1525404608', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('38', '0', '15617636330', '15617636330', '96e79218965eb72c92a549dd5a330112', 'e3ceb5881a0a1fdaad01296d7554868d', '张杰', null, '1525514043', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('39', '36', '13140108021', '13140108021', 'e10adc3949ba59abbe56e057f20f883e', 'e9bc0e13a8a16cbb07b175d92a113126', '哈哈哈哈', '110226197811222240', '1525517923', '1', '哈哈哈', '哈哈哈', '哈哈哈', '1');
INSERT INTO `user` VALUES ('40', '0', '18039271706', '18039271706', '05b3681efcc6585c78f0c3de8db2677d', 'a07e42faff2a47ca7e5dc86fc6f51c29', '李', null, '1525767418', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('41', '0', '15516983883', '15516983883', 'e10adc3949ba59abbe56e057f20f883e', 'ca499fbf76ae244061937c7075763e20', '戴维', null, '1525827237', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('42', '38', '15839876473', '15839876473', '96e79218965eb72c92a549dd5a330112', 'e3ceb5881a0a1fdaad01296d7554868d', '张杰', null, '1525837268', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('43', '40', '19939916361', '19939916361', '25f9e794323b453885f5181f1b624d0b', 'e10adc3949ba59abbe56e057f20f883e', '原力星球', null, '1525837470', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('44', '34', '133333333333', '133333333333', 'ab244795339868d6e9d35ed7e7de7e3b', 'f0209bf299524217a39c6f6ce6531d94', '133', null, '1525857340', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('45', '44', '13222222222', '13222222222', 'ab244795339868d6e9d35ed7e7de7e3b', 'f0209bf299524217a39c6f6ce6531d94', '132', null, '1525857811', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('46', '35', '17630240711', '17630240711', 'dc483e80a7a0bd9ef71d8cf973673924', '9cbf8a4dcb8e30682b927f352d6559a0', 'xiaomu', null, '1525857825', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('47', '45', '13111111111', '13111111111', 'ab244795339868d6e9d35ed7e7de7e3b', 'f0209bf299524217a39c6f6ce6531d94', '131', null, '1525857843', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('48', '47', '13000000000', '13000000000', 'ab244795339868d6e9d35ed7e7de7e3b', 'f0209bf299524217a39c6f6ce6531d94', '130', null, '1525857886', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('49', '48', '12999999999', '12999999999', 'ab244795339868d6e9d35ed7e7de7e3b', 'f0209bf299524217a39c6f6ce6531d94', '129', null, '1525857922', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('50', '49', '12888888888', '12888888888', 'ab244795339868d6e9d35ed7e7de7e3b', 'f0209bf299524217a39c6f6ce6531d94', '128', null, '1525857952', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('51', '46', '15639743913', '15639743913', 'dc483e80a7a0bd9ef71d8cf973673924', '9cbf8a4dcb8e30682b927f352d6559a0', 'xiaowang', null, '1525859145', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('52', '35', '15138202837', '15138202837', 'dc483e80a7a0bd9ef71d8cf973673924', '9cbf8a4dcb8e30682b927f352d6559a0', '家里', null, '1525861694', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('53', '39', '15090213239', '15090213239', '96e79218965eb72c92a549dd5a330112', 'e3ceb5881a0a1fdaad01296d7554868d', '李', null, '1525865229', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('54', '39', '15936273133', '15936273133', 'e10adc3949ba59abbe56e057f20f883e', 'b0baee9d279d34fa1dfd71aadb908c3f', '桑普元', null, '1525868849', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('55', '34', '18939238804', '18939238804', 'ab244795339868d6e9d35ed7e7de7e3b', 'f0209bf299524217a39c6f6ce6531d94', '111', null, '1525918500', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('56', '55', '18939238805', '18939238805', 'ab244795339868d6e9d35ed7e7de7e3b', 'f0209bf299524217a39c6f6ce6531d94', '222', null, '1525918635', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('57', '56', '18939238806', '18939238806', 'ab244795339868d6e9d35ed7e7de7e3b', 'f0209bf299524217a39c6f6ce6531d94', '333', null, '1525918898', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('58', '57', '18939238807', '18939238807', 'ab244795339868d6e9d35ed7e7de7e3b', 'f0209bf299524217a39c6f6ce6531d94', '444', null, '1525918936', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('59', '58', '18939238808', '18939238808', 'ab244795339868d6e9d35ed7e7de7e3b', 'f0209bf299524217a39c6f6ce6531d94', '555', null, '1525918964', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('60', '59', '18939238809', '18939238809', 'ab244795339868d6e9d35ed7e7de7e3b', 'f0209bf299524217a39c6f6ce6531d94', '666', '666600000000000000', '1525918989', '1', null, null, null, '1');
INSERT INTO `user` VALUES ('61', '0', '13062626251', '13062626251', 'f4e8f6ba054c8b754e13d4898f6a87ab', 'e1dc80d7a0af50b4675048fddeea0435', '从响峰', '320684198505016691', '1525938776', '1', null, null, null, '1');
INSERT INTO `user` VALUES ('62', '0', '18738781047', '18738781047', 'e10adc3949ba59abbe56e057f20f883e', 'a02d58da1367741d4d66169a0805c7c4', '郝昀', null, '1525944175', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('63', '0', '18239963626', '18239963626', '567f04b0868b14820b6ce08a8e0a5b61', '4cc888b0adc40d6ddd004062710f7179', '张海彬', null, '1526009701', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('64', '0', '13674974801', '13674974801', 'b608b1e7cbb662a92184521d3dc18881', 'a688a47ac73fb58ce3828bcb184cb157', '殷雪涛', null, '1526011097', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('65', '41', '18530057188', '18530057188', 'ed334184594e29f7830b192943471704', 'ed334184594e29f7830b192943471704', '乔石', null, '1526011102', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('66', '65', '13083717777', '13083717777', 'e10adc3949ba59abbe56e057f20f883e', '21218cca77804d2ba1922c33e0151105', '张俊', null, '1526011545', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('67', '0', '18174684700', '18174684700', 'e10adc3949ba59abbe56e057f20f883e', 'c33367701511b4f6020ec61ded352059', '李', null, '1526094086', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('68', '41', '13253555553', '13253555553', '5843717985e1d4bbb8f567fbc2905092', 'bb693e130d36b3895b6fa021eafa619b', '尹昱程', null, '1526110764', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('69', '41', '15333819133', '15333819133', '05036ca4a34a28bad4dad99af9ed62a4', '7d93a5f8b3d287771aa29d4834b3fd54', '葛荣伦', null, '1526111478', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('70', '68', '13253333561', '13253333561', '0a12b4e8de233e9c7d8c4286500c3756', '84d152fa3a9094f788ed3e34d00a6c47', '林', null, '1526111575', '1', null, null, null, '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_certification
-- ----------------------------
INSERT INTO `user_certification` VALUES ('2', '27', '2018-04-26/5ae15fd7157ab.png', '2018-04-26/5ae15fd71a645.png', '2018-04-26/5ae15fd71afa0.png', '1524719575', '1', 'mash', '111');
INSERT INTO `user_certification` VALUES ('3', '36', '2018-05-04/5aec1a103d876.jpeg', '2018-05-04/5aec1a103df91.jpeg', '2018-05-04/5aec1a103e5e2.jpeg', '1525422608', '1', '菜牙', '411381199005250416');
INSERT INTO `user_certification` VALUES ('4', '39', '2018-05-08/5af17d89bcab8.png', '2018-05-08/5af17d89bd193.png', '2018-05-08/5af17d89bd762.png', '1525775753', '1', '秦含之', '110226197811222240');
INSERT INTO `user_certification` VALUES ('5', '38', '2018-05-09/5af261d090b64.jpg', '2018-05-09/5af261d091fe0.jpg', '2018-05-09/5af261d093081.jpg', '1525834192', '0', '张杰', '411224199004150031');
INSERT INTO `user_certification` VALUES ('6', '35', '2018-05-09/5af2938c9025e.jpeg', '2018-05-09/5af2938c90781.jpeg', '2018-05-09/5af2938c913e8.jpeg', '1525846924', '1', '金子', '41272819870617749x');
INSERT INTO `user_certification` VALUES ('7', '34', '2018-05-09/5af29e454e173.png', '2018-05-09/5af29e454e41a.png', '2018-05-09/5af29e454e65f.png', '1525849669', '1', '范世英', '123456789012345678');
INSERT INTO `user_certification` VALUES ('8', '60', '2018-05-10/5af3b129ebb20.png', '2018-05-10/5af3b129ebfff.png', '2018-05-10/5af3b129ec44f.png', '1525920041', '1', '666', '666600000000000000');
INSERT INTO `user_certification` VALUES ('9', '61', '2018-05-11/5af5114ed2535.jpg', '2018-05-11/5af5114ed79e0.jpg', '2018-05-11/5af5114edafe4.jpg', '1526010190', '1', '从响峰', '320684198505016691');
INSERT INTO `user_certification` VALUES ('10', '32', '2018-05-12/5af6ad95834e5.jpg', '2018-05-12/5af6ad958937d.jpg', '2018-05-12/5af6ad958ee5f.jpg', '1526115733', '0', '范世杰', '410606199999999999');

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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_coin
-- ----------------------------
INSERT INTO `user_coin` VALUES ('1', '1', '30.00558029', '0.00000000', '', '111.00000000');
INSERT INTO `user_coin` VALUES ('2', '2', '0.01116065', '0.00000000', '', '200.00000000');
INSERT INTO `user_coin` VALUES ('3', '3', '0.01953115', '0.00000000', '', '350.00000000');
INSERT INTO `user_coin` VALUES ('4', '4', '0.02455481', '0.00000000', '', '440.00000000');
INSERT INTO `user_coin` VALUES ('25', '25', '0.03069398', '0.00000000', '', '551.00000000');
INSERT INTO `user_coin` VALUES ('26', '26', '0.00279014', '0.00000000', '', '50.00000000');
INSERT INTO `user_coin` VALUES ('27', '27', '114.28762747', '0.00000000', 'LetwDKRT2T3MkufRH7SYYHvt1VhCQX1dFi', '481.64000000');
INSERT INTO `user_coin` VALUES ('28', '28', '240.24167489', '0.00000000', '', '30.00000000');
INSERT INTO `user_coin` VALUES ('29', '29', '200.24117271', '0.00000000', '', '21.00000000');
INSERT INTO `user_coin` VALUES ('30', '30', '100.12491121', '0.00000000', '', '88.00000000');
INSERT INTO `user_coin` VALUES ('31', '31', '0.00240000', '0.00000000', '', '50.00000000');
INSERT INTO `user_coin` VALUES ('32', '32', '0.00000000', '2.00000000', 'GUiL0iQuDMV8JzsXif4NWJK59Atcui9v', '0.00000000');
INSERT INTO `user_coin` VALUES ('33', '33', '0.00000000', '0.00000000', 's0d8DcujXUNcTQA95qkmwGpZ19MZEuW3', '0.00000000');
INSERT INTO `user_coin` VALUES ('34', '34', '4.81330000', '5.00000000', 'jNYDdRnTcJXNj8wdcNxL8sWAB7l3fCEZ', '581.40000000');
INSERT INTO `user_coin` VALUES ('35', '35', '1.00000000', '3.00000000', '4eLYbcEHuUwtOQVUMiRcsKVjRJ2bKWnb', '0.00000000');
INSERT INTO `user_coin` VALUES ('36', '36', '0.67870000', '4.00000000', 'vSxV7oeJuAgciRSP1FbDiKyZDZMMQLg5', '350.00000000');
INSERT INTO `user_coin` VALUES ('37', '37', '12.06985656', '0.00000000', 'F3EsusnpAI2VXHux54TDVzSilhtrP4D7', '1060.00000000');
INSERT INTO `user_coin` VALUES ('38', '38', '0.00000000', '0.00000000', 'ChfRL6rlJHrxR07MuzOC9WB9zTjLN6qB', '0.00000000');
INSERT INTO `user_coin` VALUES ('39', '39', '0.01410000', '6.00000000', '6rAM5Jcq8VPFZTv9ZBc2vTxPSKnjUdfb', '60.00000000');
INSERT INTO `user_coin` VALUES ('40', '40', '14.33580000', '0.00000000', '', '1000.00000000');
INSERT INTO `user_coin` VALUES ('41', '41', '12.33570000', '40.00000000', '', '1000.00000000');
INSERT INTO `user_coin` VALUES ('42', '42', '56.54250000', '0.00000000', '6Wx9HiXfkzxQsmHh6qiBNJGqvOuil4o0', '6356.00000000');
INSERT INTO `user_coin` VALUES ('43', '43', '1.00000000', '0.00000000', '', '0.00000000');
INSERT INTO `user_coin` VALUES ('44', '44', '0.00000000', '0.00000000', '', '0.00000000');
INSERT INTO `user_coin` VALUES ('45', '45', '0.00000000', '0.00000000', '', '0.00000000');
INSERT INTO `user_coin` VALUES ('46', '46', '4.00000000', '5.00000000', '', '50.00000000');
INSERT INTO `user_coin` VALUES ('47', '47', '0.00000000', '0.00000000', '', '0.00000000');
INSERT INTO `user_coin` VALUES ('48', '48', '0.00000000', '0.00000000', '', '0.00000000');
INSERT INTO `user_coin` VALUES ('49', '49', '0.00000000', '0.00000000', '', '0.00000000');
INSERT INTO `user_coin` VALUES ('50', '50', '0.00000000', '0.00000000', '', '0.00000000');
INSERT INTO `user_coin` VALUES ('51', '51', '5.01050000', '0.00000000', '', '50.00000000');
INSERT INTO `user_coin` VALUES ('52', '52', '0.00000000', '0.00000000', '', '0.00000000');
INSERT INTO `user_coin` VALUES ('53', '53', '0.00000000', '5.00000000', '', '50.00000000');
INSERT INTO `user_coin` VALUES ('54', '54', '0.01150000', '5.00000000', 'Sr5tmhEE7kz4DE1nN0hXeL1bj7DLmh7J', '50.00000000');
INSERT INTO `user_coin` VALUES ('55', '55', '0.00000000', '10.00000000', '', '50.00000000');
INSERT INTO `user_coin` VALUES ('56', '56', '0.00000000', '10.00000000', '', '50.00000000');
INSERT INTO `user_coin` VALUES ('57', '57', '0.00000000', '10.00000000', '', '50.00000000');
INSERT INTO `user_coin` VALUES ('58', '58', '2.00090000', '8.00000000', '', '50.00000000');
INSERT INTO `user_coin` VALUES ('59', '59', '3.00000000', '5.00000000', '', '50.00000000');
INSERT INTO `user_coin` VALUES ('60', '60', '5.00000000', '0.00000000', '', '50.00000000');
INSERT INTO `user_coin` VALUES ('61', '61', '0.00870000', '5.00000000', '', '50.00000000');
INSERT INTO `user_coin` VALUES ('62', '62', '0.00000000', '5.00000000', '', '50.00000000');
INSERT INTO `user_coin` VALUES ('63', '63', '0.00000000', '5.00000000', '', '50.00000000');
INSERT INTO `user_coin` VALUES ('64', '64', '0.00240000', '20.00000000', '', '50.00000000');
INSERT INTO `user_coin` VALUES ('65', '65', '0.00240000', '30.00000000', '', '50.00000000');
INSERT INTO `user_coin` VALUES ('66', '66', '0.00030000', '20.00000000', 'ZF86sXUwiWczIPFnxoLbK3qxMLqoIW5y', '50.00000000');
INSERT INTO `user_coin` VALUES ('67', '67', '0.00000000', '20.00000000', '', '50.00000000');
INSERT INTO `user_coin` VALUES ('68', '68', '0.00000000', '30.00000000', '', '50.00000000');
INSERT INTO `user_coin` VALUES ('69', '69', '0.00000000', '20.00000000', '', '50.00000000');
INSERT INTO `user_coin` VALUES ('70', '70', '0.00000000', '20.00000000', '', '50.00000000');

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_device
-- ----------------------------
INSERT INTO `user_device` VALUES ('10', '27', '1', '8850001106735250', '', '1524807190', '1');
INSERT INTO `user_device` VALUES ('11', '27', '1', '8850001109968485', '', '1524807196', '1');
INSERT INTO `user_device` VALUES ('12', '27', '1', '8850001106735009', '', '1524807203', '1');
INSERT INTO `user_device` VALUES ('13', '37', '1', '885000112243197', '', '1525766146', '0');
INSERT INTO `user_device` VALUES ('14', '37', '2', '123456789987', '', '1525766700', '1');
INSERT INTO `user_device` VALUES ('15', '34', '2', '88500011067352501', 'z123123', '1525832221', '1');
INSERT INTO `user_device` VALUES ('16', '34', '2', '88500011067352502', 'z123123', '1525832248', '1');
INSERT INTO `user_device` VALUES ('17', '34', '1', '8850001106735251', 'z123123', '1525832269', '1');
INSERT INTO `user_device` VALUES ('18', '34', '1', '8850001106735252', 'z123123', '1525832305', '1');
INSERT INTO `user_device` VALUES ('19', '34', '1', '8850001106735253', 'z123123', '1525832418', '1');
INSERT INTO `user_device` VALUES ('20', '34', '2', '88500011067352503', 'z123123', '1525832434', '1');
INSERT INTO `user_device` VALUES ('21', '34', '2', '88500011067352504', 'z123123', '1525832455', '1');
INSERT INTO `user_device` VALUES ('22', '38', '1', '8850001106735256', 'z223212', '1525834750', '0');
INSERT INTO `user_device` VALUES ('23', '42', '1', '8850001106735254', 'z123456', '1525837468', '1');
INSERT INTO `user_device` VALUES ('24', '36', '1', '8850001106735255', 'z123444', '1525846786', '1');
INSERT INTO `user_device` VALUES ('25', '36', '2', '88500011067352507', 'z22355', '1525847101', '1');
INSERT INTO `user_device` VALUES ('26', '51', '1', '13300001', '13300001', '1525859568', '1');
INSERT INTO `user_device` VALUES ('27', '60', '1', '13300003', '13300003', '1525920105', '1');
INSERT INTO `user_device` VALUES ('28', '39', '2', '13300007', '13300007', '1525934218', '1');
INSERT INTO `user_device` VALUES ('29', '36', '2', '13300008', '13300008', '1525939402', '1');
INSERT INTO `user_device` VALUES ('30', '36', '2', '13300009', '13300009', '1525939422', '1');
INSERT INTO `user_device` VALUES ('31', '36', '2', '88500011067352506', 'z22345', '1525939496', '1');
INSERT INTO `user_device` VALUES ('32', '36', '2', 'dddd', '2222123123', '1525946956', '1');
INSERT INTO `user_device` VALUES ('33', '39', '1', '13300002', '13300002', '1526033193', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_qianbao
-- ----------------------------
INSERT INTO `user_qianbao` VALUES ('1', '27', '测试', 'LVLxXuzR7GtYaXAg7yBy4TvxXnSRDH6Ts8', null, '1');
INSERT INTO `user_qianbao` VALUES ('2', '36', '1223', 'kloutjky', '1525420967', '1');
INSERT INTO `user_qianbao` VALUES ('3', '34', '1', '3585EB83-9E51-BD35-3584-32e8efd5c247', '1525512727', '1');
INSERT INTO `user_qianbao` VALUES ('4', '39', '123456', '456', '1525521465', '1');
INSERT INTO `user_qianbao` VALUES ('5', '58', '222', 'gghh', '1525937237', '1');
INSERT INTO `user_qianbao` VALUES ('6', '39', '测试', '测试测试123', '1526003360', '1');
INSERT INTO `user_qianbao` VALUES ('7', '33', '123', '456789', '1526114645', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='pos路由器申请记录';

-- ----------------------------
-- Records of user_shenqing
-- ----------------------------
INSERT INTO `user_shenqing` VALUES ('1', '33', '刘义成', '16603848631', '河南 郑州 金水区', '考虑考虑', '0', '1525658473', '1', '2');
INSERT INTO `user_shenqing` VALUES ('2', '38', '张杰', '15617636330', '河南 郑州 金水区', '金水万达', '0', '1525661758', '2', '1');
INSERT INTO `user_shenqing` VALUES ('3', '46', '金子测试', '18236777562', '河南 郑州 金水区', '大家一起开心的去爬山可以', '0', '1525857986', '1', '2');
INSERT INTO `user_shenqing` VALUES ('4', '46', '金', '18236777562', '河南 郑州 金水区', '额度贷款梦想', '0', '1525858579', '2', '2');
INSERT INTO `user_shenqing` VALUES ('5', '39', '小谢', '13140108021', '河南 郑州 金水区', '12345', '0', '1525860945', '1', '2');
INSERT INTO `user_shenqing` VALUES ('6', '39', '谢谢', '13140108021', '四川 绵阳 济人区', '12345', '0', '1525861120', '2', '2');
INSERT INTO `user_shenqing` VALUES ('7', '36', '菜鸟', '123456', '河南 郑州 金水区', '裕鸿国贸A', '0', '1525861511', '2', '2');
INSERT INTO `user_shenqing` VALUES ('8', '54', '李大嘴', '15936273133', '河南 郑州 金水区', '李大嘴的地址', '0', '1525870197', '2', '2');
INSERT INTO `user_shenqing` VALUES ('9', '34', '44', '444', '河南 郑州 金水区', '444', '0', '1525934484', '2', '2');
INSERT INTO `user_shenqing` VALUES ('10', '27', '44', '44', '河南 郑州 金水区', '444', '0', '1525934507', '1', '2');
INSERT INTO `user_shenqing` VALUES ('11', '34', '111', '111', '河南 郑州 金水区', '111', '0', '1526001924', '1', '2');
