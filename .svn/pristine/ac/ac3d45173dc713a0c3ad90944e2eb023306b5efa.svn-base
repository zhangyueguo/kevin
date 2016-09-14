<?php
require("../../inc/header.php");

/*
		SoftName : EmpireBak Version 2010
		Author   : wm_chief
		Copyright: Powered by www.phome.net
*/

DoSetDbChar('utf8');
E_D("DROP TABLE IF EXISTS `ecm_deposit_account`;");
E_C("CREATE TABLE `ecm_deposit_account` (
  `account_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `account` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `frozen` decimal(10,2) NOT NULL,
  `real_name` varchar(30) NOT NULL,
  `pay_status` varchar(3) NOT NULL DEFAULT 'off',
  `add_time` int(11) NOT NULL,
  `last_update` int(11) NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=MyISAM AUTO_INCREMENT=727 DEFAULT CHARSET=utf8");
E_D("replace into `ecm_deposit_account` values('726','2','1439623269@qq.com','e10adc3949ba59abbe56e057f20f883e','0.00','0.00','seller','ON','1439623269','0');");

require("../../inc/footer.php");
?>