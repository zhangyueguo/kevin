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
                
                    <div class="information">

                        <table class="invoice_list" cellpadding="0" cellspacing="0">
                            <tbody>
                            <tr>
                                <th style="width:5%">编号</th>
                                <th style="width:35%">商家名称</th>
                                <th style="width:10%">逾期次数</th>
                                <th style="width:30%">结算时间</th>
                                <th style="width:20%">操作</th>
                            </tr>
                            <?php $_from = $this->_var['balance']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'list');$this->_foreach['foo'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['foo']['total'] > 0):
    foreach ($_from AS $this->_var['list']):
        $this->_foreach['foo']['iteration']++;
?>
                            <tr>
                                <td><?php echo $this->_foreach['foo']['iteration']; ?></td>
                                <td><?php echo $this->_var['list']['store_name']; ?></td>
                                <td><?php echo $this->_var['list']['overdue_times']; ?></td>
                                <td><?php echo date("Y-m-d H:i:s",$this->_var['list']['balance_time']); ?></td>
                                <td>【<a href="">提额</a>】<br>【<a href="">降额</a>】&nbsp;&nbsp;【<a href="">取消记账</a>】<br></td>
                            </tr>
                            <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
                            </tbody>
                        </table>
                    </div>
                    
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
