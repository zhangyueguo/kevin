<?php

define('STATUS_READY'   ,1); // 筹备中
define('STATUS_RUN'     ,2); // 进行中
define('STATUS_CLOSED'  ,3); // 已结束

class SpecialpageModule extends IndexbaseModule
{

    var $template_name;
    var $style_name;
    var $_specialpage_mod;
    var $_goods_mod;
    var $_admin_mod;
    var $_store_mod;
    var $_allow_submit = false; // 是否允许提交商品
    var $_spec; // 专题页面信息
    function __construct()
    {
        $this->SpecialpageModule();
    }

    function SpecialpageModule()
    {
        parent::__construct();
        $this->template_name = $this->_get_template_name();
        $this->style_name    = $this->_get_style_name();
        $this->_specialpage_mod = &m('specialpage');
        $this->_goods_mod = & m('goods');
        $this->_admin_mod = & m('userpriv');
        $this->_store_mod = & m('store');

        // 给goods模型添加关系
        $this->_goods_mod->_relation['goods_belongs_specialpage'] = array(
            'model' => 'specialpage',
            'type'          => HAS_AND_BELONGS_TO_MANY,
            'foreign_key'   => 'goods_id',
            'middle_table'  => 'specialpage_goods',
            'alias'         => 'sgoods',
            'reverse'       => 'specialpage_has_goods',
        );

        $this->assign('res_base', SITE_URL . "/themes/mall/{$this->template_name}/styles/{$this->style_name}");
        $id = isset($_GET['id']) ? intval($_GET['id']) : 0;
        if (empty($id))
        {
            $this->show_warning('no_such_specialpage');
            return;
        }
        $specialpage = $this->_specialpage_mod->get($id);
        $specialpage['category'] = empty($specialpage['category']) ? array() : explode("\n", $specialpage['category']);
        if (empty($specialpage))
        {
            $this->show_warning('no_such_specialpage');
            return;
        }
        $this->_spec = $specialpage;
        $this->_spec['status'] = STATUS_RUN;
        $specialpage['starttime'] > gmtime() && $this->_spec['status'] = STATUS_READY;
        $specialpage['endtime'] < gmtime() && $this->_spec['status'] = STATUS_CLOSED;
    }

    function index()
    {
        $spec = $this->_spec;
        if ($this->_check_status() === false)
        {
            return;
        }

        foreach ($spec['category'] as $key => $val)
        {
            $goodss = $this->_goods_mod->findAll(array(
                'fields'     => 'goods_name,store_id,category,default_image,default_spec',
                'conditions' => 'spec_id=' . $spec['spec_id'] . ' AND category=\'' . $val . '\' AND verified=1',
                'join'       => 'goods_belongs_specialpage',
                'order'      => 'sort_order ASC,sgoods.add_time DESC',
                'include'    => array(
                    'has_goodsspec'
                )
            ));

            foreach ($goodss as $k => $goods)
            {
                $goods['default_image'] || $goodss[$k]['default_image'] = Conf::get('default_goods_image');
                $goodss[$k]['gs'] = $goods['gs'][$goods['default_spec']];

            }
            $spec['category'][$key] = array();
            $spec['category'][$key]['category'] = $val;
            $spec['category'][$key]['goodss'] = $goodss;
        }

        $this->assign('specialpage', $spec);
        $this->assign('allow_submit', $this->_allow_submit);
        $this->assign('page_title', $spec['name'] . '-' . Conf::get('site_title'));
        $user_template = ROOT_PATH . '/data/special_template' . '/' .$this->_spec['spec_id'] . '.html';
        if (file_exists($user_template)) {
            $this->_view->direct_output = true;
            $this->display('str:' . file_get_contents($user_template));
        }
        else
        {
            $this->display('specialpage.index.html');
        }
    }

