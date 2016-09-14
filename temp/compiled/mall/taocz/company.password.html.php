<?php echo $this->fetch('company.header.html'); ?>
<style>
    .borline td {padding:10px 0px;}
    .ware_list th {text-align:left;}
</style>
<script type="text/javascript">

</script>
<div class="content">
    <?php echo $this->fetch('company.menu.html'); ?>
    <div id="right">
        <?php echo $this->fetch('member.submenu.html'); ?>
        <div class="wrap">
            <div class="public">
                <form method="post" id="password_form">
                    <ul>
                        <li><h3>你的密码:</h3>
                            <p><input type="password" class="text width_normal" name="orig_password" /></p>
                        </li>
                        <li>
                            <h3>新密码:</h3>
                            <p><input type="password" class="text width_normal" name="new_password" id="new_password"/></p>
                        </li>
                        <li>
                            <h3>确认密码:</h3>
                            <p><input type="password" class="text width_normal" name="confirm_password" /></p>
                        </li>
                    </ul>
                    <div class="submit">
                        <input class="btn" type="submit" value="提交" />
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
</div>
<?php echo $this->fetch('footer.html'); ?>
