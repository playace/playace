-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2011 年 09 月 01 日 14:16
-- 服务器版本: 5.1.41
-- PHP 版本: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `playace`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin_user`
--

CREATE TABLE IF NOT EXISTS `admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 0：正常 1：冻结',
  `gid` tinyint(4) NOT NULL COMMENT '所属管理组',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `last_login_ip` varchar(50) NOT NULL DEFAULT '0.0.0.0' COMMENT '最后登录IP',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='管理员' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `admin_user`
--

INSERT INTO `admin_user` (`id`, `username`, `password`, `status`, `gid`, `create_time`, `last_login_ip`, `last_login_time`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 0, 0, 1311141063, '127.0.0.1', 1314809683),
(2, 'ray_xu', 'e10adc3949ba59abbe56e057f20f883e', 0, 0, 1311141063, '127.0.0.1', 1314431357),
(3, 'arthur_van', 'e10adc3949ba59abbe56e057f20f883e', 0, 0, 1311141063, '116.237.83.119', 1314447139),
(4, 'jim_yu', 'e10adc3949ba59abbe56e057f20f883e', 0, 0, 1311141063, '61.171.101.132', 1314451429),
(5, 'quentin', 'e10adc3949ba59abbe56e057f20f883e', 0, 0, 1311141063, '0.0.0.0', 0);

-- --------------------------------------------------------

--
-- 表的结构 `area`
--

CREATE TABLE IF NOT EXISTS `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `area` varchar(100) NOT NULL COMMENT '区域名',
  `parent_id` int(11) DEFAULT '0' COMMENT '父节点id，0为没有父节点',
  `has_node` tinyint(4) DEFAULT '0' COMMENT '是否有子节点，0：无，1：有',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='区域' AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `area`
--

INSERT INTO `area` (`id`, `area`, `parent_id`, `has_node`, `create_time`) VALUES
(1, '杨浦', 0, 0, 1309698310),
(2, '虹口', 0, 0, 1309698310),
(3, '普陀', 0, 0, 1309698310),
(4, '徐汇', 0, 0, 1309698310),
(5, '静安', 0, 1, 1309698310),
(6, '长宁', 0, 0, 1309698310),
(7, '闵行', 0, 0, 1309698310),
(8, '浦东', 0, 0, 1309698310),
(9, '黄浦', 0, 1, 1309698310),
(10, '闸北', 0, 0, 1309698310),
(11, '宝山', 0, 1, 1309698310),
(12, '松江', 0, 1, 1309698310),
(13, '嘉定', 0, 0, 1309698310),
(14, '青浦', 0, 1, 1309698310),
(15, '奉贤', 0, 1, 1309698310),
(16, '金山', 0, 1, 1309698310),
(17, '崇明', 0, 1, 1309698310);

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catname` varchar(50) NOT NULL COMMENT '分类名称',
  `parent_id` tinyint(4) NOT NULL COMMENT '上一层父节点（根节点为0）',
  `parent_arr` varchar(255) NOT NULL COMMENT '父节点数组（从根节点开始）',
  `has_child` tinyint(4) NOT NULL COMMENT '有无子节点（0：无，1：有）',
  `child_arr` varchar(255) NOT NULL COMMENT '子节点数组（从本身开始）',
  `url` varchar(255) DEFAULT NULL COMMENT '分类url',
  `cat_dir` varchar(255) DEFAULT NULL COMMENT '本分类文件目录',
  `parent_dir` varchar(255) DEFAULT NULL COMMENT '父节点文件目录',
  `description` varchar(500) DEFAULT NULL COMMENT '简介',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `create_uid` int(11) NOT NULL COMMENT '创建人id',
  `update_time` int(11) DEFAULT NULL COMMENT '最后更新时间',
  `update_uid` int(11) DEFAULT NULL COMMENT '最后更新人id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `catname` (`catname`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='分类' AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `category`
--

INSERT INTO `category` (`id`, `catname`, `parent_id`, `parent_arr`, `has_child`, `child_arr`, `url`, `cat_dir`, `parent_dir`, `description`, `create_time`, `create_uid`, `update_time`, `update_uid`) VALUES
(1, '体坛寿星', 0, '0', 0, '0', '0', '0', '0', ' 体坛寿星', 1311321478, 1, 1314003451, 1),
(2, '赛事预告', 0, '0', 0, '0', '0', '0', '0', ' 赛事预告', 1311321490, 1, 1314003458, 1),
(3, '开心一刻', 0, '0', 0, '0', '0', '0', '0', ' 开心一刻', 1311321499, 1, 1314003463, 1),
(4, '你问我答', 0, '0', 0, '0', '0', '0', '0', ' 你问我答', 1311321714, 1, 1314003467, 1),
(5, '运动贴士', 0, '0', 0, '0', '0', '0', '0', ' 运动贴士', 1311321734, 1, 1314003472, 1),
(6, '运动利器', 0, '0', 0, '0', '0', '0', '0', ' 运动利器', 1311321591, 1, 1314003477, 1),
(7, '人物', 0, '0', 0, '0', '0', '0', '0', ' 人物介绍', 1311321591, 1, 1314003481, 1),
(8, '帮助中心', 0, '0', 0, '0', '0', '0', '0', '帮助中心', 1314128693, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) NOT NULL COMMENT '评论内容',
  `class` tinyint(2) NOT NULL COMMENT '评论类型，1：场地，2：活动，3，新闻',
  `topic_id` int(11) NOT NULL COMMENT '评论主题id',
  `parent_id` int(11) NOT NULL COMMENT '回复评论id，0表示不是回复',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `create_uid` int(11) NOT NULL COMMENT '创建者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='评论' AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `comment`
--

INSERT INTO `comment` (`id`, `content`, `class`, `topic_id`, `parent_id`, `create_time`, `create_uid`) VALUES
(2, '河湾大酒店体育中心河湾大酒店体育中心河湾大酒店体育中心河湾大酒店体育中心河湾大酒店体育中心河湾大酒店体育中心河湾大酒店体育中心河湾大酒店体育中心河湾大酒店体育中心河湾大酒店体育中心河湾大酒店体育中心河湾大酒店体育中心河湾大酒店体育中心', 1, 1, 0, 1314789591, 1),
(3, '好的私服哈市哦对符合哦啊上的哈佛啊是大佛撒谎地方可适当加分卢卡斯京都府卢卡斯京都府啊思考的房间里凯撒的肌肤拉萨宽带', 1, 2, 0, 1314794055, 1),
(4, '空间拉升到附近拉客上的', 2, 2, 0, 1314795145, 1),
(5, '的疯狂拉升激发快乐就是地方卢卡斯地方卡拉圣诞节富利卡建设的法律框架阿斯顿飞的疯狂拉升激发快乐就是地方卢卡斯地方卡拉圣诞节富利卡建设的法律框架阿斯顿飞的疯狂拉升激发快乐就是地方卢卡斯地方卡拉圣诞节富利卡建设的法律框架阿斯顿飞的疯狂拉升激发快乐就是地方卢卡斯地方卡拉圣诞节富利卡建设的法律框架阿斯顿飞的疯狂拉升激发快乐就是地方卢卡斯地方卡拉圣诞节富利卡建设的法律框架阿斯顿飞', 3, 4, 0, 1314795188, 1),
(6, '<img alt="" src="http://127.0.0.1/playace_laputa/static/js/kindeditor/plugins/emoticons/13.gif" /><img alt="" src="http://127.0.0.1/playace_laputa/static/js/kindeditor/plugins/emoticons/19.gif" /><img alt="" src="http://127.0.0.1/playace_laputa/static/js/kindeditor/plugins/emoticons/8.gif" />', 2, 2, 0, 1314841260, 1),
(7, '浦东星河湾大酒店浦东星河湾大酒店浦东星河湾大酒店浦东星河湾大酒店浦东星河湾大酒店浦东星河湾大酒店浦东星河湾大酒店浦东星河湾大酒店浦东星河湾大酒店浦东星河湾大酒店浦东星河湾大酒店浦东星河湾大酒店浦东星河湾大酒店浦东星河湾大酒店浦东星河湾大酒店浦东星河湾大酒店浦东星河湾大酒店浦东星河湾大酒店浦东星河湾大酒店浦东星河湾大酒店浦东星河湾大酒店浦东星河湾大酒店浦东星河湾大酒店浦东星河湾大酒店浦东星河湾大酒店浦东星河湾大酒店浦东星河湾大酒店浦东星河湾大酒店浦东星河湾大酒店浦东星河湾大酒店浦东星河湾大酒店', 2, 2, 0, 1314845390, 1);

-- --------------------------------------------------------

--
-- 表的结构 `court`
--

CREATE TABLE IF NOT EXISTS `court` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '场地名',
  `court_type` varchar(15) DEFAULT NULL COMMENT '场地类型，用逗号分隔',
  `address` varchar(125) DEFAULT NULL COMMENT '地址',
  `traffic` varchar(225) DEFAULT NULL COMMENT '周边交通',
  `contact` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `area_id` int(11) DEFAULT NULL COMMENT '所属区域',
  `business_hour` varchar(50) DEFAULT NULL COMMENT '营业时间',
  `account` text COMMENT '场地介绍',
  `assessment` text NOT NULL COMMENT '玩玩评价 ',
  `thumb` varchar(225) DEFAULT NULL COMMENT '缩略图',
  `map` varchar(225) DEFAULT NULL COMMENT '场馆地图',
  `cost_table` text COMMENT '价目表',
  `price` varchar(10) DEFAULT NULL COMMENT '价格',
  `vip_price` varchar(10) DEFAULT NULL COMMENT '会员价',
  `views` int(11) DEFAULT '0' COMMENT '查看数',
  `comments` int(11) DEFAULT '0' COMMENT '评论数',
  `recommend` tinyint(2) DEFAULT '0' COMMENT '推荐指数，10-1 降序排列，0为不推荐',
  `status` tinyint(2) DEFAULT '0' COMMENT '状态，0：正常，1：冻结',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `create_uid` int(11) NOT NULL COMMENT '创建者id',
  `update_time` int(11) DEFAULT '0' COMMENT '最后更新时间',
  `update_uid` int(11) DEFAULT '0' COMMENT '最后更新者id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='场地' AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `court`
--

