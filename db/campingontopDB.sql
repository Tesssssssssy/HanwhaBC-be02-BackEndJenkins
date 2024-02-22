-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: campingontopdb.ce1uochkjb2w.ap-northeast-2.rds.amazonaws.com    Database: campingontopDB
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';


/* ----------------------------------------------------------------------------------------- */
/* 데이터 삽입 */

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
                        `id` bigint NOT NULL AUTO_INCREMENT,
                        `authority` varchar(255) NOT NULL,
                        `birth_day` varchar(30) DEFAULT NULL,
                        `created_at` datetime(6) NOT NULL,
                        `email` varchar(50) NOT NULL,
                        `gender` varchar(50) DEFAULT NULL,
                        `name` varchar(30) NOT NULL,
                        `nick_name` varchar(30) NOT NULL,
                        `password` varchar(100) NOT NULL,
                        `phone_num` varchar(50) NOT NULL,
                        `status` bit(1) DEFAULT b'1' COMMENT '0: 비활성화 | 1: 활성화',
                        `updated_at` datetime(6) DEFAULT NULL,
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`),
                        UNIQUE KEY `UK_gj2fy3dcix7ph7k8684gka40c` (`name`),
                        UNIQUE KEY `UK_d2ia11oqhsynodbsi46m80vfc` (`nick_name`),
                        UNIQUE KEY `UK_gh4o0b6dwn4yexk0f96wjga26` (`phone_num`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `email_verify`;
CREATE TABLE `email_verify` (
                                `id` bigint NOT NULL AUTO_INCREMENT,
                                `email` varchar(255) DEFAULT NULL,
                                `token` varchar(255) DEFAULT NULL,
                                PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `house`;
CREATE TABLE `house` (
                         `id` bigint NOT NULL AUTO_INCREMENT,
                         `address` varchar(255) DEFAULT NULL,
                         `content` varchar(255) DEFAULT NULL,
                         `created_at` datetime(6) NOT NULL,
                         `has_air_conditioner` bit(1) DEFAULT NULL COMMENT '0: 미보유 | 1: 보유',
                         `has_bed` bit(1) DEFAULT NULL COMMENT '0: 미보유 | 1: 보유',
                         `has_heater` bit(1) DEFAULT NULL COMMENT '0: 미보유 | 1: 보유',
                         `has_washing_machine` bit(1) DEFAULT NULL COMMENT '0: 미보유 | 1: 보유',
                         `latitude` double DEFAULT NULL,
                         `like_cnt` int DEFAULT NULL,
                         `longitude` double DEFAULT NULL,
                         `max_user` int DEFAULT NULL,
                         `name` varchar(255) DEFAULT NULL,
                         `price` int DEFAULT NULL,
                         `status` bit(1) DEFAULT NULL COMMENT '0: 비활성화 | 1: 활성화',
                         `updated_at` datetime(6) DEFAULT NULL,
                         `user_id` bigint DEFAULT NULL,
                         PRIMARY KEY (`id`),
                         KEY `FK5pth02tinuneavlhgv8g4b1wa` (`user_id`),
                         CONSTRAINT `FK5pth02tinuneavlhgv8g4b1wa` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `house_image`;
CREATE TABLE `house_image` (
                               `id` bigint NOT NULL AUTO_INCREMENT,
                               `filename` varchar(255) DEFAULT NULL,
                               `house_id` bigint DEFAULT NULL,
                               PRIMARY KEY (`id`),
                               KEY `FK104wpfee48k83abm6v1k3jcq6` (`house_id`),
                               CONSTRAINT `FK104wpfee48k83abm6v1k3jcq6` FOREIGN KEY (`house_id`) REFERENCES `house` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
                        `id` bigint NOT NULL AUTO_INCREMENT,
                        `check_in` date DEFAULT NULL,
                        `check_out` date DEFAULT NULL,
                        `created_at` datetime(6) NOT NULL,
                        `price` int DEFAULT NULL,
                        `status` bit(1) DEFAULT NULL,
                        `updated_at` datetime(6) DEFAULT NULL,
                        `house_id` bigint DEFAULT NULL,
                        `user_id` bigint DEFAULT NULL,
                        PRIMARY KEY (`id`),
                        KEY `FKk0pm4nne87bouv1sewrdgrh5j` (`house_id`),
                        KEY `FKl70asp4l4w0jmbm1tqyofho4o` (`user_id`),
                        CONSTRAINT `FKk0pm4nne87bouv1sewrdgrh5j` FOREIGN KEY (`house_id`) REFERENCES `house` (`id`),
                        CONSTRAINT `FKl70asp4l4w0jmbm1tqyofho4o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `likes`;
