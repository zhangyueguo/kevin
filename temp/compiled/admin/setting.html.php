<?php echo $this->fetch('header.html'); ?>

<div class="mrightTop">
	<div class="fontl">欢迎使用短信插件</div>
</div>

<div id="rightTop">
    <ul class="subnav" style="margin:0;">
		<li><a class="btn1" href="index.php?module=msg">发送记录</a></li>
        <li><a class="btn1" href="index.php?module=msg&act=user">短信用户</a></li>
        <li><a class="btn1" href="index.php?module=msg&act=add">增加短信</a></li>
        <li><a class="btn1" href="index.php?module=msg&act=send">短信发送</a></li>
        <li><span>设置</span></li>
    </ul>
</div>

<div class="info">

  <table class="infoTable">
    <form method="post">
            <tr>
                <th class="paddingT15">短信用户名:</th>
                <td class="paddingT15 wordSpacing5">
				<input name="msg_pid" type="text" value="<?php echo $this->_var['setting']['msg_pid']; ?>" size="20">
				</td>
            </tr>
            <tr>
                <th class="paddingT15">短信密钥:</th>
              <td class="paddingT15 wordSpacing5">
				<input name="msg_key" type="text" value="<?php echo $this->_var['setting']['msg_key']; ?>" size="20">
				</td>
            </tr>
            <tr>
            <th></th>
            <td class="ptb20">
                <input class="formbtn" type="submit" name="Submit" value="提交" />
                <input class="formbtn" type="reset" name="Submit2" value="重置" />
            </td>
            </tr>
    </form>
      </table>	
</div>
<?php echo $this->fetch('footer.html'); ?>