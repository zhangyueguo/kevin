<?php
class CompanyApp extends BackendApp
{
    protected $_company_mod;
    protected $_admin_mod;
    public function __construct()
    {
        $this->CompanyApp();
    }

    public function CompanyApp()
    {
        parent::__construct();
        $this->_company_mod = &m('company');
        $this->_admin_mod = & m('userpriv');
    }

    public function index()
    {
        $conditions = $this->_get_query_conditions(array(
            array(
                'field' => $_GET['field_name'],
                'name'  => 'field_value',
                'equal' => 'like',
            ),
        ));
        //更新排序
        if (isset($_GET['sort']) && !empty($_GET['order']))
        {
            $sort  = strtolower(trim($_GET['sort']));
            $order = strtolower(trim($_GET['order']));
            if (!in_array($order,array('asc','desc')))
            {
                $sort  = 'user_id';
                $order = 'asc';
            }
        }
        else
        {
            if (isset($_GET['sort']) && empty($_GET['order']))
            {
                $sort  = strtolower(trim($_GET['sort']));
                $order = "";
            }
            else
            {
                $sort  = 'user_id';
                $order = 'asc';
            }
        }

      $page = $this->_get_page();
      $companys = $this->_company_mod->find();

      $this->assign('companys',$companys);
      $page['item_count'] = $this->_company_mod->getCount();
      $this->_format_page($page);
      $this->assign('filtered',$conditions?1:0);
      $this->assign('page_info',$page);

        $this->import_resource(
            array(
                'script' => 'jqtreetable.js,inline_edit.js',
                'style' => 'res:style/jqtreetable.css'
            )
        );

      $this->display('compony.index.html');
    }

    public function add()
    {
       if(!IS_POST)
       {
           $this->import_resource(array(
                 'script' => 'jquery.plugins/jquery.validate.js'
             ));
           $this->display('company.form.html');
       }
       else
       {
           $companys = array(
                  'companyname' => $_POST['user_name'],
                  'email'        => $_POST['email'],
                  'lxrname'     => $_POST['lxrname'],
                   'tel'         => $_POST['tel'],
                   'phone'       => $_POST['phone']
           );
           $id = $this->_company_mod->add($companys);

           $this->show_message('add_ok',
               'back_list','index.php?app=company',
               'continue_add','index.php?app=company&act=add'
           );
       }
    }

    public function edit()
    {
      $id = empty($_GET['id']) ? 0 : intval($_GET['id']);
      if(!IS_POST)
      {
          $company = $this->_company_mod->get_info($id);
          $this->assign('company',$company);
          $this->import_resource(array(
             'script' => 'jquery.plugins/jquery.validate.js'
          ));
          $this->display('company.form.html');
      }
       else
       {
           $companys = array(
               'companyname' => $_POST['user_name'],
               'email'        => $_POST['email'],
               'lxrname'     => $_POST['lxrname'],
               'tel'         => $_POST['tel'],
               'phone'       => $_POST['phone']
           );
           $this->_company_mod->edit($id,$companys);

           $this->show_message('edit_ok',
                   'back_list','index.php?app=company',
                   'edit_again', 'index.php?app=company&amp;act=edit&amp;id='.$id
               );
       }

    }
}