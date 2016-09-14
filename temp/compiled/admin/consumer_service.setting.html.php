<?php echo $this->fetch('header.html'); ?>

<script type="text/javascript">
//<!CDATA[
$(function(){
    $(".show_image").mouseover(function(){
        $(this).next("div").show();
    });
    $(".show_image").mouseout(function(){
        $(this).next("div").hide();
    });
	$('#c_s_form').validate({
        errorPlacement: function(error, element){
            $(element).next('.field_notice').hide();
            $(element).after(error);
        },
        success       : function(label){
            label.addClass('validate_right').text('OK!');
        },
        onkeyup : false,
        rules : {
            deposit_quota      : {
                number     : true
            }
        },
        messages : {
            deposit_quota     : {
                number  : '此项仅能为数字'
            }
        }
    });
});
//]]>
</script>

<div class="main">
	<div class="fixed-bar">
		<div class="item-title">
			<h3><a href="index.php?act=welcome" style="text-decoration:none;"><?php echo $this->_var['setting']['site_name']; ?></a> &nbsp;>&nbsp;consumer_service&nbsp;&nbsp;>&nbsp;&nbsp;消费者保障设置</h3>
		</div>
	</div>
	<div class="fixed-empty"></div>
	<div class="info">
	  <form method="post" enctype="multipart/form-data" id="c_s_form" name="form1">
		<table class="infoTable">
		  <tr>
			<th class="paddingT15"> <label for="site_name">审核消费者保障保证金额度:</label></th>
			<td class="paddingT15 wordSpacing5"><input id="site_name" type="text" name="bao_1" value="<?php echo $this->_var['setting']['deposit_xiao']['bao_1']; ?>" class="infoTableInput"/>        </td>
		  </tr>
          
		  <tr>
			<th class="paddingT15"> <label for="xfzbz_image">消费者保障图片:</label></th>
			<td class="paddingT15 wordSpacing5"><input class="infoTableFile" id="xb_img_1" type="file" name="xb_img_1" />
			  <?php if ($this->_var['setting']['deposit_img']['xb_img_1']): ?>
			  <img class="show_image" src="<?php echo $this->res_base . "/" . 'style/images/right.gif'; ?>" />
			  <div style="position:absolute; display:none"><img src="<?php echo $this->_var['site_url']; ?>/<?php echo $this->_var['setting']['deposit_img']['xb_img_1']; ?>?<?php echo $this->_var['random_number']; ?>" /></div>
			  <?php endif; ?>
			  <label class="field_notice">建议上传消费者保障图片规格：20*20</label>
			  </td>
		  </tr>
          
          
    

		  <tr>
			<th></th>
			<td class="ptb20">
				<a href="JavaScript:void(0);" class="formbtn" onclick="document.form1.submit()"><span>提交</span></a>
				<a href="JavaScript:void(0);" class="formbtn" onclick="document.form1.reset()"><span>重置</span></a>
			</td>
		  </tr>
		</table>
	  </form>
	</div>
	<?php echo $this->fetch('footer.html'); ?>
</div>