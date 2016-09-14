<?php
require("../../inc/header.php");

/*
		SoftName : EmpireBak Version 2010
		Author   : wm_chief
		Copyright: Powered by www.phome.net
*/

DoSetDbChar('utf8');
E_D("DROP TABLE IF EXISTS `ecm_member`;");
E_C("CREATE TABLE `ecm_member` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `real_name` varchar(60) DEFAULT NULL,
  `gender` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `birthday` date DEFAULT NULL,
  `phone_tel` varchar(60) DEFAULT NULL,
  `phone_mob` varchar(60) DEFAULT NULL,
  `im_qq` varchar(60) DEFAULT NULL,
  `im_msn` varchar(60) DEFAULT NULL,
  `im_skype` varchar(60) DEFAULT NULL,
  `im_yahoo` varchar(60) DEFAULT NULL,
  `im_aliww` varchar(60) DEFAULT NULL,
  `reg_time` int(10) unsigned DEFAULT '0',
  `last_login` int(10) unsigned DEFAULT NULL,
  `last_ip` varchar(15) DEFAULT NULL,
  `logins` int(10) unsigned NOT NULL DEFAULT '0',
  `ugrade` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `portrait` varchar(255) DEFAULT NULL,
  `outer_id` int(10) unsigned NOT NULL DEFAULT '0',
  `activation` varchar(60) DEFAULT NULL,
  `feed_config` text NOT NULL,
  `growth` int(20) NOT NULL DEFAULT '0',
  `quan` int(100) NOT NULL,
  `lng` decimal(12,8) NOT NULL,
  `zoom` int(3) NOT NULL,
  `lat` decimal(12,8) NOT NULL,
  `sid` int(11) NOT NULL,
  `sname` varchar(150) NOT NULL,
  `is_qr` int(11) NOT NULL,
  `tuijian_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_name` (`user_name`),
  KEY `email` (`email`),
  KEY `outer_id` (`outer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8");
E_D("replace into `ecm_member` values('1','admin','admin@qq.com','7fef6171469e80d32c0559f88b377245','','0',NULL,NULL,NULL,'','',NULL,NULL,NULL,'1388016632','1435405494','0.0.0.0','23','1','','0',NULL,'','0','0','0.00000000','0','0.00000000','0','','0','0');");
E_D("replace into `ecm_member` values('2','seller','123456@qq.com','e10adc3949ba59abbe56e057f20f883e',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1388031020','1440972879','0.0.0.0','23','1',NULL,'0',NULL,'','0','0','0.00000000','0','0.00000000','0','','0','0');");
E_D("replace into `ecm_member` values('3','buyer','123456@qq.com','e10adc3949ba59abbe56e057f20f883e',NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1388031042','1435401922','0.0.0.0','4','1',NULL,'0',NULL,'','0','0','0.00000000','0','0.00000000','0','','0','0');");

require("../../inc/footer.php");
?>