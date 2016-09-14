<?php

define('THUMB_WIDTH', 300);
define('THUMB_HEIGHT', 300);
define('THUMB_QUALITY', 85);

/* 品牌申请状态 */
define('BRAND_PASSED', 1);
define('BRAND_REFUSE', 0);

/* 商品管理控制器 */
class My_goodsApp extends StoreadminbaseApp
{
    var $_goods_mod;
    var $_spec_mod;
    var $_image_mod;
    var $_uploadedfile_mod;
    var $_store_id;
    var $_brand_mod;
    var $_last_update_id;
	var $_promotion_mod;
		var $_gradegoods_mod; //by cngnlaeng
		var $_ju_mod;

    /* 构造函数 */
    function __construct()
    {
         $this->My_goodsApp();
    }

    function My_goodsApp()
    {
        parent::__construct();

        $this->_store_id  = intval($this->visitor->get('manage_store'));
        $this->_goods_mod =& bm('goods', array('_store_id' => $this->_store_id));
        $this->_spec_mod  =& m('goodsspec');
        $this->_image_mod =& m('goodsimage');
        $this->_uploadedfile_mod =& m('uploadedfile');
        $this->_brand_mod =& m('brand');
	$this->_ju_mod    =& m('ju');
		$this->_promotion_mod =&m('promotion');
				$this->_gradegoods_mod=&m('gradegoods');//by cengnlaeng
    }

    function index()
    {
        /* 取得店铺商品分类 */
        $this->assign('sgcategories', $this->_get_sgcategory_options());

        $conditions = $this->_get_conditions();
        $page = $this->_get_page();
        $page_nolimit = array();
        $goods_list = $this->_get_goods($conditions, $page);
        $all_goods = $this->_get_goods($conditions, $page_nolimit);      
        
        foreach ($goods_list as $key => $goods)
        {
            $goods_list[$key]['cate_name'] = $this->_goods_mod->format_cate_name($goods['cate_name']);
        }
        $this->assign('goods_list', $goods_list);
      
	    $page['item_count'] = $this->_goods_mod->getCount();
		
		$store_mod = &m('store');//xuewangzi20150125销量
		$store_info = $store_mod->get_info($this->_store_id);//xuewangzi20150125销量
        $this->_format_page($page);
        $this->assign('page_info', $page);
        $this->assign('order', $order);
        $this->assign('sort', $sort);
		$this->assign('store_info', $store_info);//xuewangzi20150125
        $this->import_resource(array(
            'script' => array(
                array(
                    'path' => 'dialog/dialog.js',
                    'attr' => 'id="dialog_js" charset="utf-8"',
                ),
                array(
                    'path' => 'jquery.ui/jquery.ui.js',
                    'attr' => 'charset="utf-8"',
                ),
                array(
                    'path' => 'jquery.plugins/jquery.validate.js',
                    'attr' => 'charset="utf-8"',
                ),
                array(
                    'path' => 'utils.js',
                    'attr' => 'charset="utf-8"',
                ),
            ),
            'style' =>  'jquery.ui/themes/ui-lightness/jquery.ui.css',
      ));
        /* 当前页面信息 */
        $this->_curlocal(LANG::get('member_center'), 'index.php?app=member',
                         LANG::get('my_goods'), 'index.php?app=my_goods',
                         LANG::get('goods_list'));
        $this->_curitem('goods_list');
        $this->_curmenu('goods_list');
        //$this->import_resource(array('script' => 'utils.js'));
        $this->_config_seo('title', Lang::get('member_center') . ' - ' . Lang::get('my_goods'));
        $this->assign('goods_ids', implode(',', array_keys($all_goods)));
        
        $store_mod  =& m('store');
        $store = $store_mod->get_info($this->_store_id);
        $this->assign('store', $store);
        $this->display('my_goods.index.html');
    }
    
    function truncate()
    {
        $id = isset($_POST['goods_ids']) ? trim($_POST['goods_ids']) : '';
        if (!$id)
        {
            $this->show_warning('no_goods_to_drop');
            return;
        }

        $ids = explode(',', $id);
        $this->_goods_mod->drop_data($ids);
        $rows = $this->_goods_mod->drop($ids);
        if ($this->_goods_mod->has_error())
        {
            $this->show_warning($this->_goods_mod->get_error());
            return;
        }

        $this->show_message(sprintf(Lang::get('truncate_ok'), $rows),
            'back_list', 'index.php?app=my_goods'
        );
    }
    
    function _get_goods($conditions, &$page)
    {
        if (intval($_GET['sgcate_id']) > 0)
        {
            $cate_mod =& bm('gcategory', array('_store_id' => $this->_store_id));
            $cate_ids = $cate_mod->get_descendant_ids(intval($_GET['sgcate_id']));
        }
        else
        {
            $cate_ids = 0;
        }

        // 标识有没有过滤条件
        if ($conditions != '1 = 1' || !empty($_GET['sgcate_id']))
        {
            $this->assign('filtered', 1);
        }

        //更新排序
        if (isset($_GET['sort']) && isset($_GET['order']))
        {
            $sort  = strtolower(trim($_GET['sort']));
            if (!in_array($sort,array('goods_name','cate_id','brand','price','stock','if_show','recommended','closed')))
            {
                $sort  = 'goods_id';
                $order = 'desc';
            }
            $order = strtolower(trim($_GET['order']));
            if (!in_array($order,array('asc','desc')))
            {
                $sort  = 'goods_id';
                $order = 'desc';
            }
        }
        else
        {
            $sort  = 'goods_id';
            $order = 'desc';
        }
        
        if ($page)
        {
            $limit = $page['limit'];
            $count = true;
        }
        else
        {
            $limit = '';
            $count = false;
        }

        /* 取得商品列表 */
        
        $goods_list = $this->_goods_mod->get_list(array(
            'conditions' => $conditions,
            'count' => $count,
            'order' => "$sort $order",
            'limit' => $limit,
        ), $cate_ids);
        return $goods_list;
    }
    
    function _get_conditions()
    {
        /* 搜索条件 */
        $conditions = "1 = 1";
        if (trim($_GET['keyword']))
        {
            $str = "LIKE '%" . trim($_GET['keyword']) . "%'";
            $conditions .= " AND (goods_name {$str} OR brand {$str} OR cate_name {$str})";
        }
        if ($_GET['character'])
        {
            switch ($_GET['character'])
            {
                case 'show':
                    $conditions .= " AND if_show = 1";
                    break;
                case 'hide':
                    $conditions .= " AND if_show = 0";
                    break;
                case 'closed':
                    $conditions .= " AND closed = 1";
                    break;
                case 'recommended':
                    $conditions .= " AND g.recommended = 1";
                    break;
            }
        }
        
        return $conditions;
    }