INSERT INTO `court` (`id`, `name`, `court_type`, `address`, `traffic`, `contact`, `area_id`, `business_hour`, `account`, `assessment`, `thumb`, `map`, `cost_table`, `price`, `vip_price`, `views`, `comments`, `recommend`, `status`, `create_time`, `create_uid`, `update_time`, `update_uid`) VALUES
(1, '星河湾大酒店体育中心', '室内，硬地', '锦绣路2588弄', '地铁7号线(锦绣路站),北蔡1路,花木1路,970路,771路,792路,184路(锦绣路高科西路）', '38929666', 8, '6:00-23:00', '它让我玩转各式运动，网球、游泳、高尔夫……在这里，我挥洒汗水，享受生活，成为运动达人。\r\n<br>\r\n<br>\r\n场地地点：锦绣路2588弄星河湾大酒店内\r\n<br>\r\n<br>\r\n<br>\r\n位于锦绣路上得星河湾大酒店体育中心是一所集合了多种体育娱乐设施的高端室内运动场地，包括了网球、游泳、高尔夫、健身、乒乓球和羽毛球等等。该场地交通较为便利，设施齐全，场地豪华，服务贴心，是享受运动的人间天堂。\r\n', '玩乐指数：五颗星<br />\r\n<br />\r\n交通指数：四颗星<br />\r\n<br />\r\n环境指数：五颗星<br />\r\n<br />\r\n价格指数：四颗星<br />\r\n<br />', '../../static/img/demoicon/星河湾.jpg', '../../static/img/court_map/xhwtyzx.png ', '<table class="ke-zeroborder" border="0" cellspacing="1" width="100%" bgcolor="#e3e3e3">\r\n<tbody>\r\n<tr>\r\n<th bgcolor="#f3f3f3" scope="col">星期</th>\r\n<th bgcolor="#f3f3f3" scope="col">时间段</th>\r\n<th bgcolor="#f3f3f3" scope="col">价格</th>\r\n<th bgcolor="#f3f3f3" scope="col">会员价</th>\r\n</tr>\r\n<tr>\r\n<td bgcolor="#ffffff" align="middle">周一~周五</td>\r\n<td bgcolor="#ffffff" align="middle">全天</td>\r\n<td bgcolor="#ffffff" align="middle">300元/小时</td>\r\n<td bgcolor="#ffffff" align="middle">200元/小时</td>\r\n</tr>\r\n<tr>\r\n<td bgcolor="#ffffff" align="middle">周末(节假日)</td>\r\n<td bgcolor="#ffffff" align="middle">全天</td>\r\n<td bgcolor="#ffffff" align="middle">300元/小时</td>\r\n<td bgcolor="#ffffff" align="middle">200元/小时</td>\r\n</tr>\r\n</tbody>\r\n</table>', '300/小时', '200/小时', 42, 1, 10, 0, 1314037804, 1, 1314777991, 1),
(2, '徐汇游泳馆', '室内，硬地', '枫林路329号', '地铁4号线,地铁7号线（东安路站),733路,932路（斜土路东安路),326路,303路 ,徐闵夜宵线（枫林路斜土路）,隧道夜宵一线（斜土路枫林路站）', '64164838', 4, '7:00-22:00', '徐汇游泳馆：回味运动的殿堂<br>\r\n\r\n它让我感受运动生生不息的魅力……在这里，我领悟体育的精神，让运动成为我的生活方式。\r\n<br>\r\n场地地点：枫林路零陵路\r\n<br>\r\n玩乐指数：四颗星<br>\r\n交通指数：五颗星<br>\r\n环境指数：四颗星<br>\r\n价格指数：四颗星<br>\r\n\r\n位于枫林路零陵路上得徐汇游泳馆是一所集游泳与网球等多种体育活动的优质室内运动场地。该当地位于黄金地段，交通便利。同时设施优良，性价比较高，是享受运动的绝佳选择。\r\n\r\n', '', '../../static/img/demoicon/徐汇.jpg', '../../static/img/court_map/xhyyg.png', '<table style="width:100%;" class="ke-zeroborder" border="0" cellspacing="1">\r\n<tbody>\r\n<tr>\r\n<th bgcolor="#f3f3f3" scope="col">星期</th>\r\n<th bgcolor="#f3f3f3" scope="col">时间段</th>\r\n<th bgcolor="#f3f3f3" scope="col">价格</th>\r\n<th bgcolor="#f3f3f3" scope="col">会员价</th>\r\n</tr>\r\n<tr>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">周一~周五</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">15点之前</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">120元/小时</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">120元/小时</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p align="center">周一~周五</p>\r\n</td>\r\n<td>\r\n<p align="center">15点之后</p>\r\n</td>\r\n<td>\r\n<p align="center">160元/小时</p>\r\n</td>\r\n<td>\r\n<p align="center">160元/小时</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">周末(节假日)</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">全天</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">160元/小时</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">160元/小时</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', '160元/小时', '160元/小时', 29, 1, 9, 0, 1314038566, 1, 1314778021, 1),
(3, '金地格林', '室内，室外，硬地', '塔城路556弄32号', '地铁11号线（嘉定西站）,安菊线,嘉葛线 嘉定5路路,嘉松线 ,嘉黄专线（塔城路户宜公路）', '59129857', 13, '8:00-22:00', '金地格林：征服运动的沙场\r\n\r\n它带我领略体育的纯粹与刺激……在这里，我心无旁骛地追求运动的乐趣，在喧嚣的城市生活中，寻得片刻的宁静\r\n\r\n场地地点：塔城路556弄32号\r\n\r\n玩乐指数：四颗星\r\n交通指数：两颗星\r\n环境指数：四颗星\r\n价格指数：四颗星\r\n\r\n位于塔城路上的金地格林，是一处设施优良的室内网球运动场地。该场地虽地处偏远，但环境优美，远离城市的喧嚣，性价比较高。是一个抛开烦恼，全身心投入运动的好地方。\r\n', '', '../../static/img/demoicon/金地格林.jpg', '../../static/img/court_map/jdgl.png', '<table style="width:100%;" class="ke-zeroborder" border="0" cellspacing="1">\r\n<tbody>\r\n<tr>\r\n<th bgcolor="#f3f3f3" scope="col">星期</th>\r\n<th bgcolor="#f3f3f3" scope="col">时间段</th>\r\n<th bgcolor="#f3f3f3" scope="col">价格</th>\r\n<th bgcolor="#f3f3f3" scope="col">会员价</th>\r\n</tr>\r\n<tr>\r\n<td bgcolor="#ffffff" align="middle">周一~周五</td>\r\n<td bgcolor="#ffffff" align="middle">开灯前</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p>100元/小时（室内）</p>\r\n<p>50元/小时（室外）</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p>100元/小时（室内）</p>\r\n<p>50元/小时（室外）</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p align="center">周一~周五</p>\r\n</td>\r\n<td>\r\n<p align="center">开灯后</p>\r\n</td>\r\n<td>\r\n<p align="center">120元/小时（室内）</p>\r\n<p align="center">70元/小时（室外）</p>\r\n</td>\r\n<td>\r\n<p align="center">&nbsp;120元/小时（室内）</p>\r\n<p align="center">70元/小时（室外）</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td bgcolor="#ffffff" align="middle">周末(节假日)</td>\r\n<td bgcolor="#ffffff" align="middle">开灯前</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p>120元/小时（室内）</p>\r\n<p>60元/小时（室外）</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p>120元/小时（室内）</p>\r\n<p>60元/小时（室外）</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p align="center">周末(节假日)</p>\r\n</td>\r\n<td>\r\n<p align="center">开灯后</p>\r\n</td>\r\n<td>\r\n<p align="center">140元/小时(室内）</p>\r\n<p align="center">80元/小时（室外）</p>\r\n</td>\r\n<td>\r\n<p align="center">140元/小时(室内）</p>\r\n<p align="center">80元/小时（室外）</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', '120元/小时', '120元/小时', 2, 0, 0, 0, 1314039362, 1, 1314778037, 1),
(4, '上海市体育运动学校', '室外，硬地', '水电路176号', '地铁3号线,地铁8号线（虹口足球场站）,140路（水电路广中路）,70路（虹口足球场),933路（中山北一路花园路）,817路（中山北路花园路）,966路（中山北一路同心路）', '56631555', 2, '8:00-22:00 ', '少体校：玩转运动的乐园\r\n\r\n它让我置身运动的欢乐海洋……在这里，我以最小的付出，换回无尽的快乐，在汗水激昂中寻回年少时的轻狂。\r\n\r\n场地地点：水电路176号\r\n\r\n玩乐指数：四颗星\r\n交通指数：四颗星\r\n环境指数：三颗星\r\n价格指数：五颗星\r\n\r\n位于虹口足球场附近的少体校体育中心，是一处涵盖了多种运动设施的综合性运动场馆。该场地地理位置优越，附近体育文化氛围浓厚，且价廉物美，是休闲运动的好去处。\r\n\r\n', '', '../../static/img/demoicon/少体校.jpg', '../../static/img/court_map/stx.png', '<table style="width:100%;" class="ke-zeroborder" border="0" cellspacing="1">\r\n<tbody>\r\n<tr>\r\n<div align="center"></div>\r\n<th bgcolor="#f3f3f3" scope="col">星期</th>\r\n<div></div>\r\n<div align="center"></div>\r\n<th bgcolor="#f3f3f3" scope="col">时间段</th>\r\n<div></div>\r\n<div align="center"></div>\r\n<th bgcolor="#f3f3f3" scope="col">价格</th>\r\n<div></div>\r\n<div align="center"></div>\r\n<th bgcolor="#f3f3f3" scope="col">会员价</th>\r\n<div></div>\r\n</tr>\r\n<tr>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">周一~周五</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">白天</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">25元/小时</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">25元/小时</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p align="center">周一~周五</p>\r\n</td>\r\n<td>\r\n<p align="center">晚上</p>\r\n</td>\r\n<td>\r\n<p align="center">40元/小时&nbsp;</p>\r\n</td>\r\n<td>\r\n<p align="center">40元/小时</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">周末(节假日)</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">白天</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">30元/小时</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">30元/小时</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p align="center">周末(节假日)</p>\r\n</td>\r\n<td>\r\n<p align="center">晚上</p>\r\n</td>\r\n<td>\r\n<p align="center">50元/小时</p>\r\n</td>\r\n<td>\r\n<p align="center">&nbsp;50元/小时</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', '50元/小时', '50元/小时', 2, 0, 0, 0, 1314039380, 1, 1314778049, 1),
(5, '东亚体育中心', '室外，室内，硬地', '天钥桥路666号', '地铁1号线,地铁4号线（上海体育馆站）,808路,89路（上海体育馆,824路（漕溪北路裕德路）,111路,92路（上海体育场）', '64266666', 4, '6:00-22:00', '东亚体育中心：畅享运动的嘉年华\r\n\r\n它让我感受极致的运动氛围……在这里，我寻得志同道合的朋友，于灯火辉煌中，体会运动的无限魅力。\r\n\r\n场地地点：天钥桥路666号\r\n\r\n玩乐指数：五颗星\r\n交通指数：四颗星\r\n环境指数：四颗星\r\n价格指数：四颗星\r\n\r\n位于上海体育场附近的东亚体育中心，是一处运动项目丰富的综合性半室内运动场地。该场地地处上海黄金地段，交通非常便利。同时极高的运动氛围也是这里的优势所在。并且，该场地设施优良，价格合理，是运动爱好者的绝佳去处。\r\n', '', '../../static/img/demoicon/东亚.jpg', '../../static/img/court_map/dytyzx.png', '<table style="width:100%;" class="ke-zeroborder" border="0" cellspacing="1">\r\n<tbody>\r\n<tr>\r\n<div align="center"></div>\r\n<th bgcolor="#f3f3f3" scope="col">星期</th>\r\n<div></div>\r\n<div align="center"></div>\r\n<th bgcolor="#f3f3f3" scope="col">时间段</th>\r\n<div></div>\r\n<div align="center"></div>\r\n<th bgcolor="#f3f3f3" scope="col">价格</th>\r\n<div></div>\r\n<div align="center"></div>\r\n<th bgcolor="#f3f3f3" scope="col">会员价</th>\r\n<div></div>\r\n</tr>\r\n<tr>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">周一~周五</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">6点至8点</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p>40元/小时（室内）</p>\r\n<p>30元/小时（室外）</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p>40元/小时（室内）</p>\r\n<p>30元/小时（室外）</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p align="center">周一~周五</p>\r\n</td>\r\n<td>\r\n<p align="center">8点至开灯前</p>\r\n</td>\r\n<td>\r\n<p align="center">50元/小时（室内）</p>\r\n<p align="center">40元/小时（室外）</p>\r\n</td>\r\n<td>\r\n<p align="center">50元/小时（室内）</p>\r\n<p align="center">40元/小时（室外）</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p align="center">周一~周五</p>\r\n</td>\r\n<td>\r\n<p align="center">8点至开灯后</p>\r\n</td>\r\n<td>\r\n<p align="center">100元/小时（室内）</p>\r\n<p align="center">60元/小时（室外）</p>\r\n</td>\r\n<td>\r\n<p align="center">100元/小时（室内）</p>\r\n<p align="center">60元/小时（室外）</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">周末(节假日)</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">6点至8点</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">50元/小时（室内）</p>\r\n<p align="center">40元/小时（室外）</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">50元/小时（室内）</p>\r\n<p align="center">40元/小时（室外）</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p align="center">周末(节假日)</p>\r\n</td>\r\n<td>\r\n<p align="center">8点至开灯前</p>\r\n</td>\r\n<td>\r\n<p align="center">80元/小时（室内）</p>\r\n<p align="center">60元/小时（室外）</p>\r\n</td>\r\n<td>\r\n<p align="center">80元/小时（室内）</p>\r\n<p align="center">60元/小时（室外）</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p align="center">周末(节假日)</p>\r\n</td>\r\n<td>\r\n<p align="center">8点至开灯后</p>\r\n</td>\r\n<td>\r\n<p align="center">120元/小时（室内）</p>\r\n<p align="center">80元/小时（室外）</p>\r\n</td>\r\n<td>\r\n<p align="center">120元/小时（室内）</p>\r\n<p align="center">80元/小时（室外）</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', '100元/小时', '100元/小时', 10, 0, 0, 0, 1314039407, 1, 1314778175, 1),
(6, '东江体育中心', '室外，硬地', '浦明路1888号', '地铁4号线（塘桥站）,浦卫线,浦卫专线,塘川线（浦建路浦东南路),818路（浦东南路浦建路）', '61096002', 8, '06:30-11:30', '东江体育中心：享受运动的避风港\r\n\r\n它让我享受运动与美景的完美结合……在这里，我既能尽情挥洒汗水，又能欣赏江边美景，动静皆宜。\r\n玩乐指数：五颗星\r\n交通指数：三颗星\r\n环境指数：五颗星\r\n价格指数：四颗星\r\n\r\n场地地点：浦东新区浦明路1888号东江高尔夫球俱乐部\r\n\r\n位于南浦大桥下的东江体育中心，是一所设施齐全，环境优美的综合性运动场地。该场地地理位置优越，夜景优美。而齐全的设施，贴心的服务，使得运动爱好者可以尽情享受包括高尔夫、网球、游泳等等在内的一系列运动的乐趣。\r\n', '', '../../static/img/demoicon/东江.jpg', '../../static/img/court_map/djtyzx.png', '<table style="width:100%;" class="ke-zeroborder" border="0" cellspacing="1">\r\n<tbody>\r\n<tr>\r\n<th bgcolor="#f3f3f3" scope="col">星期</th>\r\n<th bgcolor="#f3f3f3" scope="col">时间段</th>\r\n<th bgcolor="#f3f3f3" scope="col">价格</th>\r\n<th bgcolor="#f3f3f3" scope="col">会员价</th>\r\n</tr>\r\n<tr>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">周一~周五</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">15点之前</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">80元/小时</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">80元/小时</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p align="center">周一~周五</p>\r\n</td>\r\n<td>\r\n<p align="center">15点之后</p>\r\n</td>\r\n<td>\r\n<p align="center">100元/小时</p>\r\n</td>\r\n<td>\r\n<p align="center">100元/小时</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">周末(节假日)</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">10点至21点</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">300元/小时</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">200元/小时</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p align="center">周末(节假日)</p>\r\n</td>\r\n<td>\r\n<p align="center">其余时间</p>\r\n</td>\r\n<td>\r\n<p align="center">100元/小时</p>\r\n</td>\r\n<td>\r\n<p align="center">100元/小时</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', '100元/小时', '100元/小时', 1, 0, 0, 0, 1314039448, 1, 1314778204, 1),
(7, '曲阳公园网球场', '室外，硬地', '东体育会路980号', '地铁3号线（大柏树站，赤峰路站）,723路（中山北二路曲阳路）,933路（中山北二路伊敏河路),829路（东体育会路甘河路）,100路,746路（曲阳路中山北二路）', '55385555', 2, '7：00-22：00', '曲阳公园网球场：能打网球的后花园\r\n\r\n它让我领悟网球的吸引力……在这里，我于一片鸟语花香之间，尽情挥舞手中的球拍，在网球来回间感受快乐与宁静。\r\n\r\n玩乐指数：三颗星\r\n交通指数：四颗星\r\n环境指数：五颗星\r\n价格指数：四颗星\r\n\r\n场地地点东体育会路980号曲阳公园内\r\n\r\n位于曲阳公园内的网球场，是一所以网球运动为主的专业性运动场地。该场地地理位置优越，环境优美，非常适宜运动。场地设施优良，且性价比较高，是运动健身的好去处。\r\n', '', '../../static/img/demoicon/曲阳.jpg', '../../static/img/court_map/qugy.png', '<table style="width:100%;" class="ke-zeroborder" border="0" cellspacing="1">\r\n<tbody>\r\n<tr>\r\n<th bgcolor="#f3f3f3" scope="col">星期</th>\r\n<th bgcolor="#f3f3f3" scope="col">时间段</th>\r\n<th bgcolor="#f3f3f3" scope="col">价格</th>\r\n<th bgcolor="#f3f3f3" scope="col">会员价</th>\r\n</tr>\r\n<tr>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">周一~周五</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">7点至17点</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">50元/小时</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">50元/小时</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p align="center">周一~周五</p>\r\n</td>\r\n<td>\r\n<p align="center">17点至21点</p>\r\n</td>\r\n<td>\r\n<p align="center">60元/小时</p>\r\n</td>\r\n<td>\r\n<p align="center">60元/小时</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">周末(节假日)</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">7点至17点</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">60元/小时</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">60元/小时</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p align="center">周末(节假日)</p>\r\n</td>\r\n<td>\r\n<p align="center">17点至21点</p>\r\n</td>\r\n<td>\r\n<p align="center">70元/小时</p>\r\n</td>\r\n<td>\r\n<p align="center">70元/小时</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', '60元/小时', '50元/小时', 1, 0, 0, 0, 1314039466, 1, 1314778224, 1),
(8, '张江药谷体育中心', '室内，硬地', '哈雷路899号', '地铁2号线（金科路站）,张江南环线（哈雷路高科中路）,徐川专线（钓鱼桥）,张江有轨电车1路（哥白尼路李冰路),188路（蔡伦路爱迪生路）', '58559988', 8, '08:00--22：00', '张江药谷体育中心：幽静药谷的运动场\r\n\r\n它让我明白运动的真谛……在这里，我练就强健的体魄，享受生活的乐趣，在繁忙的工作之余给自己一个放松的机会。\r\n\r\n玩乐指数：五颗星\r\n交通指数：三颗星\r\n环境指数：四颗星\r\n价格指数：四颗星\r\n\r\n场地地点：哈雷路899号\r\n\r\n上海张江药谷健身中心是一座位于张江高科技园区内，汇集健身、运动、休闲、娱乐等多项功能的开放型体育中心。目前，室内外运动场馆包括温水游泳馆、羽毛球馆、半封闭式网球场、篮球场、排球场、乒乓球室、台球室等一流的体育设施。该场地虽地处偏远，但性价比很高，环境良好，是一个在宁静中享受运动乐趣的好地方。\r\n', '', '../../static/img/demoicon/药谷.jpg', '../../static/img/court_map/zjyg.png', '<table style="width:100%;" class="ke-zeroborder" border="0" cellspacing="1">\r\n<tbody>\r\n<tr>\r\n<div align="center"></div>\r\n<th bgcolor="#f3f3f3" scope="col">星期</th>\r\n<div></div>\r\n<div align="center"></div>\r\n<th bgcolor="#f3f3f3" scope="col">时间段</th>\r\n<div></div>\r\n<div align="center"></div>\r\n<th bgcolor="#f3f3f3" scope="col">价格</th>\r\n<div></div>\r\n<div align="center"></div>\r\n<th bgcolor="#f3f3f3" scope="col">会员价</th>\r\n<div></div>\r\n</tr>\r\n<tr>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">周一~周五</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">8点至17点</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">50元/小时</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">50元/小时</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p align="center">周一~周五</p>\r\n</td>\r\n<td>\r\n<p align="center">17点至22点</p>\r\n</td>\r\n<td>\r\n<p align="center">80元/小时</p>\r\n</td>\r\n<td>\r\n<p align="center">80元/小时</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">周末(节假日)</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">8点至17点</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">60元/小时</td>\r\n<td bgcolor="#ffffff" align="middle">60元/小时</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p align="center">周末(节假日)</p>\r\n</td>\r\n<td>\r\n<p align="center">17点至22点</p>\r\n</td>\r\n<td>\r\n<p align="center">80元/小时</p>\r\n</td>\r\n<td>\r\n<p align="center">80元/小时</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', '80元/小时', '80元/小时', 6, 0, 7, 0, 1314039480, 1, 1314778269, 1),
(9, '回民中学网球场', '室内，硬地', '沪太路1000号', '地铁7号线（大华三路站）,地铁1号线（延长路站）,地铁3号线,地铁4号线（上海站站）,185路,974路,959路,963路,58路,332路（沪太路宜川路）', '56615635', 3, '8:00-22:00', '回民中学网球场：网球时光机\r\n\r\n它让我领会运动的纯粹……在这里，我仿佛回到学生时代，在一片静谧中尽享网球的乐趣。\r\n\r\n玩乐指数：三颗星\r\n交通指数：四颗星\r\n环境指数：五颗星\r\n价格指数：四颗星\r\n\r\n场地地点：普陀区沪太路1000号\r\n\r\n位于回民中学内的该场地，是一个以网球运动为主的专业性运动场馆。该场地室内室外兼具，环境优美，闹中取静，私密性较好，非常适合运动爱好者在繁忙的工作之余享受运动带来的激情与纯粹。\r\n', '', '../../static/img/demoicon/回民.jpg', '../../static/img/court_map/xhhmzx.png', '<table style="width:100%;" class="ke-zeroborder" border="0" cellspacing="1">\r\n<tbody>\r\n<tr>\r\n<th bgcolor="#f3f3f3" scope="col">星期</th>\r\n<th bgcolor="#f3f3f3" scope="col">时间段</th>\r\n<th bgcolor="#f3f3f3" scope="col">价格</th>\r\n<th bgcolor="#f3f3f3" scope="col">会员价</th>\r\n</tr>\r\n<tr>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">周一~周五</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">17点之前</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">100元/小时（室内）</p>\r\n<p align="center">40元/小时（室外）</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">100元/小时（室内）</p>\r\n<p align="center">40元/小时（室外）</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p align="center">周一~周五</p>\r\n</td>\r\n<td>\r\n<p align="center">17点之后</p>\r\n</td>\r\n<td>\r\n<p align="center">120元/小时（室内）</p>\r\n<p align="center">50元/小时（室外）</p>\r\n</td>\r\n<td>\r\n<p align="center">120元/小时（室内）</p>\r\n<p align="center">50元/小时（室外）</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">周末(节假日)</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">17点之前</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">100元/小时（室内） </p>\r\n<p align="center">40元/小时（室外）</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">100元/小时（室内） </p>\r\n<p align="center">40元/小时（室外）</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p align="center">周末(节假日)</p>\r\n</td>\r\n<td>\r\n<p align="center">17点之后</p>\r\n</td>\r\n<td>\r\n<p align="center">&nbsp;100元/小时（室内） </p>\r\n<p align="center">40元/小时（室外）</p>\r\n</td>\r\n<td>\r\n<p align="center">100元/小时（室内） </p>\r\n<p align="center">40元/小时（室外）</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', '120元/小时', '120元/小时', 1, 0, 0, 0, 1314039492, 1, 1314778282, 1),
(10, '新时空国际网球场', '室内，硬地', '汇川路99号8楼', '地铁3号线（中山公园站）,地铁4号线（中山公园站）地铁2号线,（江苏路站）,941路,737路,54路,946路,947路,519路（中山公园）', '52729262', 6, '10:00-22:00', '新时空国际网球场：摩天楼也能打网球\r\n\r\n它让我在摩天大楼间找到属于运动的角落……在这里，我享受高品质的网球活动，在球网边结交志同道合的好友。\r\n\r\n玩乐指数：四颗星\r\n交通指数：五颗星\r\n环境指数：四颗星\r\n价格指数：四颗星\r\n\r\n场地地点：汇川路99号8楼\r\n\r\n位于新时空国际商务广场内的新时空国际网球场，是一处以网球运动为主的专业性运动场馆。该场地位于中山公园商圈内，交通便利。同时，该场地条件较好，服务优质，是追求高品质活动的绝佳去处。\r\n\r\n', '', '../../static/img/demoicon/新时空.jpg', '../../static/img/court_map/xtx.png', '<table style="width:100%;" class="ke-zeroborder" border="0" cellspacing="1">\r\n<tbody>\r\n<tr>\r\n<th bgcolor="#f3f3f3" scope="col">星期</th>\r\n<th bgcolor="#f3f3f3" scope="col">时间段</th>\r\n<th bgcolor="#f3f3f3" scope="col">价格</th>\r\n<th bgcolor="#f3f3f3" scope="col">会员价</th>\r\n</tr>\r\n<tr>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">周一~周五</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">10点至20点</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">200元/小时</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">200元/小时</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p align="center">周一~周五</p>\r\n</td>\r\n<td>\r\n<p align="center">20点至22点</p>\r\n</td>\r\n<td>\r\n<p align="center">300元/小时</p>\r\n</td>\r\n<td>\r\n<p align="center">300元/小时</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">周末(节假日)</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">全天</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">300元/小时</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">300元/小时</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', '300元/小时', '300元/小时', 6, 0, 0, 0, 1314039503, 1, 1314778295, 1),
(11, '闸北网球馆', '室内，硬地', '广延路417号', '地铁1号线（上海马戏城站),107路（广延路大宁路）,944路 （广延路广中路),547路,767路,222路（广中路平型关路),862路（广中路共和新路）', '56385281', 10, '07:00--22:00', '闸北网球馆：一路向北打网球\r\n\r\n它让我体会网球的魅力……在这里，我与伙伴们挥洒汗水，尽享乐趣，并随着网球的穿梭，\r\n加深彼此的友谊。\r\n\r\n玩乐指数：四颗星\r\n交通指数：四颗星\r\n环境指数：四颗星\r\n价格指数：四颗星\r\n\r\n场地地点广延路417号\r\n\r\n位于广延路上的闸北网球馆，是一处以网球运动为主的专业性运动场馆。该场地室内室外兼具，场地条件较好，性价比较高，适合网球爱好者活动使用。\r\n', '', '../../static/img/demoicon/闸北.jpg', '../../static/img/court_map/zbwqg.png', '<table class="ke-zeroborder" border="0" cellspacing="1" width="100%" bgcolor="#e3e3e3">\r\n<tbody>\r\n<tr>\r\n<th bgcolor="#f3f3f3" scope="col">星期</th>\r\n<th bgcolor="#f3f3f3" scope="col">时间段</th>\r\n<th bgcolor="#f3f3f3" scope="col">价格</th>\r\n<th bgcolor="#f3f3f3" scope="col">会员价</th>\r\n</tr>\r\n<tr>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">周一~周五</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">7点至12点</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">60元/小时</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">60元/小时</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p align="center">&nbsp;周一~周五</p>\r\n</td>\r\n<td>\r\n<p align="center">12点至17点</p>\r\n</td>\r\n<td>\r\n<p align="center">80元/小时</p>\r\n</td>\r\n<td>\r\n<p align="center">80元/小时</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p align="center">&nbsp;周一~周五</p>\r\n</td>\r\n<td>\r\n<p align="center">17点至22点</p>\r\n</td>\r\n<td>\r\n<p align="center">50元/小时</p>\r\n</td>\r\n<td>\r\n<p align="center">50元/小时</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">周末(节假日)</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">7点至12点</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">80元/小时</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">80元/小时</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p align="center">周末(节假日)</p>\r\n</td>\r\n<td>\r\n<p align="center">12点至17点</p>\r\n</td>\r\n<td>\r\n<p align="center">100元/小时</p>\r\n</td>\r\n<td>\r\n<p align="center">100元/小时</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p align="center">周末(节假日)</p>\r\n</td>\r\n<td>\r\n<p align="center">17点至22点</p>\r\n</td>\r\n<td>\r\n<p align="center">200元/小时</p>\r\n</td>\r\n<td>\r\n<p align="center">200元/小时</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', '160元/小时', '160元/小时', 2, 0, 4, 0, 1314039513, 1, 1314778389, 1),
(12, '龙柏中心网球场', '室内，室外，硬地', '兰竹路6号', '地铁10号线支线（龙柏新村）,721路,753路（兰竹路青衫路）,57路,936路（龙柏新村）', '64029889', 7, '9:00-22:00', '龙柏中心网球场：属于网球的阳光谷\r\n\r\n它让我找到久违的运动激情……在这里，我于舒适的环境中，磨练自己的技艺，强健自己的体魄，将运动健身作为自己的人生态度。\r\n\r\n玩乐指数：四颗星\r\n交通指数：三颗星\r\n环境指数：五颗星\r\n价格指数：四颗星\r\n\r\n场地地点：兰竹路6号\r\n\r\n位于兰竹路上的龙柏中心网球场，是一处以网球运动为主的专业性运动场馆。该场馆为半室内场地，环境较好。虽然地处偏远，但性价比较好，是广大网球爱好者一个不错的选择。\r\n\r\n', '', '../../static/img/demoicon/龙柏.jpg', '../../static/img/court_map/lbzx.png', '<table style="width:100%;" class="ke-zeroborder" border="0" cellspacing="1">\r\n<tbody>\r\n<tr>\r\n<th bgcolor="#f3f3f3" scope="col">星期</th>\r\n<th bgcolor="#f3f3f3" scope="col">时间段</th>\r\n<th bgcolor="#f3f3f3" scope="col">价格</th>\r\n<th bgcolor="#f3f3f3" scope="col">会员价</th>\r\n</tr>\r\n<tr>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">周一~周五</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">开灯前</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">70元/小时（室内）</p>\r\n<p align="center">50元/小时（室外）</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">70元/小时（室内）</p>\r\n<p align="center">50元/小时（室外）</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p align="center">周一~周五</p>\r\n</td>\r\n<td>\r\n<p align="center">开灯后</p>\r\n</td>\r\n<td>\r\n<p align="center">90元/小时（室内）</p>\r\n<p align="center">70元/小时（室外）</p>\r\n</td>\r\n<td>\r\n<p align="center">90元/小时（室内）</p>\r\n<p align="center">70元/小时（室外）</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">周末(节假日)</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">开灯前</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">90元/小时（室内）</p>\r\n<p align="center">70元/小时（室外）</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">90元/小时（室内）</p>\r\n<p align="center">70元/小时（室外）</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p align="center">周末(节假日)</p>\r\n</td>\r\n<td>\r\n<p align="center">开灯后</p>\r\n</td>\r\n<td>\r\n<p align="center">120元/小时（室内）</p>\r\n<p align="center">90元/小时（室外）</p>\r\n</td>\r\n<td>\r\n<p align="center">120元/小时（室内）</p>\r\n<p align="center">90元/小时（室外）</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', '120元/小时', '120元/小时', 2, 0, 0, 0, 1314039529, 1, 1314778435, 1),
(13, '体育学院室外场', '室外，硬地', '长海路345号', '地铁8号线（嫩江路站),地铁10号线（江湾体育场站）,758路 ,329路,325路,817路 ,537路,842路（长海医院）', '51253330', 1, '8:00-21:00', '体育学院室外场：畅快运动的竞技场\r\n\r\n它让我体会运动竞技的魅力……在这里，我拥有最为专业的场地，最为良好氛围，尽情享受各种各样的运动。\r\n\r\n玩乐指数：五颗星\r\n交通指数：四颗星\r\n环境指数：四颗星\r\n价格指数：四颗星\r\n\r\n场地地址：长海路345号\r\n\r\n位于体育学院的该场地，是一处囊括了网球等各项运动的综合性室外场地。该场地地理位置较好，附近体育文化氛围浓厚，且性价比较高，是运动爱好者与志同道合者一起共享运动乐趣的绝佳选择。\r\n', '', '../../static/img/demoicon/体院.jpg', '../../static/img/court_map/tyxy.png', '<table style="width:100%;" class="ke-zeroborder" border="0" cellspacing="1">\r\n<tbody>\r\n<tr>\r\n<th bgcolor="#f3f3f3" scope="col">星期</th>\r\n<th bgcolor="#f3f3f3" scope="col">时间段</th>\r\n<th bgcolor="#f3f3f3" scope="col">价格</th>\r\n<th bgcolor="#f3f3f3" scope="col">会员价</th>\r\n</tr>\r\n<tr>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">周一~周五</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">开灯前</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">40元/小时</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">40元/小时</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p align="center">周一~周五</p>\r\n</td>\r\n<td>\r\n<p align="center">开灯后</p>\r\n</td>\r\n<td>\r\n<p align="center">60元/小时</p>\r\n</td>\r\n<td>\r\n<p align="center">60元/小时</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">周末(节假日)</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">开灯前</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">50元/小时</p>\r\n</td>\r\n<td bgcolor="#ffffff" align="middle">\r\n<p align="center">50元/小时</p>\r\n</td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<p align="center">周末(节假日)</p>\r\n</td>\r\n<td>\r\n<p align="center">开灯后</p>\r\n</td>\r\n<td>\r\n<p align="center">70元/小时</p>\r\n</td>\r\n<td>\r\n<p align="center">70元/小时</p>\r\n</td>\r\n</tr>\r\n</tbody>\r\n</table>', '50元/小时', '40元/小时', 8, 1, 0, 0, 1314039537, 1, 1314778451, 1);

