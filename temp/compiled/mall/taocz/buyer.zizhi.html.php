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


                
            </ul>


        </div>



        <div class="wrap">
            <div class="public">
                <?php if ($this->_var['invoice'] == '' || $this->_var['add'] == 1 || $this->_var['edit'] == 1): ?>
                <form method="post" enctype="multipart/form-data" id="profile_form" action="index.php?app=buyer_invoice&act=addzizhi&type=<?php if($_GET['type']=='add'){
                    echo 'add';
                }else if($_GET['type'] == 'edit'){
                    echo 'edit';
                }?>">
                    <div class="information">

                        <div class="info individual">
                            <table>
                                <tr>
                                    <!--<th class="width4">company_name: </th>-->
                                    <th class="width4">企业名称: </th>
                                    <td><input type="text" class="text width_normal" name="worker_name" value="<?php echo $this->_var['invoice']['company_name']; ?>" /></td>
                                </tr>
                                <tr>
                                    <th>纳税人识别码:</th>
                                    <td><input type="text" class="text width_normal" name="worker_shibie" value="<?php echo $this->_var['invoice']['taxpayer_code']; ?>" /></td>
                                </tr>

                                <tr>
                                    <th>注册地址: </th>
                                    <td>
                                        <input type="text" class="text width_normal" name="worker_address" id="birthday" value="<?php echo $this->_var['invoice']['company_address']; ?>" />
                                    </td>
                                </tr>
                                <tr>
                                    <th>注册电话:</th>
                                    <td> <input type="text" class="text width_normal" name="worker_phone" value="<?php echo $this->_var['invoice']['company_phone']; ?>" /></td>
                                </tr>

                                <tr>
                                    <th>开户银行:</th>
                                    <td> <input type="text" class="text width_normal" name="worker_bank" value="<?php echo $this->_var['invoice']['deposit_bank']; ?>" /></td>
                                </tr>

                                <tr>
                                    <th>开户账号:</th>
                                    <td> <input type="text" class="text width_normal" name="worker_number" value="<?php echo $this->_var['invoice']['number_bank']; ?>" /></td>
                                </tr>

                                <tr>
                                    <th></th>
                                    <td><input type="submit" class="btn" value="提交" /></td>
                                </tr>
                            </table>
                        </div>
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
