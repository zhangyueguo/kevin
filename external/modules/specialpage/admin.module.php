<?php

define('STATUS_READY'   ,1); // 筹备中
define('STATUS_RUN'     ,2); // 进行中
define('STATUS_CLOSED'  ,3); // 已结束

class SpecialpageModule extends AdminbaseModule
{

    var $_specialpage_mod;
    var $_goods_mod;
    var $_store_mod;
    var $_sgrade_mod;

    function __construct()
    {
        $this->SpecialpageModule();
    }

    function SpecialpageModule()
    {
        parent::__construct();
        $this->_specialpage_mod = &m('specialpage');
        $this->_goods_mod = &m('goods');
        $this->_store_mod = &m('store');
        $this->_sgrade_mod = &m('sgrade');

        // 给goods模型添加关系
        $this->_goods_mod->_relation['goods_belongs_specialpage'] = array(
            'model' => 'specialpage',
            'type'          => HAS_AND_BELONGS_TO_MANY,
            'foreign_key'   => 'goods_id',
            'middle_table'  => 'specialpage_goods',
            'alias'         => 'sgoods',
            'reverse'       => 'specialpage_has_goods',
        );
    }

    function index()
    {
        $specialpages = $this->_specialpage_mod->find(array(
            'fields'    => 'name,category,starttime,endtime,sgrades',
            'order'     => 'spec_id DESC'
        ));
        $sgrades = $this->_sgrade_options();
        foreach ($specialpages as $key => $val)
        {
            if ($val['starttime'] > gmtime())
            {
                $specialpages[$key]['status'] = STATUS_READY;
            }
            else if ($val['endtime'] < gmtime())
            {
                $specialpages[$key]['status'] = STATUS_CLOSED;
            }
            else
            {
                $specialpages[$key]['status'] = STATUS_RUN;
            }
            $specialpages[$key]['sgrades'] = '';

            if (!empty($val['sgrades']))
            {
                foreach (explode(',', $val['sgrades']) as $sgrade)
                {
                    $specialpages[$key]['sgrades'] .= isset($sgrades[$sgrade]) ? $sgrades[$sgrade] . " | " : '';
                }
            }
            $specialpages[$key]['sgrades'] == '' && $specialpages[$key]['sgrades'] = Lang::get('not_limit');
        }
        $this->_assign_form();
        $this->assign('specialpages', $specialpages);
        $this->assign('gmtime', gmtime());
        $this->display('specialpage.index.html');
    }

    function goods()
    {
        $id = isset($_GET['id']) ? intval($_GET['id']) : 0;
        if (empty($id))
        {
            $this->show_warning('no_such_specialpage');
            return;
        }
        $categories = $this->_category_options($id);
        $conditions = $this->_get_query_conditions(array(
            array(
                'field' => 'goods_name',         //可搜索字段title
                'equal' => 'LIKE',          //等价关系,可以是LIKE, =, <, >, <>
                'assoc' => 'AND',           //关系类型,可以是AND, OR
                'name'  => 'title',         //GET的值的访问键名
                'type'  => 'string',        //GET的值的类型
            ),
            array(
                'field' => 'category',         //可搜索字段title
                'equal' => '=',          //等价关系,可以是LIKE, =, <, >, <>
                'assoc' => 'AND',           //关系类型,可以是AND, OR
                'name'  => 'category',         //GET的值的访问键名
                'type'  => 'string',        //GET的值的类型
            ),
        ));
        $page = $this->_get_page();
        $goodss = $this->_goods_mod->find(array(
            'fields' => 'g.goods_name,s.store_name,sgoods.spec_id,sgoods.sort_order,sgoods.verified,sgoods.add_time,category',
            'conditions' => 'spec_id=' . $id . $conditions,
            'join' => 'goods_belongs_specialpage,belongs_to_store',
            'count' => true,
            'limit' => $page['limit'],
            'order' => 'sgoods.sort_order ASC,sgoods.add_time DESC'
        ));

        $page['item_count'] = $this->_goods_mod->getCount();
        $this->_format_page($page);
        $this->assign('page_info', $page);
        $this->assign('filtered', $conditions? 1 : 0); //是否有查询条件
        $this->assign('categories', $categories);
        $this->assign('goodss', $goodss);
        $this->display('specialpage_goods.index.html');
    }