    function batch_edit()
    {
        if (!IS_POST)
        {
             /* 取得商品分类 */
             $this->assign('mgcategories', $this->_get_mgcategory_options(0)); // 商城分类第一级
             $this->assign('sgcategories', $this->_get_sgcategory_options());  // 店铺分类
		     $this->assign('ugrades', $this->_gradegoods_mod->get_grade_goods_info(0));  // 会员等级
             /* 当前页面信息 */
             $this->_curlocal(LANG::get('member_center'), 'index.php?app=member',
                              LANG::get('my_goods'), 'index.php?app=my_goods',
                              LANG::get('goods_add'));
             $this->_curitem('my_goods');
             $this->_curmenu('batch_edit');
             $this->_config_seo('title', Lang::get('member_center') . Lang::get('my_goods'));

             $this->headtag('<script type="text/javascript" src="{lib file=mlselection.js}"></script>');
             $this->import_resource(array(
                 'script' => array(
                     array(
                         'path' => 'mlselection.js',
                         'attr' => 'charset="utf-8"',
                     ),
                     array(
                         'path' => 'my_goods.js',
                         'attr' => 'charset="utf-8"',
                     ),
                     array(
                         'path' => 'jquery.plugins/jquery.validate.js',
                         'attr' => 'charset="utf-8"',
                     ),
                 ),
             ));
			  $this->assign('integral_open',Conf::get('integral_enabled')); // by 1hao5 判断系统是否开启积分功能
             $this->display('my_goods.batch.html');
        }
        else
        {
             $id = isset($_POST['id']) ? trim($_POST['id']) : '';
             if (!$id)
             {
                 $this->show_warning('Hacking Attempt');
                 return;
             }

             $ids = explode(',', $id);
             $ids = $this->_goods_mod->get_filtered_ids($ids); // 过滤掉非本店goods_id
             // edit goods
             $data = array();
             if ($_POST['cate_id'] > 0)
             {
                 if (!$this->_check_mgcate($_POST['cate_id']))
                 {
                     $this->show_warning('select_leaf_category');
                     return;
                 }
                 $data['cate_id'] = $_POST['cate_id'];
                 $data['cate_name'] = $_POST['cate_name'];
             }
             
             if (trim($_POST['brand']))
             {
                 $data['brand'] = trim($_POST['brand']);
             }
             if ($_POST['if_show'] >= 0)
             {
                 $data['if_show'] = $_POST['if_show'] ? 1 : 0;
             }
             if ($_POST['recommended'] >= 0)
             {
                 $data['recommended'] = $_POST['recommended'] ? 1 : 0;
             }
			 //by cengnlaeng
			 if ($_POST['if_open'] >= 0)
             {
                 $data['if_open'] = intval($_POST['if_open']);
             }
             if ($data)
             {
                 $this->_goods_mod->edit($ids, $data);
             }
			//编辑会员折扣
             // edit category_goods
			 $grade_discount=$this->_gradegoods_mod->get_post_grade_info($_POST['grade_id'],$_POST['grade'],$_POST['grade_discount']);
			 if($grade_discount)
			 {
				 foreach($ids as $id){
					$this->_gradegoods_mod->save_grade_info($id,$grade_discount);
				 }
			 }
             $cate_ids = array();
             foreach ($_POST['sgcate_id'] as $cate_id)
             {
                 if ($cate_id)
                 {
                     $cate_ids[] = intval($cate_id);
                 }
             }
             $cate_ids = array_unique($cate_ids);
             if (!empty($cate_ids))
             {
                 foreach ($ids as $goods_id)
                 {
                     $this->_goods_mod->unlinkRelation('belongs_to_gcategory', $goods_id);
                     $this->_goods_mod->createRelation('belongs_to_gcategory', $goods_id, $cate_ids);
                 }
             }
             // edit category_goods xuewangzi20150125
             $cate_ids = array();
             foreach ($_POST['sgcate_id'] as $cate_id)
             {
                 if ($cate_id)
                 {
                     $cate_ids[] = intval($cate_id);
                 }
             }
    
             // edit goods_spec
             $sql = "";
             if ($_POST['price_change'])
             {
                 $delta_price = $this->_filter_price($_POST['price']); // 价格变化量
                 switch ($_POST['price_change'])
                 {
                     case 'change_to':
                         $sql .= "price = '" . $delta_price . "'";
                         break;
                     case 'inc_by':
                         $sql .= "price = price + '" . $delta_price . "'";
                         break;
                     case 'dec_by':
                         
                         $sql .= "price = IF((price - '" . $delta_price . "') <0 , 0, price - '" . $delta_price . "')";
                         break;
                 }
             }
             if ($sql)
             {
                 $this->_spec_mod->edit("goods_id" . db_create_in($ids), $sql);
                 $this->_goods_mod->edit($ids, $sql);
             }

             $sql = "";
             if ($_POST['stock_change'])
             {
                 $delta_stock = intval($_POST['stock']); // 库存变化量
                 switch ($_POST['stock_change'])
                 {
                     case 'change_to':
                         $sql .= "stock = '" . $delta_stock . "'";
                         break;
                     case 'inc_by':
                         $sql .= "stock = stock + '" . $delta_stock . "'";
                         break;
                     case 'dec_by':
                         $sql .= "stock = IF((stock - '" . $delta_stock . "') <0 , 0, stock - '" . $delta_stock . "')";
                         break;
                 }
             }
             if ($sql)
             {
                 $this->_spec_mod->edit("goods_id" . db_create_in($ids), $sql);
             }
			   /*如果商品开启了积分功能，则可以批量编辑积分最多抵扣额度 by xiaozhuge */
			 if(Conf::get('integral_enabled'))
			 {
			 $goods_integral_mod = &m('goods_integral');
			 $sql = "";
			 $delta_integral = intval($_POST['max_exchange']); // 积分最大抵扣变化量
             if ($_POST['integral_change'])
             {
                 switch ($_POST['integral_change'])
                 {
                     case 'change_to':
                         $sql .= "max_exchange = '" . $delta_integral . "'";
                         break;
                     case 'inc_by':
                         $sql .= "max_exchange = max_exchange + '" . $delta_integral . "'";
                         break;
                     case 'dec_by':
                         $sql .= "max_exchange = IF((max_exchange - '" . $delta_integral . "') <0 , 0, max_exchange - '" . $delta_integral . "')";
                         break;
					case 'perc_by':
                         $sql .= "max_exchange = max_exchange * '".$delta_integral."'";
                         break;
                 }

             }
             if ($sql)
             {
				 $ids_edit = array();
				 $data_add = array();
				 foreach($ids as $id)
				 {
					 if($goods_integral_mod->get($id))
					 {
						 $ids_edit[] = $id;
					 }
					 else
					 {
						 $data_add[] = array('goods_id'=>$id,'has_integral'=>0,'max_exchange'=>($_POST['integral_change'] == 'dec_by') ? 0 : $delta_integral);
					 }
				 }
				 //print_r($ids_edit);
                 $goods_integral_mod->edit($ids_edit, $sql);
				 $goods_integral_mod->add($data_add);
             }
			 }
			/* end  xiaozhuge */
			 
			$cache_server =& cache_server();
        	$cache_server->clear();
				
             $ret_page = isset($_GET['ret_page']) ? intval($_GET['ret_page']) : 1;
             $this->show_message('edit_ok',
                 'back_list', 'index.php?app=my_goods&page=' . $ret_page);
        }
    }

    /* 检查商品分类：添加、编辑商品表单验证时用到 */
    function check_mgcate()
    {
        $cate_id = isset($_GET['cate_id']) ? intval($_GET['cate_id']) : 0;

        echo ecm_json_encode($this->_check_mgcate($cate_id));
    }

    function export_ubbcode()
    {
        $code = '';
        $crlf = "\n";
        $goods_id = isset($_GET['id']) ? intval($_GET['id']) : 0;
        $goods_info = $this->_get_goods_info($goods_id);

        /* 默认图片 */
        $goods_info['default_image'] && $code .= '[img]' . SITE_URL . '/' . $goods_info['default_image'] . '[/img]' . $crlf;

        /* 商品名称 */
        $code .= '[b]' . Lang::get('goods_name') . ':[/b]' . addslashes($goods_info['goods_name']) . $crlf ;

        /* 品牌 */
        $goods_info['brand'] && $code .= '[b]' . Lang::get('brand_name') . ':[/b]' . addslashes($goods_info['brand']) . $crlf;

        /* 规格 */
        if ($goods_info['spec_qty'] == 0)
        {
            $code .= '[b]' . Lang::get('price') . ':[/b][color=Red]' . str_replace('&yen;', ' RMB', price_format($goods_info['price'])) . '[/color]' . $crlf;
        }
        elseif ($goods_info['spec_qty'] == 1 || $goods_info['spec_qty'] == 2)
        {
            $code .= '[b]' . Lang::get('price') . ':[/b]';
            foreach ($goods_info['_specs'] as $goods)
            {
                 $code .=  addslashes($goods['spec_1']) . '  ' . addslashes($goods['spec_2']) . '[color=Red]' . str_replace('&yen;', ' RMB', price_format($goods_info['price'])) . "[/color]\t";
            }
            $code .= $crlf;
        }

        /* 购买地址 */
        $url = SITE_URL . '/' . url('app=goods&id=' . $goods_info['goods_id']);
        $url = str_replace('&amp;', '&' , $url);
        $code .= '[b]' . Lang::get('buy_now') . ':[/b]' . '[url=' .$url . ']' . $url . '[/url]';
        $this->assign('code', $code);
        $this->assign('alert_code', str_replace("\n", '\\n', $code));

        header("Content-type:text/html;charset=" . CHARSET, true);
        $this->display('export_ubbcode.html');
    }

