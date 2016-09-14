<?php echo $this->fetch('header.html'); ?>
<style type="text/css">
.mall-nav{display:none}
</style>
<style media="screen" type="text/css">
/*下面字体大小记得要删掉*/
.divs{margin-top:10px;text-align:center;over-flow:hidden;height:100%;width:100%;}
UL{list-style-type:none; margin:0px;}
/* 标准盒模型 */
.ttl{height:18px;}
.ctt{height:auto;padding:6px;clear:both;border:1px solid #ff6d00;border-top:0;text-align:left;}
.w936{margin:2px 0;clear:both;width:820px;/*这里调整整个滑动门的宽度*/}
/* TAB 切换效果 */
.tb_{background-image: url('<?php echo $this->_var['site_url']; ?>/themes/mall/taocz/styles/default/images_sft/cashier.payment_1.gif'); background-repeat: repeat-x;background-color: #ffffff;}/*按钮底色   图片：上行一横*/
.tb_ ul{height:24px;}
.tb_ li{float:left;height: 24px;line-height:1.9;width: 94px;cursor:pointer;}
/* 用于控制显示与隐藏的css类 */
.normaltab   { background-image:url('<?php echo $this->_var['site_url']; ?>/themes/mall/taocz/styles/default/images_sft/cashier.payment_2.gif'); background-repeat: no-repeat; color:#f5f5f5 ;}/*无选时字体颜色 图片：无选时图片*/
.hovertab    { background-image: url('<?php echo $this->_var['site_url']; ?>/themes/mall/taocz/styles/default/images_sft/cashier.payment_3.gif'); background-repeat: no-repeat; color:#ff6600; font-weight:bold }/*已选时字体颜色*/
.dis{display:block;}
.undis{display:none;}


.defrays {width: 100%; margin-bottom: 20px;}
/* 灰色线下支付 css类 */
.defrays dt {height: 28px; line-height: 28px; background: #f5f5f5; padding-left: 20px; font-weight: bold; color: #333;}
.defrays dd {width: 682px; overflow: hidden; padding-top: 10px;}
.defrays dd .radio {float: left; width: 40px; text-align: center; padding-top: 14px;}
.defrays dd .logo {float: left; width: 140px;}
.defrays dd .explain {float: left; width: 477px; line-height: 20px; color: #787878;}
.defrays dd .dongtai {float: left; width: 677px; line-height: 40px;}

</style>
<script type="text/javascript" language="javascript">
function g(o){return document.getElementById(o);}
function HoverLi(n){
//如果有N个标签,就将i<=N;
//本功能非常OK,兼容IE7,FF,IE6
for(var i=1;i<=2;i++){g('tb_'+i).className='normaltab';g('tbc_0'+i).className='undis';}g('tbc_0'+n).className='dis';g('tb_'+n).className='hovertab';
}
//如果要做成点击后再转到请将<li>中的onmouseover 改成 onclick;
</script>
<div id="main" class="w-full">
<div id="page-cashier" class="w">
   <div class="step step3 mt10 clearfix">
      <span class="fs14 strong f60">1.查看购物车</span>
      <span class="fs14 strong f60">2.确认订单信息</span>
      <span class="fs14 strong fff">3.付款</span>
      <span class="fs14 strong">4.确认收货</span>
      <span class="fs14 strong">5.评价</span>
   </div>
   <div class="order-form cashier clearfix">
            <div class="order_info border mt20 clearfix">
               <div class="ico">
               </div>
               <div class="text">
                  <p class="fs14 strong">订单提交成功！ 订单总价 <span class="f60"><?php echo price_format($this->_var['order']['order_amount']); ?></span></p>
                  <p>* 您的订单已成功生成，选择您想用的支付方式进行支付订单号<?php echo $this->_var['order']['order_sn']; ?></p>
                  <p>* <a href="<?php echo url('app=buyer_order'); ?>" target="_blank">您可以在用户中心中的我的订单查看该订单</a></p>
               </div>
            </div>
            <div class="buy border padding10 mt10">
                <h3><b class="ico">选择支付方式并付款</b></h3>

<div class="divs">
 <div id="tb_" class="tb_">
   <ul>
    <li id="tb_1" class="hovertab" onclick="a:HoverLi(1);">在线支付</li>
	<li id="tb_2" class="normaltab" onclick="b:HoverLi(2);">线下支付</li>
   </ul>
 </div>
 <div class="ctt">
  <form action="index.php?app=cashier&act=goto_pay&order_id=<?php echo $this->_var['order']['order_id']; ?>" method="POST" id="goto_pay">
  <div class="dis" id="tbc_01">
  
                <dl class="defrays">
                    <dt>在线支付</dt>
                    <?php $_from = $this->_var['payments']['online']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'payment');if (count($_from)):
    foreach ($_from AS $this->_var['payment']):
?>
                    <dd>
                        <p class="radio"><input id="payment_<?php echo $this->_var['payment']['payment_code']; ?>" type="radio" name="payment_id" value="<?php echo $this->_var['payment']['payment_id']; ?>" /></p>
                        <p class="logo"><label for="payment_<?php echo $this->_var['payment']['payment_code']; ?>"><img src="<?php echo $this->_var['site_url']; ?>/includes/payments/<?php echo $this->_var['payment']['payment_code']; ?>/logo.gif" alt="<?php echo $this->_var['payment']['payment_name']; ?>-<?php echo $this->_var['payment']['payment_desc']; ?>" title="<?php echo $this->_var['payment']['payment_name']; ?>-<?php echo $this->_var['payment']['payment_desc']; ?>" width="125" height="47" /></label></p>
                        <p class="explain"><?php echo $this->_var['payment']['payment_desc']; ?></p>
                    </dd>
                    <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
                    
                    
                    
                                     <?php if ($this->_var['alipay_bank']): ?>
                                     <dt>支付宝网银</dt>
                                     <dd>
                <dl class="bank-list clearfix" ectype="online" style="margin-left:20px;">
                <ul class="ui-list-icons clearfix">
                                  		<?php $_from = $this->_var['alipaybank']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('key', 'bank');$this->_foreach['fe_bank'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['fe_bank']['total'] > 0):
    foreach ($_from AS $this->_var['key'] => $this->_var['bank']):
        $this->_foreach['fe_bank']['iteration']++;
?>
										<li class="clearfix">
											<input class="float-left"  type="radio" name="defaultbank" id="<?php echo $this->_var['key']; ?>" value="<?php echo $this->_var['key']; ?>" />
											<label class="float-left icon-box current " for="<?php echo $this->_var['key']; ?>" >
												<span class="icon-cashier icon-cashier-<?php echo $this->_var['key']; ?>" title="<?php echo $this->_var['bank']; ?>">&nbsp;<em class="qiye hidden">企业</em></span>
											</label>
										</li>
                                        <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
                          			</ul>
                
              </dl>
              </dd>
                  <?php endif; ?>
                </dl> 
             <div class="make_sure mt10 mb20">
                <p>
                    <a href="javascript:$('#goto_pay').submit();" class="btn-step fff strong fs14">确认支付</a>
                </p>
            </div>      
  </div>

  <div class="undis" id="tbc_02">
  
                  <dl class="defrays">
                    <dt>线下支付</dt>
                    <?php $_from = $this->_var['payments']['offline']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'payment');if (count($_from)):
    foreach ($_from AS $this->_var['payment']):
?>
					<?php if ($this->_var['payment']['payment_code'] != "sft"): ?>
                    <dd>
                        <p class="radio"><input type="radio" id="payment_<?php echo $this->_var['payment']['payment_code']; ?>" name="payment_id" value="<?php echo $this->_var['payment']['payment_id']; ?>" /></p>
                        <p class="logo"><label for="payment_<?php echo $this->_var['payment']['payment_code']; ?>">
						<img alt="<?php echo $this->_var['payment']['payment_name']; ?>-<?php echo $this->_var['payment']['payment_desc']; ?>" title="<?php echo $this->_var['payment']['payment_name']; ?>-<?php echo $this->_var['payment']['payment_desc']; ?>" src="<?php echo $this->_var['site_url']; ?>/includes/payments/<?php echo $this->_var['payment']['payment_code']; ?>/logo.gif" width="125" height="47" /></label></p>
                        <p class="explain"><?php echo $this->_var['payment']['payment_desc']; ?></p>
                    </dd>
					<?php endif; ?>
                    <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
                </dl>
             <div class="make_sure mt10 mb20">
                <p>
                    <a href="javascript:$('#goto_pay').submit();" class="btn-step fff strong fs14">确认支付</a>
                </p>
            </div>               
 </div>


            </div>

    	</form>
	</div>
</div>
</div>
<?php echo $this->fetch('server.html'); ?>
<?php echo $this->fetch('footer.html'); ?>