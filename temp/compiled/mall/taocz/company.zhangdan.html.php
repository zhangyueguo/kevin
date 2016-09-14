<?php echo $this->fetch('company.header.html'); ?>
<style>
    .borline td {padding:10px 0px;}
    .ware_list th {text-align:left;}
    .width4{width:80px;}
</style>
<div class="content">
    <?php echo $this->fetch('company.menu.html'); ?>
    <div id="right">

        <div class="submenu">
            <ul class="tab">
                <li class="active <?php if (($this->_foreach['member_submenu']['iteration'] <= 1)): ?>first<?php endif; ?>"><h2><a href="index.php?app=company_credit&act=zhangdan">本期账单</a></h2></li>
                <li class="normal <?php if (($this->_foreach['member_submenu']['iteration'] <= 1)): ?>first<?php endif; ?>"><h2><a href="index.php?app=company_credit&act=hostryzhangdan">历史账单</a></h2></li>
            </ul>
        </div>
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
                                <th style="width:12%">发生费用</th>
                                <th style="width:29%">账单日</th>
                                <th style="width:14%">结算日</th>
                                <th style="width:10%">状态</th>
                                <th style="width:15%">授信商家</th>
                                <th style="width:15%">账单明细</th>
                                <th style="width:15%">操作</th>
                            </tr>
                            <?php $_from = $this->_var['zhangdans']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'list');if (count($_from)):
    foreach ($_from AS $this->_var['list']):
?>
                            <tr>
                                <td><?php echo $this->_var['list']['leijimony']; ?></td>
                                <td><?php echo $this->_var['list']['zhangdanri']; ?></td>
                                <td><?php echo $this->_var['list']['jiesuanri']; ?></td>
                                <td><?php echo $this->_var['list']['status']; ?></td>
                                <td><?php echo $this->_var['list']['store_name']; ?></td>
                                <td><a href="index.php?app=company_credit&act=zhangdan&company_id=<?php echo $this->_var['list']['company_id']; ?>&store_id=<?php echo $this->_var['list']['store_id']; ?>">查看</a></td>
                                <!--<td><a href="">站内提醒</a><br><a href="">短信记账单</a><br><a href="">邮件记账单</a><br><a href="">联系买家</a></td>-->
                                <!--<td> <a href="index.php?app=company_deposit">去结算</a> </td>-->
                                <td> <a href="index.php?app=company_deposit&act=recharge">去结算</a> </td>
                            </tr>
                            <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
                            </tbody>
                        </table>
                    </div>
                    <input type="hidden" name="template_id" value="<?php echo $_GET['bid']?>">
                </form>

                <ul class="invoice_info clearfix">
                    <?php $_from = $this->_var['infos']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'bank');if (count($_from)):
    foreach ($_from AS $this->_var['bank']):
?>
                    <li class="card">
                        <h2><?php echo $this->_var['bank']['company_name']; ?></h2>
                        <div class="number">识别代码：<?php echo $this->_var['bank']['taxpayer_code']; ?></div>
                        <div class="handle clearfix">
                            <div class="card-type"><?php echo $this->_var['bank']['deposit_bank']; ?></div>
                            <div class="card-handle">
                                <?php if ($this->_var['mycompany_id'] === $this->_var['bank']['company_id']): ?>
                                <a _href=''>所属公司&nbsp;&nbsp;不可编辑</a>
                                <?php else: ?>
                                <a href="<?php echo url('app=buyer_invoice&act=addzizhi&type=edit&bid=' . $this->_var['bank']['id']. ''); ?>">编辑</a>
                                <a href="<?php echo url('app=buyer_invoice&act=addzizhi&type=drop&bid=' . $this->_var['bank']['id']. ''); ?>" onclick="return confirm('删除后不可恢复，您确认吗？')">删除</a>
                                <?php endif; ?>
                            </div>
                        </div>
                    </li>
                    <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
                    <li class="card add-card" style="display: none">
                        <a href="<?php echo url('app=buyer_invoice&act=addzizhi&type=add'); ?>" title="添加开票信息"></a>
                    </li>
                </ul>
            </div>
        </div>


        <div class="wrap">
            <div class="public">
                <form method="post" enctype="multipart/form-data" id="profile_for1m" action="index.php?app=buyer_invoice&act=addzizhi&type=<?php if($_GET['type']=='add'){
                    echo 'add';
                }else if($_GET['type'] == 'edit'){
                    echo 'edit';
                }?>">
                    <div class="information">
                        账单明细
                        <table class="invoice_list" cellpadding="0" cellspacing="0">
                            <tbody>
                            <tr>
                                <th style="width:12%">交易日期</th>
                                <th style="width:29%">记账日期</th>
                                <th style="width:14%">订单号</th>
                                <th style="width:10%">金额</th>

                            </tr>
                            <?php $_from = $this->_var['orders']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'list');if (count($_from)):
    foreach ($_from AS $this->_var['list']):
?>
                            <tr>
                                <td><?php echo date("Y-m-d H:i:s",$this->_var['list']['add_time']); ?></td>
                                <td><?php echo date("Y-m-d H:i:s",$this->_var['list']['add_time']); ?></td>
                                <td><?php echo $this->_var['list']['order_sn']; ?></td>
                                <td><?php echo $this->_var['list']['order_amount']; ?></td>
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
