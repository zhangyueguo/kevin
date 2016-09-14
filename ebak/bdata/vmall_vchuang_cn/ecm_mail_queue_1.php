<?php
require("../../inc/header.php");

/*
		SoftName : EmpireBak Version 2010
		Author   : wm_chief
		Copyright: Powered by www.phome.net
*/

DoSetDbChar('utf8');
E_D("DROP TABLE IF EXISTS `ecm_mail_queue`;");
E_C("CREATE TABLE `ecm_mail_queue` (
  `queue_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mail_to` varchar(150) NOT NULL DEFAULT '',
  `mail_encoding` varchar(50) NOT NULL DEFAULT '',
  `mail_subject` varchar(255) NOT NULL DEFAULT '',
  `mail_body` text NOT NULL,
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `err_num` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) NOT NULL DEFAULT '0',
  `lock_expiry` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`queue_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8");
E_D("replace into `ecm_mail_queue` values('8','','utf-8','微创动力微信商城提醒:您有一个新订单需要处理','<p>\r\n<p>尊敬的超级店铺:</p>\r\n<p>您的新订单号为1517713302，请尽快处理。</p>\r\n<p>总价:￥0.10顾客详细:<br>名字:超级买家(手机:8888888电话:)<br>物品清单:<li id=goods_name>测试商品　数量:1　单价:￥0.10</li><br>收货地址:中国请如实填写收货人详细地址<br>配送方式:包邮<br />备注:<br />下单时间:2015-06-28 02:45</p>\r\n<p>查看订单详细信息请点击以下链接</p>\r\n<p><a href=\"http://localhost/index.php?app=seller_order&amp;act=view&amp;order_id=3\">http://localhost/index.php?app=seller_order&amp;act=view&amp;order_id=3</a></p>\r\n<p>查看您的订单列表管理页请点击以下链接</p>\r\n<p><a href=\"http://localhost/index.php?app=seller_order\">http://localhost/index.php?app=seller_order</a></p>\r\n<p>微创动力微信商城</p>\r\n<p style=\"text-align: right;\">2015-06-28 02:45</p>\r\n</p>','1','1','1435401958','1435401988');");
E_D("replace into `ecm_mail_queue` values('7','123456@qq.com','utf-8','微创动力微信商城提醒:您有一个新订单需要处理','<p>\r\n<p>尊敬的超级店铺:</p>\r\n<p>您的新订单号为1517713302，请尽快处理。</p>\r\n<p>总价:￥0.10顾客详细:<br>名字:超级买家(手机:8888888电话:)<br>物品清单:<li id=goods_name>测试商品　数量:1　单价:￥0.10</li><br>收货地址:中国请如实填写收货人详细地址<br>配送方式:包邮<br />备注:<br />下单时间:2015-06-28 02:45</p>\r\n<p>查看订单详细信息请点击以下链接</p>\r\n<p><a href=\"http://localhost/index.php?app=seller_order&amp;act=view&amp;order_id=3\">http://localhost/index.php?app=seller_order&amp;act=view&amp;order_id=3</a></p>\r\n<p>查看您的订单列表管理页请点击以下链接</p>\r\n<p><a href=\"http://localhost/index.php?app=seller_order\">http://localhost/index.php?app=seller_order</a></p>\r\n<p>微创动力微信商城</p>\r\n<p style=\"text-align: right;\">2015-06-28 02:45</p>\r\n</p>','1','1','1435401958','1435401988');");
E_D("replace into `ecm_mail_queue` values('6','123456@qq.com','utf-8','微创动力微信商城提醒:您的订单已生成','<p>尊敬的buyer:</p>\r\n<p style=\"padding-left: 30px;\">您在微创动力微信商城上下的订单已生成，订单号1517713302。</p>\r\n<p style=\"padding-left: 30px;\">查看订单详细信息请点击以下链接</p>\r\n<p style=\"padding-left: 30px;\"><a href=\"http://localhost/index.php?app=buyer_order&amp;act=view&amp;order_id=3\">http://localhost/index.php?app=buyer_order&amp;act=view&amp;order_id=3</a></p>\r\n<p style=\"text-align: right;\">微创动力微信商城</p>\r\n<p style=\"text-align: right;\">2015-06-28 02:45</p>','1','1','1435401957','1435401987');");

require("../../inc/footer.php");
?>