    /**
     * 检查商品分类（必选，且是叶子结点）
     *
     * @param   int     $cate_id    商品分类id
     * @return  bool
     */
    function _check_mgcate($cate_id)
    {
        if ($cate_id > 0)
        {
            $gcategory_mod =& bm('gcategory');
            $info = $gcategory_mod->get_info($cate_id);
            if ($info && $info['if_show'] && $gcategory_mod->is_leaf($cate_id))
            {
                return true;
            }
        }

        return false;
    }

    function add()
    {

        /* 检测支付方式、配送方式、商品数量等 */
        if (!$this->_addible()) {
            return;
        }

        if (!IS_POST)
        {
             /* 添加传给iframe空的id,belong*/
             $this->assign("id", 0);
             $this->assign("belong", BELONG_GOODS);

             $this->assign('goods', $this->_get_goods_info(0));

             /* 取得游离状的图片 */
             $goods_images =array();
             $desc_images =array();
             $uploadfiles = $this->_uploadedfile_mod->find(array(
                 'join' => 'belongs_to_goodsimage',
                 'conditions' => "belong=".BELONG_GOODS." AND item_id=0 AND store_id=".$this->_store_id,
                 'order' => 'add_time ASC'
             ));
             foreach ($uploadfiles as $key => $uploadfile)
             {
                 if ($uploadfile['goods_id'] == null)
                 {
                     $desc_images[$key] = $uploadfile;
                 }
                 else
                 {
                     $goods_images[$key] = $uploadfile;
                 }
             }

             $this->assign('goods_images', $goods_images);
             $this->assign('desc_images', $desc_images);
             /* 取得商品分类 */
             $this->assign('mgcategories', $this->_get_mgcategory_options(0)); // 商城分类第一级
             $this->assign('sgcategories', $this->_get_sgcategory_options());  // 店铺分类

             /* 当前页面信息 */
             $this->_curlocal(LANG::get('member_center'), 'index.php?app=member',
                              LANG::get('my_goods'), 'index.php?app=my_goods',
                              LANG::get('goods_add'));
             $this->_curitem('my_goods');
             $this->_curmenu('goods_add');
             $this->_config_seo('title', Lang::get('member_center') . ' - ' . Lang::get('goods_add'));

             /* 商品图片批量上传器 */
             $this->assign('images_upload', $this->_build_upload(array(
                 'obj' => 'GOODS_SWFU',
                 'belong' => BELONG_GOODS,
                 'item_id' => 0,
                 'button_text' => Lang::get('bat_upload'),
                 'progress_id' => 'goods_upload_progress',
                 'upload_url' => 'index.php?app=swfupload&instance=goods_image',
                 'if_multirow' => 1,
             )));

             /* 编辑器图片批量上传器 */
             $this->assign('editor_upload', $this->_build_upload(array(
                 'obj' => 'EDITOR_SWFU',
                 'belong' => BELONG_GOODS,
                 'item_id' => 0,
                 'button_text' => Lang::get('bat_upload'),
                 'button_id' => 'editor_upload_button',
                 'progress_id' => 'editor_upload_progress',
                 'upload_url' => 'index.php?app=swfupload&instance=desc_image',
                 'if_multirow' => 1,
                 'ext_js' => false,
                 'ext_css' => false,
             )));

             $this->import_resource(array(
                 'script' => array(
                     array(
                         'path' => 'mlselection.js',
                         'attr' => 'charset="utf-8"',
                     ),
                     array(
                         'path' => 'jquery.plugins/jquery.validate.js',
                         'attr' => 'charset="utf-8"',
                     ),
                     array(
                         'path' => 'jquery.ui/jquery.ui.js',
                         'attr' => 'charset="utf-8"',
                     ),
                     array(
                         'path' => 'my_goods.js',
                         'attr' => 'charset="utf-8"',
                     ),
                     array(
                         'attr' => 'id="dialog_js" charset="utf-8"',
                         'path' => 'dialog/dialog.js',
                     ),
                 ),
                 'style' =>  'jquery.ui/themes/ui-lightness/jquery.ui.css',
             ));
             
             /* 所见即所得编辑器 */
             extract($this->_get_theme());
             $this->assign('build_editor', $this->_build_editor(array(
                 'name' => 'description',
                 'content_css' => SITE_URL . "/themes/store/{$template_name}/styles/{$style_name}" . '/shop.css', // for preview
             )));
              $this->assign('integral_open',Conf::get('integral_enabled')); // by 1hao5 判断系统是否开启积分功能
             $this->display('my_goods.form.html');
        }
        else
        {
            /* 取得数据 */
            $data = $this->_get_post_data(0);
            /* 检查数据 */
            if (!$this->_check_post_data($data, 0))
            {
                $this->show_warning($this->get_error());
                return;
            }
            /* 保存数据 */
            if (!$this->_save_post_data($data, 0))
            {
                $this->show_warning($this->get_error());
                return;
            }
            $goods_info = $this->_get_goods_info($this->_last_update_id);
            if ($goods_info['if_show'])
            {
                $goods_url = SITE_URL . '/' . url('app=goods&id=' . $goods_info['goods_id']);
                $feed_images = array();
                $feed_images[] = array(
                    'url'   => SITE_URL . '/' . $goods_info['default_image'],
                    'link'  => $goods_url,
                );
                $this->send_feed('goods_created', array(
                    'user_id' => $this->visitor->get('user_id'),
                    'user_name' => $this->visitor->get('user_name'),
                    'goods_url' => $goods_url,
                    'goods_name' => $goods_info['goods_name'],
                    'images' => $feed_images
                ));
            }
			
			//  sku tyioocom  保存商品属性
			if(isset($_POST['props']))
			{
				$goods_pvs_mod = &m('goods_pvs');
				
				// 空值处理
				foreach($_POST['props'] as $key=>$val){
					if(empty($val)){
						unset($_POST['props'][$key]);
					}
				}
				
				// 生成如 6:1;20:4 的字符串
				$prop_str = implode(';',$_POST['props']);
				
				$goods_pvs = array(
				   'goods_id'=> $goods_info['goods_id'],
				   'pvs'     => $prop_str
				);
				$goods_pvs_mod->add($goods_pvs);
			}
			//  end  sku
			
            $this->show_message('add_ok',
                'back_list', 'index.php?app=my_goods',
                'continue_add', 'index.php?app=my_goods&amp;act=add'
            );
        }
    }

