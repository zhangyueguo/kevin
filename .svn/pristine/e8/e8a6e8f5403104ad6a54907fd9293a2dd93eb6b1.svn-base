<?php
require("../../inc/header.php");

/*
		SoftName : EmpireBak Version 2010
		Author   : wm_chief
		Copyright: Powered by www.phome.net
*/

DoSetDbChar('utf8');
E_D("DROP TABLE IF EXISTS `ecm_message`;");
E_C("CREATE TABLE `ecm_message` (
  `msg_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_id` int(10) unsigned NOT NULL DEFAULT '0',
  `to_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `last_update` int(10) unsigned NOT NULL DEFAULT '0',
  `new` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`msg_id`),
  KEY `from_id` (`from_id`),
  KEY `to_id` (`to_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8");
E_D("replace into `ecm_message` values('1','0','2','','恭喜，您的店铺已开通，赶快来用户中心发布商品吧。','1388031275','1388031275','0','0','3');");
E_D("replace into `ecm_message` values('2','0','2','','请尽快到“已结束的团购”完成该团购活动，以便买家可以完成交易，如结束后5天未确认完成，该活动将被自动取消,查看[url=http://localhost/index.php?app=seller_groupbuy&state=end]已结束的团购[/url]','1439594453','1439594453','1','0','3');");
E_D("replace into `ecm_message` values('3','0','1','','团购活动结束5天后卖家未确认完成，活动自动取消，[url=http://localhost/index.php?app=groupbuy&amp;id=1]查看详情[/url]','1439594453','1439594453','1','0','3');");

require("../../inc/footer.php");
?>