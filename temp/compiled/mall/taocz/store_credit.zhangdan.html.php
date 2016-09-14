<?php echo $this->fetch('company.header.html'); ?>
<style>
    .borline td {padding:10px 0px;}
    .ware_list th {text-align:left;}
</style>
<script type="text/javascript">
    $(function(){
        $(".chakan").click(function(){
            alert(1111);
        });
    });
</script>
<div class="content">
    <?php echo $this->fetch('company.menu.html'); ?>
    <div id="right">
        <div class="submenu">
        </div>
        <div class="wrap">
            <div class="public">
                <form method="post" enctype="multipart/form-data" id="profile_form">
                    <div class="information">
                        <div class="info individual">
                            账单管理
                            <table>
                                <tr>
                                    <th class="width4">企业名称</th>
                                    <th class="width4">发生费用</th>
                                    <th class="width4">结算日</th>
                                    <th class="width4">状态</th>
                                    <th class="width4">账单明细</th>
                                    <th class="width4">操作</th>
                                </tr>
                                <?php $_from = $this->_var['zhangdans']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'comworker');if (count($_from)):
    foreach ($_from AS $this->_var['comworker']):
?>
                                <tr>
                                    <td><?php echo $this->_var['comworker']['company_name']; ?></td>

                                    <td><?php echo $this->_var['comworker']['leijimony']; ?></td>

                                    <td><?php echo $this->_var['comworker']['jiesuanri']; ?></td>
                                    <!--<td><button class="chakan">查看</button></td>-->
                                    <td><a href="index.php?app=store_credit&act=zhangdan&company_id=<?php echo $this->_var['comworker']['company_id']; ?>&store_id=<?php echo $this->_var['comworker']['store_id']; ?>">查看</a></td>
                                    <td>未知</td>
                                    <td><?php echo date("Y-m-d H:i:s",$this->_var['comworker']['shenhetime']); ?></td>
                                </tr>
                                <?php endforeach; else: ?>
                                <tr><td>还没有账单</td></tr>
                                <?php endif; unset($_from); ?><?php $this->pop_vars();; ?>
                            </table>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <div class="wrap">
            <div class="public">
                <form method="post" enctype="multipart/form-data" id="profil1e_form">
                    <div class="information">
                      <?php if ($this->_var['orders']): ?>
                        <div class="info individual">
                            账单明细
                            <table>
                                <tr>
                                    <th class="width4">交易日期</th>
                                    <th class="width4">记账日期</th>
                                    <th class="width4">订单号</th>
                                    <th class="width4">金额</th>
                                </tr>
                                <?php $_from = $this->_var['orders']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'comworker');if (count($_from)):
    foreach ($_from AS $this->_var['comworker']):
?>
                                <tr>
                                    <td><?php echo date("Y-m-d H:i:s",$this->_var['comworker']['add_time']); ?></td>
                                    <td><?php echo date("Y-m-d H:i:s",$this->_var['comworker']['add_time']); ?></td>
                                    <td><?php echo $this->_var['comworker']['order_sn']; ?></td>
                                    <td><?php echo $this->_var['comworker']['order_amount']; ?></td>
                                </tr>
                                <?php endforeach; else: ?>
                                <tr><td>还没账单明细</td></tr>
                                <?php endif; unset($_from); ?><?php $this->pop_vars();; ?>
                            </table>
                        </div>
                        <?php endif; ?>

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
