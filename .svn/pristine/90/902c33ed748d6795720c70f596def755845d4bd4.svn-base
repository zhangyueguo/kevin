<?php echo $this->fetch('member.header.html'); ?>
<div class="content">
    <div class="totline"></div><div class="botline"></div>
    <?php echo $this->fetch('member.menu.html'); ?>
    <div id="right">
          <ul class="tab">
				<li class="active">设置</li>
				<li class="normal"><a href="?app=msg&act=send">发送手机短信</a></li>
          </ul>
        <div class="wrap margin1">
            <div class="public table">
				<div class="information_index" style="overflow:hidden; margin: 0px 0 -15px;">
                   <div class="info">
                        <h3 class="margin2">
                            <span>您好！<?php echo $this->_var['visitor']['user_name']; ?></span><br />
                           
                            <?php if ($this->_var['mobile']): ?>
                            	您的短信发送量为<em style="color: #FE5400;font-size: 16px;font-weight: bold;"> <?php echo $this->_var['num']; ?> </em>条!
                            <?php else: ?>
                            	您还没有绑定手机，不能使用短信功能，请先绑定手机！
                            <?php endif; ?>
                        </h3>
                  </div>
             </div>
         </div>
      </div>
	 <div class="wrap">
            <div class="public table">
			<form name="set" action="index.php?app=msg" method="post">
				  <h3 class="title" style="margin: 10px 0 10px; color:#3E3E3E">帐户设置</h3>
					
				<div style="color:#646665;float:left;font-size:12px;font-weight:normal;line-height:30px;">
					<span>捆绑手机：</span>
                    <input type="text" name="mobile" value="<?php echo $this->_var['mobile']; ?>">
                    <br />
                    <span>是否开启：</span>
                    <label>
                        <input type="radio" name="state" value="1"<?php if ($this->_var['state'] == "1"): ?> checked="checked"<?php endif; ?> />
                        是
                    </label>
                    <label>
                        <input type="radio" name="state" value="0"<?php if ($this->_var['state'] == "0"): ?> checked="checked"<?php endif; ?> />
                        否
                    </label>
                    <br />
                    <span>选择发送：</span>
                    <?php if ($this->_var['functions']): ?>
                    <?php $_from = $this->_var['functions']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'func');if (count($_from)):
    foreach ($_from AS $this->_var['func']):
?>
                		<input type="checkbox" name="functions[]"<?php if ($this->_var['checked_functions'][$this->_var['func']]): ?> checked<?php endif; ?> value="<?php echo $this->_var['func']; ?>" id="function_<?php echo $this->_var['func']; ?>" /><label for="function_<?php echo $this->_var['func']; ?>">&nbsp;<?php echo $this->_var['lang'][$this->_var['func']]; ?></label>&nbsp;&nbsp;
            		<?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
                    <?php endif; ?>
                    <br />
                    <input class="money_btn" type="submit" name="Submit" value="提交" />

				</div>
			</form>				  
				
		
         </div>
		</div>		
        <div class="clear"></div>
        <div class="adorn_right1"></div>
        <div class="adorn_right2"></div>
        <div class="adorn_right3"></div>
        <div class="adorn_right4"></div>
    </div>
    <div class="clear"></div>
</div>
<div class="clear"></div>
<?php echo $this->fetch('footer.html'); ?>