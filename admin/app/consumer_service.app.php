<?php

define('UPLOAD_DIR', 'data/files/mall/settings');

class Consumer_serviceApp extends BackendApp
{
    var $_consumer_service_mod;
	var $_c_s_type;

    function __construct()
    {
        $this->Consumer_serviceApp();
    }

    function Consumer_serviceApp()
    {
        parent::__construct();
        $this->_consumer_service_mod =& m('consumerservice');
		$this->_c_s_type = array('c_p'=>1,		//消费者保障
								 's_d_r'=>2,	//7天退换
								 'q_g_p'=>3,	//正品保障
								);
								
								
		$this->_lang_c_s_type = Lang::get('c_s_type');						
    }

    function index()
    {    
	   /* 获取申请的客户服务列表 */
        $this->_get_consumer_services();
        $this->import_resource(array('script' => 'inline_edit.js,jquery.ui/jquery.ui.js,jquery.ui/i18n/' . i18n_code() . '.js',
                                      'style'=> 'jquery.ui/themes/ui-lightness/jquery.ui.css'));
        $this->display('consumer_service.index.html');
    }
	
	/**
     *    获取申请的客户服务列表
     *
     *    @author    Garbin
     *    @return    void
     */
    function _get_consumer_services()
    {
        $page = $this->_get_page();
		
	$type = (isset($_GET['type']) && $_GET['type'] != '') ? trim($_GET['type']) : '0';
		
		
        $conditions = empty($_GET['wait_verify']) ? "cs.state <> '" . SERVICE_APPLYING . "'" : "cs.state = '" . SERVICE_APPLYING . "'";
 
	    $type && $conditions .= ' AND c_s_type='.$type;
		
        $filter = $this->_get_query_conditions(array(
		    array(
                'field' => 'store_name',
                'equal' => 'like',
            ),
            array(      //按申请时间搜索,起始时间
                'field' => 'cs.add_time',
                'name'  => 'add_time_from',
                'equal' => '>=',
                'handler'=> 'gmstr2time',
            ),
            array(      //按申请时间搜索,结束时间
                'field' => 'cs.add_time',
                'name'  => 'add_time_to',
                'equal' => '<=',
                'handler'=> 'gmstr2time_end',
            ),
        ));
		
        //更新排序
        if (isset($_GET['sort']) && isset($_GET['order']))
        {
            $sort  = strtolower(trim($_GET['sort']));
            $order = strtolower(trim($_GET['order']));
            if (!in_array($order,array('asc','desc')))
            {
                $sort  = 'sort_order';
                $order = '';
            }
        }
        else
        {
            $sort  = 'cs.add_time';
            $order = 'desc';
        }
		
        $this->assign('filter', $filter);
  //  echo     $conditions .= $filter;
        /* 查找服务 */
        $c_s_list = $this->_consumer_service_mod->find(array(
            'conditions'    => "1=1 AND {$conditions}",
			'fields'         => 'this.*,s.store_name,s.owner_name',
            'count'         => true,
            'join'          => 'belongs_to_store',
            'limit'         => $page['limit'],
            'order' 		=> "$sort $order"
        ));

        $page['item_count'] = $this->_consumer_service_mod->getCount();
        $this->_format_page($page);
		 $this->assign('type', $type);
        $this->assign('c_s_list', $c_s_list);
		$this->assign('filtered', $filter ? 1 : 0); //是否有查询条件
        $this->assign('page_info', $page);
    }
	
