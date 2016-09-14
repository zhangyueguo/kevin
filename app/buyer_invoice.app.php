<?php
class Buyer_invoiceApp extends PersonalbaseApp
{
    protected $_invoice_template;
    function __construct()
    {
        $this->Buyer_invoiceApp();
    }

    function Buyer_invoiceApp ()
    {
        
        
        parent::__construct();
    
        $this->_invoice_template = &m('invoice_template');
    }

    
    public function addzizhi()
    {
        $this->_curlocal(LANG::get('member_center'),  'index.php?app=buyer_invoice',
            LANG::get('basic'));

        //企业中心菜单
        $this->_curitem('buyer_zizhi');

        /* 当前所处子菜单 */
        $this->_curmenu('invoice_information');

        if(!IS_POST){
            if($_GET['type']){
                $this->assign($_GET['type'],'1');
            }

            if($_GET['type'] == 'edit'){
                $conditions = array(
                    'fields'            =>'*',
                    'conditions'        => 'uid = '.$this->visitor->get('user_id').' AND id = '.$_GET['bid'],
                );
            }else if($_GET['type'] == 'drop'){      //删除
                $drop_id = $_GET['bid'];
                $result = $this->_invoice_template->drop(array('id'=>$drop_id));
                if($result){
                    header("Location:index.php?app=buyer_invoice&act=addzizhi");
                }
            }else{
                $conditions = array(
                    'fields'            =>'*',
                    'conditions'        => 'uid = '.$this->visitor->get('user_id'),
                );
            }
            $info = $this->_invoice_template->get_info($_GET['bid']);
            $infos = $this->_invoice_template->find($conditions);
            if(empty($info)){
                //判断会员有没有加入公司
                $member_model =& m('comworker');
                $condition = array(
                  'fields'        =>'*',
                  'conditions'    =>'user_id = '.$this->visitor->get('user_id'),
                );
                $minfo = $member_model->get_info($condition);
                /*if(empty($minfo)){
                  $member_model->add(array(
                      'company_name'      => $_POST['worker_name'],
                      'taxpayer_code'     => $_POST['worker_shibie'],
                      'company_address'   => $_POST['worker_address'],
                      'company_phone'     => $_POST['worker_phone'],
                      'deposit_bank'      => $_POST['worker_bank'],
                      'number_bank'       => $_POST['worker_number'],
                      'uid'               => $this->visitor->get('user_id'),
                  ));
                }else{
                  $this->assign('mycompany_id',$minfo['id']);
                }*/
            
            }
            $this->assign('invoice',$info);
            $this->assign('infos',$infos);
            $this->display('buyer.zizhi.html');
        }else{
            if($_GET['type'] == 'add'){     //添加
                $result = $this->_invoice_template->add(array(
                    'company_name'      => $_POST['worker_name'],
                    'taxpayer_code'     => $_POST['worker_shibie'],
                    'company_address'   => $_POST['worker_address'],
                    'company_phone'     => $_POST['worker_phone'],
                    'deposit_bank'      => $_POST['worker_bank'],
                    'number_bank'       => $_POST['worker_number'],
                    'uid'               => $this->visitor->get('user_id'),
                )); 
            }else if($_GET['type'] == 'edit'){      //修改
                $edit_id = $_POST['template_id'];
                $this->assign('invoice',$info);
                $result = $this->_invoice_template->edit($edit_id,array(
                    'company_name'      => $_POST['worker_name'],
                    'taxpayer_code'     => $_POST['worker_shibie'],
                    'company_address'   => $_POST['worker_address'],
                    'company_phone'     => $_POST['worker_phone'],
                    'deposit_bank'      => $_POST['worker_bank'],
                    'number_bank'       => $_POST['worker_number'],
                ));
            }

            if($result){
                header("Location:index.php?app=buyer_invoice&act=addzizhi");
            }
        }

    }

}

?>