    function edit()
    {
        import('image.func');
        import('uploader.lib');
        $id = empty($_GET['id']) ? 0 : intval($_GET['id']);
        if (!IS_POST)
        {
            /* 传给iframe id */
            $this->assign('id', $id);
            $this->assign('belong', BELONG_GOODS);
            if(!$id || !($goods = $this->_get_goods_info($id)))
            {
                $this->show_warning('no_such_goods');
                return;
            }
            $goods['tags'] = trim($goods['tags'], ',');
            $this->assign('goods', $goods);
            /* 取到商品关联的图片 */
            $uploadedfiles = $this->_uploadedfile_mod->find(array(
                'fields' => "f.*,goods_image.*",
                'conditions' => "store_id=".$this->_store_id." AND belong=".BELONG_GOODS." AND item_id=".$id,
                'join'       => 'belongs_to_goodsimage',
                'order' => 'add_time ASC'
            ));
            $default_goods_images = array(); // 默认商品图片
            $other_goods_images = array(); // 其他商品图片
            $desc_images = array(); // 描述图片
            /*if (!empty($goods['default_image']))
            {
                   $goods_images
            }*/
            foreach ($uploadedfiles as $key => $uploadedfile)
            {
                if ($uploadedfile['goods_id'] == null)
                {
                    $desc_images[$key] = $uploadedfile;
                }
                else
                {
                    if (!empty($goods['default_image']) && ($uploadedfile['thumbnail'] == $goods['default_image']))
                    {
                        $default_goods_images[$key] = $uploadedfile;
                    }
                    else
                    {
                        $other_goods_images[$key] = $uploadedfile;
                    }
                }
            }

            $this->assign('goods_images', array_merge($default_goods_images, $other_goods_images));
            $this->assign('desc_images', $desc_images);

            /* 取得商品分类 */
            $this->assign('mgcategories', $this->_get_mgcategory_options(0)); // 商城分类第一级
            $this->assign('sgcategories', $this->_get_sgcategory_options());  // 店铺分类

            /* 当前页面信息 */
            $this->_curlocal(LANG::get('member_center'), 'index.php?app=member',
                             LANG::get('my_goods'), 'index.php?app=my_goods',
                             LANG::get('goods_list'));
            $this->_curitem('my_goods');
            $this->_curmenu('edit_goods');
            $this->_config_seo('title', Lang::get('member_center') . ' - ' . Lang::get('edit_goods'));

            $this->import_resource(array(
                'script' => array(
                    array(
                         'path' => 'mlselection.js',
                         'attr' => 'charset="utf-8"',
                    ),
                    array(
                         'path' => 'jquery.plugins/jquery.validate.js',
                         'attr' => 'charset="utf-8"',
                    ),
                    array(
                         'path' => 'jquery.ui/jquery.ui.js',
                         'attr' => 'charset="utf-8"',
                    ),
                    array(
                         'path' => 'my_goods.js',
                         'attr' => 'charset="utf-8"',
                     ),
                    array(
                        'attr' => 'id="dialog_js" charset="utf-8"',
                        'path' => 'dialog/dialog.js',
                    ),
                ),
                'style' =>  'jquery.ui/themes/ui-lightness/jquery.ui.css',
            ));

            /* 商品图片批量上传器 */
            $this->assign('images_upload', $this->_build_upload(array(
                'obj' => 'GOODS_SWFU',
                'belong' => BELONG_GOODS,
                'item_id' => $id,
                'button_text' => Lang::get('bat_upload'),
                'progress_id' => 'goods_upload_progress',
                'upload_url' => 'index.php?app=swfupload&instance=goods_image',
                'if_multirow' => 1,
            )));

            /* 编辑器图片批量上传器 */
            $this->assign('editor_upload', $this->_build_upload(array(
                'obj' => 'EDITOR_SWFU',
                'belong' => BELONG_GOODS,
                'item_id' => $id,
                'button_text' => Lang::get('bat_upload'),
                'button_id' => 'editor_upload_button',
                'progress_id' => 'editor_upload_progress',
                'upload_url' => 'index.php?app=swfupload&instance=desc_image',
                'if_multirow' => 1,
                'ext_js' => false,
                'ext_css' => false,
            )));

            /* 所见即所得编辑器 */
            extract($this->_get_theme());
            $this->assign('build_editor', $this->_build_editor(array(
                'name' => 'description',
                'content_css' => SITE_URL . "/themes/store/{$template_name}/styles/{$style_name}" . '/shop.css', // for preview
            )));
			
			//  初始化商品属性  sku tyioocom 
			$cate_pvs_mod = &m('cate_pvs');
			$goods_pvs_mod = &m('goods_pvs');
			$props_mod = &m('props');
			$prop_value_mod = &m('prop_value');
			$cate_pvs = $cate_pvs_mod->get($goods['cate_id']);
			$goods_pvs = $goods_pvs_mod->get($goods['goods_id']);
			//$cpvs = $cate_pvs['pvs']; // 取出该分类的所有可用属性
			$prop_list = array();
			if(!empty($goods_pvs['pvs']) && !empty($cate_pvs['pvs']))
			{
				$gpvs = explode(';',$goods_pvs['pvs']);// 取出该商品的所有属性  $cpvs >= $gpvs,用来设置 checked=checked
			    $pv_arr = explode(';',$cate_pvs['pvs']);
			    $i=0;
			    // 属性数组拼装处理，返回  array([pid]=>1...[values]=>array([vid]=>1...))
				
				
				/* 检查属性名和属性值是否存在，有可能是之前有，但后面删除了 */
				foreach($pv_arr as $key=>$pv)
				{
					if($pv)
				 	{
					   	$item = explode(':',$pv);
					    $check_prop = $props_mod->get(array('conditions'=>'pid='.$item[0].' AND status=1','fields'=>'pid'));
					   
					   	// 如果属性名存在，则检查该属性名下的当前属性值是否存在
					   	if($check_prop)
					   	{
						   	$check_prop_value = $prop_value_mod->get(array('conditions'=>'pid='.$item[0].' AND vid='.$item[1].' and status=1','fields'=>'vid'));
						   	if(!$check_prop_value){
							   	unset($pv_arr[$key]);
						   	}
					   	} else {
						   	unset($pv_arr[$key]);
					  	}
					  }
				 }
			  
			  
			  // print_r($pv_arr);exit;
			   foreach($pv_arr as $key=>$pv)
			   {
				   $item = explode(':',$pv);
				   $props = $props_mod->get(array('conditions'=>'status=1 and pid='.$item[0],'fields'=>'name,pid'));
				   $prop_list[$item[0]] = $props;
				   if ($pid!=$item[0]) { // 不是同一个 pid 的属性值，不做累加
				      $prop_value = array();
					  $pid = $item[0];
					  $i=0;
				   }
				   $prop_value[] = $prop_value_mod->get(array('conditions'=>'status=1 and vid='.$item[1],'fields'=>'prop_value,vid,pid'));
				   if(in_array($pv,$gpvs)) {
				      $prop_value[$i++]['selected'] =1;
				   }
				   else{
					   $prop_value[$i++]['selected'] =0;
				   }
				   $prop_list[$item[0]] += array('value'=>$prop_value);
			   }
			}
			//print_r($props_list);exit;
			$this->assign('prop_list',$prop_list);
			
			
			// end sku
			
			
             $this->assign('integral_open',Conf::get('integral_enabled')); // by 1hao5 判断系统是否开启积分功能
            $this->display('my_goods.form.html');
        }
        else
        {
            /* 取得数据 */
            $data = $this->_get_post_data($id);

            /* 检查数据 */
            if (!$this->_check_post_data($data, $id))
            {
                $this->show_warning($this->get_error());
                return;
            }
            /* 保存商品 */
            if (!$this->_save_post_data($data, $id))
            {
                $this->show_warning($this->get_error());
                return;
            }
			//  sku tyioocom  保存商品属性
			if(isset($_POST['props']))
			{
				$goods_pvs_mod = &m('goods_pvs');
				
				// 空值处理
				foreach($_POST['props'] as $key=>$val){
					if(empty($val)){
						unset($_POST['props'][$key]);
					}
				}
				
				// 生成如 6:1;20:4 的字符串
				$prop_str = implode(';',$_POST['props']);
				
				$goods_pvs = array(
				   'goods_id'=> $id,
				   'pvs'     => $prop_str
				);
				if($goods_pvs_mod->get($id)) {
					$goods_pvs_mod->edit($id,$goods_pvs);
				}
				else {
					$goods_pvs_mod->add($goods_pvs);
				}
			}
			//  end  sku
			
			$cache_server =& cache_server();
        	$cache_server->delete('page_of_goods_'.$id);
			
			$ret_page = isset($_GET['ret_page']) ? intval($_GET['ret_page']) : 1;
            $this->show_message('edit_ok',
                'back_list', 'index.php?app=my_goods&page='.$ret_page,
                'edit_again', 'index.php?app=my_goods&amp;act=edit&amp;id=' . $id);
        }
    }

   function spec_edit()
   {
        $id = isset($_GET['id']) ? intval($_GET['id']) : 0;
        if (!IS_POST)
        {
            $goods_spec = $this->_goods_mod->findAll(array(
                'fields' => "this.goods_name,this.goods_id,this.spec_name_1,this.spec_name_2",
                'conditions' => "goods_id = $id",
                'include' => array('has_goodsspec' => array('order'=>'spec_id')),
            ));

            header('Content-Type:text/html;charset=' . CHARSET);
            $this->assign('goods', current($goods_spec));
            $this->display("spec_edit.html");
        }
        else
        {
            $data = $this->save_spec($_POST);
            if (empty($data))
            {
                $this->pop_warning('not_data');
            }
            $default_spec = array(); // 更新商品中默认规格的信息
            foreach ($data as $key => $val)
            {
                if (empty($default_spec))
                {
                    $default_spec = array('price' => $val['price']);
                }
                $this->_spec_mod->edit($key, $val);
            }
            $this->_goods_mod->edit($id, $default_spec);
            $this->pop_warning('ok', 'my_goods_spec_edit');
        }
   }

