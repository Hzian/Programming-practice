/*
 Navicat Premium Data Transfer

 Source Server         : JDBC
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : 192.168.159.131:3306
 Source Schema         : OrderingSystem

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 23/12/2018 11:21:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for discount_dishes
-- ----------------------------
DROP TABLE IF EXISTS `discount_dishes`;
CREATE TABLE `discount_dishes`  (
  `shop_na` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dish_na` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dish_pri` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`dish_na`, `shop_na`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of discount_dishes
-- ----------------------------
INSERT INTO `discount_dishes` VALUES ('重庆鸡公煲', '榨菜', 1.00);
INSERT INTO `discount_dishes` VALUES ('黄焖鸡米饭 ', '米饭 ', 0.50);
INSERT INTO `discount_dishes` VALUES ('重庆鸡公煲', '腌萝卜', 0.00);
INSERT INTO `discount_dishes` VALUES ('三顾冒菜', '花生米', 0.00);
INSERT INTO `discount_dishes` VALUES ('三顾冒菜', '锅巴', 0.00);
INSERT INTO `discount_dishes` VALUES ('黄焖鸡米饭', '鸡腿', 3.00);

-- ----------------------------
-- Table structure for dishes
-- ----------------------------
DROP TABLE IF EXISTS `dishes`;
CREATE TABLE `dishes`  (
  `shop_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dish_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dish_price` decimal(10, 2) NOT NULL,
  PRIMARY KEY (`shop_name`, `dish_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dishes
-- ----------------------------
INSERT INTO `dishes` VALUES ('三顾冒菜', '啤酒', 3.00);
INSERT INTO `dishes` VALUES ('三顾冒菜', '自选冒菜', 15.00);
INSERT INTO `dishes` VALUES ('三顾冒菜', '酸梅汤', 3.00);
INSERT INTO `dishes` VALUES ('重庆鸡公煲', '排骨煲', 22.00);
INSERT INTO `dishes` VALUES ('重庆鸡公煲', '猪蹄煲', 25.00);
INSERT INTO `dishes` VALUES ('重庆鸡公煲', '鸡公煲', 15.00);
INSERT INTO `dishes` VALUES ('黄焖鸡米饭', '黄焖排骨', 15.00);
INSERT INTO `dishes` VALUES ('黄焖鸡米饭', '黄焖豆腐', 12.00);
INSERT INTO `dishes` VALUES ('黄焖鸡米饭', '黄焖鸡（中）', 15.00);
INSERT INTO `dishes` VALUES ('黄焖鸡米饭', '黄焖鸡（大）', 18.00);
INSERT INTO `dishes` VALUES ('黄焖鸡米饭', '黄焖鸡（小）', 12.00);

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login`  (
  `identity` tinyint(4) NOT NULL,
  `usr_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `pwd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`identity`, `usr_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES (1, '戴威', '123');
INSERT INTO `login` VALUES (1, '李彦宏', '123');
INSERT INTO `login` VALUES (1, '罗永浩', '123');
INSERT INTO `login` VALUES (2, '三员工', '123');
INSERT INTO `login` VALUES (2, '重员工', '123');
INSERT INTO `login` VALUES (2, '黄员工', '123');
INSERT INTO `login` VALUES (3, '美团1号', '123');
INSERT INTO `login` VALUES (3, '美团2号', '123');
INSERT INTO `login` VALUES (3, '美团3号', '123');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `no` int(8) NOT NULL AUTO_INCREMENT,
  `shop_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `who` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `done` tinyint(255) NOT NULL,
  PRIMARY KEY (`no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (10, '重庆鸡公煲', '重庆鸡公煲\n订单时间：12月09日-08时41分\n顾客名：罗永浩\n支付方式：工资支付\n配送地址：锤子科技\n--------菜品--------\n排骨煲    2份\n榨菜    1份\n--------------------\n备注：不要辣椒\n订单总计：45.0 元\n', '美团1号', 1);

-- ----------------------------
-- Table structure for usr_shop
-- ----------------------------
DROP TABLE IF EXISTS `usr_shop`;
CREATE TABLE `usr_shop`  (
  `usr_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `shop_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`shop_name`, `usr_name`) USING BTREE,
  UNIQUE INDEX `u1`(`usr_name`) USING BTREE,
  UNIQUE INDEX `u2`(`shop_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usr_shop
-- ----------------------------
INSERT INTO `usr_shop` VALUES ('三员工', '三顾冒菜');
INSERT INTO `usr_shop` VALUES ('重员工', '重庆鸡公煲');
INSERT INTO `usr_shop` VALUES ('黄员工', '黄焖鸡米饭');

SET FOREIGN_KEY_CHECKS = 1;
