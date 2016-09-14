<?php
require("../../inc/header.php");

/*
		SoftName : EmpireBak Version 2010
		Author   : wm_chief
		Copyright: Powered by www.phome.net
*/

DoSetDbChar('utf8');
E_D("DROP TABLE IF EXISTS `ecm_wxmenu`;");
E_C("CREATE TABLE `ecm_wxmenu` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `tags` varchar(50) DEFAULT NULL,
  `pid` smallint(4) unsigned NOT NULL DEFAULT '0',
  `spid` varchar(50) DEFAULT NULL,
  `add_time` int(10) NOT NULL DEFAULT '0',
  `items` int(10) unsigned NOT NULL DEFAULT '0',
  `likes` varchar(100) DEFAULT NULL,
  `weixin_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0:click 1:viwe',
  `ordid` tinyint(3) unsigned NOT NULL DEFAULT '255',
  `weixin_status` tinyint(1) NOT NULL DEFAULT '0',
  `weixin_keyword` varchar(255) DEFAULT NULL COMMENT '关键词',
  `weixin_key` varchar(255) DEFAULT NULL COMMENT 'key值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8");
E_D("replace into `ecm_wxmenu` values('2','2','微商城',' ','0','0','1422889277','0','','0','255','1','微商城','wsc123');");
E_D("replace into `ecm_wxmenu` values('3','2','微店铺',' ','0','0','1422889296','0','','0','255','1','微店铺','wdp123');");
E_D("replace into `ecm_wxmenu` values('4','2','关于我们',' ','0','0','1422889308','0','','0','255','1','关于我们','gywm');");
E_D("replace into `ecm_wxmenu` values('5','2','演示店铺',' ','3','3|','1422889337','0',' ','0','255','1','微店铺','ysdp123');");

require("../../inc/footer.php");
?>