-- --------------------------------------------------------

--
-- 表的结构 `feeds`
--

CREATE TABLE IF NOT EXISTS `feeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `type` tinyint(4) NOT NULL COMMENT '类型，0：活动，1：评论，2：预订场地',
  `title` varchar(255) NOT NULL COMMENT '活动或者评论标题',
  `party_id` int(11) NOT NULL COMMENT '活动id',
  `is_public` tinyint(4) DEFAULT '0' COMMENT '是否公开，0：公开，1：不公开',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='动态' AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `feeds`
--

INSERT INTO `feeds` (`id`, `uid`, `username`, `type`, `title`, `party_id`, `is_public`, `create_time`) VALUES
(1, 1, '徐亦星', 0, 'test 2', 2, 0, 1314795127),
(2, 3, '破碎流星', 0, 'test 2', 2, 0, 1314837858),
(3, 3, '破碎流星', 0, '他说地方看见了', 3, 0, 1314837865),
(4, 2, 'ray.xu', 0, '他说地方看见了', 3, 0, 1314838053),
(5, 2, 'ray.xu', 0, 'test 2', 2, 0, 1314838058),
(6, 1, '徐亦星', 0, 'ccccc', 5, 0, 1314838186),
(7, 1, '徐亦星', 0, '他说地方看见了', 3, 0, 1314840312),
(8, 1, '徐亦星', 0, 'asdfasdf', 4, 0, 1314840634),
(9, 3, '破碎流星', 0, 'asdfasdf', 4, 0, 1314840659),
(10, 6, 'zing', 0, 'ccccc', 5, 0, 1314840906),
(11, 6, 'zing', 0, 'asdfasdf', 4, 0, 1314840912);

-- --------------------------------------------------------

--
-- 表的结构 `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `content` varchar(500) NOT NULL COMMENT '消息内容',
  `to_uid` int(11) NOT NULL COMMENT '收件人ID',
  `inbox_status` tinyint(4) DEFAULT '0' COMMENT '收件箱状态，0：未删除，1：已删除',
  `outbox_status` tinyint(4) DEFAULT '0' COMMENT '发件箱状态，0：未删除，1：已删除',
  `status` tinyint(4) DEFAULT '0' COMMENT '短消息状态，0：未读，1：已读',
  `create_uid` int(11) NOT NULL COMMENT '创建人uid',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站内信息' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `message`
--


-- --------------------------------------------------------

