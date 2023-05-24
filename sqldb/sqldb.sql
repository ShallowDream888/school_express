/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : cs_70665

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 24/05/2023 17:12:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for access_token
-- ----------------------------
DROP TABLE IF EXISTS `access_token`;
CREATE TABLE `access_token`  (
  `token_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '临时访问牌ID',
  `token` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '临时访问牌',
  `info` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `maxage` int NOT NULL DEFAULT 2 COMMENT '最大寿命：默认2小时',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户编号:',
  PRIMARY KEY (`token_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 245 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '登陆访问时长' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of access_token
-- ----------------------------
INSERT INTO `access_token` VALUES (193, 'ab7abfbccaba496daac421014fb608ba', NULL, 2, '2023-04-20 15:11:04', '2023-04-20 15:11:04', 4);
INSERT INTO `access_token` VALUES (191, '09f5747236924b9c8620530b4c742a43', NULL, 2, '2023-04-19 17:26:13', '2023-04-19 17:26:13', 4);
INSERT INTO `access_token` VALUES (190, 'ef278f09e65a40518b3f6b5e6851c2e1', NULL, 2, '2023-04-18 21:50:46', '2023-04-18 21:50:46', 4);
INSERT INTO `access_token` VALUES (188, '3438793490f04649865bc19bc4dd2419', NULL, 2, '2023-04-18 21:29:51', '2023-04-18 21:29:51', 4);
INSERT INTO `access_token` VALUES (189, '253e511bece34b0bbf072298ca293fdb', NULL, 2, '2023-04-18 21:39:45', '2023-04-18 21:39:45', 4);
INSERT INTO `access_token` VALUES (186, 'd2ad938014a944ba949bdbb48332f5a8', NULL, 2, '2023-04-18 18:28:22', '2023-04-18 18:28:22', 4);
INSERT INTO `access_token` VALUES (185, 'ddec9ac22e39434790efc55c70225692', NULL, 2, '2023-04-18 18:23:05', '2023-04-18 18:23:05', 4);
INSERT INTO `access_token` VALUES (184, '8945aef1bb864bb0a19df6c09e420b66', NULL, 2, '2023-04-18 18:23:05', '2023-04-18 18:23:05', 4);
INSERT INTO `access_token` VALUES (183, 'd626cea630364a329b4ab67c9fdc4218', NULL, 2, '2023-04-18 18:23:05', '2023-04-18 18:23:05', 4);
INSERT INTO `access_token` VALUES (182, 'f4e889eaf24d4069849e83a9e0912820', NULL, 2, '2023-04-18 18:23:05', '2023-04-18 18:23:05', 4);
INSERT INTO `access_token` VALUES (181, '10b3593060654808b3b9562e0915b01f', NULL, 2, '2023-04-18 18:23:05', '2023-04-18 18:23:05', 4);
INSERT INTO `access_token` VALUES (180, 'dd73239d25f4431ba1b3432ef0a71fe3', NULL, 2, '2023-04-18 18:23:05', '2023-04-18 18:23:05', 4);
INSERT INTO `access_token` VALUES (179, '116d7339d09c4ebe976944c142fbcf56', NULL, 2, '2023-04-18 18:21:56', '2023-04-18 18:21:56', 4);
INSERT INTO `access_token` VALUES (178, '1e7db06bb52447a08d3785967082367a', NULL, 2, '2023-04-18 18:21:13', '2023-04-18 18:21:13', 4);
INSERT INTO `access_token` VALUES (177, '8adea203085e48b490b2bb995d2bc4a9', NULL, 2, '2023-04-18 18:19:00', '2023-04-18 18:19:00', 4);
INSERT INTO `access_token` VALUES (176, '8343c5dcab114d2b81fbfcc2d044f932', NULL, 2, '2023-04-18 18:19:00', '2023-04-18 18:19:00', 4);
INSERT INTO `access_token` VALUES (175, '08354efa7ba2459fb90248640a2c59dd', NULL, 2, '2023-04-18 18:05:40', '2023-04-18 18:05:40', 4);
INSERT INTO `access_token` VALUES (174, 'ab907ec5b44a435da4ddc5b862794892', NULL, 2, '2023-04-18 18:05:40', '2023-04-18 18:05:40', 4);
INSERT INTO `access_token` VALUES (173, 'db1b8e3ce691444c9f2765819bb7c0f2', NULL, 2, '2023-04-18 18:05:40', '2023-04-18 18:05:40', 4);
INSERT INTO `access_token` VALUES (172, '9c5a14cd528c49229012574fd66512c5', NULL, 2, '2023-04-18 18:05:40', '2023-04-18 18:05:40', 4);
INSERT INTO `access_token` VALUES (171, '889d4e3162794a76b3281cb038e1b111', NULL, 2, '2023-04-18 18:05:40', '2023-04-18 18:05:40', 4);
INSERT INTO `access_token` VALUES (170, '8cbf61fb4da345e1813c4ceb222d329e', NULL, 2, '2023-04-18 18:04:38', '2023-04-18 18:04:38', 4);
INSERT INTO `access_token` VALUES (169, 'b0905d93ed7e444fae605116b8b6d0c5', NULL, 2, '2023-04-18 18:04:38', '2023-04-18 18:04:38', 4);
INSERT INTO `access_token` VALUES (168, '3f6d462add594a0cb117ef6fee8bd8ec', NULL, 2, '2023-04-18 18:04:38', '2023-04-18 18:04:38', 4);
INSERT INTO `access_token` VALUES (167, '66deb314be484f66bd16e8fb59306fed', NULL, 2, '2023-04-18 18:02:57', '2023-04-18 18:02:57', 4);
INSERT INTO `access_token` VALUES (166, 'a40ad23412df4d99b78e2fe053b90664', NULL, 2, '2023-04-18 18:02:57', '2023-04-18 18:02:57', 4);
INSERT INTO `access_token` VALUES (165, '3056a3c4ac264082bd4d96f2a0596049', NULL, 2, '2023-04-18 18:02:57', '2023-04-18 18:02:57', 4);
INSERT INTO `access_token` VALUES (164, '3ccd1eb5e11b4b15944ae6cebefe52d1', NULL, 2, '2023-04-18 18:02:57', '2023-04-18 18:02:57', 4);
INSERT INTO `access_token` VALUES (163, '39b7f484e2234e4382fb95be4cece7dc', NULL, 2, '2023-04-18 18:02:57', '2023-04-18 18:02:57', 4);
INSERT INTO `access_token` VALUES (162, '3f2377789ec24149b0f1e20caba6e3af', NULL, 2, '2023-04-18 18:02:57', '2023-04-18 18:02:57', 4);
INSERT INTO `access_token` VALUES (161, '7e73131351e7435fb7972c0a944b295f', NULL, 2, '2023-04-18 18:02:57', '2023-04-18 18:02:57', 4);
INSERT INTO `access_token` VALUES (160, 'e9cb5cd269c444e58a41fd9e66781fd8', NULL, 2, '2023-04-18 17:49:13', '2023-04-18 17:49:13', 4);
INSERT INTO `access_token` VALUES (158, 'a6280c1fba7d4bcf9cffdfc316d02053', NULL, 2, '2023-04-18 17:13:27', '2023-04-18 17:13:27', 1);
INSERT INTO `access_token` VALUES (157, '27b6c57dfb6146eb9b3c8044b4dde795', NULL, 2, '2023-04-18 17:04:08', '2023-04-18 17:04:08', 1);
INSERT INTO `access_token` VALUES (156, '51e2339462ae4df280f7a47a7bb058d6', NULL, 2, '2023-04-18 17:03:07', '2023-04-18 17:03:07', 1);
INSERT INTO `access_token` VALUES (154, '8b7ab5de011d4589ab5d717e801e0bf0', NULL, 2, '2023-04-18 16:59:34', '2023-04-18 16:59:34', 1);
INSERT INTO `access_token` VALUES (155, '020b6df431aa4d75b9541763e810f972', NULL, 2, '2023-04-18 17:02:07', '2023-04-18 17:02:07', 1);
INSERT INTO `access_token` VALUES (150, '62e649b1a95144eea2001b4adcba8f88', NULL, 2, '2023-04-18 15:25:39', '2023-04-18 15:25:39', 1);
INSERT INTO `access_token` VALUES (149, '192b3e33f97b414c99b9d75088bf10bf', NULL, 2, '2023-04-15 11:22:09', '2023-04-15 11:22:09', 1);
INSERT INTO `access_token` VALUES (148, 'e7f62d818ddc4c608faff02d3aa211cf', NULL, 2, '2023-04-13 10:35:43', '2023-04-13 10:35:43', 4);
INSERT INTO `access_token` VALUES (147, '2bc59b9e3df64509b5e3543703daa56f', NULL, 2, '2023-04-13 10:35:34', '2023-04-13 10:35:34', 1);
INSERT INTO `access_token` VALUES (146, 'de83356c8c1f42449fb645e44ae85585', NULL, 2, '2023-04-13 08:21:10', '2023-04-13 08:21:10', 4);
INSERT INTO `access_token` VALUES (145, 'cbd73207f19e4752929f53f28f834a91', NULL, 2, '2023-04-13 03:11:00', '2023-04-13 03:11:00', 1);
INSERT INTO `access_token` VALUES (144, '3f21972f9ba04e479fee023824a7d663', NULL, 2, '2023-04-13 02:10:13', '2023-04-13 02:10:13', 1);
INSERT INTO `access_token` VALUES (143, '2df87b6f8d48453b8c0970066d7abc52', NULL, 2, '2023-04-13 02:10:13', '2023-04-13 02:10:13', 1);
INSERT INTO `access_token` VALUES (142, '828b762a764b4a678fe12a077c9da4d3', NULL, 2, '2023-04-13 02:10:13', '2023-04-13 02:10:13', 1);
INSERT INTO `access_token` VALUES (141, '543af85af6d8402cb96f8bb5f47c623f', NULL, 2, '2023-04-13 02:10:13', '2023-04-13 02:10:13', 1);
INSERT INTO `access_token` VALUES (140, 'e856d976113a4d18a8266b4165068d4b', NULL, 2, '2023-04-13 01:49:04', '2023-04-13 01:49:04', 1);
INSERT INTO `access_token` VALUES (139, '02ce69badf7c4eeca6922142f50a9f55', NULL, 2, '2023-04-13 01:31:25', '2023-04-13 01:31:25', 1);
INSERT INTO `access_token` VALUES (138, '5f5c40ff285a4a9a96a322825f73e582', NULL, 2, '2023-04-13 01:30:52', '2023-04-13 01:30:52', 4);
INSERT INTO `access_token` VALUES (137, '3bf016b760994eb1b60ca7457a12bb25', NULL, 2, '2023-04-12 15:29:42', '2023-04-12 15:29:42', 4);
INSERT INTO `access_token` VALUES (135, '3dda2d82b4924aa8bc32a4090d2df7f1', NULL, 2, '2023-04-12 15:07:06', '2023-04-12 15:07:06', 2);
INSERT INTO `access_token` VALUES (136, '1ac8a643e3584c4c942e09ff9d24d5b7', NULL, 2, '2023-04-12 15:21:55', '2023-04-12 15:21:55', 1);
INSERT INTO `access_token` VALUES (133, 'fa27001b79814e3ca8cead8616ba247e', NULL, 2, '2023-04-12 15:07:06', '2023-04-12 15:07:06', 2);
INSERT INTO `access_token` VALUES (132, '568895e82b524517b056fa82b40bcb15', NULL, 2, '2023-04-12 14:53:38', '2023-04-12 14:53:38', 4);
INSERT INTO `access_token` VALUES (130, 'a1d4b096ab164cffa4b32a0188e389f6', NULL, 2, '2023-04-12 14:50:07', '2023-04-12 14:50:07', 4);
INSERT INTO `access_token` VALUES (131, '82c2b3b20ff54131ad75ecac65c0770e', NULL, 2, '2023-04-12 14:50:21', '2023-04-12 14:50:21', 2);
INSERT INTO `access_token` VALUES (128, 'b3695cbec91542feb3727764a65d7663', NULL, 2, '2023-04-12 14:26:14', '2023-04-12 14:26:14', 4);
INSERT INTO `access_token` VALUES (127, '56f55f9da5134cc0853fa76359888597', NULL, 2, '2023-04-12 14:16:00', '2023-04-12 14:16:00', 4);
INSERT INTO `access_token` VALUES (126, '4bda198a1f26459889767e26f8e321ce', NULL, 2, '2023-04-12 13:51:57', '2023-04-12 13:51:57', 4);
INSERT INTO `access_token` VALUES (125, '5b5fffc6d376446db89b3d76e174bbcb', NULL, 2, '2023-04-12 11:02:05', '2023-04-12 11:02:05', 4);
INSERT INTO `access_token` VALUES (124, '69ad03e48169492f90c4069a905ca0fd', NULL, 2, '2023-04-12 10:49:35', '2023-04-12 10:49:35', 4);
INSERT INTO `access_token` VALUES (123, '46946f74a71a4438a4acd80b17564506', NULL, 2, '2023-04-12 00:55:29', '2023-04-12 00:55:29', 4);
INSERT INTO `access_token` VALUES (194, '9f811efcc0c1433fa9505ae8a8acb22b', NULL, 2, '2023-04-20 17:04:11', '2023-04-20 17:04:11', 4);
INSERT INTO `access_token` VALUES (195, '5152e812ed3e498084fbe5f61e0ff033', NULL, 2, '2023-04-20 17:07:38', '2023-04-20 17:07:38', 4);
INSERT INTO `access_token` VALUES (199, 'd591bfeae31b4a9d8952eb67b5c97cf8', NULL, 2, '2023-04-20 18:14:08', '2023-04-20 18:14:08', 1);
INSERT INTO `access_token` VALUES (212, '7bb477ce78ee4367828699fd32cb0f9a', NULL, 2, '2023-04-20 19:08:01', '2023-04-20 19:08:01', 1);
INSERT INTO `access_token` VALUES (198, '9e0f14b684e24f8b9913f9c171c8fef8', NULL, 2, '2023-04-20 18:10:55', '2023-04-20 18:10:55', 1);
INSERT INTO `access_token` VALUES (200, '6c413e72033a42ccb961e8284dd64c7d', NULL, 2, '2023-04-20 18:20:10', '2023-04-20 18:20:10', 1);
INSERT INTO `access_token` VALUES (201, 'fbf11dbb19a74f4290d7eb27be84e7bb', NULL, 2, '2023-04-20 18:21:01', '2023-04-20 18:21:01', 1);
INSERT INTO `access_token` VALUES (202, '57cd8c14995b408e8724ebdfc0420f99', NULL, 2, '2023-04-20 18:21:01', '2023-04-20 18:21:01', 1);
INSERT INTO `access_token` VALUES (203, '9ea289e523a4418ea80c341913a7d675', NULL, 2, '2023-04-20 18:21:01', '2023-04-20 18:21:01', 1);
INSERT INTO `access_token` VALUES (204, '1c04dbd94d5747c5831718858597ed57', NULL, 2, '2023-04-20 18:21:01', '2023-04-20 18:21:01', 1);
INSERT INTO `access_token` VALUES (205, 'ca330b960f7f4f85b17b09a0ea02cba4', NULL, 2, '2023-04-20 18:21:01', '2023-04-20 18:21:01', 1);
INSERT INTO `access_token` VALUES (206, 'bea8250ff3ea4452be53cac99e4d6396', NULL, 2, '2023-04-20 18:21:01', '2023-04-20 18:21:01', 1);
INSERT INTO `access_token` VALUES (207, '886ff4bf24774ac7825a80fe521808b8', NULL, 2, '2023-04-20 18:21:01', '2023-04-20 18:21:01', 1);
INSERT INTO `access_token` VALUES (208, 'd72aa9dad88d4d2cb77688c3e2522dca', NULL, 2, '2023-04-20 18:21:01', '2023-04-20 18:21:01', 1);
INSERT INTO `access_token` VALUES (209, '345408826139495d9c40bc5aba0610a7', NULL, 2, '2023-04-20 18:21:01', '2023-04-20 18:21:01', 1);
INSERT INTO `access_token` VALUES (213, '41f97bb795eb43a6971085efb819e1a7', NULL, 2, '2023-04-20 19:12:34', '2023-04-20 19:12:34', 2);
INSERT INTO `access_token` VALUES (218, 'fcbbe549afd64d5c8d2864e2e8a2d429', NULL, 2, '2023-04-20 22:03:53', '2023-04-20 22:03:53', 2);
INSERT INTO `access_token` VALUES (220, '52715a2dd9514365a1d534089300cf97', NULL, 2, '2023-04-21 01:04:06', '2023-04-21 01:04:06', 1);
INSERT INTO `access_token` VALUES (221, '935100375ced4fb0a21f611ad5613b64', NULL, 2, '2023-04-21 01:45:58', '2023-04-21 01:45:58', 4);
INSERT INTO `access_token` VALUES (226, 'ae2ab351ed07491282a94bb1ac0d0112', NULL, 2, '2023-04-21 02:01:33', '2023-04-21 02:01:33', 1);
INSERT INTO `access_token` VALUES (227, '6e05547415e24aa2b073ed3f13251b91', NULL, 2, '2023-04-21 02:03:24', '2023-04-21 02:03:24', 4);
INSERT INTO `access_token` VALUES (228, '8fc34687caff4f319de866ea54433210', NULL, 2, '2023-04-21 02:24:56', '2023-04-21 02:24:56', 4);
INSERT INTO `access_token` VALUES (229, '34fb0b8b8f0e4001bf5e8fd8c88cbe12', NULL, 2, '2023-04-21 02:38:34', '2023-04-21 02:38:34', 4);
INSERT INTO `access_token` VALUES (231, 'b9112e5afb324e12a33a65b2080bd89d', NULL, 2, '2023-04-21 03:06:25', '2023-04-21 03:06:25', 1);
INSERT INTO `access_token` VALUES (232, '23e03e66aaec4b0294ac43117523ec5a', NULL, 2, '2023-04-21 03:17:00', '2023-04-21 03:17:00', 1);
INSERT INTO `access_token` VALUES (233, 'a535a76d85344418a739cea6a088b289', NULL, 2, '2023-04-21 03:19:11', '2023-04-21 03:19:11', 1);
INSERT INTO `access_token` VALUES (234, 'a1962faba6d64406b60a0947c97a7227', NULL, 2, '2023-04-21 12:31:31', '2023-04-21 12:31:31', 1);
INSERT INTO `access_token` VALUES (236, 'fe43426f07c44a22beb11d538701c1ae', NULL, 2, '2023-04-21 17:13:08', '2023-04-21 17:13:08', 1);
INSERT INTO `access_token` VALUES (237, 'f0385c7094f247f39a1157cdcb96e744', NULL, 2, '2023-04-22 16:37:58', '2023-04-22 16:37:58', 1);
INSERT INTO `access_token` VALUES (238, 'ed931109ecb949d7bf86f5e9d26f26b6', NULL, 2, '2023-04-22 17:43:00', '2023-04-22 17:43:00', 4);
INSERT INTO `access_token` VALUES (239, 'ce991477cd5246e1b4d8cc28c224b84e', NULL, 2, '2023-04-22 17:49:51', '2023-04-22 17:49:51', 4);
INSERT INTO `access_token` VALUES (240, 'f944178a539041028dc918572eef4459', NULL, 2, '2023-04-22 22:59:05', '2023-04-22 22:59:05', 1);
INSERT INTO `access_token` VALUES (241, 'a1ffa42a859a48cca5c99b093954ab11', NULL, 2, '2023-05-24 16:29:21', '2023-05-24 16:29:21', 1);
INSERT INTO `access_token` VALUES (242, '307eeabe58ab400a885ca1034d22190b', NULL, 2, '2023-05-24 16:30:17', '2023-05-24 16:30:17', 1);
INSERT INTO `access_token` VALUES (243, '4050de1c6b0444f18fa44a847b24f58e', NULL, 2, '2023-05-24 16:38:11', '2023-05-24 16:38:11', 1);
INSERT INTO `access_token` VALUES (244, '525e747392ef4834946e9b4bdf9876aa', NULL, 2, '2023-05-24 17:03:51', '2023-05-24 17:03:51', 1);

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `article_id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章id：[0,8388607]',
  `title` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '标题：[0,125]用于文章和html的title标签中',
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '文章分类：[0,1000]用来搜索指定类型的文章',
  `hits` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '点击数：[0,1000000000]访问这篇文章的人次',
  `praise_len` int NOT NULL DEFAULT 0 COMMENT '点赞数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '来源：[0,255]文章的出处',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '来源地址：[0,255]用于跳转到发布该文章的网站',
  `tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签：[0,255]用于标注文章所属相关内容，多个标签用空格隔开',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '正文：文章的主体内容',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封面图',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '文章描述',
  PRIMARY KEY (`article_id`, `title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章：用于内容管理系统的文章' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, '扎紧扎牢校园疫情防线 全力守护师生健康安全', '学校', 410, 1, '2023-04-11 16:53:35', '2023-04-21 02:23:43', NULL, NULL, NULL, '<p>9月1日，省委副书记、省委教育工委书记李荣灿深入武汉市中小学和高校，调研检查秋季学期开学校园疫情防控和安全稳定工作。他强调，要深入学习贯彻习近平总书记关于疫情防控和安全稳定的重要指示批示精神，认真落实省委工作要求，以“时时放心不下”的责任感，进一步压紧压实防控责任、落实落细防疫措施，坚决守住不发生校园聚集性疫情底线，全力守护校园和师生健康安全。</p><p><br></p><p>武汉市中小学9月1日全面开学，各区结合疫情形势和防控政策，因地因校采取线上或线下教学模式。在洪山高级中学，高三年级正常线下教学，学校实行封闭管理。李荣灿走进校园监控室、临时留观室、教学楼、运动场馆、学生宿舍等地，详细询问校园疫情防控和师生安全保障等情况。他强调，要严格落实“四方责任”，学校切实履行校内安全管理主体责任，属地履行疫情防控管理职责，不折不扣把各项防控措施落实到位。要加强校内闭环管理，做好学生心理辅导、教育引导等工作，加强教职工健康监测，全力做好校园后勤保障工作，确保师生健康安全、教学秩序井然。</p><p>洪山实验外国语小学全校采取线上教学。李荣灿走进教室，关切询问线上教学情况，他叮嘱学校负责人要保证线上教学质量，随时做好恢复线下教学准备，加强与家庭联动，引导家长严格遵守属地疫情防控规定，最大限度减少疫情对教育教学的影响。</p><p>在华中师范大学，李荣灿实地查看智能测温入校通道、学生食堂、校园110报警指挥中心等地，详细了解学生开学报到、校园出入管理、学校安防大数据系统运行情况。他强调，要毫不松懈抓好常态化疫情防控和校园安全管理，把好门、看住车、管住人，科学精准织密扎牢校园疫情防控网。要紧盯关键环节，做好学生入校后连续7天健康监测及相对静态管理，督促教职工严格落实“两点一线”防控要求，加强与属地对接，校地联动共筑疫情联防联控防线，共同维护校园平安稳定。(记者李婷)</p>', '/api/upload/1565523191009378304.jpg', NULL);
INSERT INTO `article` VALUES (2, '法治宣传进校园 讲好“开学第一课”', '学校', 583, 2, '2023-04-11 16:53:35', '2023-04-21 02:23:15', NULL, NULL, NULL, '<p>		央广网哈尔滨9月1日消息（记者庞淼）“刷单兼职是近几年比较高发的诈骗类型，同学们，这个坑咱们可千万不能跳。”“同学们，这可不是跳跳糖，这是一种新型毒品，一定要小心！”</p><p>	8月31日，哈尔滨市公安局民警通过“线上”模式，向虹桥中学学生讲解了反电诈和禁毒知识，开启了冰城公安开展“开学第一课”系列安全知识宣讲活动序幕。</p><p>	活动中，刑侦支队反诈民警陈思思通过线上讲座、互动交流、播放反电诈PPT等形式，介绍了诈骗分子惯用手法和作案方式，讲解了不良“校园贷”、“套路贷”、网络购物退款等针对学生的常见诈骗类型，并阐述了目前全市电信网络诈骗的发案特点和治理成效，提醒同学们牢记防范电信网络诈骗“四不”：不轻信、不透露、不链接、不转账，筑牢反诈防线，远离电信诈骗。</p><p>	南岗分局法制宣传员李嘉男通过播放PPT的方式，就毒品危害向同学们进行了详细讲解，让师生对目前迷惑性较强的新型毒品有了更为直观的认识。通过播放禁毒视频，让同学们更加深刻了解毒品对个人、家庭及社会的危害。提醒大家时刻保持清醒的头脑，从我做起，自觉远离和抵制毒品。</p><p>	据了解，为进一步增强全市中小学广大师生安全防范的意识和能力，哈尔滨市公安局在开学季重要时间节点，将先后举办线上专题宣讲、网络安全小课堂、网络答疑等系列活动，以“安全守护进校园”为主题，制作发布反诈、禁毒、消防、交通、防疫、校园安全等宣传视频片30余部，安全宣讲PPT课件20余部，为全市学校师生上了一堂堂生动详实的安全宣讲课。此外，社区民警还充分发挥“14+N”网群作用，将“开学第一课，新冠疫情知识篇”的PPT，在辖区内的各个微信群进行发布，让学生们充分认识疫情防控的重要性，同时了解到做好自我防护、需要注意的事项，如何主动配合学校工作人员和老师的工作。</p><p><br></p>', '/api/upload/1565523096520097793.jpg', NULL);
INSERT INTO `article` VALUES (3, '促爱国主义教育 香港举行“光影进校园”活动', '学校', 110, 0, '2023-04-11 16:53:35', '2023-04-21 02:07:33', NULL, NULL, NULL, '<p>新华社香港9月1日电(记者韦骅、张雅诗)为将优秀爱国爱港电影送至香港中小学，“光影进校园”系列活动1日在香港爱国教育支援中心举行启动仪式。</p><p><br></p><p>本次活动由紫荆文化集团、香港教育工作者联会(简称“香港教联会”)主办，爱国教育支援中心、银都机构有限公司承办。“光影进校园”遴选包括《我和我的祖国》《革命者》《妈妈的神奇小子》在内的10部优秀爱国爱港主题电影，面向全港中小学开展为期一年的公益放映，并配合香港特区政府教育局全年规划安排相关活动。</p><p>同时，紫荆文化集团和香港教联会还将同步推进“紫荆杯影评征文比赛”“紫荆电影大师课”“紫荆电影体验营”三项活动。</p><p>香港教联会会长黄均瑜表示，此次系列活动以崭新的教学方法提升爱国教育成效，期望通过电影的声、光、影深化学生对国家重要历史事件的认识，借此增强青少年对国家及民族的认同。</p><p>1日，是香港中小学开学日。特区政府教育局局长蔡若莲于开学前夕在社交媒体上表示，价值观教育十分重要，须培育学生增强国家观念、国民身份认同和民族自豪感，成为未来的社会栋梁、“一国两制”的接班人。教育局向学校发出了“国民教育——活动规划年历”，将重要日子结合校园日常生活，让同学感悟家国情怀。</p>', '/api/upload/1565522840772411392.jpg', NULL);
INSERT INTO `article` VALUES (4, '党的二十大代表、校长刘雅红作学习宣传贯彻党的二十大精神专题辅导报告', '学校', 740, 0, '2023-04-11 16:53:35', '2023-04-11 16:53:35', NULL, NULL, NULL, '<p> 为深入学习贯彻党的二十大精神，把学习成果转化为工作动力，不断推动党的二十大精神在华南农业大学落地生根开花结果,12月9日，党的二十大代表、校长刘雅红作学习宣传贯彻党的二十大精神专题辅导报告。校党委副书记邓国安主持报告会。报告会采取线上线下相结合的方式进行。学校党政领导、党委委员和纪委委员，校党委理论学习中心组成员和各二级学院党委书记在图书馆报告厅现场参会；全校其他处级领导干部，学校各民主党派、侨联会、知联会主要负责人，全体辅导员，马克思主义学院全体教师，师生党员代表等在各个分会场通过校内直播平台集中观看学习。	&nbsp;&nbsp;</p><p class=\"ql-align-center\"><img src=\"https://zsjyc.scau.edu.cn/_upload/article/images/51/6d/4cca86e94e83acda43b5c360552a/f55f6076-8b63-4ec3-8a04-5e2893cf5066.jpg\"></p><p class=\"ql-align-center\">	主会场</p><p class=\"ql-align-center\"><img src=\"https://zsjyc.scau.edu.cn/_upload/article/images/51/6d/4cca86e94e83acda43b5c360552a/76c233f6-21d2-4eea-b52d-85bcba458112.jpg\"></p><p class=\"ql-align-center\">党的二十大代表、校长刘雅红作专题辅导报告</p><p>刘雅红结合自己作为党代表参加党的二十大的经历和感受，从“党的二十大的主题及取得的主要成果”“过去5年的工作和新时代10年的伟大变革”“马克思主义中国化时代化”“中国式现代化”“全面建设社会主义现代化国家的目标任务”“坚持党的全面领导和全面从严治党”“应对风险挑战”等方面阐述了党的二十大的重要意义和主要内容，厘清了党的二十大精神的逻辑脉络和精神要义。</p><p>作为高校党代表，刘雅红尤其关注教育领域的发展规划。在专题辅导报告中，她系统总结了新时代十年中国教育和广东教育的非凡成就，并从“办好人民满意的大学”“助力完善科技创新体系”“落实创新驱动发展战略”“加快实施人才强国战略”等四个方面提出了高校推动科教兴国战略落地生根的思路举措。</p><p>	刘雅红校长的报告主题鲜明、内涵丰富、生动鲜活，全面系统地阐释了党的二十大精神的核心要义、精神实质和丰富内涵，对全校上下准确把握和深刻领悟党的二十大精神具有很强的指导性和启发性。这场报告会也是学校党的二十大精神“1+6+N”宣讲行动的首场报告会。接下来，学校还将对照中央、省委和省委教育工委关于学习宣传贯彻党的二十大精神的相关通知要求，扎实落实好各项部署安排，广泛开展党的二十大精神宣讲活动，把党的二十大精神传递至每一位师生，确保全覆盖、无遗漏，引导广大干部师生更加深刻领悟“两个确立”的决定性意义，增强“四个意识”、坚定“四个自信”、做到“两个维护”，用党的二十大精神和习近平新时代中国特色社会主义思想武装头脑、统一思想、指导实践、推动工作，铆足干劲推进学校“双一流”建设开创新局面，为建设农业特色世界一流大学而团结奋斗。</p><p>最后，刘雅红校长对学校近期疫情防控工作、学校2022年工作总结和2023年工作谋划作了部署。</p><p class=\"ql-align-center\"><img src=\"https://zsjyc.scau.edu.cn/_upload/article/images/51/6d/4cca86e94e83acda43b5c360552a/91dc5507-e770-44d6-87a7-5b144f69a973.jpg\"></p><p class=\"ql-align-center\">学校科技工作者代表在分会场参会</p><p class=\"ql-align-center\"><img src=\"https://zsjyc.scau.edu.cn/_upload/article/images/51/6d/4cca86e94e83acda43b5c360552a/5d83b01a-5c32-42b6-a6db-a80c0efbd4df.jpg\"></p><p class=\"ql-align-center\"><img src=\"https://zsjyc.scau.edu.cn/_upload/article/images/51/6d/4cca86e94e83acda43b5c360552a/3a164868-5962-4a62-99ac-952d86e48fed.jpg\"></p><p class=\"ql-align-center\"><img src=\"https://zsjyc.scau.edu.cn/_upload/article/images/51/6d/4cca86e94e83acda43b5c360552a/f5ac4552-123e-4de1-913c-a54e9ce066e0.jpg\"></p><p class=\"ql-align-center\">各单位在分会场组织参会</p><p><br></p>', '/api/upload/1601839824384294912.jpg', NULL);
INSERT INTO `article` VALUES (5, '校领导参加“2022广东拉美友城交流日”活动', '学校', 666, 0, '2023-04-11 16:53:35', '2023-04-21 02:03:44', NULL, NULL, NULL, '<p class=\"ql-align-justify\">为进一步加深广东省与拉美国家友好城市的交流合作，12月8日上午，“2022广东拉美友城交流日”活动在江门市以线上线下相结合方式顺利举办。外交部拉美司、广东省外事办公室、江门市政府、中拉使领馆官员代表及粤拉友城官员代表等参加了会议。副校长仇荣亮代表我校和“中国—拉丁美洲农业教育科技创新联盟”（中拉联盟）参加活动并致辞。</p><p class=\"ql-align-center\"><img src=\"https://zsjyc.scau.edu.cn/_upload/article/images/1a/a0/46a9e2e3473cb39c8738b809fcb8/7c56f3a3-739a-4131-83f9-cd372379b66f.jpg\" height=\"309\" width=\"550\"></p><p class=\"ql-align-justify\">活动以“赓续友好纽带，共创发展机遇”为主题，由广东省外事办公室和江门市政府联合主办。广东省外办主任柳琛子、江门市市长吴晓晖、外交部拉美司副司长陈鲁宁及拉美领馆轮值主任哥伦比亚驻穗总领事埃尔南·巴尔加斯分别致辞。</p><p class=\"ql-align-center\"><img src=\"https://zsjyc.scau.edu.cn/_upload/article/images/1a/a0/46a9e2e3473cb39c8738b809fcb8/c614aae9-3e7e-47f8-807b-aced505ab683.jpg\" height=\"309\" width=\"550\"></p><p class=\"ql-align-justify\">仇荣亮在致辞中重点介绍了我校和中拉联盟的基本情况，他指出中拉农业科教合作前景光明，我校将在中拉命运共同体框架下，聚焦数字农业、智慧农业和绿色农业理念，丰富“中文+农业”科教合作模式的内涵与实践，提高中拉农业科教合作的层次与水平，为深化平等互利、共同发展的中拉全面合作伙伴关系，为中拉农业科教事业的发展壮大贡献华农智慧和华农方案。</p><p class=\"ql-align-justify\">据悉，由我校牵头组建的中拉联盟现有中拉15个国家的67个盟员单位，签订了40多份合作协议。联盟成立两年来，各项工作稳定推进，为中拉农业科教可持续发展做出了积极贡献。</p><p class=\"ql-align-justify\">我校国际交流处相关负责人陪同参加了上述活动。</p><p><br></p>', '/api/upload/1601839706180419584.jpg', NULL);
INSERT INTO `article` VALUES (6, '学校党委常委会开展专题学习', '学校', 502, 0, '2023-04-11 16:53:35', '2023-04-13 01:31:17', NULL, NULL, NULL, '<p class=\"ql-align-center\"><img src=\"https://zsjyc.scau.edu.cn/_upload/article/images/73/56/bcc476a146f0813feabdda627b6f/e8d8583d-f28b-416a-a7cd-8ef9a077850d.jpg\"></p><p class=\"ql-align-center\">专题学习现场&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3月27日下午，学校党委常委会“第一议题”安排专题学习，传达学习习近平总书记在学校思想政治理论课教师座谈会上的重要讲话精神。校党政领导参加学习，组织部、宣传部、学工部、人事处、教务处、研究生工作部、马克思主义学院负责人列席会议。会议由校党委书记李大胜主持。&nbsp;&nbsp;&nbsp;&nbsp;</p><p class=\"ql-align-center\"><img src=\"https://zsjyc.scau.edu.cn/_upload/article/images/73/56/bcc476a146f0813feabdda627b6f/223e4492-b053-4952-b917-3e33f5250cfa.jpg\"></p><p class=\"ql-align-center\">李大胜书记讲话&nbsp;&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;李大胜书记在传达学习时强调，习近平总书记3月18日主持召开学校思想政治理论课教师座谈会并发表重要讲话，这是新中国成立以来党中央第一次召开的思想政治理论课教师座谈会，充分体现了以习近平同志为核心的党中央对学校思想政治理论课和思想政治工作的高度重视。李大胜传达学习了省委书记李希在主持召开学习贯彻习近平总书记关于学校思想政治理论课建设重要讲话精神座谈会上讲话精神。就学校如何学习贯彻习近平总书记重要讲话精神，李大胜提出4点意见：</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一是理直气壮开好思政课，用习近平新时代中国特色社会主义思想铸魂育人。要深刻领会习近平总书记的讲话精神，把用习近平新时代中国特色社会主义思想铸魂育人作为思政课的核心任务，增强办好思政课的责任感、使命感、荣誉感，落实好、完成好总书记和党中央交给我们的这项重要任务。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;二是聚焦发挥教师的关键作用，努力建设一支高素质专业化思政课教师队伍。要牢牢把握“政治要强”这个首要标准，选优配强思政课教师队伍。更加关心、支持思政课教师的成长，按照“六要”标准提升思政课教师的素质和水平。按照“人类灵魂工程师”要求，加强对思政课教师的管理、监督和激励。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;三是在坚持“八个相统一”上下功夫，推动思政课改革创新。要着眼于铸魂育人，把习近平新时代中国特色社会主义思想作为思政课的核心课程，坚持以增强思想性、理论性为改革创新的根本。着眼于触及心灵，着力增强课程的亲和力、针对性。坚持开门办课、多方借力，增强思政课实效，实现全员全程全方位育人。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;四是采取切实措施，深入学习贯彻总书记讲话精神。要全方位抓好对讲话精神的学习，引导学校各级干部和思政课教师学深悟透精髓要义，切实把思想统一到总书记重要讲话精神上来。全面对标总书记关于办好思政课的要求，坚持问题导向，列出问题清单，及时出台贯彻落实习近平总书记重要讲话精神的实施意见和工作方案。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;会上，校党委副书记钟仰进传达习近平总书记在学校思想政治理论课教师座谈会上重要讲话的主要精神和基本内容，与会人员共同学习领会习近平总书记重要讲话精神。（文/图 汪路勇）</p>', '/api/upload/1601840088357011456.jpg', NULL);
INSERT INTO `article` VALUES (7, '我校22项作品在“立志·修身·博学·报国”主题教育活动中获奖', '学校', 562, 0, '2023-04-11 16:53:35', '2023-04-11 23:59:20', NULL, NULL, NULL, '<p class=\"ql-align-justify\">近日，广东省教育厅公布了2022年“立志·修身·博学·报国”主题教育系列活动结果，我校共获奖22项，其中一等奖6项、二等奖11项、三等奖5项，学校荣获“优秀组织奖”。</p><p class=\"ql-align-justify\">为深入贯彻落实习近平总书记关于高校思想政治工作的重要论述，繁荣校园文化，积极发挥校园活动的育人作用，增强大学生思想政治教育的针对性和吸引力，省教育厅面向全省高校组织开展2022年“立志·修身·博学·报国”主题教育系列活动。本次活动设置了社会实践调研类、宣讲诵读类、歌曲演绎类、主题摄影类、公益广告类、教育工作类等6类项目。</p><p class=\"ql-align-justify\">我校党委学生工作部（党委研究生工作部）广泛组织动员全校师生积极参与教育活动，把“立志·修身·博学·报国”主题教育系列活动与学生日常思想政治教育工作结合起来，提高了活动融合度，增强了活动实效。经过师生的精心准备，一批优秀的活动作品涌现出来。&nbsp;</p><p>附：获奖名单</p><p class=\"ql-align-center\"><img src=\"https://zsjyc.scau.edu.cn/_upload/article/images/d2/6a/cdd9e88f4782b627071a47182899/bc99341a-80cc-4ddd-9ae3-70e7a9a6c5d3.png\" height=\"896\" width=\"600\"></p><p><br></p>', '/api/upload/1601839931645231105.jpg', NULL);
INSERT INTO `article` VALUES (8, '美国开学季家长多忧愁 四成多家长担心校园安全', '学校', 790, 0, '2023-04-11 16:53:35', '2023-04-11 16:53:35', NULL, NULL, NULL, '<p>	中国日报网9月2日电 美国咨询公司盖洛普1日发布民调显示，全美校园陆续开学之际，有44%的美国家长担忧其孩子在学校的人身安全，比2019年的前值激增10%，创24年来最高读数。</p><p>	有20%的家长表示，他们的孩子曾主动表达过对校园安全的担忧。</p><p>	近半年来全美各地发生大规模枪击案，令美国家长和孩子忧心忡忡，尤其是今年5月得州“罗布小学枪击案”，19名儿童和2名教师遇害。</p>', '/api/upload/1565523313478860801.jpg', NULL);

-- ----------------------------
-- Table structure for article_type
-- ----------------------------
DROP TABLE IF EXISTS `article_type`;
CREATE TABLE `article_type`  (
  `type_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类ID：[0,10000]',
  `display` smallint UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]决定分类显示的先后顺序',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '分类名称：[2,16]',
  `father_id` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级分类ID：[0,32767]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述：[0,255]描述该分类的作用',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '分类图标：',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '外链地址：[0,255]如果该分类是跳转到其他网站的情况下，就在该URL上设置',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of article_type
-- ----------------------------
INSERT INTO `article_type` VALUES (1, 100, '学校', 0, NULL, NULL, NULL, '2023-04-11 16:53:35', '2023-04-11 16:53:35');

-- ----------------------------
-- Table structure for auth
-- ----------------------------
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth`  (
  `auth_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '授权ID：',
  `user_group` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户组：',
  `mod_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '模块名：',
  `table_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '表名：',
  `page_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '页面标题：',
  `path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '路由路径：',
  `position` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '位置：',
  `mode` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '_blank' COMMENT '跳转方式：',
  `add` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否可增加：',
  `del` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否可删除：',
  `set` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否可修改：',
  `get` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否可查看：',
  `field_add` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '添加字段：',
  `field_set` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '修改字段：',
  `field_get` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '查询字段：',
  `table_nav_name` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '跨表导航名称：',
  `table_nav` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '跨表导航：',
  `option` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '配置：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 129 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户权限管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth
-- ----------------------------
INSERT INTO `auth` VALUES (1, '管理员', '雇主用户', 'employer_user', '雇主用户', '/employer_user/table', '', '_blank', 1, 1, 1, 1, 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (2, '管理员', '雇主用户', 'employer_user', '雇主用户详情', '/employer_user/view', '', '_blank', 1, 1, 1, 1, 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (3, '管理员', '跑腿用户', 'runner', '跑腿用户', '/runner/table', '', '_blank', 1, 1, 1, 1, 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (4, '管理员', '跑腿用户', 'runner', '跑腿用户详情', '/runner/view', '', '_blank', 1, 1, 1, 1, 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (5, '管理员', '代领任务', 'collecting_tasks_on_behalf', '代领任务', '/collecting_tasks_on_behalf/table', '', '_blank', 1, 1, 1, 1, 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (6, '管理员', '代领任务', 'collecting_tasks_on_behalf', '代领任务详情', '/collecting_tasks_on_behalf/view', '', '_blank', 1, 1, 1, 1, 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (7, '管理员', '代领任务', 'collecting_tasks_on_behalf', '代领任务', '/collecting_tasks_on_behalf/list', 'top', '_blank', 1, 1, 1, 1, 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (8, '管理员', '代领任务', 'collecting_tasks_on_behalf', '代领任务详情', '/collecting_tasks_on_behalf/details', '', '_blank', 1, 1, 1, 1, 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (9, '管理员', '代领订单', 'picking_order', '代领订单', '/picking_order/table', '', '_blank', 1, 1, 1, 1, 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', NULL, '0', '{\"pay\":true}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (10, '管理员', '代领订单', 'picking_order', '代领订单详情', '/picking_order/view', '', '_blank', 1, 1, 1, 1, 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (11, '管理员', '代领订单', 'picking_order', '代领订单', '/picking_order/edit', '', '_blank', 1, 1, 1, 1, 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (12, '管理员', '我的收藏', 'collect', '我的收藏', '/collect/list', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (13, '管理员', '评论', 'comment', '评论列表', '/comment/table', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (14, '管理员', '评论', 'comment', '评论详情', '/comment/view', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (15, '管理员', '评论', 'comment', '我的评论', '/comment/list', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (16, '管理员', '评论', 'comment', '评论详情', '/comment/details', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (17, '管理员', '论坛', 'forum', '留言板', '/forum/table', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{\"print\":true,\"export_db\":true,\"import_db\":true}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (18, '管理员', '论坛', 'forum', '留言板', '/forum/view', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{\"print\":true}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (19, '管理员', '论坛', 'forum', '留言板', '/forum/list', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (20, '管理员', '论坛', 'forum', '留言板', '/forum/details', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{\"can_comment\":true,\"can_show_comment\":true}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (21, '管理员', '论坛分类', 'forum_type', '留言分类', '/forum_type/table', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (22, '管理员', '论坛分类', 'forum_type', '留言分类', '/forum_type/view', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (23, '管理员', '新闻', 'article', '新闻列表', '/article/table', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{\"print\":true,\"export_db\":true,\"import_db\":true}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (24, '管理员', '新闻', 'article', '新闻详情', '/article/view', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{\"print\":true}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (25, '管理员', '新闻', 'article', '校园新闻', '/article/list', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (26, '管理员', '新闻', 'article', '新闻详情', '/article/details', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{\"can_comment\":true,\"can_show_comment\":true}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (27, '管理员', '新闻分类', 'article_type', '新闻分类', '/article_type/table', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (28, '管理员', '新闻分类', 'article_type', '新闻分类', '/article_type/view', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (29, '管理员', '公告', 'notice', '公告列表', '/notice/table', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (30, '管理员', '公告', 'notice', '公告详情', '/notice/view', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (31, '管理员', '公告', 'notice', '公告栏', '/notice/list', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (32, '管理员', '公告', 'notice', '公告详情', '/notice/details', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (33, '游客', '雇主用户', 'employer_user', '雇主用户', '/employer_user/table', '', '_blank', 1, 0, 0, 0, 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (34, '游客', '雇主用户', 'employer_user', '雇主用户详情', '/employer_user/view', '', '_blank', 1, 0, 0, 0, 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (35, '游客', '跑腿用户', 'runner', '跑腿用户', '/runner/table', '', '_blank', 1, 0, 0, 0, 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (36, '游客', '跑腿用户', 'runner', '跑腿用户详情', '/runner/view', '', '_blank', 1, 0, 0, 0, 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (37, '游客', '代领任务', 'collecting_tasks_on_behalf', '代领任务', '/collecting_tasks_on_behalf/table', '', '_blank', 0, 0, 0, 0, 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (38, '游客', '代领任务', 'collecting_tasks_on_behalf', '代领任务详情', '/collecting_tasks_on_behalf/view', '', '_blank', 0, 0, 0, 0, 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (39, '游客', '代领任务', 'collecting_tasks_on_behalf', '代领任务', '/collecting_tasks_on_behalf/list', 'top', '_blank', 0, 0, 0, 1, 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (40, '游客', '代领任务', 'collecting_tasks_on_behalf', '代领任务详情', '/collecting_tasks_on_behalf/details', '', '_blank', 0, 0, 0, 1, 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (41, '游客', '代领订单', 'picking_order', '代领订单', '/picking_order/table', '', '_blank', 0, 0, 0, 0, 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', NULL, '0', '{\"pay\":false}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (42, '游客', '代领订单', 'picking_order', '代领订单详情', '/picking_order/view', '', '_blank', 0, 0, 0, 0, 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (43, '游客', '代领订单', 'picking_order', '代领订单', '/picking_order/edit', '', '_blank', 0, 0, 0, 0, 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (44, '游客', '我的收藏', 'collect', '我的收藏', '/collect/list', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (45, '游客', '评论', 'comment', '评论列表', '/comment/table', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (46, '游客', '评论', 'comment', '评论详情', '/comment/view', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (47, '游客', '评论', 'comment', '我的评论', '/comment/list', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (48, '游客', '评论', 'comment', '评论详情', '/comment/details', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (49, '游客', '论坛', 'forum', '论坛列表', '/forum/table', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{\"print\":false,\"export_db\":false,\"import_db\":false}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (50, '游客', '论坛', 'forum', '论坛详情', '/forum/view', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{\"print\":false}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (51, '游客', '论坛', 'forum', '留言板', '/forum/list', '', '_blank', 0, 0, 0, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (52, '游客', '论坛', 'forum', '留言板', '/forum/details', '', '_blank', 0, 0, 0, 1, '', '', '', NULL, '0', '{\"can_comment\":false,\"can_show_comment\":false}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (53, '游客', '论坛分类', 'forum_type', '论坛分类列表', '/forum_type/table', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (54, '游客', '论坛分类', 'forum_type', '论坛分类详情', '/forum_type/view', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (55, '游客', '新闻', 'article', '新闻列表', '/article/table', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{\"print\":false,\"export_db\":false,\"import_db\":false}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (56, '游客', '新闻', 'article', '新闻详情', '/article/view', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{\"print\":false}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (57, '游客', '新闻', 'article', '校园新闻', '/article/list', '', '_blank', 0, 0, 0, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (58, '游客', '新闻', 'article', '校园新闻', '/article/details', '', '_blank', 0, 0, 0, 1, '', '', '', NULL, '0', '{\"can_comment\":false,\"can_show_comment\":false}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (59, '游客', '新闻分类', 'article_type', '新闻分类列表', '/article_type/table', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (60, '游客', '新闻分类', 'article_type', '新闻分类详情', '/article_type/view', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (61, '游客', '公告', 'notice', '公告列表', '/notice/table', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (62, '游客', '公告', 'notice', '公告详情', '/notice/view', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (63, '游客', '公告', 'notice', '公告栏', '/notice/list', '', '_blank', 0, 0, 0, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (64, '游客', '公告', 'notice', '公告详情', '/notice/details', '', '_blank', 0, 0, 0, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (65, '雇主用户', '雇主用户', 'employer_user', '雇主用户', '/employer_user/table', '', '_blank', 0, 0, 0, 0, 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (66, '雇主用户', '雇主用户', 'employer_user', '雇主用户详情', '/employer_user/view', '', '_blank', 0, 0, 0, 0, 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (67, '雇主用户', '跑腿用户', 'runner', '跑腿用户', '/runner/table', '', '_blank', 0, 0, 0, 0, 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (68, '雇主用户', '跑腿用户', 'runner', '跑腿用户详情', '/runner/view', '', '_blank', 0, 0, 0, 0, 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (69, '雇主用户', '代领任务', 'collecting_tasks_on_behalf', '代领任务', '/collecting_tasks_on_behalf/table', '', '_blank', 1, 1, 1, 1, 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (70, '雇主用户', '代领任务', 'collecting_tasks_on_behalf', '代领任务详情', '/collecting_tasks_on_behalf/view', '', '_blank', 1, 1, 1, 1, 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (71, '雇主用户', '代领任务', 'collecting_tasks_on_behalf', '代领任务', '/collecting_tasks_on_behalf/list', 'top', '_blank', 1, 1, 1, 1, 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (72, '雇主用户', '代领任务', 'collecting_tasks_on_behalf', '代领任务详情', '/collecting_tasks_on_behalf/details', '', '_blank', 1, 1, 1, 1, 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (73, '雇主用户', '代领订单', 'picking_order', '代领订单', '/picking_order/table', '', '_blank', 0, 0, 1, 1, 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', NULL, '0', '{\"pay\":true}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (74, '雇主用户', '代领订单', 'picking_order', '代领订单详情', '/picking_order/view', '', '_blank', 0, 0, 1, 1, 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', 'pickup_code', 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (75, '雇主用户', '代领订单', 'picking_order', '代领订单', '/picking_order/edit', '', '_blank', 0, 0, 0, 0, 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (76, '雇主用户', '我的收藏', 'collect', '我的收藏', '/collect/list', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (77, '雇主用户', '评论', 'comment', '评论列表', '/comment/table', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (78, '雇主用户', '评论', 'comment', '评论详情', '/comment/view', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (79, '雇主用户', '评论', 'comment', '我的评论', '/comment/list', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (80, '雇主用户', '评论', 'comment', '评论详情', '/comment/details', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (81, '雇主用户', '论坛', 'forum', '论坛列表', '/forum/table', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{\"print\":false,\"export_db\":false,\"import_db\":false}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (82, '雇主用户', '论坛', 'forum', '论坛详情', '/forum/view', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{\"print\":false}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (83, '雇主用户', '论坛', 'forum', '留言板', '/forum/list', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (84, '雇主用户', '论坛', 'forum', '留言板', '/forum/details', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{\"can_comment\":true,\"can_show_comment\":true}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (85, '雇主用户', '论坛分类', 'forum_type', '论坛分类列表', '/forum_type/table', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (86, '雇主用户', '论坛分类', 'forum_type', '论坛分类详情', '/forum_type/view', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (87, '雇主用户', '新闻', 'article', '新闻列表', '/article/table', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{\"print\":false,\"export_db\":false,\"import_db\":false}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (88, '雇主用户', '新闻', 'article', '新闻详情', '/article/view', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{\"print\":false}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (89, '雇主用户', '新闻', 'article', '校园新闻', '/article/list', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (90, '雇主用户', '新闻', 'article', '校园新闻', '/article/details', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{\"can_comment\":true,\"can_show_comment\":true}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (91, '雇主用户', '新闻分类', 'article_type', '新闻分类列表', '/article_type/table', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (92, '雇主用户', '新闻分类', 'article_type', '新闻分类详情', '/article_type/view', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (93, '雇主用户', '公告', 'notice', '公告列表', '/notice/table', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (94, '雇主用户', '公告', 'notice', '公告详情', '/notice/view', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (95, '雇主用户', '公告', 'notice', '公告栏', '/notice/list', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (96, '雇主用户', '公告', 'notice', '公告详情', '/notice/details', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (97, '跑腿用户', '雇主用户', 'employer_user', '雇主用户', '/employer_user/table', '', '_blank', 0, 0, 0, 0, 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (98, '跑腿用户', '雇主用户', 'employer_user', '雇主用户详情', '/employer_user/view', '', '_blank', 0, 0, 0, 0, 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (99, '跑腿用户', '跑腿用户', 'runner', '跑腿用户', '/runner/table', '', '_blank', 0, 0, 0, 0, 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (100, '跑腿用户', '跑腿用户', 'runner', '跑腿用户详情', '/runner/view', '', '_blank', 0, 0, 0, 0, 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', 'student_number,full_name,gender,major,department,dormitory', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (101, '跑腿用户', '代领任务', 'collecting_tasks_on_behalf', '代领任务', '/collecting_tasks_on_behalf/table', '', '_blank', 0, 0, 0, 0, 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (102, '跑腿用户', '代领任务', 'collecting_tasks_on_behalf', '代领任务详情', '/collecting_tasks_on_behalf/view', '', '_blank', 0, 0, 0, 0, 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (103, '跑腿用户', '代领任务', 'collecting_tasks_on_behalf', '代领任务', '/collecting_tasks_on_behalf/list', 'top', '_blank', 1, 1, 1, 1, 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (104, '跑腿用户', '代领任务', 'collecting_tasks_on_behalf', '代领任务详情', '/collecting_tasks_on_behalf/details', '', '_blank', 1, 1, 1, 1, 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', 'task_number,task_name,publishing_users,item_picture,item_weight,item_type,order_quantity,pickup_address,shipping_address,task_commission', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (105, '跑腿用户', '代领订单', 'picking_order', '代领订单', '/picking_order/table', '', '_blank', 0, 0, 1, 1, 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', NULL, '0', '{\"pay\":false}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (106, '跑腿用户', '代领订单', 'picking_order', '代领订单详情', '/picking_order/view', '', '_blank', 0, 0, 1, 1, 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', 'order_status', 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (107, '跑腿用户', '代领订单', 'picking_order', '代领订单', '/picking_order/edit', '', '_blank', 1, 1, 1, 1, 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,runner,full_name,order_status', 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', 'task_number,task_name,publishing_users,item_weight,item_type,pickup_address,shipping_address,task_commission,quantity_received,pickup_code,runner,full_name,order_status', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (108, '跑腿用户', '我的收藏', 'collect', '我的收藏', '/collect/list', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (109, '跑腿用户', '评论', 'comment', '评论列表', '/comment/table', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (110, '跑腿用户', '评论', 'comment', '评论详情', '/comment/view', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (111, '跑腿用户', '评论', 'comment', '我的评论', '/comment/list', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (112, '跑腿用户', '评论', 'comment', '评论详情', '/comment/details', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (113, '跑腿用户', '论坛', 'forum', '论坛列表', '/forum/table', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{\"print\":false,\"export_db\":false,\"import_db\":false}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (114, '跑腿用户', '论坛', 'forum', '论坛详情', '/forum/view', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{\"print\":false}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (115, '跑腿用户', '论坛', 'forum', '留言板', '/forum/list', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (116, '跑腿用户', '论坛', 'forum', '留言板', '/forum/details', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{\"can_comment\":true,\"can_show_comment\":true}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (117, '跑腿用户', '论坛分类', 'forum_type', '论坛分类列表', '/forum_type/table', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (118, '跑腿用户', '论坛分类', 'forum_type', '论坛分类详情', '/forum_type/view', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (119, '跑腿用户', '新闻', 'article', '新闻列表', '/article/table', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{\"print\":false,\"export_db\":false,\"import_db\":false}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (120, '跑腿用户', '新闻', 'article', '新闻详情', '/article/view', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{\"print\":false}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (121, '跑腿用户', '新闻', 'article', '校园新闻', '/article/list', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (122, '跑腿用户', '新闻', 'article', '校园新闻', '/article/details', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{\"can_comment\":true,\"can_show_comment\":true}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (123, '跑腿用户', '新闻分类', 'article_type', '新闻分类列表', '/article_type/table', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (124, '跑腿用户', '新闻分类', 'article_type', '新闻分类详情', '/article_type/view', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (125, '跑腿用户', '公告', 'notice', '公告列表', '/notice/table', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (126, '跑腿用户', '公告', 'notice', '公告详情', '/notice/view', '', '_blank', 0, 0, 0, 0, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (127, '跑腿用户', '公告', 'notice', '公告栏', '/notice/list', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `auth` VALUES (128, '跑腿用户', '公告', 'notice', '公告详情', '/notice/details', '', '_blank', 1, 1, 1, 1, '', '', '', NULL, '0', '{}', '2023-04-11 16:53:34', '2023-04-11 16:53:34');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect`  (
  `collect_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '收藏ID：',
  `user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '收藏人ID：',
  `source_table` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '来源字段：',
  `source_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '来源ID：',
  `title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标题：',
  `img` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '封面：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`collect_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '收藏' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES (2, 2, 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 12, 'dd', '/api/upload/1649009084797550593.png', '2023-04-20 19:17:23', '2023-04-20 19:17:23');
INSERT INTO `collect` VALUES (4, 4, 'forum', 'forum_id', 7, '好评', '/api/upload/1649109912887754753.png', '2023-04-21 01:59:41', '2023-04-21 01:59:41');
INSERT INTO `collect` VALUES (5, 1, 'forum', 'forum_id', 8, '校园快递代领系统', '/api/upload/1649110478976188417.png', '2023-04-21 02:23:08', '2023-04-21 02:23:08');
INSERT INTO `collect` VALUES (8, 1, 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 13, '衣服', '/api/upload/1649113880854528001.png', '2023-04-21 02:23:39', '2023-04-21 02:23:39');
INSERT INTO `collect` VALUES (7, 1, 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 14, '食品代拿', '/api/upload/1649114307994058753.jpg', '2023-04-21 02:23:28', '2023-04-21 02:23:28');
INSERT INTO `collect` VALUES (9, 1, 'article', 'article_id', 1, '扎紧扎牢校园疫情防线 全力守护师生健康安全', '/api/upload/1565523191009378304.jpg', '2023-04-21 02:23:43', '2023-04-21 02:23:43');

-- ----------------------------
-- Table structure for collecting_tasks_on_behalf
-- ----------------------------
DROP TABLE IF EXISTS `collecting_tasks_on_behalf`;
CREATE TABLE `collecting_tasks_on_behalf`  (
  `collecting_tasks_on_behalf_id` int NOT NULL AUTO_INCREMENT COMMENT '代领任务ID',
  `task_number` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '任务编号',
  `task_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `publishing_users` int NULL DEFAULT 0 COMMENT '发布用户',
  `item_picture` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '物品图片',
  `item_weight` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '物品重量',
  `item_type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '物品类型',
  `order_quantity` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '订单数量',
  `pickup_address` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '取货地址',
  `shipping_address` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '送货地址',
  `task_commission` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '任务佣金',
  `hits` int NOT NULL DEFAULT 0 COMMENT '点击数',
  `praise_len` int NOT NULL DEFAULT 0 COMMENT '点赞数',
  `recommend` int NOT NULL DEFAULT 0 COMMENT '智能推荐',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`collecting_tasks_on_behalf_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '代领任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collecting_tasks_on_behalf
-- ----------------------------
INSERT INTO `collecting_tasks_on_behalf` VALUES (13, '1682014197453', '衣服', 2, '/api/upload/1649113880854528001.png', '1kg', '衣服', '1', '校园菜鸟驿站1区', '男生宿舍1栋410', '3元', 8, 0, 0, '2023-04-21 02:14:17', '2023-04-22 20:30:45');
INSERT INTO `collecting_tasks_on_behalf` VALUES (14, '1682014460031', '食品代拿', 5, '/api/upload/1649114307994058753.jpg', '3kg', '食品', '1', '校园菜鸟驿站1区', '男生宿舍2栋123', '5元', 5, 0, 0, '2023-04-21 02:15:06', '2023-04-22 19:56:47');
INSERT INTO `collecting_tasks_on_behalf` VALUES (15, '1682014509096', '书本快递', 2, '/api/upload/1649114762476257281.png', '3kg', '书', '1', '校园菜鸟驿站1区', '男生宿舍1栋410', '4元', 1, 0, 0, '2023-04-21 02:16:16', '2023-04-21 12:31:40');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `comment_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '评论ID：',
  `user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '评论人ID：',
  `reply_to_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '回复评论ID：空为0',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '内容：',
  `nickname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '昵称：',
  `avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '来源字段：',
  `source_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '来源ID：',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '评论' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 1, 0, '<p>123456</p>', 'admin', '/api/upload/admin_avatar.jpg', '2023-04-20 22:03:25', '2023-04-20 22:03:25', 'forum', 'forum_id', 1);

-- ----------------------------
-- Table structure for employer_user
-- ----------------------------
DROP TABLE IF EXISTS `employer_user`;
CREATE TABLE `employer_user`  (
  `employer_user_id` int NOT NULL AUTO_INCREMENT COMMENT '雇主用户ID',
  `student_number` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '学号',
  `full_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `gender` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '性别',
  `major` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '专业',
  `department` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '院系',
  `dormitory` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '宿舍',
  `examine_state` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '已通过' COMMENT '审核状态',
  `recommend` int NOT NULL DEFAULT 0 COMMENT '智能推荐',
  `user_id` int NOT NULL DEFAULT 0 COMMENT '用户ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`employer_user_id`) USING BTREE,
  UNIQUE INDEX `student_number`(`student_number` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '雇主用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employer_user
-- ----------------------------
INSERT INTO `employer_user` VALUES (1, '13', '小夏', '男', '软件', '软件', '121', '已通过', 0, 2, '2023-04-11 17:01:21', '2023-04-11 17:01:21');
INSERT INTO `employer_user` VALUES (2, '123', '123', '男', '123', '123123', '123', '已通过', 0, 5, '2023-04-20 18:59:32', '2023-04-20 18:59:32');
INSERT INTO `employer_user` VALUES (3, '1666666', NULL, NULL, '', '', NULL, '已通过', 0, 6, '2023-04-21 12:46:30', '2023-04-21 12:46:30');

-- ----------------------------
-- Table structure for forum
-- ----------------------------
DROP TABLE IF EXISTS `forum`;
CREATE TABLE `forum`  (
  `forum_id` mediumint UNSIGNED NOT NULL COMMENT '留言板id',
  `display` smallint UNSIGNED NOT NULL DEFAULT 100 COMMENT '排序',
  `user_id` mediumint UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `nickname` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '昵称：[0,16]',
  `praise_len` int NULL DEFAULT 0 COMMENT '点赞数',
  `hits` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '访问数',
  `title` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `keywords` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关键词',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '描述',
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '来源地址',
  `tag` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标签',
  `img` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '封面图',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '正文',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '发帖人头像：',
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '留言分类：[0,1000]用来搜索指定类型的论坛帖',
  PRIMARY KEY (`forum_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '论坛' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of forum
-- ----------------------------
INSERT INTO `forum` VALUES (8, 0, 4, '水水', 0, 4, '校园快递代领系统', '', '', '', '', '/api/upload/1649110478976188417.png', '<p>我作为一名校内跑腿，经常使用上面校园快递代领系统来代领学生们的快递。我认为这个系统非常方便快捷，提高了我们的工作效率。</p><p>首先，系统的使用非常简单，让我们不需要花费太多时间去学习如何使用。我们可以轻松地发布代领任务并在短时间内找到可靠的代领者完成任务。</p><p>其次，系统提供了快递信息的实时更新，让我们能够及时了解快递的状态。这对我们的工作非常重要，因为我们需要及时地通知代领者并准确地将快递交给学生。</p>', '2023-04-21 01:59:33', '2023-04-22 20:48:31', '/api/upload/1649107418354810880.jpg', '对本系统的评价');
INSERT INTO `forum` VALUES (7, 0, 4, '水水', 1, 4, '好评', '', '', '', '', '/api/upload/1649109912887754753.png', '<p><span style=\"background-color: rgb(247, 247, 248); color: rgb(55, 65, 81);\">很高兴为这位雇主提供跑腿服务，他非常友好和耐心，给予了明确的指示和合理的报酬，让我感到很愉快。交流顺畅，任务完成顺利，希望有机会能再次为他提供服务。</span></p>', '2023-04-21 01:56:59', '2023-04-22 20:48:35', '/api/upload/1649107418354810880.jpg', '对雇主评价');
INSERT INTO `forum` VALUES (9, 0, 4, '水水', 0, 0, '测试标题', '', '', '', '测试标签', '', '<p>测试正文内容</p>', '2023-04-21 02:00:12', '2023-04-21 02:00:12', '/api/upload/1649107418354810880.jpg', '');

-- ----------------------------
-- Table structure for forum_type
-- ----------------------------
DROP TABLE IF EXISTS `forum_type`;
CREATE TABLE `forum_type`  (
  `type_id` smallint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类ID：[0,10000]',
  `name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '分类名称：[2,16]',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述：[0,255]描述该分类的作用',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '外链地址：[0,255]如果该分类是跳转到其他网站的情况下，就在该URL上设置',
  `father_id` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级分类ID：[0,32767]',
  `icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '分类图标：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '论坛分类' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of forum_type
-- ----------------------------
INSERT INTO `forum_type` VALUES (1, '对雇主评价', '对雇主评价', '/article/list?type_id=1', 0, '', '2023-04-28 18:21:49', '2023-04-21 01:39:58');
INSERT INTO `forum_type` VALUES (2, '对跑腿的评价', '对跑腿的评价', '/article/list?type_id=2', 0, '', '2023-04-28 18:21:49', '2023-04-21 01:40:02');
INSERT INTO `forum_type` VALUES (3, '对本系统的评价', '对本系统的评价', '/article/list?type_id=3', 0, '', '2023-04-28 18:21:49', '2023-04-21 01:40:16');

-- ----------------------------
-- Table structure for hits
-- ----------------------------
DROP TABLE IF EXISTS `hits`;
CREATE TABLE `hits`  (
  `hits_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '来源字段：',
  `source_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '来源ID：',
  PRIMARY KEY (`hits_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 222 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '用户点击' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of hits
-- ----------------------------
INSERT INTO `hits` VALUES (1, 3, '2023-04-11 17:04:26', '2023-04-11 17:04:26', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (2, 3, '2023-04-11 17:08:03', '2023-04-11 17:08:03', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (3, 4, '2023-04-11 17:09:13', '2023-04-11 17:09:13', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (4, 4, '2023-04-11 17:09:26', '2023-04-11 17:09:26', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (5, 3, '2023-04-11 17:09:48', '2023-04-11 17:09:48', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (6, 3, '2023-04-11 17:10:14', '2023-04-11 17:10:14', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (7, 3, '2023-04-11 17:10:23', '2023-04-11 17:10:23', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (8, 3, '2023-04-11 17:11:11', '2023-04-11 17:11:11', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (9, 1, '2023-04-11 17:11:37', '2023-04-11 17:11:37', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (10, 1, '2023-04-11 17:11:44', '2023-04-11 17:11:44', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (11, 1, '2023-04-11 17:18:22', '2023-04-11 17:18:22', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (12, 1, '2023-04-11 17:19:50', '2023-04-11 17:19:50', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (13, 1, '2023-04-11 17:19:53', '2023-04-11 17:19:53', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (14, 4, '2023-04-11 17:25:30', '2023-04-11 17:25:30', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (15, 1, '2023-04-11 17:26:06', '2023-04-11 17:26:06', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (16, 1, '2023-04-11 17:32:45', '2023-04-11 17:32:45', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (17, 1, '2023-04-11 17:32:51', '2023-04-11 17:32:51', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (18, 4, '2023-04-11 17:33:17', '2023-04-11 17:33:17', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (19, 4, '2023-04-11 17:33:26', '2023-04-11 17:33:26', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (20, 4, '2023-04-11 17:33:30', '2023-04-11 17:33:30', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (21, 4, '2023-04-11 17:33:37', '2023-04-11 17:33:37', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (22, 4, '2023-04-11 17:35:30', '2023-04-11 17:35:30', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (23, 4, '2023-04-11 17:35:34', '2023-04-11 17:35:34', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (24, 4, '2023-04-11 17:35:37', '2023-04-11 17:35:37', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (25, 4, '2023-04-11 17:35:42', '2023-04-11 17:35:42', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (26, 1, '2023-04-11 17:35:52', '2023-04-11 17:35:52', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (27, 1, '2023-04-11 17:35:56', '2023-04-11 17:35:56', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (28, 1, '2023-04-11 17:36:01', '2023-04-11 17:36:01', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (29, 1, '2023-04-11 17:36:06', '2023-04-11 17:36:06', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (30, 1, '2023-04-11 17:36:16', '2023-04-11 17:36:16', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (31, 1, '2023-04-11 17:36:19', '2023-04-11 17:36:19', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (32, 1, '2023-04-11 17:36:22', '2023-04-11 17:36:22', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (33, 1, '2023-04-11 17:36:26', '2023-04-11 17:36:26', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (34, 4, '2023-04-11 17:45:36', '2023-04-11 17:45:36', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (35, 4, '2023-04-11 17:45:40', '2023-04-11 17:45:40', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (36, 4, '2023-04-11 17:45:45', '2023-04-11 17:45:45', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (37, 4, '2023-04-11 17:48:07', '2023-04-11 17:48:07', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (38, 4, '2023-04-11 17:51:02', '2023-04-11 17:51:02', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (39, 4, '2023-04-11 17:51:05', '2023-04-11 17:51:05', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (40, 4, '2023-04-11 17:56:10', '2023-04-11 17:56:10', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (41, 1, '2023-04-11 17:57:31', '2023-04-11 17:57:31', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (42, 4, '2023-04-11 18:22:30', '2023-04-11 18:22:30', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (43, 4, '2023-04-11 18:31:07', '2023-04-11 18:31:07', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (44, 0, '2023-04-11 18:39:30', '2023-04-11 18:39:30', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 2);
INSERT INTO `hits` VALUES (45, 4, '2023-04-11 19:02:53', '2023-04-11 19:02:53', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (46, 1, '2023-04-11 19:16:22', '2023-04-11 19:16:22', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (47, 1, '2023-04-11 19:17:03', '2023-04-11 19:17:03', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (48, 1, '2023-04-11 19:17:09', '2023-04-11 19:17:09', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (49, 1, '2023-04-11 19:27:54', '2023-04-11 19:27:54', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (50, 1, '2023-04-11 19:28:04', '2023-04-11 19:28:04', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (51, 1, '2023-04-11 19:37:11', '2023-04-11 19:37:11', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (52, 4, '2023-04-11 19:37:26', '2023-04-11 19:37:26', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (53, 4, '2023-04-11 19:37:48', '2023-04-11 19:37:48', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (54, 4, '2023-04-11 19:38:07', '2023-04-11 19:38:07', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (55, 4, '2023-04-11 19:38:18', '2023-04-11 19:38:18', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (56, 4, '2023-04-11 19:42:01', '2023-04-11 19:42:01', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (57, 2, '2023-04-11 21:43:47', '2023-04-11 21:43:47', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (58, 2, '2023-04-11 21:43:49', '2023-04-11 21:43:49', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (59, 4, '2023-04-11 21:44:08', '2023-04-11 21:44:08', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (60, 4, '2023-04-11 21:44:24', '2023-04-11 21:44:24', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (61, 4, '2023-04-11 21:44:30', '2023-04-11 21:44:30', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (62, 4, '2023-04-11 21:44:34', '2023-04-11 21:44:34', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (63, 1, '2023-04-11 21:48:05', '2023-04-11 21:48:05', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (64, 4, '2023-04-11 22:02:40', '2023-04-11 22:02:40', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (65, 4, '2023-04-11 22:08:37', '2023-04-11 22:08:37', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (66, 1, '2023-04-11 22:14:07', '2023-04-11 22:14:07', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (67, 4, '2023-04-11 22:18:25', '2023-04-11 22:18:25', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (68, 4, '2023-04-11 22:18:36', '2023-04-11 22:18:36', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (69, 1, '2023-04-11 22:24:07', '2023-04-11 22:24:07', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (70, 4, '2023-04-11 22:28:51', '2023-04-11 22:28:51', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (71, 4, '2023-04-11 22:29:45', '2023-04-11 22:29:45', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (72, 4, '2023-04-11 22:49:40', '2023-04-11 22:49:40', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (73, 4, '2023-04-11 22:49:41', '2023-04-11 22:49:41', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (74, 4, '2023-04-11 22:49:45', '2023-04-11 22:49:45', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (75, 4, '2023-04-11 22:49:56', '2023-04-11 22:49:56', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (76, 4, '2023-04-11 22:50:04', '2023-04-11 22:50:04', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (77, 4, '2023-04-11 22:51:15', '2023-04-11 22:51:15', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (78, 4, '2023-04-11 23:02:04', '2023-04-11 23:02:04', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (79, 4, '2023-04-11 23:02:09', '2023-04-11 23:02:09', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (80, 4, '2023-04-11 23:02:09', '2023-04-11 23:02:09', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (81, 4, '2023-04-11 23:02:18', '2023-04-11 23:02:18', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (82, 4, '2023-04-11 23:02:22', '2023-04-11 23:02:22', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 6);
INSERT INTO `hits` VALUES (83, 4, '2023-04-11 23:03:35', '2023-04-11 23:03:35', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 6);
INSERT INTO `hits` VALUES (84, 4, '2023-04-11 23:03:42', '2023-04-11 23:03:42', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (85, 4, '2023-04-11 23:03:46', '2023-04-11 23:03:46', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 2);
INSERT INTO `hits` VALUES (86, 4, '2023-04-11 23:03:51', '2023-04-11 23:03:51', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (87, 4, '2023-04-11 23:03:55', '2023-04-11 23:03:55', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (88, 4, '2023-04-11 23:03:58', '2023-04-11 23:03:58', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (89, 4, '2023-04-11 23:04:14', '2023-04-11 23:04:14', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (90, 4, '2023-04-11 23:04:16', '2023-04-11 23:04:16', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 2);
INSERT INTO `hits` VALUES (91, 4, '2023-04-11 23:12:54', '2023-04-11 23:12:54', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (92, 1, '2023-04-11 23:13:08', '2023-04-11 23:13:08', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (93, 1, '2023-04-11 23:13:20', '2023-04-11 23:13:20', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (94, 1, '2023-04-11 23:13:22', '2023-04-11 23:13:22', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (95, 1, '2023-04-11 23:13:27', '2023-04-11 23:13:27', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (96, 1, '2023-04-11 23:20:24', '2023-04-11 23:20:24', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (97, 4, '2023-04-11 23:25:53', '2023-04-11 23:25:53', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (98, 4, '2023-04-11 23:26:09', '2023-04-11 23:26:09', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (99, 4, '2023-04-11 23:26:12', '2023-04-11 23:26:12', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (100, 4, '2023-04-11 23:28:58', '2023-04-11 23:28:58', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (101, 4, '2023-04-11 23:29:01', '2023-04-11 23:29:01', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (102, 4, '2023-04-11 23:29:46', '2023-04-11 23:29:46', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (103, 4, '2023-04-11 23:40:28', '2023-04-11 23:40:28', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (104, 4, '2023-04-11 23:42:57', '2023-04-11 23:42:57', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 5);
INSERT INTO `hits` VALUES (105, 4, '2023-04-11 23:43:07', '2023-04-11 23:43:07', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 5);
INSERT INTO `hits` VALUES (106, 1, '2023-04-11 23:49:13', '2023-04-11 23:49:13', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (107, 1, '2023-04-11 23:49:15', '2023-04-11 23:49:15', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (108, 1, '2023-04-11 23:49:26', '2023-04-11 23:49:26', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (109, 1, '2023-04-11 23:49:34', '2023-04-11 23:49:34', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (110, 4, '2023-04-11 23:49:50', '2023-04-11 23:49:50', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 5);
INSERT INTO `hits` VALUES (111, 1, '2023-04-11 23:51:23', '2023-04-11 23:51:23', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (112, 1, '2023-04-11 23:51:27', '2023-04-11 23:51:27', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (113, 1, '2023-04-11 23:51:33', '2023-04-11 23:51:33', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (114, 1, '2023-04-11 23:51:36', '2023-04-11 23:51:36', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (115, 1, '2023-04-11 23:51:38', '2023-04-11 23:51:38', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (116, 4, '2023-04-11 23:51:57', '2023-04-11 23:51:57', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (117, 4, '2023-04-11 23:52:02', '2023-04-11 23:52:02', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (118, 1, '2023-04-11 23:59:27', '2023-04-11 23:59:27', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (119, 1, '2023-04-12 00:00:44', '2023-04-12 00:00:44', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 3);
INSERT INTO `hits` VALUES (120, 1, '2023-04-12 00:07:23', '2023-04-12 00:07:23', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 3);
INSERT INTO `hits` VALUES (121, 1, '2023-04-12 00:07:32', '2023-04-12 00:07:32', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (122, 4, '2023-04-12 00:17:17', '2023-04-12 00:17:17', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (123, 1, '2023-04-12 00:17:34', '2023-04-12 00:17:34', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (124, 0, '2023-04-12 00:23:58', '2023-04-12 00:23:58', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (125, 4, '2023-04-12 00:24:14', '2023-04-12 00:24:14', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (126, 1, '2023-04-12 00:24:37', '2023-04-12 00:24:37', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (127, 1, '2023-04-12 00:42:38', '2023-04-12 00:42:38', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (128, 1, '2023-04-12 00:42:40', '2023-04-12 00:42:40', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (129, 1, '2023-04-12 00:42:45', '2023-04-12 00:42:45', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (130, 1, '2023-04-12 00:42:55', '2023-04-12 00:42:55', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (131, 4, '2023-04-12 00:43:05', '2023-04-12 00:43:05', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (132, 4, '2023-04-12 00:47:51', '2023-04-12 00:47:51', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (133, 4, '2023-04-12 00:48:36', '2023-04-12 00:48:36', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (134, 4, '2023-04-12 00:48:45', '2023-04-12 00:48:45', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (135, 4, '2023-04-12 00:48:48', '2023-04-12 00:48:48', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (136, 1, '2023-04-12 00:49:05', '2023-04-12 00:49:05', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (137, 1, '2023-04-12 00:49:17', '2023-04-12 00:49:17', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (138, 4, '2023-04-12 00:55:33', '2023-04-12 00:55:33', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (139, 4, '2023-04-12 00:55:35', '2023-04-12 00:55:35', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (140, 4, '2023-04-12 10:49:39', '2023-04-12 10:49:39', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (141, 4, '2023-04-12 10:50:52', '2023-04-12 10:50:52', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (142, 4, '2023-04-12 10:54:13', '2023-04-12 10:54:13', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (143, 4, '2023-04-12 10:54:16', '2023-04-12 10:54:16', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (144, 4, '2023-04-12 10:54:19', '2023-04-12 10:54:19', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (145, 4, '2023-04-12 10:55:10', '2023-04-12 10:55:10', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (146, 0, '2023-04-12 11:01:51', '2023-04-12 11:01:51', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (147, 4, '2023-04-12 11:02:08', '2023-04-12 11:02:08', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (148, 4, '2023-04-12 11:02:17', '2023-04-12 11:02:17', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (149, 0, '2023-04-12 13:51:42', '2023-04-12 13:51:42', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (150, 4, '2023-04-12 13:52:02', '2023-04-12 13:52:02', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (151, 4, '2023-04-12 13:52:12', '2023-04-12 13:52:12', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (152, 4, '2023-04-12 13:57:48', '2023-04-12 13:57:48', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (153, 4, '2023-04-12 13:57:51', '2023-04-12 13:57:51', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (154, 4, '2023-04-12 14:10:15', '2023-04-12 14:10:15', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 7);
INSERT INTO `hits` VALUES (155, 4, '2023-04-12 14:10:23', '2023-04-12 14:10:23', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 7);
INSERT INTO `hits` VALUES (156, 4, '2023-04-12 14:11:12', '2023-04-12 14:11:12', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (157, 4, '2023-04-12 14:11:17', '2023-04-12 14:11:17', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (158, 4, '2023-04-12 14:13:25', '2023-04-12 14:13:25', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (159, 4, '2023-04-12 14:14:16', '2023-04-12 14:14:16', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (160, 0, '2023-04-12 14:15:53', '2023-04-12 14:15:53', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (161, 4, '2023-04-12 14:16:04', '2023-04-12 14:16:04', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (162, 4, '2023-04-12 14:16:05', '2023-04-12 14:16:05', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (163, 4, '2023-04-12 14:16:06', '2023-04-12 14:16:06', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (164, 4, '2023-04-12 14:16:20', '2023-04-12 14:16:20', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (165, 4, '2023-04-12 14:17:15', '2023-04-12 14:17:15', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (166, 4, '2023-04-12 14:20:27', '2023-04-12 14:20:27', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (167, 4, '2023-04-12 14:25:29', '2023-04-12 14:25:29', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (168, 4, '2023-04-12 14:25:31', '2023-04-12 14:25:31', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (169, 4, '2023-04-12 14:25:43', '2023-04-12 14:25:43', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (170, 0, '2023-04-12 14:26:01', '2023-04-12 14:26:01', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (171, 4, '2023-04-12 14:26:19', '2023-04-12 14:26:19', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (172, 0, '2023-04-12 14:46:07', '2023-04-12 14:46:07', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (173, 4, '2023-04-12 15:28:31', '2023-04-12 15:28:31', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 7);
INSERT INTO `hits` VALUES (174, 0, '2023-04-12 15:28:42', '2023-04-12 15:28:42', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 7);
INSERT INTO `hits` VALUES (175, 4, '2023-04-12 15:32:01', '2023-04-12 15:32:01', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (176, 4, '2023-04-12 15:37:03', '2023-04-12 15:37:03', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (177, 4, '2023-04-12 15:38:55', '2023-04-12 15:38:55', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (178, 4, '2023-04-12 15:39:00', '2023-04-12 15:39:00', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (179, 4, '2023-04-12 15:39:07', '2023-04-12 15:39:07', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (180, 4, '2023-04-12 15:39:13', '2023-04-12 15:39:13', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9);
INSERT INTO `hits` VALUES (181, 4, '2023-04-12 15:39:18', '2023-04-12 15:39:18', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (182, 4, '2023-04-12 15:39:37', '2023-04-12 15:39:37', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 2);
INSERT INTO `hits` VALUES (183, 4, '2023-04-12 15:39:40', '2023-04-12 15:39:40', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (184, 4, '2023-04-12 15:39:43', '2023-04-12 15:39:43', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (185, 4, '2023-04-12 15:39:48', '2023-04-12 15:39:48', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (186, 4, '2023-04-12 15:40:06', '2023-04-12 15:40:06', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (187, 4, '2023-04-12 15:40:08', '2023-04-12 15:40:08', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (188, 4, '2023-04-12 15:40:09', '2023-04-12 15:40:09', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (189, 4, '2023-04-12 15:41:56', '2023-04-12 15:41:56', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (190, 4, '2023-04-12 15:42:22', '2023-04-12 15:42:22', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (191, 4, '2023-04-13 01:37:33', '2023-04-13 01:37:33', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 7);
INSERT INTO `hits` VALUES (192, 4, '2023-04-13 01:37:49', '2023-04-13 01:37:49', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 7);
INSERT INTO `hits` VALUES (193, 4, '2023-04-13 01:37:50', '2023-04-13 01:37:50', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 7);
INSERT INTO `hits` VALUES (194, 4, '2023-04-13 01:49:13', '2023-04-13 01:49:13', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 1);
INSERT INTO `hits` VALUES (195, 4, '2023-04-13 01:49:18', '2023-04-13 01:49:18', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 6);
INSERT INTO `hits` VALUES (196, 4, '2023-04-13 01:49:24', '2023-04-13 01:49:24', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 6);
INSERT INTO `hits` VALUES (197, 4, '2023-04-13 08:21:15', '2023-04-13 08:21:15', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 2);
INSERT INTO `hits` VALUES (198, 0, '2023-04-13 10:33:44', '2023-04-13 10:33:44', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 6);
INSERT INTO `hits` VALUES (199, 0, '2023-04-13 10:34:03', '2023-04-13 10:34:03', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 6);
INSERT INTO `hits` VALUES (200, 4, '2023-04-13 10:38:57', '2023-04-13 10:38:57', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 6);
INSERT INTO `hits` VALUES (201, 4, '2023-04-13 10:39:09', '2023-04-13 10:39:09', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 6);
INSERT INTO `hits` VALUES (202, 4, '2023-04-20 17:04:24', '2023-04-20 17:04:24', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 2);
INSERT INTO `hits` VALUES (203, 4, '2023-04-20 18:05:01', '2023-04-20 18:05:01', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 3);
INSERT INTO `hits` VALUES (204, 2, '2023-04-20 19:12:41', '2023-04-20 19:12:41', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 7);
INSERT INTO `hits` VALUES (205, 2, '2023-04-20 19:17:18', '2023-04-20 19:17:18', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 12);
INSERT INTO `hits` VALUES (206, 4, '2023-04-20 19:18:52', '2023-04-20 19:18:52', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 12);
INSERT INTO `hits` VALUES (207, 4, '2023-04-20 19:19:05', '2023-04-20 19:19:05', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 12);
INSERT INTO `hits` VALUES (208, 1, '2023-04-21 02:23:22', '2023-04-21 02:23:22', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 14);
INSERT INTO `hits` VALUES (209, 1, '2023-04-21 02:23:37', '2023-04-21 02:23:37', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 13);
INSERT INTO `hits` VALUES (210, 0, '2023-04-21 12:31:40', '2023-04-21 12:31:40', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 15);
INSERT INTO `hits` VALUES (211, 4, '2023-04-22 17:43:08', '2023-04-22 17:43:08', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 13);
INSERT INTO `hits` VALUES (212, 4, '2023-04-22 17:48:10', '2023-04-22 17:48:10', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 13);
INSERT INTO `hits` VALUES (213, 4, '2023-04-22 17:48:25', '2023-04-22 17:48:25', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 13);
INSERT INTO `hits` VALUES (214, 4, '2023-04-22 17:48:33', '2023-04-22 17:48:33', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 13);
INSERT INTO `hits` VALUES (215, 4, '2023-04-22 17:59:14', '2023-04-22 17:59:14', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 13);
INSERT INTO `hits` VALUES (216, 4, '2023-04-22 17:59:39', '2023-04-22 17:59:39', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 13);
INSERT INTO `hits` VALUES (217, 4, '2023-04-22 19:38:56', '2023-04-22 19:38:56', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 14);
INSERT INTO `hits` VALUES (218, 4, '2023-04-22 19:39:02', '2023-04-22 19:39:02', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 14);
INSERT INTO `hits` VALUES (219, 4, '2023-04-22 19:41:23', '2023-04-22 19:41:23', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 14);
INSERT INTO `hits` VALUES (220, 4, '2023-04-22 19:56:47', '2023-04-22 19:56:47', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 14);
INSERT INTO `hits` VALUES (221, 4, '2023-04-22 20:30:45', '2023-04-22 20:30:45', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 13);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `notice_id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '公告id：',
  `title` varchar(125) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '标题：',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '正文：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '公告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES (1, '网站公告', '<p>尊敬的同学们：</p><p>我们非常高兴地宣布，校园快递代领系统现已正式启用！此系统旨在为广大同学提供更加便捷、高效的快递代领服务，让你们在繁忙的学习生活中更加轻松、舒适。</p><p>在此，我们向所有参与到系统开发中的工作人员表示感谢，你们的辛勤努力和执着追求为系统的顺利推出打下了坚实的基础。</p><p>此外，我们也要感谢各位同学一直以来的支持和耐心等待，我们的目标是为你们提供最好的服务。我们相信，经过一段时间的使用和完善，系统一定会越来越好，为你们带来更多方便和惊喜。</p><p>祝大家学业有成、生活愉快！</p><p>此致</p><p>敬礼</p><p>校园快递代领系统开发团队</p><p>日期：2023年4月21日</p>', '2023-04-19 18:21:49', '2023-04-21 12:34:42');
INSERT INTO `notice` VALUES (2, '关于我们', '<p>       一个网站要取得成功，要有先进的理念、先进的思想，更为重要的是抢占先机，及时行动。网络世界可谓一日千里、 日新月异，一个网站只有把握先机，抓住机遇，才</p><p>可能有更多的机会获得成功，可能处于网络行业发展的致高点，可能创建出成功的网站，才能能获得成功。要知道一种网站新模式在网络上只有保持几天的优势,因为人们很容易“COPY\" 和模仿，因此，唯有不</p><p>断创新，不失时机地推出新的服务、新的模式、新的思想，网站才可能长久立于不败之地。</p>', '2023-04-19 18:21:49', '2023-04-21 02:18:51');
INSERT INTO `notice` VALUES (3, '联系方式', '<h3>网站内容及品牌合作</h3><p>Email：xxxx@qq.com</p><h3>商务合作</h3><p>电话：010-xxxxxxx</p><p>Email：xxxx@qq.com</p><h3><br></h3><h3><br></h3><p><br></p>', '2023-04-19 18:21:49', '2023-04-21 02:18:58');
INSERT INTO `notice` VALUES (4, '网站介绍', '<p><span>校园快递代领系统是一个为大学校园服务的网站，旨在解决学生在校园内收发快递的问题。该系统的主要功能是让学生可以委托校内其他学生代领快递，从而省去了因为课程或活动等原因无法在快递送达时及时取件的麻烦。除了代领快递，系统还提供了寄件和查询快递状态等功能，方便学生在校园内的日常快递处理。同时，系统还提供了评价系统和举报系统，确保快递代领的安全和可靠性。该系统界面简洁明了，易于使用，是一个方便实用的校园服务平台。</span></p>', '2023-04-19 18:21:49', '2023-04-21 02:18:53');

-- ----------------------------
-- Table structure for picking_order
-- ----------------------------
DROP TABLE IF EXISTS `picking_order`;
CREATE TABLE `picking_order`  (
  `picking_order_id` int NOT NULL AUTO_INCREMENT COMMENT '代领订单ID',
  `task_number` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '任务编号',
  `task_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `publishing_users` int NULL DEFAULT 0 COMMENT '发布用户',
  `item_weight` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '物品重量',
  `item_type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '物品类型',
  `pickup_address` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '取货地址',
  `shipping_address` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '送货地址',
  `task_commission` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '任务佣金',
  `quantity_received` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '领取数量',
  `pickup_code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '取货码',
  `runner` int NULL DEFAULT 0 COMMENT '跑腿用户',
  `full_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `order_status` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单状态',
  `pay_state` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '未支付' COMMENT '支付状态',
  `pay_type` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '支付类型: 微信、支付宝、网银',
  `recommend` int NOT NULL DEFAULT 0 COMMENT '智能推荐',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`picking_order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 157 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '代领订单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of picking_order
-- ----------------------------
INSERT INTO `picking_order` VALUES (146, '1681206637216', '432', 2, '324', '342', '34', '432', '234', '', '', 0, '', '', '未支付', '', 0, '2023-04-11 23:51:35', '2023-04-11 23:51:35');
INSERT INTO `picking_order` VALUES (156, '1681989321708', 'dd', 2, 'da', 'da', 'da', 'da', 'da', '1', '1212-3', 4, '大鹅', '取货中', '已支付', '微信', 0, '2023-04-20 19:19:04', '2023-04-20 19:21:49');

-- ----------------------------
-- Table structure for praise
-- ----------------------------
DROP TABLE IF EXISTS `praise`;
CREATE TABLE `praise`  (
  `praise_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '点赞ID：',
  `user_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '点赞人：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  `source_table` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '来源字段：',
  `source_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '来源ID：',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '点赞状态:1为点赞，0已取消',
  PRIMARY KEY (`praise_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '点赞' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of praise
-- ----------------------------
INSERT INTO `praise` VALUES (1, 2, '2023-04-11 21:43:51', '2023-04-11 21:43:51', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 9, 1);
INSERT INTO `praise` VALUES (2, 4, '2023-04-13 10:44:37', '2023-04-13 10:44:37', 'article', 'article_id', 2, 1);
INSERT INTO `praise` VALUES (3, 4, '2023-04-13 10:44:47', '2023-04-13 10:44:47', 'article', 'article_id', 1, 1);
INSERT INTO `praise` VALUES (5, 2, '2023-04-20 19:17:21', '2023-04-20 19:17:21', 'collecting_tasks_on_behalf', 'collecting_tasks_on_behalf_id', 12, 1);
INSERT INTO `praise` VALUES (7, 4, '2023-04-21 01:59:39', '2023-04-21 01:59:39', 'forum', 'forum_id', 7, 1);
INSERT INTO `praise` VALUES (8, 1, '2023-04-21 02:23:15', '2023-04-21 02:23:15', 'article', 'article_id', 2, 1);

-- ----------------------------
-- Table structure for runner
-- ----------------------------
DROP TABLE IF EXISTS `runner`;
CREATE TABLE `runner`  (
  `runner_id` int NOT NULL AUTO_INCREMENT COMMENT '跑腿用户ID',
  `student_number` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '学号',
  `full_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `gender` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '性别',
  `major` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '专业',
  `department` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '院系',
  `dormitory` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '宿舍',
  `examine_state` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '已通过' COMMENT '审核状态',
  `recommend` int NOT NULL DEFAULT 0 COMMENT '智能推荐',
  `user_id` int NOT NULL DEFAULT 0 COMMENT '用户ID',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`runner_id`) USING BTREE,
  UNIQUE INDEX `student_number`(`student_number` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '跑腿用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of runner
-- ----------------------------
INSERT INTO `runner` VALUES (1, '16', '小威', '男', '网络', '网络', '16', '已通过', 0, 3, '2023-04-11 17:03:17', '2023-04-11 17:03:17');
INSERT INTO `runner` VALUES (2, '12', '大鹅', '男', '计算机', '计算机', '415', '已通过', 0, 4, '2023-04-11 17:06:30', '2023-04-11 17:06:30');

-- ----------------------------
-- Table structure for slides
-- ----------------------------
DROP TABLE IF EXISTS `slides`;
CREATE TABLE `slides`  (
  `slides_id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '轮播图ID：',
  `title` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '标题：',
  `content` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '内容：',
  `url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '链接：',
  `img` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '轮播图：',
  `hits` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '点击量：',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`slides_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '轮播图' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of slides
-- ----------------------------
INSERT INTO `slides` VALUES (1, '轮播图1', '内容1', '/article/details?article=', '/api/upload/1649127536661102593.png', 312, '2023-04-11 16:53:34', '2023-04-21 03:07:00');
INSERT INTO `slides` VALUES (2, '轮播图2', '内容2', '/article/details?article=', '/api/upload/1649127571566100481.png', 290, '2023-04-11 16:53:34', '2023-04-21 03:07:07');
INSERT INTO `slides` VALUES (3, '轮播图3', '内容3', '/article/details?article=', '/api/upload/1649127601169498112.jpg', 693, '2023-04-11 16:53:34', '2023-04-21 03:07:16');

-- ----------------------------
-- Table structure for upload
-- ----------------------------
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload`  (
  `upload_id` int NOT NULL AUTO_INCREMENT COMMENT '上传ID',
  `name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '访问路径',
  `file` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `display` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '显示顺序',
  `father_id` int NULL DEFAULT 0 COMMENT '父级ID',
  `dir` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文件夹',
  `type` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  PRIMARY KEY (`upload_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '文件上传' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of upload
-- ----------------------------
INSERT INTO `upload` VALUES (1, 'movie.mp4', '/upload/movie.mp4', '', NULL, 0, NULL, 'video');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户ID：[0,8388607]用户获取其他与用户相关的数据',
  `state` smallint UNSIGNED NOT NULL DEFAULT 1 COMMENT '账户状态：[0,10](1可用|2异常|3已冻结|4已注销)',
  `user_group` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '所在用户组：[0,32767]决定用户身份和权限',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '上次登录时间：',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '手机号码：[0,11]用户的手机号码，用于找回密码时或登录时',
  `phone_state` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '手机认证：[0,1](0未认证|1审核中|2已认证)',
  `username` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '用户名：[0,16]用户登录时所用的账户名称',
  `nickname` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '昵称：[0,16]',
  `password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '密码：[0,32]用户登录所需的密码，由6-16位数字或英文组成',
  `email` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '邮箱：[0,64]用户的邮箱，用于找回密码时或登录时',
  `email_state` smallint UNSIGNED NOT NULL DEFAULT 0 COMMENT '邮箱认证：[0,1](0未认证|1审核中|2已认证)',
  `avatar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '头像地址：[0,255]',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户账户：用于保存用户登录信息' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 1, '管理员', '2023-04-21 02:02:40', '13133332333', 0, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', '', 0, '/api/upload/1649111054048821248.png', '2023-04-28 17:35:13');
INSERT INTO `user` VALUES (2, 1, '雇主用户', '2023-04-11 17:01:21', '13123456789', 0, '456789', '夏殇', 'e35cf7b66449df565f93c607d5a81d09', '456789@qq.com', 0, NULL, '2023-04-11 17:01:21');
INSERT INTO `user` VALUES (3, 1, '跑腿用户', '2023-04-11 17:03:17', '13623453454', 0, '345678', '威威', '5bd2026f128662763c532f2f4b6f2476', '345678@qq.com', 0, NULL, '2023-04-11 17:03:17');
INSERT INTO `user` VALUES (4, 1, '跑腿用户', '2023-04-21 01:47:46', '15645678953', 0, '234567', '水水', 'b3275960d68fda9d831facc0426c3bbc', '2345678@qq.com', 0, '/api/upload/1649107418354810880.jpg', '2023-04-11 17:06:30');
INSERT INTO `user` VALUES (5, 1, '雇主用户', '2023-04-20 18:59:32', '15612345555', 0, '1234567', 'qweq', 'fcea920f7412b5da7be0cf42b8c93759', '1231212312@qq.c', 0, NULL, '2023-04-20 18:59:32');
INSERT INTO `user` VALUES (6, 1, '雇主用户', '2023-04-21 12:46:30', '', 0, '12345678', 'dream', '25d55ad283aa400af464c76d713c07ad', '', 0, NULL, '2023-04-21 12:46:30');

-- ----------------------------
-- Table structure for user_group
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group`  (
  `group_id` mediumint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户组ID：[0,8388607]',
  `display` smallint UNSIGNED NOT NULL DEFAULT 100 COMMENT '显示顺序：[0,1000]',
  `name` varchar(16) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '名称：[0,16]',
  `description` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '描述：[0,255]描述该用户组的特点或权限范围',
  `source_table` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '来源表：',
  `source_field` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '来源字段：',
  `source_id` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '来源ID：',
  `register` smallint UNSIGNED NULL DEFAULT 0 COMMENT '注册位置:',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间：',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间：',
  PRIMARY KEY (`group_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户组：用于用户前端身份和鉴权' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_group
-- ----------------------------
INSERT INTO `user_group` VALUES (1, 100, '管理员', NULL, '', '', 0, 0, '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `user_group` VALUES (2, 100, '游客', NULL, '', '', 0, 0, '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `user_group` VALUES (3, 100, '雇主用户', NULL, 'employer_user', 'employer_user_id', 0, 3, '2023-04-11 16:53:34', '2023-04-11 16:53:34');
INSERT INTO `user_group` VALUES (4, 100, '跑腿用户', NULL, 'runner', 'runner_id', 0, 3, '2023-04-11 16:53:34', '2023-04-11 16:53:34');

SET FOREIGN_KEY_CHECKS = 1;
