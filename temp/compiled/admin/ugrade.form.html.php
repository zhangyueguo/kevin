<?php echo $this->fetch('header.html'); ?>
<script type="text/javascript">
$(function(){
    $('#grade_form').validate({
        errorPlacement: function(error, element){
            $(element).next('.field_notice').hide();
            $(element).after(error);
        },
        success       : function(label){
            label.addClass('right').text('OK!');
        },
        onkeyup    : false,
        rules : {
            grade_name : {
                required : true,
                remote   : {
                url :'index.php?app=ugrade&act=check_grade_name',
                type:'get',
                data:{
                        grade_name : function(){
                        return $('#grade_name').val();
                        },
                        id  : '<?php echo $this->_var['ugrade']['grade_id']; ?>'
                    }
                }
            },
			growth_needed:{
				required : true,
				number   :true,
				min      : 1
			}
        },
        messages : {
            grade_name : {
                required : '等级名称不能为空',
                remote   : '等级名称已存在'
            },
			growth_needed:{
				required : '成长值不能为空',
				number   : '该成长值必须为数值',
				min      :'成长值必须大于1'
			}
        }
    });
});
</script>
<div id="rightTop">
  <ul class="subnav">
    <li><a class="btn1" href="index.php?app=ugrade">等级管理</a></li>
    <li>
      <?php if ($_GET['act'] == 'edit'): ?>
      <span>编辑等级</span>
      <?php else: ?>
      <span>新增等级</span>
      <?php endif; ?>
    </li>
  </ul>
</div>
<div class="info">
  <form method="post" enctype="multipart/form-data" id="grade_form">
    <table class="infoTable">
      <tr>
        <th class="paddingT15"> 名称:</th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput2" name="grade_name" type="text" id="grade_name" value="<?php echo $this->_var['ugrade']['grade_name']; ?>" /> </td>
      </tr>
       <tr>
        <th class="paddingT15"> 图标:</th>
        <td class="paddingT15 wordSpacing5"><input type="file" name="grade_icon" value="<?php echo $this->_var['real_site_url']; ?>/<?php echo $this->_var['ugrade']['grade_icon']; ?>" /></td>
      </tr>
      <?php if ($this->_var['ugrade']['grade_icon']): ?>
      <tr>
        <th class="paddingT15"></th>
        <td class="paddingT15 wordSpacing5"><img width="" height="" src="<?php echo $this->_var['real_site_url']; ?>/<?php echo $this->_var['ugrade']['grade_icon']; ?>" /></td>
      </tr>
      <?php endif; ?> 
      <tr>
        <th class="paddingT15"> 等级:</th>
        <td><?php if ($_GET['act'] == 'edit'): ?><?php echo $this->_var['ugrade']['grade']; ?><?php else: ?><?php echo $this->_var['ugrade']; ?><?php endif; ?><input class="infoTableInput2" name="grade" type="hidden"  value="<?php echo $this->_var['ugrade']; ?>" /></td>
      </tr>
      <?php if ($this->_var['ugrade']['grade_id'] != 1): ?>
      <tr>
        <th class="paddingT15"> 所需成长值:</th>
        <td class="paddingT15 wordSpacing5"><input class="infoTableInput2" name="growth_needed" type="text" id="growth_needed" value="<?php echo $this->_var['ugrade']['growth_needed']; ?>" /><span class="gray field_notice">上级升级到本级所需要的成长值</span></td>
      </tr>
      <?php endif; ?> 
      <tr>
        <th></th>
        <td class="ptb20"><input class="formbtn" type="submit" name="Submit" value="提交" />
          <input class="formbtn" type="reset" name="Reset" value="重置" />        </td>
      </tr>
    </table>
  </form>
</div>
<?php echo $this->fetch('footer.html'); ?>