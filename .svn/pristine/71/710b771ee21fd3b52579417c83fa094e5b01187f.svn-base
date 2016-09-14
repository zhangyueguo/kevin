<?php
require("../../inc/header.php");

/*
		SoftName : EmpireBak Version 2010
		Author   : wm_chief
		Copyright: Powered by www.phome.net
*/

DoSetDbChar('utf8');
E_D("DROP TABLE IF EXISTS `ecm_sessions`;");
E_C("CREATE TABLE `ecm_sessions` (
  `sesskey` char(32) NOT NULL DEFAULT '',
  `expiry` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `adminid` int(11) NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL DEFAULT '',
  `data` char(255) NOT NULL DEFAULT '',
  `is_overflow` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sesskey`),
  KEY `expiry` (`expiry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8");
E_D("replace into `ecm_sessions` values('eb9f1cb343e1fc5390b4e17d585c1c62','1440974697','0','0','0.0.0.0','user_info|a:6:{s:7:\"user_id\";s:1:\"2\";s:9:\"user_name\";s:6:\"seller\";s:8:\"reg_time\";s:10:\"1388031020\";s:10:\"last_login\";s:10:\"1440972879\";s:7:\"last_ip\";s:7:\"0.0.0.0\";s:8:\"store_id\";s:1:\"2\";}wapstore|s:0:\"\";wapstore_id|i:2;','0');");

require("../../inc/footer.php");
?>