    function add_goods()
    {
        $id = isset($_GET['id']) ? intval($_GET['id']) : 0;
        if (empty($id))
        {
            $this->show_warning('no_such_specialpage');
            return;
        }
        // 专题商品分类
        $categories = $this->_category_options($id);
        if (!IS_POST)
        {
            // 商城商品分类
            $cate_mod =& bm('gcategory', array('_store_id' => 0));

            $this->assign('gcategories', $cate_mod->get_options(0, true));
            $this->_assign_form();
            $this->import_resource(array('script' => 'mlselection.js'));
            $goods = array('verified' => 1, 'sort_order' => 255);
            $this->assign('goods', $goods);
            $this->assign('categories', $categories);
            $this->display('specialpage_goods.form.html');
        }
        else
        {
            if (!empty($categories) && empty($_POST['category'])) {
                $this->show_warning('no_category_select');
                return;
            }
            if (!empty($_POST['goods_id']) && is_array($_POST['goods_id']))
            {
                $data =array();
                foreach ($_POST['goods_id'] as $goods_id)
                {
                    $data[$goods_id] = array(
                        'sort_order' => $_POST['sort_order'],
                        'verified'  => $_POST['verified'],
                        'category'  => $_POST['category'],
                        'add_time'  => gmtime(),
                    );
                }
                $this->_specialpage_mod->createRelation('specialpage_has_goods', $id, $data);
                $this->show_message('add_goods_successed',
                    'continue_add', 'index.php?module=specialpage&amp;act=add_goods&id=' . $id,
                    'back_list',    'index.php?module=specialpage&act=goods&id=' . $id);
            }
            else
            {
                $this->show_warning('no_goods_select');
                return;
            }
        }
    }

    function query_goods()
    {
        $conditions = $this->_get_query_conditions(array(
            array(
                'field' => 'goods_name',
                'equal' => 'like',
            ),
            array(
                'field' => 'store_name',
                'equal' => 'like',
            ),
            array(
                'field' => 'brand',
                'equal' => 'like',
            ),
        ));

        // 分类
        $cate_id = empty($_GET['cate_id']) ? 0 : intval($_GET['cate_id']);
        if ($cate_id > 0)
        {
            $cate_mod =& bm('gcategory', array('_store_id' => 0));
            $cate_ids = $cate_mod->get_descendant($cate_id);
            $conditions .= " AND cate_id" . db_create_in($cate_ids);
        }

        $goods_list = $this->_goods_mod->get_list(array(
            'conditions' => "if_show=1 AND closed=0" . $conditions,
            'limit' => 100,
        ));
        foreach ($goods_list as $key => $val)
        {
            $goods_list[$key]['goods_name'] = htmlspecialchars($val['goods_name']);
            $goods_list[$key]['store_name'] = htmlspecialchars($val['store_name']);
            $goods_list[$key]['brand'] = htmlspecialchars($val['brand']);
        }
        $this->json_result($goods_list);
    }