--
-- 表的结构 `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `catid` int(11) NOT NULL DEFAULT '0' COMMENT '所属栏目',
  `classid` int(11) NOT NULL DEFAULT '0' COMMENT '所属类型',
  `tag` varchar(50) DEFAULT NULL COMMENT '标签（用，分割）',
  `thumb` varchar(100) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(50) DEFAULT NULL COMMENT '关键词',
  `description` varchar(500) DEFAULT NULL COMMENT '简介',
  `author_name` varchar(25) DEFAULT NULL COMMENT '作者名',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态，0：正常，1：删除',
  `url` varchar(500) DEFAULT NULL COMMENT 'URL地址',
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '查看数',
  `recommend` tinyint(2) NOT NULL DEFAULT '0' COMMENT '推荐指数，10-1 降序排列，0为不推荐',
  `comments` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_uid` int(11) NOT NULL COMMENT '创建者ID',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_uid` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新者ID',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='新闻' AUTO_INCREMENT=57 ;

--
-- 转存表中的数据 `news`
--

INSERT INTO `news` (`id`, `title`, `catid`, `classid`, `tag`, `thumb`, `keywords`, `description`, `author_name`, `status`, `url`, `views`, `recommend`, `comments`, `create_uid`, `create_time`, `update_uid`, `update_time`) VALUES
(2, '经典笑话四则', 3, 1, '', '', '', '', 'Arthur', 0, '', 1, 0, 0, 3, 1314448250, 0, 0),
(3, '乐翻了！幽默四则。', 3, 1, '', '', '', '', 'Arthur', 0, '', 3, 0, 0, 3, 1314448917, 0, 0),
(4, '本周体坛寿星8.22~8.28', 1, 1, '', '', '', '', 'Arthur', 0, '', 3, 0, 1, 3, 1314449328, 0, 0),
(6, '夏季运动如何正确补水', 5, 1, '', '', '', '', 'Arthur', 0, '', 1, 0, 0, 3, 1314449519, 0, 0),
(7, '运动后如何及时恢复减缓疲劳', 5, 1, '', '', '', '', 'Arthur', 0, '', 0, 0, 0, 3, 1314449743, 0, 0),
(8, '球类运动中如何自我保护不被球击中', 5, 1, '', '', '', '', 'Arthur', 0, '', 1, 0, 0, 3, 1314450029, 0, 0),
(9, '版块说明', 4, 1, '', '', '', '', 'Arthur', 0, '', 4, 0, 0, 3, 1314450127, 0, 0),
(16, '求详解ATP与WTA的选手个人积分是如何计算的？', 4, 1, '', '', '', '', '', 0, '', 0, 0, 0, 3, 1314450779, 0, 0),
(18, '菜鸟选手求教如何选购羽毛球球拍', 4, 1, '', '', '', '', '', 0, '', 0, 0, 0, 3, 1314450915, 0, 0),
(20, '闵行一带有什么比较好的游泳场馆？', 4, 1, '', '', '', '', '', 0, '', 0, 0, 0, 3, 1314450974, 0, 0),
(21, '求新赛季欧冠详细赛程', 4, 1, '', '', '', '', '', 0, '', 0, 0, 0, 3, 1314451106, 0, 0),
(22, '求普及高尔夫球杆的分类常识？', 4, 1, '', '', '', '', '', 0, '', 0, 0, 0, 3, 1314451152, 0, 0),
(25, '8月27日赛事预告', 2, 1, '', '', '', '', 'Arthur', 0, '', 3, 0, 0, 3, 1314451750, 0, 0),
(27, '8月28日赛事预告', 2, 1, '', '', '', '', 'Arthur', 0, '', 2, 0, 0, 3, 1314451913, 0, 0),
(28, '选择网球拍的秘籍——AMSSEFCSL标准', 6, 1, '', '', '', '', 'Arthur', 0, '', 1, 0, 0, 3, 1314452639, 0, 0),
(29, '网球拍的秘密——各项重要参数详解', 6, 1, '', '', '', '', 'Arthur', 0, '', 6, 0, 0, 3, 1314452933, 0, 0),
(31, '著名网球拍品牌大全', 6, 1, '', '', '', '', 'Arthur', 0, '', 1, 0, 0, 3, 1314453161, 0, 0),
(33, '安全与隐私', 8, 1, '', '', '', '', 'playace.net', 0, '', 1, 0, 0, 1, 1314470003, 0, 0),
(34, '登录', 8, 1, '', '', '', '', 'playace.net', 0, '', 1, 0, 0, 1, 1314470048, 0, 0),
(35, '免费注册', 8, 1, '', '', '', '', 'playace.net', 0, '', 0, 0, 0, 1, 1314470086, 0, 0),
(41, '个人中心', 8, 1, '', '', '', '', 'playace.net', 0, '', 1, 0, 0, 1, 1314470589, 0, 0),
(42, '关于凡跃', 8, 1, '', '', '', '', 'playace.net', 0, '', 1, 0, 0, 1, 1314470924, 0, 0),
(43, '联系我们', 8, 1, '', '', '', '', 'playace.net', 0, '', 1, 0, 0, 1, 1314470961, 0, 0),
(44, '招聘信息', 8, 1, '', '', '', '', 'playace.net', 0, '', 1, 0, 0, 1, 1314471072, 0, 0),
(45, '免责条款', 8, 1, '', '', '', '', 'playace.net', 0, '', 1, 0, 0, 1, 1314471104, 0, 0),
(46, '友情链接', 8, 1, '', '', '', '', 'playace.net', 0, '', 0, 0, 0, 1, 1314471276, 0, 0),
(47, '搜索场地', 8, 1, '', '', '', '', 'playace.net', 0, '', 1, 0, 0, 1, 1314471409, 0, 0),
(48, '场地区域和分类', 8, 1, '', '', '', '', 'playace.net', 0, '', 1, 0, 0, 1, 1314471426, 0, 0),
(49, '评论场地', 8, 1, '', '', '', '', 'playace.net', 0, '', 1, 0, 0, 1, 1314471450, 0, 0),
(50, '评论活动', 8, 1, '', '', '', '', 'playace.net', 0, '', 2, 0, 0, 1, 1314471591, 0, 0),
(51, '如何报名参加', 8, 1, '', '', '', '', 'playace.net', 0, '', 0, 0, 0, 1, 1314471610, 0, 0),
(52, '活动分类', 8, 1, '', '', '', '', 'playace.net', 0, '', 0, 0, 0, 1, 1314471627, 0, 0),
(53, '搜索活动', 8, 1, '', '', '', '', 'playace.net', 0, '', 1, 0, 0, 1, 1314471646, 0, 0),
(54, '什么是资讯', 8, 1, '', '', '', '', 'playace.net', 0, '', 0, 0, 0, 1, 1314471789, 0, 0),
(55, '评论资讯', 8, 1, '', '', '', '', 'playace.net', 0, '', 0, 0, 0, 1, 1314471806, 0, 0),
(56, '徐亦星', 7, 1, '', '../../static/img/news/ray.png', '', '徐亦星个人简介', 'ray', 0, '', 0, 0, 0, 1, 1314717590, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `news_data`
--

CREATE TABLE IF NOT EXISTS `news_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '和news.id同步',
  `content` text NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='新闻内容' AUTO_INCREMENT=57 ;

--
-- 转存表中的数据 `news_data`
--

