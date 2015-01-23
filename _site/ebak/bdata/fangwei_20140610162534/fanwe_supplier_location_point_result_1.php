<?php
require("../../inc/header.php");

/*
		SoftName : EmpireBak Version 2010
		Author   : wm_chief
		Copyright: Powered by www.phome.net
*/

DoSetDbChar('utf8');
E_D("DROP TABLE IF EXISTS `fanwe_supplier_location_point_result`;");
E_C("CREATE TABLE `fanwe_supplier_location_point_result` (
  `group_id` int(11) NOT NULL,
  `avg_point` float(14,4) NOT NULL,
  `supplier_location_id` int(11) NOT NULL,
  `total_point` int(11) NOT NULL,
  PRIMARY KEY  (`group_id`,`supplier_location_id`),
  KEY `group_id` USING BTREE (`group_id`),
  KEY `dp_id` USING BTREE (`total_point`),
  KEY `avg_point` USING BTREE (`avg_point`),
  KEY `total_point` USING BTREE (`total_point`),
  KEY `supplier_location_id` USING BTREE (`supplier_location_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8");
E_D("replace into `fanwe_supplier_location_point_result` values('1','3.0000','15','3');");
E_D("replace into `fanwe_supplier_location_point_result` values('2','4.0000','15','4');");

require("../../inc/footer.php");
?>