-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2015-03-30 09:55:23
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `zhaoyu3`
--

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_admin`
--

CREATE TABLE IF NOT EXISTS `fanwe_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adm_name` varchar(255) NOT NULL,
  `adm_password` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `role_id` int(11) NOT NULL,
  `login_time` int(11) NOT NULL,
  `login_ip` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_adm_name` (`adm_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `fanwe_admin`
--

INSERT INTO `fanwe_admin` (`id`, `adm_name`, `adm_password`, `is_effect`, `is_delete`, `role_id`, `login_time`, `login_ip`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, 0, 4, 1427015101, '127.0.0.1');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_adv`
--

CREATE TABLE IF NOT EXISTS `fanwe_adv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tmpl` varchar(255) NOT NULL,
  `adv_id` varchar(255) NOT NULL,
  `code` text NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `rel_id` int(11) NOT NULL,
  `rel_table` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tmpl` (`tmpl`),
  KEY `adv_id` (`adv_id`),
  KEY `rel_id` (`rel_id`),
  KEY `rel_table` (`rel_table`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_api_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_api_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `act` varchar(30) NOT NULL,
  `api` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=97 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_api_login`
--

CREATE TABLE IF NOT EXISTS `fanwe_api_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `config` text NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `bicon` varchar(255) NOT NULL,
  `is_weibo` tinyint(1) NOT NULL,
  `dispname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `fanwe_api_login`
--

INSERT INTO `fanwe_api_login` (`id`, `name`, `config`, `class_name`, `icon`, `bicon`, `is_weibo`, `dispname`) VALUES
(13, '新浪api登录接口', 'a:3:{s:7:"app_key";s:0:"";s:10:"app_secret";s:0:"";s:7:"app_url";s:0:"";}', 'Sina', './public/attachment/201210/13/17/50792e5bbc901.gif', './public/attachment/201210/13/16/5079277a72c9d.gif', 1, '新浪微博'),
(14, '腾讯微博登录插件', 'a:3:{s:7:"app_key";s:0:"";s:10:"app_secret";s:0:"";s:7:"app_url";s:0:"";}', 'Tencent', './public/attachment/201211/06/11/509882825c183.png', './public/attachment/201211/06/11/50988287b1890.png', 1, '腾讯微博');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_apns_devices`
--

CREATE TABLE IF NOT EXISTS `fanwe_apns_devices` (
  `pid` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL,
  `appname` varchar(255) NOT NULL,
  `appversion` varchar(25) DEFAULT NULL,
  `deviceuid` char(40) NOT NULL,
  `devicetoken` char(64) NOT NULL,
  `devicename` varchar(255) NOT NULL,
  `devicemodel` varchar(100) NOT NULL,
  `deviceversion` varchar(25) NOT NULL,
  `pushbadge` enum('disabled','enabled') DEFAULT 'disabled',
  `pushalert` enum('disabled','enabled') DEFAULT 'disabled',
  `pushsound` enum('disabled','enabled') DEFAULT 'disabled',
  `development` enum('production','sandbox') CHARACTER SET latin1 NOT NULL DEFAULT 'production',
  `status` enum('active','uninstalled') NOT NULL DEFAULT 'active',
  `created` datetime NOT NULL,
  `modified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `appname` (`appname`,`appversion`,`deviceuid`),
  KEY `clientid` (`clientid`),
  KEY `devicetoken` (`devicetoken`),
  KEY `devicename` (`devicename`),
  KEY `devicemodel` (`devicemodel`),
  KEY `deviceversion` (`deviceversion`),
  KEY `pushbadge` (`pushbadge`),
  KEY `pushalert` (`pushalert`),
  KEY `pushsound` (`pushsound`),
  KEY `development` (`development`),
  KEY `status` (`status`),
  KEY `created` (`created`),
  KEY `modified` (`modified`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Store unique devices' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `fanwe_apns_devices`
--

INSERT INTO `fanwe_apns_devices` (`pid`, `clientid`, `appname`, `appversion`, `deviceuid`, `devicetoken`, `devicename`, `devicemodel`, `deviceversion`, `pushbadge`, `pushalert`, `pushsound`, `development`, `status`, `created`, `modified`) VALUES
(1, 0, '方维o2o', '1.0', 'c1e34ff19505c5b11d876bdffb451aa8', '6b2e73be2ec113452bc020ec7d05b6e1e0f09ed6ae95c6c7ec20bedd6ae3b21b', '酷酷菜', 'iPhone', '5.0.1', 'enabled', 'enabled', 'enabled', 'production', 'active', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_apns_device_history`
--

CREATE TABLE IF NOT EXISTS `fanwe_apns_device_history` (
  `pid` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` int(11) NOT NULL,
  `appname` varchar(255) NOT NULL,
  `appversion` varchar(25) DEFAULT NULL,
  `deviceuid` char(40) NOT NULL,
  `devicetoken` char(64) NOT NULL,
  `devicename` varchar(255) NOT NULL,
  `devicemodel` varchar(100) NOT NULL,
  `deviceversion` varchar(25) NOT NULL,
  `pushbadge` enum('disabled','enabled') DEFAULT 'disabled',
  `pushalert` enum('disabled','enabled') DEFAULT 'disabled',
  `pushsound` enum('disabled','enabled') DEFAULT 'disabled',
  `development` enum('production','sandbox') CHARACTER SET latin1 NOT NULL DEFAULT 'production',
  `status` enum('active','uninstalled') NOT NULL DEFAULT 'active',
  `archived` datetime NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `clientid` (`clientid`),
  KEY `devicetoken` (`devicetoken`),
  KEY `devicename` (`devicename`),
  KEY `devicemodel` (`devicemodel`),
  KEY `deviceversion` (`deviceversion`),
  KEY `pushbadge` (`pushbadge`),
  KEY `pushalert` (`pushalert`),
  KEY `pushsound` (`pushsound`),
  KEY `development` (`development`),
  KEY `status` (`status`),
  KEY `appname` (`appname`),
  KEY `appversion` (`appversion`),
  KEY `deviceuid` (`deviceuid`),
  KEY `archived` (`archived`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Store unique device history' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_apns_logs`
--

CREATE TABLE IF NOT EXISTS `fanwe_apns_logs` (
  `pid` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` varchar(64) NOT NULL,
  `fk_device` int(9) unsigned NOT NULL,
  `message` varchar(255) NOT NULL,
  `delivery` datetime NOT NULL,
  `status` enum('queued','delivered','failed') CHARACTER SET latin1 NOT NULL DEFAULT 'queued',
  `created` int(11) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `message_id` int(11) NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `clientid` (`clientid`),
  KEY `fk_device` (`fk_device`),
  KEY `status` (`status`),
  KEY `created` (`created`),
  KEY `modified` (`modified`),
  KEY `message` (`message`),
  KEY `delivery` (`delivery`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Messages to push to APNS' AUTO_INCREMENT=102 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_apns_messages`
--

CREATE TABLE IF NOT EXISTS `fanwe_apns_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `send_time` int(11) NOT NULL,
  `user_names` text NOT NULL,
  `status` tinyint(1) NOT NULL COMMENT '0:未发送 1:发送中 2:已发送',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_area`
--

CREATE TABLE IF NOT EXISTS `fanwe_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `city_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- 转存表中的数据 `fanwe_area`
--

INSERT INTO `fanwe_area` (`id`, `name`, `city_id`, `sort`, `pid`) VALUES
(8, '鼓楼区', 15, 1, 0),
(9, '晋安区', 15, 2, 0),
(10, '台江区', 15, 3, 0),
(11, '仓山区', 15, 4, 0),
(12, '马尾区', 15, 5, 0),
(13, '五一广场', 15, 6, 8),
(14, '东街口', 15, 7, 8),
(15, '福州广场', 15, 8, 8),
(16, '省体育中心', 15, 9, 8),
(17, '西禅寺', 15, 10, 8),
(18, '社会主义学院', 15, 11, 8),
(19, '西洪路', 15, 12, 8),
(20, '屏山', 15, 13, 8),
(21, '中亭街', 15, 14, 10),
(22, '六一中路', 15, 15, 10),
(23, '龙华大厦', 15, 16, 10),
(24, '时代名城', 15, 17, 10),
(25, '台江路', 15, 18, 10),
(26, '宝龙城市广场', 15, 19, 10),
(27, '万象城', 15, 20, 10),
(28, '桥亭', 15, 21, 10),
(29, '小桥头', 15, 22, 10),
(30, '交通路', 15, 23, 10),
(31, '中亭街', 15, 24, 10),
(32, '白马河', 15, 25, 10),
(33, '博美诗邦', 15, 26, 10),
(34, '观海路', 15, 27, 11),
(35, '三叉街新村', 15, 28, 11),
(36, '北京金山', 15, 29, 11),
(37, '仓山镇', 15, 30, 11),
(38, '螺洲', 15, 31, 11),
(39, '三高路', 15, 32, 11),
(40, '下渡', 15, 33, 11),
(41, '工农路', 15, 34, 11),
(42, '首山路', 15, 35, 11),
(43, '王庄新村', 15, 36, 9),
(44, '岳峰路', 15, 37, 9),
(45, '融侨东区', 15, 38, 9),
(46, '五里亭', 15, 39, 9),
(47, '五一新村', 15, 40, 9),
(48, '福光路', 15, 41, 9),
(49, '五里亭', 15, 42, 9);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_article`
--

CREATE TABLE IF NOT EXISTS `fanwe_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `cate_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `add_admin_id` int(11) NOT NULL COMMENT '发布人',
  `is_effect` tinyint(4) NOT NULL,
  `rel_url` varchar(255) NOT NULL COMMENT '自动跳转的外链',
  `update_admin_id` int(11) NOT NULL COMMENT '更新人',
  `is_delete` tinyint(4) NOT NULL,
  `click_count` int(11) NOT NULL COMMENT '点击数',
  `sort` int(11) NOT NULL,
  `seo_title` text NOT NULL,
  `seo_keyword` text NOT NULL,
  `seo_description` text NOT NULL,
  `uname` varchar(255) NOT NULL,
  `notice_page` tinyint(1) NOT NULL,
  `sub_title` varchar(255) NOT NULL,
  `brief` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`),
  KEY `create_time` (`create_time`),
  KEY `update_time` (`update_time`),
  KEY `click_count` (`click_count`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- 转存表中的数据 `fanwe_article`
--

INSERT INTO `fanwe_article` (`id`, `title`, `content`, `cate_id`, `create_time`, `update_time`, `add_admin_id`, `is_effect`, `rel_url`, `update_admin_id`, `is_delete`, `click_count`, `sort`, `seo_title`, `seo_keyword`, `seo_description`, `uname`, `notice_page`, `sub_title`, `brief`) VALUES
(20, '关于我们', '关于我们', 11, 0, 1305160934, 0, 1, '', 0, 0, 18, 11, '', '', '', '', 0, '', ''),
(37, '岁末回馈5折原价1299正品七匹狼男装外套时尚中长装羽绒服701604', '', 18, 1325451781, 1325451781, 0, 1, 'u:shop|goods|id=48', 0, 0, 1, 27, '', '', '', '', 0, '', ''),
(38, '老刘野生大鱼坊超值套餐', '', 18, 1325451857, 1325451857, 0, 1, 'u:tuan|deal|id=39', 0, 0, 0, 28, '', '', '', '', 0, '', ''),
(39, '全场新品上市', '', 18, 1325451918, 1325451918, 0, 1, 'u:shop|rec#rnew', 0, 0, 0, 29, '', '', '', 'new', 0, '', ''),
(40, '优惠券频道 更多优惠精彩', '', 18, 1325452086, 1325452086, 0, 1, 'u:youhui|index', 0, 0, 1, 30, '', '', '', 'youhui', 0, '', ''),
(27, '免责条款', '免责条款', 19, 1305160898, 1305160898, 0, 1, '', 0, 0, 3, 18, '', '', '', '', 0, '', ''),
(28, '隐私保护', '隐私保护', 19, 1305160911, 1305160911, 0, 1, '', 0, 0, 4, 19, '', '', '', '', 0, '', ''),
(29, '咨询热点', '咨询热点', 19, 1305160923, 1305160923, 0, 1, '', 0, 0, 2, 20, '', '', '', '', 0, '', ''),
(30, '联系我们', '联系我们', 19, 1305160934, 1305160934, 0, 1, '', 0, 0, 30, 21, '', '', '', '', 0, '', ''),
(31, '公司简介', '公司简介', 19, 1305160946, 1305160946, 0, 1, '', 0, 0, 92, 22, '', '', '', '', 0, '', ''),
(5, '如何抽奖', '如何抽奖', 19, 0, 1305489528, 0, 1, '', 0, 0, 3, 0, '', '', '', '', 0, '', ''),
(33, '女装新品热卖中!', '', 18, 1325451464, 1325451573, 0, 1, 'u:shop|cate|id=30', 0, 0, 2, 23, '', '', '', '', 0, '', ''),
(6, '加入我们', '加入我们', 11, 0, 1324319464, 0, 1, 'u:shop|user#register', 0, 0, 22, 2, '', '', '', '', 0, '', ''),
(7, '开放API', '', 9, 0, 1324238746, 0, 1, 'u:tuan|dhapi', 0, 0, 4, 1, '', '', '', '', 0, '', ''),
(8, 'RSS订阅', '', 9, 0, 1324083243, 0, 1, 'u:tuan|rss', 0, 0, 0, 4, '', '', '', '', 0, '', ''),
(9, '商家登录', '', 10, 0, 1324069250, 0, 1, 'u:tuan|coupon#supplier_login', 0, 0, 0, 5, '', '', '', '', 0, '', ''),
(10, '友情链接', '', 10, 0, 1324083193, 0, 1, 'u:shop|link', 0, 0, 0, 6, '', '', '', '', 0, '', ''),
(34, '品牌馆开张', '', 18, 1325451633, 1325451633, 0, 1, 'u:shop|brand', 0, 0, 0, 24, '', '', '', '', 0, '', ''),
(35, '各种特价，抢到手软！', '各种特价，抢到手软！', 18, 1325451669, 1325451669, 0, 1, '', 0, 0, 0, 25, '', '', '', '', 0, '', ''),
(36, '# 5元奖励包装评论 5000万礼卡免费领', '5元奖励包装评论 5000万礼卡免费领', 18, 1325451735, 1325451735, 0, 1, '', 0, 0, 0, 26, '', '', '', '', 0, '', ''),
(41, '2月情人密语之约“惠”生活指南！', '', 22, 1329333829, 1329333855, 0, 1, 'u:youhui|fcate', 0, 0, 1, 31, '', '', '', '', 3, '每周播报', '情人节约会哪里走？丁丁优惠带您吃喝玩乐应有尽有，网罗沪上甜点热饮，休闲娱乐，“惠”生活的亲密爱人们，赶快点击进入挑选你的情人节行程吧！'),
(42, '美罗城“因微爱情”主题活动开始啦！', '', 22, 1329334475, 1329334475, 0, 1, 'u:youhui|event', 0, 0, 0, 32, '', '', '', '', 3, '独家活动', '2012年2月11日至3月14日，微博“微爱情@美罗城”情人节晒出爱的礼物或宣言，即有机会赢取价值20000元大奖“马尔代夫”双人游、奔驰情人节礼品。'),
(43, '“爱”月情人节 找情侣送约会基金', '', 22, 1329334503, 1329334503, 0, 1, 'u:youhui|event', 0, 0, 0, 33, '', '', '', '', 3, '全城热恋', '圣诞节一个人过，情人节还想一个人过？在世界末日前的最后一个情人节，丁丁网为你找到最match的TA！更有200元约会基金为你们随时待命……');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_article_cate`
--

CREATE TABLE IF NOT EXISTS `fanwe_article_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `brief` varchar(255) NOT NULL COMMENT '描述',
  `pid` int(11) NOT NULL,
  `is_effect` tinyint(4) NOT NULL,
  `is_delete` tinyint(4) NOT NULL,
  `type_id` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `type_id` (`type_id`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- 转存表中的数据 `fanwe_article_cate`
--

INSERT INTO `fanwe_article_cate` (`id`, `title`, `brief`, `pid`, `is_effect`, `is_delete`, `type_id`, `sort`) VALUES
(11, '公司信息', '', 0, 1, 0, 1, 4),
(10, '商务合作', '', 0, 1, 0, 1, 2),
(9, '获取更新', '', 0, 1, 0, 1, 3),
(7, '用户帮助', '', 0, 1, 0, 1, 1),
(18, '商城公告', '', 0, 1, 0, 2, 5),
(19, '系统文章', '', 0, 1, 0, 3, 6),
(22, '热门推荐', '', 0, 1, 0, 2, 7);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_attr_stock`
--

CREATE TABLE IF NOT EXISTS `fanwe_attr_stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `attr_cfg` text NOT NULL,
  `stock_cfg` int(11) NOT NULL,
  `attr_str` text NOT NULL,
  `buy_count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=92 ;

--
-- 转存表中的数据 `fanwe_attr_stock`
--

INSERT INTO `fanwe_attr_stock` (`id`, `deal_id`, `attr_cfg`, `stock_cfg`, `attr_str`, `buy_count`) VALUES
(89, 40, 'a:2:{i:12;s:6:"红色";i:13;s:6:"大码";}', 10, '红色大码', 0),
(90, 40, 'a:2:{i:12;s:6:"红色";i:13;s:6:"中码";}', 5, '红色中码', 0),
(91, 40, 'a:2:{i:12;s:6:"红色";i:13;s:6:"均码";}', 1000, '红色均码', 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_auto_cache`
--

CREATE TABLE IF NOT EXISTS `fanwe_auto_cache` (
  `cache_key` varchar(100) NOT NULL,
  `cache_type` varchar(100) NOT NULL,
  `cache_data` text NOT NULL,
  `cache_time` int(11) NOT NULL,
  PRIMARY KEY (`cache_key`,`cache_type`),
  KEY `cache_type` (`cache_type`),
  KEY `cache_key` (`cache_key`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_brand`
--

CREATE TABLE IF NOT EXISTS `fanwe_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `brand_promote_logo` varchar(255) NOT NULL,
  `brief` text NOT NULL,
  `sort` int(11) NOT NULL,
  `shop_cate_id` int(11) NOT NULL,
  `brand_promote` tinyint(1) NOT NULL,
  `begin_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `time_status` tinyint(1) NOT NULL COMMENT '0:已上线 1:未上线 2:已过期',
  `dy_count` int(11) DEFAULT '0' COMMENT '品牌订阅数量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `fanwe_brand`
--

INSERT INTO `fanwe_brand` (`id`, `name`, `logo`, `brand_promote_logo`, `brief`, `sort`, `shop_cate_id`, `brand_promote`, `begin_time`, `end_time`, `time_status`, `dy_count`) VALUES
(8, '耐克', './public/attachment/201201/4f0125515a461.gif', '', '耐克商标，图案是个小钩子，造型简洁有力，急如闪电，一看就让人想到使用耐克体育用品后所产生的速度和爆发力。', 2, 25, 0, 0, 0, 0, 0),
(7, '达芙妮', './public/attachment/201201/4f0124a1e1447.gif', '', '达芙妮的名字来源于希腊女神Daphne与太阳神阿波罗的爱情神话，空间主题的设计象征着对爱亘古不变的追逐。', 1, 24, 0, 0, 0, 0, 0),
(9, '南极人', './public/attachment/201201/4f012585146cb.gif', '', '南极人成立于1998年，累计销售额近90亿，拥有30000多个销售网点，品牌覆盖率高达89%，14年中国针织行业家喻户晓的领先品牌，屡次创造行业奇迹，是中国纺织行业的领导品牌.', 3, 24, 0, 0, 0, 0, 0),
(10, '茵佳妮', './public/attachment/201201/4f0125db13be8.gif', '', '“茵佳妮”不仅仅为消费者提供服装，更注重为顾客提供全新的品牌体验与内心共鸣，契合顾客群文化内涵注入品牌力量。“incolour茵佳妮”需要的是顾客发自内心的认可与热爱，而并非单一的着装感受。', 4, 24, 0, 0, 0, 0, 0),
(11, '歌莉娅', './public/attachment/201201/4f0126234229b.gif', '', '歌莉娅, 诞生于1995年以来, 不断地周游列国探索采撷, 将潮流与各地文化融合, 创作时尚又具有气质的女性服饰。我们相信「旅行就是生活」--世界著名童话故事大师安徒生的经典名言.', 5, 24, 0, 0, 0, 0, 0),
(12, '七匹狼', './public/attachment/201201/4f01322901e23.gif', '', '七匹狼狼文化的理念是勇敢，忠诚，沟通，力量，团队，不屈，自信。追逐人生，男人不止一面。', 6, 31, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_brand_dy`
--

CREATE TABLE IF NOT EXISTS `fanwe_brand_dy` (
  `uid` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`brand_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_conf`
--

CREATE TABLE IF NOT EXISTS `fanwe_conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `group_id` int(11) NOT NULL,
  `input_type` tinyint(1) NOT NULL COMMENT '?????????????? 0:??????? 1:?????????? 2:????? 3:????',
  `value_scope` text NOT NULL COMMENT '??????',
  `is_effect` tinyint(1) NOT NULL,
  `is_conf` tinyint(1) NOT NULL COMMENT '????????? 0: ??????  1:????????',
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=177 ;

--
-- 转存表中的数据 `fanwe_conf`
--

INSERT INTO `fanwe_conf` (`id`, `name`, `value`, `group_id`, `input_type`, `value_scope`, `is_effect`, `is_conf`, `sort`) VALUES
(1, 'DEFAULT_ADMIN', 'admin', 1, 0, '', 1, 0, 0),
(2, 'URL_MODEL', '0', 1, 1, '0,1', 1, 1, 3),
(3, 'AUTH_KEY', 'zhaoyu', 1, 0, '', 1, 1, 4),
(4, 'TIME_ZONE', '8', 1, 1, '0,8', 1, 1, 1),
(5, 'ADMIN_LOG', '1', 1, 1, '0,1', 0, 1, 0),
(6, 'DB_VERSION', '1.0', 0, 0, '', 1, 0, 0),
(7, 'DB_VOL_MAXSIZE', '8000000', 1, 0, '', 1, 1, 11),
(8, 'WATER_MARK', './public/attachment/201303/23/20/514d9f52929ca.png', 2, 2, '', 1, 1, 48),
(10, 'BIG_WIDTH', '500', 2, 0, '', 0, 0, 49),
(11, 'BIG_HEIGHT', '500', 2, 0, '', 0, 0, 50),
(12, 'SMALL_WIDTH', '200', 2, 0, '', 0, 0, 51),
(13, 'SMALL_HEIGHT', '200', 2, 0, '', 0, 0, 52),
(14, 'WATER_ALPHA', '75', 2, 0, '', 1, 1, 53),
(15, 'WATER_POSITION', '5', 2, 1, '1,2,3,4,5', 1, 1, 54),
(16, 'MAX_IMAGE_SIZE', '3000000', 2, 0, '', 1, 1, 55),
(17, 'ALLOW_IMAGE_EXT', 'jpg,gif,png', 2, 0, '', 1, 1, 56),
(18, 'BG_COLOR', '#ffffff', 2, 0, '', 0, 0, 57),
(19, 'IS_WATER_MARK', '1', 2, 1, '0,1', 1, 1, 58),
(20, 'TEMPLATE', 'fanwe', 1, 0, '', 1, 1, 17),
(21, 'SITE_LOGO', './public/attachment/images/201503/27/00/551433ba48364.png', 1, 2, '', 1, 1, 19),
(173, 'SEO_TITLE', '兆余大学生众筹', 1, 0, '', 1, 1, 20),
(25, 'REPLY_ADDRESS', 'info@fanwe.com', 3, 0, '', 1, 1, 77),
(23, 'MAIL_ON', '1', 3, 1, '0,1', 1, 1, 72),
(24, 'SMS_ON', '0', 3, 1, '0,1', 1, 1, 78),
(26, 'PUBLIC_DOMAIN_ROOT', '', 2, 0, '', 1, 1, 59),
(27, 'APP_MSG_SENDER_OPEN', '0', 1, 1, '0,1', 1, 1, 9),
(28, 'ADMIN_MSG_SENDER_OPEN', '0', 1, 1, '0,1', 1, 1, 10),
(29, 'GZIP_ON', '0', 1, 1, '0,1', 1, 1, 2),
(42, 'SITE_NAME', '兆余大学生众筹', 1, 0, '', 1, 1, 1),
(30, 'CACHE_ON', '0', 1, 1, '0,1', 1, 1, 7),
(31, 'EXPIRED_TIME', '0', 1, 0, '', 1, 1, 5),
(32, 'TMPL_DOMAIN_ROOT', '', 2, 0, '0', 0, 0, 62),
(33, 'CACHE_TYPE', 'File', 1, 1, 'File,Xcache,Memcached', 1, 1, 7),
(34, 'MEMCACHE_HOST', '127.0.0.1:11211', 1, 0, '', 1, 1, 8),
(35, 'IMAGE_USERNAME', 'admin', 2, 0, '', 1, 1, 60),
(36, 'IMAGE_PASSWORD', 'admin', 2, 4, '', 1, 1, 61),
(37, 'DEAL_MSG_LOCK', '0', 0, 0, '', 0, 0, 0),
(38, 'SEND_SPAN', '2', 1, 0, '', 1, 1, 85),
(39, 'TMPL_CACHE_ON', '0', 1, 1, '0,1', 1, 1, 6),
(40, 'DOMAIN_ROOT', '', 1, 0, '', 1, 0, 10),
(41, 'COOKIE_PATH', '/', 1, 0, '', 1, 1, 10),
(43, 'INTEGRATE_CFG', '', 0, 0, '', 1, 0, 0),
(44, 'INTEGRATE_CODE', '', 0, 0, '', 1, 0, 0),
(172, 'PAY_RADIO', '0.1', 3, 0, '', 1, 1, 10),
(176, 'SITE_LICENSE', '兆余大学生众筹', 1, 0, '', 1, 1, 22),
(174, 'SEO_KEYWORD', '兆余 大学生 众筹', 1, 0, '', 1, 1, 21),
(175, 'SEO_DESCRIPTION', '兆余大学生众筹', 1, 0, '', 1, 1, 22);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_coupon_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_coupon_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_sn` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  `msg` text NOT NULL,
  `query_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_daren_submit`
--

CREATE TABLE IF NOT EXISTS `fanwe_daren_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `is_publish` tinyint(1) NOT NULL,
  `create_time` int(11) NOT NULL,
  `reason` text NOT NULL,
  `daren_title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `name_match` text NOT NULL,
  `name_match_row` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `source_vedio` varchar(255) NOT NULL,
  `vedio` varchar(255) NOT NULL,
  `deal_days` int(11) NOT NULL COMMENT '??????????????????????????',
  `begin_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `limit_price` double(20,4) NOT NULL,
  `brief` text NOT NULL,
  `description` text NOT NULL,
  `comment_count` int(11) NOT NULL,
  `support_count` int(11) NOT NULL COMMENT '???????',
  `focus_count` int(11) NOT NULL,
  `view_count` int(11) NOT NULL,
  `log_count` int(11) NOT NULL,
  `support_amount` double(20,4) NOT NULL COMMENT '????????????????limit_price(???????)',
  `pay_amount` double(20,4) NOT NULL COMMENT '?????????????????????????????????????????\r\n??support_amount*???????+delivery_fee_amount',
  `delivery_fee_amount` double(20,4) NOT NULL,
  `create_time` int(11) NOT NULL,
  `seo_title` text NOT NULL,
  `seo_keyword` text NOT NULL,
  `seo_description` text NOT NULL,
  `tags` text NOT NULL,
  `tags_match` text NOT NULL,
  `tags_match_row` text NOT NULL,
  `success_time` int(11) NOT NULL,
  `is_success` tinyint(1) NOT NULL,
  `cate_id` int(11) NOT NULL,
  `province` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `is_recommend` tinyint(1) NOT NULL COMMENT '??????',
  `is_classic` tinyint(1) NOT NULL COMMENT '???????',
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `begin_time` (`begin_time`),
  KEY `end_time` (`end_time`),
  KEY `is_effect` (`is_effect`),
  KEY `limit_price` (`limit_price`),
  KEY `comment_count` (`comment_count`),
  KEY `support_count` (`support_count`),
  KEY `focus_count` (`focus_count`),
  KEY `view_count` (`view_count`),
  KEY `log_count` (`log_count`),
  KEY `support_amount` (`support_amount`),
  KEY `create_time` (`create_time`),
  KEY `is_success` (`is_success`),
  KEY `cate_id` (`cate_id`),
  KEY `sort` (`sort`),
  KEY `is_recommend` (`is_recommend`),
  KEY `is_classic` (`is_classic`),
  KEY `is_delete` (`is_delete`),
  FULLTEXT KEY `tags_match` (`tags_match`),
  FULLTEXT KEY `name_match` (`name_match`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=81 ;

--
-- 转存表中的数据 `fanwe_deal`
--

INSERT INTO `fanwe_deal` (`id`, `name`, `name_match`, `name_match_row`, `image`, `source_vedio`, `vedio`, `deal_days`, `begin_time`, `end_time`, `is_effect`, `limit_price`, `brief`, `description`, `comment_count`, `support_count`, `focus_count`, `view_count`, `log_count`, `support_amount`, `pay_amount`, `delivery_fee_amount`, `create_time`, `seo_title`, `seo_keyword`, `seo_description`, `tags`, `tags_match`, `tags_match_row`, `success_time`, `is_success`, `cate_id`, `province`, `city`, `user_id`, `sort`, `user_name`, `is_recommend`, `is_classic`, `is_delete`) VALUES
(55, '原创DIY桌面游戏《功夫》《黄金密码》期待您的支持', 'ux21151ux22827,ux26700ux38754,ux26399ux24453,ux23494ux30721,ux40644ux37329,ux25903ux25345,ux21407ux21019,ux28216ux25103,ux68ux73ux89,ux21407ux21019ux68ux73ux89ux26700ux38754ux28216ux25103ux12298ux21151ux22827ux12299ux12298ux40644ux37329ux23494ux30721ux12299ux26399ux24453ux24744ux30340ux25903ux25345,ux21407ux21019ux68ux73ux89ux26700ux38754ux28216ux25103ux12298ux21151ux22827ux12299ux12298ux40644ux37329ux23494ux30721ux12299ux26399ux24453ux24744ux30340ux25903ux25345,ux21407ux21019ux68ux73ux89ux26700ux38754ux28216ux25103ux12298ux21151ux22827ux12299ux12298ux40644ux37329ux23494ux30721ux12299ux26399ux24453ux24744ux30340ux25903ux25345,ux21407ux21019ux68ux73ux89ux26700ux38754ux28216ux25103ux12298ux21151ux22827ux12299ux12298ux40644ux37329ux23494ux30721ux12299ux26399ux24453ux24744ux30340ux25903ux25345,ux21407ux21019ux68ux73ux89ux26700ux38754ux28216ux25103ux12298ux21151ux22827ux12299ux12298ux40644ux37329ux23494ux30721ux12299ux26399ux24453ux24744ux30340ux25903ux25345', '功夫,桌面,期待,密码,黄金,支持,原创,游戏,DIY,原创DIY桌面游戏《功夫》《黄金密码》期待您的支持,原创DIY桌面游戏《功夫》《黄金密码》期待您的支持,原创DIY桌面游戏《功夫》《黄金密码》期待您的支持,原创DIY桌面游戏《功夫》《黄金密码》期待您的支持,原创DIY桌面游戏《功夫》《黄金密码》期待您的支持', './public/attachment/201211/07/10/021e2f6812298468cfab78cbd07b90ee85.jpg', '', '', 1500, 1351710606, 1420465012, 1, 3000.0000, '这次给大家带来的是我们自己原创的两个桌面游戏《功夫》和《黄金密码》，由于我们并非专业的桌游制作公司，希望大家能够喜欢并支持我们！', '这次给大家带来的是我们自己原创的两个桌面游戏《功夫》和《黄金密码》，由于我们并非专业的桌游制作公司，所以在游戏的美术、包装、宣传等方面都会存在一些不足。但本次带来的两个作品都是我们利用几乎所有的业余时间尽心尽力制作出来的，希望大家能够喜欢并支持我们！<p><br />\r\n</p>\r\n<h3>我想要做什么</h3>\r\n<p>&nbsp; 桌面游戏是一种健康的休闲方式，你不用整天面对电脑的辐射，同时也让你可以不再过度沉迷于虚拟的网络世界中。因为桌面游戏方式的特殊性，能使你更加注重加强与人面对面的交流，提高自己的语言和沟通能力，还可以在现实生活中用这种轻松愉快的休闲方式结交更多的朋友。</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;我们就是这样一群喜爱桌游，同时喜欢设计桌游的年轻人，我们并非专业的桌游制作团队，我们只是凭着对桌游的爱好开始了对桌游设计的探索。我们希望通过努力，将桌游的快乐带给更多喜欢轻松休闲、热爱生活的朋友。但是，我们的资金及能力有限，需要得到大家的帮助与支持，才能实现这样的梦想。也希望您在支持我们的同时收获一份快乐和惊喜！</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;我们这次将原创的桌面游戏《功夫》和《黄金密码》一起放到这里，希望得到大家的支持！&nbsp;&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><br />\r\n<img src="./public/attachment/201211/07/16/da4f6f7e11b249dcf71bf5e9c6a86d8a83o5700.jpg" rel="0" /><br />\r\n<br />\r\n</p>\r\n<p>游戏人数：2-4人</p>\r\n<p>适合年龄：8+</p>\r\n<p>游戏时间：10-30分钟</p>\r\n<p>游戏类型：手牌管理</p>\r\n<p>游戏背景：你在游戏中扮演一名武者，灵活运用你掌握的功夫（手牌）和装备（装备牌）对抗其他的武者并最终打败他们。</p>\r\n<p>游戏目标：扣除敌方所有人物的体力为胜。</p>\r\n游戏配件：69张动作牌（手牌）、6张道具牌、2张血量牌（需自行制作）<p><br />\r\n</p>\r\n<p><img src="./public/attachment/201211/07/16/7a404c90f81ca1368ff0f5b24e26a5d781o5700.jpg" rel="0" /><br />\r\n<br />\r\n</p>\r\n<p>游戏过程：游戏的每个回合分两个阶段，第一阶段为热身阶段，获得热身阶段胜利的玩家成为第二阶段（攻击阶段）的主导者，由他决定第二阶段如何进行。</p>\r\n<p>&nbsp;&nbsp;&nbsp;《功夫》用卡牌较好的模拟再现了格斗中的一些乐趣，比如热身阶段的猜招、攻击阶段一招一式的过招，同时结合手牌管理的一些特点，打出组合招式及连招，配合你获得的道具，最终战胜对手。在游戏过程中，当你取得一定的优势时，也不能掉以轻心，形式可能会因为你的任何一个破绽而发生逆转，这与格斗、搏击的情况十分相似。所以如何保持良好的心态，灵活的运用手牌才是这个游戏制胜的关键所在。（具体规则见最下方及本项目动态）</p>\r\n<p><br />\r\n</p>\r\n<p><br />\r\n</p>\r\n<p>游戏人数：3-4人</p>\r\n<p>适合年龄：8+</p>\r\n<p>游戏时间：20-40分钟</p>\r\n<p>游戏类型：逻辑推理、谜题设计</p>\r\n<p>游戏背景：二战时期，德军将一批黄金铸成金条，分别保存在3个金库里，并派重兵把守。为了得到这批黄金，美军重金收买了一个德军守卫为内奸，内奸成功获取了金库的密码破解方法，并将密码破解方法以暗号的形式告知了美军特工。但是，与此同时德军也发现了暗号，并且金库的守卫非常森严，解开金库密码的时间只有1分钟……玩家在这个游戏中分别扮演德军、德军内奸、美军特工。如何设计出德军看不懂，美军特工又能在1分钟内解出的暗号密码。就看你的表现啦！</p>\r\n<p>游戏目标：根据身份的不同，任务也不同。德军需解开密码保住金库，特工需设置密码阻止德军解密，美军需解开密码同时选择金库获得黄金。</p>\r\n<p>游戏配件：10张密码牌、12张空箱牌、24张黄金牌、沙漏1个、草稿纸和笔（自备）</p>\r\n<p>游戏过程：每人分别扮演一次特工、德军、美军，完成后计算每人所获得的黄金数量，黄金最多的玩家获胜。</p>\r\n<p><br />\r\n<br />\r\n</p>\r\n<p></p>\r\n', 0, 1, 0, 16, 1, 15.0000, 18.5000, 5.0000, 1413120536, '', '', '', '功夫 桌面 期待 密码 黄金 支持 原创 游戏 DIY', 'ux21151ux22827,ux26700ux38754,ux26399ux24453,ux23494ux30721,ux40644ux37329,ux25903ux25345,ux21407ux21019,ux28216ux25103,ux68ux73ux89', '功夫,桌面,期待,密码,黄金,支持,原创,游戏,DIY', 0, 0, 8, '广东', '佛山', 21, 0, 'myself', 1, 1, 0),
(56, '拥有自己的咖啡馆', 'ux21654ux21857ux39302,ux25317ux26377,ux33258ux24049,ux25317ux26377ux33258ux24049ux30340ux21654ux21857ux39302', '咖啡馆,拥有,自己,拥有自己的咖啡馆', './public/attachment/201211/07/11/40e44eb97b0ca5aed5148e59c2cc8dcb95.jpg', '', '', 3030, 1351711495, 1423975499, 1, 5000.0000, '每个人心目中都有一个属于自己的咖啡馆,我们也是.但我们想要的咖啡馆，又不仅仅是咖啡馆', '<h3>关于我</h3>\r\n<p>每个人心目中都有一个属于自己的咖啡馆<br />\r\n我们也是<br />\r\n但我们想要的咖啡馆，又不仅仅是咖啡馆<br />\r\n这里除了售卖咖啡和甜点，还有旅行的梦想<br />\r\n我们想要一个“窝”，一个无论在出发前还是归来后随时开放的地方<br />\r\n梦想着有一天<br />\r\n我们可以带着咖啡的香气出发<br />\r\n又满载着旅行的收获回到充满咖啡香气的小“窝”</p>\r\n<h3>我想要做什么</h3>\r\n<p>以图文并茂的方式简洁生动地说明你的项目，让大家一目了然，这会决定是否将你的项目描述继续看下去。建议不超过300字。<br />\r\n</p>\r\n<p><img src="./public/attachment/201211/07/16/0482ef5836f6745af0f59ff40d40805765o5700.jpg" rel="0" /><br />\r\n<br />\r\n<br />\r\n</p>\r\n<h3>为什么我需要你的支持</h3>\r\n<p>这是加分项。说说你的项目不同寻常的特色、资金用途、以及大家支持你的理由。这会让更多人能够支持你，不超过200个汉字。<br />\r\n<br />\r\n</p>\r\n<h3>我的承诺与回报</h3>\r\n让大家感到你对待项目的认真程度，鞭策你将项目执行最终成功。同时向大家展示一下你为支持者准备的回报，来吸引更多人支持你。<br />\r\n<br />\r\n<img src="./public/attachment/201211/07/16/2ae4c7149cfd31f12d91453713322f9076o5700.jpg" rel="0" /><br />\r\n<br />\r\n<br />', 0, 11, 1, 17, 1, 5500.0000, 4950.0000, 0.0000, 1352229954, '', '', '', '咖啡馆 拥有 自己', 'ux21654ux21857ux39302,ux25317ux26377,ux33258ux24049', '咖啡馆,拥有,自己', 1352230293, 1, 1, '北京', '东城区', 18, 0, 'fzmatthew', 1, 1, 0),
(57, '短片电影《Blind Love》', 'ux30701ux29255,ux30005ux24433,ux66ux108ux105ux110ux100,ux76ux111ux118ux101,ux30701ux29255ux30005ux24433ux12298ux66ux108ux105ux110ux100ux76ux111ux118ux101ux12299,ux30701ux29255ux30005ux24433ux12298ux66ux108ux105ux110ux100ux76ux111ux118ux101ux12299,ux30701ux29255ux30005ux24433ux12298ux66ux108ux105ux110ux100ux76ux111ux118ux101ux12299,ux30701ux29255ux30005ux24433ux12298ux66ux108ux105ux110ux100ux76ux111ux118ux101ux12299', '短片,电影,Blind,Love,短片电影《Blind Love》,短片电影《Blind Love》,短片电影《Blind Love》,短片电影《Blind Love》', './public/attachment/201211/07/11/0c067c4522bba51595c324028be7070d11.jpg', 'http://player.youku.com/player.php/sid/XMzgyNjMzNDA4/v.swf', 'http://v.youku.com/v_show/id_XMzgyNjMzNDA4.html', 300, 1349034009, 1427766813, 1, 3000.0000, '我叫武秋辰， 美国圣地亚哥大学影视专业硕士毕业。这是我在毕业后的第一部独立电影作品，讲述了一个关于盲人画家的唯美爱情故事。', '<p>我叫武秋辰， 美国圣地亚哥大学影视专业硕士毕业。这是我在毕业后的第一部独立电影作品，讲述了一个关于盲人画家的唯美爱情故事。</p>\r\n <p>这是一个需要爱与被爱的世界，然而在我们面对这纷繁复杂多变的世界时，我们如何过滤掉那迷乱双眼的尘沙找到真爱？我们在爱中得救，在爱中迷失。我们过度相信我们用双眼所见的，却忘记听从内心最真的感受！<br />\r\n<br />\r\n</p>\r\n<p>我们一路奔跑、一路追逐，生活的洪流把我们涌向未来不确定的方向，我们有着一双能望穿苍穹的眼睛，却不断的迷失在路途中。如果有一天我们的双眼失去光明……<br />\r\n<br />\r\n</p>\r\n<p>真爱是否还遥远？<br />\r\n<br />\r\n</p>\r\n<p>导演武秋辰将用电影语言为我们讲述一位盲人画家的爱情故事，如同她所写道的：“我们视觉正常的人很容易被表象所迷惑，而我们的触觉，听觉和嗅觉却非常的精准，给我们带来更丰富的感知。”当我们不仅凭双眼去认识这个世界的时候，也许答案就在那里！<br />\r\n<br />\r\n</p>\r\n<p>为了使影片更富深入性、更具专业性，导演请来了好莱坞的职业演员，就连剧中的盲人画像也由美国著名画家OlyaLusina特为此片创作。<br />\r\n<br />\r\n</p>\r\n<p>该片不仅是一个远赴美国实现梦想的中国女孩的心血之作，同时也深刻展现了一个盲人心中的世界，从“他”的角度为因爱迷失的人们找到了一个诗意的出口。<br />\r\n<br />\r\n</p>\r\n<p>在这里，真诚地感谢您的关注！关注武秋辰和她的《BlindLove》！<br />\r\n<br />\r\n</p>\r\n<h3>自我介绍<br />\r\n</h3>\r\n<p>我是一个在美国学电影做电影的中国女孩。在美国圣地亚哥大学电影系求学的过程中，我学会了编剧，导演，拍摄和剪辑，参与了几十部电影的创作。“盲爱”是我在硕士毕业后自编自导的第一部独立电影作品。</p>\r\n<p><br />\r\n</p>\r\n<p><img src="./public/attachment/201211/07/16/148cb883cbb170735c331125a96c11e162o5700.jpg" rel="0" /><br />\r\n<br />\r\n</p>\r\n<p><br />\r\n</p>\r\n<p><img src="./public/attachment/201211/07/16/875016977d65ee2cc679ab0cfd7a7f6620o5700.jpg" rel="0" /><br />\r\n<br />\r\n<br />\r\n<br />\r\n</p>\r\n', 0, 1, 0, 14, 1, 60.0000, 54.0000, 0.0000, 1413120495, '', '', '', '短片 电影 Blind Love', 'ux30701ux29255,ux30005ux24433,ux66ux108ux105ux110ux100,ux76ux111ux118ux101', '短片,电影,Blind,Love', 0, 0, 3, '青海', '玉树', 17, 0, 'zhaoyu', 1, 1, 0),
(58, '流浪猫的家—爱天使公益咖啡馆的重建需要大家的力量！', 'ux21654ux21857ux39302,ux37325ux24314,ux20844ux30410,ux27969ux28010,ux21147ux37327,ux38656ux35201,ux22825ux20351,ux22823ux23478,ux27969ux28010ux29483ux30340ux23478ux8212ux29233ux22825ux20351ux20844ux30410ux21654ux21857ux39302ux30340ux37325ux24314ux38656ux35201ux22823ux23478ux30340ux21147ux37327ux65281,ux27969ux28010ux29483ux30340ux23478ux8212ux29233ux22825ux20351ux20844ux30410ux21654ux21857ux39302ux30340ux37325ux24314ux38656ux35201ux22823ux23478ux30340ux21147ux37327ux65281,ux27969ux28010ux29483ux30340ux23478ux8212ux29233ux22825ux20351ux20844ux30410ux21654ux21857ux39302ux30340ux37325ux24314ux38656ux35201ux22823ux23478ux30340ux21147ux37327ux65281,ux27969ux28010ux29483ux30340ux23478ux8212ux29233ux22825ux20351ux20844ux30410ux21654ux21857ux39302ux30340ux37325ux24314ux38656ux35201ux22823ux23478ux30340ux21147ux37327ux65281,ux27969ux28010ux29483ux30340ux23478ux8212ux29233ux22825ux20351ux20844ux30410ux21654ux21857ux39302ux30340ux37325ux24314ux38656ux35201ux22823ux23478ux30340ux21147ux37327ux65281,ux27969ux28010ux29483ux30340ux23478ux8212ux29233ux22825ux20351ux20844ux30410ux21654ux21857ux39302ux30340ux37325ux24314ux38656ux35201ux22823ux23478ux30340ux21147ux37327ux65281,ux27969ux28010ux29483ux30340ux23478ux8212ux29233ux22825ux20351ux20844ux30410ux21654ux21857ux39302ux30340ux37325ux24314ux38656ux35201ux22823ux23478ux30340ux21147ux37327ux65281', '咖啡馆,重建,公益,流浪,力量,需要,天使,大家,流浪猫的家—爱天使公益咖啡馆的重建需要大家的力量！,流浪猫的家—爱天使公益咖啡馆的重建需要大家的力量！,流浪猫的家—爱天使公益咖啡馆的重建需要大家的力量！,流浪猫的家—爱天使公益咖啡馆的重建需要大家的力量！,流浪猫的家—爱天使公益咖啡馆的重建需要大家的力量！,流浪猫的家—爱天使公益咖啡馆的重建需要大家的力量！,流浪猫的家—爱天使公益咖啡馆的重建需要大家的力量！', './public/attachment/201211/07/11/438813e6d75cb84c6b0df8ffbad7aa8c31.jpg', 'http://player.youku.com/player.php/sid/XMjYwMTc3MDY0/v.swf', 'http://v.youku.com/v_show/id_XMjYwMTc3MDY0.html', 500, 1352145022, 1430668225, 1, 3000.0000, '爱天使成立的猫天使驿站三年多收养救助了两百余只的流浪猫并为它们找到了一个个温暖的家。', '<p>爱天使成立的猫天使驿站三年多收养救助了两百余只的流浪猫并为它们找到了一个个温暖的家。爱天使是一种爱，更是一种生活！坚持个人信念的我一直努力活出这个世上不一般的价值人生。那就是不追求自己能拥有什么而在能为自己以外的生命带去什么。。。爱天使在今年因合同到期而到了转折点，重建是艰辛的却也坚信必将更加强大。</p>\r\n <h3>【关于我】——将救助流浪猫视为自己的事业！</h3>\r\n<p>首先做个自我介绍：</p>\r\n<p>我叫李文婷，英文名ANGELLI。</p>\r\n<p>是一名爱猫如命的“狂热分子”，</p>\r\n<p>作为流浪猫的代理麻麻已收养救助过两百余只猫咪；</p>\r\n<p>00年在大学校园宿舍开始拨号上网的网络生活，</p>\r\n<p>担任系学生会副主席及宣传部长等，</p>\r\n<p>参与系女篮队、校诗朗诵比赛、主持系选举活动，<br />\r\n</p>\r\n<p>组织带领系队作为一辩参加校辩论赛获得季军，</p>\r\n<p>毕业后于厦门海尔及三五互联等公司工作近六年。</p>\r\n<p>工作中一直表现突出主持公司千人晚会并荣获过部门最高荣誉奖。</p>\r\n<p>08年辞去部门经理一职后成为SOHO一族，</p>\r\n<p>经营LA爱天使韩国饰品成为淘宝卖家。</p>\r\n<p>于短短半年间毫无虚假的升为二钻一年后升至三钻，</p>\r\n<p>于09年6月20日在老爸大力的支持下经营爱天使咖啡馆，</p>\r\n<p>于2010年10月创办猫天使驿站正式收养救助流浪猫，</p>\r\n<p>先后接受了海峡导报厦门卫视等媒体及大学生的多次采访报道。<br />\r\n</p>\r\n<p>三年间收养救助了两百余只流浪猫并为它们找到了一个个温暖的家。</p>\r\n<p>与仔仔、全全、QQ、EE四只咪咪一起相伴爱天使救命流浪猫的生活。</p>\r\n<p>爱天使就是流浪猫们的家，是我将用余生为之奋斗的事业！</p>\r\n将“关爱弱小弱势生命，传递爱分享快乐”救助流浪猫视为毕生为之努力的事业。<br />\r\n<br />\r\n<img src="./public/attachment/201211/07/16/dda29128a6310c273da111f1f30296c172o5700.jpg" rel="0" /><br />\r\n<br />\r\n<br />\r\n<br />\r\n<img src="./public/attachment/201211/07/16/c7650c3dd93e5585dbfad780ba3bbced31o5700.jpg" rel="0" /><br />\r\n<br />\r\n<br />\r\n', 1, 2, 1, 8, 1, 5000.0000, 4500.0000, 0.0000, 1413120659, '', '', '', '咖啡馆 重建 公益 流浪 力量 需要 天使 大家', 'ux21654ux21857ux39302,ux37325ux24314,ux20844ux30410,ux27969ux28010,ux21147ux37327,ux38656ux35201,ux22825ux20351,ux22823ux23478', '咖啡馆,重建,公益,流浪,力量,需要,天使,大家', 1352231704, 1, 7, '广东', '广州', 17, 0, 'zhaoyu', 1, 1, 0),
(61, 'test2', 'ux116ux101ux115ux116ux50', 'test2', './public/attachment/201411/17/03/1f740413fe11def82d99f202c4b7561355.jpg', '', '', 1100, 1416137286, 1433223688, 1, 222.0000, '', '<h3>关于我</h3>\r\n<p>向支持者介绍一下你自己，以及你与所发起的项目之间的背景。这样有助于拉近你与支持者之间的距离。建议不超过100字。<br />\r\n<br />\r\n</p>\r\n<h3>我想要做什么</h3>\r\n<p>以图文并茂的方式简洁生动地说明你的项目，让大家一目了然，这会决定是否将你的项目描述继续看下去。建议不超过300字。<br />\r\n<br />\r\n</p>\r\n<h3>为什么我需要你的支持</h3>\r\n<p>这是加分项。说说你的项目不同寻常的特色、资金用途、以及大家支持你的理由。这会让更多人能够支持你，不超过200个汉字。<br />\r\n<br />\r\n</p>\r\n<h3>我的承诺与回报</h3>\r\n让大家感到你对待项目的认真程度，鞭策你将项目执行最终成功。同时向大家展示一下你为支持者准备的回报，来吸引更多人支持你。', 0, 0, 0, 2, 0, 0.0000, 0.0000, 0.0000, 1416139557, '', '', '', 'test2', 'ux116ux101ux115ux116ux50', 'test2', 0, 0, 5, '甘肃', '嘉峪关', 19, 0, 'test', 0, 0, 0),
(63, '不下雪的北方一夜', 'ux19979ux38634,ux21271ux26041,ux19981ux19979ux38634ux30340ux21271ux26041ux19968ux22812', '下雪,北方,不下雪的北方一夜', './public/attachment/201412/09/00/c0ea35595c88907a4e3368eb5d74124843.jpg', 'http://player.youku.com/player.php/sid/XODM4OTY5MzM2/v.swf', 'http://v.youku.com/v_show/id_XODM4OTY5MzM2', 50, 1418028964, 1423731367, 1, 50000.0000, '由一个人，一个家庭，看到一段历史，一个社会群体，一段变动的时代。', '<h3>关于我</h3>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">我们是一个团队，曾经的大学校友。</div>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">在大学期间，我们曾一起实现过对于电影的挚爱。拍摄了电影短片《刹车》、《流川枫与苍井空》、《冬至》，创作过话剧作品《蠢蠢欲爱》，改编了《2012版恋爱的犀牛》和《我不是李白》。</div>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">大学毕业后我们纷纷到国外各地留学，最后再次回到承载自己青春故事的地方，几个老友重新聚到一起，觉得我们终于“有话要说”了。</div>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">我们回来了，还带回了导演两年时间里潜心创作的剧本《不下雪的北方一夜》。当我们看到这个兼具艺术和商业价值的优秀剧本时，我们决定将这个关怀的故事，赋之实现。</div>\r\n<p><br />\r\n<br />\r\n</p>\r\n<h3>我想要做什么</h3>\r\n<p><br />\r\n</p>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">由一个人，一个家庭，看到一段历史，一个社会群体，一段变动的时代。</div>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">一部30分钟的短片。时间是在上世纪90年代，故事发生在一夜之间。</div>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">冬天的北方，一个不下雪的夜晚，因为工业经济体制的变化和改革，大批量国有工厂宣告破产，工人纷纷下岗，转眼之间，生活举步维艰。<span class="Apple-converted-space">&nbsp;</span>主人公杨万林是沈阳铁西区数十万下岗工人中平凡的一员。<span class="Apple-converted-space">&nbsp;</span>因为孩子需要学费，他迫于压力来到的狗哥家借钱。而在狗哥家的酒席中，他遇到了形形色色的人，每个人都在使尽浑身解数，求夹缝中获得新生。<span class="Apple-converted-space">&nbsp;</span>一夜中的经历，把杨万林逼进了绝路而又无处可逃。他失去了生活的勇气，却没有放弃，最终重获新生。</div>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">由一个小人物的抉择和自我拯救，看到一个社会群体，一段历史，一个关于“承担”与“肩负”的生活哲理。<br />\r\n<br />\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">中国正在经历着翻天覆地的发展和变革，一切传统的和习惯的东西都可能会在一夜之间被彻底推翻和打破。作为电影人，我们有责任记录下中国在高速变革下的种种现象。我们的电影短片讲述了在九十年代末的中国北方冬天，一个普通下岗工人在工业化改革的浪潮中的隐忍与坚持。我们试图着眼于社会变革的大背景下，小人物面对命运变迁所做出的反应或选择。再次记录下变革和进步背后的承担和肩负。故事发生的这一夜是一个普通家庭的分崩与重建，也是整个宏观环境的映射。<br style="word-wrap:break-word;" />\r\n<br style="word-wrap:break-word;" />\r\n</div>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">而多数为“80末”组成的主创团队，我们想要真正表达年轻一代人面对历史，面对社会的变革，所表现出的态度。我们用客观的眼睛，敏感的嗅觉，用心感悟和记录一个时代，并且呈现我们对于生活的思考和责任。<span class="Apple-converted-space">&nbsp;</span><br style="word-wrap:break-word;" />\r\n<br style="word-wrap:break-word;" />\r\n</div>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">每座城市在不同的人心中都有一个值得铭记的时代。我们尝试着运用新现实主义的电影手法，完成对于特殊处境下小人物体现出的人性的挖掘和重塑。<span class="Apple-converted-space">&nbsp;</span><br style="word-wrap:break-word;" />\r\n我们想用时下年轻人的立场，新的电影理念，去关怀那个时代，那个不应被忘怀的人物和情怀。</div>\r\n<br />\r\n</div>\r\n<h3>为什么我需要你的支持</h3>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">我们将会需要总共50 000人民币的拍摄资金，这些钱将会用到以下各个方面：</div>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">前期制作：&nbsp;&nbsp;拍摄场地的租借；</div>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;道具的购买和制作，场地布景的花销；</div>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;服装的购买和制作，以及设计；</div>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;化妆材料；</div>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;演员试戏、排练场地租赁；</div>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;餐费；</div>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;海报拍摄、制作；</div>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">中期拍摄：&nbsp;&nbsp;拍摄器材、灯光、配件等租赁；</div>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;各个场地间的交通费，车辆租借费用，油费；</div>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;吃饭住宿费用；</div>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">后期制作：&nbsp;&nbsp;原创音乐；</div>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;后期录音，录音棚租借费；</div>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;混音；</div>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;特效、调色；</div>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;包装、dvd制作；</div>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;电影节投递费用；</div>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">虽然我们的主创人员是毫无报酬地参与到本片，但还有另外一些人工酬劳是我们必不可少的开销：</div>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">酬劳：美术组、录音／灯光师、服装化妆造型师、演员（共2名主演，3名配角，4名过场演员，另外15个不同场次地群众演员）</div>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="center"><img id="aimg_490" src="http://bbs.da-lyon.com/data/attachment/forum/201412/07/1707276vbovkkqoxb04x35.jpg.thumb.jpg" alt="11.jpg" title="11.jpg" style="word-wrap:break-word;cursor:pointer;" /></div>\r\n<br style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-align:start;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" />\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">以上各方面都有详细的预算规划。</div>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">可能存在的风险</div>\r\n<div style="word-wrap:break-word;color:#444444;font-family:tahoma, helvetica, simsun, sans-serif;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;background-color:#ffffff;" align="left">由于我的影片是小成本短片，所以并不会存在什么太大的风险。我所承诺的就是尽可能完美的将成品展现给大家。可能的风险就是遇到天气情况或者演员档期从而影响拍摄，但我们一定会合理解决，可能涉及延迟拍摄，以及更改短片名字，不会产生太大影响，一定会将影片按时呈现给大家。</div>\r\n<p><br />\r\n</p>\r\n<h3>我的承诺与回报</h3>\r\n<span style="color:#444444;font-family:楷体;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-align:-webkit-left;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;display:inline !important;float:none;background-color:#ffffff;">近年来，《钢的琴》《万箭穿心》《天注定》等几部具有强烈新现实主义风格的国产影片都取得了不错的口碑和回报。《白日焰火》更是一部典型性的代表，一举拿下柏林电影节金熊奖，也同时收获一亿多的票房。2013年以来，许多中国电影大师也开始回归艺术电影创作。他们代表了中国电影的一个长期发展方向和良性发展趋势。在经历盲目投资，类型片肆意泛滥，立意审美低下等一系列混乱之后，中国电影始终会发展到另外一个高度，</span>艺术电影和高水准的商业电影<span style="color:#444444;font-family:楷体;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-align:-webkit-left;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;display:inline !important;float:none;background-color:#ffffff;">终究会成为中国电影的主流。这是中国电影的探索和发展趋势，也是每一个国家和地区电影发展的必经之路。我们的作品在完成之后将会参选</span>鹿特丹国际电影节等一系列国际电影节展映和竞赛<span style="color:#444444;font-family:楷体;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-align:-webkit-left;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;display:inline !important;float:none;background-color:#ffffff;">，并进行</span>后期发行<span style="color:#444444;font-family:楷体;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-align:-webkit-left;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;display:inline !important;float:none;background-color:#ffffff;">，对于中国电影艺术来说，我们的作品是中国新现实主义电影的一次微小的尝试和开拓；对于您而言，我们的作品也</span>绝对是一次意义非凡的投资和文化合作<span style="color:#444444;font-family:楷体;font-size:14px;font-style:normal;font-variant:normal;font-weight:normal;letter-spacing:normal;line-height:21px;orphans:auto;text-align:-webkit-left;text-indent:0px;text-transform:none;white-space:normal;widows:auto;word-spacing:0px;-webkit-text-stroke-width:0px;display:inline !important;float:none;background-color:#ffffff;">。</span>', 0, 0, 0, 5, 0, 0.0000, 0.0000, 0.0000, 1418028977, '', '', '', '下雪 北方', 'ux19979ux38634,ux21271ux26041', '下雪,北方', 0, 0, 3, '四川', '绵阳', 19, 0, 'test', 0, 0, 0),
(80, '环境', '', '', './public/attachment/images/201502/17/23/7ae633de82caa543c80dba58d990a68197.jpg', '', '', 23, 0, 0, 0, 123.0000, '', '<h3>关于我</h3>\r\n<p>向支持者介绍一下你自己，以及你与所发起的项目之间的背景。这样有助于拉近你与支持者之间的距离。建议不超过100字。<br />\r\n<br />\r\n</p>\r\n<h3>我想要做什么</h3>\r\n<p>以图文并茂的方式简洁生动地说明你的项目，让大家一目了然，这会决定是否将你的项目描述继续看下去。建议不超过300字。<br />\r\n<br />\r\n</p>\r\n<h3>为什么我需要你的支持</h3>\r\n<p>这是加分项。说说你的项目不同寻常的特色、资金用途、以及大家支持你的理由。这会让更多人能够支持你，不超过200个汉字。<br />\r\n<br />\r\n</p>\r\n<h3>我的承诺与回报</h3>\r\n让大家感到你对待项目的认真程度，鞭策你将项目执行最终成功。同时向大家展示一下你为支持者准备的回报，来吸引更多人支持你。', 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, 1424159412, '', '', '', '环境', '', '', 0, 0, 2, '贵州', '毕节', 19, 0, 'test', 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_attr`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `goods_type_attr_id` int(11) NOT NULL,
  `price` decimal(20,4) NOT NULL,
  `deal_id` int(11) NOT NULL,
  `is_checked` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_type_attr_id` (`goods_type_attr_id`),
  KEY `deal_id` (`deal_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=223 ;

--
-- 转存表中的数据 `fanwe_deal_attr`
--

INSERT INTO `fanwe_deal_attr` (`id`, `name`, `goods_type_attr_id`, `price`, `deal_id`, `is_checked`) VALUES
(222, '均码', 13, '0.0000', 40, 1),
(221, '中码', 13, '0.0000', 40, 1),
(220, '大码', 13, '0.0000', 40, 1),
(219, '红色', 12, '0.0000', 40, 1),
(218, '均码', 13, '10.0000', 41, 0),
(217, '大码', 13, '0.0000', 41, 0),
(216, '中码', 13, '0.0000', 41, 0),
(215, '小码', 13, '0.0000', 41, 0),
(214, '黑色', 12, '0.0000', 41, 0),
(213, '红色', 12, '0.0000', 41, 0),
(211, '中码', 13, '0.0000', 42, 0),
(210, '小码', 13, '0.0000', 42, 0),
(209, '均码', 13, '0.0000', 42, 0),
(208, '北极蓝', 12, '0.0000', 42, 0),
(207, '玫红', 12, '0.0000', 42, 0),
(206, '洋紫', 12, '0.0000', 42, 0),
(205, '中码', 13, '0.0000', 43, 0),
(204, '均码', 13, '0.0000', 43, 0),
(203, '红色', 12, '0.0000', 43, 0),
(202, '驼色', 12, '0.0000', 43, 0),
(201, '黑色', 12, '0.0000', 43, 0),
(199, '中码', 13, '0.0000', 44, 0),
(198, '翡翠绿', 12, '0.0000', 44, 0),
(196, '均码', 13, '0.0000', 45, 0),
(195, '红黑格', 12, '0.0000', 45, 0),
(194, '黑白格', 12, '0.0000', 45, 0),
(193, '均码', 13, '0.0000', 46, 0),
(192, '紫色', 12, '0.0000', 46, 0),
(191, '黑色', 12, '0.0000', 46, 0),
(189, '大码', 13, '0.0000', 47, 0),
(188, '超大码', 13, '0.0000', 47, 0),
(187, '黑色', 12, '0.0000', 47, 0),
(190, '中码', 13, '0.0000', 47, 0),
(197, '中码', 13, '0.0000', 45, 0),
(200, '均码', 13, '0.0000', 44, 0),
(212, '大码', 13, '0.0000', 42, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_cart`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `deal_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `attr` varchar(255) NOT NULL,
  `unit_price` decimal(20,4) NOT NULL,
  `number` int(11) NOT NULL,
  `total_price` decimal(20,4) NOT NULL,
  `verify_code` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `return_money` decimal(20,4) NOT NULL,
  `return_total_money` decimal(20,4) NOT NULL,
  `return_score` int(11) NOT NULL,
  `return_total_score` int(11) NOT NULL,
  `buy_type` tinyint(1) NOT NULL,
  `sub_name` varchar(255) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `attr_str` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `user_id` (`user_id`),
  KEY `deal_id` (`deal_id`),
  KEY `update_time` (`update_time`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=333 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_cate`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `hover_image` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=65 ;

--
-- 转存表中的数据 `fanwe_deal_cate`
--

INSERT INTO `fanwe_deal_cate` (`id`, `name`, `sort`, `image`, `hover_image`, `icon`) VALUES
(11, '设计', 21, './public/attachment/201411/13/03/5463ae3c3e3f1.jpg', './public/attachment/201411/13/03/5463b299af81d.jpg', './public/attachment/images/201503/27/00/551435afbffc2.png'),
(26, '写作', 17, './public/attachment/201411/13/03/5463aec3ceb7d.jpg', '', './public/attachment/images/201503/27/00/5514362d6fbc3.png'),
(3, '电影', 22, './public/attachment/images/201502/16/21/54e1f4fcd6ff3.jpg', './public/attachment/images/201502/16/21/54e1f501a2545.jpg', './public/attachment/images/201503/27/00/551431c2ea491.png'),
(12, '摄影', 20, './public/attachment/201411/13/03/5463af2af0240.jpg', '', './public/attachment/images/201503/27/00/551435bfe9c50.png'),
(5, '音乐', 5, './public/attachment/images/201502/16/21/54e1f51af2c2d.jpg', './public/attachment/images/201502/16/21/54e1f51fb0e8c.jpg', './public/attachment/images/201503/27/00/55143566bac2d.png'),
(20, '教育', 11, './public/attachment/201411/13/03/5463af92132b0.jpg', '', './public/attachment/images/201503/27/00/551435db15edb.png'),
(7, '运动', 7, './public/attachment/201411/13/03/5463aff1f1746.jpg', './public/attachment/201411/13/03/5463b5fcadf12.jpg', './public/attachment/images/201503/27/00/5514357d39339.png'),
(8, '游戏', 8, './public/attachment/201411/13/03/5463b023e5f1f.jpg', '', './public/attachment/images/201503/27/00/5514358976460.png'),
(9, '戏剧', 9, '', '', './public/attachment/images/201503/27/00/5514359618ae1.png'),
(10, '其他', 23, './public/attachment/201411/13/03/5463b07221870.jpg', './public/attachment/201411/13/03/5463b078e0c8c.jpg', './public/attachment/images/201503/27/00/551435a11dd6f.png'),
(19, '艺术', 10, '', '', './public/attachment/images/201503/27/00/551435d32ba07.png'),
(6, '美食', 6, './public/attachment/images/201503/23/02/550f08acc7d50.jpg', './public/attachment/images/201502/16/21/54e1f10d23a44.jpg', './public/attachment/images/201503/27/00/55143573a4969.png'),
(21, '舞蹈', 12, '', '', './public/attachment/images/201503/27/00/551435e787004.png'),
(22, '漫画', 13, '', '', './public/attachment/images/201503/27/00/551435f27ad5d.png'),
(23, '动物', 14, '', '', './public/attachment/images/201503/27/00/551435fe4f693.png'),
(24, '健康', 15, '', '', './public/attachment/images/201503/27/00/551436067f4ad.png'),
(25, '视频', 16, '', '', './public/attachment/images/201503/27/00/551436228187b.png'),
(2, '时尚', 2, './public/attachment/images/201503/23/02/550f05642c4b6.JPG', './public/attachment/images/201502/16/21/54e1f4e02d29a.jpg', './public/attachment/images/201503/27/00/5514320d3da8a.png'),
(27, '社群', 18, '', '', './public/attachment/images/201503/27/00/5514363b87342.png'),
(28, '环境', 19, '', '', './public/attachment/images/201503/27/00/5514364520b25.png'),
(1, '科技', 1, './public/attachment/images/201502/16/22/54e1fbf4cb0af.jpg', './public/attachment/images/201502/16/22/54e1fbfa40ef6.jpg', './public/attachment/images/201503/27/06/551485ba150a6.png'),
(4, '公益', 4, './public/attachment/images/201503/23/02/550f0f2a380a3.jpg', './public/attachment/images/201502/16/22/54e1fc14ca065.jpg', './public/attachment/images/201503/27/00/55143200e5d67.png'),
(64, '旅游', 3, './public/attachment/images/201503/23/02/550f0b573078e.jpg', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_cate_type`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_cate_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_recommend` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `fanwe_deal_cate_type`
--

INSERT INTO `fanwe_deal_cate_type` (`id`, `name`, `is_recommend`, `sort`) VALUES
(1, '咖啡', 1, 0),
(2, '闽菜', 1, 0),
(3, '东北菜', 1, 0),
(4, '川菜', 1, 0),
(5, 'KTV', 1, 0),
(6, '自助游', 1, 0),
(7, '周边游', 1, 0),
(8, '国内游', 1, 0),
(9, '海外游', 1, 0),
(10, '洗车', 1, 0),
(11, '汽车保养', 1, 0),
(12, '驾校', 0, 0),
(13, '4S店', 1, 0),
(14, '音响', 1, 0),
(15, '车载导航', 1, 0),
(16, '真皮座椅', 1, 0),
(17, '打蜡', 1, 0),
(18, '男科', 0, 0),
(19, '妇科', 0, 0),
(20, '儿科', 0, 0),
(21, '口腔科', 1, 0),
(22, '眼科', 1, 0),
(23, '体检中心', 1, 0),
(24, '心理诊所', 1, 0),
(25, '疗养院', 1, 0),
(26, '日本料理', 1, 0),
(27, '本帮菜', 1, 0),
(28, '甜点', 1, 0),
(29, '面包', 1, 0),
(30, '烧烤', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_cate_type_deal_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_cate_type_deal_link` (
  `deal_id` int(11) NOT NULL,
  `deal_cate_type_id` int(11) NOT NULL,
  PRIMARY KEY (`deal_id`,`deal_cate_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_deal_cate_type_deal_link`
--

INSERT INTO `fanwe_deal_cate_type_deal_link` (`deal_id`, `deal_cate_type_id`) VALUES
(37, 2),
(37, 3),
(38, 2),
(39, 2),
(39, 4),
(49, 1),
(50, 4),
(51, 4),
(53, 4),
(55, 28),
(55, 29);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_cate_type_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_cate_type_link` (
  `cate_id` int(11) NOT NULL,
  `deal_cate_type_id` int(11) NOT NULL,
  PRIMARY KEY (`cate_id`,`deal_cate_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_deal_cate_type_link`
--

INSERT INTO `fanwe_deal_cate_type_link` (`cate_id`, `deal_cate_type_id`) VALUES
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 26),
(8, 27),
(8, 28),
(8, 29),
(8, 30),
(9, 1),
(9, 5),
(9, 6),
(10, 5),
(11, 6),
(11, 7),
(11, 8),
(11, 9),
(13, 10),
(13, 11),
(13, 12),
(13, 13),
(13, 14),
(13, 15),
(13, 16),
(13, 17),
(16, 18),
(16, 19),
(16, 20),
(16, 21),
(16, 22),
(16, 23),
(16, 24),
(16, 25);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_cate_type_location_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_cate_type_location_link` (
  `location_id` int(11) NOT NULL,
  `deal_cate_type_id` int(11) NOT NULL,
  PRIMARY KEY (`location_id`,`deal_cate_type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_cate_type_youhui_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_cate_type_youhui_link` (
  `deal_cate_type_id` int(11) NOT NULL,
  `youhui_id` int(11) NOT NULL,
  PRIMARY KEY (`deal_cate_type_id`,`youhui_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_deal_cate_type_youhui_link`
--

INSERT INTO `fanwe_deal_cate_type_youhui_link` (`deal_cate_type_id`, `youhui_id`) VALUES
(2, 10),
(2, 11),
(2, 14),
(2, 15),
(3, 10),
(3, 11),
(3, 14),
(3, 15),
(4, 11),
(4, 14),
(28, 18),
(29, 18);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_city`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `uname` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `pid` int(11) NOT NULL,
  `is_open` tinyint(1) NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `description` text NOT NULL,
  `notice` text NOT NULL,
  `seo_title` text NOT NULL,
  `seo_keyword` text NOT NULL,
  `seo_description` text NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- 转存表中的数据 `fanwe_deal_city`
--

INSERT INTO `fanwe_deal_city` (`id`, `name`, `uname`, `is_effect`, `is_delete`, `pid`, `is_open`, `is_default`, `description`, `notice`, `seo_title`, `seo_keyword`, `seo_description`, `sort`) VALUES
(1, '全国', '', 1, 0, 0, 1, 0, '每天提供一单精品消费，为您精选餐厅、酒吧、KTV、SPA、美发店、瑜伽馆等特色商家，只要凑够最低团购人数就能享受无敌折扣。', '这是一则公告信息', '', '', '', 0),
(15, '福州', 'fuzhou', 1, 0, 1, 1, 1, '', '', '', '', '', 1),
(16, '北京', 'beijing', 1, 0, 1, 1, 0, '', '', '', '', '', 2),
(17, '上海', 'shanghai', 1, 0, 1, 1, 0, '', '', '', '', '', 3);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_collect`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `deal_id` (`deal_id`),
  KEY `user_id` (`user_id`),
  KEY `create_time` (`create_time`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_comment`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `log_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `pid` int(11) NOT NULL COMMENT '?????????ID',
  `deal_user_id` int(11) NOT NULL COMMENT '??????????ID',
  `reply_user_id` int(11) NOT NULL COMMENT '????????????????ID',
  `deal_user_name` varchar(255) NOT NULL,
  `reply_user_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `deal_id` (`deal_id`),
  KEY `user_id` (`user_id`),
  KEY `create_time` (`create_time`),
  KEY `log_id` (`log_id`),
  KEY `pid` (`pid`),
  KEY `deal_user_id` (`deal_user_id`),
  KEY `reply_user_id` (`reply_user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=176 ;

--
-- 转存表中的数据 `fanwe_deal_comment`
--

INSERT INTO `fanwe_deal_comment` (`id`, `deal_id`, `content`, `user_id`, `create_time`, `log_id`, `user_name`, `pid`, `deal_user_id`, `reply_user_id`, `deal_user_name`, `reply_user_name`) VALUES
(170, 55, '加油哦！', 18, 1352229601, 26, 'fzmatthew', 0, 17, 0, 'fanwe', ''),
(171, 56, '感谢支持！！', 18, 1352230363, 27, 'fzmatthew', 0, 18, 0, 'fzmatthew', ''),
(172, 57, '好好加油！', 18, 1352230882, 28, 'fzmatthew', 0, 17, 0, 'fanwe', ''),
(173, 57, '回复 fzmatthew:一定会的。', 17, 1352230924, 28, 'fanwe', 172, 17, 18, 'fanwe', 'fzmatthew'),
(174, 58, '感谢', 17, 1352231585, 29, 'fanwe', 0, 17, 0, 'fanwe', ''),
(175, 58, '感谢大家的支持', 17, 1352231787, 0, 'fanwe', 0, 17, 0, 'fanwe', '');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_coupon`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `begin_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `is_valid` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `deal_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_deal_id` int(11) NOT NULL,
  `is_new` tinyint(1) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `confirm_account` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `confirm_time` int(11) NOT NULL,
  `mail_count` int(11) NOT NULL,
  `sms_count` int(11) NOT NULL,
  `is_balance` tinyint(1) NOT NULL COMMENT '0:未结算 1:待结算 2:已结算',
  `balance_memo` text NOT NULL,
  `balance_price` decimal(20,4) NOT NULL COMMENT '结算单价',
  `balance_time` int(11) NOT NULL,
  `refund_status` tinyint(1) NOT NULL,
  `expire_refund` tinyint(1) NOT NULL,
  `any_refund` tinyint(1) NOT NULL,
  `coupon_price` decimal(20,4) NOT NULL,
  `coupon_score` int(11) NOT NULL,
  `deal_type` tinyint(1) NOT NULL,
  `coupon_money` decimal(20,4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk_sn` (`sn`) USING BTREE,
  UNIQUE KEY `unk_pw` (`password`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_delivery`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `delivery_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_faq`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `deal_id` (`deal_id`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=107 ;

--
-- 转存表中的数据 `fanwe_deal_faq`
--

INSERT INTO `fanwe_deal_faq` (`id`, `deal_id`, `question`, `answer`, `sort`) VALUES
(98, 56, '我们的咖啡馆在哪里？', '目前暂定的店址，是在延安西路、重庆北路附近。', 1),
(99, 56, '我们的咖啡馆大概有多大？', '目前定的店址面积约在200平米以内，有上下两层，底楼较小，二层是整个一层。', 2),
(100, 56, '咖啡馆筹备的进度是？', '由于各种的原因，在寻找店址的过程中，先先后后放弃了很多地方，目前找的店址，在办证、面积、交通等方面都较理想。所以基本确定了地方，正在积极办理营业执照及设计各方面的工作，同时也在现有资金的基础上，募集更多的资金及支持。目前店面的装修免租期约在2个月内，所以离正式开业还需要一些时日。', 3),
(105, 58, '流浪猫与爱天使咖啡是什么关系呢？', '爱天使就是收养救助流浪猫的咖啡馆。因为救助需要资金与空间，这个资金的最好来源一定是要有一个有收益的项目来支撑而非单纯靠募捐方式，否则容易造成依赖与被动，当然其实也因自己个性好强。 在繁殖季爱天使最多一天能收到3-6只的流浪猫，三年间独自一人艰难维持并收养救助两百多只流浪猫，所需空间资金精力全部由我个人维持。', 1),
(106, 58, '新店确定了吗？装修顺利吗？在哪里呢？', '新店终于在几经各方协商后于前日确定于文化艺术中心广场正中间（五一文化广场中间文化宫左边，图书馆对面，大润发楼上正中间）的玻璃房。昨天开始了紧张的重新设计装修中。关于搬店的过程几经周折的磨难苦不堪言。因为新店面积比老店小了，而东西只能先搬过去，而里面要装修所以大柜子都没办法先放进去。里面也已堆满了东西，装修师傅找了五个都不愿意接，因为太多东西很影响装修。东西要一直搬来搬去，现在全部是灰，之后又是一大堆的卫生清洁整理工作，已有很多东西因此受到损坏了。。。新店是转过来了付了一大笔转让费未想因为要重装再装修又要投入两万多的改装费，这笔当时完全忘记预算在内了。。。 不过现在顺利的进入装修重新开业在即。谢谢大家的关注支持！我会让爱天使尽快走回正轨。', 2);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_filter`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filter` text NOT NULL,
  `deal_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=120 ;

--
-- 转存表中的数据 `fanwe_deal_filter`
--

INSERT INTO `fanwe_deal_filter` (`id`, `filter`, `deal_id`, `filter_group_id`) VALUES
(119, '红色', 40, 9),
(118, '大码,中码,均码', 40, 8),
(117, '纯绵', 40, 7),
(116, '红色,黑色', 41, 9),
(115, '小码,中码,大码,均码', 41, 8),
(114, '常规毛线', 41, 7),
(113, '洋紫,玫红,北极蓝', 42, 9),
(112, '小码,中码,大码,均码', 42, 8),
(111, '羽绒', 42, 7),
(110, '黑色,驼色,红色', 43, 9),
(109, '均码,中码', 43, 8),
(108, '尼绒', 43, 7),
(107, '翡翠绿', 44, 9),
(106, '中码,均码', 44, 8),
(105, '', 44, 7),
(104, '黑白格,红黑格', 45, 9),
(103, '均码,中码', 45, 8),
(102, '', 45, 7),
(101, '黑色,紫色', 46, 9),
(100, '均码', 46, 8),
(99, '纯绵', 46, 7),
(98, '黑色', 47, 9),
(97, '超大码,大码,中码', 47, 8),
(96, '', 47, 7),
(95, '', 48, 9),
(94, '', 48, 8),
(93, '', 48, 7);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_focus_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_focus_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `deal_id` (`deal_id`),
  KEY `user_id` (`user_id`),
  KEY `create_time` (`create_time`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=34 ;

--
-- 转存表中的数据 `fanwe_deal_focus_log`
--

INSERT INTO `fanwe_deal_focus_log` (`id`, `deal_id`, `user_id`, `create_time`) VALUES
(32, 58, 18, 1352231518),
(33, 56, 17, 1352232247);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_gallery`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) NOT NULL,
  `deal_id` int(11) NOT NULL,
  `sort` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=595 ;

--
-- 转存表中的数据 `fanwe_deal_gallery`
--

INSERT INTO `fanwe_deal_gallery` (`id`, `img`, `deal_id`, `sort`) VALUES
(582, './public/attachment/201201/4f0110c586c48.jpg', 37, 0),
(591, './public/attachment/201201/4f0113ce66cd4.jpg', 38, 1),
(590, './public/attachment/201201/4f0113ce66cd4.jpg', 38, 0),
(589, './public/attachment/201201/4f0116296dc27.jpg', 39, 0),
(565, './public/attachment/201201/4f012726399d4.jpg', 40, 2),
(564, './public/attachment/201201/4f0127212b558.jpg', 40, 1),
(563, './public/attachment/201201/4f01271aa4f99.jpg', 40, 0),
(562, './public/attachment/201201/4f012a9be8b27.jpg', 41, 4),
(561, './public/attachment/201201/4f012a9641198.jpg', 41, 3),
(560, './public/attachment/201201/4f012a9145b41.jpg', 41, 2),
(559, './public/attachment/201201/4f012a8be1476.jpg', 41, 1),
(558, './public/attachment/201201/4f012a86b3fbe.jpg', 41, 0),
(557, './public/attachment/201201/4f012bcf19f01.jpg', 42, 4),
(556, './public/attachment/201201/4f012bc989600.jpg', 42, 3),
(555, './public/attachment/201201/4f012bc43d042.jpg', 42, 2),
(554, './public/attachment/201201/4f012bbf2ee36.jpg', 42, 1),
(553, './public/attachment/201201/4f012bba3d02c.jpg', 42, 0),
(552, './public/attachment/201201/4f012d022ec3a.jpg', 43, 4),
(551, './public/attachment/201201/4f012cfbe3bdc.jpg', 43, 3),
(550, './public/attachment/201201/4f012cf6de268.jpg', 43, 2),
(549, './public/attachment/201201/4f012cee51383.jpg', 43, 1),
(548, './public/attachment/201201/4f012ce95cf44.jpg', 43, 0),
(547, './public/attachment/201201/4f012e0ae8d5f.jpg', 44, 4),
(546, './public/attachment/201201/4f012e058cf5c.jpg', 44, 3),
(545, './public/attachment/201201/4f012e0093a97.jpg', 44, 2),
(544, './public/attachment/201201/4f012dfb0983c.jpg', 44, 1),
(543, './public/attachment/201201/4f012df65d0fe.jpg', 44, 0),
(542, './public/images/201201/big/4f012ee711c87.jpg', 45, 2),
(541, './public/images/201201/big/4f012ed9d9063.jpg', 45, 1),
(540, './public/images/201201/big/4f012ecddf917.jpg', 45, 0),
(539, './public/attachment/201201/4f01302514fee.jpg', 46, 3),
(538, './public/attachment/201201/4f01301fcdcc4.jpg', 46, 2),
(537, './public/attachment/201201/4f01301a53d4d.jpg', 46, 1),
(536, './public/attachment/201201/4f01301613aa8.jpg', 46, 0),
(535, './public/attachment/201201/4f0132b2236f0.jpg', 47, 4),
(534, './public/attachment/201201/4f0132acd6f67.jpg', 47, 3),
(533, './public/attachment/201201/4f0132a7ee87e.jpg', 47, 2),
(532, './public/attachment/201201/4f0132a246478.jpg', 47, 1),
(531, './public/attachment/201201/4f01329d60fa2.jpg', 47, 0),
(530, './public/attachment/201201/4f0133bbca79e.jpg', 48, 0),
(585, './public/attachment/201201/4f0147c5a1983.jpg', 49, 0),
(573, './public/attachment/201201/4f014896c9be2.jpg', 50, 0),
(584, './public/attachment/201201/4f01497b1bb54.jpg', 51, 0),
(583, './public/attachment/201201/4f014a031f8f9.jpg', 52, 0),
(570, './public/attachment/201201/4f014a935d99a.jpg', 53, 0),
(588, './public/attachment/201202/16/11/4f3c7d681ed70.jpg', 54, 0),
(587, './public/attachment/201202/16/11/4f3c7ea394a90.jpg', 55, 0),
(594, './public/attachment/201202/16/11/4f3c7f1d37dea.jpg', 56, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_item`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `price` double(20,4) NOT NULL,
  `support_count` int(11) NOT NULL,
  `support_amount` double(20,4) NOT NULL,
  `description` text NOT NULL,
  `is_delivery` tinyint(1) NOT NULL,
  `delivery_fee` double(20,4) NOT NULL,
  `is_limit_user` tinyint(1) NOT NULL COMMENT '?????',
  `limit_user` int(11) NOT NULL COMMENT '???????',
  `repaid_day` int(11) NOT NULL COMMENT '???????????????',
  PRIMARY KEY (`id`),
  KEY `deal_id` (`deal_id`),
  KEY `price` (`price`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=43 ;

--
-- 转存表中的数据 `fanwe_deal_item`
--

INSERT INTO `fanwe_deal_item` (`id`, `deal_id`, `price`, `support_count`, `support_amount`, `description`, `is_delivery`, `delivery_fee`, `is_limit_user`, `limit_user`, `repaid_day`) VALUES
(17, 55, 10.0000, 0, 0.0000, '我们将以平信的方式寄出2款桌游的首发纪念牌，随机赠送部分游戏牌（至少5张）并在游戏说明书中致谢', 1, 0.0000, 0, 0, 60),
(18, 55, 15.0000, 1, 15.0000, '我们将回报《黄金密码》1套，赠送首发纪念牌并在游戏说明书中致谢。（邮费另计）', 1, 5.0000, 0, 0, 60),
(19, 55, 30.0000, 0, 0.0000, '我们将回报《黄金密码》、《功夫》各1套，赠送首发纪念牌并在游戏说明书中致谢。（邮费另计）', 1, 5.0000, 0, 0, 60),
(20, 55, 50.0000, 0, 0.0000, '我们将回报《黄金密码》、《功夫》各2套，赠送首发纪念牌并在游戏说明书中致谢。（邮费另计）', 1, 5.0000, 0, 0, 60),
(21, 55, 500.0000, 0, 0.0000, '我们将回报《黄金密码》40套，赠送首发纪念牌并在游戏说明书中致谢，同时还将在首发纪念牌上印上您的姓名或公司名称致谢！（限额2名）。（国内包邮）', 1, 0.0000, 0, 0, 60),
(22, 56, 50.0000, 0, 0.0000, '你将收到小组成员，在旅行中为你寄出的一张祝福明信片\r\n你将成为我们开业PARTY的座上嘉宾\r\n所以，请留下你的联系方式（电话，地址及邮编）', 1, 0.0000, 0, 0, 50),
(23, 56, 200.0000, 0, 0.0000, '你将获得咖啡馆开业后永久9折会员卡一张（会员卡可用于借阅书籍，并在生日当天获得免费饮料一杯）\r\n店内旅行纪念手信一份（价值在50元以内）\r\n成为开业PARTY的邀请来宾', 1, 0.0000, 0, 0, 60),
(24, 56, 500.0000, 11, 5500.0000, '你将获得咖啡馆开业后永久9折会员卡一张（会员卡可用于借阅书籍，并在生日当天获得免费饮料一杯）\r\n一份店内招牌下午茶套餐的招待券\r\n免费参加店内组织的活动（各类分享会、试吃体验等等）\r\n成为开业PARTY的邀请来宾', 1, 0.0000, 0, 0, 50),
(25, 57, 60.0000, 1, 60.0000, '电影签名海报和明信片。全国包邮。', 1, 0.0000, 0, 0, 50),
(26, 57, 150.0000, 0, 0.0000, '电影DVD的拷贝一张，以及片尾特别感谢。全国包邮。', 1, 0.0000, 0, 0, 55),
(27, 57, 600.0000, 0, 0.0000, '一个崭新的印有影片标志的8GB快闪储存器（flash drive), 电影DVD 拷贝，剧照，和特别回报（包括预告片DVD，拍摄花絮DVD）, 以及片尾特别感谢。（所有DVD均有中文字幕），全国包邮。', 1, 0.0000, 1, 20, 50),
(28, 57, 1200.0000, 0, 0.0000, '电影签名海报和明信片， 一个崭新的印有影片标志的8GB快闪储存器（flash drive), 电影DVD 拷贝，剧照，和特别回报（包括预告片DVD，拍摄花絮DVD）, 以及片尾特别感谢。（所有DVD均有中文字幕）全国包邮。', 1, 0.0000, 1, 5, 10),
(29, 57, 3000.0000, 0, 0.0000, '成为影片的联合制片人（associate producer), 8GB的快闪储存器（flash drive)， 电影DVD 拷贝，剧照，和特别回报（包括预告片DVD，拍摄花絮DVD）。（所有DVD均有中文字幕） 全国包邮。', 1, 0.0000, 0, 0, 10),
(30, 58, 1000.0000, 0, 0.0000, '爱的礼物：精美工艺品及红酒。如果你希望得到一份爱的礼物与记念，请留言你的详细地址姓名电话，我将会于爱天使重建之后的三个月内为你寄一件精美的工艺品及价值399元的澳洲红宝龙红酒一瓶！你将成为爱天使的终生会员。。。', 1, 0.0000, 0, 0, 50),
(31, 58, 2000.0000, 1, 2000.0000, '爱的礼物：精美工艺品红酒及晚餐。如果你希望得到一份爱的礼物与记念，请留言你的详细地址姓名电话，我将会于爱天使重建之后的三个月内为你寄一件精美的工艺品及澳洲红宝龙红酒一瓶及邀请你到爱天使享受晚餐！你将成为爱天使的终生会员。。。', 1, 0.0000, 0, 0, 50),
(32, 58, 3000.0000, 1, 3000.0000, '爱的礼物：精美工艺品及红酒及晚餐。如果你希望得到一份爱的礼物与记念，请留言你的详细地址姓名电话，我将会于爱天使重建之后的三个月内为你寄一件精美的工艺品及价值688元的澳洲康纳瓦拉红酒一瓶及邀请你到爱天使享受晚餐！你将成为爱天使的终生会员。。。', 1, 0.0000, 0, 0, 50),
(33, 61, 5.0000, 0, 0.0000, 'x', 0, 0.0000, 0, 0, 1),
(42, 80, 23.0000, 0, 0.0000, '', 0, 0.0000, 0, 0, 2),
(41, 80, 12.0000, 0, 0.0000, '', 0, 0.0000, 0, 0, 23);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_item_image`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_item_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `deal_item_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `deal_id` (`deal_id`),
  KEY `deal_item_id` (`deal_item_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=59 ;

--
-- 转存表中的数据 `fanwe_deal_item_image`
--

INSERT INTO `fanwe_deal_item_image` (`id`, `deal_id`, `deal_item_id`, `image`) VALUES
(40, 55, 18, './public/attachment/201211/07/10/1df0db265b86352e3886b9c62e8ef01b18.jpg'),
(41, 55, 18, './public/attachment/201211/07/10/4a4a8bdca29b165b7bd5f510ce200c4385.jpg'),
(42, 55, 18, './public/attachment/201211/07/10/c8223b4192fc39e4a3dce8a986eccf3994.jpg'),
(43, 55, 19, './public/attachment/201211/07/10/a37a306a3bedaa664011115de251576034.jpg'),
(44, 55, 20, './public/attachment/201211/07/10/cc12200a637c9db1dcf7354e592f220985.jpg'),
(45, 55, 21, './public/attachment/201211/07/10/d65e7badd7098a0922db2b49c2fd8ef011.jpg'),
(46, 56, 22, './public/attachment/201211/07/11/5d379d45a98db1816b027e85d59ca47c58.jpg'),
(47, 56, 23, './public/attachment/201211/07/11/1ed8f029594ec5e809d95d8074fe3d2760.jpg'),
(48, 56, 24, './public/attachment/201211/07/11/b08505b20319f493cbc03debd52eceb474.jpg'),
(49, 56, 24, './public/attachment/201211/07/11/18b75305fe13c623363abb4ab995f6af34.jpg'),
(50, 57, 25, './public/attachment/201211/07/11/7ecd287a12bff4289d305c0fb949889e29.jpg'),
(51, 57, 26, './public/attachment/201211/07/11/d84152ab2d569c584c795018846cbb7233.jpg'),
(52, 57, 27, './public/attachment/201211/07/11/bdefb72e944b41b60a751d50d0d84fe983.jpg'),
(53, 57, 28, './public/attachment/201211/07/11/c0df234411b34427dedb121ab9bd577352.jpg'),
(54, 57, 28, './public/attachment/201211/07/11/9c82e2a30f02513d0a197f3d4573794e76.jpg'),
(55, 57, 29, './public/attachment/201211/07/11/326730647fde78562777b82f0a9e81a155.jpg'),
(56, 58, 30, './public/attachment/201211/07/11/06bab2f2823bdd050ef8949162bf717729.jpg'),
(57, 58, 31, './public/attachment/201211/07/11/c835e1fd43685e3106c4de641f70cf2b62.jpg'),
(58, 58, 32, './public/attachment/201211/07/11/44036ee2e369e9c91be966a329cac70084.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_location_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_location_link` (
  `deal_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`deal_id`,`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_deal_location_link`
--

INSERT INTO `fanwe_deal_location_link` (`deal_id`, `location_id`) VALUES
(37, 14),
(38, 15),
(39, 16),
(49, 16),
(50, 16),
(51, 16),
(52, 20),
(53, 16),
(54, 18),
(55, 14),
(56, 18);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_info` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `deal_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `vedio` varchar(255) NOT NULL,
  `source_vedio` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `deal_id` (`deal_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=30 ;

--
-- 转存表中的数据 `fanwe_deal_log`
--

INSERT INTO `fanwe_deal_log` (`id`, `log_info`, `create_time`, `user_id`, `user_name`, `deal_id`, `image`, `vedio`, `source_vedio`) VALUES
(26, '功夫图文说明书1', 1352229555, 17, 'fanwe', 55, './public/attachment/201211/07/11/5d2a94ce2a3db73277fb04be463365a255.jpg', '', ''),
(27, '每当我们踏上新的旅程，总是带着期待和兴奋\r\n\r\n而每次踏上归程，多多少少都会怀有一丝的失落\r\n\r\n在路上，我们拥有一拍即合、相谈甚欢的朋友\r\n\r\n在路上，我们总能遇到有趣的人，听到有意思的故事\r\n\r\n在路上，我们可以遗忘时间，丢开工作，在任何一方天地里享用美食和咖啡\r\n\r\n但是归来后，工作和生活又将我们丢回压力和快节奏之下\r\n\r\n我们想要一个在城市中，也能随时抽离的天地\r\n\r\n找朋友，找梦想，找快乐\r\n\r\n \r\n\r\n我们的小窝不会很大，但足以容纳所有的做梦者\r\n\r\n这里有齐全的旅行攻略书籍、各种旅行散文、绘本、游记……\r\n\r\n这里有香浓的咖啡和好吃的甜点\r\n\r\n这里有同样喜爱旅行，爱结交朋友的年轻人\r\n\r\n每一个将这里当做家的人，你们是我们的客人，更是这里的主人', 1352230347, 18, 'fzmatthew', 56, './public/attachment/201211/07/11/714396a1e4416b0f7510d97e6966190459.jpg', '', ''),
(28, '在电影里看到的最自然的场景在拍摄的时候都是要用灯光特别加工出来的，因为摄影机和人对光的感受能力不一样。人的眼睛可以说是世界上最好的摄影机。这一幕女主角站在窗边充满惆怅的向男主角的方向望过去，明显的受到了日本导演岩井俊二的影响。', 1352230864, 17, 'fanwe', 57, './public/attachment/201211/07/11/eab603d5c65ec25f88a7fdd8ec9a5c1095.jpg', '', ''),
(29, '谢谢这几天来帮忙的朋友们，昨天一群的同学们让窗户变得明亮，虽然还是挺乱但却充满了快乐与欢。。爱天使每天都要这样充满爱与快乐。。谢谢有你们！因为东西太多可能还要打理两天才能开业，希望最近有空的朋友还能过来帮忙。下午两点过来便可13400642022。地址文化艺术中心大润发楼上正中间店。谢谢！', 1352231575, 17, 'fanwe', 58, './public/attachment/201211/07/11/85a7d1e781bfb8812271b6f6f1bee91d25.jpg', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_msg_list`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_msg_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dest` varchar(255) NOT NULL,
  `send_type` tinyint(1) NOT NULL,
  `content` text NOT NULL,
  `send_time` int(11) NOT NULL,
  `is_send` tinyint(1) NOT NULL,
  `create_time` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `result` text NOT NULL,
  `is_success` tinyint(1) NOT NULL,
  `is_html` tinyint(1) NOT NULL,
  `title` text NOT NULL,
  `is_youhui` tinyint(1) NOT NULL,
  `youhui_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_notify`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_notify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `deal_id` (`deal_id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_order`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `deal_item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `pay_time` int(11) NOT NULL,
  `total_price` double(20,4) NOT NULL COMMENT '???',
  `delivery_fee` double(20,4) NOT NULL COMMENT '???',
  `deal_price` double(20,4) NOT NULL COMMENT '???????',
  `support_memo` text NOT NULL,
  `payment_id` int(11) NOT NULL,
  `bank_id` varchar(255) NOT NULL,
  `credit_pay` double(20,4) NOT NULL,
  `online_pay` double(20,4) NOT NULL,
  `deal_name` varchar(255) NOT NULL,
  `order_status` tinyint(1) NOT NULL COMMENT '0:????? 1:?????(????) 2:?????(?????) 3:???',
  `create_time` int(11) NOT NULL,
  `consignee` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `is_success` tinyint(1) NOT NULL,
  `repay_time` int(11) NOT NULL COMMENT '??????????',
  `repay_memo` text NOT NULL COMMENT '??????????????????',
  `is_refund` tinyint(1) NOT NULL COMMENT '????? 0:?? 1:??',
  PRIMARY KEY (`id`),
  KEY `deal_id` (`deal_id`),
  KEY `deal_item_id` (`deal_item_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=89 ;

--
-- 转存表中的数据 `fanwe_deal_order`
--

INSERT INTO `fanwe_deal_order` (`id`, `deal_id`, `deal_item_id`, `user_id`, `user_name`, `pay_time`, `total_price`, `delivery_fee`, `deal_price`, `support_memo`, `payment_id`, `bank_id`, `credit_pay`, `online_pay`, `deal_name`, `order_status`, `create_time`, `consignee`, `zip`, `mobile`, `province`, `city`, `address`, `is_success`, `repay_time`, `repay_memo`, `is_refund`) VALUES
(65, 55, 18, 18, 'fzmatthew', 1352229388, 20.0000, 5.0000, 15.0000, '请在上班时间配送。', 0, 'COMM', 20.0000, 0.0000, '原创DIY桌面游戏《功夫》《黄金密码》期待您的支持', 3, 1352229388, '方维', '350000', '13333333333', '福建', '福州', '福建福州台江区工业路博美诗邦', 0, 0, '', 0),
(66, 56, 24, 17, 'fanwe', 1352230101, 500.0000, 0.0000, 500.0000, '', 0, '', 500.0000, 0.0000, '拥有自己的咖啡馆', 3, 1352230101, '方维', '22222', '14444444444', '福建', '福州', '方维方维方维方维方维', 1, 1352230424, '回报已经发货，发货单号123456, 有问题请联系我。', 0),
(67, 56, 24, 19, 'test', 1352230180, 500.0000, 0.0000, 500.0000, '', 24, 'ICBCB2C', 0.0000, 500.0000, '拥有自己的咖啡馆', 3, 1352230157, 'test', 'test', '13344455555', '湖北', '襄樊', 'test', 1, 0, '', 0),
(68, 56, 24, 19, 'test', 1352230228, 500.0000, 0.0000, 500.0000, '', 0, '', 500.0000, 0.0000, '拥有自己的咖啡馆', 3, 1352230228, 'test', 'test', '13344455555', '湖北', '襄樊', 'test', 1, 0, '', 0),
(69, 56, 24, 19, 'test', 1352230232, 500.0000, 0.0000, 500.0000, '', 0, '', 500.0000, 0.0000, '拥有自己的咖啡馆', 3, 1352230232, 'test', 'test', '13344455555', '湖北', '襄樊', 'test', 1, 0, '', 0),
(70, 56, 24, 19, 'test', 1352230237, 500.0000, 0.0000, 500.0000, '', 0, '', 500.0000, 0.0000, '拥有自己的咖啡馆', 3, 1352230237, 'test', 'test', '13344455555', '湖北', '襄樊', 'test', 1, 0, '', 0),
(71, 56, 24, 19, 'test', 1352230240, 500.0000, 0.0000, 500.0000, '', 0, '', 500.0000, 0.0000, '拥有自己的咖啡馆', 3, 1352230240, 'test', 'test', '13344455555', '湖北', '襄樊', 'test', 1, 0, '', 0),
(72, 56, 24, 19, 'test', 1352230243, 500.0000, 0.0000, 500.0000, '', 0, '', 500.0000, 0.0000, '拥有自己的咖啡馆', 3, 1352230243, 'test', 'test', '13344455555', '湖北', '襄樊', 'test', 1, 0, '', 0),
(73, 56, 24, 19, 'test', 1352230247, 500.0000, 0.0000, 500.0000, '', 0, '', 500.0000, 0.0000, '拥有自己的咖啡馆', 3, 1352230247, 'test', 'test', '13344455555', '湖北', '襄樊', 'test', 1, 0, '', 0),
(74, 56, 24, 19, 'test', 1352230268, 500.0000, 0.0000, 500.0000, '', 0, '', 500.0000, 0.0000, '拥有自己的咖啡馆', 3, 1352230268, 'test', 'test', '13344455555', '湖北', '襄樊', 'test', 1, 0, '', 0),
(75, 56, 24, 19, 'test', 1352230270, 500.0000, 0.0000, 500.0000, '', 0, '', 500.0000, 0.0000, '拥有自己的咖啡馆', 3, 1352230270, 'test', 'test', '13344455555', '湖北', '襄樊', 'test', 1, 0, '', 0),
(76, 56, 24, 19, 'test', 1352230293, 500.0000, 0.0000, 500.0000, '', 0, '', 500.0000, 0.0000, '拥有自己的咖啡馆', 3, 1352230293, 'test', 'test', '13344455555', '湖北', '襄樊', 'test', 1, 0, '', 0),
(77, 58, 31, 18, 'fzmatthew', 1352231539, 2000.0000, 0.0000, 2000.0000, 'test', 0, '', 2000.0000, 0.0000, '流浪猫的家—爱天使公益咖啡馆的重建需要大家的力量！', 3, 1352231539, '方维', '350000', '13333333333', '福建', '福州', '福建福州台江区工业路博美诗邦', 1, 0, '', 0),
(78, 58, 30, 19, 'test', 0, 1000.0000, 0.0000, 1000.0000, 'ttt', 24, 'CCB', 500.0000, 0.0000, '流浪猫的家—爱天使公益咖啡馆的重建需要大家的力量！', 0, 1352231631, 'test', 'test', '13344455555', '湖北', '襄樊', 'test', 1, 0, '', 0),
(79, 56, 24, 17, 'fanwe', 0, 500.0000, 0.0000, 500.0000, '部份支付', 24, 'ICBCB2C', 300.0000, 0.0000, '拥有自己的咖啡馆', 0, 1352231671, '方维', '22222', '14444444444', '福建', '福州', '方维方维方维方维方维', 1, 0, '', 0),
(80, 58, 32, 18, 'fzmatthew', 1352231704, 3000.0000, 0.0000, 3000.0000, '', 0, '', 3000.0000, 0.0000, '流浪猫的家—爱天使公益咖啡馆的重建需要大家的力量！', 3, 1352231704, '方维', '350000', '13333333333', '福建', '福州', '福建福州台江区工业路博美诗邦', 1, 0, '', 0),
(86, 57, 25, 19, 'test', 1423402313, 60.0000, 0.0000, 60.0000, '', 0, '', 60.0000, 0.0000, '短片电影《Blind Love》', 3, 1423402313, 'test', 'test', '13344455555', '湖北', '襄樊', 'test', 0, 0, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_order_item`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `unit_price` decimal(20,4) NOT NULL,
  `total_price` decimal(20,4) NOT NULL,
  `delivery_status` tinyint(1) NOT NULL,
  `name` text NOT NULL,
  `return_score` int(11) NOT NULL,
  `return_total_score` int(11) NOT NULL,
  `attr` varchar(255) NOT NULL,
  `verify_code` varchar(255) NOT NULL,
  `order_id` int(11) NOT NULL,
  `return_money` decimal(20,4) NOT NULL,
  `return_total_money` decimal(20,4) NOT NULL,
  `buy_type` tinyint(1) NOT NULL,
  `sub_name` varchar(255) NOT NULL,
  `attr_str` text NOT NULL,
  `is_balance` tinyint(1) NOT NULL COMMENT '0:未结算 1:待结算 2:已结算 3:部份结算',
  `balance_unit_price` decimal(20,4) NOT NULL,
  `balance_memo` text NOT NULL,
  `balance_total_price` decimal(20,4) NOT NULL,
  `balance_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=79 ;

--
-- 转存表中的数据 `fanwe_deal_order_item`
--

INSERT INTO `fanwe_deal_order_item` (`id`, `deal_id`, `number`, `unit_price`, `total_price`, `delivery_status`, `name`, `return_score`, `return_total_score`, `attr`, `verify_code`, `order_id`, `return_money`, `return_total_money`, `buy_type`, `sub_name`, `attr_str`, `is_balance`, `balance_unit_price`, `balance_memo`, `balance_total_price`, `balance_time`) VALUES
(78, 47, 1, '525.0000', '525.0000', 0, '4.3折原价1199正品七匹狼男装 冬款外套双面冬羽绒服701086 [黑色,超大码]', 300, 300, '183,184', 'd29448071527f48e05d8a25a4d13cbbe', 24, '0.0000', '0.0000', 0, '七匹狼男装 [黑色,超大码]', '黑色超大码', 0, '0.0000', '', '0.0000', 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_order_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_order_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_info` text NOT NULL,
  `log_time` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=69 ;

--
-- 转存表中的数据 `fanwe_deal_order_log`
--

INSERT INTO `fanwe_deal_order_log` (`id`, `log_info`, `log_time`, `order_id`) VALUES
(68, '2012010202245833创建收款单2012010202251477收款成功', 1325456714, 24);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_payment`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_pay_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_pay_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `money` double(20,4) NOT NULL,
  `create_time` int(11) NOT NULL,
  `log_info` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `deal_id` (`deal_id`),
  KEY `create_time` (`create_time`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_support_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_support_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `price` double(20,4) NOT NULL,
  `deal_item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `deal_id` (`deal_id`),
  KEY `user_id` (`user_id`),
  KEY `create_time` (`create_time`),
  KEY `deal_item_id` (`deal_item_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=56 ;

--
-- 转存表中的数据 `fanwe_deal_support_log`
--

INSERT INTO `fanwe_deal_support_log` (`id`, `deal_id`, `user_id`, `create_time`, `price`, `deal_item_id`) VALUES
(41, 55, 18, 1352229388, 15.0000, 18),
(42, 56, 17, 1352230101, 500.0000, 24),
(43, 56, 19, 1352230180, 500.0000, 24),
(44, 56, 19, 1352230228, 500.0000, 24),
(45, 56, 19, 1352230232, 500.0000, 24),
(46, 56, 19, 1352230237, 500.0000, 24),
(47, 56, 19, 1352230240, 500.0000, 24),
(48, 56, 19, 1352230243, 500.0000, 24),
(49, 56, 19, 1352230247, 500.0000, 24),
(50, 56, 19, 1352230268, 500.0000, 24),
(51, 56, 19, 1352230270, 500.0000, 24),
(52, 56, 19, 1352230293, 500.0000, 24),
(53, 58, 18, 1352231539, 2000.0000, 31),
(54, 58, 18, 1352231704, 3000.0000, 32),
(55, 57, 19, 1423402313, 60.0000, 25);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_deal_visit_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_deal_visit_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deal_id` int(11) NOT NULL,
  `client_ip` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `deal_id` (`deal_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=179 ;

--
-- 转存表中的数据 `fanwe_deal_visit_log`
--

INSERT INTO `fanwe_deal_visit_log` (`id`, `deal_id`, `client_ip`, `create_time`) VALUES
(117, 55, '127.0.0.1', 1352229137),
(118, 56, '127.0.0.1', 1352230070),
(119, 57, '127.0.0.1', 1352230830),
(120, 58, '127.0.0.1', 1352231514),
(121, 56, '127.0.0.1', 1352231651),
(122, 55, '127.0.0.1', 1352232299),
(123, 58, '127.0.0.1', 1352232420),
(124, 56, '127.0.0.1', 1352232590),
(125, 57, '127.0.0.1', 1352232717),
(126, 55, '127.0.0.1', 1352246374),
(127, 57, '127.0.0.1', 1352246699),
(128, 56, '127.0.0.1', 1352246710),
(129, 58, '127.0.0.1', 1352246719),
(130, 58, '140.224.90.157', 1353888322),
(131, 55, '140.224.90.157', 1353888330),
(132, 57, '140.224.90.157', 1353888339),
(133, 57, '116.28.48.56', 1361047640),
(134, 56, '127.0.0.1', 1364012515),
(135, 55, '127.0.0.1', 1364012843),
(136, 57, '127.0.0.1', 1364013380),
(137, 56, '127.0.0.1', 1364013647),
(138, 55, '127.0.0.1', 1364014145),
(139, 56, '127.0.0.1', 1402190320),
(140, 56, '127.0.0.1', 1402203551),
(141, 55, '127.0.0.1', 1402203992),
(142, 56, '127.0.0.1', 1402204999),
(143, 56, '127.0.0.1', 1402205900),
(144, 57, '127.0.0.1', 1402211748),
(145, 56, '127.0.0.1', 1402216616),
(146, 58, '127.0.0.1', 1402216621),
(147, 57, '127.0.0.1', 1402216624),
(148, 57, '127.0.0.1', 1413116360),
(149, 58, '127.0.0.1', 1413120544),
(150, 56, '127.0.0.1', 1413120572),
(151, 55, '127.0.0.1', 1413120576),
(152, 57, '127.0.0.1', 1413120583),
(153, 57, '127.0.0.1', 1413195260),
(154, 57, '127.0.0.1', 1413196147),
(155, 56, '127.0.0.1', 1413196700),
(156, 55, '127.0.0.1', 1414674421),
(157, 57, '127.0.0.1', 1415543892),
(158, 56, '127.0.0.1', 1416378590),
(159, 63, '127.0.0.1', 1418028994),
(160, 58, '127.0.0.1', 1420618690),
(161, 55, '127.0.0.1', 1420627810),
(162, 58, '127.0.0.1', 1420627945),
(163, 55, '127.0.0.1', 1420630557),
(164, 55, '127.0.0.1', 1420719388),
(165, 55, '127.0.0.1', 1420878947),
(166, 55, '127.0.0.1', 1420880059),
(167, 56, '127.0.0.1', 1420884190),
(168, 56, '127.0.0.1', 1421227672),
(169, 55, '127.0.0.1', 1421753697),
(170, 63, '127.0.0.1', 1421844766),
(171, 55, '127.0.0.1', 1421845493),
(172, 61, '127.0.0.1', 1422697114),
(173, 61, '127.0.0.1', 1422780047),
(174, 63, '127.0.0.1', 1422780050),
(175, 56, '127.0.0.1', 1423293968),
(176, 63, '127.0.0.1', 1423294007),
(177, 57, '127.0.0.1', 1423402040),
(178, 63, '127.0.0.1', 1423892490);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_delivery`
--

CREATE TABLE IF NOT EXISTS `fanwe_delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `first_fee` decimal(20,4) NOT NULL,
  `allow_default` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  `first_weight` decimal(20,4) NOT NULL,
  `continue_weight` decimal(20,4) NOT NULL,
  `continue_fee` decimal(20,4) NOT NULL,
  `weight_id` int(11) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `fanwe_delivery`
--

INSERT INTO `fanwe_delivery` (`id`, `name`, `description`, `first_fee`, `allow_default`, `sort`, `first_weight`, `continue_weight`, `continue_fee`, `weight_id`, `is_effect`) VALUES
(7, '顺风快递', '顺风快递,福州地区免运费', '10.0000', 1, 1, '0.0000', '0.0000', '0.0000', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_delivery_fee`
--

CREATE TABLE IF NOT EXISTS `fanwe_delivery_fee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_id` int(11) NOT NULL,
  `region_ids` text NOT NULL,
  `first_fee` decimal(20,4) NOT NULL,
  `first_weight` decimal(20,4) NOT NULL,
  `continue_fee` decimal(20,4) NOT NULL,
  `continue_weight` decimal(20,4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `fanwe_delivery_fee`
--

INSERT INTO `fanwe_delivery_fee` (`id`, `delivery_id`, `region_ids`, `first_fee`, `first_weight`, `continue_fee`, `continue_weight`) VALUES
(30, 7, '518,519,520,521,522,523,524,525,526,527,528,529,530,518,519,520,521,522,523,524,525,526,527,528,529,530,53', '0.0000', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_delivery_notice`
--

CREATE TABLE IF NOT EXISTS `fanwe_delivery_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_sn` varchar(255) NOT NULL,
  `delivery_time` int(11) NOT NULL,
  `is_arrival` tinyint(1) NOT NULL,
  `arrival_time` int(11) NOT NULL,
  `order_item_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `memo` text NOT NULL,
  `express_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_delivery_region`
--

CREATE TABLE IF NOT EXISTS `fanwe_delivery_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '地区名称',
  `region_level` tinyint(4) NOT NULL COMMENT '1:国 2:省 3:市(县) 4:区(镇)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3402 ;

--
-- 转存表中的数据 `fanwe_delivery_region`
--

INSERT INTO `fanwe_delivery_region` (`id`, `pid`, `name`, `region_level`) VALUES
(2, 1, '北京', 2),
(3, 1, '安徽', 2),
(4, 1, '福建', 2),
(5, 1, '甘肃', 2),
(6, 1, '广东', 2),
(7, 1, '广西', 2),
(8, 1, '贵州', 2),
(9, 1, '海南', 2),
(10, 1, '河北', 2),
(11, 1, '河南', 2),
(12, 1, '黑龙江', 2),
(13, 1, '湖北', 2),
(14, 1, '湖南', 2),
(15, 1, '吉林', 2),
(16, 1, '江苏', 2),
(17, 1, '江西', 2),
(18, 1, '辽宁', 2),
(19, 1, '内蒙古', 2),
(20, 1, '宁夏', 2),
(21, 1, '青海', 2),
(22, 1, '山东', 2),
(23, 1, '山西', 2),
(24, 1, '陕西', 2),
(25, 1, '上海', 2),
(26, 1, '四川', 2),
(27, 1, '天津', 2),
(28, 1, '西藏', 2),
(29, 1, '新疆', 2),
(30, 1, '云南', 2),
(31, 1, '浙江', 2),
(32, 1, '重庆', 2),
(33, 1, '香港', 2),
(34, 1, '澳门', 2),
(35, 1, '台湾', 2),
(36, 3, '安庆', 3),
(37, 3, '蚌埠', 3),
(38, 3, '巢湖', 3),
(39, 3, '池州', 3),
(40, 3, '滁州', 3),
(41, 3, '阜阳', 3),
(42, 3, '淮北', 3),
(43, 3, '淮南', 3),
(44, 3, '黄山', 3),
(45, 3, '六安', 3),
(46, 3, '马鞍山', 3),
(47, 3, '宿州', 3),
(48, 3, '铜陵', 3),
(49, 3, '芜湖', 3),
(50, 3, '宣城', 3),
(51, 3, '亳州', 3),
(52, 2, '北京', 3),
(53, 4, '福州', 3),
(54, 4, '龙岩', 3),
(55, 4, '南平', 3),
(56, 4, '宁德', 3),
(57, 4, '莆田', 3),
(58, 4, '泉州', 3),
(59, 4, '三明', 3),
(60, 4, '厦门', 3),
(61, 4, '漳州', 3),
(62, 5, '兰州', 3),
(63, 5, '白银', 3),
(64, 5, '定西', 3),
(65, 5, '甘南', 3),
(66, 5, '嘉峪关', 3),
(67, 5, '金昌', 3),
(68, 5, '酒泉', 3),
(69, 5, '临夏', 3),
(70, 5, '陇南', 3),
(71, 5, '平凉', 3),
(72, 5, '庆阳', 3),
(73, 5, '天水', 3),
(74, 5, '武威', 3),
(75, 5, '张掖', 3),
(76, 6, '广州', 3),
(77, 6, '深圳', 3),
(78, 6, '潮州', 3),
(79, 6, '东莞', 3),
(80, 6, '佛山', 3),
(81, 6, '河源', 3),
(82, 6, '惠州', 3),
(83, 6, '江门', 3),
(84, 6, '揭阳', 3),
(85, 6, '茂名', 3),
(86, 6, '梅州', 3),
(87, 6, '清远', 3),
(88, 6, '汕头', 3),
(89, 6, '汕尾', 3),
(90, 6, '韶关', 3),
(91, 6, '阳江', 3),
(92, 6, '云浮', 3),
(93, 6, '湛江', 3),
(94, 6, '肇庆', 3),
(95, 6, '中山', 3),
(96, 6, '珠海', 3),
(97, 7, '南宁', 3),
(98, 7, '桂林', 3),
(99, 7, '百色', 3),
(100, 7, '北海', 3),
(101, 7, '崇左', 3),
(102, 7, '防城港', 3),
(103, 7, '贵港', 3),
(104, 7, '河池', 3),
(105, 7, '贺州', 3),
(106, 7, '来宾', 3),
(107, 7, '柳州', 3),
(108, 7, '钦州', 3),
(109, 7, '梧州', 3),
(110, 7, '玉林', 3),
(111, 8, '贵阳', 3),
(112, 8, '安顺', 3),
(113, 8, '毕节', 3),
(114, 8, '六盘水', 3),
(115, 8, '黔东南', 3),
(116, 8, '黔南', 3),
(117, 8, '黔西南', 3),
(118, 8, '铜仁', 3),
(119, 8, '遵义', 3),
(120, 9, '海口', 3),
(121, 9, '三亚', 3),
(122, 9, '白沙', 3),
(123, 9, '保亭', 3),
(124, 9, '昌江', 3),
(125, 9, '澄迈县', 3),
(126, 9, '定安县', 3),
(127, 9, '东方', 3),
(128, 9, '乐东', 3),
(129, 9, '临高县', 3),
(130, 9, '陵水', 3),
(131, 9, '琼海', 3),
(132, 9, '琼中', 3),
(133, 9, '屯昌县', 3),
(134, 9, '万宁', 3),
(135, 9, '文昌', 3),
(136, 9, '五指山', 3),
(137, 9, '儋州', 3),
(138, 10, '石家庄', 3),
(139, 10, '保定', 3),
(140, 10, '沧州', 3),
(141, 10, '承德', 3),
(142, 10, '邯郸', 3),
(143, 10, '衡水', 3),
(144, 10, '廊坊', 3),
(145, 10, '秦皇岛', 3),
(146, 10, '唐山', 3),
(147, 10, '邢台', 3),
(148, 10, '张家口', 3),
(149, 11, '郑州', 3),
(150, 11, '洛阳', 3),
(151, 11, '开封', 3),
(152, 11, '安阳', 3),
(153, 11, '鹤壁', 3),
(154, 11, '济源', 3),
(155, 11, '焦作', 3),
(156, 11, '南阳', 3),
(157, 11, '平顶山', 3),
(158, 11, '三门峡', 3),
(159, 11, '商丘', 3),
(160, 11, '新乡', 3),
(161, 11, '信阳', 3),
(162, 11, '许昌', 3),
(163, 11, '周口', 3),
(164, 11, '驻马店', 3),
(165, 11, '漯河', 3),
(166, 11, '濮阳', 3),
(167, 12, '哈尔滨', 3),
(168, 12, '大庆', 3),
(169, 12, '大兴安岭', 3),
(170, 12, '鹤岗', 3),
(171, 12, '黑河', 3),
(172, 12, '鸡西', 3),
(173, 12, '佳木斯', 3),
(174, 12, '牡丹江', 3),
(175, 12, '七台河', 3),
(176, 12, '齐齐哈尔', 3),
(177, 12, '双鸭山', 3),
(178, 12, '绥化', 3),
(179, 12, '伊春', 3),
(180, 13, '武汉', 3),
(181, 13, '仙桃', 3),
(182, 13, '鄂州', 3),
(183, 13, '黄冈', 3),
(184, 13, '黄石', 3),
(185, 13, '荆门', 3),
(186, 13, '荆州', 3),
(187, 13, '潜江', 3),
(188, 13, '神农架林区', 3),
(189, 13, '十堰', 3),
(190, 13, '随州', 3),
(191, 13, '天门', 3),
(192, 13, '咸宁', 3),
(193, 13, '襄樊', 3),
(194, 13, '孝感', 3),
(195, 13, '宜昌', 3),
(196, 13, '恩施', 3),
(197, 14, '长沙', 3),
(198, 14, '张家界', 3),
(199, 14, '常德', 3),
(200, 14, '郴州', 3),
(201, 14, '衡阳', 3),
(202, 14, '怀化', 3),
(203, 14, '娄底', 3),
(204, 14, '邵阳', 3),
(205, 14, '湘潭', 3),
(206, 14, '湘西', 3),
(207, 14, '益阳', 3),
(208, 14, '永州', 3),
(209, 14, '岳阳', 3),
(210, 14, '株洲', 3),
(211, 15, '长春', 3),
(212, 15, '吉林', 3),
(213, 15, '白城', 3),
(214, 15, '白山', 3),
(215, 15, '辽源', 3),
(216, 15, '四平', 3),
(217, 15, '松原', 3),
(218, 15, '通化', 3),
(219, 15, '延边', 3),
(220, 16, '南京', 3),
(221, 16, '苏州', 3),
(222, 16, '无锡', 3),
(223, 16, '常州', 3),
(224, 16, '淮安', 3),
(225, 16, '连云港', 3),
(226, 16, '南通', 3),
(227, 16, '宿迁', 3),
(228, 16, '泰州', 3),
(229, 16, '徐州', 3),
(230, 16, '盐城', 3),
(231, 16, '扬州', 3),
(232, 16, '镇江', 3),
(233, 17, '南昌', 3),
(234, 17, '抚州', 3),
(235, 17, '赣州', 3),
(236, 17, '吉安', 3),
(237, 17, '景德镇', 3),
(238, 17, '九江', 3),
(239, 17, '萍乡', 3),
(240, 17, '上饶', 3),
(241, 17, '新余', 3),
(242, 17, '宜春', 3),
(243, 17, '鹰潭', 3),
(244, 18, '沈阳', 3),
(245, 18, '大连', 3),
(246, 18, '鞍山', 3),
(247, 18, '本溪', 3),
(248, 18, '朝阳', 3),
(249, 18, '丹东', 3),
(250, 18, '抚顺', 3),
(251, 18, '阜新', 3),
(252, 18, '葫芦岛', 3),
(253, 18, '锦州', 3),
(254, 18, '辽阳', 3),
(255, 18, '盘锦', 3),
(256, 18, '铁岭', 3),
(257, 18, '营口', 3),
(258, 19, '呼和浩特', 3),
(259, 19, '阿拉善盟', 3),
(260, 19, '巴彦淖尔盟', 3),
(261, 19, '包头', 3),
(262, 19, '赤峰', 3),
(263, 19, '鄂尔多斯', 3),
(264, 19, '呼伦贝尔', 3),
(265, 19, '通辽', 3),
(266, 19, '乌海', 3),
(267, 19, '乌兰察布市', 3),
(268, 19, '锡林郭勒盟', 3),
(269, 19, '兴安盟', 3),
(270, 20, '银川', 3),
(271, 20, '固原', 3),
(272, 20, '石嘴山', 3),
(273, 20, '吴忠', 3),
(274, 20, '中卫', 3),
(275, 21, '西宁', 3),
(276, 21, '果洛', 3),
(277, 21, '海北', 3),
(278, 21, '海东', 3),
(279, 21, '海南', 3),
(280, 21, '海西', 3),
(281, 21, '黄南', 3),
(282, 21, '玉树', 3),
(283, 22, '济南', 3),
(284, 22, '青岛', 3),
(285, 22, '滨州', 3),
(286, 22, '德州', 3),
(287, 22, '东营', 3),
(288, 22, '菏泽', 3),
(289, 22, '济宁', 3),
(290, 22, '莱芜', 3),
(291, 22, '聊城', 3),
(292, 22, '临沂', 3),
(293, 22, '日照', 3),
(294, 22, '泰安', 3),
(295, 22, '威海', 3),
(296, 22, '潍坊', 3),
(297, 22, '烟台', 3),
(298, 22, '枣庄', 3),
(299, 22, '淄博', 3),
(300, 23, '太原', 3),
(301, 23, '长治', 3),
(302, 23, '大同', 3),
(303, 23, '晋城', 3),
(304, 23, '晋中', 3),
(305, 23, '临汾', 3),
(306, 23, '吕梁', 3),
(307, 23, '朔州', 3),
(308, 23, '忻州', 3),
(309, 23, '阳泉', 3),
(310, 23, '运城', 3),
(311, 24, '西安', 3),
(312, 24, '安康', 3),
(313, 24, '宝鸡', 3),
(314, 24, '汉中', 3),
(315, 24, '商洛', 3),
(316, 24, '铜川', 3),
(317, 24, '渭南', 3),
(318, 24, '咸阳', 3),
(319, 24, '延安', 3),
(320, 24, '榆林', 3),
(321, 25, '上海', 3),
(322, 26, '成都', 3),
(323, 26, '绵阳', 3),
(324, 26, '阿坝', 3),
(325, 26, '巴中', 3),
(326, 26, '达州', 3),
(327, 26, '德阳', 3),
(328, 26, '甘孜', 3),
(329, 26, '广安', 3),
(330, 26, '广元', 3),
(331, 26, '乐山', 3),
(332, 26, '凉山', 3),
(333, 26, '眉山', 3),
(334, 26, '南充', 3),
(335, 26, '内江', 3),
(336, 26, '攀枝花', 3),
(337, 26, '遂宁', 3),
(338, 26, '雅安', 3),
(339, 26, '宜宾', 3),
(340, 26, '资阳', 3),
(341, 26, '自贡', 3),
(342, 26, '泸州', 3),
(343, 27, '天津', 3),
(344, 28, '拉萨', 3),
(345, 28, '阿里', 3),
(346, 28, '昌都', 3),
(347, 28, '林芝', 3),
(348, 28, '那曲', 3),
(349, 28, '日喀则', 3),
(350, 28, '山南', 3),
(351, 29, '乌鲁木齐', 3),
(352, 29, '阿克苏', 3),
(353, 29, '阿拉尔', 3),
(354, 29, '巴音郭楞', 3),
(355, 29, '博尔塔拉', 3),
(356, 29, '昌吉', 3),
(357, 29, '哈密', 3),
(358, 29, '和田', 3),
(359, 29, '喀什', 3),
(360, 29, '克拉玛依', 3),
(361, 29, '克孜勒苏', 3),
(362, 29, '石河子', 3),
(363, 29, '图木舒克', 3),
(364, 29, '吐鲁番', 3),
(365, 29, '五家渠', 3),
(366, 29, '伊犁', 3),
(367, 30, '昆明', 3),
(368, 30, '怒江', 3),
(369, 30, '普洱', 3),
(370, 30, '丽江', 3),
(371, 30, '保山', 3),
(372, 30, '楚雄', 3),
(373, 30, '大理', 3),
(374, 30, '德宏', 3),
(375, 30, '迪庆', 3),
(376, 30, '红河', 3),
(377, 30, '临沧', 3),
(378, 30, '曲靖', 3),
(379, 30, '文山', 3),
(380, 30, '西双版纳', 3),
(381, 30, '玉溪', 3),
(382, 30, '昭通', 3),
(383, 31, '杭州', 3),
(384, 31, '湖州', 3),
(385, 31, '嘉兴', 3),
(386, 31, '金华', 3),
(387, 31, '丽水', 3),
(388, 31, '宁波', 3),
(389, 31, '绍兴', 3),
(390, 31, '台州', 3),
(391, 31, '温州', 3),
(392, 31, '舟山', 3),
(393, 31, '衢州', 3),
(394, 32, '重庆', 3),
(395, 33, '香港', 3),
(396, 34, '澳门', 3),
(397, 35, '台湾', 3),
(398, 36, '迎江区', 4),
(399, 36, '大观区', 4),
(400, 36, '宜秀区', 4),
(401, 36, '桐城市', 4),
(402, 36, '怀宁县', 4),
(403, 36, '枞阳县', 4),
(404, 36, '潜山县', 4),
(405, 36, '太湖县', 4),
(406, 36, '宿松县', 4),
(407, 36, '望江县', 4),
(408, 36, '岳西县', 4),
(409, 37, '中市区', 4),
(410, 37, '东市区', 4),
(411, 37, '西市区', 4),
(412, 37, '郊区', 4),
(413, 37, '怀远县', 4),
(414, 37, '五河县', 4),
(415, 37, '固镇县', 4),
(416, 38, '居巢区', 4),
(417, 38, '庐江县', 4),
(418, 38, '无为县', 4),
(419, 38, '含山县', 4),
(420, 38, '和县', 4),
(421, 39, '贵池区', 4),
(422, 39, '东至县', 4),
(423, 39, '石台县', 4),
(424, 39, '青阳县', 4),
(425, 40, '琅琊区', 4),
(426, 40, '南谯区', 4),
(427, 40, '天长市', 4),
(428, 40, '明光市', 4),
(429, 40, '来安县', 4),
(430, 40, '全椒县', 4),
(431, 40, '定远县', 4),
(432, 40, '凤阳县', 4),
(433, 41, '蚌山区', 4),
(434, 41, '龙子湖区', 4),
(435, 41, '禹会区', 4),
(436, 41, '淮上区', 4),
(437, 41, '颍州区', 4),
(438, 41, '颍东区', 4),
(439, 41, '颍泉区', 4),
(440, 41, '界首市', 4),
(441, 41, '临泉县', 4),
(442, 41, '太和县', 4),
(443, 41, '阜南县', 4),
(444, 41, '颖上县', 4),
(445, 42, '相山区', 4),
(446, 42, '杜集区', 4),
(447, 42, '烈山区', 4),
(448, 42, '濉溪县', 4),
(449, 43, '田家庵区', 4),
(450, 43, '大通区', 4),
(451, 43, '谢家集区', 4),
(452, 43, '八公山区', 4),
(453, 43, '潘集区', 4),
(454, 43, '凤台县', 4),
(455, 44, '屯溪区', 4),
(456, 44, '黄山区', 4),
(457, 44, '徽州区', 4),
(458, 44, '歙县', 4),
(459, 44, '休宁县', 4),
(460, 44, '黟县', 4),
(461, 44, '祁门县', 4),
(462, 45, '金安区', 4),
(463, 45, '裕安区', 4),
(464, 45, '寿县', 4),
(465, 45, '霍邱县', 4),
(466, 45, '舒城县', 4),
(467, 45, '金寨县', 4),
(468, 45, '霍山县', 4),
(469, 46, '雨山区', 4),
(470, 46, '花山区', 4),
(471, 46, '金家庄区', 4),
(472, 46, '当涂县', 4),
(473, 47, '埇桥区', 4),
(474, 47, '砀山县', 4),
(475, 47, '萧县', 4),
(476, 47, '灵璧县', 4),
(477, 47, '泗县', 4),
(478, 48, '铜官山区', 4),
(479, 48, '狮子山区', 4),
(480, 48, '郊区', 4),
(481, 48, '铜陵县', 4),
(482, 49, '镜湖区', 4),
(483, 49, '弋江区', 4),
(484, 49, '鸠江区', 4),
(485, 49, '三山区', 4),
(486, 49, '芜湖县', 4),
(487, 49, '繁昌县', 4),
(488, 49, '南陵县', 4),
(489, 50, '宣州区', 4),
(490, 50, '宁国市', 4),
(491, 50, '郎溪县', 4),
(492, 50, '广德县', 4),
(493, 50, '泾县', 4),
(494, 50, '绩溪县', 4),
(495, 50, '旌德县', 4),
(496, 51, '涡阳县', 4),
(497, 51, '蒙城县', 4),
(498, 51, '利辛县', 4),
(499, 51, '谯城区', 4),
(500, 52, '东城区', 4),
(501, 52, '西城区', 4),
(502, 52, '海淀区', 4),
(503, 52, '朝阳区', 4),
(504, 52, '崇文区', 4),
(505, 52, '宣武区', 4),
(506, 52, '丰台区', 4),
(507, 52, '石景山区', 4),
(508, 52, '房山区', 4),
(509, 52, '门头沟区', 4),
(510, 52, '通州区', 4),
(511, 52, '顺义区', 4),
(512, 52, '昌平区', 4),
(513, 52, '怀柔区', 4),
(514, 52, '平谷区', 4),
(515, 52, '大兴区', 4),
(516, 52, '密云县', 4),
(517, 52, '延庆县', 4),
(518, 53, '鼓楼区', 4),
(519, 53, '台江区', 4),
(520, 53, '仓山区', 4),
(521, 53, '马尾区', 4),
(522, 53, '晋安区', 4),
(523, 53, '福清市', 4),
(524, 53, '长乐市', 4),
(525, 53, '闽侯县', 4),
(526, 53, '连江县', 4),
(527, 53, '罗源县', 4),
(528, 53, '闽清县', 4),
(529, 53, '永泰县', 4),
(530, 53, '平潭县', 4),
(531, 54, '新罗区', 4),
(532, 54, '漳平市', 4),
(533, 54, '长汀县', 4),
(534, 54, '永定县', 4),
(535, 54, '上杭县', 4),
(536, 54, '武平县', 4),
(537, 54, '连城县', 4),
(538, 55, '延平区', 4),
(539, 55, '邵武市', 4),
(540, 55, '武夷山市', 4),
(541, 55, '建瓯市', 4),
(542, 55, '建阳市', 4),
(543, 55, '顺昌县', 4),
(544, 55, '浦城县', 4),
(545, 55, '光泽县', 4),
(546, 55, '松溪县', 4),
(547, 55, '政和县', 4),
(548, 56, '蕉城区', 4),
(549, 56, '福安市', 4),
(550, 56, '福鼎市', 4),
(551, 56, '霞浦县', 4),
(552, 56, '古田县', 4),
(553, 56, '屏南县', 4),
(554, 56, '寿宁县', 4),
(555, 56, '周宁县', 4),
(556, 56, '柘荣县', 4),
(557, 57, '城厢区', 4),
(558, 57, '涵江区', 4),
(559, 57, '荔城区', 4),
(560, 57, '秀屿区', 4),
(561, 57, '仙游县', 4),
(562, 58, '鲤城区', 4),
(563, 58, '丰泽区', 4),
(564, 58, '洛江区', 4),
(565, 58, '清濛开发区', 4),
(566, 58, '泉港区', 4),
(567, 58, '石狮市', 4),
(568, 58, '晋江市', 4),
(569, 58, '南安市', 4),
(570, 58, '惠安县', 4),
(571, 58, '安溪县', 4),
(572, 58, '永春县', 4),
(573, 58, '德化县', 4),
(574, 58, '金门县', 4),
(575, 59, '梅列区', 4),
(576, 59, '三元区', 4),
(577, 59, '永安市', 4),
(578, 59, '明溪县', 4),
(579, 59, '清流县', 4),
(580, 59, '宁化县', 4),
(581, 59, '大田县', 4),
(582, 59, '尤溪县', 4),
(583, 59, '沙县', 4),
(584, 59, '将乐县', 4),
(585, 59, '泰宁县', 4),
(586, 59, '建宁县', 4),
(587, 60, '思明区', 4),
(588, 60, '海沧区', 4),
(589, 60, '湖里区', 4),
(590, 60, '集美区', 4),
(591, 60, '同安区', 4),
(592, 60, '翔安区', 4),
(593, 61, '芗城区', 4),
(594, 61, '龙文区', 4),
(595, 61, '龙海市', 4),
(596, 61, '云霄县', 4),
(597, 61, '漳浦县', 4),
(598, 61, '诏安县', 4),
(599, 61, '长泰县', 4),
(600, 61, '东山县', 4),
(601, 61, '南靖县', 4),
(602, 61, '平和县', 4),
(603, 61, '华安县', 4),
(604, 62, '皋兰县', 4),
(605, 62, '城关区', 4),
(606, 62, '七里河区', 4),
(607, 62, '西固区', 4),
(608, 62, '安宁区', 4),
(609, 62, '红古区', 4),
(610, 62, '永登县', 4),
(611, 62, '榆中县', 4),
(612, 63, '白银区', 4),
(613, 63, '平川区', 4),
(614, 63, '会宁县', 4),
(615, 63, '景泰县', 4),
(616, 63, '靖远县', 4),
(617, 64, '临洮县', 4),
(618, 64, '陇西县', 4),
(619, 64, '通渭县', 4),
(620, 64, '渭源县', 4),
(621, 64, '漳县', 4),
(622, 64, '岷县', 4),
(623, 64, '安定区', 4),
(624, 64, '安定区', 4),
(625, 65, '合作市', 4),
(626, 65, '临潭县', 4),
(627, 65, '卓尼县', 4),
(628, 65, '舟曲县', 4),
(629, 65, '迭部县', 4),
(630, 65, '玛曲县', 4),
(631, 65, '碌曲县', 4),
(632, 65, '夏河县', 4),
(633, 66, '嘉峪关市', 4),
(634, 67, '金川区', 4),
(635, 67, '永昌县', 4),
(636, 68, '肃州区', 4),
(637, 68, '玉门市', 4),
(638, 68, '敦煌市', 4),
(639, 68, '金塔县', 4),
(640, 68, '瓜州县', 4),
(641, 68, '肃北', 4),
(642, 68, '阿克塞', 4),
(643, 69, '临夏市', 4),
(644, 69, '临夏县', 4),
(645, 69, '康乐县', 4),
(646, 69, '永靖县', 4),
(647, 69, '广河县', 4),
(648, 69, '和政县', 4),
(649, 69, '东乡族自治县', 4),
(650, 69, '积石山', 4),
(651, 70, '成县', 4),
(652, 70, '徽县', 4),
(653, 70, '康县', 4),
(654, 70, '礼县', 4),
(655, 70, '两当县', 4),
(656, 70, '文县', 4),
(657, 70, '西和县', 4),
(658, 70, '宕昌县', 4),
(659, 70, '武都区', 4),
(660, 71, '崇信县', 4),
(661, 71, '华亭县', 4),
(662, 71, '静宁县', 4),
(663, 71, '灵台县', 4),
(664, 71, '崆峒区', 4),
(665, 71, '庄浪县', 4),
(666, 71, '泾川县', 4),
(667, 72, '合水县', 4),
(668, 72, '华池县', 4),
(669, 72, '环县', 4),
(670, 72, '宁县', 4),
(671, 72, '庆城县', 4),
(672, 72, '西峰区', 4),
(673, 72, '镇原县', 4),
(674, 72, '正宁县', 4),
(675, 73, '甘谷县', 4),
(676, 73, '秦安县', 4),
(677, 73, '清水县', 4),
(678, 73, '秦州区', 4),
(679, 73, '麦积区', 4),
(680, 73, '武山县', 4),
(681, 73, '张家川', 4),
(682, 74, '古浪县', 4),
(683, 74, '民勤县', 4),
(684, 74, '天祝', 4),
(685, 74, '凉州区', 4),
(686, 75, '高台县', 4),
(687, 75, '临泽县', 4),
(688, 75, '民乐县', 4),
(689, 75, '山丹县', 4),
(690, 75, '肃南', 4),
(691, 75, '甘州区', 4),
(692, 76, '从化市', 4),
(693, 76, '天河区', 4),
(694, 76, '东山区', 4),
(695, 76, '白云区', 4),
(696, 76, '海珠区', 4),
(697, 76, '荔湾区', 4),
(698, 76, '越秀区', 4),
(699, 76, '黄埔区', 4),
(700, 76, '番禺区', 4),
(701, 76, '花都区', 4),
(702, 76, '增城区', 4),
(703, 76, '从化区', 4),
(704, 76, '市郊', 4),
(705, 77, '福田区', 4),
(706, 77, '罗湖区', 4),
(707, 77, '南山区', 4),
(708, 77, '宝安区', 4),
(709, 77, '龙岗区', 4),
(710, 77, '盐田区', 4),
(711, 78, '湘桥区', 4),
(712, 78, '潮安县', 4),
(713, 78, '饶平县', 4),
(714, 79, '南城区', 4),
(715, 79, '东城区', 4),
(716, 79, '万江区', 4),
(717, 79, '莞城区', 4),
(718, 79, '石龙镇', 4),
(719, 79, '虎门镇', 4),
(720, 79, '麻涌镇', 4),
(721, 79, '道滘镇', 4),
(722, 79, '石碣镇', 4),
(723, 79, '沙田镇', 4),
(724, 79, '望牛墩镇', 4),
(725, 79, '洪梅镇', 4),
(726, 79, '茶山镇', 4),
(727, 79, '寮步镇', 4),
(728, 79, '大岭山镇', 4),
(729, 79, '大朗镇', 4),
(730, 79, '黄江镇', 4),
(731, 79, '樟木头', 4),
(732, 79, '凤岗镇', 4),
(733, 79, '塘厦镇', 4),
(734, 79, '谢岗镇', 4),
(735, 79, '厚街镇', 4),
(736, 79, '清溪镇', 4),
(737, 79, '常平镇', 4),
(738, 79, '桥头镇', 4),
(739, 79, '横沥镇', 4),
(740, 79, '东坑镇', 4),
(741, 79, '企石镇', 4),
(742, 79, '石排镇', 4),
(743, 79, '长安镇', 4),
(744, 79, '中堂镇', 4),
(745, 79, '高埗镇', 4),
(746, 80, '禅城区', 4),
(747, 80, '南海区', 4),
(748, 80, '顺德区', 4),
(749, 80, '三水区', 4),
(750, 80, '高明区', 4),
(751, 81, '东源县', 4),
(752, 81, '和平县', 4),
(753, 81, '源城区', 4),
(754, 81, '连平县', 4),
(755, 81, '龙川县', 4),
(756, 81, '紫金县', 4),
(757, 82, '惠阳区', 4),
(758, 82, '惠城区', 4),
(759, 82, '大亚湾', 4),
(760, 82, '博罗县', 4),
(761, 82, '惠东县', 4),
(762, 82, '龙门县', 4),
(763, 83, '江海区', 4),
(764, 83, '蓬江区', 4),
(765, 83, '新会区', 4),
(766, 83, '台山市', 4),
(767, 83, '开平市', 4),
(768, 83, '鹤山市', 4),
(769, 83, '恩平市', 4),
(770, 84, '榕城区', 4),
(771, 84, '普宁市', 4),
(772, 84, '揭东县', 4),
(773, 84, '揭西县', 4),
(774, 84, '惠来县', 4),
(775, 85, '茂南区', 4),
(776, 85, '茂港区', 4),
(777, 85, '高州市', 4),
(778, 85, '化州市', 4),
(779, 85, '信宜市', 4),
(780, 85, '电白县', 4),
(781, 86, '梅县', 4),
(782, 86, '梅江区', 4),
(783, 86, '兴宁市', 4),
(784, 86, '大埔县', 4),
(785, 86, '丰顺县', 4),
(786, 86, '五华县', 4),
(787, 86, '平远县', 4),
(788, 86, '蕉岭县', 4),
(789, 87, '清城区', 4),
(790, 87, '英德市', 4),
(791, 87, '连州市', 4),
(792, 87, '佛冈县', 4),
(793, 87, '阳山县', 4),
(794, 87, '清新县', 4),
(795, 87, '连山', 4),
(796, 87, '连南', 4),
(797, 88, '南澳县', 4),
(798, 88, '潮阳区', 4),
(799, 88, '澄海区', 4),
(800, 88, '龙湖区', 4),
(801, 88, '金平区', 4),
(802, 88, '濠江区', 4),
(803, 88, '潮南区', 4),
(804, 89, '城区', 4),
(805, 89, '陆丰市', 4),
(806, 89, '海丰县', 4),
(807, 89, '陆河县', 4),
(808, 90, '曲江县', 4),
(809, 90, '浈江区', 4),
(810, 90, '武江区', 4),
(811, 90, '曲江区', 4),
(812, 90, '乐昌市', 4),
(813, 90, '南雄市', 4),
(814, 90, '始兴县', 4),
(815, 90, '仁化县', 4),
(816, 90, '翁源县', 4),
(817, 90, '新丰县', 4),
(818, 90, '乳源', 4),
(819, 91, '江城区', 4),
(820, 91, '阳春市', 4),
(821, 91, '阳西县', 4),
(822, 91, '阳东县', 4),
(823, 92, '云城区', 4),
(824, 92, '罗定市', 4),
(825, 92, '新兴县', 4),
(826, 92, '郁南县', 4),
(827, 92, '云安县', 4),
(828, 93, '赤坎区', 4),
(829, 93, '霞山区', 4),
(830, 93, '坡头区', 4),
(831, 93, '麻章区', 4),
(832, 93, '廉江市', 4),
(833, 93, '雷州市', 4),
(834, 93, '吴川市', 4),
(835, 93, '遂溪县', 4),
(836, 93, '徐闻县', 4),
(837, 94, '肇庆市', 4),
(838, 94, '高要市', 4),
(839, 94, '四会市', 4),
(840, 94, '广宁县', 4),
(841, 94, '怀集县', 4),
(842, 94, '封开县', 4),
(843, 94, '德庆县', 4),
(844, 95, '石岐街道', 4),
(845, 95, '东区街道', 4),
(846, 95, '西区街道', 4),
(847, 95, '环城街道', 4),
(848, 95, '中山港街道', 4),
(849, 95, '五桂山街道', 4),
(850, 96, '香洲区', 4),
(851, 96, '斗门区', 4),
(852, 96, '金湾区', 4),
(853, 97, '邕宁区', 4),
(854, 97, '青秀区', 4),
(855, 97, '兴宁区', 4),
(856, 97, '良庆区', 4),
(857, 97, '西乡塘区', 4),
(858, 97, '江南区', 4),
(859, 97, '武鸣县', 4),
(860, 97, '隆安县', 4),
(861, 97, '马山县', 4),
(862, 97, '上林县', 4),
(863, 97, '宾阳县', 4),
(864, 97, '横县', 4),
(865, 98, '秀峰区', 4),
(866, 98, '叠彩区', 4),
(867, 98, '象山区', 4),
(868, 98, '七星区', 4),
(869, 98, '雁山区', 4),
(870, 98, '阳朔县', 4),
(871, 98, '临桂县', 4),
(872, 98, '灵川县', 4),
(873, 98, '全州县', 4),
(874, 98, '平乐县', 4),
(875, 98, '兴安县', 4),
(876, 98, '灌阳县', 4),
(877, 98, '荔浦县', 4),
(878, 98, '资源县', 4),
(879, 98, '永福县', 4),
(880, 98, '龙胜', 4),
(881, 98, '恭城', 4),
(882, 99, '右江区', 4),
(883, 99, '凌云县', 4),
(884, 99, '平果县', 4),
(885, 99, '西林县', 4),
(886, 99, '乐业县', 4),
(887, 99, '德保县', 4),
(888, 99, '田林县', 4),
(889, 99, '田阳县', 4),
(890, 99, '靖西县', 4),
(891, 99, '田东县', 4),
(892, 99, '那坡县', 4),
(893, 99, '隆林', 4),
(894, 100, '海城区', 4),
(895, 100, '银海区', 4),
(896, 100, '铁山港区', 4),
(897, 100, '合浦县', 4),
(898, 101, '江州区', 4),
(899, 101, '凭祥市', 4),
(900, 101, '宁明县', 4),
(901, 101, '扶绥县', 4),
(902, 101, '龙州县', 4),
(903, 101, '大新县', 4),
(904, 101, '天等县', 4),
(905, 102, '港口区', 4),
(906, 102, '防城区', 4),
(907, 102, '东兴市', 4),
(908, 102, '上思县', 4),
(909, 103, '港北区', 4),
(910, 103, '港南区', 4),
(911, 103, '覃塘区', 4),
(912, 103, '桂平市', 4),
(913, 103, '平南县', 4),
(914, 104, '金城江区', 4),
(915, 104, '宜州市', 4),
(916, 104, '天峨县', 4),
(917, 104, '凤山县', 4),
(918, 104, '南丹县', 4),
(919, 104, '东兰县', 4),
(920, 104, '都安', 4),
(921, 104, '罗城', 4),
(922, 104, '巴马', 4),
(923, 104, '环江', 4),
(924, 104, '大化', 4),
(925, 105, '八步区', 4),
(926, 105, '钟山县', 4),
(927, 105, '昭平县', 4),
(928, 105, '富川', 4),
(929, 106, '兴宾区', 4),
(930, 106, '合山市', 4),
(931, 106, '象州县', 4),
(932, 106, '武宣县', 4),
(933, 106, '忻城县', 4),
(934, 106, '金秀', 4),
(935, 107, '城中区', 4),
(936, 107, '鱼峰区', 4),
(937, 107, '柳北区', 4),
(938, 107, '柳南区', 4),
(939, 107, '柳江县', 4),
(940, 107, '柳城县', 4),
(941, 107, '鹿寨县', 4),
(942, 107, '融安县', 4),
(943, 107, '融水', 4),
(944, 107, '三江', 4),
(945, 108, '钦南区', 4),
(946, 108, '钦北区', 4),
(947, 108, '灵山县', 4),
(948, 108, '浦北县', 4),
(949, 109, '万秀区', 4),
(950, 109, '蝶山区', 4),
(951, 109, '长洲区', 4),
(952, 109, '岑溪市', 4),
(953, 109, '苍梧县', 4),
(954, 109, '藤县', 4),
(955, 109, '蒙山县', 4),
(956, 110, '玉州区', 4),
(957, 110, '北流市', 4),
(958, 110, '容县', 4),
(959, 110, '陆川县', 4),
(960, 110, '博白县', 4),
(961, 110, '兴业县', 4),
(962, 111, '南明区', 4),
(963, 111, '云岩区', 4),
(964, 111, '花溪区', 4),
(965, 111, '乌当区', 4),
(966, 111, '白云区', 4),
(967, 111, '小河区', 4),
(968, 111, '金阳新区', 4),
(969, 111, '新天园区', 4),
(970, 111, '清镇市', 4),
(971, 111, '开阳县', 4),
(972, 111, '修文县', 4),
(973, 111, '息烽县', 4),
(974, 112, '西秀区', 4),
(975, 112, '关岭', 4),
(976, 112, '镇宁', 4),
(977, 112, '紫云', 4),
(978, 112, '平坝县', 4),
(979, 112, '普定县', 4),
(980, 113, '毕节市', 4),
(981, 113, '大方县', 4),
(982, 113, '黔西县', 4),
(983, 113, '金沙县', 4),
(984, 113, '织金县', 4),
(985, 113, '纳雍县', 4),
(986, 113, '赫章县', 4),
(987, 113, '威宁', 4),
(988, 114, '钟山区', 4),
(989, 114, '六枝特区', 4),
(990, 114, '水城县', 4),
(991, 114, '盘县', 4),
(992, 115, '凯里市', 4),
(993, 115, '黄平县', 4),
(994, 115, '施秉县', 4),
(995, 115, '三穗县', 4),
(996, 115, '镇远县', 4),
(997, 115, '岑巩县', 4),
(998, 115, '天柱县', 4),
(999, 115, '锦屏县', 4),
(1000, 115, '剑河县', 4),
(1001, 115, '台江县', 4),
(1002, 115, '黎平县', 4),
(1003, 115, '榕江县', 4),
(1004, 115, '从江县', 4),
(1005, 115, '雷山县', 4),
(1006, 115, '麻江县', 4),
(1007, 115, '丹寨县', 4),
(1008, 116, '都匀市', 4),
(1009, 116, '福泉市', 4),
(1010, 116, '荔波县', 4),
(1011, 116, '贵定县', 4),
(1012, 116, '瓮安县', 4),
(1013, 116, '独山县', 4),
(1014, 116, '平塘县', 4),
(1015, 116, '罗甸县', 4),
(1016, 116, '长顺县', 4),
(1017, 116, '龙里县', 4),
(1018, 116, '惠水县', 4),
(1019, 116, '三都', 4),
(1020, 117, '兴义市', 4),
(1021, 117, '兴仁县', 4),
(1022, 117, '普安县', 4),
(1023, 117, '晴隆县', 4),
(1024, 117, '贞丰县', 4),
(1025, 117, '望谟县', 4),
(1026, 117, '册亨县', 4),
(1027, 117, '安龙县', 4),
(1028, 118, '铜仁市', 4),
(1029, 118, '江口县', 4),
(1030, 118, '石阡县', 4),
(1031, 118, '思南县', 4),
(1032, 118, '德江县', 4),
(1033, 118, '玉屏', 4),
(1034, 118, '印江', 4),
(1035, 118, '沿河', 4),
(1036, 118, '松桃', 4),
(1037, 118, '万山特区', 4),
(1038, 119, '红花岗区', 4),
(1039, 119, '务川县', 4),
(1040, 119, '道真县', 4),
(1041, 119, '汇川区', 4),
(1042, 119, '赤水市', 4),
(1043, 119, '仁怀市', 4),
(1044, 119, '遵义县', 4),
(1045, 119, '桐梓县', 4),
(1046, 119, '绥阳县', 4),
(1047, 119, '正安县', 4),
(1048, 119, '凤冈县', 4),
(1049, 119, '湄潭县', 4),
(1050, 119, '余庆县', 4),
(1051, 119, '习水县', 4),
(1052, 119, '道真', 4),
(1053, 119, '务川', 4),
(1054, 120, '秀英区', 4),
(1055, 120, '龙华区', 4),
(1056, 120, '琼山区', 4),
(1057, 120, '美兰区', 4),
(1058, 137, '市区', 4),
(1059, 137, '洋浦开发区', 4),
(1060, 137, '那大镇', 4),
(1061, 137, '王五镇', 4),
(1062, 137, '雅星镇', 4),
(1063, 137, '大成镇', 4),
(1064, 137, '中和镇', 4),
(1065, 137, '峨蔓镇', 4),
(1066, 137, '南丰镇', 4),
(1067, 137, '白马井镇', 4),
(1068, 137, '兰洋镇', 4),
(1069, 137, '和庆镇', 4),
(1070, 137, '海头镇', 4),
(1071, 137, '排浦镇', 4),
(1072, 137, '东成镇', 4),
(1073, 137, '光村镇', 4),
(1074, 137, '木棠镇', 4),
(1075, 137, '新州镇', 4),
(1076, 137, '三都镇', 4),
(1077, 137, '其他', 4),
(1078, 138, '长安区', 4),
(1079, 138, '桥东区', 4),
(1080, 138, '桥西区', 4),
(1081, 138, '新华区', 4),
(1082, 138, '裕华区', 4),
(1083, 138, '井陉矿区', 4),
(1084, 138, '高新区', 4),
(1085, 138, '辛集市', 4),
(1086, 138, '藁城市', 4),
(1087, 138, '晋州市', 4),
(1088, 138, '新乐市', 4),
(1089, 138, '鹿泉市', 4),
(1090, 138, '井陉县', 4),
(1091, 138, '正定县', 4),
(1092, 138, '栾城县', 4),
(1093, 138, '行唐县', 4),
(1094, 138, '灵寿县', 4),
(1095, 138, '高邑县', 4),
(1096, 138, '深泽县', 4),
(1097, 138, '赞皇县', 4),
(1098, 138, '无极县', 4),
(1099, 138, '平山县', 4),
(1100, 138, '元氏县', 4),
(1101, 138, '赵县', 4),
(1102, 139, '新市区', 4),
(1103, 139, '南市区', 4),
(1104, 139, '北市区', 4),
(1105, 139, '涿州市', 4),
(1106, 139, '定州市', 4),
(1107, 139, '安国市', 4),
(1108, 139, '高碑店市', 4),
(1109, 139, '满城县', 4),
(1110, 139, '清苑县', 4),
(1111, 139, '涞水县', 4),
(1112, 139, '阜平县', 4),
(1113, 139, '徐水县', 4),
(1114, 139, '定兴县', 4),
(1115, 139, '唐县', 4),
(1116, 139, '高阳县', 4),
(1117, 139, '容城县', 4),
(1118, 139, '涞源县', 4),
(1119, 139, '望都县', 4),
(1120, 139, '安新县', 4),
(1121, 139, '易县', 4),
(1122, 139, '曲阳县', 4),
(1123, 139, '蠡县', 4),
(1124, 139, '顺平县', 4),
(1125, 139, '博野县', 4),
(1126, 139, '雄县', 4),
(1127, 140, '运河区', 4),
(1128, 140, '新华区', 4),
(1129, 140, '泊头市', 4),
(1130, 140, '任丘市', 4),
(1131, 140, '黄骅市', 4),
(1132, 140, '河间市', 4),
(1133, 140, '沧县', 4),
(1134, 140, '青县', 4),
(1135, 140, '东光县', 4),
(1136, 140, '海兴县', 4),
(1137, 140, '盐山县', 4),
(1138, 140, '肃宁县', 4),
(1139, 140, '南皮县', 4),
(1140, 140, '吴桥县', 4),
(1141, 140, '献县', 4),
(1142, 140, '孟村', 4),
(1143, 141, '双桥区', 4),
(1144, 141, '双滦区', 4),
(1145, 141, '鹰手营子矿区', 4),
(1146, 141, '承德县', 4),
(1147, 141, '兴隆县', 4),
(1148, 141, '平泉县', 4),
(1149, 141, '滦平县', 4),
(1150, 141, '隆化县', 4),
(1151, 141, '丰宁', 4),
(1152, 141, '宽城', 4),
(1153, 141, '围场', 4),
(1154, 142, '从台区', 4),
(1155, 142, '复兴区', 4),
(1156, 142, '邯山区', 4),
(1157, 142, '峰峰矿区', 4),
(1158, 142, '武安市', 4),
(1159, 142, '邯郸县', 4),
(1160, 142, '临漳县', 4),
(1161, 142, '成安县', 4),
(1162, 142, '大名县', 4),
(1163, 142, '涉县', 4),
(1164, 142, '磁县', 4),
(1165, 142, '肥乡县', 4),
(1166, 142, '永年县', 4),
(1167, 142, '邱县', 4),
(1168, 142, '鸡泽县', 4),
(1169, 142, '广平县', 4),
(1170, 142, '馆陶县', 4),
(1171, 142, '魏县', 4),
(1172, 142, '曲周县', 4),
(1173, 143, '桃城区', 4),
(1174, 143, '冀州市', 4),
(1175, 143, '深州市', 4),
(1176, 143, '枣强县', 4),
(1177, 143, '武邑县', 4),
(1178, 143, '武强县', 4),
(1179, 143, '饶阳县', 4),
(1180, 143, '安平县', 4),
(1181, 143, '故城县', 4),
(1182, 143, '景县', 4),
(1183, 143, '阜城县', 4),
(1184, 144, '安次区', 4),
(1185, 144, '广阳区', 4),
(1186, 144, '霸州市', 4),
(1187, 144, '三河市', 4),
(1188, 144, '固安县', 4),
(1189, 144, '永清县', 4),
(1190, 144, '香河县', 4),
(1191, 144, '大城县', 4),
(1192, 144, '文安县', 4),
(1193, 144, '大厂', 4),
(1194, 145, '海港区', 4),
(1195, 145, '山海关区', 4),
(1196, 145, '北戴河区', 4),
(1197, 145, '昌黎县', 4),
(1198, 145, '抚宁县', 4),
(1199, 145, '卢龙县', 4),
(1200, 145, '青龙', 4),
(1201, 146, '路北区', 4),
(1202, 146, '路南区', 4),
(1203, 146, '古冶区', 4),
(1204, 146, '开平区', 4),
(1205, 146, '丰南区', 4),
(1206, 146, '丰润区', 4),
(1207, 146, '遵化市', 4),
(1208, 146, '迁安市', 4),
(1209, 146, '滦县', 4),
(1210, 146, '滦南县', 4),
(1211, 146, '乐亭县', 4),
(1212, 146, '迁西县', 4),
(1213, 146, '玉田县', 4),
(1214, 146, '唐海县', 4),
(1215, 147, '桥东区', 4),
(1216, 147, '桥西区', 4),
(1217, 147, '南宫市', 4),
(1218, 147, '沙河市', 4),
(1219, 147, '邢台县', 4),
(1220, 147, '临城县', 4),
(1221, 147, '内丘县', 4),
(1222, 147, '柏乡县', 4),
(1223, 147, '隆尧县', 4),
(1224, 147, '任县', 4),
(1225, 147, '南和县', 4),
(1226, 147, '宁晋县', 4),
(1227, 147, '巨鹿县', 4),
(1228, 147, '新河县', 4),
(1229, 147, '广宗县', 4),
(1230, 147, '平乡县', 4),
(1231, 147, '威县', 4),
(1232, 147, '清河县', 4),
(1233, 147, '临西县', 4),
(1234, 148, '桥西区', 4),
(1235, 148, '桥东区', 4),
(1236, 148, '宣化区', 4),
(1237, 148, '下花园区', 4),
(1238, 148, '宣化县', 4),
(1239, 148, '张北县', 4),
(1240, 148, '康保县', 4),
(1241, 148, '沽源县', 4),
(1242, 148, '尚义县', 4),
(1243, 148, '蔚县', 4),
(1244, 148, '阳原县', 4),
(1245, 148, '怀安县', 4),
(1246, 148, '万全县', 4),
(1247, 148, '怀来县', 4),
(1248, 148, '涿鹿县', 4),
(1249, 148, '赤城县', 4),
(1250, 148, '崇礼县', 4),
(1251, 149, '金水区', 4),
(1252, 149, '邙山区', 4),
(1253, 149, '二七区', 4),
(1254, 149, '管城区', 4),
(1255, 149, '中原区', 4),
(1256, 149, '上街区', 4),
(1257, 149, '惠济区', 4),
(1258, 149, '郑东新区', 4),
(1259, 149, '经济技术开发区', 4),
(1260, 149, '高新开发区', 4),
(1261, 149, '出口加工区', 4),
(1262, 149, '巩义市', 4),
(1263, 149, '荥阳市', 4),
(1264, 149, '新密市', 4),
(1265, 149, '新郑市', 4),
(1266, 149, '登封市', 4),
(1267, 149, '中牟县', 4),
(1268, 150, '西工区', 4),
(1269, 150, '老城区', 4),
(1270, 150, '涧西区', 4),
(1271, 150, '瀍河回族区', 4),
(1272, 150, '洛龙区', 4),
(1273, 150, '吉利区', 4),
(1274, 150, '偃师市', 4),
(1275, 150, '孟津县', 4),
(1276, 150, '新安县', 4),
(1277, 150, '栾川县', 4),
(1278, 150, '嵩县', 4),
(1279, 150, '汝阳县', 4),
(1280, 150, '宜阳县', 4),
(1281, 150, '洛宁县', 4),
(1282, 150, '伊川县', 4),
(1283, 151, '鼓楼区', 4),
(1284, 151, '龙亭区', 4),
(1285, 151, '顺河回族区', 4),
(1286, 151, '金明区', 4),
(1287, 151, '禹王台区', 4),
(1288, 151, '杞县', 4),
(1289, 151, '通许县', 4),
(1290, 151, '尉氏县', 4),
(1291, 151, '开封县', 4),
(1292, 151, '兰考县', 4),
(1293, 152, '北关区', 4),
(1294, 152, '文峰区', 4),
(1295, 152, '殷都区', 4),
(1296, 152, '龙安区', 4),
(1297, 152, '林州市', 4),
(1298, 152, '安阳县', 4),
(1299, 152, '汤阴县', 4),
(1300, 152, '滑县', 4),
(1301, 152, '内黄县', 4),
(1302, 153, '淇滨区', 4),
(1303, 153, '山城区', 4),
(1304, 153, '鹤山区', 4),
(1305, 153, '浚县', 4),
(1306, 153, '淇县', 4),
(1307, 154, '济源市', 4),
(1308, 155, '解放区', 4),
(1309, 155, '中站区', 4),
(1310, 155, '马村区', 4),
(1311, 155, '山阳区', 4),
(1312, 155, '沁阳市', 4),
(1313, 155, '孟州市', 4),
(1314, 155, '修武县', 4),
(1315, 155, '博爱县', 4),
(1316, 155, '武陟县', 4),
(1317, 155, '温县', 4),
(1318, 156, '卧龙区', 4),
(1319, 156, '宛城区', 4),
(1320, 156, '邓州市', 4),
(1321, 156, '南召县', 4),
(1322, 156, '方城县', 4),
(1323, 156, '西峡县', 4),
(1324, 156, '镇平县', 4),
(1325, 156, '内乡县', 4),
(1326, 156, '淅川县', 4),
(1327, 156, '社旗县', 4),
(1328, 156, '唐河县', 4),
(1329, 156, '新野县', 4),
(1330, 156, '桐柏县', 4),
(1331, 157, '新华区', 4),
(1332, 157, '卫东区', 4),
(1333, 157, '湛河区', 4),
(1334, 157, '石龙区', 4),
(1335, 157, '舞钢市', 4),
(1336, 157, '汝州市', 4),
(1337, 157, '宝丰县', 4),
(1338, 157, '叶县', 4),
(1339, 157, '鲁山县', 4),
(1340, 157, '郏县', 4),
(1341, 158, '湖滨区', 4),
(1342, 158, '义马市', 4),
(1343, 158, '灵宝市', 4),
(1344, 158, '渑池县', 4),
(1345, 158, '陕县', 4),
(1346, 158, '卢氏县', 4),
(1347, 159, '梁园区', 4),
(1348, 159, '睢阳区', 4),
(1349, 159, '永城市', 4),
(1350, 159, '民权县', 4),
(1351, 159, '睢县', 4),
(1352, 159, '宁陵县', 4),
(1353, 159, '虞城县', 4),
(1354, 159, '柘城县', 4),
(1355, 159, '夏邑县', 4),
(1356, 160, '卫滨区', 4),
(1357, 160, '红旗区', 4),
(1358, 160, '凤泉区', 4),
(1359, 160, '牧野区', 4),
(1360, 160, '卫辉市', 4),
(1361, 160, '辉县市', 4),
(1362, 160, '新乡县', 4),
(1363, 160, '获嘉县', 4),
(1364, 160, '原阳县', 4),
(1365, 160, '延津县', 4),
(1366, 160, '封丘县', 4),
(1367, 160, '长垣县', 4),
(1368, 161, '浉河区', 4),
(1369, 161, '平桥区', 4),
(1370, 161, '罗山县', 4),
(1371, 161, '光山县', 4),
(1372, 161, '新县', 4),
(1373, 161, '商城县', 4),
(1374, 161, '固始县', 4),
(1375, 161, '潢川县', 4),
(1376, 161, '淮滨县', 4),
(1377, 161, '息县', 4),
(1378, 162, '魏都区', 4),
(1379, 162, '禹州市', 4),
(1380, 162, '长葛市', 4),
(1381, 162, '许昌县', 4),
(1382, 162, '鄢陵县', 4),
(1383, 162, '襄城县', 4),
(1384, 163, '川汇区', 4),
(1385, 163, '项城市', 4),
(1386, 163, '扶沟县', 4),
(1387, 163, '西华县', 4),
(1388, 163, '商水县', 4),
(1389, 163, '沈丘县', 4),
(1390, 163, '郸城县', 4),
(1391, 163, '淮阳县', 4),
(1392, 163, '太康县', 4),
(1393, 163, '鹿邑县', 4),
(1394, 164, '驿城区', 4),
(1395, 164, '西平县', 4),
(1396, 164, '上蔡县', 4),
(1397, 164, '平舆县', 4),
(1398, 164, '正阳县', 4),
(1399, 164, '确山县', 4),
(1400, 164, '泌阳县', 4),
(1401, 164, '汝南县', 4),
(1402, 164, '遂平县', 4),
(1403, 164, '新蔡县', 4),
(1404, 165, '郾城区', 4),
(1405, 165, '源汇区', 4),
(1406, 165, '召陵区', 4),
(1407, 165, '舞阳县', 4),
(1408, 165, '临颍县', 4),
(1409, 166, '华龙区', 4),
(1410, 166, '清丰县', 4),
(1411, 166, '南乐县', 4),
(1412, 166, '范县', 4),
(1413, 166, '台前县', 4),
(1414, 166, '濮阳县', 4),
(1415, 167, '道里区', 4),
(1416, 167, '南岗区', 4),
(1417, 167, '动力区', 4),
(1418, 167, '平房区', 4),
(1419, 167, '香坊区', 4),
(1420, 167, '太平区', 4),
(1421, 167, '道外区', 4),
(1422, 167, '阿城区', 4),
(1423, 167, '呼兰区', 4),
(1424, 167, '松北区', 4),
(1425, 167, '尚志市', 4),
(1426, 167, '双城市', 4),
(1427, 167, '五常市', 4),
(1428, 167, '方正县', 4),
(1429, 167, '宾县', 4),
(1430, 167, '依兰县', 4),
(1431, 167, '巴彦县', 4),
(1432, 167, '通河县', 4),
(1433, 167, '木兰县', 4),
(1434, 167, '延寿县', 4),
(1435, 168, '萨尔图区', 4),
(1436, 168, '红岗区', 4),
(1437, 168, '龙凤区', 4),
(1438, 168, '让胡路区', 4),
(1439, 168, '大同区', 4),
(1440, 168, '肇州县', 4),
(1441, 168, '肇源县', 4),
(1442, 168, '林甸县', 4),
(1443, 168, '杜尔伯特', 4),
(1444, 169, '呼玛县', 4),
(1445, 169, '漠河县', 4),
(1446, 169, '塔河县', 4),
(1447, 170, '兴山区', 4),
(1448, 170, '工农区', 4),
(1449, 170, '南山区', 4),
(1450, 170, '兴安区', 4),
(1451, 170, '向阳区', 4),
(1452, 170, '东山区', 4),
(1453, 170, '萝北县', 4),
(1454, 170, '绥滨县', 4),
(1455, 171, '爱辉区', 4),
(1456, 171, '五大连池市', 4),
(1457, 171, '北安市', 4),
(1458, 171, '嫩江县', 4),
(1459, 171, '逊克县', 4),
(1460, 171, '孙吴县', 4),
(1461, 172, '鸡冠区', 4),
(1462, 172, '恒山区', 4),
(1463, 172, '城子河区', 4),
(1464, 172, '滴道区', 4),
(1465, 172, '梨树区', 4),
(1466, 172, '虎林市', 4),
(1467, 172, '密山市', 4),
(1468, 172, '鸡东县', 4),
(1469, 173, '前进区', 4),
(1470, 173, '郊区', 4),
(1471, 173, '向阳区', 4),
(1472, 173, '东风区', 4),
(1473, 173, '同江市', 4),
(1474, 173, '富锦市', 4),
(1475, 173, '桦南县', 4),
(1476, 173, '桦川县', 4),
(1477, 173, '汤原县', 4),
(1478, 173, '抚远县', 4),
(1479, 174, '爱民区', 4),
(1480, 174, '东安区', 4),
(1481, 174, '阳明区', 4),
(1482, 174, '西安区', 4),
(1483, 174, '绥芬河市', 4),
(1484, 174, '海林市', 4),
(1485, 174, '宁安市', 4),
(1486, 174, '穆棱市', 4),
(1487, 174, '东宁县', 4),
(1488, 174, '林口县', 4),
(1489, 175, '桃山区', 4),
(1490, 175, '新兴区', 4),
(1491, 175, '茄子河区', 4),
(1492, 175, '勃利县', 4),
(1493, 176, '龙沙区', 4),
(1494, 176, '昂昂溪区', 4),
(1495, 176, '铁峰区', 4),
(1496, 176, '建华区', 4),
(1497, 176, '富拉尔基区', 4),
(1498, 176, '碾子山区', 4),
(1499, 176, '梅里斯达斡尔区', 4),
(1500, 176, '讷河市', 4),
(1501, 176, '龙江县', 4),
(1502, 176, '依安县', 4),
(1503, 176, '泰来县', 4),
(1504, 176, '甘南县', 4),
(1505, 176, '富裕县', 4),
(1506, 176, '克山县', 4),
(1507, 176, '克东县', 4),
(1508, 176, '拜泉县', 4),
(1509, 177, '尖山区', 4),
(1510, 177, '岭东区', 4),
(1511, 177, '四方台区', 4),
(1512, 177, '宝山区', 4),
(1513, 177, '集贤县', 4),
(1514, 177, '友谊县', 4),
(1515, 177, '宝清县', 4),
(1516, 177, '饶河县', 4),
(1517, 178, '北林区', 4),
(1518, 178, '安达市', 4),
(1519, 178, '肇东市', 4),
(1520, 178, '海伦市', 4),
(1521, 178, '望奎县', 4),
(1522, 178, '兰西县', 4),
(1523, 178, '青冈县', 4),
(1524, 178, '庆安县', 4),
(1525, 178, '明水县', 4),
(1526, 178, '绥棱县', 4),
(1527, 179, '伊春区', 4),
(1528, 179, '带岭区', 4),
(1529, 179, '南岔区', 4),
(1530, 179, '金山屯区', 4),
(1531, 179, '西林区', 4),
(1532, 179, '美溪区', 4),
(1533, 179, '乌马河区', 4),
(1534, 179, '翠峦区', 4),
(1535, 179, '友好区', 4),
(1536, 179, '上甘岭区', 4),
(1537, 179, '五营区', 4),
(1538, 179, '红星区', 4),
(1539, 179, '新青区', 4),
(1540, 179, '汤旺河区', 4),
(1541, 179, '乌伊岭区', 4),
(1542, 179, '铁力市', 4),
(1543, 179, '嘉荫县', 4),
(1544, 180, '江岸区', 4),
(1545, 180, '武昌区', 4),
(1546, 180, '江汉区', 4),
(1547, 180, '硚口区', 4),
(1548, 180, '汉阳区', 4),
(1549, 180, '青山区', 4),
(1550, 180, '洪山区', 4),
(1551, 180, '东西湖区', 4),
(1552, 180, '汉南区', 4),
(1553, 180, '蔡甸区', 4),
(1554, 180, '江夏区', 4),
(1555, 180, '黄陂区', 4),
(1556, 180, '新洲区', 4),
(1557, 180, '经济开发区', 4),
(1558, 181, '仙桃市', 4),
(1559, 182, '鄂城区', 4),
(1560, 182, '华容区', 4),
(1561, 182, '梁子湖区', 4),
(1562, 183, '黄州区', 4),
(1563, 183, '麻城市', 4),
(1564, 183, '武穴市', 4),
(1565, 183, '团风县', 4),
(1566, 183, '红安县', 4),
(1567, 183, '罗田县', 4),
(1568, 183, '英山县', 4),
(1569, 183, '浠水县', 4),
(1570, 183, '蕲春县', 4),
(1571, 183, '黄梅县', 4),
(1572, 184, '黄石港区', 4),
(1573, 184, '西塞山区', 4),
(1574, 184, '下陆区', 4),
(1575, 184, '铁山区', 4),
(1576, 184, '大冶市', 4),
(1577, 184, '阳新县', 4),
(1578, 185, '东宝区', 4),
(1579, 185, '掇刀区', 4),
(1580, 185, '钟祥市', 4),
(1581, 185, '京山县', 4),
(1582, 185, '沙洋县', 4),
(1583, 186, '沙市区', 4),
(1584, 186, '荆州区', 4),
(1585, 186, '石首市', 4),
(1586, 186, '洪湖市', 4),
(1587, 186, '松滋市', 4),
(1588, 186, '公安县', 4),
(1589, 186, '监利县', 4),
(1590, 186, '江陵县', 4),
(1591, 187, '潜江市', 4),
(1592, 188, '神农架林区', 4),
(1593, 189, '张湾区', 4),
(1594, 189, '茅箭区', 4),
(1595, 189, '丹江口市', 4),
(1596, 189, '郧县', 4),
(1597, 189, '郧西县', 4),
(1598, 189, '竹山县', 4),
(1599, 189, '竹溪县', 4),
(1600, 189, '房县', 4),
(1601, 190, '曾都区', 4),
(1602, 190, '广水市', 4),
(1603, 191, '天门市', 4),
(1604, 192, '咸安区', 4),
(1605, 192, '赤壁市', 4),
(1606, 192, '嘉鱼县', 4),
(1607, 192, '通城县', 4),
(1608, 192, '崇阳县', 4),
(1609, 192, '通山县', 4),
(1610, 193, '襄城区', 4),
(1611, 193, '樊城区', 4),
(1612, 193, '襄阳区', 4),
(1613, 193, '老河口市', 4),
(1614, 193, '枣阳市', 4),
(1615, 193, '宜城市', 4),
(1616, 193, '南漳县', 4),
(1617, 193, '谷城县', 4),
(1618, 193, '保康县', 4),
(1619, 194, '孝南区', 4),
(1620, 194, '应城市', 4),
(1621, 194, '安陆市', 4),
(1622, 194, '汉川市', 4),
(1623, 194, '孝昌县', 4),
(1624, 194, '大悟县', 4),
(1625, 194, '云梦县', 4),
(1626, 195, '长阳', 4),
(1627, 195, '五峰', 4),
(1628, 195, '西陵区', 4),
(1629, 195, '伍家岗区', 4),
(1630, 195, '点军区', 4),
(1631, 195, '猇亭区', 4),
(1632, 195, '夷陵区', 4),
(1633, 195, '宜都市', 4),
(1634, 195, '当阳市', 4),
(1635, 195, '枝江市', 4),
(1636, 195, '远安县', 4),
(1637, 195, '兴山县', 4),
(1638, 195, '秭归县', 4),
(1639, 196, '恩施市', 4),
(1640, 196, '利川市', 4),
(1641, 196, '建始县', 4),
(1642, 196, '巴东县', 4),
(1643, 196, '宣恩县', 4),
(1644, 196, '咸丰县', 4),
(1645, 196, '来凤县', 4),
(1646, 196, '鹤峰县', 4),
(1647, 197, '岳麓区', 4),
(1648, 197, '芙蓉区', 4),
(1649, 197, '天心区', 4),
(1650, 197, '开福区', 4),
(1651, 197, '雨花区', 4),
(1652, 197, '开发区', 4),
(1653, 197, '浏阳市', 4),
(1654, 197, '长沙县', 4),
(1655, 197, '望城县', 4),
(1656, 197, '宁乡县', 4),
(1657, 198, '永定区', 4),
(1658, 198, '武陵源区', 4),
(1659, 198, '慈利县', 4),
(1660, 198, '桑植县', 4),
(1661, 199, '武陵区', 4),
(1662, 199, '鼎城区', 4),
(1663, 199, '津市市', 4),
(1664, 199, '安乡县', 4),
(1665, 199, '汉寿县', 4),
(1666, 199, '澧县', 4),
(1667, 199, '临澧县', 4),
(1668, 199, '桃源县', 4),
(1669, 199, '石门县', 4),
(1670, 200, '北湖区', 4),
(1671, 200, '苏仙区', 4),
(1672, 200, '资兴市', 4),
(1673, 200, '桂阳县', 4),
(1674, 200, '宜章县', 4),
(1675, 200, '永兴县', 4),
(1676, 200, '嘉禾县', 4),
(1677, 200, '临武县', 4),
(1678, 200, '汝城县', 4),
(1679, 200, '桂东县', 4),
(1680, 200, '安仁县', 4),
(1681, 201, '雁峰区', 4),
(1682, 201, '珠晖区', 4),
(1683, 201, '石鼓区', 4),
(1684, 201, '蒸湘区', 4),
(1685, 201, '南岳区', 4),
(1686, 201, '耒阳市', 4),
(1687, 201, '常宁市', 4),
(1688, 201, '衡阳县', 4),
(1689, 201, '衡南县', 4),
(1690, 201, '衡山县', 4),
(1691, 201, '衡东县', 4),
(1692, 201, '祁东县', 4),
(1693, 202, '鹤城区', 4),
(1694, 202, '靖州', 4),
(1695, 202, '麻阳', 4),
(1696, 202, '通道', 4),
(1697, 202, '新晃', 4),
(1698, 202, '芷江', 4),
(1699, 202, '沅陵县', 4),
(1700, 202, '辰溪县', 4),
(1701, 202, '溆浦县', 4),
(1702, 202, '中方县', 4),
(1703, 202, '会同县', 4),
(1704, 202, '洪江市', 4),
(1705, 203, '娄星区', 4),
(1706, 203, '冷水江市', 4),
(1707, 203, '涟源市', 4),
(1708, 203, '双峰县', 4),
(1709, 203, '新化县', 4),
(1710, 204, '城步', 4),
(1711, 204, '双清区', 4),
(1712, 204, '大祥区', 4),
(1713, 204, '北塔区', 4),
(1714, 204, '武冈市', 4),
(1715, 204, '邵东县', 4),
(1716, 204, '新邵县', 4),
(1717, 204, '邵阳县', 4),
(1718, 204, '隆回县', 4),
(1719, 204, '洞口县', 4),
(1720, 204, '绥宁县', 4),
(1721, 204, '新宁县', 4),
(1722, 205, '岳塘区', 4),
(1723, 205, '雨湖区', 4),
(1724, 205, '湘乡市', 4),
(1725, 205, '韶山市', 4),
(1726, 205, '湘潭县', 4),
(1727, 206, '吉首市', 4),
(1728, 206, '泸溪县', 4),
(1729, 206, '凤凰县', 4),
(1730, 206, '花垣县', 4),
(1731, 206, '保靖县', 4),
(1732, 206, '古丈县', 4),
(1733, 206, '永顺县', 4),
(1734, 206, '龙山县', 4),
(1735, 207, '赫山区', 4),
(1736, 207, '资阳区', 4),
(1737, 207, '沅江市', 4),
(1738, 207, '南县', 4),
(1739, 207, '桃江县', 4),
(1740, 207, '安化县', 4),
(1741, 208, '江华', 4),
(1742, 208, '冷水滩区', 4),
(1743, 208, '零陵区', 4),
(1744, 208, '祁阳县', 4),
(1745, 208, '东安县', 4),
(1746, 208, '双牌县', 4),
(1747, 208, '道县', 4),
(1748, 208, '江永县', 4),
(1749, 208, '宁远县', 4),
(1750, 208, '蓝山县', 4),
(1751, 208, '新田县', 4),
(1752, 209, '岳阳楼区', 4),
(1753, 209, '君山区', 4),
(1754, 209, '云溪区', 4),
(1755, 209, '汨罗市', 4),
(1756, 209, '临湘市', 4),
(1757, 209, '岳阳县', 4),
(1758, 209, '华容县', 4),
(1759, 209, '湘阴县', 4),
(1760, 209, '平江县', 4),
(1761, 210, '天元区', 4),
(1762, 210, '荷塘区', 4),
(1763, 210, '芦淞区', 4),
(1764, 210, '石峰区', 4),
(1765, 210, '醴陵市', 4),
(1766, 210, '株洲县', 4),
(1767, 210, '攸县', 4),
(1768, 210, '茶陵县', 4),
(1769, 210, '炎陵县', 4),
(1770, 211, '朝阳区', 4),
(1771, 211, '宽城区', 4),
(1772, 211, '二道区', 4),
(1773, 211, '南关区', 4),
(1774, 211, '绿园区', 4),
(1775, 211, '双阳区', 4),
(1776, 211, '净月潭开发区', 4),
(1777, 211, '高新技术开发区', 4),
(1778, 211, '经济技术开发区', 4),
(1779, 211, '汽车产业开发区', 4),
(1780, 211, '德惠市', 4),
(1781, 211, '九台市', 4),
(1782, 211, '榆树市', 4),
(1783, 211, '农安县', 4),
(1784, 212, '船营区', 4),
(1785, 212, '昌邑区', 4),
(1786, 212, '龙潭区', 4),
(1787, 212, '丰满区', 4),
(1788, 212, '蛟河市', 4),
(1789, 212, '桦甸市', 4),
(1790, 212, '舒兰市', 4),
(1791, 212, '磐石市', 4),
(1792, 212, '永吉县', 4),
(1793, 213, '洮北区', 4),
(1794, 213, '洮南市', 4),
(1795, 213, '大安市', 4),
(1796, 213, '镇赉县', 4),
(1797, 213, '通榆县', 4),
(1798, 214, '江源区', 4),
(1799, 214, '八道江区', 4),
(1800, 214, '长白', 4),
(1801, 214, '临江市', 4),
(1802, 214, '抚松县', 4),
(1803, 214, '靖宇县', 4),
(1804, 215, '龙山区', 4),
(1805, 215, '西安区', 4),
(1806, 215, '东丰县', 4),
(1807, 215, '东辽县', 4),
(1808, 216, '铁西区', 4),
(1809, 216, '铁东区', 4),
(1810, 216, '伊通', 4),
(1811, 216, '公主岭市', 4),
(1812, 216, '双辽市', 4),
(1813, 216, '梨树县', 4),
(1814, 217, '前郭尔罗斯', 4),
(1815, 217, '宁江区', 4),
(1816, 217, '长岭县', 4),
(1817, 217, '乾安县', 4),
(1818, 217, '扶余县', 4),
(1819, 218, '东昌区', 4),
(1820, 218, '二道江区', 4),
(1821, 218, '梅河口市', 4),
(1822, 218, '集安市', 4),
(1823, 218, '通化县', 4),
(1824, 218, '辉南县', 4),
(1825, 218, '柳河县', 4),
(1826, 219, '延吉市', 4),
(1827, 219, '图们市', 4),
(1828, 219, '敦化市', 4),
(1829, 219, '珲春市', 4),
(1830, 219, '龙井市', 4),
(1831, 219, '和龙市', 4),
(1832, 219, '安图县', 4),
(1833, 219, '汪清县', 4),
(1834, 220, '玄武区', 4),
(1835, 220, '鼓楼区', 4),
(1836, 220, '白下区', 4),
(1837, 220, '建邺区', 4),
(1838, 220, '秦淮区', 4),
(1839, 220, '雨花台区', 4),
(1840, 220, '下关区', 4),
(1841, 220, '栖霞区', 4),
(1842, 220, '浦口区', 4),
(1843, 220, '江宁区', 4),
(1844, 220, '六合区', 4),
(1845, 220, '溧水县', 4),
(1846, 220, '高淳县', 4),
(1847, 221, '沧浪区', 4),
(1848, 221, '金阊区', 4),
(1849, 221, '平江区', 4),
(1850, 221, '虎丘区', 4),
(1851, 221, '吴中区', 4),
(1852, 221, '相城区', 4),
(1853, 221, '园区', 4),
(1854, 221, '新区', 4),
(1855, 221, '常熟市', 4),
(1856, 221, '张家港市', 4),
(1857, 221, '玉山镇', 4),
(1858, 221, '巴城镇', 4),
(1859, 221, '周市镇', 4),
(1860, 221, '陆家镇', 4),
(1861, 221, '花桥镇', 4),
(1862, 221, '淀山湖镇', 4),
(1863, 221, '张浦镇', 4),
(1864, 221, '周庄镇', 4),
(1865, 221, '千灯镇', 4),
(1866, 221, '锦溪镇', 4),
(1867, 221, '开发区', 4),
(1868, 221, '吴江市', 4),
(1869, 221, '太仓市', 4),
(1870, 222, '崇安区', 4),
(1871, 222, '北塘区', 4),
(1872, 222, '南长区', 4),
(1873, 222, '锡山区', 4),
(1874, 222, '惠山区', 4),
(1875, 222, '滨湖区', 4),
(1876, 222, '新区', 4),
(1877, 222, '江阴市', 4),
(1878, 222, '宜兴市', 4),
(1879, 223, '天宁区', 4),
(1880, 223, '钟楼区', 4),
(1881, 223, '戚墅堰区', 4),
(1882, 223, '郊区', 4),
(1883, 223, '新北区', 4),
(1884, 223, '武进区', 4),
(1885, 223, '溧阳市', 4),
(1886, 223, '金坛市', 4),
(1887, 224, '清河区', 4),
(1888, 224, '清浦区', 4),
(1889, 224, '楚州区', 4),
(1890, 224, '淮阴区', 4),
(1891, 224, '涟水县', 4),
(1892, 224, '洪泽县', 4),
(1893, 224, '盱眙县', 4),
(1894, 224, '金湖县', 4),
(1895, 225, '新浦区', 4),
(1896, 225, '连云区', 4),
(1897, 225, '海州区', 4),
(1898, 225, '赣榆县', 4),
(1899, 225, '东海县', 4),
(1900, 225, '灌云县', 4),
(1901, 225, '灌南县', 4),
(1902, 226, '崇川区', 4),
(1903, 226, '港闸区', 4),
(1904, 226, '经济开发区', 4),
(1905, 226, '启东市', 4),
(1906, 226, '如皋市', 4),
(1907, 226, '通州市', 4),
(1908, 226, '海门市', 4),
(1909, 226, '海安县', 4),
(1910, 226, '如东县', 4),
(1911, 227, '宿城区', 4),
(1912, 227, '宿豫区', 4),
(1913, 227, '宿豫县', 4),
(1914, 227, '沭阳县', 4),
(1915, 227, '泗阳县', 4),
(1916, 227, '泗洪县', 4),
(1917, 228, '海陵区', 4),
(1918, 228, '高港区', 4),
(1919, 228, '兴化市', 4),
(1920, 228, '靖江市', 4),
(1921, 228, '泰兴市', 4),
(1922, 228, '姜堰市', 4),
(1923, 229, '云龙区', 4),
(1924, 229, '鼓楼区', 4),
(1925, 229, '九里区', 4),
(1926, 229, '贾汪区', 4),
(1927, 229, '泉山区', 4),
(1928, 229, '新沂市', 4),
(1929, 229, '邳州市', 4),
(1930, 229, '丰县', 4),
(1931, 229, '沛县', 4),
(1932, 229, '铜山县', 4),
(1933, 229, '睢宁县', 4),
(1934, 230, '城区', 4),
(1935, 230, '亭湖区', 4),
(1936, 230, '盐都区', 4),
(1937, 230, '盐都县', 4),
(1938, 230, '东台市', 4),
(1939, 230, '大丰市', 4),
(1940, 230, '响水县', 4),
(1941, 230, '滨海县', 4),
(1942, 230, '阜宁县', 4),
(1943, 230, '射阳县', 4),
(1944, 230, '建湖县', 4),
(1945, 231, '广陵区', 4),
(1946, 231, '维扬区', 4),
(1947, 231, '邗江区', 4),
(1948, 231, '仪征市', 4),
(1949, 231, '高邮市', 4),
(1950, 231, '江都市', 4),
(1951, 231, '宝应县', 4),
(1952, 232, '京口区', 4),
(1953, 232, '润州区', 4),
(1954, 232, '丹徒区', 4),
(1955, 232, '丹阳市', 4),
(1956, 232, '扬中市', 4),
(1957, 232, '句容市', 4),
(1958, 233, '东湖区', 4),
(1959, 233, '西湖区', 4),
(1960, 233, '青云谱区', 4),
(1961, 233, '湾里区', 4),
(1962, 233, '青山湖区', 4),
(1963, 233, '红谷滩新区', 4);
INSERT INTO `fanwe_delivery_region` (`id`, `pid`, `name`, `region_level`) VALUES
(1964, 233, '昌北区', 4),
(1965, 233, '高新区', 4),
(1966, 233, '南昌县', 4),
(1967, 233, '新建县', 4),
(1968, 233, '安义县', 4),
(1969, 233, '进贤县', 4),
(1970, 234, '临川区', 4),
(1971, 234, '南城县', 4),
(1972, 234, '黎川县', 4),
(1973, 234, '南丰县', 4),
(1974, 234, '崇仁县', 4),
(1975, 234, '乐安县', 4),
(1976, 234, '宜黄县', 4),
(1977, 234, '金溪县', 4),
(1978, 234, '资溪县', 4),
(1979, 234, '东乡县', 4),
(1980, 234, '广昌县', 4),
(1981, 235, '章贡区', 4),
(1982, 235, '于都县', 4),
(1983, 235, '瑞金市', 4),
(1984, 235, '南康市', 4),
(1985, 235, '赣县', 4),
(1986, 235, '信丰县', 4),
(1987, 235, '大余县', 4),
(1988, 235, '上犹县', 4),
(1989, 235, '崇义县', 4),
(1990, 235, '安远县', 4),
(1991, 235, '龙南县', 4),
(1992, 235, '定南县', 4),
(1993, 235, '全南县', 4),
(1994, 235, '宁都县', 4),
(1995, 235, '兴国县', 4),
(1996, 235, '会昌县', 4),
(1997, 235, '寻乌县', 4),
(1998, 235, '石城县', 4),
(1999, 236, '安福县', 4),
(2000, 236, '吉州区', 4),
(2001, 236, '青原区', 4),
(2002, 236, '井冈山市', 4),
(2003, 236, '吉安县', 4),
(2004, 236, '吉水县', 4),
(2005, 236, '峡江县', 4),
(2006, 236, '新干县', 4),
(2007, 236, '永丰县', 4),
(2008, 236, '泰和县', 4),
(2009, 236, '遂川县', 4),
(2010, 236, '万安县', 4),
(2011, 236, '永新县', 4),
(2012, 237, '珠山区', 4),
(2013, 237, '昌江区', 4),
(2014, 237, '乐平市', 4),
(2015, 237, '浮梁县', 4),
(2016, 238, '浔阳区', 4),
(2017, 238, '庐山区', 4),
(2018, 238, '瑞昌市', 4),
(2019, 238, '九江县', 4),
(2020, 238, '武宁县', 4),
(2021, 238, '修水县', 4),
(2022, 238, '永修县', 4),
(2023, 238, '德安县', 4),
(2024, 238, '星子县', 4),
(2025, 238, '都昌县', 4),
(2026, 238, '湖口县', 4),
(2027, 238, '彭泽县', 4),
(2028, 239, '安源区', 4),
(2029, 239, '湘东区', 4),
(2030, 239, '莲花县', 4),
(2031, 239, '芦溪县', 4),
(2032, 239, '上栗县', 4),
(2033, 240, '信州区', 4),
(2034, 240, '德兴市', 4),
(2035, 240, '上饶县', 4),
(2036, 240, '广丰县', 4),
(2037, 240, '玉山县', 4),
(2038, 240, '铅山县', 4),
(2039, 240, '横峰县', 4),
(2040, 240, '弋阳县', 4),
(2041, 240, '余干县', 4),
(2042, 240, '波阳县', 4),
(2043, 240, '万年县', 4),
(2044, 240, '婺源县', 4),
(2045, 241, '渝水区', 4),
(2046, 241, '分宜县', 4),
(2047, 242, '袁州区', 4),
(2048, 242, '丰城市', 4),
(2049, 242, '樟树市', 4),
(2050, 242, '高安市', 4),
(2051, 242, '奉新县', 4),
(2052, 242, '万载县', 4),
(2053, 242, '上高县', 4),
(2054, 242, '宜丰县', 4),
(2055, 242, '靖安县', 4),
(2056, 242, '铜鼓县', 4),
(2057, 243, '月湖区', 4),
(2058, 243, '贵溪市', 4),
(2059, 243, '余江县', 4),
(2060, 244, '沈河区', 4),
(2061, 244, '皇姑区', 4),
(2062, 244, '和平区', 4),
(2063, 244, '大东区', 4),
(2064, 244, '铁西区', 4),
(2065, 244, '苏家屯区', 4),
(2066, 244, '东陵区', 4),
(2067, 244, '沈北新区', 4),
(2068, 244, '于洪区', 4),
(2069, 244, '浑南新区', 4),
(2070, 244, '新民市', 4),
(2071, 244, '辽中县', 4),
(2072, 244, '康平县', 4),
(2073, 244, '法库县', 4),
(2074, 245, '西岗区', 4),
(2075, 245, '中山区', 4),
(2076, 245, '沙河口区', 4),
(2077, 245, '甘井子区', 4),
(2078, 245, '旅顺口区', 4),
(2079, 245, '金州区', 4),
(2080, 245, '开发区', 4),
(2081, 245, '瓦房店市', 4),
(2082, 245, '普兰店市', 4),
(2083, 245, '庄河市', 4),
(2084, 245, '长海县', 4),
(2085, 246, '铁东区', 4),
(2086, 246, '铁西区', 4),
(2087, 246, '立山区', 4),
(2088, 246, '千山区', 4),
(2089, 246, '岫岩', 4),
(2090, 246, '海城市', 4),
(2091, 246, '台安县', 4),
(2092, 247, '本溪', 4),
(2093, 247, '平山区', 4),
(2094, 247, '明山区', 4),
(2095, 247, '溪湖区', 4),
(2096, 247, '南芬区', 4),
(2097, 247, '桓仁', 4),
(2098, 248, '双塔区', 4),
(2099, 248, '龙城区', 4),
(2100, 248, '喀喇沁左翼蒙古族自治', 4),
(2101, 248, '北票市', 4),
(2102, 248, '凌源市', 4),
(2103, 248, '朝阳县', 4),
(2104, 248, '建平县', 4),
(2105, 249, '振兴区', 4),
(2106, 249, '元宝区', 4),
(2107, 249, '振安区', 4),
(2108, 249, '宽甸', 4),
(2109, 249, '东港市', 4),
(2110, 249, '凤城市', 4),
(2111, 250, '顺城区', 4),
(2112, 250, '新抚区', 4),
(2113, 250, '东洲区', 4),
(2114, 250, '望花区', 4),
(2115, 250, '清原', 4),
(2116, 250, '新宾', 4),
(2117, 250, '抚顺县', 4),
(2118, 251, '阜新', 4),
(2119, 251, '海州区', 4),
(2120, 251, '新邱区', 4),
(2121, 251, '太平区', 4),
(2122, 251, '清河门区', 4),
(2123, 251, '细河区', 4),
(2124, 251, '彰武县', 4),
(2125, 252, '龙港区', 4),
(2126, 252, '南票区', 4),
(2127, 252, '连山区', 4),
(2128, 252, '兴城市', 4),
(2129, 252, '绥中县', 4),
(2130, 252, '建昌县', 4),
(2131, 253, '太和区', 4),
(2132, 253, '古塔区', 4),
(2133, 253, '凌河区', 4),
(2134, 253, '凌海市', 4),
(2135, 253, '北镇市', 4),
(2136, 253, '黑山县', 4),
(2137, 253, '义县', 4),
(2138, 254, '白塔区', 4),
(2139, 254, '文圣区', 4),
(2140, 254, '宏伟区', 4),
(2141, 254, '太子河区', 4),
(2142, 254, '弓长岭区', 4),
(2143, 254, '灯塔市', 4),
(2144, 254, '辽阳县', 4),
(2145, 255, '双台子区', 4),
(2146, 255, '兴隆台区', 4),
(2147, 255, '大洼县', 4),
(2148, 255, '盘山县', 4),
(2149, 256, '银州区', 4),
(2150, 256, '清河区', 4),
(2151, 256, '调兵山市', 4),
(2152, 256, '开原市', 4),
(2153, 256, '铁岭县', 4),
(2154, 256, '西丰县', 4),
(2155, 256, '昌图县', 4),
(2156, 257, '站前区', 4),
(2157, 257, '西市区', 4),
(2158, 257, '鲅鱼圈区', 4),
(2159, 257, '老边区', 4),
(2160, 257, '盖州市', 4),
(2161, 257, '大石桥市', 4),
(2162, 258, '回民区', 4),
(2163, 258, '玉泉区', 4),
(2164, 258, '新城区', 4),
(2165, 258, '赛罕区', 4),
(2166, 258, '清水河县', 4),
(2167, 258, '土默特左旗', 4),
(2168, 258, '托克托县', 4),
(2169, 258, '和林格尔县', 4),
(2170, 258, '武川县', 4),
(2171, 259, '阿拉善左旗', 4),
(2172, 259, '阿拉善右旗', 4),
(2173, 259, '额济纳旗', 4),
(2174, 260, '临河区', 4),
(2175, 260, '五原县', 4),
(2176, 260, '磴口县', 4),
(2177, 260, '乌拉特前旗', 4),
(2178, 260, '乌拉特中旗', 4),
(2179, 260, '乌拉特后旗', 4),
(2180, 260, '杭锦后旗', 4),
(2181, 261, '昆都仑区', 4),
(2182, 261, '青山区', 4),
(2183, 261, '东河区', 4),
(2184, 261, '九原区', 4),
(2185, 261, '石拐区', 4),
(2186, 261, '白云矿区', 4),
(2187, 261, '土默特右旗', 4),
(2188, 261, '固阳县', 4),
(2189, 261, '达尔罕茂明安联合旗', 4),
(2190, 262, '红山区', 4),
(2191, 262, '元宝山区', 4),
(2192, 262, '松山区', 4),
(2193, 262, '阿鲁科尔沁旗', 4),
(2194, 262, '巴林左旗', 4),
(2195, 262, '巴林右旗', 4),
(2196, 262, '林西县', 4),
(2197, 262, '克什克腾旗', 4),
(2198, 262, '翁牛特旗', 4),
(2199, 262, '喀喇沁旗', 4),
(2200, 262, '宁城县', 4),
(2201, 262, '敖汉旗', 4),
(2202, 263, '东胜区', 4),
(2203, 263, '达拉特旗', 4),
(2204, 263, '准格尔旗', 4),
(2205, 263, '鄂托克前旗', 4),
(2206, 263, '鄂托克旗', 4),
(2207, 263, '杭锦旗', 4),
(2208, 263, '乌审旗', 4),
(2209, 263, '伊金霍洛旗', 4),
(2210, 264, '海拉尔区', 4),
(2211, 264, '莫力达瓦', 4),
(2212, 264, '满洲里市', 4),
(2213, 264, '牙克石市', 4),
(2214, 264, '扎兰屯市', 4),
(2215, 264, '额尔古纳市', 4),
(2216, 264, '根河市', 4),
(2217, 264, '阿荣旗', 4),
(2218, 264, '鄂伦春自治旗', 4),
(2219, 264, '鄂温克族自治旗', 4),
(2220, 264, '陈巴尔虎旗', 4),
(2221, 264, '新巴尔虎左旗', 4),
(2222, 264, '新巴尔虎右旗', 4),
(2223, 265, '科尔沁区', 4),
(2224, 265, '霍林郭勒市', 4),
(2225, 265, '科尔沁左翼中旗', 4),
(2226, 265, '科尔沁左翼后旗', 4),
(2227, 265, '开鲁县', 4),
(2228, 265, '库伦旗', 4),
(2229, 265, '奈曼旗', 4),
(2230, 265, '扎鲁特旗', 4),
(2231, 266, '海勃湾区', 4),
(2232, 266, '乌达区', 4),
(2233, 266, '海南区', 4),
(2234, 267, '化德县', 4),
(2235, 267, '集宁区', 4),
(2236, 267, '丰镇市', 4),
(2237, 267, '卓资县', 4),
(2238, 267, '商都县', 4),
(2239, 267, '兴和县', 4),
(2240, 267, '凉城县', 4),
(2241, 267, '察哈尔右翼前旗', 4),
(2242, 267, '察哈尔右翼中旗', 4),
(2243, 267, '察哈尔右翼后旗', 4),
(2244, 267, '四子王旗', 4),
(2245, 268, '二连浩特市', 4),
(2246, 268, '锡林浩特市', 4),
(2247, 268, '阿巴嘎旗', 4),
(2248, 268, '苏尼特左旗', 4),
(2249, 268, '苏尼特右旗', 4),
(2250, 268, '东乌珠穆沁旗', 4),
(2251, 268, '西乌珠穆沁旗', 4),
(2252, 268, '太仆寺旗', 4),
(2253, 268, '镶黄旗', 4),
(2254, 268, '正镶白旗', 4),
(2255, 268, '正蓝旗', 4),
(2256, 268, '多伦县', 4),
(2257, 269, '乌兰浩特市', 4),
(2258, 269, '阿尔山市', 4),
(2259, 269, '科尔沁右翼前旗', 4),
(2260, 269, '科尔沁右翼中旗', 4),
(2261, 269, '扎赉特旗', 4),
(2262, 269, '突泉县', 4),
(2263, 270, '西夏区', 4),
(2264, 270, '金凤区', 4),
(2265, 270, '兴庆区', 4),
(2266, 270, '灵武市', 4),
(2267, 270, '永宁县', 4),
(2268, 270, '贺兰县', 4),
(2269, 271, '原州区', 4),
(2270, 271, '海原县', 4),
(2271, 271, '西吉县', 4),
(2272, 271, '隆德县', 4),
(2273, 271, '泾源县', 4),
(2274, 271, '彭阳县', 4),
(2275, 272, '惠农县', 4),
(2276, 272, '大武口区', 4),
(2277, 272, '惠农区', 4),
(2278, 272, '陶乐县', 4),
(2279, 272, '平罗县', 4),
(2280, 273, '利通区', 4),
(2281, 273, '中卫县', 4),
(2282, 273, '青铜峡市', 4),
(2283, 273, '中宁县', 4),
(2284, 273, '盐池县', 4),
(2285, 273, '同心县', 4),
(2286, 274, '沙坡头区', 4),
(2287, 274, '海原县', 4),
(2288, 274, '中宁县', 4),
(2289, 275, '城中区', 4),
(2290, 275, '城东区', 4),
(2291, 275, '城西区', 4),
(2292, 275, '城北区', 4),
(2293, 275, '湟中县', 4),
(2294, 275, '湟源县', 4),
(2295, 275, '大通', 4),
(2296, 276, '玛沁县', 4),
(2297, 276, '班玛县', 4),
(2298, 276, '甘德县', 4),
(2299, 276, '达日县', 4),
(2300, 276, '久治县', 4),
(2301, 276, '玛多县', 4),
(2302, 277, '海晏县', 4),
(2303, 277, '祁连县', 4),
(2304, 277, '刚察县', 4),
(2305, 277, '门源', 4),
(2306, 278, '平安县', 4),
(2307, 278, '乐都县', 4),
(2308, 278, '民和', 4),
(2309, 278, '互助', 4),
(2310, 278, '化隆', 4),
(2311, 278, '循化', 4),
(2312, 279, '共和县', 4),
(2313, 279, '同德县', 4),
(2314, 279, '贵德县', 4),
(2315, 279, '兴海县', 4),
(2316, 279, '贵南县', 4),
(2317, 280, '德令哈市', 4),
(2318, 280, '格尔木市', 4),
(2319, 280, '乌兰县', 4),
(2320, 280, '都兰县', 4),
(2321, 280, '天峻县', 4),
(2322, 281, '同仁县', 4),
(2323, 281, '尖扎县', 4),
(2324, 281, '泽库县', 4),
(2325, 281, '河南蒙古族自治县', 4),
(2326, 282, '玉树县', 4),
(2327, 282, '杂多县', 4),
(2328, 282, '称多县', 4),
(2329, 282, '治多县', 4),
(2330, 282, '囊谦县', 4),
(2331, 282, '曲麻莱县', 4),
(2332, 283, '市中区', 4),
(2333, 283, '历下区', 4),
(2334, 283, '天桥区', 4),
(2335, 283, '槐荫区', 4),
(2336, 283, '历城区', 4),
(2337, 283, '长清区', 4),
(2338, 283, '章丘市', 4),
(2339, 283, '平阴县', 4),
(2340, 283, '济阳县', 4),
(2341, 283, '商河县', 4),
(2342, 284, '市南区', 4),
(2343, 284, '市北区', 4),
(2344, 284, '城阳区', 4),
(2345, 284, '四方区', 4),
(2346, 284, '李沧区', 4),
(2347, 284, '黄岛区', 4),
(2348, 284, '崂山区', 4),
(2349, 284, '胶州市', 4),
(2350, 284, '即墨市', 4),
(2351, 284, '平度市', 4),
(2352, 284, '胶南市', 4),
(2353, 284, '莱西市', 4),
(2354, 285, '滨城区', 4),
(2355, 285, '惠民县', 4),
(2356, 285, '阳信县', 4),
(2357, 285, '无棣县', 4),
(2358, 285, '沾化县', 4),
(2359, 285, '博兴县', 4),
(2360, 285, '邹平县', 4),
(2361, 286, '德城区', 4),
(2362, 286, '陵县', 4),
(2363, 286, '乐陵市', 4),
(2364, 286, '禹城市', 4),
(2365, 286, '宁津县', 4),
(2366, 286, '庆云县', 4),
(2367, 286, '临邑县', 4),
(2368, 286, '齐河县', 4),
(2369, 286, '平原县', 4),
(2370, 286, '夏津县', 4),
(2371, 286, '武城县', 4),
(2372, 287, '东营区', 4),
(2373, 287, '河口区', 4),
(2374, 287, '垦利县', 4),
(2375, 287, '利津县', 4),
(2376, 287, '广饶县', 4),
(2377, 288, '牡丹区', 4),
(2378, 288, '曹县', 4),
(2379, 288, '单县', 4),
(2380, 288, '成武县', 4),
(2381, 288, '巨野县', 4),
(2382, 288, '郓城县', 4),
(2383, 288, '鄄城县', 4),
(2384, 288, '定陶县', 4),
(2385, 288, '东明县', 4),
(2386, 289, '市中区', 4),
(2387, 289, '任城区', 4),
(2388, 289, '曲阜市', 4),
(2389, 289, '兖州市', 4),
(2390, 289, '邹城市', 4),
(2391, 289, '微山县', 4),
(2392, 289, '鱼台县', 4),
(2393, 289, '金乡县', 4),
(2394, 289, '嘉祥县', 4),
(2395, 289, '汶上县', 4),
(2396, 289, '泗水县', 4),
(2397, 289, '梁山县', 4),
(2398, 290, '莱城区', 4),
(2399, 290, '钢城区', 4),
(2400, 291, '东昌府区', 4),
(2401, 291, '临清市', 4),
(2402, 291, '阳谷县', 4),
(2403, 291, '莘县', 4),
(2404, 291, '茌平县', 4),
(2405, 291, '东阿县', 4),
(2406, 291, '冠县', 4),
(2407, 291, '高唐县', 4),
(2408, 292, '兰山区', 4),
(2409, 292, '罗庄区', 4),
(2410, 292, '河东区', 4),
(2411, 292, '沂南县', 4),
(2412, 292, '郯城县', 4),
(2413, 292, '沂水县', 4),
(2414, 292, '苍山县', 4),
(2415, 292, '费县', 4),
(2416, 292, '平邑县', 4),
(2417, 292, '莒南县', 4),
(2418, 292, '蒙阴县', 4),
(2419, 292, '临沭县', 4),
(2420, 293, '东港区', 4),
(2421, 293, '岚山区', 4),
(2422, 293, '五莲县', 4),
(2423, 293, '莒县', 4),
(2424, 294, '泰山区', 4),
(2425, 294, '岱岳区', 4),
(2426, 294, '新泰市', 4),
(2427, 294, '肥城市', 4),
(2428, 294, '宁阳县', 4),
(2429, 294, '东平县', 4),
(2430, 295, '荣成市', 4),
(2431, 295, '乳山市', 4),
(2432, 295, '环翠区', 4),
(2433, 295, '文登市', 4),
(2434, 296, '潍城区', 4),
(2435, 296, '寒亭区', 4),
(2436, 296, '坊子区', 4),
(2437, 296, '奎文区', 4),
(2438, 296, '青州市', 4),
(2439, 296, '诸城市', 4),
(2440, 296, '寿光市', 4),
(2441, 296, '安丘市', 4),
(2442, 296, '高密市', 4),
(2443, 296, '昌邑市', 4),
(2444, 296, '临朐县', 4),
(2445, 296, '昌乐县', 4),
(2446, 297, '芝罘区', 4),
(2447, 297, '福山区', 4),
(2448, 297, '牟平区', 4),
(2449, 297, '莱山区', 4),
(2450, 297, '开发区', 4),
(2451, 297, '龙口市', 4),
(2452, 297, '莱阳市', 4),
(2453, 297, '莱州市', 4),
(2454, 297, '蓬莱市', 4),
(2455, 297, '招远市', 4),
(2456, 297, '栖霞市', 4),
(2457, 297, '海阳市', 4),
(2458, 297, '长岛县', 4),
(2459, 298, '市中区', 4),
(2460, 298, '山亭区', 4),
(2461, 298, '峄城区', 4),
(2462, 298, '台儿庄区', 4),
(2463, 298, '薛城区', 4),
(2464, 298, '滕州市', 4),
(2465, 299, '张店区', 4),
(2466, 299, '临淄区', 4),
(2467, 299, '淄川区', 4),
(2468, 299, '博山区', 4),
(2469, 299, '周村区', 4),
(2470, 299, '桓台县', 4),
(2471, 299, '高青县', 4),
(2472, 299, '沂源县', 4),
(2473, 300, '杏花岭区', 4),
(2474, 300, '小店区', 4),
(2475, 300, '迎泽区', 4),
(2476, 300, '尖草坪区', 4),
(2477, 300, '万柏林区', 4),
(2478, 300, '晋源区', 4),
(2479, 300, '高新开发区', 4),
(2480, 300, '民营经济开发区', 4),
(2481, 300, '经济技术开发区', 4),
(2482, 300, '清徐县', 4),
(2483, 300, '阳曲县', 4),
(2484, 300, '娄烦县', 4),
(2485, 300, '古交市', 4),
(2486, 301, '城区', 4),
(2487, 301, '郊区', 4),
(2488, 301, '沁县', 4),
(2489, 301, '潞城市', 4),
(2490, 301, '长治县', 4),
(2491, 301, '襄垣县', 4),
(2492, 301, '屯留县', 4),
(2493, 301, '平顺县', 4),
(2494, 301, '黎城县', 4),
(2495, 301, '壶关县', 4),
(2496, 301, '长子县', 4),
(2497, 301, '武乡县', 4),
(2498, 301, '沁源县', 4),
(2499, 302, '城区', 4),
(2500, 302, '矿区', 4),
(2501, 302, '南郊区', 4),
(2502, 302, '新荣区', 4),
(2503, 302, '阳高县', 4),
(2504, 302, '天镇县', 4),
(2505, 302, '广灵县', 4),
(2506, 302, '灵丘县', 4),
(2507, 302, '浑源县', 4),
(2508, 302, '左云县', 4),
(2509, 302, '大同县', 4),
(2510, 303, '城区', 4),
(2511, 303, '高平市', 4),
(2512, 303, '沁水县', 4),
(2513, 303, '阳城县', 4),
(2514, 303, '陵川县', 4),
(2515, 303, '泽州县', 4),
(2516, 304, '榆次区', 4),
(2517, 304, '介休市', 4),
(2518, 304, '榆社县', 4),
(2519, 304, '左权县', 4),
(2520, 304, '和顺县', 4),
(2521, 304, '昔阳县', 4),
(2522, 304, '寿阳县', 4),
(2523, 304, '太谷县', 4),
(2524, 304, '祁县', 4),
(2525, 304, '平遥县', 4),
(2526, 304, '灵石县', 4),
(2527, 305, '尧都区', 4),
(2528, 305, '侯马市', 4),
(2529, 305, '霍州市', 4),
(2530, 305, '曲沃县', 4),
(2531, 305, '翼城县', 4),
(2532, 305, '襄汾县', 4),
(2533, 305, '洪洞县', 4),
(2534, 305, '吉县', 4),
(2535, 305, '安泽县', 4),
(2536, 305, '浮山县', 4),
(2537, 305, '古县', 4),
(2538, 305, '乡宁县', 4),
(2539, 305, '大宁县', 4),
(2540, 305, '隰县', 4),
(2541, 305, '永和县', 4),
(2542, 305, '蒲县', 4),
(2543, 305, '汾西县', 4),
(2544, 306, '离石市', 4),
(2545, 306, '离石区', 4),
(2546, 306, '孝义市', 4),
(2547, 306, '汾阳市', 4),
(2548, 306, '文水县', 4),
(2549, 306, '交城县', 4),
(2550, 306, '兴县', 4),
(2551, 306, '临县', 4),
(2552, 306, '柳林县', 4),
(2553, 306, '石楼县', 4),
(2554, 306, '岚县', 4),
(2555, 306, '方山县', 4),
(2556, 306, '中阳县', 4),
(2557, 306, '交口县', 4),
(2558, 307, '朔城区', 4),
(2559, 307, '平鲁区', 4),
(2560, 307, '山阴县', 4),
(2561, 307, '应县', 4),
(2562, 307, '右玉县', 4),
(2563, 307, '怀仁县', 4),
(2564, 308, '忻府区', 4),
(2565, 308, '原平市', 4),
(2566, 308, '定襄县', 4),
(2567, 308, '五台县', 4),
(2568, 308, '代县', 4),
(2569, 308, '繁峙县', 4),
(2570, 308, '宁武县', 4),
(2571, 308, '静乐县', 4),
(2572, 308, '神池县', 4),
(2573, 308, '五寨县', 4),
(2574, 308, '岢岚县', 4),
(2575, 308, '河曲县', 4),
(2576, 308, '保德县', 4),
(2577, 308, '偏关县', 4),
(2578, 309, '城区', 4),
(2579, 309, '矿区', 4),
(2580, 309, '郊区', 4),
(2581, 309, '平定县', 4),
(2582, 309, '盂县', 4),
(2583, 310, '盐湖区', 4),
(2584, 310, '永济市', 4),
(2585, 310, '河津市', 4),
(2586, 310, '临猗县', 4),
(2587, 310, '万荣县', 4),
(2588, 310, '闻喜县', 4),
(2589, 310, '稷山县', 4),
(2590, 310, '新绛县', 4),
(2591, 310, '绛县', 4),
(2592, 310, '垣曲县', 4),
(2593, 310, '夏县', 4),
(2594, 310, '平陆县', 4),
(2595, 310, '芮城县', 4),
(2596, 311, '莲湖区', 4),
(2597, 311, '新城区', 4),
(2598, 311, '碑林区', 4),
(2599, 311, '雁塔区', 4),
(2600, 311, '灞桥区', 4),
(2601, 311, '未央区', 4),
(2602, 311, '阎良区', 4),
(2603, 311, '临潼区', 4),
(2604, 311, '长安区', 4),
(2605, 311, '蓝田县', 4),
(2606, 311, '周至县', 4),
(2607, 311, '户县', 4),
(2608, 311, '高陵县', 4),
(2609, 312, '汉滨区', 4),
(2610, 312, '汉阴县', 4),
(2611, 312, '石泉县', 4),
(2612, 312, '宁陕县', 4),
(2613, 312, '紫阳县', 4),
(2614, 312, '岚皋县', 4),
(2615, 312, '平利县', 4),
(2616, 312, '镇坪县', 4),
(2617, 312, '旬阳县', 4),
(2618, 312, '白河县', 4),
(2619, 313, '陈仓区', 4),
(2620, 313, '渭滨区', 4),
(2621, 313, '金台区', 4),
(2622, 313, '凤翔县', 4),
(2623, 313, '岐山县', 4),
(2624, 313, '扶风县', 4),
(2625, 313, '眉县', 4),
(2626, 313, '陇县', 4),
(2627, 313, '千阳县', 4),
(2628, 313, '麟游县', 4),
(2629, 313, '凤县', 4),
(2630, 313, '太白县', 4),
(2631, 314, '汉台区', 4),
(2632, 314, '南郑县', 4),
(2633, 314, '城固县', 4),
(2634, 314, '洋县', 4),
(2635, 314, '西乡县', 4),
(2636, 314, '勉县', 4),
(2637, 314, '宁强县', 4),
(2638, 314, '略阳县', 4),
(2639, 314, '镇巴县', 4),
(2640, 314, '留坝县', 4),
(2641, 314, '佛坪县', 4),
(2642, 315, '商州区', 4),
(2643, 315, '洛南县', 4),
(2644, 315, '丹凤县', 4),
(2645, 315, '商南县', 4),
(2646, 315, '山阳县', 4),
(2647, 315, '镇安县', 4),
(2648, 315, '柞水县', 4),
(2649, 316, '耀州区', 4),
(2650, 316, '王益区', 4),
(2651, 316, '印台区', 4),
(2652, 316, '宜君县', 4),
(2653, 317, '临渭区', 4),
(2654, 317, '韩城市', 4),
(2655, 317, '华阴市', 4),
(2656, 317, '华县', 4),
(2657, 317, '潼关县', 4),
(2658, 317, '大荔县', 4),
(2659, 317, '合阳县', 4),
(2660, 317, '澄城县', 4),
(2661, 317, '蒲城县', 4),
(2662, 317, '白水县', 4),
(2663, 317, '富平县', 4),
(2664, 318, '秦都区', 4),
(2665, 318, '渭城区', 4),
(2666, 318, '杨陵区', 4),
(2667, 318, '兴平市', 4),
(2668, 318, '三原县', 4),
(2669, 318, '泾阳县', 4),
(2670, 318, '乾县', 4),
(2671, 318, '礼泉县', 4),
(2672, 318, '永寿县', 4),
(2673, 318, '彬县', 4),
(2674, 318, '长武县', 4),
(2675, 318, '旬邑县', 4),
(2676, 318, '淳化县', 4),
(2677, 318, '武功县', 4),
(2678, 319, '吴起县', 4),
(2679, 319, '宝塔区', 4),
(2680, 319, '延长县', 4),
(2681, 319, '延川县', 4),
(2682, 319, '子长县', 4),
(2683, 319, '安塞县', 4),
(2684, 319, '志丹县', 4),
(2685, 319, '甘泉县', 4),
(2686, 319, '富县', 4),
(2687, 319, '洛川县', 4),
(2688, 319, '宜川县', 4),
(2689, 319, '黄龙县', 4),
(2690, 319, '黄陵县', 4),
(2691, 320, '榆阳区', 4),
(2692, 320, '神木县', 4),
(2693, 320, '府谷县', 4),
(2694, 320, '横山县', 4),
(2695, 320, '靖边县', 4),
(2696, 320, '定边县', 4),
(2697, 320, '绥德县', 4),
(2698, 320, '米脂县', 4),
(2699, 320, '佳县', 4),
(2700, 320, '吴堡县', 4),
(2701, 320, '清涧县', 4),
(2702, 320, '子洲县', 4),
(2703, 321, '长宁区', 4),
(2704, 321, '闸北区', 4),
(2705, 321, '闵行区', 4),
(2706, 321, '徐汇区', 4),
(2707, 321, '浦东新区', 4),
(2708, 321, '杨浦区', 4),
(2709, 321, '普陀区', 4),
(2710, 321, '静安区', 4),
(2711, 321, '卢湾区', 4),
(2712, 321, '虹口区', 4),
(2713, 321, '黄浦区', 4),
(2714, 321, '南汇区', 4),
(2715, 321, '松江区', 4),
(2716, 321, '嘉定区', 4),
(2717, 321, '宝山区', 4),
(2718, 321, '青浦区', 4),
(2719, 321, '金山区', 4),
(2720, 321, '奉贤区', 4),
(2721, 321, '崇明县', 4),
(2722, 322, '青羊区', 4),
(2723, 322, '锦江区', 4),
(2724, 322, '金牛区', 4),
(2725, 322, '武侯区', 4),
(2726, 322, '成华区', 4),
(2727, 322, '龙泉驿区', 4),
(2728, 322, '青白江区', 4),
(2729, 322, '新都区', 4),
(2730, 322, '温江区', 4),
(2731, 322, '高新区', 4),
(2732, 322, '高新西区', 4),
(2733, 322, '都江堰市', 4),
(2734, 322, '彭州市', 4),
(2735, 322, '邛崃市', 4),
(2736, 322, '崇州市', 4),
(2737, 322, '金堂县', 4),
(2738, 322, '双流县', 4),
(2739, 322, '郫县', 4),
(2740, 322, '大邑县', 4),
(2741, 322, '蒲江县', 4),
(2742, 322, '新津县', 4),
(2743, 322, '都江堰市', 4),
(2744, 322, '彭州市', 4),
(2745, 322, '邛崃市', 4),
(2746, 322, '崇州市', 4),
(2747, 322, '金堂县', 4),
(2748, 322, '双流县', 4),
(2749, 322, '郫县', 4),
(2750, 322, '大邑县', 4),
(2751, 322, '蒲江县', 4),
(2752, 322, '新津县', 4),
(2753, 323, '涪城区', 4),
(2754, 323, '游仙区', 4),
(2755, 323, '江油市', 4),
(2756, 323, '盐亭县', 4),
(2757, 323, '三台县', 4),
(2758, 323, '平武县', 4),
(2759, 323, '安县', 4),
(2760, 323, '梓潼县', 4),
(2761, 323, '北川县', 4),
(2762, 324, '马尔康县', 4),
(2763, 324, '汶川县', 4),
(2764, 324, '理县', 4),
(2765, 324, '茂县', 4),
(2766, 324, '松潘县', 4),
(2767, 324, '九寨沟县', 4),
(2768, 324, '金川县', 4),
(2769, 324, '小金县', 4),
(2770, 324, '黑水县', 4),
(2771, 324, '壤塘县', 4),
(2772, 324, '阿坝县', 4),
(2773, 324, '若尔盖县', 4),
(2774, 324, '红原县', 4),
(2775, 325, '巴州区', 4),
(2776, 325, '通江县', 4),
(2777, 325, '南江县', 4),
(2778, 325, '平昌县', 4),
(2779, 326, '通川区', 4),
(2780, 326, '万源市', 4),
(2781, 326, '达县', 4),
(2782, 326, '宣汉县', 4),
(2783, 326, '开江县', 4),
(2784, 326, '大竹县', 4),
(2785, 326, '渠县', 4),
(2786, 327, '旌阳区', 4),
(2787, 327, '广汉市', 4),
(2788, 327, '什邡市', 4),
(2789, 327, '绵竹市', 4),
(2790, 327, '罗江县', 4),
(2791, 327, '中江县', 4),
(2792, 328, '康定县', 4),
(2793, 328, '丹巴县', 4),
(2794, 328, '泸定县', 4),
(2795, 328, '炉霍县', 4),
(2796, 328, '九龙县', 4),
(2797, 328, '甘孜县', 4),
(2798, 328, '雅江县', 4),
(2799, 328, '新龙县', 4),
(2800, 328, '道孚县', 4),
(2801, 328, '白玉县', 4),
(2802, 328, '理塘县', 4),
(2803, 328, '德格县', 4),
(2804, 328, '乡城县', 4),
(2805, 328, '石渠县', 4),
(2806, 328, '稻城县', 4),
(2807, 328, '色达县', 4),
(2808, 328, '巴塘县', 4),
(2809, 328, '得荣县', 4),
(2810, 329, '广安区', 4),
(2811, 329, '华蓥市', 4),
(2812, 329, '岳池县', 4),
(2813, 329, '武胜县', 4),
(2814, 329, '邻水县', 4),
(2815, 330, '利州区', 4),
(2816, 330, '元坝区', 4),
(2817, 330, '朝天区', 4),
(2818, 330, '旺苍县', 4),
(2819, 330, '青川县', 4),
(2820, 330, '剑阁县', 4),
(2821, 330, '苍溪县', 4),
(2822, 331, '峨眉山市', 4),
(2823, 331, '乐山市', 4),
(2824, 331, '犍为县', 4),
(2825, 331, '井研县', 4),
(2826, 331, '夹江县', 4),
(2827, 331, '沐川县', 4),
(2828, 331, '峨边', 4),
(2829, 331, '马边', 4),
(2830, 332, '西昌市', 4),
(2831, 332, '盐源县', 4),
(2832, 332, '德昌县', 4),
(2833, 332, '会理县', 4),
(2834, 332, '会东县', 4),
(2835, 332, '宁南县', 4),
(2836, 332, '普格县', 4),
(2837, 332, '布拖县', 4),
(2838, 332, '金阳县', 4),
(2839, 332, '昭觉县', 4),
(2840, 332, '喜德县', 4),
(2841, 332, '冕宁县', 4),
(2842, 332, '越西县', 4),
(2843, 332, '甘洛县', 4),
(2844, 332, '美姑县', 4),
(2845, 332, '雷波县', 4),
(2846, 332, '木里', 4),
(2847, 333, '东坡区', 4),
(2848, 333, '仁寿县', 4),
(2849, 333, '彭山县', 4),
(2850, 333, '洪雅县', 4),
(2851, 333, '丹棱县', 4),
(2852, 333, '青神县', 4),
(2853, 334, '阆中市', 4),
(2854, 334, '南部县', 4),
(2855, 334, '营山县', 4),
(2856, 334, '蓬安县', 4),
(2857, 334, '仪陇县', 4),
(2858, 334, '顺庆区', 4),
(2859, 334, '高坪区', 4),
(2860, 334, '嘉陵区', 4),
(2861, 334, '西充县', 4),
(2862, 335, '市中区', 4),
(2863, 335, '东兴区', 4),
(2864, 335, '威远县', 4),
(2865, 335, '资中县', 4),
(2866, 335, '隆昌县', 4),
(2867, 336, '东  区', 4),
(2868, 336, '西  区', 4),
(2869, 336, '仁和区', 4),
(2870, 336, '米易县', 4),
(2871, 336, '盐边县', 4),
(2872, 337, '船山区', 4),
(2873, 337, '安居区', 4),
(2874, 337, '蓬溪县', 4),
(2875, 337, '射洪县', 4),
(2876, 337, '大英县', 4),
(2877, 338, '雨城区', 4),
(2878, 338, '名山县', 4),
(2879, 338, '荥经县', 4),
(2880, 338, '汉源县', 4),
(2881, 338, '石棉县', 4),
(2882, 338, '天全县', 4),
(2883, 338, '芦山县', 4),
(2884, 338, '宝兴县', 4),
(2885, 339, '翠屏区', 4),
(2886, 339, '宜宾县', 4),
(2887, 339, '南溪县', 4),
(2888, 339, '江安县', 4),
(2889, 339, '长宁县', 4),
(2890, 339, '高县', 4),
(2891, 339, '珙县', 4),
(2892, 339, '筠连县', 4),
(2893, 339, '兴文县', 4),
(2894, 339, '屏山县', 4),
(2895, 340, '雁江区', 4),
(2896, 340, '简阳市', 4),
(2897, 340, '安岳县', 4),
(2898, 340, '乐至县', 4),
(2899, 341, '大安区', 4),
(2900, 341, '自流井区', 4),
(2901, 341, '贡井区', 4),
(2902, 341, '沿滩区', 4),
(2903, 341, '荣县', 4),
(2904, 341, '富顺县', 4),
(2905, 342, '江阳区', 4),
(2906, 342, '纳溪区', 4),
(2907, 342, '龙马潭区', 4),
(2908, 342, '泸县', 4),
(2909, 342, '合江县', 4),
(2910, 342, '叙永县', 4),
(2911, 342, '古蔺县', 4),
(2912, 343, '和平区', 4),
(2913, 343, '河西区', 4),
(2914, 343, '南开区', 4),
(2915, 343, '河北区', 4),
(2916, 343, '河东区', 4),
(2917, 343, '红桥区', 4),
(2918, 343, '东丽区', 4),
(2919, 343, '津南区', 4),
(2920, 343, '西青区', 4),
(2921, 343, '北辰区', 4),
(2922, 343, '塘沽区', 4),
(2923, 343, '汉沽区', 4),
(2924, 343, '大港区', 4),
(2925, 343, '武清区', 4),
(2926, 343, '宝坻区', 4),
(2927, 343, '经济开发区', 4),
(2928, 343, '宁河县', 4),
(2929, 343, '静海县', 4),
(2930, 343, '蓟县', 4),
(2931, 344, '城关区', 4),
(2932, 344, '林周县', 4),
(2933, 344, '当雄县', 4),
(2934, 344, '尼木县', 4),
(2935, 344, '曲水县', 4),
(2936, 344, '堆龙德庆县', 4),
(2937, 344, '达孜县', 4),
(2938, 344, '墨竹工卡县', 4),
(2939, 345, '噶尔县', 4),
(2940, 345, '普兰县', 4),
(2941, 345, '札达县', 4),
(2942, 345, '日土县', 4),
(2943, 345, '革吉县', 4),
(2944, 345, '改则县', 4),
(2945, 345, '措勤县', 4),
(2946, 346, '昌都县', 4),
(2947, 346, '江达县', 4),
(2948, 346, '贡觉县', 4),
(2949, 346, '类乌齐县', 4),
(2950, 346, '丁青县', 4),
(2951, 346, '察雅县', 4),
(2952, 346, '八宿县', 4),
(2953, 346, '左贡县', 4),
(2954, 346, '芒康县', 4),
(2955, 346, '洛隆县', 4),
(2956, 346, '边坝县', 4),
(2957, 347, '林芝县', 4),
(2958, 347, '工布江达县', 4),
(2959, 347, '米林县', 4),
(2960, 347, '墨脱县', 4),
(2961, 347, '波密县', 4),
(2962, 347, '察隅县', 4),
(2963, 347, '朗县', 4),
(2964, 348, '那曲县', 4),
(2965, 348, '嘉黎县', 4),
(2966, 348, '比如县', 4),
(2967, 348, '聂荣县', 4),
(2968, 348, '安多县', 4),
(2969, 348, '申扎县', 4),
(2970, 348, '索县', 4),
(2971, 348, '班戈县', 4),
(2972, 348, '巴青县', 4),
(2973, 348, '尼玛县', 4),
(2974, 349, '日喀则市', 4),
(2975, 349, '南木林县', 4),
(2976, 349, '江孜县', 4),
(2977, 349, '定日县', 4),
(2978, 349, '萨迦县', 4),
(2979, 349, '拉孜县', 4),
(2980, 349, '昂仁县', 4),
(2981, 349, '谢通门县', 4),
(2982, 349, '白朗县', 4),
(2983, 349, '仁布县', 4),
(2984, 349, '康马县', 4),
(2985, 349, '定结县', 4),
(2986, 349, '仲巴县', 4),
(2987, 349, '亚东县', 4),
(2988, 349, '吉隆县', 4),
(2989, 349, '聂拉木县', 4),
(2990, 349, '萨嘎县', 4),
(2991, 349, '岗巴县', 4),
(2992, 350, '乃东县', 4),
(2993, 350, '扎囊县', 4),
(2994, 350, '贡嘎县', 4),
(2995, 350, '桑日县', 4),
(2996, 350, '琼结县', 4),
(2997, 350, '曲松县', 4),
(2998, 350, '措美县', 4),
(2999, 350, '洛扎县', 4),
(3000, 350, '加查县', 4),
(3001, 350, '隆子县', 4),
(3002, 350, '错那县', 4),
(3003, 350, '浪卡子县', 4),
(3004, 351, '天山区', 4),
(3005, 351, '沙依巴克区', 4),
(3006, 351, '新市区', 4),
(3007, 351, '水磨沟区', 4),
(3008, 351, '头屯河区', 4),
(3009, 351, '达坂城区', 4),
(3010, 351, '米东区', 4),
(3011, 351, '乌鲁木齐县', 4),
(3012, 352, '阿克苏市', 4),
(3013, 352, '温宿县', 4),
(3014, 352, '库车县', 4),
(3015, 352, '沙雅县', 4),
(3016, 352, '新和县', 4),
(3017, 352, '拜城县', 4),
(3018, 352, '乌什县', 4),
(3019, 352, '阿瓦提县', 4),
(3020, 352, '柯坪县', 4),
(3021, 353, '阿拉尔市', 4),
(3022, 354, '库尔勒市', 4),
(3023, 354, '轮台县', 4),
(3024, 354, '尉犁县', 4),
(3025, 354, '若羌县', 4),
(3026, 354, '且末县', 4),
(3027, 354, '焉耆', 4),
(3028, 354, '和静县', 4),
(3029, 354, '和硕县', 4),
(3030, 354, '博湖县', 4),
(3031, 355, '博乐市', 4),
(3032, 355, '精河县', 4),
(3033, 355, '温泉县', 4),
(3034, 356, '呼图壁县', 4),
(3035, 356, '米泉市', 4),
(3036, 356, '昌吉市', 4),
(3037, 356, '阜康市', 4),
(3038, 356, '玛纳斯县', 4),
(3039, 356, '奇台县', 4),
(3040, 356, '吉木萨尔县', 4),
(3041, 356, '木垒', 4),
(3042, 357, '哈密市', 4),
(3043, 357, '伊吾县', 4),
(3044, 357, '巴里坤', 4),
(3045, 358, '和田市', 4),
(3046, 358, '和田县', 4),
(3047, 358, '墨玉县', 4),
(3048, 358, '皮山县', 4),
(3049, 358, '洛浦县', 4),
(3050, 358, '策勒县', 4),
(3051, 358, '于田县', 4),
(3052, 358, '民丰县', 4),
(3053, 359, '喀什市', 4),
(3054, 359, '疏附县', 4),
(3055, 359, '疏勒县', 4),
(3056, 359, '英吉沙县', 4),
(3057, 359, '泽普县', 4),
(3058, 359, '莎车县', 4),
(3059, 359, '叶城县', 4),
(3060, 359, '麦盖提县', 4),
(3061, 359, '岳普湖县', 4),
(3062, 359, '伽师县', 4),
(3063, 359, '巴楚县', 4),
(3064, 359, '塔什库尔干', 4),
(3065, 360, '克拉玛依市', 4),
(3066, 361, '阿图什市', 4),
(3067, 361, '阿克陶县', 4),
(3068, 361, '阿合奇县', 4),
(3069, 361, '乌恰县', 4),
(3070, 362, '石河子市', 4),
(3071, 363, '图木舒克市', 4),
(3072, 364, '吐鲁番市', 4),
(3073, 364, '鄯善县', 4),
(3074, 364, '托克逊县', 4),
(3075, 365, '五家渠市', 4),
(3076, 366, '阿勒泰市', 4),
(3077, 366, '布克赛尔', 4),
(3078, 366, '伊宁市', 4),
(3079, 366, '布尔津县', 4),
(3080, 366, '奎屯市', 4),
(3081, 366, '乌苏市', 4),
(3082, 366, '额敏县', 4),
(3083, 366, '富蕴县', 4),
(3084, 366, '伊宁县', 4),
(3085, 366, '福海县', 4),
(3086, 366, '霍城县', 4),
(3087, 366, '沙湾县', 4),
(3088, 366, '巩留县', 4),
(3089, 366, '哈巴河县', 4),
(3090, 366, '托里县', 4),
(3091, 366, '青河县', 4),
(3092, 366, '新源县', 4),
(3093, 366, '裕民县', 4),
(3094, 366, '和布克赛尔', 4),
(3095, 366, '吉木乃县', 4),
(3096, 366, '昭苏县', 4),
(3097, 366, '特克斯县', 4),
(3098, 366, '尼勒克县', 4),
(3099, 366, '察布查尔', 4),
(3100, 367, '盘龙区', 4),
(3101, 367, '五华区', 4),
(3102, 367, '官渡区', 4),
(3103, 367, '西山区', 4),
(3104, 367, '东川区', 4),
(3105, 367, '安宁市', 4),
(3106, 367, '呈贡县', 4),
(3107, 367, '晋宁县', 4),
(3108, 367, '富民县', 4),
(3109, 367, '宜良县', 4),
(3110, 367, '嵩明县', 4),
(3111, 367, '石林县', 4),
(3112, 367, '禄劝', 4),
(3113, 367, '寻甸', 4),
(3114, 368, '兰坪', 4),
(3115, 368, '泸水县', 4),
(3116, 368, '福贡县', 4),
(3117, 368, '贡山', 4),
(3118, 369, '宁洱', 4),
(3119, 369, '思茅区', 4),
(3120, 369, '墨江', 4),
(3121, 369, '景东', 4),
(3122, 369, '景谷', 4),
(3123, 369, '镇沅', 4),
(3124, 369, '江城', 4),
(3125, 369, '孟连', 4),
(3126, 369, '澜沧', 4),
(3127, 369, '西盟', 4),
(3128, 370, '古城区', 4),
(3129, 370, '宁蒗', 4),
(3130, 370, '玉龙', 4),
(3131, 370, '永胜县', 4),
(3132, 370, '华坪县', 4),
(3133, 371, '隆阳区', 4),
(3134, 371, '施甸县', 4),
(3135, 371, '腾冲县', 4),
(3136, 371, '龙陵县', 4),
(3137, 371, '昌宁县', 4),
(3138, 372, '楚雄市', 4),
(3139, 372, '双柏县', 4),
(3140, 372, '牟定县', 4),
(3141, 372, '南华县', 4),
(3142, 372, '姚安县', 4),
(3143, 372, '大姚县', 4),
(3144, 372, '永仁县', 4),
(3145, 372, '元谋县', 4),
(3146, 372, '武定县', 4),
(3147, 372, '禄丰县', 4),
(3148, 373, '大理市', 4),
(3149, 373, '祥云县', 4),
(3150, 373, '宾川县', 4),
(3151, 373, '弥渡县', 4),
(3152, 373, '永平县', 4),
(3153, 373, '云龙县', 4),
(3154, 373, '洱源县', 4),
(3155, 373, '剑川县', 4),
(3156, 373, '鹤庆县', 4),
(3157, 373, '漾濞', 4),
(3158, 373, '南涧', 4),
(3159, 373, '巍山', 4),
(3160, 374, '潞西市', 4),
(3161, 374, '瑞丽市', 4),
(3162, 374, '梁河县', 4),
(3163, 374, '盈江县', 4),
(3164, 374, '陇川县', 4),
(3165, 375, '香格里拉县', 4),
(3166, 375, '德钦县', 4),
(3167, 375, '维西', 4),
(3168, 376, '泸西县', 4),
(3169, 376, '蒙自县', 4),
(3170, 376, '个旧市', 4),
(3171, 376, '开远市', 4),
(3172, 376, '绿春县', 4),
(3173, 376, '建水县', 4),
(3174, 376, '石屏县', 4),
(3175, 376, '弥勒县', 4),
(3176, 376, '元阳县', 4),
(3177, 376, '红河县', 4),
(3178, 376, '金平', 4),
(3179, 376, '河口', 4),
(3180, 376, '屏边', 4),
(3181, 377, '临翔区', 4),
(3182, 377, '凤庆县', 4),
(3183, 377, '云县', 4),
(3184, 377, '永德县', 4),
(3185, 377, '镇康县', 4),
(3186, 377, '双江', 4),
(3187, 377, '耿马', 4),
(3188, 377, '沧源', 4),
(3189, 378, '麒麟区', 4),
(3190, 378, '宣威市', 4),
(3191, 378, '马龙县', 4),
(3192, 378, '陆良县', 4),
(3193, 378, '师宗县', 4),
(3194, 378, '罗平县', 4),
(3195, 378, '富源县', 4),
(3196, 378, '会泽县', 4),
(3197, 378, '沾益县', 4),
(3198, 379, '文山县', 4),
(3199, 379, '砚山县', 4),
(3200, 379, '西畴县', 4),
(3201, 379, '麻栗坡县', 4),
(3202, 379, '马关县', 4),
(3203, 379, '丘北县', 4),
(3204, 379, '广南县', 4),
(3205, 379, '富宁县', 4),
(3206, 380, '景洪市', 4),
(3207, 380, '勐海县', 4),
(3208, 380, '勐腊县', 4),
(3209, 381, '红塔区', 4),
(3210, 381, '江川县', 4),
(3211, 381, '澄江县', 4),
(3212, 381, '通海县', 4),
(3213, 381, '华宁县', 4),
(3214, 381, '易门县', 4),
(3215, 381, '峨山', 4),
(3216, 381, '新平', 4),
(3217, 381, '元江', 4),
(3218, 382, '昭阳区', 4),
(3219, 382, '鲁甸县', 4),
(3220, 382, '巧家县', 4),
(3221, 382, '盐津县', 4),
(3222, 382, '大关县', 4),
(3223, 382, '永善县', 4),
(3224, 382, '绥江县', 4),
(3225, 382, '镇雄县', 4),
(3226, 382, '彝良县', 4),
(3227, 382, '威信县', 4),
(3228, 382, '水富县', 4),
(3229, 383, '西湖区', 4),
(3230, 383, '上城区', 4),
(3231, 383, '下城区', 4),
(3232, 383, '拱墅区', 4),
(3233, 383, '滨江区', 4),
(3234, 383, '江干区', 4),
(3235, 383, '萧山区', 4),
(3236, 383, '余杭区', 4),
(3237, 383, '市郊', 4),
(3238, 383, '建德市', 4),
(3239, 383, '富阳市', 4),
(3240, 383, '临安市', 4),
(3241, 383, '桐庐县', 4),
(3242, 383, '淳安县', 4),
(3243, 384, '吴兴区', 4),
(3244, 384, '南浔区', 4),
(3245, 384, '德清县', 4),
(3246, 384, '长兴县', 4),
(3247, 384, '安吉县', 4),
(3248, 385, '南湖区', 4),
(3249, 385, '秀洲区', 4),
(3250, 385, '海宁市', 4),
(3251, 385, '嘉善县', 4),
(3252, 385, '平湖市', 4),
(3253, 385, '桐乡市', 4),
(3254, 385, '海盐县', 4),
(3255, 386, '婺城区', 4),
(3256, 386, '金东区', 4),
(3257, 386, '兰溪市', 4),
(3258, 386, '市区', 4),
(3259, 386, '佛堂镇', 4),
(3260, 386, '上溪镇', 4),
(3261, 386, '义亭镇', 4),
(3262, 386, '大陈镇', 4),
(3263, 386, '苏溪镇', 4),
(3264, 386, '赤岸镇', 4),
(3265, 386, '东阳市', 4),
(3266, 386, '永康市', 4),
(3267, 386, '武义县', 4),
(3268, 386, '浦江县', 4),
(3269, 386, '磐安县', 4),
(3270, 387, '莲都区', 4),
(3271, 387, '龙泉市', 4),
(3272, 387, '青田县', 4),
(3273, 387, '缙云县', 4),
(3274, 387, '遂昌县', 4),
(3275, 387, '松阳县', 4),
(3276, 387, '云和县', 4),
(3277, 387, '庆元县', 4),
(3278, 387, '景宁', 4),
(3279, 388, '海曙区', 4),
(3280, 388, '江东区', 4),
(3281, 388, '江北区', 4),
(3282, 388, '镇海区', 4),
(3283, 388, '北仑区', 4),
(3284, 388, '鄞州区', 4),
(3285, 388, '余姚市', 4),
(3286, 388, '慈溪市', 4),
(3287, 388, '奉化市', 4),
(3288, 388, '象山县', 4),
(3289, 388, '宁海县', 4),
(3290, 389, '越城区', 4),
(3291, 389, '上虞市', 4),
(3292, 389, '嵊州市', 4),
(3293, 389, '绍兴县', 4),
(3294, 389, '新昌县', 4),
(3295, 389, '诸暨市', 4),
(3296, 390, '椒江区', 4),
(3297, 390, '黄岩区', 4),
(3298, 390, '路桥区', 4),
(3299, 390, '温岭市', 4),
(3300, 390, '临海市', 4),
(3301, 390, '玉环县', 4),
(3302, 390, '三门县', 4),
(3303, 390, '天台县', 4),
(3304, 390, '仙居县', 4),
(3305, 391, '鹿城区', 4),
(3306, 391, '龙湾区', 4),
(3307, 391, '瓯海区', 4),
(3308, 391, '瑞安市', 4),
(3309, 391, '乐清市', 4),
(3310, 391, '洞头县', 4),
(3311, 391, '永嘉县', 4),
(3312, 391, '平阳县', 4),
(3313, 391, '苍南县', 4),
(3314, 391, '文成县', 4),
(3315, 391, '泰顺县', 4),
(3316, 392, '定海区', 4),
(3317, 392, '普陀区', 4),
(3318, 392, '岱山县', 4),
(3319, 392, '嵊泗县', 4),
(3320, 393, '衢州市', 4),
(3321, 393, '江山市', 4),
(3322, 393, '常山县', 4),
(3323, 393, '开化县', 4),
(3324, 393, '龙游县', 4),
(3325, 394, '合川区', 4),
(3326, 394, '江津区', 4),
(3327, 394, '南川区', 4),
(3328, 394, '永川区', 4),
(3329, 394, '南岸区', 4),
(3330, 394, '渝北区', 4),
(3331, 394, '万盛区', 4),
(3332, 394, '大渡口区', 4),
(3333, 394, '万州区', 4),
(3334, 394, '北碚区', 4),
(3335, 394, '沙坪坝区', 4),
(3336, 394, '巴南区', 4),
(3337, 394, '涪陵区', 4),
(3338, 394, '江北区', 4),
(3339, 394, '九龙坡区', 4),
(3340, 394, '渝中区', 4),
(3341, 394, '黔江开发区', 4),
(3342, 394, '长寿区', 4),
(3343, 394, '双桥区', 4),
(3344, 394, '綦江县', 4),
(3345, 394, '潼南县', 4),
(3346, 394, '铜梁县', 4),
(3347, 394, '大足县', 4),
(3348, 394, '荣昌县', 4),
(3349, 394, '璧山县', 4),
(3350, 394, '垫江县', 4),
(3351, 394, '武隆县', 4),
(3352, 394, '丰都县', 4),
(3353, 394, '城口县', 4),
(3354, 394, '梁平县', 4),
(3355, 394, '开县', 4),
(3356, 394, '巫溪县', 4),
(3357, 394, '巫山县', 4),
(3358, 394, '奉节县', 4),
(3359, 394, '云阳县', 4),
(3360, 394, '忠县', 4),
(3361, 394, '石柱', 4),
(3362, 394, '彭水', 4),
(3363, 394, '酉阳', 4),
(3364, 394, '秀山', 4),
(3365, 395, '沙田区', 4),
(3366, 395, '东区', 4),
(3367, 395, '观塘区', 4),
(3368, 395, '黄大仙区', 4),
(3369, 395, '九龙城区', 4),
(3370, 395, '屯门区', 4),
(3371, 395, '葵青区', 4),
(3372, 395, '元朗区', 4),
(3373, 395, '深水埗区', 4),
(3374, 395, '西贡区', 4),
(3375, 395, '大埔区', 4),
(3376, 395, '湾仔区', 4),
(3377, 395, '油尖旺区', 4),
(3378, 395, '北区', 4),
(3379, 395, '南区', 4),
(3380, 395, '荃湾区', 4),
(3381, 395, '中西区', 4),
(3382, 395, '离岛区', 4),
(3383, 396, '澳门', 4),
(3384, 397, '台北', 4),
(3385, 397, '高雄', 4),
(3386, 397, '基隆', 4),
(3387, 397, '台中', 4),
(3388, 397, '台南', 4),
(3389, 397, '新竹', 4),
(3390, 397, '嘉义', 4),
(3391, 397, '宜兰县', 4),
(3392, 397, '桃园县', 4),
(3393, 397, '苗栗县', 4),
(3394, 397, '彰化县', 4),
(3395, 397, '南投县', 4),
(3396, 397, '云林县', 4),
(3397, 397, '屏东县', 4),
(3398, 397, '台东县', 4),
(3399, 397, '花莲县', 4),
(3400, 397, '澎湖县', 4),
(1, 0, '中国', 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_ecv`
--

CREATE TABLE IF NOT EXISTS `fanwe_ecv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `use_limit` int(11) NOT NULL,
  `use_count` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `begin_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `money` decimal(20,4) NOT NULL,
  `ecv_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk_sn` (`sn`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=110 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_ecv_type`
--

CREATE TABLE IF NOT EXISTS `fanwe_ecv_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `money` decimal(20,4) NOT NULL,
  `use_limit` int(11) NOT NULL,
  `begin_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `gen_count` int(11) NOT NULL,
  `send_type` tinyint(1) NOT NULL,
  `exchange_score` int(11) NOT NULL,
  `exchange_limit` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_event`
--

CREATE TABLE IF NOT EXISTS `fanwe_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `event_begin_time` int(11) NOT NULL,
  `event_end_time` int(11) NOT NULL,
  `submit_begin_time` int(11) NOT NULL,
  `submit_end_time` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `cate_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `xpoint` varchar(255) NOT NULL,
  `ypoint` varchar(255) NOT NULL,
  `locate_match` text NOT NULL,
  `locate_match_row` text NOT NULL,
  `cate_match` text NOT NULL,
  `cate_match_row` text NOT NULL,
  `name_match` text NOT NULL,
  `name_match_row` text NOT NULL,
  `submit_count` int(11) NOT NULL,
  `reply_count` int(11) NOT NULL,
  `brief` text NOT NULL,
  `sort` int(11) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `click_count` int(11) NOT NULL,
  `is_recommend` tinyint(1) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `publish_wait` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `name_match` (`name_match`),
  FULLTEXT KEY `locate_match` (`locate_match`),
  FULLTEXT KEY `cate_match` (`cate_match`),
  FULLTEXT KEY `all_match` (`locate_match`,`cate_match`,`name_match`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `fanwe_event`
--

INSERT INTO `fanwe_event` (`id`, `name`, `icon`, `event_begin_time`, `event_end_time`, `submit_begin_time`, `submit_end_time`, `user_id`, `content`, `cate_id`, `city_id`, `address`, `xpoint`, `ypoint`, `locate_match`, `locate_match_row`, `cate_match`, `cate_match_row`, `name_match`, `name_match_row`, `submit_count`, `reply_count`, `brief`, `sort`, `is_effect`, `click_count`, `is_recommend`, `supplier_id`, `publish_wait`) VALUES
(1, '免费品偿巧克力', './public/attachment/201202/16/11/4f3c7ea394a90.jpg', 1328040080, 1360958483, 1328126485, 1363377687, 0, '<p><strong>【特别提示】</strong></p>\r\n<p><span style="color:#ff0000;"><strong>有 效 期：截止至2012年3月18日（过期无效）</strong></span></p>\r\n<p><strong>使用限制</strong>：每个ID限购10份；</p>\r\n<p><strong>营业时间</strong>：10：00—19:00；</p>\r\n<p><strong>商家地址</strong>：福州市台江区五一中路万都阿波罗10层1007（阿波罗大酒店后侧）；</p>\r\n<p><strong>预约电话</strong>：0591-28311183；（为保服务质量，请提前1天预约）</p>\r\n<p><strong>使用提示：</strong></p>\r\n<p>1.凭手机二维码至商家店内验证消费，节假日通用，一经验证，不予退款，请见谅；</p>\r\n<p align="left">2.请在有效期内验证，逾期无效；</p>\r\n<p align="left">3.团购不找零，不予店内其他优惠同享，商家承诺无隐性消费；</p>\r\n<p align="left">4.退款说明：有效期内退款额=（团购价-每份2元二维码信息费），有效期外退款额=（团购价-每份2元二维码信息费）*95%，请在提交退款申请时自动扣除，以便我们尽快的为您办理退款。</p>\r\n<p><strong>购买流程：</strong></p>\r\n<p><span style="color:#ff0000;">购买团购券&nbsp;&gt;&nbsp;提前1天致电预约，到店验证消费 &gt;&nbsp;开心享受服务</span></p>\r\n<p>客服电话：400-600-5515 </p>\r\n<p><strong>【活动详情】</strong></p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;【情人节特供】甜蜜情人节，DIY巧克力表爱意！仅39元，即享原价106元【小丫烘焙坊】DIY巧克力18粒礼盒装。爱有时候可以不用说出来，但可以写出来，要表达什么就看你的手艺咯！</p>\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;黑白巧克力的经典融合，甜蜜爱情的美丽代表。</p>\r\n<p><br />\r\n</p>\r\n<p><img src="./public/attachment/201202/16/12/4f3c7fd896822.jpg" alt="" border="0" /><br />\r\n</p>', 3, 15, '福州宝龙城市广场', '119.298129', '26.068769', 'ux20840ux22269,ux31119ux24030,ux23453ux40857,ux24191ux22330,ux22478ux24066,ux31119ux24030ux23453ux40857ux22478ux24066ux24191ux22330,ux40723ux27004ux21306,ux39532ux23614ux21306,ux21488ux27743ux21306,ux20845ux19968ux20013ux36335,ux19975ux35937ux22478,ux23567ux26725ux22836,ux20179ux23665ux21306,ux20179ux23665ux38215,ux34746ux27954,ux19977ux39640ux36335,ux39318ux23665ux36335,ux26187ux23433ux21306,ux29579ux24196ux26032ux26449', '全国,福州,宝龙,广场,城市,福州宝龙城市广场,鼓楼区,马尾区,台江区,六一中路,万象城,小桥头,仓山区,仓山镇,螺洲,三高路,首山路,晋安区,王庄新村', 'ux30005ux24433', '电影', 'ux24039ux20811ux21147,ux20813ux36153,ux20813ux36153ux21697ux20607ux24039ux20811ux21147,ux21487ux20197,ux28888ux28953,ux31036ux30418,ux25163ux33402,ux23567ux20011,ux29233ux24847,ux19981ux29992ux35828,ux20889ux20986,ux21407ux20215,ux29980ux34588ux24773ux20154ux33410ux65292ux68ux73ux89ux24039ux20811ux21147ux34920ux29233ux24847ux65281ux20165ux51ux57ux20803ux65292ux21363ux20139ux21407ux20215ux49ux48ux54ux20803ux12304ux23567ux20011ux28888ux28953ux22346ux12305ux68ux73ux89ux24039ux20811ux21147ux49ux56ux31890ux31036ux30418ux35013ux12290ux29233ux26377ux26102ux20505ux21487ux20197ux19981ux29992ux35828ux20986ux26469ux65292ux20294ux21487ux20197ux20889ux20986ux26469ux65292ux35201ux34920ux36798ux20160ux20040ux23601ux30475ux20320ux30340ux25163ux33402ux21679ux65281', '巧克力,免费,免费品偿巧克力,可以,烘焙,礼盒,手艺,小丫,爱意,不用说,写出,原价,甜蜜情人节，DIY巧克力表爱意！仅39元，即享原价106元【小丫烘焙坊】DIY巧克力18粒礼盒装。爱有时候可以不用说出来，但可以写出来，要表达什么就看你的手艺咯！', 1, 1, '甜蜜情人节，DIY巧克力表爱意！仅39元，即享原价106元【小丫烘焙坊】DIY巧克力18粒礼盒装。爱有时候可以不用说出来，但可以写出来，要表达什么就看你的手艺咯！', 1, 1, 0, 0, 15, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_event_area_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_event_area_link` (
  `event_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  PRIMARY KEY (`event_id`,`area_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_event_area_link`
--

INSERT INTO `fanwe_event_area_link` (`event_id`, `area_id`) VALUES
(1, 8),
(1, 12),
(1, 22),
(1, 27),
(1, 29),
(1, 37),
(1, 38),
(1, 39),
(1, 42),
(1, 43);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_event_cate`
--

CREATE TABLE IF NOT EXISTS `fanwe_event_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `fanwe_event_cate`
--

INSERT INTO `fanwe_event_cate` (`id`, `name`, `is_effect`, `sort`, `count`) VALUES
(1, '电影', 1, 1, 0),
(2, '讲座', 1, 2, 0),
(3, '试吃', 1, 3, 1),
(4, '交友', 1, 4, 0),
(5, '旅游', 1, 5, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_event_field`
--

CREATE TABLE IF NOT EXISTS `fanwe_event_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `field_show_name` varchar(255) NOT NULL,
  `field_type` tinyint(1) NOT NULL COMMENT '0:手动输入 1:预选下拉',
  `value_scope` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `fanwe_event_field`
--

INSERT INTO `fanwe_event_field` (`id`, `event_id`, `field_show_name`, `field_type`, `value_scope`, `sort`) VALUES
(5, 1, '姓名', 0, '', 0),
(6, 1, '电话', 0, '', 1),
(7, 1, '性别', 1, '男 女', 2),
(8, 1, '年龄', 1, '0-18岁 18-30岁 30-50岁 50岁以上', 3);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_event_location_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_event_location_link` (
  `event_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`event_id`,`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_event_location_link`
--

INSERT INTO `fanwe_event_location_link` (`event_id`, `location_id`) VALUES
(1, 14);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_event_submit`
--

CREATE TABLE IF NOT EXISTS `fanwe_event_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `fanwe_event_submit`
--

INSERT INTO `fanwe_event_submit` (`id`, `user_id`, `create_time`, `event_id`) VALUES
(1, 44, 1329336241, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_event_submit_field`
--

CREATE TABLE IF NOT EXISTS `fanwe_event_submit_field` (
  `submit_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  `result` varchar(255) NOT NULL,
  `event_id` int(11) NOT NULL,
  PRIMARY KEY (`submit_id`,`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_event_submit_field`
--

INSERT INTO `fanwe_event_submit_field` (`submit_id`, `field_id`, `result`, `event_id`) VALUES
(1, 5, '张三', 1),
(1, 6, '13333333333', 1),
(1, 7, '男', 1),
(1, 8, '18-30岁', 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_express`
--

CREATE TABLE IF NOT EXISTS `fanwe_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `print_tmpl` text NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `config` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_expression`
--

CREATE TABLE IF NOT EXISTS `fanwe_expression` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'tusiji',
  `emotion` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=135 ;

--
-- 转存表中的数据 `fanwe_expression`
--

INSERT INTO `fanwe_expression` (`id`, `title`, `type`, `emotion`, `filename`) VALUES
(19, '傲慢', 'qq', '[傲慢]', 'aoman.gif'),
(20, '白眼', 'qq', '[白眼]', 'baiyan.gif'),
(21, '鄙视', 'qq', '[鄙视]', 'bishi.gif'),
(22, '闭嘴', 'qq', '[闭嘴]', 'bizui.gif'),
(23, '擦汗', 'qq', '[擦汗]', 'cahan.gif'),
(24, '菜刀', 'qq', '[菜刀]', 'caidao.gif'),
(25, '差劲', 'qq', '[差劲]', 'chajin.gif'),
(26, '欢庆', 'qq', '[欢庆]', 'cheer.gif'),
(27, '虫子', 'qq', '[虫子]', 'chong.gif'),
(28, '呲牙', 'qq', '[呲牙]', 'ciya.gif'),
(29, '捶打', 'qq', '[捶打]', 'da.gif'),
(30, '大便', 'qq', '[大便]', 'dabian.gif'),
(31, '大兵', 'qq', '[大兵]', 'dabing.gif'),
(32, '大叫', 'qq', '[大叫]', 'dajiao.gif'),
(33, '大哭', 'qq', '[大哭]', 'daku.gif'),
(34, '蛋糕', 'qq', '[蛋糕]', 'dangao.gif'),
(35, '发怒', 'qq', '[发怒]', 'fanu.gif'),
(36, '刀', 'qq', '[刀]', 'dao.gif'),
(37, '得意', 'qq', '[得意]', 'deyi.gif'),
(38, '凋谢', 'qq', '[凋谢]', 'diaoxie.gif'),
(39, '饿', 'qq', '[饿]', 'er.gif'),
(40, '发呆', 'qq', '[发呆]', 'fadai.gif'),
(41, '发抖', 'qq', '[发抖]', 'fadou.gif'),
(42, '饭', 'qq', '[饭]', 'fan.gif'),
(43, '飞吻', 'qq', '[飞吻]', 'feiwen.gif'),
(44, '奋斗', 'qq', '[奋斗]', 'fendou.gif'),
(45, '尴尬', 'qq', '[尴尬]', 'gangga.gif'),
(46, '给力', 'qq', '[给力]', 'geili.gif'),
(47, '勾引', 'qq', '[勾引]', 'gouyin.gif'),
(48, '鼓掌', 'qq', '[鼓掌]', 'guzhang.gif'),
(49, '哈哈', 'qq', '[哈哈]', 'haha.gif'),
(50, '害羞', 'qq', '[害羞]', 'haixiu.gif'),
(51, '哈欠', 'qq', '[哈欠]', 'haqian.gif'),
(52, '花', 'qq', '[花]', 'hua.gif'),
(53, '坏笑', 'qq', '[坏笑]', 'huaixiao.gif'),
(54, '挥手', 'qq', '[挥手]', 'huishou.gif'),
(55, '回头', 'qq', '[回头]', 'huitou.gif'),
(56, '激动', 'qq', '[激动]', 'jidong.gif'),
(57, '惊恐', 'qq', '[惊恐]', 'jingkong.gif'),
(58, '惊讶', 'qq', '[惊讶]', 'jingya.gif'),
(59, '咖啡', 'qq', '[咖啡]', 'kafei.gif'),
(60, '可爱', 'qq', '[可爱]', 'keai.gif'),
(61, '可怜', 'qq', '[可怜]', 'kelian.gif'),
(62, '磕头', 'qq', '[磕头]', 'ketou.gif'),
(63, '示爱', 'qq', '[示爱]', 'kiss.gif'),
(64, '酷', 'qq', '[酷]', 'ku.gif'),
(65, '难过', 'qq', '[难过]', 'kuaikule.gif'),
(66, '骷髅', 'qq', '[骷髅]', 'kulou.gif'),
(67, '困', 'qq', '[困]', 'kun.gif'),
(68, '篮球', 'qq', '[篮球]', 'lanqiu.gif'),
(69, '冷汗', 'qq', '[冷汗]', 'lenghan.gif'),
(70, '流汗', 'qq', '[流汗]', 'liuhan.gif'),
(71, '流泪', 'qq', '[流泪]', 'liulei.gif'),
(72, '礼物', 'qq', '[礼物]', 'liwu.gif'),
(73, '爱心', 'qq', '[爱心]', 'love.gif'),
(74, '骂人', 'qq', '[骂人]', 'ma.gif'),
(75, '不开心', 'qq', '[不开心]', 'nanguo.gif'),
(76, '不好', 'qq', '[不好]', 'no.gif'),
(77, '很好', 'qq', '[很好]', 'ok.gif'),
(78, '佩服', 'qq', '[佩服]', 'peifu.gif'),
(79, '啤酒', 'qq', '[啤酒]', 'pijiu.gif'),
(80, '乒乓', 'qq', '[乒乓]', 'pingpang.gif'),
(81, '撇嘴', 'qq', '[撇嘴]', 'pizui.gif'),
(82, '强', 'qq', '[强]', 'qiang.gif'),
(83, '亲亲', 'qq', '[亲亲]', 'qinqin.gif'),
(84, '出丑', 'qq', '[出丑]', 'qioudale.gif'),
(85, '足球', 'qq', '[足球]', 'qiu.gif'),
(86, '拳头', 'qq', '[拳头]', 'quantou.gif'),
(87, '弱', 'qq', '[弱]', 'ruo.gif'),
(88, '色', 'qq', '[色]', 'se.gif'),
(89, '闪电', 'qq', '[闪电]', 'shandian.gif'),
(90, '胜利', 'qq', '[胜利]', 'shengli.gif'),
(91, '衰', 'qq', '[衰]', 'shuai.gif'),
(92, '睡觉', 'qq', '[睡觉]', 'shuijiao.gif'),
(93, '太阳', 'qq', '[太阳]', 'taiyang.gif'),
(96, '啊', 'tusiji', '[啊]', 'aa.gif'),
(97, '暗爽', 'tusiji', '[暗爽]', 'anshuang.gif'),
(98, 'byebye', 'tusiji', '[byebye]', 'baibai.gif'),
(99, '不行', 'tusiji', '[不行]', 'buxing.gif'),
(100, '戳眼', 'tusiji', '[戳眼]', 'chuoyan.gif'),
(101, '很得意', 'tusiji', '[很得意]', 'deyi.gif'),
(102, '顶', 'tusiji', '[顶]', 'ding.gif'),
(103, '抖抖', 'tusiji', '[抖抖]', 'douxiong.gif'),
(104, '哼', 'tusiji', '[哼]', 'heng.gif'),
(105, '挥汗', 'tusiji', '[挥汗]', 'huihan.gif'),
(106, '昏迷', 'tusiji', '[昏迷]', 'hunmi.gif'),
(107, '互拍', 'tusiji', '[互拍]', 'hupai.gif'),
(108, '瞌睡', 'tusiji', '[瞌睡]', 'keshui.gif'),
(109, '笼子', 'tusiji', '[笼子]', 'longzi.gif'),
(110, '听歌', 'tusiji', '[听歌]', 'music.gif'),
(111, '奶瓶', 'tusiji', '[奶瓶]', 'naiping.gif'),
(112, '扭背', 'tusiji', '[扭背]', 'niubei.gif'),
(113, '拍砖', 'tusiji', '[拍砖]', 'paizhuan.gif'),
(114, '飘过', 'tusiji', '[飘过]', 'piaoguo.gif'),
(115, '揉脸', 'tusiji', '[揉脸]', 'roulian.gif'),
(116, '闪闪', 'tusiji', '[闪闪]', 'shanshan.gif'),
(117, '生日', 'tusiji', '[生日]', 'shengri.gif'),
(118, '摊手', 'tusiji', '[摊手]', 'tanshou.gif'),
(119, '躺坐', 'tusiji', '[躺坐]', 'tanzuo.gif'),
(120, '歪头', 'tusiji', '[歪头]', 'waitou.gif'),
(121, '我踢', 'tusiji', '[我踢]', 'woti.gif'),
(122, '无聊', 'tusiji', '[无聊]', 'wuliao.gif'),
(123, '醒醒', 'tusiji', '[醒醒]', 'xingxing.gif'),
(124, '睡了', 'tusiji', '[睡了]', 'xixishui.gif'),
(125, '旋转', 'tusiji', '[旋转]', 'xuanzhuan.gif'),
(126, '摇晃', 'tusiji', '[摇晃]', 'yaohuang.gif'),
(127, '耶', 'tusiji', '[耶]', 'yeah.gif'),
(128, '郁闷', 'tusiji', '[郁闷]', 'yumen.gif'),
(129, '晕厥', 'tusiji', '[晕厥]', 'yunjue.gif'),
(130, '砸', 'tusiji', '[砸]', 'za.gif'),
(131, '震荡', 'tusiji', '[震荡]', 'zhendang.gif'),
(132, '撞墙', 'tusiji', '[撞墙]', 'zhuangqiang.gif'),
(133, '转头', 'tusiji', '[转头]', 'zhuantou.gif'),
(134, '抓墙', 'tusiji', '[抓墙]', 'zhuaqiang.gif');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_faq`
--

CREATE TABLE IF NOT EXISTS `fanwe_faq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group` varchar(255) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sort` (`sort`),
  KEY `group` (`group`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `fanwe_faq`
--

INSERT INTO `fanwe_faq` (`id`, `group`, `question`, `answer`, `sort`) VALUES
(1, '基本问题', '这是什么站?', '我们是一个让你可以发起和支持创意项目的平台。如果你有一个创意的想法(新颖的产品?独立电影?)，我们欢迎你到我们的平台上发起项目，向公众推广，并得到资金的支持去完成你的想法。如果你喜欢创意，我们欢迎你来到我们平台，浏览各种有趣的项目，并力所能及支持他们。', 1),
(2, '基本问题', '什么样的项目适合我们的平台?', '我们欢迎一切有创意的想法，欢迎艺术家，电影工作者，音乐家，产品设计师，作家，画家，表演者，DJ等等来我们平台推广他们的创意。但是，我们的平台不适用于慈善项目或是创业投资项目。如果你不确定你的想法是否适合我们的平台，欢迎你直接与我们联系。', 2),
(3, '基本问题', '这种模式有非法集资的风险吗?', '不会，因为我们要求项目不能够以股权或是资金作为对支持者的回报。项目发起人更不能向支持者许诺任何资金上的收益。项目的回报必须是以实物（如产品，出版物），或者媒体内容（如提供视频或者音乐的流媒体播放或者下载）。我们平台项目接受支持，不能够以股权或者债券的形式。支持者对一个项目的支持属于购买行为，而不是投资行为。', 3),
(4, '基本问题', '这个平台接受慈善项目类的提案么?', '我们不接受慈善类项目。作为个人，我们支持社会公益慈善事业，但是我们平台不是支持此类项目的平台。我们所接受的是商业类，有销售购买行为的设计或者文创类的项目。项目发起人需要给支持以实物或者媒体内容类的回报。', 4),
(5, '项目发起人相关问题', '是否会要求产品或作品的知识产权?', '不会。我们只是提供一个宣传和支持的平台，知识产权由项目发起人所有。', 5),
(6, '项目发起人相关问题', '什么人可以发起项目?', '目前任何在两岸三地(中国大陆，台湾，港澳)的有创意的人都可以发起项目。你可以是一个从事创意行业的自由职业者，也可以是公司职员。只要你有个点子，我们都希望收到你的项目提案。', 6),
(7, '项目发起人相关问题', '我怎么发起项目呢?', '请到我们的网站并注册用户后，在我们网站上提交所需要的基本项目信息，包括项目的内容，目前进行的阶段等等。我们会有专人跟进，与你联系。', 7),
(8, '项目发起人相关问题', '我想发起项目，但是我担心我的知识产权被人抄袭?', '作为项目发起人，你可以选择公布更多的信息。知识产权敏感的信息，你可以选择不公开。同时，我们平台是一个面对公众的平台。你所提供的信息越丰富，越翔实，就越容易打动和说服别人的支持。', 8),
(9, '项目发起人相关问题', '项目目标金额是否有上下限制?', '我们对目标金额的下限是1000元人民币。原则上没有上限。但是资金的要求越高，成功的概率就越低。目前常见的目标金额从几千到几万不等。', 9),
(10, '项目发起人相关问题', '没有达到目标金额，是否就不能得到支持?', '是的。如果在项目截至日期到达时，没有达到预期，那么已经收到的资金会退还给支持者。这么做的原因是为了给支持者提供风险保护。只有当项目有足够多的人支持足够多的资金时，他们的支持才生效。', 10),
(11, '项目发起人相关问题', '我的项目成功了，然后呢?', '我们会分两次把资金打入你所提供的银行账户。两次汇款的时间和金额因项目而异，在项目上线之前，由我们平台与项目发起人确定。在资金的支持下，你就可以开始进行你的项目，给你的支持者以邮件或者其他形式的更新，并如期实现你承诺的回报。', 11),
(12, '项目发起人相关问题', '如何设定项目截止日期?', '一般来说，时间设置在一个月或以内比较合适。数据显示，绝大部分的支持发生在项目上线开始和结束前的一个星期中。', 12),
(13, '项目发起人相关问题', '收到的金额能够超过预设的目标?', '可以。在截至日期之前，项目可以一直接受资金支持。', 13),
(14, '项目发起人相关问题', '大家支持的动机是什么?', '大家对项目支持的动机是多样的。有些是因为项目发起者提供了有吸引力的回报，特别是产品设计类的项目。有些是因为认可这个项目，希望它能够实现。有些是因为认可项目的发起人，希望助他一臂之力。', 14),
(15, '项目发起人相关问题', '什么样的回报比较合适?', '回报因项目而异。可以是实物，比如如果是电影项目，可以提供成片后的DVD;如果是产品设计，可以提供产品;其他还有如明信片，T恤，出版物。也可以是非实物，比如鸣谢，与项目发起人共进晚餐，影片首映的门票等。我们欢迎项目发起人展开想象，设计出各式各样的回报。', 15),
(16, '项目发起人相关问题', '如何能够吸引更多的人来支持我的项目?', '对此，我们会另外详细介绍。简短来说，有以下要点\r\n- 拍摄一个有趣，吸引人的视频。讲述这个项目背后的故事。\r\n- 提供有吸引力，物有所值的回报。\r\n- 项目刚上线时，要发动你的亲朋好友来支持你。让你的项目有一个基本的人气。\r\n- 充分运用微博，人人等社交网站来推广。\r\n- 在项目上线期间，经常性的在你的项目页上提供项目的更新，与支持者，询问者的互动。\r\n- 项目宣传视频是必须的么?\r\n宣传视频是项目页上的重要内容。是公众了解你和你的项目的第一步。一个好的宣传视频，能够比文字和图片起到更好的宣传效果。基于这个原因，我们要求每个项目都提供一个视频。有必要的话，我们平台可以提供视频拍摄的支持。', 16),
(17, '项目发起人相关问题', '项目宣传视频有什么要求?', '我们要求宣传视频在两分钟之内。内容上，强烈建议包括以下内容\r\n发起人姓名\r\n项目简短描述(特别说明其吸引人的地方)，目前进展\r\n为什么需要支持\r\n谢谢大家', 17),
(18, '项目支持者相关问题', '如果项目没有达到目标金额，我支持的资金会还给我么?', '是的。如果项目在截止日期没有达到目标，你所支持的金额会返还给你。', 18),
(19, '项目支持者相关问题', '如何支持一个项目?', '每个项目页的右侧有可选择的支持额度和相应的回报介绍。想支持的话，选择你想支持的金额，鼠标点击绿色的按钮，即可。你可以选择支付宝或者财付通来完成付款。', 19),
(20, '项目支持者相关问题', '如何保证项目发起人能够实现他们的承诺呢?', '很多项目本身存在着风险，比如产品设计和纪录片的拍摄。有可能存在项目发起人无法完成其许诺的情况。项目支持者一方面要了解创意项目本身是有风险的，另一方面，我们要求项目发起人提供联系方式，并且鼓励有意支持者直接联系他们，在与项目发起人的沟通和互动中对项目的价值，风险，项目发起人的执行力等等有所判断。', 20);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_fetch_topic`
--

CREATE TABLE IF NOT EXISTS `fanwe_fetch_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `show_name` varchar(255) NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `config` text NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `fanwe_fetch_topic`
--

INSERT INTO `fanwe_fetch_topic` (`id`, `name`, `show_name`, `class_name`, `icon`, `config`, `is_effect`, `sort`) VALUES
(1, '方维oso内部数据分享接口', '站内分享', 'Fanwe', './public/attachment/201202/16/10/4f3c6b5d33633.gif', 'N;', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_filter`
--

CREATE TABLE IF NOT EXISTS `fanwe_filter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `filter_name_idx` (`name`),
  KEY `filter_group_id` (`filter_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- 转存表中的数据 `fanwe_filter`
--

INSERT INTO `fanwe_filter` (`id`, `name`, `filter_group_id`) VALUES
(19, '纯绵', 7),
(20, '大码', 8),
(21, '中码', 8),
(22, '均码', 8),
(23, '红色', 9),
(24, '常规毛线', 7),
(25, '小码', 8),
(26, '黑色', 9),
(27, '羽绒', 7),
(28, '洋紫', 9),
(29, '玫红', 9),
(30, '北极蓝', 9),
(31, '尼绒', 7),
(32, '驼色', 9),
(33, '翡翠绿', 9),
(34, '黑白格', 9),
(35, '红黑格', 9),
(36, '紫色', 9),
(37, '超大码', 8);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_filter_group`
--

CREATE TABLE IF NOT EXISTS `fanwe_filter_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `cate_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `is_effect` tinyint(1) NOT NULL COMMENT '是否生效用于检索分组显示于分类页',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `fanwe_filter_group`
--

INSERT INTO `fanwe_filter_group` (`id`, `name`, `cate_id`, `sort`, `is_effect`) VALUES
(7, '面料', 24, 1, 1),
(8, '尺码', 24, 2, 1),
(9, '颜色', 24, 3, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_flower_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_flower_log` (
  `user_id` int(11) NOT NULL,
  `type` enum('good_count','bad_count') NOT NULL COMMENT 'good_count表示鲜花',
  `rec_id` int(11) NOT NULL,
  `rec_module` enum('image','dp') NOT NULL,
  `memo` varchar(20) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`rec_id`,`rec_module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_free_delivery`
--

CREATE TABLE IF NOT EXISTS `fanwe_free_delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_id` int(11) NOT NULL,
  `deal_id` int(11) NOT NULL,
  `free_count` int(11) NOT NULL COMMENT '免运费的件数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_goods_type`
--

CREATE TABLE IF NOT EXISTS `fanwe_goods_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `fanwe_goods_type`
--

INSERT INTO `fanwe_goods_type` (`id`, `name`) VALUES
(8, '服装');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_goods_type_attr`
--

CREATE TABLE IF NOT EXISTS `fanwe_goods_type_attr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `input_type` tinyint(1) NOT NULL,
  `preset_value` text NOT NULL,
  `goods_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `fanwe_goods_type_attr`
--

INSERT INTO `fanwe_goods_type_attr` (`id`, `name`, `input_type`, `preset_value`, `goods_type_id`) VALUES
(12, '颜色', 0, '', 8),
(13, '尺码', 0, '', 8);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_help`
--

CREATE TABLE IF NOT EXISTS `fanwe_help` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `is_fix` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=41 ;

--
-- 转存表中的数据 `fanwe_help`
--

INSERT INTO `fanwe_help` (`id`, `title`, `content`, `type`, `url`, `is_fix`, `sort`) VALUES
(1, '服务协议', '<p class="MsoNormal"><b><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;color:red;">【首部及</span></b><b><span style="font-family:宋体;mso-bidi-font-family:宋体;color:red;">导</span></b><b><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MSmincho&quot;;color:red;">言】</span><span lang="EN-US" style="color:red;"><o :p></o :p></span></b></p>\r\n<p class="MsoNormal"><span style="font-family:宋体;mso-bidi-font-family:宋体;">欢</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">迎用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">使用小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网的服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">！小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网（网址</span><span lang="EN-US">:http://www.tinyyu.com</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">）是武</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">汉</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">兆余科技有限公司旗下</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">经营</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的网站。</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">为</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">使用小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网的服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">，用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户应</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">当</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">阅读</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">并遵守《小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务协议</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">》（以下</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">简</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">称“本</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">协议</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">”）。在用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">使用小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网提供的服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">之前，</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">请务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">必</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">认</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">真</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">阅读</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">本</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">协议</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的全部内容。本</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">协议</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">一</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">经</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">点</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">击</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">确</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">认</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">并同意接受，即在用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">与兆余科技之</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">间产</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">生法律效力。</span><span lang="EN-US"><o :p></o :p></span></p>\r\n<p class="MsoNormal"><b><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;color:red;">一、协议范围</span><span lang="EN-US" style="color:red;"><o :p></o :p></span></b></p>\r\n<p class="MsoNormal"><span lang="EN-US">1.1</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">本</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">协议</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">双方</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">为</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">武</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">汉</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">兆余科技有限公司（</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">简</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">称“兆余科技”或“小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网”）与小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">项</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">目</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">发</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">起人或</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">项</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">目支持者（</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">简</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">称“用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">”）。</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网所提供的服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">包含网站体</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">验</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">和使用、小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">互</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">联</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网消息</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">传递</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">以及小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网提供的与小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网网站有关的任何其他特色功能、内容或</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">应</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">用程序</span><span lang="EN-US">(</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">合称</span><span lang="EN-US">"</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span lang="EN-US">")</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">。</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">1.2</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">所有小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网已</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">经发</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">布的或将来</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">发</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">布的各</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">类规则</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">或者</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">规</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">范，作</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">为</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">本</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">协议</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">不可分割的一部分，与本</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">协议</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">具有同等的法律效力。</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">1.3</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网有</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">权</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">根据需要适</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">时</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">修</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">订</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">本</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">协议</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">及各</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">类规则</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">，并在网站上公示。</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">变</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">更后的</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">协议</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">和</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">规则</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">一</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">经</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">在小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网站上公示，即</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">发</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">生法律效力。</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">1.4</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网未行使或</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">执</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">行本使用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">协议设</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">定、</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">赋</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">予的任何</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">权</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">利，不构成</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">对该</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">等</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">权</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">利的放弃。</span><span lang="EN-US"><o :p></o :p></span></p>\r\n<p class="MsoNormal"><b><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;color:red;">二、本服务使用方式</span><span lang="EN-US" style="color:red;"><o :p></o :p></span></b></p>\r\n<p class="MsoNormal"><span lang="EN-US">2.1</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">如果用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">自愿成</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">为</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网成</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">员</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">并与其他成</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">员</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">交流</span><span lang="EN-US">(</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">包括通</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">过</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网网站直接</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">联</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">系或通</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">过</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网各种服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">而</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">连</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">接到的成</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">员</span><span lang="EN-US">)</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">，以及使用小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网网站及其各种附加服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">，</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">请务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">必</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">认</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">真</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">阅读</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">本</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">协议</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">并在注册</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">过</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">程中表明同意接受本</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">协议</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">。本</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">协议</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的内容包含小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网关于接受小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">和在小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网网站上</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">发</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">布内容的</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">规</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">定、用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">使用小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">所享有的</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">权</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">利、承担的</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">义务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">和</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">对</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">使用小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">所受的限制、以及小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网的</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">隐</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">私条款。</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">如用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户对</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">本</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">协议</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">有任何疑</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">问</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">，</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">应</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">立即咨</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">询</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">。本</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">协议</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">生效后，用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">不</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">应</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">以未</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">阅读</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">或不接受本</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">协议</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的内容</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">为</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">由，主</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">张</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">本</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">协议</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">无效或要求撤</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">销</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">本</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">协议</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">。</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">2.2</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">如果用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户选择</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">使用某些小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">，可能会收到要求其下</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">载软</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">件或内容的通知，和</span><span lang="EN-US">/</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">或要求用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">同意附加条款和条件的通知。除非用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户选择</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">使用的小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">相关的附加条款和条件另有</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">规</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">定，附加的条款和条件都</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">应</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">被包含于本</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">协议</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">中。</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">2.3</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户应该</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">按照本</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">协议约</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">定行使</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">权</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">利并履行</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">义务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">。如用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">不能接受本</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">协议</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">约</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">定，包括但不限于不能接受修</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">订</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">后的</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">协议</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">及各</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">类规则</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">，</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">则</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户应</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">立即停止使用小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">针对项</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">目</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">发</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">起人提供的服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">。</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">同</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">时</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">，用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户还应</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">当</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">删</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">除个人档案并注</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">销</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">成</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">员资</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">格。</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">如用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户继续</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">使用小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">针对项</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">目</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">发</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">起人提供的服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">，</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">则</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">表示用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">同意并接受本</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">协议</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">及各</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">类规则</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">约</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">束。</span><span lang="EN-US"><o :p></o :p></span></p>\r\n<p class="MsoNormal"><b><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;color:red;">三、法律监管</span><span lang="EN-US" style="color:red;"><o :p></o :p></span></b></p>\r\n<p class="MsoNormal"><span lang="EN-US">3.1</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">本</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">协议</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">以及用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">与小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网之</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">间</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的关系，均受到中</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">华</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">人民共和国法律管</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">辖</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">。</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">3.2</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">当使用小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务时</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">，用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">同意遵守中</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">华</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">人民共和国</span><span lang="EN-US">(</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">下称</span><span lang="EN-US">"</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">中国</span><span lang="EN-US">")</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">的相关法律法</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">规</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">，包括但不限于《中</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">华</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">人民共和国</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">宪</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">法》、《中</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">华</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">人民共和国合同法》、《中</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">华</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">人民共和国</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">电</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">信条例》、《互</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">联</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网信息服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">管理</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">办</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">法》、《互</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">联</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">电</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">子公告服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">管理</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">规</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">定》、《中</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">华</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">人民共和国保守国家秘密法》、《全国人民代表大会常</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">委</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">员</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">会关于</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">维护</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">互</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">联</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网安全的决定》、《中</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">华</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">人民共和国</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">计</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">算机信息系</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">统</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">安全保</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">护</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">条例》、《</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">计</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">算机信息网</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">络</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">国</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">际联</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网安全保</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">护</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">管理</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">办</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">法》、《中</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">华</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">人民共和国</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">著作</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">权</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">法》及其</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">实</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">施条例、《互</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">联</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网著作</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">权</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">行政保</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">护办</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">法》等。用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">只有在同意遵守所有相关法律法</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">规</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">和本</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">协议时</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">，才有</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">权</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">使用小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span lang="EN-US">(</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">无</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">论</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">是否有意</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">访问</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">或使用此服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span lang="EN-US">)</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">。</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">3.3</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">与小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网就服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">本身、本</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">协议</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">或其它有关事</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">项发</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">生的争</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">议</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">，</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">应</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">通</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">过</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">友好</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">协</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">商解决。</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">协</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">商不成的，</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">应</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">向武</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">汉</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">市高新区人民法院提起</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">诉讼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">。</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">3.4</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">本使用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">协议</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">中的任何条款因与中</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">华</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">人民共和国法律相抵触而无效，并不影响其它条款的效力。</span><span lang="EN-US"><o :p></o :p></span></p>\r\n<p class="MsoNormal"><b><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;color:red;">四、用户权利和义务</span><span lang="EN-US" style="color:red;"><o :p></o :p></span></b></p>\r\n<p class="MsoNormal"><span lang="EN-US">4.1 </span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">必</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">须</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">遵守《小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">项</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">目</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">发</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">起</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">规</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">范》。</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">4.2</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">不得</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">对</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的任何部分或全部以及通</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">过</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网取得的任何形式的信息，</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">进</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">行复制、拷</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">贝</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">、出售、</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">转</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">售或用于任何其它商</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">业</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">目的。</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">4.3</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户发</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">起的</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">项</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">目不</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">应</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">与第三方存在任何</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">权</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">利</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">纠纷</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">，否</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">则</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">因此</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">导</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">致的一切</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">损</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">失（包括小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网因此被第三方</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">权</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">利追索而遭受的一切</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">损</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">失）由用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">本人承担，与小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网无关。</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">4.4 </span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">本网站不</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">负责监</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">督</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">项</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">目的</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">实现</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">与</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">严</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">格</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">执</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">行。用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">可授</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">权</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">本网站、其工作人</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">员</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">、</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">职员</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">、代理人及</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">对损</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">失索</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">赔权</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">继</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">任者所有已知或未知、公开或秘密的解决争</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">议</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的方法和服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">。</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">4.5</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">加入小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网免</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">费</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">，但是</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">负责</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">使用某些收</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">费</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务产</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">生的所有</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">费</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">用和</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">税款。</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">4.6</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">项</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">目</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">发</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">起人在小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">发</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">起的</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">项</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">目，由小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网作</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">为</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">代收款方，收取</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">项</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">目支持者基于</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">项</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">目支持明</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">细单</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">而支付的众筹金</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">额</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">。</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">该项</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">目</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">应</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">明确具体的开始</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">时间</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">和</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">结</span><span style="font-fa', '', '', 1, 2);
INSERT INTO `fanwe_help` (`id`, `title`, `content`, `type`, `url`, `is_fix`, `sort`) VALUES
(2, '隐私策略', '<p class="MsoNormal"><b><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">一、</span></b><b><span style="font-family:宋体;mso-bidi-font-family:宋体;">隐</span></b><b><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">私</span></b><b><span style="font-family:宋体;mso-bidi-font-family:宋体;">权</span></b><b><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">政策适用范</span></b><b><span style="font-family:宋体;mso-bidi-font-family:宋体;">围</span><span lang="EN-US"><o :p></o :p></span></b></p>\r\n<p class="MsoNormal"><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">包括小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网如何收集、</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">处</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">理、保</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">护</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">：</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">(1)</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">在登</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">录</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">本网站和服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">器</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">时</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">留下的个人身份信息</span><span lang="EN-US">;</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">(2)</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">通</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">过</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">本网站和服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">器与其他用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">或非用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">之</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">间传</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">送的各种</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">资讯</span><span lang="EN-US">;</span><span lang="EN-US"><o :p></o :p></span></p>\r\n<p class="MsoNormal"><span lang="EN-US">(3)</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网与商</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">业</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">伙伴共享的其他用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">或非用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的各种信息。</span></p>\r\n<p class="MsoNormal"><b><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">二、用户信息跟踪和使用权</span><span lang="EN-US"><o :p></o :p></span></b></p>\r\n<p class="MsoNormal"><span lang="EN-US">2.1</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">提供的信息和</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">资讯</span></p>\r\n<p class="MsoNormal"><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">在用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">登</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">记</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">注册小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">帐户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">，或使用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">该帐户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">，或参加其他小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网及与之相关需要注册的服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">或推广活</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">动时</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">，小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网会要求用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">提供个人信息</span><span lang="EN-US">(</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">包括但不限于用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">电</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">子</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">邮</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">件地址、</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">帐户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">密</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">码</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">以及昵称等</span><span lang="EN-US">)</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">。</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">这</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">些信息会以加密方式保存在安全的服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">器上。小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网会将从用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">帐户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">下采集的个人信息和</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">资讯</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">与其他从小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">中或从第三方</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">获</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">得的信息和</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">资讯进</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">行整合，以便向用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">提供更好的用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">体</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">验</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">和改善小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网的服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务质</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">量。在某些服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">中，小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">会</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">给</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">予提示，由用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户亲</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">自决定是否参与上述信息和</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">资讯</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的整合。</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">2.2</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">饼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">干</span><span lang="EN-US">(cookie)</span></p>\r\n<p class="MsoNormal"><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">当用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户访问</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">时</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">，小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网会向用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">电脑发</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">送一个或多个</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">饼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">干</span><span lang="EN-US">(cookie) - </span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">包含有一串字符的小文件</span><span lang="EN-US"> - </span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">它能</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">够对</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">浏览</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">器</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">进</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">行辨</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">识</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">。小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网通</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">过饼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">干技</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">术</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">来</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">记录</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的使用偏好和</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">习惯</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">并跟踪用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户倾</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">向</span><span lang="EN-US">(</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">诸</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">如用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">常用的搜索方式等</span><span lang="EN-US">)</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">，以具有</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">针对</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">性的改善小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网的服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务质</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">量。大多数</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">浏览</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">器都能在默</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">认设</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">置的状</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">态</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">下接受</span><span lang="EN-US">cookie</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">，但是用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">也可以重新</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">设</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">置</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">浏览</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">器来拒</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">绝</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">所有</span><span lang="EN-US">cookie</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">，或者</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">让浏览</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">器在是否接受</span><span lang="EN-US">cookie</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">时进</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">行提示。需要注意的是，</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">如果用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">将</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">浏览</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">器</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">设</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">置</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">为</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">拒</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">绝</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">接受</span><span lang="EN-US">cookie</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">，</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">则</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">一些小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网的特色功能或服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">可能会无法正常运行。小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网允</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">许</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">那些在小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网网</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">页</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">上</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">发</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">布广告的公司在用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户电脑</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">上</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">设</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">定或取用</span><span lang="EN-US">Cookie</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">。</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">2.3</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">日志</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">资讯</span></p>\r\n<p class="MsoNormal"><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">当用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">使用小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网的服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务时</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">，小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网的主机会自</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">动记录</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">浏览</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">器在</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">访问</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网站</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">时</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">所</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">发</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">送的信息和</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">资讯</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">。主机日志</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">资讯</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">包括但不限于用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的网路</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">请</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">求、</span><span lang="EN-US">IP</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">地址、</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">浏览</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">器</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">类</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">型、</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">浏览</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">器使用的</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">语</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">言、</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">请</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">求的日期和</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">时间</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">，以及一个或多个可以</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">对</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">浏览</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">器</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">进</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">行辨</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">识</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的</span><span lang="EN-US">cookie</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">。</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">2.4</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">交流</span></p>\r\n<p class="MsoNormal"><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">当用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">与小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网通</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">过电</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">子</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">邮</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">件或其他方式</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">进</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">行交流</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">时</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">，小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网可能会</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">记录这</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">些交流内容用以</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">处</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">理用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">问题</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">以及改善小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网的服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">。</span></p>\r\n<p class="MsoNormal"><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">仅对</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">本</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">隐</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">私</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">权</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">政策和</span><span lang="EN-US">/</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">或具体服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">隐</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">私声明中允</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">许</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的目的而</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">对</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的个人信息和</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">资讯进</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">行</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">处</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">理。除上述已列明部分外，</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">这</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">些目的</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">还</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">包括：向用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">提供</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">产</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">品或服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">，包括列明定制的内容和广告</span><span lang="EN-US">;</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">审计</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">、</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">调</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">研和分析，以</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">维</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">持、保</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">护</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">和改善小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网的服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span lang="EN-US">;</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">确保网站的技</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">术</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">运作</span><span lang="EN-US">;</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">开</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">发</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">新服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span lang="EN-US">;</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">以及其他小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网运</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">营</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">所需要的目的。</span></p>\r\n<p class="MsoNormal"><b><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">三、用户信息公开与保密条款</span><span lang="EN-US"><o :p></o :p></span></b></p>\r\n<p class="MsoNormal"><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网不会将用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的个人信息和</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">资讯</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">故意透露、出租或出售</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">给</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">任何第三方。但以下情况除外：</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">(1)</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">本人同意与第三方共享信息和</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">资讯</span><span lang="EN-US">;</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">(2)</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">只有透露用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的个人信息和</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">资讯</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">，才能提供用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">所要求的某种</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">产</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">品和服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span lang="EN-US">;</span></p>\r\n<p class="MsoNormal"><span lang="EN-US">(3)</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">应</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">代表小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网提供</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">产</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">品或服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的主体的要求提供</span><span lang="EN-US">(</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">除非小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网另行通知，否</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">则该</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">等主体无</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">权</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">将相关用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">个人信息和</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">资讯</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">用于提供</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">产</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">品和服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">之外的其他用途</span><span lang="EN-US">)</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">：根据法律法</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">规</span> <span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">　或行政命令的要求提供</span><span lang="EN-US">;</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">因外部</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">审计</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">需要而提供</span><span lang="EN-US">;</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户违</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">反了小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">条款或任何其他</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">产</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">品及服</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">务</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的使用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">规</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">定</span><span lang="EN-US">;</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">经</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">评</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">估，用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">帐户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">存在</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">风险</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">，需要加以</span> <span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">保</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">护</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">。</span><span lang="EN-US"><br />\r\n<!--[if !supportLineBreakNewLine]--><br />\r\n<!--[endif]--></span></p>\r\n<p class="MsoNormal"><b><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">四、您有编辑和删除个人帐户资料的权限，但删除后小鱼网仍可保留您的信息</span><span lang="EN-US"><o :p></o :p></span></b></p>\r\n<p class="MsoNormal"><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">有</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">权</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">在任何</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">时</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">候</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">编辑</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">在小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网的</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">帐户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">信息和</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">资讯</span><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">，用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">也可以填写相关申</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">请</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">表格，要求</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">删</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">除个人</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">帐户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">，但是用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">无条件同意在用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">的</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">帐户删</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">除后，</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">该帐户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">内及与</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">该帐户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">相关的信息和</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">资讯</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">仍然保留在小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网档案</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">记录</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">中，除上述第三条</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">规</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">定的情况外，小</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">鱼</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">网将</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">为</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">用</span><span style="font-family:宋体;mso-bidi-font-family:宋体;">户</span><span style="font-family:&quot;MSmincho&quot;;mso-bidi-font-family:&quot;MS Mincho&quot;">保密。</span></p>\r\n<p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:0pt;text-indent:150pt;text-align:justify;" align="left"></p>\r\n<p class="MsoNormal"><b><span style="font-family:&quot;MSmincho&quot;;mso-ascii-font-family:calibri;mso-ascii-theme-font:minor-latin;mso-fareast-font-family:&quot;MSmincho&quot;;mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:calibri;mso-hansi-theme-font:minor-latin;">五、小鱼网会不时对隐私权政策进行修改。如有修改，小鱼网会在修改后及时公告相关修改内容及新规定，以便用户知悉和使用。</span></b><b><span lang="EN-US"><o :p></o :p></span></b></p>\r\n', 'privacy', '', 1, 3);
INSERT INTO `fanwe_help` (`id`, `title`, `content`, `type`, `url`, `is_fix`, `sort`) VALUES
(8, '团队介绍', '<style type="text/css">.center_div {width:70%;margin:0 auto;} .name{text-align:center} .intro {margin-left:170px}</style><div class="center_div"><p><span lang="EN-US" style="font-size:10pt;line-height:115%;font-family:simhei, serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><o :p=""><span style="font-family:宋体;line-height:15.3333320617676px;"><img src="./public/attachment/images/201501/28/01/54c7cd067f73a.jpg" width="130" height="156" align="left" alt="" border="0" /><br />\r\n</span></o></span></p>\r\n<p><span lang="EN-US" style="font-size:10pt;line-height:115%;font-family:simhei, serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><o :p=""><span style="font-family:宋体;line-height:15.3333320617676px;"><br />\r\n</span></o></span></p>\r\n<p class="name"><span lang="EN-US" style="font-size:10pt;line-height:115%;font-family:simhei, serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><o :p=""><b style="font-family:''sans serif'', tahoma, verdana, helvetica;font-size:12px;line-height:18px;"><span style="font-size:10pt;line-height:15.3333320617676px;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">余婷</span></b><b style="font-family:''sans serif'', tahoma, verdana, helvetica;font-size:12px;line-height:18px;"><span lang="EN-US" style="font-size:10pt;line-height:15.3333320617676px;font-family:simhei, serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">(CEO</span></b><b style="font-family:''sans serif'', tahoma, verdana, helvetica;font-size:12px;line-height:18px;"><span style="font-size:10pt;line-height:15.3333320617676px;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">兼</span></b><b style="font-family:''sans serif'', tahoma, verdana, helvetica;font-size:12px;line-height:18px;"><span lang="EN-US" style="font-size:10pt;line-height:15.3333320617676px;font-family:simhei, serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">CFO</span></b><b style="font-family:''sans serif'', tahoma, verdana, helvetica;font-size:12px;line-height:18px;"><span style="font-size:10pt;line-height:15.3333320617676px;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">）</span></b></o></span></p>\r\n<p><span lang="EN-US" style="font-size:10pt;line-height:115%;font-family:simhei, serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><o :p=""><span style="font-family:宋体;line-height:15.3333320617676px;"><br />\r\n</span></o></span></p>\r\n<p class="intro"><span lang="EN-US" style="font-size:10pt;line-height:115%;font-family:simhei, serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><o :p=""><span style="font-family:宋体;line-height:15.3333320617676px;">法国里昂公立第二大学经济定量研究和经济决策分析学硕士，里昂网站群联合创始人。其创业项目曾入围“春晖杯”海外留学人员创业大赛，</span></o></span><span style="font-family:宋体;font-size:13px;line-height:15.3333320617676px;">曾系统研究过项目评估，</span><span style="font-family:宋体;line-height:15.3333320617676px;font-size:10pt;">资产评估以及风险评估在互联网时代的发展。首次提出青年大学生经济学概念。</span></p>\r\n</div>\r\n<div class="center_div"><p class="MsoNormal"><b><span style="font-size:10pt;line-height:115%;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><br />\r\n</span></b></p>\r\n<p class="MsoNormal"><b><span style="font-size:10pt;line-height:115%;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><br />\r\n</span></b></p>\r\n<p class="MsoNormal"><b><span style="font-size:10pt;line-height:115%;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><br />\r\n</span></b></p>\r\n<p class="MsoNormal"><b><span style="font-size:10pt;line-height:115%;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><br />\r\n</span></b></p>\r\n<p class="name"><b><span style="font-size:10pt;line-height:115%;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">陈旻溦（</span></b><b><span lang="EN-US" style="font-size:10pt;line-height:115%;font-family:simhei, serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">CTO</span></b><b><span style="font-size:10pt;line-height:115%;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">）</span></b><b><span lang="EN-US" style="font-size:10pt;line-height:115%;font-family:simhei, serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><o :p=""></o></span></b></p>\r\n<p class="MsoNormal"><span lang="EN-US" style="font-size:10pt;line-height:115%;font-family:simhei, serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><o :p="">&nbsp;</o></span></p>\r\n<div><span style="color:#404040;font-size:10pt;line-height:15.3333320617676px;font-family:宋体;background-image:initial;background-repeat:initial;">资深程序员，现任法国巴黎某资产管理机构外聘</span><span style="color:#404040;font-size:10pt;line-height:15.3333320617676px;font-family:simhei, serif;background-image:initial;background-repeat:initial;" lang="EN-US">FO/MO</span><span style="color:#404040;font-size:10pt;line-height:15.3333320617676px;font-family:宋体;background-image:initial;background-repeat:initial;">系统项目<wbr>工程师，</span><span style="color:#404040;font-size:10pt;line-height:15.3333320617676px;font-family:宋体;background-image:initial;background-repeat:initial;">曾就职于中国电信集团公司、法国里昂</span><span style="color:#404040;font-size:10pt;line-height:15.3333320617676px;font-family:simhei, serif;background-image:initial;background-repeat:initial;" lang="EN-US">ARWEN</span><span style="color:#404040;font-size:10pt;line-height:15.3333320617676px;font-family:宋体;background-image:initial;background-repeat:initial;">科技公司<wbr>和法国国家科学研究中心</span><span style="color:#404040;font-size:10pt;line-height:15.3333320617676px;font-family:宋体;background-image:initial;background-repeat:initial;">。曾就读于瑞士洛桑联邦理工学院，<wbr>获法国国立应用科学院通讯服务系工程师学位、<wbr>法国国立应用科学院及法国里昂第一大学计算机系硕士学位，<wbr>持有甲骨文数据库中级认证、</span><span style="color:#404040;font-size:10pt;line-height:15.3333320617676px;font-family:simhei, serif;background-image:initial;background-repeat:initial;" lang="EN-US">JAVA</span><span style="color:#404040;font-size:10pt;line-height:15.3333320617676px;font-family:宋体;background-image:initial;background-repeat:initial;">中级程序员认证和思科网络工<wbr>程师认证。</span></div>\r\n<p class="MsoNormal"><span style="font-size:10pt;line-height:115%;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><br />\r\n</span></p>\r\n<p class="MsoNormal"><span style="font-size:10pt;line-height:115%;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><br />\r\n</span></p>\r\n</div>\r\n<div class="center_div"><p class="MsoNormal"><img src="./public/attachment/images/201501/28/01/54c7ce09308b5.png" width="130" height="156" align="left" alt="" border="0" /><br />\r\n</p>\r\n<p class="MsoNormal"><br />\r\n</p>\r\n<p class="name"><b><span style="font-size:10pt;line-height:15.3333320617676px;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">吳至潔（</span></b><b><span lang="EN-US" style="font-size:10pt;line-height:15.3333320617676px;font-family:simhei, serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">CAO</span></b><b><span style="font-size:10pt;line-height:15.3333320617676px;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">）</span></b><span lang="EN-US" style="font-size:10pt;line-height:15.3333320617676px;font-family:simhei, serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">&nbsp;&nbsp;</span><span style="font-size:9px;line-height:13.8000001907349px;font-family:宋体;color:red !important;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><a href="http://www.wuchihchieh.weebly.com/" target="_blank" style="color:red;">博客</a></span></p>\r\n<p class="MsoNormal"><br />\r\n</p>\r\n<p class="MsoNormal intro"><span lang="EN-US" style="font-size:10pt;line-height:115%;font-family:simhei, serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">les 21</span><span style="font-size:10pt;line-height:115%;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">生活美学工作室负责人，毕业于国立台湾艺术大学。目前在法国研究织品设计以及女艺相关工艺，亦涉猎摄影、录像、空间装置等美学领域，可独立完成平面美术设计、展览策划，以及视觉指导等与美化生活相关的项目。</span><span style="font-size:10pt;line-height:115%;font-family:simhei, serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"> <span lang="EN-US"><o :p=""></o></span></span></p>\r\n<p class="MsoNormal"><span style="font-size:10pt;line-height:115%;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><br />\r\n</span></p>\r\n<p class="MsoNormal"><span style="font-size:10pt;line-height:115%;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><br />\r\n</span></p>\r\n<p class="MsoNormal"><span style="font-size:10pt;line-height:115%;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><br />\r\n</span></p>\r\n</div>\r\n<div class="center_div"><p class="name"><b><span style="font-size:10pt;line-height:115%;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">冯为喆</span></b><b><span lang="EN-US" style="font-size:10pt;line-height:115%;font-family:simhei, serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">(CBO</span></b><b><span style="font-size:10pt;line-height:115%;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">）</span></b><b><span lang="EN-US" style="font-size:10pt;line-height:115%;font-family:simhei, serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><o :p=""></o></span></b></p>\r\n<p class="MsoNormal"><span lang="EN-US" style="font-size:10pt;line-height:115%;font-family:simhei, serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><o :p="">&nbsp;</o></span></p>\r\n<p class="MsoNormal"><span style="font-size:10pt;line-height:115%;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">法国三马影视工作室创始人。曾就读于里昂电影学院，可承担剧本编辑，场景布置，影视导演以及影片剪辑等工作。其个人影视作品集《没有颜色的梦》融合了留学生活与艺术，曾为国内多个电视台提供素材源。</span><span lang="EN-US" style="font-size:10pt;line-height:115%;font-family:simhei, serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><o :p=""></o></span></p>\r\n<p class="MsoNormal"><span lang="EN-US" style="font-size:10pt;line-height:115%;font-family:simhei, serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><o :p="">&nbsp;</o></span></p>\r\n<p class="MsoNormal"><span lang="EN-US" style="font-size:10pt;line-height:115%;font-family:simhei, serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><o :p=""><br />\r\n</o></span></p>\r\n</div>\r\n<div class="center_div"><p class="MsoNormal"></p>\r\n<p><span lang="EN-US" style="font-size:10pt;line-height:115%;font-family:simhei, serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><o :p="">&nbsp;</o></span></p>\r\n<p><br />\r\n</p>\r\n<span lang="EN-US" style="font-size:10pt;line-height:115%;font-family:simhei, serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><o :p=""><img src="./public/attachment/images/201501/28/01/54c7ce17a0ce8.png" width="130" height="156" align="left" alt="" border="0" /></o></span><p></p>\r\n<p class="MsoNormal"><span style="font-size:10pt;line-height:115%;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><b style="font-family:''sans serif'', tahoma, verdana, helvetica;font-size:12px;line-height:18px;"><span style="font-size:10pt;line-height:15.3333320617676px;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><br />\r\n</span></b></span></p>\r\n<p class="MsoNormal"><span style="font-size:10pt;line-height:115%;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><b style="font-family:''sans serif'', tahoma, verdana, helvetica;font-size:12px;line-height:18px;"><span style="font-size:10pt;line-height:15.3333320617676px;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><br />\r\n</span></b></span></p>\r\n<p class="name"><span style="font-size:10pt;line-height:115%;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><b style="font-family:''sans serif'', tahoma, verdana, helvetica;font-size:12px;line-height:18px;"><span style="font-size:10pt;line-height:15.3333320617676px;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">蔡伟</span></b><b style="font-family:''sans serif'', tahoma, verdana, helvetica;font-size:12px;line-height:18px;"><span lang="EN-US" style="font-size:10pt;line-height:15.3333320617676px;font-family:simhei, serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">(CSO)</span></b></span></p>\r\n<p class="MsoNormal"><span style="font-size:10pt;line-height:115%;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><br />\r\n</span></p>\r\n<p class="MsoNormal"><span style="font-size:10pt;line-height:115%;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><br />\r\n</span></p>\r\n<p class="MsoNormal intro"><span style="font-size:10pt;line-height:115%;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">公派法国工科博士生。</span></p>\r\n</div>\r\n', 'about', '', 1, 1),
(4, '关于众筹', '众筹，译自国外crowdfunding，即大众筹资或群众筹资。现代众筹指通过互联网方式发布筹款项目并募集资金。筹款项目成功后，项目发起人将会给予支持者对等的回报。回报方式可以是实物，也可以是服务。<br />\r\n<p><br />\r\n</p>\r\n<p><br />\r\n</p>\r\n<b><span style="font-size:18px;">关于小鱼网众筹</span></b><br />\r\n<br />\r\n小鱼网平台面向的是在校大学生、硕士生、博士生、海外留学生以及社会大众。这是一个活泼而且富有创造力的广大群体，通过小鱼网，他们可以把所学的知识和自己的想法转化为实实在在的产品，让梦想变为现实。<br />\r\n<br />\r\n平台配有专项商业顾问，可以在各个领域为项目发起人和项目投资者提供最详尽的咨询服务。一个有潜力的创业项目，甚至可以被推荐至大鱼网平台进行股权众筹。<br />\r\n<p><br />\r\n</p>\r\n<p><br />\r\n</p>\r\n<b><span style="font-size:18px;">众筹规则</span></b><br />\r\n<br />\r\n筹资，筹资项目必须在发起人预设的时间内达到或超过目标金额才算成功。<br />\r\n<br />\r\n未达成，没有达到目标的项目，持款项将全额退回给所有支持者。<br />\r\n<br />\r\n达成，支持者将得到项目发起者预先承诺的回报。', '', '', 0, 1),
(9, '新手指南', '<div class="dislocation"><div class="switch_nav">  <ul>    <li id="lancerS" class="current"><a>发起者</a></li>\r\n    <li id="supporterS"><a>支持者</a></li>\r\n  </ul>\r\n</div>\r\n<br />\r\n  <div id="HGcontainers">    <div id="lancerC" class="HGcontainer">      <div class="process">        <img src="./public/attachment/201501/09/04/54aeefa0d516c.png" />        <span>发起者通过小鱼网发出项目发起申请，进入初步项目审核阶段。</span>      </div>\r\n      <br />\r\n      <div class="process">        <img src="./public/attachment/201501/08/01/54ad6b0fc97bf.png" />        <span>项目团队与您进行访谈，确认本次项目的目的与想要达到的效果。确认需求之后，项目团队会协助您进行项目包装，包括照片与视频拍摄、创意行销点找寻、营销推广策划、文字编辑、媒体资源整合等。</span>      </div>\r\n       <br />\r\n      <div class="process">        <img src="./public/attachment/201501/08/01/54ad6b235608c.png" />        <span>项目发布之后，推广团队会根据推广策划方案进行推广。除了网上众筹资金之外，财务团队也会在此时接触资金机构方，接洽资金进入的可行性。</span>      </div>\r\n       <br />\r\n      <div class="process">        <img src="./public/attachment/201501/08/01/54ad6b9f1d69b.png" />        <span>筹资成功后，辅导团队会协助您撰写计划书，以获得更多资金方进入。筹资不成功，辅导团队也会协助您进行二次众筹。同时在必要的情况下，创业团队会协助您做好创业准备，包括：注册公司、商标设计与品牌推广、经营计划拟定、法律服务。</span>      </div>\r\n       <br />\r\n      <div class="process">        <img src="./public/attachment/201501/08/01/54ad6bff6be80.png" />        <span>项目达成，实现对支持者的回报。若为公司孵化，推广团队会协助您参与我们定期举办的创业交流圈，与创业圈中的其它同业以及资金机构进行交流，累积自己创业人脉。</span>      </div>\r\n    </div>\r\n    <div id="supporterC" class="hidden HGcontainer">      <div class="process">        <img src="./public/attachment/201501/08/01/54ad6ddfb9a89.png" />        <span>在小鱼网平台上进行项目浏览，可按照不同领域进行筛选。</span>      </div>\r\n      <br />\r\n      <div class="process">        <img src="./public/attachment/201501/08/01/54ad6e7f79ba1.png" />        <span>对感兴趣项目进行持续关注，可查看详情后续。</span>      </div>\r\n      <br />\r\n      <div class="process">        <img src="./public/attachment/201501/08/01/54ad6e8c1aeeb.png" />        <span>确定事发后愿意支持该项目以及支持的金额与回报。在线完成付款，并填写项目达成收货人信息和收件地址后点击确定。        </span>      </div>\r\n      <br />\r\n      <div class="process">        <img src="./public/attachment/201501/08/01/54ad6e9780e60.png" />        <span>项目达成，项目发起者实现回报。</span>      </div>\r\n    </div>\r\n  </div>\r\n</div>\r\n', '', '', 0, 1),
(3, '联系我们', '客服电话：027-59812238<br />\r\n<br />\r\n工作时间：周一至周五 9:30－18:00<br />\r\n<br />\r\n客服邮箱：<a href="mailto:zhongchoukf@tinyyu.com">zhongchoukf@tinyyu.com</a><br />\r\n<br />\r\n合作邮箱：<a href="mailto:hezuo@tinyyu.com">hezuo@tinyyu.com</a><br />\r\n<br />\r\n公司地址：武汉东湖新技术开发区999号', '', '', 0, 3),
(11, '用户注册协议', '<div class="layout960"><p><strong>一、接受条款</strong></p>\r\n<p>我们所提供的服务包含我们平台网站体验和使用、我们平台互联网消息传递服务以及我们平台提供的与我们平台网站有关的任何其他特色功能、内容或应用程序(合称"我们平台服务")。无论用户是以"访客"(表示用户只是浏览我们平台网站)还是"成员"(表示用户已在我们平台注册并登录)的身份使用我们平台服务，均表示该用户同意遵守本使用协议。</p>\r\n<p>如果用户自愿成为我们平台成员并与其他成员交流(包括通过我们平台网站直接联系或通过我们平台各种服务而连接到的成员)，以及使用我们平台网站及其各种附加服务，请务必认真阅读本协议并在注册过程中表明同意接受本协议。本协议的内容包含我们平台关于接受我们平台服务和在我们平台网站上发布内容的规定、用户使用我们平台服务所享有的权利、承担的义务和对使用我们平台服务所受的限制、以及我们平台的隐私条款。如果用户选择使用某些我们平台服务，可能会收到要求其下载软件或内容的通知，和/或要求用户同意附加条款和条件的通知。除非用户选择使用的我们平台服务相关的附加条款和条件另有规定，附加的条款和条件都应被包含于本协议中。</p>\r\n<p>我们平台有权随时修改本协议文本中的任何条款。一旦我们平台对本协议进行修改,我们平台将会以公告形式发布通知。任何该等修改自发布之日起生效。如果用户在该等修改发布后继续使用我们平台服务，则表示该用户同意遵守对本协议所作出的该等修改。因此，请用户务必定期查阅本协议，以确保了解所有关于本协议的最新修改。如果用户不同意我们平台对本协议进行的修改，请用户离开我们平台网站并立即停止使用我们平台服务。同时，用户还应当删除个人档案并注销成员资格。</p>\r\n<p><strong>二、遵守法律</strong></p>\r\n<p>当使用我们平台服务时，用户同意遵守中华人民共和国(下称"中国")的相关法律法规，包括但不限于《中华人民共和国宪法》、《中华人民共和国合同法》、《中华人民共和国电信条例》、《互联网信息服务管理办法》、《互联网电子公告服务管理规定》、《中华人民共和国保守国家秘密法》、《全国人民代表大会常务委员会关于维护互联网安全的决定》、《中华人民共和国计算机信息系统安全保护条例》、《计算机信息网络国际联网安全保护管理办法》、《中华人民共和国著作权法》及其实施条例、《互联网著作权行政保护办法》等。用户只有在同意遵守所有相关法律法规和本协议时，才有权使用我们平台服务(无论用户是否有意访问或使用此服务)。请用户仔细阅读本协议并将其妥善保存。</p>\r\n<p><strong>三、用户帐号、密码及安全</strong></p>\r\n<p>用户应提供及时、详尽、准确的个人资料，并不断及时更新注册时提供的个人资料，保持其详尽、准确。所有用户输入的资料将引用为注册资料。我们平台不对因用户提交的注册信息不真实或未及时准确变更信息而引起的问题、争议及其后果承担责任。</p>\r\n<p>用户不应将其帐号、密码转让、出借或告知他人，供他人使用。如用户发现帐号遭他人非法使用，应立即通知我们平台。因黑客行为或用户的保管疏忽导致帐号、密码遭他人非法使用的，我们平台不承担任何责任。</p>\r\n<p><strong>四、隐私权政策</strong></p>\r\n<p>用户提供的注册信息及我们平台保留的用户所有资料将受到中国相关法律法规和我们平台《隐私权政策》的规范。《隐私权政策》构成本协议不可分割的一部分。</p>\r\n<p><strong>五、上传内容</strong></p>\r\n<p>用户通过任何我们平台提供的服务上传、张贴、发送(通过电子邮件或任何其它方式传送)的文本、文件、图像、照片、视频、声音、音乐、其他创作作品或任何其他材料(以下简称"内容"，包括用户个人的或个人创作的照片、声音、视频等)，无论系公开还是私下传播，均由用户和内容提供者承担责任，我们平台不对该等内容的正确性、完整性或品质作出任何保证。用户在使用我们平台服务时，可能会接触到令人不快、不适当或令人厌恶之内容，用户需在接受服务前自行做出判断。在任何情况下，我们平台均不为任何内容负责(包括但不限于任何内容的错误、遗漏、不准确或不真实)，亦不对通过我们平台服务上传、张贴、发送(通过电子邮件或任何其它方式传送)的内容衍生的任何损失或损害负责。我们平台在管理过程中发现或接到举报并进行初步调查后，有权依法停止任何前述内容的传播并采取进一步行动，包括但不限于暂停某些用户使用我们平台的全部或部分服务，保存有关记录，并向有关机关报告。</p>\r\n<p><strong>六、用户行为</strong></p>\r\n<p>用户在使用我们平台服务时，必须遵守中华人民共和国相关法律法规的规定，用户保证不会利用我们平台服务进行任何违法或不正当的活动，包括但不限于下列行为∶</p>\r\n<p>上传、展示、张贴或以其它方式传播含有下列内容之一的信息：</p>\r\n<p>反对宪法及其他法律的基本原则的;</p>\r\n<p>危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的;</p>\r\n<p>损害国家荣誉和利益的;</p>\r\n<p>煽动民族仇恨、民族歧视、破坏民族团结的;</p>\r\n<p>破坏国家宗教政策，宣扬邪教和封建迷信的;</p>\r\n<p>散布谣言，扰乱社会秩序，破坏社会稳定的;</p>\r\n<p>散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的;</p>\r\n<p>侮辱或者诽谤他人，侵害他人合法权利的;</p>\r\n<p>含有虚假、有害、胁迫、侵害他人隐私、骚扰、中伤、粗俗、猥亵、或其它道德上令人反感的内容;</p>\r\n<p>含有中国法律、法规、规章、条例以及任何具有法律效力的规范所限制或禁止的其它内容的;</p>\r\n<p>不得为任何非法目的而使用网络服务系统;</p>\r\n<p>用户同时保证不会利用我们平台服务从事以下活动：</p>\r\n<p>未经允许，进入计算机信息网络或者使用计算机信息网络资源的;</p>\r\n<p>未经允许，对计算机信息网络功能进行删除、修改或者增加的;</p>\r\n<p>未经允许，对进入计算机信息网络中存储、处理或者传输的数据和应用程序进行删除、修改或者增加的;故意制作、传播计算机病毒等破坏性程序的;</p>\r\n<p>其他危害计算机信息网络安全的行为。</p>\r\n<p>如用户在使用网络服务时违反任何上述规定，我们平台或经其授权者有权要求该用户改正或直接采取一切必要措施(包括但不限于更改、删除相关内容、暂停或终止相关用户使用我们平台服务)以减轻和消除该用户不当行为造成的影响。</p>\r\n<p>用户不得对我们平台服务的任何部分或全部以及通过我们平台取得的任何形式的信息，进行复制、拷贝、出售、转售或用于任何其它商业目的。</p>\r\n<p>用户须对自己在使用我们平台服务过程中的行为承担法律责任。用户承担法律责任的形式包括但不限于：停止侵害行为，向受到侵害者公开赔礼道歉，恢复受到侵害这的名誉，对受到侵害者进行赔偿。如果我们平台网站因某用户的非法或不当行为受到行政处罚或承担了任何形式的侵权损害赔偿责任，该用户应向我们平台进行赔偿(不低于我们平台向第三方赔偿的金额)并通过全国性的媒体向我们平台公开赔礼道歉。</p>\r\n<p><strong>七、知识产权和其他合法权益(包括但不限于名誉权、商誉等)</strong></p>\r\n<p>我们平台并不对用户发布到我们平台服务中的文本、文件、图像、照片、视频、声音、音乐、其他创作作品或任何其他材料(前文称为"内容")拥有任何所有权。在用户将内容发布到我们平台服务中后，用户将继续对内容享有权利，并且有权选择恰当的方式使用该等内容。如果用户在我们平台服务中或通过我们平台服务展示或发表任何内容，即表明该用户就此授予我们平台一个有限的许可以使我们平台能够合法使用、修改、复制、传播和出版此类内容。</p>\r\n<p>用户同意其已就在我们平台服务所发布的内容，授予我们平台可以免费的、永久有效的、不可撤销的、非独家的、可转授权的、在全球范围内对所发布内容进行使用、复制、修改、改写、改编、发行、翻译、创造衍生性著作的权利，及/或可以将前述部分或全部内容加以传播、表演、展示，及/或可以将前述部分或全部内容放入任何现在已知和未来开发出的以任何形式、媒体或科技承载的著作当中。</p>\r\n<p>用户声明并保证：用户对其在我们平台服务中或通过我们平台服务发布的内容拥有合法权利;用户在我们平台服务中或通过我们平台服务发布的内容不侵犯任何人的肖像权、隐私权、著作权、商标权、专利权、及其它合同权利。如因用户在我们平台服务中或通过我们平台服务发布的内容而需向其他任何人支付许可费或其它费用，全部由该用户承担。</p>\r\n<p>我们平台服务中包含我们平台提供的内容，包含用户和其他我们平台许可方的内容(下称"我们平台的内容")。我们平台的内容受《中华人民共和国著作权法》、《中华人民共和国商标法》、《中华人民共和国专利法》、《中华人民共和国反不正当竞争法》和其他相关法律法规的保护，我们平台拥有并保持对我们平台的内容和我们平台服务的所有权利。</p>\r\n<p><strong>八、国际使用之特别警告</strong></p>\r\n<p>用户已了解国际互联网的无国界性，同意遵守所有关于网上行为、内容的法律法规。用户特别同意遵守有关从中国或用户所在国家或地区输出信息所可能涉及、适用的全部法律法规。</p>\r\n<p><strong>九、赔偿</strong></p>\r\n<p>由于用户通过我们平台服务上传、张贴、发送或传播的内容，或因用户与本服务连线，或因用户违反本使用协议，或因用户侵害他人任何权利而导致任何第三人向我们平台提出赔偿请求，该用户同意赔偿我们平台及其股东、子公司、关联企业、代理人、品牌共有人或其它合作伙伴相应的赔偿金额(包括我们平台支付的律师费等)，以使我们平台的利益免受损害。</p>\r\n<p><strong>十、关于使用及储存的一般措施</strong></p>\r\n<p>用户承认我们平台有权制定关于服务使用的一般措施及限制，包括但不限于我们平台服务将保留用户的电子邮件信息、用户所张贴内容或其它上载内容的最长保留期间、用户一个帐号可收发信息的最大数量、用户帐号当中可收发的单个信息的大小、我们平台服务器为用户分配的最大磁盘空间，以及一定期间内用户使用我们平台服务的次数上限(及每次使用时间之上限)。通过我们平台服务存储或传送的任何信息、通讯资料和其它任何内容，如被删除或未予储存，用户同意我们平台毋须承担任何责任。用户亦同意，超过一年未使用的帐号，我们平台有权关闭。我们平台有权依其自行判断和决定，随时变更相关一般措施及限制。</p>\r\n<p><strong>十一、服务的修改</strong></p>\r\n<p>用户了解并同意，无论通知与否，我们平台有权于任何时间暂时或永久修改或终止部分或全部我们平台服务，对此，我们平台对用户和任何第三人均无需承担任何责任。用户同意，所有上传、张贴、发送到我们平台的内容，我们平台均无保存义务，用户应自行备份。我们平台不对任何内容丢失以及用户因此而遭受的相关损失承担责任。</p>\r\n<p><strong>十二、终止服务</strong></p>\r\n<p>用户同意我们平台可单方面判断并决定，如果用户违反本使用协议或用户长时间未能使用其帐号，我们平台可以终止该用户的密码、帐号或某些服务的使用，并可将该用户在我们平台服务中留存的任何内容加以移除或删除。我们平台亦可基于自身考虑，在通知或未通知之情形下，随时对该用户终止部分或全部服务。用户了解并同意依本使用协议，无需进行事先通知，我们平台可在发现任何不适宜内容时，立即关闭或删除该用户的帐号及其帐号中所有相关信息及文件，并暂时或永久禁止该用户继续使用前述文件或帐号。</p>\r\n<p><strong>十三、与广告商进行的交易</strong></p>\r\n<p>用户通过我们平台服务与广告商进行任何形式的通讯或商业往来，或参与促销活动(包括相关商品或服务的付款及交付)，以及达成的其它任何条款、条件、保证或声明，完全是用户与广告商之间的行为。除有关法律法规明文规定要求我们平台承担责任外，用户因前述任何交易、沟通等而遭受的任何性质的损失或损害，我们平台均不予负责。</p>\r\n<p><strong>十四、链接</strong></p>\r\n<p>用户了解并同意，对于我们平台服务或第三人提供的其它网站或资源的链接是否可以利用，我们平台不予负责;存在或源于此类网站或资源的任何内容、广告、产品或其它资料，我们平台亦不保证或负责。因使用或信赖任何此类网站或资源发布的或经由此类网站或资源获得的任何商品、服务、信息，如对用户造成任何损害，我们平台不负任何直接或间接责任。</p>\r\n<p><strong>十五、禁止商业行为</strong></p>\r\n<p>用户同意不对我们平台服务的任何部分或全部以及用户通过我们平台的服务取得的任何物品、服务、信息等，进行复制、拷贝、出售、转售或用于任何其它商业目的。</p>\r\n<p><strong>十六、我们平台的专属权利</strong></p>\r\n<p>用户了解并同意，我们平台服务及其所使用的相关软件(以下简称"服务软件")含有受到相关知识产权及其它法律保护的专有保密资料。用户同时了解并同意，经由我们平台服务或广告商向用户呈现的赞助广告或信息所包含之内容，亦可能受到著作权、商标、专利等相关法律的保护。未经我们平台或广告商书面授权，用户不得修改、出售、传播部分或全部服务内容或软件，或加以制作衍生服务或软件。我们平台仅授予用户个人非专属的使用权，用户不得(也不得允许任何第三人)复制、修改、创作衍生著作，或通过进行还原工程、反向组译及其它方式破译原代码。用户也不得以转让、许可、设定任何担保或其它方式移转服务和软件的任何权利。用户同意只能通过由我们平台所提供的界面而非任何其它方式使用我们平台服务。</p>\r\n<p><strong>十七、担保与保证</strong></p>\r\n<p>我们平台使用协议的任何规定均不会免除因我们平台造成用户人身伤害或因故意造成用户财产损失而应承担的任何责任。</p>\r\n<p>用户使用我们平台服务的风险由用户个人承担。我们平台对服务不提供任何明示或默示的担保或保证，包括但不限于商业适售性、特定目的的适用性及未侵害他人权利等的担保或保证。</p>\r\n<p>我们平台亦不保证以下事项：</p>\r\n<p>服务将符合用户的要求;</p>\r\n<p>服务将不受干扰、及时提供、安全可靠或不会出错;</p>\r\n<p>使用服务取得的结果正确可靠;</p>\r\n<p>用户经由我们平台服务购买或取得的任何产品、服务、资讯或其它信息将符合用户的期望，且软件中任何错误都将得到更正。</p>\r\n<p>用户应自行决定使用我们平台服务下载或取得任何资料且自负风险，因任何资料的下载而导致的用户电脑系统损坏或数据流失等后果，由用户自行承担。</p>\r\n<p>用户经由我们平台服务获知的任何建议或信息(无论书面或口头形式)，除非使用协议有明确规定，将不构成我们平台对用户的任何保证。</p>\r\n<p><strong>十八、责任限制</strong></p>\r\n<p>用户明确了解并同意，基于以下原因而造成的任何损失，我们平台均不承担任何直接、间接、附带、特别、衍生性或惩罚性赔偿责任(即使我们平台事先已被告知用户或第三方可能会产生相关损失)：</p>\r\n<p>我们平台服务的使用或无法使用;</p>\r\n<p>通过我们平台服务购买、兑换、交换取得的任何商品、数据、信息、服务、信息，或缔结交易而发生的成本;</p>\r\n<p>用户的传输或数据遭到未获授权的存取或变造;</p>\r\n<p>任何第三方在我们平台服务中所作的声明或行为;</p>\r\n<p>与我们平台服务相关的其它事宜，但本使用协议有明确规定的除外。</p>\r\n<p><strong>十九、一般性条款</strong></p>\r\n<p>本使用协议构成用户与我们平台之间的正式协议，并用于规范用户的使用行为。在用户使用我们平台服务、使用第三方提供的内容或软件时，在遵守本协议的基础上，亦应遵守与该等服务、内容、软件有关附加条款及条件。</p>\r\n<p>本使用协以及用户与我们平台之间的关系，均受到中华人民共和国法律管辖。</p>\r\n<p>用户与我们平台就服务本身、本使用协议或其它有关事项发生的争议，应通过友好协商解决。协商不成的，应向北京市东城区人民法院提起诉讼。</p>\r\n<p>我们平台未行使或执行本使用协议设定、赋予的任何权利，不构成对该等权利的放弃。</p>\r\n<p>本使用协议中的任何条款因与中华人民共和国法律相抵触而无效，并不影响其它条款的效力。</p>\r\n<p>本使用协议的标题仅供方便阅读而设，如与协议内容存在矛盾，以协议内容为准。</p>\r\n<p><strong>二十、举报</strong></p>\r\n<p>如用户发现任何违反本服务条款的情事，请及时通知我们平台。</p>\r\n</div>\r\n', 'term', '', 0, 2);
INSERT INTO `fanwe_help` (`id`, `title`, `content`, `type`, `url`, `is_fix`, `sort`) VALUES
(12, '项目发起规范', '<p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal;"><span style="font-size:10pt;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">小</span><span style="font-size:10pt;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">鱼</span><span style="font-size:10pt;font-family:''ms mincho'';background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">网是中国最大的大学生小</span><span style="font-size:10pt;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">鱼</span><span style="font-size:10pt;font-family:''ms mincho'';background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">网站，帮用</span><span style="font-size:10pt;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">户</span><span style="font-size:10pt;font-family:''ms mincho'';background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">在</span><span style="font-size:10pt;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">规</span><span style="font-size:10pt;font-family:''ms mincho'';background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">定</span><span style="font-size:10pt;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">时间</span><span style="font-size:10pt;font-family:''ms mincho'';background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">内面向：至少</span><span lang="EN-US" style="font-size:10pt;font-family:simhei, serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">500</span><span style="font-size:10pt;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">所以上的高校、国内外的</span><span style="font-size:10pt;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">线</span><span style="font-size:10pt;font-family:''ms mincho'';background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">上</span><span style="font-size:10pt;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">线</span><span style="font-size:10pt;font-family:''ms mincho'';background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">下渠道、多</span><span style="font-size:10pt;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">家国内外大学生媒体和多家投</span><span style="font-size:10pt;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">资</span><span style="font-size:10pt;font-family:''ms mincho'';background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">机构，迅速</span><span style="font-size:10pt;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">积</span><span style="font-size:10pt;font-family:''ms mincho'';background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">累大量以学生互助</span><span style="font-size:10pt;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">为</span><span style="font-size:10pt;font-family:''ms mincho'';background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">目的的支持</span><span style="font-size:10pt;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">！</span><span lang="EN-US" style="font-size:9pt;font-family:tahoma, sans-serif;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal;"><span style="font-size:10pt;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">以下是小鱼网发布项目的基本要求，不合要求的项目，将会被拒绝或删除。若有疑问，可以通过邮件或电话联系小鱼网。</span><span lang="EN-US" style="font-size:10pt;font-family:simhei, serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal;"><span lang="EN-US" style="font-size:9pt;font-family:tahoma, sans-serif;">&nbsp;</span></p>\r\n<p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal;"><span style="font-size:10pt;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">咨询邮箱：</span><span lang="EN-US" style="font-size:10pt;font-family:simhei, serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">contact@tinyyu.com</span><span lang="EN-US" style="font-size:9pt;font-family:tahoma, sans-serif;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal;"><span style="font-size:10pt;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">武汉项目咨询电话：</span><span lang="EN-US" style="font-size:10pt;font-family:simhei, serif;color:red;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">027-59812238</span><span lang="EN-US" style="font-size:9pt;font-family:tahoma, sans-serif;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal;"><span style="font-size:10pt;font-family:宋体;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">附注：某些规范会随着时间而更新或者调整，会导致一些旧项目并不能完全符合最新规范。</span><span lang="EN-US" style="font-size:9pt;font-family:tahoma, sans-serif;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal;"><span lang="EN-US" style="font-size:9pt;font-family:tahoma, sans-serif;"><br />\r\n<!--[if !supportLineBreakNewLine]--><br />\r\n<!--[endif]--></span><span lang="EN-US" style="font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal;"><b><span style="font-size:13.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;color:#ff4343;">一．项目发起人资格</span></b><b><span lang="EN-US" style="font-size:9pt;font-family:tahoma, sans-serif;"><o :p></o :p></span></b></p>\r\n<p class="MsoNormal" style="margin:0cm 0cm 0.0001pt 18pt;text-align:justify;text-indent:-18pt;line-height:normal;vertical-align:baseline;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><!--[if !supportLists]--><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;">1.<span style="font-stretch:normal;font-size:7pt;font-family:''times new roman'';">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style="font-size:10pt;font-family:微软雅黑, sans-serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">作为项目发起人的团体，必须有至少一名成员是在校大学生，并能提供国内外大学的在校证明。作为项目发起人的个人，应为年满</span><span lang="EN-US" style="font-size:10pt;font-family:simhei, serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">18</span><span style="font-size:10pt;font-family:微软雅黑, sans-serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">周岁并具有完全民事行为能力和民事权利能力的自然人。如项目发起人未满</span><span lang="EN-US" style="font-size:10pt;font-family:simhei, serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">18</span><span style="font-size:10pt;font-family:微软雅黑, sans-serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">周岁，请咨询小鱼网工作人员。</span><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin:0cm 0cm 0.0001pt 18pt;text-align:justify;text-indent:-18pt;line-height:normal;vertical-align:baseline;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><!--[if !supportLists]--><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;">2.<span style="font-stretch:normal;font-size:7pt;font-family:''times new roman'';">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style="font-size:10pt;font-family:微软雅黑, sans-serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">作为项目发起人的团体，若为单位，应为依法成立并登记备案的企业法人或其他组织。</span><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin:0cm 0cm 0.0001pt 18pt;text-align:justify;text-indent:-18pt;line-height:normal;vertical-align:baseline;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><!--[if !supportLists]--><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;">3.<span style="font-stretch:normal;font-size:7pt;font-family:''times new roman'';">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style="font-size:10pt;font-family:微软雅黑, sans-serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">中华人民共和国公民，或能提供长期在中国居住证明的非中华人民共和国公民，需要进行必要的身份认证和资质认证，包括但不限于身份证、护照、学历证明等的认证。</span><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin:0cm 0cm 0.0001pt 18pt;text-align:justify;text-indent:-18pt;line-height:normal;vertical-align:baseline;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><!--[if !supportLists]--><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;">4.<span style="font-stretch:normal;font-size:7pt;font-family:''times new roman'';">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style="font-size:10pt;font-family:微软雅黑, sans-serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">拥有在中国大陆地区开户并接收人民币汇款的银行卡或支付宝账户。</span><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin:0cm 0cm 0.0001pt 18pt;text-align:justify;text-indent:-18pt;line-height:normal;vertical-align:baseline;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><!--[if !supportLists]--><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;">5.<span style="font-stretch:normal;font-size:7pt;font-family:''times new roman'';">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style="font-size:10pt;font-family:微软雅黑, sans-serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">已仔细阅读、同意并无条件接受小鱼网网的《服务条款》所涉全部内容。</span><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin:0cm 0cm 0.0001pt 18pt;text-align:justify;text-indent:-18pt;line-height:normal;vertical-align:baseline;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;"><!--[if !supportLists]--><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;">6.<span style="font-stretch:normal;font-size:7pt;font-family:''times new roman'';">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">其他跟项目发布、执行需求、渠道销售相关的必须条件。</span><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal;"><span lang="EN-US" style="font-size:9pt;font-family:tahoma, sans-serif;"><br />\r\n<!--[if !supportLineBreakNewLine]--><br />\r\n<!--[endif]--></span><span lang="EN-US" style="font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;text-align:justify;text-justify:inter-ideograph;line-height:normal;"><b><span style="font-size:13.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;color:#ff4343;">二．项目内容规范</span></b><b><span lang="EN-US" style="font-size:9pt;font-family:tahoma, sans-serif;"><o :p></o :p></span></b></p>\r\n<p class="MsoNormal" style="margin-top:0cm;margin-right:0cm;margin-bottom:0cm;margin-left:18.0pt;margin-bottom:.0001pt;text-indent:-18.0pt;line-height:normal;mso-list:l3 level1 lfo2;tab-stops:list 36.0pt;vertical-align:baseline;"><!--[if !supportLists]--><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;">1.<span style="font-stretch:normal;font-size:7pt;font-family:''times new roman'';">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">根据相关法律法规，产品发布申请提交后，须经过工作人员审核后才能发布。</span><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin-top:0cm;margin-right:0cm;margin-bottom:0cm;margin-left:18.0pt;margin-bottom:.0001pt;text-indent:-18.0pt;line-height:normal;mso-list:l3 level1 lfo2;tab-stops:list 36.0pt;vertical-align:baseline;"><!--[if !supportLists]--><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;">2.<span style="font-stretch:normal;font-size:7pt;font-family:''times new roman'';">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">项目内容框架必须包含</span><span lang="EN-US" style="font-size:10pt;font-family:simhei, serif;">“</span><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">关于我</span><span lang="EN-US" style="font-size:10pt;font-family:simhei, serif;">”</span><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">、</span><span lang="EN-US" style="font-size:10pt;font-family:simhei, serif;">“</span><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">我想要做什么</span><span lang="EN-US" style="font-size:10pt;font-family:simhei, serif;">”</span><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">、</span><span lang="EN-US" style="font-size:10pt;font-family:simhei, serif;">“</span><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">为什么需要你的支持及资金用途</span><span lang="EN-US" style="font-size:10pt;font-family:simhei, serif;">”</span><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">、</span><span lang="EN-US" style="font-size:10pt;font-family:simhei, serif;">“</span><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">我的承诺与回报</span><span lang="EN-US" style="font-size:10pt;font-family:simhei, serif;">”</span><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">、</span><span lang="EN-US" style="font-size:10pt;font-family:simhei, serif;">“</span><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">可能存在的风险</span><span lang="EN-US" style="font-size:10pt;font-family:simhei, serif;">”</span><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">等重要板块，并配合相关图片和视频进行介绍。文字或图片的缺失都极可能导致您的项目被退回。</span><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin-top:0cm;margin-right:0cm;margin-bottom:0cm;margin-left:18.0pt;margin-bottom:.0001pt;text-indent:-18.0pt;line-height:normal;mso-list:l3 level1 lfo2;tab-stops:list 36.0pt;vertical-align:baseline;"><!--[if !supportLists]--><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;">3.<span style="font-stretch:normal;font-size:7pt;font-family:''times new roman'';">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">项目必须为有创意、有想法、有设计感的项目，若项目产品已在电商类网站上有销售，无论在小鱼网上的售价高低，都无法通过审核。</span><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin-top:0cm;margin-right:0cm;margin-bottom:0cm;margin-left:18.0pt;margin-bottom:.0001pt;text-indent:-18.0pt;line-height:normal;mso-list:l3 level1 lfo2;tab-stops:list 36.0pt;vertical-align:baseline;"><!--[if !supportLists]--><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;">4.<span style="font-stretch:normal;font-size:7pt;font-family:''times new roman'';">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style="font-size:10pt;font-family:微软雅黑, sans-serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">小鱼网目前支持科技、音乐、影视、艺术、设计、动漫、出版、公益、公开课、农业十个行业的项目，请关注众筹公告对其他行业开放的公布。</span><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin-top:0cm;margin-right:0cm;margin-bottom:0cm;margin-left:18.0pt;margin-bottom:.0001pt;text-indent:-18.0pt;line-height:normal;mso-list:l3 level1 lfo2;tab-stops:list 36.0pt;vertical-align:baseline;"><!--[if !supportLists]--><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;">5.<span style="font-stretch:normal;font-size:7pt;font-family:''times new roman'';">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">在其他同类网站上正在进行的项目不得在小鱼网上同时发起。</span><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin-top:0cm;margin-right:0cm;margin-bottom:0cm;margin-left:18.0pt;margin-bottom:.0001pt;text-indent:-18.0pt;line-height:normal;mso-list:l3 level1 lfo2;tab-stops:list 36.0pt;vertical-align:baseline;"><!--[if !supportLists]--><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;">6.<span style="font-stretch:normal;font-size:7pt;font-family:''times new roman'';">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">对于开发新硬件或新产品的设计和科技项目，发起人必须在项目页面上展示原型</span><span lang="EN-US" style="font-size:10pt;font-family:simhei, serif;">(3D</span><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">原型或实体模型</span><span lang="EN-US" style="font-size:10pt;font-family:simhei, serif;">)</span><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">和具体执行过相关经验的信息。</span><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin-top:0cm;margin-right:0cm;margin-bottom:0cm;margin-left:18.0pt;margin-bottom:.0001pt;text-indent:-18.0pt;line-height:normal;mso-list:l3 level1 lfo2;tab-stops:list 36.0pt;vertical-align:baseline;"><!--[if !supportLists]--><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;">7.<span style="font-stretch:normal;font-size:7pt;font-family:''times new roman'';">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">点名时间对提交上线审核的产品是否拥有上线资格具有最终决定权。</span><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin-top:0cm;margin-right:0cm;margin-bottom:0cm;margin-left:18.0pt;margin-bottom:.0001pt;text-indent:-18.0pt;line-height:normal;mso-list:l3 level1 lfo2;tab-stops:list 36.0pt;vertical-align:baseline;"><!--[if !supportLists]--><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;">8.<span style="font-stretch:normal;font-size:7pt;font-family:''times new roman'';">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style="font-size:10pt;font-family:微软雅黑, sans-serif;background-image:initial;background-attachment:initial;background-size:initial;background-origin:initial;background-clip:initial;background-position:initial;background-repeat:initial;">用户发起的项目不得包含非法、色情、淫秽、暴力等内容，不得含有攻击性、侮辱性言论，不得含有违反国家法律法规、政策的内容及其他小鱼网认为不适宜的内容。</span><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">包括但不限于下列行为</span><span lang="EN-US" style="font-size:10pt;font-family:宋体;">∶</span><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;"><o :p></o :p></span></p>\r\n<ul type="disc"> <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">上传、展示、张贴或以其它方式传播含有下列内容之一的信息：</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">反对宪法及其他法律的基本原则的</span><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;simhei&quot;,&quot;serif&quot;;mso-fareast-font-family:宋体;mso-bidi-font-family:tahoma;">;</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的</span><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;simhei&quot;,&quot;serif&quot;;mso-fareast-font-family:宋体;mso-bidi-font-family:tahoma;">;</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">损害国家荣誉和利益的</span><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;simhei&quot;,&quot;serif&quot;;mso-fareast-font-family:宋体;mso-bidi-font-family:tahoma;">;</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">煽动民族仇恨、民族歧视、破坏民族团结的</span><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;simhei&quot;,&quot;serif&quot;;mso-fareast-font-family:宋体;mso-bidi-font-family:tahoma;">;</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">破坏国家宗教政策，宣扬邪教和封建迷信的</span><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;simhei&quot;,&quot;serif&quot;;mso-fareast-font-family:宋体;mso-bidi-font-family:tahoma;">;</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">散布谣言，扰乱社会秩序，破坏社会稳定的</span><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;simhei&quot;,&quot;serif&quot;;mso-fareast-font-family:宋体;mso-bidi-font-family:tahoma;">;</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的</span><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;simhei&quot;,&quot;serif&quot;;mso-fareast-font-family:宋体;mso-bidi-font-family:tahoma;">;</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">侮辱或者诽谤他人，侵害他人合法权利的</span><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;simhei&quot;,&quot;serif&quot;;mso-fareast-font-family:宋体;mso-bidi-font-family:tahoma;">;</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">含有虚假、有害、胁迫、侵害他人隐私、骚扰、中伤、粗俗、猥亵、或其它道德上令人反感的内容</span><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;simhei&quot;,&quot;serif&quot;;mso-fareast-font-family:宋体;mso-bidi-font-family:tahoma;">;</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">含有中国法律、法规、规章、条例以及任何具有法律效力的规范所限制或禁止的其它内容的</span><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;simhei&quot;,&quot;serif&quot;;mso-fareast-font-family:宋体;mso-bidi-font-family:tahoma;">;</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n</ul>\r\n<p class="MsoNormal" style="margin-top:0cm;margin-right:22.5pt;margin-bottom:0cm;margin-left:22.5pt;margin-bottom:.0001pt;text-indent:-18.0pt;line-height:normal;mso-list:l5 level1 lfo4;tab-stops:list 36.0pt;vertical-align:baseline;"><!--[if !supportLists]--><span lang="EN-US" style="font-size:10pt;font-family:symbol;">·<span style="font-stretch:normal;font-size:7pt;font-family:''times new roman'';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style="font-size:10pt;font-family:宋体;">不得为任何非法目的而使用网络服务系统</span><span lang="EN-US" style="font-size:10pt;font-family:simhei, serif;">;</span><span lang="EN-US" style="font-size:10pt;font-family:arial, sans-serif;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin:0cm;margin-bottom:.0001pt;text-indent:0cm;line-height:normal;mso-list:l4 level1 lfo5;vertical-align:baseline;"><!--[if !supportLists]--><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;">9.<span style="font-stretch:normal;font-size:7pt;font-family:''times new roman'';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">用户同时保证不会利用小鱼网服务从事以下活动：</span><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;"><o :p></o :p></span></p>\r\n<ul type="disc"> <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">未经允许，进入计算机信息网络或者使用计算机信息网络资源的</span><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;simhei&quot;,&quot;serif&quot;;mso-fareast-font-family:宋体;mso-bidi-font-family:tahoma;">;</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">未经允许，对计算机信息网络功能进行删除、修改或者增加的</span><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;simhei&quot;,&quot;serif&quot;;mso-fareast-font-family:宋体;mso-bidi-font-family:tahoma;">;</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">未经允许，对进入计算机信息网络中存储、处理或者传输的数据和应用程序进行删除、修改或者增加的</span><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;simhei&quot;,&quot;serif&quot;;mso-fareast-font-family:宋体;mso-bidi-font-family:tahoma;">;</span><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">故意制作、传播计算机病毒等破坏性程序的</span><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;simhei&quot;,&quot;serif&quot;;mso-fareast-font-family:宋体;mso-bidi-font-family:tahoma;">;</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">其他危害计算机信息网络安全的行为。</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n</ul>\r\n<p class="MsoNormal" style="margin-top:0cm;margin-right:0cm;margin-bottom:0cm;margin-left:18.0pt;margin-bottom:.0001pt;line-height:normal;"><span style="font-size:10pt;font-family:宋体;">如用户在使用网络服务时违反任何上述规定，小鱼网或经其授权者有权要求该用户改正或直接采取一切必要措施</span><span lang="EN-US" style="font-size:10pt;font-family:simhei, serif;">(</span><span style="font-size:10pt;font-family:宋体;">包括但不限于更改、删除相关内容、暂停或终止相关用户使用小鱼网服务</span><span lang="EN-US" style="font-size:10pt;font-family:simhei, serif;">)</span><span style="font-size:10pt;font-family:宋体;">以减轻和消除该用户不当行为造成的影响。</span><span lang="EN-US" style="font-size:9pt;font-family:tahoma, sans-serif;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin:0cm;margin-bottom:.0001pt;text-indent:0cm;line-height:normal;mso-list:l2 level1 lfo7;vertical-align:baseline;"><!--[if !supportLists]--><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;">10.<span style="font-stretch:normal;font-size:7pt;font-family:''times new roman'';">&nbsp;&nbsp;</span></span><!--[endif]--><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">以下类别的产品或内容将不被允许在此发布或作为给预订用户的附加回报：</span><span lang="EN-US" style="font-size:10pt;font-family:微软雅黑, sans-serif;"><o :p></o :p></span></p>\r\n<ul type="disc"> <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">婴儿用品相关</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">洗浴和美容产品相关</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">保健品、营养补充剂相关</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">医疗器械、安全用品、成人用品相关</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">枪支、武器和刀具相关</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">房地产相关</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">兑奖、彩票和抽奖活动相关</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">竞赛</span><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;simhei&quot;,&quot;serif&quot;;mso-fareast-font-family:宋体;mso-bidi-font-family:tahoma;">(</span><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">为了获得资助而在项目中允诺提供竞赛报名费和奖金等</span><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;simhei&quot;,&quot;serif&quot;;mso-fareast-font-family:宋体;mso-bidi-font-family:tahoma;">)</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">毒品、类似毒品的物质、吸毒用具、烟等相关</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">财政奖励</span><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;simhei&quot;,&quot;serif&quot;;mso-fareast-font-family:宋体;mso-bidi-font-family:tahoma;">(</span><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">所有权、利润份额、还款贷款等</span><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;simhei&quot;,&quot;serif&quot;;mso-fareast-font-family:宋体;mso-bidi-font-family:tahoma;">)</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">多级直销和传销类相关</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">令人反感的内容</span><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;simhei&quot;,&quot;serif&quot;;mso-fareast-font-family:宋体;mso-bidi-font-family:tahoma;">(</span><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">仇恨言论、不适当内容等</span><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;simhei&quot;,&quot;serif&quot;;mso-fareast-font-family:宋体;mso-bidi-font-family:tahoma;">)</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">色情内容相关</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">支持或反对政治党派的项目</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">推广或美化暴力行为的项目</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">非创意类公益项目（如呼吁献血、捐款等）</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">建设网站等</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">涉及宗教类项目</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">调查问卷类项目</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">烟、酒相关</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">饮食类相关</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">令人反感的内容</span><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;simhei&quot;,&quot;serif&quot;;mso-fareast-font-family:宋体;mso-bidi-font-family:tahoma;">(</span><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">仇恨言论、不适当内容等</span><span lang="EN-US" style="font-size:10.0pt;font-family:&quot;simhei&quot;,&quot;serif&quot;;mso-fareast-font-family:宋体;mso-bidi-font-family:tahoma;">)</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">股权、债券、分红、利息等形式的附加回报</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">与首发项目无关的附加回报</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">以其他无可行、不合理的承诺作为附加回报</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">招商加盟类项目</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n <li class="MsoNormal" style="line-height:13.5pt;"><span style="font-size:10.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;">开店（如网店、服装店、小卖部、饭店、旅馆等）</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:宋体;"><o :p></o :p></span></li>\r\n</ul>\r\n<p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;line-height:normal;"><span lang="EN-US" style="font-size:9pt;font-family:tahoma, sans-serif;"><br />\r\n<!--[if !supportLineBreakNewLine]--><br />\r\n<!--[endif]--></span><span lang="EN-US" style="font-size:12.0pt;font-family:宋体;mso-bidi-font-family:宋体;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin-bottom:0cm;margin-bottom:.0001pt;text-align:justify;text-justify:inter-ideograph;line-height:normal;"><b><span style="font-size:13.0pt;font-family:宋体;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;color:#ff4343;">三．项目审核规范</span></b><b><span lang="EN-US" style="font-size:9pt;font-family:tahoma, sans-serif;"><o :p></o :p></span></b></p>\r\n<p class="MsoNormal" style="margin-top:0cm;margin-right:0cm;margin-bottom:0cm;margin-left:18.0pt;margin-bottom:.0001pt;text-indent:-18.0pt;line-height:normal;mso-list:l6 level1 lfo9;tab-stops:list 36.0pt;vertical-align:baseline;"><!--[if !supportLists]--><span lang="EN-US" style="font-size:9pt;font-family:微软雅黑, sans-serif;">1.<span style="font-stretch:normal;font-size:7pt;font-family:''times new roman'';">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">项目发起人必须能在必要时提供跟所发起项目相关的所有证明</span><span lang="EN-US" style="font-size:10pt;font-family:simhei, serif;">, </span><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">证明项目的可行性，以及产品发布团队的执行能力</span><span lang="EN-US" style="font-size:10pt;font-family:simhei, serif;">; </span><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">如授权书、专利证书等。</span><span lang="EN-US" style="font-size:9pt;font-family:微软雅黑, sans-serif;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin-top:0cm;margin-right:0cm;margin-bottom:0cm;margin-left:18.0pt;margin-bottom:.0001pt;text-indent:-18.0pt;line-height:normal;mso-list:l6 level1 lfo9;tab-stops:list 36.0pt;vertical-align:baseline;"><!--[if !supportLists]--><span lang="EN-US" style="font-size:9pt;font-family:微软雅黑, sans-serif;">2.<span style="font-stretch:normal;font-size:7pt;font-family:''times new roman'';">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">项目内容必须完整、合理、具有可执行性；项目发起人须通过项目描述证明自己有完整的计划和执行能力，项目不能侵犯任何第三方权益（图片、视频不能借用或盗用非本人</span><span lang="EN-US" style="font-size:10pt;font-family:simhei, serif;">/</span><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">公司拍摄的内容，产品必须保证原创性）。</span><span lang="EN-US" style="font-size:9pt;font-family:微软雅黑, sans-serif;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin-top:0cm;margin-right:0cm;margin-bottom:0cm;margin-left:18.0pt;margin-bottom:.0001pt;text-indent:-18.0pt;line-height:normal;mso-list:l6 level1 lfo9;tab-stops:list 36.0pt;vertical-align:baseline;"><!--[if !supportLists]--><span lang="EN-US" style="font-size:9pt;font-family:微软雅黑, sans-serif;">3.<span style="font-stretch:normal;font-size:7pt;font-family:''times new roman'';">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">产品发布团队必须有明确的生产计划及售后服务计划，有具体完成时间并能明确执行的才叫</span><span lang="EN-US" style="font-size:10pt;font-family:simhei, serif;">“</span><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">项目</span><span lang="EN-US" style="font-size:10pt;font-family:simhei, serif;">“</span><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">，尚不确定是否会量产的项目、不符合首次发布的标准皆不能上线。</span><span lang="EN-US" style="font-size:9pt;font-family:微软雅黑, sans-serif;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin-top:0cm;margin-right:0cm;margin-bottom:0cm;margin-left:18.0pt;margin-bottom:.0001pt;text-indent:-18.0pt;line-height:normal;mso-list:l6 level1 lfo9;tab-stops:list 36.0pt;vertical-align:baseline;"><!--[if !supportLists]--><span lang="EN-US" style="font-size:9pt;font-family:微软雅黑, sans-serif;">4.<span style="font-stretch:normal;font-size:7pt;font-family:''times new roman'';">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">项目不得用于招聘、招商或任何中介目的，不能用于征集创意想法等不符合众筹规则的目的。</span><span lang="EN-US" style="font-size:9pt;font-family:微软雅黑, sans-serif;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin-top:0cm;margin-right:0cm;margin-bottom:0cm;margin-left:18.0pt;margin-bottom:.0001pt;text-indent:-18.0pt;line-height:normal;mso-list:l6 level1 lfo9;tab-stops:list 36.0pt;vertical-align:baseline;"><!--[if !supportLists]--><span lang="EN-US" style="font-size:9pt;font-family:微软雅黑, sans-serif;">5.<span style="font-stretch:normal;font-size:7pt;font-family:''times new roman'';">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">项目不得以未来收益（利润）作为回报，不得涉及股票、债券、分红等相关承诺。</span><span lang="EN-US" style="font-size:9pt;font-family:微软雅黑, sans-serif;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin-top:0cm;margin-right:0cm;margin-bottom:0cm;margin-left:18.0pt;margin-bottom:.0001pt;text-indent:-18.0pt;line-height:normal;mso-list:l6 level1 lfo9;tab-stops:list 36.0pt;vertical-align:baseline;"><!--[if !supportLists]--><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;微软雅黑&quot;,&quot;sans-serif&quot;;mso-bidi-font-family:微软雅黑;color:red;">6.<span style="font-stretch:normal;font-size:7pt;font-family:''times new roman'';">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style="font-size:10.0pt;font-family:&quot;微软雅黑&quot;,&quot;sans-serif&quot;;mso-ascii-font-family:simhei;mso-hansi-font-family:simhei;mso-bidi-font-family:tahoma;color:red;">个人不得为慈善或其他人筹资。（例如：禁止为红十字会募资，禁止把筹集到的资金或未来利润转用于慈善或某项事业，禁止为自己的亲友或其他新闻人物筹款。）</span><span lang="EN-US" style="font-size:9.0pt;font-family:&quot;微软雅黑&quot;,&quot;sans-serif&quot;;mso-bidi-font-family:tahoma;color:red;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin-top:0cm;margin-right:0cm;margin-bottom:0cm;margin-left:18.0pt;margin-bottom:.0001pt;text-indent:-18.0pt;line-height:normal;mso-list:l6 level1 lfo9;tab-stops:list 36.0pt;vertical-align:baseline;"><!--[if !supportLists]--><span lang="EN-US" style="font-size:9pt;font-family:微软雅黑, sans-serif;">7.<span style="font-stretch:normal;font-size:7pt;font-family:''times new roman'';">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">小鱼网接受创意公益类的项目来帮助更多有需要的人，但不接受以公益为噱头来发起义卖项目的提案。</span><span lang="EN-US" style="font-size:9pt;font-family:微软雅黑, sans-serif;"><o :p></o :p></span></p>\r\n<p class="MsoNormal" style="margin-top:0cm;margin-right:0cm;margin-bottom:0cm;margin-left:18.0pt;margin-bottom:.0001pt;text-indent:-18.0pt;line-height:normal;mso-list:l6 level1 lfo9;tab-stops:list 36.0pt;vertical-align:baseline;"><!--[if !supportLists]--><span lang="EN-US" style="font-size:9pt;font-family:微软雅黑, sans-serif;">8.<span style="font-stretch:normal;font-size:7pt;font-family:''times new roman'';">&nbsp;&nbsp;&nbsp;&nbsp;</span></span><!--[endif]--><span style="font-size:10pt;font-family:微软雅黑, sans-serif;">用户不应抄袭、盗用他人的成果发起众筹项目，创意类产品必须为原创</span><span lang="EN-US" style="font-size:9pt;font-family:微软雅黑, sans-serif;"><o :p></o :p></span></p>\r\n<p dir="ltr" style="line-height:1;margin-top:0pt;margin-bottom:0pt;text-align:center;" id="docs-internal-guid-ecc70dee-cc0d-4e2a-c9a2-85609754f9a7"></p>\r\n<p class="MsoNormal"><span lang="EN-US">&nbsp;</span></p>\r\n', '', '', 0, 2);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_images_group`
--

CREATE TABLE IF NOT EXISTS `fanwe_images_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `fanwe_images_group`
--

INSERT INTO `fanwe_images_group` (`id`, `name`, `sort`) VALUES
(1, '店面', 100),
(2, '内部环境', 100),
(3, '菜式', 100);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_images_group_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_images_group_link` (
  `images_group_id` int(11) NOT NULL COMMENT '商户子类点评评分分组ID fanwe_merchant_type_point_group',
  `category_id` int(11) NOT NULL,
  KEY `images_group_id` (`images_group_id`) USING BTREE,
  KEY `category_id` (`category_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_images_group_link`
--

INSERT INTO `fanwe_images_group_link` (`images_group_id`, `category_id`) VALUES
(2, 11),
(1, 10),
(2, 10),
(1, 9),
(1, 8),
(2, 8),
(3, 8),
(2, 14),
(1, 15),
(2, 16),
(1, 17),
(2, 17);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_index_image`
--

CREATE TABLE IF NOT EXISTS `fanwe_index_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `fanwe_index_image`
--

INSERT INTO `fanwe_index_image` (`id`, `image`, `url`, `sort`, `title`) VALUES
(5, './public/attachment/201211/07/10/5099c97ad9f82.gif', 'http://127.0.0.1/zy3', 1, '兆余大学生'),
(6, './public/attachment/201211/07/10/5099c984946c3.jpg', 'http://www.musikid.com/', 2, '乐童音乐'),
(7, './public/attachment/201410/13/04/543aea83aaf9e.jpg', 'http://www.da-lyon.com/', 3, '大里昂');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `count` int(11) NOT NULL,
  `show_index` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `fanwe_link`
--

INSERT INTO `fanwe_link` (`id`, `name`, `group_id`, `url`, `is_effect`, `sort`, `img`, `description`, `count`, `show_index`) VALUES
(3, 'O2O营销模式', 6, 'http://www.atelier.net/en/blog/2013/04/10/o2o-what-catchphrase-all-about_418633', 1, 1, '', 'O2O营销模式', 0, 1),
(4, '福团网', 6, 'http://www.futuan.com', 1, 2, '', '福团网', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_link_group`
--

CREATE TABLE IF NOT EXISTS `fanwe_link_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '友情链接分组名称',
  `sort` tinyint(1) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `fanwe_link_group`
--

INSERT INTO `fanwe_link_group` (`id`, `name`, `sort`, `is_effect`) VALUES
(6, '友情链接', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_info` text NOT NULL,
  `log_time` int(11) NOT NULL,
  `log_admin` int(11) NOT NULL,
  `log_ip` varchar(255) NOT NULL,
  `log_status` tinyint(1) NOT NULL,
  `module` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=2848 ;

--
-- 转存表中的数据 `fanwe_log`
--

INSERT INTO `fanwe_log` (`id`, `log_info`, `log_time`, `log_admin`, `log_ip`, `log_status`, `module`, `action`) VALUES
(2359, '方维众筹添加成功', 1352227067, 1, '127.0.0.1', 1, 'IndexImage', 'insert'),
(2360, '方维众筹添加成功', 1352227077, 1, '127.0.0.1', 1, 'IndexImage', 'insert'),
(2361, '原创DIY桌面游戏《功夫》《黄金密码》期待您的支持更新成功', 1352229024, 1, '127.0.0.1', 1, 'Deal', 'update'),
(2362, '原创DIY桌面游戏《功夫》《黄金密码》期待您的支持更新成功', 1352229031, 1, '127.0.0.1', 1, 'Deal', 'update'),
(2363, '55_is_recommend启用成功', 1352229046, 1, '127.0.0.1', 1, 'Deal', 'toogle_status'),
(2394, 'admin登录成功', 1364014964, 1, '127.0.0.1', 1, 'Public', 'do_login'),
(2395, 'admin管理员密码错误', 1380612230, 0, '127.0.0.1', 0, 'Public', 'do_login'),
(2396, 'admin管理员密码错误', 1380612242, 0, '127.0.0.1', 0, 'Public', 'do_login'),
(2397, 'admin管理员密码错误', 1380612266, 0, '127.0.0.1', 0, 'Public', 'do_login'),
(2398, 'admin管理员密码错误', 1380612295, 0, '127.0.0.1', 0, 'Public', 'do_login'),
(2399, 'admin管理员密码错误', 1380612429, 0, '127.0.0.1', 0, 'Public', 'do_login'),
(2400, 'admin登录成功', 1380612437, 1, '127.0.0.1', 1, 'Public', 'do_login'),
(2401, '搜虎精品社区彻底删除成功', 1380612460, 1, '127.0.0.1', 1, 'Nav', 'foreverdelete'),
(2402, 'admin更新成功', 1380612524, 1, '127.0.0.1', 1, 'Admin', 'update'),
(2403, 'admin密码修改成功', 1380612579, 1, '127.0.0.1', 1, 'Index', 'do_change_password'),
(2404, 'admin登录成功', 1380612594, 1, '127.0.0.1', 1, 'Public', 'do_login'),
(2405, '极品商业源码彻底删除成功', 1380617731, 1, '127.0.0.1', 1, 'Help', 'foreverdelete'),
(2406, '官方交流论坛彻底删除成功', 1380617733, 1, '127.0.0.1', 1, 'Help', 'foreverdelete'),
(2407, '关于我们更新成功', 1380617750, 1, '127.0.0.1', 1, 'Help', 'update'),
(2408, '更新系统配置', 1380617821, 1, '127.0.0.1', 1, 'Conf', 'update'),
(2409, 'admin登录成功', 1400706021, 1, '115.207.7.32', 1, 'Public', 'do_login'),
(2410, '搜虎精品社区www.souho.net|www.souho.cc提供本程序更新成功', 1400706068, 1, '115.207.7.32', 1, 'IndexImage', 'update'),
(2411, '更多极品商业源码,就在搜虎精品社区VIP服务：vip.souho.cc更新成功', 1400706087, 1, '115.207.7.32', 1, 'IndexImage', 'update'),
(2412, 'admin登录成功', 1402206677, 1, '127.0.0.1', 1, 'Public', 'do_login'),
(2413, '商业源码网测试www.zzcodes.net更新成功', 1402208542, 1, '127.0.0.1', 1, 'IndexImage', 'update'),
(2414, '更多极品商业源码,就在www.zzcodes.net更新成功', 1402208568, 1, '127.0.0.1', 1, 'IndexImage', 'update'),
(2415, '更新系统配置', 1402216524, 1, '127.0.0.1', 1, 'Conf', 'update'),
(2416, 'admin登录成功', 1413116264, 1, '127.0.0.1', 1, 'Public', 'do_login'),
(2417, '更新系统配置', 1413116318, 0, '127.0.0.1', 1, 'Conf', 'update'),
(2418, 'admin登录成功', 1413116327, 1, '127.0.0.1', 1, 'Public', 'do_login'),
(2419, '更新系统配置', 1413116971, 0, '127.0.0.1', 1, 'Conf', 'update'),
(2420, '更新系统配置', 1413117328, 0, '127.0.0.1', 1, 'Conf', 'update'),
(2421, '更新系统配置', 1413118204, 0, '127.0.0.1', 1, 'Conf', 'update'),
(2422, '更新系统配置', 1413118215, 0, '127.0.0.1', 1, 'Conf', 'update'),
(2423, '锦尚中国更新成功', 1413118323, 1, '127.0.0.1', 1, 'IndexImage', 'update'),
(2424, '站长数据更新成功', 1413118355, 1, '127.0.0.1', 1, 'IndexImage', 'update'),
(2425, '大里昂添加成功', 1413118412, 1, '127.0.0.1', 1, 'IndexImage', 'insert'),
(2426, '大里昂更新成功', 1413118469, 1, '127.0.0.1', 1, 'IndexImage', 'update'),
(2427, '流浪猫的家—爱天使公益咖啡馆的重建需要大家的力量！更新成功', 1413118586, 1, '127.0.0.1', 1, 'Deal', 'update'),
(2428, 'admin登录成功', 1413120420, 1, '127.0.0.1', 1, 'Public', 'do_login'),
(2429, '流浪猫的家—爱天使公益咖啡馆的重建需要大家的力量！更新成功', 1413120458, 1, '127.0.0.1', 1, 'Deal', 'update'),
(2430, '短片电影《Blind Love》更新成功', 1413120479, 1, '127.0.0.1', 1, 'Deal', 'update'),
(2431, '短片电影《Blind Love》更新成功', 1413120498, 1, '127.0.0.1', 1, 'Deal', 'update'),
(2432, '原创DIY桌面游戏《功夫》《黄金密码》期待您的支持更新成功', 1413120518, 1, '127.0.0.1', 1, 'Deal', 'update'),
(2433, '原创DIY桌面游戏《功夫》《黄金密码》期待您的支持更新成功', 1413120536, 1, '127.0.0.1', 1, 'Deal', 'update'),
(2434, '流浪猫的家—爱天使公益咖啡馆的重建需要大家的力量！更新成功', 1413120661, 1, '127.0.0.1', 1, 'Deal', 'update'),
(2435, 'admin登录成功', 1413195328, 1, '127.0.0.1', 1, 'Public', 'do_login'),
(2436, '支付宝即时到帐支付安装成功', 1414651290, 1, '127.0.0.1', 1, 'Payment', 'insert'),
(2437, '财付通直连支付安装成功', 1414651309, 1, '127.0.0.1', 1, 'Payment', 'insert'),
(2438, '财付通支付安装成功', 1414651315, 1, '127.0.0.1', 1, 'Payment', 'insert'),
(2439, 'admin登录成功', 1414673075, 1, '127.0.0.1', 1, 'Public', 'do_login'),
(2440, 'admin登录成功', 1415542597, 1, '127.0.0.1', 1, 'Public', 'do_login'),
(2441, '更新成功', 1415543335, 1, '127.0.0.1', 1, 'IndexImage', 'update'),
(2442, '测试添加成功', 1415545412, 1, '127.0.0.1', 1, 'DealCate', 'insert'),
(2443, '更新成功', 1415545437, 1, '127.0.0.1', 1, 'IndexImage', 'update'),
(2444, '更新成功', 1415548477, 1, '127.0.0.1', 1, 'IndexImage', 'update'),
(2445, '更新成功', 1415548852, 1, '127.0.0.1', 1, 'IndexImage', 'update'),
(2446, '更新成功', 1415548996, 1, '127.0.0.1', 1, 'IndexImage', 'update'),
(2447, '测试2添加成功', 1415549157, 1, '127.0.0.1', 1, 'DealCate', 'insert'),
(2448, '更新成功', 1415549203, 1, '127.0.0.1', 1, 'IndexImage', 'update'),
(2449, '更新成功', 1415549264, 1, '127.0.0.1', 1, 'IndexImage', 'update'),
(2450, '更新成功', 1415549296, 1, '127.0.0.1', 1, 'IndexImage', 'update'),
(2451, '测试3添加成功', 1415549879, 1, '127.0.0.1', 1, 'DealCate', 'insert'),
(2452, '测试3彻底删除成功', 1415549893, 1, '127.0.0.1', 1, 'DealCate', 'foreverdelete'),
(2453, '测试3添加成功', 1415549896, 1, '127.0.0.1', 1, 'DealCate', 'insert'),
(2454, '测试4添加成功', 1415549933, 1, '127.0.0.1', 1, 'DealCate', 'insert'),
(2455, '测试5添加成功', 1415549940, 1, '127.0.0.1', 1, 'DealCate', 'insert'),
(2456, '测试5彻底删除成功', 1415549947, 1, '127.0.0.1', 1, 'DealCate', 'foreverdelete'),
(2457, '测试4彻底删除成功', 1415549948, 1, '127.0.0.1', 1, 'DealCate', 'foreverdelete'),
(2458, '测试3彻底删除成功', 1415549950, 1, '127.0.0.1', 1, 'DealCate', 'foreverdelete'),
(2459, '测试4添加成功', 1415550355, 1, '127.0.0.1', 1, 'DealCate', 'insert'),
(2460, '测试4彻底删除成功', 1415550408, 1, '127.0.0.1', 1, 'DealCate', 'foreverdelete'),
(2461, '测试4添加成功', 1415550411, 1, '127.0.0.1', 1, 'DealCate', 'insert'),
(2462, '更新失败', 1415605972, 1, '127.0.0.1', 0, 'DealCate', 'update'),
(2463, '更新失败', 1415606015, 1, '127.0.0.1', 0, 'DealCate', 'update'),
(2464, '更新失败', 1415606024, 1, '127.0.0.1', 0, 'DealCate', 'update'),
(2465, '测试更新成功', 1415606056, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2466, 'lweho更新成功', 1415606091, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2467, '测试更新成功', 1415606989, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2468, '测试更新成功', 1415623441, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2469, '测试24更新成功', 1415623469, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2470, '测试242更新成功', 1415623947, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2471, '测试242更新成功', 1415624434, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2472, '测试242更新成功', 1415624439, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2473, '测试242更新成功', 1415676592, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2474, '测试242更新成功', 1415677681, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2475, '测试242更新成功', 1415691164, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2476, '测试242更新成功', 1415691494, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2477, 'test管理员帐号错误', 1415691818, 0, '127.0.0.1', 0, 'Public', 'do_login'),
(2478, 'test管理员帐号错误', 1415691824, 0, '127.0.0.1', 0, 'Public', 'do_login'),
(2479, 'admin登录成功', 1415691829, 1, '127.0.0.1', 1, 'Public', 'do_login'),
(2480, '测试242更新成功', 1415691896, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2481, '测试242更新成功', 1415691900, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2482, '测试242更新成功', 1415691902, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2483, '测试242更新成功', 1415691934, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2484, '测试242更新成功', 1415691991, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2485, '测试242更新成功', 1415692001, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2486, '测试242更新成功', 1415692052, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2487, '测试242更新成功', 1415692057, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2488, '测试242更新成功', 1415692067, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2489, '测试242更新成功', 1415692176, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2490, '测试242更新成功', 1415693140, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2491, '测试242更新成功', 1415693296, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2492, '测试242更新成功', 1415693420, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2493, '测试242更新成功', 1415693582, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2494, '设计更新成功', 1415790017, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2495, '科技更新成功', 1415790149, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2496, '影视更新成功', 1415790207, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2497, '摄影更新成功', 1415790252, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2498, '音乐更新成功', 1415790305, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2499, '出版更新成功', 1415790354, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2500, '测试242彻底删除成功', 1415790385, 1, '127.0.0.1', 1, 'DealCate', 'foreverdelete'),
(2501, '测试2彻底删除成功', 1415790387, 1, '127.0.0.1', 1, 'DealCate', 'foreverdelete'),
(2502, '测试4彻底删除成功', 1415790389, 1, '127.0.0.1', 1, 'DealCate', 'foreverdelete'),
(2503, '活动更新成功', 1415790451, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2504, '游戏更新成功', 1415790501, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2505, '旅行更新成功', 1415790551, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2506, '其他更新成功', 1415790585, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2507, '设计更新成功', 1415791131, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2508, '影视更新成功', 1415791978, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2509, '活动更新成功', 1415791997, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2510, 'admin登录成功', 1415960747, 1, '127.0.0.1', 1, 'Public', 'do_login'),
(2511, '服务条款排序修改成功', 1415974585, 1, '127.0.0.1', 1, 'Help', 'set_sort'),
(2512, '服务条款排序修改成功', 1415974588, 1, '127.0.0.1', 1, 'Help', 'set_sort'),
(2513, '关于我们排序修改成功', 1415974592, 1, '127.0.0.1', 1, 'Help', 'set_sort'),
(2514, '关于我们排序修改成功', 1415974595, 1, '127.0.0.1', 1, 'Help', 'set_sort'),
(2515, '服务条款排序修改成功', 1415974597, 1, '127.0.0.1', 1, 'Help', 'set_sort'),
(2516, '服务介绍排序修改成功', 1415974709, 1, '127.0.0.1', 1, 'Help', 'set_sort'),
(2517, '服务条款排序修改成功', 1415974720, 1, '127.0.0.1', 1, 'Help', 'set_sort'),
(2518, '服务介绍排序修改成功', 1415974722, 1, '127.0.0.1', 1, 'Help', 'set_sort'),
(2519, '服务条款排序修改成功', 1415976049, 1, '127.0.0.1', 1, 'Help', 'set_sort'),
(2520, '服务介绍排序修改成功', 1415977043, 1, '127.0.0.1', 1, 'Help', 'set_sort'),
(2521, '用户指南添加成功', 1415978398, 1, '127.0.0.1', 1, 'Help', 'insert'),
(2522, '关于众筹添加成功', 1415978420, 1, '127.0.0.1', 1, 'Help', 'insert'),
(2523, '新手指南添加成功', 1415978459, 1, '127.0.0.1', 1, 'Help', 'insert'),
(2524, '团队介绍添加成功', 1415978473, 1, '127.0.0.1', 1, 'Help', 'insert'),
(2525, '用户注册协议添加成功', 1415978480, 1, '127.0.0.1', 1, 'Help', 'insert'),
(2526, '项目发起规范添加成功', 1415978485, 1, '127.0.0.1', 1, 'Help', 'insert'),
(2527, '服务条款更新成功', 1415978538, 1, '127.0.0.1', 1, 'Help', 'update'),
(2528, '用户指南彻底删除成功', 1415978553, 1, '127.0.0.1', 1, 'Help', 'foreverdelete'),
(2529, '团队介绍彻底删除成功', 1415978611, 1, '127.0.0.1', 1, 'Help', 'foreverdelete'),
(2530, '关于我们更新成功', 1415978623, 1, '127.0.0.1', 1, 'Help', 'update'),
(2531, '隐私策略更新成功', 1415978672, 1, '127.0.0.1', 1, 'Help', 'update'),
(2532, '服务介绍更新成功', 1415978741, 1, '127.0.0.1', 1, 'Help', 'update'),
(2533, '联系我们添加成功', 1415978753, 1, '127.0.0.1', 1, 'Help', 'insert'),
(2534, '关注我们添加成功', 1415978763, 1, '127.0.0.1', 1, 'Help', 'insert'),
(2535, '其他更新成功', 1415981692, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2536, 'test21彻底删除成功', 1416137278, 1, '127.0.0.1', 1, 'Deal', 'foreverdelete'),
(2537, 'test2彻底删除成功', 1416137280, 1, '127.0.0.1', 1, 'Deal', 'foreverdelete'),
(2538, 'test2彻底删除成功', 1416137281, 1, '127.0.0.1', 1, 'Deal', 'foreverdelete'),
(2539, 'test2更新成功', 1416137293, 1, '127.0.0.1', 1, 'Deal', 'update'),
(2540, 'test2更新成功', 1416137334, 1, '127.0.0.1', 1, 'Deal', 'update'),
(2541, 'test2更新成功', 1416139557, 1, '127.0.0.1', 1, 'Deal', 'update'),
(2542, 'admin登录成功', 1417580581, 1, '127.0.0.1', 1, 'Public', 'do_login'),
(2543, '设计更新成功', 1417580708, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2544, '影视更新成功', 1417581350, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2545, '摄影更新成功', 1417581369, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2546, '音乐更新成功', 1417581389, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2547, '出版更新成功', 1417581440, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2548, '活动更新成功', 1417581502, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2549, '游戏更新成功', 1417581520, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2550, '其他更新成功', 1417581565, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2551, '科技更新成功', 1417581680, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2552, '旅行更新成功', 1417581704, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2553, '艺术添加成功', 1417581725, 1, '127.0.0.1', 1, 'DealCate', 'insert'),
(2554, '其他更新成功', 1417581732, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2555, '其他更新成功', 1417581743, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2556, '美食添加成功', 1417581768, 1, '127.0.0.1', 1, 'DealCate', 'insert'),
(2557, '舞蹈添加成功', 1417581776, 1, '127.0.0.1', 1, 'DealCate', 'insert'),
(2558, '漫画添加成功', 1417581782, 1, '127.0.0.1', 1, 'DealCate', 'insert'),
(2559, '动物添加成功', 1417581791, 1, '127.0.0.1', 1, 'DealCate', 'insert'),
(2560, '健康添加成功', 1417581802, 1, '127.0.0.1', 1, 'DealCate', 'insert'),
(2561, '视频添加成功', 1417581807, 1, '127.0.0.1', 1, 'DealCate', 'insert'),
(2562, '时尚添加成功', 1417581812, 1, '127.0.0.1', 1, 'DealCate', 'insert'),
(2563, '社群添加成功', 1417581818, 1, '127.0.0.1', 1, 'DealCate', 'insert'),
(2564, '环境添加成功', 1417581824, 1, '127.0.0.1', 1, 'DealCate', 'insert'),
(2565, '环境更新成功', 1417581867, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2566, '社群更新成功', 1417581881, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2567, '时尚更新成功', 1417581894, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2568, '视频更新成功', 1417581907, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2569, '健康更新成功', 1417581926, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2570, '动物更新成功', 1417581937, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2571, '漫画更新成功', 1417581954, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2572, '舞蹈更新成功', 1417581968, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2573, '美食更新成功', 1417581984, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2574, '艺术更新成功', 1417582011, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2575, '更新系统配置', 1417583589, 1, '127.0.0.1', 1, 'Conf', 'update'),
(2576, '经典项目更新成功', 1417584400, 1, '127.0.0.1', 1, 'Nav', 'update'),
(2577, '经典项目更新成功', 1417584466, 1, '127.0.0.1', 1, 'Nav', 'update'),
(2578, '经典项目更新成功', 1417584470, 1, '127.0.0.1', 1, 'Nav', 'update'),
(2579, '经典项目更新成功', 1417584489, 1, '127.0.0.1', 1, 'Nav', 'update'),
(2580, '最新动态更新成功', 1417584497, 1, '127.0.0.1', 1, 'Nav', 'update'),
(2581, 'test管理员帐号错误', 1417585776, 0, '127.0.0.1', 0, 'Public', 'do_login'),
(2582, 'admin管理员密码错误', 1417585784, 0, '127.0.0.1', 0, 'Public', 'do_login'),
(2583, 'admin登录成功', 1417585789, 1, '127.0.0.1', 1, 'Public', 'do_login'),
(2584, 'admin登录成功', 1418028911, 1, '127.0.0.1', 1, 'Public', 'do_login'),
(2585, '不下雪的北方一夜更新成功', 1418028980, 1, '127.0.0.1', 1, 'Deal', 'update'),
(2586, 'test管理员帐号错误', 1418366354, 0, '127.0.0.1', 0, 'Public', 'do_login'),
(2587, 'admin登录成功', 1418366360, 1, '127.0.0.1', 1, 'Public', 'do_login'),
(2588, 'admin登录成功', 1420614161, 1, '127.0.0.1', 1, 'Public', 'do_login'),
(2589, '新手指南更新成功', 1420622238, 1, '127.0.0.1', 1, 'Help', 'update'),
(2590, '新手指南更新成功', 1420622402, 1, '127.0.0.1', 1, 'Help', 'update'),
(2591, '新手指南更新成功', 1420622514, 1, '127.0.0.1', 1, 'Help', 'update'),
(2592, '新手指南更新成功', 1420622697, 1, '127.0.0.1', 1, 'Help', 'update'),
(2593, '新手指南更新成功', 1420622721, 1, '127.0.0.1', 1, 'Help', 'update'),
(2594, '新手指南更新成功', 1420622728, 1, '127.0.0.1', 1, 'Help', 'update'),
(2595, '新手指南更新成功', 1420622748, 1, '127.0.0.1', 1, 'Help', 'update'),
(2596, '新手指南更新成功', 1420622759, 1, '127.0.0.1', 1, 'Help', 'update'),
(2597, '新手指南更新成功', 1420623492, 1, '127.0.0.1', 1, 'Help', 'update'),
(2598, '新手指南更新成功', 1420623526, 1, '127.0.0.1', 1, 'Help', 'update'),
(2599, '新手指南更新成功', 1420623639, 1, '127.0.0.1', 1, 'Help', 'update'),
(2600, '新手指南更新成功', 1420623951, 1, '127.0.0.1', 1, 'Help', 'update'),
(2601, '新手指南更新成功', 1420623967, 1, '127.0.0.1', 1, 'Help', 'update'),
(2602, '新手指南更新成功', 1420624103, 1, '127.0.0.1', 1, 'Help', 'update'),
(2603, '新手指南更新成功', 1420624117, 1, '127.0.0.1', 1, 'Help', 'update'),
(2604, '新手指南更新成功', 1420624304, 1, '127.0.0.1', 1, 'Help', 'update'),
(2605, '新手指南更新成功', 1420625227, 1, '127.0.0.1', 1, 'Nav', 'update'),
(2606, '新手指南更新成功', 1420625293, 1, '127.0.0.1', 1, 'Nav', 'update'),
(2607, '新手指南更新成功', 1420625312, 1, '127.0.0.1', 1, 'Nav', 'update'),
(2608, '新手指南更新成功', 1420625333, 1, '127.0.0.1', 1, 'Nav', 'update'),
(2609, '新手指南更新成功', 1420625865, 1, '127.0.0.1', 1, 'Nav', 'update'),
(2610, '新手指南更新成功', 1420626029, 1, '127.0.0.1', 1, 'Nav', 'update'),
(2611, '新手指南更新成功', 1420626528, 1, '127.0.0.1', 1, 'Nav', 'update'),
(2612, '新手指南更新成功', 1420627200, 1, '127.0.0.1', 1, 'Nav', 'update'),
(2613, '新手指南更新成功', 1420628683, 1, '127.0.0.1', 1, 'Nav', 'update'),
(2614, '新手指南更新成功', 1420629343, 1, '127.0.0.1', 1, 'Nav', 'update'),
(2615, '新手指南更新成功', 1420629874, 1, '127.0.0.1', 1, 'Nav', 'update'),
(2616, '新手指南更新成功', 1420630140, 1, '127.0.0.1', 1, 'Nav', 'update'),
(2617, '新手指南更新成功', 1420630461, 1, '127.0.0.1', 1, 'Nav', 'update'),
(2618, '新手指南更新成功', 1420630507, 1, '127.0.0.1', 1, 'Nav', 'update'),
(2619, '新手指南更新成功', 1420721979, 1, '127.0.0.1', 1, 'Help', 'update'),
(2620, '关于众筹更新成功', 1420732660, 1, '127.0.0.1', 1, 'Help', 'update'),
(2621, '关于众筹更新成功', 1420732677, 1, '127.0.0.1', 1, 'Help', 'update'),
(2622, '关于众筹更新成功', 1420732706, 1, '127.0.0.1', 1, 'Help', 'update'),
(2623, '关于众筹更新成功', 1420732738, 1, '127.0.0.1', 1, 'Help', 'update'),
(2624, '关于众筹更新成功', 1420732752, 1, '127.0.0.1', 1, 'Help', 'update'),
(2625, '团队介绍更新成功', 1420732825, 1, '127.0.0.1', 1, 'Help', 'update'),
(2626, '用户注册协议更新成功', 1420732917, 1, '127.0.0.1', 1, 'Help', 'update'),
(2627, '服务协议更新成功', 1420733436, 1, '127.0.0.1', 1, 'Help', 'update'),
(2628, '服务协议更新成功', 1420733489, 1, '127.0.0.1', 1, 'Help', 'update'),
(2629, '服务协议更新成功', 1420733502, 1, '127.0.0.1', 1, 'Help', 'update'),
(2630, '服务协议更新成功', 1420733513, 1, '127.0.0.1', 1, 'Help', 'update'),
(2631, '服务协议更新成功', 1420733595, 1, '127.0.0.1', 1, 'Help', 'update'),
(2632, '服务协议更新成功', 1420733612, 1, '127.0.0.1', 1, 'Help', 'update'),
(2633, '服务协议更新成功', 1420733630, 1, '127.0.0.1', 1, 'Help', 'update'),
(2634, '服务协议更新成功', 1420733644, 1, '127.0.0.1', 1, 'Help', 'update'),
(2635, '服务协议更新成功', 1420733732, 1, '127.0.0.1', 1, 'Help', 'update'),
(2636, '项目发起规范更新成功', 1420733846, 1, '127.0.0.1', 1, 'Help', 'update'),
(2637, '项目发起规范更新成功', 1420733875, 1, '127.0.0.1', 1, 'Help', 'update'),
(2638, '项目发起规范更新成功', 1420733893, 1, '127.0.0.1', 1, 'Help', 'update'),
(2639, '项目发起规范更新成功', 1420733935, 1, '127.0.0.1', 1, 'Help', 'update'),
(2640, '隐私策略更新成功', 1420733981, 1, '127.0.0.1', 1, 'Help', 'update'),
(2641, '隐私策略更新成功', 1420734001, 1, '127.0.0.1', 1, 'Help', 'update'),
(2642, '联系我们更新成功', 1420734034, 1, '127.0.0.1', 1, 'Help', 'update'),
(2643, '联系我们更新成功', 1420734082, 1, '127.0.0.1', 1, 'Help', 'update'),
(2644, '联系我们更新成功', 1420734098, 1, '127.0.0.1', 1, 'Help', 'update'),
(2645, '联系我们更新成功', 1420734105, 1, '127.0.0.1', 1, 'Help', 'update'),
(2646, '联系我们更新成功', 1420734155, 1, '127.0.0.1', 1, 'Help', 'update'),
(2647, '联系我们更新成功', 1420734186, 1, '127.0.0.1', 1, 'Help', 'update'),
(2648, '关于众筹更新成功', 1420734337, 1, '127.0.0.1', 1, 'Help', 'update'),
(2649, '团队介绍更新成功', 1420734346, 1, '127.0.0.1', 1, 'Help', 'update'),
(2650, '新手指南更新成功', 1420734353, 1, '127.0.0.1', 1, 'Help', 'update'),
(2651, '隐私策略更新成功', 1420734378, 1, '127.0.0.1', 1, 'Help', 'update'),
(2652, '新手指南更新成功', 1420781903, 1, '127.0.0.1', 1, 'Help', 'update'),
(2653, '新手指南更新成功', 1420781981, 1, '127.0.0.1', 1, 'Help', 'update'),
(2654, '新手指南更新成功', 1420782042, 1, '127.0.0.1', 1, 'Help', 'update'),
(2655, '新手指南更新成功', 1420782087, 1, '127.0.0.1', 1, 'Help', 'update'),
(2656, '新手指南更新成功', 1420782206, 1, '127.0.0.1', 1, 'Help', 'update'),
(2657, '新手指南更新成功', 1420782261, 1, '127.0.0.1', 1, 'Help', 'update'),
(2658, '新手指南更新成功', 1420782303, 1, '127.0.0.1', 1, 'Help', 'update'),
(2659, '新手指南更新成功', 1420782385, 1, '127.0.0.1', 1, 'Help', 'update'),
(2660, '新手指南更新成功', 1420782438, 1, '127.0.0.1', 1, 'Help', 'update'),
(2661, '新手指南更新成功', 1420782512, 1, '127.0.0.1', 1, 'Help', 'update'),
(2662, '新手指南更新成功', 1420782587, 1, '127.0.0.1', 1, 'Help', 'update'),
(2663, '新手指南更新成功', 1420782762, 1, '127.0.0.1', 1, 'Help', 'update'),
(2664, '新手指南更新成功', 1420782837, 1, '127.0.0.1', 1, 'Help', 'update'),
(2665, '新手指南更新成功', 1420782878, 1, '127.0.0.1', 1, 'Help', 'update'),
(2666, '新手指南更新成功', 1420782951, 1, '127.0.0.1', 1, 'Help', 'update'),
(2667, '新手指南更新成功', 1420782975, 1, '127.0.0.1', 1, 'Help', 'update'),
(2668, '新手指南更新成功', 1420783014, 1, '127.0.0.1', 1, 'Help', 'update'),
(2669, '新手指南更新成功', 1420783059, 1, '127.0.0.1', 1, 'Help', 'update'),
(2670, '新手指南更新成功', 1420783089, 1, '127.0.0.1', 1, 'Help', 'update'),
(2671, '新手指南更新成功', 1420783148, 1, '127.0.0.1', 1, 'Help', 'update'),
(2672, '新手指南更新成功', 1420783168, 1, '127.0.0.1', 1, 'Help', 'update'),
(2673, '新手指南更新成功', 1420783186, 1, '127.0.0.1', 1, 'Help', 'update'),
(2674, 'admin登录成功', 1420852388, 1, '127.0.0.1', 1, 'Public', 'do_login'),
(2675, '关注我们更新成功', 1420909916, 1, '127.0.0.1', 1, 'Help', 'update'),
(2676, '服务介绍更新成功', 1420909923, 1, '127.0.0.1', 1, 'Help', 'update'),
(2677, '新手指南更新成功', 1421223480, 1, '127.0.0.1', 1, 'Help', 'update'),
(2678, '新手指南更新成功', 1421223508, 1, '127.0.0.1', 1, 'Help', 'update'),
(2679, '新手指南更新成功', 1421223520, 1, '127.0.0.1', 1, 'Help', 'update'),
(2680, '新手指南更新成功', 1421225165, 1, '127.0.0.1', 1, 'Help', 'update'),
(2681, '新手指南更新成功', 1421226262, 1, '127.0.0.1', 1, 'Help', 'update'),
(2682, '新手指南更新成功', 1421226600, 1, '127.0.0.1', 1, 'Help', 'update'),
(2683, '新手指南更新成功', 1421226823, 1, '127.0.0.1', 1, 'Help', 'update'),
(2684, '新手指南更新成功', 1421226861, 1, '127.0.0.1', 1, 'Help', 'update'),
(2685, '新手指南更新成功', 1421227088, 1, '127.0.0.1', 1, 'Help', 'update'),
(2686, '新手指南更新成功', 1421227107, 1, '127.0.0.1', 1, 'Help', 'update'),
(2687, '新手指南更新成功', 1421227184, 1, '127.0.0.1', 1, 'Help', 'update'),
(2688, 'admin登录成功', 1421659755, 1, '127.0.0.1', 1, 'Public', 'do_login'),
(2689, '更新系统配置', 1421660136, 1, '127.0.0.1', 1, 'Conf', 'update'),
(2690, '更新系统配置', 1421660147, 1, '127.0.0.1', 1, 'Conf', 'update'),
(2691, '更新系统配置', 1421660206, 1, '127.0.0.1', 1, 'Conf', 'update'),
(2692, '更新系统配置', 1421660419, 1, '127.0.0.1', 1, 'Conf', 'update'),
(2693, '更新系统配置', 1421660651, 1, '127.0.0.1', 1, 'Conf', 'update'),
(2694, '新手指南更新成功', 1421752234, 1, '127.0.0.1', 1, 'Nav', 'update'),
(2695, '新手指南更新成功', 1421752276, 1, '127.0.0.1', 1, 'Nav', 'update'),
(2696, '新手指南更新成功', 1421752312, 1, '127.0.0.1', 1, 'Nav', 'update'),
(2697, 'admin登录成功', 1421797301, 1, '127.0.0.1', 1, 'Public', 'do_login'),
(2698, '新手指南更新成功', 1421804600, 1, '127.0.0.1', 1, 'Help', 'update'),
(2699, '新手指南更新成功', 1421804642, 1, '127.0.0.1', 1, 'Help', 'update'),
(2700, '新手指南更新成功', 1421804645, 1, '127.0.0.1', 1, 'Help', 'update'),
(2701, '新手指南更新成功', 1421804730, 1, '127.0.0.1', 1, 'Help', 'update'),
(2702, '新手指南更新成功', 1421805471, 1, '127.0.0.1', 1, 'Help', 'update'),
(2703, '新手指南更新成功', 1421805589, 1, '127.0.0.1', 1, 'Help', 'update'),
(2704, '更新系统配置', 1421994396, 1, '127.0.0.1', 1, 'Conf', 'update'),
(2705, '更新系统配置', 1421994467, 1, '127.0.0.1', 1, 'Conf', 'update'),
(2706, '环境更新成功', 1422093143, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2707, '环境更新成功', 1422093615, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2708, '环境更新成功', 1422093646, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2709, '环境更新成功', 1422093681, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2710, '环境更新成功', 1422093759, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2711, '环境更新成功', 1422095234, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2712, '环境更新成功', 1422095904, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2713, '环境更新成功', 1422095916, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2714, '环境更新成功', 1422095973, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2715, '环境更新成功', 1422167378, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2716, 'test添加成功', 1422167620, 1, '127.0.0.1', 1, 'DealCate', 'insert'),
(2717, 'test更新成功', 1422167645, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2718, 'test更新成功', 1422171362, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2719, 'test彻底删除成功', 1422181292, 1, '127.0.0.1', 1, 'DealCate', 'foreverdelete'),
(2720, '关注我们彻底删除成功', 1422274271, 1, '127.0.0.1', 1, 'Help', 'foreverdelete'),
(2721, '服务介绍彻底删除成功', 1422274341, 1, '127.0.0.1', 1, 'Help', 'foreverdelete'),
(2722, '隐私策略更新成功', 1422274799, 1, '127.0.0.1', 1, 'Help', 'update'),
(2723, '隐私策略更新成功', 1422274925, 1, '127.0.0.1', 1, 'Help', 'update'),
(2724, '服务协议更新成功', 1422275403, 1, '127.0.0.1', 1, 'Help', 'update'),
(2725, '项目发起规范更新成功', 1422275521, 1, '127.0.0.1', 1, 'Help', 'update'),
(2726, '团队介绍更新成功', 1422275780, 1, '127.0.0.1', 1, 'Help', 'update'),
(2727, '团队介绍更新成功', 1422275835, 1, '127.0.0.1', 1, 'Help', 'update'),
(2728, '团队介绍更新成功', 1422275882, 1, '127.0.0.1', 1, 'Help', 'update'),
(2729, '团队介绍更新成功', 1422275945, 1, '127.0.0.1', 1, 'Help', 'update'),
(2730, '团队介绍更新成功', 1422275976, 1, '127.0.0.1', 1, 'Help', 'update'),
(2731, '团队介绍更新成功', 1422344065, 1, '127.0.0.1', 1, 'Help', 'update'),
(2732, '团队介绍更新成功', 1422344109, 1, '127.0.0.1', 1, 'Help', 'update'),
(2733, '团队介绍更新成功', 1422344229, 1, '127.0.0.1', 1, 'Help', 'update'),
(2734, '团队介绍更新成功', 1422344251, 1, '127.0.0.1', 1, 'Help', 'update'),
(2735, '团队介绍更新成功', 1422344284, 1, '127.0.0.1', 1, 'Help', 'update'),
(2736, '团队介绍更新成功', 1422344385, 1, '127.0.0.1', 1, 'Help', 'update'),
(2737, '团队介绍更新成功', 1422344397, 1, '127.0.0.1', 1, 'Help', 'update'),
(2738, '团队介绍更新成功', 1422344464, 1, '127.0.0.1', 1, 'Help', 'update'),
(2739, '团队介绍更新成功', 1422344512, 1, '127.0.0.1', 1, 'Help', 'update'),
(2740, '团队介绍更新成功', 1422344733, 1, '127.0.0.1', 1, 'Help', 'update'),
(2741, '团队介绍更新成功', 1422344798, 1, '127.0.0.1', 1, 'Help', 'update'),
(2742, '团队介绍更新成功', 1422344806, 1, '127.0.0.1', 1, 'Help', 'update'),
(2743, '团队介绍更新成功', 1422346920, 1, '127.0.0.1', 1, 'Help', 'update'),
(2744, '团队介绍更新成功', 1422346992, 1, '127.0.0.1', 1, 'Help', 'update'),
(2745, '团队介绍更新成功', 1422347004, 1, '127.0.0.1', 1, 'Help', 'update'),
(2746, '团队介绍更新成功', 1422347159, 1, '127.0.0.1', 1, 'Help', 'update'),
(2747, '团队介绍更新成功', 1422347753, 1, '127.0.0.1', 1, 'Help', 'update'),
(2748, '团队介绍更新成功', 1422351496, 1, '127.0.0.1', 1, 'Help', 'update'),
(2749, '团队介绍更新成功', 1422351501, 1, '127.0.0.1', 1, 'Help', 'update'),
(2750, '团队介绍更新成功', 1422351769, 1, '127.0.0.1', 1, 'Help', 'update'),
(2751, '团队介绍更新成功', 1422351783, 1, '127.0.0.1', 1, 'Help', 'update'),
(2752, '团队介绍更新成功', 1422359989, 1, '127.0.0.1', 1, 'Help', 'update'),
(2753, '团队介绍更新成功', 1422414192, 1, '127.0.0.1', 1, 'Help', 'update'),
(2754, '团队介绍更新成功', 1422414351, 1, '127.0.0.1', 1, 'Help', 'update'),
(2755, '团队介绍更新成功', 1422414385, 1, '127.0.0.1', 1, 'Help', 'update'),
(2756, '设计更新成功', 1422698046, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2757, '写作更新成功', 1422698079, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2758, '电影更新成功', 1422698095, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2759, '摄影更新成功', 1422698108, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2760, '音乐更新成功', 1422698119, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2761, '教育更新成功', 1422698133, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2762, '运动更新成功', 1422698144, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2763, '游戏更新成功', 1422698150, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2764, '游戏更新成功', 1422698161, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2765, '戏剧更新成功', 1422698173, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2766, '其他更新成功', 1422698188, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2767, '艺术更新成功', 1422698205, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2768, '美食更新成功', 1422698222, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2769, '舞蹈更新成功', 1422698242, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2770, '漫画更新成功', 1422698254, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2771, '动物更新成功', 1422698264, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2772, '健康更新成功', 1422698273, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2773, '视频更新成功', 1422698285, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2774, '时尚更新成功', 1422698299, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2775, '社群更新成功', 1422698312, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2776, '环境更新成功', 1422698320, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2777, '健康更新成功', 1422871625, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2778, '健康更新成功', 1422871819, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2779, '健康更新成功', 1422871934, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2780, '健康更新成功', 1422881228, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2781, 'test管理员帐号错误', 1422888776, 0, '127.0.0.1', 0, 'Public', 'do_login'),
(2782, 'test管理员帐号错误', 1422888781, 0, '127.0.0.1', 0, 'Public', 'do_login'),
(2783, 'test管理员帐号错误', 1422888788, 0, '127.0.0.1', 0, 'Public', 'do_login'),
(2784, 'admin登录成功', 1422888797, 1, '127.0.0.1', 1, 'Public', 'do_login'),
(2785, '美食更新成功', 1423218496, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2786, '团队介绍更新成功', 1423657043, 1, '127.0.0.1', 1, 'Help', 'update'),
(2787, '团队介绍更新成功', 1423657105, 1, '127.0.0.1', 1, 'Help', 'update'),
(2788, '团队介绍更新成功', 1423657126, 1, '127.0.0.1', 1, 'Help', 'update'),
(2789, '团队介绍更新成功', 1423657199, 1, '127.0.0.1', 1, 'Help', 'update'),
(2790, '团队介绍更新成功', 1423657251, 1, '127.0.0.1', 1, 'Help', 'update'),
(2791, '团队介绍更新成功', 1423657400, 1, '127.0.0.1', 1, 'Help', 'update'),
(2792, '团队介绍更新成功', 1423657519, 1, '127.0.0.1', 1, 'Help', 'update'),
(2793, '美食更新成功', 1424064476, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2794, '美食更新成功', 1424064570, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2795, '美食更新成功', 1424064654, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2796, '时尚更新成功', 1424065233, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2797, '时尚更新成功', 1424065633, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2798, '电影更新成功', 1424065666, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2799, '电影更新成功', 1424065676, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2800, '音乐更新成功', 1424065697, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2801, '科技添加成功', 1424067390, 1, '127.0.0.1', 1, 'DealCate', 'insert'),
(2802, '公益添加成功', 1424067397, 1, '127.0.0.1', 1, 'DealCate', 'insert'),
(2803, '其他更新成功', 1424067416, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2804, '公益更新成功', 1424067424, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2805, '科技更新成功', 1424067452, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2806, '公益更新成功', 1424067477, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2807, 'admin登录成功', 1427015101, 1, '127.0.0.1', 1, 'Public', 'do_login'),
(2808, '发起项目添加成功', 1427015629, 1, '127.0.0.1', 1, 'Nav', 'insert'),
(2809, '发起项目更新成功', 1427015651, 1, '127.0.0.1', 1, 'Nav', 'update'),
(2810, '时尚更新成功', 1427018982, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2811, '美食更新成功', 1427019397, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2812, '美食更新成功', 1427019608, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2813, '美食更新成功', 1427019822, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2814, '电影更新成功', 1427020127, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2815, '时尚更新成功', 1427020138, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2816, '时尚更新成功', 1427020148, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2817, '电影更新成功', 1427020159, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2818, '旅游添加成功', 1427020488, 1, '127.0.0.1', 1, 'DealCate', 'insert'),
(2819, '旅游更新成功', 1427020505, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2820, '时尚更新成功', 1427020596, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2821, '时尚更新成功', 1427020606, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2822, '公益更新成功', 1427021483, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2823, '电影更新成功', 1427358020, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2824, '公益更新成功', 1427358081, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2825, '时尚更新成功', 1427358094, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2826, '更新系统配置', 1427358152, 1, '127.0.0.1', 1, 'Conf', 'update'),
(2827, '更新系统配置', 1427358352, 1, '127.0.0.1', 1, 'Conf', 'update'),
(2828, '更新系统配置', 1427358524, 1, '127.0.0.1', 1, 'Conf', 'update'),
(2829, '音乐更新成功', 1427358951, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2830, '美食更新成功', 1427358964, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2831, '运动更新成功', 1427358974, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2832, '游戏更新成功', 1427358986, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2833, '戏剧更新成功', 1427358999, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2834, '其他更新成功', 1427359010, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2835, '设计更新成功', 1427359024, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2836, '摄影更新成功', 1427359040, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2837, '艺术更新成功', 1427359059, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2838, '教育更新成功', 1427359068, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2839, '舞蹈更新成功', 1427359080, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2840, '漫画更新成功', 1427359091, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2841, '动物更新成功', 1427359103, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2842, '健康更新成功', 1427359111, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2843, '视频更新成功', 1427359139, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2844, '写作更新成功', 1427359150, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2845, '社群更新成功', 1427359164, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2846, '环境更新成功', 1427359173, 1, '127.0.0.1', 1, 'DealCate', 'update'),
(2847, '科技更新成功', 1427379515, 1, '127.0.0.1', 1, 'DealCate', 'update');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_lottery`
--

CREATE TABLE IF NOT EXISTS `fanwe_lottery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lottery_sn` varchar(255) NOT NULL,
  `deal_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  `buyer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_mail_list`
--

CREATE TABLE IF NOT EXISTS `fanwe_mail_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail_address` varchar(255) NOT NULL,
  `city_id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mail_address_idx` (`mail_address`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_mail_server`
--

CREATE TABLE IF NOT EXISTS `fanwe_mail_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `smtp_server` varchar(255) NOT NULL,
  `smtp_name` varchar(255) NOT NULL,
  `smtp_pwd` varchar(255) NOT NULL,
  `is_ssl` tinyint(1) NOT NULL,
  `smtp_port` varchar(255) NOT NULL,
  `use_limit` int(11) NOT NULL,
  `is_reset` tinyint(1) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `total_use` int(11) NOT NULL,
  `is_verify` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_medal`
--

CREATE TABLE IF NOT EXISTS `fanwe_medal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `config` text NOT NULL,
  `icon` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `route` text NOT NULL,
  `allow_check` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `fanwe_medal`
--

INSERT INTO `fanwe_medal` (`id`, `class_name`, `name`, `description`, `is_effect`, `config`, `icon`, `image`, `route`, `allow_check`) VALUES
(1, 'Groupuser', '组长勋章', '点亮表示您为组长', 1, 'N;', './public/attachment/201203/17/15/4f6438e27aa65.png', '', '申请成为小组组长即可点亮该勋章', 1),
(2, 'Keepsign', '忠实网友勋章', '点亮为忠实的网友会员', 1, 'a:1:{s:9:"day_count";s:2:"10";}', './public/attachment/201203/17/15/4f6438f0af2c6.png', '', '连续签到10天以上将获得该勋章', 1),
(3, 'Newuser', '新手勋章', '点亮您为新手，让更多的朋友找到你', 1, 'N;', './public/attachment/201203/17/15/4f643902cd067.png', '', '完善用户的所有资料，即可获取该勋章', 1),
(4, 'Sinabind', '新浪微博勋章', '新浪微博认证勋章，点亮为新浪微博用户', 1, 'N;', './public/attachment/201203/17/15/4f64391478be2.png', '', '绑定新浪微博即可获得该勋章', 0),
(5, 'Tencentbind', '腾讯微博勋章', '腾讯微博认证勋章，点亮为腾讯微博用户', 1, 'N;', './public/attachment/201203/17/15/4f6439210f17b.png', '', '绑定腾讯微博即可获得该勋章', 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_message`
--

CREATE TABLE IF NOT EXISTS `fanwe_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `admin_reply` text NOT NULL,
  `admin_id` int(11) NOT NULL,
  `rel_table` varchar(255) NOT NULL,
  `rel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `city_id` int(11) NOT NULL,
  `is_buy` tinyint(1) NOT NULL,
  `contact_name` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `point` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=98 ;

--
-- 转存表中的数据 `fanwe_message`
--

INSERT INTO `fanwe_message` (`id`, `title`, `content`, `create_time`, `update_time`, `admin_reply`, `admin_id`, `rel_table`, `rel_id`, `user_id`, `pid`, `is_effect`, `city_id`, `is_buy`, `contact_name`, `contact`, `point`) VALUES
(97, '看起来很不错。 我报名了[呲牙][呲牙]', '看起来很不错。 我报名了[呲牙][呲牙]', 1329336228, 0, '', 0, 'event', 1, 44, 0, 1, 0, 0, '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_message_type`
--

CREATE TABLE IF NOT EXISTS `fanwe_message_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  `is_fix` tinyint(1) NOT NULL,
  `show_name` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `fanwe_message_type`
--

INSERT INTO `fanwe_message_type` (`id`, `type_name`, `is_fix`, `show_name`, `is_effect`, `sort`) VALUES
(1, 'deal', 1, '商品评论', 1, 0),
(2, 'deal_order', 1, '订单留言', 0, 0),
(3, 'feedback', 1, '意见反馈', 0, 0),
(4, 'seller', 1, '商务合作', 0, 0),
(6, 'tx', 1, '提现申请', 0, 0),
(5, 'after_sale', 0, '售后服务', 0, 2),
(8, 'before_sale', 0, '售前咨询', 1, 3),
(10, 'faq', 1, '问题答疑', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_mobile_list`
--

CREATE TABLE IF NOT EXISTS `fanwe_mobile_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(255) NOT NULL,
  `city_id` int(11) NOT NULL,
  `verify_code` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mobile_idx` (`mobile`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_msg_box`
--

CREATE TABLE IF NOT EXISTS `fanwe_msg_box` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `from_user_id` int(11) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `system_msg_id` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `group_key` varchar(200) NOT NULL,
  `is_notice` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `fanwe_msg_box`
--

INSERT INTO `fanwe_msg_box` (`id`, `title`, `content`, `from_user_id`, `to_user_id`, `create_time`, `is_read`, `is_delete`, `system_msg_id`, `type`, `group_key`, `is_notice`) VALUES
(1, '图片很美分享被置顶+10经验', '图片很美分享被置顶+10经验', 44, 44, 1331937858, 1, 0, 0, 0, '44_44_0_1', 1),
(2, '您已经成为初入江湖', '恭喜您，您已经成为初入江湖。', 0, 44, 1331939170, 1, 0, 0, 0, '0_44_0_2', 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_msg_system`
--

CREATE TABLE IF NOT EXISTS `fanwe_msg_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `user_names` text NOT NULL,
  `user_ids` text NOT NULL,
  `end_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_msg_template`
--

CREATE TABLE IF NOT EXISTS `fanwe_msg_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `type` tinyint(1) NOT NULL,
  `is_html` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `fanwe_msg_template`
--

INSERT INTO `fanwe_msg_template` (`id`, `name`, `content`, `type`, `is_html`) VALUES
(1, 'TPL_MAIL_USER_PASSWORD', '{$user.user_name}你好，请点击以下链接修改您的密码\r\n</p>\r\n<a href=''{$user.password_url}''>{$user.password_url}</a>', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_m_adv`
--

CREATE TABLE IF NOT EXISTS `fanwe_m_adv` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `img` varchar(255) DEFAULT '',
  `page` enum('sharelist','index') DEFAULT 'sharelist',
  `type` tinyint(1) DEFAULT '0' COMMENT '1.标签集,2.url地址,3.分类排行,4.最亮达人,5.搜索发现,6.一起拍,7.热门单品排行,8.直接显示某个分享',
  `data` text,
  `sort` smallint(5) DEFAULT '10',
  `status` tinyint(1) DEFAULT '1',
  `city_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `fanwe_m_adv`
--

INSERT INTO `fanwe_m_adv` (`id`, `name`, `img`, `page`, `type`, `data`, `sort`, `status`, `city_id`) VALUES
(8, '达人', './public/attachment/201203/03/09/4f51762d89d4d.jpg', 'sharelist', 4, '', 1, 1, 0),
(9, '方维o2o', './public/attachment/201202/04/15/4f2ce3d1827e4.jpg', 'index', 2, 'a:1:{s:3:"url";s:20:"http://www.fanwe.com";}', 2, 1, 0),
(10, '支付宝广告', './public/attachment/201203/03/09/4f5176077b5e6.jpg', 'index', 1, 'a:2:{s:3:"cid";i:1;s:4:"tags";a:4:{i:0;s:6:"游戏";i:1;s:6:"电影";i:2;s:6:"可爱";i:3;s:6:"卖萌";}}', 3, 1, 0),
(11, '手机广告', './public/attachment/201203/03/09/4f5175debd973.jpg', 'index', 8, 'a:1:{s:8:"share_id";i:137;}', 4, 1, 0),
(12, '方维o2o', './public/attachment/201202/04/15/4f2ce3d1827e4.jpg', 'sharelist', 2, 'a:1:{s:3:"url";s:20:"http://www.fanwe.com";}', 5, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_m_config`
--

CREATE TABLE IF NOT EXISTS `fanwe_m_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `val` text,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `fanwe_m_config`
--

INSERT INTO `fanwe_m_config` (`id`, `code`, `title`, `val`, `type`) VALUES
(1, 'catalog_id', '生活服务默认分类id', '8', 0),
(19, 'index_logo', '首页logo', './public/attachment/201202/04/16/4f2ce8336d784.png', 2),
(3, 'has_ecv', '有优惠券', '1', 0),
(6, 'has_message', '有留言框', '1', 0),
(7, 'has_region', '有配送地区选择项', '1', 0),
(8, 'region_version', '配送地区版本', '1', 0),
(9, 'only_one_delivery', '只有一个配送地区', '1', 0),
(10, 'kf_phone', '客服电话', '400-000-0000', 0),
(11, 'kf_email', '客服邮箱', 'qq@fanwe.com', 0),
(12, 'select_payment_id', '默认支付方式', '0', 0),
(15, 'delivery_id', '默认配送方式', '0', 0),
(16, 'page_size', '分页大小', '10', 0),
(17, 'about_info', '关于我们', '关于我们', 1),
(18, 'program_title', '程序标题名称', 'O2O营销模式', 0),
(20, 'event_cate_id', '活动默认分类id', '3', 0),
(21, 'shop_cate_id', '商城默认分类id', '24', 0),
(22, 'sina_app_key', '新浪APP_KEY', '', 0),
(23, 'sina_app_secret', '新浪APP_SECRET', '', 0),
(24, 'sina_bind_url', '新浪回调地址', '', 0),
(25, 'tencent_app_key', '腾讯APP_KEY', '', 0),
(26, 'tencent_app_secret', '腾讯APP_SECRET', '', 0),
(27, 'tencent_bind_url', '腾讯回调地址', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_m_config_list`
--

CREATE TABLE IF NOT EXISTS `fanwe_m_config_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pay_id` varchar(50) DEFAULT NULL,
  `group` int(10) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `has_calc` int(1) DEFAULT NULL,
  `money` float(10,2) DEFAULT NULL,
  `is_verify` int(1) DEFAULT '0' COMMENT '0:无效；1:有效',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `fanwe_m_config_list`
--

INSERT INTO `fanwe_m_config_list` (`id`, `pay_id`, `group`, `code`, `title`, `has_calc`, `money`, `is_verify`) VALUES
(1, '0', 1, 'Malipay', '支付宝/各银行', 1, 0.00, 0),
(2, '0', 1, 'Mcod', '货到付款', 1, 0.00, 0),
(3, '', 5, '1', '家', 0, 0.00, 1),
(4, '', 5, '2', '公司', 0, 0.00, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_m_index`
--

CREATE TABLE IF NOT EXISTS `fanwe_m_index` (
  `id` mediumint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT '',
  `vice_name` varchar(100) DEFAULT NULL,
  `desc` varchar(100) DEFAULT '',
  `img` varchar(255) DEFAULT '',
  `type` tinyint(1) DEFAULT '0' COMMENT '1.标签集,2.url地址,3.分类排行,4.最亮达人,5.搜索发现,6.一起拍,7.热门单品排行,8.直接显示某个分享',
  `data` text,
  `sort` smallint(5) DEFAULT '10',
  `status` tinyint(1) DEFAULT '1',
  `is_hot` tinyint(1) DEFAULT '0',
  `is_new` tinyint(1) DEFAULT '0',
  `city_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- 转存表中的数据 `fanwe_m_index`
--

INSERT INTO `fanwe_m_index` (`id`, `name`, `vice_name`, `desc`, `img`, `type`, `data`, `sort`, `status`, `is_hot`, `is_new`, `city_id`) VALUES
(18, '优惠列表', '优惠列表', '优惠列表', './public/attachment/201203/03/09/4f5178a568027.png', 12, 'a:1:{s:7:"cate_id";i:0;}', 5, 1, 0, 0, 0),
(19, '团购列表', '团购列表', '团购列表', './public/attachment/201203/03/09/4f517883c6873.png', 9, 'a:1:{s:7:"cate_id";i:0;}', 6, 1, 0, 0, 0),
(20, '商城列表', '商城列表', '商城列表', './public/attachment/201203/03/09/4f51795a1792a.png', 10, 'a:1:{s:7:"cate_id";i:0;}', 7, 1, 0, 0, 0),
(21, '优惠首页', '优惠首页', '优惠首页', './public/attachment/201203/03/09/4f5179727e5f6.png', 20, '', 10, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_nav`
--

CREATE TABLE IF NOT EXISTS `fanwe_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `blank` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `u_module` varchar(255) NOT NULL,
  `u_action` varchar(255) NOT NULL,
  `u_id` int(11) NOT NULL,
  `u_param` varchar(255) NOT NULL,
  `color` varchar(20) DEFAULT NULL COMMENT '标签字体颜色',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=51 ;

--
-- 转存表中的数据 `fanwe_nav`
--

INSERT INTO `fanwe_nav` (`id`, `name`, `url`, `blank`, `sort`, `is_effect`, `u_module`, `u_action`, `u_id`, `u_param`, `color`) VALUES
(42, '首页', '', 0, 1, 1, 'index', '', 0, '', 'font_blue'),
(47, '新手指南', '', 0, 4, 1, 'help', '', 0, 'act=9', 'font_red'),
(46, '所有项目', '', 0, 2, 1, 'deals', 'index', 0, '', 'font_green'),
(48, '最新动态', '', 0, 3, 1, 'news', 'index', 0, '', 'font_orange'),
(50, '发起项目', '', 0, 5, 1, 'project', 'add', 0, '', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_payment`
--

CREATE TABLE IF NOT EXISTS `fanwe_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `online_pay` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `total_amount` double(20,4) NOT NULL,
  `config` text NOT NULL,
  `logo` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `fanwe_payment`
--

INSERT INTO `fanwe_payment` (`id`, `class_name`, `is_effect`, `online_pay`, `name`, `description`, `total_amount`, `config`, `logo`, `sort`) VALUES
(24, 'AlipayBank', 1, 1, '支付宝银行直连支付', '', 0.0000, 'a:4:{s:14:"alipay_partner";s:0:"";s:14:"alipay_account";s:0:"";s:10:"alipay_key";s:0:"";s:14:"alipay_gateway";a:17:{s:7:"ICBCB2C";s:1:"1";s:3:"CMB";s:1:"1";s:3:"CCB";s:1:"1";s:3:"ABC";s:1:"1";s:4:"SPDB";s:1:"1";s:3:"SDB";s:1:"1";s:3:"CIB";s:1:"1";s:6:"BJBANK";s:1:"1";s:7:"CEBBANK";s:1:"1";s:4:"CMBC";s:1:"1";s:5:"CITIC";s:1:"1";s:3:"GDB";s:1:"1";s:7:"SPABANK";s:1:"1";s:6:"BOCB2C";s:1:"1";s:4:"COMM";s:1:"1";s:7:"ICBCBTB";s:1:"1";s:10:"PSBC-DEBIT";s:1:"1";}}', '', 1),
(25, 'Alipay', 1, 1, '支付宝即时到帐支付', '', 0.0000, 'a:3:{s:14:"alipay_partner";s:0:"";s:14:"alipay_account";s:0:"";s:10:"alipay_key";s:0:"";}', '', 2),
(26, 'TenpayBank', 1, 1, '财付通直连支付', '', 0.0000, 'a:4:{s:13:"tencentpay_id";s:0:"";s:14:"tencentpay_key";s:0:"";s:15:"tencentpay_sign";s:0:"";s:18:"tencentpay_gateway";a:18:{i:1002;s:1:"1";i:1001;s:1:"1";i:1003;s:1:"1";i:1005;s:1:"1";i:1004;s:1:"1";i:1008;s:1:"1";i:1009;s:1:"1";i:1032;s:1:"1";i:1022;s:1:"1";i:1006;s:1:"1";i:1021;s:1:"1";i:1027;s:1:"1";i:1010;s:1:"1";i:1052;s:1:"1";i:1020;s:1:"1";i:1030;s:1:"1";i:1042;s:1:"1";i:1028;s:1:"1";}}', '', 3),
(27, 'Tenpay', 1, 1, '财付通支付', '', 0.0000, 'a:3:{s:13:"tencentpay_id";s:0:"";s:14:"tencentpay_key";s:0:"";s:15:"tencentpay_sign";s:0:"";}', '', 4);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_payment_notice`
--

CREATE TABLE IF NOT EXISTS `fanwe_payment_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice_sn` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  `pay_time` int(11) NOT NULL,
  `order_id` int(11) NOT NULL COMMENT 'order_id?0?????',
  `is_paid` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `bank_id` varchar(255) NOT NULL,
  `memo` text NOT NULL,
  `money` double(20,4) NOT NULL,
  `outer_notice_sn` varchar(255) NOT NULL,
  `deal_id` int(11) NOT NULL COMMENT '0????',
  `deal_item_id` int(11) NOT NULL COMMENT '0????',
  `deal_name` varchar(255) NOT NULL COMMENT '??????',
  PRIMARY KEY (`id`),
  UNIQUE KEY `notice_sn_unk` (`notice_sn`),
  KEY `order_id` (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `payment_id` (`payment_id`),
  KEY `deal_id` (`deal_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=211 ;

--
-- 转存表中的数据 `fanwe_payment_notice`
--

INSERT INTO `fanwe_payment_notice` (`id`, `notice_sn`, `create_time`, `pay_time`, `order_id`, `is_paid`, `user_id`, `payment_id`, `bank_id`, `memo`, `money`, `outer_notice_sn`, `deal_id`, `deal_item_id`, `deal_name`) VALUES
(200, '20121107399', 1352230157, 0, 67, 0, 19, 24, 'ICBCB2C', '', 500.0000, '', 56, 24, '拥有自己的咖啡馆'),
(201, '20121107985', 1352230180, 1352230180, 67, 1, 19, 0, '', '管理员收款', 500.0000, '', 56, 24, '拥有自己的咖啡馆'),
(202, '20121107931', 1352231631, 0, 78, 0, 19, 24, 'CCB', 'ttt', 500.0000, '', 58, 30, '流浪猫的家—爱天使公益咖啡馆的重建需要大家的力量！'),
(203, '20121107124', 1352231671, 0, 79, 0, 17, 24, 'ICBCB2C', '部份支付', 200.0000, '', 56, 24, '拥有自己的咖啡馆'),
(204, '20150209130', 1423402096, 0, 81, 0, 19, 24, 'CCB', '', 60.0000, '', 57, 25, '短片电影《Blind Love》'),
(205, '20150209122', 1423402112, 0, 82, 0, 19, 26, '1008', '', 60.0000, '', 57, 25, '短片电影《Blind Love》'),
(206, '20150209438', 1423402149, 0, 83, 0, 19, 26, '1008', '', 60.0000, '', 57, 25, '短片电影《Blind Love》'),
(207, '20150209872', 1423402160, 0, 84, 0, 19, 26, '1009', '', 60.0000, '', 57, 25, '短片电影《Blind Love》'),
(208, '20150209237', 1423402165, 0, 85, 0, 19, 24, 'CCB', '', 60.0000, '', 57, 25, '短片电影《Blind Love》'),
(209, '20150209426', 1423402577, 0, 87, 0, 19, 24, 'ICBCB2C', '', 150.0000, '', 57, 26, '短片电影《Blind Love》'),
(210, '20150209425', 1423402610, 0, 88, 0, 19, 24, 'ICBCB2C', '', 150.0000, '', 57, 26, '短片电影《Blind Love》');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_point_group`
--

CREATE TABLE IF NOT EXISTS `fanwe_point_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `fanwe_point_group`
--

INSERT INTO `fanwe_point_group` (`id`, `name`, `sort`) VALUES
(1, '卫生', 100),
(2, '服务', 100);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_point_group_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_point_group_link` (
  `point_group_id` int(11) NOT NULL COMMENT '商户子类点评评分分组ID fanwe_merchant_type_point_group',
  `category_id` int(11) NOT NULL,
  KEY `group_id` (`point_group_id`) USING BTREE,
  KEY `type_id` (`category_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_point_group_link`
--

INSERT INTO `fanwe_point_group_link` (`point_group_id`, `category_id`) VALUES
(2, 12),
(2, 11),
(1, 10),
(2, 10),
(2, 9),
(1, 8),
(2, 8),
(1, 14),
(2, 14),
(1, 15),
(1, 16),
(2, 16),
(1, 17),
(2, 17);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_promote`
--

CREATE TABLE IF NOT EXISTS `fanwe_promote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  `config` text NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_promote_msg`
--

CREATE TABLE IF NOT EXISTS `fanwe_promote_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `send_time` int(11) NOT NULL,
  `send_status` tinyint(1) NOT NULL,
  `deal_id` int(11) NOT NULL,
  `send_type` tinyint(1) NOT NULL,
  `send_type_id` int(11) NOT NULL,
  `send_define_data` text NOT NULL,
  `is_html` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_promote_msg_list`
--

CREATE TABLE IF NOT EXISTS `fanwe_promote_msg_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dest` varchar(255) NOT NULL,
  `send_type` tinyint(1) NOT NULL,
  `content` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `send_time` int(11) NOT NULL,
  `is_send` tinyint(1) NOT NULL,
  `create_time` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `result` text NOT NULL,
  `is_success` tinyint(1) NOT NULL,
  `is_html` tinyint(1) NOT NULL,
  `msg_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dest_idx` (`dest`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_referrals`
--

CREATE TABLE IF NOT EXISTS `fanwe_referrals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `rel_user_id` int(11) NOT NULL,
  `money` double(20,4) NOT NULL,
  `create_time` int(11) NOT NULL,
  `pay_time` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_region_conf`
--

CREATE TABLE IF NOT EXISTS `fanwe_region_conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '????????',
  `region_level` tinyint(4) NOT NULL COMMENT '1:?? 2:? 3:??(??) 4:??(??)',
  `py` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=3401 ;

--
-- 转存表中的数据 `fanwe_region_conf`
--

INSERT INTO `fanwe_region_conf` (`id`, `pid`, `name`, `region_level`, `py`) VALUES
(3, 1, '安徽', 2, 'anhui'),
(4, 1, '福建', 2, 'fujian'),
(5, 1, '甘肃', 2, 'gansu'),
(6, 1, '广东', 2, 'guangdong'),
(7, 1, '广西', 2, 'guangxi'),
(8, 1, '贵州', 2, 'guizhou'),
(9, 1, '海南', 2, 'hainan'),
(10, 1, '河北', 2, 'hebei'),
(11, 1, '河南', 2, 'henan'),
(12, 1, '黑龙江', 2, 'heilongjiang'),
(13, 1, '湖北', 2, 'hubei'),
(14, 1, '湖南', 2, 'hunan'),
(15, 1, '吉林', 2, 'jilin'),
(16, 1, '江苏', 2, 'jiangsu'),
(17, 1, '江西', 2, 'jiangxi'),
(18, 1, '辽宁', 2, 'liaoning'),
(19, 1, '内蒙古', 2, 'neimenggu'),
(20, 1, '宁夏', 2, 'ningxia'),
(21, 1, '青海', 2, 'qinghai'),
(22, 1, '山东', 2, 'shandong'),
(23, 1, '山西', 2, 'shanxi'),
(24, 1, '陕西', 2, 'shanxi'),
(26, 1, '四川', 2, 'sichuan'),
(28, 1, '西藏', 2, 'xicang'),
(29, 1, '新疆', 2, 'xinjiang'),
(30, 1, '云南', 2, 'yunnan'),
(31, 1, '浙江', 2, 'zhejiang'),
(36, 3, '安庆', 3, 'anqing'),
(37, 3, '蚌埠', 3, 'bangbu'),
(38, 3, '巢湖', 3, 'chaohu'),
(39, 3, '池州', 3, 'chizhou'),
(40, 3, '滁州', 3, 'chuzhou'),
(41, 3, '阜阳', 3, 'fuyang'),
(42, 3, '淮北', 3, 'huaibei'),
(43, 3, '淮南', 3, 'huainan'),
(44, 3, '黄山', 3, 'huangshan'),
(45, 3, '六安', 3, 'liuan'),
(46, 3, '马鞍山', 3, 'maanshan'),
(47, 3, '宿州', 3, 'suzhou'),
(48, 3, '铜陵', 3, 'tongling'),
(49, 3, '芜湖', 3, 'wuhu'),
(50, 3, '宣城', 3, 'xuancheng'),
(51, 3, '亳州', 3, 'zhou'),
(52, 2, '北京', 2, 'beijing'),
(53, 4, '福州', 3, 'fuzhou'),
(54, 4, '龙岩', 3, 'longyan'),
(55, 4, '南平', 3, 'nanping'),
(56, 4, '宁德', 3, 'ningde'),
(57, 4, '莆田', 3, 'putian'),
(58, 4, '泉州', 3, 'quanzhou'),
(59, 4, '三明', 3, 'sanming'),
(60, 4, '厦门', 3, 'xiamen'),
(61, 4, '漳州', 3, 'zhangzhou'),
(62, 5, '兰州', 3, 'lanzhou'),
(63, 5, '白银', 3, 'baiyin'),
(64, 5, '定西', 3, 'dingxi'),
(65, 5, '甘南', 3, 'gannan'),
(66, 5, '嘉峪关', 3, 'jiayuguan'),
(67, 5, '金昌', 3, 'jinchang'),
(68, 5, '酒泉', 3, 'jiuquan'),
(69, 5, '临夏', 3, 'linxia'),
(70, 5, '陇南', 3, 'longnan'),
(71, 5, '平凉', 3, 'pingliang'),
(72, 5, '庆阳', 3, 'qingyang'),
(73, 5, '天水', 3, 'tianshui'),
(74, 5, '武威', 3, 'wuwei'),
(75, 5, '张掖', 3, 'zhangye'),
(76, 6, '广州', 3, 'guangzhou'),
(77, 6, '深圳', 3, 'shen'),
(78, 6, '潮州', 3, 'chaozhou'),
(79, 6, '东莞', 3, 'dong'),
(80, 6, '佛山', 3, 'foshan'),
(81, 6, '河源', 3, 'heyuan'),
(82, 6, '惠州', 3, 'huizhou'),
(83, 6, '江门', 3, 'jiangmen'),
(84, 6, '揭阳', 3, 'jieyang'),
(85, 6, '茂名', 3, 'maoming'),
(86, 6, '梅州', 3, 'meizhou'),
(87, 6, '清远', 3, 'qingyuan'),
(88, 6, '汕头', 3, 'shantou'),
(89, 6, '汕尾', 3, 'shanwei'),
(90, 6, '韶关', 3, 'shaoguan'),
(91, 6, '阳江', 3, 'yangjiang'),
(92, 6, '云浮', 3, 'yunfu'),
(93, 6, '湛江', 3, 'zhanjiang'),
(94, 6, '肇庆', 3, 'zhaoqing'),
(95, 6, '中山', 3, 'zhongshan'),
(96, 6, '珠海', 3, 'zhuhai'),
(97, 7, '南宁', 3, 'nanning'),
(98, 7, '桂林', 3, 'guilin'),
(99, 7, '百色', 3, 'baise'),
(100, 7, '北海', 3, 'beihai'),
(101, 7, '崇左', 3, 'chongzuo'),
(102, 7, '防城港', 3, 'fangchenggang'),
(103, 7, '贵港', 3, 'guigang'),
(104, 7, '河池', 3, 'hechi'),
(105, 7, '贺州', 3, 'hezhou'),
(106, 7, '来宾', 3, 'laibin'),
(107, 7, '柳州', 3, 'liuzhou'),
(108, 7, '钦州', 3, 'qinzhou'),
(109, 7, '梧州', 3, 'wuzhou'),
(110, 7, '玉林', 3, 'yulin'),
(111, 8, '贵阳', 3, 'guiyang'),
(112, 8, '安顺', 3, 'anshun'),
(113, 8, '毕节', 3, 'bijie'),
(114, 8, '六盘水', 3, 'liupanshui'),
(115, 8, '黔东南', 3, 'qiandongnan'),
(116, 8, '黔南', 3, 'qiannan'),
(117, 8, '黔西南', 3, 'qianxinan'),
(118, 8, '铜仁', 3, 'tongren'),
(119, 8, '遵义', 3, 'zunyi'),
(120, 9, '海口', 3, 'haikou'),
(121, 9, '三亚', 3, 'sanya'),
(122, 9, '白沙', 3, 'baisha'),
(123, 9, '保亭', 3, 'baoting'),
(124, 9, '昌江', 3, 'changjiang'),
(125, 9, '澄迈县', 3, 'chengmaixian'),
(126, 9, '定安县', 3, 'dinganxian'),
(127, 9, '东方', 3, 'dongfang'),
(128, 9, '乐东', 3, 'ledong'),
(129, 9, '临高县', 3, 'lingaoxian'),
(130, 9, '陵水', 3, 'lingshui'),
(131, 9, '琼海', 3, 'qionghai'),
(132, 9, '琼中', 3, 'qiongzhong'),
(133, 9, '屯昌县', 3, 'tunchangxian'),
(134, 9, '万宁', 3, 'wanning'),
(135, 9, '文昌', 3, 'wenchang'),
(136, 9, '五指山', 3, 'wuzhishan'),
(137, 9, '儋州', 3, 'zhou'),
(138, 10, '石家庄', 3, 'shijiazhuang'),
(139, 10, '保定', 3, 'baoding'),
(140, 10, '沧州', 3, 'cangzhou'),
(141, 10, '承德', 3, 'chengde'),
(142, 10, '邯郸', 3, 'handan'),
(143, 10, '衡水', 3, 'hengshui'),
(144, 10, '廊坊', 3, 'langfang'),
(145, 10, '秦皇岛', 3, 'qinhuangdao'),
(146, 10, '唐山', 3, 'tangshan'),
(147, 10, '邢台', 3, 'xingtai'),
(148, 10, '张家口', 3, 'zhangjiakou'),
(149, 11, '郑州', 3, 'zhengzhou'),
(150, 11, '洛阳', 3, 'luoyang'),
(151, 11, '开封', 3, 'kaifeng'),
(152, 11, '安阳', 3, 'anyang'),
(153, 11, '鹤壁', 3, 'hebi'),
(154, 11, '济源', 3, 'jiyuan'),
(155, 11, '焦作', 3, 'jiaozuo'),
(156, 11, '南阳', 3, 'nanyang'),
(157, 11, '平顶山', 3, 'pingdingshan'),
(158, 11, '三门峡', 3, 'sanmenxia'),
(159, 11, '商丘', 3, 'shangqiu'),
(160, 11, '新乡', 3, 'xinxiang'),
(161, 11, '信阳', 3, 'xinyang'),
(162, 11, '许昌', 3, 'xuchang'),
(163, 11, '周口', 3, 'zhoukou'),
(164, 11, '驻马店', 3, 'zhumadian'),
(165, 11, '漯河', 3, 'he'),
(166, 11, '濮阳', 3, 'yang'),
(167, 12, '哈尔滨', 3, 'haerbin'),
(168, 12, '大庆', 3, 'daqing'),
(169, 12, '大兴安岭', 3, 'daxinganling'),
(170, 12, '鹤岗', 3, 'hegang'),
(171, 12, '黑河', 3, 'heihe'),
(172, 12, '鸡西', 3, 'jixi'),
(173, 12, '佳木斯', 3, 'jiamusi'),
(174, 12, '牡丹江', 3, 'mudanjiang'),
(175, 12, '七台河', 3, 'qitaihe'),
(176, 12, '齐齐哈尔', 3, 'qiqihaer'),
(177, 12, '双鸭山', 3, 'shuangyashan'),
(178, 12, '绥化', 3, 'suihua'),
(179, 12, '伊春', 3, 'yichun'),
(180, 13, '武汉', 3, 'wuhan'),
(181, 13, '仙桃', 3, 'xiantao'),
(182, 13, '鄂州', 3, 'ezhou'),
(183, 13, '黄冈', 3, 'huanggang'),
(184, 13, '黄石', 3, 'huangshi'),
(185, 13, '荆门', 3, 'jingmen'),
(186, 13, '荆州', 3, 'jingzhou'),
(187, 13, '潜江', 3, 'qianjiang'),
(188, 13, '神农架林区', 3, 'shennongjialinqu'),
(189, 13, '十堰', 3, 'shiyan'),
(190, 13, '随州', 3, 'suizhou'),
(191, 13, '天门', 3, 'tianmen'),
(192, 13, '咸宁', 3, 'xianning'),
(193, 13, '襄樊', 3, 'xiangfan'),
(194, 13, '孝感', 3, 'xiaogan'),
(195, 13, '宜昌', 3, 'yichang'),
(196, 13, '恩施', 3, 'enshi'),
(197, 14, '长沙', 3, 'changsha'),
(198, 14, '张家界', 3, 'zhangjiajie'),
(199, 14, '常德', 3, 'changde'),
(200, 14, '郴州', 3, 'chenzhou'),
(201, 14, '衡阳', 3, 'hengyang'),
(202, 14, '怀化', 3, 'huaihua'),
(203, 14, '娄底', 3, 'loudi'),
(204, 14, '邵阳', 3, 'shaoyang'),
(205, 14, '湘潭', 3, 'xiangtan'),
(206, 14, '湘西', 3, 'xiangxi'),
(207, 14, '益阳', 3, 'yiyang'),
(208, 14, '永州', 3, 'yongzhou'),
(209, 14, '岳阳', 3, 'yueyang'),
(210, 14, '株洲', 3, 'zhuzhou'),
(211, 15, '长春', 3, 'changchun'),
(212, 15, '吉林', 3, 'jilin'),
(213, 15, '白城', 3, 'baicheng'),
(214, 15, '白山', 3, 'baishan'),
(215, 15, '辽源', 3, 'liaoyuan'),
(216, 15, '四平', 3, 'siping'),
(217, 15, '松原', 3, 'songyuan'),
(218, 15, '通化', 3, 'tonghua'),
(219, 15, '延边', 3, 'yanbian'),
(220, 16, '南京', 3, 'nanjing'),
(221, 16, '苏州', 3, 'suzhou'),
(222, 16, '无锡', 3, 'wuxi'),
(223, 16, '常州', 3, 'changzhou'),
(224, 16, '淮安', 3, 'huaian'),
(225, 16, '连云港', 3, 'lianyungang'),
(226, 16, '南通', 3, 'nantong'),
(227, 16, '宿迁', 3, 'suqian'),
(228, 16, '泰州', 3, 'taizhou'),
(229, 16, '徐州', 3, 'xuzhou'),
(230, 16, '盐城', 3, 'yancheng'),
(231, 16, '扬州', 3, 'yangzhou'),
(232, 16, '镇江', 3, 'zhenjiang'),
(233, 17, '南昌', 3, 'nanchang'),
(234, 17, '抚州', 3, 'fuzhou'),
(235, 17, '赣州', 3, 'ganzhou'),
(236, 17, '吉安', 3, 'jian'),
(237, 17, '景德镇', 3, 'jingdezhen'),
(238, 17, '九江', 3, 'jiujiang'),
(239, 17, '萍乡', 3, 'pingxiang'),
(240, 17, '上饶', 3, 'shangrao'),
(241, 17, '新余', 3, 'xinyu'),
(242, 17, '宜春', 3, 'yichun'),
(243, 17, '鹰潭', 3, 'yingtan'),
(244, 18, '沈阳', 3, 'shenyang'),
(245, 18, '大连', 3, 'dalian'),
(246, 18, '鞍山', 3, 'anshan'),
(247, 18, '本溪', 3, 'benxi'),
(248, 18, '朝阳', 3, 'chaoyang'),
(249, 18, '丹东', 3, 'dandong'),
(250, 18, '抚顺', 3, 'fushun'),
(251, 18, '阜新', 3, 'fuxin'),
(252, 18, '葫芦岛', 3, 'huludao'),
(253, 18, '锦州', 3, 'jinzhou'),
(254, 18, '辽阳', 3, 'liaoyang'),
(255, 18, '盘锦', 3, 'panjin'),
(256, 18, '铁岭', 3, 'tieling'),
(257, 18, '营口', 3, 'yingkou'),
(258, 19, '呼和浩特', 3, 'huhehaote'),
(259, 19, '阿拉善盟', 3, 'alashanmeng'),
(260, 19, '巴彦淖尔盟', 3, 'bayannaoermeng'),
(261, 19, '包头', 3, 'baotou'),
(262, 19, '赤峰', 3, 'chifeng'),
(263, 19, '鄂尔多斯', 3, 'eerduosi'),
(264, 19, '呼伦贝尔', 3, 'hulunbeier'),
(265, 19, '通辽', 3, 'tongliao'),
(266, 19, '乌海', 3, 'wuhai'),
(267, 19, '乌兰察布市', 3, 'wulanchabushi'),
(268, 19, '锡林郭勒盟', 3, 'xilinguolemeng'),
(269, 19, '兴安盟', 3, 'xinganmeng'),
(270, 20, '银川', 3, 'yinchuan'),
(271, 20, '固原', 3, 'guyuan'),
(272, 20, '石嘴山', 3, 'shizuishan'),
(273, 20, '吴忠', 3, 'wuzhong'),
(274, 20, '中卫', 3, 'zhongwei'),
(275, 21, '西宁', 3, 'xining'),
(276, 21, '果洛', 3, 'guoluo'),
(277, 21, '海北', 3, 'haibei'),
(278, 21, '海东', 3, 'haidong'),
(279, 21, '海南', 3, 'hainan'),
(280, 21, '海西', 3, 'haixi'),
(281, 21, '黄南', 3, 'huangnan'),
(282, 21, '玉树', 3, 'yushu'),
(283, 22, '济南', 3, 'jinan'),
(284, 22, '青岛', 3, 'qingdao'),
(285, 22, '滨州', 3, 'binzhou'),
(286, 22, '德州', 3, 'dezhou'),
(287, 22, '东营', 3, 'dongying'),
(288, 22, '菏泽', 3, 'heze'),
(289, 22, '济宁', 3, 'jining'),
(290, 22, '莱芜', 3, 'laiwu'),
(291, 22, '聊城', 3, 'liaocheng'),
(292, 22, '临沂', 3, 'linyi'),
(293, 22, '日照', 3, 'rizhao'),
(294, 22, '泰安', 3, 'taian'),
(295, 22, '威海', 3, 'weihai'),
(296, 22, '潍坊', 3, 'weifang'),
(297, 22, '烟台', 3, 'yantai'),
(298, 22, '枣庄', 3, 'zaozhuang'),
(299, 22, '淄博', 3, 'zibo'),
(300, 23, '太原', 3, 'taiyuan'),
(301, 23, '长治', 3, 'changzhi'),
(302, 23, '大同', 3, 'datong'),
(303, 23, '晋城', 3, 'jincheng'),
(304, 23, '晋中', 3, 'jinzhong'),
(305, 23, '临汾', 3, 'linfen'),
(306, 23, '吕梁', 3, 'lvliang'),
(307, 23, '朔州', 3, 'shuozhou'),
(308, 23, '忻州', 3, 'xinzhou'),
(309, 23, '阳泉', 3, 'yangquan'),
(310, 23, '运城', 3, 'yuncheng'),
(311, 24, '西安', 3, 'xian'),
(312, 24, '安康', 3, 'ankang'),
(313, 24, '宝鸡', 3, 'baoji'),
(314, 24, '汉中', 3, 'hanzhong'),
(315, 24, '商洛', 3, 'shangluo'),
(316, 24, '铜川', 3, 'tongchuan'),
(317, 24, '渭南', 3, 'weinan'),
(318, 24, '咸阳', 3, 'xianyang'),
(319, 24, '延安', 3, 'yanan'),
(320, 24, '榆林', 3, 'yulin'),
(321, 25, '上海', 2, 'shanghai'),
(322, 26, '成都', 3, 'chengdu'),
(323, 26, '绵阳', 3, 'mianyang'),
(324, 26, '阿坝', 3, 'aba'),
(325, 26, '巴中', 3, 'bazhong'),
(326, 26, '达州', 3, 'dazhou'),
(327, 26, '德阳', 3, 'deyang'),
(328, 26, '甘孜', 3, 'ganzi'),
(329, 26, '广安', 3, 'guangan'),
(330, 26, '广元', 3, 'guangyuan'),
(331, 26, '乐山', 3, 'leshan'),
(332, 26, '凉山', 3, 'liangshan'),
(333, 26, '眉山', 3, 'meishan'),
(334, 26, '南充', 3, 'nanchong'),
(335, 26, '内江', 3, 'neijiang'),
(336, 26, '攀枝花', 3, 'panzhihua'),
(337, 26, '遂宁', 3, 'suining'),
(338, 26, '雅安', 3, 'yaan'),
(339, 26, '宜宾', 3, 'yibin'),
(340, 26, '资阳', 3, 'ziyang'),
(341, 26, '自贡', 3, 'zigong'),
(342, 26, '泸州', 3, 'zhou'),
(343, 27, '天津', 2, 'tianjin'),
(344, 28, '拉萨', 3, 'lasa'),
(345, 28, '阿里', 3, 'ali'),
(346, 28, '昌都', 3, 'changdu'),
(347, 28, '林芝', 3, 'linzhi'),
(348, 28, '那曲', 3, 'naqu'),
(349, 28, '日喀则', 3, 'rikaze'),
(350, 28, '山南', 3, 'shannan'),
(351, 29, '乌鲁木齐', 3, 'wulumuqi'),
(352, 29, '阿克苏', 3, 'akesu'),
(353, 29, '阿拉尔', 3, 'alaer'),
(354, 29, '巴音郭楞', 3, 'bayinguoleng'),
(355, 29, '博尔塔拉', 3, 'boertala'),
(356, 29, '昌吉', 3, 'changji'),
(357, 29, '哈密', 3, 'hami'),
(358, 29, '和田', 3, 'hetian'),
(359, 29, '喀什', 3, 'kashi'),
(360, 29, '克拉玛依', 3, 'kelamayi'),
(361, 29, '克孜勒苏', 3, 'kezilesu'),
(362, 29, '石河子', 3, 'shihezi'),
(363, 29, '图木舒克', 3, 'tumushuke'),
(364, 29, '吐鲁番', 3, 'tulufan'),
(365, 29, '五家渠', 3, 'wujiaqu'),
(366, 29, '伊犁', 3, 'yili'),
(367, 30, '昆明', 3, 'kunming'),
(368, 30, '怒江', 3, 'nujiang'),
(369, 30, '普洱', 3, 'puer'),
(370, 30, '丽江', 3, 'lijiang'),
(371, 30, '保山', 3, 'baoshan'),
(372, 30, '楚雄', 3, 'chuxiong'),
(373, 30, '大理', 3, 'dali'),
(374, 30, '德宏', 3, 'dehong'),
(375, 30, '迪庆', 3, 'diqing'),
(376, 30, '红河', 3, 'honghe'),
(377, 30, '临沧', 3, 'lincang'),
(378, 30, '曲靖', 3, 'qujing'),
(379, 30, '文山', 3, 'wenshan'),
(380, 30, '西双版纳', 3, 'xishuangbanna'),
(381, 30, '玉溪', 3, 'yuxi'),
(382, 30, '昭通', 3, 'zhaotong'),
(383, 31, '杭州', 3, 'hangzhou'),
(384, 31, '湖州', 3, 'huzhou'),
(385, 31, '嘉兴', 3, 'jiaxing'),
(386, 31, '金华', 3, 'jinhua'),
(387, 31, '丽水', 3, 'lishui'),
(388, 31, '宁波', 3, 'ningbo'),
(389, 31, '绍兴', 3, 'shaoxing'),
(390, 31, '台州', 3, 'taizhou'),
(391, 31, '温州', 3, 'wenzhou'),
(392, 31, '舟山', 3, 'zhoushan'),
(393, 31, '衢州', 3, 'zhou'),
(394, 32, '重庆', 2, 'zhongqing'),
(395, 33, '香港', 2, 'xianggang'),
(396, 34, '澳门', 2, 'aomen'),
(397, 35, '台湾', 2, 'taiwan'),
(500, 52, '东城区', 3, 'dongchengqu'),
(501, 52, '西城区', 3, 'xichengqu'),
(502, 52, '海淀区', 3, 'haidianqu'),
(503, 52, '朝阳区', 3, 'chaoyangqu'),
(504, 52, '崇文区', 3, 'chongwenqu'),
(505, 52, '宣武区', 3, 'xuanwuqu'),
(506, 52, '丰台区', 3, 'fengtaiqu'),
(507, 52, '石景山区', 3, 'shijingshanqu'),
(508, 52, '房山区', 3, 'fangshanqu'),
(509, 52, '门头沟区', 3, 'mentougouqu'),
(510, 52, '通州区', 3, 'tongzhouqu'),
(511, 52, '顺义区', 3, 'shunyiqu'),
(512, 52, '昌平区', 3, 'changpingqu'),
(513, 52, '怀柔区', 3, 'huairouqu'),
(514, 52, '平谷区', 3, 'pingguqu'),
(515, 52, '大兴区', 3, 'daxingqu'),
(516, 52, '密云县', 3, 'miyunxian'),
(517, 52, '延庆县', 3, 'yanqingxian'),
(2703, 321, '长宁区', 3, 'changningqu'),
(2704, 321, '闸北区', 3, 'zhabeiqu'),
(2705, 321, '闵行区', 3, 'xingqu'),
(2706, 321, '徐汇区', 3, 'xuhuiqu'),
(2707, 321, '浦东新区', 3, 'pudongxinqu'),
(2708, 321, '杨浦区', 3, 'yangpuqu'),
(2709, 321, '普陀区', 3, 'putuoqu'),
(2710, 321, '静安区', 3, 'jinganqu'),
(2711, 321, '卢湾区', 3, 'luwanqu'),
(2712, 321, '虹口区', 3, 'hongkouqu'),
(2713, 321, '黄浦区', 3, 'huangpuqu'),
(2714, 321, '南汇区', 3, 'nanhuiqu'),
(2715, 321, '松江区', 3, 'songjiangqu'),
(2716, 321, '嘉定区', 3, 'jiadingqu'),
(2717, 321, '宝山区', 3, 'baoshanqu'),
(2718, 321, '青浦区', 3, 'qingpuqu'),
(2719, 321, '金山区', 3, 'jinshanqu'),
(2720, 321, '奉贤区', 3, 'fengxianqu'),
(2721, 321, '崇明县', 3, 'chongmingxian'),
(2912, 343, '和平区', 3, 'hepingqu'),
(2913, 343, '河西区', 3, 'hexiqu'),
(2914, 343, '南开区', 3, 'nankaiqu'),
(2915, 343, '河北区', 3, 'hebeiqu'),
(2916, 343, '河东区', 3, 'hedongqu'),
(2917, 343, '红桥区', 3, 'hongqiaoqu'),
(2918, 343, '东丽区', 3, 'dongliqu'),
(2919, 343, '津南区', 3, 'jinnanqu'),
(2920, 343, '西青区', 3, 'xiqingqu'),
(2921, 343, '北辰区', 3, 'beichenqu'),
(2922, 343, '塘沽区', 3, 'tangguqu'),
(2923, 343, '汉沽区', 3, 'hanguqu'),
(2924, 343, '大港区', 3, 'dagangqu'),
(2925, 343, '武清区', 3, 'wuqingqu'),
(2926, 343, '宝坻区', 3, 'baoqu'),
(2927, 343, '经济开发区', 3, 'jingjikaifaqu'),
(2928, 343, '宁河县', 3, 'ninghexian'),
(2929, 343, '静海县', 3, 'jinghaixian'),
(2930, 343, '蓟县', 3, 'jixian'),
(3325, 394, '合川区', 3, 'hechuanqu'),
(3326, 394, '江津区', 3, 'jiangjinqu'),
(3327, 394, '南川区', 3, 'nanchuanqu'),
(3328, 394, '永川区', 3, 'yongchuanqu'),
(3329, 394, '南岸区', 3, 'nananqu'),
(3330, 394, '渝北区', 3, 'yubeiqu'),
(3331, 394, '万盛区', 3, 'wanshengqu'),
(3332, 394, '大渡口区', 3, 'dadukouqu'),
(3333, 394, '万州区', 3, 'wanzhouqu'),
(3334, 394, '北碚区', 3, 'beiqu'),
(3335, 394, '沙坪坝区', 3, 'shapingbaqu'),
(3336, 394, '巴南区', 3, 'bananqu'),
(3337, 394, '涪陵区', 3, 'fulingqu'),
(3338, 394, '江北区', 3, 'jiangbeiqu'),
(3339, 394, '九龙坡区', 3, 'jiulongpoqu'),
(3340, 394, '渝中区', 3, 'yuzhongqu'),
(3341, 394, '黔江开发区', 3, 'qianjiangkaifaqu'),
(3342, 394, '长寿区', 3, 'changshouqu'),
(3343, 394, '双桥区', 3, 'shuangqiaoqu'),
(3344, 394, '綦江县', 3, 'jiangxian'),
(3345, 394, '潼南县', 3, 'nanxian'),
(3346, 394, '铜梁县', 3, 'tongliangxian'),
(3347, 394, '大足县', 3, 'dazuxian'),
(3348, 394, '荣昌县', 3, 'rongchangxian'),
(3349, 394, '璧山县', 3, 'shanxian'),
(3350, 394, '垫江县', 3, 'dianjiangxian'),
(3351, 394, '武隆县', 3, 'wulongxian'),
(3352, 394, '丰都县', 3, 'fengduxian'),
(3353, 394, '城口县', 3, 'chengkouxian'),
(3354, 394, '梁平县', 3, 'liangpingxian'),
(3355, 394, '开县', 3, 'kaixian'),
(3356, 394, '巫溪县', 3, 'wuxixian'),
(3357, 394, '巫山县', 3, 'wushanxian'),
(3358, 394, '奉节县', 3, 'fengjiexian'),
(3359, 394, '云阳县', 3, 'yunyangxian'),
(3360, 394, '忠县', 3, 'zhongxian'),
(3361, 394, '石柱', 3, 'shizhu'),
(3362, 394, '彭水', 3, 'pengshui'),
(3363, 394, '酉阳', 3, 'youyang'),
(3364, 394, '秀山', 3, 'xiushan'),
(3365, 395, '沙田区', 3, 'shatianqu'),
(3366, 395, '东区', 3, 'dongqu'),
(3367, 395, '观塘区', 3, 'guantangqu'),
(3368, 395, '黄大仙区', 3, 'huangdaxianqu'),
(3369, 395, '九龙城区', 3, 'jiulongchengqu'),
(3370, 395, '屯门区', 3, 'tunmenqu'),
(3371, 395, '葵青区', 3, 'kuiqingqu'),
(3372, 395, '元朗区', 3, 'yuanlangqu'),
(3373, 395, '深水埗区', 3, 'shenshui'),
(3374, 395, '西贡区', 3, 'xigongqu'),
(3375, 395, '大埔区', 3, 'dapuqu'),
(3376, 395, '湾仔区', 3, 'wanziqu'),
(3377, 395, '油尖旺区', 3, 'youjianwangqu'),
(3378, 395, '北区', 3, 'beiqu'),
(3379, 395, '南区', 3, 'nanqu'),
(3380, 395, '荃湾区', 3, 'wanqu'),
(3381, 395, '中西区', 3, 'zhongxiqu'),
(3382, 395, '离岛区', 3, 'lidaoqu'),
(3383, 396, '澳门', 3, 'aomen'),
(3384, 397, '台北', 3, 'taibei'),
(3385, 397, '高雄', 3, 'gaoxiong'),
(3386, 397, '基隆', 3, 'jilong'),
(3387, 397, '台中', 3, 'taizhong'),
(3388, 397, '台南', 3, 'tainan'),
(3389, 397, '新竹', 3, 'xinzhu'),
(3390, 397, '嘉义', 3, 'jiayi'),
(3391, 397, '宜兰县', 3, 'yilanxian'),
(3392, 397, '桃园县', 3, 'taoyuanxian'),
(3393, 397, '苗栗县', 3, 'miaolixian'),
(3394, 397, '彰化县', 3, 'zhanghuaxian'),
(3395, 397, '南投县', 3, 'nantouxian'),
(3396, 397, '云林县', 3, 'yunlinxian'),
(3397, 397, '屏东县', 3, 'pingdongxian'),
(3398, 397, '台东县', 3, 'taidongxian'),
(3399, 397, '花莲县', 3, 'hualianxian'),
(3400, 397, '澎湖县', 3, 'penghuxian');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_remind_count`
--

CREATE TABLE IF NOT EXISTS `fanwe_remind_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_count` int(11) NOT NULL COMMENT '分享数',
  `topic_count_time` int(11) NOT NULL,
  `dp_count` int(11) NOT NULL,
  `dp_count_time` int(11) NOT NULL,
  `msg_count` int(11) NOT NULL COMMENT '会员留言',
  `msg_count_time` int(11) NOT NULL,
  `buy_msg_count` int(11) NOT NULL,
  `buy_msg_count_time` int(11) NOT NULL,
  `order_count` int(11) NOT NULL,
  `order_count_time` int(11) NOT NULL,
  `refund_count` int(11) NOT NULL,
  `refund_count_time` int(11) NOT NULL,
  `retake_count` int(11) NOT NULL,
  `retake_count_time` int(11) NOT NULL,
  `incharge_count` int(11) NOT NULL,
  `incharge_count_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `fanwe_remind_count`
--

INSERT INTO `fanwe_remind_count` (`id`, `topic_count`, `topic_count_time`, `dp_count`, `dp_count_time`, `msg_count`, `msg_count_time`, `buy_msg_count`, `buy_msg_count_time`, `order_count`, `order_count_time`, `refund_count`, `refund_count_time`, `retake_count`, `retake_count_time`, `incharge_count`, `incharge_count_time`) VALUES
(1, 35, 0, 3, 0, 1, 0, 0, 0, 0, 1345226482, 0, 1345226482, 0, 1345226482, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_role`
--

CREATE TABLE IF NOT EXISTS `fanwe_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `fanwe_role`
--

INSERT INTO `fanwe_role` (`id`, `name`, `is_effect`, `is_delete`) VALUES
(4, '测试管理员', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_role_access`
--

CREATE TABLE IF NOT EXISTS `fanwe_role_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `node_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_role_group`
--

CREATE TABLE IF NOT EXISTS `fanwe_role_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `nav_id` int(11) NOT NULL COMMENT '???????????ID',
  `is_delete` tinyint(1) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=79 ;

--
-- 转存表中的数据 `fanwe_role_group`
--

INSERT INTO `fanwe_role_group` (`id`, `name`, `nav_id`, `is_delete`, `is_effect`, `sort`) VALUES
(1, '首页', 1, 0, 1, 1),
(5, '系统设置', 3, 0, 1, 1),
(7, '管理员', 3, 0, 1, 2),
(8, '数据库操作', 3, 0, 1, 6),
(9, '系统日志', 3, 0, 1, 7),
(19, '菜单设置', 3, 0, 1, 17),
(28, '邮件管理', 10, 0, 1, 26),
(29, '短信管理', 10, 0, 1, 27),
(31, '广告设置', 3, 0, 1, 29),
(33, '队列管理', 10, 0, 1, 31),
(69, '会员管理', 5, 0, 1, 31),
(70, '会员整合', 5, 0, 1, 32),
(71, '同步登录', 5, 0, 1, 33),
(72, '项目管理', 13, 0, 1, 33),
(73, '项目支持', 13, 0, 1, 34),
(74, '项目点评', 13, 0, 1, 35),
(75, '支付接口', 14, 0, 1, 1),
(76, '付款记录', 14, 0, 1, 2),
(77, '消息模板', 10, 0, 1, 1),
(78, '提现记录', 14, 0, 1, 3);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_role_module`
--

CREATE TABLE IF NOT EXISTS `fanwe_role_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=127 ;

--
-- 转存表中的数据 `fanwe_role_module`
--

INSERT INTO `fanwe_role_module` (`id`, `module`, `name`, `is_effect`, `is_delete`) VALUES
(5, 'Role', '权限组别', 1, 0),
(6, 'Admin', '管理员', 1, 0),
(12, 'Conf', '系统配置', 1, 0),
(13, 'Database', '数据库', 1, 0),
(15, 'Log', '系统日志', 1, 0),
(19, 'File', '文件管理', 1, 0),
(58, 'Index', '首页', 1, 0),
(36, 'Nav', '导航菜单', 1, 0),
(47, 'MailServer', '邮件服务器', 1, 0),
(48, 'Sms', '短信接口', 1, 0),
(53, 'Adv', '广告模块', 1, 0),
(56, 'DealMsgList', '业务群发队列', 1, 0),
(92, 'Cache', '缓存处理', 1, 0),
(113, 'User', '会员管理', 1, 0),
(114, 'MsgTemplate', '消息模板管理', 1, 0),
(115, 'Integrate', '会员整合', 1, 0),
(116, 'ApiLogin', '同步登录', 1, 0),
(117, 'DealCate', '项目分类', 1, 0),
(118, 'Deal', '项目管理', 1, 0),
(119, 'Payment', '支付接口', 1, 0),
(120, 'IndexImage', '轮播广告图', 1, 0),
(121, 'Help', '站点帮助', 1, 0),
(122, 'Faq', '常见问题', 1, 0),
(123, 'DealOrder', '项目支持', 1, 0),
(124, 'DealComment', '项目点评', 1, 0),
(125, 'PaymentNotice', '付款记录', 1, 0),
(126, 'UserRefund', '用户提现', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_role_nav`
--

CREATE TABLE IF NOT EXISTS `fanwe_role_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `fanwe_role_nav`
--

INSERT INTO `fanwe_role_nav` (`id`, `name`, `is_delete`, `is_effect`, `sort`) VALUES
(1, '首页', 0, 1, 1),
(3, '系统设置', 0, 1, 10),
(5, '会员管理', 0, 1, 3),
(10, '短信邮件', 0, 1, 7),
(13, '项目管理', 0, 1, 4),
(14, '支付管理', 0, 1, 5);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_role_node`
--

CREATE TABLE IF NOT EXISTS `fanwe_role_node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `group_id` int(11) NOT NULL COMMENT '??????????????ID',
  `module_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=667 ;

--
-- 转存表中的数据 `fanwe_role_node`
--

INSERT INTO `fanwe_role_node` (`id`, `action`, `name`, `is_effect`, `is_delete`, `group_id`, `module_id`) VALUES
(334, 'main', '首页', 1, 0, 1, 58),
(11, 'index', '管理员分组列表', 1, 0, 7, 5),
(13, 'trash', '管理员分组回收站', 1, 0, 7, 5),
(14, 'index', '管理员列表', 1, 0, 7, 6),
(15, 'trash', '管理员回收站', 1, 0, 7, 6),
(16, 'index', '系统配置', 1, 0, 5, 12),
(17, 'index', '数据库备份列表', 1, 0, 8, 13),
(18, 'sql', 'SQL操作', 1, 0, 8, 13),
(19, 'index', '系统日志列表', 1, 0, 9, 15),
(24, 'do_upload', '编辑器图片上传', 1, 0, 0, 19),
(43, 'index', '导航菜单列表', 1, 0, 19, 36),
(57, 'index', '邮件服务器列表', 1, 0, 28, 47),
(58, 'index', '短信接口列表', 1, 0, 29, 48),
(63, 'index', '广告列表', 1, 0, 31, 53),
(66, 'index', '业务队列列表', 1, 0, 33, 56),
(68, 'add', '添加页面', 1, 0, 0, 6),
(69, 'edit', '编辑页面', 1, 0, 0, 6),
(70, 'set_effect', '设置生效', 1, 0, 0, 6),
(71, 'add', '添加执行', 1, 0, 0, 6),
(72, 'update', '编辑执行', 1, 0, 0, 6),
(73, 'delete', '删除', 1, 0, 0, 6),
(74, 'restore', '恢复', 1, 0, 0, 6),
(75, 'foreverdelete', '永久删除', 1, 0, 0, 6),
(76, 'set_default', '设置默认管理员', 1, 0, 0, 6),
(77, 'add', '添加页面', 1, 0, 0, 53),
(78, 'edit', '编辑页面', 1, 0, 0, 53),
(79, 'update', '编辑执行', 1, 0, 0, 53),
(80, 'foreverdelete', '永久删除', 1, 0, 0, 53),
(81, 'set_effect', '设置生效', 1, 0, 0, 53),
(99, 'update', '更新配置', 1, 0, 0, 12),
(100, 'dump', '备份数据', 1, 0, 0, 13),
(101, 'delete', '删除备份', 1, 0, 0, 13),
(102, 'restore', '恢复备份', 1, 0, 0, 13),
(103, 'load_file', '读取页面', 1, 0, 0, 53),
(104, 'load_adv_id', '读取广告位', 1, 0, 0, 53),
(105, 'execute', '执行SQL语句', 1, 0, 0, 13),
(147, 'show_content', '显示内容', 1, 0, 0, 56),
(148, 'send', '手动发送', 1, 0, 0, 56),
(149, 'foreverdelete', '永久删除', 1, 0, 0, 56),
(181, 'do_upload_img', '图片控件上传', 1, 0, 0, 19),
(182, 'deleteImg', '删除图片', 1, 0, 0, 19),
(198, 'foreverdelete', '永久删除', 1, 0, 0, 15),
(205, 'add', '添加页面', 1, 0, 0, 47),
(206, 'insert', '添加执行', 1, 0, 0, 47),
(207, 'edit', '编辑页面', 1, 0, 0, 47),
(208, 'update', '编辑执行', 1, 0, 0, 47),
(209, 'set_effect', '设置生效', 1, 0, 0, 47),
(210, 'foreverdelete', '永久删除', 1, 0, 0, 47),
(211, 'send_demo', '发送测试邮件', 1, 0, 0, 47),
(229, 'edit', '编辑页面', 1, 0, 0, 36),
(230, 'update', '编辑执行', 1, 0, 0, 36),
(231, 'set_effect', '设置生效', 1, 0, 0, 36),
(232, 'set_sort', '排序', 1, 0, 0, 36),
(257, 'add', '添加页面', 1, 0, 0, 5),
(258, 'insert', '添加执行', 1, 0, 0, 5),
(259, 'edit', '编辑页面', 1, 0, 0, 5),
(260, 'update', '编辑执行', 1, 0, 0, 5),
(261, 'set_effect', '设置生效', 1, 0, 0, 5),
(262, 'delete', '删除', 1, 0, 0, 5),
(263, 'restore', '恢复', 1, 0, 0, 5),
(264, 'foreverdelete', '永久删除', 1, 0, 0, 5),
(265, 'insert', '安装页面', 1, 0, 0, 48),
(266, 'insert', '安装保存', 1, 0, 0, 48),
(267, 'edit', '编辑页面', 1, 0, 0, 48),
(268, 'update', '编辑执行', 1, 0, 0, 48),
(269, 'uninstall', '卸载', 1, 0, 0, 48),
(270, 'set_effect', '设置生效', 1, 0, 0, 48),
(271, 'send_demo', '发送测试短信', 1, 0, 0, 48),
(474, 'index', '缓存处理', 1, 0, 0, 92),
(475, 'clear_parse_file', '清空脚本样式缓存', 1, 0, 0, 92),
(477, 'clear_data', '清空数据缓存', 1, 0, 0, 92),
(480, 'syn_data', '同步数据', 1, 0, 0, 92),
(481, 'clear_image', '清空图片缓存', 1, 0, 0, 92),
(482, 'clear_admin', '清空后台缓存', 1, 0, 0, 92),
(605, 'index', '消息模板', 1, 0, 77, 114),
(606, 'update', '更新模板', 1, 0, 0, 114),
(607, 'index', '会员列表', 1, 0, 69, 113),
(608, 'add', '添加会员', 1, 0, 0, 113),
(609, 'insert', '添提执行', 1, 0, 0, 113),
(610, 'edit', '编辑会员', 1, 0, 0, 113),
(611, 'update', '编辑执行', 1, 0, 0, 113),
(612, 'delete', '删除会员', 1, 0, 0, 113),
(613, 'modify_account', '会员资金变更', 1, 0, 0, 113),
(614, 'account_detail', '帐户日志', 1, 0, 0, 113),
(615, 'foreverdelete_account_detail', '删除帐户日志', 1, 0, 0, 113),
(616, 'consignee', '配送地址', 1, 0, 0, 113),
(617, 'foreverdelete_consignee', '删除配送地址', 1, 0, 0, 113),
(618, 'weibo', '微博列表', 1, 0, 0, 113),
(619, 'foreverdelete_weibo', '删除微博', 1, 0, 0, 113),
(620, 'index', '会员整合', 1, 0, 70, 115),
(621, 'save', '执行整合', 1, 0, 0, 115),
(622, 'uninstall', '卸载整合', 1, 0, 0, 115),
(623, 'index', '同步登录接口', 1, 0, 71, 116),
(624, 'insert', '安装接口', 1, 0, 0, 116),
(625, 'update', '更新配置', 1, 0, 0, 116),
(626, 'uninstall', '卸载接口', 1, 0, 0, 116),
(627, 'index', '分类列表', 1, 0, 72, 117),
(628, 'insert', '添加分类', 1, 0, 0, 117),
(629, 'update', '更新分类', 1, 0, 0, 117),
(630, 'foreverdelete', '删除分类', 1, 0, 0, 117),
(631, 'online_index', '上线项目列表', 1, 0, 72, 118),
(632, 'submit_index', '未审核项目', 1, 0, 72, 118),
(633, 'index', '支付接口列表', 1, 0, 75, 119),
(634, 'insert', '安装支付接口', 1, 0, 0, 119),
(635, 'update', '更新支付接口', 1, 0, 0, 119),
(636, 'uninstall', '卸载接口', 1, 0, 0, 119),
(637, 'index', '轮播广告设置', 1, 0, 5, 120),
(638, 'insert', '添加广告', 1, 0, 0, 120),
(639, 'update', '修改广告', 1, 0, 0, 120),
(640, 'foreverdelete', '删除广告', 1, 0, 0, 120),
(641, 'delete_index', '回收站', 1, 0, 72, 118),
(642, 'index', '帮助列表', 1, 0, 5, 121),
(643, 'insert', '添加帮助', 1, 0, 0, 121),
(644, 'update', '修改帮助', 1, 0, 0, 121),
(645, 'foreverdelete', '删除帮助', 1, 0, 0, 121),
(646, 'index', '常见问题', 1, 0, 5, 122),
(647, 'insert', '添加问题', 1, 0, 0, 122),
(648, 'update', '更新问题', 1, 0, 0, 122),
(649, 'foreverdelete', '删除问题', 1, 0, 0, 122),
(650, 'pay_log', '筹款发放', 1, 0, 0, 118),
(651, 'save_pay_log', '发放', 1, 0, 0, 118),
(652, 'del_pay_log', '删除发放', 1, 0, 0, 118),
(653, 'deal_log', '项目日志', 1, 0, 0, 118),
(654, 'del_deal_log', '删除日志', 1, 0, 0, 118),
(655, 'batch_refund', '批量退款', 1, 0, 0, 118),
(656, 'index', '项目支持', 1, 0, 73, 123),
(657, 'view', '查看详情', 1, 0, 0, 123),
(658, 'refund', '项目退款', 1, 0, 0, 123),
(659, 'delete', '删除支持', 1, 0, 0, 123),
(660, 'incharge', '项目收款', 1, 0, 0, 123),
(661, 'index', '项目点评', 1, 0, 74, 124),
(662, 'index', '付款记录', 1, 0, 76, 125),
(663, 'delete', '删除记录', 1, 0, 0, 125),
(664, 'index', '提现记录', 1, 0, 78, 126),
(665, 'delete', '删除记录', 1, 0, 0, 126),
(666, 'confirm', '确认提现', 1, 0, 0, 126);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_shop_cate`
--

CREATE TABLE IF NOT EXISTS `fanwe_shop_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `brief` text NOT NULL,
  `pid` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  `uname` varchar(255) NOT NULL,
  `recommend` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sort` (`sort`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- 转存表中的数据 `fanwe_shop_cate`
--

INSERT INTO `fanwe_shop_cate` (`id`, `name`, `brief`, `pid`, `is_delete`, `is_effect`, `sort`, `uname`, `recommend`) VALUES
(24, '服装,内衣,配件', '', 0, 0, 1, 1, 'cloth', 1),
(25, '鞋,箱包', '', 0, 0, 1, 2, '', 0),
(26, '珠宝饰品、手表眼镜', '', 0, 0, 1, 3, '', 0),
(27, '家用电器', '', 0, 0, 1, 4, '', 0),
(28, '居家生活', '', 0, 0, 1, 5, '', 0),
(29, '母婴用品', '', 0, 0, 1, 6, '', 0),
(30, '女装', '', 24, 0, 1, 7, '', 0),
(31, '男装', '', 24, 0, 1, 8, '', 0),
(32, '家居服', '', 24, 0, 1, 9, '', 0),
(33, '毛衣', '', 24, 0, 1, 10, '', 0),
(34, '皮衣', '', 24, 0, 1, 11, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_sms`
--

CREATE TABLE IF NOT EXISTS `fanwe_sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `server_url` text NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `config` text NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `preview` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `sort` int(11) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `city_id` int(11) NOT NULL,
  `name_match` text NOT NULL,
  `name_match_row` text NOT NULL,
  `bank_info` text NOT NULL,
  `money` decimal(20,4) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `bank_user` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `is_effect` (`is_effect`),
  KEY `sort` (`sort`),
  KEY `city_id` (`city_id`),
  FULLTEXT KEY `name_match` (`name_match`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `fanwe_supplier`
--

INSERT INTO `fanwe_supplier` (`id`, `name`, `preview`, `content`, `sort`, `is_effect`, `city_id`, `name_match`, `name_match_row`, `bank_info`, `money`, `bank_name`, `bank_user`) VALUES
(15, '闽粤汇', './public/attachment/201201/4f013e6e7145c.jpg', '', 0, 1, 0, 'ux38397ux31908,ux38397ux31908ux27719', '闽粤,闽粤汇', '', '0.0000', '', ''),
(16, '爱琴海餐厅', './public/attachment/201201/4f013e40ac45d.jpg', '', 0, 1, 0, 'ux29233ux29748ux28023,ux39184ux21381,ux29233ux29748ux28023ux39184ux21381', '爱琴海,餐厅,爱琴海餐厅', '', '0.0000', '', ''),
(17, '老刘野生大鱼坊', './public/attachment/201201/4f013dca6585d.jpg', '', 0, 1, 0, 'ux32769ux21016,ux22823ux40060,ux37326ux29983,ux32769ux21016ux37326ux29983ux22823ux40060ux22346', '老刘,大鱼,野生,老刘野生大鱼坊', '', '0.0000', '', ''),
(18, '享客来牛排世家', './public/attachment/201201/4f013ee3d7cb9.jpg', '', 0, 0, 0, 'ux29275ux25490,ux19990ux23478,ux20139ux23458ux26469ux29275ux25490ux19990ux23478', '牛排,世家,享客来牛排世家', '', '0.0000', '', ''),
(19, '格瑞雅美容院', './public/attachment/201201/4f013fc452347.jpg', '', 0, 0, 0, 'ux38597ux32654,ux26684ux29790,ux23481ux38498,ux26684ux29790ux38597ux32654ux23481ux38498', '雅美,格瑞,容院,格瑞雅美容院', '', '0.0000', '', ''),
(20, '馨语河畔', './public/attachment/201201/4f01422c0c096.jpg', '', 0, 0, 0, 'ux27827ux30036,ux39336ux35821ux27827ux30036', '河畔,馨语河畔', '', '0.0000', '', ''),
(21, '泡泡糖宝贝游泳馆', './public/attachment/201201/4f0142c918abd.jpg', '', 0, 0, 0, 'ux27873ux27873ux31958,ux28216ux27891ux39302,ux23453ux36125,ux27873ux27873ux31958ux23453ux36125ux28216ux27891ux39302', '泡泡糖,游泳馆,宝贝,泡泡糖宝贝游泳馆', '', '0.0000', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_account`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) NOT NULL,
  `account_password` varchar(255) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `description` text NOT NULL,
  `login_ip` varchar(255) NOT NULL,
  `login_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `allow_delivery` tinyint(1) NOT NULL,
  `allow_charge` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk_account_name` (`account_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `fanwe_supplier_account`
--

INSERT INTO `fanwe_supplier_account` (`id`, `account_name`, `account_password`, `supplier_id`, `is_effect`, `is_delete`, `description`, `login_ip`, `login_time`, `update_time`, `allow_delivery`, `allow_charge`) VALUES
(7, 'fanwe', '6714ccb93be0fda4e51f206b91b46358', 21, 1, 0, '测试用的帐号', '127.0.0.1', 0, 1330109616, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_account_location_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_account_location_link` (
  `account_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`account_id`,`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_supplier_account_location_link`
--

INSERT INTO `fanwe_supplier_account_location_link` (`account_id`, `location_id`) VALUES
(7, 20);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_dy`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_dy` (
  `uid` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`supplier_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_location`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `route` text NOT NULL,
  `address` text NOT NULL,
  `tel` varchar(255) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `xpoint` varchar(255) NOT NULL,
  `ypoint` varchar(255) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `open_time` varchar(255) NOT NULL,
  `brief` text NOT NULL,
  `is_main` tinyint(1) NOT NULL,
  `api_address` text NOT NULL,
  `city_id` int(11) NOT NULL,
  `deal_cate_match` text NOT NULL,
  `deal_cate_match_row` text NOT NULL,
  `locate_match` text NOT NULL,
  `locate_match_row` text NOT NULL,
  `name_match` text NOT NULL,
  `name_match_row` text NOT NULL,
  `deal_cate_id` int(11) NOT NULL,
  `preview` varchar(255) NOT NULL,
  `is_recommend` tinyint(1) NOT NULL COMMENT '推荐的门店',
  `is_verify` tinyint(1) NOT NULL COMMENT '认证门店',
  `tags` varchar(255) NOT NULL,
  `tags_match` text NOT NULL,
  `tags_match_row` text NOT NULL,
  `avg_point` float(14,4) NOT NULL,
  `good_dp_count` int(11) NOT NULL,
  `bad_dp_count` int(11) NOT NULL,
  `common_dp_count` int(11) NOT NULL,
  `total_point` int(11) NOT NULL,
  `dp_count` int(11) NOT NULL,
  `image_count` int(11) NOT NULL,
  `ref_avg_price` float(14,4) NOT NULL,
  `good_rate` float(14,4) NOT NULL,
  `common_rate` float(14,4) NOT NULL,
  `sms_content` varchar(255) NOT NULL DEFAULT '',
  `index_img` varchar(255) NOT NULL DEFAULT '',
  `tuan_count` int(11) NOT NULL,
  `event_count` int(11) NOT NULL,
  `youhui_count` int(11) NOT NULL,
  `daijin_count` int(11) NOT NULL,
  `seo_title` text NOT NULL,
  `seo_keyword` text NOT NULL,
  `seo_description` text NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `biz_license` varchar(255) NOT NULL,
  `biz_other_license` varchar(255) NOT NULL,
  `new_dp_count` int(11) NOT NULL,
  `new_dp_count_time` int(11) NOT NULL,
  `shop_count` int(11) NOT NULL,
  `mobile_brief` text NOT NULL,
  `sort` int(11) NOT NULL,
  `dp_group_point` text NOT NULL,
  `tuan_youhui_cache` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `city_id` (`city_id`),
  KEY `is_verify` (`is_verify`),
  KEY `is_effect` (`is_effect`),
  KEY `is_recommend` (`is_recommend`),
  KEY `avg_point` (`avg_point`),
  KEY `good_dp_count` (`good_dp_count`),
  KEY `bad_dp_count` (`bad_dp_count`),
  KEY `common_dp_count` (`common_dp_count`),
  KEY `total_point` (`total_point`),
  KEY `dp_count` (`dp_count`),
  KEY `good_rate` (`good_rate`),
  KEY `common_rate` (`common_rate`),
  KEY `tuan_count` (`tuan_count`),
  KEY `event_count` (`event_count`),
  KEY `youhui_count` (`youhui_count`),
  KEY `daijin_count` (`daijin_count`),
  KEY `new_dp_count` (`new_dp_count`),
  KEY `is_main` (`is_main`),
  KEY `supplier_id` (`supplier_id`) USING BTREE,
  KEY `search_idx1` (`city_id`,`is_recommend`,`is_effect`,`is_verify`) USING BTREE,
  KEY `search_idx2` (`city_id`,`avg_point`,`is_effect`) USING BTREE,
  KEY `search_idx3` (`supplier_id`,`is_main`) USING BTREE,
  KEY `search_idx4` (`city_id`,`deal_cate_id`,`is_verify`,`is_effect`,`is_recommend`) USING BTREE,
  KEY `search_idx5` (`city_id`,`deal_cate_id`,`dp_count`,`avg_point`,`ref_avg_price`,`is_effect`,`is_recommend`,`is_verify`) USING BTREE,
  KEY `search_idx6` (`good_rate`,`is_verify`,`is_effect`) USING BTREE,
  KEY `sort_default` (`is_recommend`,`is_verify`,`dp_count`) USING BTREE,
  KEY `ref_avg_price` (`ref_avg_price`),
  KEY `shop_count` (`shop_count`),
  FULLTEXT KEY `name_match` (`name_match`),
  FULLTEXT KEY `locate_match` (`locate_match`),
  FULLTEXT KEY `deal_cate_match` (`deal_cate_match`),
  FULLTEXT KEY `tags_match` (`tags_match`),
  FULLTEXT KEY `all_match` (`deal_cate_match`,`locate_match`,`name_match`,`tags_match`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `fanwe_supplier_location`
--

INSERT INTO `fanwe_supplier_location` (`id`, `name`, `route`, `address`, `tel`, `contact`, `xpoint`, `ypoint`, `supplier_id`, `open_time`, `brief`, `is_main`, `api_address`, `city_id`, `deal_cate_match`, `deal_cate_match_row`, `locate_match`, `locate_match_row`, `name_match`, `name_match_row`, `deal_cate_id`, `preview`, `is_recommend`, `is_verify`, `tags`, `tags_match`, `tags_match_row`, `avg_point`, `good_dp_count`, `bad_dp_count`, `common_dp_count`, `total_point`, `dp_count`, `image_count`, `ref_avg_price`, `good_rate`, `common_rate`, `sms_content`, `index_img`, `tuan_count`, `event_count`, `youhui_count`, `daijin_count`, `seo_title`, `seo_keyword`, `seo_description`, `is_effect`, `biz_license`, `biz_other_license`, `new_dp_count`, `new_dp_count_time`, `shop_count`, `mobile_brief`, `sort`, `dp_group_point`, `tuan_youhui_cache`) VALUES
(17, '享客来牛排世家', '', '安泰店：鼓楼区吉庇路39号（安泰楼后面，码头一号旁）南街店 ：福州市鼓楼区八一七路南街车站旁（大洋百货正对面）', '0591-88592283', '', '119.306144', '26.086743', 18, '', '', 1, '安泰店：鼓楼区吉庇路39号（安泰楼后面，码头一号旁）南街店 ：福州市鼓楼区八一七路南街车站旁（大洋百货正对面）', 15, 'ux39184ux39278ux32654ux39135', '餐饮美食', 'ux40723ux27004ux21306,ux21335ux34903,ux31119ux24030ux24066,ux19971ux36335,ux22823ux27915,ux30721ux22836,ux36710ux31449,ux30334ux36135,ux23545ux38754,ux21518ux38754,ux23433ux27888ux24215ux65306ux40723ux27004ux21306ux21513ux24199ux36335ux51ux57ux21495ux65288ux23433ux27888ux27004ux21518ux38754ux65292ux30721ux22836ux19968ux21495ux26049ux65289ux21335ux34903ux24215ux65306ux31119ux24030ux24066ux40723ux27004ux21306ux20843ux19968ux19971ux36335ux21335ux34903ux36710ux31449ux26049ux65288ux22823ux27915ux30334ux36135ux27491ux23545ux38754ux65289,ux19996ux34903ux21475', '鼓楼区,南街,福州市,七路,大洋,码头,车站,百货,对面,后面,安泰店：鼓楼区吉庇路39号（安泰楼后面，码头一号旁）南街店 ：福州市鼓楼区八一七路南街车站旁（大洋百货正对面）,东街口', 'ux29275ux25490,ux19990ux23478,ux20139ux23458ux26469ux29275ux25490ux19990ux23478', '牛排,世家,享客来牛排世家', 8, './public/attachment/201201/4f013ee3d7cb9.jpg', 1, 1, '', '', '', 0.0000, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, '', '', 0, 0, 0, 0, '', '', '', 1, '', '', 0, 0, 0, '', 0, '', ''),
(15, '爱琴海餐厅', '社会主义学院站下: 61路、70路、78路、100路、129路', '福州市鼓楼区鼓屏路47号', '0591-88522779', '', '119.304522', '26.098978', 16, '18:00-24:00', '', 1, '福州市鼓楼区鼓屏路47号', 15, 'ux39184ux39278ux32654ux39135', '餐饮美食', 'ux40723ux27004ux21306,ux31119ux24030ux24066,ux31119ux24030ux24066ux40723ux27004ux21306ux40723ux23631ux36335ux52ux55ux21495,ux23631ux23665', '鼓楼区,福州市,福州市鼓楼区鼓屏路47号,屏山', 'ux29233ux29748ux28023,ux39184ux21381,ux29233ux29748ux28023ux39184ux21381', '爱琴海,餐厅,爱琴海餐厅', 8, './public/attachment/201201/4f0113ce66cd4.jpg', 1, 1, '', 'ux24178ux20928,ux26126ux20142,ux26377ux30452ux36798ux20844ux20132', '干净,明亮,有直达公交', 3.3333, 2, 1, 0, 10, 3, 0, 43.3333, 0.6667, 0.0000, '', '', 1, 0, 0, 0, '', '', '', 1, '', '', 0, 0, 0, '', 0, '', ''),
(16, '老刘野生大鱼坊', '7、16、36、40、62、69、71、73、74、79、80、88、92、97、103、125、202、306路，到五一路站下车即可', '福州市鼓楼区古田路88号华丰大厦3层A室(闽都大酒店对面)', '0591-83339688', '', '119.320796', '26.082646', 17, '10:30-14:30,16:30-21:30', '', 1, '福州市鼓楼区古田路88号华丰大厦3层A室(闽都大酒店对面)', 15, 'ux39184ux39278ux32654ux39135', '餐饮美食', 'ux21476ux30000,ux40723ux27004ux21306,ux21326ux20016,ux31119ux24030ux24066,ux22823ux37202ux24215,ux23545ux38754,ux22823ux21414,ux31119ux24030ux24066ux40723ux27004ux21306ux21476ux30000ux36335ux56ux56ux21495ux21326ux20016ux22823ux21414ux51ux23618ux65ux23460ux40ux38397ux37117ux22823ux37202ux24215ux23545ux38754ux41,ux21488ux27743ux21306', '古田,鼓楼区,华丰,福州市,大酒店,对面,大厦,福州市鼓楼区古田路88号华丰大厦3层A室(闽都大酒店对面),台江区', 'ux32769ux21016,ux22823ux40060,ux37326ux29983,ux32769ux21016ux37326ux29983ux22823ux40060ux22346', '老刘,大鱼,野生,老刘野生大鱼坊', 8, './public/attachment/201201/4f0116296dc27.jpg', 1, 1, '', '', '', 0.0000, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, '', '', 1, 0, 0, 4, '', '', '', 1, '', '', 0, 0, 0, '', 0, '', ''),
(14, '闽粤汇', 'K3、19、51、52、69、74、102、106、129、130、133、301路，至蒙古营站下车', '五一北路110号原海关大院内（现光大银行后）', '0591-83326788,0591-88319968', '', '119.315682', '26.087528', 15, '11:30-14:00，17:30-21:00', '', 1, '五一北路110号原海关大院内（现光大银行后）', 15, 'ux39184ux39278ux32654ux39135', '餐饮美食', 'ux20809ux22823ux38134ux34892,ux21271ux36335,ux22823ux38498,ux28023ux20851,ux49ux49ux48,ux20116ux19968,ux20116ux19968ux21271ux36335ux49ux49ux48ux21495ux21407ux28023ux20851ux22823ux38498ux20869ux65288ux29616ux20809ux22823ux38134ux34892ux21518ux65289,ux40723ux27004ux21306,ux20116ux19968ux24191ux22330,ux26187ux23433ux21306,ux20116ux19968ux26032ux26449', '光大银行,北路,大院,海关,110,五一,五一北路110号原海关大院内（现光大银行后）,鼓楼区,五一广场,晋安区,五一新村', 'ux38397ux31908,ux38397ux31908ux27719', '闽粤,闽粤汇', 8, './public/attachment/201201/4f0110c586c48.jpg', 1, 1, '', '', '', 0.0000, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, '', '', 2, 1, 0, 0, '', '', '', 1, '', '', 0, 0, 0, '', 0, '', ''),
(18, '格瑞雅美容院', '', '福州市五一北路67号（蒙古营站牌后）延福宾馆后院', '0591-88813330‎', '', '119.31585', '26.089641', 19, '', '', 1, '福州市五一北路67号（蒙古营站牌后）延福宾馆后院', 15, 'ux29983ux27963ux26381ux21153', '生活服务', 'ux33945ux21476ux33829,ux31119ux24030ux24066,ux21271ux36335,ux31449ux29260,ux21518ux38498,ux23486ux39302,ux24310ux31119,ux20116ux19968,ux31119ux24030ux24066ux20116ux19968ux21271ux36335ux54ux55ux21495ux65288ux33945ux21476ux33829ux31449ux29260ux21518ux65289ux24310ux31119ux23486ux39302ux21518ux38498,ux40723ux27004ux21306,ux20116ux19968ux24191ux22330', '蒙古营,福州市,北路,站牌,后院,宾馆,延福,五一,福州市五一北路67号（蒙古营站牌后）延福宾馆后院,鼓楼区,五一广场', 'ux38597ux32654,ux26684ux29790,ux23481ux38498,ux26684ux29790ux38597ux32654ux23481ux38498', '雅美,格瑞,容院,格瑞雅美容院', 10, './public/attachment/201201/4f013fc452347.jpg', 1, 1, '', '', '', 0.0000, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, '', '', 2, 0, 0, 0, '', '', '', 1, '', '', 0, 0, 0, '', 0, '', ''),
(19, '馨语河畔', '', '鼓楼区南后街5号2楼', '18659138700‎', '', '119.302286', '26.091546', 20, '', '', 1, '鼓楼区南后街5号2楼', 15, 'ux39184ux39278ux32654ux39135', '餐饮美食', 'ux40723ux27004ux21306,ux21335ux21518ux34903,ux40723ux27004ux21306ux21335ux21518ux34903ux53ux21495ux50ux27004', '鼓楼区,南后街,鼓楼区南后街5号2楼', 'ux27827ux30036,ux39336ux35821ux27827ux30036', '河畔,馨语河畔', 8, './public/attachment/201201/4f01422c0c096.jpg', 1, 1, '', '', '', 0.0000, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, '', '', 0, 0, 0, 0, '', '', '', 1, '', '', 0, 0, 0, '', 0, '', ''),
(20, '泡泡糖宝贝游泳馆', '', '福州市晋安区连洋路123号好来屋星光大道5#楼13#店面', '0591-85162880', '', '119.357576', '26.077701', 21, '', '', 1, '福州市晋安区连洋路123号好来屋星光大道5#楼13#店面', 15, '', '', 'ux26187ux23433ux21306,ux22909ux26469,ux31119ux24030ux24066,ux24215ux38754,ux26143ux20809,ux22823ux36947,ux36830ux27915ux36335,ux49ux50ux51,ux49ux51,ux31119ux24030ux24066ux26187ux23433ux21306ux36830ux27915ux36335ux49ux50ux51ux21495ux22909ux26469ux23627ux26143ux20809ux22823ux36947ux53ux35ux27004ux49ux51ux35ux24215ux38754,ux34701ux20392ux19996ux21306', '晋安区,好来,福州市,店面,星光,大道,连洋路,123,13,福州市晋安区连洋路123号好来屋星光大道5#楼13#店面,融侨东区', 'ux27873ux27873ux31958,ux28216ux27891ux39302,ux23453ux36125,ux27873ux27873ux31958ux23453ux36125ux28216ux27891ux39302', '泡泡糖,游泳馆,宝贝,泡泡糖宝贝游泳馆', 0, './public/attachment/201201/4f0142c918abd.jpg', 1, 1, '', '', '', 0.0000, 0, 0, 0, 0, 0, 0, 0.0000, 0.0000, 0.0000, '', '', 0, 0, 0, 1, '', '', '', 1, '', '', 0, 0, 0, '', 0, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_location_area_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_location_area_link` (
  `location_id` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  PRIMARY KEY (`location_id`,`area_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_supplier_location_area_link`
--

INSERT INTO `fanwe_supplier_location_area_link` (`location_id`, `area_id`) VALUES
(14, 13),
(14, 47),
(15, 8),
(15, 20),
(16, 10),
(17, 8),
(17, 14),
(18, 8),
(18, 13),
(19, 8),
(20, 9),
(20, 45);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_location_brand_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_location_brand_link` (
  `brand_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_location_dp`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_location_dp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text,
  `create_time` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_img` tinyint(1) NOT NULL,
  `is_best` tinyint(1) NOT NULL,
  `is_top` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `good_count` int(11) NOT NULL,
  `bad_count` int(11) NOT NULL,
  `reply_count` int(11) NOT NULL,
  `supplier_location_id` int(11) NOT NULL,
  `avg_price` float(14,4) NOT NULL,
  `kb_user_id` varchar(50) NOT NULL,
  `kb_create_time` varchar(20) DEFAULT '',
  `kb_tags` varchar(255) DEFAULT '',
  `is_index` tinyint(1) NOT NULL,
  `is_buy` tinyint(1) NOT NULL,
  `from_data` varchar(255) NOT NULL,
  `rel_app_index` varchar(255) NOT NULL,
  `rel_route` varchar(255) NOT NULL,
  `rel_param` varchar(255) NOT NULL,
  `message_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `supplier_location_id` (`supplier_location_id`) USING BTREE,
  KEY `is_img` (`is_img`) USING BTREE,
  KEY `is_best` (`is_best`) USING BTREE,
  KEY `is_top` (`is_top`) USING BTREE,
  KEY `good_count` (`good_count`) USING BTREE,
  KEY `bad_count` (`bad_count`) USING BTREE,
  KEY `reply_count` (`reply_count`) USING BTREE,
  KEY `avg_price` (`avg_price`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `fanwe_supplier_location_dp`
--

INSERT INTO `fanwe_supplier_location_dp` (`id`, `title`, `content`, `create_time`, `point`, `user_id`, `is_img`, `is_best`, `is_top`, `status`, `good_count`, `bad_count`, `reply_count`, `supplier_location_id`, `avg_price`, `kb_user_id`, `kb_create_time`, `kb_tags`, `is_index`, `is_buy`, `from_data`, `rel_app_index`, `rel_route`, `rel_param`, `message_id`) VALUES
(1, '上周去吃过，感觉不错', '上周去吃过，感觉不错。推荐这家餐厅[坏笑]', 1333241498, 4, 44, 0, 0, 0, 1, 0, 0, 0, 15, 130.0000, '', '', '', 0, 0, '', '', '', '', 0),
(2, '非常好', '非常好非常好非常好非常好非常好非常好非常好', 1333241553, 5, 44, 0, 0, 0, 1, 0, 0, 0, 15, 0.0000, '', '', '', 0, 0, '', '', '', '', 0),
(3, '一般般一般般', '一般般一般般一般般一般般一般般一般般一般般一般般一般般一般般一般般一般般一般般一般般', 1333241576, 1, 44, 0, 0, 0, 1, 0, 0, 0, 15, 0.0000, '', '', '', 0, 0, '', '', '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_location_dp_point_result`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_location_dp_point_result` (
  `group_id` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `supplier_location_id` int(11) NOT NULL,
  `dp_id` int(11) NOT NULL,
  KEY `group_id` (`group_id`) USING BTREE,
  KEY `supplier_location_id` (`supplier_location_id`) USING BTREE,
  KEY `dp_id` (`dp_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_supplier_location_dp_point_result`
--

INSERT INTO `fanwe_supplier_location_dp_point_result` (`group_id`, `point`, `supplier_location_id`, `dp_id`) VALUES
(1, 3, 15, 1),
(2, 4, 15, 1),
(1, 3, 15, 2),
(2, 5, 15, 2),
(1, 4, 15, 3),
(2, 2, 15, 3);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_location_dp_reply`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_location_dp_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dp_id` int(11) NOT NULL,
  `content` text NOT NULL COMMENT '回应内容',
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_location_dp_tag_result`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_location_dp_tag_result` (
  `tags` varchar(255) NOT NULL,
  `dp_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `supplier_location_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_supplier_location_dp_tag_result`
--

INSERT INTO `fanwe_supplier_location_dp_tag_result` (`tags`, `dp_id`, `group_id`, `supplier_location_id`) VALUES
('干净 明亮', 1, 1, 15),
('有直达公交', 1, 2, 15);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_location_images`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_location_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `supplier_location_id` int(11) NOT NULL,
  `dp_id` int(11) NOT NULL,
  `good_count` int(11) NOT NULL,
  `bad_count` int(11) NOT NULL,
  `brief` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `click_count` int(11) NOT NULL,
  `images_group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`user_id`) USING BTREE,
  KEY `supplier_location_id` (`supplier_location_id`) USING BTREE,
  KEY `dp_id` (`dp_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_location_point_result`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_location_point_result` (
  `group_id` int(11) NOT NULL,
  `avg_point` float(14,4) NOT NULL,
  `supplier_location_id` int(11) NOT NULL,
  `total_point` int(11) NOT NULL,
  PRIMARY KEY (`group_id`,`supplier_location_id`),
  KEY `group_id` (`group_id`) USING BTREE,
  KEY `dp_id` (`total_point`) USING BTREE,
  KEY `avg_point` (`avg_point`) USING BTREE,
  KEY `total_point` (`total_point`) USING BTREE,
  KEY `supplier_location_id` (`supplier_location_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_supplier_location_point_result`
--

INSERT INTO `fanwe_supplier_location_point_result` (`group_id`, `avg_point`, `supplier_location_id`, `total_point`) VALUES
(1, 3.0000, 15, 3),
(2, 4.0000, 15, 4);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_location_sign_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_location_sign_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `sign_time` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `location_id` (`location_id`),
  KEY `sign_time` (`sign_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_money_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_money_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_info` text NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `money` decimal(20,4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_money_submit`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_money_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` decimal(20,4) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_submit`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_submit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `cate_config` text NOT NULL,
  `location_config` text NOT NULL,
  `address` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `open_time` varchar(255) NOT NULL,
  `xpoint` varchar(255) NOT NULL,
  `ypoint` varchar(255) NOT NULL,
  `location_id` int(11) NOT NULL,
  `is_publish` tinyint(1) NOT NULL,
  `user_id` int(1) NOT NULL,
  `create_time` int(11) NOT NULL,
  `h_name` varchar(255) NOT NULL COMMENT '企业名称',
  `h_faren` varchar(255) NOT NULL COMMENT '法人',
  `h_license` varchar(255) NOT NULL COMMENT '营业执照',
  `h_other_license` varchar(255) NOT NULL COMMENT '其他资质上传',
  `h_user_name` varchar(255) NOT NULL COMMENT '店铺管理员姓名',
  `h_tel` varchar(255) NOT NULL,
  `h_supplier_logo` varchar(255) NOT NULL,
  `h_supplier_image` varchar(255) NOT NULL,
  `city_id` int(11) NOT NULL,
  `h_bank_info` text NOT NULL,
  `h_bank_user` varchar(255) NOT NULL,
  `h_bank_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_tag`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_tag` (
  `tag_name` varchar(255) NOT NULL,
  `supplier_location_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL COMMENT '关联商户子类标签分组的ID(可为前台会员点评的分组标签，也可为后台管理员编辑的分组标签), 为0时为主显标签',
  `total_count` int(11) NOT NULL COMMENT '同商户，同类分组提交的次数。 用于表示该标签的热门度',
  KEY `merchant_id` (`supplier_location_id`) USING BTREE,
  KEY `group_id` (`group_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_supplier_tag`
--

INSERT INTO `fanwe_supplier_tag` (`tag_name`, `supplier_location_id`, `group_id`, `total_count`) VALUES
('干净', 15, 1, 1),
('明亮', 15, 1, 1),
('有直达公交', 15, 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_supplier_tag_group_preset`
--

CREATE TABLE IF NOT EXISTS `fanwe_supplier_tag_group_preset` (
  `group_id` int(11) NOT NULL,
  `supplier_location_id` int(11) NOT NULL,
  `preset` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_tag_group`
--

CREATE TABLE IF NOT EXISTS `fanwe_tag_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `preset` text NOT NULL,
  `sort` int(11) NOT NULL,
  `memo` varchar(255) NOT NULL,
  `tags` text NOT NULL,
  `allow_dp` tinyint(1) NOT NULL,
  `allow_search` tinyint(1) NOT NULL,
  `allow_vote` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `fanwe_tag_group`
--

INSERT INTO `fanwe_tag_group` (`id`, `name`, `preset`, `sort`, `memo`, `tags`, `allow_dp`, `allow_search`, `allow_vote`) VALUES
(1, '环境', '', 100, '', '', 1, 1, 0),
(2, '交通', '', 100, '', '', 1, 1, 0),
(3, '口味', '', 100, '', '', 1, 1, 0),
(4, '服务', '很好 一般 很周到', 100, '', '', 1, 1, 0),
(5, '停车', '', 100, '', '', 1, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_tag_group_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_tag_group_link` (
  `tag_group_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  KEY `tag_id` (`tag_group_id`) USING BTREE,
  KEY `type_id` (`category_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_tag_group_link`
--

INSERT INTO `fanwe_tag_group_link` (`tag_group_id`, `category_id`) VALUES
(4, 12),
(5, 11),
(4, 11),
(2, 11),
(4, 10),
(5, 10),
(5, 9),
(4, 9),
(2, 9),
(1, 8),
(2, 8),
(3, 8),
(4, 13),
(4, 14),
(5, 14),
(2, 15),
(4, 15),
(1, 16),
(4, 16),
(1, 17),
(4, 17);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_tag_user_vote`
--

CREATE TABLE IF NOT EXISTS `fanwe_tag_user_vote` (
  `user_id` int(11) NOT NULL,
  `tag_name` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`tag_name`,`group_id`,`location_id`),
  KEY `user_id` (`user_id`),
  KEY `tag_name` (`tag_name`),
  KEY `location_id` (`location_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_topic`
--

CREATE TABLE IF NOT EXISTS `fanwe_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `forum_title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `create_time` int(11) NOT NULL,
  `type` varchar(255) NOT NULL COMMENT '0:普通日志 1:购物分享',
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `relay_id` int(11) NOT NULL COMMENT '0:原创 1:转发来源的贴子ID',
  `origin_id` int(11) NOT NULL COMMENT '原创贴子ID',
  `reply_count` int(11) NOT NULL,
  `relay_count` int(11) NOT NULL,
  `good_count` int(11) NOT NULL,
  `bad_count` int(11) NOT NULL,
  `click_count` int(11) NOT NULL,
  `rel_app_index` varchar(255) NOT NULL,
  `rel_route` varchar(255) NOT NULL,
  `rel_param` varchar(255) NOT NULL,
  `message_id` int(11) NOT NULL,
  `topic_group` varchar(255) NOT NULL DEFAULT 'share',
  `fav_id` int(11) NOT NULL COMMENT '喜欢XX分享的分享ID',
  `fav_count` int(11) NOT NULL,
  `user_name_match` text NOT NULL,
  `user_name_match_row` text NOT NULL,
  `keyword_match` text NOT NULL,
  `keyword_match_row` text NOT NULL,
  `xpoint` varchar(255) NOT NULL,
  `ypoint` varchar(255) NOT NULL,
  `tags` text NOT NULL,
  `is_recommend` tinyint(1) NOT NULL,
  `has_image` tinyint(1) NOT NULL,
  `source_type` tinyint(1) NOT NULL COMMENT '0:本站 1:外站',
  `source_name` varchar(255) NOT NULL,
  `source_url` varchar(255) NOT NULL,
  `group_data` text NOT NULL COMMENT 'group插件采集同步的序列化数据',
  `daren_page` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL,
  `is_top` tinyint(1) NOT NULL,
  `is_best` tinyint(1) NOT NULL,
  `op_memo` text NOT NULL,
  `last_time` int(11) NOT NULL,
  `last_user_id` int(11) NOT NULL,
  `cate_match` text NOT NULL,
  `cate_match_row` text NOT NULL,
  `origin_topic_data` text NOT NULL,
  `images_count` int(11) NOT NULL,
  `image_list` text NOT NULL,
  `is_cached` tinyint(1) NOT NULL,
  `topic_group_data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`),
  KEY `user_id` (`user_id`),
  KEY `is_recommend` (`is_recommend`),
  KEY `group_id` (`group_id`),
  KEY `is_top` (`is_top`),
  KEY `is_best` (`is_best`),
  KEY `has_image` (`has_image`),
  KEY `fav_id` (`fav_id`),
  KEY `relay_id` (`relay_id`),
  KEY `origin_id` (`origin_id`),
  KEY `type` (`type`),
  KEY `is_effect` (`is_effect`),
  KEY `is_delete` (`is_delete`),
  KEY `click_count` (`click_count`),
  KEY `last_time` (`last_time`),
  KEY `ordery_sort` (`create_time`,`is_top`),
  KEY `last_time_sort` (`last_time`,`is_top`),
  KEY `multi_key` (`is_effect`,`is_delete`,`last_time`,`is_recommend`,`group_id`,`is_top`,`is_best`,`create_time`),
  FULLTEXT KEY `user_name_match` (`user_name_match`),
  FULLTEXT KEY `keyword_match` (`keyword_match`),
  FULLTEXT KEY `cate_match` (`cate_match`),
  FULLTEXT KEY `all_match` (`keyword_match`,`cate_match`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=180 ;

--
-- 转存表中的数据 `fanwe_topic`
--

INSERT INTO `fanwe_topic` (`id`, `title`, `forum_title`, `content`, `create_time`, `type`, `user_id`, `user_name`, `is_effect`, `is_delete`, `relay_id`, `origin_id`, `reply_count`, `relay_count`, `good_count`, `bad_count`, `click_count`, `rel_app_index`, `rel_route`, `rel_param`, `message_id`, `topic_group`, `fav_id`, `fav_count`, `user_name_match`, `user_name_match_row`, `keyword_match`, `keyword_match_row`, `xpoint`, `ypoint`, `tags`, `is_recommend`, `has_image`, `source_type`, `source_name`, `source_url`, `group_data`, `daren_page`, `group_id`, `is_top`, `is_best`, `op_memo`, `last_time`, `last_user_id`, `cate_match`, `cate_match_row`, `origin_topic_data`, `images_count`, `image_list`, `is_cached`, `topic_group_data`) VALUES
(133, '荒草日出', '', '很美[害羞][哈哈]', 1328312164, 'share', 44, 'fanwe', 1, 0, 0, 133, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux26085ux20986,ux25668ux24433,ux23475ux32670,ux21704ux21704,ux33618ux33609,ux33618ux33609ux26085ux20986', '日出,摄影,害羞,哈哈,荒草,荒草日出', '', '', '日出 摄影', 1, 1, 0, '网站', '', '', './public/attachment/201202/16/12/4f3c86f3e1c90.jpg', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(134, '巧克力', '', '情人节要到了，准备巧克力了吗？', 1328312272, 'share', 44, 'fanwe', 1, 0, 0, 134, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 2, '', '', 'ux24039ux20811ux21147,ux24773ux20154ux33410,ux33410ux35201,ux20934ux22791,ux24773ux20154', '巧克力,情人节,节要,准备,情人', '', '', '巧克力 情人节', 1, 1, 0, '网站', '', '', './public/attachment/201202/16/12/4f3c871c3009b.jpg', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(135, '', '', '卡哇伊~[害羞]', 1328312355, 'share', 44, 'fanwe', 1, 0, 0, 135, 0, 1, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux23456ux29289,ux21334ux33804,ux21487ux29233,ux23475ux32670', '宠物,卖萌,可爱,害羞', '', '', '宠物 卖萌 可爱', 1, 1, 0, '网站', '', '', './public/attachment/201202/16/12/4f3c873962c4f.jpg', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(136, '', '', '电影《猎物》剧照[发呆]', 1328312503, 'share', 44, 'fanwe', 1, 0, 0, 136, 0, 1, 0, 0, 1, '', '', '', 0, 'share', 0, 0, '', '', 'ux30005ux24433,ux29454ux29289,ux21095ux29031,ux21457ux21574', '电影,猎物,剧照,发呆', '', '', '电影  猎物', 1, 1, 0, '网站', '', '', './public/attachment/201202/16/12/4f3c875493361.jpg', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(137, '', '', '口味又有些重了。[呲牙][呲牙]', 1328312605, 'share', 44, 'fanwe', 1, 0, 0, 137, 2, 2, 0, 0, 6, '', '', '', 0, '', 0, 0, '', '', 'ux28216ux25103,ux25163ux32472,ux21618ux29273,ux21475ux21619,ux26377ux20123', '游戏,手绘,呲牙,口味,有些', '', '', '游戏 手绘', 1, 1, 0, '网站', '', '', './public/attachment/201202/16/12/4f3c871c3009b.jpg', 0, 0, 0, '', 0, 0, '', '', '', 5, 'a:5:{i:0;a:5:{s:4:"path";s:76:"./public/comment/201202/04/15/be2c85548ad5fca063bd9d1d6add1faa13_100x100.jpg";s:6:"o_path";s:68:"./public/comment/201202/04/15/be2c85548ad5fca063bd9d1d6add1faa13.jpg";s:5:"width";s:3:"500";s:6:"height";s:3:"500";s:2:"id";s:2:"98";}i:1;a:5:{s:4:"path";s:76:"./public/comment/201202/04/15/05891ca45a216fc5aed6280bcaad084b93_100x100.jpg";s:6:"o_path";s:68:"./public/comment/201202/04/15/05891ca45a216fc5aed6280bcaad084b93.jpg";s:5:"width";s:3:"500";s:6:"height";s:3:"500";s:2:"id";s:2:"99";}i:2;a:5:{s:4:"path";s:76:"./public/comment/201202/04/15/822c1f3758e4b32e4327fbdb987a5b2d74_100x100.jpg";s:6:"o_path";s:68:"./public/comment/201202/04/15/822c1f3758e4b32e4327fbdb987a5b2d74.jpg";s:5:"width";s:3:"500";s:6:"height";s:3:"500";s:2:"id";s:3:"100";}i:3;a:5:{s:4:"path";s:76:"./public/comment/201202/04/15/13ba7fa8f7da90cd70f28d0296eed81073_100x100.jpg";s:6:"o_path";s:68:"./public/comment/201202/04/15/13ba7fa8f7da90cd70f28d0296eed81073.jpg";s:5:"width";s:3:"500";s:6:"height";s:3:"500";s:2:"id";s:3:"101";}i:4;a:5:{s:4:"path";s:76:"./public/comment/201202/04/15/8b44310b7de3c540d24aabcfff97465f84_100x100.jpg";s:6:"o_path";s:68:"./public/comment/201202/04/15/8b44310b7de3c540d24aabcfff97465f84.jpg";s:5:"width";s:3:"500";s:6:"height";s:3:"500";s:2:"id";s:3:"102";}}', 0, 'b:0;'),
(138, '', '', '口味又有些重了。[呲牙][呲牙] @fzmatthew:太可怕了', 1328312652, 'share', 46, 'fzmatthew', 1, 0, 137, 137, 0, 1, 0, 0, 0, '', '', '', 0, 'share', 0, 0, 'ux102ux122ux109ux97ux116ux116ux104ux101ux119', 'fzmatthew', 'ux21618ux29273,ux21475ux21619,ux102ux122ux109ux97ux116ux116ux104ux101ux119,ux21487ux24597,ux26377ux20123', '呲牙,口味,fzmatthew,可怕,有些', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(139, '', '', '', 1328312658, 'share', 46, 'fzmatthew', 1, 0, 0, 134, 1, 0, 0, 0, 2, '', '', '', 0, 'share', 134, 1, '', '', '', '', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(140, '', '', '卡哇伊~[害羞] @fzmatthew:很可爱啊[哈哈][哈哈]', 1328312676, 'share', 46, 'fzmatthew', 1, 0, 135, 135, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, 'ux102ux122ux109ux97ux116ux116ux104ux101ux119', 'fzmatthew', 'ux21704ux21704,ux23475ux32670,ux102ux122ux109ux97ux116ux116ux104ux101ux119,ux21487ux29233', '哈哈,害羞,fzmatthew,可爱', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(141, '', '', '口味又有些重了。[呲牙][呲牙] @fzmatthew:太可怕了 @fz云淡风轻:悲惨[得意]', 1328312778, 'share', 45, 'fz云淡风轻', 1, 0, 138, 137, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, 'ux102ux122ux109ux97ux116ux116ux104ux101ux119,ux102ux122ux20113ux28129ux39118ux36731', 'fzmatthew,fz云淡风轻', 'ux21618ux29273,ux20113ux28129ux39118ux36731,ux24754ux24808,ux21475ux21619,ux102ux122ux109ux97ux116ux116ux104ux101ux119,ux24471ux24847,ux21487ux24597,ux26377ux20123,ux102ux122', '呲牙,云淡风轻,悲惨,口味,fzmatthew,得意,可怕,有些,fz', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(142, '', '', '', 1328312833, 'share', 45, 'fz云淡风轻', 1, 0, 0, 134, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 139, 0, '', '', '', '', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(143, '', '', '电影《猎物》剧照[发呆] @fz云淡风轻:好看吗？', 1328312880, 'share', 45, 'fz云淡风轻', 1, 0, 136, 136, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, 'ux102ux122ux20113ux28129ux39118ux36731', 'fz云淡风轻', 'ux20113ux28129ux39118ux36731,ux29454ux29289,ux21095ux29031,ux21457ux21574,ux22909ux30475,ux30005ux24433,ux102ux122', '云淡风轻,猎物,剧照,发呆,好看,电影,fz', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(144, '', '', '时尚', 1328315204, 'share', 45, 'fz云淡风轻', 1, 0, 0, 144, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 1, '', '', 'ux26102ux23578', '时尚', '', '', ' 时尚', 0, 1, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(145, '', '', '精美壁纸', 1328315232, 'share', 45, 'fz云淡风轻', 1, 0, 0, 145, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux22721ux32440,ux31934ux32654ux22721ux32440', '壁纸,精美壁纸', '', '', ' 壁纸', 0, 1, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(146, '', '', '【经典回顾】：星尘', 1328315281, 'share', 45, 'fz云淡风轻', 1, 0, 0, 146, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux30005ux24433,ux26143ux23576,ux32463ux20856ux22238ux39038', '电影,星尘,经典回顾', '', '', '电影  星尘', 0, 1, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(147, '', '', '【经典回顾】：奇幻精灵历险记', 1328315335, 'share', 45, 'fz云淡风轻', 1, 0, 0, 147, 0, 1, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux30005ux24433,ux32463ux20856ux22238ux39038,ux21382ux38505ux35760,ux22855ux24187,ux31934ux28789', '电影,经典回顾,历险记,奇幻,精灵', '', '', '电影 ', 0, 1, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(148, '', '', '[哈哈][哈哈]奇幻精灵历险记', 1328315357, 'share', 45, 'fz云淡风轻', 1, 0, 0, 148, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux30005ux24433,ux21704ux21704,ux21382ux38505ux35760,ux22855ux24187,ux31934ux28789', '电影,哈哈,历险记,奇幻,精灵', '', '', '电影 ', 0, 1, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(149, '', '', '街拍', 1328315545, 'share', 45, 'fz云淡风轻', 1, 0, 0, 149, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux34903ux25293', '街拍', '', '', ' 街拍', 0, 1, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(150, '', '', '看什么看，咬死你们！[呲牙][呲牙]', 1328315616, 'share', 45, 'fz云淡风轻', 1, 0, 0, 150, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 1, '', '', 'ux23456ux29289,ux21334ux33804,ux21487ux29233,ux21618ux29273,ux20320ux20204,ux20160ux20040', '宠物,卖萌,可爱,呲牙,你们,什么', '', '', ' 宠物 卖萌 可爱', 0, 1, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(151, '', '', '手绘可爱猫咪画集欣赏', 1328315658, 'share', 45, 'fz云淡风轻', 1, 0, 0, 151, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux29483ux21674,ux23456ux29289,ux30011ux38598,ux25163ux32472,ux21487ux29233,ux27427ux36175', '猫咪,宠物,画集,手绘,可爱,欣赏', '', '', ' 猫咪 宠物', 0, 1, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(152, '', '', '绝美湿地--拉市海。。[酷]', 1328315738, 'share', 45, 'fz云淡风轻', 1, 0, 0, 152, 0, 1, 0, 0, 0, '', '', '', 0, 'share', 0, 1, '', '', 'ux33258ux21161ux28216,ux26053ux28216,ux26053ux34892,ux25289ux24066ux28023,ux28287ux22320', '自助游,旅游,旅行,拉市海,湿地', '', '', ' 自助游 旅游 旅行 拉市海', 0, 1, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(153, '', '', '', 1328315825, 'share', 46, 'fzmatthew', 1, 0, 0, 150, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 150, 0, '', '', '', '', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(154, '', '', '绝美湿地--拉市海。。[酷] @fzmatthew:真想去，很美', 1328315833, 'share', 46, 'fzmatthew', 1, 0, 152, 152, 1, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, 'ux102ux122ux109ux97ux116ux116ux104ux101ux119', 'fzmatthew', 'ux30495ux24819,ux28287ux22320,ux102ux122ux109ux97ux116ux116ux104ux101ux119', '真想,湿地,fzmatthew', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(155, '', '', '【经典回顾】：奇幻精灵历险记 @fzmatthew:好看吗？[得意]', 1328315853, 'share', 46, 'fzmatthew', 1, 0, 147, 147, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, 'ux102ux122ux109ux97ux116ux116ux104ux101ux119', 'fzmatthew', 'ux32463ux20856ux22238ux39038,ux21382ux38505ux35760,ux102ux122ux109ux97ux116ux116ux104ux101ux119,ux22855ux24187,ux24471ux24847,ux22909ux30475,ux31934ux28789', '经典回顾,历险记,fzmatthew,奇幻,得意,好看,精灵', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(156, '', '', '', 1328315865, 'share', 46, 'fzmatthew', 1, 0, 0, 152, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 152, 0, '', '', '', '', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(157, '', '', '', 1328315898, 'share', 44, 'fanwe', 1, 0, 0, 144, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 144, 0, '', '', '', '', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(158, '免费试吃', '', '巧克力[得意][得意]', 1328316502, 'share', 44, 'fanwe', 1, 0, 0, 158, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux35797ux21507,ux24039ux20811ux21147,ux24471ux24847,ux20813ux36153,ux20813ux36153ux35797ux21507', '试吃,巧克力,得意,免费,免费试吃', '', '', ' 试吃 巧克力', 0, 1, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(159, '对免费品偿巧克力发表了点评', '', '看起来很不错。 我报名了[呲牙][呲牙]', 1329336228, 'eventcomment', 44, 'fanwe', 1, 0, 0, 159, 0, 0, 0, 0, 0, 'youhui', 'edetail', 'id=1', 0, 'share', 0, 0, '', '', 'ux21618ux29273,ux30475ux36215ux26469,ux19981ux38169,ux25253ux21517,ux24039ux20811ux21147,ux28857ux35780,ux21457ux34920,ux20813ux36153,ux23545ux20813ux36153ux21697ux20607ux24039ux20811ux21147ux21457ux34920ux20102ux28857ux35780', '呲牙,看起来,不错,报名,巧克力,点评,发表,免费,对免费品偿巧克力发表了点评', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(160, '报名参加了免费品偿巧克力', '', '报名参加了免费品偿巧克力 - 甜蜜情人节，DIY巧克力表爱意！仅39元，即享原价106元【小丫烘焙坊】DIY巧克力18粒礼盒装。爱有时候可以不用说出来，但可以写出来，要表达什么就看你的手艺咯！', 1329336241, 'eventsubmit', 44, 'fanwe', 1, 0, 0, 160, 0, 0, 0, 0, 0, 'youhui', 'edetail', 'id=1', 0, 'share', 0, 0, '', '', 'ux24039ux20811ux21147,ux21487ux20197,ux28888ux28953,ux31036ux30418,ux25163ux33402,ux23567ux20011,ux29233ux24847,ux19981ux29992ux35828,ux20889ux20986,ux21407ux20215,ux21442ux21152,ux25253ux21517,ux20813ux36153,ux25253ux21517ux21442ux21152ux20102ux20813ux36153ux21697ux20607ux24039ux20811ux21147', '巧克力,可以,烘焙,礼盒,手艺,小丫,爱意,不用说,写出,原价,参加,报名,免费,报名参加了免费品偿巧克力', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(161, '', '', '活动推荐:免费品偿巧克力', 1329336269, 'shareevent', 44, 'fanwe', 1, 0, 0, 161, 0, 0, 0, 0, 0, '', '', '', 0, 'Fanwe', 0, 0, '', '', 'ux24039ux20811ux21147,ux20813ux36153,ux27963ux21160,ux25512ux33616', '巧克力,免费,活动,推荐', '', '', ' 巧克力 免费', 0, 1, 0, '网站', '', 'YToyOntzOjM6InVybCI7YTozOntzOjk6ImFwcF9pbmRleCI7czo2OiJ5b3VodWkiO3M6NToicm91dGUiO3M6NzoiZWRldGFpbCI7czo1OiJwYXJhbSI7czo0OiJpZD0xIjt9czo0OiJkYXRhIjthOjI4OntzOjI6ImlkIjtzOjE6IjEiO3M6NDoibmFtZSI7czoyMToi5YWN6LS55ZOB5YG/5ben5YWL5YqbIjtzOjQ6Imljb24iO3M6NTA6Ii4vcHVibGljL2F0dGFjaG1lbnQvMjAxMjAyLzE2LzExLzRmM2M3ZWEzOTRhOTAuanBnIjtzOjE2OiJldmVudF9iZWdpbl90aW1lIjtzOjEwOiIxMzI4MDQwMDgwIjtzOjE0OiJldmVudF9lbmRfdGltZSI7czoxMDoiMTM2MDk1ODQ4MyI7czoxNzoic3VibWl0X2JlZ2luX3RpbWUiO3M6MTA6IjEzMjgxMjY0ODUiO3M6MTU6InN1Ym1pdF9lbmRfdGltZSI7czoxMDoiMTM2MzM3NzY4NyI7czo3OiJ1c2VyX2lkIjtzOjE6IjAiO3M6NzoiY29udGVudCI7czoxODYzOiI8cD48c3Ryb25nPuOAkOeJueWIq+aPkOekuuOAkTwvc3Ryb25nPjwvcD4NCjxwPjxzcGFuIHN0eWxlPSJjb2xvcjojZmYwMDAwOyI+PHN0cm9uZz7mnIkg5pWIIOacn++8muaIquatouiHszIwMTLlubQz5pyIMTjml6XvvIjov4fmnJ/ml6DmlYjvvIk8L3N0cm9uZz48L3NwYW4+PC9wPg0KPHA+PHN0cm9uZz7kvb/nlKjpmZDliLY8L3N0cm9uZz7vvJrmr4/kuKpJROmZkOi0rTEw5Lu977ybPC9wPg0KPHA+PHN0cm9uZz7okKXkuJrml7bpl7Q8L3N0cm9uZz7vvJoxMO+8mjAw4oCUMTk6MDDvvJs8L3A+DQo8cD48c3Ryb25nPuWVhuWutuWcsOWdgDwvc3Ryb25nPu+8muemj+W3nuW4guWPsOaxn+WMuuS6lOS4gOS4rei3r+S4h+mDvemYv+azoue9lzEw5bGCMTAwN++8iOmYv+azoue9l+Wkp+mFkuW6l+WQjuS+p++8ie+8mzwvcD4NCjxwPjxzdHJvbmc+6aKE57qm55S16K+dPC9zdHJvbmc+77yaMDU5MS0yODMxMTE4M++8m++8iOS4uuS/neacjeWKoei0qOmHj++8jOivt+aPkOWJjTHlpKnpooTnuqbvvIk8L3A+DQo8cD48c3Ryb25nPuS9v+eUqOaPkOekuu+8mjwvc3Ryb25nPjwvcD4NCjxwPjEu5Yet5omL5py65LqM57u056CB6Iez5ZWG5a625bqX5YaF6aqM6K+B5raI6LS577yM6IqC5YGH5pel6YCa55So77yM5LiA57uP6aqM6K+B77yM5LiN5LqI6YCA5qy+77yM6K+36KeB6LCF77ybPC9wPg0KPHAgYWxpZ249ImxlZnQiPjIu6K+35Zyo5pyJ5pWI5pyf5YaF6aqM6K+B77yM6YC+5pyf5peg5pWI77ybPC9wPg0KPHAgYWxpZ249ImxlZnQiPjMu5Zui6LSt5LiN5om+6Zu277yM5LiN5LqI5bqX5YaF5YW25LuW5LyY5oOg5ZCM5Lqr77yM5ZWG5a625om/6K+65peg6ZqQ5oCn5raI6LS577ybPC9wPg0KPHAgYWxpZ249ImxlZnQiPjQu6YCA5qy+6K+05piO77ya5pyJ5pWI5pyf5YaF6YCA5qy+6aKdPe+8iOWboui0reS7ty3mr4/ku70y5YWD5LqM57u056CB5L+h5oGv6LS577yJ77yM5pyJ5pWI5pyf5aSW6YCA5qy+6aKdPe+8iOWboui0reS7ty3mr4/ku70y5YWD5LqM57u056CB5L+h5oGv6LS577yJKjk1Je+8jOivt+WcqOaPkOS6pOmAgOasvueUs+ivt+aXtuiHquWKqOaJo+mZpO+8jOS7peS+v+aIkeS7rOWwveW/q+eahOS4uuaCqOWKnueQhumAgOasvuOAgjwvcD4NCjxwPjxzdHJvbmc+6LSt5Lmw5rWB56iL77yaPC9zdHJvbmc+PC9wPg0KPHA+PHNwYW4gc3R5bGU9ImNvbG9yOiNmZjAwMDA7Ij7otK3kubDlm6LotK3liLgmbmJzcDsmZ3Q7Jm5ic3A75o+Q5YmNMeWkqeiHtOeUtemihOe6pu+8jOWIsOW6l+mqjOivgea2iOi0uSAmZ3Q7Jm5ic3A75byA5b+D5Lqr5Y+X5pyN5YqhPC9zcGFuPjwvcD4NCjxwPuWuouacjeeUteivne+8mjQwMC02MDAtNTUxNSA8L3A+DQo8cD48c3Ryb25nPuOAkOa0u+WKqOivpuaDheOAkTwvc3Ryb25nPjwvcD4NCjxwPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwO+OAkOaDheS6uuiKgueJueS+m+OAkeeUnOicnOaDheS6uuiKgu+8jERJWeW3p+WFi+WKm+ihqOeIseaEj++8geS7hTM55YWD77yM5Y2z5Lqr5Y6f5Lu3MTA25YWD44CQ5bCP5Lir54OY54SZ5Z2K44CRRElZ5ben5YWL5YqbMTjnspLnpLznm5Loo4XjgILniLHmnInml7blgJnlj6/ku6XkuI3nlKjor7Tlh7rmnaXvvIzkvYblj6/ku6Xlhpnlh7rmnaXvvIzopoHooajovr7ku4DkuYjlsLHnnIvkvaDnmoTmiYvoibrlkq/vvIE8L3A+DQo8cD4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDvpu5Hnmb3lt6flhYvlipvnmoTnu4/lhbjono3lkIjvvIznlJzonJzniLHmg4XnmoTnvo7kuL3ku6PooajjgII8L3A+DQo8cD48YnIgLz4NCjwvcD4NCjxwPjxpbWcgc3JjPSIuL3B1YmxpYy9hdHRhY2htZW50LzIwMTIwMi8xNi8xMi80ZjNjN2ZkODk2ODIyLmpwZyIgYWx0PSIiIGJvcmRlcj0iMCIgLz48YnIgLz4NCjwvcD4iO3M6NzoiY2F0ZV9pZCI7czoxOiIzIjtzOjc6ImNpdHlfaWQiO3M6MjoiMTUiO3M6NzoiYWRkcmVzcyI7czoyNDoi56aP5bee5a6d6b6Z5Z+O5biC5bm/5Zy6IjtzOjY6Inhwb2ludCI7czoxMDoiMTE5LjI5ODEyOSI7czo2OiJ5cG9pbnQiO3M6OToiMjYuMDY4NzY5IjtzOjEyOiJsb2NhdGVfbWF0Y2giO3M6NDI0OiJ1eDIwODQwdXgyMjI2OSx1eDMxMTE5dXgyNDAzMCx1eDIzNDUzdXg0MDg1Nyx1eDI0MTkxdXgyMjMzMCx1eDIyNDc4dXgyNDA2Nix1eDMxMTE5dXgyNDAzMHV4MjM0NTN1eDQwODU3dXgyMjQ3OHV4MjQwNjZ1eDI0MTkxdXgyMjMzMCx1eDQwNzIzdXgyNzAwNHV4MjEzMDYsdXgzOTUzMnV4MjM2MTR1eDIxMzA2LHV4MjE0ODh1eDI3NzQzdXgyMTMwNix1eDIwODQ1dXgxOTk2OHV4MjAwMTN1eDM2MzM1LHV4MTk5NzV1eDM1OTM3dXgyMjQ3OCx1eDIzNTY3dXgyNjcyNXV4MjI4MzYsdXgyMDE3OXV4MjM2NjV1eDIxMzA2LHV4MjAxNzl1eDIzNjY1dXgzODIxNSx1eDM0NzQ2dXgyNzk1NCx1eDE5OTc3dXgzOTY0MHV4MzYzMzUsdXgzOTMxOHV4MjM2NjV1eDM2MzM1LHV4MjYxODd1eDIzNDMzdXgyMTMwNix1eDI5NTc5dXgyNDE5NnV4MjYwMzJ1eDI2NDQ5IjtzOjE2OiJsb2NhdGVfbWF0Y2hfcm93IjtzOjE5Mjoi5YWo5Zu9LOemj+W3nizlrp3pvpks5bm/5Zy6LOWfjuW4giznpo/lt57lrp3pvpnln47luILlub/lnLos6byT5qW85Yy6LOmprOWwvuWMuizlj7DmsZ/ljLos5YWt5LiA5Lit6LevLOS4h+ixoeWfjizlsI/moaXlpLQs5LuT5bGx5Yy6LOS7k+WxsemVhyzonrrmtLIs5LiJ6auY6LevLOmmluWxsei3ryzmmYvlronljLos546L5bqE5paw5p2RIjtzOjEwOiJjYXRlX21hdGNoIjtzOjE0OiJ1eDMwMDA1dXgyNDQzMyI7czoxNDoiY2F0ZV9tYXRjaF9yb3ciO3M6Njoi55S15b2xIjtzOjEwOiJuYW1lX21hdGNoIjtzOjc1NzoidXgyNDAzOXV4MjA4MTF1eDIxMTQ3LHV4MjA4MTN1eDM2MTUzLHV4MjA4MTN1eDM2MTUzdXgyMTY5N3V4MjA2MDd1eDI0MDM5dXgyMDgxMXV4MjExNDcsdXgyMTQ4N3V4MjAxOTcsdXgyODg4OHV4Mjg5NTMsdXgzMTAzNnV4MzA0MTgsdXgyNTE2M3V4MzM0MDIsdXgyMzU2N3V4MjAwMTEsdXgyOTIzM3V4MjQ4NDcsdXgxOTk4MXV4Mjk5OTJ1eDM1ODI4LHV4MjA4ODl1eDIwOTg2LHV4MjE0MDd1eDIwMjE1LHV4Mjk5ODB1eDM0NTg4dXgyNDc3M3V4MjAxNTR1eDMzNDEwdXg2NTI5MnV4Njh1eDczdXg4OXV4MjQwMzl1eDIwODExdXgyMTE0N3V4MzQ5MjB1eDI5MjMzdXgyNDg0N3V4NjUyODF1eDIwMTY1dXg1MXV4NTd1eDIwODAzdXg2NTI5MnV4MjEzNjN1eDIwMTM5dXgyMTQwN3V4MjAyMTV1eDQ5dXg0OHV4NTR1eDIwODAzdXgxMjMwNHV4MjM1Njd1eDIwMDExdXgyODg4OHV4Mjg5NTN1eDIyMzQ2dXgxMjMwNXV4Njh1eDczdXg4OXV4MjQwMzl1eDIwODExdXgyMTE0N3V4NDl1eDU2dXgzMTg5MHV4MzEwMzZ1eDMwNDE4dXgzNTAxM3V4MTIyOTB1eDI5MjMzdXgyNjM3N3V4MjYxMDJ1eDIwNTA1dXgyMTQ4N3V4MjAxOTd1eDE5OTgxdXgyOTk5MnV4MzU4Mjh1eDIwOTg2dXgyNjQ2OXV4NjUyOTJ1eDIwMjk0dXgyMTQ4N3V4MjAxOTd1eDIwODg5dXgyMDk4NnV4MjY0Njl1eDY1MjkydXgzNTIwMXV4MzQ5MjB1eDM2Nzk4dXgyMDE2MHV4MjAwNDB1eDIzNjAxdXgzMDQ3NXV4MjAzMjB1eDMwMzQwdXgyNTE2M3V4MzM0MDJ1eDIxNjc5dXg2NTI4MSI7czoxNDoibmFtZV9tYXRjaF9yb3ciO3M6MzIyOiLlt6flhYvlipss5YWN6LS5LOWFjei0ueWTgeWBv+W3p+WFi+WKmyzlj6/ku6Us54OY54SZLOekvOebkizmiYvoibos5bCP5LirLOeIseaEjyzkuI3nlKjor7Qs5YaZ5Ye6LOWOn+S7tyznlJzonJzmg4XkurroioLvvIxESVnlt6flhYvlipvooajniLHmhI/vvIHku4UzOeWFg++8jOWNs+S6q+WOn+S7tzEwNuWFg+OAkOWwj+S4q+eDmOeEmeWdiuOAkURJWeW3p+WFi+WKmzE457KS56S855uS6KOF44CC54ix5pyJ5pe25YCZ5Y+v5Lul5LiN55So6K+05Ye65p2l77yM5L2G5Y+v5Lul5YaZ5Ye65p2l77yM6KaB6KGo6L6+5LuA5LmI5bCx55yL5L2g55qE5omL6Im65ZKv77yBIjtzOjEyOiJzdWJtaXRfY291bnQiO3M6MToiMSI7czoxMToicmVwbHlfY291bnQiO3M6MToiMSI7czo1OiJicmllZiI7czoyMTc6IueUnOicnOaDheS6uuiKgu+8jERJWeW3p+WFi+WKm+ihqOeIseaEj++8geS7hTM55YWD77yM5Y2z5Lqr5Y6f5Lu3MTA25YWD44CQ5bCP5Lir54OY54SZ5Z2K44CRRElZ5ben5YWL5YqbMTjnspLnpLznm5Loo4XjgILniLHmnInml7blgJnlj6/ku6XkuI3nlKjor7Tlh7rmnaXvvIzkvYblj6/ku6Xlhpnlh7rmnaXvvIzopoHooajovr7ku4DkuYjlsLHnnIvkvaDnmoTmiYvoibrlkq/vvIEiO3M6NDoic29ydCI7czoxOiIxIjtzOjk6ImlzX2VmZmVjdCI7czoxOiIxIjtzOjExOiJjbGlja19jb3VudCI7czoxOiIwIjtzOjEyOiJpc19yZWNvbW1lbmQiO3M6MToiMCI7czoxMToic3VwcGxpZXJfaWQiO3M6MjoiMTUiO319', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(162, '', '', '团购推荐:创意茶杯', 1329336284, 'sharetuan', 44, 'fanwe', 1, 0, 0, 162, 0, 0, 0, 0, 0, '', '', '', 0, 'Fanwe', 0, 0, '', '', 'ux21319ux28201,ux24773ux20154ux33410,ux37027ux20040,ux32654ux20029,ux39532ux20811ux26479,ux31119ux24030,ux21019ux24847,ux21464ux33394,ux26174ux29616,ux24515ux24847,ux33590ux26479,ux22242ux36141,ux25512ux33616', '升温,情人节,那么,美丽,马克杯,福州,创意,变色,显现,心意,茶杯,团购,推荐', '', '', ' 升温 情人节 那么 美丽 马克杯 福州 创意 变色 显现 心意', 0, 1, 0, '网站', '', 'YToyOntzOjM6InVybCI7YTozOntzOjk6ImFwcF9pbmRleCI7czo0OiJ0dWFuIjtzOjU6InJvdXRlIjtzOjQ6ImRlYWwiO3M6NToicGFyYW0iO3M6NToiaWQ9NTYiO31zOjQ6ImRhdGEiO2E6NzU6e3M6MjoiaWQiO3M6MjoiNTYiO3M6NDoibmFtZSI7czoyNjY6IuacgOacieWIm+aEj++8jOacgOWvjOW/g+aEj+eahOaDheS6uuiKguekvOeJqe+8geS7hTIz5YWD77yM5Y2z5Lqr5Y6f5Lu3NTDlhYPmg4XkurroioJESVnlj5joibLmna8v6ams5YWL5p2v77yM5LqM6YCJ5LiA44CC576O5Li955qE5Zu+5qGI5Zyo5Y2H5rip5ZCO5oWi5oWi5pi+546w77yM6YKj5LmI56We5aWH77yM6YKj5LmI5rWq5ryr77yM5q2j5aaC5L2g5Lus5riQ5riQ5Y2H5rip55qE54ix5oOF77yM5rC46L+c576O5Li977yB56aP5bee5biC5Yy65YyF6YKu77yBIjtzOjg6InN1Yl9uYW1lIjtzOjEyOiLliJvmhI/ojLbmna8iO3M6NzoiY2F0ZV9pZCI7czoyOiIxMCI7czoxMToic3VwcGxpZXJfaWQiO3M6MjoiMTkiO3M6MzoiaW1nIjtzOjUwOiIuL3B1YmxpYy9hdHRhY2htZW50LzIwMTIwMi8xNi8xMS80ZjNjN2YxZDM3ZGVhLmpwZyI7czoxMToiZGVzY3JpcHRpb24iO3M6MjE4NToiPHAgYWxpZ249ImNlbnRlciI+PHN0cm9uZz7jgJDnpo/lt57jgJFESVnlj5joibLmna8vPC9zdHJvbmc+PHN0cm9uZz7pqazlhYvmna88L3N0cm9uZz48L3A+DQo8cD48c3Ryb25nPuOAkOeJueWIq+aPkOekuuOAkTwvc3Ryb25nPjwvcD4NCjxwPjxzcGFuIHN0eWxlPSJjb2xvcjojZmYwMDAwOyI+PHN0cm9uZz7mnIkg5pWIIOacn++8mjIwMTLlubQy5pyIN+aXpeiHszIwMTLlubQz5pyIN+aXpe+8iOS4i+WNleWQjjfkuKrlt6XkvZzml6XlhoXpgIHovr7vvIk8L3N0cm9uZz48L3NwYW4+PC9wPg0KPHA+PHN0cm9uZz7kvb/nlKjpmZDliLY8L3N0cm9uZz7vvJrlj6/otK3kubDlpJrlvKDkvJjmg6DliLjvvJs8L3A+DQo8cD48c3Ryb25nPuWSqOivoueUteivne+8mjwvc3Ryb25nPjEzNTk5Mzk3Nzk377ybPC9wPg0KPHA+PHN0cm9uZz7ms6jmhI/kuovpobnvvJo8L3N0cm9uZz48L3A+DQo8cD4xLuacrOWNleemj+W3nuW4guWMuuWGheWFjei0uemFjemAge+8jOS4i+WNleWQjjfkuKrlt6XkvZzml6XlhoXpgIHovr7vvJs8L3A+DQo8cCBhbGlnbj0ibGVmdCI+Mi7or7flnKjkuIvljZXml7bloavlhpnmuIXmpZrmlLbotKfkurrlp5PlkI3jgIHogZTns7vnlLXor53lj4rmnInmlYjlnLDlnYDvvIjor7fliqHlv4XloavlhpnvvIzku6XlhY3lu7bor6/mlLbotKfvvInvvJs8L3A+DQo8cCBhbGlnbj0ibGVmdCI+My7or7fmgqjmnKzkurrnrb7mlLbvvIzllYblk4HpgIHovr7or7flvZPlnLrku5Tnu4bmo4Dmn6XpqozmlLbvvIzlpoLllYblk4HphY3pgIHmnInor6/jgIHmlbDph4/nvLrlpLHjgIHkuqflk4HnoLTmjZ/nrYnpl67popjvvIzor7flvZPpnaLlj4rml7blkJHphY3pgIHkurrlkZjmj5Dlh7rlubbmi5LmlLbvvIzllYblrrbkvJrlsL3lv6vkuLrmgqjlronmjpLosIPmjaLvvIzoi6Xlt7Lnrb7mlLblj5HnjrDkuIrov7Dpl67popjvvIzmpoLkuI3mj5DkvpvpgIDmjaLvvJs8L3A+DQo8cCBhbGlnbj0ibGVmdCI+NC7lm6DlsZ7phY3pgIHnsbvllYblk4HvvIzkuIvljZXlkI7phY3pgIHlh7rljrvliJnmpoLkuI3pgIDmrL7jgII8L3A+DQo8cCBhbGlnbj0ibGVmdCI+NS7or7flnKjkuIvljZXlkI7ogZTns7vlrqLmnI3vvIzlsIbmgqjpnIDopoHljbDliLDmna/lrZDkuIrnmoTlm77moYjlj5Hoh7PlrqLmnI3vvIzmiJHku6zlsIblsL3lv6vogZTns7vllYblrrbkuLrmgqjlpITnkIbjgII8L3A+DQo8cD48c3Ryb25nPui0reS5sOa1geeoi++8mjwvc3Ryb25nPjwvcD4NCjxwPjxzcGFuIHN0eWxlPSJjb2xvcjojZmYwMDAwOyI+6LSt5Lmw5Zui6LSt5Yi4Jm5ic3A7Jmd0OyZuYnNwO+Whq+WGmeWnk+WQjeOAgeiBlOezu+eUteivneOAgeWcsOWdgOWPiuWVhuWTgeS/oeaBryAmZ3Q7IOWwhuWbvueJh+WPkeiHs+WuouacjSZuYnNwOyZndDsmbmJzcDvnrYnlvoXpgIHotKfkuIrpl6g8L3NwYW4+PC9wPg0KPHA+5a6i5pyN55S16K+d77yaNDAwLTYwMC01NTE1IDwvcD4NCjxwPjxzdHJvbmc+44CQ5rS75Yqo6K+m5oOF44CRPC9zdHJvbmc+PC9wPg0KPHA+Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A744CQ5oOF5Lq66IqC54m55L6b44CR5pyA5pyJ5Yib5oSP77yM5pyA5a+M5b+D5oSP55qE5oOF5Lq66IqC56S854mp77yB5LuFMjPlhYPvvIzljbPkuqvljp/ku7c1MOWFg+aDheS6uuiKgkRJWeWPmOiJsuadry/pqazlhYvmna/vvIzkuozpgInkuIDjgILnvo7kuL3nmoTlm77moYjlnKjljYfmuKnlkI7mhaLmhaLmmL7njrDvvIzpgqPkuYjnpZ7lpYfvvIzpgqPkuYjmtarmvKvvvIzmraPlpoLkvaDku6zmuJDmuJDljYfmuKnnmoTniLHmg4XvvIzmsLjov5znvo7kuL3vvIHnpo/lt57luILljLrljIXpgq7vvIE8L3A+DQo8cD7jgJDlt6XoibrmnZDotKjjgJHlm73lrrbkuIDnuqfnmb3nk7cgPC9wPg0KPHA+44CQ5Yay5Y2w44CR5Zu95a625YWI6L+b54Ot6L2s5Y2w5oqA5pyvIDwvcD4NCjxwPuOAkOinhOagvOOAkemrmDkuNWNtO+ebtOW+hDguMmNtO+WuuemHjzMyNW1sIDwvcD4NCjxwPuOAkOWPr+WNsOWMuuWfn+OAkThjbSoxOWNtIDwvcD4NCjxwPuOAkOWItuS9nOWRqOacn+OAke+8iOS4jeWQq+mFjemAgeaXtumXtO+8iTUtN+WkqSA8YnIgLz4NCjwvcD4NCjxwPjxiciAvPg0KPC9wPg0KPHA+PGltZyBzcmM9Ii4vcHVibGljL2F0dGFjaG1lbnQvMjAxMjAyLzE2LzExLzRmM2M3ZjM3NGIxMmQuanBnIiBhbHQ9IiIgYm9yZGVyPSIwIiAvPjxiciAvPg0KPC9wPiI7czoxMDoiYmVnaW5fdGltZSI7czoxMDoiMTMyODAzOTk5NCI7czo4OiJlbmRfdGltZSI7czoxMDoiMTM2MDk1ODM5NiI7czoxMDoibWluX2JvdWdodCI7czoxOiIwIjtzOjEwOiJtYXhfYm91Z2h0IjtzOjE6IjAiO3M6MTU6InVzZXJfbWluX2JvdWdodCI7czoxOiIwIjtzOjE1OiJ1c2VyX21heF9ib3VnaHQiO3M6MToiMCI7czoxMjoib3JpZ2luX3ByaWNlIjtzOjg6IjEyMC4wMDAwIjtzOjEzOiJjdXJyZW50X3ByaWNlIjtzOjc6IjIwLjAwMDAiO3M6NzoiY2l0eV9pZCI7czoyOiIxNSI7czo5OiJpc19jb3Vwb24iO3M6MToiMSI7czoxMToiaXNfZGVsaXZlcnkiO3M6MToiMCI7czo5OiJpc19lZmZlY3QiO3M6MToiMSI7czo5OiJpc19kZWxldGUiO3M6MToiMCI7czoxMDoidXNlcl9jb3VudCI7czoxOiIwIjtzOjk6ImJ1eV9jb3VudCI7czoxOiIwIjtzOjExOiJ0aW1lX3N0YXR1cyI7czoxOiIxIjtzOjEwOiJidXlfc3RhdHVzIjtzOjE6IjEiO3M6OToiZGVhbF90eXBlIjtzOjE6IjAiO3M6MTM6ImFsbG93X3Byb21vdGUiO3M6MToiMCI7czoxMjoicmV0dXJuX21vbmV5IjtzOjY6IjAuMDAwMCI7czoxMjoicmV0dXJuX3Njb3JlIjtzOjE6IjAiO3M6NToiYnJpZWYiO3M6MDoiIjtzOjQ6InNvcnQiO3M6MjoiMjAiO3M6MTU6ImRlYWxfZ29vZHNfdHlwZSI7czoxOiIwIjtzOjEyOiJzdWNjZXNzX3RpbWUiO3M6MTA6IjEzMjkzMzYwMDgiO3M6MTc6ImNvdXBvbl9iZWdpbl90aW1lIjtzOjE6IjAiO3M6MTU6ImNvdXBvbl9lbmRfdGltZSI7czoxOiIwIjtzOjQ6ImNvZGUiO3M6MDoiIjtzOjY6IndlaWdodCI7czo2OiIwLjAwMDAiO3M6OToid2VpZ2h0X2lkIjtzOjE6IjEiO3M6MTE6ImlzX3JlZmVycmFsIjtzOjE6IjAiO3M6ODoiYnV5X3R5cGUiO3M6MToiMCI7czo4OiJkaXNjb3VudCI7czo2OiIwLjAwMDAiO3M6NDoiaWNvbiI7czo1MDoiLi9wdWJsaWMvYXR0YWNobWVudC8yMDEyMDIvMTYvMTEvNGYzYzdmMWQzN2RlYS5qcGciO3M6Njoibm90aWNlIjtzOjE6IjAiO3M6MTM6ImZyZWVfZGVsaXZlcnkiO3M6MToiMCI7czoxNDoiZGVmaW5lX3BheW1lbnQiO3M6MToiMCI7czo5OiJzZW9fdGl0bGUiO3M6MDoiIjtzOjExOiJzZW9fa2V5d29yZCI7czowOiIiO3M6MTU6InNlb19kZXNjcmlwdGlvbiI7czowOiIiO3M6NjoiaXNfaG90IjtzOjE6IjAiO3M6NjoiaXNfbmV3IjtzOjE6IjAiO3M6NzoiaXNfYmVzdCI7czoxOiIwIjtzOjEwOiJpc19sb3R0ZXJ5IjtzOjE6IjAiO3M6NjoicmVvcGVuIjtzOjE6IjAiO3M6NToidW5hbWUiO3M6MDoiIjtzOjEwOiJmb3JiaWRfc21zIjtzOjE6IjAiO3M6OToiY2FydF90eXBlIjtzOjE6IjAiO3M6MTI6InNob3BfY2F0ZV9pZCI7czoxOiIwIjtzOjc6ImlzX3Nob3AiO3M6MToiMCI7czoxMToidG90YWxfcG9pbnQiO3M6MToiMCI7czo5OiJhdmdfcG9pbnQiO3M6MToiMCI7czoxMToiY3JlYXRlX3RpbWUiO3M6MTA6IjEzMjkzMzYwMDgiO3M6MTE6InVwZGF0ZV90aW1lIjtzOjEwOiIxMzI5MzM2MDA4IjtzOjEwOiJuYW1lX21hdGNoIjtzOjc5ODoidXgyMTMxOXV4MjgyMDEsdXgyNDc3M3V4MjAxNTR1eDMzNDEwLHV4MzcwMjd1eDIwMDQwLHV4MzI2NTR1eDIwMDI5LHV4Mzk1MzJ1eDIwODExdXgyNjQ3OSx1eDMxMTE5dXgyNDAzMCx1eDIxMDE5dXgyNDg0Nyx1eDIxNDY0dXgzMzM5NCx1eDI2MTc0dXgyOTYxNix1eDI0NTE1dXgyNDg0Nyx1eDI2MzY4dXgyNjM3N3V4MjEwMTl1eDI0ODQ3dXg2NTI5MnV4MjYzNjh1eDIzNTAwdXgyNDUxNXV4MjQ4NDd1eDMwMzQwdXgyNDc3M3V4MjAxNTR1eDMzNDEwdXgzMTAzNnV4MjkyODl1eDY1MjgxdXgyMDE2NXV4NTB1eDUxdXgyMDgwM3V4NjUyOTJ1eDIxMzYzdXgyMDEzOXV4MjE0MDd1eDIwMjE1dXg1M3V4NDh1eDIwODAzdXgyNDc3M3V4MjAxNTR1eDMzNDEwdXg2OHV4NzN1eDg5dXgyMTQ2NHV4MzMzOTR1eDI2NDc5dXg0N3V4Mzk1MzJ1eDIwODExdXgyNjQ3OXV4NjUyOTJ1eDIwMTA4dXgzNjg3M3V4MTk5Njh1eDEyMjkwdXgzMjY1NHV4MjAwMjl1eDMwMzQwdXgyMjI3MHV4MjY2OTZ1eDIyMzEydXgyMTMxOXV4MjgyMDF1eDIxNTE4dXgyNDkzMHV4MjQ5MzB1eDI2MTc0dXgyOTYxNnV4NjUyOTJ1eDM3MDI3dXgyMDA0MHV4MzEwNzB1eDIyODU1dXg2NTI5MnV4MzcwMjd1eDIwMDQwdXgyODAxMHV4Mjg0NTl1eDY1MjkydXgyNzQ5MXV4MjI5MTR1eDIwMzIwdXgyMDIwNHV4MjgxNzZ1eDI4MTc2dXgyMTMxOXV4MjgyMDF1eDMwMzQwdXgyOTIzM3V4MjQ3NzN1eDY1MjkydXgyNzcwNHV4MzY4Mjh1eDMyNjU0dXgyMDAyOXV4NjUyODF1eDMxMTE5dXgyNDAzMHV4MjQwNjZ1eDIxMzA2dXgyMTI1M3V4MzcwMzh1eDY1MjgxIjtzOjE0OiJuYW1lX21hdGNoX3JvdyI7czozNDI6IuWNh+a4qSzmg4XkurroioIs6YKj5LmILOe+juS4vSzpqazlhYvmna8s56aP5beeLOWIm+aEjyzlj5joibIs5pi+546wLOW/g+aEjyzmnIDmnInliJvmhI/vvIzmnIDlr4zlv4PmhI/nmoTmg4XkurroioLnpLznianvvIHku4UyM+WFg++8jOWNs+S6q+WOn+S7tzUw5YWD5oOF5Lq66IqCRElZ5Y+Y6Imy5p2vL+mprOWFi+adr++8jOS6jOmAieS4gOOAgue+juS4veeahOWbvuahiOWcqOWNh+a4qeWQjuaFouaFouaYvueOsO+8jOmCo+S5iOelnuWlh++8jOmCo+S5iOa1qua8q++8jOato+WmguS9oOS7rOa4kOa4kOWNh+a4qeeahOeIseaDhe+8jOawuOi/nOe+juS4ve+8geemj+W3nuW4guWMuuWMhemCru+8gSI7czoxNToiZGVhbF9jYXRlX21hdGNoIjtzOjI4OiJ1eDI5OTgzdXgyNzk2M3V4MjYzODF1eDIxMTUzIjtzOjE5OiJkZWFsX2NhdGVfbWF0Y2hfcm93IjtzOjEyOiLnlJ/mtLvmnI3liqEiO3M6MTU6InNob3BfY2F0ZV9tYXRjaCI7czowOiIiO3M6MTk6InNob3BfY2F0ZV9tYXRjaF9yb3ciO3M6MDoiIjtzOjEyOiJsb2NhdGVfbWF0Y2giO3M6Mzc3OiJ1eDIwODQwdXgyMjI2OSx1eDMxMTE5dXgyNDAzMCx1eDMzOTQ1dXgyMTQ3NnV4MzM4MjksdXgzMTExOXV4MjQwMzB1eDI0MDY2LHV4MjEyNzF1eDM2MzM1LHV4MzE0NDl1eDI5MjYwLHV4MjE1MTh1eDM4NDk4LHV4MjM0ODZ1eDM5MzAyLHV4MjQzMTB1eDMxMTE5LHV4MjAxMTZ1eDE5OTY4LHV4MzExMTl1eDI0MDMwdXgyNDA2NnV4MjAxMTZ1eDE5OTY4dXgyMTI3MXV4MzYzMzV1eDU0dXg1NXV4MjE0OTV1eDY1Mjg4dXgzMzk0NXV4MjE0NzZ1eDMzODI5dXgzMTQ0OXV4MjkyNjB1eDIxNTE4dXg2NTI4OXV4MjQzMTB1eDMxMTE5dXgyMzQ4NnV4MzkzMDJ1eDIxNTE4dXgzODQ5OCx1eDQwNzIzdXgyNzAwNHV4MjEzMDYsdXgyMDExNnV4MTk5Njh1eDI0MTkxdXgyMjMzMCI7czoxNjoibG9jYXRlX21hdGNoX3JvdyI7czoxNjc6IuWFqOWbvSznpo/lt54s6JKZ5Y+k6JClLOemj+W3nuW4gizljJfot68s56uZ54mMLOWQjumZoizlrr7ppoYs5bu256aPLOS6lOS4gCznpo/lt57luILkupTkuIDljJfot682N+WPt++8iOiSmeWPpOiQpeermeeJjOWQju+8ieW7tuemj+WuvummhuWQjumZoizpvJPmpbzljLos5LqU5LiA5bm/5Zy6IjtzOjk6InRhZ19tYXRjaCI7czowOiIiO3M6MTM6InRhZ19tYXRjaF9yb3ciO3M6MDoiIjtzOjY6Inhwb2ludCI7czo5OiIxMTkuMzE1ODUiO3M6NjoieXBvaW50IjtzOjk6IjI2LjA4OTY0MSI7czo4OiJicmFuZF9pZCI7czoxOiIwIjtzOjEzOiJicmFuZF9wcm9tb3RlIjtzOjE6IjAiO319', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(163, '', '', '商品推荐:七匹狼男装', 1329337052, 'sharegoods', 44, 'fanwe', 1, 0, 0, 163, 0, 0, 0, 0, 1, '', '', '', 0, 'Fanwe', 0, 0, '', '', 'ux19971ux21305ux29436,ux32701ux32466ux26381,ux21452ux38754,ux27491ux21697,ux30007ux35013,ux21407ux20215,ux22806ux22871,ux55ux48ux49ux48ux56ux54,ux49ux49ux57ux57,ux52ux46ux51,ux21830ux21697,ux25512ux33616', '七匹狼,羽绒服,双面,正品,男装,原价,外套,701086,1199,4.3,商品,推荐', '', '', ' 七匹狼 羽绒服 双面 正品 男装 原价 外套 701086 1199 4.3', 0, 1, 0, '网站', '', 'YToyOntzOjM6InVybCI7YTozOntzOjk6ImFwcF9pbmRleCI7czo0OiJzaG9wIjtzOjU6InJvdXRlIjtzOjU6Imdvb2RzIjtzOjU6InBhcmFtIjtzOjU6ImlkPTQ3Ijt9czo0OiJkYXRhIjthOjc1OntzOjI6ImlkIjtzOjI6IjQ3IjtzOjQ6Im5hbWUiO3M6NzQ6IjQuM+aKmOWOn+S7tzExOTnmraPlk4HkuIPljLnni7znlLfoo4Ug5Yas5qy+5aSW5aWX5Y+M6Z2i5Yas576957uS5pyNNzAxMDg2IjtzOjg6InN1Yl9uYW1lIjtzOjE1OiLkuIPljLnni7znlLfoo4UiO3M6NzoiY2F0ZV9pZCI7czoxOiIwIjtzOjExOiJzdXBwbGllcl9pZCI7czoxOiIwIjtzOjM6ImltZyI7czo0NDoiLi9wdWJsaWMvYXR0YWNobWVudC8yMDEyMDEvNGYwMTMyOWQ2MGZhMi5qcGciO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjc2OiI8aW1nIHNyYz0iLi9wdWJsaWMvYXR0YWNobWVudC8yMDEyMDEvNGYwMTMyYjg1ZmJiNC5qcGciIGFsdD0iIiBib3JkZXI9IjAiIC8+IjtzOjEwOiJiZWdpbl90aW1lIjtzOjE6IjAiO3M6ODoiZW5kX3RpbWUiO3M6MToiMCI7czoxMDoibWluX2JvdWdodCI7czoxOiIwIjtzOjEwOiJtYXhfYm91Z2h0IjtzOjE6IjAiO3M6MTU6InVzZXJfbWluX2JvdWdodCI7czoxOiIwIjtzOjE1OiJ1c2VyX21heF9ib3VnaHQiO3M6MToiMCI7czoxMjoib3JpZ2luX3ByaWNlIjtzOjk6IjExOTkuMDAwMCI7czoxMzoiY3VycmVudF9wcmljZSI7czo4OiI1MjUuMDAwMCI7czo3OiJjaXR5X2lkIjtzOjE6IjEiO3M6OToiaXNfY291cG9uIjtzOjE6IjAiO3M6MTE6ImlzX2RlbGl2ZXJ5IjtzOjE6IjEiO3M6OToiaXNfZWZmZWN0IjtzOjE6IjEiO3M6OToiaXNfZGVsZXRlIjtzOjE6IjAiO3M6MTA6InVzZXJfY291bnQiO3M6MToiMSI7czo5OiJidXlfY291bnQiO3M6MToiMSI7czoxMToidGltZV9zdGF0dXMiO3M6MToiMSI7czoxMDoiYnV5X3N0YXR1cyI7czoxOiIxIjtzOjk6ImRlYWxfdHlwZSI7czoxOiIwIjtzOjEzOiJhbGxvd19wcm9tb3RlIjtzOjE6IjAiO3M6MTI6InJldHVybl9tb25leSI7czo2OiIwLjAwMDAiO3M6MTI6InJldHVybl9zY29yZSI7czozOiIzMDAiO3M6NToiYnJpZWYiO3M6MDoiIjtzOjQ6InNvcnQiO3M6MjoiMTEiO3M6MTU6ImRlYWxfZ29vZHNfdHlwZSI7czoxOiI4IjtzOjEyOiJzdWNjZXNzX3RpbWUiO3M6MTA6IjEzMjU0NDk4NTkiO3M6MTc6ImNvdXBvbl9iZWdpbl90aW1lIjtzOjE6IjAiO3M6MTU6ImNvdXBvbl9lbmRfdGltZSI7czoxOiIwIjtzOjQ6ImNvZGUiO3M6MDoiIjtzOjY6IndlaWdodCI7czo2OiIwLjAwMDAiO3M6OToid2VpZ2h0X2lkIjtzOjE6IjEiO3M6MTE6ImlzX3JlZmVycmFsIjtzOjE6IjAiO3M6ODoiYnV5X3R5cGUiO3M6MToiMCI7czo4OiJkaXNjb3VudCI7czo2OiIwLjAwMDAiO3M6NDoiaWNvbiI7czo0NDoiLi9wdWJsaWMvYXR0YWNobWVudC8yMDEyMDEvNGYwMTMyOTgyMjdlYy5qcGciO3M6Njoibm90aWNlIjtzOjE6IjAiO3M6MTM6ImZyZWVfZGVsaXZlcnkiO3M6MToiMCI7czoxNDoiZGVmaW5lX3BheW1lbnQiO3M6MToiMCI7czo5OiJzZW9fdGl0bGUiO3M6MDoiIjtzOjExOiJzZW9fa2V5d29yZCI7czowOiIiO3M6MTU6InNlb19kZXNjcmlwdGlvbiI7czowOiIiO3M6NjoiaXNfaG90IjtzOjE6IjEiO3M6NjoiaXNfbmV3IjtzOjE6IjEiO3M6NzoiaXNfYmVzdCI7czoxOiIxIjtzOjEwOiJpc19sb3R0ZXJ5IjtzOjE6IjAiO3M6NjoicmVvcGVuIjtzOjE6IjAiO3M6NToidW5hbWUiO3M6MDoiIjtzOjEwOiJmb3JiaWRfc21zIjtzOjE6IjAiO3M6OToiY2FydF90eXBlIjtzOjE6IjAiO3M6MTI6InNob3BfY2F0ZV9pZCI7czoyOiIzMSI7czo3OiJpc19zaG9wIjtzOjE6IjEiO3M6MTE6InRvdGFsX3BvaW50IjtzOjE6IjUiO3M6OToiYXZnX3BvaW50IjtzOjE6IjUiO3M6MTE6ImNyZWF0ZV90aW1lIjtzOjEwOiIxMzI1NDQ5ODU4IjtzOjExOiJ1cGRhdGVfdGltZSI7czoxMDoiMTMyNTQ1NjQzMiI7czoxMDoibmFtZV9tYXRjaCI7czozNjY6InV4MTk5NzF1eDIxMzA1dXgyOTQzNix1eDMyNzAxdXgzMjQ2NnV4MjYzODEsdXgyMTQ1MnV4Mzg3NTQsdXgyNzQ5MXV4MjE2OTcsdXgzMDAwN3V4MzUwMTMsdXgyMTQwN3V4MjAyMTUsdXgyMjgwNnV4MjI4NzEsdXg1NXV4NDh1eDQ5dXg0OHV4NTZ1eDU0LHV4NDl1eDQ5dXg1N3V4NTcsdXg1MnV4NDZ1eDUxLHV4NTJ1eDQ2dXg1MXV4MjUyNDB1eDIxNDA3dXgyMDIxNXV4NDl1eDQ5dXg1N3V4NTd1eDI3NDkxdXgyMTY5N3V4MTk5NzF1eDIxMzA1dXgyOTQzNnV4MzAwMDd1eDM1MDEzdXgyMDkwOHV4Mjc0NTR1eDIyODA2dXgyMjg3MXV4MjE0NTJ1eDM4NzU0dXgyMDkwOHV4MzI3MDF1eDMyNDY2dXgyNjM4MXV4NTV1eDQ4dXg0OXV4NDh1eDU2dXg1NCI7czoxNDoibmFtZV9tYXRjaF9yb3ciO3M6MTQ1OiLkuIPljLnni7ws576957uS5pyNLOWPjOmdoizmraPlk4Es55S36KOFLOWOn+S7tyzlpJblpZcsNzAxMDg2LDExOTksNC4zLDQuM+aKmOWOn+S7tzExOTnmraPlk4HkuIPljLnni7znlLfoo4Ug5Yas5qy+5aSW5aWX5Y+M6Z2i5Yas576957uS5pyNNzAxMDg2IjtzOjE1OiJkZWFsX2NhdGVfbWF0Y2giO3M6MDoiIjtzOjE5OiJkZWFsX2NhdGVfbWF0Y2hfcm93IjtzOjA6IiI7czoxNToic2hvcF9jYXRlX21hdGNoIjtzOjY1OiJ1eDI2MzgxdXgzNTAxM3V4NDR1eDIwODY5dXgzNDkxNXV4NDR1eDM3MTk3dXgyMDIxNCx1eDMwMDA3dXgzNTAxMyI7czoxOToic2hvcF9jYXRlX21hdGNoX3JvdyI7czoyNzoi5pyN6KOFLOWGheihoyzphY3ku7Ys55S36KOFIjtzOjEyOiJsb2NhdGVfbWF0Y2giO3M6MTQ6InV4MjA4NDB1eDIyMjY5IjtzOjE2OiJsb2NhdGVfbWF0Y2hfcm93IjtzOjY6IuWFqOWbvSI7czo5OiJ0YWdfbWF0Y2giO3M6NjY6InV4NDA2NTd1eDMzMzk0LHV4MzYyMjl1eDIyODIzdXgzMDcyMSx1eDIyODIzdXgzMDcyMSx1eDIwMDEzdXgzMDcyMSI7czoxMzoidGFnX21hdGNoX3JvdyI7czozMDoi6buR6ImyLOi2heWkp+eggSzlpKfnoIEs5Lit56CBIjtzOjY6Inhwb2ludCI7czowOiIiO3M6NjoieXBvaW50IjtzOjA6IiI7czo4OiJicmFuZF9pZCI7czoyOiIxMiI7czoxMzoiYnJhbmRfcHJvbW90ZSI7czoxOiIwIjt9fQ==', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(164, '', '很美的地方，有机会一定要去看看', '很美的地方，有机会一定要去看看[强][强]', 1331937682, 'share', 44, 'fanwe', 1, 0, 0, 164, 0, 0, 0, 0, 6, '', '', '', 0, 'Array', 0, 1, '', '', 'ux33258ux21161ux28216,ux26053ux34892,ux32654ux30340,ux19968ux23450,ux26426ux20250,ux30475ux30475,ux22320ux26041', '自助游,旅行,美的,一定,机会,看看,地方', '', '', ' 自助游 旅行', 1, 1, 0, '网站', '', '', '', 1, 1, 1, '', 0, 0, 'ux20241ux38386ux23089ux20048,ux20048ux20139ux32654ux39135,ux26053ux28216ux37202ux24215,ux37117ux24066ux36141ux29289,ux24184ux31119ux23621ux23478,ux28010ux28459ux23130ux24651,ux29609ux20048ux24110ux27966', '休闲娱乐,乐享美食,旅游酒店,都市购物,幸福居家,浪漫婚恋,玩乐帮派', '', 2, 'a:2:{i:0;a:5:{s:4:"path";s:76:"./public/comment/201203/17/14/94856efdccc3994d42c406b2d519e03480_100x100.jpg";s:6:"o_path";s:68:"./public/comment/201203/17/14/94856efdccc3994d42c406b2d519e03480.jpg";s:5:"width";s:3:"750";s:6:"height";s:3:"497";s:2:"id";s:3:"128";}i:1;a:5:{s:4:"path";s:76:"./public/comment/201203/17/14/07109f2cb2018941eab28ab7093d87ac36_100x100.jpg";s:6:"o_path";s:68:"./public/comment/201203/17/14/07109f2cb2018941eab28ab7093d87ac36.jpg";s:5:"width";s:3:"750";s:6:"height";s:3:"499";s:2:"id";s:3:"129";}}', 0, 'a:12:{s:2:"id";s:1:"1";s:4:"name";s:22:"那个地方很美~❤";s:4:"memo";s:626:"✿趁我们还年轻，多出去走动走动。发现某个地方 某个角落很美✿\r\n\r\n✿ 那便是一种买再多再贵的东西都得不到的感觉✿\r\n\r\n1、姐妹们可以将自己喜欢任何的城市、任何小店...介绍给大家~\r\n\r\n2、要有理由和感想哦~\r\n\r\n3、附有自己拍的照片~	\r\n	\r\n    ✿喜欢旅游，喜欢美丽的景色，喜欢一切美好事物的朋友们一定要来哟~✿\r\n\r\n    ✿本小组是在情人节创建的 嘿嘿~✿\r\n\r\n    ✿希望本小组可以慢慢的壮大~	✿\r\n\r\n✿喜欢把那一幅幅美丽的画面制成明信片，喜欢收集各色各样的明信片✿";s:4:"sort";s:1:"1";s:11:"create_time";s:10:"1331937520";s:7:"cate_id";s:1:"3";s:10:"user_count";s:1:"1";s:11:"topic_count";s:1:"7";s:4:"icon";s:50:"./public/attachment/201203/17/14/4f643167c6a86.jpg";s:5:"image";s:50:"./public/attachment/201203/17/14/4f64316f2da12.jpg";s:9:"is_effect";s:1:"1";s:7:"user_id";s:2:"44";}'),
(165, '', '不是寺庙的寺庙——西藏宗山古堡', '似乎，我从西藏回来，已经好久了。\r\n\r\n迟迟没有动笔，我不承认是因为懒。\r\n\r\n我是怕写不出动人之处，让大家失望，也让自己失望。\r\n\r\n终于，非要等到该忘记的几乎全忘了，才想着该下笔了。\r\n\r\n关于照片，我们一路都在后悔没把相机说明书带出来，再加上照片几乎都是在车上拍的，我也不会什么ps，所以也就不强求什么质量。', 1331938077, 'share', 44, 'fanwe', 1, 0, 0, 165, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux26053ux34892,ux35199ux34255,ux23546ux24217,ux22833ux26395,ux20960ux20046,ux29031ux29255,ux20160ux20040,ux19979ux31508,ux21160ux31508,ux20986ux21160,ux24378ux27714,ux36831ux36831', '旅行,西藏,寺庙,失望,几乎,照片,什么,下笔,动笔,出动,强求,迟迟', '', '', ' 旅行 西藏 寺庙', 1, 1, 0, '网站', '', '', '', 1, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(166, '', '海是倒过来的天空', '这是在船上拍的。\r\n当时正是日落时分。可是船却是逆着日落的方向前行着。\r\n这场日落持续了很久很久很久[爱心][爱心]', 1331938194, 'share', 46, 'fzmatthew', 1, 0, 0, 166, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux26085ux33853,ux22823ux28023,ux22825ux31354,ux29233ux24515,ux33337ux19978,ux26102ux20998,ux21069ux34892,ux36825ux22330,ux21364ux26159,ux27491ux26159,ux24403ux26102,ux21487ux26159', '日落,大海,天空,爱心,船上,时分,前行,这场,却是,正是,当时,可是', '', '', ' 日落 大海 天空', 1, 1, 0, '网站', '', '', '', 1, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(167, '', '', '', 1331938209, 'share', 46, 'fzmatthew', 1, 0, 0, 164, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 164, 0, '', '', '', '', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(168, '', '我们❤家要像这样-客厅篇', '心爱的客厅~有咪咪小盆友，是从日本来的哦，我把他领养回来，但…', 1331938359, 'share', 44, 'fanwe', 1, 0, 0, 168, 0, 0, 0, 0, 0, '', '', '', 0, 'Array', 0, 0, '', '', 'ux26085ux31995,ux29483ux21674,ux23478ux23621,ux37329ux40060,ux24515ux29233,ux36824ux26377,ux30406,ux33537ux22766ux25104ux38271,ux26085ux26412,ux26080ux31351ux26080ux23613,ux39046ux20859,ux21674ux21674,ux31383ux21488', '日系,猫咪,家居,金鱼,心爱,还有,盆,茁壮成长,日本,无穷无尽,领养,咪咪,窗台', '', '', ' 日系 猫咪 家居', 1, 1, 0, '网站', '', '', '', 2, 0, 0, '', 0, 0, 'ux20241ux38386ux23089ux20048,ux20048ux20139ux32654ux39135,ux26053ux28216ux37202ux24215,ux37117ux24066ux36141ux29289,ux24184ux31119ux23621ux23478,ux28010ux28459ux23130ux24651,ux29609ux20048ux24110ux27966', '休闲娱乐,乐享美食,旅游酒店,都市购物,幸福居家,浪漫婚恋,玩乐帮派', '', 2, 'a:2:{i:0;a:5:{s:4:"path";s:76:"./public/comment/201203/17/14/3d90ef28d42571b28151e30b47af58da56_100x100.jpg";s:6:"o_path";s:68:"./public/comment/201203/17/14/3d90ef28d42571b28151e30b47af58da56.jpg";s:5:"width";s:3:"468";s:6:"height";s:3:"467";s:2:"id";s:3:"133";}i:1;a:5:{s:4:"path";s:76:"./public/comment/201203/17/14/a4b94ac22fec6b6cc76d8c0bf5283cb316_100x100.jpg";s:6:"o_path";s:68:"./public/comment/201203/17/14/a4b94ac22fec6b6cc76d8c0bf5283cb316.jpg";s:5:"width";s:3:"468";s:6:"height";s:3:"467";s:2:"id";s:3:"134";}}', 0, 'a:12:{s:2:"id";s:1:"2";s:4:"name";s:24:"我们❤家要像这样";s:4:"memo";s:630:"你是恋物控吗？\r\n你喜欢搜集温馨的家居小物吗？\r\n你喜欢装扮自己的小家吗？\r\n欢迎姑娘们加入这个小组～为这里添砖加瓦 \r\n一起讨论自己的小家， 自己的小店，自己的房间要长成什么样：）	\r\n~~~~~~~~~~~~~~~~~~~	\r\n❤温馨提醒❤：\r\n为了方便大家查找自己喜欢的类别信息，请大家按照以下形式写主题哦~\r\n{我们❤家要像这样-色彩篇}\r\n{我们❤家要像这样-原木篇}\r\n{我们❤家要像这样-地中海篇}\r\n{我们❤家要像这样-饰物篇}\r\n待补充。。。\r\n小组还在起步阶段 期待大家的加入与分享！";s:4:"sort";s:1:"2";s:11:"create_time";s:10:"1331937599";s:7:"cate_id";s:1:"1";s:10:"user_count";s:1:"1";s:11:"topic_count";s:1:"5";s:4:"icon";s:50:"./public/attachment/201203/17/14/4f6431b8f2030.jpg";s:5:"image";s:50:"./public/attachment/201203/17/14/4f6431bded69f.jpg";s:9:"is_effect";s:1:"1";s:7:"user_id";s:2:"44";}'),
(169, '', '节省空间篇', '别看房子小 装修有妙招', 1331938416, 'share', 44, 'fanwe', 1, 0, 0, 169, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux31616ux32422,ux33410ux30465ux31354ux38388,ux23478ux23621,ux22937ux25307,ux25151ux23376,ux35013ux20462', '简约,节省空间,家居,妙招,房子,装修', '', '', ' 简约 节省空间 家居', 1, 1, 0, '网站', '', '', '', 2, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(170, '', '很美的清江河。', '很美的清江河。', 1331938485, 'share', 44, 'fanwe', 1, 0, 0, 170, 0, 0, 0, 0, 0, '', '', '', 0, 'share', 0, 0, '', '', 'ux32654ux30340,ux27743ux27827', '美的,江河', '', '', '', 1, 1, 0, '网站', '', '', '', 1, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(171, '', '很美丽的日落', '很美丽的日落[得意][得意]', 1331938803, 'share', 44, 'fanwe', 1, 0, 0, 171, 0, 0, 0, 0, 0, '', '', '', 0, 'Array', 0, 0, '', '', 'ux40644ux26127,ux25668ux24433,ux24471ux24847,ux26085ux33853,ux32654ux20029', '黄昏,摄影,得意,日落,美丽', '', '', ' 黄昏 摄影', 1, 1, 0, '网站', '', '', '', 1, 0, 0, '', 0, 0, '', '', '', 2, 'a:2:{i:0;a:5:{s:4:"path";s:76:"./public/comment/201203/17/14/94ea06c2948de50688a0828c6eeb626a79_100x100.jpg";s:6:"o_path";s:68:"./public/comment/201203/17/14/94ea06c2948de50688a0828c6eeb626a79.jpg";s:5:"width";s:4:"1280";s:6:"height";s:3:"853";s:2:"id";s:3:"137";}i:1;a:5:{s:4:"path";s:76:"./public/comment/201203/17/14/2d7e5b9d69685d315df2cfec70aa7bbe58_100x100.jpg";s:6:"o_path";s:68:"./public/comment/201203/17/14/2d7e5b9d69685d315df2cfec70aa7bbe58.jpg";s:5:"width";s:4:"1280";s:6:"height";s:3:"853";s:2:"id";s:3:"138";}}', 0, 'a:12:{s:2:"id";s:1:"1";s:4:"name";s:22:"那个地方很美~❤";s:4:"memo";s:626:"✿趁我们还年轻，多出去走动走动。发现某个地方 某个角落很美✿\r\n\r\n✿ 那便是一种买再多再贵的东西都得不到的感觉✿\r\n\r\n1、姐妹们可以将自己喜欢任何的城市、任何小店...介绍给大家~\r\n\r\n2、要有理由和感想哦~\r\n\r\n3、附有自己拍的照片~	\r\n	\r\n    ✿喜欢旅游，喜欢美丽的景色，喜欢一切美好事物的朋友们一定要来哟~✿\r\n\r\n    ✿本小组是在情人节创建的 嘿嘿~✿\r\n\r\n    ✿希望本小组可以慢慢的壮大~	✿\r\n\r\n✿喜欢把那一幅幅美丽的画面制成明信片，喜欢收集各色各样的明信片✿";s:4:"sort";s:1:"1";s:11:"create_time";s:10:"1331937520";s:7:"cate_id";s:1:"3";s:10:"user_count";s:1:"1";s:11:"topic_count";s:1:"7";s:4:"icon";s:50:"./public/attachment/201203/17/14/4f643167c6a86.jpg";s:5:"image";s:50:"./public/attachment/201203/17/14/4f64316f2da12.jpg";s:9:"is_effect";s:1:"1";s:7:"user_id";s:2:"44";}'),
(172, '', '在小岛旅行！', '蜈支洲码头：乘坐10分钟游轮抵岛，很漂亮的地方，只是有点晕船…', 1331938903, 'share', 44, 'fanwe', 1, 0, 0, 172, 0, 0, 0, 0, 0, '', '', '', 0, 'Array', 0, 0, '', '', 'ux33258ux21161ux28216,ux26053ux34892,ux23567ux23707,ux22823ux28023,ux26197ux33337,ux28216ux36718,ux23707ux19978,ux20056ux22352,ux30721ux22836,ux21628ux21628,ux26377ux28857,ux21482ux26159,ux20998ux38047,ux28418ux20142', '自助游,旅行,小岛,大海,晕船,游轮,岛上,乘坐,码头,呼呼,有点,只是,分钟,漂亮', '', '', ' 自助游 旅行 小岛 大海', 1, 1, 0, '网站', '', '', '', 1, 0, 0, '', 0, 0, 'ux20241ux38386ux23089ux20048,ux20048ux20139ux32654ux39135,ux26053ux28216ux37202ux24215,ux37117ux24066ux36141ux29289,ux24184ux31119ux23621ux23478,ux28010ux28459ux23130ux24651,ux29609ux20048ux24110ux27966', '休闲娱乐,乐享美食,旅游酒店,都市购物,幸福居家,浪漫婚恋,玩乐帮派', '', 1, 'a:1:{i:0;a:5:{s:4:"path";s:76:"./public/comment/201203/17/15/46a5beee2cd270c475466c10a121db9219_100x100.jpg";s:6:"o_path";s:68:"./public/comment/201203/17/15/46a5beee2cd270c475466c10a121db9219.jpg";s:5:"width";s:3:"468";s:6:"height";s:3:"350";s:2:"id";s:3:"139";}}', 0, 'a:12:{s:2:"id";s:1:"1";s:4:"name";s:22:"那个地方很美~❤";s:4:"memo";s:626:"✿趁我们还年轻，多出去走动走动。发现某个地方 某个角落很美✿\r\n\r\n✿ 那便是一种买再多再贵的东西都得不到的感觉✿\r\n\r\n1、姐妹们可以将自己喜欢任何的城市、任何小店...介绍给大家~\r\n\r\n2、要有理由和感想哦~\r\n\r\n3、附有自己拍的照片~	\r\n	\r\n    ✿喜欢旅游，喜欢美丽的景色，喜欢一切美好事物的朋友们一定要来哟~✿\r\n\r\n    ✿本小组是在情人节创建的 嘿嘿~✿\r\n\r\n    ✿希望本小组可以慢慢的壮大~	✿\r\n\r\n✿喜欢把那一幅幅美丽的画面制成明信片，喜欢收集各色各样的明信片✿";s:4:"sort";s:1:"1";s:11:"create_time";s:10:"1331937520";s:7:"cate_id";s:1:"3";s:10:"user_count";s:1:"1";s:11:"topic_count";s:1:"7";s:4:"icon";s:50:"./public/attachment/201203/17/14/4f643167c6a86.jpg";s:5:"image";s:50:"./public/attachment/201203/17/14/4f64316f2da12.jpg";s:9:"is_effect";s:1:"1";s:7:"user_id";s:2:"44";}'),
(173, '', '在云端', '在云端', 1331938956, 'share', 44, 'fanwe', 1, 0, 0, 173, 0, 0, 0, 0, 0, '', '', '', 0, 'Array', 0, 0, '', '', 'ux20113ux31471,ux39134ux26426,ux26053ux34892', '云端,飞机,旅行', '', '', ' 云端 飞机 旅行', 1, 1, 0, '网站', '', '', '', 1, 0, 0, '', 0, 0, '', '', '', 1, 'a:1:{i:0;a:5:{s:4:"path";s:76:"./public/comment/201203/17/15/66521bf2db57360ac27fd9fddfdffd1969_100x100.jpg";s:6:"o_path";s:68:"./public/comment/201203/17/15/66521bf2db57360ac27fd9fddfdffd1969.jpg";s:5:"width";s:3:"468";s:6:"height";s:3:"625";s:2:"id";s:3:"140";}}', 0, 'a:12:{s:2:"id";s:1:"1";s:4:"name";s:22:"那个地方很美~❤";s:4:"memo";s:626:"✿趁我们还年轻，多出去走动走动。发现某个地方 某个角落很美✿\r\n\r\n✿ 那便是一种买再多再贵的东西都得不到的感觉✿\r\n\r\n1、姐妹们可以将自己喜欢任何的城市、任何小店...介绍给大家~\r\n\r\n2、要有理由和感想哦~\r\n\r\n3、附有自己拍的照片~	\r\n	\r\n    ✿喜欢旅游，喜欢美丽的景色，喜欢一切美好事物的朋友们一定要来哟~✿\r\n\r\n    ✿本小组是在情人节创建的 嘿嘿~✿\r\n\r\n    ✿希望本小组可以慢慢的壮大~	✿\r\n\r\n✿喜欢把那一幅幅美丽的画面制成明信片，喜欢收集各色各样的明信片✿";s:4:"sort";s:1:"1";s:11:"create_time";s:10:"1331937520";s:7:"cate_id";s:1:"3";s:10:"user_count";s:1:"1";s:11:"topic_count";s:1:"7";s:4:"icon";s:50:"./public/attachment/201203/17/14/4f643167c6a86.jpg";s:5:"image";s:50:"./public/attachment/201203/17/14/4f64316f2da12.jpg";s:9:"is_effect";s:1:"1";s:7:"user_id";s:2:"44";}'),
(174, '', '愤怒的小鸟', '[得意][得意]', 1331939026, 'share', 44, 'fanwe', 1, 0, 0, 174, 0, 0, 0, 0, 0, '', '', '', 0, 'Array', 0, 0, '', '', 'ux24471ux24847', '得意', '', '', '', 1, 1, 0, '网站', '', '', '', 2, 0, 0, '', 0, 0, '', '', '', 1, 'a:1:{i:0;a:5:{s:4:"path";s:76:"./public/comment/201203/17/15/10a8df3b7f89e9d770e7f15f1db5cd3120_100x100.jpg";s:6:"o_path";s:68:"./public/comment/201203/17/15/10a8df3b7f89e9d770e7f15f1db5cd3120.jpg";s:5:"width";s:3:"500";s:6:"height";s:3:"500";s:2:"id";s:3:"141";}}', 0, 'a:12:{s:2:"id";s:1:"2";s:4:"name";s:24:"我们❤家要像这样";s:4:"memo";s:630:"你是恋物控吗？\r\n你喜欢搜集温馨的家居小物吗？\r\n你喜欢装扮自己的小家吗？\r\n欢迎姑娘们加入这个小组～为这里添砖加瓦 \r\n一起讨论自己的小家， 自己的小店，自己的房间要长成什么样：）	\r\n~~~~~~~~~~~~~~~~~~~	\r\n❤温馨提醒❤：\r\n为了方便大家查找自己喜欢的类别信息，请大家按照以下形式写主题哦~\r\n{我们❤家要像这样-色彩篇}\r\n{我们❤家要像这样-原木篇}\r\n{我们❤家要像这样-地中海篇}\r\n{我们❤家要像这样-饰物篇}\r\n待补充。。。\r\n小组还在起步阶段 期待大家的加入与分享！";s:4:"sort";s:1:"2";s:11:"create_time";s:10:"1331937599";s:7:"cate_id";s:1:"1";s:10:"user_count";s:1:"1";s:11:"topic_count";s:1:"5";s:4:"icon";s:50:"./public/attachment/201203/17/14/4f6431b8f2030.jpg";s:5:"image";s:50:"./public/attachment/201203/17/14/4f6431bded69f.jpg";s:9:"is_effect";s:1:"1";s:7:"user_id";s:2:"44";}');
INSERT INTO `fanwe_topic` (`id`, `title`, `forum_title`, `content`, `create_time`, `type`, `user_id`, `user_name`, `is_effect`, `is_delete`, `relay_id`, `origin_id`, `reply_count`, `relay_count`, `good_count`, `bad_count`, `click_count`, `rel_app_index`, `rel_route`, `rel_param`, `message_id`, `topic_group`, `fav_id`, `fav_count`, `user_name_match`, `user_name_match_row`, `keyword_match`, `keyword_match_row`, `xpoint`, `ypoint`, `tags`, `is_recommend`, `has_image`, `source_type`, `source_name`, `source_url`, `group_data`, `daren_page`, `group_id`, `is_top`, `is_best`, `op_memo`, `last_time`, `last_user_id`, `cate_match`, `cate_match_row`, `origin_topic_data`, `images_count`, `image_list`, `is_cached`, `topic_group_data`) VALUES
(175, '', '它在干什么？', '它在干什么？[白眼][白眼]', 1331939071, 'share', 44, 'fanwe', 1, 0, 0, 175, 0, 0, 0, 0, 0, '', '', '', 0, 'Array', 0, 0, '', '', 'ux23456ux29289,ux29483ux21674,ux30333ux30524,ux24178ux20160ux20040', '宠物,猫咪,白眼,干什么', '', '', ' 宠物 猫咪', 1, 1, 0, '网站', '', '', '', 2, 0, 0, '', 0, 0, '', '', '', 1, 'a:1:{i:0;a:5:{s:4:"path";s:76:"./public/comment/201203/17/15/3036d0a4d5c61784b4fff657cacbc36396_100x100.jpg";s:6:"o_path";s:68:"./public/comment/201203/17/15/3036d0a4d5c61784b4fff657cacbc36396.jpg";s:5:"width";s:4:"1024";s:6:"height";s:3:"768";s:2:"id";s:3:"142";}}', 0, 'a:12:{s:2:"id";s:1:"2";s:4:"name";s:24:"我们❤家要像这样";s:4:"memo";s:630:"你是恋物控吗？\r\n你喜欢搜集温馨的家居小物吗？\r\n你喜欢装扮自己的小家吗？\r\n欢迎姑娘们加入这个小组～为这里添砖加瓦 \r\n一起讨论自己的小家， 自己的小店，自己的房间要长成什么样：）	\r\n~~~~~~~~~~~~~~~~~~~	\r\n❤温馨提醒❤：\r\n为了方便大家查找自己喜欢的类别信息，请大家按照以下形式写主题哦~\r\n{我们❤家要像这样-色彩篇}\r\n{我们❤家要像这样-原木篇}\r\n{我们❤家要像这样-地中海篇}\r\n{我们❤家要像这样-饰物篇}\r\n待补充。。。\r\n小组还在起步阶段 期待大家的加入与分享！";s:4:"sort";s:1:"2";s:11:"create_time";s:10:"1331937599";s:7:"cate_id";s:1:"1";s:10:"user_count";s:1:"1";s:11:"topic_count";s:1:"5";s:4:"icon";s:50:"./public/attachment/201203/17/14/4f6431b8f2030.jpg";s:5:"image";s:50:"./public/attachment/201203/17/14/4f6431bded69f.jpg";s:9:"is_effect";s:1:"1";s:7:"user_id";s:2:"44";}'),
(176, '', '这部电影叫什么？', '这部电影叫什么？[奋斗][奋斗]', 1331939121, 'share', 44, 'fanwe', 1, 0, 0, 176, 0, 0, 0, 0, 0, '', '', '', 0, 'Array', 0, 0, '', '', 'ux22859ux26007,ux36825ux37096,ux20160ux20040,ux30005ux24433', '奋斗,这部,什么,电影', '', '', '', 1, 1, 0, '网站', '', '', '', 2, 0, 0, '', 0, 0, '', '', '', 1, 'a:1:{i:0;a:5:{s:4:"path";s:76:"./public/comment/201203/17/15/c3cd163b781bba9c27f6599b33d2b3b815_100x100.jpg";s:6:"o_path";s:68:"./public/comment/201203/17/15/c3cd163b781bba9c27f6599b33d2b3b815.jpg";s:5:"width";s:3:"600";s:6:"height";s:3:"891";s:2:"id";s:3:"143";}}', 0, 'a:12:{s:2:"id";s:1:"2";s:4:"name";s:24:"我们❤家要像这样";s:4:"memo";s:630:"你是恋物控吗？\r\n你喜欢搜集温馨的家居小物吗？\r\n你喜欢装扮自己的小家吗？\r\n欢迎姑娘们加入这个小组～为这里添砖加瓦 \r\n一起讨论自己的小家， 自己的小店，自己的房间要长成什么样：）	\r\n~~~~~~~~~~~~~~~~~~~	\r\n❤温馨提醒❤：\r\n为了方便大家查找自己喜欢的类别信息，请大家按照以下形式写主题哦~\r\n{我们❤家要像这样-色彩篇}\r\n{我们❤家要像这样-原木篇}\r\n{我们❤家要像这样-地中海篇}\r\n{我们❤家要像这样-饰物篇}\r\n待补充。。。\r\n小组还在起步阶段 期待大家的加入与分享！";s:4:"sort";s:1:"2";s:11:"create_time";s:10:"1331937599";s:7:"cate_id";s:1:"1";s:10:"user_count";s:1:"1";s:11:"topic_count";s:1:"5";s:4:"icon";s:50:"./public/attachment/201203/17/14/4f6431b8f2030.jpg";s:5:"image";s:50:"./public/attachment/201203/17/14/4f6431bded69f.jpg";s:9:"is_effect";s:1:"1";s:7:"user_id";s:2:"44";}'),
(177, '对爱琴海餐厅发表了点评', '', '上周去吃过，感觉不错。推荐这家餐厅[坏笑]', 1333241498, 'slocationcomment', 44, 'fanwe', 1, 0, 0, 177, 0, 0, 0, 0, 0, 'youhui', 'store#view', 'id=15', 0, 'share', 0, 0, '', '', 'ux36825ux23478,ux19978ux21608,ux39184ux21381,ux19981ux38169,ux24863ux35273,ux25512ux33616,ux29233ux29748ux28023,ux28857ux35780,ux21457ux34920,ux23545ux29233ux29748ux28023ux39184ux21381ux21457ux34920ux20102ux28857ux35780', '这家,上周,餐厅,不错,感觉,推荐,爱琴海,点评,发表,对爱琴海餐厅发表了点评', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(178, '对爱琴海餐厅发表了点评', '', '非常好非常好非常好非常好非常好非常好非常好', 1333241553, 'slocationcomment', 44, 'fanwe', 1, 0, 0, 178, 0, 0, 0, 0, 0, 'youhui', 'store#view', 'id=15', 0, 'share', 0, 0, '', '', 'ux38750ux24120,ux29233ux29748ux28023,ux39184ux21381,ux28857ux35780,ux21457ux34920,ux23545ux29233ux29748ux28023ux39184ux21381ux21457ux34920ux20102ux28857ux35780', '非常,爱琴海,餐厅,点评,发表,对爱琴海餐厅发表了点评', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, ''),
(179, '对爱琴海餐厅发表了点评', '', '一般般一般般一般般一般般一般般一般般一般般一般般一般般一般般一般般一般般一般般一般般', 1333241576, 'slocationcomment', 44, 'fanwe', 1, 0, 0, 179, 0, 0, 0, 0, 0, 'youhui', 'store#view', 'id=15', 0, 'share', 0, 0, '', '', 'ux19968ux33324ux33324,ux29233ux29748ux28023,ux39184ux21381,ux28857ux35780,ux21457ux34920,ux23545ux29233ux29748ux28023ux39184ux21381ux21457ux34920ux20102ux28857ux35780', '一般般,爱琴海,餐厅,点评,发表,对爱琴海餐厅发表了点评', '', '', '', 0, 0, 0, '网站', '', '', '', 0, 0, 0, '', 0, 0, '', '', '', 0, '', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_topic_cate_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_topic_cate_link` (
  `topic_id` int(11) NOT NULL,
  `cate_id` int(11) NOT NULL,
  PRIMARY KEY (`topic_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_topic_cate_link`
--

INSERT INTO `fanwe_topic_cate_link` (`topic_id`, `cate_id`) VALUES
(133, 1),
(133, 2),
(133, 3),
(133, 4),
(133, 5),
(133, 6),
(133, 7),
(134, 1),
(134, 2),
(134, 3),
(134, 4),
(134, 5),
(134, 6),
(134, 7),
(135, 1),
(135, 2),
(135, 3),
(135, 4),
(135, 5),
(135, 6),
(135, 7),
(136, 1),
(136, 2),
(136, 3),
(136, 4),
(136, 5),
(136, 6),
(136, 7),
(137, 1),
(137, 2),
(137, 3),
(137, 4),
(137, 5),
(137, 6),
(137, 7),
(146, 1),
(147, 1),
(148, 1),
(152, 3),
(164, 1),
(164, 2),
(164, 3),
(164, 4),
(164, 5),
(164, 6),
(164, 7),
(168, 1),
(168, 2),
(168, 3),
(168, 4),
(168, 5),
(168, 6),
(168, 7),
(172, 1),
(172, 2),
(172, 3),
(172, 4),
(172, 5),
(172, 6),
(172, 7);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_topic_group`
--

CREATE TABLE IF NOT EXISTS `fanwe_topic_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `memo` text NOT NULL,
  `sort` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `cate_id` int(11) NOT NULL,
  `user_count` int(11) NOT NULL,
  `topic_count` int(11) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `fanwe_topic_group`
--

INSERT INTO `fanwe_topic_group` (`id`, `name`, `memo`, `sort`, `create_time`, `cate_id`, `user_count`, `topic_count`, `icon`, `image`, `is_effect`, `user_id`) VALUES
(1, '那个地方很美~❤', '✿趁我们还年轻，多出去走动走动。发现某个地方 某个角落很美✿\r\n\r\n✿ 那便是一种买再多再贵的东西都得不到的感觉✿\r\n\r\n1、姐妹们可以将自己喜欢任何的城市、任何小店...介绍给大家~\r\n\r\n2、要有理由和感想哦~\r\n\r\n3、附有自己拍的照片~	\r\n	\r\n    ✿喜欢旅游，喜欢美丽的景色，喜欢一切美好事物的朋友们一定要来哟~✿\r\n\r\n    ✿本小组是在情人节创建的 嘿嘿~✿\r\n\r\n    ✿希望本小组可以慢慢的壮大~	✿\r\n\r\n✿喜欢把那一幅幅美丽的画面制成明信片，喜欢收集各色各样的明信片✿', 1, 1331937520, 3, 1, 7, './public/attachment/201203/17/14/4f643167c6a86.jpg', './public/attachment/201203/17/14/4f64316f2da12.jpg', 1, 44),
(2, '我们❤家要像这样', '你是恋物控吗？\r\n你喜欢搜集温馨的家居小物吗？\r\n你喜欢装扮自己的小家吗？\r\n欢迎姑娘们加入这个小组～为这里添砖加瓦 \r\n一起讨论自己的小家， 自己的小店，自己的房间要长成什么样：）	\r\n~~~~~~~~~~~~~~~~~~~	\r\n❤温馨提醒❤：\r\n为了方便大家查找自己喜欢的类别信息，请大家按照以下形式写主题哦~\r\n{我们❤家要像这样-色彩篇}\r\n{我们❤家要像这样-原木篇}\r\n{我们❤家要像这样-地中海篇}\r\n{我们❤家要像这样-饰物篇}\r\n待补充。。。\r\n小组还在起步阶段 期待大家的加入与分享！', 2, 1331937599, 1, 1, 5, './public/attachment/201203/17/14/4f6431b8f2030.jpg', './public/attachment/201203/17/14/4f6431bded69f.jpg', 1, 44);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_topic_group_cate`
--

CREATE TABLE IF NOT EXISTS `fanwe_topic_group_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `group_count` int(11) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `fanwe_topic_group_cate`
--

INSERT INTO `fanwe_topic_group_cate` (`id`, `name`, `sort`, `icon`, `group_count`, `is_effect`) VALUES
(1, '时尚', 1, '', 1, 1),
(2, '美食', 2, '', 0, 1),
(3, '旅行', 3, '', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_topic_image`
--

CREATE TABLE IF NOT EXISTS `fanwe_topic_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `filesize` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `topic_table` varchar(255) NOT NULL,
  `o_path` varchar(255) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=144 ;

--
-- 转存表中的数据 `fanwe_topic_image`
--

INSERT INTO `fanwe_topic_image` (`id`, `topic_id`, `name`, `filesize`, `create_time`, `user_id`, `user_name`, `path`, `topic_table`, `o_path`, `width`, `height`) VALUES
(78, 131, 'ch1.jpg', 25250, 1328311856, 44, 'fanwe', './public/comment/201202/04/15/5d1b7f7e0a1ea52700cd53df79a7e32524_100x100.jpg', 'topic', './public/comment/201202/04/15/5d1b7f7e0a1ea52700cd53df79a7e32524.jpg', 510, 415),
(79, 131, 'ch2.jpg', 15125, 1328311863, 44, 'fanwe', './public/comment/201202/04/15/5d7e4407af01370b957421ddace76cf379_100x100.jpg', 'topic', './public/comment/201202/04/15/5d7e4407af01370b957421ddace76cf379.jpg', 450, 450),
(80, 131, 'ch3.jpg', 29240, 1328311866, 44, 'fanwe', './public/comment/201202/04/15/0af5bbe43efe7b6dea9ee468248c560e68_100x100.jpg', 'topic', './public/comment/201202/04/15/0af5bbe43efe7b6dea9ee468248c560e68.jpg', 510, 361),
(81, 131, 'ch4.jpg', 53319, 1328311869, 44, 'fanwe', './public/comment/201202/04/15/ad3223eb6ae4b63cf16e62b39f3db04897_100x100.jpg', 'topic', './public/comment/201202/04/15/ad3223eb6ae4b63cf16e62b39f3db04897.jpg', 510, 468),
(82, 131, 'ch5.jpg', 29240, 1328311872, 44, 'fanwe', './public/comment/201202/04/15/7d349340f511f2999a8344c335b14d4274_100x100.jpg', 'topic', './public/comment/201202/04/15/7d349340f511f2999a8344c335b14d4274.jpg', 510, 361),
(83, 132, 'sy.jpg', 207495, 1328312045, 44, 'fanwe', './public/comment/201202/04/15/ea03ad310dcbe85c691ac13bf836361778_100x100.jpg', 'topic', './public/comment/201202/04/15/ea03ad310dcbe85c691ac13bf836361778.jpg', 1280, 853),
(84, 132, 'sy2.jpg', 213082, 1328312049, 44, 'fanwe', './public/comment/201202/04/15/a03b1900ae539db09b9d3e90463b0c5160_100x100.jpg', 'topic', './public/comment/201202/04/15/a03b1900ae539db09b9d3e90463b0c5160.jpg', 1280, 738),
(85, 133, 'hc2.jpg', 106345, 1328312146, 44, 'fanwe', './public/comment/201202/04/15/7c00633a7f05b0445cd86bf1624dcb2558_100x100.jpg', 'topic', './public/comment/201202/04/15/7c00633a7f05b0445cd86bf1624dcb2558.jpg', 1280, 853),
(86, 133, 'hc3.jpg', 104056, 1328312149, 44, 'fanwe', './public/comment/201202/04/15/01df8dd4bda5c2eac50b99ee9570d97978_100x100.jpg', 'topic', './public/comment/201202/04/15/01df8dd4bda5c2eac50b99ee9570d97978.jpg', 1280, 853),
(87, 133, 'hc4.jpg', 99763, 1328312153, 44, 'fanwe', './public/comment/201202/04/15/0c51bb5f59f5b09a653d09080337871727_100x100.jpg', 'topic', './public/comment/201202/04/15/0c51bb5f59f5b09a653d09080337871727.jpg', 1280, 853),
(88, 133, 'hc.jpg', 98412, 1328312157, 44, 'fanwe', './public/comment/201202/04/15/0ef50d2c26dab3da41a5a871aa82abbf95_100x100.jpg', 'topic', './public/comment/201202/04/15/0ef50d2c26dab3da41a5a871aa82abbf95.jpg', 1280, 853),
(89, 134, 'qkl3.jpg', 268598, 1328312239, 44, 'fanwe', './public/comment/201202/04/15/d0ae28178ea3867e7722580634aa565767_100x100.jpg', 'topic', './public/comment/201202/04/15/d0ae28178ea3867e7722580634aa565767.jpg', 1280, 960),
(90, 134, 'qkl.jpg', 11083, 1328312245, 44, 'fanwe', './public/comment/201202/04/15/625f35e65814061ddef9a251276c8dd691_100x100.jpg', 'topic', './public/comment/201202/04/15/625f35e65814061ddef9a251276c8dd691.jpg', 200, 150),
(91, 135, 'cw2.jpg', 127358, 1328312346, 44, 'fanwe', './public/comment/201202/04/15/b9463eeb39987ca7e4d7726e9dccd72661_100x100.jpg', 'topic', './public/comment/201202/04/15/b9463eeb39987ca7e4d7726e9dccd72661.jpg', 1024, 768),
(92, 135, 'cw3.jpg', 146724, 1328312350, 44, 'fanwe', './public/comment/201202/04/15/5ca45df4a76eb9d1ee02fbe1a76b1b8c88_100x100.jpg', 'topic', './public/comment/201202/04/15/5ca45df4a76eb9d1ee02fbe1a76b1b8c88.jpg', 1024, 768),
(93, 135, 'cw.jpg', 91359, 1328312353, 44, 'fanwe', './public/comment/201202/04/15/fcfa3bc75df97377b5d22f663cfbdaae20_100x100.jpg', 'topic', './public/comment/201202/04/15/fcfa3bc75df97377b5d22f663cfbdaae20.jpg', 500, 639),
(94, 136, 'dy2.jpg', 219162, 1328312478, 44, 'fanwe', './public/comment/201202/04/15/3ed4cb6547a6a2a20237b55adf94d15594_100x100.jpg', 'topic', './public/comment/201202/04/15/3ed4cb6547a6a2a20237b55adf94d15594.jpg', 1280, 852),
(95, 136, 'dy3.jpg', 268797, 1328312482, 44, 'fanwe', './public/comment/201202/04/15/b517bda8ae56a6d36582a190fea06d2185_100x100.jpg', 'topic', './public/comment/201202/04/15/b517bda8ae56a6d36582a190fea06d2185.jpg', 1280, 852),
(96, 136, 'dy4.jpg', 10924, 1328312484, 44, 'fanwe', './public/comment/201202/04/15/19fdde7cba47936c9e998a85df85ce8686_100x100.jpg', 'topic', './public/comment/201202/04/15/19fdde7cba47936c9e998a85df85ce8686.jpg', 200, 133),
(97, 136, 'dy.jpg', 174286, 1328312488, 44, 'fanwe', './public/comment/201202/04/15/3664834a17d5d7d890bfcabb3e764e0f75_100x100.jpg', 'topic', './public/comment/201202/04/15/3664834a17d5d7d890bfcabb3e764e0f75.jpg', 1280, 855),
(98, 137, 'fn2.jpg', 50526, 1328312574, 44, 'fanwe', './public/comment/201202/04/15/be2c85548ad5fca063bd9d1d6add1faa13_100x100.jpg', 'topic', './public/comment/201202/04/15/be2c85548ad5fca063bd9d1d6add1faa13.jpg', 500, 500),
(99, 137, 'fn3.jpg', 52533, 1328312579, 44, 'fanwe', './public/comment/201202/04/15/05891ca45a216fc5aed6280bcaad084b93_100x100.jpg', 'topic', './public/comment/201202/04/15/05891ca45a216fc5aed6280bcaad084b93.jpg', 500, 500),
(100, 137, 'fn4.jpg', 48558, 1328312581, 44, 'fanwe', './public/comment/201202/04/15/822c1f3758e4b32e4327fbdb987a5b2d74_100x100.jpg', 'topic', './public/comment/201202/04/15/822c1f3758e4b32e4327fbdb987a5b2d74.jpg', 500, 500),
(101, 137, 'fn5.jpg', 59060, 1328312584, 44, 'fanwe', './public/comment/201202/04/15/13ba7fa8f7da90cd70f28d0296eed81073_100x100.jpg', 'topic', './public/comment/201202/04/15/13ba7fa8f7da90cd70f28d0296eed81073.jpg', 500, 500),
(102, 137, 'fn.jpg', 52061, 1328312587, 44, 'fanwe', './public/comment/201202/04/15/8b44310b7de3c540d24aabcfff97465f84_100x100.jpg', 'topic', './public/comment/201202/04/15/8b44310b7de3c540d24aabcfff97465f84.jpg', 500, 500),
(103, 144, '1546566505-1862554.jpg', 164816, 1328315193, 45, 'fz云淡风轻', './public/comment/201202/04/16/381b79ce992fb34191c9b9559b0fb9ea53_100x100.jpg', 'topic', './public/comment/201202/04/16/381b79ce992fb34191c9b9559b0fb9ea53.jpg', 800, 1066),
(104, 145, '1611441045-1877915.jpg', 280015, 1328315222, 45, 'fz云淡风轻', './public/comment/201202/04/16/f20cce9abe05d5def08330b5103a832580_100x100.jpg', 'topic', './public/comment/201202/04/16/f20cce9abe05d5def08330b5103a832580.jpg', 1280, 800),
(105, 146, 'xc.jpg', 140492, 1328315276, 45, 'fz云淡风轻', './public/comment/201202/04/16/a69a84427dd071df105eeb4bdf3f537a69_100x100.jpg', 'topic', './public/comment/201202/04/16/a69a84427dd071df105eeb4bdf3f537a69.jpg', 600, 885),
(106, 147, 'ddy1.jpg', 90877, 1328315326, 45, 'fz云淡风轻', './public/comment/201202/04/16/2bb1fba7bd9e10b01fea8a248d15129213_100x100.jpg', 'topic', './public/comment/201202/04/16/2bb1fba7bd9e10b01fea8a248d15129213.jpg', 600, 891),
(107, 147, 'ddy2.jpg', 67815, 1328315329, 45, 'fz云淡风轻', './public/comment/201202/04/16/52ffbe9fa4d1d960db5ed6fb4dd41ec676_100x100.jpg', 'topic', './public/comment/201202/04/16/52ffbe9fa4d1d960db5ed6fb4dd41ec676.jpg', 600, 251),
(108, 147, 'dy3.jpg', 268797, 1328315333, 45, 'fz云淡风轻', './public/comment/201202/04/16/4c5971b0370e739c71ea9d0f5e2e35e257_100x100.jpg', 'topic', './public/comment/201202/04/16/4c5971b0370e739c71ea9d0f5e2e35e257.jpg', 1280, 852),
(109, 148, 'ddy3.jpg', 99657, 1328315341, 45, 'fz云淡风轻', './public/comment/201202/04/16/347ba3d76c8cd114c26edd0097f657f168_100x100.jpg', 'topic', './public/comment/201202/04/16/347ba3d76c8cd114c26edd0097f657f168.jpg', 600, 400),
(110, 149, 'jp2.jpg', 116380, 1328315535, 45, 'fz云淡风轻', './public/comment/201202/04/16/a6808a103a19a445758c19031101371027_100x100.jpg', 'topic', './public/comment/201202/04/16/a6808a103a19a445758c19031101371027.jpg', 560, 493),
(111, 149, 'jp3.jpg', 142457, 1328315539, 45, 'fz云淡风轻', './public/comment/201202/04/16/47b1e49026ba7978bfa66545d0b25b7375_100x100.jpg', 'topic', './public/comment/201202/04/16/47b1e49026ba7978bfa66545d0b25b7375.jpg', 560, 465),
(112, 149, 'jp4.jpg', 69293, 1328315542, 45, 'fz云淡风轻', './public/comment/201202/04/16/2bb76d2bce44ef4405afcf26ed4d8c3511_100x100.jpg', 'topic', './public/comment/201202/04/16/2bb76d2bce44ef4405afcf26ed4d8c3511.jpg', 562, 456),
(113, 150, 'cww.jpg', 82015, 1328315598, 45, 'fz云淡风轻', './public/comment/201202/04/16/9aa15c792e0050e557ae6204329ff2ef98_100x100.jpg', 'topic', './public/comment/201202/04/16/9aa15c792e0050e557ae6204329ff2ef98.jpg', 480, 360),
(114, 150, 'cwww.jpg', 68014, 1328315601, 45, 'fz云淡风轻', './public/comment/201202/04/16/8a91e74d3723d560b792bdbb65a1211d78_100x100.jpg', 'topic', './public/comment/201202/04/16/8a91e74d3723d560b792bdbb65a1211d78.jpg', 510, 385),
(115, 151, 'sh.jpg', 91364, 1328315647, 45, 'fz云淡风轻', './public/comment/201202/04/16/e7e31636c26893863eb22f204351c0e535_100x100.jpg', 'topic', './public/comment/201202/04/16/e7e31636c26893863eb22f204351c0e535.jpg', 510, 515),
(116, 151, 'sh2.jpg', 101034, 1328315651, 45, 'fz云淡风轻', './public/comment/201202/04/16/c227a7c72c7780733ddccff8d987a0ef45_100x100.jpg', 'topic', './public/comment/201202/04/16/c227a7c72c7780733ddccff8d987a0ef45.jpg', 510, 517),
(117, 152, 'lx1.jpg', 167536, 1328315717, 45, 'fz云淡风轻', './public/comment/201202/04/16/59da51816b4eb48e835a9c7dffcf5fa880_100x100.jpg', 'topic', './public/comment/201202/04/16/59da51816b4eb48e835a9c7dffcf5fa880.jpg', 750, 497),
(118, 152, 'lx2.jpg', 168350, 1328315723, 45, 'fz云淡风轻', './public/comment/201202/04/16/8315ee9fd08bce1b8aca7ff9037d564328_100x100.jpg', 'topic', './public/comment/201202/04/16/8315ee9fd08bce1b8aca7ff9037d564328.jpg', 750, 499),
(119, 152, 'lx3.jpg', 148536, 1328315730, 45, 'fz云淡风轻', './public/comment/201202/04/16/fe9d5b48eb465991c1bac5380167e1bf22_100x100.jpg', 'topic', './public/comment/201202/04/16/fe9d5b48eb465991c1bac5380167e1bf22.jpg', 750, 499),
(120, 158, 'qkl3.jpg', 268598, 1328316487, 44, 'fanwe', './public/comment/201202/04/16/89b9f115dc9ee936440ce4294a19308c21_100x100.jpg', 'topic', './public/comment/201202/04/16/89b9f115dc9ee936440ce4294a19308c21.jpg', 1280, 960),
(121, 161, '60abe1073dee6f61192cd99bd575508443.jpg', 102222, 1329336267, 44, 'fanwe', './public/comment/201202/16/12/60abe1073dee6f61192cd99bd575508443_100x100.jpg', 'topic', './public/comment/201202/16/12/60abe1073dee6f61192cd99bd575508443.jpg', 420, 310),
(122, 162, '06ba7dca277558844809da860de26fec36.jpg', 151800, 1329336282, 44, 'fanwe', './public/comment/201202/16/12/06ba7dca277558844809da860de26fec36_100x100.jpg', 'topic', './public/comment/201202/16/12/06ba7dca277558844809da860de26fec36.jpg', 450, 310),
(123, 163, 'dff04d8009b248f1c5325fd9c15cc63d54.jpg', 22460, 1329337049, 44, 'fanwe', './public/comment/201202/16/12/dff04d8009b248f1c5325fd9c15cc63d54_100x100.jpg', 'topic', './public/comment/201202/16/12/dff04d8009b248f1c5325fd9c15cc63d54.jpg', 310, 310),
(124, 163, '31a7340dfa1e9ef6d7e92778518fb6d743.jpg', 23863, 1329337049, 44, 'fanwe', './public/comment/201202/16/12/31a7340dfa1e9ef6d7e92778518fb6d743_100x100.jpg', 'topic', './public/comment/201202/16/12/31a7340dfa1e9ef6d7e92778518fb6d743.jpg', 310, 310),
(125, 163, 'd432a21eab274e9f69dab11625ec500048.jpg', 27056, 1329337049, 44, 'fanwe', './public/comment/201202/16/12/d432a21eab274e9f69dab11625ec500048_100x100.jpg', 'topic', './public/comment/201202/16/12/d432a21eab274e9f69dab11625ec500048.jpg', 310, 310),
(126, 163, '592e71388f6524562f6ca79e1f3354d449.jpg', 27937, 1329337049, 44, 'fanwe', './public/comment/201202/16/12/592e71388f6524562f6ca79e1f3354d449_100x100.jpg', 'topic', './public/comment/201202/16/12/592e71388f6524562f6ca79e1f3354d449.jpg', 310, 310),
(127, 163, 'f41d7224291caaa87707c6f9a791ae3c37.jpg', 16947, 1329337049, 44, 'fanwe', './public/comment/201202/16/12/f41d7224291caaa87707c6f9a791ae3c37_100x100.jpg', 'topic', './public/comment/201202/16/12/f41d7224291caaa87707c6f9a791ae3c37.jpg', 310, 310),
(128, 164, 'lx1.jpg', 287406, 1331937648, 44, 'fanwe', './public/comment/201203/17/14/94856efdccc3994d42c406b2d519e03480_100x100.jpg', 'topic', './public/comment/201203/17/14/94856efdccc3994d42c406b2d519e03480.jpg', 750, 497),
(129, 164, 'lx3.jpg', 262608, 1331937657, 44, 'fanwe', './public/comment/201203/17/14/07109f2cb2018941eab28ab7093d87ac36_100x100.jpg', 'topic', './public/comment/201203/17/14/07109f2cb2018941eab28ab7093d87ac36.jpg', 750, 499),
(130, 165, '111.jpg', 129671, 1331938059, 44, 'fanwe', './public/comment/201203/17/14/d5270c5f1c1bc26f351ddfe09e0df65b57_100x100.jpg', 'topic', './public/comment/201203/17/14/d5270c5f1c1bc26f351ddfe09e0df65b57.jpg', 468, 310),
(131, 166, '123.jpg', 128770, 1331938179, 46, 'fzmatthew', './public/comment/201203/17/14/01bfbcd6b90e47bc6e0594dcf9714e1635_100x100.jpg', 'topic', './public/comment/201203/17/14/01bfbcd6b90e47bc6e0594dcf9714e1635.jpg', 468, 624),
(132, 166, '223.jpg', 102208, 1331938182, 46, 'fzmatthew', './public/comment/201203/17/14/c21e8c61792ff72f227a7808713cc68830_100x100.jpg', 'topic', './public/comment/201203/17/14/c21e8c61792ff72f227a7808713cc68830.jpg', 468, 624),
(133, 168, '123.jpg', 130698, 1331938329, 44, 'fanwe', './public/comment/201203/17/14/3d90ef28d42571b28151e30b47af58da56_100x100.jpg', 'topic', './public/comment/201203/17/14/3d90ef28d42571b28151e30b47af58da56.jpg', 468, 467),
(134, 168, '223.jpg', 118813, 1331938332, 44, 'fanwe', './public/comment/201203/17/14/a4b94ac22fec6b6cc76d8c0bf5283cb316_100x100.jpg', 'topic', './public/comment/201203/17/14/a4b94ac22fec6b6cc76d8c0bf5283cb316.jpg', 468, 467),
(135, 169, '123.jpg', 90294, 1331938404, 44, 'fanwe', './public/comment/201203/17/14/87e7e8b8bfb05f2b519b49812cd7aa2124_100x100.jpg', 'topic', './public/comment/201203/17/14/87e7e8b8bfb05f2b519b49812cd7aa2124.jpg', 468, 334),
(136, 170, '123.jpg', 181346, 1331938484, 44, 'fanwe', './public/comment/201203/17/14/44fac473deeb49e37c574342fcc5706333_100x100.jpg', 'topic', './public/comment/201203/17/14/44fac473deeb49e37c574342fcc5706333.jpg', 468, 624),
(137, 171, 'hc2.jpg', 264603, 1331938770, 44, 'fanwe', './public/comment/201203/17/14/94ea06c2948de50688a0828c6eeb626a79_100x100.jpg', 'topic', './public/comment/201203/17/14/94ea06c2948de50688a0828c6eeb626a79.jpg', 1280, 853),
(138, 171, 'hc3.jpg', 238190, 1331938775, 44, 'fanwe', './public/comment/201203/17/14/2d7e5b9d69685d315df2cfec70aa7bbe58_100x100.jpg', 'topic', './public/comment/201203/17/14/2d7e5b9d69685d315df2cfec70aa7bbe58.jpg', 1280, 853),
(139, 172, 'xd.jpg', 74631, 1331938891, 44, 'fanwe', './public/comment/201203/17/15/46a5beee2cd270c475466c10a121db9219_100x100.jpg', 'topic', './public/comment/201203/17/15/46a5beee2cd270c475466c10a121db9219.jpg', 468, 350),
(140, 173, 'td.jpg', 109140, 1331938945, 44, 'fanwe', './public/comment/201203/17/15/66521bf2db57360ac27fd9fddfdffd1969_100x100.jpg', 'topic', './public/comment/201203/17/15/66521bf2db57360ac27fd9fddfdffd1969.jpg', 468, 625),
(141, 174, 'fn2.jpg', 125272, 1331939025, 44, 'fanwe', './public/comment/201203/17/15/10a8df3b7f89e9d770e7f15f1db5cd3120_100x100.jpg', 'topic', './public/comment/201203/17/15/10a8df3b7f89e9d770e7f15f1db5cd3120.jpg', 500, 500),
(142, 175, 'cw2.jpg', 406222, 1331939046, 44, 'fanwe', './public/comment/201203/17/15/3036d0a4d5c61784b4fff657cacbc36396_100x100.jpg', 'topic', './public/comment/201203/17/15/3036d0a4d5c61784b4fff657cacbc36396.jpg', 1024, 768),
(143, 176, 'ddy1.jpg', 246083, 1331939104, 44, 'fanwe', './public/comment/201203/17/15/c3cd163b781bba9c27f6599b33d2b3b815_100x100.jpg', 'topic', './public/comment/201203/17/15/c3cd163b781bba9c27f6599b33d2b3b815.jpg', 600, 891);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_topic_reply`
--

CREATE TABLE IF NOT EXISTS `fanwe_topic_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `reply_id` int(11) NOT NULL,
  `reply_user_id` int(11) NOT NULL,
  `reply_user_name` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reply_id` (`reply_id`),
  KEY `topic_id` (`topic_id`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- 转存表中的数据 `fanwe_topic_reply`
--

INSERT INTO `fanwe_topic_reply` (`id`, `topic_id`, `content`, `user_id`, `user_name`, `reply_id`, `reply_user_id`, `reply_user_name`, `create_time`, `is_effect`, `is_delete`) VALUES
(38, 137, '[尴尬][尴尬]', 44, 'fanwe', 0, 0, '', 1328312626, 1, 0),
(39, 137, '回复@fanwe:[尴尬][尴尬][尴尬]', 46, 'fzmatthew', 38, 44, 'fanwe', 1328312707, 1, 0),
(40, 139, '看起来很好吃[示爱][示爱]', 45, 'fz云淡风轻', 0, 0, '', 1328312823, 1, 0),
(41, 154, '相当美', 46, 'fzmatthew', 0, 0, '', 1328315861, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_topic_tag`
--

CREATE TABLE IF NOT EXISTS `fanwe_topic_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_recommend` tinyint(1) NOT NULL COMMENT '是否推荐',
  `count` int(11) NOT NULL COMMENT '是否为预设标签',
  `is_preset` tinyint(1) NOT NULL,
  `color` varchar(10) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `fanwe_topic_tag`
--

INSERT INTO `fanwe_topic_tag` (`id`, `name`, `is_recommend`, `count`, `is_preset`, `color`, `sort`) VALUES
(1, '电影', 1, 2, 1, '', 0),
(2, '自助游', 1, 0, 1, '', 0),
(3, '闽菜', 1, 0, 1, '', 0),
(4, '川菜', 1, 0, 1, '', 0),
(5, '咖啡', 1, 0, 1, '#fff100', 0),
(6, '牛排', 1, 0, 1, '#a1410d', 0),
(7, '包包', 1, 0, 0, '#ed008c', 0),
(8, '复古', 1, 0, 0, '#a36209', 0),
(9, '甜美', 1, 0, 0, '', 0),
(10, '日系', 1, 0, 0, '#a4d49d', 0),
(11, '欧美', 1, 0, 0, '#ee1d24', 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_topic_tag_cate`
--

CREATE TABLE IF NOT EXISTS `fanwe_topic_tag_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sub_name` varchar(255) NOT NULL COMMENT '附标题',
  `mobile_title_bg` varchar(255) NOT NULL COMMENT '手机分类背景图',
  `sort` int(11) NOT NULL,
  `showin_mobile` tinyint(1) NOT NULL,
  `showin_web` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `fanwe_topic_tag_cate`
--

INSERT INTO `fanwe_topic_tag_cate` (`id`, `name`, `sub_name`, `mobile_title_bg`, `sort`, `showin_mobile`, `showin_web`) VALUES
(1, '休闲娱乐', '', './public/attachment/201202/04/16/4f2cef7b454fc.png', 0, 1, 1),
(2, '乐享美食', '', './public/attachment/201202/04/16/4f2cef6c8a9d1.png', 0, 1, 1),
(3, '旅游酒店', '', './public/attachment/201202/04/16/4f2cef7b454fc.png', 0, 1, 1),
(4, '都市购物', '', './public/attachment/201202/04/16/4f2cef7b454fc.png', 0, 1, 1),
(5, '幸福居家', '', '', 1, 0, 1),
(6, '浪漫婚恋', '', '', 2, 0, 1),
(7, '玩乐帮派', '', '', 3, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_topic_tag_cate_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_topic_tag_cate_link` (
  `cate_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`cate_id`,`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_topic_tag_cate_link`
--

INSERT INTO `fanwe_topic_tag_cate_link` (`cate_id`, `tag_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(4, 10),
(4, 11),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 9),
(5, 10),
(5, 11),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 8),
(6, 9),
(6, 10),
(6, 11),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(7, 5),
(7, 6),
(7, 7),
(7, 8),
(7, 9),
(7, 10),
(7, 11);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_topic_title`
--

CREATE TABLE IF NOT EXISTS `fanwe_topic_title` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '0:主题1:活动',
  `is_recommend` tinyint(1) NOT NULL,
  `count` int(11) NOT NULL,
  `color` varchar(10) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`type`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `fanwe_topic_title`
--

INSERT INTO `fanwe_topic_title` (`id`, `name`, `type`, `is_recommend`, `count`, `color`, `sort`) VALUES
(1, '免费试吃', 1, 1, 0, '', 0),
(2, '试吃分享', 1, 1, 0, '', 0),
(3, '对爱琴海餐厅发表了点评', 0, 0, 3, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_topic_title_cate_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_topic_title_cate_link` (
  `title_id` int(11) NOT NULL,
  `cate_id` int(11) NOT NULL,
  PRIMARY KEY (`title_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_topic_title_cate_link`
--

INSERT INTO `fanwe_topic_title_cate_link` (`title_id`, `cate_id`) VALUES
(1, 2),
(2, 2);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_topic_vote_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_topic_vote_log` (
  `user_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `vote_count` int(11) NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `topic_id` (`topic_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_urls`
--

CREATE TABLE IF NOT EXISTS `fanwe_urls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` text NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user`
--

CREATE TABLE IF NOT EXISTS `fanwe_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `user_pwd` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  `money` double(20,4) NOT NULL,
  `login_time` int(11) NOT NULL,
  `login_ip` varchar(50) NOT NULL,
  `province` varchar(10) NOT NULL,
  `city` varchar(10) NOT NULL,
  `password_verify` varchar(255) NOT NULL COMMENT '??????????????',
  `sex` tinyint(1) NOT NULL COMMENT '???',
  `build_count` int(11) NOT NULL COMMENT '???????????',
  `support_count` int(11) NOT NULL COMMENT '?????????',
  `focus_count` int(11) NOT NULL COMMENT '??????????',
  `integrate_id` int(11) NOT NULL,
  `intro` text NOT NULL COMMENT '???????',
  `ex_real_name` varchar(255) NOT NULL COMMENT '?????????????',
  `ex_bank` varchar(255) NOT NULL,
  `ex_account_name` varchar(255) NOT NULL,
  `ex_account_info` text NOT NULL COMMENT '???????????',
  `ex_contact` text NOT NULL COMMENT '??????',
  `code` varchar(255) NOT NULL,
  `sina_id` varchar(255) NOT NULL,
  `sina_token` varchar(255) NOT NULL,
  `sina_secret` varchar(255) NOT NULL,
  `sina_url` varchar(255) NOT NULL,
  `tencent_id` varchar(255) NOT NULL,
  `tencent_token` varchar(255) NOT NULL,
  `tencent_secret` varchar(255) NOT NULL,
  `tencent_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `is_effect` (`is_effect`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `fanwe_user`
--

INSERT INTO `fanwe_user` (`id`, `user_name`, `user_pwd`, `create_time`, `update_time`, `is_effect`, `email`, `money`, `login_time`, `login_ip`, `province`, `city`, `password_verify`, `sex`, `build_count`, `support_count`, `focus_count`, `integrate_id`, `intro`, `ex_real_name`, `ex_bank`, `ex_account_name`, `ex_account_info`, `ex_contact`, `code`, `sina_id`, `sina_token`, `sina_secret`, `sina_url`, `tencent_id`, `tencent_token`, `tencent_secret`, `tencent_url`) VALUES
(17, 'zhaoyu', '6714ccb93be0fda4e51f206b91b46358', 1352227130, 1352227130, 1, '900930@gmail.com', 1200.0000, 1352232219, '127.0.0.1', '法国', '里昂', '', 1, 2, 1, 1, 0, '兆余', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(18, 'fzmatthew', '6714ccb93be0fda4e51f206b91b46358', 1352229180, 1352229180, 1, 'a@b.com', 980.0000, 1352246617, '127.0.0.1', '北京', '东城区', '', 1, 0, 3, 1, 0, '爱旅行的猫，生活在路上', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(19, 'test', '098f6bcd4621d373cade4e832627b4f6', 1352230142, 1352230142, 1, 'test@test.com', 540.0000, 1427337592, '127.0.0.1', '广东', '江门', '', 0, 2, 11, 0, 0, '', '李**蛋', '*位', '*方', '*w', '23****648', '', '', '', '', '', '', '', '', ''),
(20, 'maomao', 'c2fe59547322a4bb7db612af5dae1281', 1380612008, 1380612008, 1, '10000@qq.com', 0.0000, 1380612008, '127.0.0.1', '', '', '', 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
(21, 'myself', 'a2bab50d3a611bcf6e9c4af2d6a8dc4f', 1402205812, 1402205812, 1, 'isanlik@qq.com', 0.0000, 1402383955, '127.0.0.1', '', '', '', 0, 1, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_active_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_active_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `point` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `money` double(11,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `fanwe_user_active_log`
--

INSERT INTO `fanwe_user_active_log` (`id`, `user_id`, `create_time`, `point`, `score`, `money`) VALUES
(1, 44, 1331938079, 10, 0, 0.0000),
(2, 46, 1331938195, 10, 0, 0.0000),
(3, 46, 1331938209, 10, 0, 0.0000),
(4, 44, 1331938361, 10, 0, 0.0000),
(5, 44, 1331938417, 10, 0, 0.0000),
(6, 44, 1331938485, 10, 0, 0.0000),
(7, 44, 1331938803, 10, 0, 0.0000),
(8, 44, 1331938904, 10, 0, 0.0000),
(9, 44, 1331938957, 10, 0, 0.0000),
(10, 44, 1331939026, 10, 0, 0.0000),
(11, 44, 1331939071, 10, 0, 0.0000),
(12, 44, 1331939121, 10, 0, 0.0000),
(13, 44, 1333241498, 10, 0, 0.0000),
(14, 44, 1333241553, 10, 0, 0.0000),
(15, 44, 1333241576, 10, 0, 0.0000);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_auth`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `m_name` varchar(255) NOT NULL,
  `a_name` varchar(255) NOT NULL,
  `rel_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `fanwe_user_auth`
--

INSERT INTO `fanwe_user_auth` (`id`, `user_id`, `m_name`, `a_name`, `rel_id`) VALUES
(1, 44, 'group', 'del', 1),
(2, 44, 'group', 'replydel', 1),
(3, 44, 'group', 'settop', 1),
(4, 44, 'group', 'setbest', 1),
(5, 44, 'group', 'setmemo', 1),
(6, 44, 'group', 'del', 2),
(7, 44, 'group', 'replydel', 2),
(8, 44, 'group', 'settop', 2),
(9, 44, 'group', 'setbest', 2),
(10, 44, 'group', 'setmemo', 2);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_cate_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_cate_link` (
  `user_id` int(11) NOT NULL,
  `cate_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`cate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_user_cate_link`
--

INSERT INTO `fanwe_user_cate_link` (`user_id`, `cate_id`) VALUES
(44, 1),
(44, 2),
(44, 3),
(44, 4),
(44, 5),
(44, 6),
(44, 7);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_consignee`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_consignee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `province` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `consignee` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `fanwe_user_consignee`
--

INSERT INTO `fanwe_user_consignee` (`id`, `user_id`, `province`, `city`, `address`, `mobile`, `zip`, `consignee`) VALUES
(18, 18, '福建', '福州', '福建福州台江区工业路博美诗邦', '13333333333', '350000', '方维'),
(19, 17, '福建', '福州', '方维方维方维方维方维', '14444444444', '22222', '方维'),
(20, 19, '湖北', '襄樊', 'test', '13344455555', 'test', 'test');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_deal_notify`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_deal_notify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `deal_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `deal_id_user_id` (`user_id`,`deal_id`),
  KEY `user_id` (`user_id`),
  KEY `deal_id` (`deal_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `fanwe_user_deal_notify`
--

INSERT INTO `fanwe_user_deal_notify` (`id`, `user_id`, `deal_id`, `create_time`) VALUES
(20, 18, 55, 1352229388),
(21, 19, 57, 1423402313);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_extend`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_extend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=85 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_field`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(255) NOT NULL,
  `field_show_name` varchar(255) NOT NULL,
  `input_type` tinyint(1) NOT NULL,
  `value_scope` text NOT NULL,
  `is_must` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk_field_name` (`field_name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_focus`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_focus` (
  `focus_user_id` int(11) NOT NULL COMMENT '关注人ID',
  `focused_user_id` int(11) NOT NULL COMMENT '被关注人ID',
  `focus_user_name` varchar(255) NOT NULL,
  `focused_user_name` varchar(255) NOT NULL,
  PRIMARY KEY (`focus_user_id`,`focused_user_id`),
  KEY `focus_user_id` (`focus_user_id`),
  KEY `focused_user_id` (`focused_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_user_focus`
--

INSERT INTO `fanwe_user_focus` (`focus_user_id`, `focused_user_id`, `focus_user_name`, `focused_user_name`) VALUES
(42, 41, 'fz云淡风轻', 'fanwe'),
(45, 44, 'fz云淡风轻', 'fanwe'),
(46, 44, 'fzmatthew', 'fanwe'),
(46, 45, 'fzmatthew', 'fz云淡风轻'),
(47, 44, '方维o2o', 'fanwe'),
(47, 45, '方维o2o', 'fz云淡风轻'),
(47, 46, '方维o2o', 'fzmatthew'),
(45, 46, 'fz云淡风轻', 'fzmatthew');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_frequented`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_frequented` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '员会ID',
  `title` varchar(50) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `xpoint` float(12,6) DEFAULT '0.000000' COMMENT 'longitude',
  `ypoint` float(12,6) DEFAULT '0.000000' COMMENT 'latitude',
  `latitude_top` float(12,6) DEFAULT NULL,
  `latitude_bottom` float(12,6) DEFAULT NULL,
  `longitude_left` float(12,6) DEFAULT NULL,
  `longitude_right` float(12,6) DEFAULT NULL,
  `zoom_level` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_group`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `score` int(11) NOT NULL,
  `discount` double(20,4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `fanwe_user_group`
--

INSERT INTO `fanwe_user_group` (`id`, `name`, `score`, `discount`) VALUES
(1, '普通会员', 0, 1.0000);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_level`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `point` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk` (`point`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `fanwe_user_level`
--

INSERT INTO `fanwe_user_level` (`id`, `name`, `point`) VALUES
(1, '新手上路', 0),
(2, '初入江湖', 100);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `log_info` text NOT NULL,
  `log_time` int(11) NOT NULL,
  `log_admin_id` int(11) NOT NULL,
  `money` double(20,4) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=134 ;

--
-- 转存表中的数据 `fanwe_user_log`
--

INSERT INTO `fanwe_user_log` (`id`, `log_info`, `log_time`, `log_admin_id`, `money`, `user_id`) VALUES
(114, '管理员测试充值', 1352229203, 1, 1000.0000, 18),
(115, '支持原创DIY桌面游戏《功夫》《黄金密码》期待您的支持项目支付', 1352229388, 1, -20.0000, 18),
(116, '管理员测试充值', 1352229989, 1, 2000.0000, 17),
(117, '支持拥有自己的咖啡馆项目支付', 1352230101, 1, -500.0000, 17),
(118, 'test', 1352230213, 1, 5000.0000, 19),
(119, '支持拥有自己的咖啡馆项目支付', 1352230228, 1, -500.0000, 19),
(120, '支持拥有自己的咖啡馆项目支付', 1352230232, 1, -500.0000, 19),
(121, '支持拥有自己的咖啡馆项目支付', 1352230237, 1, -500.0000, 19),
(122, '支持拥有自己的咖啡馆项目支付', 1352230240, 1, -500.0000, 19),
(123, '支持拥有自己的咖啡馆项目支付', 1352230243, 1, -500.0000, 19),
(124, '支持拥有自己的咖啡馆项目支付', 1352230247, 1, -500.0000, 19),
(125, '支持拥有自己的咖啡馆项目支付', 1352230268, 1, -500.0000, 19),
(126, '支持拥有自己的咖啡馆项目支付', 1352230270, 1, -500.0000, 19),
(127, '支持拥有自己的咖啡馆项目支付', 1352230293, 1, -500.0000, 19),
(128, '继续测试', 1352231510, 1, 5000.0000, 18),
(129, '支持流浪猫的家—爱天使公益咖啡馆的重建需要大家的力量！项目支付', 1352231539, 1, -2000.0000, 18),
(130, '支持流浪猫的家—爱天使公益咖啡馆的重建需要大家的力量！项目支付', 1352231631, 1, -500.0000, 19),
(131, '支持拥有自己的咖啡馆项目支付', 1352231671, 1, -300.0000, 17),
(132, '支持流浪猫的家—爱天使公益咖啡馆的重建需要大家的力量！项目支付', 1352231704, 1, -3000.0000, 18),
(133, '支持短片电影《Blind Love》项目支付', 1423402313, 1, -60.0000, 19);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_medal`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_medal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `medal_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `create_time` int(11) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `icon` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `fanwe_user_medal`
--

INSERT INTO `fanwe_user_medal` (`id`, `user_id`, `medal_id`, `name`, `create_time`, `is_delete`, `icon`) VALUES
(1, 44, 1, '组长勋章', 1331939602, 0, './public/attachment/201203/17/15/4f6438e27aa65.png');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_message`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) NOT NULL,
  `message` text NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '???????????ID',
  `dest_user_id` int(11) NOT NULL COMMENT '????????ID??????user_id??????????ID????????????????ID??',
  `send_user_id` int(11) NOT NULL COMMENT '??????ID',
  `receive_user_id` int(11) NOT NULL COMMENT '?????ID',
  `user_name` varchar(255) NOT NULL,
  `dest_user_name` varchar(255) NOT NULL,
  `send_user_name` varchar(255) NOT NULL,
  `receive_user_name` varchar(255) NOT NULL,
  `message_type` enum('inbox','outbox') NOT NULL COMMENT '?????inbox(???) outbox(????)',
  `is_read` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=53 ;

--
-- 转存表中的数据 `fanwe_user_message`
--

INSERT INTO `fanwe_user_message` (`id`, `create_time`, `message`, `user_id`, `dest_user_id`, `send_user_id`, `receive_user_id`, `user_name`, `dest_user_name`, `send_user_name`, `receive_user_name`, `message_type`, `is_read`) VALUES
(47, 1352230383, '感谢支持', 18, 19, 18, 19, 'fzmatthew', 'test', 'fzmatthew', 'test', 'outbox', 1),
(48, 1352230383, '感谢支持', 19, 18, 18, 19, 'test', 'fzmatthew', 'fzmatthew', 'test', 'inbox', 0),
(49, 1352230403, '感谢您的支持!!!', 18, 17, 18, 17, 'fzmatthew', 'fanwe', 'fzmatthew', 'fanwe', 'outbox', 1),
(50, 1352230403, '感谢您的支持!!!', 17, 18, 18, 17, 'fanwe', 'fzmatthew', 'fzmatthew', 'fanwe', 'inbox', 0),
(51, 1352230499, '谢谢!!!', 17, 18, 17, 18, 'fanwe', 'fzmatthew', 'fanwe', 'fzmatthew', 'outbox', 1),
(52, 1352230499, '谢谢!!!', 18, 17, 17, 18, 'fzmatthew', 'fanwe', 'fanwe', 'fzmatthew', 'inbox', 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_notify`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_notify` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `log_info` text NOT NULL,
  `log_time` int(11) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `url_route` varchar(255) NOT NULL,
  `url_param` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=73 ;

--
-- 转存表中的数据 `fanwe_user_notify`
--

INSERT INTO `fanwe_user_notify` (`id`, `user_id`, `log_info`, `log_time`, `is_read`, `url_route`, `url_param`) VALUES
(69, 17, '拥有自己的咖啡馆 在 2012-11-07 11:31:10 成功筹到 ?5,000.00', 1352230271, 0, 'deal#show', 'id=56'),
(70, 19, '拥有自己的咖啡馆 在 2012-11-07 11:31:10 成功筹到 ?5,000.00', 1352230271, 0, 'deal#show', 'id=56'),
(71, 17, '您支持的项目拥有自己的咖啡馆回报已发放', 1352230424, 0, 'account#view_order', 'id=66'),
(72, 18, '流浪猫的家—爱天使公益咖啡馆的重建需要大家的力量！ 在 2012-11-07 11:55:04 成功筹到 ?3,000.00', 1352231704, 0, 'deal#show', 'id=58');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_refund`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_refund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` double(20,4) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL COMMENT '???????????',
  `reply` text NOT NULL COMMENT '??????????',
  `is_pay` tinyint(1) NOT NULL,
  `pay_time` int(11) NOT NULL,
  `memo` text NOT NULL COMMENT '???????',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_sign_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_sign_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `sign_date` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_topic_group`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_topic_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '0:普通组员 1:管理员',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unk` (`group_id`,`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `fanwe_user_topic_group`
--

INSERT INTO `fanwe_user_topic_group` (`id`, `group_id`, `user_id`, `create_time`, `type`) VALUES
(1, 2, 46, 1331938112, 0),
(2, 1, 46, 1331938120, 0);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_weibo`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_weibo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `weibo_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=56 ;

--
-- 转存表中的数据 `fanwe_user_weibo`
--

INSERT INTO `fanwe_user_weibo` (`id`, `user_id`, `weibo_url`) VALUES
(55, 17, 'http://weibo.com/bmwcmw');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_user_x_y_point`
--

CREATE TABLE IF NOT EXISTS `fanwe_user_x_y_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `xpoint` float(14,6) NOT NULL DEFAULT '0.000000',
  `ypoint` float(14,6) NOT NULL DEFAULT '0.000000',
  `locate_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `fanwe_user_x_y_point`
--

INSERT INTO `fanwe_user_x_y_point` (`id`, `uid`, `xpoint`, `ypoint`, `locate_time`) VALUES
(1, 44, 119.306938, 26.069746, 1330712776);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_vote`
--

CREATE TABLE IF NOT EXISTS `fanwe_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `begin_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `fanwe_vote`
--

INSERT INTO `fanwe_vote` (`id`, `name`, `begin_time`, `end_time`, `is_effect`, `sort`, `description`) VALUES
(4, '您从哪知道我们的系统', 0, 0, 1, 1, '您从哪知道我们的系统');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_vote_ask`
--

CREATE TABLE IF NOT EXISTS `fanwe_vote_ask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `sort` int(11) NOT NULL,
  `vote_id` int(11) NOT NULL,
  `val_scope` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `fanwe_vote_ask`
--

INSERT INTO `fanwe_vote_ask` (`id`, `name`, `type`, `sort`, `vote_id`, `val_scope`) VALUES
(13, '报纸', 1, 0, 4, '报纸1,报纸2,报纸3'),
(12, '网站', 1, 0, 4, '网站1,网站2,网站3');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_vote_result`
--

CREATE TABLE IF NOT EXISTS `fanwe_vote_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `vote_id` int(11) NOT NULL,
  `vote_ask_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_weight_unit`
--

CREATE TABLE IF NOT EXISTS `fanwe_weight_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `rate` decimal(20,4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `fanwe_weight_unit`
--

INSERT INTO `fanwe_weight_unit` (`id`, `name`, `rate`) VALUES
(1, '克', '1.0000');

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_youhui`
--

CREATE TABLE IF NOT EXISTS `fanwe_youhui` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `deal_cate_id` int(11) NOT NULL,
  `begin_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `send_type` tinyint(1) NOT NULL COMMENT '0:普通券 1:验证券 2:需预订验证券',
  `total_num` int(11) NOT NULL COMMENT '总条数',
  `sms_count` int(11) NOT NULL,
  `print_count` int(11) NOT NULL,
  `view_count` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `is_effect` tinyint(1) NOT NULL,
  `sms_content` varchar(255) NOT NULL,
  `is_sms` tinyint(1) NOT NULL,
  `is_print` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否打印:1不允许;0:允许',
  `brief` text NOT NULL COMMENT '简介',
  `youhui_type` tinyint(1) NOT NULL COMMENT '减免0/折扣1',
  `total_fee` int(11) NOT NULL,
  `deal_cate_match_row` text NOT NULL,
  `deal_cate_match` text NOT NULL,
  `locate_match_row` text NOT NULL,
  `locate_match` text NOT NULL,
  `name_match_row` text NOT NULL,
  `name_match` text NOT NULL,
  `xpoint` varchar(255) NOT NULL,
  `ypoint` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户发布的',
  `supplier_id` int(11) NOT NULL COMMENT '商户',
  `create_time` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `pub_by` tinyint(1) NOT NULL COMMENT '0:管理员 1:会员 2:商家',
  `is_recommend` tinyint(1) NOT NULL,
  `list_brief` text NOT NULL,
  `description` text NOT NULL,
  `index_img` varchar(255) NOT NULL,
  `image_3` varchar(255) NOT NULL,
  `image_3_w` int(11) NOT NULL,
  `image_3_h` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `publish_wait` tinyint(1) NOT NULL,
  `return_money` decimal(11,4) NOT NULL,
  `return_score` int(11) NOT NULL,
  `return_point` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `city_id` (`city_id`),
  KEY `cate_id` (`deal_cate_id`) USING BTREE,
  FULLTEXT KEY `f_t` (`deal_cate_match`,`name_match`,`locate_match`),
  FULLTEXT KEY `cate_match` (`deal_cate_match`),
  FULLTEXT KEY `name_match` (`name_match`),
  FULLTEXT KEY `locate_match` (`locate_match`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_youhui_location_link`
--

CREATE TABLE IF NOT EXISTS `fanwe_youhui_location_link` (
  `youhui_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  PRIMARY KEY (`youhui_id`,`location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `fanwe_youhui_location_link`
--

INSERT INTO `fanwe_youhui_location_link` (`youhui_id`, `location_id`) VALUES
(12, 19),
(13, 20),
(14, 18),
(15, 14),
(16, 18),
(17, 18),
(18, 18);

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_youhui_log`
--

CREATE TABLE IF NOT EXISTS `fanwe_youhui_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `youhui_id` int(11) NOT NULL,
  `youhui_sn` varchar(255) NOT NULL COMMENT '短信生成的优惠券序列号',
  `user_id` int(11) NOT NULL,
  `order_count` int(5) NOT NULL COMMENT '订餐人数',
  `is_private_room` tinyint(1) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `date_time` int(11) NOT NULL COMMENT '预订时间',
  `confirm_id` int(11) NOT NULL,
  `total_fee` int(11) NOT NULL COMMENT '消费金额',
  `create_time` int(11) NOT NULL,
  `confirm_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`youhui_sn`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

-- --------------------------------------------------------

--
-- 表的结构 `fanwe_youhui_sc`
--

CREATE TABLE IF NOT EXISTS `fanwe_youhui_sc` (
  `uid` int(11) NOT NULL,
  `youhui_id` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`youhui_id`),
  UNIQUE KEY `inx_youhui_sc` (`uid`,`youhui_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hi_admin`
--

CREATE TABLE IF NOT EXISTS `hi_admin` (
  `admin_id` int(10) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(50) NOT NULL,
  `admin_pass` varchar(50) NOT NULL,
  `admin_key` varchar(50) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `hi_admin`
--

INSERT INTO `hi_admin` (`admin_id`, `admin_name`, `admin_pass`, `admin_key`) VALUES
(1, 'admin', '737249951b286c1329f303e3c61a0ab4', '2013');

-- --------------------------------------------------------

--
-- 表的结构 `hi_all`
--

CREATE TABLE IF NOT EXISTS `hi_all` (
  `a_id` int(10) NOT NULL AUTO_INCREMENT,
  `a_title` varchar(255) NOT NULL,
  `a_key` varchar(255) NOT NULL,
  `a_disc` varchar(255) NOT NULL,
  `a_bottom` varchar(255) NOT NULL,
  `a_alipay` varchar(50) NOT NULL,
  `a_paykey` varchar(50) NOT NULL,
  `a_pid` varchar(50) NOT NULL,
  `a_alipayclass` varchar(1) NOT NULL,
  `a_tel` varchar(20) CHARACTER SET greek NOT NULL,
  `a_qq` varchar(20) NOT NULL,
  `a_www` varchar(20) NOT NULL,
  `s_jf` int(10) NOT NULL,
  `mysite` varchar(200) NOT NULL,
  `yjbl` varchar(10) NOT NULL,
  `fx` varchar(1) CHARACTER SET gb2312 NOT NULL,
  `user_top` text NOT NULL,
  `p_gs` int(3) NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `hi_all`
--

INSERT INTO `hi_all` (`a_id`, `a_title`, `a_key`, `a_disc`, `a_bottom`, `a_alipay`, `a_paykey`, `a_pid`, `a_alipayclass`, `a_tel`, `a_qq`, `a_www`, `s_jf`, `mysite`, `yjbl`, `fx`, `user_top`, `p_gs`) VALUES
(1, '破解版（自动财富机）系统!', '破解版（自动财富机）系统!', '破解版（自动财富机）系统!', 'Copyright &#169; 2012-2013 【破解版（自动财富机）系统!】平台 版权所有 <script language="javascript" type="text/javascript" src="http://js.users.51.la/15836921.js"></script>', 'xxxxxxx@qq.com', 'dkhdihnj5kjkljn5hklnhw2kjlklklnl4', '5462132323232313', '2', '', '123456', 'mall', 1, '127.0.0.1', '0.0', '0', '<p class="hip">\r\n        	1、将您的专属推广连接，发布至QQ群、博客、论坛、社区...只要有人通过您的连接来到本站注册成功，您都将获得 <span style="color:#ff0000; font-size:14px">1积份/人</span>。\r\n        </p>\r\n        <p class="hip">\r\n2、您所推广的人数满10人，您将免费升级为正式推广者，开始获得成交50%收入提成！\r\n        </p>\r\n        <p class="hip">\r\n3、有了积分您可以兑换本站相关精品干货资源，让您实现从月入1000至月入50000的飞跃！而且推广的会员如果在本站进行现金消费，你可以自动获得50%收入提成，随时可提现！\r\n</p>\r\n', 0);

-- --------------------------------------------------------

--
-- 表的结构 `hi_cz`
--

CREATE TABLE IF NOT EXISTS `hi_cz` (
  `u_id` int(10) NOT NULL,
  `price` varchar(10) NOT NULL,
  `orderid` varchar(30) NOT NULL,
  `addtime` varchar(20) NOT NULL,
  `zt` int(1) NOT NULL,
  `c_id` int(10) NOT NULL AUTO_INCREMENT,
  `c_type` int(1) NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=132 ;

--
-- 转存表中的数据 `hi_cz`
--

INSERT INTO `hi_cz` (`u_id`, `price`, `orderid`, `addtime`, `zt`, `c_id`, `c_type`) VALUES
(8, '1', '13687772626064', '1368777262', 0, 9, 1),
(8, '1', '13687777448762', '1368777744', 0, 10, 1),
(8, '10', '13687777564289', '1368777756', 0, 11, 1),
(8, '10', '13687790682411', '1368779068', 0, 12, 1),
(8, '10', '13687791426730', '1368779142', 0, 13, 1),
(8, '10', '13687812463578', '1368781246', 0, 14, 1),
(8, '10', '13687833027449', '1368783302', 0, 15, 1),
(8, '10', '13687895931018', '1368789593', 0, 16, 1),
(8, '10', '13687898156878', '1368789815', 0, 17, 1),
(8, '10', '13687902293845', '1368790229', 0, 18, 1),
(8, '10', '13687902704712', '1368790270', 0, 19, 1),
(8, '10', '13687905441327', '1368790544', 0, 20, 1),
(8, '10', '13687905517451', '1368790551', 0, 21, 1),
(8, '10', '13687906202082', '1368790620', 0, 22, 1),
(8, '10', '13687909066811', '1368790906', 0, 23, 1),
(8, '10', '13687910296184', '1368791029', 0, 24, 1),
(8, '10', '13687910835734', '1368791083', 0, 25, 1),
(8, '10', '13687912419586', '1368791241', 0, 26, 1),
(8, '10', '13687922653349', '1368792265', 0, 27, 1),
(8, '10', '13687934649085', '1368793464', 0, 28, 1),
(8, '10', '13687936396850', '1368793639', 0, 29, 1),
(8, '1', '13687936675214', '1368793667', 0, 30, 1),
(8, '1', '13687937769279', '1368793776', 1, 31, 1),
(8, '10', '13687986305455', '1368798630', 0, 32, 1),
(8, '10', '13687994586292', '1368799458', 0, 33, 1),
(8, '10', '13687994705050', '1368799470', 0, 34, 1),
(8, '1', '13688003703446', '1368800370', 0, 35, 1),
(8, '10', '13688012274686', '1368801227', 0, 36, 1),
(8, '1', '13688013159168', '1368801315', 1, 37, 1),
(8, '1', '13688031914981', '1368803191', 1, 38, 1),
(8, '10', '13688034827374', '1368803482', 0, 39, 1),
(8, '10', '13688035513896', '1368803551', 0, 40, 1),
(8, '1', '13688051075381', '1368805107', 1, 41, 1),
(12, '10', '13688716872404', '1368871687', 0, 42, 1),
(9, '1', '13688722307920', '1368872230', 0, 43, 1),
(9, '1', '13688725212843', '1368872521', 0, 44, 1),
(9, '1', '13688727032238', '1368872703', 1, 45, 1),
(10, '1', '13688738663455', '1368873866', 0, 46, 1),
(10, '10', '13688739968457', '1368873996', 0, 47, 1),
(11, '10', '13689674044828', '1368967404', 0, 48, 1),
(54, '10', '13690270528740', '1369027052', 0, 49, 1),
(158, '10', '13697261049227', '1369726104', 0, 50, 1),
(168, '100', '13697414079670', '1369741407', 0, 51, 1),
(178, '10', '13698202741197', '1369820274', 0, 52, 1),
(158, '10', '13698414751853', '1369841475', 0, 53, 1),
(217, '10', '13699345663466', '1369934566', 0, 54, 1),
(10, '10', '13699352148775', '1369935214', 0, 55, 1),
(198, '1', '13699756915682', '1369975691', 1, 56, 1),
(158, '10', '13700923566051', '1370092356', 0, 57, 1),
(224, '10', '13701350074841', '1370135007', 0, 58, 1),
(321, '10', '13701632672665', '1370163267', 0, 59, 1),
(31, '10', '13703340318044', '1370334031', 0, 60, 1),
(360, '10', '13703534564561', '1370353456', 0, 61, 1),
(360, '10', '13703537223484', '1370353722', 0, 62, 1),
(365, '10', '13703587597663', '1370358759', 0, 63, 1),
(365, '10', '13703587702132', '1370358770', 0, 64, 1),
(471, '10', '13706734888826', '1370673488', 0, 65, 1),
(469, '10', '13706788191400', '1370678819', 0, 66, 1),
(507, '10', '13706788436100', '1370678843', 0, 67, 1),
(528, '1000', '13706815056623', '1370681505', 0, 68, 1),
(544, '10', '13706851236338', '1370685123', 0, 69, 1),
(569, '10', '13706919882875', '1370691988', 0, 70, 1),
(609, '10', '13706946441256', '1370694644', 0, 71, 1),
(278, '10', '13706950964141', '1370695096', 0, 72, 1),
(632, '10', '13706975512003', '1370697551', 0, 73, 1),
(700, '10', '13706991878621', '1370699187', 0, 74, 1),
(718, '1000', '13707001308900', '1370700130', 0, 75, 1),
(718, '10', '13707003378081', '1370700337', 0, 76, 1),
(797, '10', '13707007732433', '1370700773', 0, 77, 1),
(797, '20', '13707008195609', '1370700819', 0, 78, 1),
(844, '10', '13707022289615', '1370702228', 0, 79, 1),
(803, '10', '13707038356343', '1370703835', 0, 80, 1),
(991, '10', '13707347253743', '1370734725', 0, 81, 1),
(997, '10', '13707363177750', '1370736317', 0, 82, 1),
(1007, '10', '13707380132795', '1370738013', 0, 83, 1),
(731, '10', '13707411349967', '1370741134', 0, 84, 1),
(1072, '10', '13707462779691', '1370746277', 0, 85, 1),
(1110, '10', '13707507953249', '1370750795', 0, 86, 1),
(12, '10', '13707524385427', '1370752438', 0, 87, 1),
(1209, '10', '13707592182697', '1370759218', 0, 88, 1),
(1209, '10', '13707593683010', '1370759368', 0, 89, 1),
(1209, '10', '13707593738843', '1370759373', 0, 90, 1),
(1280, '10', '13707685806859', '1370768580', 0, 91, 1),
(1312, '10', '13707742775893', '1370774277', 0, 92, 1),
(1360, '10', '13707858437774', '1370785843', 0, 93, 1),
(1414, '10', '13707881336275', '1370788133', 0, 94, 1),
(1501, '10', '13708307734716', '1370830773', 0, 95, 1),
(541, '10', '13708359192519', '1370835919', 0, 96, 1),
(1719, '10', '13709165735172', '1370916573', 0, 97, 1),
(1726, '10', '13709223441183', '1370922344', 0, 98, 1),
(1726, '10', '13709223775869', '1370922377', 0, 99, 1),
(1009, '10', '13709253472205', '1370925347', 0, 100, 1),
(541, '10', '13709288367796', '1370928836', 0, 101, 1),
(541, '10', '13709289953465', '1370928995', 0, 102, 1),
(1774, '10', '13709413081157', '1370941308', 0, 103, 1),
(1774, '10', '13709413136284', '1370941313', 0, 104, 1),
(1829, '10', '13709914437122', '1370991443', 0, 105, 1),
(1927, '100', '13710316439068', '1371031643', 0, 106, 1),
(1940, '10', '13710379485011', '1371037948', 0, 107, 1),
(1664, '10', '13710399718881', '1371039971', 0, 108, 1),
(1947, '10', '13710425779284', '1371042577', 0, 109, 1),
(2023, '1', '13711260811450', '1371126081', 1, 110, 1),
(2028, '10', '13711304144892', '1371130414', 0, 111, 1),
(660, '10', '13711321019985', '1371132101', 0, 112, 1),
(2031, '10', '13711353321687', '1371135332', 0, 113, 1),
(483, '10', '13711390504382', '1371139050', 0, 114, 1),
(527, '10', '13711953235522', '1371195323', 0, 115, 1),
(1714, '10', '13712029188390', '1371202918', 0, 116, 1),
(2077, '10', '13712178536194', '1371217853', 0, 117, 1),
(1791, '10', '13713057964298', '1371305796', 0, 118, 1),
(2139, '10', '13713071476539', '1371307147', 0, 119, 1),
(2369, '10', '13713105667303', '1371310566', 0, 120, 1),
(2402, '10', '13713788057126', '1371378805', 0, 121, 1),
(2945, '10', '13715362608127', '1371536260', 0, 122, 1),
(54, '10', '13715607963549', '1371560796', 0, 123, 1),
(2823, '10', '13715788488199', '1371578848', 0, 124, 1),
(88, '987979', '13716604872422', '1371660487', 0, 125, 1),
(88, '102', '13717075389656', '1371707538', 0, 126, 1),
(48, '10', '13718162237739', '1371816223', 0, 127, 1),
(48, '10', '13718817521800', '1371881752', 0, 128, 1),
(48, '10', '13718818417123', '1371881841', 0, 129, 1),
(88, '10', '13720994818642', '1372099481', 0, 130, 1),
(88, '10767576', '13721003307237', '1372100330', 0, 131, 1);

-- --------------------------------------------------------

--
-- 表的结构 `hi_list`
--

CREATE TABLE IF NOT EXISTS `hi_list` (
  `xitong` varchar(10) NOT NULL,
  `content` varchar(255) NOT NULL,
  `lid` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`lid`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `hi_list`
--

INSERT INTO `hi_list` (`xitong`, `content`, `lid`) VALUES
('2', '203cb617360701b110dbfc9da891659cb356832a232e99bd', 1);

-- --------------------------------------------------------

--
-- 表的结构 `hi_o`
--

CREATE TABLE IF NOT EXISTS `hi_o` (
  `o_id` int(10) NOT NULL AUTO_INCREMENT,
  `p_id` varchar(10) NOT NULL,
  `u_id` varchar(10) NOT NULL,
  `orderid` varchar(30) NOT NULL,
  `addtime` varchar(15) NOT NULL,
  `zt` int(1) NOT NULL,
  `ptype` int(1) NOT NULL,
  PRIMARY KEY (`o_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=1483 ;

--
-- 转存表中的数据 `hi_o`
--

INSERT INTO `hi_o` (`o_id`, `p_id`, `u_id`, `orderid`, `addtime`, `zt`, `ptype`) VALUES
(1, '1', '8', '13688053102707', '1368805310', 0, 1),
(2, '1', '8', '13688053203253', '1368805320', 0, 1),
(3, '1', '9', '13688769037635', '1368876903', 0, 1),
(4, '1', '198', '13699757733908', '1369975773', 0, 1),
(5, '1', '10', '13700847439620', '1370084743', 0, 1),
(6, '1', '10', '13700847749729', '1370084774', 0, 1),
(7, '1', '10', '13700858422909', '1370085842', 0, 1),
(8, '1', '31', '13700908058792', '1370090805', 0, 1),
(9, '1', '224', '13700910829471', '1370091082', 0, 1),
(10, '1', '270', '13700915912367', '1370091591', 0, 1),
(11, '1', '269', '13700916841096', '1370091684', 0, 1),
(12, '1', '26', '13700918439486', '1370091843', 0, 1),
(13, '1', '176', '13700919524529', '1370091952', 0, 0),
(14, '1', '155', '13700919978400', '1370091997', 0, 0),
(15, '1', '176', '13700921576625', '1370092157', 0, 0),
(16, '1', '176', '13700921684058', '1370092168', 0, 0),
(17, '1', '158', '13700922464518', '1370092246', 0, 1),
(18, '1', '227', '13700922763765', '1370092276', 0, 1),
(19, '1', '272', '13700922884777', '1370092288', 0, 1),
(20, '1', '22', '13700925777005', '1370092577', 0, 1),
(21, '1', '276', '13700927736116', '1370092773', 0, 1),
(22, '1', '22', '13700928338892', '1370092833', 0, 1),
(23, '1', '164', '13700928438733', '1370092843', 0, 1),
(24, '1', '278', '13700931296195', '1370093129', 0, 0),
(25, '1', '280', '13700934984639', '1370093498', 0, 1),
(26, '1', '285', '13700940918408', '1370094091', 0, 1),
(27, '1', '287', '13700949429976', '1370094942', 0, 1),
(28, '1', '289', '13700961378008', '1370096137', 0, 1),
(29, '1', '289', '13700961625159', '1370096162', 0, 0),
(30, '1', '290', '13700967535628', '1370096753', 0, 1),
(31, '1', '291', '13700967957353', '1370096795', 0, 1),
(32, '1', '290', '13700982146589', '1370098214', 0, 1),
(33, '3', '26', '13700989919188', '1370098991', 0, 1),
(34, '1', '295', '13701005653140', '1370100565', 0, 0),
(35, '3', '295', '13701006487944', '1370100648', 0, 0),
(36, '1', '282', '13701007623759', '1370100762', 0, 1),
(37, '3', '282', '13701008428205', '1370100842', 0, 1),
(38, '3', '10', '13701010227108', '1370101022', 0, 1),
(39, '1', '10', '13701010328596', '1370101032', 0, 1),
(40, '3', '282', '13701018204356', '1370101820', 0, 1),
(41, '3', '32', '13701018767958', '1370101876', 0, 1),
(42, '1', '19', '13701034997624', '1370103499', 0, 1),
(43, '1', '263', '13701039628390', '1370103962', 0, 1),
(44, '3', '263', '13701040379517', '1370104037', 0, 1),
(45, '1', '299', '13701054021771', '1370105402', 0, 1),
(46, '3', '10', '13701097825252', '1370109782', 0, 1),
(47, '3', '304', '13701263378494', '1370126338', 0, 1),
(48, '1', '304', '13701265049650', '1370126504', 0, 1),
(49, '3', '304', '13701400088597', '1370140008', 0, 1),
(50, '1', '186', '13701406419968', '1370140641', 0, 1),
(51, '1', '308', '13701430385913', '1370143038', 0, 1),
(52, '3', '22', '13701436864417', '1370143686', 0, 1),
(53, '3', '308', '13701447359244', '1370144735', 0, 1),
(54, '1', '315', '13701555222071', '1370155522', 0, 0),
(55, '3', '315', '13701555835030', '1370155583', 0, 0),
(56, '1', '315', '13701561862224', '1370156186', 0, 0),
(57, '1', '315', '13701562245691', '1370156224', 0, 0),
(58, '3', '315', '13701562317564', '1370156232', 0, 0),
(59, '3', '287', '13701574457930', '1370157445', 0, 1),
(60, '3', '158', '13701601497753', '1370160149', 0, 1),
(61, '3', '223', '13701609023852', '1370160902', 0, 0),
(62, '1', '124', '13701623575312', '1370162357', 0, 0),
(63, '3', '124', '13701624352493', '1370162435', 0, 1),
(64, '1', '321', '13701628781529', '1370162878', 0, 1),
(65, '3', '321', '13701630164615', '1370163016', 0, 1),
(66, '3', '322', '13701632233499', '1370163223', 0, 1),
(67, '3', '322', '13701632457774', '1370163245', 0, 1),
(68, '1', '323', '13701636962668', '1370163696', 0, 1),
(69, '3', '324', '13701642122354', '1370164212', 0, 1),
(70, '1', '300', '13701644838196', '1370164483', 0, 1),
(71, '3', '300', '13701650298943', '1370165029', 0, 1),
(72, '3', '324', '13701703778737', '1370170377', 0, 1),
(73, '3', '324', '13701704159927', '1370170415', 0, 1),
(74, '3', '328', '13701744577315', '1370174457', 0, 1),
(75, '1', '328', '13701744858495', '1370174485', 0, 1),
(76, '1', '198', '13701755904609', '1370175590', 0, 0),
(77, '1', '269', '13701776096612', '1370177609', 0, 1),
(78, '3', '269', '13701776649985', '1370177664', 0, 1),
(79, '1', '336', '13702206227057', '1370220622', 0, 1),
(80, '3', '336', '13702207165470', '1370220716', 0, 1),
(81, '1', '336', '13702208864224', '1370220886', 0, 1),
(82, '1', '338', '13702280681437', '1370228068', 0, 1),
(83, '3', '338', '13702281189373', '1370228118', 0, 1),
(84, '3', '337', '13702281385422', '1370228138', 0, 1),
(85, '3', '155', '13702337257152', '1370233725', 0, 0),
(86, '1', '341', '13702409378243', '1370240937', 0, 1),
(87, '3', '341', '13702410152072', '1370241015', 0, 1),
(88, '3', '31', '13702500925510', '1370250092', 0, 1),
(89, '1', '31', '13702501395340', '1370250139', 0, 1),
(90, '3', '52', '13702510044690', '1370251004', 0, 1),
(91, '1', '52', '13702510182434', '1370251018', 0, 1),
(92, '1', '52', '13702553547337', '1370255354', 0, 1),
(93, '1', '344', '13702704911530', '1370270491', 0, 1),
(94, '1', '81', '13702706608642', '1370270660', 0, 1),
(95, '1', '345', '13702736759014', '1370273675', 0, 0),
(96, '1', '345', '13702748779366', '1370274877', 0, 0),
(97, '1', '347', '13702805461171', '1370280546', 0, 1),
(98, '3', '347', '13702816587321', '1370281658', 0, 1),
(99, '1', '337', '13702831344522', '1370283134', 0, 1),
(100, '3', '337', '13702832653356', '1370283265', 0, 1),
(101, '1', '344', '13703102481453', '1370310248', 0, 1),
(102, '3', '350', '13703134559489', '1370313455', 0, 1),
(103, '1', '350', '13703135217752', '1370313521', 0, 1),
(104, '3', '256', '13703146257768', '1370314625', 0, 0),
(105, '1', '352', '13703217346769', '1370321734', 0, 1),
(106, '3', '353', '13703248851336', '1370324885', 0, 1),
(107, '1', '353', '13703264344628', '1370326434', 0, 1),
(108, '1', '357', '13703429872462', '1370342987', 0, 1),
(109, '3', '357', '13703431122219', '1370343112', 0, 1),
(110, '3', '359', '13703499457939', '1370349945', 0, 1),
(111, '1', '359', '13703500128077', '1370350012', 0, 1),
(112, '3', '285', '13703505176866', '1370350517', 0, 1),
(113, '1', '52', '13703519985201', '1370351998', 0, 1),
(114, '1', '360', '13703530608832', '1370353060', 0, 1),
(115, '1', '361', '13703539568949', '1370353956', 0, 1),
(116, '3', '361', '13703547792630', '1370354779', 0, 1),
(117, '1', '363', '13703565467836', '1370356546', 0, 1),
(118, '1', '345', '13703565856835', '1370356585', 0, 0),
(119, '3', '345', '13703566463502', '1370356646', 0, 0),
(120, '1', '364', '13703578707110', '1370357870', 0, 1),
(121, '3', '364', '13703580814334', '1370358081', 0, 1),
(122, '1', '369', '13703617824394', '1370361782', 0, 1),
(123, '1', '365', '13703643849603', '1370364384', 0, 0),
(124, '3', '365', '13703644663292', '1370364466', 0, 0),
(125, '3', '171', '13704060843969', '1370406084', 0, 1),
(126, '3', '171', '13704074716723', '1370407471', 0, 0),
(127, '1', '347', '13704411006658', '1370441100', 0, 1),
(128, '1', '164', '13704438548877', '1370443854', 0, 0),
(129, '1', '383', '13704503496880', '1370450349', 0, 1),
(130, '3', '383', '13704503979932', '1370450397', 0, 1),
(131, '1', '364', '13704986805342', '1370498680', 0, 1),
(132, '1', '364', '13704988728189', '1370498872', 0, 1),
(133, '3', '387', '13705093289411', '1370509328', 0, 0),
(134, '1', '387', '13705103237998', '1370510323', 0, 0),
(135, '1', '388', '13705248549678', '1370524854', 0, 1),
(136, '3', '388', '13705252117410', '1370525211', 0, 1),
(137, '6', '10', '13705302995419', '1370530299', 0, 1),
(138, '4', '52', '13705424143691', '1370542414', 0, 0),
(139, '6', '10', '13705425965444', '1370542596', 0, 1),
(140, '7', '10', '13705434569123', '1370543456', 0, 0),
(141, '6', '10', '13705442676145', '1370544267', 0, 1),
(142, '6', '383', '13706159669907', '1370615966', 0, 1),
(143, '6', '383', '13706159889597', '1370615988', 0, 1),
(144, '6', '26', '13706191843552', '1370619184', 0, 0),
(145, '1', '81', '13706624064147', '1370662406', 0, 1),
(146, '3', '458', '13706711798118', '1370671179', 0, 1),
(147, '3', '460', '13706713837834', '1370671383', 0, 1),
(148, '1', '460', '13706715009080', '1370671500', 0, 1),
(149, '3', '472', '13706735983900', '1370673599', 0, 1),
(150, '1', '474', '13706738971672', '1370673897', 0, 1),
(151, '3', '477', '13706740808942', '1370674080', 0, 1),
(152, '6', '477', '13706741467217', '1370674146', 0, 1),
(153, '6', '477', '13706741613916', '1370674161', 0, 1),
(154, '6', '478', '13706742063391', '1370674206', 0, 1),
(155, '3', '482', '13706746464540', '1370674646', 0, 1),
(156, '3', '480', '13706746911881', '1370674691', 0, 1),
(157, '1', '485', '13706750027848', '1370675002', 0, 1),
(158, '6', '485', '13706750997293', '1370675099', 0, 1),
(159, '6', '485', '13706751135533', '1370675113', 0, 1),
(160, '3', '485', '13706751272838', '1370675127', 0, 1),
(161, '1', '487', '13706751685286', '1370675168', 0, 1),
(162, '1', '491', '13706758521122', '1370675852', 0, 1),
(163, '1', '495', '13706765808200', '1370676580', 0, 1),
(164, '3', '496', '13706766386774', '1370676638', 0, 0),
(165, '3', '497', '13706766732787', '1370676673', 0, 1),
(166, '1', '496', '13706768593500', '1370676859', 0, 1),
(167, '6', '496', '13706768931562', '1370676893', 0, 1),
(168, '6', '496', '13706769038537', '1370676903', 0, 0),
(169, '3', '491', '13706770049860', '1370677004', 0, 1),
(170, '6', '491', '13706771537634', '1370677153', 0, 1),
(171, '3', '511', '13706783507643', '1370678350', 0, 1),
(172, '3', '513', '13706784416615', '1370678441', 0, 1),
(173, '1', '478', '13706785119703', '1370678511', 0, 1),
(174, '1', '513', '13706787098179', '1370678709', 0, 1),
(175, '6', '469', '13706787134525', '1370678713', 0, 1),
(176, '1', '469', '13706787328961', '1370678732', 0, 1),
(177, '3', '469', '13706787977774', '1370678797', 0, 1),
(178, '1', '518', '13706792328692', '1370679232', 0, 0),
(179, '6', '518', '13706795111744', '1370679511', 0, 0),
(180, '1', '521', '13706795709261', '1370679570', 0, 0),
(181, '3', '521', '13706797388178', '1370679738', 0, 0),
(182, '3', '518', '13706798033954', '1370679803', 0, 0),
(183, '3', '509', '13706801643543', '1370680164', 0, 1),
(184, '1', '479', '13706802271432', '1370680227', 0, 1),
(185, '1', '527', '13706810889926', '1370681088', 0, 1),
(186, '3', '530', '13706818118069', '1370681811', 0, 1),
(187, '1', '532', '13706825248269', '1370682524', 0, 1),
(188, '1', '526', '13706825554220', '1370682555', 0, 1),
(189, '3', '532', '13706826243707', '1370682624', 0, 1),
(190, '3', '534', '13706826801895', '1370682680', 0, 1),
(191, '6', '532', '13706826834485', '1370682683', 0, 1),
(192, '1', '534', '13706827604564', '1370682760', 0, 1),
(193, '1', '537', '13706830301141', '1370683030', 0, 1),
(194, '6', '539', '13706837119261', '1370683711', 0, 0),
(195, '6', '539', '13706837261772', '1370683726', 0, 0),
(196, '', '539', '13706838064917', '1370683806', 0, 0),
(197, '6', '493', '13706848066809', '1370684806', 0, 1),
(198, '3', '544', '13706850231105', '1370685023', 0, 1),
(199, '1', '546', '13706853427313', '1370685342', 0, 0),
(200, '3', '546', '13706854305087', '1370685430', 0, 0),
(201, '6', '546', '13706854857918', '1370685485', 0, 0),
(202, '1', '545', '13706854935174', '1370685493', 0, 1),
(203, '6', '548', '13706862576392', '1370686257', 0, 0),
(204, '1', '554', '13706867423869', '1370686742', 0, 1),
(205, '3', '552', '13706868056901', '1370686805', 0, 1),
(206, '3', '549', '13706876839442', '1370687683', 0, 1),
(207, '3', '555', '13706881395428', '1370688139', 0, 1),
(208, '3', '557', '13706883947123', '1370688394', 0, 1),
(209, '1', '560', '13706884842507', '1370688484', 0, 1),
(210, '1', '560', '13706885305105', '1370688530', 0, 1),
(211, '1', '557', '13706885518430', '1370688551', 0, 1),
(212, '3', '560', '13706885518364', '1370688551', 0, 1),
(213, '3', '557', '13706888252798', '1370688825', 0, 1),
(214, '6', '561', '13706889289624', '1370688928', 0, 1),
(215, '3', '561', '13706891224839', '1370689122', 0, 1),
(216, '3', '561', '13706891372579', '1370689137', 0, 1),
(217, '1', '561', '13706891987921', '1370689198', 0, 1),
(218, '1', '563', '13706892835071', '1370689283', 0, 1),
(219, '3', '562', '13706898756169', '1370689875', 0, 1),
(220, '3', '566', '13706901001270', '1370690100', 0, 1),
(221, '1', '566', '13706902588174', '1370690258', 0, 1),
(222, '1', '567', '13706903867658', '1370690386', 0, 1),
(223, '1', '568', '13706904655453', '1370690465', 0, 1),
(224, '3', '573', '13706907688429', '1370690768', 0, 1),
(225, '3', '574', '13706908937077', '1370690893', 0, 1),
(226, '1', '574', '13706909894268', '1370690989', 0, 1),
(227, '1', '577', '13706910901074', '1370691090', 0, 1),
(228, '1', '574', '13706910906064', '1370691090', 0, 1),
(229, '3', '577', '13706911655360', '1370691165', 0, 1),
(230, '6', '577', '13706912126317', '1370691212', 0, 1),
(231, '1', '579', '13706915458308', '1370691545', 0, 1),
(232, '3', '569', '13706917768999', '1370691776', 0, 1),
(233, '6', '569', '13706918049767', '1370691804', 0, 1),
(234, '3', '237', '13706918119197', '1370691811', 0, 1),
(235, '1', '569', '13706918183968', '1370691818', 0, 1),
(236, '3', '568', '13706918717246', '1370691871', 0, 1),
(237, '6', '237', '13706919039263', '1370691903', 0, 1),
(238, '1', '39', '13706919481060', '1370691948', 0, 0),
(239, '1', '237', '13706919622649', '1370691962', 0, 1),
(240, '3', '578', '13706919958053', '1370691995', 0, 1),
(241, '3', '583', '13706922623352', '1370692262', 0, 1),
(242, '1', '39', '13706923291105', '1370692329', 0, 1),
(243, '3', '584', '13706924604769', '1370692460', 0, 1),
(244, '3', '585', '13706926235503', '1370692623', 0, 1),
(245, '3', '586', '13706930065659', '1370693006', 0, 0),
(246, '3', '583', '13706932182133', '1370693218', 0, 1),
(247, '3', '590', '13706938671818', '1370693867', 0, 1),
(248, '3', '593', '13706940838556', '1370694083', 0, 1),
(249, '3', '592', '13706942193192', '1370694219', 0, 1),
(250, '3', '596', '13706942243191', '1370694224', 0, 1),
(251, '6', '590', '13706942914120', '1370694291', 0, 1),
(252, '6', '269', '13706943136548', '1370694313', 0, 1),
(253, '3', '598', '13706943489012', '1370694348', 0, 1),
(254, '1', '592', '13706943505407', '1370694350', 0, 1),
(255, '1', '596', '13706943712092', '1370694371', 0, 1),
(256, '1', '603', '13706944949508', '1370694494', 0, 1),
(257, '1', '606', '13706945816886', '1370694581', 0, 1),
(258, '3', '610', '13706946664655', '1370694666', 0, 1),
(259, '3', '596', '13706946786473', '1370694678', 0, 1),
(260, '3', '617', '13706949521081', '1370694952', 0, 1),
(261, '1', '29', '13706950394893', '1370695039', 0, 1),
(262, '3', '29', '13706951439129', '1370695143', 0, 1),
(263, '6', '29', '13706951922019', '1370695192', 0, 1),
(264, '1', '614', '13706952604773', '1370695260', 0, 1),
(265, '1', '626', '13706954925099', '1370695492', 0, 0),
(266, '3', '625', '13706955112536', '1370695511', 0, 1),
(267, '3', '515', '13706955269047', '1370695526', 0, 0),
(268, '1', '627', '13706955966758', '1370695596', 0, 1),
(269, '1', '625', '13706955968985', '1370695596', 0, 1),
(270, '6', '625', '13706957352268', '1370695735', 0, 1),
(271, '6', '625', '13706957808486', '1370695780', 0, 1),
(272, '3', '333', '13706960221484', '1370696022', 0, 1),
(273, '1', '641', '13706960801041', '1370696080', 0, 1),
(274, '3', '640', '13706961368152', '1370696136', 0, 1),
(275, '3', '626', '13706961842005', '1370696184', 0, 0),
(276, '3', '637', '13706962158817', '1370696215', 0, 0),
(277, '1', '515', '13706963857457', '1370696385', 0, 0),
(278, '3', '645', '13706964125870', '1370696412', 0, 1),
(279, '1', '333', '13706964253548', '1370696425', 0, 1),
(280, '1', '649', '13706964687274', '1370696468', 0, 0),
(281, '1', '651', '13706966025566', '1370696602', 0, 1),
(282, '1', '655', '13706966669350', '1370696666', 0, 1),
(283, '1', '656', '13706966874640', '1370696687', 0, 0),
(284, '3', '164', '13706967964120', '1370696796', 0, 1),
(285, '3', '641', '13706969336397', '1370696933', 0, 1),
(286, '3', '650', '13706969483497', '1370696948', 0, 1),
(287, '1', '641', '13706970361212', '1370697036', 0, 0),
(288, '6', '650', '13706970616069', '1370697061', 0, 1),
(289, '1', '650', '13706970856575', '1370697085', 0, 1),
(290, '3', '661', '13706970885840', '1370697088', 0, 0),
(291, '1', '661', '13706971622664', '1370697162', 0, 0),
(292, '1', '660', '13706971836425', '1370697183', 0, 0),
(293, '3', '668', '13706973189640', '1370697318', 0, 1),
(294, '3', '678', '13706973827963', '1370697382', 0, 1),
(295, '1', '674', '13706974195095', '1370697419', 0, 1),
(296, '3', '676', '13706974194609', '1370697419', 0, 0),
(297, '1', '669', '13706974243550', '1370697424', 0, 1),
(298, '6', '678', '13706974706336', '1370697470', 0, 1),
(299, '3', '673', '13706975865813', '1370697586', 0, 1),
(300, '3', '663', '13706975874207', '1370697587', 0, 1),
(301, '3', '681', '13706975904669', '1370697590', 0, 0),
(302, '3', '614', '13706976196247', '1370697619', 0, 1),
(303, '6', '668', '13706976239020', '1370697623', 0, 1),
(304, '1', '34', '13706976311335', '1370697631', 0, 1),
(305, '3', '670', '13706976473637', '1370697647', 0, 1),
(306, '1', '680', '13706976568775', '1370697656', 0, 1),
(307, '3', '682', '13706976572983', '1370697657', 0, 1),
(308, '3', '691', '13706976912487', '1370697691', 0, 1),
(309, '1', '668', '13706976914070', '1370697691', 0, 1),
(310, '1', '679', '13706977021880', '1370697702', 0, 1),
(311, '3', '690', '13706977221552', '1370697722', 0, 0),
(312, '3', '691', '13706977269660', '1370697726', 0, 1),
(313, '3', '691', '13706977353791', '1370697735', 0, 1),
(314, '6', '691', '13706977538865', '1370697753', 0, 1),
(315, '1', '691', '13706977732146', '1370697773', 0, 1),
(316, '1', '695', '13706978885351', '1370697888', 0, 1),
(317, '3', '680', '13706979172187', '1370697917', 0, 1),
(318, '3', '691', '13706979285042', '1370697928', 0, 1),
(319, '6', '691', '13706979344647', '1370697934', 0, 1),
(320, '6', '691', '13706979441463', '1370697944', 0, 1),
(321, '6', '691', '13706979496007', '1370697949', 0, 0),
(322, '1', '667', '13706979731728', '1370697973', 0, 1),
(323, '3', '695', '13706979783793', '1370697978', 0, 1),
(324, '3', '692', '13706979885679', '1370697988', 0, 0),
(325, '3', '701', '13706980027214', '1370698002', 0, 1),
(326, '3', '491', '13706980098958', '1370698009', 0, 1),
(327, '1', '491', '13706981696805', '1370698169', 0, 1),
(328, '1', '686', '13706981973447', '1370698197', 0, 0),
(329, '1', '673', '13706982067854', '1370698206', 0, 1),
(330, '3', '581', '13706982065531', '1370698206', 0, 1),
(331, '6', '667', '13706982397945', '1370698239', 0, 1),
(332, '3', '705', '13706982653064', '1370698265', 0, 1),
(333, '3', '704', '13706982841116', '1370698284', 0, 1),
(334, '1', '271', '13706983066993', '1370698306', 0, 0),
(335, '6', '581', '13706983074237', '1370698307', 0, 1),
(336, '6', '686', '13706983109845', '1370698310', 0, 0),
(337, '3', '686', '13706983269109', '1370698326', 0, 0),
(338, '1', '704', '13706983413764', '1370698341', 0, 1),
(339, '3', '716', '13706983837522', '1370698383', 0, 1),
(340, '3', '271', '13706983912775', '1370698391', 0, 0),
(341, '1', '693', '13706984562608', '1370698456', 0, 1),
(342, '3', '720', '13706984571346', '1370698457', 0, 0),
(343, '3', '723', '13706985482967', '1370698548', 0, 1),
(344, '3', '718', '13706985494474', '1370698549', 0, 1),
(345, '3', '720', '13706986021446', '1370698602', 0, 1),
(346, '1', '727', '13706987267973', '1370698726', 0, 1),
(347, '3', '732', '13706987877691', '1370698787', 0, 1),
(348, '1', '734', '13706988108908', '1370698810', 0, 1),
(349, '1', '733', '13706988203106', '1370698820', 0, 1),
(350, '1', '732', '13706988473177', '1370698847', 0, 1),
(351, '6', '738', '13706989138462', '1370698913', 0, 1),
(352, '3', '729', '13706989198862', '1370698919', 0, 1),
(353, '6', '732', '13706989358997', '1370698935', 0, 1),
(354, '6', '732', '13706989381149', '1370698938', 0, 1),
(355, '3', '353', '13706990152655', '1370699015', 0, 1),
(356, '1', '731', '13706990525639', '1370699052', 0, 1),
(357, '3', '731', '13706990841782', '1370699084', 0, 1),
(358, '3', '735', '13706991519592', '1370699151', 0, 1),
(359, '1', '746', '13706992142912', '1370699214', 0, 1),
(360, '3', '740', '13706992268578', '1370699226', 0, 0),
(361, '3', '748', '13706992353336', '1370699235', 0, 1),
(362, '1', '749', '13706992978791', '1370699297', 0, 1),
(363, '3', '741', '13706993506649', '1370699350', 0, 1),
(364, '1', '723', '13706993937927', '1370699393', 0, 1),
(365, '3', '759', '13706994558862', '1370699455', 0, 1),
(366, '6', '741', '13706994564775', '1370699456', 0, 1),
(367, '3', '763', '13706994715951', '1370699471', 0, 1),
(368, '6', '759', '13706994994153', '1370699499', 0, 1),
(369, '1', '741', '13706995043872', '1370699504', 0, 1),
(370, '1', '763', '13706995055906', '1370699505', 0, 1),
(371, '1', '759', '13706995157073', '1370699515', 0, 1),
(372, '6', '763', '13706995361388', '1370699537', 0, 1),
(373, '6', '763', '13706995491073', '1370699549', 0, 1),
(374, '1', '760', '13706995559712', '1370699555', 0, 1),
(375, '1', '760', '13706995555647', '1370699555', 0, 1),
(376, '1', '718', '13706997507628', '1370699750', 0, 1),
(377, '3', '762', '13706997579328', '1370699757', 0, 1),
(378, '3', '766', '13706998238215', '1370699823', 0, 1),
(379, '6', '771', '13706998258569', '1370699825', 0, 1),
(380, '6', '766', '13706998483562', '1370699848', 0, 1),
(381, '', '762', '13706998589736', '1370699858', 0, 1),
(382, '1', '762', '13706998744179', '1370699874', 0, 1),
(383, '1', '779', '13706999304363', '1370699930', 0, 1),
(384, '3', '762', '13706999583390', '1370699958', 0, 1),
(385, '', '762', '13706999744679', '1370699974', 0, 1),
(386, '1', '779', '13706999944560', '1370699994', 0, 1),
(387, '1', '774', '13707000763311', '1370700076', 0, 1),
(388, '1', '790', '13707001544934', '1370700154', 0, 1),
(389, '1', '774', '13707001653920', '1370700165', 0, 1),
(390, '1', '756', '13707001753454', '1370700175', 0, 1),
(391, '1', '764', '13707001838775', '1370700183', 0, 1),
(392, '3', '750', '13707001887555', '1370700188', 0, 1),
(393, '3', '733', '13707002304941', '1370700230', 0, 1),
(394, '6', '756', '13707002589521', '1370700258', 0, 1),
(395, '3', '781', '13707002771457', '1370700277', 0, 1),
(396, '3', '749', '13707004083537', '1370700408', 0, 1),
(397, '1', '792', '13707004347750', '1370700434', 0, 1),
(398, '6', '790', '13707004614230', '1370700461', 0, 1),
(399, '3', '802', '13707005213430', '1370700521', 0, 1),
(400, '3', '799', '13707005231264', '1370700524', 0, 1),
(401, '3', '801', '13707006023331', '1370700602', 0, 1),
(402, '3', '809', '13707006552544', '1370700655', 0, 1),
(403, '1', '809', '13707007047640', '1370700704', 0, 1),
(404, '1', '803', '13707007509856', '1370700750', 0, 1),
(405, '6', '799', '13707007529619', '1370700752', 0, 1),
(406, '6', '802', '13707007683050', '1370700768', 0, 1),
(407, '1', '799', '13707007708159', '1370700770', 0, 1),
(408, '3', '581', '13707008532140', '1370700853', 0, 1),
(409, '1', '810', '13707008776107', '1370700877', 0, 0),
(410, '3', '819', '13707009422735', '1370700942', 0, 1),
(411, '3', '816', '13707010122378', '1370701012', 0, 0),
(412, '1', '823', '13707010335726', '1370701033', 0, 0),
(413, '3', '790', '13707011362829', '1370701136', 0, 1),
(414, '1', '816', '13707011869331', '1370701186', 0, 1),
(415, '1', '802', '13707011977684', '1370701197', 0, 1),
(416, '6', '749', '13707011987219', '1370701198', 0, 1),
(417, '1', '806', '13707012266036', '1370701226', 0, 1),
(418, '1', '128', '13707012529713', '1370701252', 0, 0),
(419, '6', '792', '13707013556929', '1370701355', 0, 1),
(420, '6', '827', '13707015138400', '1370701513', 0, 1),
(421, '', '778', '13707015156402', '1370701515', 0, 1),
(422, '1', '828', '13707016383962', '1370701638', 0, 1),
(423, '3', '827', '13707016699767', '1370701669', 0, 1),
(424, '6', '838', '13707018456796', '1370701845', 0, 1),
(425, '1', '778', '13707018833414', '1370701883', 0, 1),
(426, '6', '581', '13707019631199', '1370701963', 0, 1),
(427, '3', '843', '13707019698436', '1370701969', 0, 1),
(428, '1', '581', '13707020276064', '1370702027', 0, 1),
(429, '6', '778', '13707020612831', '1370702061', 0, 1),
(430, '1', '843', '13707020792594', '1370702079', 0, 1),
(431, '3', '851', '13707022428922', '1370702242', 0, 0),
(432, '1', '750', '13707022976517', '1370702297', 0, 1),
(433, '1', '851', '13707023477390', '1370702347', 0, 1),
(434, '1', '853', '13707024307741', '1370702430', 0, 1),
(435, '3', '130', '13707025999258', '1370702599', 0, 0),
(436, '1', '130', '13707026165231', '1370702616', 0, 0),
(437, '3', '130', '13707026837419', '1370702683', 0, 1),
(438, '3', '130', '13707026847711', '1370702684', 0, 1),
(439, '1', '856', '13707026881422', '1370702688', 0, 1),
(440, '1', '499', '13707027427103', '1370702742', 0, 0),
(441, '6', '130', '13707027707622', '1370702770', 0, 1),
(442, '1', '845', '13707027928499', '1370702792', 0, 1),
(443, '3', '857', '13707028192700', '1370702819', 0, 1),
(444, '1', '864', '13707028487403', '1370702848', 0, 1),
(445, '3', '864', '13707029801033', '1370702980', 0, 1),
(446, '3', '651', '13707030144362', '1370703015', 0, 1),
(447, '3', '870', '13707030862315', '1370703086', 0, 1),
(448, '3', '870', '13707031083635', '1370703108', 0, 1),
(449, '6', '870', '13707032085592', '1370703208', 0, 1),
(450, '3', '881', '13707033172948', '1370703317', 0, 0),
(451, '1', '881', '13707033598829', '1370703359', 0, 0),
(452, '', '778', '13707033985439', '1370703398', 0, 1),
(453, '3', '778', '13707034054875', '1370703405', 0, 1),
(454, '3', '845', '13707034232934', '1370703423', 0, 1),
(455, '3', '888', '13707036111741', '1370703611', 0, 1),
(456, '3', '764', '13707037511180', '1370703751', 0, 1),
(457, '1', '888', '13707038012082', '1370703801', 0, 1),
(458, '6', '845', '13707040573877', '1370704057', 0, 1),
(459, '1', '892', '13707041873549', '1370704187', 0, 0),
(460, '3', '522', '13707043157452', '1370704315', 0, 1),
(461, '1', '890', '13707044215345', '1370704421', 0, 0),
(462, '1', '899', '13707045692322', '1370704569', 0, 1),
(463, '3', '895', '13707047865241', '1370704786', 0, 1),
(464, '3', '895', '13707048183922', '1370704818', 0, 1),
(465, '3', '905', '13707049815678', '1370704981', 0, 1),
(466, '1', '500', '13707050494816', '1370705049', 0, 1),
(467, '6', '905', '13707051915679', '1370705191', 0, 1),
(468, '1', '905', '13707052095250', '1370705209', 0, 1),
(469, '3', '551', '13707053393684', '1370705339', 0, 0),
(470, '1', '551', '13707054173866', '1370705417', 0, 0),
(471, '1', '824', '13707056072320', '1370705607', 0, 0),
(472, '1', '824', '13707058279283', '1370705827', 0, 0),
(473, '3', '915', '13707065158720', '1370706515', 0, 1),
(474, '1', '916', '13707067138548', '1370706713', 0, 1),
(475, '3', '915', '13707068488762', '1370706848', 0, 1),
(476, '3', '916', '13707073406251', '1370707340', 0, 1),
(477, '3', '923', '13707077226536', '1370707722', 0, 1),
(478, '3', '923', '13707077319878', '1370707731', 0, 1),
(479, '3', '924', '13707079265280', '1370707926', 0, 1),
(480, '3', '856', '13707081563818', '1370708156', 0, 1),
(481, '6', '924', '13707081823753', '1370708182', 0, 1),
(482, '1', '924', '13707082677699', '1370708267', 0, 1),
(483, '1', '929', '13707086433890', '1370708643', 0, 1),
(484, '3', '929', '13707086874721', '1370708687', 0, 1),
(485, '1', '925', '13707087929244', '1370708792', 0, 0),
(486, '3', '934', '13707089971842', '1370708997', 0, 1),
(487, '6', '925', '13707090423001', '1370709042', 0, 0),
(488, '3', '934', '13707090448503', '1370709044', 0, 1),
(489, '3', '925', '13707092824414', '1370709282', 0, 1),
(490, '1', '933', '13707095898367', '1370709589', 0, 1),
(491, '3', '933', '13707096674216', '1370709667', 0, 1),
(492, '3', '937', '13707102459550', '1370710245', 0, 1),
(493, '6', '941', '13707111111841', '1370711111', 0, 1),
(494, '3', '941', '13707111568801', '1370711156', 0, 1),
(495, '3', '942', '13707118297946', '1370711829', 0, 0),
(496, '3', '949', '13707118485216', '1370711848', 0, 1),
(497, '3', '948', '13707123161992', '1370712316', 0, 1),
(498, '3', '952', '13707128247197', '1370712824', 0, 1),
(499, '1', '952', '13707131503631', '1370713150', 0, 1),
(500, '6', '952', '13707132126940', '1370713212', 0, 1),
(501, '1', '907', '13707141978680', '1370714197', 0, 1),
(502, '', '907', '13707143295060', '1370714329', 0, 1),
(503, '', '907', '13707143523432', '1370714352', 0, 1),
(504, '', '907', '13707143525837', '1370714352', 0, 1),
(505, '6', '907', '13707144068446', '1370714406', 0, 1),
(506, '3', '957', '13707144824117', '1370714482', 0, 1),
(507, '1', '957', '13707146785952', '1370714678', 0, 1),
(508, '1', '663', '13707161995144', '1370716199', 0, 1),
(509, '6', '959', '13707176534855', '1370717653', 0, 1),
(510, '6', '959', '13707179475312', '1370717947', 0, 1),
(511, '3', '961', '13707218517795', '1370721851', 0, 1),
(512, '3', '961', '13707219435030', '1370721943', 0, 1),
(513, '1', '963', '13707237886643', '1370723788', 0, 1),
(514, '1', '964', '13707239491021', '1370723949', 0, 0),
(515, '3', '963', '13707240363290', '1370724036', 0, 1),
(516, '6', '964', '13707240897244', '1370724089', 0, 0),
(517, '3', '963', '13707241817805', '1370724181', 0, 1),
(518, '3', '964', '13707241825929', '1370724182', 0, 0),
(519, '1', '963', '13707242444444', '1370724244', 0, 1),
(520, '6', '963', '13707247703517', '1370724770', 0, 1),
(521, '3', '963', '13707248567790', '1370724856', 0, 1),
(522, '1', '968', '13707307704581', '1370730770', 0, 1),
(523, '3', '971', '13707312414514', '1370731241', 0, 1),
(524, '1', '985', '13707330185536', '1370733018', 0, 1),
(525, '', '988', '13707335003424', '1370733500', 0, 1),
(526, '3', '985', '13707339879383', '1370733987', 0, 1),
(527, '3', '990', '13707346707868', '1370734670', 0, 1),
(528, '1', '993', '13707352674294', '1370735268', 0, 1),
(529, '1', '993', '13707352973644', '1370735297', 0, 1),
(530, '1', '991', '13707357225193', '1370735722', 0, 0),
(531, '3', '991', '13707359022057', '1370735902', 0, 0),
(532, '6', '997', '13707362506860', '1370736250', 0, 1),
(533, '1', '315', '13707362849009', '1370736284', 0, 0),
(534, '1', '1003', '13707372407654', '1370737240', 0, 1),
(535, '3', '1007', '13707378093244', '1370737809', 0, 1),
(536, '1', '1006', '13707382057431', '1370738205', 0, 0),
(537, '1', '244', '13707385471835', '1370738547', 0, 1),
(538, '3', '1009', '13707386326415', '1370738632', 0, 0),
(539, '3', '790', '13707388314838', '1370738831', 0, 1),
(540, '1', '790', '13707389496566', '1370738949', 0, 1),
(541, '1', '488', '13707391436609', '1370739143', 0, 0),
(542, '3', '1019', '13707399312188', '1370739931', 0, 0),
(543, '3', '731', '13707401393396', '1370740139', 0, 1),
(544, '1', '731', '13707412645821', '1370741264', 0, 1),
(545, '3', '1027', '13707413028673', '1370741302', 0, 1),
(546, '3', '1026', '13707413204797', '1370741320', 0, 1),
(547, '1', '1027', '13707413249665', '1370741324', 0, 1),
(548, '3', '1009', '13707415324745', '1370741532', 0, 1),
(549, '1', '1028', '13707416858307', '1370741685', 0, 1),
(550, '1', '1036', '13707424745443', '1370742474', 0, 1),
(551, '3', '1038', '13707427846942', '1370742784', 0, 1),
(552, '3', '1039', '13707431062546', '1370743106', 0, 0),
(553, '6', '1040', '13707431395146', '1370743139', 0, 1),
(554, '3', '1040', '13707431712000', '1370743171', 0, 1),
(555, '6', '1040', '13707437684772', '1370743768', 0, 1),
(556, '3', '1045', '13707438693970', '1370743869', 0, 1),
(557, '6', '1052', '13707440429639', '1370744042', 0, 1),
(558, '1', '1047', '13707440422168', '1370744042', 0, 1),
(559, '3', '1034', '13707442191858', '1370744219', 0, 1),
(560, '', '1047', '13707444417737', '1370744441', 0, 1),
(561, '3', '1047', '13707444854990', '1370744485', 0, 1),
(562, '1', '10', '13707446024387', '1370744602', 0, 1),
(563, '3', '1050', '13707447126199', '1370744712', 0, 0),
(564, '3', '1051', '13707448531359', '1370744853', 0, 0),
(565, '6', '1050', '13707451443183', '1370745144', 0, 1),
(566, '1', '1050', '13707451639482', '1370745163', 0, 0),
(567, '3', '1061', '13707451719098', '1370745171', 0, 1),
(568, '3', '731', '13707453653387', '1370745365', 0, 0),
(569, '1', '1061', '13707455634911', '1370745563', 0, 1),
(570, '6', '1065', '13707457064626', '1370745706', 0, 1),
(571, '1', '1065', '13707457323347', '1370745732', 0, 1),
(572, '6', '1065', '13707458383204', '1370745838', 0, 1),
(573, '3', '1073', '13707459913750', '1370745991', 0, 0),
(574, '1', '1072', '13707460523003', '1370746052', 0, 0),
(575, '1', '1073', '13707461616311', '1370746161', 0, 0),
(576, '6', '1073', '13707462114787', '1370746211', 0, 0),
(577, '6', '578', '13707462384791', '1370746238', 0, 1),
(578, '6', '1079', '13707462871963', '1370746287', 0, 1),
(579, '3', '1074', '13707463007303', '1370746300', 0, 1),
(580, '1', '1045', '13707465988170', '1370746599', 0, 1),
(581, '3', '1083', '13707472483353', '1370747248', 0, 1),
(582, '3', '1084', '13707473142553', '1370747314', 0, 0),
(583, '1', '1084', '13707474062277', '1370747406', 0, 0),
(584, '6', '1084', '13707474813050', '1370747481', 0, 1),
(585, '3', '1086', '13707476894763', '1370747689', 0, 1),
(586, '1', '1085', '13707477238343', '1370747723', 0, 1),
(587, '', '1086', '13707477353840', '1370747735', 0, 1),
(588, '3', '1086', '13707477611178', '1370747761', 0, 1),
(589, '3', '1085', '13707478399413', '1370747839', 0, 1),
(590, '6', '1085', '13707479022221', '1370747902', 0, 1),
(591, '1', '1070', '13707484938532', '1370748493', 0, 1),
(592, '6', '1093', '13707491654114', '1370749165', 0, 1),
(593, '3', '1098', '13707494398230', '1370749439', 0, 0),
(594, '1', '1096', '13707494519702', '1370749451', 0, 1),
(595, '1', '1098', '13707495617053', '1370749561', 0, 1),
(596, '3', '1101', '13707498459357', '1370749845', 0, 1),
(597, '1', '1101', '13707499972668', '1370749997', 0, 1),
(598, '3', '1103', '13707501371304', '1370750138', 0, 0),
(599, '1', '1050', '13707502392875', '1370750239', 0, 0),
(600, '1', '1103', '13707502785632', '1370750278', 0, 0),
(601, '3', '1103', '13707504572789', '1370750457', 0, 0),
(602, '1', '1106', '13707504838927', '1370750483', 0, 1),
(603, '3', '1114', '13707506907999', '1370750690', 0, 1),
(604, '1', '1009', '13707507232138', '1370750723', 0, 1),
(605, '3', '22', '13707507345840', '1370750734', 0, 1),
(606, '3', '1116', '13707508038097', '1370750803', 0, 1),
(607, '6', '1034', '13707508763454', '1370750876', 0, 1),
(608, '1', '1107', '13707508967317', '1370750896', 0, 1),
(609, '6', '1034', '13707509394126', '1370750939', 0, 1),
(610, '1', '1118', '13707511758260', '1370751175', 0, 1),
(611, '1', '1119', '13707513074269', '1370751307', 0, 0),
(612, '3', '1071', '13707513116693', '1370751311', 0, 1),
(613, '6', '1118', '13707513166283', '1370751316', 0, 1),
(614, '3', '1107', '13707513525739', '1370751352', 0, 1),
(615, '3', '1118', '13707514214326', '1370751421', 0, 1),
(616, '6', '1071', '13707514333608', '1370751433', 0, 1),
(617, '1', '1071', '13707514912248', '1370751491', 0, 1),
(618, '3', '1127', '13707521966304', '1370752196', 0, 1),
(619, '3', '1131', '13707531344702', '1370753134', 0, 1),
(620, '1', '1131', '13707532312840', '1370753231', 0, 1),
(621, '3', '1137', '13707534479134', '1370753447', 0, 1),
(622, '6', '488', '13707537999197', '1370753799', 0, 1),
(623, '6', '488', '13707538134305', '1370753813', 0, 1),
(624, '1', '1137', '13707538493144', '1370753850', 0, 1),
(625, '3', '1140', '13707539747083', '1370753974', 0, 1),
(626, '6', '1147', '13707540805389', '1370754080', 0, 1),
(627, '6', '1137', '13707541576230', '1370754157', 0, 1),
(628, '3', '1151', '13707542281448', '1370754228', 0, 1),
(629, '1', '1151', '13707542644144', '1370754264', 0, 1),
(630, '6', '1151', '13707542763749', '1370754276', 0, 1),
(631, '3', '1151', '13707543979146', '1370754397', 0, 1),
(632, '1', '1151', '13707545082757', '1370754508', 0, 1),
(633, '3', '1152', '13707545644963', '1370754564', 0, 1),
(634, '3', '1154', '13707549833935', '1370754984', 0, 1),
(635, '3', '1156', '13707550103437', '1370755010', 0, 1),
(636, '1', '1156', '13707551173850', '1370755117', 0, 1),
(637, '1', '1154', '13707551242956', '1370755124', 0, 1),
(638, '6', '1154', '13707551909622', '1370755190', 0, 1),
(639, '3', '488', '13707556135724', '1370755613', 0, 1),
(640, '1', '488', '13707558205312', '1370755820', 0, 1),
(641, '3', '1167', '13707560897112', '1370756089', 0, 1),
(642, '6', '1167', '13707561318868', '1370756131', 0, 1),
(643, '1', '1167', '13707561796935', '1370756179', 0, 1),
(644, '1', '1153', '13707567023450', '1370756702', 0, 0),
(645, '3', '1153', '13707567677626', '1370756767', 0, 1),
(646, '1', '1198', '13707586205603', '1370758620', 0, 1),
(647, '6', '509', '13707586254987', '1370758625', 0, 1),
(648, '3', '1198', '13707587909023', '1370758790', 0, 1),
(649, '6', '1051', '13707588254699', '1370758825', 0, 0),
(650, '3', '1203', '13707591571129', '1370759157', 0, 0),
(651, '6', '1203', '13707592749631', '1370759274', 0, 1),
(652, '6', '1203', '13707592959330', '1370759295', 0, 0),
(653, '1', '1210', '13707593177249', '1370759317', 0, 1),
(654, '1', '1203', '13707593746494', '1370759374', 0, 0),
(655, '6', '1210', '13707593914159', '1370759391', 0, 1),
(656, '1', '1213', '13707594861697', '1370759486', 0, 1),
(657, '1', '1201', '13707596083270', '1370759608', 0, 1),
(658, '3', '1201', '13707596688062', '1370759668', 0, 0),
(659, '3', '1215', '13707596703619', '1370759670', 0, 1),
(660, '1', '39', '13707597313272', '1370759731', 0, 0),
(661, '3', '1215', '13707598705217', '1370759870', 0, 1),
(662, '6', '1219', '13707604319942', '1370760431', 0, 0),
(663, '1', '1219', '13707605109413', '1370760510', 0, 0),
(664, '3', '1219', '13707605973332', '1370760597', 0, 0),
(665, '3', '1236', '13707614133299', '1370761413', 0, 1),
(666, '4', '10', '13707614439699', '1370761443', 0, 0),
(667, '3', '958', '13707617212245', '1370761721', 0, 1),
(668, '1', '1121', '13707619892408', '1370761989', 0, 1),
(669, '3', '1121', '13707622059682', '1370762205', 0, 1),
(670, '1', '1255', '13707625846963', '1370762584', 0, 1),
(671, '3', '1258', '13707629403608', '1370762940', 0, 0),
(672, '3', '1251', '13707633847246', '1370763384', 0, 0),
(673, '1', '1258', '13707634737075', '1370763473', 0, 0),
(674, '1', '1259', '13707638425425', '1370763842', 0, 1),
(675, '3', '895', '13707654651424', '1370765465', 0, 1),
(676, '1', '895', '13707660671277', '1370766067', 0, 1),
(677, '3', '1270', '13707661007472', '1370766100', 0, 1),
(678, '6', '895', '13707663344910', '1370766334', 0, 1),
(679, '3', '1265', '13707667015270', '1370766701', 0, 0),
(680, '3', '1265', '13707667907310', '1370766790', 0, 0),
(681, '1', '1265', '13707669028648', '1370766902', 0, 1),
(682, '6', '937', '13707669341842', '1370766934', 0, 1),
(683, '1', '1274', '13707673478971', '1370767347', 0, 1),
(684, '6', '937', '13707674961318', '1370767496', 0, 1),
(685, '1', '937', '13707680113684', '1370768011', 0, 1),
(686, '1', '895', '13707680165797', '1370768016', 0, 1),
(687, '3', '761', '13707682191405', '1370768219', 0, 1),
(688, '6', '761', '13707683314030', '1370768331', 0, 1),
(689, '1', '761', '13707684189317', '1370768418', 0, 1),
(690, '3', '1283', '13707686517738', '1370768651', 0, 1),
(691, '3', '881', '13707690831053', '1370769083', 0, 0),
(692, '3', '1284', '13707691408323', '1370769140', 0, 0),
(693, '1', '1291', '13707707919785', '1370770791', 0, 1),
(694, '6', '1291', '13707708755195', '1370770875', 0, 1),
(695, '3', '1291', '13707708887672', '1370770888', 0, 1),
(696, '6', '1295', '13707714606546', '1370771460', 0, 1),
(697, '3', '534', '13707715611754', '1370771561', 0, 1),
(698, '1', '1107', '13707716918712', '1370771691', 0, 1),
(699, '1', '1107', '13707719685207', '1370771968', 0, 1),
(700, '6', '1107', '13707720794104', '1370772079', 0, 1),
(701, '3', '1300', '13707725797570', '1370772579', 0, 1),
(702, '3', '1304', '13707732251292', '1370773225', 0, 1),
(703, '1', '1303', '13707733779133', '1370773377', 0, 1),
(704, '6', '1306', '13707735255743', '1370773525', 0, 1),
(705, '1', '1306', '13707735357667', '1370773535', 0, 1),
(706, '3', '1306', '13707735439248', '1370773543', 0, 1),
(707, '1', '1300', '13707742013846', '1370774201', 0, 1),
(708, '1', '1311', '13707742102057', '1370774210', 0, 1),
(709, '6', '1310', '13707742474716', '1370774247', 0, 1),
(710, '3', '1310', '13707742609661', '1370774260', 0, 1),
(711, '6', '1310', '13707742671242', '1370774267', 0, 1),
(712, '1', '1310', '13707742753494', '1370774275', 0, 1),
(713, '3', '1310', '13707743432271', '1370774343', 0, 1),
(714, '6', '1303', '13707743888014', '1370774388', 0, 1),
(715, '3', '1310', '13707743982423', '1370774398', 0, 1),
(716, '6', '1310', '13707744046587', '1370774404', 0, 1),
(717, '3', '1303', '13707744173386', '1370774417', 0, 1),
(718, '1', '1318', '13707751848083', '1370775184', 0, 1),
(719, '1', '1316', '13707754705070', '1370775470', 0, 1),
(720, '3', '845', '13707758562254', '1370775856', 0, 1),
(721, '6', '845', '13707759769742', '1370775976', 0, 1),
(722, '1', '1323', '13707761653479', '1370776165', 0, 1),
(723, '3', '1319', '13707762377330', '1370776237', 0, 1),
(724, '6', '1319', '13707762528606', '1370776252', 0, 1),
(725, '1', '1319', '13707762674685', '1370776267', 0, 1),
(726, '3', '1326', '13707767952658', '1370776795', 0, 0),
(727, '1', '691', '13707768475325', '1370776847', 0, 1),
(728, '3', '691', '13707768669270', '1370776866', 0, 1),
(729, '1', '691', '13707768819253', '1370776881', 0, 1),
(730, '3', '691', '13707769092787', '1370776909', 0, 1),
(731, '6', '691', '13707769792039', '1370776979', 0, 1),
(732, '3', '761', '13707773253019', '1370777325', 0, 1),
(733, '1', '578', '13707776825052', '1370777682', 0, 1),
(734, '6', '578', '13707783738265', '1370778373', 0, 1),
(735, '3', '578', '13707784051488', '1370778405', 0, 1),
(736, '1', '959', '13707792582646', '1370779258', 0, 1),
(737, '3', '1347', '13707799291578', '1370779929', 0, 1),
(738, '3', '1280', '13707800092560', '1370780009', 0, 1),
(739, '6', '1299', '13707801424229', '1370780142', 0, 1),
(740, '6', '959', '13707802557708', '1370780255', 0, 1),
(741, '1', '1351', '13707804566479', '1370780456', 0, 1),
(742, '3', '1299', '13707804618019', '1370780461', 0, 1),
(743, '1', '385', '13707805187929', '1370780518', 0, 0),
(744, '1', '590', '13707809894710', '1370780989', 0, 1),
(745, '1', '1356', '13707813314047', '1370781331', 0, 0),
(746, '3', '590', '13707816265015', '1370781626', 0, 1),
(747, '6', '1358', '13707818081642', '1370781808', 0, 1),
(748, '1', '1359', '13707821412081', '1370782141', 0, 1),
(749, '1', '590', '13707822044353', '1370782204', 0, 1),
(750, '3', '1360', '13707833217396', '1370783321', 0, 1),
(751, '6', '1360', '13707833832734', '1370783383', 0, 1),
(752, '3', '1356', '13707836809204', '1370783680', 0, 0),
(753, '1', '1360', '13707837286455', '1370783728', 0, 1),
(754, '3', '1356', '13707837878670', '1370783787', 0, 0),
(755, '6', '1356', '13707838353602', '1370783835', 0, 0),
(756, '3', '568', '13707839593120', '1370783959', 0, 1),
(757, '3', '1346', '13707853527727', '1370785352', 0, 0),
(758, '3', '1369', '13707854683452', '1370785468', 0, 1),
(759, '1', '1356', '13707854924773', '1370785492', 0, 0),
(760, '6', '1356', '13707855905312', '1370785590', 0, 0),
(761, '3', '1356', '13707856076436', '1370785607', 0, 0),
(762, '1', '1382', '13707856358203', '1370785636', 0, 1),
(763, '6', '1382', '13707856495186', '1370785649', 0, 1),
(764, '3', '1382', '13707856631277', '1370785663', 0, 1),
(765, '1', '901', '13707857522304', '1370785752', 0, 1),
(766, '3', '1371', '13707858044615', '1370785804', 0, 1),
(767, '1', '1384', '13707859838360', '1370785983', 0, 1),
(768, '1', '1380', '13707862058943', '1370786205', 0, 1),
(769, '1', '1385', '13707862636239', '1370786263', 0, 0),
(770, '3', '1384', '13707864967270', '1370786496', 0, 1),
(771, '6', '901', '13707867963890', '1370786796', 0, 1),
(772, '3', '1380', '13707868375017', '1370786837', 0, 1),
(773, '6', '901', '13707868546271', '1370786854', 0, 1),
(774, '3', '901', '13707869278219', '1370786927', 0, 1),
(775, '1', '1387', '13707869526179', '1370786952', 0, 0),
(776, '1', '1387', '13707870156031', '1370787015', 0, 1),
(777, '1', '1386', '13707872008615', '1370787200', 0, 1),
(778, '6', '1396', '13707872501786', '1370787250', 0, 0),
(779, '6', '1387', '13707872728571', '1370787272', 0, 0),
(780, '6', '1387', '13707873036109', '1370787303', 0, 0),
(781, '3', '1387', '13707873807450', '1370787380', 0, 0),
(782, '3', '1386', '13707874537740', '1370787453', 0, 1),
(783, '3', '321', '13707874719353', '1370787471', 0, 1),
(784, '1', '321', '13707876031625', '1370787603', 0, 1),
(785, '6', '321', '13707876457212', '1370787645', 0, 1),
(786, '6', '321', '13707876601511', '1370787660', 0, 1),
(787, '3', '1418', '13707882595150', '1370788259', 0, 1),
(788, '1', '1416', '13707886434109', '1370788643', 0, 0),
(789, '6', '1433', '13707888277342', '1370788827', 0, 1),
(790, '4', '735', '13707890215684', '1370789021', 0, 0),
(791, '1', '1442', '13707893885449', '1370789388', 0, 1),
(792, '3', '1442', '13707895344439', '1370789534', 0, 1),
(793, '3', '1418', '13707895975742', '1370789597', 0, 1),
(794, '1', '1448', '13707902975739', '1370790297', 0, 1),
(795, '3', '1449', '13707905603023', '1370790560', 0, 1),
(796, '1', '1004', '13707908381343', '1370790838', 0, 0),
(797, '3', '1004', '13707908836652', '1370790883', 0, 1),
(798, '1', '1004', '13707909417885', '1370790941', 0, 1),
(799, '1', '1452', '13707912266767', '1370791226', 0, 1),
(800, '3', '523', '13707913294902', '1370791329', 0, 1),
(801, '1', '523', '13707913528671', '1370791352', 0, 1),
(802, '6', '1452', '13707913818929', '1370791381', 0, 1),
(803, '1', '1454', '13707918217113', '1370791821', 0, 1),
(804, '3', '1454', '13707921441602', '1370792144', 0, 1),
(805, '1', '1265', '13707923396792', '1370792339', 0, 1),
(806, '1', '1265', '13707923494303', '1370792349', 0, 1),
(807, '1', '1265', '13707923582041', '1370792358', 0, 0),
(808, '3', '1456', '13707931007515', '1370793100', 0, 1),
(809, '3', '1456', '13707931797664', '1370793179', 0, 1),
(810, '1', '1346', '13707940838760', '1370794083', 0, 0),
(811, '6', '1458', '13707943182309', '1370794318', 0, 1),
(812, '6', '1458', '13707943355431', '1370794335', 0, 1),
(813, '3', '1459', '13707943484148', '1370794348', 0, 0),
(814, '1', '1346', '13707947379341', '1370794737', 0, 1),
(815, '3', '943', '13707948844927', '1370794884', 0, 0),
(816, '1', '1459', '13707957096890', '1370795709', 0, 1),
(817, '3', '1461', '13707967564341', '1370796756', 0, 1),
(818, '1', '1461', '13707969238811', '1370796923', 0, 1),
(819, '1', '1464', '13707989026577', '1370798902', 0, 1),
(820, '6', '1464', '13707990199094', '1370799019', 0, 1),
(821, '3', '1464', '13707990632959', '1370799063', 0, 1),
(822, '3', '1465', '13707993254497', '1370799325', 0, 1),
(823, '1', '1466', '13707994265543', '1370799426', 0, 1),
(824, '1', '1465', '13708003832163', '1370800383', 0, 1),
(825, '3', '1344', '13708006478019', '1370800647', 0, 1),
(826, '3', '1471', '13708059945760', '1370805994', 0, 1),
(827, '6', '1471', '13708060031624', '1370806003', 0, 1),
(828, '1', '1471', '13708060194013', '1370806019', 0, 1),
(829, '1', '488', '13708140517459', '1370814051', 0, 1),
(830, '3', '1475', '13708152703483', '1370815270', 0, 1),
(831, '6', '1475', '13708156387815', '1370815638', 0, 1),
(832, '1', '1475', '13708156873452', '1370815687', 0, 1),
(833, '1', '1475', '13708161164806', '1370816116', 0, 1),
(834, '3', '1483', '13708233476061', '1370823347', 0, 1),
(835, '1', '1472', '13708243739782', '1370824373', 0, 1),
(836, '3', '1485', '13708253169215', '1370825316', 0, 1),
(837, '1', '1486', '13708253663145', '1370825366', 0, 0),
(838, '3', '1490', '13708261251124', '1370826125', 0, 1),
(839, '6', '1489', '13708262027569', '1370826202', 0, 1),
(840, '3', '1489', '13708262856174', '1370826285', 0, 1),
(841, '6', '1489', '13708263683915', '1370826368', 0, 1),
(842, '1', '1489', '13708263828334', '1370826382', 0, 1),
(843, '3', '1491', '13708264088250', '1370826408', 0, 1),
(844, '3', '1493', '13708265356112', '1370826535', 0, 1),
(845, '3', '1282', '13708272127247', '1370827212', 0, 0),
(846, '3', '1494', '13708274009766', '1370827400', 0, 1),
(847, '1', '1494', '13708278626224', '1370827862', 0, 1),
(848, '6', '1494', '13708280092027', '1370828009', 0, 1),
(849, '3', '1486', '13708282751948', '1370828275', 0, 0),
(850, '6', '1486', '13708283549374', '1370828354', 0, 0),
(851, '3', '1472', '13708292653341', '1370829265', 0, 1),
(852, '3', '1010', '13708303002033', '1370830300', 0, 1),
(853, '1', '1010', '13708306066263', '1370830606', 0, 1),
(854, '1', '1472', '13708307268194', '1370830726', 0, 1),
(855, '6', '1472', '13708308613042', '1370830861', 0, 1),
(856, '3', '1506', '13708317063557', '1370831706', 0, 1),
(857, '3', '1506', '13708318101392', '1370831810', 0, 1),
(858, '1', '45', '13708323895298', '1370832389', 0, 1),
(859, '3', '916', '13708328168305', '1370832816', 0, 1),
(860, '3', '1509', '13708328889343', '1370832888', 0, 1),
(861, '1', '1472', '13708335206642', '1370833520', 0, 1),
(862, '3', '1515', '13708337291917', '1370833729', 0, 1),
(863, '3', '1516', '13708342966481', '1370834296', 0, 0),
(864, '1', '1517', '13708344737044', '1370834473', 0, 1),
(865, '1', '1492', '13708345437899', '1370834543', 0, 1),
(866, '1', '1509', '13708345823109', '1370834582', 0, 1),
(867, '3', '1518', '13708348595826', '1370834859', 0, 0),
(868, '3', '1519', '13708349584926', '1370834958', 0, 0),
(869, '1', '1521', '13708361168195', '1370836116', 0, 1),
(870, '3', '1521', '13708362314470', '1370836231', 0, 0),
(871, '6', '1521', '13708362728732', '1370836272', 0, 1),
(872, '3', '1526', '13708372331871', '1370837233', 0, 1),
(873, '1', '1350', '13708375038790', '1370837503', 0, 1),
(874, '3', '1528', '13708375812323', '1370837581', 0, 1),
(875, '1', '1528', '13708377246871', '1370837724', 0, 1),
(876, '1', '803', '13708379042808', '1370837904', 0, 1),
(877, '3', '1520', '13708383398176', '1370838339', 0, 1),
(878, '6', '1520', '13708387057835', '1370838705', 0, 1),
(879, '1', '1520', '13708387687368', '1370838768', 0, 1),
(880, '1', '1519', '13708398082868', '1370839808', 0, 0),
(881, '3', '1476', '13708404886868', '1370840488', 0, 0),
(882, '3', '1098', '13708411798111', '1370841179', 0, 1),
(883, '1', '769', '13708450721597', '1370845072', 0, 1),
(884, '6', '769', '13708451491365', '1370845149', 0, 1),
(885, '3', '769', '13708451864196', '1370845186', 0, 1),
(886, '3', '45', '13708473676476', '1370847367', 0, 1),
(887, '1', '1517', '13708490781020', '1370849078', 0, 1),
(888, '6', '995', '13708509054976', '1370850905', 0, 0),
(889, '1', '1369', '13708537051577', '1370853705', 0, 1),
(890, '1', '1589', '13708557383255', '1370855738', 0, 1),
(891, '3', '1589', '13708560059478', '1370856006', 0, 1),
(892, '3', '1593', '13708571253199', '1370857125', 0, 1),
(893, '3', '1594', '13708572348710', '1370857234', 0, 1),
(894, '1', '1595', '13708586331067', '1370858633', 0, 1),
(895, '3', '1595', '13708586546786', '1370858654', 0, 1),
(896, '1', '1597', '13708592248990', '1370859224', 0, 1),
(897, '1', '1356', '13708612388882', '1370861238', 0, 0),
(898, '3', '1036', '13708615434445', '1370861543', 0, 1),
(899, '3', '1356', '13708622365680', '1370862236', 0, 1),
(900, '3', '1603', '13708645385096', '1370864538', 0, 1),
(901, '3', '1604', '13708647311308', '1370864731', 0, 1),
(902, '6', '1101', '13708648002850', '1370864800', 0, 1),
(903, '1', '1287', '13708654683575', '1370865468', 0, 1),
(904, '6', '1609', '13708674671586', '1370867467', 0, 1);
INSERT INTO `hi_o` (`o_id`, `p_id`, `u_id`, `orderid`, `addtime`, `zt`, `ptype`) VALUES
(905, '3', '1611', '13708683756810', '1370868375', 0, 1),
(906, '3', '1615', '13708687563958', '1370868756', 0, 1),
(907, '1', '1618', '13708692357476', '1370869235', 0, 1),
(908, '', '1344', '13708694892665', '1370869489', 0, 0),
(909, '1', '1197', '13708697559067', '1370869755', 0, 1),
(910, '1', '1344', '13708698086363', '1370869808', 0, 1),
(911, '3', '1615', '13708699006784', '1370869900', 0, 1),
(912, '1', '1621', '13708699548797', '1370869954', 0, 1),
(913, '3', '1615', '13708701798404', '1370870179', 0, 1),
(914, '3', '1626', '13708722468792', '1370872246', 0, 0),
(915, '3', '1631', '13708724454272', '1370872445', 0, 1),
(916, '3', '1631', '13708725074619', '1370872507', 0, 1),
(917, '3', '1626', '13708725539471', '1370872553', 0, 1),
(918, '1', '1631', '13708725875331', '1370872587', 0, 1),
(919, '3', '1626', '13708725907102', '1370872590', 0, 1),
(920, '1', '1633', '13708728479428', '1370872847', 0, 1),
(921, '1', '1632', '13708729503941', '1370872950', 0, 1),
(922, '3', '1632', '13708730622367', '1370873062', 0, 1),
(923, '1', '1634', '13708731417591', '1370873141', 0, 1),
(924, '1', '1636', '13708742384639', '1370874238', 0, 1),
(925, '3', '1638', '13708750118165', '1370875011', 0, 1),
(926, '3', '1640', '13708762849905', '1370876284', 0, 1),
(927, '1', '1622', '13708767496467', '1370876749', 0, 1),
(928, '1', '1645', '13708782953763', '1370878295', 0, 1),
(929, '1', '1647', '13708788444142', '1370878844', 0, 1),
(930, '6', '1648', '13708791838032', '1370879183', 0, 1),
(931, '1', '742', '13708794709157', '1370879470', 0, 0),
(932, '3', '1651', '13708814419964', '1370881441', 0, 1),
(933, '1', '1629', '13708814906368', '1370881490', 0, 1),
(934, '3', '1629', '13708816439347', '1370881643', 0, 1),
(935, '1', '1652', '13708817599558', '1370881759', 0, 1),
(936, '3', '1653', '13708818328412', '1370881832', 0, 1),
(937, '3', '1655', '13708819066440', '1370881906', 0, 1),
(938, '3', '1660', '13708893022785', '1370889302', 0, 1),
(939, '3', '793', '13709081233548', '1370908123', 0, 1),
(940, '3', '1472', '13709101961802', '1370910196', 0, 1),
(941, '3', '1664', '13709104895183', '1370910489', 0, 1),
(942, '3', '1672', '13709119099525', '1370911909', 0, 1),
(943, '6', '1615', '13709120769208', '1370912076', 0, 1),
(944, '1', '1615', '13709121166916', '1370912116', 0, 1),
(945, '1', '1611', '13709124306141', '1370912430', 0, 1),
(946, '1', '1672', '13709125337562', '1370912533', 0, 1),
(947, '3', '1664', '13709140503510', '1370914050', 0, 1),
(948, '4', '1009', '13709154185810', '1370915418', 0, 0),
(949, '1', '1009', '13709154695092', '1370915469', 0, 0),
(950, '3', '1718', '13709157153164', '1370915715', 0, 1),
(951, '1', '1718', '13709159954471', '1370915995', 0, 1),
(952, '3', '1718', '13709163717203', '1370916371', 0, 1),
(953, '6', '1721', '13709171411350', '1370917141', 0, 1),
(954, '1', '1721', '13709172768168', '1370917276', 0, 1),
(955, '3', '137', '13709181976924', '1370918197', 0, 1),
(956, '3', '1723', '13709196867237', '1370919686', 0, 1),
(957, '3', '1725', '13709199444947', '1370919944', 0, 1),
(958, '1', '1725', '13709202022715', '1370920202', 0, 1),
(959, '3', '1472', '13709205547168', '1370920554', 0, 1),
(960, '6', '1725', '13709207835818', '1370920783', 0, 1),
(961, '1', '1472', '13709209944826', '1370920994', 0, 1),
(962, '3', '1722', '13709211169281', '1370921116', 0, 1),
(963, '3', '1725', '13709212064464', '1370921206', 0, 1),
(964, '1', '1722', '13709212849630', '1370921284', 0, 1),
(965, '3', '1729', '13709221535948', '1370922153', 0, 1),
(966, '', '1726', '13709222824763', '1370922282', 0, 1),
(967, '3', '1733', '13709233729169', '1370923372', 0, 1),
(968, '1', '1734', '13709243634273', '1370924363', 0, 1),
(969, '6', '1734', '13709246526155', '1370924652', 0, 1),
(970, '3', '1586', '13709272925709', '1370927292', 0, 1),
(971, '1', '1586', '13709273706907', '1370927370', 0, 1),
(972, '1', '1746', '13709322202906', '1370932220', 0, 1),
(973, '6', '1753', '13709326442484', '1370932644', 0, 1),
(974, '3', '1753', '13709326598598', '1370932659', 0, 1),
(975, '3', '1753', '13709326777749', '1370932677', 0, 1),
(976, '1', '1595', '13709346912890', '1370934691', 0, 1),
(977, '3', '1760', '13709348737714', '1370934873', 0, 1),
(978, '1', '1760', '13709354082338', '1370935408', 0, 1),
(979, '1', '1762', '13709354901636', '1370935490', 0, 1),
(980, '6', '1760', '13709354938821', '1370935493', 0, 1),
(981, '3', '1760', '13709355156567', '1370935515', 0, 1),
(982, '6', '1762', '13709355616405', '1370935561', 0, 1),
(983, '3', '1762', '13709382135024', '1370938213', 0, 1),
(984, '3', '1768', '13709387497308', '1370938749', 0, 1),
(985, '3', '1768', '13709387838988', '1370938783', 0, 1),
(986, '3', '1769', '13709388295640', '1370938829', 0, 1),
(987, '1', '1771', '13709393447100', '1370939344', 0, 1),
(988, '3', '1772', '13709394741205', '1370939474', 0, 1),
(989, '1', '1072', '13709404214065', '1370940421', 0, 1),
(990, '6', '1762', '13709406105626', '1370940610', 0, 1),
(991, '1', '1773', '13709409747474', '1370940974', 0, 1),
(992, '3', '1773', '13709410195590', '1370941019', 0, 1),
(993, '3', '1734', '13709415059796', '1370941505', 0, 1),
(994, '1', '1774', '13709421431613', '1370942143', 0, 0),
(995, '1', '1776', '13709445657879', '1370944565', 0, 1),
(996, '3', '1776', '13709447733819', '1370944773', 0, 1),
(997, '6', '1776', '13709448974325', '1370944897', 0, 1),
(998, '6', '1777', '13709451913896', '1370945191', 0, 1),
(999, '3', '1778', '13709461765829', '1370946176', 0, 1),
(1000, '1', '1778', '13709463784190', '1370946378', 0, 1),
(1001, '1', '1779', '13709472987219', '1370947298', 0, 1),
(1002, '1', '22', '13709478584175', '1370947858', 0, 1),
(1003, '1', '1782', '13709486217580', '1370948621', 0, 1),
(1004, '3', '1781', '13709486443818', '1370948644', 0, 1),
(1005, '6', '1784', '13709502491002', '1370950249', 0, 1),
(1006, '6', '1783', '13709502875295', '1370950287', 0, 1),
(1007, '1', '1785', '13709506134727', '1370950613', 0, 1),
(1008, '6', '1785', '13709506292845', '1370950629', 0, 1),
(1009, '3', '1785', '13709506449268', '1370950644', 0, 1),
(1010, '6', '1785', '13709506715533', '1370950671', 0, 1),
(1011, '1', '1788', '13709521885747', '1370952188', 0, 1),
(1012, '6', '1788', '13709522917120', '1370952291', 0, 1),
(1013, '3', '1788', '13709523713772', '1370952371', 0, 1),
(1014, '6', '1788', '13709524814086', '1370952481', 0, 1),
(1015, '3', '1793', '13709547356587', '1370954735', 0, 1),
(1016, '1', '1356', '13709550374349', '1370955037', 0, 0),
(1017, '1', '1356', '13709550996920', '1370955099', 0, 0),
(1018, '3', '1763', '13709557878335', '1370955787', 0, 1),
(1019, '1', '1763', '13709561562569', '1370956156', 0, 1),
(1020, '', '1797', '13709570989237', '1370957098', 0, 0),
(1021, '1', '756', '13709574381169', '1370957438', 0, 1),
(1022, '1', '1642', '13709577608533', '1370957760', 0, 1),
(1023, '3', '756', '13709578129144', '1370957812', 0, 1),
(1024, '3', '756', '13709580512792', '1370958051', 0, 1),
(1025, '6', '1798', '13709587962401', '1370958796', 0, 1),
(1026, '3', '1798', '13709588166442', '1370958816', 0, 0),
(1027, '1', '1799', '13709589703281', '1370958970', 0, 0),
(1028, '6', '1799', '13709591389643', '1370959138', 0, 0),
(1029, '3', '1449', '13709595365960', '1370959536', 0, 1),
(1030, '3', '1804', '13709602315298', '1370960231', 0, 0),
(1031, '1', '1805', '13709607897775', '1370960789', 0, 1),
(1032, '3', '1807', '13709614991971', '1370961499', 0, 1),
(1033, '1', '1807', '13709615852385', '1370961585', 0, 1),
(1034, '6', '1807', '13709615852029', '1370961585', 0, 1),
(1035, '3', '1808', '13709620037093', '1370962003', 0, 1),
(1036, '1', '1808', '13709620813526', '1370962081', 0, 1),
(1037, '1', '1815', '13709681761235', '1370968176', 0, 0),
(1038, '3', '1815', '13709683663069', '1370968366', 0, 0),
(1039, '6', '1615', '13709688633151', '1370968863', 0, 1),
(1040, '1', '1615', '13709689091488', '1370968909', 0, 1),
(1041, '3', '1820', '13709722943522', '1370972294', 0, 1),
(1042, '3', '1822', '13709751976504', '1370975197', 0, 1),
(1043, '6', '1826', '13709811209024', '1370981120', 0, 1),
(1044, '6', '1826', '13709811307760', '1370981130', 0, 1),
(1045, '1', '1826', '13709811516713', '1370981151', 0, 1),
(1046, '6', '1826', '13709811901273', '1370981190', 0, 1),
(1047, '3', '1827', '13709825379808', '1370982537', 0, 0),
(1048, '1', '1830', '13709962291936', '1370996229', 0, 1),
(1049, '6', '1830', '13709963003111', '1370996300', 0, 1),
(1050, '3', '1830', '13709963155168', '1370996315', 0, 1),
(1051, '3', '1831', '13709973284115', '1370997328', 0, 1),
(1052, '6', '1830', '13709982766725', '1370998276', 0, 1),
(1053, '3', '1851', '13710018388899', '1371001838', 0, 0),
(1054, '3', '1851', '13710018624268', '1371001862', 0, 1),
(1055, '1', '1851', '13710019288504', '1371001928', 0, 0),
(1056, '3', '129', '13710067425568', '1371006742', 0, 1),
(1057, '1', '129', '13710068348472', '1371006834', 0, 1),
(1058, '3', '1874', '13710112209268', '1371011220', 0, 1),
(1059, '1', '1874', '13710112835592', '1371011283', 0, 1),
(1060, '3', '1876', '13710113333064', '1371011333', 0, 1),
(1061, '1', '1875', '13710115121479', '1371011512', 0, 1),
(1062, '1', '1599', '13710122045712', '1371012204', 0, 1),
(1063, '1', '1599', '13710123464290', '1371012346', 0, 1),
(1064, '6', '1599', '13710123722185', '1371012372', 0, 1),
(1065, '3', '1599', '13710124145454', '1371012414', 0, 1),
(1066, '1', '937', '13710131509343', '1371013150', 0, 1),
(1067, '3', '1897', '13710169862514', '1371016986', 0, 1),
(1068, '1', '1898', '13710173366723', '1371017336', 0, 1),
(1069, '1', '1901', '13710178002380', '1371017800', 0, 1),
(1070, '3', '1898', '13710182138164', '1371018213', 0, 1),
(1071, '1', '943', '13710206754840', '1371020675', 0, 1),
(1072, '1', '1908', '13710213767238', '1371021376', 0, 1),
(1073, '3', '1914', '13710219744540', '1371021974', 0, 1),
(1074, '6', '1914', '13710220358440', '1371022035', 0, 1),
(1075, '1', '1914', '13710220844825', '1371022084', 0, 1),
(1076, '6', '1916', '13710232003490', '1371023200', 0, 1),
(1077, '3', '1494', '13710257718608', '1371025771', 0, 1),
(1078, '3', '1919', '13710261499377', '1371026149', 0, 1),
(1079, '3', '1920', '13710267427664', '1371026742', 0, 1),
(1080, '1', '1921', '13710268098639', '1371026809', 0, 1),
(1081, '1', '1919', '13710297526999', '1371029752', 0, 1),
(1082, '3', '1655', '13710307225367', '1371030722', 0, 1),
(1083, '', '539', '13710311223038', '1371031122', 0, 0),
(1084, '1', '539', '13710312426700', '1371031242', 0, 0),
(1085, '6', '539', '13710313453105', '1371031345', 0, 0),
(1086, '3', '539', '13710325044882', '1371032504', 0, 0),
(1087, '3', '690', '13710338059987', '1371033805', 0, 1),
(1088, '1', '1826', '13710350732973', '1371035073', 0, 1),
(1089, '1', '1936', '13710351925304', '1371035192', 0, 1),
(1090, '3', '1382', '13710357026465', '1371035702', 0, 1),
(1091, '6', '1382', '13710357241185', '1371035724', 0, 1),
(1092, '1', '1382', '13710357327728', '1371035732', 0, 1),
(1093, '3', '1382', '13710358454024', '1371035845', 0, 1),
(1094, '1', '1940', '13710358749201', '1371035874', 0, 1),
(1095, '6', '1382', '13710361137414', '1371036113', 0, 1),
(1096, '6', '1382', '13710361581213', '1371036158', 0, 1),
(1097, '6', '1382', '13710363681164', '1371036368', 0, 1),
(1098, '3', '1940', '13710365809978', '1371036580', 0, 1),
(1099, '1', '645', '13710385369759', '1371038536', 0, 1),
(1100, '3', '1944', '13710411505442', '1371041150', 0, 1),
(1101, '1', '1944', '13710419556769', '1371041955', 0, 1),
(1102, '1', '1947', '13710423296066', '1371042329', 0, 0),
(1103, '6', '1947', '13710424171613', '1371042417', 0, 1),
(1104, '3', '1947', '13710424296889', '1371042429', 0, 1),
(1105, '3', '1660', '13710429909182', '1371042990', 0, 1),
(1106, '1', '1949', '13710432035975', '1371043203', 0, 1),
(1107, '3', '1949', '13710432678594', '1371043267', 0, 1),
(1108, '3', '1954', '13710454375991', '1371045437', 0, 1),
(1109, '3', '1622', '13710459027194', '1371045902', 0, 1),
(1110, '3', '1954', '13710459751841', '1371045975', 0, 1),
(1111, '3', '1956', '13710466483759', '1371046648', 0, 1),
(1112, '3', '1171', '13710474434281', '1371047443', 0, 1),
(1113, '1', '1622', '13710474843024', '1371047484', 0, 1),
(1114, '1', '1622', '13710474882904', '1371047488', 0, 1),
(1115, '6', '1622', '13710475628166', '1371047562', 0, 1),
(1116, '3', '1958', '13710483723200', '1371048372', 0, 1),
(1117, '3', '1597', '13710494673120', '1371049467', 0, 1),
(1118, '3', '1597', '13710495051351', '1371049505', 0, 1),
(1119, '1', '1954', '13710523774682', '1371052377', 0, 1),
(1120, '1', '111', '13710526636913', '1371052663', 0, 0),
(1121, '6', '1964', '13710531985058', '1371053198', 0, 1),
(1122, '3', '1964', '13710532079399', '1371053207', 0, 1),
(1123, '6', '1964', '13710533867550', '1371053386', 0, 1),
(1124, '3', '1964', '13710533976875', '1371053397', 0, 1),
(1125, '6', '1964', '13710534594588', '1371053459', 0, 1),
(1126, '6', '111', '13710536779400', '1371053677', 0, 1),
(1127, '1', '1965', '13710537469083', '1371053746', 0, 0),
(1128, '', '1965', '13710548511720', '1371054851', 0, 1),
(1129, '1', '1965', '13710549542614', '1371054954', 0, 0),
(1130, '1', '1826', '13710559716176', '1371055971', 0, 1),
(1131, '6', '1152', '13710568409642', '1371056840', 0, 1),
(1132, '1', '1831', '13710742542673', '1371074254', 0, 1),
(1133, '1', '738', '13710793457461', '1371079345', 0, 1),
(1134, '1', '738', '13710793918112', '1371079391', 0, 1),
(1135, '3', '738', '13710794566098', '1371079456', 0, 1),
(1136, '3', '738', '13710794863519', '1371079486', 0, 1),
(1137, '6', '723', '13710795331667', '1371079533', 0, 1),
(1138, '3', '738', '13710795974063', '1371079597', 0, 1),
(1139, '3', '738', '13710796318784', '1371079631', 0, 1),
(1140, '6', '1971', '13710811296656', '1371081129', 0, 1),
(1141, '1', '1972', '13710817564147', '1371081756', 0, 1),
(1142, '3', '1972', '13710818892529', '1371081889', 0, 1),
(1143, '6', '1972', '13710819852112', '1371081985', 0, 1),
(1144, '6', '1972', '13710820092542', '1371082009', 0, 1),
(1145, '3', '1974', '13710832624871', '1371083262', 0, 1),
(1146, '1', '200', '13710844089528', '1371084408', 0, 1),
(1147, '3', '1664', '13710844101143', '1371084410', 0, 1),
(1148, '6', '200', '13710844593900', '1371084459', 0, 1),
(1149, '3', '1604', '13710854107801', '1371085410', 0, 1),
(1150, '6', '1929', '13710857069285', '1371085706', 0, 0),
(1151, '3', '1977', '13710857262148', '1371085726', 0, 0),
(1152, '3', '1977', '13710857517317', '1371085751', 0, 0),
(1153, '3', '1979', '13710861123760', '1371086112', 0, 1),
(1154, '3', '111', '13710866887059', '1371086688', 0, 1),
(1155, '6', '111', '13710867205533', '1371086720', 0, 1),
(1156, '1', '111', '13710867301122', '1371086730', 0, 1),
(1157, '1', '111', '13710867996774', '1371086799', 0, 1),
(1158, '1', '1486', '13710915274396', '1371091527', 0, 0),
(1159, '1', '1986', '13710922511549', '1371092251', 0, 1),
(1160, '3', '1993', '13710947372686', '1371094737', 0, 1),
(1161, '6', '1993', '13710956577361', '1371095657', 0, 1),
(1162, '3', '1995', '13710979167530', '1371097916', 0, 1),
(1163, '1', '1971', '13710981535873', '1371098153', 0, 1),
(1164, '3', '1999', '13711010837870', '1371101083', 0, 0),
(1165, '1', '1999', '13711011819314', '1371101181', 0, 0),
(1166, '1', '2000', '13711018445409', '1371101844', 0, 1),
(1167, '3', '2001', '13711019618861', '1371101961', 0, 1),
(1168, '1', '1999', '13711020467564', '1371102046', 0, 1),
(1169, '1', '2002', '13711046293681', '1371104630', 0, 1),
(1170, '3', '2002', '13711046479465', '1371104647', 0, 1),
(1171, '6', '2002', '13711046928140', '1371104692', 0, 1),
(1172, '3', '2005', '13711055181617', '1371105518', 0, 1),
(1173, '1', '1047', '13711057577979', '1371105757', 0, 1),
(1174, '1', '2008', '13711073865023', '1371107386', 0, 1),
(1175, '6', '2008', '13711074712077', '1371107471', 0, 1),
(1176, '3', '2008', '13711077231039', '1371107723', 0, 1),
(1177, '1', '2009', '13711083101529', '1371108310', 0, 1),
(1178, '3', '2002', '13711098313499', '1371109831', 0, 1),
(1179, '6', '2002', '13711099642051', '1371109964', 0, 1),
(1180, '1', '632', '13711099675072', '1371109967', 0, 1),
(1181, '1', '2002', '13711100605151', '1371110060', 0, 1),
(1182, '1', '2002', '13711101472665', '1371110147', 0, 1),
(1183, '1', '2002', '13711101926451', '1371110192', 0, 1),
(1184, '3', '2014', '13711130008984', '1371113000', 0, 1),
(1185, '6', '2014', '13711132392668', '1371113239', 0, 1),
(1186, '6', '2014', '13711133236462', '1371113323', 0, 1),
(1187, '1', '2014', '13711133742528', '1371113374', 0, 1),
(1188, '3', '2015', '13711137628179', '1371113762', 0, 0),
(1189, '1', '140', '13711147629105', '1371114762', 0, 0),
(1190, '1', '2015', '13711148704788', '1371114870', 0, 1),
(1191, '6', '2015', '13711150248495', '1371115024', 0, 0),
(1192, '6', '2015', '13711150684306', '1371115068', 0, 1),
(1193, '3', '1295', '13711156335026', '1371115633', 0, 0),
(1194, '6', '1999', '13711169871040', '1371116987', 0, 1),
(1195, '6', '1999', '13711170118480', '1371117011', 0, 1),
(1196, '', '48', '13711197593698', '1371119759', 0, 1),
(1197, '', '176', '13711200659742', '1371120065', 0, 1),
(1198, '', '176', '13711200702729', '1371120070', 0, 0),
(1199, '', '176', '13711200765999', '1371120076', 0, 1),
(1200, '1', '1544', '13711283122532', '1371128312', 0, 1),
(1201, '1', '1073', '13711296352396', '1371129635', 0, 0),
(1202, '3', '1073', '13711296786185', '1371129678', 0, 0),
(1203, '1', '2026', '13711300117784', '1371130011', 0, 1),
(1204, '3', '2026', '13711307066100', '1371130706', 0, 1),
(1205, '1', '890', '13711326539132', '1371132653', 0, 0),
(1206, '1', '2031', '13711348859716', '1371134885', 0, 1),
(1207, '3', '2031', '13711350053584', '1371135005', 0, 1),
(1208, '3', '1201', '13711351281915', '1371135128', 0, 1),
(1209, '3', '1664', '13711355853559', '1371135585', 0, 1),
(1210, '6', '1664', '13711356685060', '1371135668', 0, 0),
(1211, '1', '1664', '13711356754159', '1371135675', 0, 1),
(1212, '6', '1664', '13711357305756', '1371135730', 0, 1),
(1213, '1', '483', '13711360855595', '1371136085', 0, 1),
(1214, '1', '483', '13711361631619', '1371136163', 0, 1),
(1215, '1', '534', '13711374467015', '1371137446', 0, 1),
(1216, '3', '2037', '13711381069191', '1371138106', 0, 1),
(1217, '3', '2038', '13711383175206', '1371138317', 0, 1),
(1218, '3', '1141', '13711393774666', '1371139377', 0, 1),
(1219, '1', '1141', '13711394433951', '1371139443', 0, 1),
(1220, '3', '2039', '13711396952118', '1371139695', 0, 1),
(1221, '1', '1141', '13711402295195', '1371140229', 0, 0),
(1222, '1', '1589', '13711415364517', '1371141536', 0, 1),
(1223, '3', '2042', '13711443078708', '1371144307', 0, 1),
(1224, '3', '2047', '13711629527773', '1371162952', 0, 1),
(1225, '3', '2047', '13711647538577', '1371164753', 0, 1),
(1226, '1', '1500', '13711688289715', '1371168828', 0, 1),
(1227, '3', '2049', '13711733183194', '1371173318', 0, 0),
(1228, '3', '2053', '13711777368205', '1371177736', 0, 1),
(1229, '3', '2057', '13711872478749', '1371187247', 0, 1),
(1230, '1', '2057', '13711873535700', '1371187353', 0, 1),
(1231, '6', '2063', '13711918687724', '1371191868', 0, 1),
(1232, '1', '1072', '13711923896562', '1371192389', 0, 1),
(1233, '3', '2064', '13711925062962', '1371192506', 0, 1),
(1234, '3', '2054', '13711944095640', '1371194409', 0, 0),
(1235, '1', '2068', '13711960522733', '1371196052', 0, 1),
(1236, '3', '2069', '13711963845549', '1371196384', 0, 0),
(1237, '1', '2069', '13711973612025', '1371197361', 0, 0),
(1238, '3', '2073', '13711994549675', '1371199454', 0, 1),
(1239, '1', '2073', '13712003052156', '1371200305', 0, 1),
(1240, '3', '2075', '13712006657342', '1371200665', 0, 1),
(1241, '1', '2077', '13712023086485', '1371202308', 0, 1),
(1242, '6', '2077', '13712023676583', '1371202367', 0, 1),
(1243, '6', '2077', '13712023933386', '1371202393', 0, 1),
(1244, '3', '2077', '13712026525739', '1371202652', 0, 1),
(1245, '1', '2079', '13712028049854', '1371202804', 0, 1),
(1246, '6', '2079', '13712029156804', '1371202915', 0, 1),
(1247, '3', '985', '13712029217885', '1371202921', 0, 1),
(1248, '3', '2079', '13712029399517', '1371202939', 0, 1),
(1249, '1', '1827', '13712039601771', '1371203960', 0, 1),
(1250, '3', '1500', '13712065163168', '1371206516', 0, 1),
(1251, '6', '1500', '13712065496543', '1371206549', 0, 1),
(1252, '3', '1500', '13712069148211', '1371206914', 0, 1),
(1253, '6', '2087', '13712079906507', '1371207990', 0, 1),
(1254, '1', '2087', '13712080551609', '1371208055', 0, 1),
(1255, '1', '2087', '13712080948918', '1371208094', 0, 0),
(1256, '3', '2086', '13712082188671', '1371208218', 0, 0),
(1257, '3', '2086', '13712085224174', '1371208522', 0, 0),
(1258, '1', '2088', '13712100777873', '1371210077', 0, 1),
(1259, '3', '2088', '13712102835764', '1371210283', 0, 1),
(1260, '1', '2090', '13712119625688', '1371211962', 0, 1),
(1261, '3', '2065', '13712125423067', '1371212542', 0, 1),
(1262, '3', '2073', '13712146318759', '1371214631', 0, 1),
(1263, '1', '698', '13712180432725', '1371218043', 0, 1),
(1264, '1', '1851', '13712195239817', '1371219523', 0, 1),
(1265, '1', '2094', '13712212331101', '1371221233', 0, 1),
(1266, '6', '2094', '13712221057200', '1371222105', 0, 1),
(1267, '6', '2094', '13712221666027', '1371222166', 0, 1),
(1268, '1', '2101', '13712274595886', '1371227459', 0, 0),
(1269, '1', '2100', '13712280336459', '1371228033', 0, 1),
(1270, '3', '1788', '13712283433413', '1371228343', 0, 1),
(1271, '1', '1788', '13712285462557', '1371228546', 0, 1),
(1272, '6', '1788', '13712285808171', '1371228580', 0, 1),
(1273, '3', '1788', '13712286004543', '1371228600', 0, 0),
(1274, '1', '1222', '13712308266302', '1371230826', 0, 1),
(1275, '6', '1222', '13712317689683', '1371231768', 0, 1),
(1276, '6', '1222', '13712318054582', '1371231805', 0, 1),
(1277, '3', '1222', '13712318661567', '1371231866', 0, 1),
(1278, '3', '1222', '13712318874989', '1371231887', 0, 1),
(1279, '3', '1634', '13712320627515', '1371232062', 0, 1),
(1280, '1', '2104', '13712402402416', '1371240240', 0, 1),
(1281, '3', '2073', '13712509163403', '1371250916', 0, 1),
(1282, '1', '534', '13712591218783', '1371259121', 0, 1),
(1283, '1', '229', '13712606316856', '1371260631', 0, 1),
(1284, '6', '229', '13712612526595', '1371261252', 0, 1),
(1285, '3', '2126', '13712661958957', '1371266195', 0, 1),
(1286, '1', '2126', '13712662846059', '1371266284', 0, 1),
(1287, '6', '2126', '13712663659545', '1371266365', 0, 1),
(1288, '6', '1876', '13712687572107', '1371268757', 0, 1),
(1289, '1', '2128', '13712696271985', '1371269627', 0, 1),
(1290, '6', '2139', '13712786955627', '1371278695', 0, 1),
(1291, '3', '2139', '13712787549484', '1371278754', 0, 1),
(1292, '3', '158', '13712821037511', '1371282103', 0, 0),
(1293, '3', '2192', '13712838147515', '1371283814', 0, 0),
(1294, '3', '2192', '13712841666017', '1371284166', 0, 0),
(1295, '1', '2192', '13712854672665', '1371285467', 0, 0),
(1296, '4', '1198', '13712854828289', '1371285482', 0, 0),
(1297, '3', '2216', '13712869922668', '1371286992', 0, 1),
(1298, '3', '769', '13712927817202', '1371292781', 0, 0),
(1299, '1', '1876', '13712932442855', '1371293244', 0, 1),
(1300, '1', '2270', '13712952944087', '1371295294', 0, 1),
(1301, '3', '536', '13712953769258', '1371295376', 0, 1),
(1302, '6', '2276', '13712961603774', '1371296160', 0, 1),
(1303, '6', '2276', '13712961808495', '1371296180', 0, 1),
(1304, '3', '2279', '13712978305492', '1371297830', 0, 1),
(1305, '3', '2057', '13712980235431', '1371298023', 0, 1),
(1306, '3', '2278', '13712988992230', '1371298899', 0, 1),
(1307, '1', '1804', '13712992217489', '1371299221', 0, 0),
(1308, '3', '2282', '13713010624259', '1371301062', 0, 1),
(1309, '3', '2284', '13713020729985', '1371302072', 0, 1),
(1310, '1', '81', '13713027949086', '1371302794', 0, 1),
(1311, '1', '2295', '13713036685768', '1371303668', 0, 1),
(1312, '6', '2295', '13713038001888', '1371303800', 0, 1),
(1313, '3', '2295', '13713041235843', '1371304123', 0, 1),
(1314, '3', '2300', '13713046057906', '1371304605', 0, 1),
(1315, '1', '2303', '13713047677631', '1371304767', 0, 1),
(1316, '1', '2306', '13713054934747', '1371305493', 0, 1),
(1317, '', '2311', '13713058629507', '1371305862', 0, 1),
(1318, '3', '2311', '13713058842713', '1371305884', 0, 1),
(1319, '4', '814', '13713064595801', '1371306459', 0, 0),
(1320, '6', '1045', '13713067786986', '1371306778', 0, 1),
(1321, '6', '1045', '13713068264577', '1371306826', 0, 1),
(1322, '6', '1045', '13713068741187', '1371306874', 0, 1),
(1323, '3', '1045', '13713069923999', '1371306992', 0, 1),
(1324, '1', '2342', '13713083995344', '1371308399', 0, 1),
(1325, '1', '2342', '13713084088731', '1371308408', 0, 1),
(1326, '3', '2342', '13713084873714', '1371308487', 0, 1),
(1327, '3', '2342', '13713089357535', '1371308935', 0, 1),
(1328, '3', '2354', '13713092742976', '1371309274', 0, 1),
(1329, '6', '2369', '13713102957265', '1371310295', 0, 1),
(1330, '1', '2369', '13713103269899', '1371310326', 0, 1),
(1331, '3', '2369', '13713103329407', '1371310332', 0, 1),
(1332, '3', '2369', '13713103412503', '1371310341', 0, 1),
(1333, '1', '1472', '13713106171896', '1371310617', 0, 1),
(1334, '3', '1472', '13713108028621', '1371310802', 0, 1),
(1335, '3', '2392', '13713114507343', '1371311450', 0, 1),
(1336, '3', '2392', '13713114533957', '1371311453', 0, 1),
(1337, '1', '2382', '13713116182152', '1371311618', 0, 1),
(1338, '1', '2402', '13713119756932', '1371311975', 0, 1),
(1339, '6', '2402', '13713120196024', '1371312019', 0, 1),
(1340, '3', '2402', '13713120702227', '1371312070', 0, 1),
(1341, '1', '2421', '13713133487545', '1371313348', 0, 1),
(1342, '6', '2001', '13713324418569', '1371332441', 0, 1),
(1343, '6', '2001', '13713324608335', '1371332460', 0, 1),
(1344, '6', '2001', '13713324739006', '1371332473', 0, 1),
(1345, '1', '45', '13713430586607', '1371343058', 0, 0),
(1346, '1', '137', '13713512732114', '1371351273', 0, 1),
(1347, '5', '2180', '13713516978459', '1371351697', 0, 0),
(1348, '6', '1920', '13713548314655', '1371354831', 0, 1),
(1349, '1', '1920', '13713549148802', '1371354914', 0, 1),
(1350, '6', '1920', '13713553687085', '1371355368', 0, 1),
(1351, '1', '689', '13713679711957', '1371367971', 0, 1),
(1352, '', '689', '13713681318378', '1371368131', 0, 1),
(1353, '1', '2054', '13713733659639', '1371373365', 0, 0),
(1354, '3', '2834', '13713737523583', '1371373752', 0, 1),
(1355, '3', '1971', '13713737641530', '1371373764', 0, 1),
(1356, '3', '896', '13713738376478', '1371373837', 0, 1),
(1357, '3', '2845', '13713806914958', '1371380691', 0, 1),
(1358, '1', '2845', '13713807416665', '1371380741', 0, 1),
(1359, '6', '2845', '13713809409165', '1371380940', 0, 1),
(1360, '3', '746', '13713817722916', '1371381772', 0, 0),
(1361, '3', '2392', '13713837427879', '1371383742', 0, 1),
(1362, '1', '2847', '13713843904779', '1371384390', 0, 1),
(1363, '1', '1141', '13713877675565', '1371387767', 0, 0),
(1364, '6', '1141', '13713877773811', '1371387777', 0, 1),
(1365, '6', '1141', '13713877812334', '1371387781', 0, 1),
(1366, '6', '1141', '13713877978148', '1371387797', 0, 1),
(1367, '6', '690', '13713883879410', '1371388387', 0, 1),
(1368, '1', '690', '13713884519895', '1371388451', 0, 1),
(1369, '6', '690', '13713885472466', '1371388547', 0, 1),
(1370, '3', '2848', '13713892555894', '1371389255', 0, 1),
(1371, '1', '1360', '13713892619792', '1371389261', 0, 1),
(1372, '6', '1360', '13713893446055', '1371389344', 0, 1),
(1373, '1', '2054', '13713918625675', '1371391862', 0, 0),
(1374, '3', '1442', '13713925334536', '1371392533', 0, 1),
(1375, '3', '2851', '13713933022157', '1371393302', 0, 0),
(1376, '6', '2851', '13713933913872', '1371393391', 0, 1),
(1377, '1', '2851', '13713934059859', '1371393405', 0, 1),
(1378, '3', '2855', '13713962606587', '1371396260', 0, 1),
(1379, '3', '2392', '13713963187824', '1371396318', 0, 1),
(1380, '1', '2856', '13713974894548', '1371397489', 0, 1),
(1381, '6', '2856', '13713977595733', '1371397759', 0, 1),
(1382, '3', '2856', '13713977911542', '1371397791', 0, 1),
(1383, '3', '2857', '13713989603282', '1371398960', 0, 1),
(1384, '3', '2859', '13714002685681', '1371400268', 0, 1),
(1385, '3', '1467', '13714008998851', '1371400899', 0, 1),
(1386, '3', '1467', '13714009012569', '1371400901', 0, 1),
(1387, '1', '1788', '13714060723407', '1371406072', 0, 1),
(1388, '1', '1788', '13714061108644', '1371406110', 0, 1),
(1389, '3', '2862', '13714299472011', '1371429947', 0, 1),
(1390, '1', '1788', '13714380963514', '1371438096', 0, 1),
(1391, '6', '692', '13714451307066', '1371445130', 0, 1),
(1392, '1', '676', '13714455192319', '1371445519', 0, 1),
(1393, '1', '2872', '13714464175026', '1371446417', 0, 0),
(1394, '6', '2872', '13714471619701', '1371447161', 0, 0),
(1395, '', '2872', '13714472452016', '1371447245', 0, 0),
(1396, '3', '2872', '13714472657818', '1371447265', 0, 0),
(1397, '6', '2872', '13714477947204', '1371447794', 0, 0),
(1398, '6', '2872', '13714477999892', '1371447799', 0, 0),
(1399, '6', '2872', '13714478024347', '1371447802', 0, 0),
(1400, '6', '2872', '13714478076348', '1371447807', 0, 0),
(1401, '6', '2872', '13714478112117', '1371447811', 0, 0),
(1402, '6', '2872', '13714478253715', '1371447825', 0, 0),
(1403, '1', '2872', '13714479343100', '1371447934', 0, 0),
(1404, '6', '2872', '13714482723854', '1371448272', 0, 0),
(1405, '3', '2874', '13714519812634', '1371451981', 0, 1),
(1406, '3', '2874', '13714520272580', '1371452027', 0, 1),
(1407, '', '2874', '13714523282400', '1371452328', 0, 0),
(1408, '1', '2874', '13714523397986', '1371452339', 0, 0),
(1409, '6', '365', '13714582576009', '1371458257', 0, 0),
(1410, '3', '365', '13714582744940', '1371458274', 0, 0),
(1411, '1', '2878', '13714621634749', '1371462163', 0, 1),
(1412, '1', '2878', '13714621732385', '1371462173', 0, 1),
(1413, '3', '2878', '13714624275098', '1371462427', 0, 1),
(1414, '3', '2879', '13714628481965', '1371462848', 0, 1),
(1415, '6', '2278', '13714652411199', '1371465241', 0, 1),
(1416, '3', '943', '13714684152780', '1371468415', 0, 1),
(1417, '3', '943', '13714687183231', '1371468718', 0, 1),
(1418, '3', '1971', '13714744396302', '1371474439', 0, 1),
(1419, '6', '2888', '13714770242696', '1371477024', 0, 1),
(1420, '3', '2888', '13714770663651', '1371477066', 0, 1),
(1421, '3', '2888', '13714771054565', '1371477105', 0, 1),
(1422, '1', '2893', '13714796461713', '1371479646', 0, 1),
(1423, '3', '2893', '13714799148271', '1371479914', 0, 1),
(1424, '6', '2893', '13714811174810', '1371481117', 0, 1),
(1425, '6', '2893', '13714811798260', '1371481179', 0, 1),
(1426, '3', '2898', '13714816701249', '1371481670', 0, 0),
(1427, '3', '2899', '13714816864451', '1371481686', 0, 1),
(1428, '1', '2899', '13714817436244', '1371481743', 0, 1),
(1429, '1', '2899', '13714817439192', '1371481743', 0, 1),
(1430, '3', '2899', '13714819293334', '1371481929', 0, 1),
(1431, '3', '2900', '13714846179563', '1371484617', 0, 1),
(1432, '1', '908', '13714916322712', '1371491632', 0, 1),
(1433, '3', '2937', '13715176197993', '1371517619', 0, 1),
(1434, '3', '2939', '13715239917147', '1371523991', 0, 1),
(1435, '3', '2945', '13715363482315', '1371536348', 0, 1),
(1436, '1', '2945', '13715364862948', '1371536486', 0, 1),
(1437, '3', '2944', '13715368039806', '1371536803', 0, 0),
(1438, '3', '2947', '13715381064800', '1371538106', 0, 1),
(1439, '6', '2947', '13715382747185', '1371538274', 0, 1),
(1440, '1', '171', '13715407447421', '1371540744', 0, 1),
(1441, '3', '2965', '13715436839536', '1371543683', 0, 0),
(1442, '3', '2047', '13715437419528', '1371543741', 0, 1),
(1443, '1', '1271', '13715477065915', '1371547706', 0, 1),
(1444, '1', '2969', '13715478517017', '1371547851', 0, 1),
(1445, '6', '2968', '13715479479527', '1371547947', 0, 0),
(1446, '1', '2968', '13715479674259', '1371547967', 0, 0),
(1447, '6', '2969', '13715486285252', '1371548628', 0, 1),
(1448, '3', '2969', '13715486533739', '1371548653', 0, 1),
(1449, '3', '98', '13715521755009', '1371552175', 0, 1),
(1450, '3', '2054', '13715538417174', '1371553841', 0, 0),
(1451, '3', '2054', '13715539001741', '1371553900', 0, 1),
(1452, '3', '2946', '13715729176309', '1371572917', 0, 1),
(1453, '3', '631', '13716065679097', '1371606567', 0, 1),
(1454, '6', '2024', '13716204068773', '1371620406', 0, 1),
(1455, '3', '45', '13716222243498', '1371622224', 0, 1),
(1456, '1', '1154', '13716273823909', '1371627382', 0, 0),
(1457, '1', '881', '13716396102407', '1371639610', 0, 1),
(1458, '6', '2058', '13716499981358', '1371649998', 0, 1),
(1459, '6', '2685', '13716763702597', '1371676370', 0, 1),
(1460, '3', '2685', '13716764778633', '1371676477', 0, 1),
(1461, '3', '2935', '13716891812684', '1371689181', 0, 1),
(1462, '1', '1449', '13716965283539', '1371696528', 0, 1),
(1463, '6', '1449', '13716966846884', '1371696684', 0, 1),
(1464, '6', '1449', '13716967255541', '1371696725', 0, 1),
(1465, '3', '2127', '13717156194726', '1371715619', 0, 0),
(1466, '6', '2127', '13717157169071', '1371715716', 0, 1),
(1467, '1', '2127', '13717157581813', '1371715758', 0, 1),
(1468, '6', '2127', '13717162432014', '1371716243', 0, 0),
(1469, '6', '479', '13717169395013', '1371716939', 0, 1),
(1470, '1', '2008', '13717185015233', '1371718501', 0, 1),
(1471, '3', '29', '13717350648042', '1371735064', 0, 1),
(1472, '6', '2847', '13717576382785', '1371757638', 0, 1),
(1473, '6', '1826', '13717747081196', '1371774708', 0, 1),
(1474, '6', '124', '13717750959884', '1371775095', 0, 1),
(1475, '3', '2069', '13717784771638', '1371778477', 0, 0),
(1476, '6', '2969', '13717826546893', '1371782654', 0, 0),
(1477, '', '129', '13717879499023', '1371787949', 0, 1),
(1478, '1', '656', '13717980359980', '1371798035', 0, 0),
(1479, '3', '596', '13718046624574', '1371804662', 0, 1),
(1480, '1', '1984', '13718097313360', '1371809731', 0, 1),
(1481, '3', '955', '13718660944289', '1371866094', 0, 1),
(1482, '3', '3151', '13724373011282', '1372437301', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `hi_p`
--

CREATE TABLE IF NOT EXISTS `hi_p` (
  `p_id` int(10) NOT NULL AUTO_INCREMENT,
  `p_title` varchar(200) DEFAULT NULL,
  `p_jj` varchar(254) DEFAULT NULL,
  `p_cont` text,
  `p_jf` varchar(10) DEFAULT NULL,
  `p_price` varchar(10) DEFAULT NULL,
  `p_tj` int(1) NOT NULL DEFAULT '0',
  `p_time` varchar(20) DEFAULT NULL,
  `p_file` varchar(200) DEFAULT NULL,
  `p_data` text,
  `p_px` varchar(10) NOT NULL DEFAULT '0',
  `p_xs` varchar(1) DEFAULT '0',
  PRIMARY KEY (`p_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `hi_p`
--

INSERT INTO `hi_p` (`p_id`, `p_title`, `p_jj`, `p_cont`, `p_jf`, `p_price`, `p_tj`, `p_time`, `p_file`, `p_data`, `p_px`, `p_xs`) VALUES
(6, 'wordpress建站课程', '原创新手3天打造专属自己的网站课程！', '<p>&nbsp;<span style="color: rgb(99, 99, 99); text-indent: 24px; margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; line-height: 21px; font-size: x-small; "><font color="#ff0000" style="margin: 0px; padding: 0px; ">积分</font></span><span style="text-indent: 24px; margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; line-height: 21px; color: rgb(64, 64, 64); font-size: x-small; ">可以靠通过</span><span style="color: rgb(99, 99, 99); text-indent: 24px; margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; line-height: 21px; font-size: x-small; "><font color="#ff0000" style="margin: 0px; padding: 0px; ">推广会员</font></span><span style="text-indent: 24px; margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; line-height: 21px; color: rgb(64, 64, 64); font-size: x-small; ">获得。</span><span style="color: rgb(99, 99, 99); text-indent: 24px; margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; line-height: 21px; font-size: x-small; "><font color="#ff0000" style="margin: 0px; padding: 0px; ">RMB</font></span><span style="text-indent: 24px; margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; line-height: 21px; color: rgb(64, 64, 64); font-size: x-small; ">购买可以通过直接</span><span style="color: rgb(99, 99, 99); text-indent: 24px; margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; line-height: 21px; font-size: x-small; "><font color="#ff0000" style="margin: 0px; padding: 0px; ">在线充值</font></span><span style="text-indent: 24px; margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; line-height: 21px; color: rgb(64, 64, 64); font-size: x-small; ">！直接</span><span style="color: rgb(99, 99, 99); text-indent: 24px; margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; line-height: 21px; font-size: x-small; "><font color="#ff0000" style="margin: 0px; padding: 0px; ">立即订购</font></span><span style="text-indent: 24px; margin: 0px; padding: 0px; font-family: tahoma, arial, 宋体, sans-serif; line-height: 21px; color: rgb(64, 64, 64); font-size: x-small; ">，即可下载！</span></p>\r\n<p style="margin: 1.12em 0px; padding: 0px; color: rgb(99, 99, 99); font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; line-height: 28px; text-indent: 24px; text-align: center; ">--------------------------------------------------------------------------------------------------------------------------------------</p>\r\n<p style="margin: 1.12em 0px; padding: 0px; font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; line-height: 28px; text-indent: 24px; text-align: center; "><font size="5"><font color="#636363">视频为</font><font color="#ff0000">超清格式</font><font color="#636363">，直接在线观看请选择</font><font color="#ff0000">超清模式</font><font color="#636363">观看</font></font></p>\r\n<p style="margin: 1.12em 0px; padding: 0px; font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; line-height: 28px; text-indent: 24px; text-align: center; "><font size="3"><font color="#636363">【wordpress建站课程第一节<strong>：在线学习</strong></font><strong><font color="#ff0000">源视频地址</font></strong><font color="#636363">】</font></font><font color="#636363">&nbsp;</font></p>\r\n<p style="margin: 1.12em 0px; padding: 0px; font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; line-height: 28px; text-indent: 24px; text-align: center; "><span style="color: rgb(99, 99, 99); font-size: medium; ">【wordpress建站课程第二节：<strong>在线学习</strong></span><font size="3" color="#ff0000"><strong>源视频地址</strong></font><span style="color: rgb(99, 99, 99); font-size: medium; ">】</span><span style="color: rgb(99, 99, 99); ">&nbsp;</span></p>\r\n<p style="margin: 1.12em 0px; padding: 0px; font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; line-height: 28px; text-indent: 24px; text-align: center; "><span style="color: rgb(99, 99, 99); font-size: medium; ">【wordpress建站课程第三节：<strong>在线学习</strong></span><font size="3" color="#ff0000"><strong>源视频地址</strong></font><span style="color: rgb(99, 99, 99); font-size: medium; ">】</span><font color="#636363">&nbsp;</font></p>\r\n<p style="margin: 1.12em 0px; padding: 0px; font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; line-height: 28px; text-indent: 24px; text-align: center; "><font color="#636363" style="color: rgb(99, 99, 99); font-size: medium; ">【wordpress建站课程第四节<strong>：在线学习</strong></font><strong style="font-size: medium; "><font color="#ff0000">源视频地址</font></strong><font color="#636363" style="color: rgb(99, 99, 99); font-size: medium; ">】</font><font color="#636363" style="color: rgb(99, 99, 99); ">&nbsp;</font></p>\r\n<p style="margin: 1.12em 0px; padding: 0px; font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; line-height: 28px; text-indent: 24px; text-align: center; "><font color="#636363" style="color: rgb(99, 99, 99); font-size: medium; ">【wordpress建站课程第五节<strong>：在线学习</strong></font><strong style="font-size: medium; "><font color="#ff0000">源视频地址</font></strong><font color="#636363" style="color: rgb(99, 99, 99); font-size: medium; ">】</font><span style="color: rgb(99, 99, 99); ">&nbsp;</span>&nbsp;</p>\r\n<p style="margin: 1.12em 0px; padding: 0px; text-indent: 24px; text-align: center; "><font color="#636363" style="color: rgb(99, 99, 99); font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; line-height: 28px; font-size: medium; ">【wordpress建站课程第六节<strong>：</strong></font><strong style="color: rgb(99, 99, 99); font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; font-size: medium; line-height: 28px; ">在线学习</strong><strong style="font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; line-height: 28px; font-size: medium; "><font color="#ff0000">源视频地址</font></strong><font color="#636363" style="color: rgb(99, 99, 99); font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; line-height: 28px; font-size: medium; ">】</font><span style="color: rgb(99, 99, 99); font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; line-height: 28px; ">&nbsp;</span>&nbsp;</p>\r\n<p style="margin: 1.12em 0px; padding: 0px; text-indent: 24px; text-align: center; "><font color="#636363" style="color: rgb(99, 99, 99); font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; line-height: 28px; font-size: medium; ">【wordpress建站课程第七节<strong>：</strong></font><strong style="color: rgb(99, 99, 99); font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; font-size: medium; line-height: 28px; ">在线学习</strong><strong style="font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; line-height: 28px; font-size: medium; "><font color="#ff0000">源视频地址</font></strong><font color="#636363" style="color: rgb(99, 99, 99); font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; line-height: 28px; font-size: medium; ">】</font><span style="color: rgb(99, 99, 99); font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; line-height: 28px; ">&nbsp;</span>&nbsp;</p>\r\n<p style="margin: 1.12em 0px; padding: 0px; text-indent: 24px; text-align: center; "><font color="#636363" style="color: rgb(99, 99, 99); font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; line-height: 28px; font-size: medium; ">【wordpress建站课程第八节<strong>：</strong></font><strong style="color: rgb(99, 99, 99); font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; font-size: medium; line-height: 28px; ">在线学习</strong><strong style="font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; line-height: 28px; font-size: medium; "><font color="#ff0000">源视频地址</font></strong><font color="#636363" style="color: rgb(99, 99, 99); font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; line-height: 28px; font-size: medium; ">】</font><span style="color: rgb(99, 99, 99); font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; line-height: 28px; ">&nbsp;</span>&nbsp;</p>\r\n<p style="margin: 1.12em 0px; padding: 0px; text-indent: 24px; text-align: center; "><font color="#636363" style="color: rgb(99, 99, 99); font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; line-height: 28px; font-size: medium; ">【wordpress建站课程第九节<strong>：</strong></font><strong style="color: rgb(99, 99, 99); font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; font-size: medium; line-height: 28px; ">在线学习</strong><strong style="font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; line-height: 28px; font-size: medium; "><font color="#ff0000">源视频地址</font></strong><font color="#636363" style="color: rgb(99, 99, 99); font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; line-height: 28px; font-size: medium; ">】</font><span style="color: rgb(99, 99, 99); font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; line-height: 28px; ">&nbsp;</span>&nbsp;</p>\r\n<p style="margin: 1.12em 0px; padding: 0px; text-indent: 24px; text-align: center; "><font color="#636363" style="color: rgb(99, 99, 99); font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; line-height: 28px; font-size: medium; ">【wordpress建站课程第十节<strong>：</strong></font><strong style="color: rgb(99, 99, 99); font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; font-size: medium; line-height: 28px; ">在线学习</strong><strong style="font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; line-height: 28px; font-size: medium; "><font color="#ff0000">源视频地址</font></strong><font color="#636363" style="color: rgb(99, 99, 99); font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; line-height: 28px; font-size: medium; ">】</font><span style="color: rgb(99, 99, 99); font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; line-height: 28px; ">&nbsp;</span>&nbsp;</p>\r\n<p style="margin: 1.12em 0px; padding: 0px; text-indent: 24px; text-align: center; ">&nbsp;</p>\r\n<p style="margin: 0px; padding: 0px; color: rgb(99, 99, 99); font-family: Tahoma, simsun, Verdana, Lucida, Arial, Helvetica, sans-serif; line-height: 28px; text-align: start; ">&nbsp;</p>\r\n<p style="margin: 1.12em 0px; padding: 0px; text-align: center; "><span style="margin: 0px; padding: 0px; ">------------------------------------------------------------------------------------------------------------------------------------</span></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>', '0', '0', 0, '1370530151', '/userfiles/Images/20130607/13705376674117.jpg', '点击返回，即可在线进入学习地址~！\r\n建站课程所需工具，请访问\r\n', '0', '');

-- --------------------------------------------------------

--
-- 表的结构 `hi_tx`
--

CREATE TABLE IF NOT EXISTS `hi_tx` (
  `t_id` int(10) NOT NULL AUTO_INCREMENT,
  `u_id` int(10) NOT NULL,
  `price` int(10) NOT NULL,
  `addtime` varchar(20) NOT NULL,
  `zt` int(1) NOT NULL,
  `orderid` varchar(20) NOT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=25 ;

--
-- 转存表中的数据 `hi_tx`
--

INSERT INTO `hi_tx` (`t_id`, `u_id`, `price`, `addtime`, `zt`, `orderid`) VALUES
(22, 2823, 100, '1371395271', 1, '13713952711929'),
(23, 2823, 1000, '1371395519', 1, '13713955193576'),
(24, 2823, 100, '1371649122', 1, '13716491226522');

-- --------------------------------------------------------

--
-- 表的结构 `hi_user`
--

CREATE TABLE IF NOT EXISTS `hi_user` (
  `u_id` int(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_pass` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `user_tui` varchar(20) NOT NULL,
  `jf` float NOT NULL,
  `qian` float NOT NULL,
  `add_time` varchar(20) NOT NULL,
  `u_ip` varchar(20) NOT NULL,
  `u_qx` int(1) NOT NULL,
  `alipay` varchar(200) NOT NULL,
  `alipayname` varchar(200) NOT NULL,
  `shdz` varchar(200) NOT NULL,
  `user_dlj` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`u_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=gbk AUTO_INCREMENT=3158 ;

--
-- 转存表中的数据 `hi_user`
--

INSERT INTO `hi_user` (`u_id`, `user_name`, `user_pass`, `email`, `user_tui`, `jf`, `qian`, `add_time`, `u_ip`, `u_qx`, `alipay`, `alipayname`, `shdz`, `user_dlj`) VALUES
(3156, '', 'e10adc3949ba59abbe56e057f20f883e', '123456@qq.com', '', 0, 0, '1372442261', '182.89.50.210', 2, '', '', '', '1'),
(3157, '', '17fb17fbfae0eaa1708cc90f612ef50c', '8888888@qq.com', '3156', 0, 0, '1372442468', '183.60.158.213', 3, '', '', '', '0');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
