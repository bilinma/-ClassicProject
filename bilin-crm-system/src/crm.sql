/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.7.9-log : Database - crm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`crm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `crm`;

/*Table structure for table `t_customer` */

DROP TABLE IF EXISTS `t_customer`;

CREATE TABLE `t_customer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(20) DEFAULT NULL COMMENT '编码',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `pinyin_Name` varchar(50) DEFAULT NULL COMMENT '拼音',
  `telephone` varchar(20) NOT NULL COMMENT '手机',
  `wechat` varchar(50) DEFAULT NULL COMMENT '微信号',
  `level` int(2) DEFAULT NULL COMMENT '客户等级',
  `amount_Total` int(10) DEFAULT NULL COMMENT '消费总额',
  `is_Back` int(1) DEFAULT NULL COMMENT '是否返款',
  `create_Time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `t_customer` */

insert  into `t_customer`(`id`,`code`,`name`,`pinyin_Name`,`telephone`,`wechat`,`level`,`amount_Total`,`is_Back`,`create_Time`,`remark`) values 
(5,NULL,'马小斌',NULL,'13309257387','',1,0,NULL,'2018-05-01 11:01:28',''),
(6,NULL,'姜乐',NULL,'13321234123','',1,0,NULL,'2018-05-01 11:02:58','');

/*Table structure for table `t_menu` */

DROP TABLE IF EXISTS `t_menu`;

CREATE TABLE `t_menu` (
  `menuId` bigint(11) NOT NULL AUTO_INCREMENT,
  `menuCode` varchar(32) DEFAULT NULL COMMENT '菜单编码',
  `menuName` varchar(50) DEFAULT NULL COMMENT '菜单名',
  `menuUrl` varchar(100) DEFAULT NULL COMMENT 'URL',
  `parentMenuId` bigint(11) DEFAULT NULL COMMENT '父菜单ID',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `remark` varchar(200) DEFAULT NULL COMMENT '菜单备注',
  PRIMARY KEY (`menuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_menu` */

/*Table structure for table `t_order` */

DROP TABLE IF EXISTS `t_order`;

CREATE TABLE `t_order` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `orderNo` varchar(20) NOT NULL COMMENT '订单号',
  `orderSeq` int(10) DEFAULT NULL COMMENT '订单次序',
  `customerId` bigint(11) DEFAULT NULL COMMENT '顾客ID',
  `deskNo` varchar(3) DEFAULT NULL COMMENT '桌号',
  `amount` int(10) DEFAULT NULL COMMENT '消费金额',
  `orderStatus` int(2) DEFAULT NULL COMMENT '订单状态',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '订单备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_order` */

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_Code` varchar(10) NOT NULL COMMENT '用户名',
  `user_Name` varchar(50) NOT NULL COMMENT '用户名称',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `telephone` varchar(20) DEFAULT NULL COMMENT '电话',
  `wechat` varchar(2) DEFAULT NULL COMMENT '微信',
  `create_Time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`user_Code`,`user_Name`,`password`,`telephone`,`wechat`,`create_Time`) values 
(1,'admin','bilin','E10ADC3949BA59ABBE56E057F20F883E','1312',NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
