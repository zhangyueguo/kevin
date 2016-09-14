<?php

class DefaultApp extends MallbaseApp
{
    function index()
    {
        $this->assign('index', 1); // 标识当前页面是首页，用于设置导航状态
        $this->assign('icp_number', Conf::get('icp_number'));
		
		
		if ($_GET['tuijian_id'])
		{
			$_SESSION['referid']=$_GET['tuijian_id'];
		}
      
	  	if ($_GET['tuijian_id'])
		{
			$_SESSION['tuijian_id']=$_GET['tuijian_id'];
		}

        $this->_config_seo(array(
            'title' => Conf::get('site_title'),
        ));
        $this->assign('page_description', Conf::get('site_description'));
        $this->assign('page_keywords', Conf::get('site_keywords'));
        $this->display('index.html');
    }
    function wapview()
    {
        /* 店铺预览 */
        $this->assign('id', intval($_GET['id']));
        $this->display('index.wapview.html');
    }
    
    function version(){
        echo 'ecmall_140525_687010903011654';
    }
	
	function back_login()
	{
		$id = empty($_GET['id']) ? 0 : intval($_GET['id']);
		$key = trim($_GET['key']);
		if(!$id || empty($key))
		{
			header('Location: index.php');
			return;
		}
		$user_mod = &m('member');
		$user = $user_mod->get($id);
		$check_key = md5($user['user_id'].$user['user_name'].$user['password'].$user['last_login'].$user['last_ip']);
		if($key == $check_key)
		{
			/* 同步登陆外部系统 */
			$ms =& ms();
			 /* 通过验证，执行登陆操作 */
			$this->_do_login($id);
	
			/* 同步登陆外部系统 */
			$synlogin = $ms->user->synlogin($id);
	
			$this->show_message(Lang::get('login_successed'),
					'back_before_login', 'index.php?app=member'
				);
		}
		else
		{
			header('Location: index.php');
			return;
		}
	}
}

?>