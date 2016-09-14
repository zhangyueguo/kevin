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
                    accept   : '支持gif、jpeg、jpg、png格式'
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
                                身份证正面照:</th>
                            <td class="paddingT15 wordSpacing5">
                                <input class="infoTableFile2" id="brand_logo" type="file" name="card_first" />
                                <label class="field_notice">支持格式gif,jpg,jpeg,png</label>
                            </td>
                        </tr>



                        <?php if ($this->_var['profile']['card_first']): ?>
                        <tr>
                            <th class="paddingT15">
                            </th>
                            <td class="paddingT15 wordSpacing5">
                                <img src="<?php echo $this->_var['profile']['card_first']; ?>" class="makesmall" max_width="120" max_height="90" />
                            </td>
                        </tr>
                        <?php endif; ?>


                        <tr>
                            <th class="paddingT15">
                                身份证反面照
                            </th>
                            <td class="paddingT15 wordSpacing5">
                                <input class="infoTableFile2" id="brand_lo1go" type="file" name="card_end" />
                                <label class="field_notice">正面</label>
                            </td>
                        </tr>
                        <?php if ($this->_var['profile']['card_end']): ?>
                        <tr>
                            <th class="paddingT15">
                            </th>
                            <td class="paddingT15 wordSpacing5">
                                <img src="<?php echo $this->_var['profile']['card_end']; ?>" class="makesmall" max_width="120" max_height="90" />
                            </td>
                        </tr>
                        <?php endif; ?>


                        <tr>
                            <th></th>
                            <td class="ptb20">
                                <input class="formbtn" type="submit" name="Submit" value="提交" />
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
