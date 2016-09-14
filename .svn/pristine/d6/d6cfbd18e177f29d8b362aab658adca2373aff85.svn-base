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

                        <div class="info individual">
                            <table>

                                <tr>
                                    <th>授信周期:</th>
                                    <td><input type="text" class="text width_normal" name="zhouqi" value="<?php echo $this->_var['credit_set']['zhouqi']; ?>" />(周期为40--60）天</td>
                                </tr>
                                <!--<tr>
                                    <th class="width4">账单日: </th>
                                    <td>
                                        <select name="zhangdanri">
                                        <option>请选择...</option>
                                        <?php echo $this->html_options(array('options'=>$this->_var['days'],'selected'=>$this->_var['credit_set']['zhangdanri'])); ?>
                                        </select>
                                    日</td>
                                </tr>
                                <tr>
                                    <th>结算日:</th>
                                    <td>
                                        <select name="jiesuanri">
                                            <option>请选择...</option>
                                            <?php echo $this->html_options(array('options'=>$this->_var['days'],'selected'=>$this->_var['credit_set']['jiesuanri'])); ?>
                                        </select>
                                    日</td>
                                </tr>-->

                                <!--<tr>
                                    <th>地区:</th>
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
                                </tr>-->
                                <tr>
                                    <th>滞纳金: </th>
                                    <td>
                                        <input type="text" class="text width_normal" name="zhijin" id="birthday" value="<?php echo $this->_var['credit_set']['zhijin']; ?>" /> %/天
                                    </td>
                                </tr>
                                <tr>
                                    <th>电子账单模板:</th>
                                    <td> <input type="text" class="text width_normal" name="emailtm" value="<?php echo $this->_var['credit_set']['emailtm']; ?>" /></td>
                                </tr>
                                <tr>
                                    <th>短信账单模板:</th>
                                    <td><input type="text"  class="text width_normal"name="phonetm" value="<?php echo $this->_var['credit_set']['phonetm']; ?>" /></td>
                                </tr>
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
