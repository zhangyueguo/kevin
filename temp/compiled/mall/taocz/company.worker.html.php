<?php echo $this->fetch('company.header.html'); ?>
<style>
    .borline td {padding:10px 0px;}
    .ware_list th {text-align:left;}
</style>
<script type="text/javascript">
    //<!CDATA[
    $(function(){
        $('#profile_form').validate({
            errorPlacement: function(error, element){
                $(element).parent('span').parent('b').after(error);
            },
            rules : {
                portrait : {
                    accept   : 'gif|jpe?g|png'
                }
            },
            messages : {
                portrait  : {
                    accept   : 'avatar'
                }
            }
        });
        $('input[ectype="change_avatar"]').change(function(){

            var src = getFullPath($(this)[0]);
            $('img[ectype="avatar"]').attr('src', src);
            $('input[ectype="change_avatar"]').removeAttr('name');
            $(this).attr('name', 'portrait');
        });
    });

    //]]>
</script>
<div class="content">
    <?php echo $this->fetch('company.menu.html'); ?>
    <div id="right">


        <div class="submenu">
            <ul class="tab">

                <li class="active <?php if (($this->_foreach['member_submenu']['iteration'] <= 1)): ?>first<?php endif; ?>"><h2><a href="javascript:;">员工列表</a></h2></li>

                <li class="normal <?php if (($this->_foreach['member_submenu']['iteration'] <= 1)): ?>first<?php endif; ?>"><h2><a href="index.php?app=company&act=addsector">添加部门</a></h2></li>

                <li class="normal <?php if (($this->_foreach['member_submenu']['iteration'] <= 1)): ?>first<?php endif; ?>"><h2><a href="index.php?app=company&act=sectorlist">部门列表</a></h2></li>

                <li class="normal <?php if (($this->_foreach['member_submenu']['iteration'] <= 1)): ?>first<?php endif; ?>"><h2><a href="index.php?app=company&act=addworker">添加员工</a></h2></li>

                <div class="dustbin"><a href="index.php?app=buyer_order&act=dustbin" <?php if ($this->_var['_s_m']['dustbin'] == '1'): ?>style="color:#EE3000; text-decoration:none"<?php endif; ?>>订单回收站</a></div>
            </ul>
        </div>




        <div class="wrap">
            <div class="public">
                <form method="post" enctype="multipart/form-data" id="profile_form">
                    <div class="information">
                        <div class="info individual">
                            <table>
                                <tr>
                                    <!--<th class="width4">企业名称: </th>-->
                                    <th class="width4">员工姓名</th>
                                    <th class="width4">员工手机号</th>
                                    <th class="width4">所属部门</th>
                                    <th class="width4">系统角色</th>
                                    <th class="width4">状态</th>
                                    <th class="width4">操作</th>
                                </tr>
                               <?php $_from = $this->_var['comworkers']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'comworker');if (count($_from)):
    foreach ($_from AS $this->_var['comworker']):
?>
                                <tr>
                                   <td><?php echo $this->_var['comworker']['workername']; ?></td>
                                   <td><?php echo $this->_var['comworker']['workerphone']; ?></td>
                                    <?php $_from = $this->_var['sects']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'sect');if (count($_from)):
    foreach ($_from AS $this->_var['sect']):
?>
                                    <?php if ($this->_var['sect']['id'] == $this->_var['comworker']['sectid']): ?>
                                   <td><?php echo $this->_var['sect']['sectname']; ?></td>
                                    <?php endif; ?>
                                    <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
                                   <td>
                                       <?php if ($this->_var['comworker']['juese'] == 0): ?>
                                        系统管理员
                                       <?php elseif ($this->_var['comworker']['juese'] == 1): ?>
                                        部门负责人
                                       <?php else: ?>
                                       职工
                                       <?php endif; ?>
                                   </td>
                                   <td>
                                       <?php if ($this->_var['comworker']['status'] == 0): ?>
                                       未激活
                                       <?php else: ?>
                                         激活
                                       <?php endif; ?>
                                   </td>
                                   <td><a href="index.php?app=company&amp;act=editworker&amp;id=<?php echo $this->_var['comworker']['id']; ?>">编辑</a><a href="">删除</a></td>
                                </tr>
                               <?php endforeach; else: ?>
                                <tr><td>还没有员工</td></tr>
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