   function save_spec($spec)
   {
        $data = array();
        if (empty($spec['price']) || empty($spec['stock']))
        {
            return $data;
        }
        foreach ($spec['price'] as $key => $val)
        {
            $data[$key]['price'] = $this->_filter_price($val);
        }
        foreach ($spec['stock'] as $key => $val)
        {
            $data[$key]['stock'] = intval($val);
        }
        return $data;
   }
     //异步修改数据
   function ajax_col()
   {
       $id        = empty($_GET['id']) ? 0 : intval($_GET['id']);
       $column = empty($_GET['column']) ? '' : trim($_GET['column']);
       $value  = isset($_GET['value']) ? trim($_GET['value']) : '';
       $data      = array('goods' => array(),
                          'specs' => array(),
                          'cates' => array());
       if (in_array($column ,array('goods_name','description', 'cate_id', 'cate_name', 'brand', 'spec_qty','if_show','closed','recommended')))
       {
           $data['goods'][$column] = $value;
           $this->_goods_mod->edit($id, $data['goods']);
           if(!$this->_goods_mod->has_error())
           {
               $result = $this->_goods_mod->get_info($id);
               $this->json_result($result[$column]);
               return;
           }
           else
           {
               $this->json_error($this->_goods_mod->get_error());
               return;
           }
       }
       elseif (in_array($column, array('price', 'stock', 'sku')))
       {
           if ($column == 'price')
           {
               $value = $this->_filter_price($value);
           }
           elseif ($column == 'stock')
           {
               $value = intval($value);
           }
       
           $data['specs'][$column] = $value;
           $this->_spec_mod->edit("goods_id = $id", $data['specs']);
           if(!$this->_spec_mod->has_error())
           {
               $result = $this->_spec_mod->get("goods_id = $id");
               //修改商品表中默认的字段的价格
               if ($column == 'price')
               {
                    $this->_goods_mod->edit($id, $data['specs']);
               }
               $this->json_result($result[$column]);
               return;
           }
           else
           {
               $this->json_error($this->_spec_mod->get_error());
               return;
           }

       }
       else
       {
           $this->json_error('unallow edit');
           return ;
       }
   }

    function drop()
    {
        $id = isset($_GET['id']) ? trim($_GET['id']) : '';
        if (!$id)
        {
            $this->show_warning('no_goods_to_drop');
            return;
        }

        $ids = explode(',', $id);
        $this->_goods_mod->drop_data($ids);
        $rows = $this->_goods_mod->drop($ids);
        if ($this->_goods_mod->has_error())
        {
            $this->show_warning($this->_goods_mod->get_error());
            return;
        }

        $this->show_message('drop_ok');
    }

    function unicodeToUtf8($str,$order="little")
    {
        $utf8string ="";
        $n=strlen($str);
        for ($i=0;$i<$n ;$i++ )
        {
            if ($order=="little")
            {
                $val = str_pad(dechex(ord($str[$i+1])), 2, 0, STR_PAD_LEFT) .
                       str_pad(dechex(ord($str[$i])),      2, 0, STR_PAD_LEFT);
            }
            else
            {
                $val = str_pad(dechex(ord($str[$i])),      2, 0, STR_PAD_LEFT) .
                       str_pad(dechex(ord($str[$i+1])), 2, 0, STR_PAD_LEFT);
            }
            $val = intval($val,16); // 由于上次的.连接，导致$val变为字符串，这里得转回来。
            $i++; // 两个字节表示一个unicode字符。
            $c = "";
            if($val < 0x7F)
            { // 0000-007F
                $c .= chr($val);
            }
            elseif($val < 0x800)
            { // 0080-07F0
                $c .= chr(0xC0 | ($val / 64));
                $c .= chr(0x80 | ($val % 64));
            }
            else
            { // 0800-FFFF
                $c .= chr(0xE0 | (($val / 64) / 64));
                $c .= chr(0x80 | (($val / 64) % 64));
                $c .= chr(0x80 | ($val % 64));
            }
            $utf8string .= $c;
        }
        /* 去除bom标记 才能使内置的iconv函数正确转换 */
        if (ord(substr($utf8string,0,1)) == 0xEF && ord(substr($utf8string,1,2)) == 0xBB && ord(substr($utf8string,2,1)) == 0xBF)
        {
            $utf8string = substr($utf8string,3);
        }
        return $utf8string;
    }

    

    function drop_image()
    {
        $id = empty($_GET['id']) ? 0 : intval($_GET['id']);
        $uploadedfile = $this->_uploadedfile_mod->get(array(
                  'conditions' => "f.file_id = '$id' AND f.store_id = '{$this->_store_id}'",
                  'join' => 'belongs_to_goodsimage',
                  'fields' => 'goods_image.image_url, goods_image.thumbnail, goods_image.image_id, f.file_id',
        ));
        if ($uploadedfile)
        {
            $this->_uploadedfile_mod->drop($id);
            if ($this->_image_mod->drop($uploadedfile['image_id']))
            {
                // 删除文件
                if (file_exists(ROOT_PATH . '/' . $uploadedfile['image_url']))
                {
                       @unlink(ROOT_PATH . '/' . $uploadedfile['image_url']);
                }
                if (file_exists(ROOT_PATH . '/' . $uploadedfile['thumbnail']))
                {
                       @unlink(ROOT_PATH . '/' . $uploadedfile['thumbnail']);
                }

                $this->json_result($id);
                return;
            }
            $this->json_result($id);
            return;
        }
        $this->json_error(Lang::get('no_image_droped'));
    }

    function _get_member_submenu()
    {
        if (ACT == 'index')
        {
            $menus = array(
                array(
                    'name' => 'goods_list',
                    'url'  => 'index.php?app=my_goods',
                ),
            );
        }
        else
        {
             $menus = array(
                 array(
                     'name' => 'goods_list',
                     'url'  => 'index.php?app=my_goods',
                 ),
                 array(
                     'name' => 'goods_add',
                     'url'  => 'index.php?app=my_goods&amp;act=add',
                 ),
             );
	     }
		if (ACT == 'recommend')
        {
            $menus[] = array(
                 'name' => 'recommend',
                 'url' => ''
             );
        }
        if (ACT == 'batch_edit')
        {
            $menus[] = array(
                'name' => 'batch_edit',
                'url'  => '',
            );
        }
        elseif (ACT == 'edit')
        {
            $menus[] = array(
                'name' => 'edit_goods',
                'url'  => '',
            );
        }
        return $menus;
    }

    /* 构造并返回树 */
    function &_tree($gcategories)
    {
        import('tree.lib');
        $tree = new Tree();
        $tree->setTree($gcategories, 'cate_id', 'parent_id', 'cate_name');
        return $tree;
    }

    /* 取得本店所有商品分类 */
    function _get_sgcategory_options()
    {
        $mod =& bm('gcategory', array('_store_id' => $this->_store_id));
        $gcategories = $mod->get_list();
        import('tree.lib');
        $tree = new Tree();
        $tree->setTree($gcategories, 'cate_id', 'parent_id', 'cate_name');
        return $tree->getOptions();
    }

    /* 取得商城商品分类，指定parent_id */
    function _get_mgcategory_options($parent_id = 0)
    {
        $res = array();
        $mod =& bm('gcategory', array('_store_id' => 0));
        $gcategories = $mod->get_list($parent_id, true);
        foreach ($gcategories as $gcategory)
        {
                  $res[$gcategory['cate_id']] = $gcategory['cate_name'];
        }
        return $res;
    }