INSERT INTO `news_data` (`id`, `content`) VALUES
(2, '<span style="font-size:small;font-family:宋体;"> </span><p style="margin:0cm 0cm 0pt;text-align:left;mso-pagination:widow-orphan;" class="MsoNormal" align="left"><span style="font-family:宋体;mso-bidi-font-size:10.5pt;mso-bidi-font-family:宋体;mso-font-kerning:0pt;" lang="EN-US"><span style="font-size:small;"><span style="font-size:16px;">1</span></span></span><span style="font-family:宋体;mso-bidi-font-size:10.5pt;mso-bidi-font-family:宋体;mso-font-kerning:0pt;"><span style="font-size:small;"><span style="font-size:16px;">、据说汉语等级考试是全球最难的考试之一，虽然语速很慢，但是内容真的很无语。</span></span><span lang="EN-US"><br />\r\n<span style="font-size:small;"><span style="font-size:16px;"> </span></span></span><span style="font-size:small;"><span style="font-size:16px;">举例说明：一听力短对话。</span></span><span lang="EN-US"><br />\r\n<span style="font-size:small;"><span style="font-size:16px;"> </span></span></span><span style="font-size:small;"><span style="font-size:16px;">男说：哟，今天你的牙齿好白啊。</span></span><span lang="EN-US"><br />\r\n<span style="font-size:small;"><span style="font-size:16px;"> </span></span></span><span style="font-size:small;"><span style="font-size:16px;">女说：那是假牙。</span></span><span lang="EN-US"><br />\r\n<span style="font-size:small;"><span style="font-size:16px;"> </span></span></span><span style="font-size:small;"><span style="font-size:16px;">男说：真的假的？</span></span><span lang="EN-US"><br />\r\n<span style="font-size:small;"><span style="font-size:16px;"> </span></span></span><span style="font-size:small;"><span style="font-size:16px;">女说：真的。</span></span><span lang="EN-US"><br />\r\n<span style="font-size:small;"><span style="font-size:16px;"> </span></span></span><span style="font-size:small;"><span style="font-size:16px;">问题：请问这是真牙还是假牙？</span><span lang="EN-US"><?xml:namespace prefix = o ns = "urn:schemas-microsoft-com:office:office" /><o:p></o:p></span></span></span></p>\r\n<span style="font-size:small;font-family:宋体;"><span style="font-size:16px;"> </span></span><p>&nbsp;</p>\r\n<p><span style="font-family:宋体;"><span style="font-size:16px;" lang="EN-US">2</span><span style="font-size:16px;">、昨晚喝多了，老婆不在家，吆喝女儿给我倒杯糖水解酒，女儿问：什么糖都行吗？我说行。高潮来了，几分钟后，只见女儿颤巍巍的端来了一杯水，上面漂着几片绿箭。。。。。酒意全无。。。<span lang="EN-US"><o:p></o:p></span></span></span></p>\r\n<span style="font-size:small;font-family:宋体;"><span style="font-size:16px;"> </span></span><p>&nbsp;</p>\r\n<p><span style="font-family:宋体;"><span style="font-size:16px;" lang="EN-US">3</span><span style="font-size:16px;">、本人在银行上班，管理自助存取款机，一次一个客户夜里一点给我打电话，存钱的时候钱被机器吞了，千般安慰，道歉，才安抚他，并保证第二天处理。第二天，打开机器一看，一个信封，信封里有一打钱还用皮筋绑着。<span lang="EN-US"><o:p></o:p></span></span></span></p>\r\n<span style="font-size:small;font-family:宋体;"><span style="font-size:16px;"> </span></span><p>&nbsp;</p>\r\n<p><span style="font-family:宋体;"><span style="font-size:16px;" lang="EN-US">4</span><span style="font-size:16px;">、同事的手机铃声是新闻联播的开头曲。一日，午饭后没多久，他手机响了，我噌的一下就站了起来，大叫一声：<span style="font-size:16px;" lang="EN-US">MD</span>！又加班到<span style="font-size:16px;" lang="EN-US">7</span>点了！这不是高潮，高潮是老板从他办公室出来，提着包，急冲冲的走向电梯，边走还边说：都<span style="font-size:16px;" lang="EN-US">7</span>点了，怎么幼儿园的老师都不给打电话让我去接孩子？<span lang="EN-US"><o:p></o:p></span></span></span></p>\r\n<span style="font-size:small;font-family:宋体;"> </span>'),
(3, '<span style="font-size:small;font-family:宋体;"> </span><p><span style="font-size:10.5pt;" lang="EN-US"><span style="font-family:宋体;"><span style="font-size:18px;">1</span></span></span><span style="font-size:10.5pt;"><span style="font-family:宋体;"><span style="font-size:18px;">、八戒来到高老庄。高老头早已摆下宴席，宴请亲朋好友，为女婿接风。八戒喝得酩酊大醉，由人扶回房去。刚进了屋，却听得门外有人说话。</span><span style="font-size:18px;" lang="EN-US">“</span><span style="font-size:18px;">高老，你这个妖怪女婿如此丑陋，你把他招回来了？不是自讨苦吃吗？</span></span><span style="font-family:宋体;"><span style="font-size:18px;" lang="EN-US">” <br />\r\n</span><span style="font-size:18px;">高老头道：</span><span style="font-size:18px;" lang="EN-US">“</span><span style="font-size:18px;">现在家里养头猪，顶个暴发户啊。</span><span style="font-size:18px;" lang="EN-US">”<?xml:namespace prefix = o ns = "urn:schemas-microsoft-com:office:office" /><o:p></o:p></span></span></span></p>\r\n<span style="font-size:small;font-family:宋体;"><span style="font-size:18px;"> </span></span><p>&nbsp;</p>\r\n<p><span style="font-family:宋体;"><span style="font-size:18px;" lang="EN-US">2</span><span style="font-size:18px;">、一美女去买衣服。 美女问男老板：<span style="font-size:18px;" lang="EN-US">“</span>请问这件衣服多少钱？<span style="font-size:18px;" lang="EN-US">” </span>男老板色迷迷的说：<span style="font-size:18px;" lang="EN-US">“</span>我们这里消费不要钱，但是一件衣服需要一个吻。<span style="font-size:18px;" lang="EN-US">” </span>美女听后，很高兴的挑选了很多件衣服。\r\n结账时，美女指了指旁边，对男老板说：<span style="font-size:18px;" lang="EN-US">“</span>我奶奶付款。<span style="font-size:18px;" lang="EN-US">”<o:p></o:p></span></span></span></p>\r\n<span style="font-size:small;font-family:宋体;"><span style="font-size:18px;"> </span></span><p>&nbsp;</p>\r\n<p><span style="font-family:宋体;"><span style="font-size:18px;" lang="EN-US">3</span><span style="font-size:18px;">、<span style="font-size:18px;" lang="EN-US">A</span>：为什么你每次都是打<span style="font-size:18px;" lang="EN-US">- - </span>而不是打<span style="font-size:18px;" lang="EN-US">= =</span>？<span style="font-size:18px;" lang="EN-US"> B</span>：因为我是单眼皮<span style="font-size:18px;" lang="EN-US">…… A</span>：那么一单一双是不是要打<span style="font-size:18px;" lang="EN-US">- = </span>？假睫毛不就 山<span style="font-size:18px;" lang="EN-US">_</span>山 ？美曈加强版：美瞳前。<span style="font-size:18px;" lang="EN-US">_&nbsp; </span>。美曈后<span style="font-size:18px;" lang="EN-US"> ◎_◎ </span>还有卸妆前<span style="font-size:18px;" lang="EN-US">O_O </span>卸妆后<span style="font-size:18px;" lang="EN-US">o_o<o:p></o:p></span></span></span></p>\r\n<span style="font-size:small;font-family:宋体;"><span style="font-size:18px;"> </span></span><p>&nbsp;</p>\r\n<p><span style="font-size:10.5pt;" lang="EN-US"><span style="font-family:宋体;"><span style="font-size:18px;">4</span></span></span><span style="font-size:10.5pt;"><span style="font-family:宋体;"><span style="font-size:18px;">、某人很喜欢吃素包子。一天去买包子的时候发现涨价了，就问老板：</span><span style="font-size:18px;" lang="EN-US">“</span><span style="font-size:18px;">怎么包子涨价了？</span></span><span style="font-family:宋体;"><span style="font-size:18px;" lang="EN-US">”<br />\r\n</span><span style="font-size:18px;">老板说：</span><span style="font-size:18px;" lang="EN-US">“</span><span style="font-size:18px;">因为肉价涨了。</span></span><span style="font-family:宋体;"><span style="font-size:18px;" lang="EN-US">”<br />\r\n</span><span style="font-size:18px;">这个人就问：</span><span style="font-size:18px;" lang="EN-US">“</span><span style="font-size:18px;">肉涨价，素包子为什么要涨价啊？</span></span><span style="font-family:宋体;"><span style="font-size:18px;" lang="EN-US">”<br />\r\n</span><span style="font-size:18px;">老板哈哈大笑：</span><span style="font-size:18px;" lang="EN-US">“</span><span style="font-size:18px;">做包子的大师傅他要吃肉啊！</span><span style="font-size:18px;" lang="EN-US">”<o:p></o:p></span></span></span></p>\r\n<span style="font-size:small;font-family:宋体;"> </span>'),
(4, '<span style="font-size:small;font-family:宋体;"> </span><span style="font-family:宋体;"><span style="font-size:small;"> </span><p style="margin:0cm 0cm 0pt;text-align:center;" class="MsoNormal" align="center"><span style="font-size:small;"><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">本周体坛寿星（</span><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">8</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">月</span><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">22</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">日）</span><span lang="EN-US"><?xml:namespace prefix = o ns = "urn:schemas-microsoft-com:office:office" /><o:p></o:p></span></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:left;" class="MsoNormal" align="left"><span lang="EN-US"><o:p><span style="font-size:small;font-family:Calibri;"><span style="font-size:18px;">&nbsp;</span></span></o:p></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:left;" class="MsoNormal" align="left"><span style="font-size:small;"><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">1991</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">年</span><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">——</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">马切达，意大利足球运动员。</span><span lang="EN-US"><o:p></o:p></span></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:left;" class="MsoNormal" align="left"><span lang="EN-US"><o:p><span style="font-size:small;font-family:Calibri;"><span style="font-size:18px;">&nbsp;</span></span></o:p></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:center;" class="MsoNormal" align="center"><span style="font-size:small;"><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">本周体坛寿星（</span><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">8</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">月</span><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">23</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">日）</span><span lang="EN-US"><o:p></o:p></span></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:left;" class="MsoNormal" align="left"><span lang="EN-US"><o:p><span style="font-size:small;font-family:Calibri;"><span style="font-size:18px;">&nbsp;</span></span></o:p></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:left;" class="MsoNormal" align="left"><span style="font-size:small;"><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">1971</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">年</span><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;"> ——阿尔贝蒂尼</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">，意大利足球运动员</span><span lang="EN-US"><o:p></o:p></span></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:left;" class="MsoNormal" align="left"><span lang="EN-US"><o:p><span style="font-size:small;font-family:Calibri;"><span style="font-size:18px;">&nbsp;</span></span></o:p></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:center;" class="MsoNormal" align="center"><span style="font-size:small;"><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">本周体坛寿星（</span><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">8</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">月</span><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">24</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">日）</span><span lang="EN-US"><o:p></o:p></span></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:left;" class="MsoNormal" align="left"><span lang="EN-US"><o:p><span style="font-size:small;font-family:Calibri;"><span style="font-size:18px;">&nbsp;</span></span></o:p></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:left;" class="MsoNormal" align="left"><span style="font-size:small;"><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">1965</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">年</span><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">——雷吉</span><span style="font-family:宋体;font-size:18px;mso-ascii-theme-font:minor-fareast;mso-fareast-theme-font:minor-fareast;mso-hansi-theme-font:minor-fareast;mso-bidi-font-size:11.0pt;mso-bidi-font-family:"Times New Roman";mso-bidi-theme-font:minor-bidi;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;">·</span><span style="font-size:18px;">米勒</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">，美国</span><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">NBA</span></span></span><span style="font-size:18px;">球员。<o:p></o:p></span></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:left;" class="MsoNormal" align="left"><span lang="EN-US"><o:p><span style="font-size:small;font-family:Calibri;"><span style="font-size:18px;">&nbsp;</span></span></o:p></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:left;" class="MsoNormal" align="left"><span style="font-size:small;"><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">1977</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">年</span><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">——</span></span><span style="color:windowtext;font-family:宋体;text-decoration:none;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;text-underline:none;" lang="EN-US"><span style="font-size:18px;" lang="EN-US">德</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">尼尔森，巴西足球运动员。</span><span lang="EN-US"><o:p></o:p></span></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:left;" class="MsoNormal" align="left"><span lang="EN-US"><o:p><span style="font-size:small;font-family:Calibri;"><span style="font-size:18px;">&nbsp;</span></span></o:p></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:left;" class="MsoNormal" align="left"><span lang="EN-US"><span style="font-size:small;"><span style="color:windowtext;text-decoration:none;text-underline:none;"><span style="font-family:Calibri;"><span style="font-size:18px;">1982</span></span></span><span style="color:windowtext;font-family:宋体;text-decoration:none;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;text-underline:none;" lang="EN-US"><span style="font-size:18px;" lang="EN-US">年</span></span></span><span style="font-size:small;font-family:Calibri;"><span style="font-size:18px;">——</span></span><span style="color:windowtext;font-family:宋体;text-decoration:none;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;text-underline:none;" lang="EN-US"><span lang="EN-US"><span style="font-size:small;"><span style="font-size:18px;">博辛瓦</span></span></span></span></span><span style="font-size:small;"><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">，葡萄牙足球运动员。</span><span lang="EN-US"><o:p></o:p></span></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:left;" class="MsoNormal" align="left"><span lang="EN-US"><o:p><span style="font-size:small;font-family:Calibri;"><span style="font-size:18px;">&nbsp;</span></span></o:p></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:center;" class="MsoNormal" align="center"><span style="font-size:small;"><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">本周体坛寿星（</span><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">8</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">月</span><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">26</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">日）</span><span lang="EN-US"><o:p></o:p></span></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:left;" class="MsoNormal" align="left"><span lang="EN-US"><o:p><span style="font-size:small;font-family:Calibri;"><span style="font-size:18px;">&nbsp;</span></span></o:p></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:left;" class="MsoNormal" align="left"><span style="font-size:small;"><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">1964</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">年</span><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">——</span></span><span style="color:windowtext;font-family:宋体;text-decoration:none;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;text-underline:none;" lang="EN-US"><span style="font-size:18px;" lang="EN-US">马晓春</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">，中国围棋棋手。</span><span lang="EN-US"><o:p></o:p></span></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:left;" class="MsoNormal" align="left"><span lang="EN-US"><o:p><span style="font-size:small;font-family:Calibri;"><span style="font-size:18px;">&nbsp;</span></span></o:p></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:left;" class="MsoNormal" align="left"><span style="font-size:small;"><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">1992</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">年——杨伊琳，中国体操运动员。</span><span lang="EN-US"><o:p></o:p></span></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:left;" class="MsoNormal" align="left"><span lang="EN-US"><o:p><span style="font-size:small;font-family:Calibri;"><span style="font-size:18px;">&nbsp;</span></span></o:p></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:center;" class="MsoNormal" align="center"><span style="font-size:small;"><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">本周体坛寿星（</span><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">8</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">月</span><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">27</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">日）</span><span lang="EN-US"><o:p></o:p></span></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:left;" class="MsoNormal" align="left"><span lang="EN-US"><o:p><span style="font-size:small;font-family:Calibri;"><span style="font-size:18px;">&nbsp;</span></span></o:p></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:left;" class="MsoNormal" align="left"><span style="font-size:small;"><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">1979</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">年</span><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">——</span></span><span style="color:windowtext;font-family:宋体;text-decoration:none;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;text-underline:none;" lang="EN-US"><span style="font-size:18px;" lang="EN-US">田亮</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">，中国跳水</span><span lang="EN-US"><span style="color:windowtext;font-family:宋体;text-decoration:none;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;text-underline:none;" lang="EN-US"><span style="font-size:18px;" lang="EN-US">运动员</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">。</span><span lang="EN-US"><o:p></o:p></span></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:left;" class="MsoNormal" align="left"><span lang="EN-US"><o:p><span style="font-size:small;font-family:Calibri;"><span style="font-size:18px;">&nbsp;</span></span></o:p></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:left;" class="MsoNormal" align="left"><span style="font-size:small;"><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">1981</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">年</span><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">——</span></span><span style="color:windowtext;font-family:宋体;text-decoration:none;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;text-underline:none;" lang="EN-US"><span style="font-size:18px;" lang="EN-US">马克斯威尔</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">，巴西足球运动员。</span><span lang="EN-US"><o:p></o:p></span></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:left;" class="MsoNormal" align="left"><span lang="EN-US"><o:p><span style="font-size:small;font-family:Calibri;"><span style="font-size:18px;">&nbsp;</span></span></o:p></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:center;" class="MsoNormal" align="center"><span style="font-size:small;"><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">本周体坛寿星（</span><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">8</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">月</span><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">28</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">日）</span><span lang="EN-US"><o:p></o:p></span></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:center;" class="MsoNormal" align="center"><span lang="EN-US"><o:p><span style="font-size:small;font-family:Calibri;"><span style="font-size:18px;">&nbsp;</span></span></o:p></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:left;" class="MsoNormal" align="left"><span style="font-size:small;"><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">1986</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">年</span><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">——</span></span><span style="color:windowtext;font-family:宋体;text-decoration:none;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;text-underline:none;" lang="EN-US"><span style="font-size:18px;" lang="EN-US">杰夫</span></span><span style="color:windowtext;text-decoration:none;text-underline:none;"><span style="font-family:Calibri;"><span style="font-family:宋体;font-size:18px;mso-ascii-theme-font:minor-fareast;mso-fareast-theme-font:minor-fareast;mso-hansi-theme-font:minor-fareast;mso-bidi-font-size:11.0pt;mso-bidi-font-family:"Times New Roman";mso-bidi-theme-font:minor-bidi;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;">·</span></span></span><span style="color:windowtext;font-family:宋体;text-decoration:none;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;text-underline:none;" lang="EN-US"><span style="font-size:18px;" lang="EN-US">格林</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">，美国</span><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">NBA</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">运动员。</span><span lang="EN-US"><o:p></o:p></span></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:left;" class="MsoNormal" align="left"><span lang="EN-US"><o:p><span style="font-size:small;font-family:Calibri;"><span style="font-size:18px;">&nbsp;</span></span></o:p></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:left;" class="MsoNormal" align="left"><span style="font-size:small;"><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">1988</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">年</span><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">——</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">马林</span><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-family:宋体;font-size:18px;mso-ascii-theme-font:minor-fareast;mso-fareast-theme-font:minor-fareast;mso-hansi-theme-font:minor-fareast;mso-bidi-font-size:11.0pt;mso-bidi-font-family:"Times New Roman";mso-bidi-theme-font:minor-bidi;mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA;">·</span></span><span style="color:windowtext;font-family:宋体;text-decoration:none;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;text-underline:none;" lang="EN-US"><span style="font-size:18px;" lang="EN-US">西里奇</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">，克罗地亚网球选手。</span><span lang="EN-US"><o:p></o:p></span></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:left;" class="MsoNormal" align="left"><span lang="EN-US"><o:p><span style="font-size:small;font-family:Calibri;"><span style="font-size:18px;">&nbsp;</span></span></o:p></span></p>\r\n<span style="font-size:small;"><span style="font-size:18px;"> </span></span><p style="margin:0cm 0cm 0pt;text-align:left;" class="MsoNormal" align="left"><span style="font-size:small;"><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">1990</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">年</span><span lang="EN-US"><span style="font-family:Calibri;"><span style="font-size:18px;">——</span></span><span style="color:windowtext;font-family:宋体;text-decoration:none;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;text-underline:none;" lang="EN-US"><span style="font-size:18px;" lang="EN-US">博扬</span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">，西班牙足球</span><span lang="EN-US"><span style="color:windowtext;font-family:宋体;text-decoration:none;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;text-underline:none;" lang="EN-US"><span style="font-size:18px;" lang="EN-US">运<span style="font-size:18px;" lang="EN-US">动员</span></span></span></span><span style="font-family:宋体;font-size:18px;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">。</span><span lang="EN-US"><o:p></o:p></span></span></p>\r\n<span style="font-size:small;"> </span></span>'),
(6, '<span style="font-size:small;font-family:宋体;"><span style="mso-fareast-font-family:Calibri;mso-fareast-theme-font:minor-latin;mso-bidi-font-family:Calibri;mso-bidi-theme-font:minor-latin;" lang="EN-US"><span style="mso-list:Ignore;"><span style="font:18px/normal "Times New Roman";font-size-adjust:none;font-stretch:normal;"><p><span style="font-size:18px;">锻炼出汗后补充水分的正确方法，应该是少量多次，先少喝一点儿，休息一会儿再少喝一点儿，慢慢补充。而且水中也应稍稍加点盐，喝淡盐水，以补充体内损失的盐分。切忌不可大量饮水，以免导致肠胃胀满，心脏负担加重。</span></p>\r\n</span></span></span></span>'),
(7, '<p><span style="font-size:18px;">运动过后缓解疲劳、恢复体力的可由下述方法做到：</span></p>\r\n<p><span style="font-size:18px;">1）整理活动。剧烈运动后进行整理活动，可使心血管系统、呼吸系统仍保持在较高水平，有利于偿还运动时所欠的氧债。整理活动同时也使肌肉放松，可避免由于局部循环障碍而影响代谢过程。</span></p>\r\n<p><span style="font-size:18px;">2）睡眠。睡眠时大脑皮层的兴奋过程降低，体内分解代谢处于最低水平，而合成代谢过程则相对较高，有利于体内能量的蓄积。</span></p>\r\n<p><span style="font-size:18px;">3）温水浴。温水浴可促进全身的血液循环，调节血流，加强新陈代谢，有利于机体内营养物质的运输和疲劳物质的排除。</span></p>\r\n<p><span style="font-size:18px;">4）补充营养。运动中各种营养物质消耗增加，运动后及时补充，有助于消除疲劳，恢复体力。糖、维生素C、维生素B1、水等，均应得到足够的补充。</span></p>\r\n<p></p>'),
(8, '<p><span style="font-size:18px;">球类运动多为激烈的运动，过程中如果不慎被球击中，有时候也容易产生一些伤害。尤其是对那些戴眼镜的朋友，更是如此。而要避免这种伤害，一方面需要参与者自我控制，不要胡乱出球，另一方面参与者也要时刻注意，面对难以闪躲的追身球，不妨转身背对来球，以减少被球击中的伤害。另外，球友也应该相互之间及时提醒。</span></p>'),
(9, '<span style="font-size:small;font-family:宋体;"> </span><p style="margin:0cm 0cm 0pt;" class="MsoNormal"><span style="font-size:small;"><span style="font-family:宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:宋体;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:minor-latin;">本版块用于为众多运动爱好者搭建一个互相请教、学习的平台。欢迎广大运动爱好者提出困惑自己的有关运动健身的问题，同时也积极回答其他网友提出的问题。希望该互助平台能够为大家加深对于运动的认识与热爱，并更好地付诸实践提供必要的帮助。</span><span lang="EN-US"><?xml:namespace prefix = o ns = "urn:schemas-microsoft-com:office:office" /><o:p></o:p></span></span></p>\r\n<span style="font-size:small;font-family:宋体;"> </span>'),
(16, '<p>RT~我很喜欢网球，可是这个规则一直搞不太懂，保分啊什么到底是什么个意思啊。求大师详解！</p>'),
(18, '<p><span style="font-size:18px;">本人男，想买一块入门级的羽毛球球拍，但是有不知道需要注意些什么。各位高手请多指教啊，最好直接推荐几块性价比高的球拍。</span></p>'),
(20, '<p>如题&nbsp;~&nbsp; </p>'),
(21, '<p>顺便开个讨论的头，大家觉得谁能最后夺冠呀？</p>'),
(22, '<p>R~T~求大师讲解啊。</p>'),
(25, '<p><span style="font-size:24px;">综合	</span></p>\r\n<p><span style="font-size:18px;">00:30	2011年WTA世界女子职业网球巡回赛辛辛那提站精选5	CCTV5	录播</span></p>\r\n<p><span style="font-size:18px;">02:05	2011年第51届世界乒乓球锦标赛男单半决赛：张继科VS波尔	CCTV5	录播</span></p>\r\n<p><span style="font-size:18px;">05:00	2011年国际田联钻石联赛摩纳哥站1	CCTV5	录播</span></p>\r\n<p><span style="font-size:18px;">05:30	2011年超级摩托车世界锦标赛欧洲站	CCTV5	录播</span></p>\r\n<p><span style="font-size:18px;">08:00	第13届国际田联世界田径锦标赛女子马拉松等	CCTV5	直播</span></p>\r\n<p><span style="font-size:18px;">12:30	2011年世界女排大奖赛总决赛13	CCTV5	录播</span></p>\r\n<p><span style="font-size:18px;">13:30	2011年世界女排大奖赛总决赛14	CCTV5	直播</span></p>\r\n<p><span style="font-size:18px;">15:27	2011年拳击经典赛事1	CCTV5	录播</span></p>\r\n<p><span style="font-size:18px;">20:00	第13届国际田联世界田径锦标赛开幕式、女子10000米决赛等	CCTV5	直播</span></p>\r\n<p><span style="font-size:18px;">22:35	2011年世界女排大奖赛总决赛16	CCTV5	录播</span></p>\r\n<p></p>\r\n<p><span style="font-size:24px;">足球</span></p>\r\n<p><span style="font-size:18px;">02:35	2011年欧洲足球超级杯：巴塞罗那VS波尔图	CCTV5	直播</span></p>\r\n<p></p>\r\n<p><span style="font-size:24px;">篮球</span></p>\r\n<p><span style="font-size:18px;">15:55	2011年亚洲女篮锦标赛半决赛1	CCTV5	直播</span></p>\r\n<p><span style="font-size:18px;">18:35	2011年亚洲女篮锦标赛半决赛1	CCTV5	直播</span></p>\r\n<p></p>'),
(27, '<p><span style="font-size:24px;">综合	</span></p>\r\n<p><span style="font-size:18px;">08:00	第13届国际田联世界田径锦标赛男子20公里竞走决赛、男子110米栏预赛等	CCTV5	直播</span></p>\r\n<p><span style="font-size:18px;">12:40	2011年世界职业拳王争霸赛35	CCTV5	直播</span></p>\r\n<p><span style="font-size:18px;">16:35	2011年世界女排大奖赛总决赛18	CCTV5	直播</span></p>\r\n<p><span style="font-size:18px;">18:35	第13届国际田联世界田径锦标赛男子100米决赛、男子10000米决赛	CCTV5	直播</span></p>\r\n<p><span style="font-size:18px;">20:15	2011年国际乒联职业巡回赛：中国公开赛苏州站决赛	CCTV5	直播</span></p>\r\n<p><span style="font-size:18px;">22:35	2011年世界一级方程式锦标赛比利时站：决赛	CCTV5	直播</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style="font-size:24px;">足球</span></p>\r\n<p><span style="font-size:18px;">00:30	2011/2012赛季德国足球甲级联赛第四轮3	CCTV5	直播</span></p>\r\n<p><span style="font-size:18px;">02:35	2011/2012赛季意大利足球甲级联赛第一轮：卡利亚里&nbsp;VS&nbsp;AC米兰	CCTV5	直播</span></p>\r\n<p><span style="font-size:18px;">次日00:10	2011/2012赛季德国足球甲级联赛第四轮5	CCTV5	直播</span></p>\r\n<p><span style="font-size:18px;">次日01:00	2011/2012赛季西班牙足球甲级联赛第二轮2	CCTV5	直播</span></p>\r\n<p><span style="font-size:18px;">次日03:00	2011/2012赛季西班牙足球甲级联赛第二轮3	CCTV5	直播</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style="font-size:24px;">篮球	</span></p>\r\n<p><span style="font-size:18px;">04:45	2011年亚洲女篮锦标赛小组赛：黎巴嫩VS中国	CCTV5	录播</span></p>\r\n<p><span style="font-size:18px;">14:45	2011年亚洲女篮锦标赛决赛	CCTV5	直播</span></p>\r\n<p></p>');
INSERT INTO `news_data` (`id`, `content`) VALUES
(28, '<p><span style="font-size:18px;">“AMSSEFCSL”标准在国际上非常流行是选择网球拍的一个重要参考。</span></p>\r\n<p><span style="font-size:18px;">下面介绍一下“AMSSEFCSL”标准的9大要素：&nbsp;</span></p>\r\n<p><span style="font-size:18px;">　　</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style="font-size:18px;">A——avoirdupois（重量）&nbsp;</span></p>\r\n<p><span style="font-size:18px;">　　太重的球拍会使球员在挥拍时动作缓慢，太轻的拍子则不易应付强力的来球，也容易翻拍。&nbsp;</span></p>\r\n<p><span style="font-size:18px;">　　normal选择：一般来说，年轻男性的适用范围是320—330g，中老年女性适用300—320g之间的球拍，年轻女性的适用范围是280—300g。&nbsp;</span></p>\r\n<p><span style="font-size:18px;">　　</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style="font-size:18px;">M——measure&nbsp;（握把尺寸）&nbsp;</span></p>\r\n<p><span style="font-size:18px;">　　跟重量一样，握把的大小也要以自己觉得舒适为宜。&nbsp;</span></p>\r\n<p><span style="font-size:18px;">　　normal选择：一般的男性球员适用4&nbsp;3/8，若能力允许，也可用大一点的如4&nbsp;1/2；女性适用4&nbsp;1/4—4&nbsp;3/8。&nbsp;</span></p>\r\n<p><span style="font-size:18px;">　　</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style="font-size:18px;">S——skin（握把外皮）&nbsp;</span></p>\r\n<p><span style="font-size:18px;">　　握把上的外皮，是球拍与人体接触的部分。外皮不好时，拍子就抓不好，这样的话，你即便有再好的球拍、再好的球技都无法发挥。&nbsp;</span></p>\r\n<p><span style="font-size:18px;">　　normal选择：握把皮需要留意，时常更换，这是保持握把外皮最佳状态的好办法。&nbsp;</span></p>\r\n<p><span style="font-size:18px;">　　</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style="font-size:18px;">S——sweet&nbsp;spot（拍面的甜区）&nbsp;</span></p>\r\n<p><span style="font-size:18px;">　　偏离球拍中心点击中球，也可以把球击出去的区域，英文称之为sweet&nbsp;spot（中文译为“甜点”或“甜区”）。normal选择：大拍面的球拍易学，稍微偏离中心也能打到球，缺点是缺少速度，控制也较差，适合女性，初学者及年纪大者，宜用大约110—115平方英寸的拍面。小拍面适合中高级及年轻球员，它的特点是球速快，打点控制好，但是甜区小&nbsp;。&nbsp;</span></p>\r\n<p><span style="font-size:18px;">　　</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style="font-size:18px;">E——equipoise&nbsp;（平衡点）&nbsp;</span></p>\r\n<p><span style="font-size:18px;">　　平衡点与球拍面的轻重大小有关，它的中心话题就是“头重”或“头轻”的问题。这也是一个“因人而宜”的话题。&nbsp;</span></p>\r\n<p><span style="font-size:18px;">　　normal选择：头重适合长拍，底线抽球的对打；头轻适合网球截击，双手兼用的选手常用。&nbsp;</span></p>\r\n<p><span style="font-size:18px;">　　</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style="font-size:18px;">F——form（形状）&nbsp;</span></p>\r\n<p><span style="font-size:18px;">　　每一个拍面的形状都有它独特的设计理念，形状不同甜区的位置就不同。一般来说，拍面的形状主要有椭圆形、蛋圆形两种，而椭圆形拍面的甜区处于拍面中心，蛋圆形拍面的甜区则处于拍面后中心区，距离握手处较近。稳拍功夫较好的人可选用前者，反之选用后者。&nbsp;</span></p>\r\n<p><span style="font-size:18px;">　　normal选择：这可从拍子的简介或吊牌中看出。&nbsp;</span></p>\r\n<p><span style="font-size:18px;">　　</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style="font-size:18px;">C——construct（构造）&nbsp;</span></p>\r\n<p><span style="font-size:18px;">　　网球拍的构造方面，整支球拍会有不同的软硬度存在。当然，挥拍动作大、力气大的人，适合硬度较小的拍子（若是挥拍动作大、力气也大的人使用较大硬度的球拍时，球拍的手柄、拍面网线及拍面框均易于损坏）。&nbsp;</span></p>\r\n<p><span style="font-size:18px;">　　normal选择：吊牌中也会有显示，大部份是以号码来表示，号码越大，硬度越小，&nbsp;</span></p>\r\n<p><span style="font-size:18px;">　　</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style="font-size:18px;">S——scales&nbsp;球拍的磅数&nbsp;</span></p>\r\n<p><span style="font-size:18px;">　　球拍的磅数越高，弹性越低，但是挥拍速度快的球员可获得较好的控球效果，磅数低会产生弹簧床作用而使反弹力增加，相对的控球性就会减低。&nbsp;</span></p>\r\n<p><span style="font-size:18px;">　　normal选择：网球拍一般最常用的磅数是55到60磅之间，职业选手往往都穿（“穿”是职业选手要求厂商生产球拍时穿用较粗的网线——由于网线较粗，因而磅数较大）到70磅左右。&nbsp;</span></p>\r\n<p><span style="font-size:18px;">　　</span></p>\r\n<p>&nbsp;</p>\r\n<p><span style="font-size:18px;">L——linear&nbsp;（线的选择）&nbsp;</span></p>\r\n<p><span style="font-size:18px;">　　网球线的主流是尼龙线，这种线因不怕潮湿，耐磨，能大量生产而价格合理等优点而盛行，但是尼龙线也有缺点，那就是因容易松弛而使磅数变化。&nbsp;</span></p>\r\n<p><span style="font-size:18px;">　　normal选择：既耐用又好打的线太少，原因是线越粗越耐用，而越细越好打，所以三两天就会断线的人最好穿上直径1.35mm到1.45mm较粗的线，但是粗线的手感并不好；而细线一般在1.20mm到1.30mm之间，切球较敏锐，弹力也佳。</span></p>'),
(29, '<div class="inner_content_news_body">\r\n<p>Head&nbsp;Size(拍面):&nbsp;</p>\r\n<p>　　拍面MID为95平方平方英寸，MP为96-100，之上为OS拍面。即Mid,Mid-plus,Over-size。</p>\r\n<p>　　一般来说，新手和力量偏弱的女士建议用OS拍面，击球面积大，甜点大，容易接到球，而且由于拍面大，球接触到球网之后力量分散得也开，卸力的效果明显，又方便借力打力。而MID拍面由于甜点小，击球时对技术和力量的要求都高，但击球时力量更集中即可以方便大力选手打出暴力的重击!所以MID拍面的拍子大部分都是重量型球拍，专为暴力选手配备。而MP球拍，可以说是当今最主流的球拍，从高人到新人都可以用，完全可以根据自己的特点选用。</p>\r\n<p>　　</p>\r\n<p>Length(拍长):&nbsp;</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 标准拍长27&nbsp;inches(英寸)&nbsp;/&nbsp;69&nbsp;cm(厘米)&nbsp;</p>\r\n<p>　　成人拍中，没有短的，只有加长型，为的只是加长力臂，对力量的要求增加却可以给发球和击球带来更大的力量。对此问题，请参照中学的基础力学知识。张德培是最早试用加长拍的人，他因此将发球速度提至了120英里/小时。加长拍中最著名的是POG加长，即张德培一代，以及罗迪克代言的PD+，不过新手不建议用PD+，动作不协调极易得网球肘，但张一加长可以推荐，对手臂极为友好，就是力量沉了些，量力而行了。</p>\r\n<p>&nbsp;</p>\r\n<p>Strung&nbsp;Weight(上线后重量):</p>\r\n<p>　　有多大力量，用多重的拍子，上场挥挥就知道自己能不能打得动了。除了O3，其它拍子的重量可以作为挥重的参数了。</p>\r\n<p>　　给想打暴力球的男士一个提醒：高手协调发力能力强，用轻拍也能打出暴力球，但一般人用力不充分，想打出暴力球，还是用动量定理比较好，即：球拍重击球狠，对手接着也就更费力。这就是为什么罗迪克这种不涂拍的人要在拍子上加海量的铅片的缘故了。</p>\r\n<p>　　</p>\r\n<p>Balance(平衡):&nbsp;</p>\r\n<p>　　头轻打网前省力，底线费力，头重打网前不爽，但底线省力。不过想自己发力，加强控制力的，头轻是不二选择。&nbsp;不想把手臂打得很粗的技术型选手或女士，用头重拍很好。想学职业选手的诸位，头轻吧，有了控制和自己发力才是技术提升的途径!</p>\r\n<p>　　有个反例，大小W姐妹，力量超强，用头重拍，还经常做出极不标准的动作击球，不过因为有不输于男人的肌肉，所以......</p>\r\n<p>　　数据解释：1pts头轻，即拍子的平衡点在球拍中点靠近拍柄1&nbsp;point的位置:</p>\r\n<p>　　公式：1pts&nbsp;=&nbsp;1/8&nbsp;inch&nbsp;=&nbsp;1/8&nbsp;*&nbsp;25.4&nbsp;mm&nbsp;=&nbsp;3.175&nbsp;mm=0.3175CM</p>\r\n<p>　　对于标长27inch即68.5cm的拍子而言，平衡点在从拍柄数31(68.5/2-0.3175=33.9)CM处。头重就在中点处加上平衡点数值。</p>\r\n<p>　　n&nbsp;six-one&nbsp;90，9点头轻，就是68.5/2-0.3175*9=31.4&nbsp;即平衡点在从拍柄数31.4CM处。网站上的是315，出入是因为我取的四舍五入点精确数位多所致。</p>\r\n<p>　　1点头重，即68.5/2+0.3175=34.5CM,即从拍柄数34.5cm处。</p>\r\n<p>　　大部分拍子挥起来会比原来的重量轻些，我们可以理解为借着惯性省了些重量。O3是个例外，超强的大孔减少了阴力，使拍子挥重远远轻于自重。不知道以后会不会出现自重350克，挥重系数不足300的情况。这项指数建议大家自己上场试试才会有感觉。因为挥重受到击球方式、位置等因素影响不小。</p>\r\n<p>　　</p>\r\n<p>Stiffness(硬度):&nbsp;</p>\r\n<p>　　越硬拍子弹力越大，对球如此，对手臂也如此，所以软拍子对手臂都很友好。但用好了，借力加力后硬拍子的威力也是很恐怖的。想想美国大炮用PD+发出的250+KMH的发球吧。软拍由于拍子变形大，吸收力量大，所以需要更多自己发力，力量偏小喜欢借力的人士最好还是选硬度65以上的拍子。相反，力大人士用软拍子更能发挥自己的控制力和力量。</p>\r\n<p>　　</p>\r\n<p>Beam&nbsp;Width(拍框厚度):&nbsp;</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;22-25&nbsp;mm&nbsp;</p>\r\n<p>　　直接影响球拍力量指数的因素，拍框越厚，由于线床变形越小，球拍力量会增强，减震也越好。拍框薄，球拍的控制要好一些，拍框薄拍子也越灵活。拍框的厚度和拍面的大小也有一定关系，OS拍面很少有小于20mm的。总之窄边的拍子都是暴力拍，L6、Tour90，都属于这类。宽边的如PD等借力效果好。</p>\r\n<p>　　</p>\r\n<p>Composition(成份):&nbsp;</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Graphite&nbsp;（碳素）&nbsp;/&nbsp;Kevlar&nbsp;（卡夫拉）&nbsp;</p>\r\n<p>　　现在的拍子中碳素为主，加入金属或纤维物质都是为了增加拍子的硬度，加强拍子的力量和稳定性。只需要说明一点，有些人会不习惯金属元素的震动感觉，可以选用减震效果好的纯碳拍。这个因人而异。</p>\r\n<p>　　此处顺带说明一下避震的问题，觉得震手就加避震觉得太木没感觉就不加避震。如果没加避震还觉得木就换个震动强的线或震动强的拍子。手感敏锐者如费得乐萨纷不用避震，却也有如老桑阿加西这样用避震的。纳达尔和克里斯特尔斯这些大力选手也用避震。所以大家自己判断好了。而且避震有不同的样式和效果，缠住的线越多减震效果越好。</p>\r\n<p>　　顺便说提醒一句：使用95以上拍面的大力击球手，如果用的是非力士浪硬线的话，使用一般的避震经常会被震飞(连续击球中来不及理线，由于力量大，球线分散，造成避震脱落)，建议使用皮筋儿或皮管儿一类可以系在线上的避震。</p>\r\n<p>　　</p>\r\n<p>Power&nbsp;Level(力量级别):&nbsp;</p>\r\n<p>　　力量越大，越省力，力量越小，越需要自己来发力，大家量力而行吧。</p>\r\n<p>　　一般来说，这都是和拍子的重量、挥重紧密相连的指数，重拍要求挥拍速度快，因为什么？因为如果你挥得不够大力，就不够快，没有力量是击不出好球的。所以重量和挥重决定了你的挥拍速度一点不为过。</p>\r\n<p>　　挥重小的，挥拍速度中等，力量小，借力多，适合休闲打法。</p>\r\n<p>　　</p>\r\n<p>Grip&nbsp;Type(原厂拍的柄皮型号):&nbsp;</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Syntec&nbsp;Grip&nbsp;</p>\r\n<p>　　有什么用什么，喜欢拍柄棱角感的或想加拍柄厚度的，可以换成小牛皮，不过价格很贵，新手就不必了。有些好拍了如N90是配了小牛皮柄皮的。其它的内柄皮也有加厚减震型或速干透汗型，原则上来讲，换外柄皮就OK了。内柄皮一般不用换。</p>\r\n<p>&nbsp;</p>\r\n<p>Grip&nbsp;Size(原厂拍的拍柄尺寸)：</p>\r\n<p>　　因手而异，一个手指为最佳，看图!</p>\r\n<p>　　注：追求上旋的高手会选择小一号的手柄，为了方便转手腕，不过新人或技术不熟练者不要过早追求动手腕击球!</p>\r\n<p>　　</p>\r\n<p>String&nbsp;Pattern(线床密度):</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;16&nbsp;Mains(竖线)&nbsp;/&nbsp;19&nbsp;Crosses(横线)</p>\r\n<p>　　记住一点，竖线越少，上旋效果越好，反之则是平击效果。16*19是当今主流，但18*20依然占有一部分市场，如HEAD的Prestige和Dunlop的200G等依然占有一片特别的市场，Safin更是用自己天生的素质用小拍面线密线床的拍子打出了极强的上旋球。可见技术上的优势远远凌驾于拍子之上!</p>\r\n<p>　　顺便加一句，线疏且拍面在MP或OS的拍子，很容易走线，小拍面紧线床相对走线少。如果是特别不喜欢整线，就上聚脂线，如果又是经常会把力士浪硬线都打走的高手，建议换用小拍面的拍子。</p>\r\n<p>　　</p>\r\n<p>String&nbsp;Tension(上线高低峰值):&nbsp;</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 53-63&nbsp;pounds&nbsp;(磅)</p>\r\n<p>　　非力士浪硬线，本着先上拍子推荐的中值，再根据手感调整。相加力量的，减少磅数，想加控制的，加磅数，每次调整2-3磅。</p>\r\n</div>'),
(31, '<p><span style="font-size:18px;">Wilson（威尔逊）</span></p>\r\n<p><span style="font-size:18px;">    全球网球拍销量最大、最受职业选手和业余选手欢迎的品牌之一。Wilson旗下产品十分丰富，包括几乎所有网球产品。wilson也是最早把金属投入到球拍的设计和制造中来的公司，Wilson无论是在亚洲、欧洲、北美都有广阔的市场。新拍层出不穷，产品线异常丰富，必有一款适合你。除此之外，Wilson的高尔夫，篮球，壁球和羽毛球等产品也是世界一流，不愧时美国排名前10位的综合运动品牌。 </span></p>\r\n<p><span style="font-size:18px;">    14次大满贯选手Pete Sampras、九十年代初期的S. Edberg、被称为Sampras接班人的R. Federer、多伦多大师赛冠军G. Canas、还有来自巴西外形酷似Sampras的Andre Sa, 都使用Wilson的球拍，WTA选手更加不计其数，排名WTA前十名的选手有近半数都使用Wilson球拍，如大小Williams, Davenport, Henin, 还有已经退役的23次大满贯得Graf.</span></p>\r\n<p><span style="font-size:18px;"> </span></p>\r\n<p><span style="font-size:18px;">Babolat （百宝力）</span></p>\r\n<p><span style="font-size:18px;">    来自法国著名的网球品牌，世界最好的两家球线和配件供应商之一，几乎有超过50%的世界排名前100位的职业网球手只使用BABOLAT球线和配件，质量无庸置疑，深受业内人士推崇，唯一的缺点就是价格昂贵，故此在国内没有广为人知。实际上只有了解BABOLAT，你对网球的理解才会上一个台阶，此外他生产的球拍不多，但也别具一功尤其以拍线和配件特别著名，颇受职业选手的青睐，各种球拍都到Babolat球拍检测中心检测球拍的性能指标，可见 Babolat 在球拍设计方面的权威性。　</span></p>\r\n<p><span style="font-size:18px;">    Babolat生产的球拍型号不多，却很受职业选手的欢迎，旗下的Pure Drive和Pure Control 最具代表性。Nadal,Moya,Escude,Corretja,Roddick等都使用Babolat的球拍，华裔名将张德培也曾用过Pure Drive.</span></p>\r\n<p><span style="font-size:18px;"> </span></p>\r\n<p><span style="font-size:18px;">Head（海德） </span></p>\r\n<p><span style="font-size:18px;">    来自奥地利的网球品牌，目前唯一大部分的高档球拍均在奥地利本土设计、生产的高贵品牌，技术创新能力在业界享有盛誉，开发出第一款钛合金球拍，第一块主动避震的智能压电球拍，精益求精的名牌品质保证，为您迎来球场生涯中最精彩的一刻! </span></p>\r\n<p><span style="font-size:18px;">    Agassi, Safin, Ivanisevic, Kuerten, Grosjean等ATP的职业球员都使用Head的球拍。Head是当之无愧的冠军球拍，如四大满贯得主Agassi, “红土之王”Kuerten， 俄国“新沙皇”Safin, 草地上的“发球机器”Ivanisevic, 可见Head球拍在所有类型的场地上都发挥得十分出色，这都有赖于Head球拍的出色设计。 </span></p>\r\n<p><span style="font-size:18px;"> </span></p>\r\n<p><span style="font-size:18px;">Prince（王子） </span></p>\r\n<p><span style="font-size:18px;">    家喻户晓的网球运动品牌，在世界中高级别球拍中占有很重要的地位。2001年推出的 triple threat 系列专攻高档休闲系列，force3系列专攻大众市场。 </span></p>\r\n<p><span style="font-size:18px;">    Prince球拍大致分为“Triple Threat“ 系列和“More“系列，Prince球拍的力量水平用X00表示，X越大，力量水平越高，控制水平越小；反之，X越小，力量水平也越小，控制水平更好。如：600比700力量水平低。 </span></p>\r\n<p><span style="font-size:18px;"> </span></p>\r\n<p><span style="font-size:18px;">Dunlop（登禄普） </span></p>\r\n<p><span style="font-size:18px;">    来自英国著名的网球品牌，最早、最优秀的网球品牌之一。1888年，在神秘的不列颠群岛，DUNLOP——一个高贵而响亮的体育品牌横空出世，并由此开始了其傲视群雄一百多年的灿烂历程。秉承其尊贵气质及其全力推崇的“前卫、自由、个性”的品牌宗旨，经过一百多年的发展，DUNLOP 已成为全球著名的高档综合性运动品牌。　Dunlop 旗下的旗舰产品当属200G 和300G，它个性张扬，雍容华贵，战绩辉煌。现旗下Johansson (02" 澳网冠军), Safin(00" 美网冠军)，澳洲“发球大炮“Philippoussis，当然还有大家熟知的Haas, Schalken和美国新锐Blake等男选手以及女子选手Mauresmo……  </span></p>\r\n<p><span style="font-size:18px;"> </span></p>\r\n<p><span style="font-size:18px;">VOLKL（沃克） </span></p>\r\n<p><span style="font-size:18px;">     来自奥地利的老牌运动品牌，品质不逊色与任何竞争对手，尤其惊人的是其母公司是世界第一的复合材料供应商，其获得航太级碳素和超级陶瓷在本行业的独家供应，其产品具有独特的性能，在欧洲占有极大的市场分额。旗下选手：卡菲尔尼科夫。 源自德国人对高品质的狂热追求的网球运动产品，品牌代言人为网坛巨星贝克尔。旗下产品丰富，包括安全头盔、冰雪器材、草坪、登山包、地板、户外服装等,虽然在欧洲如日中天，但在国内的知名度局限在专业圈内，旗下选手：司迪班内科。</span></p>\r\n<p><span style="font-size:18px;"> </span></p>\r\n<p><span style="font-size:18px;">Yonex（尤尼克斯） </span></p>\r\n<p><span style="font-size:18px;">     世界第一的羽毛球品牌！其网球拍近年也开始逐渐走向旺销，这和其赞助休依特、辛吉斯等网坛名将是分不开的！1982年推出令人感到惊喜的R系列网球拍.R-1是世界上第一支方形网球球拍,而超轻的R-7网球拍赢得法国及温布尔登的认可。 </span></p>\r\n<p><span style="font-size:18px;"> </span></p>\r\n<p><span style="font-size:18px;">Tecnifibre（泰克尼） </span></p>\r\n<p><span style="font-size:18px;">    法国知名企业Major sports 公司网球系列产品的知名品牌，Major sports 公司成立于1979年，至今已有26年历史。</span></p>\r\n<p><span style="font-size:18px;">    1982年，阿根廷选手乔斯.克拉克（Jose Luis Clerc），当时在ATP中排名世界第四，是第一个使用Tecnifibre 产品的顶级选手。</span></p>\r\n<p><span style="font-size:18px;">    1988年，Major sports 与法国网球联盟（FFT）开始合作伙伴关系，这也是 Tecnifibre 第一次成为法国网球联盟和巴黎-柏西室内锦标赛的指定穿线商，并且从此以后 Tecnifibre 一直都在这两个赛事上对世界上最好的选手提供最好的服务。</span></p>\r\n<p><span style="font-size:18px;">    1990年， Tecnifibre 品牌获得第一个大满贯称号：莫尼卡.塞勒斯（Monica Seles），法国网球公开赛的冠军。</span></p>\r\n<p><span style="font-size:18px;">    1999年，根据美国网球拍线商协会的拍线调查， Tecnifibre 品牌的合成线排名世界第一。</span></p>\r\n<p><span style="font-size:18px;">    2000年，Major sports 在亚洲的泰国建立了自己的Msp网球工厂，该工厂的生产能力大约是每年100万打。</span></p>\r\n<p><span style="font-size:18px;">    2005年，Tecnifibre 系列产品正式进入中国。</span></p>'),
(33, '<p>用户安全：<br />\r\n为保护你的账户安全，避免盗号情况的发生、避免非法分子获取你的账号与密码并冒充你的名义向你的好友发送垃圾信息，请仔细阅读以下须知：<br />\r\n　　◇ 不要使用其他第三方软件来登录的一球网<br />\r\n　　我们已发现很多这样的非法外挂软件，会盗窃你的账户资料（Email等）出售给非法商家如垃圾邮件经营商、盗窃你的虚拟资产（转移到你的资产到他人账户或直接盗号）；<br />\r\n　　◇ 不要在一些网站上输入一球网的账号密码<br />\r\n　　某些第三方网站会记录您的一球网账号和密码，并做非法用途；<br />\r\n　　◇ 不要在仿冒的一球网上输入你的一球网帐号和密码<br />\r\n　　某些非法网站使用一球网登录界面相近的网页、使用与PlayAce.net相近的地址等迷惑手段让你误登录以窃取你的账号密码；他们常采用在你浏览一些网站时强制弹出网页、以PlayAce网名义发垃圾邮件等手段让你上当；<br />\r\n&nbsp;&nbsp;&nbsp;&nbsp; ◇ 不要相信陌生人或不熟悉的网友发布的中奖等信息 </p>\r\n<p>&nbsp;</p>\r\n<p>密码安全常识<br />\r\n请仔细阅读以下常见的安全措施：<br />\r\n　　◇ 密码要保密，且定期更改；<br />\r\n　　◇ 请使用尽量长、复杂的字母数字符合组合以提高密码强度，不要用生日等容易被别人猜中的密码；<br />\r\n　　◇ 如果使用了密码取回功能，请你及时删除我们发送给你的载有密码的邮件；<br />\r\n　　◇ 某些内容如照片等如果你设置了访问保护密码，一定要跟你的登录密码有所区别；<br />\r\n　　◇ 请记住不要与任何人共享您的密码。如果您已经与他人共享了密码，我们强烈建议您尽快更改；<br />\r\n　　◇ 你可能在不经意间使计算机受到病毒、木马、间谍软件、广告软件的感染，这些软件也可能记录并盗走你的密码！所以，请安装和使用杀毒软件，并请谨慎访问陌生网站和下载软件。 </p>\r\n<p>交友安全<br />\r\n　　在一球网线上交友，请尽量透过现实中的熟人的朋友圈（好友列表），这样相对安全一些。<br />\r\n　　在充分相信对方之前，不要告诉对方你的详细住址、电话号码等那些可会伤害你或被他人利用的隐私信息。<br />\r\n　　如果你打算在某个地方与从未谋面的陌生网友会面，请邀朋友随行，并做好一切安全防范和补救措施。 <br />\r\n</p>'),
(34, '请在登录验证界面中，输入账户与密码即可登入。您的账户名就是您注册时填写的Email地址<br />\r\n&nbsp;<br />\r\n登入失败怎么办？<br />\r\n可能您还没有注册，先去注册吧;<br />\r\n可能您的账户还没有激活，先激活您的账号吧，查收一球网寄给您的新，点击信内的链接，就可以激活账号了;<br />\r\n您的注册Email地址或密码输入错误，比如不小心输错了大小写；<br />\r\n试过多次，还是账号密码错误，试下取回密码吧。'),
(35, '第一步：打开PlayAce网，点击首页右上方的“立即注册”按钮，进入注册界面<br />\r\n&nbsp;<br />\r\n第二步：进入注册界面后，请填写您的电子邮箱，用户名和密码。确认填写完整无误后，点击完成注册按钮即可<br />\r\n&nbsp;<br />\r\n完成注册<br />\r\n&nbsp; 恭喜您。激活成功后，您已经是一球网的一员！马上开始您的网球之旅吧！'),
(41, '1.什么是个人中心？<br />\r\n当用户在网站中注册成会员后，即可通过所注册的用户名与密码登录网站，点击“我的空间”，即可进入个人中心查看自己发起的活动、参加的活动，发表自己的评论文章、管理收发站内短消息等<br />\r\n&nbsp;<br />\r\n2.个人中心可以做什么？<br />\r\n进入个人中心查看个人资料、发起的活动、参加的活动、管理发表自己的评论文章、管理收发站内短消息和修改个人设置。<br />\r\n&nbsp;<br />\r\n3.短消息<br />\r\n在个人中心功能栏中，点击“短消息”，即可进入站内短消息功能。短消息功能分为“发件箱” 、“收件箱” 、“发消息”<br />\r\n&nbsp;<br />\r\n收件箱—所有您的收到的好友短消息都存储这儿<br />\r\n发件箱—所有您发出的短消息都存储这儿<br />\r\n写邮件—填写需要发送给好友的邮件的标题、收件人和邮件正文，并点击“提交”发送。<br />\r\n&nbsp;<br />'),
(42, '<p>凡跃创建于2011年8月，是一个致力于搭建全方位的体育文化交流平台的团队，一个提供多元化、高品质的业余生活解决</p>\r\n<p>方案的组织。我们秉承“独乐乐，不如众乐乐”的理念，以满腔的热情为大家构筑起开放自由的交流平台，通过策划和组</p>\r\n<p>织不同主题、不同类别的体育活动，来涵盖不同人群的需求，为繁忙的都市生活增添乐趣。同时，以体育文化交流为主题</p>\r\n<p>，我们还能赋予活动更多的附加价值：展示个人风采的舞台，找寻志同道合的partner，为城市贡献力所能及的公益力量…</p>\r\n<p>…</p>'),
(43, '凡跃(上海)体育文化传播有限公司<br />\r\n公司地址:<br />\r\n邮编:<br />\r\n电话方式：'),
(44, '<p>我们的优势<br />\r\n小型创业公司，精英型团队 ，更多激情，更少束缚，更大发展空间。<br />\r\n唯才是举，我们看中的是能力而非学历。<br />\r\n而信息技术的运用，也让凡跃的经营非常具有灵活性。<br />\r\n公司的创始人来自不同的行业，不同的职业专长提供了更好的相互协作的条件，同时多年的职场经验也让这个团队更具市</p>\r\n<p>场敏锐度。</p>\r\n<p><br />\r\n招聘岗位<br />\r\n网站技术总监助理（实习生）<br />\r\n人员需求：1人<br />\r\n主要工作：协助网站技术总监处理网站的相关事务<br />\r\n基本要求：1、&nbsp; 专业为计算机、软件工程或数学<br />\r\n2、&nbsp; 写过相关的技术文档或论文<br />\r\n3、&nbsp; 学过C++、Java、数据结构和软件工程等课程且成绩优良<br />\r\n4、&nbsp; 一周能够保证4天的工作时间<br />\r\n5、&nbsp; 对于互联网行业有热情<br />\r\n招聘说明<br />\r\n工作地点：<br />\r\n工作性质：实习生<br />\r\n有意者发送中英文简历至<a href="mailto:arthur_van@playace.net">arthur_van@playace.net</a><br />\r\n我们的招聘没有任何学历限制，我们看重的是素质修养和学习能力。<br />\r\n我们为每一个团队成员提供广阔的发展空间和学习机会，及富有竞争力的薪酬和福利。<br />\r\n站内招聘信息长期有效，内容即时更新。 </p>'),
(45, '1在如下情况下，本站将不对您的隐私泄露承担责任：<br />\r\n&nbsp; 您同意让第三方共享资料； <br />\r\n&nbsp; 您同意公开你的个人资料，享受为您提供的产品和服务； <br />\r\n&nbsp; 本站需要听从法庭传票、法律命令或遵循法律程序； <br />\r\n2因黑客行为或用户的保管疏忽导致帐号、密码遭他人非法使用<br />\r\n3本网站使用者因为违反当地法律法规的，一切后果自负，本论坛不承担任何法律责任。<br />\r\n4本声明未涉及的问题参见国家有关法律法规，当本声明与国家法律法规冲突时，以国家法律法规为准。<br />\r\n5本网站之声明以及其修改权、更新权及最终解释权均属Playace网站管理团队所有。'),
(46, '友情链接'),
(47, '<p>搜索场地是一球网一个非常实用的功能，因为网站提供了诸多网球场地信息，如何找到适合自己的活动场地？搜索场地帮</p>\r\n<p>助我们精确地找到我们的理想中的网球场。<br />\r\n当用户在网站中注册成会员后，即可通过所注册的用户名与密码登录网站，点击“竞技场”，即可进入场地搜索，根据自</p>\r\n<p>己的要求搜索需找网球场地的相关信息。</p>'),
(48, '<p>当您浏览场地信息或是搜索场地信息时，可以看到场地信息中有“区域”和“分类”，可较为直观的对场地的基本信息进</p>\r\n<p>行分类，方便您选择合适网球场地。</p>'),
(49, '<p>当您在浏览场地信息时，可以对您已经去过的场地发表自己评论。只需点击“我要评论”， 并输入您的评论相关文字，最</p>\r\n<p>后点击“提交评论”，即可发表评论。<br />\r\n同时你也可以浏览其他会员的评论，帮助自己找到适合的网球场地。</p>'),
(50, '当您在浏览活动信息时，可以对您已经参加过的活动发表自己评论。只需点击“添加评论”， 并输入您的评论相关文字，最后点击“提交评论”，即可发表评论。<br />\r\n同时你也可以浏览其他会员的评论，帮助自己找到适合的网球。'),
(51, '当您浏览活动信息时，找到了自己心仪的活动之后，在报名截止日期之内，已报名人数未达到人数上限时，可以点击“我要报名”，进行报名。加入火热的战线之中。'),
(52, '当您浏览活动信息时，可以看到活动信息中有“区域”、“分类”和“时间”，可较为直观的对活动的基本信息与发起人进行了解，方便您选择合适网球场地。'),
(53, '搜索活动是一球网一个非常实用的功能，因为网站组织频繁的活动，如何找到适合自己的活动？搜索活动帮助我们精确地找到我们的愿意报名的活动。<br />\r\n当用户在网站中注册成会员后，即可通过所注册的用户名与密码登录网站，点击“动感地带”。进入动感地带后，点击“最新活动右上方的“更多活动”即可进入搜索，根据自己的要求搜索需找网球场地的相关信息。'),
(54, '当用户在网站中注册成会员后，即可通过所注册的用户名与密码登录网站，点击“金玉良言”，即可进入资讯中心浏览近期的新闻资讯、投资资讯、器材资讯和场地资讯等内容。方便会员更好的了解网站。'),
(55, '当您在浏览资讯中心的信息时，可以对相关的资讯信息发表自己评论。只需在信息下方输入您的评论相关文字，最后点击“提交评论”，即可发表评论。<br />\r\n同时你也可以浏览其他会员对资讯的相关评论。'),
(56, '<strong>徐亦星</strong>&nbsp; 拥有六年球龄的网球选手，曾在大学期间参加过校网球队，并代表学校参加过校际联赛，比赛心态较好。该球员上网能力一般，比较注重底线；正手比较稳定，且具有一定攻击性；反手相对偏重防守；发球方面一发失误较多，二发比较稳定，且带上旋或侧旋。');