    /* 查看并处理服务申请 */
    function view()
    {
        $id = empty($_GET['id']) ? 0 : intval($_GET['id']);

		/* 是否存在 */
		$service = $this->_consumer_service_mod->get_info($id);
		if (!$service)
		{
			$this->show_warning('Hacking Attempt');
			return;
		}
        if (!IS_POST)
        {

            $this->assign('service', $service);
            $this->display('consumer_service.view.html');
        }
        else
        {
            /* 批准 */
            if (isset($_POST['agree']))
            {
                $this->_consumer_service_mod->edit($id, array('state' => SERVICE_AGREE));

				if($deposit_quota = floatval($service['deposit_quota']))
				{
					$money_model =& m('my_money');
					$moneylog_model =& m('my_moneylog');
					$capital_model =& m('capital');
					$capitalrecord_model =& m('capitalrecord');
					$user_id = $service['store_id'];
					$user_name = $service['store_name'];
					$admin_money = $capital_model->get("1=1 AND user_id=".ADMIN_STORE_ID);
					$user_money = $money_model->get("1=1 AND user_id=$user_id");
					$money_model->edit("1=1 AND user_id=$user_id", array('frozen_money' => $user_money['frozen_money']-$deposit_quota));
					$moneylog = array(
								'user_id' 	=> $user_id,
								'user_name' => $user_name,
								'order_sn'  => date("YmdHi"),
								'ifpay'	=> 1,
								'log_state' => sprintf(lang::get('deduct_deposit_for_agree'), $this->_lang_c_s_type[$service['c_s_type']]),
								'op_money'	=> (-1)*$deposit_quota,
								'current_balance'=> $user_money['money'],
								'log_text' => sprintf(lang::get('deduct_deposit_for_agree'), $this->_lang_c_s_type[$service['c_s_type']]),
								'add_time'	=> gmtime(),
					);		
					$moneylog_model->add($moneylog);
					$capital_model->edit("1=1 AND user_id=".ADMIN_STORE_ID, array('capital' => $admin_money['capital']+$deposit_quota));
					$capitalrecord = array(
								'user_id' 	=> $user_id,
								'user_name' => $user_name,
								'order_sn'  => date("YmdHi"),
								'ifpay'	=> 1,
								'log_state' => sprintf(Lang::get('income_for_consumer_service'), $this->_lang_c_s_type[$service['c_s_type']], $deposit_quota),
								'op_money'	=> $deposit_quota,
								'current_balance'=> $admin_money['capital']+$deposit_quota,
								'log_text' => sprintf(lang::get('income_for_consumer_service'), $this->_lang_c_s_type[$service['c_s_type']], $deposit_quota),
								'add_time'	=> gmtime(),
					);		
					$capitalrecord_model->add($capitalrecord);
				}
                $title = sprintf(LANG::get('agree_title'), $this->_lang_c_s_type[$service['c_s_type']]);
                $content = sprintf(LANG::get('agree_content'), $this->_lang_c_s_type[$service['c_s_type']]);
                $ms =& ms();
                $ms->pm->send(MSG_SYSTEM, $service['store_id'], $title, $content);

                $this->show_message('agree_ok',
                    'back_list', 'index.php?app=consumer_service&type=c_p&wait_verify=1'
                );
            }
            /* 拒绝 */
            elseif (isset($_POST['reject']))
            {
				$this->_consumer_service_mod->edit($id, array('state' => SERVICE_REFUSE));
				if($deposit_quota = floatval($service['deposit_quota']))
				{
					$money_model =& m('my_money');
					$moneylog_model =& m('my_moneylog');
					$user_id = $service['store_id'];
					$user_name = $service['store_name'];
					$user_money = $money_model->get("1=1 AND user_id=$user_id");
					$money_model->edit("1=1 AND user_id=$user_id", array('money' => $user_money['money']+$deposit_quota,'frozen_money' => $user_money['frozen_money']-$deposit_quota));
					$moneylog = array(
								'user_id' 	=> $user_id,
								'user_name' => $user_name,
								'order_sn'  => date("YmdHi"),
								'ifpay'	=> 1,
								'log_state' => sprintf(Lang::get('roll_back_money_for_reject'), $this->_lang_c_s_type[$service['c_s_type']]),
								'op_money'	=> $deposit_quota,
								'current_balance'=> $user_money['money']+$deposit_quota,
								'log_text' => sprintf(lang::get('roll_back_money_for_reject'), $this->_lang_c_s_type[$service['c_s_type']]),
								'add_time'	=> gmtime(),
						);		
						$moneylog_model->add($moneylog);
				}
                $reject_reason = trim($_POST['reject_reason']);
                if (!$reject_reason)
                {
                    $this->show_warning('input_reason');
                    return;
                }

                $title = sprintf(LANG::get('reject_title'), $this->_lang_c_s_type[$service['c_s_type']]);
                $content = sprintf(LANG::get('reject_content'), $this->_lang_c_s_type[$service['c_s_type']], $reject_reason);
                $ms =& ms();
                $ms->pm->send(MSG_SYSTEM, $service['store_id'], $title, $content);

                $this->show_message('reject_ok',
                    'back_list', 'index.php?app=consumer_service&type=c_p&wait_verify=1'
                );
            }
            else
            {
                $this->show_warning('Hacking Attempt');
                return;
            }
        }
    }
	
