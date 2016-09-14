<?php echo $this->fetch('member.header.html'); ?>
<script type="text/javascript">
$(function(){
    $('#add_time_from').datepicker({dateFormat: 'yy-mm-dd'});
    $('#add_time_to').datepicker({dateFormat: 'yy-mm-dd'});
});
</script>

<div class="content">
    <?php echo $this->fetch('member.menu.html'); ?>
    <div id="right">
        <?php echo $this->fetch('member.submenu.html'); ?>
        <div class="wrap">
            <div class="public table deposit">
            	<div class="drawlist">
                	<div class="tab-ttl">
                		<ul class="withdraw-tab clearfix">
                    		<li class="current"><a href="<?php echo url('app=deposit&act=drawlist'); ?>"><span>提现记录</span></a></li>
                        	<li><a href="<?php echo url('app=deposit&act=rechargelist'); ?>"><span>充值记录</span></a></li>
                    	</ul>
                    </div>
                	<div class="title clearfix">
                    	<form method="get" class="float-left">
                        	<input type="hidden" name="app" value="deposit" />
                            <input type="hidden" name="act" value="drawlist" />
                			<input class="text" type="text" name="add_time_from" id="add_time_from" value="<?php echo $_GET['add_time_from']; ?>" /> <span>-</span>
                            <input class="text" id="add_time_to" type="text" name="add_time_to" value="<?php echo $_GET['add_time_to']; ?>" />
                            <select name="status">
                            	<option value=""></option>
                            	<option value="success" <?php if ($_GET['status'] == 'success'): ?> selected="selected" <?php endif; ?>>交易完成</option>
                                <option value="verifing" <?php if ($_GET['status'] == 'verifing'): ?> selected="selected" <?php endif; ?>>审核中</option>
                            </select>
                			<input type="submit" class="btn-withdraw" value="搜索" />
        				</form>
                        <div class="float-left">
                    		已成功提现 <strong><?php echo $this->_var['withdraws']['total_amount']; ?></strong> 元
                        </div>
                        <?php echo $this->fetch('member.page.top.html'); ?>
                    </div>
                    <ul class="subtit">
                    	<li class="clearfix">
                        	<div class="tradesn">流水号</div>
                            <div class="time">创建时间</div>
                        	<div class="info">名称</div>
                            <div class="method">收/支</div>
                            <div class="money">金额(元)</div>
                            <div class="payway">资金渠道</div>
                            <div class="status">状态</div>
                        </li>
                    </ul>
                    <div class="content">
                    	<ul>
                    		<?php $_from = $this->_var['withdraws']['list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'withdraw');if (count($_from)):
    foreach ($_from AS $this->_var['withdraw']):
?>
                        	<li class="clearfix">
                        		<div class="tradesn"><?php echo $this->_var['withdraw']['tradesn']; ?></div>
                            	<div class="time"><?php echo date("Y.m.d H.i.s",$this->_var['withdraw']['add_time']); ?></div>
                        		<div class="info">提现</div>
                            	<div class="method"><span class="f60">支付</span></div>
                            	<div class="money">
                                	<?php echo $this->_var['withdraw']['amount']; ?>
                                </div>
                            	<div class="payway"><?php echo $this->_var['withdraw']['card_info']['bank_name']; ?><br /><span class="gray"><?php echo $this->_var['withdraw']['card_info']['num']; ?></span></div>
                            	<div class="status"><?php if ($this->_var['withdraw']['status'] == 'SUCCESS'): ?>交易完成<?php else: ?><span class="f60">审核中</span><?php endif; ?></div>
                        	</li>
                            <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
                    	</ul>
                        <?php if (! $this->_var['withdraws']['list']): ?>
                        <div class="notice-word mt10">没有任何符合条件的记录。 <a href="<?php echo url('app=deposit&act=withdraw'); ?>">马上提现</a></div>
                        <?php endif; ?>
                    </div>
                    <?php echo $this->fetch('member.page.bottom.html'); ?>
				</div>
            </div>
            <div class="wrap_bottom"></div>
        </div>
        <div class="clear"></div>
        <div class="adorn_right1"></div>
        <div class="adorn_right2"></div>
        <div class="adorn_right3"></div>
        <div class="adorn_right4"></div>
    </div>

    <div class="clear"></div>
</div>
<iframe id='iframe_post' name="iframe_post" src="about:blank" frameborder="0" width="0" height="0"></iframe>
<?php echo $this->fetch('footer.html'); ?>
