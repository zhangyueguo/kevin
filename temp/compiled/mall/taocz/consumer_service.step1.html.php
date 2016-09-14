<?php echo $this->fetch('member.header.html'); ?>
<style>
.member_no_records {border-top: 0px !important;}
.table td{padding-left: 5px;}
.xiaotit {
	color:#F00;
	}
</style>
<div class="content">
  <div class="totline"></div>
  <div class="botline"></div>
  <?php echo $this->fetch('member.menu.html'); ?>
  <div id="right">
    <?php echo $this->fetch('member.submenu.html'); ?>
        <div class="wrap">

            <div class="public_select table">
                <div class="cpsa_services">
				<div class="cpsa_services_content">
	<div class="xbserver-img">
	<div class="normal-server-pic"><img src="<?php echo $this->_var['xfzbz_image']['xb_img_1']; ?>" alt="消费者保障服务" /></div>
	<b>
    
<span class="xiaotit">消费者保障服务</span>-<?php if (! $this->_var['consumerservice']): ?>未交保证金店铺<?php else: ?><?php echo $this->_var['lang']['c_s_state'][$this->_var['consumerservice']['state']]; ?><?php endif; ?></b>
	
    
    <span class="price">保证金额度：<?php echo price_format($this->_var['deposit_quota']['bao_1']); ?></span>
    <hr class="underline">
	<p> 您已经签署《消费者保障服务协议》，加入此服务的卖家承诺发生实物与描述不符合、货物质量问题、发货未收到货情况，必须保障买家利益。</p>
	<p class="warning-content">您可以通过缴纳提交保证金，为消费者提供更多特色保障服务，获得更多推广机会，成为消费者信赖卖家，提高自身竞争力。</p>
	 <?php if (! $this->_var['consumerservice']): ?><input type="button" onClick="location.href=('index.php?app=consumer_service&step=2&type=1');" value="提交保证金" class="cpsa_button"><?php endif; ?>
							</div>
						</div>
				</div>
            </div>
            
           
            
            
            
            
           
            
            
            <div class="wrap_bottom"></div>
        </div>
        <div class="clear"></div>

    </div>
    <div class="clear"></div>
</div>
<?php echo $this->fetch('footer.html'); ?>