<?php

define('UPLOAD_PATH_BUS','data/files/mall/company');

define('MAX_LAYER', 4);

class CompanyApp extends CompanybaseApp
{
    protected $_feed_enabled = false;
    public function __construct()
    {
        $this->CompanyApp();
    }
    public function CompanyApp()
    {
        parent::__construct();
        $ms = & ms();
        $this->_feed_enabled = $ms->feed->feed_enabled();
        $this->assign('feed_enabled',$this->_feed_enabled);
    }

    public function index()
    {
        header('content-type:text/html;charset=utf8');
        $model_company = & m('company');
        $user_id = $this->visitor->get('user_id');
        $sql = "select * from ecm_company WHERE user_id =".$user_id;
        $id = $model_company->getOne($sql);

        if(!IS_POST)
        {
            /* 当前位置 */
            $this->_curlocal(LANG::get('member_center'),  'index.php?app=company',
                LANG::get('basic'));

           //企业中心菜单
            $this->_curitem('overview');

            /* 当前所处子菜单 */
            $this->_curmenu('basic_information');

            $region_mod = & m('region');
            $this->assign('regions',$region_mod->get_options(0));

            $sql = "select * from ecm_company WHERE user_id = ".$user_id;
            $company = $model_company->getRow($sql);
            $this->assign('company',$company);
            $this->import_resource(
              array('script'=>'jquery.plugins/jquery.validate.js',)
            );
            $this->display('company.index.html');
        }
        else
        {
           $data = array(
                 'companyname'  =>  $_POST['company_name'],
                 'email'         =>  $_POST['email'],
                 'lxrname'       =>  $_POST['lxrname'],
                 'section'       =>  $_POST['section'],
                 'tel'            =>  $_POST['tel'],
                 'phone'         =>  $_POST['phone'],
                'region_id'      =>  $_POST['region_id'],
               'region_name'    =>  $_POST['region_name'],
               'user_id'         => $user_id
           );

            $model_company = & m('company');
            if($id)
            {
                $model_company->edit(array('id'=>$id),$data);
            }else{
                $model_company->add($data);
            }
                                    //没做登入，暂时

            if($model_company->has_error())
            {
                $this->show_warning($model_company->get_error());
                return;
            }
            $this->show_message('edit_company_successed');
        }
    }

    public function approve()
    {
        $model_company = & m('company');
        $user_id = $this->visitor->get('user_id');
        $sql = "select * from ecm_company WHERE user_id = ".$user_id;
        $id = $model_company->getOne($sql);
        /* 当前位置 */
        $this->_curlocal(LANG::get('member_center'),  'index.php?app=company',
            LANG::get('basic'));

        //企业中心菜单
        $this->_curitem('my_profile');

        /* 当前所处子菜单 */
        $this->_curmenu('basic_information');
        if(IS_POST)
        {
            $images = array('bus_img','card_s','card_x');
            $image_urls = $this->_uplocad_images($images,$id);
            foreach($images as $image)
            {
                //isset($image_urls[$image]) ? $data[$image] = $image_urls['$image']:null;
                $data[$image] = $image_urls[$image];
            }
            if($id){
                $model_company->edit(array('id'=>$id),$data);
            }else{
                $model_company->add($data);
            }

        }
        $company = $model_company->get_info($id);

        $this->assign('company',$company);

        $this->display('company.approve.html');
    }

    public function security()
    {
        $this->_curlocal(LANG::get('member_center'),  'index.php?app=company',
            LANG::get('basic'));

        //企业中心菜单
        $this->_curitem('user');

        /* 当前所处子菜单 */
        $this->_curmenu('basic_information');

        $this->display('company.security.html');
    }

    public function worker()
    {
        $model_company = & m('company');
        $user_id = $this->visitor->get('user_id');
        $sql = "select * from ecm_company WHERE user_id = ".$user_id;
        $company_id = $model_company->getOne($sql);

      //  $company_id = 2;
        $this->_curlocal(LANG::get('member_center'),  'index.php?app=company',
            LANG::get('basic'));

        //企业中心菜单
        $this->_curitem('worker');

        /* 当前所处子菜单 */
        $this->_curmenu('basic_information');

        $worker = &m('comworker');

//        $array= array(
//            'conditions' => "company_id=".$company_id
//        );
//        $comworkers = $worker->find($array);
        $sql1 = "select * from ecm_comworker WHERE company_id = ".$company_id;
        $comworkers = $worker->getAll($sql1);
        $company_sect = &m('sect');


        /* 获取分类 */
        $sects = $company_sect->get_list($company_id);

        $this->assign('sects',$sects);

        $this->assign('comworkers',$comworkers);


       $this->display('company.worker.html');
    }

