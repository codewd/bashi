/*
 Navicat MySQL Data Transfer

 Source Server         : ccc
 Source Server Version : 50163
 Source Host           : localhost
 Source Database       : bashi

 Target Server Version : 50163
 File Encoding         : utf-8

 Date: 05/29/2015 20:48:55 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `Admin`
-- ----------------------------
DROP TABLE IF EXISTS `Admin`;
CREATE TABLE `Admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `psw` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `bz` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Table structure for `t_address`
-- ----------------------------
DROP TABLE IF EXISTS `t_address`;
CREATE TABLE `t_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `father_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK77298F294B64E9DE` (`father_id`),
  CONSTRAINT `FK77298F294B64E9DE` FOREIGN KEY (`father_id`) REFERENCES `t_address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `t_address`
-- ----------------------------
BEGIN;
INSERT INTO `t_address` VALUES ('1', '北京', null), ('2', '密云', '1'), ('3', '怀柔', '1'), ('4', '通州', '1'), ('7', '云南', null), ('8', '大理', '7'), ('9', '丽江', '7'), ('10', '内蒙古', null), ('11', '额济纳', '10');
COMMIT;

-- ----------------------------
--  Table structure for `t_gonglue`
-- ----------------------------
DROP TABLE IF EXISTS `t_gonglue`;
CREATE TABLE `t_gonglue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `miaoshu` varchar(2000) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin,
  `filePath` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `tjzs` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `headImg` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `t_gonglue`
-- ----------------------------
BEGIN;
INSERT INTO `t_gonglue` VALUES ('1', 'sdas', 'sda', 0x3c703e78787878783c2f703e2c20, '1111', '2', 'e4afb735-c73a-474e-861d-901d06554175.jpg', '2015-05-27 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `t_jiaonuan`
-- ----------------------------
DROP TABLE IF EXISTS `t_jiaonuan`;
CREATE TABLE `t_jiaonuan` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `idCard` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `yuanwang` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `t_jiaonuan`
-- ----------------------------
BEGIN;
INSERT INTO `t_jiaonuan` VALUES ('3', '11', '3', '2', '4', '5', null);
COMMIT;

-- ----------------------------
--  Table structure for `t_news`
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin,
  `auther` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `click` int(11) DEFAULT NULL,
  `ip` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `topImg` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `filePath` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `brief` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `url` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `flag` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCB606BBEE6EEFBEE` (`type_id`),
  CONSTRAINT `FKCB606BBEE6EEFBEE` FOREIGN KEY (`type_id`) REFERENCES `t_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `t_news`
-- ----------------------------
BEGIN;
INSERT INTO `t_news` VALUES ('1', '巴克一族', 0x3c703ee69292e5a4a7e5a596e8b59be79a84e7a9bae997b4e5958ae8bf98e698afe79c8be8a781e79a843c2f703e, 'Demo', '1', null, 'e4344aff-b7e0-4dfd-a299-6b43e9ce62f9.jpg', null, '山山水水', 'http://www.baidu.com', '1', '2015-05-28 00:00:00', '5'), ('2', '首页图文1', 0x3c703ee9a696e9a1b5e59bbee69687313c2f703e, '王栋', '1', null, '12df6987-4131-4622-a85e-67088909a039.jpg', null, '1', 'http://www.baidu.com', '1', '2015-05-28 00:00:00', '2'), ('3', '首页图文2', 0x3c703ee6b0a2e6b094e790833c2f703e, '王栋', '1', null, '66f1030c-d180-464a-974f-cba375292987.jpg', null, '1', 'http://www.baidu.com', '1', '2015-05-29 00:00:00', '2'), ('4', '1', '', '1', '1', null, '1fae937e-2b5e-4dde-8bc9-074d5228e8cb.jpg', null, '', '', null, null, '7'), ('5', '111', '', '11', '1', null, '15ce788d-458a-4ea1-8ba4-17b1156461e8.jpg', null, '', '', null, null, '2'), ('6', '2', '', '2', '1', null, '58825631-df91-4fb5-a338-6282bc240738.jpg', null, '', '', null, null, '7'), ('7', '巴士旅游节1', '', '', null, null, 'e556459d-cc52-43e3-a868-9cd7b1bbcce3.jpg', null, '所有旅游套餐都是半价哦，敬请期待吧。', '', null, '2015-05-29 07:24:53', '1'), ('8', '巴士旅游节2', '', '', null, null, 'ce7df143-6a91-482b-ade6-c7c8ee1c3555.jpg', null, '所有旅游套餐都是半价哦，敬请期待吧。', '', null, '2015-05-15 07:24:47', '1'), ('9', '巴克一族', 0x3c703e78e683b3e683b3e683b3e683b3e683b3e683b3e683b3e683b3e683b3e683b33c2f703e, '王栋', '1', null, '24fc1852-30ce-4414-8e72-e9e100acbb29.jpg', null, '11111111111111111111111111dkjasdka.sjdlas拉开圣诞节啊镂空设计拉开时间到了卡时间啊大死角阿莱克斯大家', '事实上', null, '2015-05-27 00:00:00', '5');
COMMIT;

-- ----------------------------
--  Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `idCard` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `yuanwang` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `cr` int(11) DEFAULT NULL,
  `lr` int(11) DEFAULT NULL,
  `et` int(11) DEFAULT NULL,
  `ht` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `gotime` date DEFAULT NULL,
  `backtime` date DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `t_order`
-- ----------------------------
BEGIN;
INSERT INTO `t_order` VALUES ('2', '肖跃凤', '1552201199503011522', '15771264396', '北京', '邦迪海滩还是澳大利亚人休闲娱乐的地方，海水很蓝，甚是美丽。邦迪海滩（Bondi Beach）的名字来自于原居民的语言bondi，意思是海水拍岸的声浪。', '3', '0', '0', null, '2015-05-23', '2015-05-30', '2015-05-22 15:33:24'), ('4', '肖跃凤', '152201199503011522', '15771264396', '内蒙古', '震荡', '1', '0', '0', null, '2015-05-29', '2015-08-27', '2015-05-22 16:42:22'), ('5', '森', '152201199503011522', '15771264396', '北城', '', '1', '0', '0', null, '2015-05-08', '2015-05-28', '2015-05-22 16:42:22'), ('6', '王栋', '', '1', '', '', '1', '0', '0', null, null, null, '2015-05-22 16:42:22'), ('9', '肖跃凤', '', '', 'abdd', '', '1', '0', '0', null, null, null, '2015-05-22 16:42:22'), ('10', '', '', '', '', '', '1', '0', '0', null, null, null, '2015-05-26 22:45:58'), ('11', '', '', '', '', '', '1', '0', '0', null, null, null, '2015-05-26 22:45:58'), ('12', '', '', '', '', '', '1', '0', '0', null, null, null, '2015-05-26 22:45:58'), ('13', '', '', '', '', '', '1', '0', '0', null, null, null, '2015-05-26 22:45:58'), ('14', '', '', '', '', '', '1', '0', '0', null, null, null, '2015-05-26 22:45:58'), ('15', '', '', '', '', '', '1', '0', '0', null, null, null, '2015-05-27 15:48:11');
COMMIT;

-- ----------------------------
--  Table structure for `t_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `father_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKCB63702538EDBA8C` (`father_id`),
  CONSTRAINT `FKCB63702538EDBA8C` FOREIGN KEY (`father_id`) REFERENCES `t_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `t_type`
-- ----------------------------
BEGIN;
INSERT INTO `t_type` VALUES ('1', '将要到来的狂欢', null), ('2', '首页图文', null), ('5', '巴客一族', null), ('7', '前三焦点图', null);
COMMIT;

-- ----------------------------
--  Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(30) COLLATE utf8_bin DEFAULT NULL,
  `psw` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `idCard` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `t_user`
-- ----------------------------
BEGIN;
INSERT INTO `t_user` VALUES ('5', '132', '122', null, null, null, null, null, null), ('6', '11', '11', null, null, null, null, '1', null), ('7', '1', '1', null, null, null, null, '1', null);
COMMIT;

-- ----------------------------
--  Table structure for `t_zhuanti`
-- ----------------------------
DROP TABLE IF EXISTS `t_zhuanti`;
CREATE TABLE `t_zhuanti` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `zbt` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `fbt` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `headImg` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `dzzz` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `jianjie` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `luxian` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `t_zhuanti`
-- ----------------------------
BEGIN;
INSERT INTO `t_zhuanti` VALUES ('1', '专题1', '¥ 1000', 'beb79b2f-e93f-4cbb-b91f-3a8cc1d7e647.jpg', 'http://www.baidu.com', 'sss', '北京－天津0天津－广州');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
