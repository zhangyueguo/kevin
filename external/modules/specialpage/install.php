<?php

    /**
     * 这里可以放一些安装模块时需要执行的代码，比如新建表，新建目录、文件之类的
     */

    $db = & db();
    $all_tables = array();
    $query_tables = $db->getAll("show tables LIKE '". mysql_like_quote(DB_PREFIX) . "%'");
    foreach ($query_tables as $t)
    {
        $all_tables[] = current($t);
    }

    if (!in_array(DB_PREFIX . 'specialpage', $all_tables))
    {
        $db->query("CREATE TABLE `ecm_specialpage` (
          `spec_id` int(10) unsigned NOT NULL auto_increment,
          `name` varchar(255) NOT NULL,
          `description` varchar(255) NOT NULL,
          `category` varchar(255) NOT NULL,
          `starttime` int(10) NOT NULL,
          `endtime` int(10) NOT NULL,
          `sgrades` varchar(255) NOT NULL,
          `posters` text NOT NULL,
          PRIMARY KEY  (`spec_id`)
        ) ENGINE=MyISAM");
    }

    if (!in_array(DB_PREFIX . 'specialpage_goods', $all_tables))
    {
        $db->query("CREATE TABLE `ecm_specialpage_goods` (
          `goods_id` int(10) unsigned NOT NULL,
          `verified` tinyint(1) NOT NULL,
          `category` varchar(255) NOT NULL,
          `spec_id` int(10) NOT NULL,
          `sort_order` tinyint(3) unsigned NOT NULL default '255',
          `add_time` int(10) unsigned NOT NULL,
          PRIMARY KEY  (`spec_id`,`goods_id`)
        ) ENGINE=MyISAM");
    }


    /**
     * 对 MYSQL LIKE 的内容进行转义
     *
     * @access      public
     * @param       string      string  内容
     * @return      string
     */
    function mysql_like_quote($str)
    {
        return strtr($str, array("\\\\" => "\\\\\\\\", '_' => '\_', '%' => '\%'));
    }

?>