    public function addsector()
    {
        $model_company = & m('company');
        $user_id = $this->visitor->get('user_id');
        $sql = "select * from ecm_company WHERE user_id = ".$user_id;
        $company_id = $model_company->getOne($sql);
        //$company_id = 2;
        $this->_curlocal(LANG::get('member_center'),  'index.php?app=company',
            LANG::get('basic'));
        //企业中心菜单
        $this->_curitem('worker');
        /* 当前所处子菜单 */
        $this->_curmenu('basic_information');

        $company_sect = &m('sect');
      if(!IS_POST)
      {
          //开发测试阶段
          $pid = empty($_GET['pid']) ? 0 : intval($_GET['pid']);
          $gcategory = array('parent_id'=>$pid,'sort_order'=>255);

          $this->assign('gcategory',$gcategory);

          $this->assign('parents',$this->_get_options($company_id));

          /* 导入jQuery的表单验证插件 */
          $this->import_resource(array(
              'script' => 'jquery.plugins/jquery.validate.js'
          ));

          $this->display('company.addsector.html');
      }
      else
      {
            $data['company_id'] = $company_id;
            $data['sectname'] = $_POST['sectname'];
            $data['parent_id'] = $_POST['parent_id'];
            $data['sort_order'] = $_POST['sort_order'];

          if(!$company_sect->unique(trim($data['sectname']),$data['parent_id']))
          {
              $this->show_warning('name_exit');
              return;
          }
            $company_sect->add($data);

        $this->show_message(
            'add_ok',
            'back_list','index.php?app=company&act=sectorlist'

        );
      }
    }

