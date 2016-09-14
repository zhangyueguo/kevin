<?php echo $this->fetch('member.header.html'); ?>
<script type="text/javascript">
    $(function(){
        $('#add_time_from').datepicker({dateFormat: 'yy-mm-dd'});
        $('#add_time_to').datepicker({dateFormat: 'yy-mm-dd'});
    });
</script>

<div class="content">
    <?php echo $this->fetch('member.menu.html'); ?>
    <div id="right">
        <?php echo $this->fetch('member.submenu.html'); ?>
        <div class="wrap">
            <div class="public table deposit">
                <div class="recordlist">
                    <?php if ($this->_var['records']['list']): ?>
                    <div class="notice-word">通过预存款交易的收支记录</div>
                    <?php endif; ?>
                    <div class="title clearfix">
                        <form method="get" class="float-left">
                            <input type="hidden" name="app" value="deposit" />
                            <input type="hidden" name="act" value="recordlist" />
                            <input class="text" type="text" name="add_time_from" id="add_time_from" value="<?php echo $_GET['add_time_from']; ?>" /> <span>-</span>
                            <input class="text" id="add_time_to" type="text" name="add_time_to" value="<?php echo $_GET['add_time_to']; ?>" />
                            <input type="submit" class="btn-record" value="搜索" />
                        </form>
                        <div class="float-left">
                            总收入 <strong><?php echo $this->_var['records']['total_income']; ?></strong> 元，总支出 <strong><?php echo $this->_var['records']['total_outlay']; ?></strong> 元
                        </div>
                        <div class="float-right">
                            <a href="<?php echo url('app=deposit&act=monthbill'); ?>">月账单下载</a>
                        </div>
                    </div>
                    <ul class="subtit">
                        <li class="clearfix">
                            <div class="tradesn">流水号</div>
                            <div class="time">日期</div>
                            <div class="info">名称 | 备注</div>
                            <div class="income">收入(元)</div>
                            <div class="defray">支出(元)</div>
                            <div class="balanceNum">账户余额(元)</div>
                            <div class="payway">支付方式</div>
                            <div class="detail">详情</div>
                        </li>
                    </ul>
                    <div class="content">
                        <?php $_from = $this->_var['records']['list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'record');if (count($_from)):
    foreach ($_from AS $this->_var['record']):
?>
                        <ul>
                            <li class="clearfix">
                                <div class="tradesn"><?php echo $this->_var['record']['tradesn']; ?></div>
                                <div class="time"><?php if ($this->_var['record']['flow'] == 'income'): ?><?php echo date("Y.m.d H.i.s",$this->_var['record']['end_time']); ?><?php else: ?><?php echo date("Y.m.d H.i.s",$this->_var['record']['pay_time']); ?><?php endif; ?></div>
                                <div class="info break-word"><?php echo $this->_var['record']['name']; ?><?php if ($this->_var['record']['remark']): ?><p title="<?php echo htmlspecialchars($this->_var['record']['remark']); ?>" class="gray"><?php echo sub_str(htmlspecialchars($this->_var['record']['remark']),30); ?></p><?php endif; ?></div>
                                <div class="income"><strong class="price green"><?php if ($this->_var['record']['flow'] == 'income'): ?>+<?php echo $this->_var['record']['amount']; ?><?php else: ?>&nbsp;<?php endif; ?></strong></div>
                                <div class="defray"><strong class="price f60"><?php if ($this->_var['record']['flow'] == 'outlay'): ?>-<?php echo $this->_var['record']['amount']; ?><?php else: ?>&nbsp;<?php endif; ?></strong></div>
                                <div class="balanceNum"><strong class="price"><?php echo $this->_var['record']['balance']; ?></strong></div>
                                <div class="payway"><?php echo $this->_var['record']['payway']; ?></div>
                                <div class="detail">
                                    <a target="_blank" href="<?php echo url('app=deposit&act=record&tradesn=' . $this->_var['record']['tradesn']. ''); ?>">查看</a>
                                </div>
                            </li>
                        </ul>
                        <?php endforeach; else: ?>
                        <div class="notice-word mt10">没有任何收支记录。</div>
                        <?php endif; unset($_from); ?><?php $this->pop_vars();; ?>
                    </div>
                    <div class="mt10 clearfix"><?php echo $this->fetch('member.page.bottom.html'); ?></div>
                </div>
            </div>
            <div class="wrap_bottom"></div>
        </div>
        <div class="clear"></div>
        <div class="adorn_right1"></div>
        <div class="adorn_right2"></div>
        <div class="adorn_right3"></div>
        <div class="adorn_right4"></div>
    </div>

    <div class="clear"></div>
</div>
<iframe id='iframe_post' name="iframe_post" src="about:blank" frameborder="0" width="0" height="0"></iframe>
<?php echo $this->fetch('footer.html'); ?>
