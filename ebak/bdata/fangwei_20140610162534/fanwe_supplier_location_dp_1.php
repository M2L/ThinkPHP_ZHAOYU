<?php
require("../../inc/header.php");

/*
		SoftName : EmpireBak Version 2010
		Author   : wm_chief
		Copyright: Powered by www.phome.net
*/

DoSetDbChar('utf8');
E_D("DROP TABLE IF EXISTS `fanwe_supplier_location_dp`;");
E_C("CREATE TABLE `fanwe_supplier_location_dp` (
  `id` int(11) NOT NULL auto_increment,
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
  `kb_create_time` varchar(20) default '',
  `kb_tags` varchar(255) default '',
  `is_index` tinyint(1) NOT NULL,
  `is_buy` tinyint(1) NOT NULL,
  `from_data` varchar(255) NOT NULL,
  `rel_app_index` varchar(255) NOT NULL,
  `rel_route` varchar(255) NOT NULL,
  `rel_param` varchar(255) NOT NULL,
  `message_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `user_id` USING BTREE (`user_id`),
  KEY `supplier_location_id` USING BTREE (`supplier_location_id`),
  KEY `is_img` USING BTREE (`is_img`),
  KEY `is_best` USING BTREE (`is_best`),
  KEY `is_top` USING BTREE (`is_top`),
  KEY `good_count` USING BTREE (`good_count`),
  KEY `bad_count` USING BTREE (`bad_count`),
  KEY `reply_count` USING BTREE (`reply_count`),
  KEY `avg_price` USING BTREE (`avg_price`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8");
E_D("replace into `fanwe_supplier_location_dp` values('1','上周去吃过，感觉不错','上周去吃过，感觉不错。推荐这家餐厅[坏笑]','1333241498','4','44','0','0','0','1','0','0','0','15','130.0000','','','','0','0','','','','','0');");
E_D("replace into `fanwe_supplier_location_dp` values('2','非常好','非常好非常好非常好非常好非常好非常好非常好','1333241553','5','44','0','0','0','1','0','0','0','15','0.0000','','','','0','0','','','','','0');");
E_D("replace into `fanwe_supplier_location_dp` values('3','一般般一般般','一般般一般般一般般一般般一般般一般般一般般一般般一般般一般般一般般一般般一般般一般般','1333241576','1','44','0','0','0','1','0','0','0','15','0.0000','','','','0','0','','','','','0');");

require("../../inc/footer.php");
?>