CREATE TABLE `likes` (
                         `id` bigint NOT NULL AUTO_INCREMENT,
                         `status` bit(1) DEFAULT NULL,
                         `house_id` bigint DEFAULT NULL,
                         `user_id` bigint DEFAULT NULL,
                         PRIMARY KEY (`id`),
                         KEY `FK17ecv4nei568t7dqfblyrm9in` (`house_id`),
                         KEY `FKi2wo4dyk4rok7v4kak8sgkwx0` (`user_id`),
                         CONSTRAINT `FK17ecv4nei568t7dqfblyrm9in` FOREIGN KEY (`house_id`) REFERENCES `house` (`id`),
                         CONSTRAINT `FKi2wo4dyk4rok7v4kak8sgkwx0` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
                          `id` bigint NOT NULL AUTO_INCREMENT,
                          `imp_uid` varchar(255) DEFAULT NULL,
                          `merchant_uid` varchar(255) DEFAULT NULL,
                          `payment_status` varchar(255) DEFAULT NULL,
                          `price` int DEFAULT NULL,
                          `cart_id` bigint DEFAULT NULL,
                          PRIMARY KEY (`id`),
                          KEY `FKtpihbdn6ws0hu56camb0bg2to` (`cart_id`),
                          CONSTRAINT `FKtpihbdn6ws0hu56camb0bg2to` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `ordered_house`;
CREATE TABLE `ordered_house` (
                                 `id` bigint NOT NULL AUTO_INCREMENT,
                                 `house_id` bigint DEFAULT NULL,
                                 `orders_id` bigint DEFAULT NULL,
                                 PRIMARY KEY (`id`),
                                 KEY `FK295lx9l685lj5osiiwctigsd6` (`house_id`),
                                 KEY `FK9egbry4gtyayj6i9aqw1afm1j` (`orders_id`),
                                 CONSTRAINT `FK295lx9l685lj5osiiwctigsd6` FOREIGN KEY (`house_id`) REFERENCES `house` (`id`),
                                 CONSTRAINT `FK9egbry4gtyayj6i9aqw1afm1j` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `review`;
CREATE TABLE `review` (
                          `id` bigint NOT NULL AUTO_INCREMENT,
                          `content` varchar(255) DEFAULT NULL,
                          `created_at` datetime(6) NOT NULL,
                          `rating` int NOT NULL,
                          `status` bit(1) DEFAULT NULL COMMENT '0: 비활성화 | 1: 활성화',
                          `title` varchar(255) DEFAULT NULL,
                          `updated_at` datetime(6) DEFAULT NULL,
                          `orders_id` bigint DEFAULT NULL,
                          PRIMARY KEY (`id`),
                          KEY `FK39qu1l8wwvyet1jywdp6hnh6c` (`orders_id`),
                          CONSTRAINT `FK39qu1l8wwvyet1jywdp6hnh6c` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `review_image`;
CREATE TABLE `review_image` (
                                `id` bigint NOT NULL AUTO_INCREMENT,
                                `filename` varchar(255) DEFAULT NULL,
                                `review_id` bigint DEFAULT NULL,
                                PRIMARY KEY (`id`),
                                KEY `FK16wp089tx9nm0obc217gvdd6l` (`review_id`),
                                CONSTRAINT `FK16wp089tx9nm0obc217gvdd6l` FOREIGN KEY (`review_id`) REFERENCES `review` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




/* ----------------------------------------------------------------- */
/* 데이터 삽입 */

/* user */
LOCK TABLES `user` WRITE;
INSERT INTO `user` VALUES (1,'ROLE_SELLER','1999-11-11','2024-02-05 01:50:34.913446','dlaxodn9999@gmail.com','M','dlaxodn9999','dlaxodn9999','{bcrypt}$2a$10$UWK8JY.eozEbCPiXHtMIe.p8042VUBPwuuidd23qCh1W/euihlsUm','010-1111-1111',_binary '','2024-02-05 01:54:15.929377'),
                          (2,'ROLE_SELLER',NULL,'2024-02-05 02:14:34.791767','zofnapf@naver.com','M','한경훈','한경경','{bcrypt}$2a$10$YwRtqjzMWtrnoyhgNZwRZOKS0F5MPUDZekrYNnYTZL8BX.730ERT6','010-2936-0247',_binary '','2024-02-05 02:14:58.554166'),
                          (3,'ROLE_USER','1995-04-04','2024-02-05 02:20:33.982783','ell950404@gmail.com','M','leejunguk','jgg44','{bcrypt}$2a$10$YwSidPGcscwGi5a02zMYV.0UtoNNGF/t29EBjn.y3yJiTMeEkkDUa','010-1234-5678',_binary '','2024-02-05 02:20:53.540980'),
                          (4,'ROLE_SELLER',NULL,'2024-02-05 02:32:00.978727','poil4291@gmail.com','M','Jang','nickname','{bcrypt}$2a$10$zqeznt/e80prMepBYa391OoKJKL.2eWzY7VkYQSvxK.EJv6XiZdEW','010-1234-5786',_binary '\0','2024-02-05 02:32:00.978731'),
                          (89,'ROLE_USER',NULL,'2024-02-05 06:56:46.972358','poil42@naver.com','M','JangDae','nicknameap','{bcrypt}$2a$10$i33Uwz1a3bF2BnraK5X3S.L8eubTtUrkTTC0IhHdvgm.yI1li87sK','010-2545-6789',_binary '','2024-02-05 06:57:22.497409'),
                          (122,'ROLE_USER',NULL,'2024-02-05 10:37:46.172531','ewoo97@naver.com','M','오렌지카라멜','오렌지카라멜','{bcrypt}$2a$10$iylRe.8.vyxKrG9CtUlyh.i8KkNZYts8YF2SMp4y./YhWrt.rGkem','010-2222-4444',_binary '','2024-02-05 10:37:55.800921'),
                          (198,'ROLE_USER',NULL,'2024-02-06 00:20:05.491358','test01@test.com','M','poll','닉네임11','{bcrypt}$2a$10$V9eBuCw82hGJGBViJW/Nb.5uSxT5fsuRNHxCWf6HOKd5Jj6dRnBwq','010-1223-2225',_binary '\0','2024-02-06 00:20:05.491361'),
                          (199,'ROLE_USER',NULL,'2024-02-06 00:22:56.409676','poil422023@gmail.com','M','JangDaeHyeon','닉네임','{bcrypt}$2a$10$vmjL1UHUf.NsReZrmAPH1.9DSpK7aGeEV42w5PmSWgXMIK1Dwtr0.','010-9977-5566',_binary '','2024-02-06 00:23:45.237198');
UNLOCK TABLES;


/* email_verify */
LOCK TABLES `email_verify` WRITE;
INSERT INTO `email_verify` VALUES (1,'dlaxodn9999@gmail.com','06749009-f0a3-4a48-80ff-090930f1cbf2'),
                                  (2,'zofnapf@naver.com','e7c773d8-8e7a-4f57-b4e4-56071546614f'),
                                  (3,'ell950404@gmail.com','489c9faa-c6bf-4ba6-ae98-2c040b750da6'),
                                  (9,'poil42@naver.com','94e557a9-17ed-4861-95d1-40ac947f4992'),
                                  (16,'ewoo97@naver.com','6502f6b9-06c9-43dd-b2aa-0865460c1b85'),
                                  (17,'test01@test.com','40cdb400-3083-4883-91a4-8545a3afa050'),
                                  (18,'poil422023@gmail.com','880e79f3-3777-4f92-93d4-6eb0df751953');
UNLOCK TABLES;


/* house */
LOCK TABLES `house` WRITE;
INSERT INTO `house` VALUES (4,'서울시 동작구 보라매','실내에서 홍대 밤하늘을 볼 수 있는 낭만적 모임공간','2024-02-05 02:38:55.088314',_binary '',_binary '',_binary '',_binary '',37.4555,1,126.5355,4,'루탑 어필 파티',1000000,_binary '','2024-02-06 02:04:37.521302',2),
                           (5,'경기도 성남시 수정구 산성대로','도심 속 아늑한 쉼터 꽃탑입니다.','2024-02-05 02:49:09.143490',_binary '',_binary '',_binary '',_binary '',30.5454,2,126.5656,16,'루프탑 & 바베큐&편안한 분위기',100000,_binary '','2024-02-05 16:11:17.447260',3),
                           (6,'경기도 가평군','자연 속에서의 평화로운 모임을 위한 공간','2024-02-05 02:51:29.271182',_binary '',_binary '',_binary '',_binary '',37.8319,2,127.5095,4,'숲속 은신처 루프탑 파티',130000,_binary '','2024-02-06 05:58:10.446056',2),
                           (7,'서울시 마포구','고층 건물의 최상층에서 멋진 도시 전망을 즐길 수 있는 고급 모임공간.','2024-02-05 02:52:20.092977',_binary '',_binary '',_binary '',_binary '',37.5665,0,126.978,4,'도시 전망대',1000000,_binary '','2024-02-05 02:52:20.092981',2);
UNLOCK TABLES;



/* house_image */
LOCK TABLES `house_image` WRITE;
INSERT INTO `house_image` VALUES (9,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/818eb6fc-2698-4072-8446-f1b7f7f49fea_169794731_dc083d76e548b4d867a8f8f653d8c5b3.jpg',4),
                                 (10,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/327a6c89-7bf8-4aee-a117-46107fcdf4d6_170005225_78770f74711ac5110cf222416d2b1d40.jpg',4),
                                 (11,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/92b1cd0e-8dbc-41ef-a12c-ced5a830c307_170005236_454cee04bbe9d9de819166997bc495fb.jpg',4),
                                 (12,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/20f09d28-585b-4634-aeba-c5c7ac42a6ea_169743831_c27528df94380baebd03d2145b9c5390.jpg',4),
                                 (13,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/301a5737-4946-40fd-9b17-8fc3a5735a52_170306764_8798b0ebb2128baae62995a3bfb5f12a.jpg',5),
                                 (14,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/27330794-948d-4070-99ef-0e0623f2ea6a_168629366_d8dc80ec3700e272a176b9418343617e.jpg',5),
                                 (15,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/61b04979-c84e-4539-8243-776854219453_168629529_2bd9b9dbfe9a8065c27489f1b7d001a1.jpg',5),
                                 (16,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/36916411-f311-455f-9038-4f15d8935b10_170306762_e0bcc1847b405c044035addb0bfa5e86.jpg',5),
                                 (17,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/99ea157f-7d9d-4162-8327-ce8e9bbbe625_170306761_8e0de9a23099b0b6230df0cd433aff77.jpg',5),
                                 (18,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/45a566d2-109c-4103-83f7-503775b400d5_169018515_31a8622ae30f9d6e80d6e7c5c1e6f5ec.jpg',6),
                                 (19,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/e3239d36-2101-4a7f-95d4-9e87da5ca290_169018522_b437e98ad0b88ef0d6419796efb69895.jpg',6),
                                 (20,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/bc11472c-0c78-4354-b102-e0ea8c4b0a61_169042686_28f5129b38ad6497a391ce9646eb20fe.jpg',6),
                                 (21,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/f72b6d29-8186-4220-8e2d-fabe94fcf1fb_169042688_0c6904245271fed92f2f17ef98423666.png',6),
                                 (22,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/163e831d-cadf-495b-83be-a22084b8d4d4_169867483_799bad5a3b514f096e69bbc4a7896cd9.jpg',7),
                                 (23,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/c96100f0-835a-4cae-89da-4ce7c6ce0b0e_169867483_156005c5baf40ff51a327f1c34f2975b.jpg',7),
                                 (24,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/58605e60-b5a4-41cf-a3ab-b4b63548762c_169919553_7d30c229376af5fb021d53c30f22259a%20%281%29.jpeg',7),
                                 (25,'https://campingontop-s3.s3.ap-northeast-2.amazonaws.com/house/2024/02/05/d0f6686c-0e67-4540-bc22-d750137b50fa_169919553_7d30c229376af5fb021d53c30f22259a.jpeg',7);
UNLOCK TABLES;



/* cart */
LOCK TABLES `cart` WRITE;
UNLOCK TABLES;



/* likes */
LOCK TABLES `likes` WRITE;
UNLOCK TABLES;



LOCK TABLES `orders` WRITE;
UNLOCK TABLES;


LOCK TABLES `ordered_house` WRITE;
UNLOCK TABLES;



LOCK TABLES `review` WRITE;
UNLOCK TABLES;



LOCK TABLES `review_image` WRITE;
UNLOCK TABLES;



SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
