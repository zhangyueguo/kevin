<?php

/* 店铺控制器 */
class StorebaoApp extends BackendApp
{
    var $_store_mod;
	var $us_mod;
    var $goods_mod;
	var $order_mod;
	var $_user_mod;
	  var $_region_mod;
    function __construct()
    {
        $this->StoreApp();
    }

    function StoreApp()
    {
        parent::__construct();
        $this->_store_mod =& m('store');
		$this->us_mod=&m('ultimate_store');
		 $this->goods_mod  =& m('goods');
		 $this->order_mod  =& m('order');
		   $this->_user_mod =& m('member');
		   $this->_region_mod =& m('region');
    }

    function index()
    {
	
		
        $conditions = empty($_GET['wait_verify']) ? "state <> '" . STORE_APPLYING . "'" : "state = '" . STORE_APPLYING . "'";
        $filter = $this->_get_query_conditions(array(
            array(
                'field' => 'store_name',
                'equal' => 'like',
            ),
            array(
                'field' => 'sgrade',
            ),
        ));
		
		 $this->assign('parents', $this->_get_options(1160));
		
        $owner_name = trim($_GET['owner_name']);
        if ($owner_name)
        {

            $filter .= " AND (user_name LIKE '%{$owner_name}%' OR owner_name LIKE '%{$owner_name}%') ";
        }
		
		
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
            $sort  = 'store_id';
            $order = 'desc';
        }



        $this->assign('filter', $filter);
        $conditions .= $filter;
        $limit=empty($_GET['orderlist']) ? 10  : $_GET['orderlist'];
        $page   =   $this->_get_page($limit);    //获取分页信息
        $stores = $this->_store_mod->find(array(
            'conditions' => $conditions,
            'join'  => 'belongs_to_user',
            'fields'=> 'this.*,member.user_name',
            'limit' => $page['limit'],
            'count' => true,
            'order' => "$sort $order"
        ));
		
		//print_r($stores);
        $sgrade_mod =& m('sgrade');
        $grades = $sgrade_mod->get_options();
        $this->assign('sgrades', $grades);
		

    
		
		
        foreach ($stores as $key => $store)
        {
   
			$orders_deil=$this->storeorde($store['store_id']);
	
		   $stores[$key]['order_sum']=$orders_deil['order_sum'];
		  $stores[$key]['order_amount']=$orders_deil['order_amount'];	
		
        }
		 
			$counts['order_sum'] =$orders_deil['zorder_sum'];
			$counts['order_amount'] =$orders_deil['zorder_amount'];
		
