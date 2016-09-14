<?php

class Company_creditApp extends CompanybaseApp
{
    protected $_feed_enabled = false;
    protected $_xincredit_mod;
    protected $_zhangdan_mod;
    protected $_order_mod;
    protected $_company_mod;
    protected $store_model;

    public function __construct()
    {
        $this->CompanyApp();
    }
    public function CompanyApp()
    {
        parent::__construct();
        $ms = & ms();
        $this->_xincredit_mod = & m('xincredit');
        $this->_feed_enabled = $ms->feed->feed_enabled();
        $this->_zhangdan_mod = & m('zhangdan');
        $this->_order_mod = & m('order');
        $this->_company_mod = & m('company');
        $this->store_model=&m('store');
        $this->assign('feed_enabled',$this->_feed_enabled);
    }

    public function index()
    {
        header('Content-type:text/html;charset=utf8');
        //$company_id = 2;    //暂时写死
      
       $user_id = $this->visitor->get('user_id');           //企业和用户进行关联
         

        $this->_curlocal(LANG::get('member_center'),  'index.php?app=company',
            LANG::get('basic'));

        //企业中心菜单
        $this->_curitem('company_credit');

        /* 当前所处子菜单 */
       // $this->_curmenu('basic_information');

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
         $sql = "select * from ecm_company where user_id = ".$user_id;
        //获取企业自动增长的id

         $company_id = $this->_company_mod->getOne($sql);

        $array = array(
            'conditions' => "company_id=".$company_id
        );
        $credits = $this->_xincredit_mod->find($array);

        //获取商家
        $sql = "select store_id,store_name from ecm_store";
        $stores = $this->store_model->getAll($sql);
        $arr = array();
       foreach($stores as $key=>$val)
       {
           $arr[$val['store_id']] = $val['store_name'];
       }

        $this->assign('arr',$arr);

        $this->assign('credits',$credits);

        $this->display('company_credit.index.html');
    }

    public function credit()
    {
        //$company = 2 ;   //  公司id  暂时为2    这一块 没做关联
        $user_id = $this->visitor->get('user_id');

        $this->_curlocal(LANG::get('member_center'),  'index.php?app=company',
            LANG::get('basic'));

        //企业中心菜单
        $this->_curitem('company_credit');

        $region_mod = & m('region');
        $this->assign('regions',$region_mod->get_options(0));

        // $model_company = & m('company');
        // $company = $model_company->get_info(2);
        // $this->assign('company',$company);

        $sql = "select * from ecm_company where user_id = ".$user_id;
        $company = $this->_company_mod->getRow($sql);
         $this->assign('company',$company);

        /* 当前所处子菜单 */
        // $this->_curmenu('basic_information');

        if(!IS_POST)
        {
            $region_mod = & m('region');
            $this->assign('regions',$region_mod->get_options(0));

            // $model_company = & m('company');
            // $company = $model_company->get_info(2);
            // $this->assign('company',$company);

            $this->import_resource(
                array('script'=>'jquery.plugins/jquery.validate.js',)
            );
            $this->display('company_credit.credit.html');
        }
        else
        {

            $data['company_name'] = $_POST['company_name'];
            $data['company_id']   = $_POST['company_id'];
            $data['beilei']        = $_POST['beilei'];
            $data['seller_store_id']      = $_POST['region_id'];
            $data['seller_store_name']   = $_POST['store_name'];
            $data['edu']                  =  $_POST['edu'];
            $data['shentime']            =  time();
            
            //判断是否可以在申请   一个公司只能申请商家一次
            $sql = "select * from ecm_xincredit where company_id = ".$data['company_id']." and seller_store_id = ".$data['seller_store_id'];
            $id = $this->_xincredit_mod->getOne($sql);
            if($id)
            {
                $this->show_message(
                   '在此商家已经申请过了',
                   'back_list','index.php?app=company_credit&act=credit'
                );
            }else
            {
                $this->_xincredit_mod->add($data);
                $this->show_message(
                'shenqing_ok',
                'back_list','index.php?app=company_credit'
                );
               
            }
        }
    }

    public function zhangdan()
    {
        $company_id = 2 ;   //  公司id  暂时为2    这一块 没做关联
        $this->_curlocal(LANG::get('member_center'),  'index.php?app=company',
            LANG::get('basic'));
        //企业中心菜单
        $this->_curitem('bill');
        $this->_config_seo('title','企业 - 账单管理');

       $sql = "select * from ecm_zhangdan where company_id = ".$company_id;
        $zhangdans = $this->_zhangdan_mod->getAll($sql);

        $this->assign('zhangdans',$zhangdans);

        $this->assign('zhangdans',$zhangdans);
        if($_GET['company_id'] && $_GET['store_id'])
        {
            $sql = "select * from ecm_order where seller_id = ".$_GET['store_id']." and company_id = ".$_GET['company_id'];
            $orders = $this->_order_mod->getAll($sql);
            $this->assign('orders',$orders);
        }


        $this->display('company.zhangdan.html');
    }

    public function hostryzhangdan()
    {
        $company_id = 2 ;   //  公司id  暂时为2    这一块 没做关联
        $this->_curlocal(LANG::get('member_center'),  'index.php?app=company',
            LANG::get('basic'));
        //企业中心菜单
        $this->_curitem('bill');
        $this->_config_seo('title','企业 - 账单管理');

        $this->display('company.hostryzhangdan.html');
    }
}


?>