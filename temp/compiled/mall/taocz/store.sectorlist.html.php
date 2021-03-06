<?php echo $this->fetch('company.header.html'); ?>
<style>
    .borline td {padding:10px 0px;}
    .ware_list th {text-align:left;}
</style>
<!--<script type="text/javascript" src="http://localhost/kevin/includes/libraries/javascript/ajax_tree.js"></script>-->
<script type="text/javascript" src="<?php echo $this->lib_base . "/" . 'ajax_tree2.js'; ?>" charset="utf-8"></script>
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
                <li class="active <?php if (($this->_foreach['member_submenu']['iteration'] <= 1)): ?>first<?php endif; ?>"><h2><a href="index.php?app=seller_store_sect">部门列表</a></h2></li>

                <li class="normal <?php if (($this->_foreach['member_submenu']['iteration'] <= 1)): ?>first<?php endif; ?>"><h2><a href="index.php?app=seller_store_sect&act=addsector">添加部门</a></h2></li>

                <li class="normal <?php if (($this->_foreach['member_submenu']['iteration'] <= 1)): ?>first<?php endif; ?>"><h2><a href="javascript:;">员工列表</a></h2></li>

                <li class="normal <?php if (($this->_foreach['member_submenu']['iteration'] <= 1)): ?>first<?php endif; ?>"><h2><a href="index.php?app=store_worker&act=addworker">添加员工</a></h2></li>

                <div class="dustbin">
                    <!--<a href="index.php?app=buyer_order&act=dustbin" <?php if ($this->_var['_s_m']['dustbin'] == '1'): ?>style="color:#EE3000; text-decoration:none"<?php endif; ?>>订单回收站</a>-->
                </div>
            </ul>
        </div>

        <div class="wrap">
            <div class="public">
                <form method="post" enctype="multipart/form-data" id="profile_form">
                    <div class="information">
                        <div class="info individual">
                            <table>
                                <?php if ($this->_var['sects']): ?>
                                <thead>
                                <tr class="tatr1">
                                    <td class="w30"><input id="checkall_1" type="checkbox" class="checkall" /></td>
                                    <td width="50%"><span class="all_checkbox"><label for="checkall_1">全选</label></span>分类名称</td>
                                    <td>排序</td>
                                    <td class="handler">操作</td>
                                </tr>
                                </thead>
                                <?php endif; ?>
                                <?php if ($this->_var['sects']): ?>
                                <tbody id="treet1">
                                <?php endif; ?>
                                <?php $_from = $this->_var['sects']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'gcategory');if (count($_from)):
    foreach ($_from AS $this->_var['gcategory']):
?>
                                <tr>
                                    <td class="align_center w30">
                                        <input type="checkbox" class="checkitem" value="<?php echo $this->_var['gcategory']['id']; ?>" />
                                    </td>
                                    <td class="node" width="50%">
                                        <?php if ($this->_var['gcategory']['switchs']): ?>
                                        <img src="data/files/mall/images/treetable/tv-expandable.gif" ectype="flex" status="open" fieldid="<?php echo $this->_var['gcategory']['id']; ?>">
                                        <?php else: ?>
                                        <img src="data/files/mall/images/treetable/tv-item.gif">
                                        <?php endif; ?>
                                        <span class="node_name editable" ectype="inline_edit" fieldname="cate_name" fieldid="<?php echo $this->_var['gcategory']['id']; ?>" required="1" title="editable"><?php echo htmlspecialchars($this->_var['gcategory']['sectname']); ?></span>
                                    </td>
                                    <td class="align_center"><span class="editable" ectype="inline_edit" fieldname="sort_order" fieldid="<?php echo $this->_var['gcategory']['id']; ?>" datatype="number" title="editable"><?php echo $this->_var['gcategory']['sort_order']; ?></span></td>

                                    
                                    <td  width="200">
                                        <span>
                                            <a href="index.php?app=seller_store_sect&amp;act=sect_edit&amp;id=<?php echo $this->_var['gcategory']['id']; ?>">编辑</a>
                                        |
                                        <a href="javascript:if(confirm('删除该分类将会同时删除该分类的所有下级分类，您确定要删除吗'))window.location = 'index.php?app=seller_store_sect&amp;act=drop&amp;id=<?php echo $this->_var['gcategory']['id']; ?>';">删除</a>
                                            <?php if ($this->_var['region']['layer'] < $this->_var['max_layer']): ?>
                                            | <a href="index.php?app=seller_store_sect&amp;act=addsector&amp;pid=<?php echo $this->_var['gcategory']['id']; ?>">添加子部门</a>
                                            <?php endif; ?>
                                            
                                        </span>
                                    </td>
                                </tr>
                                <?php endforeach; else: ?>
                                <tr class="no_data">
                                    <td colspan="5">暂时没有组织部门  请<a href="index.php?app=seller_store_sect&act=addsector">添加</a> </td>
                                </tr>
                                <?php endif; unset($_from); ?><?php $this->pop_vars();; ?>
                                <?php if ($this->_var['sects']): ?></tbody><?php endif; ?>


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
