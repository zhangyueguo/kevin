<?php
require("../../inc/header.php");

/*
		SoftName : EmpireBak Version 2010
		Author   : wm_chief
		Copyright: Powered by www.phome.net
*/

DoSetDbChar('utf8');
E_D("DROP TABLE IF EXISTS `ecm_wxkeyword`;");
E_C("CREATE TABLE `ecm_wxkeyword` (
  `kid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `kename` varchar(300) DEFAULT NULL,
  `kecontent` varchar(500) DEFAULT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1:文本 2：图文',
  `kyword` varchar(255) DEFAULT NULL,
  `titles` varchar(1000) DEFAULT NULL,
  `imageinfo` varchar(1000) DEFAULT NULL,
  `linkinfo` varchar(1000) DEFAULT NULL,
  `ismess` tinyint(1) DEFAULT NULL,
  `isfollow` tinyint(1) DEFAULT NULL,
  `iskey` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`kid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8");
E_D("replace into `ecm_wxkeyword` values('1','2',NULL,'','2',NULL,'a:4:{i:0;s:36:\"欢迎来到微创动力微信商城\";i:1;s:39:\"测试商品，点击进入测试购买\";i:2;s:30:\"演示微店铺，点击进入\";i:3;s:30:\"演示微商城，点击进入\";}','a:4:{i:0;s:45:\"data/files/mall/weixin/201406260253518453.jpg\";i:1;s:45:\"data/files/mall/weixin/201406260255406158.jpg\";i:2;s:45:\"data/files/mall/weixin/201406260255406158.jpg\";i:3;s:45:\"data/files/mall/weixin/201406260255406158.jpg\";}','a:4:{i:0;s:48:\"http://vmall.vchuang.cn/index.php?app=store&id=2\";i:1;s:49:\"http://vmall.vchuang.cn/index.php?app=goods&id=99\";i:2;s:48:\"http://vmall.vchuang.cn/index.php?app=store&id=2\";i:3;s:23:\"http://vmall.vchuang.cn\";}',NULL,'1',NULL);");
E_D("replace into `ecm_wxkeyword` values('5','2','微店铺','','2','微店铺','a:2:{i:0;s:30:\"演示微店铺，点击进入\";i:1;s:39:\"测试商品，点击进入测试购买\";}','a:2:{i:0;s:45:\"data/files/mall/weixin/201406260253518453.jpg\";i:1;s:45:\"data/files/mall/weixin/201406260255406158.jpg\";}','a:2:{i:0;s:48:\"http://vmall.vchuang.cn/index.php?app=store&id=2\";i:1;s:49:\"http://vmall.vchuang.cn/index.php?app=goods&id=99\";}',NULL,NULL,'1');");
E_D("replace into `ecm_wxkeyword` values('4','2',NULL,'','2',NULL,'a:2:{i:0;s:36:\"欢迎来到微创动力微信商城\";i:1;s:39:\"测试商品，点击进入测试购买\";}','a:2:{i:0;s:45:\"data/files/mall/weixin/201406260253518453.jpg\";i:1;s:45:\"data/files/mall/weixin/201406260255406158.jpg\";}','a:2:{i:0;s:48:\"http://vmall.vchuang.cn/index.php?app=store&id=2\";i:1;s:49:\"http://vmall.vchuang.cn/index.php?app=goods&id=99\";}','1',NULL,NULL);");
E_D("replace into `ecm_wxkeyword` values('6','2','微商城','','2','微商城','a:1:{i:0;s:30:\"演示微商城，点击进入\";}','a:1:{i:0;s:45:\"data/files/mall/weixin/201406260253518453.jpg\";}','a:1:{i:0;s:23:\"http://vmall.vchuang.cn\";}',NULL,NULL,'1');");
E_D("replace into `ecm_wxkeyword` values('7','2','关于我们','本演示站官方淘宝店：微创动力精品网站源码，淘宝旺旺：微创动力源码，客服QQ：361818525。请亲们仔细辨别，以免受骗！','1','关于我们','','','',NULL,NULL,'1');");

require("../../inc/footer.php");
?>