    /**
     * 上传商品图片
     *
     * @param int $goods_id
     * @return bool
     */
    function _upload_image($goods_id)
    {
        import('image.func');
        import('uploader.lib');
        $uploader = new Uploader();
        $uploader->allowed_type(IMAGE_FILE_TYPE);
        $uploader->allowed_size(SIZE_GOODS_IMAGE); // 400KB

        /* 取得剩余空间（单位：字节），false表示不限制 */
        $store_mod  =& m('store');
        $settings      = $store_mod->get_settings($this->_store_id);
        $upload_mod =& m('uploadedfile');
        $remain        = $settings['space_limit'] > 0 ? $settings['space_limit'] * 1024 * 1024 - $upload_mod->get_file_size($this->_store_id) : false;

        $files = $_FILES['new_file'];
        foreach ($files['error'] as $key => $error)
        {
            if ($error == UPLOAD_ERR_OK)
            {
                /* 处理文件上传 */
                $file = array(
                    'name'            => $files['name'][$key],
                    'type'            => $files['type'][$key],
                    'tmp_name'  => $files['tmp_name'][$key],
                    'size'            => $files['size'][$key],
                    'error'        => $files['error'][$key]
                );
                $uploader->addFile($file);
                if (!$uploader->file_info())
                {
                    $this->_error($uploader->get_error());
                    return false;
                }

                /* 判断能否上传 */
                if ($remain !== false)
                {
                    if ($remain < $file['size'])
                    {
                        $this->_error('space_limit_arrived');
                        return false;
                    }
                    else
                    {
                        $remain -= $file['size'];
                    }
                }

                $uploader->root_dir(ROOT_PATH);
                $dirname      = 'data/files/store_' . $this->_store_id . '/goods_' . (time() % 200);
                $filename  = $uploader->random_filename();
                $file_path = $uploader->save($dirname, $filename);
                $thumbnail = dirname($file_path) . '/small_' . basename($file_path);
                make_thumb(ROOT_PATH . '/' . $file_path, ROOT_PATH . '/' . $thumbnail, THUMB_WIDTH, THUMB_HEIGHT, THUMB_QUALITY);

                /* 处理文件入库 */
                $data = array(
                    'store_id'  => $this->_store_id,
                    'file_type' => $file['type'],
                    'file_size' => $file['size'],
                    'file_name' => $file['name'],
                    'file_path' => $file_path,
                    'add_time'  => gmtime(),
                );
                $uf_mod =& m('uploadedfile');
                $file_id = $uf_mod->add($data);
                if (!$file_id)
                {
                    $this->_error($uf_mod->get_error());
                    return false;
                }

                /* 处理商品图片入库 */
                $data = array(
                    'goods_id'      => $goods_id,
                    'image_url'  => $file_path,
                    'thumbnail'  => $thumbnail,
                    'sort_order' => 255,
                    'file_id'       => $file_id,
                );
                if (!$this->_image_mod->add($data))
                {
                    $this->_error($this->_image_mod->get_error());
                    return false;
                }
            }
        }

        return true;
    }

    /**
     * 检测店铺是否能添加商品
     *
     */
    function _addible()
    {
      /*  $payment_mod =& m('payment');
        $payments = $payment_mod->get_enabled($this->_store_id);
        if (empty($payments))
        {
            $this->show_warning('please_install_payment', 'go_payment', 'index.php?app=my_payment');
                  return false;
        }*/

        $shipping_mod =& m('shipping');
        $shippings = $shipping_mod->find("store_id = '{$this->_store_id}' AND enabled = 1");
        if (empty($shippings))
        {
                  $this->show_warning('please_install_shipping', 'go_shipping', 'index.php?app=my_shipping');
                  return false;
        }

        /* 判断商品数是否已超过限制 */
        $store_mod =& m('store');
        $settings = $store_mod->get_settings($this->_store_id);
        if ($settings['goods_limit'] > 0)
        {
                  $goods_count = $this->_goods_mod->get_count();
                  if ($goods_count >= $settings['goods_limit'])
                  {
                         $this->show_warning('goods_limit_arrived');
                         return false;
                  }
        }
        return true;
    }
    /**
     * 保存远程图片
     */
    function _add_remote_image($goods_id)
    {
        foreach ($_POST['new_url'] as $image_url)
        {
            if ($image_url && $image_url != 'http://')
            {
                $data = array(
                    'goods_id' => $goods_id,
                    'image_url' => $image_url,
                    'thumbnail' => $image_url, // 远程图片暂时没有小图
                    'sort_order' => 255,
                    'file_id' => 0,
                );
                if (!$this->_image_mod->add($data))
                {
                    $this->_error($this->_image_mod->get_error());
                    return false;
                }
            }
        }

        return true;
    }
    /**
     * 编辑图片
     */
    function _edit_image($goods_id)
    {
        if (isset($_POST['old_order']))
        {
            foreach ($_POST['old_order'] as $image_id => $sort_order)
            {
                $data = array('sort_order' => $sort_order);
                if (isset($_POST['old_url'][$image_id]))
                {
                    $data['image_url'] = $_POST['old_url'][$image_id];
                }
                $this->_image_mod->edit("image_id = '$image_id' AND goods_id = '$goods_id'", $data);
            }
        }

        return true;
    }

    /**
     * 取得商品信息
     */
    function _get_goods_info($id = 0)
    {
        $default_goods_image = Conf::get('default_goods_image'); // 商城默认商品图片
        if ($id > 0)
        {
            $goods_info = $this->_goods_mod->get_info($id);
            if ($goods_info === false)
            {
                return false;
            }
            $goods_info['default_goods_image'] = $default_goods_image;
            if (empty($goods_info['default_image']))
            {
                   $goods_info['default_image'] = $default_goods_image;
            }
        }
        else
        {
            $goods_info = array(
                'cate_id' => 0,
                'if_show' => 1,
                'recommended' => 1,
                'price' => 1,
                'stock' => 1,
                'spec_qty' => 0,
                'spec_name_1' => Lang::get('color'),
                'spec_name_2' => Lang::get('size'),
                'default_goods_image' => $default_goods_image,
            );
        }
		//读取会员等级及对应的会员折扣 by cengnlaeng
		$goods_info['ugrades']=$this->_gradegoods_mod->get_grade_goods_info($id);
		//
        $goods_info['spec_json'] = ecm_json_encode(array(
            'spec_qty' => $goods_info['spec_qty'],
            'spec_name_1' => isset($goods_info['spec_name_1']) ? $goods_info['spec_name_1'] : '',
            'spec_name_2' => isset($goods_info['spec_name_2']) ? $goods_info['spec_name_2'] : '',
            'specs' => $goods_info['_specs'],
        ));
		/* 如果开启积分功能，则：读取商品积分设置 add by 1hao5 */
		if(Conf::get('integral_enabled'))
		{
			$goods_integral_mod =& m('goods_integral');
			$goods_integral = $goods_integral_mod->get($id);
			$goods_info += $goods_integral ? $goods_integral : array();
		}
		/*end by 1ho5*/
        return $goods_info;
    }

