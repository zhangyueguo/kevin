1.将ueditor复制到网站根目录下
2.将如下代码加入到文件/includes/ecapp.base.php,并替换原有的_build_editor();方法
 function _build_editor($params = array())
    {
        $name = isset($params['name']) ?  $params['name'] : null;
        $theme = isset($params['theme']) ?  $params['theme'] : 'normal';
        $ext_js = isset($params['ext_js']) ? $params['ext_js'] : true;
        $content_css = isset($params['content_css']) ? 'content_css:"' . $params['content_css'] . '",' : null;
        $if_media = false;
        $visit = $this->visitor->get('manage_store');
        $store_id = isset($visit) ? intval($visit) : 0;
        $privs = $this->visitor->get('privs');
        if (!empty($privs))
        {
            if ($privs == 'all')
            {
                $if_media = true;
            }
            else
            {
                $privs_array = explode(',', $privs);
                if (in_array('article|all', $privs_array))
                {
                    $if_media = true;
                }
            }
        }
        if (!empty($store_id) && !$if_media)
        {
            $store_mod =& m('store');
            $store = $store_mod->get_info($store_id);
            $sgrade_mod =& m('sgrade') ;
            $sgrade = $sgrade_mod->get_info($store['sgrade']);
            $functions = explode(',', $sgrade['functions']);
            if (in_array('editor_multimedia', $functions))
            {
                $if_media = true;
            }
        }

        $include_js = '';

        if($ext_js)
        {
            $include_js=' <script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.config.js"></script> <script type="text/javascript" charset="utf-8" src="/ueditor/ueditor.all.min.js"> </script><script type="text/javascript" charset="utf-8" src="/ueditor/lang/zh-cn/zh-cn.js"></script>';
        }
 


        /* 指定哪个(些)textarea需要编辑器 */
        if ($name === null)
        {
            $mode = 'mode:"textareas",';
        }
        else
        {
            $mode = 'mode:"exact",elements:"' . $name . '",';
        }

      
        switch ($theme)
        {
            case 'simple':
                $theme_config = $themes['simple'];
            break;
            case 'normal':
                $theme_config = $themes['normal'];
            break;
            default:
                $theme_config = $themes['normal'];
            break;
        }
        /* 配置界面语言 */
        $_lang = substr(LANG, 0, 2);
        switch ($_lang)
        {
            case 'sc':
                $lang = 'zh_cn';
            break;
            case 'tc':
                $lang = 'zh';
            break;
            case 'en':
                $lang = 'en';
            break;
            default:
                $lang = 'zh_cn';
            break;
        }
                $str = <<<EOT
$include_js
<script type="text/javascript">
var ue = UE.getEditor('{$name}');
</script>
EOT;



        return $this->_view->fetch('str:' . $str);;
    }
