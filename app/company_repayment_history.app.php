<?php
class Company_repayment_historyApp extends CompanybaseApp
{



    public function index()
    {
        $this->_curlocal(LANG::get('member_center'),  'index.php?app=company',
            LANG::get('basic'));
        //企业中心菜单
        $this->_curitem('bill');
        $this->_config_seo('title','企业 - 还款记录');




        $this->display('com_repay_his.index.html');
    }


}