    function edit_goods()
    {
        $id = isset($_GET['id']) ? intval($_GET['id']) : 0;
        if (empty($id))
        {
            $this->show_warning('no_such_specialpage');
            return;
        }
        $goods_id = isset($_GET['goods_id']) ? intval($_GET['goods_id']) : 0;
        if (empty($goods_id))
        {
            $this->show_warning('no_such_goods');
            return;
        }
        /*$goods = $this->specialpage_goods_mod->findAll(array(
            'include' => array('belongs_to_specialpage_category'),
            'conditions' => 'spec_id=' . $id . ' and goods_id=' . $goods_id,
        ));*/
        $goods = $this->_goods_mod->get(array(
            'conditions' => 'spec_id=' . $id . ' AND sgoods.goods_id=' . $goods_id,
            'join' => 'goods_belongs_specialpage',
            'count' => true,
        ));
        if (empty($goods))
        {
            $this->show_warning('no_such_goods');
            return;
        }
        // 专题分类
        $categories = $this->_category_options($id);
        if (!IS_POST)
        {

            $this->_assign_form();
            $this->assign('goods', $goods);
            $this->assign('categories', $categories);
            $this->display('specialpage_goods.form.html');
        }
        else
        {
            if (!empty($categories) && empty($_POST['category'])) {
                $this->show_warning('no_category_select');
                return;
            }
            $data[$goods_id] = array(
                'sort_order'    => $_POST['sort_order'],
                'verified'      => $_POST['verified'],
                'category'      => $_POST['category'],
                'add_time'      => $goods['add_time'],
            );
            $this->_specialpage_mod->createRelation('specialpage_has_goods', $id, $data);
            $this->show_message('edit_goods_successed',
                'continue_edit', 'index.php?module=specialpage&amp;act=edit_goods&id=' . $id . '&goods_id=' . $goods_id,
                'back_list',    'index.php?module=specialpage&act=goods&id=' . $id);
        }
    }

    function notice()
    {
        $id = isset($_GET['id']) ? intval($_GET['id']) : 0;
        if (empty($id))
        {
            $this->show_warning('no_such_specialpage');
            return;
        }
        if (!IS_POST)
        {
            $specialpage = current($this->_specialpage_mod->find(array(
                    'conditions' => 'spec_id=' . $id,
            )));

            //店铺等级
            $sgrades = $this->_sgrade_options();
            $this->assign('sgrades',$sgrades);
            $this->_import_jquery_ui();
            $this->assign('build_editor', $this->_build_editor(array('name' => 'notice_content')));
            $this->assign('specialpage', $specialpage);
            $this->display('notice.form.html');
        }
        else
        {
            $conditions = empty($_POST['sgrades']) ? '' : 'sgrade' . db_create_in($_POST['sgrades']);
            $notice_type = empty($_POST['notice_type']) ? '' : trim($_POST['notice_type']);
            if (!in_array($notice_type, array('email','message')))
            {
                $this->show_warning('no_such_notice_type');
                return;
            }
            $stores = $this->_store_mod->find(array(
                'conditions' => $conditions,
                'join'  => 'belongs_to_user',
                'fields'=> 'this.store_id,member.email',
            ));
            if ($notice_type == 'message')
            {
                $ms = &ms();
                if ($ms->pm->send(MSG_SYSTEM, array_keys($stores), trim($_POST['notice_title']), trim($_POST['notice_content'])))
                {
                    $this->show_message('send_successed');
                }
            }
            elseif ($notice_type == 'email')
            {
                $arr_email = array();
                foreach ($stores as $store)
                {
                    $arr_email[] = $store['email'];
                }
                $this->_mailto($arr_email, trim($_POST['notice_title']), trim($_POST['notice_content']));
                $this->show_message('send_successed');
            }
        }
    }

    /* 获取专题分类下拉选项 */
    function _category_options($id)
    {
        $categories = array();
        $specialpage = current($this->_specialpage_mod->find(array(
            'conditions' => 'spec_id=' . $id,
        )));
        $specialpage['category'] && $categories = explode("\n", $specialpage['category']);
        return $categories;
    }

    /* 获取店铺等级下拉选项 */
    function _sgrade_options()
    {
        $sgrades = $this->_sgrade_mod->find(array(
            'limit' => $page['limit'],
            'count' => true,
            'order' => 'sort_order',
        ));
        foreach ($sgrades as $key => $sgrade)
        {
            $sgrades[$key] = $sgrade['grade_name'];
        }
        return $sgrades;
    }

