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

                <li class="active <?php if (($this->_foreach['member_submenu']['iteration'] <= 1)): ?>first<?php endif; ?>"><h2><a href="javascript:;">待审核的</a></h2></li>

                <li class="normal <?php if (($this->_foreach['member_submenu']['iteration'] <= 1)): ?>first<?php endif; ?>"><h2><a href="<?php echo $this->_var['_s_m']['url']; ?>">结算明细</a></h2></li>

            </ul>
        </div>

        <div class="wrap">
            <div class="public">
                <form method="post" enctype="multipart/form-data" id="profile_form">
                    <div class="information">
                        <div class="table_title">正在申请中的企业受信列表：<span>（请务必保证线下签约后再进行【通过】操作）</span></div>
                        <table class="invoice_list" cellpadding="0" cellspacing="0">
                            <tbody>
                            <tr>
                                <th style="width:5%">编号</th>
                                <th style="width:25%">申请企业</th>
                                <th style="width:15%">申请日期</th>
                                <th style="width:10%">申请额度</th>
                                <th style="width:15%">操作</th>
                            </tr>
                            <?php $_from = $this->_var['xincredits']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'list');$this->_foreach['foo'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['foo']['total'] > 0):
    foreach ($_from AS $this->_var['list']):
        $this->_foreach['foo']['iteration']++;
?>
                            <tr>
                                <td><?php echo $this->_foreach['foo']['iteration']; ?></td>
                                <td><?php echo $this->_var['list']['company_name']; ?></td>
                                <td><?php echo date("Y-m-d H:i:s",$this->_var['list']['shentime']); ?></td>
                                <td><?php echo $this->_var['list']['edu']; ?></td>
                                <td>
                                    <!--<a  href="javascript:;" onclick="checkdata(this,<?php echo $this->_var['list']['uid']; ?>,'personal')">申请企业资料</a>-->
                                    <input type="button" value="查看企业资料" class="btn1" ectype="dialog" uri="index.php?app=store_credit&act=company&id=<?php echo $this->_var['list']['id']; ?>" dialog_title="企业资料查看" dialog_id="pop_warning" dialog_width="500"/>
                                    <br>
                                    <input type="button" value="通过" class="btn1" ectype="dialog" uri="index.php?app=store_credit&act=pass&id=<?php echo $this->_var['list']['id']; ?>" dialog_title="审批受信" dialog_id="pop_warning" dialog_width="400"/>
                                    &nbsp;/&nbsp;<input type="button" value="驳回" class="btn1" ectype="dialog" uri="index.php?app=store_credit&act=nopass&id=<?php echo $this->_var['list']['id']; ?>&ajax" dialog_title="驳回申请" dialog_id="pop_warning" dialog_width="400"/>
                                </td>
                            </tr>
                            <input type="hidden" name="myid" value="<?php echo $this->_var['list']['id']; ?>">
                            <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
                            </tbody>
                        </table>

                        <div class="table_title huge">已通过的企业受信列表：</div>
                        <table class="invoice_list" cellpadding="0" cellspacing="0">
                            <tbody>
                            <tr>
                                <th style="width:5%">编号</th>
                                <th style="width:25%">申请企业</th>
                                <th style="width:15%">通过日期</th>
                                <th style="width:10%">申请额度</th>
                                <th style="width:10%">审批额度</th>
                                <th style="width:10%">账单日</th>
                                <th style="width:10%">结算日</th>
                                <th style="width:15%">操作</th>
                            </tr>
                            <?php $_from = $this->_var['guoxincredits']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'list');$this->_foreach['foo'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['foo']['total'] > 0):
    foreach ($_from AS $this->_var['list']):
        $this->_foreach['foo']['iteration']++;
?>
                            <tr>
                                <td><?php echo $this->_foreach['foo']['iteration']; ?></td>
                                <td><?php echo $this->_var['list']['company_name']; ?></td>
                                <td><?php echo date("Y-m-d H:i:s",$this->_var['list']['shenhetime']); ?></td>
                                <td><?php echo $this->_var['list']['edu']; ?></td>
                                <td><?php echo $this->_var['list']['shenpiedu']; ?></td>
                                <td><?php echo $this->_var['list']['zhangdanri']; ?></td>
                                <td><?php echo $this->_var['list']['jiesuanri']; ?></td>
                                <td><a href="javascript:;" onclick="revoke(this,<?php echo $this->_var['list']['id']; ?>)">撤销记账特权</a></td>
                            </tr>
                            <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
                            </tbody>
                        </table>
                        <iframe name="pop_warning" style="display:none;"></iframe>
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
        alert(id)
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
