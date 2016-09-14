<?php echo $this->fetch('member.header.html'); ?>
<style type="text/css">
.fleft{float:left;}
.align2 {text-align: center;}
.table table {width: 100%; border-collapse: collapse; font-size:12px;}
.table th {font-weight: normal; height: 29px;}
.table td {padding:8px 0 5px 2px;}
.table th label{margin-left:8px;}

.table .sep-row td{padding:0;margin:0; height:5px; overflow:hidden}

.table .operations th{border:1px #DEDEE0 solid; background:#F3F3F3;text-align:left;padding-left:8px;}

.table .line-hd{background:#E8F2FF;text-align:left;color:#404040}
.table .line-hd th{border:1px #D4E7FF solid;}
.table .line-hd th p{padding-left:8px;}
.table .line td,.table .line_bold td{border-left:1px #EEEEEE solid;border-bottom:1px #EEEEEE solid}
.table .last_line td,.table .line .bottom-blue,.table .line-blue td{border-bottom:1px #D4E7FF solid}
.table .line .bottom-blue{line-height:18px;}
.table .line td.first{border-left:1px #D4E7FF solid;}
.table .line td.last{border-right:1px #D4E7FF solid; line-height:22px}

.table .pic-info img{display:inline-block;border:1px #EEEEEE solid;margin-left:5px;margin-right:5px;}
.table .txt-info{width:200px;}
.table .txt-info .txt{line-height:18px; height:36px;}
.table .txt-info p{color:#808080;}

.table .line_bold {}
.table .line_bottom td {border:1px #D4E7FF solid; background:#F2F2FF}
.line_head {background: url(themes/mall/skin//images/member/line_head.gif) repeat-x 0 bottom;}
.line_normal td {border-top: 1px solid #e2e2e2;}

.table_head_line {background: url(themes/mall/skin//images/member/table_line.gif) repeat-x 0 64px;}

.table .all {margin-right: 10px; cursor: pointer;}
.table .edit {padding-left: 25px; color: #919191; background: url(themes/mall/skin//images/member/ico.gif) no-repeat 10px -604px;}
.table .delete {padding-left: 25px; color: #919191; background: url(themes/mall/skin//images/member/ico.gif) no-repeat 10px -631px;}

.table .user {color: #3e3e3e;}
.table .user:hover {color: #ff4f01;}
.table .set_up {float: left; padding-left: 23px; color: #919191; background: url(themes/mall/skin//images/member/ico.gif) no-repeat 10px -701px;}
.table .default {float: left; padding-left: 23px; color: #333; text-decoration: none;}
.table .edit1 {float: left; padding-left: 23px; color: #919191; background: url(themes/mall/skin//images/member/ico.gif) no-repeat 10px -729px;}
.table .export {float: left; padding-left: 23px; color: #919191; background: url(themes/mall/skin//images/member/ico.gif) no-repeat 10px -1997px;}
.table .extend {float: left; padding-left: 23px; color: #919191; background: url(themes/mall/skin//images/member/ico.gif) no-repeat 10px -1875px;}
.table .add1_ico {float: left; padding-left: 23px; color: #919191; background: url(themes/mall/skin//images/member/ico.gif) no-repeat 10px -1180px;}
.table .add2_ico {float: left; padding-left: 23px; color: #919191; background: url(themes/mall/skin//images/member/ico.gif) no-repeat 10px -1772px;}
.table .edit:hover, .table .edit1:hover, .table .set_up:hover, .table .delete:hover, .table .export:hover, .table .extend:hover, .table .add1_ico:hover, .table .add2_ico:hover {color: #ff4f01;}

.table .email {display:inline-block; vertical-align:middle; width: 47px; height: 17px; background: url(themes/mall/skin//images/member/btn.gif) no-repeat 0 -41px; margin:0 auto}
</style>
<script type="text/javascript">
$(function(){
    $('#add_time_from').datepicker({dateFormat: 'yy-mm-dd'});
    $('#add_time_to').datepicker({dateFormat: 'yy-mm-dd'});
    $('.checkall_s').click(function(){
        var if_check = $(this).attr('checked');
        $('.checkitem').each(function(){
            if(!this.disabled)
            {
                $(this).attr('checked', if_check);
            }
        });
        $('.checkall_s').attr('checked', if_check);
    });
    $('a[ectype="batchcancel"]').click(function(){
        if($('.checkitem:checked').length == 0){
            return false;
        }
        if($(this).attr('presubmit')){
            if(!eval($(this).attr('presubmit'))){
                return false;
            }
        }
        var items = '';
        $('.checkitem:checked').each(function(){
            items += this.value + ',';
        });
        items = items.substr(0, (items.length - 1));

        var uri = $(this).attr('uri');
        uri = uri + '&' + $(this).attr('name') + '=' + items;
        var id = 'seller_order_cancel_order';
        var title = $(this).attr('dialog_title') ? $(this).attr('dialog_title') : '';
        //var url = $(this).attr('uri');
        var width = '500';
        ajax_form(id, title, uri, width);
    });
	$('.batchprint').click(function(){
        if($('.checkitem:checked').length == 0){
            return false;
        }
        if($(this).attr('presubmit')){
            if(!eval($(this).attr('presubmit'))){
                return false;
            }
        }
        var items = '';
        $('.checkitem:checked').each(function(){
            items += this.value + ',';
        });
        items = items.substr(0, (items.length - 1));
        var url = "<?php echo url('app=seller_order'); ?>"+'&'+'act=shipped_print'+'&order_id='+items;
		window.open(url);		
    });
	$('.postprint').click(function(){
        if($('.checkitem:checked').length == 0){
            return false;
        }
        if($(this).attr('presubmit')){
            if(!eval($(this).attr('presubmit'))){
                return false;
            }
        }
        var items = '';
        $('.checkitem:checked').each(function(){
            items += this.value + ',';
        });
        items = items.substr(0, (items.length - 1));
        var url = "<?php echo url('app=seller_order'); ?>"+'&'+'act=post_print'+'&order_id='+items;
		window.open(url);		
    });
});
</script>
<div class="content">
    <?php echo $this->fetch('member.menu.html'); ?>
  <div id="right">
    	
    	<?php echo $this->fetch('member.submenu.html'); ?>
        <div class="wrap">
         	<div class="public_index table">
                <table>
                	<tr class="line_bold">
                        <th colspan="8">
                            <div class="search_order clearfix">
                				<form method="get" class="clearfix">
               						<div style="float:left;">
                						<span class="title">订单号:</span>
                						<input class="text_normal" type="text" name="order_sn" value="<?php echo htmlspecialchars($this->_var['query']['order_sn']); ?>" />
                						<span class="title">下单时间:</span>
                						<input class="text_normal width2" type="text" name="add_time_from" id="add_time_from" value="<?php echo $this->_var['query']['add_time_from']; ?>" /> &#8211; <input class="text_normal width2" id="add_time_to" type="text" name="add_time_to" value="<?php echo $this->_var['query']['add_time_to']; ?>" />
                						<span class="title">买家:</span>
                						<input class="text_normal" type="text" name="buyer_name" value="<?php echo htmlspecialchars($this->_var['query']['buyer_name']); ?>" />
                						<input type="hidden" name="app" value="seller_order" />
                						<input type="hidden" name="act" value="index" />
                						<input type="hidden" name="type" value="<?php echo $this->_var['type']; ?>" />
                						<input type="submit" class="btn" value="搜索" />
                					</div>
                					<?php if ($this->_var['query']['buyer_name'] || $this->_var['query']['add_time_from'] || $this->_var['query']['add_time_to'] || $this->_var['query']['order_sn']): ?>
                    				<a class="detlink" href="<?php echo url('app=seller_order&type=' . $this->_var['query']['type']. ''); ?>">取消检索</a>
                					<?php endif; ?>
								</form>
        					</div>
                        </th>
                    </tr>
                	<tr class="sep-row" height="20"><td colspan="8"></td></tr>
                    <tr class="line gray">
                        <th>商品名称</th>
                        <th>价格</th>
                        <th>数量</th>
                        <th>支付方式</th>
                        <th>买家</th>
                        <th>订单总价</th>
                        <th>订单状态</th>
                        <th>评价</th>
                    </tr>
                    <?php if ($this->_var['orders']): ?>
                    <tr class="sep-row"><td colspan="8"></td></tr>
                    <tr class="operations">
                        <th colspan="8">
                            <p class="position1 clearfix"><input type="checkbox" id="all" class="checkall"/></p>
                            <p class="position1 clearfix">
                        		<label for="all">全选</label>
                            	<a href="javascript:;" class="delete" ectype="batchcancel" uri="index.php?app=seller_order&act=cancel_order" name="order_id">取消订单</a>
                                 <input type="button" id="batchprint" value="批量打印发货单" class="sm_dayin1 batchprint"/>
                                 <input type="button" id="postprint" value="post打印发货单" class="sm_dayin1 postprint"/>
                            </p>
                            <p class="position2 clearfix">
                                <?php echo $this->fetch('member.page.top.html'); ?>
                            </p>
                        </th>
                    </tr>
                    <?php endif; ?>
                    
                    
                    <?php $_from = $this->_var['orders']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'order');$this->_foreach['fe_order'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['fe_order']['total'] > 0):
    foreach ($_from AS $this->_var['order']):
        $this->_foreach['fe_order']['iteration']++;
?>
                    <tr class="sep-row"><td colspan="8"></td></tr>
                    <tr class="line-hd">
                    	<th colspan="8">
                        	<p>
                            	<input type="checkbox" value="<?php echo $this->_var['order']['order_id']; ?>" class="checkitem" <?php if ($this->_var['order']['status'] == ORDER_FINISHED || $this->_var['order']['status'] == ORDER_CANCELED): ?> disabled="disabled" <?php endif; ?>/>
                            	<label>订单号：</label><?php echo $this->_var['order']['order_sn']; ?>
                            	<label>成交时间：</label><?php echo date("Y-m-d H:i:s",$this->_var['order']['add_time']); ?>
                            </p>
                        </th>
                    </tr>
                    <?php $_from = $this->_var['order']['order_goods']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'goods');$this->_foreach['fe_goods'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['fe_goods']['total'] > 0):
    foreach ($_from AS $this->_var['goods']):
        $this->_foreach['fe_goods']['iteration']++;
?>
                    <tr class="line<?php if (($this->_foreach['fe_goods']['iteration'] == $this->_foreach['fe_goods']['total'])): ?> last_line<?php endif; ?>">
                        <td valign="top" class="first clearfix">
                        	<div class="pic-info fleft">
                            	<a href="<?php echo url('app=goods&id=' . $this->_var['goods']['goods_id']. ''); ?>" target="_blank"><img src="<?php echo $this->_var['goods']['goods_image']; ?>" width="50" height="50" /></a>
                            </div>
                            <div class="txt-info fleft">
                            	<div class="txt">
                                	<a href="<?php echo url('app=goods&id=' . $this->_var['goods']['goods_id']. ''); ?>" target="_blank"><?php echo $this->_var['goods']['goods_name']; ?></a>
                                </div>
                                <?php if ($this->_var['goods']['specification']): ?><p class="gray-color mt5"><?php echo $this->_var['goods']['specification']; ?></p><?php endif; ?>
                            </div>
                        </td>
                        <td valign="top" class="align2"><?php echo $this->_var['goods']['price']; ?></td>
                        <td valign="top" class="align2"><strong><?php echo $this->_var['goods']['quantity']; ?></strong></td>
                        <?php if (($this->_foreach['fe_goods']['iteration'] <= 1)): ?>
                        <td valign="top" class="align2 bottom-blue" rowspan="<?php echo $this->_var['order']['goods_quantities']; ?>">
                        	<?php echo htmlspecialchars($this->_var['order']['payment_name']); ?>
                        </td>
                        <td valign="top" class="align2 bottom-blue" rowspan="<?php echo $this->_var['order']['goods_quantities']; ?>">
                        	<a href="<?php echo url('app=message&act=send&to_id=' . $this->_var['order']['buyer_id']. ''); ?>" target="_blank"><?php echo htmlspecialchars($this->_var['order']['buyer_name']); ?></a>
                            <br />
                            <?php if ($this->_var['order']['buyer_info']['real_name']): ?><?php echo sub_str(htmlspecialchars($this->_var['order']['buyer_info']['real_name']),14); ?><?php else: ?>----<?php endif; ?>
                            <br />
                            <?php if ($this->_var['order']['buyer_info']['im_qq']): ?>
                            <a href="http://wpa.qq.com/msgrd?V=1&amp;Uin=<?php echo htmlspecialchars($this->_var['order']['buyer_info']['im_qq']); ?>&amp;Site=<?php echo htmlspecialchars($this->_var['store']['store_name']); ?>&amp;Menu=yes" target="_blank"><img src="http://wpa.qq.com/pa?p=1:<?php echo htmlspecialchars($this->_var['order']['buyer_info']['im_qq']); ?>:5" alt="QQ"></a>
                            <?php elseif ($this->_var['order']['buyer_info']['im_aliww']): ?>
                            <a target="_blank" href="http://amos.im.alisoft.com/msg.aw?v=2&uid=<?php echo urlencode($this->_var['order']['buyer_info']['im_aliww']); ?>&site=cntaobao&s=2&charset=<?php echo $this->_var['charset']; ?>" ><img border="0" src="http://amos.im.alisoft.com/online.aw?v=2&uid=<?php echo urlencode($this->_var['order']['buyer_info']['im_aliww']); ?>&site=cntaobao&s=2&charset=<?php echo $this->_var['charset']; ?>" alt="Wang Wang" /></a>
                            <?php elseif ($this->_var['order']['buyer_info']['im_msn']): ?>
                            <a target="_blank" href="http://settings.messenger.live.com/Conversation/IMMe.aspx?invitee=<?php echo htmlspecialchars($this->_var['order']['buyer_info']['im_msn']); ?>"><img src="http://messenger.services.live.com/users/<?php echo htmlspecialchars($this->_var['order']['buyer_info']['im_msn']); ?>/presenceimage/" alt="im_msn" /></a>
                            <?php else: ?>
                            <a target="_blank" href="<?php echo url('app=message&act=send&to_id=' . $this->_var['order']['buyer_id']. ''); ?>" class="email"></a>
                            <?php endif; ?>
                        </td>
                        <td class="align2 padding1"><strong><?php echo $this->_var['order']['order_amount']; ?></strong><br />
                            <span class="gray-color">(含运费:<?php echo $this->_var['order']['shipping_fee']; ?>)</span></td>
                        <td class="align2"><span class="color4"><?php echo call_user_func("order_status",$this->_var['order']['status']); ?><?php if ($this->_var['order']['evaluation_status']): ?>,&nbsp;已评价<?php endif; ?></span></td>
                        <td valign="top" width="54" class="align2 bottom-blue last" rowspan="<?php echo $this->_var['order']['goods_quantities']; ?>">
                            <?php if ($this->_var['order']['evaluation_status']): ?><p class="gray-color">已评价</p><?php endif; ?>
                        </td>
                        <?php endif; ?>
                    </tr>
                    <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
                    <tr class="line_bottom">
                        <td colspan="8" align="right" class="order_form1"><div class="button_wrap">
                        <input type="button" value="收到货款" class="btn" ectype="dialog" dialog_id="seller_order_received_pay" dialog_width="400" uri="index.php?app=seller_order&amp;act=received_pay&amp;order_id=<?php echo $this->_var['order']['order_id']; ?>&ajax" dialog_title="收到货款" id="order<?php echo $this->_var['order']['order_id']; ?>_action_received_pay"<?php if ($this->_var['order']['status'] != ORDER_PENDING): ?> style="display:none"<?php endif; ?> />
                        <input type="button" value="确认订单" class="btn1" ectype="dialog" uri="index.php?app=seller_order&amp;act=confirm_order&amp;order_id=<?php echo $this->_var['order']['order_id']; ?>&ajax" dialog_id="seller_order_confirm_order" dialog_title="确认订单"  dialog_width="400" id="order<?php echo $this->_var['order']['order_id']; ?>_action_confirm"<?php if ($this->_var['order']['status'] != ORDER_SUBMITTED): ?> style="display:none"<?php endif; ?> />
                        <input type="button" value="调整费用" class="btn1" uri="index.php?app=seller_order&amp;act=adjust_fee&amp;order_id=<?php echo $this->_var['order']['order_id']; ?>&ajax" dialog_width="450" dialog_title="调整费用" ectype="dialog"  dialog_id="seller_order_adjust_fee" id="order<?php echo $this->_var['order']['order_id']; ?>_action_adjust_fee"<?php if ($this->_var['order']['status'] != ORDER_PENDING && $this->_var['order']['status'] != ORDER_SUBMITTED): ?> style="display:none"<?php endif; ?> />
                        <input type="button" value="发货" class="btn1" ectype="dialog" dialog_title="发货" dialog_id="seller_order_shipped" uri="index.php?app=seller_order&amp;act=shipped&amp;order_id=<?php echo $this->_var['order']['order_id']; ?>&ajax"  dialog_width="400" id="order<?php echo $this->_var['order']['order_id']; ?>_action_shipped"<?php if ($this->_var['order']['status'] != ORDER_ACCEPTED): ?> style="display:none"<?php endif; ?> />
                        
                        
                                <?php if ($this->_var['enable_express']): ?>
                        <a target="_blank" class="btn1" href="<?php echo url('app=order_express&order_id=' . $this->_var['order']['order_id']. ''); ?>" <?php if ($this->_var['order']['status'] != ORDER_SHIPPED && $this->_var['order']['status'] != ORDER_FINISHED): ?> style="display:none"<?php endif; ?>>查看物流</a>
                        <?php endif; ?>
                        
                        <input type="button" value="完成交易" class="btn1" ectype="dialog" dialog_id="seller_order_finished"  dialog_title="完成交易" uri="index.php?app=seller_order&amp;act=finished&order_id=<?php echo $this->_var['order']['order_id']; ?>&ajax" dialog_width="400"  id="order<?php echo $this->_var['order']['order_id']; ?>_action_finish"<?php if ($this->_var['order']['payment_code'] != 'cod' || $this->_var['order']['status'] != ORDER_SHIPPED): ?> style="display:none"<?php endif; ?> />
                        <input type="button" value="修改单号" class="btn1" ectype="dialog" dialog_title="修改单号" uri="index.php?app=seller_order&amp;act=shipped&amp;order_id=<?php echo $this->_var['order']['order_id']; ?>&ajax" dialog_id="seller_order_shipped" dialog_width="400" id="order<?php echo $this->_var['order']['order_id']; ?>_action_edit_invoice_no"<?php if ($this->_var['order']['status'] != ORDER_SHIPPED): ?> style="display:none"<?php endif; ?> />
                        
                        <input type="button" value="取消订单" class="btn1" ectype="dialog" uri="index.php?app=seller_order&amp;act=cancel_order&order_id=<?php echo $this->_var['order']['order_id']; ?>&ajax" dialog_title="取消订单" dialog_id="seller_order_cancel_order" dialog_width="400" id="order<?php echo $this->_var['order']['order_id']; ?>_action_cancel"<?php if ($this->_var['order']['status'] == ORDER_CANCELED || $this->_var['order']['status'] == ORDER_FINISHED): ?> style="display:none"<?php endif; ?> />
                        <a class="btn1" href="<?php echo url('app=seller_order&act=view&order_id=' . $this->_var['order']['order_id']. ''); ?>" target="_blank">查看订单</a>
                       </div> </td>
            </tr>
                    <?php endforeach; else: ?>
                    <tr><td class="member_no_records" colspan="8">没有符合条件的订单</td></tr>
                    <?php endif; unset($_from); ?><?php $this->pop_vars();; ?>
                    <?php if ($this->_var['orders']): ?>
                    <tr class="sep-row">
                        <td colspan="8"></td>
                    </tr>
                    <tr class="operations">
                        <th colspan="8">
                            <p class="position1 clearfix"><input type="checkbox" id="all2" class="checkall"/></p>
                            <p class="position1 clearfix">
                        		<label for="all2">全选</label>
                            	<a href="javascript:;" class="delete" ectype="batchcancel" uri="index.php?app=seller_order&act=cancel_order" name="order_id">取消订单</a>
                                 <input type="button" id="batchprint" value="批量打印发货单" class="sm_dayin1 batchprint"/>
                                 <input type="button" id="postprint" value="post打印发货单" class="sm_dayin1 postprint"/>
                            </p>
                            <p class="position2 clearfix">
                                <?php echo $this->fetch('member.page.bottom.html'); ?>
                            </p>
                        </th>
                    </tr>
                    <?php endif; ?>
                    </table>
                    <iframe name="seller_order" style="display:none;"></iframe>
        </div>
    
    </div>
</div>
</div>
<div class="clear"></div>
</div>
<?php echo $this->fetch('footer.html'); ?>
