<?php echo $this->fetch('company.header.html'); ?>
<style>
    .borline td {padding:10px 0px;}
    .ware_list th {text-align:left;}
</style>
<script type="text/javascript">
    $(function(){

         // $(".shen").click(function(){
         //     var status = $(this).attr("name");
         //     var id = $(this).attr("bid");

         //     var url = 'index.php?app=store_credit&act=shenhe';
         //     $.post(
         //            url,
         //             {status:status,id:id},
         //             function (data) {
         //                // alert(data);
         //             }
         //     );
         // });
         
    });
</script>
<div class="content">
    <?php echo $this->fetch('company.menu.html'); ?>
    <div id="right">


        <div class="submenu">

            <!--<ul class="tab">

                <li class="active <?php if (($this->_foreach['member_submenu']['iteration'] <= 1)): ?>first<?php endif; ?>"><h2><a href="javascript:;">员工列表</a></h2></li>

                <li class="normal <?php if (($this->_foreach['member_submenu']['iteration'] <= 1)): ?>first<?php endif; ?>"><h2><a href="index.php?app=company&act=addsector">添加部门</a></h2></li>

                <li class="normal <?php if (($this->_foreach['member_submenu']['iteration'] <= 1)): ?>first<?php endif; ?>"><h2><a href="index.php?app=company&act=sectorlist">部门列表</a></h2></li>

                <li class="normal <?php if (($this->_foreach['member_submenu']['iteration'] <= 1)): ?>first<?php endif; ?>"><h2><a href="index.php?app=company&act=addworker">添加员工</a></h2></li>

                <div class="dustbin"><a href="index.php?app=buyer_order&act=dustbin" <?php if ($this->_var['_s_m']['dustbin'] == '1'): ?>style="color:#EE3000; text-decoration:none"<?php endif; ?>>订单回收站</a></div>
            </ul>-->

        </div>




        <div class="wrap">
            <div class="public">
                <form method="post" enctype="multipart/form-data" id="profile_form">
                    <div class="information">
                        <div class="info individual">
                            <table>
                                <tr>
                                    <th class="width4">申请时间</th>
                                    <th class="width4">企业名称</th>
                                    <th class="width4">申请额度</th>
                                    <th class="width4">信用等级</th>
                                    <th class="width4">操作</th>
                                </tr>
                                <?php $_from = $this->_var['xincredits']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'comworker');if (count($_from)):
    foreach ($_from AS $this->_var['comworker']):
?>
                                <tr>
                                    <td><?php echo date("Y-m-d H:i:s",$this->_var['comworker']['shentime']); ?></td>

                                    <td><?php echo $this->_var['comworker']['company_name']; ?></td>

                                    <td><?php echo $this->_var['comworker']['edu']; ?></td>

                                    <td>未知</td>

                                    <td>
                                        <!--<a href="index.php?app=company&amp;act=editworker&amp;id=<?php echo $this->_var['comworker']['id']; ?>">审核通过</a>-->
                                        <?php if ($this->_var['comworker']['status'] == 0): ?>
                                        <button class="shen" name="1" bid="<?php echo $this->_var['comworker']['id']; ?>">审核通过</button>
                                        |  <button class="shen" name="2" bid="<?php echo $this->_var['comworker']['id']; ?>">审核不通过</button>
                                        <?php elseif ($this->_var['comworker']['status'] == 1): ?>
                                        <span>审核已通过</span>
                                        <?php elseif ($this->_var['comworker']['status'] == 2): ?>
                                        <span>审核不通过</span>
                                        <?php endif; ?>
                                    </td>
                                </tr>
                                <?php endforeach; else: ?>
                                <tr><td>还没授信签约用户</td></tr>
                                <?php endif; unset($_from); ?><?php $this->pop_vars();; ?>
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
<?php echo $this->fetch('footer.html'); ?>