    function add()
    {
        if (!IS_POST)
        {
            $this->_import_jquery_ui();
            $this->assign('build_editor', $this->_build_editor(array('name' => 'posters')));
            $this->_assign_form();
            //店铺等级
            $sgrades = $this->_sgrade_options();
            $this->assign('sgrades',$sgrades);
            $this->assign('specialpage',array('status'=>0));
            $this->display('specialpage.form.html');
        }
        else
        {
            if (($data = $this->_handle_post_data($_POST)) === false) {
                return false;
            }
            $category = $data['category'];
            $data['category'] = implode("\n", $data['category']);

            if (!$id = $this->_specialpage_mod->add($data))
            {
                $this->show_warning($this->_specialpage_mod->get_error());

                return;
            }

            $this->show_message('add_specialpage_successed',
                'continue_add', 'index.php?module=specialpage&amp;act=add',
                'back_list',    'index.php?module=specialpage');
        }
    }

    function stop()
    {
        $id = isset($_GET['id']) ? intval($_GET['id']) : 0;
        if (empty($id))
        {
            $this->show_warning('no_such_specialpage');
            return;
        }
        if ($this->_change_status('stop', $id))
        {
            $this->show_message('change_successed');
        }
    }
    function start()
    {
        $id = isset($_GET['id']) ? intval($_GET['id']) : 0;
        if (empty($id))
        {
            $this->show_warning('no_such_specialpage');
            return;
        }
        if ($this->_change_status('start', $id))
        {
            $this->show_message('change_successed');
        }
    }

    function _change_status($action, $id)
    {
        if ($action == 'start')
        {
            if (!$this->_specialpage_mod->edit($id, array('starttime' => gmtime())))
            {
                return false;
            }
        }
        elseif ($action == 'stop')
        {
            if (!$this->_specialpage_mod->edit($id, array('endtime' => gmtime())))
            {
                return false;
            }
        }
        return true;
    }

    function edit()
    {
        $id = isset($_GET['id']) ? intval($_GET['id']) : 0;
        if (empty($id))
        {
            $this->show_warning('no_such_specialpage');
            return;
        }

        if (!IS_POST)
        {
            $specialpage = current($this->_specialpage_mod->find(array(
                'conditions' => 'spec_id=' . $id,
            )));

            $this->_import_jquery_ui();
            //店铺等级
            $sgrades = $this->_sgrade_options();
            $this->assign('build_editor', $this->_build_editor(array('name' => 'posters')));
            $this->assign('sgrades',$sgrades);
            $this->assign('specialpage',$specialpage);
            $this->_assign_form();
            $this->display('specialpage.form.html');
        }
        else
        {
            if (($data = $this->_handle_post_data($_POST)) === false) {
                return false;
            }
            $category = $data['category'];
            $data['category'] = implode("\n", $data['category']);

            /* 更新专题分类 */
            if ($this->_update_cate($category, $id) === false)
            {
                return;
            }

            $this->_specialpage_mod->edit($id, $data);
            if ($this->_specialpage_mod->has_error())
            {
                $this->show_warning($this->_specialpage_mod->get_error());

                return;
            }

            $this->show_message('edit_specialpage_successed',
                'continue_edit', 'index.php?module=specialpage&amp;act=edit&amp;id='.$id,
                'back_list',    'index.php?module=specialpage');
        }
    }


    /* 更新专题分类 */
    function _update_cate($data, $id)
    {
        $category = array(); // 更改前的分类
        $specialpage = $this->_specialpage_mod->get($id);
        $category = explode("\n", $specialpage['category']);
        $category_del = array_diff($category, $data); // 被删除的分类
        $goodss = $this->_specialpage_mod->getRelatedData('specialpage_has_goods', $id);
        $goods_ids = array();
        foreach ($goodss as $k => $goods)
        {
            in_array($goods['category'], $category_del) && $goods_ids[$goods['goods_id']] = array(
                'category'      => '',
                'sort_order'    => $goods['sort_order'],
                'verified'      => $goods['verified'],
                'add_time'      => $goods['add_time'],
            );
        }
        !empty($goods_ids) && $this->_specialpage_mod->createRelation('specialpage_has_goods', $id, $goods_ids);
        return true;
    }

