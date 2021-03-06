<?php
/**
 * 买家中心记账单
 */
class Billing_order_sellerApp extends BusinessbaseApp
{
	protected $_billing_mod;
	protected $_order_billing_mod;
	function __construct(){
		$this->Billing_order_sellerApp();
	}

	public function Billing_order_sellerApp(){
		parent::__construct();
		$this->_billing_mod =& m('billing');
		$this->_order_billing_mod =& m('order_billing');
	}

	public function index(){
		//获取我的记账列表
		$info = $this->_get_billing();
        $arr = array();
        if(!empty($info)){
            foreach ($info as $key => $value) {
                //if($value['buyer_id'])
            }
        }

        $this->assign('order_billing',$info);


		/* 当前用户中心菜单 */
		$this->_curitem('billing_order_seller');
        $this->_curmenu('billing_order_seller');
        $this->_config_seo('title', '记账单 - 财务管理');

        $this->display('seller_billing.index.html');
	}

	/*public function _get_billing(){
        $shopid = $this->visitor->get('store_id');
		$sql = "SELECT expiration_time,limit_money FROM ecm_billing WHERE shopid = ".$shopid;
		$result = $this->_order_billing_mod->getAll($sql);
        if(!empty($result)){

            foreach ($result as $key => $value) {
                $cutoff_time = $value['expiration_time']-$value['pay_time'];
                $result[$key]['cutoff_time'] = intval($cutoff_time/86400);
            }
        }
		print_r($result);
        return $result;
	}*/




    public function _get_billing(){
        $shopid = $this->visitor->get('store_id');
        $sql = "SELECT bil.uid,ord.*,bil.expiration_time,bil.limit_money,bil.companyid,bil.id as bid,bil.status as bstatus FROM ecm_order ord LEFT JOIN ecm_billing bil ON (bil.uid = ord.buyer_id OR bil.companyid = ord.company_id AND bil.shopid = ord.seller_id) WHERE payment_id = -1 AND ord.seller_id = ".$shopid." ORDER BY bil.status asc,bil.expiration_time asc";//." AND ord.status >= 20";       //正式使用后开启
        $result = $this->_order_billing_mod->getAll($sql);
        //print_r($result);
        $arr = array();
        if(!empty($result)){
            foreach ($result as $key => $value) {
                $cutoff_time = $value['expiration_time']-time();
                $result[$key]['cutoff_time'] = intval($cutoff_time/86400);

                foreach ($arr as $k => $val) {
                    if($result[$key]['company_id'] == $arr[$k]['companyid'] && $result[$key]['order_type'] == $arr[$k]['order_type'] && !empty($arr[$k]['companyid']) && $arr[$k]['order_type'] == 2){
                        $result[$key]['order_amount'] += $arr[$k]['order_amount'];
                        unset($result[$k]);
                    }

                    if($result[$key]['buyer_id'] == $arr[$k]['id'] && $result[$key]['order_type'] == $arr[$k]['order_type'] && $arr[$k]['order_type'] == 1){
                        $result[$key]['order_amount'] += $arr[$k]['order_amount'];
                        unset($result[$k]);
                    }
                }
                

                $arr[$key]['id'] = $value['buyer_id'];
                $arr[$key]['companyid'] = $value['company_id'];
                $arr[$key]['order_type'] = $value['order_type'];
                $arr[$key]['order_amount'] = $value['order_amount'];
                
            }

        }
        //print_r($result);
        //print_r($arr);
        return $result;
    }



    /**
     * 买家详细记账单
     */
    public function billing_show(){
        /* 当前用户中心菜单 */
        $this->_curitem('billing_order_seller');
        $this->_curmenu('billing_order_seller');
        $this->_config_seo('title', '记账单 - 财务管理');


        if($_GET['pid']){
            $sql = "SELECT * FROM ecm_order where buyer_id = ".$_GET['pid']." AND payment_id = -1";// AND status >= 20";//正式上线后开启
            $result = $this->_order_billing_mod->getAll($sql);
        }else if($_GET['cid']){
            $sql = "SELECT * FROM ecm_order where company_id = ".$_GET['cid']." AND payment_id = -1";// AND status >= 20";//正式上线后开启
            $result = $this->_order_billing_mod->getAll($sql);
        }

        $this->assign('infos',$result);
        $this->display('billing_order.show.html');
    }


	/**
	 * 受理记账单
	 */
	public function accept(){
		/* 当前用户中心菜单 */
		$this->_curitem('billing_order_seller');
        $this->_curmenu('billing_apply');
        $this->_config_seo('title', '受理记账单 - 财务管理');


        $minfo['user_id'] = $this->visitor->get('user_id');

        $store_id = $this->visitor->get('store_id');

        //申请中的记账单列表
        $sql = "SELECT bill.*,com.companyname,m.real_name,m.user_name FROM ecm_billing bill LEFT JOIN ecm_company com ON bill.companyid = com.id LEFT JOIN ecm_member m ON m.user_id = bill.uid where shopid = ".$store_id." AND status = 1";
        $billings_apply = $this->_billing_mod->getAll($sql);
        //print_r($billings_apply);

        //已经通过的记账单列表
        $sql = "SELECT bill.*,com.companyname,m.real_name,m.user_name FROM ecm_billing bill LEFT JOIN ecm_company com ON bill.companyid = com.id LEFT JOIN ecm_member m ON m.user_id = bill.uid where shopid = ".$store_id." AND status > 1";
        $billings_passed = $this->_billing_mod->getAll($sql);

        //print_r($billings_passed);

        $this->assign('billings_apply',$billings_apply);
        $this->assign('billings_passed',$billings_passed);
        $this->import_resource(
            array('script'=>'jquery.plugins/jquery.validate.js',)
        );

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

        $this->display('seller_billing.accept.html');

	}

