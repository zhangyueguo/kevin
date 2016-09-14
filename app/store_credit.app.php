<?php
require (ROOT_PATH . '/app/memberseller.app.php');

class Store_creditApp extends MembersellerApp
{
    protected $_credit_set_mod;

    protected $_xincredit_mod;

    protected $_zhangdan_mod;

    protected $_order_mod;

    protected $_company_mod;


    public function __construct()
    {
        $this->Seller_adminApp();
    }

    public function Seller_adminApp()
    {
        parent::__construct();
        $this->_get_member_role();
        $this->_credit_set_mod = & m('credit_set');
        $this->_xincredit_mod = & m('xincredit');
        $this->_zhangdan_mod = & m('zhangdan');
        $this->_order_mod = & m('order');
        $this->_company_mod = & m('company');
    }
    public function index()
    {
        //$user = $this->visitor->get();
        $user_id = $this->visitor->get('user_id');

        $this->_curlocal(LANG::get('member_center'),    url('app=member'),
            LANG::get('overview'));

        /* 当前用户中心菜单 */
        $this->_curitem('credit_set');
        $this->_config_seo('title', '商家设置');

        // $array = array(
        //       'conditions'=>"store_id=".$user['user_id']
        // );
        $sql = "select * from ecm_credit_set where store_id = ".$user_id;
        //$credit_set = $this->_credit_set_mod->find($array);
        $credit_set_id = $this->_credit_set_mod->getOne($sql);
        if(IS_POST)
        {
            $data['zhouqi']       = $_POST['zhouqi'];
            //$data['zhangdanri']  = $_POST['zhangdanri'];
            //$data['jiesuanri']   = $_POST['jiesuanri'];
            $data['zhijin']      = $_POST['zhijin'];
            $data['emailtm']     = $_POST['emailtm'];
            $data['phonetm']     = $_POST['phonetm'];
            $data['store_id']    = $user_id;
           if(!$credit_set_id)
           {
               $this->_credit_set_mod->add($data);
           }
            else
            {
                $this->_credit_set_mod->edit($credit_set_id,$data);
            }
        }
        $credit_set = $this->_credit_set_mod->getRow($sql);
        $this->assign('credit_set',$credit_set);

        $this->display('store_credit.set.html');
    }

    public function qianshou()
    {
        $user = $this->visitor->get();
        $this->_curlocal(LANG::get('member_center'),    url('app=store_credit'),
            LANG::get('overview'));
        /* 当前用户中心菜单 */
        $this->_curitem('credit_link');
         $this->_config_seo('title', '商家审核');

        $sql = "select * from ecm_xincredit where seller_store_id = ".$user['user_id']." and status = 0";

        $xincredits = $this->_xincredit_mod->getAll($sql);

        $this->assign('xincredits',$xincredits);

        $sql = "select * from ecm_xincredit WHERE seller_store_id = ".$user['user_id']." and status = 1";
        $guoxincredits = $this->_xincredit_mod->getAll($sql);
        $this->assign('guoxincredits',$guoxincredits);
        //加载js 实现弹出对话框效果
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

        //$this->display('store_credit.qianshou.html');
        $this->display('store_credit.qianshou1.html');
    }
    public function company()
    {
        header('Content-Type:text/html;charset=' . CHARSET);
        $xin_credit_id = $_GET['id'];
        $sql  = "select company_id from ecm_xincredit WHERE id = ".$xin_credit_id;
        $row = $this->_xincredit_mod->getRow($sql);

        $sql = "select * from ecm_company WHERE id = ".$row['company_id'];

        $row = $this->_company_mod->getRow($sql);
        $this->assign('row',$row);

        $this->display('store_credit.company.html');
    }

