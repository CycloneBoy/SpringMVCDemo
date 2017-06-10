/*
Navicat MySQL Data Transfer

Source Server         : sl
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : springdemo

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-05-30 13:21:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `pub_date` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('1', 'SpringMVC教程', '这是SpringMVC的简单教程。TEST TEST TEST', '2', '2015-03-18');
INSERT INTO `blog` VALUES ('3', 'SpringMVC教程三', '学习SpringMVC的好文章，对着例子学习，实战', '4', '2017-05-27');
INSERT INTO `blog` VALUES ('5', 'SpringMVC教程五', '这样，整个博客的增删改查操作就完成了，而这一系列的文章也即将接近尾声。还有许多的细节是可以优化的，SpringMVC还有许多优化代码的小技巧，能让你在开发时加省力，这一点是要在我们的学习和使用中去探索和思考的，特别作为一个WEB开发人员，探索和思考的能力是宝贵的。', '6', '2017-05-20');
INSERT INTO `blog` VALUES ('6', 'Java 学习教程', '在此，还有一些小的事情需要交代，让我一一道来。', '2', '2017-05-22');

-- ----------------------------
-- Table structure for document
-- ----------------------------
DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `filename` varchar(300) NOT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `create_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_document_user` (`user_id`),
  CONSTRAINT `fk_document_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of document
-- ----------------------------
INSERT INTO `document` VALUES ('2', '测试文件', '微信图片_20170417224522.jpg', '文件描述:', '1', '2017-05-27', '3');
INSERT INTO `document` VALUES ('3', '腾讯QQ', '环球车队Web孵化器群二维码.png', '腾讯聊天软件 是一个广泛应用的软件。拥有几亿用户。。。', '4', '2017-05-01', '3');
INSERT INTO `document` VALUES ('5', '360安装包', 'inst.exe', '360安装包 360安装包 360安装包', '1', '2017-05-28', '3');
INSERT INTO `document` VALUES ('6', '版本控制git', 'setup-x86_64.exe', 'Git是一款免费、开源的分布式版本控制系统，用于敏捷高效地处理任何或小或大的项目。[1]  Git的读音为/gɪt/。\r\nGit是一个开源的分布式版本控制系统，可以有效、高速的处理从很小到非常大的项目版本管理。[2]  Git 是 Linus Torvalds 为了帮助管理 Linux 内核开发而开发的一个开放源码的版本控制软件。', '1', '2017-05-31', '3');
INSERT INTO `document` VALUES ('7', '捕鱼达人', 'TankHero_4399_Ver1.0.0.0.1406601180.exe', '这个是捕鱼达人游戏', '2', '2017-05-30', '3');
INSERT INTO `document` VALUES ('8', 'QQ音乐', 'gamebox_setup_2.2.3.602.1425610754.exe', '音乐音乐音乐音乐音乐音乐音乐音乐音乐音乐音乐音乐音乐音乐音乐音乐音乐音乐音乐音乐音乐音乐音乐音乐音乐音乐音乐音乐音乐音乐', '4', '2017-05-30', '3');
INSERT INTO `document` VALUES ('9', '百度网盘', '360SMailSetup_1.0.15.603.exe', '百度网盘百度网盘百度网盘百度网盘百度网盘', '7', '2017-05-30', '3');
INSERT INTO `document` VALUES ('10', '测试软件', '360Inst_BSFree.exe', '测试软件测试软件测试软件测，我是一个测试软件', '7', '2017-05-30', '3');

-- ----------------------------
-- Table structure for install
-- ----------------------------
DROP TABLE IF EXISTS `install`;
CREATE TABLE `install` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(200) NOT NULL,
  `install_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `document_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_install_user` (`user_id`),
  KEY `fk_install_document` (`document_id`),
  CONSTRAINT `fk_install_document` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`),
  CONSTRAINT `fk_install_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of install
-- ----------------------------
INSERT INTO `install` VALUES ('1', '成功', '2017-05-28', '3', '2');
INSERT INTO `install` VALUES ('3', '安装成功', '2017-05-29', '3', '5');
INSERT INTO `install` VALUES ('4', '未安装', '2017-05-29', '3', '5');
INSERT INTO `install` VALUES ('5', '安装成功', '2017-05-29', '3', '5');
INSERT INTO `install` VALUES ('6', '安装成功', '2017-05-29', '3', '2');
INSERT INTO `install` VALUES ('7', '安装成功', '2017-05-29', '3', '2');
INSERT INTO `install` VALUES ('10', '安装成功', '2017-05-29', '3', '5');
INSERT INTO `install` VALUES ('14', '安装成功', '2017-05-30', '5', '6');
INSERT INTO `install` VALUES ('19', '安装成功', '2017-05-30', '5', '5');
INSERT INTO `install` VALUES ('20', '安装成功', '2017-05-30', '8', '2');
INSERT INTO `install` VALUES ('21', '未安装', '2017-05-30', '8', '2');
INSERT INTO `install` VALUES ('22', '安装成功', '2017-05-30', '8', '3');
INSERT INTO `install` VALUES ('23', '未安装', '2017-05-30', '8', '3');
INSERT INTO `install` VALUES ('24', '安装成功', '2017-05-30', '8', '5');
INSERT INTO `install` VALUES ('25', '未安装', '2017-05-30', '8', '5');
INSERT INTO `install` VALUES ('26', '安装成功', '2017-05-30', '11', '2');
INSERT INTO `install` VALUES ('28', '未安装', '2017-05-30', '11', '5');
INSERT INTO `install` VALUES ('29', '安装成功', '2017-05-30', '11', '6');
INSERT INTO `install` VALUES ('34', '未安装', '2017-05-30', '12', '2');
INSERT INTO `install` VALUES ('35', '安装成功', '2017-05-30', '12', '5');
INSERT INTO `install` VALUES ('39', '未安装', '2017-05-30', '13', '2');
INSERT INTO `install` VALUES ('40', '安装成功', '2017-05-30', '13', '3');
INSERT INTO `install` VALUES ('41', '未安装', '2017-05-30', '13', '3');
INSERT INTO `install` VALUES ('42', '安装成功', '2017-05-30', '13', '5');
INSERT INTO `install` VALUES ('43', '未安装', '2017-05-30', '13', '7');
INSERT INTO `install` VALUES ('46', '安装成功', '2017-05-30', '8', '9');
INSERT INTO `install` VALUES ('47', '安装成功', '2017-05-30', '8', '9');
INSERT INTO `install` VALUES ('48', '未安装', '2017-05-30', '8', '9');
INSERT INTO `install` VALUES ('49', '安装成功', '2017-05-30', '14', '2');
INSERT INTO `install` VALUES ('51', '安装成功', '2017-05-30', '14', '7');
INSERT INTO `install` VALUES ('53', '安装成功', '2017-05-30', '14', '9');
INSERT INTO `install` VALUES ('55', '安装成功', '2017-05-30', '8', '10');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'Steve', 'gaussic2', 'Steve', 'NoJob');
INSERT INTO `user` VALUES ('2', 'Bill', '111111', 'Bill', 'Gates');
INSERT INTO `user` VALUES ('3', 'Mark', '22222', 'Mark', 'Zuckerberg');
INSERT INTO `user` VALUES ('4', 'gauss', '11111111', 'Gaussic', 'D');
INSERT INTO `user` VALUES ('5', 'cycloneboy', '12345', 'cyclone', 'boy');
INSERT INTO `user` VALUES ('6', '旋风小子', '11111', '旋风', '小小子');
INSERT INTO `user` VALUES ('7', '旋风小子', '123456', '旋风', '小大子');
INSERT INTO `user` VALUES ('8', 'admin', '123456', '总管理', '我是管理员');
INSERT INTO `user` VALUES ('9', '测试用户', '222222', '张', '三');
INSERT INTO `user` VALUES ('10', 'test', '333333', '李', '四');
INSERT INTO `user` VALUES ('11', 'test2', '123456', '测试2', '用户244478888');
INSERT INTO `user` VALUES ('12', 'test3', '111111', '测试用户3', '测试用户3');
INSERT INTO `user` VALUES ('13', 'test5', '111111', '测试用户5', '我是张三');
INSERT INTO `user` VALUES ('14', 'test8', '111111', '测试用户8', '我是8');