    //查看申请人或企业的资料
    function checkdata(){
        $this->_config_seo('title', '记账单 - 财务管理');
        if(!empty($_GET['cid'])){               //企业资料
            $cid = $_GET['cid'];
            $model_company =& m('company');
            $sql = "SELECT * FROM ecm_company where id = ".$cid;
            $info = $model_company->getAll($sql);

        }else if(!empty($_GET['pid'])){         //个人资料
            $pid = $_GET['pid'];
            $model_personal =& m('member');
            $sql = "SELECT * FROM ecm_member where user_id = ".$pid;
            $info = $model_personal->getAll($sql);
        }
        //print_r($info);
        $this->assign('info',$info);
        $this->display('checkdata.index.html');
    }

    /**
     * 通过记账单申请操作
     */
    function pass(){
        
        if(!IS_POST){
            header('Content-Type:text/html;charset=' . CHARSET);
            $billing_id = $_GET['id'];
            $this->assign('billing_id',$billing_id);
            $this->display('billing_order_seller.pass.html');
        }else{
            $id = $_POST['id'];
            $limit = $_POST['limit'];
            $circle_date = $_POST['circle_date'];
            $expiration_time = strtotime(date('Y-m-d',strtotime(' + '.$circle_date.' day')));

            $result =$this->_billing_mod->edit(array('id'=>$id),array('status'=>'2','limit_money'=>$limit,'pass_time'=>time(),'passer_id'=>$this->visitor->get('user_id'),'date_circle'=>$circle_date,'expiration_time'=>$expiration_time));
            if($result){
                $this->pop_warning('ok', 'billing_order_seller');
            }
        }
    }


    /**
     * 驳回记账单申请操作
     */
    function bohui(){
        
        if(!IS_POST){
            header('Content-Type:text/html;charset=' . CHARSET);
            $billing_id = $_GET['id'];
            $this->assign('billing_id',$billing_id);
            $this->display('billing_order_seller.bohui.html');
        }else{
            $id = $_POST['id'];
            $excuse = $_POST['excuse'];

            $result =$this->_billing_mod->edit(array('id'=>$id),array('status'=>'3','excuse'=>$excuse,'bohui_time'=>time(),'bohuier_id'=>$this->visitor->get('user_id')));
            if($result){
                $this->pop_warning('ok', 'billing_order_seller');
            }
        }
    }


    /**
     * 取消记账特权操作
     */
    function revoke(){
        $id = $_POST['id'];

        $result =$this->_billing_mod->edit(array('id'=>$id),array('status'=>'6','revoke_time'=>time(),'revoker_id'=>$this->visitor->get('user_id')));
        if($result){
            echo 'success';
        }
    }

    /**
     * 恢复记账额度操作
     */
    function renew(){
        $id = $_POST['id'];

        $oldinfo = $this->_billing_mod->get_info($id);
        $newdate = $oldinfo['expiration_time']+3600*24*$oldinfo['date_circle'];

        $result =$this->_billing_mod->edit(array('id'=>$id),array('status'=>'2'));
        if($result){
            echo 'success';
        }
    }




	function balance(){
		//获取我的记账列表
        $store_id = $this->visitor->get('store_id');
		$this->_get_billing_balance($store_id);

		/* 当前用户中心菜单 */
		$this->_curitem('billing_order_seller');
        $this->_curmenu('billing_balance');
        $this->_config_seo('title', '记账单 - 财务管理');
        $this->display('seller_billing.balance.html');
	}

	function _get_billing_balance($sid){
        $sql = "SELECT b.*,bb.balance_time,m.user_name FROM ecm_billing b LEFT JOIN ecm_billing_balance bb ON b.id = bb.bid LEFT JOIN ecm_member m ON b.uid = m.user_id WHERE (b.status = 421 OR b.status = 422) AND b.shopid = ".$sid;//." AND ord.status >= 20";       //正式使用后开启

        $result = $this->_order_billing_mod->getAll($sql);
        //print_r($result);
        $this->assign('balance',$result);
	}

	/**
     *    三级菜单
     *
     *    @author    psmb
     *    @return    void
     */
    function _get_member_submenu()
    {
    	$data = array(
    		array(
    			'name'	=>'billing_apply',
    			'url'	=>'index.php?app=billing_order_seller&act=accept',
    			'text'	=>'受理记账单'
    		),
    		array(
    			'name'	=>'billing_order_seller',
    			'url'	=>'index.php?app=billing_order_seller',
    			'text'	=>'记账明细'
    		),
    		array(
    			'name'	=>'billing_balance',
    			'url'	=>'index.php?app=billing_order_seller&act=balance',
    			'text'	=>'结算明细'
    		)
    	);
    	return $data;
    }
}
?>