<?php
require (ROOT_PATH . '/app/memberseller.app.php');

define('MAX_LAYER', 4);

class Store_workerApp extends MembersellerApp
{
    protected $_store_sect_mod;

    protected $_store_worker_mod;

    public function __construct()
    {
        $this->Seller_adminApp();
    }

    public function Seller_adminApp()
    {
        parent::__construct();
        $this->_get_member_role();
        $this->_store_sect_mod = & m('store_sect');
        $this->_store_worker_mod = & m('store_worker');
    }

    public function index()
    {
        $user = $this->visitor->get();

        $this->_curlocal(LANG::get('member_center'),    url('app=member'),
            LANG::get('overview'));

        /* 当前用户中心菜单 */
        $this->_curitem('buyer_zizhi');


        $array= array(
            'conditions' => "store_id=".$user['user_id']
        );
        $storeworkers = $this->_store_worker_mod->find($array);


        /* 获取分类 */
        $sects = $this->_store_sect_mod->get_list($user['user_id']);

        $this->assign('sects',$sects);

        $this->assign('comworkers',$storeworkers);


        $this->display('store.worke.html');

    }

    public function addworker()
    {
        $user = $this->visitor->get();

        $this->_curlocal(LANG::get('member_center'),    url('app=member'),
            LANG::get('overview'));

        /* 当前用户中心菜单 */
        $this->_curitem('buyer_zizhi');
      //  $this->_config_seo('title', Lang::get('member_center'));
       if(!IS_POST)
       {
           $this->assign('parents',$this->_get_options($user['user_id']));
           $this->display('store.addworker.html');
       }
       else
       {
           $data['workername'] = $_POST['worker_name'];
           $data['workerphone'] = $_POST['worker_phone'];
           $data['sectid'] = $_POST['parent_id'];
           $data['juese']  = $_POST['juese'];
           $data['status'] = $_POST['status'];
           $data['store_id'] = $user['user_id'];

           $this->_store_worker_mod->add($data);

           $this->show_message(
               'add_ok',
               'back_list','index.php?app=store_worker'
           );
       }
    }

    public function editworker()
    {
        $user = $this->visitor->get();
        $id = empty($_GET['id']) ? 0 : intval($_GET['id']);

        $this->_curlocal(LANG::get('member_center'),    url('app=member'),
            LANG::get('overview'));

        /* 当前用户中心菜单 */
        $this->_curitem('buyer_zizhi');
        //  $this->_config_seo('title', Lang::get('member_center'));

        if(!IS_POST)
        {
            $worker = $this->_store_worker_mod->get_info($id);
            // $gcategory = array('parent_id'=>$worker['sectid'],'sort_order'=>255);

            $this->assign('storeworker',$worker);
            $this->assign('parents',$this->_get_options($worker['store_id']));
            $this->display('store.addworker.html');
        }
        else
        {
            $data['workername'] = $_POST['worker_name'];
            $data['workerphone'] = $_POST['worker_phone'];
            $data['sectid'] = $_POST['parent_id'];
            $data['juese']  = $_POST['juese'];
            $data['status'] = $_POST['status'];

            $this->_store_worker_mod->edit(array('id'=>$id),$data);

            $this->show_message(
                'edit_ok',
                'back_list','index.php?app=store_worker',
                'edit_again', 'index.php?app=store_worker&amp;act=editworker&amp;id='.$id
            );
        }
    }

    public function drop()
    {
        $id = empty($_GET['id']) ? 0 : intval($_GET['id']);
        $ids = explode(',', $id);
        $this->_store_worker_mod->drop($ids);

        $this->show_message('drop_ok');
    }

    function _get_options($company_id,$except = NULL)
    {
        $user = $this->visitor->get();
        $gcategories = $this->_store_sect_mod->get_list($user['user_id']);
        // var_dump($gcategories);exit;
        $tree =& $this->_tree($gcategories);

        return $tree->getOptions(MAX_LAYER - 1, 0, $except);
    }

    function &_tree($gcategories)
    {
        import('tree.lib');
        $tree = new Tree();
        $tree->setTree($gcategories, 'id', 'parent_id', 'sectname');
        return $tree;
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