<?php
require("../../inc/header.php");

/*
		SoftName : EmpireBak Version 2010
		Author   : wm_chief
		Copyright: Powered by www.phome.net
*/

DoSetDbChar('utf8');
E_D("DROP TABLE IF EXISTS `ecm_wxconfig`;");
E_C("CREATE TABLE `ecm_wxconfig` (
  `w_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `appid` varchar(255) DEFAULT NULL,
  `appsecret` varchar(255) DEFAULT NULL,
  `type` tinyint(10) NOT NULL,
  `name` varchar(60) NOT NULL,
  `pic` varchar(255) NOT NULL,
  PRIMARY KEY (`w_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8");
E_D("replace into `ecm_wxconfig` values('1','2','http://vmall.vchuang.cn/index.php?app=weixin&id=2','R58XBq30','wx51e927c5decb591d','02f934f7a02d50e748a3ad6a62158ad7','0','','');");

require("../../inc/footer.php");
?>