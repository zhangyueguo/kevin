<?php echo $this->fetch('header.html'); ?>
<div id="rightTop">
    <p>商品审核</p>
    <ul class="subnav">
    	<?php if ($_GET['wait_verify']): ?>
        <li><a class="btn1" href="index.php?app=ju&amp;act=goods_list">全部商品</a></li>
        <li><span>待审核</span></li>
        <?php else: ?>
        <li><span>全部商品</span></li>
        <li><a class="btn1" href="index.php?app=ju&amp;act=goods_list&amp;wait_verify=1">待审核</a></li>
        <?php endif; ?>
    </ul>
</div>
<div class="groupbuy">
	<div class="title">操作提示：</div>
    <ul>
    	<li>商家申请参与聚活动的商品，要到活动审核里审核，方可在页面显示</li>
	</ul>
</div>
<div class="mrightTop">
    <div class="fontl">
        <form method="get">
            <div class="left">
                <input type="hidden" name="app" value="ju" />
                <input type="hidden" name="act" value="goods_list" />
                团购名称:
                <input class="queryInput" type="text" name="group_name" value="<?php echo htmlspecialchars($this->_var['query']['group_name']); ?>" />
                店铺名称:
                <input class="queryInput" type="text" name="store_name" value="<?php echo htmlspecialchars($this->_var['query']['store_name']); ?>" />
                <select name="template_id">
                	<option value="">全部</option>
                	<?php $_from = $this->_var['template_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'template');if (count($_from)):
    foreach ($_from AS $this->_var['template']):
?>
                    <option value="<?php echo $this->_var['template']['template_id']; ?>" <?php if ($_GET['template_id'] == $this->_var['template']['template_id']): ?> selected="selected"<?php endif; ?>><?php echo $this->_var['template']['template_name']; ?></option>
                    <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
                </select>
                <select name="status">
					<?php echo $this->html_options(array('options'=>$this->_var['status'],'selected'=>$_GET['status'])); ?>
				</select>
                <input type="submit" class="formbtn" value="查询" />
            </div>
            <?php if ($this->_var['filtered']): ?>
            <a class="left formbtn1" href="index.php?app=ju&amp;act=goods_list">撤销检索</a>
            <?php endif; ?>
            <span> </span>
        </form>
    </div>
    <div class="fontr"> <?php if ($this->_var['groupbuy_list']): ?><?php echo $this->fetch('page.top.html'); ?><?php endif; ?> </div>
</div>
<div class="tdare">
    <table width="100%" cellspacing="0" class="dataTable">
        <?php if ($this->_var['groupbuy_list']): ?>
        <tr class="tatr1">
            <td width="20" class="firstCell"><input type="checkbox" class="checkall" /></td>
            <td align="left">团购名称</td>
            <td align="left">店铺名称</td>
            <td align="left" class="table-center">聚活动</td>
            <!--<td class="table-center">已团购</td>-->
            <td class="handler">浏览数</td>
            <td class="table-center">推荐</td>
            <td class="table-center">状态</td>
            <td class="table-center">操作</td>
        </tr>
        <?php endif; ?>
        <?php $_from = $this->_var['groupbuy_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'groupbuy');if (count($_from)):
    foreach ($_from AS $this->_var['groupbuy']):
?>
        <tr class="tatr2">
            <td class="firstCell"><input value="<?php echo $this->_var['groupbuy']['group_id']; ?>" class='checkitem' type="checkbox" /></td>
            <td align="left"><a href="index.php?app=ju&amp;act=view&amp;id=<?php echo $this->_var['groupbuy']['group_id']; ?>"><?php echo htmlspecialchars($this->_var['groupbuy']['group_name']); ?></a></td>
            <td align="left"><a href="<?php echo $this->_var['site_url']; ?>/index.php?app=store&amp;id=<?php echo $this->_var['groupbuy']['store_id']; ?>" target="_blank"><?php echo htmlspecialchars($this->_var['groupbuy']['store_name']); ?></a></td>
            <td align="left" class="table-center"><?php echo $this->_var['groupbuy']['template_name']; ?></td>
            <!--<td class="table-center"><?php echo $this->_var['groupbuy']['count']; ?></td>-->
            <td class="table-center"><?php echo $this->_var['groupbuy']['views']; ?></td>
            <td class="table-center">
				<?php if ($this->_var['groupbuy']['recommend']): ?>
				<img src="templates/style/images/positive_enabled.gif" ectype="inline_edit" fieldname="recommend" fieldid="<?php echo $this->_var['groupbuy']['group_id']; ?>" fieldvalue="1" title="可编辑"/>
				<?php else: ?>
				<img src="templates/style/images/positive_disabled.gif" ectype="inline_edit" fieldname="recommend" fieldid="<?php echo $this->_var['groupbuy']['group_id']; ?>" fieldvalue="0" title="可编辑" />
				<?php endif; ?>
            </td>
            <td class="table-center">
            	<?php if ($this->_var['groupbuy']['status'] == 1): ?>
               	<font title="<?php echo $this->_var['groupbuy']['status_desc']; ?>" color="#006633">已通过</font>
                <?php elseif ($this->_var['groupbuy']['status'] == 2): ?>
                <font title="<?php echo $this->_var['groupbuy']['status_desc']; ?>" color="#666666">未通过</font>
                <?php elseif ($this->_var['groupbuy']['status'] == 3): ?>
                <font title="<?php echo $this->_var['groupbuy']['status_desc']; ?>" color="#CC9900">待修改</font>
                <?php else: ?>
                <font title="<?php echo $this->_var['groupbuy']['status_desc']; ?>" color="#FF6600">待审核</font>
                <?php endif; ?>
            </td>
            <td class="table-center"><a href="<?php if ($this->_var['groupbuy']['status'] == 3): ?>javascript:alert('待卖家修改后，您才能审核！');<?php else: ?><?php echo url('app=ju&act=verify&id=' . $this->_var['groupbuy']['group_id']. ''); ?><?php endif; ?>">审核</a> | <a href="index.php?app=ju&amp;act=view&amp;id=<?php echo $this->_var['groupbuy']['group_id']; ?>">查看</a> | <a name="drop" href="javascript:drop_confirm('如果删除，可能会对涉及该活动的卖家和买家产生影响，您确定要删除吗？', 'index.php?app=ju&amp;act=drop_goods&amp;id=<?php echo $this->_var['groupbuy']['group_id']; ?>');">删除</a> </td>
        </tr>
        <?php endforeach; else: ?>
        <tr class="no_data">
            <td colspan="10">没有数据</td>
        </tr>
        <?php endif; unset($_from); ?><?php $this->pop_vars();; ?>
    </table>
    <?php if ($this->_var['groupbuy_list']): ?>
    <div id="dataFuncs">
        <div id="batchAction" class="left paddingT15"> 
        <input class="formbtn batchButton" type="button" value="删除" name="id" uri="index.php?app=ju&amp;act=drop_goods" presubmit="confirm('如果删除，可能会对涉及该活动的卖家和买家产生影响，您确定要删除吗？');" />
            &nbsp;&nbsp;
            <input class="formbtn batchButton" type="button" value="批量审核" name="id" uri="index.php?app=ju&act=verify" />
            &nbsp;&nbsp; 
            <input class="formbtn batchButton" type="button" value="批量推荐" name="id" uri="index.php?app=ju&act=recommend" /></div>

    </div>
    <?php endif; ?>
    <div class="pageLinks"><?php if ($this->_var['groupbuy_list']): ?> <?php echo $this->fetch('page.bottom.html'); ?> <?php endif; ?> </div>
    <div class="clear"></div>
</div>
<?php echo $this->fetch('footer.html'); ?>