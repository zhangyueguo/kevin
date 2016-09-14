<?php echo $this->fetch('header.html'); ?>
<script type="text/javascript">

$(function(){

    $('#add_time_from').datepicker({dateFormat: 'yy-mm-dd'});

    $('#add_time_to').datepicker({dateFormat: 'yy-mm-dd'});

});

</script>
<div id="rightTop">
  <p>店铺销售统计</p>
</div>
<div class="mrightTop">
  <div class="fontl">
    <form method="get">
       <div class="left">
          <input type="hidden" name="app" value="storebao" />
          <input type="hidden" name="act" value="index" />
         
          
          
          
<!--          owner_name:
          <input class="queryInput" type="text" name="owner_name" value="<?php echo htmlspecialchars($_GET['owner_name']); ?>" />-->
          
          
          店铺名称:
          <input class="queryInput" type="text" name="store_name" value="<?php echo htmlspecialchars($_GET['store_name']); ?>" />
   
                 <select class="querySelect" name="status">

                    <option value="">订单状态</option>

                    <?php echo $this->html_options(array('options'=>$this->_var['order_status_list'],'selected'=>$_GET['status'])); ?>

                </select>
                   开始:<input class="queryInput2" type="text" value="<?php echo $this->_var['query']['add_time_from']; ?>" id="add_time_from" name="add_time_from" class="pick_date" />
               结束:<input class="queryInput2" type="text" value="<?php echo $this->_var['query']['add_time_to']; ?>" id="add_time_to" name="add_time_to" class="pick_date" />
                  

               显示条数：<input class="queryInput" type="text" name="orderlist" value="<?php echo $this->_var['limit']; ?>" />      
           
          
          <input type="submit" class="formbtn" value="查询" />
      </div>
       <a class="left formbtn1" href="index.php?app=storebao&act=create&store_name=<?php echo htmlspecialchars($_GET['store_name']); ?>&state=<?php echo $this->_var['state']; ?>&orderlist=<?php echo $this->_var['limit']; ?>&status=<?php echo $_GET['status']; ?>&add_time_from=<?php echo $_GET['add_time_from']; ?>&add_time_to=<?php echo $_GET['add_time_to']; ?>&page=<?php echo $_GET['page']; ?>">导出</a>
      
    <a class="left formbtn1" href="index.php?app=storebao&state=<?php echo $this->_var['state']; ?>">撤销检索</a>
    </form>
  </div>
  <div class="fontr"><?php echo $this->fetch('page.top.html'); ?> </div>
</div>
<div class="tdare">
  <table width="100%" cellspacing="0" class="dataTable">
    <?php if ($this->_var['stores']): ?>
    <tr class="tatr1">


      <td>店铺名称</td>
      <td>订单数
（笔）</td>
    
     
     
      <td class="table-center">销售额
（元）</td>
     
      
     
     
        
     
    </tr>
    <?php endif; ?>
    <?php $_from = $this->_var['stores']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'store');if (count($_from)):
    foreach ($_from AS $this->_var['store']):
?>
    <tr class="tatr2">


      <td>
       <?php echo htmlspecialchars($this->_var['store']['store_name']); ?>
       </td>
     
        
      <td><?php echo $this->_var['store']['order_sum']; ?></td>
      <td class="table-center"><?php echo $this->_var['store']['order_amount']; ?></td>
    
        
       
</td>
    </tr>
    <?php endforeach; else: ?>
    <tr class="no_data">
      <td colspan="12">没有符合条件的记录</td>
    </tr>
    <?php endif; unset($_from); ?><?php $this->pop_vars();; ?>
    
    
    
    
    <tr class="tatr2">


      <td>
               
               合计
             </td>
      <td><?php echo $this->_var['counts']['order_sum']; ?></td>
        

      <td class="table-center"><?php echo $this->_var['counts']['order_amount']; ?></td>
 
        
       

    </tr>
  </table>
  <?php if ($this->_var['stores']): ?>
  <div id="dataFuncs">
    <div class="pageLinks"><?php echo $this->fetch('page.bottom.html'); ?></div>
    <div id="batchAction" class="left paddingT15">
    </div>
  </div>
  <div class="clear"></div>
  <?php endif; ?>

</div>
<?php echo $this->fetch('footer.html'); ?>