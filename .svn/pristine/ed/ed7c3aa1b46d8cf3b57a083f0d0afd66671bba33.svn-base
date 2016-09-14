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
                <div class="invoice_help"><a href="">增票资质</a>&nbsp;&nbsp;提交增值税发票开具资料</div>
                <div class="clear"></div>
                <?php if ($this->_var['page_info']['item_count'] > 0): ?>
                <table class="invoice_list" cellpadding="0" cellspacing="0">
                    <tr>
                        <th style="width:25%">时间</th>
                        <th style="width:15%">订单号</th>
                        <th style="width:30%">订单名称</th>
                        <th style="width:10%">状态</th>
                        <th style="wdith:20%">操作</th>
                    </tr>
                <?php endif; ?>
                <?php $_from = $this->_var['orders']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'order');if (count($_from)):
    foreach ($_from AS $this->_var['order']):
?>
                <tr>
                    <td><?php echo date("Y-m-d H:i:s",$this->_var['order']['add_time']); ?></td>
                    <td><?php echo $this->_var['order']['order_sn']; ?></td>
                    <td><?php echo $this->_var['order']['order_name']; ?></td>
                    <td id="status"><?php if ($this->_var['order']['invoice_status'] == 1): ?>已申请<?php elseif ($this->_var['order']['invoice_status'] == 2): ?>已受理<?php elseif ($this->_var['order']['invoice_status'] == 3): ?>已寄出<?php elseif ($this->_var['order']['invoice_status'] == 4): ?>已收到<?php else: ?>未开<?php endif; ?></td>
                    <td id="caozuo"><?php if ($this->_var['order']['invoice_status'] == 1): ?><a href="javascript:;">详情</a><?php elseif ($this->_var['order']['invoice_status'] == 2): ?><a href="javascript:;">详情</a><?php elseif ($this->_var['order']['invoice_status'] == 3): ?><a href="javascript:;" onclick="shoudao(this,<?php echo $this->_var['order']['order_id']; ?>)">确认收到</a>&nbsp;&nbsp;<a href="javascript:;">详情</a><?php elseif ($this->_var['order']['invoice_status'] == 4): ?><a href="javascript:;">详情</a><?php else: ?><a href="javascript:;" myment="<?php echo $this->_var['order']['payment_id']; ?>" onclick="apply(this,<?php echo $this->_var['order']['order_id']; ?>,<?php echo $this->_var['order']['order_type']; ?>)">申请发票</a>&nbsp;&nbsp;<?php endif; ?></td>
                </tr>
                <?php endforeach; else: ?>
                <div class="order_form member_no_records">
                    <span>您还没有可以申请发票的订单！</span>
                </div>
                <?php endif; unset($_from); ?><?php $this->pop_vars();; ?>
                <?php if ($this->_var['page_info']['item_count'] > 0): ?></table><?php endif; ?>
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
    function shoudao(obj,orderid){
        alert("13")
    }

    function apply(obj,orderid,type){
        var oid = orderid;
        var order_type = type;
        var myment = $(obj).attr('myment');
        if(myment >= 0){
            $.post("index.php?app=my_invoice&act=apply_invoice", {oid: oid ,type: order_type},
            function(data){
                if(data == 'success'){
                    $(obj).parent().siblings('#status').html('已申请');
                    $(obj).parent().html('<a href="">详情</a>');
                }
            });
        }else{
            if(myment == '-1'){
                alert('该订单您使用的是记账付款方式，请结账后再申请发票！');
            }else if(myment == '-2'){
                alert('该订单您采用的是授信付款方式，请还款后再申请发票！');
            }
        }
        
    }
    

</script>
<?php echo $this->fetch('footer.html'); ?>
