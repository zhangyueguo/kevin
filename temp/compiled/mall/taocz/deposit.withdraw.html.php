<?php echo $this->fetch('member.header.html'); ?>
<script>
$(function(){
	$('#deposit-withdraw').submit(function(){
		if($(this).find('input[name="money"]').val()=='' || $(this).find('input[name="money"]').val() <= 0) {
			alert('withdraw_money_error');
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
            	<div class="deposit-withdraw">
                	<?php if ($this->_var['deposit_account']['money'] > 0): ?>
                    <?php if (! $this->_var['bank_list']): ?>
                    <div class="notice-word">您还没有设置提现银行卡，请先设置后再申请提现。<a href="<?php echo url('app=bank&act=add'); ?>">马上设置</a></div>
                    <?php else: ?>
                	<div class="notice-word">向平台商提交提现申请，审核通过之后，平台将向您提交的银行卡汇款，请确保您的银行卡信息正确</div>
                	<form method="get" id="deposit-withdraw">
                    	<input type="hidden" name="app" value="deposit" />
                        <input type="hidden" name="act" value="withdraw_confirm" />
                    	<div class="title clearfix">
                        	<h2 class="float-left">提取余额到银行卡</h2>
                            <p class="float-left">余额：<strong><?php echo $this->_var['deposit_account']['money']; ?></strong> 元</p>
                            <div class="float-right link">
                            	<a class="add-bank" href="<?php echo url('app=bank&act=add&type=debit'); ?>">添加银行卡</a>
                                <a href="<?php echo url('app=deposit&act=drawlist'); ?>">提现记录</a>
                            </div>
                        </div>
                		<div class="form">
                			<dl class="clearfix">
                        		<dt>选择银行卡：</dt>
                            	<dd>
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
                                    <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
                                </dd>
                        	</dl>
                            <dl class="clearfix">
                        		<dt>提现金额：</dt>
                            	<dd><input type="text" name="money" class="text" value="" /> 元</dd>
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
                    <?php endif; ?>
                    <?php else: ?>
                    <div class="notice-word">您目前账户余额为<span class="f60">0</span>元，不能申请提现。</div>
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
