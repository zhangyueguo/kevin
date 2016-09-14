<?php echo $this->fetch('member.header.html'); ?>

<script type="text/javascript">
$(function(){
    $('#send_email').click(function(){
		time(this, 60);
		send_email();
	});
	
	function time(o, wait) {
		if (wait == 0) {
			o.removeAttribute("disabled");			
			o.value="get_mail_captcha";
			wait = 60;
		} else {
			o.setAttribute("disabled", true);
			o.value="get_mail_captcha_again(" + wait + "miao_hou)";
			wait--;
			setTimeout(function() {
				time(o, wait)
			},
			1000)
		}
	}
	function send_email(){
    	$.ajax({
        	type:"POST",
        	url:"index.php",
        	data:'app=deposit&act=send_email&email='+$("input[name='account']").val(),
        	dataType:"json",
        	success:function(data){
           	 	if(data.done){
            	alert(data.msg);
            	}
            	else{
                	alert(data.msg);
            	}
        	},
        	error: function(){alert('mail_send_failure');}
    	});
	}
	
});
</script>

<div class="content">
    <?php echo $this->fetch('member.menu.html'); ?>
    <div id="right">
        <?php echo $this->fetch('member.submenu.html'); ?>
        <div class="wrap">
            <div class="public table deposit">
            	<div class="deposit-config">
                	<div class="notice-word">您的账户名一旦设置后，将不允许修改，请填写正确的信息</div>
                	<form method="post">
                		<div class="form">
                			<dl class="clearfix">
                        		<dt>账 户 名</dt>
                            	<dd><input type="text" name="account" class="text width_normal" value="<?php echo $this->_var['deposit_account']['account']; ?>" <?php if ($this->_var['deposit_account']): ?> readonly="readonly"<?php endif; ?> /></dd>
                                <dd class="gray">请填写正确的电子邮件地址</dd>
                        	</dl>
                            <dl class="clearfix">
                        		<dt>真实姓名</dt>
                            	<dd><input type="text" name="real_name" class="text width_normal" value="<?php echo $this->_var['deposit_account']['real_name']; ?>" /></dd>
                                <dd class="gray"></dd>
                        	</dl>
                            <dl class="clearfix">
                        		<dt>支付密码</dt>
                            	<dd><input type="password" name="password" class="text width_normal" /></dd>
                                <dd class="gray">付款的时候，需要输入支付密码才能付款成功</dd>
                        	</dl>
                            <dl class="clearfix">
                        		<dt>重复密码</dt>
                            	<dd><input type="password" name="password_confirm" class="text width_normal" /></dd>
                                <dd class="gray">确认您的密码</dd>
                        	</dl>
                            <dl class="clearfix">
                        		<dt>开启余额支付</dt>
                            	<dd>
                                	<label><input type="radio" name="pay_status" <?php if ($this->_var['deposit_account']['pay_status'] == 'ON' || ! $this->_var['deposit_account']): ?> checked="checked" <?php endif; ?>value="on" /> 是</label>
                                    <label><input type="radio" name="pay_status" <?php if ($this->_var['deposit_account']['pay_status'] == 'OFF'): ?> checked="checked"<?php endif; ?> value="off" /> 否</label>
                                </dd>
                                <dd class="gray">通过此开关，可以设置您的账户余额资金是否可以用于支付，以保护您的资金安全</dd>
                        	</dl>
                            <dl class="clearfix">
                        		<dt>邮件验证码</dt>
                            	<dd>
                                	<input type="text" name="email_captcha" value="" class="text width_normal" />
                                    <input type="button" id="send_email" value="get_mail_captcha" />
                                </dd>
                                <dd class="gray"></dd>
                        	</dl>
                            <dl class="clearfix">
                        		<dt>&nbsp;</dt>
                            	<dd>
                                	 <span class="btn-alipay"><input type="submit"  value="提交" /></span>
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
