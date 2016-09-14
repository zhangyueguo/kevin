<?php echo $this->fetch('company1.header.html'); ?>
<style>
    .borline td {padding:10px 0px;}
    .ware_list th {text-align:left;}
</style>
<script type="text/javascript">
    $(function(){
        $("input[type='radio']").click(function(){
              if($(this).val()=='shang'){
                  $(".shangh").show();
              }else{
                  $(".shangh").hide();
              }
        });

    });

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
                                    <th class="width4">企业名称: </th>
                                    <td><?php echo $this->_var['company']['companyname']; ?></td>
                                    <input type="hidden" class="text width_normal" name="company_name" value="<?php echo $this->_var['company']['companyname']; ?>" />
                                    <input type="hidden" class="text width_normal" name="company_id" value="<?php echo $this->_var['company']['id']; ?>" />
                                </tr>
                                <tr>
                                    <th>印呗类型:</th>
                                    <td>
                                        <label><input type="radio" name="beilei" value="ping" <?php if ($this->_var['profile']['gender'] == 1): ?>checked="checked"<?php endif; ?> /> 平台授信 </label>
                                        <label><input type="radio" name="beilei" value="shang" <?php if ($this->_var['profile']['gender'] == 2): ?>checked="checked"<?php endif; ?> /> 商家授信 </label>
                                    </td>
                                </tr>
                                <tr class="shangh" style="display: none">
                                    <th>选择商户:</th>
                                    <td class="paddingT15 wordSpacing5" >
                                        <div id="region">
                                            <input type="hidden" id="zih" name="region_id" value="" class="mls_id" />
                                            <input type="hidden" name="region_name" value="" class="mls_names" />
                                            <!--<span><?php echo htmlspecialchars($this->_var['company']['region_name']); ?></span>-->
                                            <input type="button" value="编辑" class="edit_region" />
                                            <select style="display:none">
                                                <option>请选择...</option>
                                                <?php echo $this->html_options(array('options'=>$this->_var['regions'])); ?>
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <!--<th>birthday: </th>-->
                                    <th>申请额度: </th>
                                    <td>
                                        <input type="text" class="text width_normal" name="edu" id="birthday" value="" /> 元（整数）
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