    public function sectorlist()
    {
        $model_company = & m('company');
        $user_id = $this->visitor->get('user_id');
        $sql = "select * from ecm_company WHERE user_id = ".$user_id;
        $company_id = $model_company->getOne($sql);
        //$company_id = 2;
        $this->_curlocal(LANG::get('member_center'),  'index.php?app=company',
            LANG::get('basic'));
        //企业中心菜单
        $this->_curitem('worker');
        /* 当前所处子菜单 */
        $this->_curmenu('basic_information');

        $company_sect = &m('sect');
//        $array= array(
//            'conditions' => "company_id=".$company_id
//        );
//        $sects = $company_sect->find($array);

        /* 获取分类 */
        $sects = $company_sect->get_list($company_id,0);
        $tree = & $this->_tree($sects);

        foreach($sects as $key => $val)
        {
            $sects[$key]['switchs'] = 0;
            if($company_sect->get_list($company_id,$val['id']))
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

        $this->display('company.sectorlist.html');
    }
    /*
     * 异步看部门子分类
     */
    public function ajax_cate()
    {
        //公司id 暂时写死
        $model_company = & m('company');
        $user_id = $this->visitor->get('user_id');
        $sql = "select * from ecm_company WHERE user_id = ".$user_id;
        $company_id = $model_company->getOne($sql);
       // $company_id = 2;
        if(!isset($_GET['id']) || empty($_GET['id']))
        {
            echo ecm_json_encode(false);
            return;
        }
        $company_sect= &m('sect');
        $cate = $company_sect->get_list($company_id,$_GET['id']);

        foreach($cate as $key => $val)
        {
               $child = $company_sect->get_list($company_id,$val['id']);
               $lay = $company_sect->get_layer($val['id']);
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

    public function drop()
    {
        $id = isset($_GET['id']) ? trim($_GET['id']) : '';
        if(!id)
        {
            $this->show_warning('no_gcategory_to_drop');
            return;
        }
        $ids  = explode(',',$id);
        $company_sect = &m('sect');
        if(!$company_sect->drop($ids))
        {
            $this->show_warning($company_sect->get_error());
            return;
        }
       $this->show_message('drop_ok');
    }

    public function sect_edit()
    {
        $model_company = & m('company');
        $user_id = $this->visitor->get('user_id');
        $sql = "select * from ecm_company WHERE user_id = ".$user_id;
        $company_id = $model_company->getOne($sql);
      //  $company_id = 2;                //暂时
        $id = empty($_GET['id']) ? 0 : intval($_GET['id']);
        $company_sect = &m('sect');
        if(!IS_POST)
        {
            $sect = $company_sect->get_info($id);

            if(!$sect)
            {
                $this->show_warning('sect_empty');
                return;
            }
            $this->assign('gcategory',$sect);

            $this->import_resource(array(
               'script' => 'jquery.plugins/jquery.validate.js'
            ));
            $this->assign('parents',$this->_get_options($company_id));
            $this->display('company.addsector.html');
        }
        else
        {
            $data['sectname'] = $_POST['sectname'];
            $data['parent_id'] = $_POST['parent_id'];
            $data['sort_order'] = $_POST['sort_order'];


            if(!$company_sect->unique(trim($data['sectname']),$data['parent_id'],$id))
            {
                $this->show_warning('name_exit');
                return;
            }
            //保存
            $rows = $company_sect->edit(array('id'=>$id),$data);

            $this->show_message(
                'edit_ok',
                'back_list','index.php?app=company&act=sectorlist',
                'edit_again', 'index.php?app=company&amp;act=sector_edit&amp;id='.$id
            );
        }
    }

    /* 构造并返回树 */
    function &_tree($gcategories)
    {
        import('tree.lib');
        $tree = new Tree();
        $tree->setTree($gcategories, 'id', 'parent_id', 'sectname');
        return $tree;
    }

    function _get_options($company_id,$except = NULL)
    {
        $company_sect = &m('sect');
        $gcategories = $company_sect->get_list($company_id);
       // var_dump($gcategories);exit;
        $tree =& $this->_tree($gcategories);

        return $tree->getOptions(MAX_LAYER - 1, 0, $except);
    }

    public function addworker()
    {
        $model_company = & m('company');
        $user_id = $this->visitor->get('user_id');
        $sql = "select * from ecm_company WHERE user_id = ".$user_id;
        $company_id = $model_company->getOne($sql);
        //$company_id = 2;
        $this->_curlocal(LANG::get('member_center'),  'index.php?app=company',
            LANG::get('basic'));

        //企业中心菜单
        $this->_curitem('worker');

        /* 当前所处子菜单 */
        $this->_curmenu('basic_information');
        $work = &m('comworker');

        if(!IS_POST)
        {
            $this->assign('parents',$this->_get_options($company_id));
            $this->display('company.addworker.html');
        }
        else
        {
            $data['workername'] = $_POST['worker_name'];
            $data['workerphone'] = $_POST['worker_phone'];
            $data['sectid'] = $_POST['parent_id'];
            $data['juese']  = $_POST['juese'];
            $data['status'] = $_POST['status'];
            $data['company_id'] = $company_id;

            $work->add($data);

            $this->show_message(
                'add_ok',
                'back_list','index.php?app=company&act=worker'
            );
        }
    }

    public function editworker()
    {
        $id = empty($_GET['id']) ? 0 : intval($_GET['id']);
        $this->_curlocal(LANG::get('member_center'),  'index.php?app=company',
            LANG::get('basic'));

        //企业中心菜单
        $this->_curitem('worker');

        /* 当前所处子菜单 */
        $this->_curmenu('basic_information');
        $work = &m('comworker');

        if(!IS_POST)
        {
            $worker = $work->get_info($id);
           // $gcategory = array('parent_id'=>$worker['sectid'],'sort_order'=>255);

            $this->assign('comworker',$worker);
            $this->assign('parents',$this->_get_options($worker['company_id']));
            $this->display('company.addworker.html');
        }
        else
        {
            $data['workername'] = $_POST['worker_name'];
            $data['workerphone'] = $_POST['worker_phone'];
            $data['sectid'] = $_POST['parent_id'];
            $data['juese']  = $_POST['juese'];
            $data['status'] = $_POST['status'];

            $work->edit(array('id'=>$id),$data);

            $this->show_message(
                'edit_ok',
                'back_list','index.php?app=company&act=worker',
                'edit_again', 'index.php?app=company&amp;act=editworker&amp;id='.$id
            );
        }
    }

    public function addzizhi()
    {
        $this->_curlocal(LANG::get('member_center'),  'index.php?app=company',
            LANG::get('basic'));

        //企业中心菜单
        $this->_curitem('addzizhi');

        /* 当前所处子菜单 */
        $this->_curmenu('invoice_information');

        $zizhi_model =& m('invoice_template');

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
                $result = $zizhi_model->drop(array('id'=>$drop_id));
                if($result){
                    header("Location:index.php?app=company&act=addzizhi");
                }
            }else{
                $conditions = array(
                    'fields'            =>'*',
                    'conditions'        => 'uid = '.$this->visitor->get('user_id'),
                );
            }
            $info = $zizhi_model->get_info($_GET['bid']);
            $infos = $zizhi_model->find($conditions);
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
            $this->display('company.zizhi.html');
        }else{
            if($_GET['type'] == 'add'){     //添加
                $result = $zizhi_model->add(array(
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
                $result = $zizhi_model->edit($edit_id,array(
                    'company_name'      => $_POST['worker_name'],
                    'taxpayer_code'     => $_POST['worker_shibie'],
                    'company_address'   => $_POST['worker_address'],
                    'company_phone'     => $_POST['worker_phone'],
                    'deposit_bank'      => $_POST['worker_bank'],
                    'number_bank'       => $_POST['worker_number'],
                ));
            }

            if($result){
                header("Location:index.php?app=company&act=addzizhi");
            }
        }

    }

    public function password()
    {
        $this->_curlocal(LANG::get('member_center'),  'index.php?app=company',
            LANG::get('basic'));

        //企业中心菜单
        $this->_curitem('user');

        /* 当前所处子菜单 */
        $this->_curmenu('basic_information');

        $this->display('company.password.html');

    }


    public  function _uplocad_images($images,$id)
    {
        import('uploader.lib');
        $image_urls = array();

        foreach ($images as $image)
        {
            $file = $_FILES[$image];
            if ($file['error'] != UPLOAD_ERR_OK)
            {
                continue;
            }
            $uploader = new Uploader();
            $uploader->allowed_type(IMAGE_FILE_TYPE);
            $uploader->addFile($file);
            if ($uploader->file_info() === false)
            {
                continue;
            }
            $uploader->root_dir(ROOT_PATH);
            $image_urls[$image] = $uploader->save(UPLOAD_PATH_BUS , $image.$id);
        }
        return $image_urls;
    }

}

?>