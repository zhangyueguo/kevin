<?php echo $this->fetch('member.header.html'); ?>
<script>
$(function(){
	$('#deposit-recharge').submit(function(){
		if($(this).find('input[name="money"]').val()=='' || $(this).find('input[name="money"]').val() <= 0) {
			alert('recharge_money_error');
			return false;
		}
		if($(this).find('input[name="method"]:checked').val()=='offline' && $(this).find('input[name="bid"]').length <=0) {
			alert('recharge_bank_empty');
			return false;
		}
	});
})
</script>
<div class="content">
    <?php echo $this->fetch('member.menu.html'); ?>
    <div id="right">
        <?php echo $this->fetch('member.submenu.html'); ?>
        <div class="wrap">
            <div class="public table deposit">
            	<div class="deposit-withdraw deposit-recharge">
                	<div class="notice-word">可以通过线上或线下为自己的账户充值，线下充值需要管理员审核</div>
                	<form method="post" id="deposit-recharge">
                    	<div class="title clearfix">
                        	<h2 class="float-left">充值到您的预存款账户</h2>
                            <div class="float-right link">
                            	<a class="add-bank" href="<?php echo url('app=bank&act=add&type=debit'); ?>">添加银行卡</a>
                            </div>
                        </div>
                		<div class="form">
                			<dl class="clearfix">
                        		<dt>充值方式：</dt>
                            	<dd class="clearfix" ectype="recharge-method">
                                	<div class="method-each clearfix">
                                    	<div class="radio float-left"><input name="method" type="radio" value="online" checked="checked" /></div>
                                        <div class="name float-left">线上充值</div>
                                    </div>
                                    
                                    <div class="method-each clearfix">
                                    	<div class="radio float-left"><input name="method" type="radio" value="offline" /></div>
                                        <div class="name float-left">线下汇款</div>
                                    </div>
                                </dd>
                        	</dl>
                            <dl class="bank-list clearfix" ectype="online">
                        		<dt>充值渠道：</dt>
                            	<dd>
                                	<ul class="ui-list-icons clearfix">
                                    	<input type="hidden" name="payment_code" value="alipay" />
                                    	<li class="clearfix">
											<input class="float-left" type="radio" name="defaultbank" id="alipay" value="alipay" checked="checked" />
											<label class="float-left  icon-box current " for="alipay" >
												<span class="icon-cashier icon-cashier-alipay" title="支付宝">&nbsp;</span>
											</label>
										</li>
                                    </ul>
                                    <!-- <ul class="ui-list-icons clearfix">
                                        <?php $_from = $this->_var['alipaybank']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('key', 'bank');$this->_foreach['fe_bank'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['fe_bank']['total'] > 0):
    foreach ($_from AS $this->_var['key'] => $this->_var['bank']):
        $this->_foreach['fe_bank']['iteration']++;
?>
                                        <li class="clearfix">
                                            <input class="float-left"  type="radio" name="defaultbank" id="<?php echo $this->_var['key']; ?>" value="<?php echo $this->_var['key']; ?>" />
                                            <label class="float-left icon-box current " for="<?php echo $this->_var['key']; ?>" >
                                                <span class="icon-cashier icon-cashier-<?php echo $this->_var['key']; ?>" title="<?php echo $this->_var['bank']; ?>">&nbsp;<em class="qiye hidden">企业</em></span>
                                            </label>
                                        </li>
                                        <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
                                    </ul> -->
                                </dd>  
                        	</dl>
                            <dl class="clearfix" ectype="offline" style="display:none">
                        		<dt>汇款银行：</dt>
                            	<dd class="clearfix">
                                	<?php $_from = $this->_var['bank_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'bank');$this->_foreach['fe_bank'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['fe_bank']['total'] > 0):
    foreach ($_from AS $this->_var['bank']):
        $this->_foreach['fe_bank']['iteration']++;
?>
                                	<div class="bank-each clearfix <?php if (($this->_foreach['fe_bank']['iteration'] <= 1)): ?> selected <?php endif; ?>">
                                    	<div class="radio float-left"><input name="bid" type="radio" value="<?php echo $this->_var['bank']['bid']; ?>" <?php if (($this->_foreach['fe_bank']['iteration'] <= 1)): ?> checked="checked" <?php endif; ?>/></div>
                                        <div class="bank-name float-left"><?php echo $this->_var['bank']['bank_name']; ?></div>
                                        <div class="bank-num float-left"><?php echo $this->_var['bank']['num']; ?></div>
                                        <div class="action float-right">
                                        	<a href="<?php echo url('app=bank&act=edit&bid=' . $this->_var['bank']['bid']. ''); ?>">编辑</a>
                                        </div>
                                    </div>
                                    <?php endforeach; else: ?>
									<div class="notice-word">您还没有设置银行信息，请先<a href="<?php echo url('app=bank&act=add&type=debit'); ?>">添加银行卡</a></div>
                                    <?php endif; unset($_from); ?><?php $this->pop_vars();; ?>
                                </dd>
                        	</dl>
                            
                            <dl class="clearfix">
                        		<dt>充值金额：</dt>
                            	<dd><input type="text" name="money" class="text" value="" /> 元</dd>
                        	</dl>
                            <dl class="clearfix">
                        		<dt>充值备注：</dt>
                            	<dd><textarea name="remark" class="text"></textarea></dd>
                        	</dl>
                            <dl class="clearfix">
                        		<dt>&nbsp;</dt>
                            	<dd class="submit">
                                	<span class="btn-alipay">
                                		<input type="submit" value="下一步" />
                                    </span>
                                </dd>
                        	</dl>
                		</div>
					</form>
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
