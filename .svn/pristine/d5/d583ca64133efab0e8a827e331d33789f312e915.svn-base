<?php
require(ROOT_PATH . '/app/memberseller.app.php');

define('MAX_LAYER', 4);

class Seller_store_sectApp extends  MembersellerApp
{
    protected $_store_sect_mod;

    public function __construct()
    {
        $this->Seller_adminApp();
    }

    public function Seller_adminApp()
    {
        parent::__construct();
        $this->_get_member_role();
        $this->_store_sect_mod = & m('store_sect');
    }

    public function index()
    {
        $user = $this->visitor->get();
        $this->_curlocal(LANG::get('member_center'),    url('app=member'),
            LANG::get('overview'));

        /* 当前用户中心菜单 */
        $this->_curitem('buyer_zizhi');
        $this->_config_seo('title', Lang::get('member_center'));

        $sects = $this->_store_sect_mod->get_list($user['user_id'],0);
        $tree = & $this->_tree($sects);

        foreach($sects as $key => $val)
        {
            $sects[$key]['switchs'] = 0;
            if($this->_store_sect_mod->get_list($user['user_id'],$val['id']))
            {
                $sects[$key]['switchs'] = 1;
            }
        }
        $this->assign('sects',$sects);
        $this->assign('max_layer',MAX_LAYER);

        $this->import_resource(array(
            'script' => 'jqtable.js,inline_edit.js',
            'style' => 'res:style/jqtreetable.css'
        ));


        $this->display('store.sectorlist.html');
    }

    public function addsector()
    {
        $user = $this->visitor->get();

        $this->_curlocal(LANG::get('member_center'),    url('app=seller_store_sect'),
            LANG::get('overview'));

        /* 当前用户中心菜单 */
        $this->_curitem('buyer_zizhi');
       // $this->_config_seo('title', Lang::get('member_center'));

        if(!IS_POST)
        {
            //开发测试阶段
            $pid = empty($_GET['pid']) ? 0 : intval($_GET['pid']);
            $gcategory = array('parent_id'=>$pid,'sort_order'=>255);

            $this->assign('gcategory',$gcategory);

            $this->assign('parents',$this->_get_options($user['user_id']));

            /* 导入jQuery的表单验证插件 */
            $this->import_resource(array(
                'script' => 'jquery.plugins/jquery.validate.js'
            ));

            $this->display('store.addsector.html');
        }
        else
        {
            $data['store_id'] = $user['user_id'];
            $data['sectname'] = $_POST['sectname'];
            $data['parent_id'] = $_POST['parent_id'];
            $data['sort_order'] = $_POST['sort_order'];

            if(!$this->_store_sect_mod->unique(trim($data['sectname']),$data['parent_id']))
            {
                $this->show_warning('name_exit');
                return;
            }
            $this->_store_sect_mod->add($data);

            $this->show_message(
                'add_ok',
                'back_list','index.php?app=seller_store_sect'
            );
        }
    }

    public function drop()
    {
        $id = isset($_GET['id']) ? trim($_GET['id']) : '';

        if (!$id)
        {
            $this->show_warning('no_gcategory_to_drop');
            return;
        }

        $ids = explode(',', $id);

        if (!$this->_store_sect_mod->drop($ids))
        {
            $this->show_warning($this->_store_sect_mod->get_error());
            return;
        }
        // echo "jie shu le";exit;
        $this->show_message('drop_ok');
    }

    public function sect_edit()
    {
        $user = $this->visitor->get();
        $id = empty($_GET['id']) ? 0 : intval($_GET['id']);

        if(!IS_POST)
        {
            $sect = $this->_store_sect_mod->get_info($id);

            if(!$sect)
            {
                $this->show_warning('sect_empty');
                return;
            }
            $this->assign('gcategory',$sect);

            $this->import_resource(array(
                'script' => 'jquery.plugins/jquery.validate.js'
            ));
            $this->assign('parents',$this->_get_options($user['user_id']));
            $this->display('store.addsector.html');
        }
        else
        {
            $data['sectname'] = $_POST['sectname'];
            $data['parent_id'] = $_POST['parent_id'];
            $data['sort_order'] = $_POST['sort_order'];


            if(!$this->_store_sect_mod->unique(trim($data['sectname']),$data['parent_id'],$id))
            {
                $this->show_warning('name_exit');
                return;
            }
            //保存
            $rows = $this->_store_sect_mod->edit(array('id'=>$id),$data);

            $this->show_message(
                'edit_ok',
                'back_list','index.php?app=seller_store_sect',
                'edit_again', 'index.php?app=seller_store_sect&amp;act=sector_edit&amp;id='.$id
            );
        }
    }

    /*
    * 异步看部门子分类
    */
    public function ajax_cate()
    {
        //公司id 暂时写死
        $user = $this->visitor->get();
        if(!isset($_GET['id']) || empty($_GET['id']))
        {
            echo ecm_json_encode(false);
            return;
        }

        $cate = $this->_store_sect_mod->get_list($user['user_id'],$_GET['id']);

        foreach($cate as $key => $val)
        {
            $child = $this->_store_sect_mod->get_list($user['user_id'],$val['id']);
            $lay = $this->_store_sect_mod->get_layer($val['id']);
            if($lay >= MAX_LAYER)
            {
                $cate[$key]['add_child'] = 0;
            }
            else
            {
                $cate[$key]['add_child'] = 1;
            }

            if(!$child || empty($child))
            {
                $cate[$key]['switchs']=0;
            }
            else
            {
                $cate[$key]['switchs']=1;
            }
        }
        header("Content-type:text/html;charset=".CHARSET);
        echo ecm_json_encode(array_values($cate));
    }





    function _get_options($company_id,$except = NULL)
    {

        $gcategories = $this->_store_sect_mod->get_list($company_id);
        // var_dump($gcategories);exit;
        $tree =& $this->_tree($gcategories);

        return $tree->getOptions(MAX_LAYER - 1, 0, $except);
    }


    /* 构造并返回树 */
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