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
                <form method="post" enctype="multipart/form-data" id="profile_form">
                    <div class="information">
                        <div class="table_title">正在申请中的记账单列表：<span>（请务必保证线下签约后再进行【通过】操作）</span></div>
                        <table class="invoice_list" cellpadding="0" cellspacing="0">
                            <tbody>
                            <tr>
                                <th style="width:5%">编号</th>
                                <th style="width:25%">申请人名称</th>
                                <th style="width:15%">申请日期</th>
                                <th style="width:10%">类型</th>
                                <th style="width:15%">操作</th>
                            </tr>
                            <?php $_from = $this->_var['billings_apply']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'list');$this->_foreach['foo'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['foo']['total'] > 0):
    foreach ($_from AS $this->_var['list']):
        $this->_foreach['foo']['iteration']++;
?>
                            <tr>
                                <td><?php echo $this->_foreach['foo']['iteration']; ?></td>
                                <td><?php if ($this->_var['list']['companyid'] == '0' && $this->_var['list']['real_name'] != ''): ?><?php echo $this->_var['list']['real_name']; ?><?php elseif ($this->_var['list']['real_name'] == '' && $this->_var['list']['companyid'] == '0'): ?><?php echo $this->_var['list']['user_name']; ?><?php else: ?><?php echo $this->_var['list']['companyname']; ?><?php endif; ?></td>
                                <td><?php echo date("Y-m-d H:i:s",$this->_var['list']['apply_time']); ?></td>
                                <td><?php if ($this->_var['list']['companyid'] == '0'): ?>个人用户<?php else: ?>企业用户<?php endif; ?></td>
                                <td>
                                    <?php if ($this->_var['list']['companyid'] == '0'): ?><a  href="javascript:;" onclick="checkdata(this,<?php echo $this->_var['list']['uid']; ?>,'personal')">查看申请人资料</a><?php else: ?><a  href="javascript:;" onclick="checkdata(this,<?php echo $this->_var['list']['companyid']; ?>,'company')">查看申请人资料</a><?php endif; ?><br>
                                    <input type="button" value="通过" class="btn1" ectype="dialog" uri="index.php?app=billing_order_seller&act=pass&id=<?php echo $this->_var['list']['id']; ?>&ajax" dialog_title="通过申请" dialog_id="billing_order_seller" dialog_width="400" <?php if ($this->_var['list']['status'] == '0'): ?> style="display:none" <?php endif; ?>/>
                                    &nbsp;/&nbsp;<input type="button" value="驳回" class="btn1" ectype="dialog" uri="index.php?app=billing_order_seller&act=bohui&id=<?php echo $this->_var['list']['id']; ?>&ajax" dialog_title="驳回申请" dialog_id="billing_order_seller" dialog_width="400"<?php if ($this->_var['list']['status'] == '0'): ?> style="display:none" <?php endif; ?>/>
                                </td>
                            </tr>
                            <input type="hidden" name="myid" value="<?php echo $this->_var['list']['id']; ?>">
                            <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
                            </tbody>
                        </table>

                        <div class="table_title huge">已通过的记账单列表：</div>
                        <table class="invoice_list" cellpadding="0" cellspacing="0">
                            <tbody>
                            <tr>
                                <th style="width:5%">编号</th>
                                <th style="width:25%">申请人名称</th>
                                <th style="width:15%">通过日期</th>
                                <th style="width:10%">结算周期(天)</th>
                                <th style="width:10%">类型</th>
                                <th style="width:15%">操作</th>
                            </tr>
                            <?php $_from = $this->_var['billings_passed']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'list');$this->_foreach['foo'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['foo']['total'] > 0):
    foreach ($_from AS $this->_var['list']):
        $this->_foreach['foo']['iteration']++;
?>
                            <tr>
                                <td><?php echo $this->_foreach['foo']['iteration']; ?></td>
                                <td><?php if ($this->_var['list']['companyid'] == '0' && $this->_var['list']['real_name'] != ''): ?><?php echo $this->_var['list']['real_name']; ?><?php elseif ($this->_var['list']['real_name'] == '' && $this->_var['list']['companyid'] == '0'): ?><?php echo $this->_var['list']['user_name']; ?><?php else: ?><?php echo $this->_var['list']['companyname']; ?><?php endif; ?></td>
                                <td><?php echo date("Y-m-d H:i:s",$this->_var['list']['apply_time']); ?></td>
                                <td><?php echo $this->_var['list']['date_circle']; ?></td>
                                <td><?php if ($this->_var['list']['companyid'] == '0'): ?>个人用户<?php else: ?>企业用户<?php endif; ?></td>
                                <td><?php if ($this->_var['list']['status'] == '6'): ?>已撤销<?php else: ?><a href="javascript:;" onclick="revoke(this,<?php echo $this->_var['list']['id']; ?>)">撤销记账特权</a><?php endif; ?></td>
                            </tr>
                            <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
                            </tbody>
                        </table>
                        <iframe name="billing_order_seller" style="display:none;"></iframe>
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
<script type="text/javascript">
    function checkdata(obj,id,type){
        if(type == 'company'){
            window.open("index.php?app=billing_order_seller&act=checkdata&cid="+id);
        }else{
            window.open("index.php?app=billing_order_seller&act=checkdata&pid="+id);
        }
    }


    function revoke(obj,id){
        $.post("index.php?app=billing_order_seller&act=revoke", {id: id},
           function(data){
            if(data == 'success'){
                alert('操作成功！');
                window.location.reload();
            }
        });
    }
</script>
<?php echo $this->fetch('footer.html'); ?>