    function my_goods()
    {
        /* 只有登录的用户才可访问 */
        if (!$this->visitor->has_login && !in_array(ACT, array('login', 'register', 'check_user')))
        {
            if (!IS_AJAX)
            {
                header('Location:index.php?app=member&act=login&ret_url=' . rawurlencode($_SERVER['PHP_SELF'] . '?' . $_SERVER['QUERY_STRING']));

                return;
            }
            else
            {
                $this->json_error('login_please');
                return;
            }
        }

        /* 检查店铺开启状态 */
        $state = $this->visitor->get('state');
        if ($state == 0)
        {
            $this->show_warning('apply_not_agree');

            return;
        }
        elseif ($state == 2)
        {
            $this->show_warning('store_is_closed');

            return;
        }


        if ($this->_check_status() === false)
        {
            return;
        }
        if ($this->_allow_submit === false)
        {
            $this->show_warning('not_allow_submit');
            return;
        }
        $store_id = $this->visitor->get('manage_store');
        $goodss = $this->_goods_mod->findAll(array(
            'fields'     => 'goods_name,store_id,category,default_image,default_spec,verified',
            'conditions' => 'spec_id=' . $this->_spec['spec_id'] . ' AND store_id=' . $store_id,
            'join'       => 'goods_belongs_specialpage',
            'order'      => 'sgoods.add_time DESC',
            'include'    => array(
                'has_goodsspec'
            )
        ));

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
                    'path' => 'jquery.plugins/jquery.validate.js',
                    'attr' => '',
                ),
            ),
            'style' =>  'jquery.ui/themes/ui-lightness/jquery.ui.css',
        ));

        // 用no_picture替换商品图片
        foreach ($goodss as $k => $goods)
        {
            $goodss[$k]['gs'] = $goods['gs'][$goods['default_spec']];

        }
        /* 当前位置 */
        $this->_curlocal($this->_spec['name'],    'index.php?module=specialpage&id=' . $this->_spec['spec_id'],
                         LANG::get('submit_goods'));
        $this->assign('page_title', $this->_spec['name'] . '-' . Lang::get('submit_goods') . '-' . Conf::get('site_title'));

        $lefttime = array(
            'startleft' => $this->_lefttime($this->_spec['starttime']),
            'endleft' => $this->_lefttime($this->_spec['endtime']),
        );
        $lefttime['startleft_lang'] = sprintf(Lang::get('startleft'), $lefttime['startleft']['d'],$lefttime['startleft']['h'],$lefttime['startleft']['m'],$lefttime['startleft']['s']);
        $lefttime['endleft_lang'] = sprintf(Lang::get('endleft'), $lefttime['endleft']['d'],$lefttime['endleft']['h'],$lefttime['endleft']['m'],$lefttime['endleft']['s']);

        $this->assign('lefttime', $lefttime);
        $this->assign('goodss', $goodss);
        $this->assign('specialpage', $this->_spec);
        $this->display('specialpage.my_goods.html');
        //dump($goodss);
    }

    function _lefttime($time)
    {
        $lefttime = $time - gmtime();
        if ($lefttime < 0)
        {
            return array();
        }
        $d = intval($lefttime / 86400);
        $lefttime -= $d * 86400;
        $h = intval($lefttime / 3600);
        $lefttime -= $h * 3600;
        $m = intval($lefttime / 60);
        $lefttime -= $m * 60;
        $s = $lefttime;
        return  array(
            'd' => $d,
            'h' => $h,
            'm' => $m,
            's' => $s,
        );
    }
    function _check_status()
    {
        $store_id = $this->visitor->get('manage_store');
        $sgrade_allow = true;

        /* 店铺等级限制 */
        if ($store_id)
        {
            $store_info = $this->_store_mod->get_settings($store_id);
            $sgrade_limit = $this->_spec['sgrades'] ? explode(',', $this->_spec['sgrades']) : array();
            if ($sgrade_limit && !in_array($store_info['grade_id'], $sgrade_limit))
            {
                $sgrade_allow = false;
            }
        }
        $store_id && $sgrade_allow && $this->_allow_submit = true;

        if ($this->_spec['status'] == STATUS_READY && (!$store_id || !$sgrade_allow) && $this->_admin_mod->check_admin($this->visitor->info['user_id']))
        {
            $this->show_warning(sprintf(Lang::get('specialpage_ready'), $this->_spec['name'], local_date('Y-m-d', $this->_spec['starttime'])),'login', SITE_URL . '/index.php?app=member&act=login');
            return false;
        }
        if ($this->_spec['status'] == STATUS_CLOSED)
        {
            $this->show_warning(sprintf(Lang::get('specialpage_closed'), $this->_spec['name'], local_date('Y-m-d', $this->_spec['endtime'])));
            return false;
        }
    }

    function submit_goods()
    {
        if ($this->_check_status() === false)
        {
            return;
        }
        if ($this->_allow_submit === false)
        {
            $this->show_warning('not_allow_submit');
            return;
        }
        $categories = $this->_category_options($this->_spec['spec_id']);
        if (!IS_POST)
        {
            header('Content-Type:text/html;charset=' . CHARSET);
            $this->assign('categories', $categories);
            $this->assign('sgcategories', $this->_get_sgcategory_options());  // 店铺分类
            $this->display('specialpage.submit.html');
        }
        else
        {
            if (!empty($categories) && empty($_POST['category'])) {
                $this->pop_warning('no_category_select');
                return;
            }
            if (!empty($_POST['goods_id']) && is_array($_POST['goods_id']))
            {
                $data =array();
                foreach ($_POST['goods_id'] as $goods_id)
                {
                    $data[$goods_id] = array(
                        'sort_order' => 255,
                        'verified'   => 0,
                        'category'   => $_POST['category'],
                        'add_time'   => gmtime(),
                    );
                }
                $this->_specialpage_mod->createRelation('specialpage_has_goods', $this->_spec['spec_id'], $data);
            }
            else
            {
                $this->pop_warning('no_goods_select');
                return;
            }

            $this->pop_warning('ok', 'submit_goods');
        }
    }
        /* 取得本店所有商品分类 */
    function _get_sgcategory_options()
    {
        $mod =& bm('gcategory', array('_store_id' => $this->visitor->get('manage_store')));
        $gcategories = $mod->get_list();
        import('tree.lib');
        $tree = new Tree();
        $tree->setTree($gcategories, 'cate_id', 'parent_id', 'cate_name');
        return $tree->getOptions();
    }

    function query_goods()
    {
        $goods_mod = &bm('goods', array('_store_id' => $this->visitor->get('manage_store')));
        /* 取得店铺商品分类 */
        $this->assign('sgcategories', $this->_get_sgcategory_options());

        /* 搜索条件 */
        $conditions = "1 = 1";
        if (trim($_GET['keyword']))
        {
            $str = "LIKE '%" . trim($_GET['keyword']) . "%'";
            $conditions .= " AND (goods_name {$str} OR brand {$str} OR cate_name {$str})";
        }

        if (intval($_GET['sgcate_id']) > 0)
        {
            $cate_mod =& bm('gcategory', array('_store_id' => $this->visitor->get('manage_store')));
            $cate_ids = $cate_mod->get_descendant(intval($_GET['sgcate_id']));
        }
        else
        {
            $cate_ids = 0;
        }

        /* 取得商品列表 */
        $goods_list = $goods_mod->get_list(array(
            'conditions' => $conditions . ' AND g.if_show=1 AND g.closed=0',
            'limit' => 100,
        ), $cate_ids);

        foreach ($goods_list as $key => $val)
        {
            $goods_list[$key]['goods_name'] = htmlspecialchars($val['goods_name']);
            $goods_list[$key]['store_name'] = htmlspecialchars($val['store_name']);
            $goods_list[$key]['brand'] = htmlspecialchars($val['brand']);
        }
        $this->json_result($goods_list);
    }

    /* 获取专题分类下拉选项 */
    function _category_options($id)
    {
        $categories = array();
        $specialpage = $this->_specialpage_mod->get($id);
        $specialpage['category'] && $categories = explode("\n", $specialpage['category']);
        return $categories;
    }

}

?>