	       $this->assign('oter_order', $oter_order);
		
	
		      $this->assign('order_status_list', array(
            ORDER_PENDING => Lang::get('order_pending'),
            ORDER_SUBMITTED => Lang::get('order_submitted'),
            ORDER_ACCEPTED => Lang::get('order_accepted'),
            ORDER_SHIPPED => Lang::get('order_shipped'),
            ORDER_FINISHED => Lang::get('order_finished'),
            ORDER_CANCELED => Lang::get('order_canceled'),
        ));
		  $this->assign('counts', $counts);
        $this->assign('stores', $stores);
		  $this->assign('limit', $limit);
		  $this->assign('state', $_GET['state']);
	    $this->assign('coin',Conf::get('coin'));
        $page['item_count'] = $this->_store_mod->getCount();
        $this->import_resource(array('script' => 'inline_edit.js'));
        $this->_format_page($page);
        $this->assign('filtered', $filter? 1 : 0); //是否有查询条件
        $this->assign('page_info', $page);
     $this->import_resource(array('script' => 'inline_edit.js,jquery.ui/jquery.ui.js,jquery.ui/i18n/' . i18n_code() . '.js',
                                      'style'=> 'jquery.ui/themes/ui-lightness/jquery.ui.css'));
        $this->display('store.bao.html');
    }
	
	function goods_sum($store_id)
	{
		// $goods_mod  =& m('goods');
		//$this->goods_mod();
			$conditions = $this->_get_query_conditions(array(
			
			array(
                'field' => 'add_time',
                'name'  => 'add_time_from',
                'equal' => '>=',
                'handler'=> 'gmstr2time',
            ),array(
                'field' => 'add_time',
                'name'  => 'add_time_to',
                'equal' => '<=',
                'handler'   => 'gmstr2time_end',
            )
        ));
		
		//echo $conditions;
		    $goods_list = $this->goods_mod->findAll(array(
            'conditions' =>"1=1 and g.store_id=$store_id".$conditions,
            'order'      =>  'add_time desc',// tyioocom
			'count'         => true,
			'fields'=>'g.goods_id',// tyioocom
            //'limit'      => $page['limit'],
        ));
	return	$goods_sum = $this->goods_mod->getCount();
		
	
	}
	
	function oter_order()
	{
		
		
	
	}
	
	function storeorde($store_id)
	{
	   //$model_order =& m('order');	
	/*    $sql="SELECT COUNT(*) FROM " . DB_PREFIX . "order WHERE seller_id=$store_id";
	$order_sum=   $model_order->getOne($sql);*/
	
	$conditions = $this->_get_query_conditions(array(array(
                'field' => $field,       //按用户名,店铺名,支付方式名称进行搜索
                'equal' => 'LIKE',
                'name'  => 'search_name',
            ),array(
                'field' => 'status',
                'equal' => '=',
                'type'  => 'numeric',
            ),array(
                'field' => 'region_id',
                'equal' => '=',
                'type'  => 'numeric',
            ),
			
			array(
                'field' => 'add_time',
                'name'  => 'add_time_from',
                'equal' => '>=',
                'handler'=> 'gmstr2time',
            ),array(
                'field' => 'add_time',
                'name'  => 'add_time_to',
                'equal' => '<=',
                'handler'   => 'gmstr2time_end',
            ),array(
                'field' => 'order_amount',
                'name'  => 'order_amount_from',
                'equal' => '>=',
                'type'  => 'numeric',
            ),array(
                'field' => 'order_amount',
                'name'  => 'order_amount_to',
                'equal' => '<=',
                'type'  => 'numeric',
             ),array(
                'field' => 'buy_ip',
                'name'  => 'buy_ip',
                'equal' => $_GET['except_ip_type'],
            ),array(
                 'field' => 'extension',
                 'equal' => '=',
                 'type'  => 'string',
            ),
        ));
		
 
	
/*	if(!$_GET['status'])
	{
		
    
	 $conditions.=" AND status in(20,30,40) ";
	}*/
//	exit();
	  $buyer_id ="seller_id=".$store_id;
	   

	   
	   
	    $order_amount=$this->order_mod->getOne("SELECT SUM(order_amount) as msum FROM " . DB_PREFIX . "order WHERE $buyer_id".$conditions); 
		
		     $order_sum=$this->order_mod->getOne("SELECT COUNT(*)  FROM " . DB_PREFIX . "order WHERE $buyer_id".$conditions);
			 
			 
			      $zorder_amount=$this->order_mod->getOne("SELECT SUM(order_amount) as msum FROM " . DB_PREFIX . "order WHERE 1=1 ".$conditions); 
		
	 	     $zorder_sum=$this->order_mod->getOne("SELECT COUNT(*)  FROM " . DB_PREFIX . "order WHERE 1=1 ".$conditions);
		
	  // echo $cion;
	 //  print_r($orders);
	   
	
	   
	
	
	
	$orders_deil=array('order_amount'=> $order_amount,
	                     'order_sum'=> $order_sum,
						 'zorder_amount'=> $zorder_amount,
	                     'zorder_sum'=> $zorder_sum,
						  );

	return $orders_deil;
	}
	
	
	
	
    function user_id($store_id="1131")
	{
		
		$conditions_store=" AND sid=".$store_id;	
		
		
		    $users = $this->_user_mod->find(array(
         
            'conditions' => '1=1' . $conditions_store,
          
        ));
		
	 $buyer_id="-999";
	   foreach($users as $key =>$val)
	   {
		  $buyer_id.=",".$val['user_id'];
		
	   }
	   
	return  $buyer_id;
		
		
	
	
	}
  
	function create()
	{ 
		
	
        import('phpzip.lib');
		$zip = new PHPZip;
		
		$conditions = empty($_GET['wait_verify']) ? "state <> '" . STORE_APPLYING . "'" : "state = '" . STORE_APPLYING . "'";
        $filter = $this->_get_query_conditions(array(
            array(
                'field' => 'store_name',
                'equal' => 'like',
            ),
            array(
                'field' => 'sgrade',
            ),
        ));
		
		
		
        $owner_name = trim($_GET['owner_name']);
        if ($owner_name)
        {

            $filter .= " AND (user_name LIKE '%{$owner_name}%' OR owner_name LIKE '%{$owner_name}%') ";
        }
		
		
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
            $sort  = 'store_id';
            $order = 'desc';
        }



        $this->assign('filter', $filter);
        $conditions .= $filter;
         $limit=empty($_GET['orderlist']) ? 10  : $_GET['orderlist'];
        $page   =   $this->_get_page($limit);    //获取分页信息
 $stores = $this->_store_mod->find(array(
            'conditions' => $conditions,
            'join'  => 'belongs_to_user',
            'fields'=> 'this.*,member.user_name',
            'limit' => $page['limit'],
            'count' => true,
            'order' => "$sort $order"
        ));
		
		
        $sgrade_mod =& m('sgrade');
        $grades = $sgrade_mod->get_options();
        $this->assign('sgrades', $grades);

        $states = array(
            STORE_APPLYING  => LANG::get('wait_verify'),
            STORE_OPEN      => Lang::get('open'),
            STORE_CLOSED    => Lang::get('close'),
        );
		
		
		$lang_taobao = array(
		'store_name'=>'店铺',
		'order_sum'=>'订单数（笔)',
	
		'order_amount'=>'销售额(元)',
	
		
		);
		
			/* csv文件数组 */
		$goods_value = array();
		foreach($lang_taobao as $key=>$val)
		{
			$goods_value[$key] = '';
		}
        $content = implode("\t", $lang_taobao) . "\n";
		$folder = date('Ymdhis', time());
		
        foreach ($stores as $key => $store)
        {
      
           
			$orders_deil=$this->storeorde($store['store_id']);
	
	
		   
	
			
			
			$goods_value['store_name']=$store['store_name'];
			
			$goods_value['order_sum']=$orders_deil['order_sum'];
	
			$goods_value['order_amount']=$orders_deil['order_amount'];

			
			
			  $content .= implode("\t", $goods_value) . "\n";
		    // $stores[$key]['goods_sum']=$this->goods_sum($store['store_id']);
        }
		
		//end
		$goods_value['store_name']='合计';
		$goods_value['order_sum']= $orders_deil['zorder_sum'];

		$goods_value['order_amount']=$orders_deil['zorder_amount'];

		$content .= implode("\t", $goods_value) . "\n";
		if (CHARSET != 'utf-8')
    	{
        	$content = ecm_iconv(CHARSET, 'utf-8', $content);
   		}

		$zip->add_file("\xFF\xFE" . $this->utf82u2($content), $folder.'.csv');

    	header("Content-Disposition: attachment; filename=".$folder.".zip");
    	header("Content-Type: application/unknown");
    	die($zip->file());
   
	}
    
   
     function utf82u2($str)
	{
    	$len = strlen($str);
    	$start = 0;
    	$result = '';

   		if ($len == 0)
    	{
        	return $result;
    	}

    	while ($start < $len)
    	{
        	$num = ord($str{$start});
        	if ($num < 127)
        	{
            	$result .= chr($num) . chr($num >> 8);
            	$start += 1;
       	 	}
        	else
        	{
            	if ($num < 192)
            	{
                	/* 无效字节 */
                	$start ++;
            	}
            	elseif ($num < 224)
            	{
                	if ($start + 1 <  $len)
                	{
                    	$num = (ord($str{$start}) & 0x3f) << 6;
                    	$num += ord($str{$start+1}) & 0x3f;
                    	$result .=   chr($num & 0xff) . chr($num >> 8) ;
                	}
                	$start += 2;
            	}
            	elseif ($num < 240)
            	{
                	if ($start + 2 <  $len)
                	{
                   	 	$num = (ord($str{$start}) & 0x1f) << 12;
                    	$num += (ord($str{$start+1}) & 0x3f) << 6;
                    	$num += ord($str{$start+2}) & 0x3f;

                    	$result .=   chr($num & 0xff) . chr($num >> 8) ;
               	 	}
                	$start += 3;
            	}
            	elseif ($num < 248)
            	{

                	if ($start + 3 <  $len)
                	{
                    	$num = (ord($str{$start}) & 0x0f) << 18;
                    	$num += (ord($str{$start+1}) & 0x3f) << 12;
                    	$num += (ord($str{$start+2}) & 0x3f) << 6;
                    	$num += ord($str{$start+3}) & 0x3f;
                    	$result .= chr($num & 0xff) . chr($num >> 8) . chr($num >>16);
                	}
                	$start += 4;
            	}
            	elseif ($num < 252)
            	{
                	if ($start + 4 <  $len)
                	{
                    	/* 不做处理 */
                	}
                	$start += 5;
            	}
            	else
            	{
                	if ($start + 5 <  $len)
                	{
                    	/* 不做处理 */
                	}
                	$start += 6;
            	}
        	}

    	}
    	return $result;
	}
	
	  /* 取得可以作为上级的地区数据 */

    function _get_options($except = NULL)

    {

        $regions = $this->_region_mod->get_list();

        $tree =& $this->_tree($regions);

        return $tree->getOptions(MAX_LAYER - 1, 1231, $except);

    }
	
	 /* 构造并返回树 */

    function &_tree($regions)

    {

        import('tree.lib');

        $tree = new Tree();

        $tree->setTree($regions, 'region_id', 'parent_id', 'region_name');

        return $tree;

    }
  
}

?>
