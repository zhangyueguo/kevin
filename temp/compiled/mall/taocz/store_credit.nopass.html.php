<form action="index.php?app=store_credit&act=nopass" method="post" target="pop_warning">
    <div class="form_pass">
        <div id="warning"></div>
        <ul>
            <li>
                <label>驳回申请理由：</label>
                <br><br>
                <textarea name="excuse" cols="40" rows="5"></textarea>
            </li>
        </ul>
        <input type="submit" name="pass_submit" value="驳回申请">
        <input type="hidden" name="id" value="<?php echo $this->_var['id']; ?>">
    </div>
</form>