    function _assign_form()
    {
        $specialpage_status = array(
            STATUS_READY => Lang::get('ready'),
            STATUS_RUN => Lang::get('run'),
            STATUS_CLOSED => Lang::get('closed'),
        );
        $specialpage_status_code = array(
            'status_ready' => STATUS_READY,
            'status_run' => STATUS_RUN,
            'status_closed' => STATUS_CLOSED,
        );
        $yes_or_no = array(
            1 => Lang::get('yes'),
            0 => Lang::get('no'),
        );
        $not_yes_and_no = 2;
        $this->assign('specialpage_status', $specialpage_status);
        $this->assign('specialpage_status_code', $specialpage_status_code);
        $this->assign('yes_or_no', $yes_or_no);
        $this->assign('not_yes_and_no', $not_yes_and_no);
    }

    function _import_jquery_ui()
    {
        $this->import_resource(array(
            'script' => array(
                array(
                    'path' => 'jquery.ui/jquery.ui.js',
                    'attr' => '',
                ),
                array(
                    'path' => 'jquery.ui/i18n/' . i18n_code() . '.js',
                    'attr' => '',
                ),
            ),
            'style' =>  'jquery.ui/themes/ui-lightness/jquery.ui.css',
        ));
    }

    //异步修改数据
    function ajax_col()
    {
       $id     = empty($_GET['id']) ? '' : trim($_GET['id']);
       $arr_id = explode(' ', $id);
       $column = empty($_GET['column']) ? '' : trim($_GET['column']);
       $value  = isset($_GET['value']) ? trim($_GET['value']) : '';
       //$data   = $this->_specialpage_mod->getOne();
       switch ($column)
       {
           case 'sort_order' :
           case 'verified' :
               $spec_id  = intval($arr_id[0]);
               $goods_id    = intval($arr_id[1]);
               $goods = $this->_goods_mod->get(array(
                    'conditions' => 'spec_id=' . $spec_id . ' AND sgoods.goods_id=' . $goods_id,
                    'join' => 'goods_belongs_specialpage',
                    'count' => true,
                ));
                $data = array(
                    $goods_id => array(
                        'sort_order'    => $goods['sort_order'],
                        'category'      => $goods['category'],
                        'verified'      => $goods['verified'],
                        'add_time'      => $goods['add_time'],
                    ),
                );
                $data[$goods_id][$column] = $value;
                //dump($data);
                if (!empty($goods))
                {
                   if($this->_specialpage_mod->createRelation('specialpage_has_goods', $spec_id, $data))
                   {
                       echo ecm_json_encode(true);
                   }
                }
               break;
       }
       return ;
    }

    //批量编辑
    function bat_edit()
    {
        $spec_id = empty($_GET['spec_id']) ? 0 : intval($_GET['spec_id']);
        if (!$spec_id) {
            $this->show_warning('no_such_specialpage');
            return;
        }
        $ids = $this->_filter_ids($_GET['id'], '_goods_mod');
        if (!$ids)
        {
            $this->show_warning('no_such_ids');
            return;
        }
        if (!IS_POST)
        {
            $this->_assign_form();
            $this->assign('categories', $this->_category_options($spec_id));
            $this->display('specialpage_goods.batch.html');
        }
        else
        {
            $category = !empty($_POST['category']) ? trim($_POST['category']) : null;
            $verified = isset($_POST['verified']) ? intval($_POST['verified']) : null;

            $goodss = $this->_goods_mod->find(array(
                'fields' => 'sgoods.add_time,sgoods.sort_order,sgoods.category,sgoods.verified',
                'conditions' => 'spec_id=' . $spec_id . ' AND sgoods.goods_id' . db_create_in($ids),
                'join' => 'goods_belongs_specialpage',
                'count' => true,
            ));
            $data = array();
            foreach ($goodss as $key => $goods)
            {
                $data[$goods['goods_id']] = array(
                    'sort_order'    => $goods['sort_order'],
                    'category'      => $category === null ? $goods['category'] : $category,
                    'verified'      => $verified === null ? $goods['verified'] : $verified,
                    'add_time'      => $goods['add_time'],
                );
            }
            //dump($data);
            if (!empty($data))
            {
               if($this->_specialpage_mod->createRelation('specialpage_has_goods', $spec_id, $data))
               {
                   $this->show_message('edit_goods_successed', 'back_list', 'index.php?module=specialpage&act=goods&id=' . $spec_id);
               }
            }
        }
    }