	function setting()
	{
	        $model_setting = &af('settings');
			$setting = $model_setting->getAll(); //载入系统设置数据
			if (!IS_POST)
			{
				$this->assign('setting', $setting);
				$this->import_resource('jquery.plugins/jquery.validate.js');
				$this->display('consumer_service.setting.html');
			}
			else
			{
				$images = array('xb_img_1','xb_img_2','xb_img_3');
				$image_urls = $this->_upload_images($images);
				foreach ($images as $image)
				{
					//isset($image_urls[$image])  && $data['deposit_img'][$image] = $image_urls[$image];
			         
				
			$data['deposit_img'][$image]= isset($image_urls[$image]) ?   $image_urls[$image] : $setting['deposit_img'][$image];
			
				}
				
				

			//	$data['deposit_quota']         = $_POST['deposit_quota'];

              $data['deposit_xiao']         = array(
			  'bao_1'=>$_POST['bao_1'],
			   'bao_2'=>$_POST['bao_2'],
			    'bao_3'=>$_POST['bao_3'],
			  );

				$model_setting->setAll($data);
	
				$this->show_message('setting_successed',
					'back_list',  'index.php?app=consumer_service&act=setting');
			}
	}
	
	/**
     *    上传默认服务图像
     *
     *    @author    Hyber
     *    @param     array  $images
     *    @return    array
     */
    function _upload_images($images)
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
            $image_urls[$image] = $uploader->save(UPLOAD_DIR , $image);
        }

        return $image_urls;
    }
	
	function close()
	{
	    $id = empty($_GET['id']) ? 0 : intval($_GET['id']);

		/* 是否存在 */
		$service = $this->_consumer_service_mod->get_info($id);
		if (!$service)
		{
			$this->show_warning('Hacking Attempt');
			return;
		}
		if ($service['state'] != SERVICE_AGREE)
		{
			$this->show_warning('close_error');
			return;
		}
		if($deposit_quota = $service['deposit_quota'])
		{
			
			
			
			
		$user_id=$service['store_id'];	
	    $beizhu= $this->_lang_c_s_type[$service['c_s_type']];
	
		$deposit_account_mod = &m('deposit_account');
		$deposit_record_mod	= &m('deposit_record');	
		
		$deposit_account = $deposit_account_mod ->get(array('conditions'=>'user_id='.$user_id));
	
		$deposit_account_mod->edit("user_id=$user_id",array(
							'money'=>$deposit_account['money'] + $deposit_quota,
							'frozen'=>$deposit_account['frozen_money'] - $deposit_quota,
						));	
						
	       $time = gmtime();
		   $tradesn = $deposit_record_mod->_gen_trade_sn();						
			 $balance   = $deposit_account['money']+$deposit_quota;
           
			
			 $data_record = array(
					'tradesn'	=>	$tradesn,
					'user_id'	=>	$user_id,
					'party_id'	=>	0,
					'amount'	=>	$deposit_quota,
					'balance'	=>	$balance,
					'flow'		=>	'income',
					'purpose'	=>	'recharge',
					'status'	=>	'SUCCESS',
					'payway'	=>"平台"	,
					'name'		=>	'撤销'.$beizhu,
					'remark'	=>	'撤销'.$beizhu,
					'add_time'	=>	$time,
					'pay_time'	=>	$time,
					'end_time'	=>	$time,
				);	
				
				$deposit_record_mod->add($data_record);		
			

	    }
		$this->_consumer_service_mod->drop($id);
		$this->show_message('close_ok',
			'back_list',  'index.php?app=consumer_service');
	}
}

?>
