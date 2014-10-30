<?php
require("../../inc/header.php");

/*
		SoftName : EmpireBak Version 2010
		Author   : wm_chief
		Copyright: Powered by www.phome.net
*/

DoSetDbChar('utf8');
E_D("DROP TABLE IF EXISTS `fanwe_supplier_location_images`;");
E_C("CREATE TABLE `fanwe_supplier_location_images` (
  `id` int(11) NOT NULL auto_increment,
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
  PRIMARY KEY  (`id`),
  KEY `uid` USING BTREE (`user_id`),
  KEY `supplier_location_id` USING BTREE (`supplier_location_id`),
  KEY `dp_id` USING BTREE (`dp_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8");

require("../../inc/footer.php");
?>