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
                
                <?php $_from = $this->_var['orders']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'order');if (count($_from)):
    foreach ($_from AS $this->_var['order']):
?>
                
                <?php endforeach; else: ?>
                <div class="order_form member_no_records">
                    <span>您还未获得任何信用授权！</span>
                </div>
                <?php endif; unset($_from); ?><?php $this->pop_vars();; ?>
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
