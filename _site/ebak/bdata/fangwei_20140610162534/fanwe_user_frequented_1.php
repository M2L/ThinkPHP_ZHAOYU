<?php
require("../../inc/header.php");

/*
		SoftName : EmpireBak Version 2010
		Author   : wm_chief
		Copyright: Powered by www.phome.net
*/

DoSetDbChar('utf8');
E_D("DROP TABLE IF EXISTS `fanwe_user_frequented`;");
E_C("CREATE TABLE `fanwe_user_frequented` (
  `id` int(11) NOT NULL auto_increment,
  `uid` int(11) default '0' COMMENT '员会ID',
  `title` varchar(50) default NULL,
  `addr` varchar(255) default NULL,
  `xpoint` float(12,6) default '0.000000' COMMENT 'longitude',
  `ypoint` float(12,6) default '0.000000' COMMENT 'latitude',
  `latitude_top` float(12,6) default NULL,
  `latitude_bottom` float(12,6) default NULL,
  `longitude_left` float(12,6) default NULL,
  `longitude_right` float(12,6) default NULL,
  `zoom_level` int(5) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8");

require("../../inc/footer.php");
?>