/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 5.5.54 : Database - bank
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bank` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bank`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `Cardno` varchar(16) NOT NULL COMMENT '16位数字组成的卡号',
  `Password` varchar(6) NOT NULL COMMENT '6位数字的密码',
  `Account_Balance` double(11,2) NOT NULL COMMENT '账号余额',
  `Status` int(1) NOT NULL COMMENT '1位正常，0位冻结',
  PRIMARY KEY (`Cardno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `account` */

insert  into `account`(`Cardno`,`Password`,`Account_Balance`,`Status`) values ('1','22',8587.23,1),('2','admin',2533.15,1),('3','admin',4353.12,0);

/*Table structure for table `transaction_record` */

DROP TABLE IF EXISTS `transaction_record`;

CREATE TABLE `transaction_record` (
  `Id` int(10) NOT NULL AUTO_INCREMENT,
  `Cardno` varchar(16) DEFAULT NULL COMMENT '对应account表的主键',
  `Transaction_date` date NOT NULL COMMENT '交易时间',
  `expense` double(11,2) NOT NULL COMMENT '取出金额',
  `income` double(11,2) DEFAULT NULL COMMENT '存入金额',
  `Account_balance` double(11,2) DEFAULT NULL COMMENT '交易完成时的余额',
  `Transaction_type` varchar(10) NOT NULL COMMENT '存款，取款，消费',
  `remark` varchar(20) DEFAULT NULL COMMENT '交易备注',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

/*Data for the table `transaction_record` */

insert  into `transaction_record`(`Id`,`Cardno`,`Transaction_date`,`expense`,`income`,`Account_balance`,`Transaction_type`,`remark`) values (5,'1','2019-01-17',10.00,0.00,8722.23,'转出','1月份工资'),(6,'2','2019-01-17',0.00,10.00,2408.15,'转入','1月份工资'),(7,'1','2019-01-17',100.00,0.00,8622.23,'转出','1月份工资'),(8,'2','2019-01-17',0.00,100.00,2508.15,'转入','1月份工资'),(9,'1','2019-01-17',5.00,0.00,8617.23,'转出','1月份工资'),(10,'2','2019-01-17',0.00,5.00,2513.15,'转入','1月份工资'),(11,'1','2019-01-18',10.00,0.00,8607.23,'转出','1月份工资'),(12,'2','2019-01-18',0.00,10.00,2523.15,'转入','1月份工资'),(13,'1','2019-01-18',10.00,0.00,8607.23,'转出','1月份工资'),(14,'1','2019-01-18',0.00,10.00,8607.23,'转入','1月份工资'),(15,'1','2019-01-18',10.00,0.00,8597.23,'转出','1月份工资'),(16,'2','2019-01-18',0.00,10.00,2533.15,'转入','1月份工资'),(17,'1','2019-01-18',10.00,0.00,8597.23,'转出','1月份工资'),(18,'1','2019-01-18',0.00,10.00,8597.23,'转入','1月份工资'),(19,'1','2019-01-18',10.00,0.00,8587.23,'转出','1月份工资'),(20,'3','2019-01-18',0.00,10.00,4353.12,'转入','1月份工资'),(21,'1','2019-01-18',10.00,0.00,8587.23,'转出','1月份工资'),(22,'1','2019-01-18',0.00,10.00,8587.23,'转入','1月份工资'),(23,'1','2019-01-18',10.00,0.00,8587.23,'转出','1月份工资'),(24,'1','2019-01-18',0.00,10.00,8587.23,'转入','1月份工资'),(25,'1','2019-01-18',10.00,0.00,8587.23,'转出','1月份工资'),(26,'1','2019-01-18',0.00,10.00,8587.23,'转入','1月份工资'),(27,'1','2019-01-18',10.00,0.00,8587.23,'转出','1月份工资'),(28,'1','2019-01-18',0.00,10.00,8587.23,'转入','1月份工资'),(29,'1','2019-01-18',10.00,0.00,8587.23,'转出','1月份工资'),(30,'1','2019-01-18',0.00,10.00,8587.23,'转入','1月份工资');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