-- --------------------------------------------------------

--
-- 表的结构 `participant`
--

CREATE TABLE IF NOT EXISTS `participant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `party_id` int(11) NOT NULL COMMENT '活动id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `is_passed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否通过，0：待批准，1：已批准，2：拒绝',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='活动参与者' AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `participant`
--

INSERT INTO `participant` (`id`, `party_id`, `uid`, `is_passed`, `create_time`) VALUES
(1, 2, 1, 1, 1314795127),
(2, 2, 3, 1, 1314837858),
(3, 3, 3, 1, 1314837865),
(4, 3, 2, 1, 1314838053),
(5, 2, 2, 1, 1314838058),
(6, 5, 1, 1, 1314838186),
(7, 3, 1, 1, 1314840312),
(8, 4, 1, 1, 1314840634),
(9, 4, 3, 1, 1314840659),
(10, 5, 6, 0, 1314840906),
(11, 4, 6, 0, 1314840912);

-- --------------------------------------------------------

--
-- 表的结构 `party`
--

CREATE TABLE IF NOT EXISTS `party` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `description` text NOT NULL COMMENT '说明',
  `thumb` varchar(225) NOT NULL COMMENT '缩略图',
  `start_time` int(11) NOT NULL COMMENT '开始时间',
  `end_time` int(11) NOT NULL COMMENT '结束时间',
  `number_limit` varchar(10) DEFAULT 'unlimited' COMMENT '人数限制，不填为无限制',
  `cost` varchar(10) NOT NULL COMMENT '活动费用',
  `kind` tinyint(4) NOT NULL COMMENT '种类 0：官方活动，1：会员活动',
  `address` varchar(150) NOT NULL COMMENT '活动地址',
  `area_id` int(11) NOT NULL COMMENT '所属区域',
  `contact` varchar(150) NOT NULL COMMENT '联系方式',
  `recommed` tinyint(2) DEFAULT '0' COMMENT '推荐指数，10-1 降序排列，0为不推荐',
  `create_uid` int(11) NOT NULL COMMENT '创建者uid',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_uid` int(11) DEFAULT '0' COMMENT '最后更新者uid',
  `update_time` int(11) DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='活动' AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `party`
--

INSERT INTO `party` (`id`, `title`, `description`, `thumb`, `start_time`, `end_time`, `number_limit`, `cost`, `kind`, `address`, `area_id`, `contact`, `recommed`, `create_uid`, `create_time`, `update_uid`, `update_time`) VALUES
(1, 'test1', 'test1', '../../static/img/demoicon/tennis_3.jpg', 1312156800, 1312156800, '10', '100元/人', 1, '浦东星河湾大酒店', 1, '13764372037 ray', 0, 1, 1314794982, 0, 0),
(2, 'test 2', 'test 2', '../../static/img/demoicon/tennis_3.jpg', 1317340800, 1317340800, '20', '80/人', 1, '浦东星河湾大酒店', 1, '13764372037 ray', 0, 1, 1314795025, 0, 0),
(3, '他说地方看见了', '阿斯哦的罚款拉萨的', '../../static/img/demoicon/tennis_2.jpg', 1316649600, 1316660400, '2', '120元', 1, '浦东星河湾', 1, '13764372037 ray', 0, 1, 1314795120, 0, 0),
(4, 'asdfasdf', 'aaaaaaaaaaaaaaaaaa', '../../static/img/demoicon/tennis_2.jpg', 1316649600, 1316649600, '10', '213', 1, '撒地方', 1, '13764372037 ray', 0, 1, 1314838114, 0, 0),
(5, 'ccccc', 'asdfasdfasdf', '../../static/img/demoicon/badminton_1.jpg', 1316131200, 1316131200, '11', '80/人', 1, '浦东星河湾大酒店', 1, '13764372037 ray', 0, 1, 1314838151, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `party_info`
--

CREATE TABLE IF NOT EXISTS `party_info` (
  `id` int(11) NOT NULL COMMENT '主键，和活动主键同步',
  `views` int(11) DEFAULT '0' COMMENT '查看数',
  `comments` int(11) DEFAULT '0' COMMENT '评论数',
  `participants` int(11) NOT NULL COMMENT '参与人数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='活动的相关信息';

--
-- 转存表中的数据 `party_info`
--

INSERT INTO `party_info` (`id`, `views`, `comments`, `participants`) VALUES
(1, 0, 0, 0),
(2, 15, 3, 3),
(3, 7, 0, 3),
(4, 6, 0, 2),
(5, 2, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `photo`
--

CREATE TABLE IF NOT EXISTS `photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='照片' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `photo`
--


