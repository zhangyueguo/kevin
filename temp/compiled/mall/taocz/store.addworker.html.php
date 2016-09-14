<?php echo $this->fetch('company.header.html'); ?>
<style>
    .borline td {padding:10px 0px;}
    .ware_list th {text-align:left;}
</style>
<script type="text/javascript">
    //<!CDATA[
    $(function(){
        $('#profile_form').validate({
            errorPlacement: function(error, element){
                $(element).parent('span').parent('b').after(error);
            },
            rules : {
                portrait : {
                    accept   : 'gif|jpe?g|png'
                }
            },
            messages : {
                portrait  : {
                    accept   : 'avatar'
                }
            }
        });
        $('input[ectype="change_avatar"]').change(function(){

            var src = getFullPath($(this)[0]);
            $('img[ectype="avatar"]').attr('src', src);
            $('input[ectype="change_avatar"]').removeAttr('name');
            $(this).attr('name', 'portrait');
        });
    });

    //]]>
</script>
<div class="content">
    <?php echo $this->fetch('company.menu.html'); ?>
    <div id="right">



        <div class="submenu">
            <ul class="tab">

                <li class="normal <?php if (($this->_foreach['member_submenu']['iteration'] <= 1)): ?>first<?php endif; ?>"><h2><a href="index.php?app=seller_store_sect">部门列表</a></h2></li>

                <li class="normal <?php if (($this->_foreach['member_submenu']['iteration'] <= 1)): ?>first<?php endif; ?>"><h2><a href="index.php?app=seller_store_sect&act=addsector">添加部门</a></h2></li>

                <li class="normal <?php if (($this->_foreach['member_submenu']['iteration'] <= 1)): ?>first<?php endif; ?>"><h2><a href="index.php?app=store_worker">员工列表</a></h2></li>

                <li class="active <?php if (($this->_foreach['member_submenu']['iteration'] <= 1)): ?>first<?php endif; ?>"><h2><a href="index.php?app=store&act=addworker">添加员工</a></h2></li>

                <div class="dustbin">
                    <!--<a href="index.php?app=buyer_order&act=dustbin" <?php if ($this->_var['_s_m']['dustbin'] == '1'): ?>style="color:#EE3000; text-decoration:none"<?php endif; ?>>订单回收站</a>-->
                </div>
            </ul>
        </div>




        <div class="wrap">
            <div class="public">
                <form method="post" enctype="multipart/form-data" id="profile_form">
                    <div class="information">

                        <div class="info individual">
                            <table>
                                <tr>
                                    <!--<th class="width4">company_name: </th>-->
                                    <th class="width4">员工姓名: </th>
                                    <td><input type="text" class="text width_normal" name="worker_name" value="<?php echo $this->_var['storeworker']['workername']; ?>" /></td>
                                </tr>
                                <tr>
                                    <th>手机号:</th>
                                    <td><input type="text" class="text width_normal" name="worker_phone" value="<?php echo $this->_var['storeworker']['workerphone']; ?>" /></td>
                                </tr>
                                <tr>
                                    <th>所在部门:</th>
                                    <td class="paddingT15 wordSpacing5" >
                                        <div id="region">
                                            <!--<select name="sectname" style="">
                                                <option value="">一部门</option>
                                                <option value="">二部门</option>
                                            </select>-->
                                            <select id="parent_id" name="parent_id"><option value="0">上级分类</option><?php echo $this->html_options(array('options'=>$this->_var['parents'],'selected'=>$this->_var['storeworker']['sectid'])); ?></select>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <!--<th>birthday: </th>-->
                                    <th>系统角色: </th>
                                    <td class="label">
                                        <label><input type="radio" name="juese" value="0" <?php if ($this->_var['storeworker']['juese'] == 0): ?>checked="checked"<?php endif; ?> />系统管理员</label>
                                        <label><input type="radio" name="juese" value="1" <?php if ($this->_var['storeworker']['juese'] == 1): ?>checked="checked"<?php endif; ?> />部门负责人</label>
                                        <label><input type="radio" name="juese" value="2" <?php if ($this->_var['storeworker']['juese'] == 2): ?>checked="checked"<?php endif; ?> />职工</label>
                                    </td>
                                </tr>
                                <tr>
                                    <th>状态:</th>
                                    <td class="label">
                                    <label><input type="radio" name="status" value="0" <?php if ($this->_var['storeworker']['status'] == 0): ?>checked="checked"<?php endif; ?> /> 未激活</label>
                                    <label><input type="radio" name="status" value="1" <?php if ($this->_var['storeworker']['status'] == 1): ?>checked="checked"<?php endif; ?> />激活</label>
                                    </td>
                                </tr>

                                <tr>
                                    <th></th>
                                    <td><input type="submit" class="btn" value="提交" /></td>
                                </tr>
                            </table>
                        </div>
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