    public function pass()
    {
        if(!IS_POST){
            header('Content-Type:text/html;charset=' . CHARSET);
            $xin_credit_id = $_GET['id'];
            $this->assign('id',$xin_credit_id);
           $sql = "select * from ecm_xincredit WHERE id = ".$xin_credit_id;
            $row = $this->_xincredit_mod->getRow($sql);
            $store_id = $this->visitor->get('user_id');
            $sql = "select * from ecm_credit_set WHERE store_id = ".$store_id;
            $storeset = $this->_credit_set_mod->getRow($sql);
            $zhandanday = date('d');

            $day = $storeset['zhouqi']-30;
            $jiesuanday = date('d',strtotime("+".$day." day"));

            $this->assign('jiesuanday',$jiesuanday);
            $this->assign('day',$zhandanday);
            $this->assign('storeset',$storeset);
            $this->assign('row',$row);
            $this->display('store_credit.pass.html');
        }else{
            $data['shenhetime'] = time();
            $data['zhangdanri'] = $_POST['zhandanri'];
            $data['jiesuanri']  = $_POST['jiesuanri'];
            $data['shenpiedu']  = $_POST['shenpiedu'];
            $data['status']     = 1;

            $id = $_POST['id'];
            $result = $this->_xincredit_mod->edit(array('id'=>$id),$data);
            if($result){
                $this->pop_warning('ok', 'pop_warning');
            }
        }
    }
    public function nopass()
    {
        if(!IS_POST){
            header('Content-Type:text/html;charset=' . CHARSET);
            $xin_credit_id = $_GET['id'];
            $this->assign('id',$xin_credit_id);
            $this->display('store_credit.nopass.html');
        }else{

            $excuse['why'] = $_POST['excuse'];
            $excuse['shenhetime'] = time();
            $id = $_POST['id'];
            $result =$this->_xincredit_mod->edit(array('id'=>$id),$excuse);
            if($result){
                $this->pop_warning('ok', 'pop_warning');
            }
        }
    }


    public function yishouxin()
    {
        $user = $this->visitor->get();
        $this->_curlocal(LANG::get('member_center'),    url('app=store_credit'),
            LANG::get('overview'));
        /* 当前用户中心菜单 */
        $this->_curitem('credit_manage');

        $sql = "select * from ecm_xincredit where seller_store_id = ".$user['user_id']." and status = 1";

        $xincredits = $this->_xincredit_mod->getAll($sql);

        $this->assign('xincredits',$xincredits);

        $this->display('store_credit.yishouxin.html');
    }

    public function zhangdan()
    {
        header('content-type:text/html;charset=utf8');
        $user = $this->visitor->get();

        $this->_curlocal(LANG::get('member_center'),    url('app=store_credit'),
            LANG::get('overview'));
        /* 当前用户中心菜单 */
        $this->_curitem('bill_manage');
      //获取和商家相关的账单
        $sql = "select * from ecm_zhangdan where store_id = ".$user['user_id'];

        $zhangdans = $this->_zhangdan_mod->getAll($sql);

        $this->assign('zhangdans',$zhangdans);
        if($_GET['company_id'] && $_GET['store_id'])
        {
            $sql = "select * from ecm_order where seller_id = ".$_GET['store_id']." and company_id = ".$_GET['company_id'];
            $orders = $this->_order_mod->getAll($sql);
            $this->assign('orders',$orders);
        }

        $this->display('store_credit.zhangdan.html');
    }


    public function shenhe()
    {
        //$user = $this->visitor->get();
        $zhouqi = $this->_credit_set_mod->getOne('select zhouqi from ecm_credit_set where id = '.$_POST['id']);
        $data['status'] = $_POST['status'];
        $data['shenhetime'] = time();
        $data['zhangdanri'] = date('d');
        $day = $zhouqi-30;
        $data['jiesuanri']  = date('d',strtotime("+".$day." day"));
        $this->_xincredit_mod->edit($_POST['id'],$data);
        echo json_encode($_POST['status']);exit;
    }

    public function _get_member_role()
    {
        if (!$this->visitor->has_login)
        {
            header('Location:index.php?app=member&act=login&ret_url=' . rawurlencode($_SERVER['PHP_SELF'] . '?' . $_SERVER['QUERY_STRING']));
            return;
        }
        if(!$this->visitor->get('has_store')){
            $this->show_warning('has_no_store');
            exit;
        }
        $_SESSION['member_role'] = 'seller_admin';
    }
}

?>
