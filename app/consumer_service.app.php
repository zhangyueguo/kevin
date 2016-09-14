<?php

/* 客户服务类型 */
define('C_S_P',  1);            // 消费者保障服务
class Consumer_serviceApp extends StoreadminbaseApp
{
    var $_store_id;
	var $_consumerservice_mod;
	    var $_acategory_mod;
    function __construct()
    {
        $this->Consumer_serviceApp();
    }

    function Consumer_serviceApp()
    {
        parent::__construct();
        $this->_store_id  = intval($this->visitor->get('manage_store'));
		$this->_consumerservice_mod =& m('consumerservice');
		 $this->_article_mod = &m('article');
		 
		$this->_lang_c_s_type = Lang::get('c_s_type');
    }
	
	function index()
    {
        /* 已申请过或在审核中不能再申请 */
           $step = isset($_GET['step']) ? intval($_GET['step']) : 1;
		  $type = isset($_GET['type']) ? intval($_GET['type']) : 1;
		  
	      $c_p_article = $this->_article_mod->get("code='c_p'");
	     $s_d_r_article = $this->_article_mod->get("code='s_d_r'");
	     $q_g_p_article = $this->_article_mod->get("code='q_g_p'");



		 
		 //print_r($c_p_article);
		 $this->assign('c_p_article',  str_replace("&nbsp;","",strip_tags($c_p_article['content'])));
		  $this->assign('s_d_r_article',str_replace("&nbsp;","",strip_tags($s_d_r_article['content'])));
		  $this->assign('q_g_p_article', str_replace("&nbsp;","",strip_tags($q_g_p_article['content'])));
		 
        $consumerservice = $this->_consumerservice_mod->get('store_id='.$this->_store_id.' AND c_s_type='.C_S_P);
   

		$C_S_GS = $this->_consumerservice_mod->get('store_id='.$this->_store_id.' AND c_s_type='.C_S_GS);
	    $C_S_SDR = $this->_consumerservice_mod->get('store_id='.$this->_store_id.' AND c_s_type='.C_S_SDR);
	  
	    if ($consumerservice)
        {
            if ($consumerservice['state']==1)
            {
				
				
                $this->assign('show_message', lang::get('c_p_had_agreed'));
				
				
				
            }
			elseif ($consumerservice['state']==2)
            {
				$this->assign('show_message', lang::get('c_p_had_refused'));
            }
			else{
				$this->assign('show_message', lang::get('c_p_appling'));
			}
        }
			$deposit_account_mod = &m('deposit_account');
			
		
			$deposit_account = $deposit_account_mod ->get(array('conditions'=>'user_id='.$this->visitor->get('user_id')));
	

          $user_id=$this->visitor->get('user_id');
		$this->assign('deposit_account', $deposit_account);
		$model_setting = &af('settings');
		$setting = $model_setting->getAll(); //载入系统设置数据
		$deposit_quota = $setting['deposit_xiao'];
		$xfzbz_image = $setting['deposit_img'];

   
		
        switch ($step)
        {
            case 1:
                $this->assign('deposit_quota', $deposit_quota);
				$this->assign('consumerservice', $consumerservice);
				
				$this->assign('C_S_GS', $C_S_GS);
					
				$this->assign('C_S_SDR', $C_S_SDR);
				$this->assign('xfzbz_image', $xfzbz_image);
				/* 当前页面信息 */
				$this->_curlocal(LANG::get('member_center'), 'index.php?app=member',
								 LANG::get('consumer_service'), 'index.php?app=consumer_service',
								 LANG::get('consumer_service'));
				$this->_curitem('consumer_service');
				$this->_curmenu('c_s_p');
                $this->assign('page_title', Lang::get('title_step1') . ' - ' . Conf::get('site_title'));
                $this->display('consumer_service.step1.html');
                break;
            case 2:
			
				
	
	             
				 
				 

                if (!IS_POST)
                {
					
					
				
					
					
					/* 当前页面信息 */
					$this->_curlocal(LANG::get('member_center'), 'index.php?app=member',
									 LANG::get('consumer_service'), 'index.php?app=consumer_service',
									 LANG::get('consumer_service'));
					$this->_curitem('consumer_service');
					$this->_curmenu('c_s_p');
				
					$this->assign('c_p_info', $c_p_info);
					$this->assign('user_money', $user_money);
					$this->assign('type', $type);
				       
					  if($type==2)
					  {
						 
					 $this->assign('content',$s_d_r_article['content']); 
						 } 
						 
						  if($type==3)
					  {
						 
					 $this->assign('content',$q_g_p_article['content']); 
						 } 
						 
						   if($type==1)
					  {
						 
					 $this->assign('content',$c_p_article['content']); 
						 } 
					   
			      
					$this->assign('deposit_quota',$deposit_quota['bao_'.$type]);
                    $this->assign('page_title', Lang::get('title_step2') . ' - ' . Conf::get('site_title'));
                    $this->display('consumer_service.step2.html');
                }
                else
                {
				 
				 
		$consumerservice2= $this->_consumerservice_mod->get('store_id='.$this->_store_id.' AND c_s_type='.$type); 	
			if ($consumerservice2['state']==1)
				{
					$this->show_warning("您已经申请通过",
						'消保申请', 'index.php?app=consumer_service',
						'go_back'
					 );
							return;
				}
			
			/*$deposit_account_mod->edit("user_id=$user_id","frozen=0");
				exit();*/
				  $deposit_quota=$_POST['deposit_quota'];
				
				
				
		       $beizhu= $this->_lang_c_s_type[$_POST['c_s_type']];
               
			  
					if($deposit_quota = floatval($deposit_quota))
					{
						if($deposit_account['money'] < $deposit_quota)
						{
						
							$this->show_warning("no_enough_money_for_deposit",
								'my_money', 'index.php?app=deposit',
								'go_back'
							);
							return;
						}
						

									
						$deposit_account_mod->edit("user_id=$user_id",array(
							'money'=>$deposit_account['money'] - $deposit_quota,
							'frozen'=>$deposit_account['frozen']+ $deposit_quota,
						));		
					}
	 					
					
					
			 $deposit_record_mod	= &m('deposit_record');	
             $time = gmtime();
		     $tradesn = $deposit_record_mod->_gen_trade_sn();						
			 $balance   = $deposit_account['money']-$deposit_quota;
             $data_record = array(
					'tradesn'	=>	$tradesn,
					'user_id'	=>	$user_id,
					'party_id'	=>	0,
					'amount'	=>	$deposit_quota,
					'balance'	=>	$balance,
					'flow'		=>	'outlay',
					'purpose'	=>	'charge',
					'status'	=>	'SUCCESS',
					'payway'	=>"平台"	,
					'name'		=>	$beizhu.'保证金',
					'remark'	=>	$beizhu.'保证金',
					'add_time'	=>	$time,
					'pay_time'	=>	$time,
					'end_time'	=>	$time,
				);	
				
				$deposit_record_mod->add($data_record);	
						
 			
					
					$data = array(
                        'store_id'     => $this->_store_id,
                        'c_s_type'   => $_POST['c_s_type'],
						'state'=>'1',
                        'deposit_quota'   => $deposit_quota,
                        'add_time'     => gmtime(),
                    );
					$this->_consumerservice_mod->add($data);
					$this->show_message('post_c_p_apply_successed',
						'back_to_index', 'index.php?app=consumer_service'
					);
                }
                break;
            default:
                header("Location:index.php?app=consumer_service&step=1");
                break;
        }
    }
	/*	再次提交服务申请 */
	function repeat_apply()
	{
		$consumerservice = $this->_consumerservice_mod->get('store_id='.$this->_store_id.' AND c_s_type='.C_S_P);
		if($consumerservice && ($consumerservice['state'] != SERVICE_AGREE))
		{
			$this->_consumerservice_mod->drop($consumerservice['c_id']);
			header("Location:index.php?app=consumer_service&step=2");
        	return;
		}else{
			header("Location:index.php?app=consumer_service&step=1");
        	return;
		}

	}
	
    /*三级菜单*/
    function _get_member_submenu()
    {
        $array = array(
            array(
                'name' => 'c_s_p',
                'url' => 'index.php?app=consumer_service&amp;type=c_s_p',
            ),
        );
        return $array;
    }

}
?>