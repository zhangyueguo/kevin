<?php
/**
 * 个人发票控制器
 */
class My_creditApp extends PersonalbaseApp
{
	 function __construct()
    {
        $this->My_creditApp();
    }

    function My_creditApp()
    {
		
        parent::__construct();
    }


	function index(){
		//获取我的发票列表
		//$this->_get_orders();

		/* 当前用户中心菜单 */
		$this->_curitem('my_credit');
        $this->_curmenu('order_list');
        $this->_config_seo('title', '我的发票 - 财务管理');
        $this->import_resource(array(
            'script' => array(
                array(
                    'path' => 'dialog/dialog.js',
                    'attr' => 'id="dialog_js"',
                ),
                array(
                    'path' => 'jquery.ui/jquery.ui.js',
                    'attr' => '',
                ),
                array(
                    'path' => 'jquery.ui/i18n/' . i18n_code() . '.js',
                    'attr' => '',
                ),
                array(
                    'path' => 'jquery.plugins/jquery.validate.js',
                    'attr' => '',
                ),
            ),
            'style' =>  'jquery.ui/themes/ui-lightness/jquery.ui.css',
        ));

        /* 显示订单列表 */
        $this->display('my_credit.index.html');
	}

	/**
     *    获取订单列表
     *
     *    @author    Garbin
     *    @return    void
     */
    

	function _get_member_submenu()
    {
        $menus = array(
            array(
                'name'  => 'my_credit',
                'url'   => 'index.php?app=my_credit',
                'text'	=> '信用授权',
            ),
        );
        return $menus;
    }

	
}


?>