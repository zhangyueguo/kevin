<?php echo $this->fetch('member.header.html'); ?>
<div class="content">
    <?php echo $this->fetch('member.menu.html'); ?>
    <div id="right">
          <ul class="tab">
				<li class="active">礼品兑换</li>
				<li class="normal"><a href="index.php?app=my_money&act=duihuan_jilu">兑换记录</a></li>
          </ul>

    
<?php $_from = $this->_var['index']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('key', 'val');if (count($_from)):
    foreach ($_from AS $this->_var['key'] => $this->_var['val']):
?>
<?php if (($this->_foreach['v']['iteration'] == $this->_foreach['v']['total'])): ?><div class="wrap"><?php else: ?> <div class="wrap margin1"><?php endif; ?>          
<table width="700" border="1" cellspacing="8">
  <tr>
    <td width="160" rowspan="4"><?php if ($this->_var['val']['wupin_img']): ?><img src="<?php echo $this->_var['val']['wupin_img']; ?>" width="160" height="160" /><?php else: ?><img src="data/system/default_goods_image.gif" width="160" height="160" /><?php endif; ?></td>
    <td width="418">名称：<?php echo $this->_var['val']['wupin_name']; ?></td>
    <td width="100">可兑换数：<?php echo $this->_var['val']['shuliang']; ?></td>
  </tr>
  <tr>
    <td><font color="#FF0000">兑换积分：<?php echo $this->_var['val']['jifen']; ?></font>&nbsp;&nbsp;（价值：<?php echo $this->_var['val']['jiazhi']; ?>元）</td>
    <td>已兑换数：<?php echo $this->_var['val']['yiduihuan']; ?></td>
  </tr>
  <tr>
    <td valign="top">说明：</td>
    <td valign="top"><a href="index.php?app=my_money&amp;act=jifen_post&id=<?php echo $this->_var['val']['id']; ?>">我要兑换&gt;&gt;</a></td>
  </tr>
  <tr>
    <td valign="top"><?php echo $this->_var['val']['log_text']; ?></td>
    <td valign="top">&nbsp;</td>
  </tr>
</table>
        		
           </div><?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>  		



           	
<?php if ($this->_var['index']): ?>
<?php if (($this->_foreach['v']['iteration'] == $this->_foreach['v']['total'])): ?><div class="wrap"><?php else: ?> <div class="wrap margin1"><?php endif; ?>  
<?php echo $this->fetch('member.page.bottom.html'); ?>
</div>
<?php endif; ?>

	
        <div class="clear"></div>
        <div class="adorn_right1"></div>
        <div class="adorn_right2"></div>
        <div class="adorn_right3"></div>
        <div class="adorn_right4"></div>
    </div>
    <div class="clear"></div>
</div>
<div class="clear"></div>
<iframe id='iframe_post' name="iframe_post" frameborder="0" width="0" height="0">
</iframe>
<?php echo $this->fetch('footer.html'); ?>