    /**
     * 提交的数据
     */
    function _get_post_data($id = 0)
    {
		
		if($_POST['recom'])
		{
		if($_POST['recom'] >  1)
		{
		$this->show_warning('分成不能大于1');
             return false;
		}
		
		}
		
		
        $goods = array(
            'goods_name'       => $_POST['goods_name'],
            'description'      => html_script($_POST['description']),
            'cate_id'             => $_POST['cate_id'],
            'cate_name'        => $_POST['cate_name'],
			   'recom'        =>$_POST['recom'],
            'brand'                  => $_POST['brand'],
            'if_show'             => $_POST['if_show'],
			'if_open'             => $_POST['if_open'],// by cengnlaeng
            'last_update'      => gmtime(),
            'recommended'      => $_POST['recommended'],
            'tags'             => html_script(trim($_POST['tags'])),
            'virtual_seles'  => $_POST['virtual_seles'],//xuewangzi20150125
        );
        $spec_name_1 = !empty($_POST['spec_name_1']) ? $_POST['spec_name_1'] : '';
        $spec_name_2 = !empty($_POST['spec_name_2']) ? $_POST['spec_name_2'] : '';
        if ($spec_name_1 && $spec_name_2)
        {
            $goods['spec_qty'] = 2;
        }
        elseif ($spec_name_1 || $spec_name_2)
        {
            $goods['spec_qty'] = 1;
        }
        else
        {
            $goods['spec_qty'] = 0;
        }

        $goods_file_id = array();
        $desc_file_id =array();
        if (isset($_POST['goods_file_id']))
        {
            $goods_file_id = $_POST['goods_file_id'];
        }
        if (isset($_POST['desc_file_id']))
        {
            $desc_file_id = $_POST['desc_file_id'];
        }
        if ($id <= 0)
        {
            $goods['type'] = 'material';
            $goods['closed'] = 0;
            $goods['add_time'] = gmtime();
        }

        $specs = array(); // 原始规格
        switch ($goods['spec_qty'])
        {
            case 0: // 没有规格
                $specs[intval($_POST['spec_id'])] = array(
                    'price' => $this->_filter_price($_POST['price']),
                    'stock' => intval($_POST['stock']),
                    'sku'      => trim($_POST['sku']),
                    'spec_id'  => trim($_POST['spec_id']),
                );
                break;
            case 1: // 一个规格
                $goods['spec_name_1'] = $spec_name_1 ? $spec_name_1 : $spec_name_2;
                $goods['spec_name_2'] = '';
                $spec_data = $spec_name_1 ? $_POST['spec_1'] : $_POST['spec_2'];
                foreach ($spec_data as $key => $spec_1)
                {
                    $spec_1 = trim($spec_1);
                    if ($spec_1)
                    {
                        if (($spec_id = intval($_POST['spec_id'][$key]))) // 已有规格ID的
                        {
                            $specs[$key] = array(
                                'spec_id' => $spec_id,
                                'spec_1' => $spec_1,
								'spec_2' => '',//xuewangzi20150118 编辑商品的时候，把如果商品原来有两个规格项，把其中的一个规格删除，删除的规格项仍然显
                                'price'  => $this->_filter_price($_POST['price'][$key]),
                                'stock'  => intval($_POST['stock'][$key]),
                                'sku'       => html_script(trim($_POST['sku'][$key])),
                            );
                        }
                        else  // 新增的规格
                        {
                            $specs[$key] = array(
                                'spec_1' => $spec_1,
                                'price'  => $this->_filter_price($_POST['price'][$key]),
                                'stock'  => intval($_POST['stock'][$key]),
                                'sku'       => html_script(trim($_POST['sku'][$key])),
                            );
                        }

                    }
                }
                break;
            case 2: // 二个规格
                $goods['spec_name_1'] = $spec_name_1;
                $goods['spec_name_2'] = $spec_name_2;
                foreach ($_POST['spec_1'] as $key => $spec_1)
                {
                    $spec_1 = trim($spec_1);
                    $spec_2 = trim($_POST['spec_2'][$key]);
                    if ($spec_1 && $spec_2)
                    {
                        if (($spec_id = intval($_POST['spec_id'][$key]))) // 已有规格ID的
                        {
                            $specs[$key] = array(
                                'spec_id'   => $spec_id,
                                'spec_1'    => $spec_1,
                                'spec_2'    => $spec_2,
                                'price'     => $this->_filter_price($_POST['price'][$key]),
                                'stock'     => intval($_POST['stock'][$key]),
                                'sku'       => html_script(trim($_POST['sku'][$key])),
                            );
                        }
                        else // 新增的规格
                        {
                            $specs[$key] = array(
                                'spec_1'    => $spec_1,
                                'spec_2'    => $spec_2,
                                'price'     => $this->_filter_price($_POST['price'][$key]),
                                'stock'     => intval($_POST['stock'][$key]),
                                'sku'       => html_script(trim($_POST['sku'][$key])),
                            );
                        }


                    }
                }
                break;
            default:
                break;
        }

        /* 分类 */
        $cates = array();
        if(!empty($_POST['sgcate_id'])){
            foreach ($_POST['sgcate_id'] as $cate_id)
            {
                if (intval($cate_id) > 0)
                {
                    $cates[$cate_id] = array(
                        'cate_id'      => $cate_id,
                    );
                }
            }
        }
		/*获取递交的会员折扣的信息*/
		$gradegoods = $this->_gradegoods_mod->get_post_grade_info($_POST['grade_id'],$_POST['grade'],$_POST['grade_discount']); 
		/* 如果开启积分功能，则：  增加积分设置 edit by xiaozhuge */
		if(Conf::get('integral_enabled'))
		{
			$goods_integral = array(
		      'has_integral' => $_POST['has_integral'],
		      'max_exchange' => $_POST['max_exchange']
		    );
			return array('goods_integral'=>$goods_integral,'goods' => $goods, 'gradegoods'=>$gradegoods, 'specs' => $specs, 'cates' => $cates, 'goods_file_id' => $goods_file_id, 'desc_file_id' => $desc_file_id);
		}
		else // 原来官方的写法
		{
     // return array('goods' => $goods,                             'specs' => $specs, 'cates' => $cates, 'goods_file_id' => $goods_file_id, 'desc_file_id' => $desc_file_id);xuewangzi20150126
		return array('goods' => $goods,  'gradegoods'=>$gradegoods, 'specs' => $specs, 'cates' => $cates, 'goods_file_id' => $goods_file_id, 'desc_file_id' => $desc_file_id);
		
		}
    }
		


    /**
     * 检查提交的数据
     */
    function _check_post_data($data, $id = 0)
    {
        if (!$this->_check_mgcate($data['goods']['cate_id']))
        {
            $this->_error('select_leaf_category');
            return;
        }
        if (!$this->_goods_mod->unique(trim($data['goods']['goods_name']), $id))
        {
            $this->_error('name_exist');
            return false;
        }
        if ($data['goods']['spec_qty'] == 1 && empty($data['goods']['spec_name_1'])
                  || $data['goods']['spec_qty'] == 2 && (empty($data['goods']['spec_name_1']) || empty($data['goods']['spec_name_2'])))
        {
            $this->_error('fill_spec_name');
            return false;
        }
        if (empty($data['specs']))
        {
            $this->_error('fill_spec');
            return false;
        }

            /* 如果开启积分功能，则： 检查店家是否拥有足够的积分  by xiaozhuge */
		if(Conf::get('integral_enabled'))
		{
			$total_integral = $this->_get_owner_total_integral($id);
			$stock = 0;
			foreach($data['specs'] as $spec) // 计算设置的库存量
			{
				$stock += $spec['stock'];
			}
			if($total_integral < $data['goods_integral']['has_integral'] * $stock) // 如果店家拥有的积分 小于 赠送的积分
			{
				$this->_error('你设置的赠送积分 '.$data['goods_integral']['has_integral'].'（积分） * '.$stock.'（库存） = '.$data['goods_integral']['has_integral'] * $stock.' 大于你账号中的积分总额：'.$total_integral);
				return false;
			}
		}
		/* 检查店家是否拥有足够的积分  end */

        return true;
    }
	/* 获取店家的总积分  by xiaozhuge */
	function _get_owner_total_integral($id)
	{
		$total_integral = 0;
		if ($id>0) // 如果是编辑商品，那么释放该商品对应的赠送积分值，以便累加到总积分中
		{
			$_goods_integral_mod = & m('goods_integral');
			$goods_integral = $_goods_integral_mod->get($id);
			$total_integral += $goods_integral['has_integral'];
		}
		$_integral_mod = & m('my_money');
		$integral = $_integral_mod->get("user_id=".$this->visitor->get('user_id'));
		$total_integral += $integral['jifen'];
		return $total_integral;		
	}
	/* 获取店家的总积分 end */

    function _format_goods_tags($tags)
    {
        if (!$tags)
        {
            return '';
        }
        $tags = explode(',', str_replace(Lang::get('comma'), ',', $tags));
        array_walk($tags, create_function('&$item, $key', '$item=trim($item);'));
        $tags = array_filter($tags);
        $tmp = implode(',', $tags);
        if (strlen($tmp) > 100)
        {
            $tmp = sub_str($tmp, 100, false);
        }

        return ',' . $tmp . ',';
    }

