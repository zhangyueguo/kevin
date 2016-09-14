<?php echo $this->fetch('company1.header.html'); ?>
<style>
    .borline td {padding:10px 0px;}
    .ware_list th {text-align:left;}
    .width4{width:80px;}
</style>
<script type="text/javascript">
    $(function(){
        $("input[type='radio']").click(function(){
              if($(this).val()=='shang'){
                  $(".shangh").show();
              }else{
                  $(".shangh").hide();
              }
        });

    });

</script>
<div class="content">
    <?php echo $this->fetch('company.menu.html'); ?>
    <div id="right">

        <?php echo $this->fetch('member.submenu.html'); ?>

        <div class="wrap">
            <div class="public">
                <form method="post" enctype="multipart/form-data" id="profile_form">
                    <div class="information">
                    <?php if ($this->_var['billings'] != ''): ?>
                            <table class="invoice_list" cellpadding="0" cellspacing="0">
                                <tbody>
                                <tr>
                                    <th style="width:5%">编号</th>
                                    <th style="width:25%">商家名称</th>
                                    <th style="width:15%">申请日期</th>
                                    <th style="width:10%">状态</th>
                                    <th style="width:15%">操作</th>
                                </tr>
                                <?php $_from = $this->_var['billings']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'list');$this->_foreach['foo'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['foo']['total'] > 0):
    foreach ($_from AS $this->_var['list']):
        $this->_foreach['foo']['iteration']++;
?>
                                <tr>
                                    <td><?php echo $this->_foreach['foo']['iteration']; ?></td>
                                    <td><?php echo $this->_var['list']['store_name']; ?></td>
                                    <td><?php echo date("Y-m-d H:i:s",$this->_var['list']['apply_time']); ?></td>
                                    <td><?php if ($this->_var['list']['status'] == '1'): ?>审核中<?php elseif ($this->_var['list']['status'] == '2'): ?>已通过<?php elseif ($this->_var['list']['status'] == '3'): ?>已驳回<?php elseif ($this->_var['list']['status'] == '41'): ?>逾期未还款<?php elseif ($this->_var['list']['status'] == '421' || $this->_var['list']['status'] == '422'): ?>已还款<?php elseif ($this->_var['list']['status'] == '41'): ?>已过期<?php elseif ($this->_var['list']['status'] == '5'): ?>已过期<?php elseif ($this->_var['list']['status'] == '6'): ?>已撤销<?php endif; ?></td>
                                    <td><a href="">联系商家</a></td>
                                </tr>
                                <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
                                </tbody>
                            </table>
                        <?php endif; ?>
                        <div class="info individual">
                            
                            <table>
                                <tr>
                                    <!--<th class="width4">company_name: </th>-->
                                    <th class="width4">姓名: </th>
                                    <td><?php echo $this->_var['minfo']['user_name']; ?></td>
                                </tr>
                                <tr>
                                    <th>记账单类型:</th>
                                    <td>
                                        <label><input type="radio" name="beilei" value="ping" <?php if ($this->_var['profile']['gender'] == 1): ?>checked="checked"<?php endif; ?> /> 平台 </label>
                                        <label><input type="radio" name="beilei" value="shang" <?php if ($this->_var['profile']['gender'] == 2): ?>checked="checked"<?php endif; ?> /> 商家 </label>
                                    </td>
                                </tr>
                                <tr class="shangh" style="display: none">
                                    <th>选择商户:</th>
                                    <td class="paddingT15 wordSpacing5" >
                                        <div id="region">
                                            <input type="hidden" id="zih" name="region_id" value="" class="mls_id" />
                                            <input type="hidden" name="region_name" value="" class="mls_names" />
                                            <!--<span><?php echo htmlspecialchars($this->_var['company']['region_name']); ?></span>-->
                                            <input type="button" value="编辑" class="edit_region" />
                                            <select style="display:none">
                                                <option>请选择...</option>
                                                <?php echo $this->html_options(array('options'=>$this->_var['regions'])); ?>
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th></th>
                                    <td><input type="submit" class="btn" value="提交" /></td>
                                </tr>
                            </table>
                        </div>
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
    
</script>
<?php echo $this->fetch('footer.html'); ?>
