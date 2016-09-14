<script type="text/javascript">
    $(function(){
        $('#category_form').validate({
            /*        errorPlacement: function(error, element){
             var _message_box = $(element).parent().parent().parent().parent().find('#warning');
             _message_box.find('#warning_info').hide();
             _message_box.append(error);
             },
             success       : function(label){
             label.addClass('validate_right').text('OK!');
             },*/
            errorLabelContainer: $('#warning'),
            invalidHandler: function(form, validator) {
                /*var errors = validator.numberOfInvalids();
                 if(errors)
                 {*/
                $('#warning').show();
                /*}
                 else
                 {
                 $('#warning').hide();
                 }*/
            },
            onfocusout : false,
            onkeyup    : false,
            rules : {
                cate_name : {
                    required : true,
                    remote   : {
                        url :'index.php?app=my_category&act=check_category',
                        type:'get',
                        data:{
                            cate_name : function(){
                                return $('#cate_name').val();
                            },
                            parent_id : function() {
                                return $('#parent_id').val();
                            },
                            id : '<?php echo $this->_var['gcategory']['cate_id']; ?>'
                        }
                    }
                },
                sort_order : {
                    number   : true
                }
            },
            messages : {
                cate_name : {
                    remote   : 'name_exist',
                    required : 'cate_name_empty'

                },
                sort_order  : {
                    number   : 'number_only'
                }
            }
        });
    });
</script>
<div class="eject_con">
    <div class="adds">
        <div id="warning"></div>
        <!--<form   enctype="multipart/form-data"  id="category_form" method="post" target="pop_warning" action="index.php?app=store_credit&act=pass" target="billing_order_seller">-->
        <form   enctype="multipart/form-data"  id="category_form" method="post" target="pop_warning" action="index.php?app=store_credit&act=pass">
            <ul>
                <li>
                    <h3>申请额度:</h3>
                    <p><?php echo $this->_var['row']['edu']; ?><label class="field_notice">企业申请的额度</label></p>
                </li>

                <li>
                    <!--<h3>图片图标:</h3>
                    <p><input class="text width_normal" type="file" name="catpic" id="catpic" /><label class="field_notice"></label></p>-->
                    <h3>审批额度:</h3>
                    <p><input class="text width_normal" type="text" name="shenpiedu" id="shenpiedu" value="<?php echo htmlspecialchars($this->_var['gcategory']['cate_name']); ?>" /><label class="field_notice"></label></p>
                </li>

                <li>
                    <h3>受信周期:</h3>
                    <p><?php echo $this->_var['storeset']['zhouqi']; ?>天<label class="field_notice">已设置好的受信周期</label></p>
                </li>
                <li>
                    <h3>账单日:</h3>
                    <p><input class="text width_normal" type="text" name="zhandanri" id="zhandanri" value="<?php echo $this->_var['day']; ?>" /><label class="field_notice"></label></p>
                </li>
                <li>
                    <h3>结算日:</h3>
                    <p><input class="text width_normal" type="text" name="jiesuanri" id="jiesuanri" value="<?php echo $this->_var['jiesuanday']; ?>" /><label class="field_notice"></label></p>
                </li>

                <!--<li>
                    <h3>parent_id:</h3>
                    <p><select name="parent_id" id="parent_id">
                        <option>请选择...</option>
                        <?php echo $this->html_options(array('options'=>$this->_var['parents'],'selected'=>$this->_var['gcategory']['parent_id'])); ?>
                    </select></p>
                </li>
                <li>
                    <h3>排序:</h3>
                    <p><input type="text" name="sort_order" value="<?php echo $this->_var['gcategory']['sort_order']; ?>"  class="text width_short"/></p>
                </li>
                <li>
                    <h3>if_show:</h3>
                    <p><label>
                        <input type="radio" name="if_show" value="1" <?php if ($this->_var['gcategory']['if_show']): ?>checked="checked"<?php endif; ?> />
                        是</label>
                        <label>
                            <input type="radio" name="if_show" value="0" <?php if (! $this->_var['gcategory']['if_show']): ?>checked="checked"<?php endif; ?> />
                            否</label></p>
                </li>-->

            </ul>
            <div class="submit">
                <input type="submit" class="btn" value="提交" />
                <input type="hidden" class="btn" name="id" value="<?php echo $this->_var['id']; ?>" />
            </div>
        </form>
    </div>
</div>