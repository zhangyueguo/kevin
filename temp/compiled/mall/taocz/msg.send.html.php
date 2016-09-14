<?php echo $this->fetch('member.header.html'); ?>
<div class="content">
    <div class="totline"></div><div class="botline"></div>
    <?php echo $this->fetch('member.menu.html'); ?>
    <div id="right">
          <ul class="tab">
				<li class="normal"><a href="?app=msg">设置</a></li>
				<li class="active"><a href="?app=msg&act=send">发送手机短信</a></li>
          </ul>
          <div class="wrap">
            <div class="eject_wrap_msg">
                <div class="fill_in">
                    <div class="eject_con">
                        <div class="msg">
                            <form method="post" enctype="multipart/form-data" id="send_form" action="index.php?app=msg&act=send">
                            <ul>
                                <li>
                                    <h3>手机号码: </h3>
                                    <p><input type="text" class="text width_normal" name="to_mobile" value=""/><span class="field_notice">填写接收手机信息的号码</span></p>
                                </li>
                                <li>
                                    <h3>内 容: </h3>
                                    <p><textarea class="text width_long" name="msg_content" /></textarea></p>
                                    <div class="clear"></div>
                                </li>
                            </ul>
                            <div class="submit"><input type="submit" class="btn" value="确定发送" /></div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
          </div>
    </div>
    <div class="clear"></div>
</div>
<?php echo $this->fetch('footer.html'); ?>
