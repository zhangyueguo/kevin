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
                <?php if ($this->_var['invoice'] == '' || $this->_var['add'] == 1 || $this->_var['edit'] == 1): ?>
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
                                <th style="width:15%">买家名称</th>
                                <th style="width:10%">记账属性</th>
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
                                <td><?php if ($this->_var['list']['company_name'] != ''): ?><?php echo $this->_var['list']['company_name']; ?><?php else: ?><?php echo $this->_var['list']['buyer_name']; ?><?php endif; ?></td>
                                <td><?php if ($this->_var['list']['order_type'] == '2'): ?>企业<?php else: ?>个人<?php endif; ?></td>
                                <td><?php echo $this->_var['list']['limit_money']; ?></td>
                                <td><?php echo $this->_var['list']['order_amount']; ?></td>
                                <td><?php echo $this->_var['list']['cutoff_time']; ?></td>
                                <td><?php if (( $this->_var['list']['bstatus'] == '421' && $this->_var['list']['order_type'] == '1' ) || ( $this->_var['list']['bstatus'] == '422' && $this->_var['list']['order_type'] == '2' )): ?><font color="#ff0000">【本期已结算】</font><?php else: ?>【<a href="">短信记账单</a>】&nbsp;&nbsp;【<a href="">站内提醒</a>】<br>【<a href="">邮件记账单</a>】&nbsp;&nbsp;<?php endif; ?>【<a href="">联系买家</a>】<br>【<a href="index.php?app=billing_order_seller&act=billing_show<?php if ($this->_var['list']['company_id'] == ''): ?>&pid=<?php echo $this->_var['list']['buyer_id']; ?><?php else: ?>&cid=<?php echo $this->_var['list']['company_id']; ?><?php endif; ?>">详细记账记录</a>】</td>
                            </tr>
                            <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
                            </tbody>
                        </table>
                    </div>
                    <input type="hidden" name="template_id" value="<?php echo $_GET['bid']?>">
                </form>
                <?php else: ?>
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
                    <li class="card add-card">
                        <a href="<?php echo url('app=buyer_invoice&act=addzizhi&type=add'); ?>" title="添加开票信息"></a>
                    </li>
                </ul>
                <?php endif; ?>
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
