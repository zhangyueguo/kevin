<?php
/**
 * 个人发票控制器
 */
class Company_invoiceApp extends CompanybaseApp
{
	 function __construct()
    {
        $this->Company_invoiceApp();
    }

    function Company_invoiceApp()
    {
		
        parent::__construct();
    }


	function index(){
		//获取我的发票列表
		$this->_get_orders();

		/* 当前用户中心菜单 */
		$this->_curitem('company_invoice');
        $this->_curmenu('my_invoice');
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
        $this->display('company_invoice.index.html');
	}

	/**
	 * 发票申请
	 */
	function apply_invoice(){
		$order_id = $_POST['oid'];
		$order_type = $_POST['type'];
		$model_invoice =& m('invoice');
		$data = array(
			'order_id'		=> $order_id,
			'invoice_tid'	=> $tid,
			'type'			=> $order_type,
			'status'		=> '1',
			'apply_date'	=> time(),
			'apply_uid'		=> $this->visitor->get('user_id'),
		);
		$result = $model_invoice->add($data);
		//exit('success');
		if($result){
			echo 'success';
		}
		
	}

	/**
     *    获取订单列表
     *
     *    @author    Garbin
     *    @return    void
     */
    function _get_orders()
    {
        $page = $this->_get_page(10);
        $model_order =& m('order');
        !$_GET['type'] && $_GET['type'] = 'all_orders';
        
        
    	$orders = $model_order->findAll(array(
            'conditions'    => "buyer_id=" . $this->visitor->get('user_id') . " AND status >= 20 AND order_type = 2",
            'fields'        => 'this.*',
            'count'         => true,
            'limit'         => $page['limit'],
            'order'         => 'add_time DESC',
        ));

        $model_invoice =& m('invoice');
        $sql_invoice = "select * from ecm_invoice where apply_uid = ". $this->visitor->get('user_id');
        //echo $sql_invoice;exit;
        $invoice = $model_invoice->getAll($sql_invoice);

        foreach($orders as $key => $value){
        	foreach($invoice as $k => $val){
        		if($value['order_id'] == $val['order_id']){
        			$orders[$key]['invoice_status'] = $val['status'];
        		}
        	}
        }
		
        $page['item_count'] = $model_order->getCount();
        
        $this->assign('type', $_GET['type']);
        $this->assign('orders', $orders);
        $this->_format_page($page);
        $this->assign('page_info', $page);
    }

	function _get_member_submenu()
    {
        $menus = array(
            array(
                'name'  => 'my_invoice',
                'url'   => 'index.php?app=company_invoice',
                'text'	=> '我的发票',
            ),
        );
        return $menus;
    }

	
}


?>