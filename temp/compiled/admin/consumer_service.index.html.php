<?php echo $this->fetch('header.html'); ?>
<script type="text/javascript">
$(function(){
    $('#add_time_from').datepicker({dateFormat: 'yy-mm-dd'});
    $('#add_time_to').datepicker({dateFormat: 'yy-mm-dd'});
});
</script>
<div class="main">
	<div class="fixed-bar">
		<div class="item-title">
			<h3><a href="index.php?act=welcome" style="text-decoration:none;"><?php echo $this->_var['setting']['site_name']; ?></a> &nbsp;>&nbsp;consumer_service&nbsp;&nbsp;>&nbsp;&nbsp;<?php if ($_GET['wait_verify']): ?>待审核消保<?php else: ?>消保列表<?php endif; ?></h3>
		</div>
	</div>
	<div class="fixed-empty"></div>
	<div class="mrightTop">
	  <div class="fontl">
		<form method="get" name="search_form">
		   <div class="left">
			  <input type="hidden" name="app" value="consumer_service" />
			  <input type="hidden" name="act" value="index" />
			  <input type="hidden" name="wait_verify" value="<?php echo $_GET['wait_verify']; ?>" />
			  
              
              申请时间从:
			  <input class="queryInput2" type="text" value="<?php echo $this->_var['query']['add_time_from']; ?>" id="add_time_from" name="add_time_from" class="pick_date" />
			  至:<input class="queryInput2" type="text" value="<?php echo $this->_var['query']['add_time_to']; ?>" id="add_time_to" name="add_time_to" class="pick_date" />
			   店铺名称:
			   <input class="queryInput2" type="text" value="<?php echo $this->_var['query']['store_name']; ?>" name="store_name" />
               
          消保类型： <select name="type">
               <?php $_from = $this->_var['lang']['c_s_type']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('key', 'c_s_type');if (count($_from)):
    foreach ($_from AS $this->_var['key'] => $this->_var['c_s_type']):
?>
               <option value="<?php echo $this->_var['key']; ?>"  <?php if ($this->_var['type'] == $this->_var['key']): ?> selected="selected" <?php endif; ?>> <?php echo $this->_var['c_s_type']; ?></option>
               
               <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
               </select>
			   <a href="JavaScript:void(0);" class="btn-search" onclick="document.search_form.submit()">查询</a>
		  </div>
		  <?php if ($this->_var['filtered']): ?>
		  <a class="left formbtn1" href="index.php?app=consumer_service&amp;type=$smarty.get.type<?php if ($_GET['wait_verify']): ?>&amp;wait_verify=<?php echo $_GET['wait_verify']; ?><?php endif; ?>">撤销检索</a>
		  <?php endif; ?>
		</form>
	  </div>
	  <div class="fontr"><?php echo $this->fetch('page.top.html'); ?> </div>
	</div>
	<div class="tdare">
	  <table width="100%" cellspacing="0" class="dataTable">
		<?php if ($this->_var['c_s_list']): ?>
		<tr class="tatr1">
		  <td>店铺名称 | 店主姓名</td>
		  <td><span ectype="order_by" fieldname="c_s_item_name">申请服务名称</span></td>
		  <td><span ectype="order_by" fieldname="region_id">保证金额度(元)</span></td>
		  <td class="table-center"><span ectype="order_by" fieldname="add_time">申请时间</span></td>
		  <td class="table-center">状态</td>
		  <td class="handler">操作</td>
		</tr>
		<?php endif; ?>
		<?php $_from = $this->_var['c_s_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'c_s_item');if (count($_from)):
    foreach ($_from AS $this->_var['c_s_item']):
?>
		<tr class="tatr2">
		  <td><?php echo htmlspecialchars($this->_var['c_s_item']['store_name']); ?> | <?php echo htmlspecialchars($this->_var['c_s_item']['owner_name']); ?></td>
		  <td><?php echo $this->_var['lang']['c_s_type'][$this->_var['c_s_item']['c_s_type']]; ?></td>
		  <td><?php echo $this->_var['c_s_item']['deposit_quota']; ?></td>
		  <td class="table-center"><?php echo local_date("Y-m-d",$this->_var['c_s_item']['add_time']); ?></td>
		  <td class="table-center"><?php echo $this->_var['lang']['state_type'][$this->_var['c_s_item']['state']]; ?></td>
		  <td class="handler">
			<?php if ($_GET['wait_verify']): ?>
			<a href="index.php?app=consumer_service&amp;act=view&amp;id=<?php echo $this->_var['c_s_item']['c_id']; ?>">查看</a>
			<?php elseif ($this->_var['c_s_item']['state'] == SERVICE_AGREE): ?>
			<a href="javascript:drop_confirm('您确定要撤消该店铺的此项服务吗？', 'index.php?app=consumer_service&amp;act=close&amp;id=<?php echo $this->_var['c_s_item']['c_id']; ?>');">撤消</a>
			<?php else: ?>
			-
			<?php endif; ?>
			</td>
		</tr>
		<?php endforeach; else: ?>
		<tr class="no_data">
		  <td colspan="12">没有符合条件的记录</td>
		</tr>
		<?php endif; unset($_from); ?><?php $this->pop_vars();; ?>
	  </table>
	  <?php if ($this->_var['c_s_list']): ?>
	  <div id="dataFuncs">
		<div class="pageLinks"><?php echo $this->fetch('page.bottom.html'); ?></div>
	  </div>
	  <div class="clear"></div>
	  <?php endif; ?>

	</div>
	<?php echo $this->fetch('footer.html'); ?>
</div>