<?php echo $this->fetch('member.header.html'); ?>
<script type="text/javascript">
    $(function(){
        $('#add_time_from').datepicker({dateFormat: 'yy-mm-dd'});
        $('#add_time_to').datepicker({dateFormat: 'yy-mm-dd'});
    });
</script>
<style type="text/css">
    .float_right {float: right;}
</style>
<div class="content">
    <?php echo $this->fetch('member.menu.html'); ?>
    <div id="right">
        <?php echo $this->fetch('member.submenu.html'); ?>
        <div class="wrap">
            <div class="public">

               <form method="post" enctype="multipart/form-data" id="profile_form">
                    <div class="information">
                        <div class="info individual">

                <?php if ($this->_var['credits']): ?>
                <table>
                    <tr>
                        <th class="width4">授信类型</th>
                        <th class="width4">申请额度</th>
                        <th class="width4">审批额度</th>
                        <th class="width4">申请商家</th>
                        <th class="width4">审核情况</th>
                        <!--<th class="width4">操作</th>-->
                    </tr>
                    <?php $_from = $this->_var['credits']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'comworker');if (count($_from)):
    foreach ($_from AS $this->_var['comworker']):
?>
                    <tr>
                        <td>
                            <?php if ($this->_var['comworker']['beilei'] == 'shang'): ?>
                            商家授信
                            <?php else: ?>
                            平台授信
                            <?php endif; ?>
                        </td>
                        <td><?php echo $this->_var['comworker']['edu']; ?></td>
                        <td><?php echo $this->_var['comworker']['shenpiedu']; ?></td>
                        <td><?php echo $this->_var['arr'][$this->_var['comworker']['seller_store_id']]; ?></td>
                        <td>
                            <?php if ($this->_var['comworker']['status'] == '0'): ?>
                            未审核
                            <?php elseif ($this->_var['comworker']['status'] == '1'): ?>
                            已审核通过
                            <?php elseif ($this->_var['comworker']['status'] == '1'): ?>
                            审核未通过
                            <?php endif; ?>
                        </td>
                        <!--<td><a href="index.php?app=store_worker&amp;act=editworker&amp;id=<?php echo $this->_var['comworker']['id']; ?>">编辑</a>
                            <a href="javascript:if(confirm('确定要删除此员工吗'))window.location = 'index.php?app=store_worker&amp;act=drop&amp;id=<?php echo $this->_var['comworker']['id']; ?>';">删除</a></td>-->
                    </tr>
                    <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
                </table>

            </div>
        </div>
    </form>

                <?php else: ?>
                <div class="order_form member_no_records">
                    <span>您还未获得任何信用授权！</span>
                </div>
                <?php endif; ?>
                <div class="order_form_page">
                    <div class="page">
                        <?php echo $this->fetch('member.page.bottom.html'); ?>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="wrap_bottom"></div>
        </div>
        <div class="clear"></div>
        <div class="adorn_right1"></div>
        <div class="adorn_right2"></div>
        <div class="adorn_right3"></div>
        <div class="adorn_right4"></div>
    </div>
    <div class="clear"></div>
</div>
<iframe id='iframe_post' name="iframe_post" src="about:blank" frameborder="0" width="0" height="0"></iframe>
<script type="text/javascript">
    //xiao进行的添加
    $(function () {
        $("a[id='delete']").click(function(){
            if(confirm("您确定要删除该订单吗？\n\n删除后，您可在订单回收站找回，或永久删除。")){
                var uri = $(this).attr('uri');
                var obj = $(this);
                var order_id = $(this).attr('order_id');
                $.post(uri, {orderid: order_id},
                        function(data){
                            if(data == 'success'){
                                obj.parents('.order_form').remove();
                            }
                        });
            }
        })

        $("a[id='recovery']").click(function(){
            var uri = $(this).attr('uri');
            var obj = $(this);
            var pagecount = '<?php echo $this->_var['page_info']['item_count']; ?>';
            var order_id = $(this).attr('order_id');
            var plength = $(".order_form").length;
            $.post(uri, {orderid: order_id},
                    function(data){
                        if(data == 'success'){
                            obj.parents('.order_form').remove();
                            if(plength == 1){
                                $(".public").html('<div class="order_form member_no_records"><span>没有符合条件的记录</span></div>');
                            }
                        }
                    });
        })

        $("a[id='chedidelete']").click(function(){
            if(confirm("您确定要彻底删除该订单吗？\n\n删除后，您将不能查看该订单信息，也无法针对该订单进行维权！")){
                var uri = $(this).attr('uri');
                var obj = $(this);
                var pagecount = '<?php echo $this->_var['page_info']['item_count']; ?>';
                var order_id = $(this).attr('order_id');
                var plength = $(".order_form").length;
                $.post(uri, {orderid: order_id},
                        function(data){
                            if(data == 'success'){
                                obj.parents('.order_form').remove();
                                if(plength == 1){
                                    $(".public").html('<div class="order_form member_no_records"><span>没有符合条件的记录</span></div>');
                                }
                            }
                        });
            }
        })

    })
</script>
<?php echo $this->fetch('footer.html'); ?>