    /**
     * 保存数据
     */
    function _save_post_data($data, $id = 0)
    {
        import('image.func');
        import('uploader.lib');

        if ($data['goods']['tags'])
        {
            $data['goods']['tags'] = $this->_format_goods_tags($data['goods']['tags']);
        }

        /* 保存商品 */
        if ($id > 0)
        {
            // edit
            if (!$this->_goods_mod->edit($id, $data['goods']))
            {
                $this->_error($this->_goods_mod->get_error());
                return false;
            }

            $goods_id = $id;
				if(Conf::get('integral_enabled')){$this->_save_goods_integral($goods_id,$data['goods_integral'],'edit');} // 如果开启积分功能，则：更新商品积分设置  by  1hao5
        }
        else
        {
            // add
            $goods_id = $this->_goods_mod->add($data['goods']);
			if(Conf::get('integral_enabled')){$this->_save_goods_integral($goods_id,$data['goods_integral']);} //如果开启积分功能，则： 添加商品积分设置 by  1hao5
            if (!$goods_id)
            {
                $this->_error($this->_goods_mod->get_error());
                return false;
            }
            if (($data['goods_file_id'] || $data['desc_file_id'] ))
            {
                $uploadfiles = array_merge($data['goods_file_id'], $data['desc_file_id']);
                $this->_uploadedfile_mod->edit(db_create_in($uploadfiles, 'file_id'), array('item_id' => $goods_id));
            }
            if (!empty($data['goods_file_id']))
            {
                $this->_image_mod->edit(db_create_in($data['goods_file_id'], 'file_id'), array('goods_id' => $goods_id));
            }
        }
		/*保存会员价折扣 by cengnlaeng*/
		$this->_gradegoods_mod->save_grade_info($goods_id,$data['gradegoods']);
		//
        /* 保存规格 */
        if ($id > 0)
        {
            /* 删除的规格 */
            $goods_specs = $this->_spec_mod->find(array(
                'conditions' => "goods_id = '{$id}'",
                'fields' => 'spec_id, price' // 促销功能,需要price字段 tyioocom
            ));
            $drop_spec_ids = array_diff(array_keys($goods_specs), array_keys($data['specs']));
            if (!empty($drop_spec_ids))
            {
                $this->_spec_mod->drop($drop_spec_ids);
            }

        }
        $default_spec = array(); // 初始化默认规格
        foreach ($data['specs'] as $key => $spec)
        {
            if ($spec_id = $spec['spec_id']) // 更新已有规格ID
            {
                $this->_spec_mod->edit($spec_id,$spec);
            }
            else // 新加规格ID
            {
                $spec['goods_id'] = $goods_id;
                $spec_id = $this->_spec_mod->add($spec);
            }
            if (empty($default_spec))
            {
                $default_spec = array('default_spec' => $spec_id, 'price' => $spec['price']);
            }
        }

        /* 更新默认规格 */
        $this->_goods_mod->edit($goods_id, $default_spec);
        if ($this->_goods_mod->has_error())
        {
            $this->_error($this->_goods_mod->get_error());
            return false;
        }

        /* 保存商品分类 */
        $this->_goods_mod->unlinkRelation('belongs_to_gcategory', $goods_id);
        if ($data['cates'])
        {
            $this->_goods_mod->createRelation('belongs_to_gcategory', $goods_id, $data['cates']);
        }

        /* 设置默认图片 */
        if (isset($data['goods_file_id'][0]))
        {
            $default_image = $this->_image_mod->get(array(
                'fields' => 'thumbnail',
                'conditions' => "goods_id = '$goods_id' AND file_id = '{$data[goods_file_id][0]}'",
            ));
            $this->_image_mod->edit("goods_id = $goods_id", array('sort_order' => 255));
            $this->_image_mod->edit("goods_id = $goods_id AND file_id = '{$data[goods_file_id][0]}'", array('sort_order' => 1));
        }

        $this->_goods_mod->edit($goods_id, array(
            'default_image' => $default_image ? $default_image['thumbnail'] : '',
        ));

        $this->_last_update_id = $goods_id;

        return true;
    }
	
	/* 保存商品积分设置 add by 1hao5 */
	function _save_goods_integral($goods_id,$data)
	{
		$goods_integral_mod =& m('goods_integral');
		if ($goods_integral_mod->get($goods_id)) // 积分设置已经存在，则修改积分设置
		{
			$goods_integral_mod->edit($goods_id,$data);
		}
		else
		{
			$data['goods_id'] = $goods_id;
			$goods_integral_mod->add($data);
		}
	}

    
    
    function _upload_logo($brand_id)
    {
        $file = $_FILES['brand_logo'];
        if ($file['error'] == UPLOAD_ERR_NO_FILE || !isset($_FILES['brand_logo'])) // 没有文件被上传
        {
            return '';
        }
        import('uploader.lib');             //导入上传类
        $uploader = new Uploader();
        $uploader->allowed_type(IMAGE_FILE_TYPE); //限制文件类型
        $uploader->addFile($_FILES['brand_logo']);//上传logo
        if (!$uploader->file_info())
        {
            $this->pop_warning($uploader->get_error());
            if (ACT == 'brand_apply')
            {
                $m_brand = &m('brand');
                $m_brand->drop($brand_id);
            }            
            return false;
        }
        /* 指定保存位置的根目录 */
        $uploader->root_dir(ROOT_PATH);

        /* 上传 */
        if ($file_path = $uploader->save('data/files/mall/brand', $brand_id))   //保存到指定目录，并以指定文件名$brand_id存储
        {
            return $file_path;
        }
        else
        {
            return false;
        }
    }
    
    /* 价格过滤，返回非负浮点数 */
    function _filter_price($price)
    {
        return abs(floatval($price));
    }
	
	//  sku tyioocom  
	
	// 异步加载指定商品分类 cate_id 下的属性列表
	function ajax_props()
	{
		$cate_pvs_mod = &m('cate_pvs');
		$props_mod = &m('props');
		$prop_value_mod = &m('prop_value');
		$cate_id = empty($_GET['cate_id']) ? 0 : $_GET['cate_id'];
		$cate_pvs = $cate_pvs_mod->get($cate_id);
		$pv_arr = explode(';',$cate_pvs['pvs']);
		$data = array();
		$pid = '';
		//  先排序
		foreach ($pv_arr as $key => $row) {
			$volume[$key]  = $row[0];
		}
		array_multisort($volume,SORT_DESC,$pv_arr); // 排序后才能做以下 $pid!=$item[0] 的判断
		
		
		/* 检查属性名和属性值是否存在，有可能是之前有，但后面删除了 */
		foreach($pv_arr as $key=>$pv)
		{
			if($pv)
			{
				$item = explode(':',$pv);
				$check_prop = $props_mod->get(array('conditions'=>'pid='.$item[0].' AND status=1','fields'=>'pid'));
					   
				// 如果属性名存在，则检查该属性名下的当前属性值是否存在
				if($check_prop)
				{
					$check_prop_value = $prop_value_mod->get(array('conditions'=>'pid='.$item[0].' AND vid='.$item[1].' and status=1','fields'=>'vid'));
						if(!$check_prop_value){
							unset($pv_arr[$key]);
						}
				} else {
					unset($pv_arr[$key]);
				}
			}
		}
		
		
		// 解析每一项属性名和属性值
		if(!empty($cate_pvs))
		{
			foreach($pv_arr as $key=>$pv)
			{
				$item = explode(':',$pv);
				$props = $props_mod->get(array('conditions'=>'status=1 and pid='.$item[0],'fields'=>'name,pid'));
				$data[$item[0]] = $props;
			
				if ($pid!=$item[0]) { // 不是同一个 pid 的属性值，不做累加
			    	$prop_value = array();
					$pid = $item[0];
				}
				$prop_value[] = $prop_value_mod->get(array('conditions'=>'status=1 and pid='.$item[0].' and vid='.$item[1],'fields'=>'prop_value,vid,pid'));;
				$data[$item[0]] += array('value'=>$prop_value);
				
			}
			//print_r($this->json_result(array_values($data)));exit;
		}
		$this->json_result(array_values($data));
		
	}
	// end sku
	
		/* 推荐商品到 */
    function recommend()
    {
        if (!IS_POST)
        {
			$this->_curlocal(LANG::get('member_center'), 'index.php?app=member',
                         LANG::get('my_goods'), 'index.php?app=my_goods',
                         LANG::get('recommend'));
        	$this->_curitem('my_goods');
        	$this->_curmenu('recommend');
            /* 取得推荐类型 */
            $recommend_mod =& bm('recommend', array('_store_id' => $this->_store_id));
            $recommends = $recommend_mod->get_options();
            if (!$recommends)
            {
                $this->show_warning('no_recommends', 'go_back', 'javascript:history.go(-1);', 'set_recommend', 'index.php?app=my_recommend');
                return;
            }
            $this->assign('recommends', $recommends);
            $this->display('my_goods.recom.html');
        }
        else
        {
            $id = isset($_GET['id']) ? trim($_GET['id']) : '';
            if (!$id)
            {
                $this->show_warning('Hacking Attempt');
                return;
            }

            $recom_id = empty($_POST['recom_id']) ? 0 : intval($_POST['recom_id']);
            if (!$recom_id)
            {
                $this->show_warning('recommend_required');
                return;
            }

            $ids = explode(',', $id);
            $recom_mod =& bm('recommend', array('_store_id' => $this->_store_id));
            $recom_mod->createRelation('recommend_goods', $recom_id, $ids);
            $ret_page = isset($_GET['ret_page']) ? intval($_GET['ret_page']) : 1;
            $this->show_message('recommend_ok',
                'back_list', 'index.php?app=my_goods&page=' . $ret_page,
                'view_recommended_goods', 'index.php?app=my_recommend&amp;act=view_goods&amp;id=' . $recom_id);
        }
    }
}

?>
