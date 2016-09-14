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


                <form method="post" enctype="multipart/form-data" id="brand_form">
                    <table class="infoTable">
                        <tr>
                            <th class="paddingT15">
                                公司名称:</th>
                            <td class="paddingT15 wordSpacing5">
                                 <?php echo $this->_var['company']['companyname']; ?>
                            </td>
                        </tr>

                        <tr>
                            <th class="paddingT15">
                                营业执照:</th>
                            <td class="paddingT15 wordSpacing5">
                                <input class="infoTableFile2" id="brand_logo" type="file" name="bus_img" />
                                <label class="field_notice">支持格式gif,jpg,jpeg,png</label>
                            </td>
                        </tr>
                        <tr>
                            <th class="paddingT15">
                                1.</th>
                            <td class="paddingT15 wordSpacing5">
                                请上传加盖企业公章（红章）的营业执照或组织机构代码证复印件；
                            </td>
                        </tr>
                        <tr>
                            <th class="paddingT15">
                                2.</th>
                            <td class="paddingT15 wordSpacing5">
                              营业执照名称需于企业名称相同；
                            </td>
                        </tr>
                        <tr>
                            <th class="paddingT15">
                                3.</th>
                            <td class="paddingT15 wordSpacing5">
                                营业执照的详细信息需清晰可见，并承诺图片内容真实有效；
                            </td>
                        </tr>
                        <tr>
                            <th class="paddingT15">
                                4.</th>
                            <td class="paddingT15 wordSpacing5">
                                图片的格式为jpeg jpg  png ，并且小于5M；
                            </td>
                        </tr>


                        <?php if ($this->_var['company']['bus_img']): ?>
                        <tr>
                            <th class="paddingT15">
                            </th>
                            <td class="paddingT15 wordSpacing5">
                                <img src="<?php echo $this->_var['company']['bus_img']; ?>" class="makesmall" max_width="120" max_height="90" />
                            </td>
                        </tr>
                        <?php endif; ?>

                        <tr>
                            <th class="paddingT15">
                                法人证件:</th>
                            <td class="paddingT15 wordSpacing5">
                               如只开发票，无需上传法人证件
                            </td>
                        </tr>
                        <tr>
                            <th class="paddingT15">
                                </th>
                            <td class="paddingT15 wordSpacing5">
                                <input class="infoTableFile2" id="brand_lo1go" type="file" name="card_s" />
                                <label class="field_notice">正面</label>
                            </td>
                        </tr>
                        <?php if ($this->_var['company']['card_s']): ?>
                        <tr>
                            <th class="paddingT15">
                            </th>
                            <td class="paddingT15 wordSpacing5">
                                <img src="<?php echo $this->_var['company']['card_s']; ?>" class="makesmall" max_width="120" max_height="90" />
                            </td>
                        </tr>
                        <?php endif; ?>
                        <tr>
                            <th class="paddingT15">
                            </th>
                            <td class="paddingT15 wordSpacing5">
                                <input class="infoTableFile2" id="brand_lwro1go" type="file" name="card_x" />
                                <label class="field_notice">反面</label>
                            </td>
                        </tr>
                        <?php if ($this->_var['company']['card_x']): ?>
                        <tr>
                            <th class="paddingT15">
                            </th>
                            <td class="paddingT15 wordSpacing5">
                                <img src="<?php echo $this->_var['company']['card_x']; ?>" class="makesmall" max_width="120" max_height="90" />
                            </td>
                        </tr>
                        <?php endif; ?>

                        <tr>
                            <th class="paddingT15">
                                1.</th>
                            <td class="paddingT15 wordSpacing5">
                                请上传在有效期内的二代身份证或临时身份证图片；
                            </td>
                        </tr>
                        <tr>
                            <th class="paddingT15">
                                2.</th>
                            <td class="paddingT15 wordSpacing5">
                                请上传在有效期内的护照图片；
                            </td>
                        </tr>
                        <tr>
                            <th class="paddingT15">
                                3.</th>
                            <td class="paddingT15 wordSpacing5">
                                身份证的详细信息需要清晰可见，并承诺内容真实有效；
                            </td>
                        </tr>
                        <tr>
                            <th class="paddingT15">
                                4.</th>
                            <td class="paddingT15 wordSpacing5">
                                图片格式为jpeg jpg png ，并且小于5M；
                            </td>
                        </tr>


                        <tr>
                            <th></th>
                            <td class="ptb20">
                                <input class="formbtn" type="submit" name="Submit" value="提交" />
                                <input class="formbtn" type="reset" name="Submit2" value="重置" />
                            </td>
                        </tr>
                    </table>
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
