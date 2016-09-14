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
            	<div class="record">
                	<?php if (! $this->_var['deposit_record']): ?>
                    <div class="notice-word">没有该条收支记录信息</div>
                    <?php else: ?>
                	<div class="title"><h2>记录详情</h2></div>
                    <div class="content">
                    	<div class="status-info clearfix">
                        	<h3><?php echo $this->_var['deposit_record']['status_label']; ?></h3>
                            <div class="extra"></div>
                        </div>
                        
                        <div class="trade-list">
                        	<ul class="ul-head clearfix">
                            	<li class="paytype">类型</li>
                                <li class="name">名称</li>
                                <li class="amount">金额</li>
                            </ul>
                            <ul class="clearfix">
                            	<li class="paytype"><?php if ($this->_var['deposit_record']['flow'] == 'income'): ?>收入<?php else: ?>支出<?php endif; ?></li>
                                <li class="name"><?php echo $this->_var['deposit_record']['name']; ?>
                                	<?php if ($this->_var['deposit_record']['remark']): ?><span title="<?php echo htmlspecialchars($this->_var['deposit_record']['remark']); ?>" class="gray"><?php echo sub_str(htmlspecialchars($this->_var['deposit_record']['remark']),30); ?></span><?php endif; ?>
                                </li>
                                <li class="amount"><strong class="price f60"><?php echo $this->_var['deposit_record']['total']; ?></strong></li>
                            </ul>
                        </div>
                        
                        <?php if ($this->_var['order']): ?>
                        <div class="trade-goods mt20">
                        	<ul class="ul-head clearfix">
                            	<li class="info">宝贝</li>
                                <li class="props">宝贝属性</li>
                                <li class="status">状态</li>
                                <li class="price">单价(元)</li>
                                <li class="quantity">数量</li>
                                <li class="amount">商品总价(元)</li>
                            </ul>
                            <?php $_from = $this->_var['order']['order_goods']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'goods');$this->_foreach['fe_goods'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['fe_goods']['total'] > 0):
    foreach ($_from AS $this->_var['goods']):
        $this->_foreach['fe_goods']['iteration']++;
?>
                            <ul class="ul-list clearfix">
                            	<li class="info clearfix">
                                	<div class="pic float-left"><a href="<?php echo url('app=goods&id=' . $this->_var['goods']['goods_id']. ''); ?>" target="_blank"><img src="<?php echo $this->_var['goods']['goods_image']; ?>" width="40" height="40" /></a></div>
                                    <div class="desc float-left"><a href="<?php echo url('app=goods&id=' . $this->_var['goods']['goods_id']. ''); ?>" target="_blank" title="<?php echo htmlspecialchars($this->_var['goods']['goods_name']); ?>"><?php echo sub_str(htmlspecialchars($this->_var['goods']['goods_name']),50); ?></a></div>
                                </li>
                                <li class="props"><?php echo $this->_var['goods']['specification']; ?>&nbsp;</li>
                                <li class="status">

                                	<?php if (! $this->_var['goods']['status'] && ! $this->_var['goods']['refund_status']): ?>
                                    未确认收货
                            		<?php elseif ($this->_var['goods']['status'] == 'SUCCESS'): ?>
                                    已确认收货
                                    <?php else: ?>
                            		<?php if ($this->_var['goods']['refund_status'] == 'SUCCESS'): ?>
                           			<a href="<?php echo url('app=refund&act=view&refund_id=' . $this->_var['goods']['refund_id']. ''); ?>" target="_blank">退款成功</a>
                            		<?php elseif ($this->_var['goods']['refund_status'] == 'CLOSED'): ?>
                            		<a href="<?php echo url('app=refund&act=view&refund_id=' . $this->_var['goods']['refund_id']. ''); ?>" target="_blank">退款关闭</a>
                            		<?php else: ?>
                            		<a href="<?php echo url('app=refund&act=view&refund_id=' . $this->_var['goods']['refund_id']. ''); ?>"target="_blank">退款中</a>
                            		<?php endif; ?>
                            		<?php endif; ?>
                                </li>
                                <li class="price"><?php echo $this->_var['goods']['price']; ?></li>
                                <li class="quantity"><?php echo $this->_var['goods']['quantity']; ?></li>
                                <li class="amount" <?php if (! ($this->_foreach['fe_goods']['iteration'] == $this->_foreach['fe_goods']['total'])): ?> style="border-bottom:1px #fff solid;"<?php endif; ?>>
                                	<?php if (($this->_foreach['fe_goods']['iteration'] <= 1)): ?><p><?php echo $this->_var['order']['order_amount']; ?><br />(<?php echo $this->_var['order']['shipping_name']; ?>:<?php echo $this->_var['order']['shipping_fee']; ?>)</p><?php endif; ?>
                                </li>
                            </ul>
                            <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
                        </div>

                        <div class="trade-slips">
                        	<dl class="clearfix">
                            	<dt>订单编号：</dt><dd>
                                <?php echo $this->_var['deposit_record']['order_sn']; ?>
                                </dd>
                            </dl>
                            <dl class="clearfix">
                            	<dt>订单详情：</dt><dd>
                                	<?php if ($this->_var['deposit_record']['purpose'] == 'buygoods' || $this->_var['deposit_record']['purpose'] == 'refund'): ?>
                                    <a class="view" href="<?php echo url('app=buyer_order&act=view&order_id=' . $this->_var['deposit_record']['order_id']. ''); ?>" target="_blank">详情</a>
                                    <?php else: ?>
                                    <a class="view" href="<?php echo url('app=seller_order&act=view&order_id=' . $this->_var['deposit_record']['order_id']. ''); ?>" target="_blank">详情</a>
                                    <?php endif; ?>
                                </dd>
                            </dl>
                        </div>
                        <?php endif; ?>
                        
                        <div class="trade-slips">
                        	
                        	<dl class="clearfix">
                            	<dt>对方信息：</dt><dd>
                                <?php if ($this->_var['deposit_record']['account']): ?>
                                预存款账户：<?php echo $this->_var['deposit_record']['account']; ?>&nbsp;&nbsp;&nbsp;<?php echo $this->_var['deposit_record']['real_name']; ?>&nbsp;&nbsp;&nbsp;<?php if ($this->_var['deposit_record']['phone_mob']): ?><?php echo $this->_var['deposit_record']['phone_mob']; ?><?php else: ?><?php echo $this->_var['deposit_record']['phone_tel']; ?><?php endif; ?>
                                <?php else: ?><?php echo $this->_var['deposit_record']['payway']; ?>
                                <?php endif; ?>
                                </dd>
                            </dl>
                            <dl class="clearfix time">
                            	<dt>时间报告：</dt>
                                <dd class="clearfix time-head">
                                	<div class="add-time">创建时间</div>
                                    <div class="pay-time">付款时间</div>
                                    <div class="end-time">结束时间</div>
                                </dd>
                                <dd class="clearfix">
                                	<div class="add-time"><?php echo date("Y.m.d H:i:s",$this->_var['deposit_record']['add_time']); ?></div>
                                    <div class="pay-time"><?php echo date("Y.m.d H:i:s",$this->_var['deposit_record']['pay_time']); ?></div>
                                    <div class="end-time"><?php echo date("Y.m.d H:i:s",$this->_var['deposit_record']['end_time']); ?></div>
                                </dd>
                            </dl>
                        </div>
                        
                    </div>
                    <?php endif; ?>
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
