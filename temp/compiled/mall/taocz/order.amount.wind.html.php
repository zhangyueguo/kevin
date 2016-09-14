                <script type="text/javascript">
                $(function(){		   
				   /* tyioocom  */
				   $('#use_coupon').click(function(){
					   $(this).parent('p').next().toggle();
					   //$(this).hide();
					   
					   if($(this).val()=='使用优惠券'){
						   $(this).val('不使用优惠券');
						   $("select[name='coupon_sn']")[0].selectedIndex=0;
					   }else{
						   $(this).val('使用优惠券')
					   }
				   }); 
               });
                </script>
                <div class="w price-promotion mt10 mb10 f60">
               		<p class="mb10 mt10">
                       <?php if ($this->_var['goods_info']['allow_coupon']): ?>
					   <input id="use_coupon" type="button" class="btn-allow-coupon center" value="使用优惠券" />
                       <?php endif; ?>
					</p>
                    <?php if ($this->_var['goods_info']['allow_coupon']): ?>
                    <p class="allow-coupon border padding10 mb10 hidden clearfix">
                       <select name="coupon_sn" id="coupon_sn">
                          <option value="">选择您可用的优惠券</option>
                          <?php $_from = $this->_var['coupon_list']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }; $this->push_vars('', 'coupon');if (count($_from)):
    foreach ($_from AS $this->_var['coupon']):
?>
                          <option value="<?php echo $this->_var['coupon']['coupon_sn']; ?>">SN:<?php echo $this->_var['coupon']['coupon_sn']; ?>(<?php echo price_format($this->_var['coupon']['coupon_value']); ?>)</option>
                          <?php endforeach; endif; unset($_from); ?><?php $this->pop_vars();; ?>
                       </select>
                       <span class="note">本商城优惠券每次只能使用一张。您可以到 <a href='index.php?app=my_coupon'>我的优惠券</a> 登记或者查询具体的优惠券信息：</span>
                    </p>
                    <?php endif; ?>
                     <?php if ($this->_var['integral_open'] && $this->_var['is_allow']): ?>
                    <p>使用积分:<input type="text" name="exchange_integral" id="exchange_integral" class="text" />
					<span class="field_message explain"><span class="field_notice">（请输入积分值）;您账户可用积分为 <?php echo ($this->_var['user_integral'] == '') ? '0' : $this->_var['user_integral']; ?>, 本次订单最多可以使用积分:<?php echo ($this->_var['max_exchange'] == '') ? '0' : $this->_var['max_exchange']; ?></span></span>
					</p>
                    <?php endif; ?>
                </div>
                <div class="make_sure w mb10">
                    <p>
                        <a href="<?php echo url('app=cart&store_id=' . $this->_var['goods_info']['store_id']. ''); ?>" class="back">返回购物车</a>
                        <span class="ml20">订单总价：</span>
					   	<strong  id="order_amount"><?php echo price_format($this->_var['goods_info']['amount']); ?></strong>
                        <a href="javascript:void($('#order_form').submit());" class="btn-step fff center strong fs14 ml20">下单完成并支付</a>
                    </p>
                </div>
                <div class="w price-notice mt10 mb10 pt10 f60 pb10">若有价格变动（包括运费），请在点击确认订单后，联系卖家修改。卖家修改后，您可以至订单管理中查看、完成支付。</div>