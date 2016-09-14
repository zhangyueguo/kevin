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
        <?php echo $this->fetch('member.submenu.html'); ?>
        <div class="wrap">
            <div class="public">
                <form method="post" enctype="multipart/form-data" id="profile_form">
                    <div class="information">
                        <?php if (! $this->_var['edit_avatar']): ?>
                        <div class="photo width13">
                            <p><img src="<?php if ($this->_var['profile']['portrait']): ?><?php echo $this->_var['profile']['portrait']; ?>?<?php echo $this->_var['random_number']; ?><?php else: ?><?php echo $this->_var['site_url']; ?>/data/system/default_user_portrait.gif<?php endif; ?>" width="120" height="120" alt="" ectype="avatar" /></p>
                            <b>
                                <span class="file1"><input type="file" size="1" maxlength="0" hidefocus="true" ectype="change_avatar" name="portrait1" /></span>
                                <span class="file2"><input type="file" size="1" maxlength="0" hidefocus="true" ectype="change_avatar" name="portrait2" /></span>
                                <div class="txt">change_portrait</div>
                            </b>
                        </div>
                        <?php endif; ?>
                        <div class="info individual">
                            <table>
                                <tr>
                                    <!--<th class="width4">company_name: </th>-->
                                    <th class="width4">企业名称: </th>
                                    <td><input type="text" class="text width_normal" name="store_name" value="<?php echo $this->_var['store']['store_name']; ?>" /></td>
                                </tr>
                                <tr>
                                    <th>电子邮件:</th>
                                    <td><input type="text" class="text width_normal" name="email" value="<?php echo $this->_var['store']['storemail']; ?>" /></td>
                                </tr>
                                <tr>
                                    <th>地区:</th>
                                    <!--<td> </td>-->
                                    <td class="paddingT15 wordSpacing5" >
                                        <div id="region">
                                            <input type="hidden" name="region_id" value="<?php echo $this->_var['store']['region_id']; ?>" class="mls_id" />
                                            <input type="hidden" name="region_name" value="<?php echo htmlspecialchars($this->_var['store']['region_name']); ?>" class="mls_names" />
                                            <span><?php echo htmlspecialchars($this->_var['store']['region_name']); ?></span>
                                            <input type="button" value="编辑" class="edit_region" />
                                            <select style="display:none">
                                                <option>请选择...</option>
                                                <?php echo $this->html_options(array('options'=>$this->_var['regions'])); ?>
                                            </select>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <th>详细位置:</th>
                                    <td><input type="text" class="text width_normal" name="address" value="<?php echo $this->_var['store']['address']; ?>" /></td>
                                </tr>



                                <tr>
                                    <!--<th>birthday: </th>-->
                                    <th>负责人: </th>
                                    <td>
                                        <input type="text" class="text width_normal" name="lxrname" id="birthday" value="<?php echo $this->_var['store']['lxrname']; ?>" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>部门:</th>
                                    <td> <input type="text" class="text width_normal" name="sectname" value="<?php echo $this->_var['store']['sectname']; ?>" /></td>
                                </tr>
                                <tr>
                                    <th>固定电话:</th>
                                    <td><input type="text"  class="text width_normal"name="tel" value="<?php echo $this->_var['store']['tel']; ?>" /></td>
                                </tr>
                                <tr>
                                    <th>手机:</th>
                                    <td><input type="text"  class="text width_normal"name="phone" value="<?php echo $this->_var['store']['phone']; ?>" /></td>
                                </tr>
                                <?php if ($this->_var['edit_avatar']): ?>
                                <tr>
                                    <th>portrait:</th>
                                    <td><?php echo $this->_var['edit_avatar']; ?></td>
                                </tr>
                                <?php endif; ?>
                                <tr>
                                    <th></th>
                                    <!--<td><input type="submit" class="btn" value="save_edit" /></td>-->
                                    <td><input type="submit" class="btn" value="保存修改" /></td>
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
