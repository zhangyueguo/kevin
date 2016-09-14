<?php echo $this->fetch('header.html'); ?>
<script type="text/javascript" src="<?php echo $this->lib_base . "/" . 'ajax_tree_ju.js'; ?>" charset="utf-8"></script>
<div id="rightTop">
    <p>分类管理</p>
    <ul class="subnav">
        <li><span>管理</span></li>
        <li><a class="btn1" href="index.php?app=jucate&amp;act=add">新增</a></li>
    </ul>
</div>
	<div class="groupbuy">
            <div class="title">
                操作提示：
            </div>
			<ul>
               <li>聚划算分类，商家申请聚划算商品时选择商品所属分类</li>
               <li>支持二级分类，例如：淘宝聚划算分为商品团和生活汇以及下面的二级分类</li>
            </ul>
    </div>
<div class="info2">
    <table  class="distinction">
        <?php if ($this->_var['cate_list']): ?>
        <thead>
        <tr class="tatr1">
            <td class="w30"><input id="checkall_1" type="checkbox" class="checkall" /></td>
            <td width="50%"><span class="all_checkbox"><label for="checkall_1">全选</label></span>分类名称</td>
            <td>排序</td>
            <td>显示</td>
            <td class="handler">操作</td>
        </tr>
        </thead>
        <?php endif; ?>
        <?php if ($this->_var['cate_list']): ?><tbody id="treet1"><?php endif; ?>
        <?php $_from = $this->_var['cate_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'cate');if (count($_from)):
    foreach ($_from AS $this->_var['cate']):
?>
        <tr>
            <td class="align_center w30"><input type="checkbox" class="checkitem" value="<?php echo $this->_var['cate']['cate_id']; ?>" /></td>
            <td class="node" width="50%"><?php if ($this->_var['cate']['switchs']): ?><img src="templates/style/images/treetable/tv-expandable.gif" ectype="flex" status="open" fieldid="<?php echo $this->_var['cate']['cate_id']; ?>"><?php else: ?><img src="templates/style/images/treetable/tv-item.gif"><?php endif; ?><span class="node_name editable" ectype="inline_edit" fieldname="cate_name" fieldid="<?php echo $this->_var['cate']['cate_id']; ?>" required="1" title="可编辑"><?php echo htmlspecialchars($this->_var['cate']['cate_name']); ?></span></td>
            <td class="align_center"><span class="editable" ectype="inline_edit" fieldname="sort_order" fieldid="<?php echo $this->_var['cate']['cate_id']; ?>" datatype="number" title="可编辑"><?php echo $this->_var['cate']['sort_order']; ?></span></td>
            <td class="align_center"><?php if ($this->_var['cate']['if_show']): ?><img src="templates/style/images/positive_enabled.gif" ectype="inline_edit" fieldname="if_show" fieldid="<?php echo $this->_var['cate']['cate_id']; ?>" fieldvalue="1" title="可编辑"/><?php else: ?><img src="templates/style/images/positive_disabled.gif" ectype="inline_edit" fieldname="if_show" fieldid="<?php echo $this->_var['cate']['cate_id']; ?>" fieldvalue="0" title="可编辑"/><?php endif; ?></td>
            <td class="handler"><span><a href="index.php?app=jucate&amp;act=edit&amp;id=<?php echo $this->_var['cate']['cate_id']; ?>">编辑</a>
                |
                <a href="javascript:if(confirm('如果删除，可能会对涉及该活动的卖家和买家产生影响，您确定要删除吗？'))window.location = 'index.php?app=jucate&amp;act=drop&amp;id=<?php echo $this->_var['cate']['cate_id']; ?>';">删除</a><?php if ($this->_var['region']['layer'] < $this->_var['max_layer']): ?> | <a href="index.php?app=jucate&amp;act=add&amp;pid=<?php echo $this->_var['cate']['cate_id']; ?>">新增下级</a><?php endif; ?>
                </span>
                </td>
        </tr>
        <?php endforeach; else: ?>
        <tr class="no_data">
            <td colspan="5">没有数据</td>
        </tr>
        <?php endif; unset($_from); ?><?php $this->pop_vars();; ?>
        <?php if ($this->_var['cate_list']): ?></tbody><?php endif; ?>
        <tfoot>
            <tr class="tr_pt10">
            <?php if ($this->_var['cate_list']): ?>
                <td class="align_center"><label for="checkall1"><input id="checkall_2" type="checkbox" class="checkall"></label></td>
                <td colspan="4" id="batchAction">
                    <span class="all_checkbox"><label for="checkall_2">全选</label></span>&nbsp;&nbsp;
                    <input class="formbtn batchButton" type="button" value="删除" name="id" uri="index.php?app=ju&act=drop_cate" presubmit="confirm('如果删除，可能会对涉及该活动的卖家和买家产生影响，您确定要删除吗？');" />
                </td>
            <?php endif; ?>
            </tr>
        </tfoot>
    </table>
</div>
<?php echo $this->fetch('footer.html'); ?>