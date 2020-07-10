/*
 Navicat Premium Data Transfer

 Source Server         : MySql_GSW
 Source Server Type    : MySQL
 Source Server Version : 50544
 Source Host           : localhost:3306
 Source Schema         : taffle_system

 Target Server Type    : MySQL
 Target Server Version : 50544
 File Encoding         : 65001

 Date: 09/07/2020 18:37:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for taffle_bill
-- ----------------------------
DROP TABLE IF EXISTS `taffle_bill`;
CREATE TABLE `taffle_bill`  (
  `billId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userPhone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `billCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `billGoods` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` int(32) NULL DEFAULT 0,
  PRIMARY KEY (`billId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for taffle_blog
-- ----------------------------
DROP TABLE IF EXISTS `taffle_blog`;
CREATE TABLE `taffle_blog`  (
  `blogId` int(11) NOT NULL AUTO_INCREMENT,
  `blogTitle` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `blogMessage` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `blogPhoto` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `blogCreateDate` date NULL DEFAULT NULL,
  PRIMARY KEY (`blogId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for taffle_blog_say
-- ----------------------------
DROP TABLE IF EXISTS `taffle_blog_say`;
CREATE TABLE `taffle_blog_say`  (
  `sayId` int(11) NOT NULL AUTO_INCREMENT,
  `sayMessage` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sayCreateDate` datetime NULL DEFAULT NULL,
  `blogId` int(11) NOT NULL,
  PRIMARY KEY (`sayId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for taffle_cart
-- ----------------------------
DROP TABLE IF EXISTS `taffle_cart`;
CREATE TABLE `taffle_cart`  (
  `cartId` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goodsId` int(11) NOT NULL,
  `goodsNumber` int(11) NULL DEFAULT 1,
  `goodsName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goodsPrice` double(255, 0) NOT NULL,
  `goodsPhoto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cartCreateDate` date NULL DEFAULT NULL,
  `cartUpdateDate` date NULL DEFAULT NULL,
  `goodsSell` int(11) NULL DEFAULT 0,
  `billCode` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  PRIMARY KEY (`cartId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for taffle_category
-- ----------------------------
DROP TABLE IF EXISTS `taffle_category`;
CREATE TABLE `taffle_category`  (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`categoryId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for taffle_contact
-- ----------------------------
DROP TABLE IF EXISTS `taffle_contact`;
CREATE TABLE `taffle_contact`  (
  `contactId` int(11) NOT NULL AUTO_INCREMENT,
  `contactName` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contactEmail` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contactMessage` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`contactId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for taffle_goods
-- ----------------------------
DROP TABLE IF EXISTS `taffle_goods`;
CREATE TABLE `taffle_goods`  (
  `goodsId` int(11) NOT NULL AUTO_INCREMENT,
  `goodsName` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goodsMessage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goodsPhoto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goodsCategory` int(11) NOT NULL,
  `goodsPrice` double NOT NULL,
  `goodsSell` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`goodsId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for taffle_goods_comment
-- ----------------------------
DROP TABLE IF EXISTS `taffle_goods_comment`;
CREATE TABLE `taffle_goods_comment`  (
  `commentId` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `commentMessage` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `goodsId` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `commentDate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`commentId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for taffle_user
-- ----------------------------
DROP TABLE IF EXISTS `taffle_user`;
CREATE TABLE `taffle_user`  (
  `userId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userPsw` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userAlice` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userEmail` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userSex` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '男',
  `userAddress` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userphone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userPhoto` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'xxx.jpg',
  `userScore` double NULL DEFAULT 0,
  `userCreateDate` date NULL DEFAULT NULL,
  `userUpdateDate` date NULL DEFAULT NULL,
  `isEnable` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
