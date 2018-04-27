/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : coin_fan2

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-04-27 14:44:12
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
INSERT INTO `admin` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '127.0.0.1', '1524795200', '超级管理员');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', '', '', '', '', '', '', '', '', '', '50.0000', '1000', '1000', '100');

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
  `suanli` varchar(10) DEFAULT '0' COMMENT '绑定设备给自己返多少个算力',
  `charge` varchar(10) DEFAULT '0' COMMENT '手续费多少才算激活 （pos）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device
-- ----------------------------
INSERT INTO `device` VALUES ('1', 'Pos机', '3', '1', '10.0000', '50.0000', '25');
INSERT INTO `device` VALUES ('2', '路由器', '100', '0', '0.0000', '60.0000', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_sn
-- ----------------------------
INSERT INTO `device_sn` VALUES ('1', '1', '8850001106735250', '', '0');
INSERT INTO `device_sn` VALUES ('2', '1', '8850001109968485', '', '0');
INSERT INTO `device_sn` VALUES ('3', '1', '8850001106735009', '', '0');
INSERT INTO `device_sn` VALUES ('5', '2', 'dddd', '2222123123', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_xiaofei_log
-- ----------------------------
INSERT INTO `device_xiaofei_log` VALUES ('1', '8850001106735250', '741446', '20180302', '0.74167824', '1600.0000', '12.6000', '1524732813', '0');
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
  `device_id` int(11) DEFAULT NULL COMMENT '这个对应我的设备id user_device',
  `type` tinyint(4) DEFAULT NULL COMMENT '1是原力币 2是算力',
  `num` decimal(10,4) DEFAULT '0.0000' COMMENT '0是未激活 1是已激活',
  `status` tinyint(4) DEFAULT NULL COMMENT '0未成功返 1成功返',
  `createdate` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='邀请返利记录';

-- ----------------------------
-- Records of myinvite
-- ----------------------------
INSERT INTO `myinvite` VALUES ('34', '1', '10', '1', '10.0000', '0', '1524807190');
INSERT INTO `myinvite` VALUES ('35', '1', '11', '1', '10.0000', '1', '1524807196');
INSERT INTO `myinvite` VALUES ('36', '1', '12', '1', '10.0000', '1', '1524807203');
INSERT INTO `myinvite` VALUES ('37', '27', '12', '2', '10.2900', '1', '1524807215');
INSERT INTO `myinvite` VALUES ('38', '27', '11', '2', '31.7500', '1', '1524807215');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mytransfer
-- ----------------------------
INSERT INTO `mytransfer` VALUES ('1', '27', '27', '40.0000', '1524723571', 'dd', '158');
INSERT INTO `mytransfer` VALUES ('2', '27', '28', '40.0000', '1524723705', 'aadf', '159');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myzc
-- ----------------------------
INSERT INTO `myzc` VALUES ('1', '27', 'LVLxXuzR7GtYaXAg7yBy4TvxXnSRDH6Ts8', null, '11.0000', '1524206735', '2', null);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='每天返利记录';

-- ----------------------------
-- Records of sys_fl_log
-- ----------------------------
INSERT INTO `sys_fl_log` VALUES ('1', '1', '100000000', '100.00000000', '0.00000002', '1524810048');
INSERT INTO `sys_fl_log` VALUES ('2', '2', '100000000', '200.00000000', '0.00000004', '1524810048');
INSERT INTO `sys_fl_log` VALUES ('3', '3', '100000000', '350.00000000', '0.00000007', '1524810048');
INSERT INTO `sys_fl_log` VALUES ('4', '4', '100000000', '440.00000000', '0.00000009', '1524810048');
INSERT INTO `sys_fl_log` VALUES ('5', '25', '100000000', '550.00000000', '0.00000011', '1524810048');
INSERT INTO `sys_fl_log` VALUES ('6', '26', '100000000', '50.00000000', '0.00000001', '1524810048');
INSERT INTO `sys_fl_log` VALUES ('7', '27', '100000000', '42.04000000', '0.00000001', '1524810048');
INSERT INTO `sys_fl_log` VALUES ('8', '28', '100000000', '30.00000000', '0.00000001', '1524810048');
INSERT INTO `sys_fl_log` VALUES ('9', '29', '100000000', '21.00000000', '0.00000000', '1524810048');
INSERT INTO `sys_fl_log` VALUES ('10', '30', '100000000', '88.00000000', '0.00000002', '1524810048');
INSERT INTO `sys_fl_log` VALUES ('11', '1', '100000000', '100.00000000', '0.00000002', '1524810237');
INSERT INTO `sys_fl_log` VALUES ('12', '2', '100000000', '200.00000000', '0.00000004', '1524810237');
INSERT INTO `sys_fl_log` VALUES ('13', '3', '100000000', '350.00000000', '0.00000007', '1524810238');
INSERT INTO `sys_fl_log` VALUES ('14', '4', '100000000', '440.00000000', '0.00000009', '1524810238');
INSERT INTO `sys_fl_log` VALUES ('15', '25', '100000000', '550.00000000', '0.00000011', '1524810238');
INSERT INTO `sys_fl_log` VALUES ('16', '26', '100000000', '50.00000000', '0.00000001', '1524810238');
INSERT INTO `sys_fl_log` VALUES ('17', '27', '100000000', '42.04000000', '0.00000001', '1524810238');
INSERT INTO `sys_fl_log` VALUES ('18', '28', '100000000', '30.00000000', '0.00000001', '1524810238');
INSERT INTO `sys_fl_log` VALUES ('19', '30', '100000000', '88.00000000', '0.00000002', '1524810238');

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '0', '15890143120', '15890143120', 'e10adc3949ba59abbe56e057f20f883e', '96e79218965eb72c92a549dd5a330112', '马帅', '123', '1524118586', '1', '中国', '河南', '郑州', '0');
INSERT INTO `user` VALUES ('2', '1', '15890143121', '15890143121', 'e10adc3949ba59abbe56e057f20f883e', '96e79218965eb72c92a549dd5a330112', '马帅1', null, '1524118712', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('3', '1', '15890143122', '15890143122', 'e10adc3949ba59abbe56e057f20f883e', '96e79218965eb72c92a549dd5a330112', '马帅1', null, '1524118863', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('4', '1', '15890143124', '15890143124', 'e10adc3949ba59abbe56e057f20f883e', '96e79218965eb72c92a549dd5a330112', '马帅1', null, '1524118984', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('25', '1', '15890143125', '15890143125', 'e10adc3949ba59abbe56e057f20f883e', '96e79218965eb72c92a549dd5a330112', '马帅', null, '1524122672', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('26', '1', '15890143126', '15890143126', 'e10adc3949ba59abbe56e057f20f883e', '96e79218965eb72c92a549dd5a330112', '马帅', null, '1524122748', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('27', '1', '15890143123', '15890143123', 'e10adc3949ba59abbe56e057f20f883e', '96e79218965eb72c92a549dd5a330112', 'mash', '111', '1524122810', '1', null, null, null, '1');
INSERT INTO `user` VALUES ('28', '1', '15890143127', '15890143127', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', 'adfa', null, '1524534028', '1', null, null, null, '0');
INSERT INTO `user` VALUES ('29', '27', '15890143128', '15890143128', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', 'asdfasdf', null, null, '1', null, null, null, '0');
INSERT INTO `user` VALUES ('30', '27', '15890143129', '15890143129', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', 'sd撒旦法', null, null, '1', null, null, null, '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_certification
-- ----------------------------
INSERT INTO `user_certification` VALUES ('2', '27', '2018-04-26/5ae15fd7157ab.png', '2018-04-26/5ae15fd71a645.png', '2018-04-26/5ae15fd71afa0.png', '1524719575', '1', 'mash', '111');

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_coin
-- ----------------------------
INSERT INTO `user_coin` VALUES ('1', '1', '20.00000004', '10.00000000', '', '100.00000000');
INSERT INTO `user_coin` VALUES ('2', '2', '0.00000008', '0.00000000', '', '200.00000000');
INSERT INTO `user_coin` VALUES ('3', '3', '0.00000014', '0.00000000', '', '350.00000000');
INSERT INTO `user_coin` VALUES ('4', '4', '0.00000018', '0.00000000', '', '440.00000000');
INSERT INTO `user_coin` VALUES ('25', '25', '0.00000022', '0.00000000', '', '550.00000000');
INSERT INTO `user_coin` VALUES ('26', '26', '0.00000002', '0.00000000', '', '50.00000000');
INSERT INTO `user_coin` VALUES ('27', '27', '110.84000002', '0.00000000', 'LetwDKRT2T3MkufRH7SYYHvt1VhCQX1dFi', '42.04000000');
INSERT INTO `user_coin` VALUES ('28', '28', '240.24000002', '0.00000000', '', '30.00000000');
INSERT INTO `user_coin` VALUES ('29', '29', '200.24000000', '0.00000000', '', '21.00000000');
INSERT INTO `user_coin` VALUES ('30', '30', '100.12000004', '0.00000000', '', '88.00000000');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_device
-- ----------------------------
INSERT INTO `user_device` VALUES ('10', '27', '1', '8850001106735250', '', '1524807190', '0');
INSERT INTO `user_device` VALUES ('11', '27', '1', '8850001109968485', '', '1524807196', '1');
INSERT INTO `user_device` VALUES ('12', '27', '1', '8850001106735009', '', '1524807203', '1');

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
INSERT INTO `user_qianbao` VALUES ('1', '27', '测试', 'LVLxXuzR7GtYaXAg7yBy4TvxXnSRDH6Ts8', null, '1');
