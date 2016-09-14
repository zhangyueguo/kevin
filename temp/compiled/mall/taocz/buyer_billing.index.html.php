<?php echo $this->fetch('company.header.html'); ?>
<style>
    .borline td {padding:10px 0px;}
    .ware_list th {text-align:left;}
    .width4{width:80px;}
</style>
<div class="content">
    <?php echo $this->fetch('company.menu.html'); ?>
    <div id="right">

        <?php echo $this->fetch('member.submenu.html'); ?>

        <div class="wrap">
            <div class="public">
                <form method="post" enctype="multipart/form-data" id="profile_form" action="index.php?app=buyer_invoice&act=addzizhi&type=<?php if($_GET['type']=='add'){
                    echo 'add';
                }else if($_GET['type'] == 'edit'){
                    echo 'edit';
                }?>">
                    <div class="information">

                        <table class="invoice_list" cellpadding="0" cellspacing="0">
                            <tbody>
                            <tr>
                                <th style="width:5%">编号</th>
                                <th style="width:25%">商家名称</th>
                                <th style="width:15%">记账额度（元）</th>
                                <th style="width:16%">已使用金额（元）</th>
                                <th style="width:14%">距离结算（天）</th>
                                <th style="width:25%">操作</th>
                            </tr>
                            <?php $_from = $this->_var['order_billing']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'list');$this->_foreach['foo'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['foo']['total'] > 0):
    foreach ($_from AS $this->_var['list']):
        $this->_foreach['foo']['iteration']++;
?>
                            <tr>
                                <td><?php echo $this->_foreach['foo']['iteration']; ?></td>
                                <td><?php echo $this->_var['list']['seller_name']; ?></td>
                                <td><?php echo $this->_var['list']['limit_money']; ?></td>
                                <td><?php echo $this->_var['list']['order_amount']; ?></td>
                                <td><?php if ($this->_var['list']['cutoff_time'] >= 0): ?><?php echo $this->_var['list']['cutoff_time']; ?><?php else: ?>您已逾期<?php echo quzheng($this->_var['list']['cutoff_time']); ?>天<?php endif; ?></td>
                                <td><?php if (( $this->_var['list']['bstatus'] == '421' && $this->_var['list']['order_type'] == '1' ) || ( $this->_var['list']['bstatus'] == '422' && $this->_var['list']['order_type'] == '2' )): ?><font color="#ff0000">【本期已结算】</font><?php else: ?>【<a href="index.php?app=billing_order&act=dobalance&sid=<?php echo $this->_var['list']['seller_id']; ?>">我要结算</a>】&nbsp;&nbsp;<?php endif; ?>【<a href="">联系商家</a>】<br>【<a href="index.php?app=billing_order&act=billing_show&sid=<?php echo $this->_var['list']['seller_id']; ?>">详细记账记录</a>】</td>
                            </tr>
                            <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
                            </tbody>
                        </table>
                    </div>
                    <input type="hidden" name="template_id" value="<?php echo $_GET['bid']?>">
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
<script type="text/javascript">
    
</script>
<?php echo $this->fetch('footer.html'); ?>
