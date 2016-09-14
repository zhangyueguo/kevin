<?php
/**
 * 买家中心记账单
 */
class Billing_orderApp extends DepositbaseApp
{
	protected $_billing_mod;
	protected $_order_billing_mod;
	protected $_deposit_account_mod;
    protected $_deposit_record_mod;
    protected $_billing_balance_mod;
    protected $_billing_balance_faild_mod;
    protected $_deposit_setting_mod;

	function __construct(){
		$this->Billing_orderApp();
	}

	public function Billing_orderApp(){
		parent::__construct();
		$this->_billing_mod               =& m('billing');
		$this->_order_billing_mod         =& m('order_billing');
		$this->_deposit_account_mod       =& m('deposit_account');
		$this->_deposit_record_mod        =& m('deposit_record');
        $this->_billing_balance_mod       =& m('billing_balance');
        $this->_billing_balance_faild_mod =& m("billing_balance_faild");
        $this->_deposit_setting_mod = &m('deposit_setting');
	}

	public function index(){
		//获取我的记账列表
		$this->_get_billing();

		/* 当前用户中心菜单 */
		$this->_curitem('billing_order');
        $this->_curmenu('billing_order');
        $this->_config_seo('title', '记账单 - 财务管理');
        $this->display('buyer_billing.index.html');
	}

	public function _get_billing(){
		
		/*$sql = "SELECT ord.order_id,ord.order_sn,ord.order_name,member.user_name,ord.pay_time,ord.order_amount,bil.expiration_time,ord.buyer_id FROM ecm_order ord LEFT JOIN ecm_member member ON ord.buyer_id = member.user_id LEFT JOIN ecm_billing bil ON bil.uid = ord.buyer_id AND bil.shopid = ord.seller_id WHERE ord.buyer_id = 3 AND payment_id = -1";*/

		$sql = "SELECT bil.uid,bil.id as bid,ord.*,bil.expiration_time,bil.limit_money,bil.companyid,bil.this_balance,bil.status as bstatus FROM ecm_order ord LEFT JOIN ecm_billing bil ON (bil.uid = ord.buyer_id AND bil.shopid = ord.seller_id) WHERE payment_id = -1 AND bil.companyid = 0 AND ord.order_type = 1 AND bil.uid = ".$this->visitor->get('user_id')." AND pay_time < bil.expiration_time ORDER BY bil.status asc,bil.expiration_time asc";//." AND ord.status >= 20";       //正式使用后开启

		$result = $this->_order_billing_mod->getAll($sql);

        //下面是为了计算并支持当前记账周期内可以多次还款
        $sql2 = "SELECT bb.total_money,bil.uid,bil.id as bid,ord.*,bil.expiration_time,bil.limit_money,bil.companyid,bil.status as bstatus FROM ecm_order ord LEFT JOIN ecm_billing bil ON (bil.uid = ord.buyer_id AND bil.shopid = ord.seller_id) LEFT JOIN ecm_billing_balance bb ON bb.bid = bil.id WHERE payment_id = -1 AND bil.companyid = 0 AND ord.order_type = 1 AND bil.uid = ".$this->visitor->get('user_id')." AND pay_time > bil.time_start AND pay_time < bil.expiration_time ORDER BY bil.status asc,bil.expiration_time asc";//." AND ord.status >= 20";       //正式使用后开启
        $res = $this->_order_billing_mod->getAll($sql2);
        
		$arr = array();
		if(!empty($result)){
			foreach ($result as $key => $value) {
				$cutoff_time = $value['expiration_time']-time();
				$result[$key]['cutoff_time'] = intval($cutoff_time/86400);

				foreach ($arr as $k => $val) {
                    
                    if($result[$key]['seller_id'] == $arr[$k]['shopid']){
                        $result[$key]['order_amount'] += $arr[$k]['order_amount'];
                        unset($result[$k]);
                    }
                }

                if(!empty($res)){
                    foreach ($res as $keys => $values) {
                        if($value['seller_id'] == $values['seller_id'] && $value['uid'] == $values['uid']){
                            $result[$key]['neworder'] = '1';
                            $result[$key]['money'] = $result[$key]['order_amount'] - $values['total_money'];
                        }else{
                            $result[$key]['neworder'] = '0';
                        }
                    }
                }

                

                $arr[$key]['shopid'] = $value['seller_id'];
                $arr[$key]['order_amount'] = $value['order_amount'];

                //把计算得到的已使用金额存到数据库
                if($result[$key]['neworder']){
                    $this->_billing_mod->edit('id = '.$value['bid'],array('this_balance'=>$result[$key]['money'],'had_limit'=>$result[$key]['order_amount'],'status'=>'43'));
                }else{
                    $this->_billing_mod->edit('id = '.$value['bid'],array('this_balance'=>$result[$key]['order_amount'],'had_limit'=>$result[$key]['order_amount']));
                }
			}
		}
        //print_r($result);
		//print_r($result);
		$this->assign('order_billing',$result);
	}