-- --------------------------------------------------------

--
-- 表的结构 `photo_album`
--

CREATE TABLE IF NOT EXISTS `photo_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='相册' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `photo_album`
--


-- --------------------------------------------------------

--
-- 表的结构 `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '标签名',
  `hits` int(11) NOT NULL COMMENT '使用次数',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='标签' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `tags`
--


-- --------------------------------------------------------

--
-- 表的结构 `topic`
--

CREATE TABLE IF NOT EXISTS `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主题' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `topic`
--


-- --------------------------------------------------------

--
-- 表的结构 `topic_comment`
--

CREATE TABLE IF NOT EXISTS `topic_comment` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主题评论';

--
-- 转存表中的数据 `topic_comment`
--


-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL COMMENT '电子邮件地址',
  `username` varchar(15) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `last_login_ip` varchar(50) NOT NULL DEFAULT '0.0.0.0' COMMENT '最后登录IP',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `class` tinyint(4) NOT NULL DEFAULT '0' COMMENT '会员类型，0：个人，1：企业',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态，0：正常，1：已激活，10：冻结',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户' AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `email`, `username`, `password`, `create_time`, `last_login_ip`, `last_login_time`, `class`, `status`) VALUES
(1, 'raynorxyx@hotmail.com', '徐亦星', '721e04149aeac0ecf637bfab4bbd516f', 1312087413, '127.0.0.1', 1314844589, 0, 0),
(2, 'raynor_xyx@163.com', 'ray.xu', '721e04149aeac0ecf637bfab4bbd516f', 1312395212, '127.0.0.1', 1314843917, 0, 0),
(3, 'raynorxyx@sina.com', '破碎流星', '721e04149aeac0ecf637bfab4bbd516f', 1312395959, '127.0.0.1', 1314846698, 0, 0),
(4, 'coldneyxiao@hotmail.com', 'xiaowanwan', '52191dd9c42ce104acccd7469b00fa4c', 1314454547, '116.235.247.167', 1314454570, 0, 0),
(5, 'liz@hotmail.com', 'xiaoxiao', '5ec829debe54b19a5f78d9a65b900a39', 1314454625, '116.235.247.167', 1314454685, 0, 0),
(6, 'zing@126.com', 'zing', 'e10adc3949ba59abbe56e057f20f883e', 1314795386, '127.0.0.1', 1314840901, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `user_profile`
--

CREATE TABLE IF NOT EXISTS `user_profile` (
  `id` int(11) NOT NULL COMMENT '用户id，和user.id同步',
  `uid` int(11) NOT NULL,
  `avatar` varchar(225) DEFAULT NULL,
  `sex` enum('帅哥','美女','保密') NOT NULL DEFAULT '保密' COMMENT '性别',
  `tennis_age` varchar(10) DEFAULT NULL COMMENT '打球年龄',
  `tennis_area` varchar(50) DEFAULT NULL COMMENT '打球区域',
  `tennis_level_own` varchar(10) DEFAULT NULL COMMENT '网球水平（自评）',
  `tennis_level_official` varchar(10) DEFAULT NULL COMMENT '网球水平（官方）',
  `idol` varchar(50) DEFAULT NULL COMMENT '偶像',
  `birthday` varchar(15) DEFAULT NULL COMMENT '生日',
  `constellation` enum('白羊','金牛','双子','巨蟹','狮子','处女','天秤','天蝎','射手','魔羯','水瓶','双鱼') DEFAULT NULL COMMENT '星座',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息';

--
-- 转存表中的数据 `user_profile`
--

INSERT INTO `user_profile` (`id`, `uid`, `avatar`, `sex`, `tennis_age`, `tennis_area`, `tennis_level_own`, `tennis_level_official`, `idol`, `birthday`, `constellation`) VALUES
(1, 1, '../../static/img/demoicon/member_default.jpg', '帅哥', '6', '上海市  杨浦区', '3.0', '3.0', '纳达尔', '1983年6月25日', '巨蟹'),
(2, 2, '../../static/img/demoicon/member_default.jpg', '帅哥', NULL, NULL, '', '', NULL, NULL, NULL),
(3, 3, '../../static/img/demoicon/member_default.jpg', '帅哥', NULL, NULL, '', '', NULL, NULL, NULL),
(4, 4, '../../static/img/demoicon/member_default.jpg', '保密', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 5, '../../static/img/demoicon/member_default.jpg', '保密', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 6, '../../static/img/demoicon/member_default.jpg', '保密', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `visits`
--

CREATE TABLE IF NOT EXISTS `visits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '来访者uid',
  `visit_uid` int(11) NOT NULL COMMENT '被访者uid',
  `username` varchar(15) NOT NULL COMMENT '来访者用户名',
  `visit_time` int(11) NOT NULL COMMENT '来访时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='来访记录' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `visits`
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
