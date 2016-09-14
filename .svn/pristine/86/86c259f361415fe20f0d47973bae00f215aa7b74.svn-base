<?php
require("../../inc/header.php");

/*
		SoftName : EmpireBak Version 2010
		Author   : wm_chief
		Copyright: Powered by www.phome.net
*/

DoSetDbChar('utf8');
E_D("DROP TABLE IF EXISTS `ecm_consumer_service`;");
E_C("CREATE TABLE `ecm_consumer_service` (
  `c_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `store_id` int(10) unsigned NOT NULL DEFAULT '0',
  `c_s_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `deposit_quota` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `store_id` (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8");

require("../../inc/footer.php");
?>