	/**
     * 详细记账单
     */
    public function billing_show(){
        /* 当前用户中心菜单 */
        $this->_curitem('billing_order');
        $this->_curmenu('billing_order');
        $this->_config_seo('title', '记账单 - 财务管理');


        $sql = "SELECT * FROM ecm_order where buyer_id = ".$this->visitor->get('user_id')." AND payment_id = -1 AND seller_id = ".$_GET['sid'];// AND status >= 20";//正式上线后开启
        $result = $this->_order_billing_mod->getAll($sql);

        $this->assign('infos',$result);
        $this->display('billing_order.show.html');
    }



	/**
	 * 申请记账单
	 */
	public function apply(){
		/* 当前用户中心菜单 */
		$this->_curitem('billing_order');
        $this->_curmenu('billing_apply');
        $this->_config_seo('title', '申请记账单 - 财务管理');
        if(!IS_POST)
        {
            $region_mod = & m('region');
            $this->assign('regions',$region_mod->get_options(0));

            $minfo['user_id'] = $this->visitor->get('user_id');
            $minfo['user_name'] = $this->visitor->get('user_name');
            $this->assign('minfo',$minfo);

            $sql = "SELECT store.store_name,bill.apply_time,bill.status FROM ecm_billing bill LEFT JOIN ecm_store store ON bill.shopid = store.store_id WHERE bill.uid = ".$minfo['user_id'];
            $billings = $this->_billing_mod->getAll($sql);
            
            $this->assign('billings',$billings);
            $this->import_resource(
                array('script'=>'jquery.plugins/jquery.validate.js',)
            );

            $this->display('buyer_billing.apply.html');
        }
        else
        {
            $data['uid']   			= $this->visitor->get('user_id');
            if($_POST['beilei'] == 'ping'){
            	$data['shopid']	 = '2';
            }else{
            	$data['shopid']  = $_POST['region_id'];
            }
            if(empty($data['shopid'])){
            	$this->show_warning(
	                '请先选择记账单类型!',
	                'back_list','index.php?app=billing_order&act=apply'
	            );exit;
            }
            $result = $this->_billing_mod->get(array('conditions'=>'uid = '.$this->visitor->get('user_id').' AND shopid = '.$data['shopid'],'fields'=>'id,shopid'));
            if(!empty($result)){
            	$this->show_warning(
	                '您已经申请该商家记账单了!',
	                'back_list','index.php?app=billing_order&act=apply'
	            );exit;
            }
            $data['apply_time']         =  time();
            $data['status']				=  '1';
            $this->_billing_mod->add($data);
            header("location:index.php?app=billing_order&act=apply");
        }
	}

	/**
	 * 结算列表
	 * @return [type] [description]
	 */
	function balance(){
        $uid = $this->visitor->get('user_id');
        $this->_get_balance_list($uid);

		/* 当前用户中心菜单 */
		$this->_curitem('billing_order');
        $this->_curmenu('billing_balance');
        $this->_config_seo('title', '记账单 - 财务管理');
        $this->display('buyer_billing.balance.html');
	}

    function _get_balance_list($uid){
        $sql = "SELECT b.*,bb.balance_time,s.store_name FROM ecm_billing b LEFT JOIN ecm_billing_balance bb ON b.id = bb.bid LEFT JOIN ecm_store s ON b.shopid = s.store_id WHERE (b.status = 421 OR b.status = 422) AND b.uid = ".$uid." AND companyid = 0";//." AND ord.status >= 20";       //正式使用后开启

        $result = $this->_order_billing_mod->getAll($sql);
        //print_r($result);
        $this->assign('balance',$result);

    }



