/*
 Navicat Premium Data Transfer

 Source Server         : dy
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : 103.222.190.186:3306
 Source Schema         : dy-cms

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 12/03/2021 15:50:51
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for db_fhdb
-- ----------------------------
DROP TABLE IF EXISTS `db_fhdb`;
CREATE TABLE `db_fhdb`  (
  `FHDB_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USERNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户',
  `BACKUP_TIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备份时间',
  `TABLENAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `SQLPATH` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存储位置',
  `TYPE` int(1) NOT NULL COMMENT '类型',
  `DBSIZE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件大小',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHDB_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of db_fhdb
-- ----------------------------

-- ----------------------------
-- Table structure for db_timingbackup
-- ----------------------------
DROP TABLE IF EXISTS `db_timingbackup`;
CREATE TABLE `db_timingbackup`  (
  `TIMINGBACKUP_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `JOBNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `CREATE_TIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `TABLENAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `STATUS` int(1) NOT NULL COMMENT '类型',
  `FHTIME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间规则',
  `TIMEEXPLAIN` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '规则说明',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TIMINGBACKUP_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of db_timingbackup
-- ----------------------------
INSERT INTO `db_timingbackup` VALUES ('311e06c34a5e4518a86d5d30799f9b55', 'sys_app_user_515762', '2016-04-11 17:04:55', 'sys_app_user', 2, '1/2 * * ? * *', '每个月的 每周 每天 每小时执行一次', '备份任务');
INSERT INTO `db_timingbackup` VALUES ('bc4a788bc2ec40bdb1b7730131c26d42', 'sys_app_user_359515', '2016-04-12 17:24:05', 'sys_app_user', 2, '1/3 * * ? * *', '每个月的 每周 每天 每小时执行一次', 'ssss');

-- ----------------------------
-- Table structure for dy_scancode
-- ----------------------------
DROP TABLE IF EXISTS `dy_scancode`;
CREATE TABLE `dy_scancode`  (
  `SCANCODE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `VIDEO_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频id',
  `SCANTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '扫码时间',
  PRIMARY KEY (`SCANCODE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dy_scancode
-- ----------------------------
INSERT INTO `dy_scancode` VALUES ('fdc4db5deab34a768e282e5b3a427bc2', '1ef1620a7cd747d4844a268c3eabfaf3', '2020-03-08');

-- ----------------------------
-- Table structure for dy_template
-- ----------------------------
DROP TABLE IF EXISTS `dy_template`;
CREATE TABLE `dy_template`  (
  `TEMPLATE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `TEMPLATE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板',
  `CREATETIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `CREATEMAN` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `MEMO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`TEMPLATE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dy_template
-- ----------------------------
INSERT INTO `dy_template` VALUES ('1', 'bw', '/123', NULL, '1', '123');
INSERT INTO `dy_template` VALUES ('2', 'brt', '/456', NULL, '2', '456');
INSERT INTO `dy_template` VALUES ('bf90ce282667445c9b84a938b4f478ea', '测试', '1', '2021-03-07', '1', '1');

-- ----------------------------
-- Table structure for dy_video
-- ----------------------------
DROP TABLE IF EXISTS `dy_video`;
CREATE TABLE `dy_video`  (
  `VIDEO_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频名称',
  `VIDEO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频',
  `APPUSERID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属商户',
  `CREATETIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `MEMO` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `TITLE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分享标题',
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分享描述',
  PRIMARY KEY (`VIDEO_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dy_video
-- ----------------------------
INSERT INTO `dy_video` VALUES ('2360c8fb9fba438b8f0ca8b26ec2b7f4', '1111', 'uploadFiles/uploadImgs/20210309/1e652de01ba74ec08d95aa2400ca6bae.png', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_app_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_user`;
CREATE TABLE `sys_app_user`  (
  `USER_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RIGHTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ROLE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LAST_LOGIN` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IP` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATUS` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PHONE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SFID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `START_TIME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `END_TIME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `YEARS` int(10) NULL DEFAULT NULL,
  `NUMBER` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EMAIL` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_app_user
-- ----------------------------
INSERT INTO `sys_app_user` VALUES ('1e89e6504be349a68c025976b3ecc1d1', 'a1', 'e10adc3949ba59abbe56e057f20f883e', '会员甲', '', '115b386ff04f4352b060dffcd2b5d1da', '', '', '1', '121', '1212', '1212', '2015-12-02', '2015-12-25', 2, '111', '313596790@qq.com');
INSERT INTO `sys_app_user` VALUES ('35b99dd4bd184f659d4938118babade3', '1', 'b5cf498b70a176efeacbc5b07d88e0da76a7f4cb', NULL, NULL, '1b67fc82ce89457a8347ae53e43a347e', '2021-03-04 00:06:43', '', '1', '注册用户', NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_app_user` VALUES ('40f260df061f4428acec1125e2ecab5d', 'user123', '0989d5146d7f787f2d502997b05a25bc1aa912ed', '1111', NULL, '1b67fc82ce89457a8347ae53e43a347e', '2021-03-07 13:05:54', '', '0', '注册用户', NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_app_user` VALUES ('49af5995cf7d43a6ad784f6ec100941f', 'user111', 'ad5874627ceb40755669493c6fbba24dfce3907c', '', NULL, '1b67fc82ce89457a8347ae53e43a347e', '', '', '0', '注册用户', NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_app_user` VALUES ('5f831542e0ee47b984c77ab7d6b5e230', '1', '17ba0791499db908433b80f37c5fbc89b870084b', '1', '', '115b386ff04f4352b060dffcd2b5d1da', '', '', '1', '注册用户', '', NULL, NULL, NULL, NULL, '', '1396796583@qq.com');
INSERT INTO `sys_app_user` VALUES ('9317be8c2cf84cc69c387b40de99d8a4', 'user', '192379335c36be1cabe6ce872dbe6c7bf2f06a49', '', NULL, '1b67fc82ce89457a8347ae53e43a347e', '2021-03-09 23:43:36', '', '0', '注册用户', NULL, NULL, NULL, NULL, NULL, '', NULL);
INSERT INTO `sys_app_user` VALUES ('da2695edeb46443dbca614043c7d9735', '2', '12c6fc06c99a462375eeb3f43dfd832b08ca9e17', '2', '', '115b386ff04f4352b060dffcd2b5d1da', '2021-03-02 00:16:45', '', '1', '注册用户', '', NULL, NULL, NULL, NULL, '', '1396796583@qq.com');
INSERT INTO `sys_app_user` VALUES ('ee9612e914e34e38b2e1f3552f9178f0', '测试', '96a3be3cf272e017046d1b2674a52bd3', '测试', '', '115b386ff04f4352b060dffcd2b5d1da', '', '', '1', '', '15247810907', '', '2021-03-07', '', 1, '01', '1396796583@qq.com');

-- ----------------------------
-- Table structure for sys_blacklist
-- ----------------------------
DROP TABLE IF EXISTS `sys_blacklist`;
CREATE TABLE `sys_blacklist`  (
  `BLACKLIST_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IP` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `CTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`BLACKLIST_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_blacklist
-- ----------------------------

-- ----------------------------
-- Table structure for sys_codeeditor
-- ----------------------------
DROP TABLE IF EXISTS `sys_codeeditor`;
CREATE TABLE `sys_codeeditor`  (
  `CODEEDITOR_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TYPE` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `FTLNMAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `CTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `CODECONTENT` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '代码',
  PRIMARY KEY (`CODEEDITOR_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_codeeditor
-- ----------------------------
INSERT INTO `sys_codeeditor` VALUES ('18c459804cb8467db7b49d141f94b833', 'createHtml', 'indexTemplate', '2017-07-03 02:09:34', '<!DOCTYPE html>\n<!--[if lt IE 7 ]><html class=\"ie ie6\" lang=\"en\"> <![endif]-->\n<!--[if IE 7 ]><html class=\"ie ie7\" lang=\"en\"> <![endif]-->\n<!--[if IE 8 ]><html class=\"ie ie8\" lang=\"en\"> <![endif]-->\n<!--[if (gte IE 9)|!(IE)]><!-->\n<html lang=\"en\">\n<!--<![endif]-->\n<head>\n<meta charset=\"utf-8\">\n<title>${TITLE}</title>\n<meta name=\"keywords\" content=\"${KEYWORDS}\" />\n<meta name=\"description\" content=\"${DESCRIPTION}\">\n<meta name=\"author\" content=\"fhadmin\">\n<meta name=\"viewport\"\n	content=\"width=device-width, initial-scale=1, maximum-scale=1\">\n<!-- CSS -->\n<link rel=\"stylesheet\" href=\"fh_static_1/css/style.css\">\n<link rel=\"stylesheet\" type=\"text/css\"\n	href=\"fh_static_1/css/settings.css\" media=\"screen\" />\n<!-- JS -->\n<script src=\"fh_static_1/js/jquery-1.8.2.min.js\" type=\"text/javascript\"></script>\n<!-- jQuery -->\n<script src=\"fh_static_1/js/jquery.easing.1.3.js\" type=\"text/javascript\"></script>\n<!-- jQuery easing -->\n<script src=\"fh_static_1/js/modernizr.custom.js\" type=\"text/javascript\"></script>\n<!-- Modernizr -->\n<script src=\"fh_static_1/js/jquery-ui-1.10.1.custom.min.js\"\n	type=\"text/javascript\"></script>\n<!-- tabs, toggles, accordion -->\n<script src=\"fh_static_1/js/custom.js\" type=\"text/javascript\"></script>\n<!-- jQuery initialization -->\n<!-- Responsive Menu -->\n<script src=\"fh_static_1/js/jquery.meanmenu.js\"></script>\n<script>\n	jQuery(document).ready(function() {\n		jQuery(\'header nav\').meanmenu();\n	});\n</script>\n<!-- Revolution Slider -->\n<script src=\"fh_static_1/js/jquery.themepunch.plugins.min.js\"></script>\n<script src=\"fh_static_1/js/jquery.themepunch.revolution.min.js\"></script>\n<script src=\"fh_static_1/js/revolution-slider-options.js\"></script>\n<!-- Prety photo -->\n<script src=\"fh_static_1/js/jquery.prettyPhoto.js\"></script>\n<script>\n	$(document).ready(function() {\n		$(\"a[data-gal^=\'prettyPhoto\']\").prettyPhoto();\n	});\n</script>\n<!-- Tooltip -->\n<script src=\"fh_static_1/js/tooltip.js\"></script>\n<!-- Flexisel -->\n<script type=\"text/javascript\" src=\"fh_static_1/js/jquery.flexisel.js\"></script>\n<!-- Favicons  -->\n<link rel=\"shortcut icon\" href=\"fh_static_1/images/favicon.ico\">\n<link rel=\"apple-touch-icon\" href=\"fh_static_1/images/apple-touch-icon.png\">\n<link rel=\"apple-touch-icon\" sizes=\"72x72\" href=\"fh_static_1/images/apple-touch-icon-72x72.png\">\n<link rel=\"apple-touch-icon\" sizes=\"114x114\" href=\"fh_static_1/images/apple-touch-icon-114x114.png\">\n</head>\n<body>\n\n	<!-- header 包含导航菜单 -->\n	<#include \"headerTemplate.ftl\"> \n	<!-- header 包含导航菜单 -->\n\n	<!-- REVOLUTION SLIDER -->\n	<div class=\"fullwidthbanner-container top-shadow\">\n		<div class=\"fullwidthbanner\">\n			<ul>\n				<#list fieldList1 as var>\n					<li data-transition=\"boxfade\" data-slotamount=\"${var_index+1+1}\" data-masterspeed=\"300\">\n						<img src=\"${var[1]}\" alt=\"${var[0]}\">\n					</li>\n				</#list>\n			</ul>\n		</div>\n	</div>\n	<!-- END REVOLUTION SLIDER  -->\n	<div class=\"copyrights\">\n	</div>\n	<div class=\"container\">\n\n		<div class=\"sixteen columns welcome\">\n			<h3>\n				${TITLE1}\n				<br />\n				${TITLE2}\n			</h3>\n		</div>\n\n		<div class=\"separator\"></div>\n\n		<div class=\"four columns\">\n			<!-- Icon Box -->\n			<div class=\"service\">\n				<a href=\"${CPTOURL1}\">\n					<i class=\"fa fa-desktop colored square\"></i>\n				</a>\n				<h3 class=\"centered\">\n					<a href=\"${CPTOURL1}\" class=\"dark-link\">${CPTITLE1}</a>\n				</h3>\n				<p class=\"centered\">${CPCONTENT1}</p>\n			</div>\n			<!-- End Icon Box -->\n		</div>\n		<div class=\"four columns\">\n			<!-- Icon Box -->\n			<div class=\"service\">\n				<a href=\"${CPTOURL2}\">\n					<i class=\"fa fa-html5 colored square\"></i>\n				</a>\n				<h3 class=\"centered\">\n					<a href=\"${CPTOURL2}\" class=\"dark-link\">${CPTITLE2}</a>\n				</h3>\n				<p class=\"centered\">${CPCONTENT2}</p>\n			</div>\n			<!-- End Icon Box -->\n		</div>\n		<div class=\"four columns\">\n			<!-- Icon Box -->\n			<div class=\"service\">\n				<a href=\"${CPTOURL3}\">\n					<i class=\"fa fa-css3 colored square\"></i>\n				</a>\n				<h3 class=\"centered\">\n					<a href=\"${CPTOURL3}\" class=\"dark-link\">${CPTITLE3}</a>\n				</h3>\n				<p class=\"centered\">${CPCONTENT3}</p>\n			</div>\n			<!-- End Icon Box -->\n		</div>\n		<div class=\"four columns\">\n			<!-- Icon Box -->\n			<div class=\"service\">\n				<a href=\"${CPTOURL4}\">\n					<i class=\"fa fa-magic colored square\"></i>\n				</a>\n				<h3 class=\"centered\">\n					<a href=\"${CPTOURL4}\" class=\"dark-link\">${CPTITLE4}</a>\n				</h3>\n				<p class=\"centered\">${CPCONTENT4}</p>\n			</div>\n			<!-- End Icon Box -->\n		</div>\n\n		<div class=\"clearfix\"></div>\n\n		<div class=\"separator\"></div>\n\n		<div class=\"sixteen columns\">\n			<h4 class=\"headline\">项目案例 ></h4>\n		</div>\n\n		<#list fieldList2 as var>\n		<div class=\"four columns identity\">\n			<div class=\"work\">\n				<a href=\"${var[1]}\" data-gal=\"prettyPhoto\" class=\"work-image\">\n					<img src=\"${var[1]}\" alt=\"${var[0]}\">\n					<div class=\"link-overlay fa fa-search\"></div>\n				</a>\n				<a href=\"${var[2]}\" class=\"work-name\">${var[0]}</a>\n				<div class=\"tags\">${var[3]}</div>\n			</div>\n		</div>\n		</#list>\n\n		<div class=\"clearfix\"></div>\n\n		<!-- begin promobox -->\n		<div class=\"sixteen columns\">\n			<div class=\"promo-box clearfix\">\n				<div class=\"text\">\n					<h3>${CONTENT1}</h3>\n					<p>${CONTENT2}</p>\n				</div>\n				<a class=\"btn big colored\" href=\"${TOURL}\" target=\"_blank\">\n					<i class=\"fa fa-hand-o-right\"></i>了解更多</a>\n			</div>\n		</div>\n		<!-- end promobox -->\n\n		<div class=\"separator\"></div>\n\n		<!-- Our Clients  -->\n		<div class=\"sixteen columns clients\">\n			<h4 class=\"headline\">合作伙伴 ></h4>\n\n			<!-- Start brand carousel -->\n			<ul id=\"flexiselDemo2\">\n			<#list fieldList3 as var>\n				<li onclick=\"window.location.href=\'${var[2]}\'\"><img src=\"${var[1]}\" alt=\"${var[0]}\" /></li>\n			</#list>	\n			</ul>\n			<div class=\"clearout\"></div>\n			<!-- End brand carousel -->\n		</div>\n\n	</div>\n	<!-- container -->\n	\n	<!-- footer 包含底部 -->\n	<#include \"footerTemplate.ftl\"> \n	<!-- footer 包含底部  -->\n\n	<script type=\"text/javascript\">\n		$(window).load(function() {\n		\n			$(\"#index\").addClass(\"current_page_item\");\n		\n			$(\"#flexiselDemo2\").flexisel({\n				visibleItems : 5,\n				animationSpeed : 1000,\n				autoPlay : true,\n				autoPlaySpeed : 3000,\n				pauseOnHover : true,\n				enableResponsiveBreakpoints : true,\n				responsiveBreakpoints : {\n					portrait : {\n						changePoint : 480,\n						visibleItems : 1\n					},\n					landscape : {\n						changePoint : 640,\n						visibleItems : 2\n					},\n					tablet : {\n						changePoint : 768,\n						visibleItems : 3\n					}\n				}\n			});\n\n		});\n	</script>\n	<!-- End Document  -->\n</body>\n</html>\n');

-- ----------------------------
-- Table structure for sys_createcode
-- ----------------------------
DROP TABLE IF EXISTS `sys_createcode`;
CREATE TABLE `sys_createcode`  (
  `CREATECODE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PACKAGENAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '包名',
  `OBJECTNAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类名',
  `TABLENAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `FIELDLIST` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性集',
  `CREATETIME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `TITLE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `FHTYPE` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CREATECODE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_createcode
-- ----------------------------
INSERT INTO `sys_createcode` VALUES ('62c52a90a4064d8db4b204b029f79890', 'xshc', 'Video', 'dy_,fh,VIDEO', 'NAME,fh,String,fh,视频名称,fh,是,fh,无,fh,255,fh,0Q313596790VIDEO,fh,String,fh,视频,fh,是,fh,无,fh,255,fh,0Q313596790APPUSERID,fh,String,fh,所属商户,fh,是,fh,无,fh,255,fh,0Q313596790CREATETIME,fh,Date,fh,创建时间,fh,是,fh,无,fh,32,fh,0Q313596790MEMO,fh,String,fh,备注,fh,是,fh,无,fh,255,fh,0Q313596790TITLE,fh,String,fh,分享标题,fh,是,fh,无,fh,255,fh,0Q313596790DESCRIPTION,fh,String,fh,分享描述,fh,是,fh,无,fh,255,fh,0Q313596790', '2021-03-02 22:36:17', '视频管理', 'single');
INSERT INTO `sys_createcode` VALUES ('e770e82fee09456c992b20238b6da6de', 'xshc', 'Template', 'dy_,fh,TEMPLATE', 'NAME,fh,String,fh,名称,fh,是,fh,无,fh,255,fh,0Q313596790TEMPLATE,fh,String,fh,模板,fh,是,fh,无,fh,255,fh,0Q313596790CREATETIME,fh,Date,fh,创建时间,fh,是,fh,无,fh,32,fh,0Q313596790CREATEMAN,fh,String,fh,创建人,fh,是,fh,无,fh,255,fh,0Q313596790MEMO,fh,String,fh,备注,fh,是,fh,无,fh,255,fh,0Q313596790', '2021-03-02 21:44:49', '模板管理', 'single');

-- ----------------------------
-- Table structure for sys_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS `sys_dictionaries`;
CREATE TABLE `sys_dictionaries`  (
  `DICTIONARIES_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `NAME_EN` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文',
  `BIANMA` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `ORDER_BY` int(11) NOT NULL COMMENT '排序',
  `PARENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级ID',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `TBSNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排查表',
  PRIMARY KEY (`DICTIONARIES_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dictionaries
-- ----------------------------
INSERT INTO `sys_dictionaries` VALUES ('0193ffbfae1e49e0b7810546cada316a', '济南', 'JiNan', '0030301', 1, '10f46a521ea0471f8d71ee75ac3b5f3a', '济南', '');
INSERT INTO `sys_dictionaries` VALUES ('096e4ec8986149d994b09e604504e38d', '黄浦区', 'huangpu', '0030201', 1, 'f1ea30ddef1340609c35c88fb2919bee', '黄埔', '');
INSERT INTO `sys_dictionaries` VALUES ('10f46a521ea0471f8d71ee75ac3b5f3a', '山东', 'ShanDong', '00303', 3, 'be4a8c5182c744d28282a5345783a77f', '山东省', '');
INSERT INTO `sys_dictionaries` VALUES ('12a62a3e5bed44bba0412b7e6b733c93', '北京', 'beijing', '00301', 1, 'be4a8c5182c744d28282a5345783a77f', '北京', '');
INSERT INTO `sys_dictionaries` VALUES ('507fa87a49104c7c8cdb52fdb297da12', '宣武区', 'xuanwuqu', '0030101', 1, '12a62a3e5bed44bba0412b7e6b733c93', '宣武区', '');
INSERT INTO `sys_dictionaries` VALUES ('66f1ff79b13947da98525aff7380ef50', '高新区', 'gaoxinqu', '003030101', 1, '0193ffbfae1e49e0b7810546cada316a', '高新区', '');
INSERT INTO `sys_dictionaries` VALUES ('8994f5995f474e2dba6cfbcdfe5ea07a', '语文', 'yuwen', '00201', 1, 'fce20eb06d7b4b4d8f200eda623f725c', '语文', '');
INSERT INTO `sys_dictionaries` VALUES ('8ea7c44af25f48b993a14f791c8d689f', '分类', 'fenlei', '001', 1, '0', '分类', '');
INSERT INTO `sys_dictionaries` VALUES ('be4a8c5182c744d28282a5345783a77f', '地区', 'diqu', '003', 3, '0', '地区', '');
INSERT INTO `sys_dictionaries` VALUES ('d428594b0494476aa7338d9061e23ae3', '红色', 'red', '00101', 1, '8ea7c44af25f48b993a14f791c8d689f', '红色', '');
INSERT INTO `sys_dictionaries` VALUES ('de9afadfbed0428fa343704d6acce2c4', '绿色', 'green', '00102', 2, '8ea7c44af25f48b993a14f791c8d689f', '绿色', '');
INSERT INTO `sys_dictionaries` VALUES ('f1ea30ddef1340609c35c88fb2919bee', '上海', 'shanghai', '00302', 2, 'be4a8c5182c744d28282a5345783a77f', '上海', '');
INSERT INTO `sys_dictionaries` VALUES ('fce20eb06d7b4b4d8f200eda623f725c', '课程', 'kecheng', '002', 2, '0', '课程', '');

-- ----------------------------
-- Table structure for sys_fhbutton
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhbutton`;
CREATE TABLE `sys_fhbutton`  (
  `FHBUTTON_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `QX_NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHBUTTON_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_fhbutton
-- ----------------------------
INSERT INTO `sys_fhbutton` VALUES ('3542adfbda73410c976e185ffe50ad06', '导出EXCEL', 'toExcel', '导出EXCEL');
INSERT INTO `sys_fhbutton` VALUES ('46992ea280ba4b72b29dedb0d4bc0106', '发邮件', 'email', '发送电子邮件');
INSERT INTO `sys_fhbutton` VALUES ('4efa162fce8340f0bd2dcd3b11d327ec', '导入EXCEL', 'FromExcel', '导入EXCEL到系统用户');
INSERT INTO `sys_fhbutton` VALUES ('cc51b694d5344d28a9aa13c84b7166cd', '发短信', 'sms', '发送短信');

-- ----------------------------
-- Table structure for sys_fhlog
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhlog`;
CREATE TABLE `sys_fhlog`  (
  `FHLOG_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USERNAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `CZTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作时间',
  `CONTENT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '事件',
  PRIMARY KEY (`FHLOG_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_fhlog
-- ----------------------------
INSERT INTO `sys_fhlog` VALUES ('0347bd4c96f94a0fb68717eb0c22cb06', 'user', '2021-03-07 18:53:24', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('036a45da90b7447c8dfbbb4d6f601836', '会员甲', '2021-03-07 12:55:03', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('04a4ca67bc0546eb9a4e169fb8ab1fae', 'admin', '2021-03-03 21:37:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('04e3931a759740b9b5b6d0cbd4eab4c3', 'user', '2021-03-07 18:59:37', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('0ab62fbe57f74fea9c1e382cd7c99e04', 'admin', '2021-03-03 21:59:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0dab6c9a7cfb44b585ccaa58658ec1e9', 'user123', '2021-03-07 13:05:54', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('0e86d357258c4d3eb36222b859c2dcc9', '', '2021-03-03 23:12:14', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('13001d967218447a93f91b7021fe0ca2', 'user123', '2021-03-07 13:02:57', '会员注册');
INSERT INTO `sys_fhlog` VALUES ('1aecaee1b6cc4aeab117ddf385a3a417', '', '2021-03-07 18:46:51', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('1c17f74874a54b2fb55d55de2c11fad8', 'admin', '2021-03-01 21:16:23', '退出');
INSERT INTO `sys_fhlog` VALUES ('2117b7370c334bb283831e3d5d283e46', 'user', '2021-03-07 19:00:58', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('2bb6d868d7184c029bbb79f4cd5c9726', 'user', '2021-03-07 18:46:56', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('2e41c9e2993c420ab65b8c0778d0624d', 'user', '2021-03-09 22:38:05', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('2e7ccd92d7dc4210b75e038f985d1151', 'user', '2021-03-09 23:20:44', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('2e97e056e5784a8c9d55e39dc7e8adfe', '', '2021-03-03 23:15:20', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('30d1ec6ba7c64085b8b3015ba7e0a2ba', '', '2021-03-04 00:06:22', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('32f6246022414fbc9d96f79e0e360ca7', 'admin', '2021-03-03 21:47:00', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('346b6b2d4e0c4dd2977217cc942a2c48', 'admin', '2021-03-02 22:42:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3ad3e3e4a4ef45d588bd9d8cd32a10f3', '', '2021-03-03 23:16:23', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('3b72a95510ec49448c4e17143246ce99', 'user', '2021-03-07 18:53:49', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('3def6760e4694a0793265f4905d9f8db', 'admin', '2021-03-07 12:39:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3f68536e34624c6fa8f204832cc8d078', '2', '2021-03-02 00:16:45', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('4134f3cebdb9404b93e6971dfc79d20a', 'user', '2021-03-09 23:00:58', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('41f2e6c172704df38a7c8f6edc173514', 'user', '2021-03-07 18:58:36', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('446e79545e0544eabab54bdf37a2c9c9', 'user', '2021-03-07 18:42:16', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('454f5af23a4f447386a4892a8f3cc2fd', 'admin', '2021-03-03 20:55:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4eb5bf65cca74a13a3c212363923afcd', '', '2021-03-03 23:10:25', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('4ffb65c3aade4bde8779e9ab92a594fa', '', '2021-03-07 11:00:31', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('51c9a983e972471381bbc4d60952076a', '', '2021-03-03 23:13:00', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('51e538990386417ab30b6eef5274c505', 'admin', '2021-03-03 23:37:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5257124199654c7b9402479f2214d08a', 'admin', '2021-03-02 21:52:11', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('52e219fe1cc64043bec72364f55c5813', 'user', '2021-03-09 22:53:06', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('534f48ea28db48229779af7bcd84cde5', 'user', '2021-03-09 23:02:00', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('56954a824dcf419897cac79a7d0144f3', 'admin', '2021-03-03 21:47:10', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('56ac5dd39fe547b6b6cbf65f5ed95bf8', 'admin', '2021-03-07 12:42:00', '退出');
INSERT INTO `sys_fhlog` VALUES ('56e5fcc5c9e0493fae3dd605f7f188f4', '', '2021-03-03 23:15:02', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('570dbd16bfeb476aa16893200e7274a9', 'user', '2021-03-09 23:25:21', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('57c31e1cc9f04254877dad070e61dcbe', '', '2021-03-03 23:08:22', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('58c7baebac934f70a66ff82cf98d7f5c', 'user', '2021-03-09 23:26:45', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('593427ec916240e798116f990077ef92', 'user', '2021-03-07 18:42:37', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('5b613b9903ed4190b41a1b6df8588188', 'admin', '2021-03-03 23:06:56', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('5c6a4fafe312491eacc2fcb00b64f4f5', 'user111', '2021-03-07 13:03:19', '会员注册');
INSERT INTO `sys_fhlog` VALUES ('601c429076144c58878b9339ab1b3bbd', '会员甲', '2021-03-07 12:56:05', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('612392204bce46ac9e1ca3d3a53b8efe', '', '2021-03-03 23:14:32', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('649e572384384b4ca2766706e24bd7cc', 'user', '2021-03-07 18:56:27', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('64e250c0168747d28d4eaec9c51ceca3', 'user', '2021-03-07 19:02:16', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('685dafbbd0aa45478995e11042f195f5', 'admin', '2021-03-01 20:26:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('68b21478626047609b8b1cc44387734f', 'user', '2021-03-09 23:20:50', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('696ba1bbfbe9467798a319cd10afc296', '1', '2021-03-01 21:13:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6c3da5da97344d588f8f5722d48c5d61', 'admin', '2021-03-03 22:02:50', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('6c644d65f8b7406596cef9cb159069a8', 'user', '2021-03-09 23:23:00', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('6d08acf4d85242b895873f828f0bf595', 'user', '2021-03-07 19:13:57', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('6ea06d448ddf49c8a8cd41d26c4e2870', '', '2021-03-03 23:15:07', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('75b824e783404987b1f47d33a5ffe7d4', '1', '2021-03-04 00:01:30', '会员注册');
INSERT INTO `sys_fhlog` VALUES ('76129fa9e4b348f295ca8010b24e4300', 'user', '2021-03-07 18:59:56', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('769cf1b833b94244944b8f6343ae580a', 'user', '2021-03-07 18:43:46', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('7880a2c321564bc485e8142ec9ed967c', 'admin', '2021-03-02 21:52:04', '新增菜单模板管理');
INSERT INTO `sys_fhlog` VALUES ('793f125d87234141a6d424979fa84134', 'admin', '2021-03-01 21:27:28', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7a4c6a894c9f4fe080150695ae3653d8', 'user', '2021-03-09 23:23:51', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('7c9079da978d4d65a08bfac5de99d525', 'admin', '2021-03-02 21:35:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('83ac9e55f3164f858bf167711444d2c7', '1', '2021-03-04 00:06:28', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('85156c6b055c4896ab21ae37b2c79f95', 'a1', '2021-03-07 12:56:11', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('8c16ce8e762644d796174def107d39c2', 'test', '2021-03-11 13:38:37', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('8da0c42fc66643c4bf87341bb5dd04d8', 'user', '2021-03-09 23:13:58', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('8f2236e26a0741ea9f04b363c1186aa8', '1', '2021-03-04 00:03:25', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('8f5e56d5b9464942a9b37bf7282a52f6', 'user', '2021-03-09 22:37:15', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('92fdb4e324cc49558b07074797802c30', 'admin', '2021-03-02 22:40:16', '新增菜单视频管理');
INSERT INTO `sys_fhlog` VALUES ('93e0c2af0b634e78ae47849053024670', 'admin', '2021-03-03 21:48:58', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('9580268681e641828cc234784a38f7d0', 'user', '2021-03-07 18:47:58', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('97b0447857c444779394a6ac652cc6f2', 'admin', '2021-03-03 20:56:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9b8773ebbb6d4403b1ceaed9eade65bd', 'user123', '2021-03-07 13:04:11', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('9ce16965b4944294a4e9466e382e06e1', 'admin', '2021-03-03 21:49:00', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('9e8abe6e163649be9fb55499a94b7955', 'admin', '2021-02-23 21:35:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9e8dccea15d1438f89c9a838bbfac8ad', 'admin', '2021-03-07 12:40:45', '新增系统用户：testUser');
INSERT INTO `sys_fhlog` VALUES ('a0b1907c103e4d7db63bf57c569ad888', 'admin', '2021-03-03 22:17:01', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('a1564aa6de924c84be6c42cec07682d5', 'admin', '2021-03-07 11:35:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a53148a9cafc418aba5143b5ecae5a90', 'admin', '2021-03-02 22:40:42', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('a5ed079ea135429b9d1b58d6e8d4c87f', '', '2021-03-03 23:15:44', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('a61fd1fe7b1a41a3852faad011479054', 'admin', '2021-03-02 21:52:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a74bcd5016504d399a4a872ec972f6be', 'a1', '2021-03-07 13:06:30', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('ab7d6e7261924dc0ac1051976babc6ce', '', '2021-03-07 18:38:06', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('ad703c656d464e358bcf6feb240c1d21', '1', '2021-03-04 00:02:50', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('b01c386f16294677aa04d61b781e4a4a', 'a1', '2021-03-07 18:16:27', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('b13230b3fc1541e19f96d9bf2761de00', '1', '2021-03-01 21:13:30', '新注册');
INSERT INTO `sys_fhlog` VALUES ('b4939837556042eba7accaae6ba02dc8', 'user', '2021-03-09 23:15:21', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('b4db1e26d8e44570b1a26177fc95f3dc', 'admin', '2021-03-01 20:48:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b50a5f59ac83469bb0866dc9955397f3', '', '2021-03-03 23:08:21', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('b50bcac8d07d4b0ba4b78079d01f0ef8', 'admin', '2021-03-03 23:16:37', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('b54c06c538494b4398a1bf41d2b32ab3', 'admin', '2021-03-07 12:38:49', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('b5abafd7c5a5494297c0f682c79fe800', 'admin', '2021-03-03 21:44:23', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('bb6a6d480b9449d282eebf07ba065ace', 'admin', '2021-03-02 00:11:53', '退出');
INSERT INTO `sys_fhlog` VALUES ('bd97c4a9f1bc440fb121005114a1bbe1', 'user', '2021-03-09 23:09:57', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('bf339614462644479466069de4520f6f', 'admin', '2021-03-03 21:38:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c058eb188c0748d7994d0f416c5a1621', 'user', '2021-03-09 23:43:36', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('c6a0e1127bf94e99b58c48672cbc20a7', 'user', '2021-03-07 18:38:40', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('c793d2de43e24a70aed7b32ac089cc5c', 'user', '2021-03-09 23:14:31', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('c85915f0907a4ffb950fefeaadec51e6', 'admin', '2021-03-03 22:18:54', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('ca39713642674d4fab183f0fd7d930d5', 'user', '2021-03-07 12:58:13', '会员注册');
INSERT INTO `sys_fhlog` VALUES ('cbcd139f779344f5b06a2eba617f2ff4', 'user', '2021-03-09 23:02:40', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('cc3b19bf6a0a4a7f8a46ab61b33fa496', '', '2021-03-03 23:15:13', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('d289b8cfcdbb444582011f588c2c76e8', '', '2021-03-03 23:15:08', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('d3122f667d624df987b9f95dd21ac49b', '', '2021-03-03 23:15:03', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('d618af8bb1a1441f8782f76885b5987c', 'admin', '2021-03-01 21:30:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d821b4db2e704c27862ef92aa9ab1d73', 'admin', '2021-03-03 23:49:56', '退出');
INSERT INTO `sys_fhlog` VALUES ('d922e47e175f4ae8948a2cdc1d728f5d', '', '2021-03-03 23:11:08', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('d94cec75c77d46cb8c4f64ba15d38c87', 'user', '2021-03-09 22:39:23', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('dc96bc0f20a64ca99b8f865117f05c01', 'admin', '2021-03-01 21:04:32', '退出');
INSERT INTO `sys_fhlog` VALUES ('dcf5d759a2ab4ac185007d2950034c87', '1', '2021-03-04 00:06:43', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('dd68eb3f4b1c4fe1a7ac07a1d3ea290f', 'testUser', '2021-03-07 12:41:33', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('ddfa016f16f3453a831917865da00859', '会员甲', '2021-03-07 13:06:33', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('de3df33f8025451484a1667ddfe52720', 'user', '2021-03-09 23:19:40', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('deb62983f7ec4e5b9b4ab95d96b2707d', 'admin', '2021-03-01 21:27:40', '退出');
INSERT INTO `sys_fhlog` VALUES ('e0bf0f9a255c41b997a688464cda9e0d', 'a1', '2021-03-07 12:53:23', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('e42bab28fdc4419bb5f9d62896575ac4', '', '2021-03-07 12:38:35', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('e557119a11fc4be48e0ef839127a592a', 'admin', '2021-03-02 21:51:34', '新增菜单抖音活动');
INSERT INTO `sys_fhlog` VALUES ('e8db16de60354827add97ea8820f2e64', 'user', '2021-03-09 23:24:43', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('eeb2d78f23b44ce2b177170ffa86083d', 'admin', '2021-03-03 21:47:09', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('ef7f2b1212ac40f3935d3bdfea12def9', 'admin', '2021-03-01 21:14:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f9750d32975e470ca6f7e113488a14fc', 'user', '2021-03-07 18:16:34', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('f9d991b3ecfd4c1d9ca79dcdf001daef', '2', '2021-03-01 21:28:44', '新注册');
INSERT INTO `sys_fhlog` VALUES ('fa110dc1a80c4572acc3a4e8ca153f86', 'user', '2021-03-07 19:03:16', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('fadc72d6a9f5426fa5c5578b25ce1949', '1', '2021-03-01 21:14:04', '退出');
INSERT INTO `sys_fhlog` VALUES ('fb67eb51d1f1478391fa5ac6508d2e8d', 'testUser', '2021-03-07 12:41:01', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('fcfea506c67f4ed6b179653fbed18e66', 'user', '2021-03-07 18:58:02', '登录会员系统');
INSERT INTO `sys_fhlog` VALUES ('ffe4386ed27e4de9b8ee166bc98b0055', 'admin', '2021-03-07 12:49:31', '登录系统');

-- ----------------------------
-- Table structure for sys_loginimg
-- ----------------------------
DROP TABLE IF EXISTS `sys_loginimg`;
CREATE TABLE `sys_loginimg`  (
  `LOGINIMG_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `FILEPATH` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `TYPE` int(2) NOT NULL COMMENT '状态',
  `FORDER` int(3) NOT NULL COMMENT '排序',
  PRIMARY KEY (`LOGINIMG_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_loginimg
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MENU_URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MENU_ORDER` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MENU_ICON` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MENU_TYPE` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `MENU_STATE` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', '#', '0', '1', 'menu-icon fa fa-desktop blue', '2', 1);
INSERT INTO `sys_menu` VALUES (2, '权限管理', '#', '1', '1', 'menu-icon fa fa-lock black', '1', 1);
INSERT INTO `sys_menu` VALUES (3, '日志管理', 'fhlog/list.do', '1', '6', 'menu-icon fa fa-book blue', '1', 1);
INSERT INTO `sys_menu` VALUES (6, '资源管理', '#', '0', '5', 'menu-icon fa fa-credit-card green', '2', 1);
INSERT INTO `sys_menu` VALUES (7, '图片管理', '#', '6', '1', 'menu-icon fa fa-folder-o pink', '2', 1);
INSERT INTO `sys_menu` VALUES (8, '性能监控', 'druid/index.html', '9', '8', 'menu-icon fa fa-tachometer red', '1', 1);
INSERT INTO `sys_menu` VALUES (9, '系统工具', '#', '0', '3', 'menu-icon fa fa-cog black', '2', 1);
INSERT INTO `sys_menu` VALUES (22, '一级菜单', '#', '0', '10', 'menu-icon fa fa-fire orange', '1', 1);
INSERT INTO `sys_menu` VALUES (23, '二级菜单', '#', '22', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (24, '三级菜单', '#', '23', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (30, '四级菜单', '#', '24', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (31, '五级菜单1', '#', '30', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (32, '五级菜单2', '#', '30', '2', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (33, '六级菜单', '#', '31', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (34, '六级菜单2', 'login_default.do', '31', '2', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (35, '四级菜单2', 'login_default.do', '24', '2', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (36, '角色(基础权限)', 'role.do', '2', '1', 'menu-icon fa fa-key orange', '1', 1);
INSERT INTO `sys_menu` VALUES (37, '按钮权限', 'buttonrights/list.do', '2', '2', 'menu-icon fa fa-key green', '1', 1);
INSERT INTO `sys_menu` VALUES (38, '菜单管理', 'menu/listAllMenu.do', '1', '3', 'menu-icon fa fa-folder-open-o brown', '1', 1);
INSERT INTO `sys_menu` VALUES (39, '按钮管理', 'fhbutton/list.do', '1', '2', 'menu-icon fa fa-download orange', '1', 1);
INSERT INTO `sys_menu` VALUES (40, '用户管理', '#', '0', '2', 'menu-icon fa fa-users blue', '2', 1);
INSERT INTO `sys_menu` VALUES (41, '系统用户', 'user/listUsers.do', '40', '1', 'menu-icon fa fa-users green', '1', 1);
INSERT INTO `sys_menu` VALUES (42, '会员管理', 'happuser/listUsers.do', '40', '2', 'menu-icon fa fa-users orange', '1', 1);
INSERT INTO `sys_menu` VALUES (43, '数据字典', 'dictionaries/listAllDict.do?DICTIONARIES_ID=0', '1', '4', 'menu-icon fa fa-book purple', '1', 1);
INSERT INTO `sys_menu` VALUES (44, '代码生成器', '#', '9', '0', 'menu-icon fa fa-cogs brown', '1', 1);
INSERT INTO `sys_menu` VALUES (45, '七级菜单1', '#', '33', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (46, '七级菜单2', '#', '33', '2', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (47, '八级菜单', 'login_default.do', '45', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (51, '图片列表', 'pictures/list.do', '7', '1', 'menu-icon fa fa-folder-open-o green', '1', 1);
INSERT INTO `sys_menu` VALUES (52, '图片爬虫', 'pictures/goImageCrawler.do', '7', '2', 'menu-icon fa fa-cloud-download green', '1', 1);
INSERT INTO `sys_menu` VALUES (53, '表单构建器', 'tool/goFormbuilder.do', '9', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (54, '数据库管理', '#', '0', '9', 'menu-icon fa fa-hdd-o blue', '2', 1);
INSERT INTO `sys_menu` VALUES (55, '数据库备份', 'brdb/listAllTable.do', '54', '1', 'menu-icon fa fa-cloud-upload blue', '1', 1);
INSERT INTO `sys_menu` VALUES (56, '数据库还原', 'brdb/list.do', '54', '3', 'menu-icon fa fa-cloud-download blue', '1', 1);
INSERT INTO `sys_menu` VALUES (57, '备份定时器', 'timingbackup/list.do', '54', '2', 'menu-icon fa fa-tachometer blue', '1', 1);
INSERT INTO `sys_menu` VALUES (58, 'SQL编辑器', 'sqledit/view.do', '54', '4', 'menu-icon fa fa-pencil-square-o blue', '1', 1);
INSERT INTO `sys_menu` VALUES (61, '反向生成', 'recreateCode/list.do', '44', '2', 'menu-icon fa fa-cogs blue', '1', 1);
INSERT INTO `sys_menu` VALUES (62, '正向生成', 'createCode/list.do', '44', '1', 'menu-icon fa fa-cogs green', '1', 1);
INSERT INTO `sys_menu` VALUES (67, '首页管理', '#', '0', '11', 'menu-icon fa fa-globe green', '2', 1);
INSERT INTO `sys_menu` VALUES (68, '网站信息', 'information/list.do', '67', '1', 'menu-icon fa fa-book blue', '1', 1);
INSERT INTO `sys_menu` VALUES (69, '轮播图片', 'image/list.do?TYPE=1', '67', '2', 'menu-icon fa fa-camera-retro green', '1', 1);
INSERT INTO `sys_menu` VALUES (70, '项目案例', 'image/list.do?TYPE=2', '67', '3', 'menu-icon fa fa-camera-retro blue', '1', 1);
INSERT INTO `sys_menu` VALUES (71, '合作伙伴', 'image/list.do?TYPE=3', '67', '4', 'menu-icon fa fa-camera-retro purple', '1', 1);
INSERT INTO `sys_menu` VALUES (72, '技术团队', 'image/list.do?TYPE=4', '67', '5', 'menu-icon fa fa-camera-retro orange', '1', 1);
INSERT INTO `sys_menu` VALUES (73, '业务说明', 'ourbusiness/list.do', '67', '1', 'menu-icon fa fa-book green', '1', 1);
INSERT INTO `sys_menu` VALUES (74, '公司理念', 'corporatephilosophy/list.do', '67', '1', 'menu-icon fa fa-book purple', '1', 1);
INSERT INTO `sys_menu` VALUES (75, '联系我们', 'contactus/list.do', '80', '5', 'menu-icon fa fa-home green', '1', 1);
INSERT INTO `sys_menu` VALUES (76, '访客留言', 'leavemsg/list.do', '80', '6', 'menu-icon fa fa-bookmark blue', '1', 1);
INSERT INTO `sys_menu` VALUES (77, '关于我们', 'aboutus/list.do', '80', '1', 'menu-icon fa fa-home purple', '1', 1);
INSERT INTO `sys_menu` VALUES (78, '合作共赢', 'cooperation/list.do', '80', '3', 'menu-icon fa fa-fire green', '1', 1);
INSERT INTO `sys_menu` VALUES (79, '产品案例', 'image/list.do?TYPE=5', '80', '2', 'menu-icon fa fa-camera-retro orange', '1', 1);
INSERT INTO `sys_menu` VALUES (80, '内容管理', '#', '0', '12', 'menu-icon fa fa-book blue', '2', 1);
INSERT INTO `sys_menu` VALUES (81, '新闻动态', 'news/list.do', '80', '4', 'menu-icon fa fa-pencil-square-o red', '1', 1);
INSERT INTO `sys_menu` VALUES (82, '模版管理', '#', '0', '13', 'menu-icon fa fa-folder-open orange', '2', 1);
INSERT INTO `sys_menu` VALUES (83, '模版一', '#', '82', '1', 'menu-icon fa fa-folder-open-o blue', '1', 1);
INSERT INTO `sys_menu` VALUES (84, '模版二', '#', '82', '2', 'menu-icon fa fa-folder-open-o green', '1', 1);
INSERT INTO `sys_menu` VALUES (85, '模版三', '#', '82', '3', 'menu-icon fa fa-folder-open-o purple', '1', 1);
INSERT INTO `sys_menu` VALUES (86, '首页', 'codeeditor/goEdit.do?type=createHtml&ftl=indexTemplate', '83', '1', 'menu-icon fa fa-folder red', '1', 1);
INSERT INTO `sys_menu` VALUES (87, '关于我们', 'codeeditor/goEdit.do?type=createHtml&ftl=aboutusTemplate', '83', '2', 'menu-icon fa fa-folder green', '1', 1);
INSERT INTO `sys_menu` VALUES (88, '产品案例', 'codeeditor/goEdit.do?type=createHtml&ftl=productTemplate', '83', '3', 'menu-icon fa fa-folder orange', '1', 1);
INSERT INTO `sys_menu` VALUES (89, '合作共赢', 'codeeditor/goEdit.do?type=createHtml&ftl=cooperationTemplate', '83', '4', 'menu-icon fa fa-folder purple', '1', 1);
INSERT INTO `sys_menu` VALUES (90, '新闻动态', 'codeeditor/goEdit.do?type=createHtml&ftl=newsTemplate', '83', '5', 'menu-icon fa fa-folder pink', '1', 1);
INSERT INTO `sys_menu` VALUES (91, '联系我们', 'codeeditor/goEdit.do?type=createHtml&ftl=contactusTemplate', '83', '7', 'menu-icon fa fa-folder grey', '1', 1);
INSERT INTO `sys_menu` VALUES (92, '新闻详情', 'codeeditor/goEdit.do?type=createHtml&ftl=newsdetailTemplate', '83', '6', 'menu-icon fa fa-folder blue', '1', 1);
INSERT INTO `sys_menu` VALUES (93, '页头', 'codeeditor/goEdit.do?type=createHtml&ftl=headerTemplate', '83', '8', 'menu-icon fa fa-folder brown', '1', 1);
INSERT INTO `sys_menu` VALUES (94, '页尾', 'codeeditor/goEdit.do?type=createHtml&ftl=footerTemplate', '83', '9', 'menu-icon fa fa-folder purple', '1', 1);
INSERT INTO `sys_menu` VALUES (95, '首页', 'codeeditor/goEdit.do?type=createHtml2&ftl=indexTemplate', '84', '1', 'menu-icon fa fa-folder red', '1', 1);
INSERT INTO `sys_menu` VALUES (96, '关于我们', 'codeeditor/goEdit.do?type=createHtml2&ftl=aboutusTemplate', '84', '2', 'menu-icon fa fa-folder green', '1', 1);
INSERT INTO `sys_menu` VALUES (97, '产品案例', 'codeeditor/goEdit.do?type=createHtml2&ftl=productTemplate', '84', '3', 'menu-icon fa fa-folder orange', '1', 1);
INSERT INTO `sys_menu` VALUES (98, '合作共赢', 'codeeditor/goEdit.do?type=createHtml2&ftl=cooperationTemplate', '84', '4', 'menu-icon fa fa-folder purple', '1', 1);
INSERT INTO `sys_menu` VALUES (99, '新闻动态', 'codeeditor/goEdit.do?type=createHtml2&ftl=newsTemplate', '84', '5', 'menu-icon fa fa-folder pink', '1', 1);
INSERT INTO `sys_menu` VALUES (100, '联系我们', 'codeeditor/goEdit.do?type=createHtml2&ftl=contactusTemplate', '84', '7', 'menu-icon fa fa-folder grey', '1', 1);
INSERT INTO `sys_menu` VALUES (101, '新闻详情', 'codeeditor/goEdit.do?type=createHtml2&ftl=newsdetailTemplate', '84', '6', 'menu-icon fa fa-folder blue', '1', 1);
INSERT INTO `sys_menu` VALUES (102, '页头', 'codeeditor/goEdit.do?type=createHtml2&ftl=headerTemplate', '84', '8', 'menu-icon fa fa-folder brown', '1', 1);
INSERT INTO `sys_menu` VALUES (103, '页尾', 'codeeditor/goEdit.do?type=createHtml2&ftl=footerTemplate', '84', '9', 'menu-icon fa fa-folder purple', '1', 1);
INSERT INTO `sys_menu` VALUES (104, '首页', 'codeeditor/goEdit.do?type=createHtml3&ftl=indexTemplate', '85', '1', 'menu-icon fa fa-folder red', '1', 1);
INSERT INTO `sys_menu` VALUES (105, '关于我们', 'codeeditor/goEdit.do?type=createHtml3&ftl=aboutusTemplate', '85', '2', 'menu-icon fa fa-folder green', '1', 1);
INSERT INTO `sys_menu` VALUES (106, '产品案例', 'codeeditor/goEdit.do?type=createHtml3&ftl=productTemplate', '85', '3', 'menu-icon fa fa-folder orange', '1', 1);
INSERT INTO `sys_menu` VALUES (107, '合作共赢', 'codeeditor/goEdit.do?type=createHtml3&ftl=cooperationTemplate', '85', '4', 'menu-icon fa fa-folder purple', '1', 1);
INSERT INTO `sys_menu` VALUES (108, '新闻动态', 'codeeditor/goEdit.do?type=createHtml3&ftl=newsTemplate', '85', '5', 'menu-icon fa fa-folder pink', '1', 1);
INSERT INTO `sys_menu` VALUES (109, '联系我们', 'codeeditor/goEdit.do?type=createHtml3&ftl=contactusTemplate', '85', '7', 'menu-icon fa fa-folder grey', '1', 1);
INSERT INTO `sys_menu` VALUES (110, '新闻详情', 'codeeditor/goEdit.do?type=createHtml3&ftl=newsdetailTemplate', '85', '6', 'menu-icon fa fa-folder blue', '1', 1);
INSERT INTO `sys_menu` VALUES (111, '页头', 'codeeditor/goEdit.do?type=createHtml3&ftl=headerTemplate', '85', '8', 'menu-icon fa fa-folder brown', '1', 1);
INSERT INTO `sys_menu` VALUES (112, '页尾', 'codeeditor/goEdit.do?type=createHtml3&ftl=footerTemplate', '85', '9', 'menu-icon fa fa-folder purple', '1', 1);
INSERT INTO `sys_menu` VALUES (113, '访问记录', 'statistics/grlist.do', '1', '7', 'menu-icon fa fa-globe orange', '1', 1);
INSERT INTO `sys_menu` VALUES (114, 'IP黑名单', 'blacklist/list.do', '1', '8', 'menu-icon fa fa-adjust black', '1', 1);
INSERT INTO `sys_menu` VALUES (115, '流量统计', 'chartsstatistics/pvcharts.do', '1', '9', 'menu-icon fa fa-bar-chart-o green', '1', 1);
INSERT INTO `sys_menu` VALUES (116, '模版四', '#', '82', '4', 'menu-icon fa fa-folder-open-o pink', '1', 1);
INSERT INTO `sys_menu` VALUES (117, '首页', 'codeeditor/goEdit.do?type=createHtml4&ftl=indexTemplate', '116', '1', 'menu-icon fa fa-folder red', '1', 1);
INSERT INTO `sys_menu` VALUES (118, '关于我们', 'codeeditor/goEdit.do?type=createHtml4&ftl=aboutusTemplate', '116', '2', 'menu-icon fa fa-folder green', '1', 1);
INSERT INTO `sys_menu` VALUES (119, '产品案例', 'codeeditor/goEdit.do?type=createHtml4&ftl=productTemplate', '116', '3', 'menu-icon fa fa-folder orange', '1', 1);
INSERT INTO `sys_menu` VALUES (120, '合作共赢', 'codeeditor/goEdit.do?type=createHtml4&ftl=cooperationTemplate', '116', '4', 'menu-icon fa fa-folder purple', '1', 1);
INSERT INTO `sys_menu` VALUES (121, '新闻动态', 'codeeditor/goEdit.do?type=createHtml4&ftl=newsTemplate', '116', '5', 'menu-icon fa fa-folder pink', '1', 1);
INSERT INTO `sys_menu` VALUES (122, '新闻详情', 'codeeditor/goEdit.do?type=createHtml4&ftl=newsdetailTemplate', '116', '6', 'menu-icon fa fa-folder blue', '1', 1);
INSERT INTO `sys_menu` VALUES (123, '联系我们', 'codeeditor/goEdit.do?type=createHtml4&ftl=contactusTemplate', '116', '7', 'menu-icon fa fa-folder grey', '1', 1);
INSERT INTO `sys_menu` VALUES (124, '页头', 'codeeditor/goEdit.do?type=createHtml4&ftl=headerTemplate', '116', '8', 'menu-icon fa fa-folder brown', '1', 1);
INSERT INTO `sys_menu` VALUES (125, '尾页', 'codeeditor/goEdit.do?type=createHtml4&ftl=footerTemplate', '116', '9', 'menu-icon fa fa-folder orange', '1', 1);
INSERT INTO `sys_menu` VALUES (126, '模版五', '#', '82', '5', 'menu-icon fa fa-folder-open-o orange', '1', 1);
INSERT INTO `sys_menu` VALUES (127, '首页', 'codeeditor/goEdit.do?type=createHtml5&ftl=indexTemplate', '126', '1', 'menu-icon fa fa-folder red', '1', 1);
INSERT INTO `sys_menu` VALUES (128, '关于我们', 'codeeditor/goEdit.do?type=createHtml5&ftl=aboutusTemplate', '126', '2', 'menu-icon fa fa-folder green', '1', 1);
INSERT INTO `sys_menu` VALUES (129, '产品案例', 'codeeditor/goEdit.do?type=createHtml5&ftl=productTemplate', '126', '3', 'menu-icon fa fa-folder orange', '1', 1);
INSERT INTO `sys_menu` VALUES (130, '合作共赢', 'codeeditor/goEdit.do?type=createHtml5&ftl=cooperationTemplate', '126', '4', 'menu-icon fa fa-folder purple', '1', 1);
INSERT INTO `sys_menu` VALUES (131, '新闻动态', 'codeeditor/goEdit.do?type=createHtml5&ftl=newsTemplate', '126', '5', 'menu-icon fa fa-folder pink', '1', 1);
INSERT INTO `sys_menu` VALUES (132, '新闻详情', 'codeeditor/goEdit.do?type=createHtml5&ftl=newsdetailTemplate', '126', '6', 'menu-icon fa fa-folder blue', '1', 1);
INSERT INTO `sys_menu` VALUES (133, '联系我们', 'codeeditor/goEdit.do?type=createHtml5&ftl=contactusTemplate', '126', '7', 'menu-icon fa fa-folder grey', '1', 1);
INSERT INTO `sys_menu` VALUES (134, '页头', 'codeeditor/goEdit.do?type=createHtml5&ftl=headerTemplate', '126', '8', 'menu-icon fa fa-folder brown', '1', 1);
INSERT INTO `sys_menu` VALUES (135, '页尾', 'codeeditor/goEdit.do?type=createHtml5&ftl=footerTemplate', '126', '9', 'menu-icon fa fa-folder black', '1', 1);
INSERT INTO `sys_menu` VALUES (136, '模版六', '#', '82', '6', 'menu-icon fa fa-folder-open-o blue', '1', 1);
INSERT INTO `sys_menu` VALUES (137, '单页', 'codeeditor/goEdit.do?type=createHtml6&ftl=indexTemplate', '136', '1', 'menu-icon fa fa-folder green', '1', 1);
INSERT INTO `sys_menu` VALUES (138, '模版七', '#', '82', '7', 'menu-icon fa fa-folder-open-o black', '1', 1);
INSERT INTO `sys_menu` VALUES (139, '模版八', '#', '82', '8', 'menu-icon fa fa-folder-open-o brown', '1', 1);
INSERT INTO `sys_menu` VALUES (140, '单页', 'codeeditor/goEdit.do?type=createHtml7&ftl=indexTemplate', '138', '1', 'menu-icon fa fa-folder blue', '1', 1);
INSERT INTO `sys_menu` VALUES (141, '单页', 'codeeditor/goEdit.do?type=createHtml8&ftl=indexTemplate', '139', '1', 'menu-icon fa fa-folder purple', '1', 1);
INSERT INTO `sys_menu` VALUES (142, '抖音活动', '#', '0', '10', 'menu-icon fa fa-leaf black', '2', 1);
INSERT INTO `sys_menu` VALUES (143, '模板管理', 'template/list.do', '142', '1', 'menu-icon fa fa-leaf black', '1', 1);
INSERT INTO `sys_menu` VALUES (144, '视频管理', 'video/list.do', '142', '2', 'menu-icon fa fa-leaf black', '1', 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `ROLE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ROLE_NAME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RIGHTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PARENT_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ADD_QX` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DEL_QX` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EDIT_QX` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CHA_QX` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理组', '44601490397061246283071296463363587398697934', '0', '1', '1', '1', '1');
INSERT INTO `sys_role` VALUES ('115b386ff04f4352b060dffcd2b5d1da', '中级会员', '', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('1b67fc82ce89457a8347ae53e43a347e', '初级会员', '', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('2', '会员组', '', '0', '0', '0', '0', '1');
INSERT INTO `sys_role` VALUES ('3', '注册用户', '', '1', '', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('3264c8e83d0248bb9e3ea6195b4c0216', '一级管理员', '147573389638682795998', '1', '36892925196425486294', '36892925196425486294', '36892925196425486294', '36892925196425486294');
INSERT INTO `sys_role` VALUES ('46294b31a71c4600801724a6eb06bb26', '职位组', '', '0', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('5466347ac07044cb8d82990ec7f3a90e', '主管', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('68f8e4a39efe47c7bb869e9d15ab925d', '二级管理员', '73786413343844589510', '1', '0', '0', '2251798773489606', '0');
INSERT INTO `sys_role` VALUES ('856849f422774ad390a4e564054d8cc8', '经理', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('8b70a7e67f2841e7aaba8a4d92e5ff6f', '高级会员', '', '2', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('c21cecf84048434b93383182b1d98cba', '组长', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('d449195cd8e7491080688c58e11452eb', '总监', '', '46294b31a71c4600801724a6eb06bb26', '0', '0', '0', '0');
INSERT INTO `sys_role` VALUES ('de9de2f006e145a29d52dfadda295353', '三级管理员', '73786413343844589510', '1', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for sys_role_fhbutton
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_fhbutton`;
CREATE TABLE `sys_role_fhbutton`  (
  `RB_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ROLE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BUTTON_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`RB_ID`) USING BTREE,
  INDEX `角色表外键`(`ROLE_ID`) USING BTREE,
  INDEX `fbutton`(`BUTTON_ID`) USING BTREE,
  CONSTRAINT `sys_role_fhbutton_ibfk_1` FOREIGN KEY (`BUTTON_ID`) REFERENCES `sys_fhbutton` (`FHBUTTON_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sys_role_fhbutton_ibfk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ROLE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_fhbutton
-- ----------------------------
INSERT INTO `sys_role_fhbutton` VALUES ('1743733f366240c693c4295b527d1b0e', 'de9de2f006e145a29d52dfadda295353', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('469ffb4848ad49c389867d99560a4698', 'de9de2f006e145a29d52dfadda295353', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `sys_role_fhbutton` VALUES ('4ee1e2bc03a64ef1bc578fcf2e2ea2c1', '68f8e4a39efe47c7bb869e9d15ab925d', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('5669c8754b4d4e368365ed5065f9fc10', '3264c8e83d0248bb9e3ea6195b4c0216', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('74203935bfa34ce3b9b80e81f2a2bcfe', '68f8e4a39efe47c7bb869e9d15ab925d', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('81d31bc5bf02490a85ce496b6755ef26', '3', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `sys_role_fhbutton` VALUES ('8231c216fb514b4188e4162e629c6237', '3264c8e83d0248bb9e3ea6195b4c0216', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('88f66a65ee1642bea7979e0e1050ac5f', '3', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('8e478e8615ee455e95671ba05a29e457', 'de9de2f006e145a29d52dfadda295353', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('d80abc961d594f75b65e90d5b7437aa9', '3', 'cc51b694d5344d28a9aa13c84b7166cd');
INSERT INTO `sys_role_fhbutton` VALUES ('f0329033d0914faf8ea6e9ff252cc5e6', '68f8e4a39efe47c7bb869e9d15ab925d', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `sys_role_fhbutton` VALUES ('f627982cc9d4479dbc03af726dc6ac58', 'de9de2f006e145a29d52dfadda295353', 'cc51b694d5344d28a9aa13c84b7166cd');
INSERT INTO `sys_role_fhbutton` VALUES ('f919c1f620634bdaa353a9f63194a2e0', '3', '3542adfbda73410c976e185ffe50ad06');

-- ----------------------------
-- Table structure for sys_statistics
-- ----------------------------
DROP TABLE IF EXISTS `sys_statistics`;
CREATE TABLE `sys_statistics`  (
  `STATISTICS_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `IP` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP',
  `AREA` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区',
  `OPERATOR` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '运营商',
  `CDATE` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日期',
  `CTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时间',
  `REGION` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`STATISTICS_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_statistics
-- ----------------------------
INSERT INTO `sys_statistics` VALUES ('0054d25066c544a2b5f14721340665ef', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:36:55', 'XX');
INSERT INTO `sys_statistics` VALUES ('006252dd7d8d404fbf66a28733987b47', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:17:29', 'XX');
INSERT INTO `sys_statistics` VALUES ('0184651ebf1c466f989154bfb4476df5', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:36:52', 'XX');
INSERT INTO `sys_statistics` VALUES ('01a19ec06f8d4da982cd0a3ec553b94e', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-29', '2018-12-29 02:54:50', 'XX');
INSERT INTO `sys_statistics` VALUES ('023a010fdb2e4385bd1cb67af11f9bd3', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:12:02', 'XX');
INSERT INTO `sys_statistics` VALUES ('0296e5c6144e444ab4286d307be62bfb', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-29', '2018-12-29 02:13:35', 'XX');
INSERT INTO `sys_statistics` VALUES ('02c05280f59b48fc9829991ac56e7a2a', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-16', '2018-10-16 14:38:27', 'XX');
INSERT INTO `sys_statistics` VALUES ('02c0e5bfab754e0a8a9cc0f0f1828223', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:38:00', 'XX');
INSERT INTO `sys_statistics` VALUES ('02e03d252ab0447dabeb75898978c1a7', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:20:31', 'XX');
INSERT INTO `sys_statistics` VALUES ('02e5f3d172234a42b57eb2b57ba9753f', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:23:13', 'XX');
INSERT INTO `sys_statistics` VALUES ('032057dc5a4b4dd2802cbcdee8b335d1', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-04', '2019-01-04 02:57:02', 'XX');
INSERT INTO `sys_statistics` VALUES ('037a1603dd7f4b9eb7e2fa0b02b64275', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:41:06', 'XX');
INSERT INTO `sys_statistics` VALUES ('03b10732c39546f397c5b3dc708c401e', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:14:43', 'XX');
INSERT INTO `sys_statistics` VALUES ('04151c1f697543b2ac92417ee7a4c6d5', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-20', '2018-10-20 12:25:13', 'XX');
INSERT INTO `sys_statistics` VALUES ('042ae729f7a64753b27af986ae2d4620', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 14:57:43', 'XX');
INSERT INTO `sys_statistics` VALUES ('04ee3b44ada2416aa34f1da68308fe9b', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:38:22', 'XX');
INSERT INTO `sys_statistics` VALUES ('0601ebe448fb4f809394395917592370', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-20', '2018-10-20 19:14:22', 'XX');
INSERT INTO `sys_statistics` VALUES ('0627e322218749b988f9c1e36ab581d9', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-04', '2019-01-04 00:52:05', 'XX');
INSERT INTO `sys_statistics` VALUES ('065bdf16069e4c28bc5d66fcf7875919', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-04', '2019-01-04 03:05:35', 'XX');
INSERT INTO `sys_statistics` VALUES ('07e205570b8d483ea24969a75d56d7d2', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:14:05', 'XX');
INSERT INTO `sys_statistics` VALUES ('07e82cab6107426fbcea685caec14975', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:03:32', 'XX');
INSERT INTO `sys_statistics` VALUES ('089e388a1d8e42c8b99d28aed1965471', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:17:11', 'XX');
INSERT INTO `sys_statistics` VALUES ('0a367a1f47d648f0aa7497adc22fb4a9', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:37:34', 'XX');
INSERT INTO `sys_statistics` VALUES ('0aa94349a8d34c8c873c8c78e82a54cb', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:26:24', 'XX');
INSERT INTO `sys_statistics` VALUES ('0b233b9097ef4e5981a58cfbe592a0dc', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:16:43', 'XX');
INSERT INTO `sys_statistics` VALUES ('0d6cf85f293048e9b7790d46c85a3ca5', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:16:51', 'XX');
INSERT INTO `sys_statistics` VALUES ('0e90c5b3654b4f44b47e3ec1e4a4116b', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:14:15', 'XX');
INSERT INTO `sys_statistics` VALUES ('11f7ee0675164cd499dd6344dfd612e5', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-03', '2019-01-03 02:33:40', 'XX');
INSERT INTO `sys_statistics` VALUES ('125744346aed41edb89e3cc2833c7207', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:15:05', 'XX');
INSERT INTO `sys_statistics` VALUES ('1266f685dc8041f8b5a4d03b68fd7a50', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:41:04', 'XX');
INSERT INTO `sys_statistics` VALUES ('12b127b781fb42f39fced1b06fd32104', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-16', '2018-10-16 14:38:31', 'XX');
INSERT INTO `sys_statistics` VALUES ('12c50b926982482693ec153f2299b688', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:17:43', 'XX');
INSERT INTO `sys_statistics` VALUES ('1360d0b80df04b2a9443975439adb5ca', '192.168.0.8', 'XX  XX 内网IP', '内网IP', '2019-01-03', '2019-01-03 01:35:07', 'XX');
INSERT INTO `sys_statistics` VALUES ('14152beb687f4e84a3143a20faa9f64b', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-02', '2019-01-02 03:19:37', 'XX');
INSERT INTO `sys_statistics` VALUES ('15e1658bfa834619a1fe9725157869fe', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:14:38', 'XX');
INSERT INTO `sys_statistics` VALUES ('18b9aa44201140728f8e17933746f427', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:23:27', 'XX');
INSERT INTO `sys_statistics` VALUES ('198aa0ba263348cca01065a75b9d41f8', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:14:34', 'XX');
INSERT INTO `sys_statistics` VALUES ('19ae64a66995412f906b16e7054f814b', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 14:57:37', 'XX');
INSERT INTO `sys_statistics` VALUES ('1a38dfb277a64b3ea75080aca1731aba', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:23:10', 'XX');
INSERT INTO `sys_statistics` VALUES ('1b46bb3611bb43d29ef91c0bfd771578', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 10:48:48', 'XX');
INSERT INTO `sys_statistics` VALUES ('1b5ac395d9014b9ba98db28c703e30da', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:17:37', 'XX');
INSERT INTO `sys_statistics` VALUES ('1b67ff137b744e0bb42bf44a7107976c', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:12:35', 'XX');
INSERT INTO `sys_statistics` VALUES ('1c0c4b49c69d4c548c3eaf64c79bafd0', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:11:43', 'XX');
INSERT INTO `sys_statistics` VALUES ('1e2d4b834d30477aa5e4af300cefe951', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:17:39', 'XX');
INSERT INTO `sys_statistics` VALUES ('1f2b226a098945c28cfb523a59e68c6e', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-16', '2018-10-16 14:56:13', 'XX');
INSERT INTO `sys_statistics` VALUES ('200e3c9068d04681b828e46637d84fef', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:26:26', 'XX');
INSERT INTO `sys_statistics` VALUES ('20804ab7a7e544e8aaf30ae134e289ee', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:13:37', 'XX');
INSERT INTO `sys_statistics` VALUES ('21a86efb546c4c68b722afb03bb902fb', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-29', '2018-12-29 02:13:03', 'XX');
INSERT INTO `sys_statistics` VALUES ('21abc367140b4fcf980c9c737f0d2a42', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-20', '2018-10-20 19:10:49', 'XX');
INSERT INTO `sys_statistics` VALUES ('22b3c5e2fea044dd8bafd6ac437c6354', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-16', '2018-10-16 14:54:38', 'XX');
INSERT INTO `sys_statistics` VALUES ('249872d30bee49eb88271cba66e4ba33', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-02', '2019-01-02 03:19:52', 'XX');
INSERT INTO `sys_statistics` VALUES ('24ac8b1700574a019721c78d29c26556', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:56:07', 'XX');
INSERT INTO `sys_statistics` VALUES ('263be02ea8c54e928cc14a9b5d801e63', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-20', '2018-10-20 14:09:59', 'XX');
INSERT INTO `sys_statistics` VALUES ('27953132a65147f69e1e5b4c1264add0', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:37:23', 'XX');
INSERT INTO `sys_statistics` VALUES ('28beba48a4ce4175bda5ec42cd452337', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 10:46:56', 'XX');
INSERT INTO `sys_statistics` VALUES ('28f653400a0643f097b334c3ec0f5d43', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-20', '2018-10-20 19:14:21', 'XX');
INSERT INTO `sys_statistics` VALUES ('29ae0c71b889423cb1a00a663b1757e0', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:17:17', 'XX');
INSERT INTO `sys_statistics` VALUES ('2a1f27ee19d54848b7216c59b3d57988', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:37:47', 'XX');
INSERT INTO `sys_statistics` VALUES ('2aa299034ddc43e9a96d6c06da759ce4', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:22:00', 'XX');
INSERT INTO `sys_statistics` VALUES ('2ac07eeb51f64d2c9cb4a4bbc9ef1f3a', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:40:44', 'XX');
INSERT INTO `sys_statistics` VALUES ('2d1c96506ef0407eb194b0c1b81d983d', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:27:50', 'XX');
INSERT INTO `sys_statistics` VALUES ('2d1ddc9c461845bab7d7a75bff6a9ad6', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:14:13', 'XX');
INSERT INTO `sys_statistics` VALUES ('2d3a66edd05b4782a1b62459a0fdff9d', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:16:40', 'XX');
INSERT INTO `sys_statistics` VALUES ('2e738dc3f89d46a49b23cbe8112e15d3', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:24:51', 'XX');
INSERT INTO `sys_statistics` VALUES ('2f298f6920d94d7a838054cd1e08aa9e', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-29', '2018-12-29 02:13:38', 'XX');
INSERT INTO `sys_statistics` VALUES ('2fb9bc205b9149608c79c71d36a69025', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:38:17', 'XX');
INSERT INTO `sys_statistics` VALUES ('305b35a18c464dbbac3c4f5dfbb1c1af', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-03', '2019-01-03 01:41:20', 'XX');
INSERT INTO `sys_statistics` VALUES ('3079a1d9f7d94a528b4fd04ea4f880c1', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-04', '2019-01-04 03:06:12', 'XX');
INSERT INTO `sys_statistics` VALUES ('30a2d9c9bd8745f398aefb081f45e0ca', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:17:11', 'XX');
INSERT INTO `sys_statistics` VALUES ('31d890cce50f4392a7cf1655da8038d6', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-04', '2019-01-04 03:31:13', 'XX');
INSERT INTO `sys_statistics` VALUES ('328727ab922d4dba847919f826a63ec2', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:14:51', 'XX');
INSERT INTO `sys_statistics` VALUES ('32dc266377864c63993e3e002d6fa8ba', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:12:22', 'XX');
INSERT INTO `sys_statistics` VALUES ('332df0d9970546e2b430ab3cbab1256a', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 14:57:36', 'XX');
INSERT INTO `sys_statistics` VALUES ('352d216f9f9740a09a41748d77f61efc', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:17:06', 'XX');
INSERT INTO `sys_statistics` VALUES ('35417d4d972d4848b5a5c31f354746ef', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:13:46', 'XX');
INSERT INTO `sys_statistics` VALUES ('3671b2bc35234cf985a843d31a98f616', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:20:51', 'XX');
INSERT INTO `sys_statistics` VALUES ('36f910f9c8c84e689bce5df3026d45fd', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:12:49', 'XX');
INSERT INTO `sys_statistics` VALUES ('3887811ea4c64e0ca4ac81df4caf73f6', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:13:29', 'XX');
INSERT INTO `sys_statistics` VALUES ('38d9649a70e646ecb4efcac7daa223cb', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-16', '2018-10-16 14:38:16', 'XX');
INSERT INTO `sys_statistics` VALUES ('39b452c9aa5a460aa914e3300fd4ee08', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:37:07', 'XX');
INSERT INTO `sys_statistics` VALUES ('3c3698aa2188465abb2c37d6abf86580', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:44:14', 'XX');
INSERT INTO `sys_statistics` VALUES ('3c378de7546c4a47bbc4a19550b5ad2a', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:24:39', 'XX');
INSERT INTO `sys_statistics` VALUES ('3d1b875144fc4ef981c4809744c8622f', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:04:53', 'XX');
INSERT INTO `sys_statistics` VALUES ('3d95df26eba146aab8c454a8e2411809', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-04', '2019-01-04 03:16:03', 'XX');
INSERT INTO `sys_statistics` VALUES ('40a8e6094c40474aaa7dc13e7a7ca659', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:13:45', 'XX');
INSERT INTO `sys_statistics` VALUES ('438aad701bb34a58b57fc00764148260', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-16', '2018-10-16 14:53:55', 'XX');
INSERT INTO `sys_statistics` VALUES ('4449a9db59d0478a993630254ab34925', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-02', '2019-01-02 03:22:51', 'XX');
INSERT INTO `sys_statistics` VALUES ('4569dc2581ff44039e532ed55f70e94d', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:17:59', 'XX');
INSERT INTO `sys_statistics` VALUES ('46725bbe8c9b4d37aca33d08b3c7e349', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:15:29', 'XX');
INSERT INTO `sys_statistics` VALUES ('46d0a62d8e9f431ca5bd43e5b25ca26a', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 14:58:54', 'XX');
INSERT INTO `sys_statistics` VALUES ('48e863f203bc414a9019a116961c7727', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:14:32', 'XX');
INSERT INTO `sys_statistics` VALUES ('49ef64097a9a489d97dae6a926ea4d7f', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-04', '2019-01-04 03:30:05', 'XX');
INSERT INTO `sys_statistics` VALUES ('4a833c11d8d54cbdadb7e477ce776bb2', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:37:14', 'XX');
INSERT INTO `sys_statistics` VALUES ('4afe955bf36d4ba2ba36673f5a94f8cc', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:30:11', 'XX');
INSERT INTO `sys_statistics` VALUES ('4b1986fe27424ba292d59f0924e1caab', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:35:57', 'XX');
INSERT INTO `sys_statistics` VALUES ('4b5acc33a82847f88469c87b39784c2b', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:23:22', 'XX');
INSERT INTO `sys_statistics` VALUES ('4b71385e9a1f47bbaa2a1c25da31226b', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:23:39', 'XX');
INSERT INTO `sys_statistics` VALUES ('4bb53ebc75a44feb9fc8eaac0e6032f7', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:20:58', 'XX');
INSERT INTO `sys_statistics` VALUES ('4bbbbc2108604de0ab9a1123e22b8534', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:17:21', 'XX');
INSERT INTO `sys_statistics` VALUES ('4d29fde4f3ba4583ba0542f29059bc42', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-04', '2019-01-04 04:17:23', 'XX');
INSERT INTO `sys_statistics` VALUES ('4dbf10110f774100b5b4201b8f2dba7b', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:21:35', 'XX');
INSERT INTO `sys_statistics` VALUES ('4e02e195ca3047eb9e6ea8986a3fedfb', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:23:18', 'XX');
INSERT INTO `sys_statistics` VALUES ('4fb60a6a110140999b90ccbcfc9ea799', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:12:38', 'XX');
INSERT INTO `sys_statistics` VALUES ('50ef033bf68b4330b60fff0d6fcce1ed', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:23:14', 'XX');
INSERT INTO `sys_statistics` VALUES ('510cd96f6b4b4892bccf25dd8e7736d8', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:14:56', 'XX');
INSERT INTO `sys_statistics` VALUES ('514e216b6aa2415cb559925b1f2ca9b0', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:12:56', 'XX');
INSERT INTO `sys_statistics` VALUES ('5161fda7db644a3ea008d8423ff54c31', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-04', '2019-01-04 02:49:22', 'XX');
INSERT INTO `sys_statistics` VALUES ('519ea0431cf04410bb2ab741ff323052', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:24:45', 'XX');
INSERT INTO `sys_statistics` VALUES ('51a1fccb885a4809857785f98b9eea30', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-20', '2018-10-20 19:14:07', 'XX');
INSERT INTO `sys_statistics` VALUES ('51e076460c8342e19fdbacf68355e912', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:24:31', 'XX');
INSERT INTO `sys_statistics` VALUES ('541403946bc247cbb8120c04ba579500', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:26:17', 'XX');
INSERT INTO `sys_statistics` VALUES ('5700a5dee0a0426680f305370f9fd2ca', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:12:14', 'XX');
INSERT INTO `sys_statistics` VALUES ('57bb6608c7514283bf630f1dd133efdc', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:13:35', 'XX');
INSERT INTO `sys_statistics` VALUES ('584946f0ba6d4c99a6a834830ecd697b', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:17:18', 'XX');
INSERT INTO `sys_statistics` VALUES ('5891552d12da4c9e8508e9eb95c073f8', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-04', '2019-01-04 00:48:25', 'XX');
INSERT INTO `sys_statistics` VALUES ('59c6bee5a17641f2a24cfe9e43541ee4', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:13:14', 'XX');
INSERT INTO `sys_statistics` VALUES ('5a993acd001c4cc69a09b31b5cefa65a', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:21:36', 'XX');
INSERT INTO `sys_statistics` VALUES ('5b938ea0096c462aa2989dc625650ff8', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 14:58:28', 'XX');
INSERT INTO `sys_statistics` VALUES ('5baaec67958f4c03b8848498b4bcca94', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-04', '2019-01-04 03:23:04', 'XX');
INSERT INTO `sys_statistics` VALUES ('5bfdaf915ebb4543aa1e880742085eef', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:13:50', 'XX');
INSERT INTO `sys_statistics` VALUES ('5ddf6cdeecbd4eec9d349a6cb35ba6b1', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-16', '2018-10-16 14:56:11', 'XX');
INSERT INTO `sys_statistics` VALUES ('5e44056dac58490aa405c1cf09d03cc9', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-20', '2018-10-20 12:31:18', 'XX');
INSERT INTO `sys_statistics` VALUES ('5e5bdd997f864305838095c127a0170f', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:13:29', 'XX');
INSERT INTO `sys_statistics` VALUES ('5f353352fa4446fbb5ceb38b8b1e72b8', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:01:14', 'XX');
INSERT INTO `sys_statistics` VALUES ('5f5c976ea5e246efa191755fcabd358e', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:23:59', 'XX');
INSERT INTO `sys_statistics` VALUES ('60ccac03e80c4220b605948c65a754af', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-02', '2019-01-02 03:19:55', 'XX');
INSERT INTO `sys_statistics` VALUES ('61dc4097d4a94a9ab2b1aea093d4eb62', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:32:46', 'XX');
INSERT INTO `sys_statistics` VALUES ('62153a8534a94ae4933a034b7da6a21f', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-04', '2019-01-04 03:59:47', 'XX');
INSERT INTO `sys_statistics` VALUES ('62701c3d43a14036ab6fc8b25859b97a', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-20', '2018-10-20 19:11:59', 'XX');
INSERT INTO `sys_statistics` VALUES ('62a2d6f9911d4882b5b88b03dd5d4c23', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-29', '2018-12-29 02:12:44', 'XX');
INSERT INTO `sys_statistics` VALUES ('6313c16e4e644e20aeb7b659d3336c39', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:21:55', 'XX');
INSERT INTO `sys_statistics` VALUES ('6636a41d2cd744d2b871b24b830bd317', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:38:04', 'XX');
INSERT INTO `sys_statistics` VALUES ('6660831d94c749178b734ffb253f9a27', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:16:55', 'XX');
INSERT INTO `sys_statistics` VALUES ('67febc7e16784a62acc18fe20bffad54', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:39:00', 'XX');
INSERT INTO `sys_statistics` VALUES ('6968d56817794aa58b276226b69251d6', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:36:19', 'XX');
INSERT INTO `sys_statistics` VALUES ('6b6ddeb26cbd4bf5abd544a197a2ae10', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-02', '2019-01-02 02:49:23', 'XX');
INSERT INTO `sys_statistics` VALUES ('6c2934edf88d41d9be74501eb91539ba', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-16', '2018-10-16 14:55:09', 'XX');
INSERT INTO `sys_statistics` VALUES ('6f0b73f959ad4500b0ce3f128658be65', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:15:04', 'XX');
INSERT INTO `sys_statistics` VALUES ('707963adf2b74efa91a0f69ec5f72ff5', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-29', '2018-12-29 02:27:09', 'XX');
INSERT INTO `sys_statistics` VALUES ('709d6b98a1bb421da38eb4444eaa27cf', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:36:27', 'XX');
INSERT INTO `sys_statistics` VALUES ('7159d01fddd64cd58ffe0e3a49005574', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:13:33', 'XX');
INSERT INTO `sys_statistics` VALUES ('717447cab1a6452f94b9cdbe15c1cc93', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:12:15', 'XX');
INSERT INTO `sys_statistics` VALUES ('72bcab259e3943df914525df3e77136d', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:13:49', 'XX');
INSERT INTO `sys_statistics` VALUES ('730171224f0c4fe3ba93011ed88258e1', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-02', '2019-01-02 03:03:59', 'XX');
INSERT INTO `sys_statistics` VALUES ('7343aebbbb51471492b30617e55f8c1f', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-20', '2018-10-20 14:09:16', 'XX');
INSERT INTO `sys_statistics` VALUES ('7440e8bc68154adbb9566d4d66384418', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-04', '2019-01-04 02:52:41', 'XX');
INSERT INTO `sys_statistics` VALUES ('783da5a0ef6148e6bbd2e42602e4c051', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:38:31', 'XX');
INSERT INTO `sys_statistics` VALUES ('78994c4c82f942cb9735de683bb0272c', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-16', '2018-10-16 14:56:19', 'XX');
INSERT INTO `sys_statistics` VALUES ('789af6922a69443884dde0c2e9e15813', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:40:34', 'XX');
INSERT INTO `sys_statistics` VALUES ('78f95f070ce24714984a06f25d94bb86', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:41:01', 'XX');
INSERT INTO `sys_statistics` VALUES ('799c6b72147d4d4082665378818f6495', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-16', '2018-10-16 14:56:17', 'XX');
INSERT INTO `sys_statistics` VALUES ('7a59401783d245229cd70685ead9d620', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:13:08', 'XX');
INSERT INTO `sys_statistics` VALUES ('7b68f3de9a8747d4a2aacf550004c461', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-16', '2018-10-16 14:54:45', 'XX');
INSERT INTO `sys_statistics` VALUES ('7c61c04d0da44586936949f585da5d77', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:13:07', 'XX');
INSERT INTO `sys_statistics` VALUES ('7ca94b57840c45a39104d5b5bcd17332', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:22:01', 'XX');
INSERT INTO `sys_statistics` VALUES ('7dda8f9bf40d438e92f011d9c47cb9e3', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:16:41', 'XX');
INSERT INTO `sys_statistics` VALUES ('7e0ea02712e14db78c982d3dc3dff678', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-04', '2019-01-04 03:08:50', 'XX');
INSERT INTO `sys_statistics` VALUES ('7e5c41ec3e604053a8ef04796b256235', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:14:59', 'XX');
INSERT INTO `sys_statistics` VALUES ('7ee947294be540bebbe288ae65aa3348', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:11:53', 'XX');
INSERT INTO `sys_statistics` VALUES ('7f0a001cfb4f4bcfbf17fb68654ddec8', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:17:09', 'XX');
INSERT INTO `sys_statistics` VALUES ('7f85356f094d44a18968f70d9599c1f5', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:41:08', 'XX');
INSERT INTO `sys_statistics` VALUES ('7fdb8cbc0d504edfba69e2c94127651b', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:36:23', 'XX');
INSERT INTO `sys_statistics` VALUES ('804a32102ade43b08eaf6a8e6ac8263f', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:21:39', 'XX');
INSERT INTO `sys_statistics` VALUES ('81f809692b9445738bd369c8b8cc1ab8', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:23:16', 'XX');
INSERT INTO `sys_statistics` VALUES ('82927a654a7f4caa96b19d9d739fd4f7', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:37:58', 'XX');
INSERT INTO `sys_statistics` VALUES ('842e0e196ad745d2a416cc6989a48516', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:23:34', 'XX');
INSERT INTO `sys_statistics` VALUES ('84d64bd113d04f34baa3d1bdc71843c3', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 14:57:35', 'XX');
INSERT INTO `sys_statistics` VALUES ('84ee1a28f00e4fd2adf3ff6a87eb124d', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-20', '2018-10-20 12:26:10', 'XX');
INSERT INTO `sys_statistics` VALUES ('851908dada8544f4bdff4ae3e264c284', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:21:38', 'XX');
INSERT INTO `sys_statistics` VALUES ('861768e26a1f45018159a57ec5ab7ae4', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:38:04', 'XX');
INSERT INTO `sys_statistics` VALUES ('8645f94445024253a8b404ab1da004d0', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 10:48:49', 'XX');
INSERT INTO `sys_statistics` VALUES ('8746ae33448c478b9d62827b87144979', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:14:45', 'XX');
INSERT INTO `sys_statistics` VALUES ('87b28c3907e0481ab3ced6ca9dbbc7b1', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:23:31', 'XX');
INSERT INTO `sys_statistics` VALUES ('88bd4e6236154156a2a3556c70956f06', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:41:07', 'XX');
INSERT INTO `sys_statistics` VALUES ('88f7f80613f64d92b956a1ef0c964d44', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:37:56', 'XX');
INSERT INTO `sys_statistics` VALUES ('899158131ea04d119342becf388ec075', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-04', '2019-01-04 04:11:10', 'XX');
INSERT INTO `sys_statistics` VALUES ('8a03d6c72c8f42f9a8e8f0e01ac436da', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:16:26', 'XX');
INSERT INTO `sys_statistics` VALUES ('8a6a316e79a743d8b9a6c4bc13be832e', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-17', '2018-10-17 08:44:16', 'XX');
INSERT INTO `sys_statistics` VALUES ('8b8223b6e9b24c86914a81763c607ff6', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:17:36', 'XX');
INSERT INTO `sys_statistics` VALUES ('8cf72a68b3674e23bb5e40f2491e4877', '117.154.89.235', '中国  湖北 武汉', '移动', '2021-03-03', '2021-03-03 23:52:33', '湖北');
INSERT INTO `sys_statistics` VALUES ('8d696ba922a9440aae6d3bf83ae1ed3b', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-04', '2019-01-04 03:30:51', 'XX');
INSERT INTO `sys_statistics` VALUES ('8d70bf5643844631af95231c12b4490c', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-29', '2018-12-29 02:27:27', 'XX');
INSERT INTO `sys_statistics` VALUES ('8db8f6b4c87a4437aadfe8a3a4d959cb', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-16', '2018-10-16 14:53:58', 'XX');
INSERT INTO `sys_statistics` VALUES ('8e5da8c0918a46c7bd2576d318ae78df', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:31:56', 'XX');
INSERT INTO `sys_statistics` VALUES ('9454da4e8bfa4aa88bb5b8b77607973d', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:38:12', 'XX');
INSERT INTO `sys_statistics` VALUES ('9529c08be4de4ae38bea884951d4d9b1', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-02', '2019-01-02 03:03:24', 'XX');
INSERT INTO `sys_statistics` VALUES ('96046c59cf264746a84aca6a3e00a85a', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 14:54:15', 'XX');
INSERT INTO `sys_statistics` VALUES ('96bf38fd17ea40ad96b48957973e02cd', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:40:46', 'XX');
INSERT INTO `sys_statistics` VALUES ('989caf5d0ffa478bae454d921bd0abe2', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:11:57', 'XX');
INSERT INTO `sys_statistics` VALUES ('9ae66ed376534d3dbf5ed186fc704a03', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:38:50', 'XX');
INSERT INTO `sys_statistics` VALUES ('9b2efed61c1047f6bf0f117d29603eba', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-02', '2019-01-02 02:21:53', 'XX');
INSERT INTO `sys_statistics` VALUES ('9c7fa6a29f6a469faee14af97914dde0', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-16', '2018-10-16 14:54:43', 'XX');
INSERT INTO `sys_statistics` VALUES ('9d75a5b241ea4057bcf91376f83f4b54', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-20', '2018-10-20 19:11:22', 'XX');
INSERT INTO `sys_statistics` VALUES ('9e48fe46f9424a12ad5ec5b3d77535f9', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-29', '2018-12-29 02:13:49', 'XX');
INSERT INTO `sys_statistics` VALUES ('9fb8cff9349a4e3eb23e73244b70aede', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:12:18', 'XX');
INSERT INTO `sys_statistics` VALUES ('9fd5ba1996434c5d9739ffd575d383b3', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:16:51', 'XX');
INSERT INTO `sys_statistics` VALUES ('a1261c572fee49a18c1e5b817c75f8f9', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:38:45', 'XX');
INSERT INTO `sys_statistics` VALUES ('a13112b2a72b4e7cac448b791d6d0ebc', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-16', '2018-10-16 14:36:32', 'XX');
INSERT INTO `sys_statistics` VALUES ('a29757fdbb1e4f6d9a4fe374f53959fa', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:38:02', 'XX');
INSERT INTO `sys_statistics` VALUES ('a2bc6245f5414ff78bea91c83adae068', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-02', '2019-01-02 02:45:49', 'XX');
INSERT INTO `sys_statistics` VALUES ('a3b356cc46a94f94b8418f7c6650bab3', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 14:57:48', 'XX');
INSERT INTO `sys_statistics` VALUES ('a442f669ce8c4436a92f0144e960ec38', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:15:18', 'XX');
INSERT INTO `sys_statistics` VALUES ('a4847d84cd5e40928f145bbc4365b9c4', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-29', '2018-12-29 02:13:11', 'XX');
INSERT INTO `sys_statistics` VALUES ('a7f7051f87e441f1ae88ae9b1120d06f', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:15:30', 'XX');
INSERT INTO `sys_statistics` VALUES ('a8b1efc2fb2049f0a10a3af5c39c8b8c', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:23:07', 'XX');
INSERT INTO `sys_statistics` VALUES ('a8ea86b063a741089189980b3584092c', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:17:16', 'XX');
INSERT INTO `sys_statistics` VALUES ('aa421ab56bb346d49b218069be1f3222', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:38:43', 'XX');
INSERT INTO `sys_statistics` VALUES ('ab7d47481a0946b6a5663a0753554f9b', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:39:03', 'XX');
INSERT INTO `sys_statistics` VALUES ('abdf13a0f7a145188aceb7081cfc2e84', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-20', '2018-10-20 12:30:16', 'XX');
INSERT INTO `sys_statistics` VALUES ('aca8e776dae94296b653326b0bc78ab0', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:38:21', 'XX');
INSERT INTO `sys_statistics` VALUES ('ae8ed7cdb65f4eb181c73672c9255b19', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-29', '2018-12-29 02:12:16', 'XX');
INSERT INTO `sys_statistics` VALUES ('aeefdd266bbf46da827448086593292e', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-02', '2019-01-02 02:45:31', 'XX');
INSERT INTO `sys_statistics` VALUES ('b0f18c714d2e456bb411db31263988aa', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 14:57:52', 'XX');
INSERT INTO `sys_statistics` VALUES ('b1042e7f49c7497daaea271f89e6206c', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:18:45', 'XX');
INSERT INTO `sys_statistics` VALUES ('b19deff7f7cb4616973a873af6e2b98a', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-16', '2018-10-16 14:38:32', 'XX');
INSERT INTO `sys_statistics` VALUES ('b1d05593925c4dfeba49ee9a12ed5c63', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-04', '2019-01-04 04:10:49', 'XX');
INSERT INTO `sys_statistics` VALUES ('b1e2e7768a3646ec9633b902324f0dfd', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:13:33', 'XX');
INSERT INTO `sys_statistics` VALUES ('b230e54f3b8b44dfaf7d3e1db45a1791', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:23:11', 'XX');
INSERT INTO `sys_statistics` VALUES ('b59553e4561f43e7bc9f2e298b7b2041', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-16', '2018-10-16 14:53:50', 'XX');
INSERT INTO `sys_statistics` VALUES ('b59a526686134cf38762f2441d137ccd', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-04', '2019-01-04 03:30:20', 'XX');
INSERT INTO `sys_statistics` VALUES ('b615d2c73d2147f1a977f039bad52fe8', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:17:10', 'XX');
INSERT INTO `sys_statistics` VALUES ('b65caec82a314a1a87f48e80e40ff54b', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:37:16', 'XX');
INSERT INTO `sys_statistics` VALUES ('b7000ac9610c4e4594b3c4e68a95312e', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-29', '2018-12-29 02:13:34', 'XX');
INSERT INTO `sys_statistics` VALUES ('b7a1fd24b8854fcb9a2a3a69fc773e50', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:36:30', 'XX');
INSERT INTO `sys_statistics` VALUES ('b86eaaa4e62b4f6abb8ef727282f6bb3', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:12:59', 'XX');
INSERT INTO `sys_statistics` VALUES ('b9671e9699b14785b31cc7594e7298d9', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:17:00', 'XX');
INSERT INTO `sys_statistics` VALUES ('ba104d01547745afa3620ccf589bc0ad', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-16', '2018-10-16 14:38:26', 'XX');
INSERT INTO `sys_statistics` VALUES ('ba9ad880be22458e8681b8de25f9a820', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 14:57:44', 'XX');
INSERT INTO `sys_statistics` VALUES ('bbc6b77fa7c2415288cef8dc66e065ec', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:03:12', 'XX');
INSERT INTO `sys_statistics` VALUES ('bcfd2d68fbc04930a7fe7f0b4f9305a9', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:15:20', 'XX');
INSERT INTO `sys_statistics` VALUES ('bd6660a0f21443b2bc72d165ba32e823', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:24:27', 'XX');
INSERT INTO `sys_statistics` VALUES ('be49b585e92849819095580d5945cc32', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:13:35', 'XX');
INSERT INTO `sys_statistics` VALUES ('be69b149763a435cac1f0722083f3e6d', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:17:15', 'XX');
INSERT INTO `sys_statistics` VALUES ('c0a583b96a4d4602ac6e8cd15b012119', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-16', '2018-10-16 14:38:23', 'XX');
INSERT INTO `sys_statistics` VALUES ('c0ad6b1b0ae543bcb562c74f534b7a0b', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:15:23', 'XX');
INSERT INTO `sys_statistics` VALUES ('c1f5a4a353d148be89f06d35e1b1dd7b', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:12:01', 'XX');
INSERT INTO `sys_statistics` VALUES ('c20298deacfb428887ac4e48d49ffdbc', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:13:59', 'XX');
INSERT INTO `sys_statistics` VALUES ('c2a8882c542f46d68d89988ad6a707ca', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:21:01', 'XX');
INSERT INTO `sys_statistics` VALUES ('c528f4cfb8c1474db6bf4dfc43970295', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:15:25', 'XX');
INSERT INTO `sys_statistics` VALUES ('c538cef77d63495eb0deb097e8f90caa', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:16:36', 'XX');
INSERT INTO `sys_statistics` VALUES ('c544d0e20ffc4fc6af39235af64beea7', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:26:23', 'XX');
INSERT INTO `sys_statistics` VALUES ('c6f3b703d1284930943f1d2dc8d95b14', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:45:00', 'XX');
INSERT INTO `sys_statistics` VALUES ('c74a1065f6114fd091ddb6bd0737fb18', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-04', '2019-01-04 00:51:20', 'XX');
INSERT INTO `sys_statistics` VALUES ('c84ba07d4c394e5e9d5846b4d5c2ba22', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:12:53', 'XX');
INSERT INTO `sys_statistics` VALUES ('c8965c17f2ff4f5d9f4835ce10474e29', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-29', '2018-12-29 02:55:16', 'XX');
INSERT INTO `sys_statistics` VALUES ('ca092793ca7a4124ab484e15ff617f1f', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:16:39', 'XX');
INSERT INTO `sys_statistics` VALUES ('cca0280d17b4430eab47af0ed2c6e68a', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:17:34', 'XX');
INSERT INTO `sys_statistics` VALUES ('ccbf72d7506a41ca80737077db57481f', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:17:45', 'XX');
INSERT INTO `sys_statistics` VALUES ('cdbee768f8c3425791152028445aa78a', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-20', '2018-10-20 19:15:34', 'XX');
INSERT INTO `sys_statistics` VALUES ('ce5824e028ef4991af48f805e556de71', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:15:27', 'XX');
INSERT INTO `sys_statistics` VALUES ('cf328542db424d4aa5e1de07157f43e9', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-29', '2018-12-29 02:13:57', 'XX');
INSERT INTO `sys_statistics` VALUES ('cf773b47d2604f078144c2df9adbbd8b', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:12:00', 'XX');
INSERT INTO `sys_statistics` VALUES ('d0a5c2ce152a46178a4201d5a4d4d41b', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:15:21', 'XX');
INSERT INTO `sys_statistics` VALUES ('d10bf5d6422d472f91e59c3a6ba58881', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:39:19', 'XX');
INSERT INTO `sys_statistics` VALUES ('d19fa015ccb3484687a6809285bd710a', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-29', '2018-12-29 02:13:24', 'XX');
INSERT INTO `sys_statistics` VALUES ('d2fec81eae18463090b34197adc37bf5', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:16:38', 'XX');
INSERT INTO `sys_statistics` VALUES ('d43b6a241c74424b8040d8dd61686804', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:13:41', 'XX');
INSERT INTO `sys_statistics` VALUES ('d60c77df2fea46868f540bf434869dd8', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:37:26', 'XX');
INSERT INTO `sys_statistics` VALUES ('d6462d8190d84b2d8d45f3fe61de16e9', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 10:46:55', 'XX');
INSERT INTO `sys_statistics` VALUES ('d7ae788f6fdd4e848c05d3ea36c4563a', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:38:25', 'XX');
INSERT INTO `sys_statistics` VALUES ('d7b55b46a6114f4f9b6c911336763d66', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-04', '2019-01-04 04:17:00', 'XX');
INSERT INTO `sys_statistics` VALUES ('d98ac27f0dbe47aca502798395c41c73', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 10:46:53', 'XX');
INSERT INTO `sys_statistics` VALUES ('d9b5ab3889524cd495ddcb92d6500b4b', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 14:57:41', 'XX');
INSERT INTO `sys_statistics` VALUES ('dae6f7673fe94c3dad36a16b953ece4e', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-02', '2019-01-02 03:19:54', 'XX');
INSERT INTO `sys_statistics` VALUES ('db6f5303109940a18525cfad40be9f2d', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:23:51', 'XX');
INSERT INTO `sys_statistics` VALUES ('dc69bc5124b746068db6bbb783fc82b4', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:36:25', 'XX');
INSERT INTO `sys_statistics` VALUES ('dd4a70ff63a04ca39cb4e66f2ec76fa0', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-16', '2018-10-16 14:55:20', 'XX');
INSERT INTO `sys_statistics` VALUES ('dd7291e4b0714eab8e4fbac6142912d3', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:11:20', 'XX');
INSERT INTO `sys_statistics` VALUES ('df336118974c44d9bd3d94d49edd6fa6', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-20', '2018-10-20 19:13:34', 'XX');
INSERT INTO `sys_statistics` VALUES ('e20716f742474f65b77af7e28ad2245c', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:26:42', 'XX');
INSERT INTO `sys_statistics` VALUES ('e217a0ac04954b6a971e0bf97d3bd7c6', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-02', '2019-01-02 03:04:16', 'XX');
INSERT INTO `sys_statistics` VALUES ('e231d50e18e040f989e0541f2a36e2e1', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-04', '2019-01-04 03:23:21', 'XX');
INSERT INTO `sys_statistics` VALUES ('e277ed0c522945e2adf1f6133d73ac56', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:14:08', 'XX');
INSERT INTO `sys_statistics` VALUES ('e53f8afaca7f4178a663f3870dc99a95', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:17:02', 'XX');
INSERT INTO `sys_statistics` VALUES ('e55f3563991741e09f91b3b475a71148', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-04', '2019-01-04 03:11:52', 'XX');
INSERT INTO `sys_statistics` VALUES ('e6392b2586f14caaba606c08bb32a2bb', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:12:13', 'XX');
INSERT INTO `sys_statistics` VALUES ('e689d34afac946f6b040e76f1bd5680e', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 10:48:46', 'XX');
INSERT INTO `sys_statistics` VALUES ('e6e0b2e4a82f466ca6c977660b0b5514', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:15:52', 'XX');
INSERT INTO `sys_statistics` VALUES ('e781f36dc94948b29e5cc5a1bfea534a', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-03', '2019-01-03 01:15:46', 'XX');
INSERT INTO `sys_statistics` VALUES ('e8147100063b47508dbbfcfc8be7267e', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:17:22', 'XX');
INSERT INTO `sys_statistics` VALUES ('eaf48a70769042ddb1a5901b20423e9e', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:13:51', 'XX');
INSERT INTO `sys_statistics` VALUES ('eb2378dfe477433ea20e4114a7b94cb6', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:16:52', 'XX');
INSERT INTO `sys_statistics` VALUES ('eb9bf77edfe540c3869ddfc2d9d8cbad', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-29', '2018-12-29 02:27:04', 'XX');
INSERT INTO `sys_statistics` VALUES ('ed275a7093444fe5bcf28697daa1155f', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:18:06', 'XX');
INSERT INTO `sys_statistics` VALUES ('ed5b00d419be40c8984c7827044e51d9', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:23:15', 'XX');
INSERT INTO `sys_statistics` VALUES ('ed5b2b6d6e8a4ee89196337e0b17996a', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-16', '2018-10-16 14:55:16', 'XX');
INSERT INTO `sys_statistics` VALUES ('ee1d1f95573742199832d09ab679f9e4', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:17:24', 'XX');
INSERT INTO `sys_statistics` VALUES ('ee3ad5d57e624a27a30a6567b0207073', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-16', '2018-10-16 14:53:48', 'XX');
INSERT INTO `sys_statistics` VALUES ('eea733a6d95c4c0b80e4e8381da63b6a', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:13:42', 'XX');
INSERT INTO `sys_statistics` VALUES ('f09a4f000cad4c8fbb5b4a98595550aa', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-10-20', '2018-10-20 19:15:13', 'XX');
INSERT INTO `sys_statistics` VALUES ('f1ee8048aef545f18c663e46e6e1f8cf', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:14:55', 'XX');
INSERT INTO `sys_statistics` VALUES ('f27d11b8ecb0407ab1fe8fd3d2398f6a', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:38:19', 'XX');
INSERT INTO `sys_statistics` VALUES ('f2a9ed5ede3d47829b1cf3dbbf956f32', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:13:02', 'XX');
INSERT INTO `sys_statistics` VALUES ('f2cbc1bd1eb64b75bcc7c0a9be8ffc70', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:21:29', 'XX');
INSERT INTO `sys_statistics` VALUES ('f3d05f0fe8614dc1b3b136a185c066c6', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:38:34', 'XX');
INSERT INTO `sys_statistics` VALUES ('f4535383739d475a93c86fd1909c027b', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:17:01', 'XX');
INSERT INTO `sys_statistics` VALUES ('f456697d5b9640b3a9cf1b0743274217', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 02:13:39', 'XX');
INSERT INTO `sys_statistics` VALUES ('f4bb58fc621e491c8ba1898876c1c5a0', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:36:26', 'XX');
INSERT INTO `sys_statistics` VALUES ('f4e6351e33484683995c16fd7b0e92e3', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:44:11', 'XX');
INSERT INTO `sys_statistics` VALUES ('f5bf11ba70e74763b9713d979badf4f3', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2018-12-13', '2018-12-13 10:48:45', 'XX');
INSERT INTO `sys_statistics` VALUES ('f5c1cee1eda6488386d25d02a8180263', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-03', '2019-01-03 02:34:03', 'XX');
INSERT INTO `sys_statistics` VALUES ('f6b84cb60c3845b3bea1c002d0c33a90', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:20:59', 'XX');
INSERT INTO `sys_statistics` VALUES ('f6f09b1f8f0547ae9f461ff134d34e7e', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:13:21', 'XX');
INSERT INTO `sys_statistics` VALUES ('f7da6956602148e3954fab9363085fe2', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:16:22', 'XX');
INSERT INTO `sys_statistics` VALUES ('f82bb01cb2b04c83adfa658a16caf2b9', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-01-04', '2019-01-04 03:31:26', 'XX');
INSERT INTO `sys_statistics` VALUES ('f8baae8a28c843ea86787aa8107dcc0e', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:17:14', 'XX');
INSERT INTO `sys_statistics` VALUES ('fbc4373c60754762973f5924cc1b5a10', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:21:53', 'XX');
INSERT INTO `sys_statistics` VALUES ('fcc50358843e4553aab5fe8226ca0899', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:37:49', 'XX');
INSERT INTO `sys_statistics` VALUES ('fd33718303e0452490d6d0c04b0acaa4', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 15:26:30', 'XX');
INSERT INTO `sys_statistics` VALUES ('fd7adab2ebaf4182808cfa989e0d8853', '127.0.0.1', 'XX  XX 内网IP', '内网IP', '2019-05-07', '2019-05-07 16:17:00', 'XX');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `USER_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PASSWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RIGHTS` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ROLE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LAST_LOGIN` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IP` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `STATUS` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SKIN` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `EMAIL` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NUMBER` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PHONE` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'de41b7fb99201d8334c23c014db35ecd92df81bc', 'FH', '1133671055321055258374707980945218933803269864762743594642571294', '1', '2021-03-07 12:49:31', '117.154.89.235', '0', 'admin', 'no-skin', 'QQ313596790@main.com', '001', '18788888888');
INSERT INTO `sys_user` VALUES ('3eecd38940e142dcae2e4625f78507b4', 'testUser', 'f2e51f2fc9c75127cba375e0eef9e50097704429', '哈哈哈', '', '3264c8e83d0248bb9e3ea6195b4c0216', '', '', '0', '312', 'no-skin', '849004406@qq.com', '12', '15927457077');
INSERT INTO `sys_user` VALUES ('6641fb8b9d9b47138bf8ac08eb85c81d', '1', '17ba0791499db908433b80f37c5fbc89b870084b', '1', '', '3', '2021-03-01 21:13:51', '127.0.0.1', '0', '注册用户', 'no-skin', '1396796583@qq.com', '', '');
INSERT INTO `sys_user` VALUES ('eded77bdf35347249b2bacfa181c869d', 'w1', 'c46e5c325e9edfbf213d5d82018ba3c522eabbea', '1212', '', '68f8e4a39efe47c7bb869e9d15ab925d', '', '', '0', '111', 'no-skin', '313596790@qq.com', '112', '13566625555');

-- ----------------------------
-- Table structure for sys_userphoto
-- ----------------------------
DROP TABLE IF EXISTS `sys_userphoto`;
CREATE TABLE `sys_userphoto`  (
  `USERPHOTO_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `USERNAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `PHOTO0` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原图',
  `PHOTO1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像1',
  `PHOTO2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像2',
  `PHOTO3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像3',
  PRIMARY KEY (`USERPHOTO_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_userphoto
-- ----------------------------

-- ----------------------------
-- Table structure for tb_pictures
-- ----------------------------
DROP TABLE IF EXISTS `tb_pictures`;
CREATE TABLE `tb_pictures`  (
  `PICTURES_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TITLE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `PATH` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `CREATETIME` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `MASTER_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属于',
  `BZ` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`PICTURES_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_pictures
-- ----------------------------
INSERT INTO `tb_pictures` VALUES ('d2aa4c1e4c1a41a693bbf4241c52cb06', '图片', 'dca46d3c291e4c7385c0789bc0a3381f.png', '20171215/dca46d3c291e4c7385c0789bc0a3381f.png', '2017-12-15 19:14:32', '1', '图片管理处上传');

-- ----------------------------
-- Table structure for web_aboutus
-- ----------------------------
DROP TABLE IF EXISTS `web_aboutus`;
CREATE TABLE `web_aboutus`  (
  `ABOUTUS_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CONTENT` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  PRIMARY KEY (`ABOUTUS_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_aboutus
-- ----------------------------
INSERT INTO `web_aboutus` VALUES ('1', '<p style=\"padding: 0px 0px 1em;margin-top: 0;margin-bottom: 0;line-height: 27px;font-size: 12px;color: rgb(90, 90, 90);font-family: 宋体;white-space: normal;text-indent: 32px;background-color: rgb(255, 255, 255)\"><span style=\"line-height: 26.6667px;\"><embed type=\"application/x-shockwave-flash\" class=\"edui-faked-video\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" src=\"http://player.youku.com/player.php/sid/XMjk1Nzc0MjYxNg==/v.swf\" width=\"300\" height=\"180\" style=\"float: left\" wmode=\"transparent\" play=\"true\" loop=\"false\" menu=\"false\" allowscriptaccess=\"never\" allowfullscreen=\"true\"/></span></p><p style=\"padding: 0px 0px 1em;margin-top: 0;margin-bottom: 0;line-height: 27px;font-size: 12px;color: rgb(90, 90, 90);font-family: 宋体;white-space: normal;text-indent: 32px;background-color: rgb(255, 255, 255)\"><span style=\"line-height: 26.6667px;\">中冶置业集团有限公司（以下简称中冶置业集团）是中冶集团独资的大型国有房地产开发企业，也是中冶集团房地产业务的核心企业，拥有房地产开发、物业管理两项一级资质。</span><br/></p><p style=\"padding: 0px 0px 1em;margin-top: 0;margin-bottom: 0;line-height: 22px;font-size: 12px;color: rgb(90, 90, 90);font-family: 宋体;white-space: normal;text-indent: 32px;background-color: rgb(255, 255, 255)\"><span style=\"font-size:12px\"><span style=\"line-height: 26.6667px\">&nbsp; &nbsp; 2005年，作为国务院国资委首批16家房地产央企之一，中冶置业集团由此掀开了创新提升、做强做优的新篇章。公司全力打造以项目开发能力、资本整合能力、产业整合能力为基础的核心竞争力，坚持走精品化、专业化、品牌化的发展路径，全面布局三大经济圈热点城市，开创了统一品牌与区域化经营相结合的发展新纪元。2012年以来，中冶置业集团加快转型发展脚步，着力提升发展质量，不断推进“3+6”区域布局战略和“3+1”区域深耕战略，以“京津冀、长三角、珠三角”为中心，深耕北京、天津、上海、南京、广州、深圳、珠海等重点城市，积极向中原经济区、长江中游城市群等热点地区拓展，获取石家庄、郑州、保定、青岛等地优质项目，巩固西安、烟台、包头等已进入地区，形成区域协同发展的良好态势,通过五年的发展变革，中冶置业集团成功跻身中国房地产百强企业行列，荣获房地产百强企业第48位、百强盈利能力第8位、中国地产公司品牌价值10强、中国绿色地产开发企业30强、中国物业服务特色企业、中国物业服务专业化运营领先品牌等荣誉。</span></span><br/><span style=\"font-size:12px\"><span style=\"line-height: 26.6667px\">&nbsp; &nbsp; 中冶置业集团巩固以中高端住宅开发为主，商业地产、物业管理为辅的“一主两翼”的业务体系，倾力打造以“中冶·德贤公馆”、“中冶·锦绣华府”、“中冶·逸璟龙湾”为代表的中高端地产、以“中冶·盛世国际广场”命名的商业地产及中冶物业三张新名片，与清华大学、北京大学、SOM、KPF、华为等国内外知名机构建立战略合作关系，成为国际“金钥匙”物业联盟成员，实现了企业品牌向高端领域的华丽蜕变。我们联合全球行业优质资源，发挥产业整合优势，积极开拓文旅地产、康养地产、教育地产等新领域，实现从“一主两翼”到“一主N翼”的延伸拓展。我们以科技创新为依托，以人文精神为内涵，实施绿色科技地产战略，研发更加节能环保、自然舒适的人性化产品，将高品质和人文精神的元素源源不断地注入到我们开发的每一类产品中，致力于为客户缔造美好舒适的生活工作环境<br/></span></span><span style=\"font-size:12px\"><span style=\"line-height: 26.6667px\">&nbsp; &nbsp; 面向未来，中冶置业集团将秉承中冶集团“一天也不耽误，一天也不懈怠”朴实厚重的中冶精神，坚持以市场需求为导向，以创新创意为动力，大力提升质量效益，全力推进改革创新，履行国有资产保值增值责任和企业社会责任，以“品质地产”与“责任地产”为目标，为打造国内领先的房地产开发企业不懈努力！</span></span></p><p><br/></p>');

-- ----------------------------
-- Table structure for web_contactus
-- ----------------------------
DROP TABLE IF EXISTS `web_contactus`;
CREATE TABLE `web_contactus`  (
  `CONTACTUS_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CONTENT` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `DIMENSION` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `LONGITUDE` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PZOOM` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`CONTACTUS_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_contactus
-- ----------------------------
INSERT INTO `web_contactus` VALUES ('1', '<p>全国免费资讯热线：400-000-0000</p><p>邮箱：service@aaa.com</p><p>网址：http://www.aaaa.com</p><p>地址 ：山东省济南市历城区</p>', '39.923432', '116.403485', '15');

-- ----------------------------
-- Table structure for web_cooperation
-- ----------------------------
DROP TABLE IF EXISTS `web_cooperation`;
CREATE TABLE `web_cooperation`  (
  `COOPERATION_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CONTENT` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  PRIMARY KEY (`COOPERATION_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_cooperation
-- ----------------------------
INSERT INTO `web_cooperation` VALUES ('1', '<h1 style=\"padding: 0px; margin: 0px 0px 15px; font-size: 24px; font-weight: normal; line-height: 40px; text-align: center; color: rgb(102, 102, 102); font-family: &#39;Microsoft Yahei&#39;, arial, Tahoma, sans-serif; white-space: normal; background-color: rgb(252, 252, 252); background-repeat: no-repeat;\">合作方式</h1><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: &#39;Microsoft Yahei&#39;, arial, Tahoma, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(252, 252, 252); background-repeat: no-repeat;\"><span style=\"font-family: &#39;microsoft yahei&#39;, arial, tahoma, sans-serif; color: rgb(119, 119, 119); font-size: 12px; background-color: rgb(255, 255, 255); background-repeat: no-repeat;\"></span></p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: &#39;Microsoft Yahei&#39;, arial, Tahoma, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(252, 252, 252); background-repeat: no-repeat;\"><span style=\"font-family: 宋体; color: rgb(0, 0, 0); background-repeat: no-repeat;\">&nbsp;&nbsp;&nbsp;&nbsp;为了快速响应客户各种个性化需求，我们提供弹性的ODM/OEM合作模式，可为客户提供设计文件、软件映像文件、软件源代码、相关文档及PCB、PCBA、整机等。</span></p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: &#39;Microsoft Yahei&#39;, arial, Tahoma, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(252, 252, 252); background-repeat: no-repeat;\"><span style=\"color: rgb(0, 0, 0); background-repeat: no-repeat;\">&nbsp;</span></p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: &#39;Microsoft Yahei&#39;, arial, Tahoma, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(252, 252, 252); background-repeat: no-repeat;\"><strong style=\"background-repeat: no-repeat;\"><span style=\"font-family: 宋体; color: rgb(0, 0, 0); background-repeat: no-repeat;\">主要合作方式:</span></strong></p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: &#39;Microsoft Yahei&#39;, arial, Tahoma, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(252, 252, 252); background-repeat: no-repeat;\"><span style=\"color: rgb(0, 0, 0); background-repeat: no-repeat;\">&nbsp;</span></p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: &#39;Microsoft Yahei&#39;, arial, Tahoma, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(252, 252, 252); background-repeat: no-repeat;\"><strong style=\"background-repeat: no-repeat;\"><span style=\"font-family: 宋体; color: rgb(0, 0, 0); background-repeat: no-repeat;\">&nbsp;1</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); background-repeat: no-repeat;\">、完全研发项目：</span></strong><span style=\"font-family: 宋体; color: rgb(0, 0, 0); background-repeat: no-repeat;\">根据客户产品方案书或具体功能要求，选择CPU平台，进行软（系统级别）、硬件开发，制作样机，或针对客户原有产品进行软、硬件升级，样机制作，同时您还将得到专业的、技术人员培训、辅导服务以及终身技术维护，我们提供所有产品资料。</span></p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: &#39;Microsoft Yahei&#39;, arial, Tahoma, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(252, 252, 252); background-repeat: no-repeat;\"><span style=\"color: rgb(0, 0, 0); background-repeat: no-repeat;\">&nbsp;</span></p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: &#39;Microsoft Yahei&#39;, arial, Tahoma, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(252, 252, 252); background-repeat: no-repeat;\"><span style=\"font-family: 宋体; color: rgb(0, 0, 0); background-repeat: no-repeat;\">&nbsp;</span><strong style=\"background-repeat: no-repeat;\"><span style=\"font-family: 宋体; color: rgb(0, 0, 0); background-repeat: no-repeat;\">2</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); background-repeat: no-repeat;\">、研发及生产项目：</span></strong><span style=\"font-family: 宋体; color: rgb(0, 0, 0); background-repeat: no-repeat;\">根据客户需求，定制研发客户规格产品，样机确认后批量生产，以最终整机交付客户。</span></p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: &#39;Microsoft Yahei&#39;, arial, Tahoma, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(252, 252, 252); background-repeat: no-repeat;\"><span style=\"color: rgb(0, 0, 0); background-repeat: no-repeat;\">&nbsp;</span></p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: &#39;Microsoft Yahei&#39;, arial, Tahoma, sans-serif; font-size: 14px; line-height: 24px; white-space: normal; background-color: rgb(252, 252, 252); background-repeat: no-repeat;\"><strong style=\"background-repeat: no-repeat;\"><span style=\"font-family: 宋体; color: rgb(0, 0, 0); background-repeat: no-repeat;\">&nbsp;3</span><span style=\"font-family: 宋体; color: rgb(0, 0, 0); background-repeat: no-repeat;\">．标准产品销售：</span></strong><span style=\"font-family: 宋体; color: rgb(0, 0, 0); background-repeat: no-repeat;\">客户可以选购我们一系列的标准产品，直接下单采购，不需额外付任何研发费及模具费。</span></p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: &#39;Microsoft Yahei&#39;, arial, Tahoma, sans-serif; font-size: 14px; white-space: normal; text-align: center; line-height: 21px; background-color: rgb(252, 252, 252); background-repeat: no-repeat;\"><span style=\"font-family: 宋体; background-repeat: no-repeat;\"><br style=\"background-repeat: no-repeat;\"/></span></p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: &#39;Microsoft Yahei&#39;, arial, Tahoma, sans-serif; font-size: 14px; white-space: normal; text-align: center; line-height: 21px; background-color: rgb(252, 252, 252); background-repeat: no-repeat;\"><span style=\"font-family: 宋体; background-repeat: no-repeat;\"><img title=\"clip_image002.png\" border=\"0\" hspace=\"0\" src=\"http://info.emdoor.com/ueditor1.2.5/asp/upload/2014092858921669.png\" width=\"650\" height=\"236\" style=\"border: none; width: 650px; height: 236px; background-repeat: no-repeat;\"/></span></p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 0px; text-indent: 2em; color: rgb(102, 102, 102); font-family: &#39;Microsoft Yahei&#39;, arial, Tahoma, sans-serif; font-size: 14px; white-space: normal; text-align: center; line-height: 21px; background-color: rgb(252, 252, 252); background-repeat: no-repeat;\"><span style=\"font-family: 宋体; background-repeat: no-repeat;\"><br style=\"background-repeat: no-repeat;\"/></span></p><p style=\"padding: 0px; margin-top: 0px; margin-bottom: 0px; text-indent: 32px; color: rgb(102, 102, 102); font-family: &#39;Microsoft Yahei&#39;, arial, Tahoma, sans-serif; font-size: 14px; white-space: normal; line-height: 21px; background-color: rgb(252, 252, 252); background-repeat: no-repeat;\"><span style=\"font-family: 宋体; color: rgb(0, 0, 0); background-repeat: no-repeat;\">针对ODM方式，我们可以提供完整系统（包括硬件PCBA和操作系统及驱动程序），也可提供部分保证客户二次开发所必需的文件、线路图纸等，供客户灵活选择，以期让客户以最低廉的成本获得最具性价比的方案。</span></p><p><span style=\"font-family: 宋体; color: rgb(0, 0, 0); background-repeat: no-repeat;\"><br/></span></p><p><br/></p>');

-- ----------------------------
-- Table structure for web_corporatephilosophy
-- ----------------------------
DROP TABLE IF EXISTS `web_corporatephilosophy`;
CREATE TABLE `web_corporatephilosophy`  (
  `CORPORATEPHILOSOPHY_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TITLE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `CONTENT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `TOURL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容链接',
  PRIMARY KEY (`CORPORATEPHILOSOPHY_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_corporatephilosophy
-- ----------------------------
INSERT INTO `web_corporatephilosophy` VALUES ('1', '解决方案', '无论您是什么行业,都能满足您的需求.', 'http://127.0.0.1/FH-WEB');
INSERT INTO `web_corporatephilosophy` VALUES ('2', '安全保障', '安全稳定的架构设计,构建稳固防盾.', 'http://127.0.0.1/FH-WEB/');
INSERT INTO `web_corporatephilosophy` VALUES ('3', '服务团队', '资深专家为您提供满意的私人服务.', 'http://127.0.0.1/FH-WEB');
INSERT INTO `web_corporatephilosophy` VALUES ('4', '核心服务', '为您提供全面的软件定制服务.', 'http://127.0.0.1/FH-WEB/');

-- ----------------------------
-- Table structure for web_image
-- ----------------------------
DROP TABLE IF EXISTS `web_image`;
CREATE TABLE `web_image`  (
  `IMAGE_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TITLE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `IMGURL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `TOURL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接',
  `TYPE` int(2) NOT NULL COMMENT '类型',
  `FORDER` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序',
  `BZ` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`IMAGE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_image
-- ----------------------------
INSERT INTO `web_image` VALUES ('0d252569b3174a3390b293b31e82e3b5', '技术团队', 'https://img.alicdn.com/imgextra/i4/332189337/O1CN01bdFFo12IqOagzfXIv_!!332189337.jpg', '', 4, '2', '2');
INSERT INTO `web_image` VALUES ('1193528722af455581e783d268a14dab', '技术团队', 'https://img.alicdn.com/imgextra/i4/332189337/O1CN01tFPn2G2IqOaidsyHs_!!332189337.jpg', '', 4, '3', '3');
INSERT INTO `web_image` VALUES ('208440f6879c49189feb695d7a48fa03', '轮播图4', 'https://img.alicdn.com/imgextra/i2/332189337/O1CN01CxUdw92IqOagtRugl_!!332189337.jpg', '', 1, '4', '轮播图4');
INSERT INTO `web_image` VALUES ('26cf3e9ed7dd410b87ddb69c25970069', '产品案例6', 'https://img.alicdn.com/imgextra/i4/332189337/O1CN01GB75lF2IqOajVbmgO_!!332189337.jpg', '', 5, '6', '产品案例bz6');
INSERT INTO `web_image` VALUES ('32c90dfb3fae4b8ea75122d657369bfd', '合作伙伴', 'https://img.alicdn.com/imgextra/i2/332189337/O1CN01RgzNHb2IqOaf79v88_!!332189337.jpg', '', 3, '4', '合作伙伴备注');
INSERT INTO `web_image` VALUES ('339d0beaf2124c5fbba37ed48ca2cab1', '案例', 'https://img.alicdn.com/imgextra/i2/332189337/O1CN01uGSZLK2IqOagfPqfV_!!332189337.jpg', '', 2, '4', '案例');
INSERT INTO `web_image` VALUES ('35972aeb6bb44b85abc18aed2728d431', '案例', 'https://img.alicdn.com/imgextra/i3/332189337/O1CN01FFGjYS2IqOaZl69VG_!!332189337.jpg', '', 2, '7', '案例');
INSERT INTO `web_image` VALUES ('49585afbceb54bb7832df02363325ca8', '产品案例5', 'https://img.alicdn.com/imgextra/i4/332189337/O1CN01Y5cjdW2IqOagN6s4B_!!332189337.jpg', '', 5, '5', '产品案例bz5');
INSERT INTO `web_image` VALUES ('52faef5a86fc494a93555413ad4cd4db', '轮播图1', 'https://img.alicdn.com/imgextra/i4/332189337/O1CN01vTGfVu2IqOafNuIB7_!!332189337.jpg', '', 1, '1', '播图1');
INSERT INTO `web_image` VALUES ('5b9f58ba65d14cfa9ea766bf7582528f', '产品案例4', 'https://img.alicdn.com/imgextra/i2/332189337/O1CN01Som3042IqOaieAYmX_!!332189337.jpg', '', 5, '4', '产品案例bz4');
INSERT INTO `web_image` VALUES ('72c20b7895af4abba2d18b640e4a576a', '案例', 'https://img.alicdn.com/imgextra/i1/332189337/O1CN01Pqfdtx2IqOaidSBZ5_!!332189337.jpg', '', 2, '8', '案例');
INSERT INTO `web_image` VALUES ('740e706d44bd419990fa2aef2adc1f27', '产品案例7', 'https://img.alicdn.com/imgextra/i4/332189337/O1CN01CksrMt2IqOagyYyet_!!332189337.jpg', '', 5, '7', '产品案例bz7');
INSERT INTO `web_image` VALUES ('7bc6cea7f41f4ff3bd666f18028e4b08', '案例', 'https://img.alicdn.com/imgextra/i2/332189337/O1CN01h0EyKJ2IqOaZl5TwN_!!332189337.jpg', 'http://www.baidu.com', 2, '1', '案例');
INSERT INTO `web_image` VALUES ('7cdab770e4874b4490e3013bc54f0cf4', '产品案例2', 'https://img.alicdn.com/imgextra/i4/332189337/O1CN01rV3YoK2IqOaeIGKj6_!!332189337.jpg', '', 5, '2', '产品案例bz2');
INSERT INTO `web_image` VALUES ('7f88637876184343beef8943f19d0190', '技术团队', 'https://img.alicdn.com/imgextra/i1/332189337/O1CN01xmZcxZ2IqOagMpxHH_!!332189337.jpg', '', 4, '4', '4');
INSERT INTO `web_image` VALUES ('868d142966ee496ebdaa7cceb34c736d', '产品案例8', 'https://img.alicdn.com/imgextra/i4/332189337/O1CN01rV3YoK2IqOaeIGKj6_!!332189337.jpg', '', 5, '8', '产品案例bz8');
INSERT INTO `web_image` VALUES ('86b38827cfb342e1920b4182037a28ed', '合作伙伴', 'https://img.alicdn.com/imgextra/i2/332189337/O1CN01dTSSXa2IqOaidiQv9_!!332189337.jpg', '', 3, '1', '合作伙伴备注');
INSERT INTO `web_image` VALUES ('9070aef4cf724ce3b861adcc669d3275', '轮播图5', 'https://img.alicdn.com/imgextra/i2/332189337/O1CN01DJCUEz2IqOagz6QYg_!!332189337.jpg', '', 1, '5', '轮播图5');
INSERT INTO `web_image` VALUES ('90b9679b9f33490e855ebf96d9b9774c', '案例', 'https://img.alicdn.com/imgextra/i3/332189337/O1CN01YzsCXi2IqOajw8qoB_!!332189337.jpg', '', 2, '3', '案例');
INSERT INTO `web_image` VALUES ('997cdd02137542d881d4209c8404abb0', '轮播图3', 'https://img.alicdn.com/imgextra/i2/332189337/O1CN01JjKDwa2IqOaf1EdFB_!!332189337.jpg', '', 1, '3', '轮播图3');
INSERT INTO `web_image` VALUES ('9c77e3f3f6a8490a9c0f667b705f50ea', '案例', 'https://img.alicdn.com/imgextra/i4/332189337/O1CN01KrKQ4e2IqOagzHV2F_!!332189337.jpg', '', 2, '2', '案例');
INSERT INTO `web_image` VALUES ('a9b9e43575e54e0993977ae629b2fbf5', '产品案例1', 'https://img.alicdn.com/imgextra/i3/332189337/O1CN015wDjOh2IqOagzxrUh_!!332189337.jpg', 'http://www.baidu.com', 5, '1', '产品案例bz');
INSERT INTO `web_image` VALUES ('cb6b4f98ae98476792d1678770499801', '案例', 'https://img.alicdn.com/imgextra/i4/332189337/O1CN01yfhrvg2IqOaidRz78_!!332189337.jpg', '', 2, '5', '5');
INSERT INTO `web_image` VALUES ('d5fdedf1b9524adc8f47eaa4eecc041d', '产品案例3', 'https://img.alicdn.com/imgextra/i1/332189337/O1CN01wbrp632IqOaeIEFsJ_!!332189337.jpg', '', 5, '3', '产品案例bz3');
INSERT INTO `web_image` VALUES ('d7f3e47deb9d40a9a86f7779804b645f', '合作伙伴', 'https://img.alicdn.com/imgextra/i3/332189337/O1CN01pkH6Nj2IqOah4rqti_!!332189337.jpg', '', 3, '3', '合作伙伴备注');
INSERT INTO `web_image` VALUES ('d89785e23b2549ebb778f4a417d46939', '产品案例9', 'https://img.alicdn.com/imgextra/i2/332189337/O1CN01Som3042IqOaieAYmX_!!332189337.jpg', '', 5, '9', '产品案例bz9');
INSERT INTO `web_image` VALUES ('e1e1275dc4d948d8ac6f859740d93af0', '技术团队', 'https://img.alicdn.com/imgextra/i3/332189337/O1CN01rYS8lI2IqOai3Y4al_!!332189337.jpg', '', 4, '1', '1');
INSERT INTO `web_image` VALUES ('e4a2a102f7e3466fb26cebdb11737404', '轮播图2', 'https://img.alicdn.com/imgextra/i4/332189337/O1CN01YdSMAf2IqOajPKk9X_!!332189337.jpg', '', 1, '2', '轮播图2');
INSERT INTO `web_image` VALUES ('eb683edddba3448491b4502cd7bd09cf', '合作伙伴', 'https://img.alicdn.com/imgextra/i3/332189337/O1CN01V22EqM2IqOai4FqBl_!!332189337.jpg', '', 3, '2', '合作伙伴备注');
INSERT INTO `web_image` VALUES ('fa66b273bf2847a4969b8d3f6a667fe9', '案例', 'https://img.alicdn.com/imgextra/i3/332189337/O1CN01pcqiF52IqOai3ANDn_!!332189337.jpg', '', 2, '6', '6');

-- ----------------------------
-- Table structure for web_information
-- ----------------------------
DROP TABLE IF EXISTS `web_information`;
CREATE TABLE `web_information`  (
  `INFORMATION_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网站名称',
  `TITLE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `KEYWORDS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关键词',
  `DESCRIPTION` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `LOGO` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'logo',
  `TEL` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `EMAIL` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `QQ` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ',
  `FAX` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `WEBURL` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '官网',
  `ADDRESS` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `COPYRIGHT` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版权',
  `TECHNOLOGY` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '技术支持',
  `BEIAN` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备案',
  `ABOUTUS1` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ABOUTUS2` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEW1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NEW2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IMG1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`INFORMATION_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_information
-- ----------------------------
INSERT INTO `web_information` VALUES ('1', '网站名称', 'FH 网站模版', 'FH admin WEB', 'FH admin WEB', 'https://img.alicdn.com/imgextra/i1/332189337/TB2B08ba5j_F1JjSZFCXXc5eFXa_!!332189337.png', '0531-01215786', '313596790@qq.com', '313596790', '313596790', 'http://www.abcdef.com', '山东省济南市高新区', '©2019 fhadmin', '山东济南信息科技', '京-00000001', '为华语乐坛流行女歌手周笔畅演唱的歌曲。由李焯雄作词，梁翘柏作曲', '2015年作为出道第十年发表的首支EP单曲，周笔畅用这首 《关于我们》为十年证明', '国家发展改革委会同财政部印发《关于不动产登记收费标准等有关问题的通知》', '济南大明湖风景名胜区收费开放区域于2017年1月1日起对社会免费开放。', 'https://img.alicdn.com/imgextra/i1/332189337/O1CN01NDgnlP2IqOajv7sYs_!!332189337.jpg');

-- ----------------------------
-- Table structure for web_leavemsg
-- ----------------------------
DROP TABLE IF EXISTS `web_leavemsg`;
CREATE TABLE `web_leavemsg`  (
  `LEAVEMSG_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `NAME` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `EMAIL` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `ADDRESS` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `LCONTENT` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `CTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提交时间',
  PRIMARY KEY (`LEAVEMSG_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_leavemsg
-- ----------------------------

-- ----------------------------
-- Table structure for web_news
-- ----------------------------
DROP TABLE IF EXISTS `web_news`;
CREATE TABLE `web_news`  (
  `NEWS_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TITLE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `CTIME` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发表时间',
  `STEMFROM` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源',
  `IMAGE` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `SHORTCONTENT` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简述',
  `CONTENT` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `HIDE` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `WEIGHT` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`NEWS_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_news
-- ----------------------------
INSERT INTO `web_news` VALUES ('2fa0b30b869740789079e9c8b3f656e8', '新闻标题', '2017-01-08 01:48:43', 'fhadmin', 'https://img.alicdn.com/imgextra/i4/332189337/O1CN01bgI1vw2IqOah5cmF8_!!332189337.jpg', '美国情报机构发言人2016年10月曾称，俄罗斯黑客应对美国选举系统的网络攻击负责，因此宣布对俄实施制裁。此后，中情局通过媒体指责俄罗斯闯入民主党服务器，以帮助特朗普，使其在11月8日选举中获胜。但美国政府从未提出任何俄罗斯参与黑客攻击以影响总统选举结果的证据。\"\"\"', '<p class=\"detailPic\" style=\"margin: 0px auto 10px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: center; word-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\"><img alt=\"2016年美国大选以来，美国一直指责俄罗斯“用黑客行为干扰了美国大选”。\" src=\"http://p0.ifengimg.com/cmpp/2017/01/09/09/646af998-3028-4b60-af15-92cee999f2a8_size78_w500_h250.jpg\" style=\"border: 0px; vertical-align: bottom; display: block; margin: 0px auto; max-width: 100%; height: auto;\"/></p><p class=\"picIntro\" style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; font-size: 14px; text-align: center; word-wrap: break-word; word-break: normal; font-family: 楷体_gb2312, 楷体; color: rgb(43, 43, 43); line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">2016年美国大选以来，美国一直指责俄罗斯“用黑客行为干扰了美国大选”。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">原标题：原标题：特朗普改口 首次承认俄罗斯黑客曾干扰美国大选</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">国际在线专稿：据路透社1月9日报道，当地时间1月8日，美国候任总统特朗普团队首次承认，俄罗斯黑客曾经入侵并干扰美国大选，并表示将采取应对措施。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">特朗普新任命的白宫办公厅主任赖因斯·普里巴斯表示，特朗普相信俄罗斯曾经干扰美国大选期间的民主党大会。但是，普里巴斯并未指出，特朗普是否认为普京曾经指使这一行为。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">“特朗普接受此案是俄罗斯团队所为的事实，”·普里巴斯在“周日福克斯新闻”节目上表示。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>这是特朗普团队首次承认，俄罗斯黑客曾经干扰美国大选。特朗普此前一直拒绝“俄罗斯黑客干扰美国大选”或是“俄罗斯黑客帮助特朗普赢得总统宝座”的类似言论。</strong></p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">随着1月20日的就职典礼日益临近，特朗普来自共和党内部的压力也越来越大，许多人认为，这位候任总统应该与美国情报部门更好的沟通与合作，并认可来自后者的最新线索。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">上周，美国情报部门发表报告指出，普京“导演了一个包括网络攻击在内的复杂的计划”，来干扰民主党的竞选进程。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>【早前新闻】</strong></p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>特朗普发言人：未发现俄罗斯试图影响美国大选的证据</strong></p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">【环球网报道记者朱佩】美国情报机构发言人2016年10月曾称，俄罗斯黑客应对美国选举系统的网络攻击负责，因此宣布对俄实施制裁。此后，中情局通过媒体指责俄罗斯闯入民主党服务器，以帮助特朗普，使其在11月8日选举中获胜。但美国政府从未提出任何俄罗斯参与黑客攻击以影响总统选举结果的证据。俄罗斯坚决否认这些指控，并表示，作为回应将采取“对等措施”。 日前， 美国候任总统特朗普发言人肖恩•斯派塞表示，美国没有发现俄罗斯试图影响美国大选的证据。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">据俄新社1月3日消息， 斯派塞在福克斯新闻网的直播节目中表示：“主要媒体倾向宣传俄罗斯曾对选举实施影响的消息。但没有任何俄罗斯真正影响选举的证据。”</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">他指出，“计算机网络是否被侵入——这完全是另一个事情”，和俄罗斯是否参与其中没有关系。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">此外，他还强调称，“计算机攻击是不正确的行为”。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">特朗普1月1日表示，希望获得美国情报部门有关网络袭击的消息，以便评估离任政府制裁措施的合理性。特朗普发言人曾表示，认为俄罗斯好像同网络袭击有关，就实施反俄新制裁，对该政策的合理性有些怀疑。</p><p style=\"margin-top: 0px; margin-bottom: 25px; padding: 0px; text-indent: 28px; font-size: 14px; text-align: justify; word-wrap: break-word; word-break: normal; color: rgb(43, 43, 43); font-family: simsun, arial, helvetica, clean, sans-serif; line-height: 24px; white-space: normal; background-color: rgb(255, 255, 255);\">奥巴马政府去年12月29日以“干涉选举”和“对美驻俄外交官施压”为由对9家俄机构、公司和个人实施了制裁，其中包括俄军总参谋部情报总局以及联邦安全局。此外，美方还将35名俄驻美外交官宣布为不受欢迎的人。对此，俄总统普京表示，莫斯科不会遣返美国外交官作为对华盛顿的行为的回应。<span class=\"ifengLogo\"><a href=\"http://www.ifeng.com/\" target=\"_blank\" style=\"text-decoration: none; color: rgb(0, 66, 118); font-weight: bold;\"><img src=\"http://p2.ifengimg.com/a/2016/0810/204c433878d5cf9size1_w16_h16.png\" style=\"border: 0px; vertical-align: top; display: inline; margin: 0px; max-width: 100%; height: auto; padding-top: 3px;\"/></a></span></p><p><br/></p>', 'no', 21);
INSERT INTO `web_news` VALUES ('a28b54c614d142f9bb0cd6ac3f90f67d', '新闻标题2', '2017-10-21 15:23:21', 'iii', 'https://img.alicdn.com/imgextra/i1/332189337/O1CN01F0XYCr2IqOaggNw5z_!!332189337.jpg', '美国情报机构发言人2016年10月曾称，俄罗斯黑客应对美国选举系统的网络攻击负责，因此宣布对俄实施制裁。此后，中情局通过媒体指责俄罗斯闯入民主党服务器，以帮助特朗普，使其在11月8日选举中获胜。但美国政府从未提出任何俄罗斯参与黑客攻击以影响总统选举结果的证据。\"\"\"', '<p>iii</p>', 'no', 6);
INSERT INTO `web_news` VALUES ('b5739322b529419f958b92684a38aac3', 'd斯蒂芬森', '2017-10-21 15:22:47', 'ddd', 'https://img.alicdn.com/imgextra/i4/332189337/O1CN01bgI1vw2IqOah5cmF8_!!332189337.jpg', 'ddd', '<p>dddd</p>', 'no', 1);
INSERT INTO `web_news` VALUES ('d3b7cd0ff0044038be260ad81a879be1', 'ww', '2017-12-11 10:51:33', 'www', 'https://img.alicdn.com/imgextra/i4/332189337/O1CN01bgI1vw2IqOah5cmF8_!!332189337.jpg', 'www', '<p><img src=\"/FH-WEB3/plugins/ueditor/jsp/upload1/20171211/29211512960687460.png\" title=\"QQ截图20171207030605.png\"/></p>', 'no', 1);
INSERT INTO `web_news` VALUES ('eba04dd7092449bda6f925ab272756f0', '全国铁路今日调整列车运行图 增开多趟旅游专列', '2017-01-09 13:48:18', '新华网', 'https://img.alicdn.com/imgextra/i3/332189337/O1CN01J91IPn2IqOah0BUWW_!!332189337.jpg', '美国情报机构发言人2016年10月曾称，俄罗斯黑客应对美国选举系统的网络攻击负责，因此宣布对俄实施制裁。此后，中情局通过媒体指责俄罗斯闯入民主党服务器，以帮助特朗普，使其在11月8日选举中获胜。但美国政府从未提出任何俄罗斯参与黑客攻击以影响总统选举结果的证据。\"\"\"\"', '<p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">中新网北京4月16日电（记者 张尼）今日零时起，全国铁路将实行新的列车运行图，调整后较调整前增开动车组列车25.5对，至此，全国铁路开行旅客列车总数达3615对。不少旅游专列的开通更将大大方便游客出行。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-align: center; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><a href=\"http://www.cankaoxiaoxi.com/\" target=\"_self\" style=\"color: rgb(51, 102, 153); text-decoration: none;\"><img src=\"http://upload.cankaoxiaoxi.com/temp/2017/0416/1492296892669.jpg\" style=\"vertical-align: top; border-width: 0px; margin: 0px auto; max-width: 600px;\"/></a></p><p style=\"margin-top: -10px; margin-bottom: 0px; padding: 0px; line-height: 12px; text-align: center; text-indent: 2em; font-size: 12px; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><a href=\"http://www.cankaoxiaoxi.com/\" target=\"_self\" style=\"color: rgb(255, 0, 0); text-decoration: none;\">点击图片进入下一页</a></p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-align: center; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"line-height: 22px; margin-bottom: 10px; font-size: 12px;\">资料图 中新社记者 刘冉阳 摄</span></p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>增开动车组列车25.5对 客流饱满线路运力将扩大</strong></p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">此次调图，铁路部门共增开动车组列车25.5对，并安排37对现有动车组列车重联或大编组运行。调整后，全国铁路开行旅客列车总数达3615对，沪昆高铁、杭深线、南广、贵广、宁蓉、京广等客流饱满线路的运力将得到扩大。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">铁路部门还主动对接市场需求，挖掘高铁运输能力，对动卧列车开行方案进行了优化，增开部分白天动卧列车，中长途旅客的旅行体验或将得到改善。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">另外，全国还新增了多条动车线路。调图后，将首次新增昆明至合肥、福州、珠海、衡阳等动车。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">新增开的昆明至合肥G1398次列车，运行时间将由普速列车的34小时压缩至11小时50分；昆明至福州G1696次列车将由普速列车的37小时43分压缩至11小时28分。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">从郑州站将始发3趟至北京的直达高铁。郑州东站至广州南站的G545次变更到站至珠海，这也是郑州至珠海首次通行高铁，从郑州东站乘高铁至珠海仅需7小时26分。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-align: center; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><a href=\"http://www.cankaoxiaoxi.com/\" target=\"_self\" style=\"color: rgb(51, 102, 153); text-decoration: none;\"><img src=\"http://upload.cankaoxiaoxi.com/temp/2017/0416/1492296892634.jpg\" style=\"vertical-align: top; border-width: 0px; margin: 0px auto; max-width: 600px;\"/></a></p><p style=\"margin-top: -10px; margin-bottom: 0px; padding: 0px; line-height: 12px; text-align: center; text-indent: 2em; font-size: 12px; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><a href=\"http://www.cankaoxiaoxi.com/\" target=\"_self\" style=\"color: rgb(255, 0, 0); text-decoration: none;\">点击图片进入下一页</a></p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-align: center; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"line-height: 22px; margin-bottom: 10px; font-size: 12px;\">资料图：站台上准备乘车的乘客 中新社记者 刘冉阳 摄</span></p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>多条路线运行时间压缩 昆明至北京用时不到11小时</strong></p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">除了运力增加，部分旅客列车旅行速度也得到了提高。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">例如，由昆明南始发至北京西的G404次高铁列车，运行时间压缩了2小时30分，实现单程10小时43分。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">昆明至武昌的K110次旅客列车，全程运行时间调图前为29小时16分，调图后为27小时01分，压缩2小时15分钟。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">成都至福州K390/1次旅行时间压缩5小时49分钟；杭州至成都K1271/4次旅行时间压缩4小时8分钟。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">另据济南铁路局介绍，青岛北至温州K1052/49K1050/1次、深圳至青岛T398/5次、青岛至南昌K344/1次也优化了列车运行区段。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">其中，青岛北至郑州K1634/5次列车在济南铁路局管内运行压缩1小时04分钟；青岛至曹县5022/3次旅行时间压缩48分钟。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-align: center; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><a href=\"http://www.cankaoxiaoxi.com/\" target=\"_self\" style=\"color: rgb(51, 102, 153); text-decoration: none;\"><img src=\"http://upload.cankaoxiaoxi.com/temp/2017/0416/1492296892847.jpg\" style=\"vertical-align: top; border-width: 0px; margin: 0px auto; max-width: 600px;\"/></a></p><p style=\"margin-top: -10px; margin-bottom: 0px; padding: 0px; line-height: 12px; text-align: center; text-indent: 2em; font-size: 12px; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><a href=\"http://www.cankaoxiaoxi.com/\" target=\"_self\" style=\"color: rgb(255, 0, 0); text-decoration: none;\">点击图片进入下一页</a></p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-align: center; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"line-height: 22px; margin-bottom: 10px; font-size: 12px;\">资料图：安徽黄山风景区 李金刚 摄</span></p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>增开多趟旅游专列 上海至黄山每天开行2对高铁</strong></p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">此次调图，多地还增开了旅游专列，方便游客出行。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">云桂铁路沿线旅游资源丰富，此次调图，昆明铁路局增开了5对昆明至富宁的临时动车组。届时，每天往返昆明与富宁间的动车组将达到10对。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">上海铁路局将上海虹桥至萍乡北G1367/G1368次列车，运行区段改为上海虹桥至黄山北，车次改为G1519/8 G1517/20次。这样，上海至黄山每天开行高铁由原先的1对增加为2对，且虹桥站发车时间安排在8：42和18：07，最快4小时即可到黄山北站，更方便旅客出门游玩。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">武安、涉县、黎城等拥有诸多著名旅游景点的脱贫攻坚区域，在此次调图中也迎来好消息。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">北京铁路局将天津-涉县4481/2次原老式“绿皮车”升级为空调列车，并增加黎城和潞城作为停靠站；将石家庄北-阳泉4465/6次、阳泉-临西4464/14462/3次更换为空调列车；将铁路通勤列车6433次，增加西大庙站办理客运业务，方便沿线旅客出行。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">此外，北京铁路局还将开行畅游京津冀旅游专列15列。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-align: center; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><a href=\"http://www.cankaoxiaoxi.com/\" target=\"_self\" style=\"color: rgb(51, 102, 153); text-decoration: none;\"><img src=\"http://upload.cankaoxiaoxi.com/temp/2017/0416/1492296892723.jpg\" style=\"vertical-align: top; border-width: 0px; margin: 0px auto; max-width: 600px;\"/></a></p><p style=\"margin-top: -10px; margin-bottom: 0px; padding: 0px; line-height: 12px; text-align: center; text-indent: 2em; font-size: 12px; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><a href=\"http://www.cankaoxiaoxi.com/\" target=\"_self\" style=\"color: rgb(255, 0, 0); text-decoration: none;\">点击图片进入下一页</a></p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-align: center; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"line-height: 22px; margin-bottom: 10px; font-size: 12px;\">资料图：北京西站 中新网记者 金硕 摄</span></p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\"><strong>优化区域交通：京津冀环形列车服务进一步提升</strong></p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">京津冀区域环形列车服务在此次调整中也将得到进一步优化。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">记者了解到，为助力京津冀协同发展，满足区域内人民群众“早进京津石 当晚可回家”工作、生活半小时、一小时交通圈出行需求，去年“5.15”调图，北京铁路局首次开行京津冀环形列车，近一年来让266.6万人享受到乘坐火车出行带来便利。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">在此基础上，此次新图调整进一步对区域内的旅客列车进行了优化。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">调图后，北京铁路局将环形列车中承德-石家庄K7754/1次列车由晚间改为白天运行，调整后列车从承德站7时49分始发，经停北京东站，满足了承德地区上午进京旅客的出行需求。</p><p style=\"margin-bottom: 0px; padding: 0px 0px 15px; line-height: 30px; text-indent: 2em; font-family: 宋体, sans-serif; white-space: normal; background-color: rgb(255, 255, 255);\">为缓解天津市与滨海新区间交通运输压力，北京铁路局对经停塘沽站的列车进行了优化。在3月份增加10列经停列车的基础上，4月调图再增普速旅客列车2列，使经停塘沽站的旅客列车达到32列，其中，高铁15列、普速17列。（完）</p><p><br/></p>', 'no', 22);
INSERT INTO `web_news` VALUES ('f999d0c302f2419c9bf778ba6a979fff', 'ttt', '2017-10-21 15:23:06', 'tt', 'https://img.alicdn.com/imgextra/i1/332189337/O1CN01DYnNX52IqOaggQcbA_!!332189337.jpg', 'ttt', '<p>tt</p>', 'no', 2);

-- ----------------------------
-- Table structure for web_ourbusiness
-- ----------------------------
DROP TABLE IF EXISTS `web_ourbusiness`;
CREATE TABLE `web_ourbusiness`  (
  `OURBUSINESS_ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `TITLE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '介绍上',
  `TITLE2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '介绍下',
  `CONTENT1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容上',
  `CONTENT2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容上',
  `TOURL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容链接',
  `OTHER1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `OTHER2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IMG1` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IMG2` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `M3_TITLE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `M3_CONTENT1` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `M3_CONTENT2` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `M3_CONTENT3` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IMG3` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `IMG4` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `M7_TITLE1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `M7_TITLE2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `M7_TITLE3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`OURBUSINESS_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of web_ourbusiness
-- ----------------------------
INSERT INTO `web_ourbusiness` VALUES ('1', 'we are FH WEB', '我们创建网站和品牌标识', '我们相信  在质量设计', '任何创意项目都是唯一', 'http://www.fhadmin.org/', '被带领与伟大的人', '我们与前瞻性的客户创建', 'https://img.alicdn.com/imgextra/i2/332189337/O1CN01XaVmX22IqOajIIy19_!!332189337.jpg', 'https://img.alicdn.com/imgextra/i3/332189337/O1CN011AO2FA2IqOagyKHwk_!!332189337.jpg', '我们的客户说什么', '无论您是什么行业,都能满足您的需求.', '安全稳定的架构设计,构建稳固防盾.', '资深专家为您提供满意的私人服务.', 'https://img.alicdn.com/imgextra/i2/332189337/O1CN01XaVmX22IqOajIIy19_!!332189337.jpg', 'https://img.alicdn.com/imgextra/i3/332189337/O1CN011AO2FA2IqOagyKHwk_!!332189337.jpg', '解决方案', '安全保障', '服务团队');

SET FOREIGN_KEY_CHECKS = 1;