    function _handle_post_data($post)
    {
        $post['category'] = $this->_array_trim(explode("\n", $post['category']));
        if(count(array_unique($post['category'])) != count($post['category']))
        {
            $this->show_warning('duplicate_category');
            return false;
        }
        $sgrades = '';
        is_array($post['sgrades']) && $sgrades = implode(',', $post['sgrades']);
        $data = array(
            'name'          => $post['name'],
            'description'   => $post['description'],
            'starttime'     => gmstr2time($post['starttime']),
            'endtime'       => gmstr2time_end($post['endtime']) - 1,
            'posters'       => trim($post['posters']),
            'category'      => $post['category'],
            'sgrades'       => $sgrades,
        );
        if($data['starttime'] > $data['endtime'])
        {
            $this->show_warning('specialpage_time_wrong');
            return false;
        }
        return $data;
    }

    function _array_trim($arr)
    {
        if (is_array($arr)) {
            foreach ($arr as $key => $val)
            {
                is_string($val) && $arr[$key] = trim($val);
                if (empty($arr[$key]))
                {
                    unset($arr[$key]);
                }
            }
            return $arr;
        }
        else
        {
            return array();
        }
    }

    function drop()
    {
        $mod = empty($_GET['mod']) ? '' : trim($_GET['mod']);
        if (!in_array($mod, array('_specialpage_mod', '_goods_mod')))
        {
            $this->show_warning('no_such_mod');
            return;
        }
        $ids = $this->_filter_ids($_GET['id'], $mod);
        if (!$ids)
        {
            $this->show_warning('no_such_ids');
            return;
        }
        switch ($mod)
        {
            case '_goods_mod' :
                $spec_id = empty($_GET['spec_id']) ? 0 : intval($_GET['spec_id']);
                if (!$spec_id) {
                    $this->show_warning('no_such_specialpage');
                    return;
                }
                $this->$mod->unlinkRelation('goods_belongs_specialpage', $ids, $spec_id);
                break;
            default : $this->$mod->drop($ids);
        }
        $this->show_message('drop_successed');
    }

    function _filter_ids($ids, $mod)
    {
         $ids = isset($ids) ? trim($ids) : '';
         if (!$ids)
         {
             return ;
         }
         $ids=explode(',',$ids);
         foreach ($ids as $key => $id){
            $ids[$key] = isset($id) ? intval($id) : 0;
         }
         $ids = array_unique($ids);
         $data = $this->$mod->find();
         foreach ($ids as $value)
         {
             $data[$value] && $filter_ids[] = $value;
         }
         if ($filter_ids == null)
         {
             return ;
         }
        return $filter_ids;
    }

    function template()
    {
        $id = isset($_GET['id']) ? intval($_GET['id']) : 0;
        if (empty($id))
        {
            $this->show_warning('no_such_specialpage');
            return;
        }
        if (!IS_POST)
        {
            $template_content = $this->_get_template($id);
            $this->assign('template_content', $template_content);
            $this->display('template.html');
        }
        else
        {
            $this->_save_template($id, $_POST['template_content']);
            $this->show_message('edit_template_successed');
        }
    }

    function _get_template($id)
    {
        $user_template = ROOT_PATH . '/data/special_template/' . $id . '.html';
        $default_template = MODULE_ABSPATH . '/templates/specialpage.index.html';
        if (file_exists($user_template))
        {
            return file_get_contents($user_template);
        }
        else
        {
            return file_get_contents($default_template);
        }
    }
    function _save_template($id, $contents)
    {
        if (!ecm_mkdir(ROOT_PATH . '/data/special_template/'))
        {
            return false;
        }
        $user_template = ROOT_PATH . '/data/special_template/' . $id . '.html';
        return file_put_contents($user_template, stripslashes($contents));
    }
}

?>