	/**
	 * 结算的操作
	 * [dobalance description]
	 * @return [type] [description]
	 */
	function dobalance(){

		$sid = $_GET['sid'];
		$uid = $this->visitor->get('user_id');
		$deposit_account = $this->_deposit_account_mod->get(array('conditions'=>'user_id='.$uid));
		$balance = $this->_billing_mod->get(array('conditions'=>'uid = '.$uid.' AND shopid = '.$sid,'fields'=>'this_balance,id,expiration_time,times,had_limit'));

        //print_r($balance);exit;

		if($deposit_account['money'] < $balance['this_balance']){
            $uri = urlencode('balance_sid='.$sid);
			$this->show_xiao('余额不足，充值后自动结算记账单',
                '如果您在浏览器不自动跳转，请点击该链接', 'index.php?app=deposit&act=recharge&'.$uri);
			exit;
		}

        $tradesn = $this->_deposit_record_mod->_gen_trade_sn();

        if($rate = $this->_deposit_setting_mod->_get_deposit_setting($this->visitor->get('user_id'),'transfer_rate')){
            $fee = round($money * $rate, 2);
        }
        else $fee = 0;

		/*$rs1 = $this->_deposit_account_mod->_update_deposit_money($uid,$balance['this_balance'],'edit');
        
		if($rs1){
			$rs2 = $this->_deposit_account_mod->_update_deposit_money($sid,$balance['this_balance']);
            if($rs1 && $rs2){
                //记录结算记账单成功
                $this->_billing_balance_mod->add(array(
                    'bid'           => $balance['id'],
                    'trade_sn'      => $tradesn,
                    'balance_time'  => time(),
                    'status'        => '1'
                ));

                //记录收支明细
                $depopay_type    =&  dpt('outlay', 'transfer');
                $tradesn = $depopay_type->submit(array(
                    'trade_info' =>  array('user_id'=>$uid, 'party_id'=>$sid, 'amount'=>$balance['this_balance'], 'fee'=>$fee),
                    'extra_info' =>  array(),
                    'post'       =>  $_POST,
                ));
            }
		}

		if(empty($rs2) && !empty($rs1)){
			
           
           $this->_billing_balance_faild_mod->add(array(
                'bid'           => $balance['id'],
                'buyer_id'      => $uid,
                'seller_id'     => $sid,
                'balance_amount'=> $balance['this_balance'],
                'fail_time'     => time()
           ));
		}*/

        //记录收支明细
        $depopay_type    =&  dpt('outlay', 'billing_balance');


        if(!empty($balance)){
            $has_balance = $this->_billing_balance_mod->get(array('conditions'=>'bid = '.$balance['id']));
        }


        if(empty($has_balance) || $has_balance['expiration_time'] < time() || $has_balance['total_money'] < $balance['had_limit']){
            $tradesn = $depopay_type->submit(array(
                'trade_info' =>  array('user_id'=>$uid, 'party_id'=>$sid, 'amount'=>$balance['this_balance'], 'fee'=>$fee),
                'extra_info' =>  array(),
                'post'       =>  $_POST,
            ));
        }else{
            $this->show_warning(
                '请不要重复结算!',
                'back_list','index.php?app=billing_order'
            );
            exit;
        }

        if($tradesn){
            //记录结算记账单成功
            if(empty($has_balance)){
                $this->_billing_balance_mod->add(array(
                    'bid'               => $balance['id'],
                    'trade_sn'          => $tradesn,
                    'balance_time'      => time(),
                    'expiration_time'   => $balance['expiration_time'],
                    'this_money'        => $balance['this_balance'],
                    'total_money'       => $balance['had_limit'],
                    'status'            => '1'
                ));
            }else{
                $this->_billing_balance_mod->edit('id = '.$has_balance['id'],array(
                    'balance_time'      => time(),
                    'this_money'        => $balance['this_balance'],
                    'total_money'       => $balance['had_limit']
                ));
            }
            $this->_billing_mod->edit('id = '.$balance['id'],array('status'=>'421','time_start'=>time(),'times'=>$balance['times']+1));


            $this->show_message(
                '结算成功！',
                'back_list','index.php?app=billing_order'
            );exit;

        }else{
            //记录计算记账单失败
            $this->_billing_balance_faild_mod->add(array(
                'bid'           => $balance['id'],
                'buyer_id'      => $uid,
                'seller_id'     => $sid,
                'balance_amount'=> $balance['this_balance'],
                'fail_time'     => time()
            ));
        }





		/* 当前用户中心菜单 */
		$this->_curitem('billing_order');
        $this->_curmenu('billing_balance');
        $this->_config_seo('title', '记账单 - 财务管理');
        $this->display('buyer_billing.balance.html');
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
    			'url'	=>'index.php?app=billing_order&act=apply',
    			'text'	=>'申请记账单'
    		),
    		array(
    			'name'	=>'billing_order',
    			'url'	=>'index.php?app=billing_order',
    			'text'	=>'记账明细'
    		),
    		array(
    			'name'	=>'billing_balance',
    			'url'	=>'index.php?app=billing_order&act=balance',
    			'text'	=>'结算明细'
    		)

    	);
    	return $data;
    }
}

?>