<?php
/* 商家子部门*/

class Store_sectModel extends BaseModel
{
    public $table = 'store_sect';
    public $prikey = 'id';
    public $alias = 'stsct';

    public $_relation = array(

    );

    /**
     * 取得分类列表
     *
     * @param int $parent_id 大于等于0表示取某分类的下级分类，小于0表示取所有分类
     * @param bool $shown 只取要显示的分类
     * @return array
     */
    public function get_list($company_id,$parent_id = -1, $shown = false)
    {
        $conditions = "1 = 1";
        // $parent_id >= 0 && $conditions .= " AND parent_id = '$parent_id' AND company_id = '$company_id'";
        $parent_id >= 0 ? $conditions .= " AND parent_id = '$parent_id' AND store_id = '$company_id'" : $conditions .= " AND store_id = '$company_id'";

        $shown && $conditions .= " AND if_show = 1";

        return $this->find(array(
            'conditions' => $conditions,
            'order' => 'sort_order, id',
        ));
    }

    function get_layer($id, $cached = false)
    {
        $ancestor = $this->get_ancestor($id, $cached);
        if (empty($ancestor))
        {
            return false; //分类不存在或不显示
        }
        else
        {
            return count($ancestor);
        }
    }
    function get_ancestor($id, $cached = false)
    {
        $res = array();

        if ($cached)
        {
            $data = $this->_get_structured_data();
            if ($id > 0 && isset($data[$id]))
            {
                while ($id > 0)
                {
                    $res[] = array('id' => $id, 'sectname' => $data[$id]['name']);
                    $id    = $data[$id]['pid'];
                }
            }
        }
        else
        {
            while ($id > 0)
            {
                $sql = "SELECT id, sectname, parent_id FROM {$this->table} WHERE id = '$id'";
                $row = $this->getRow($sql);
                if ($row)
                {
                    $res[] = array('id' => $row['id'], 'sectname' => $row['sectname']);
                    $id    = $row['parent_id'];
                }
            }
        }

        return array_reverse($res);
    }

    public function drop($conditions, $fields = '')
    {
        $this->clear_cache();

        return parent::drop($conditions, $fields);
    }


    function _get_structured_data()
    {
        $cache_server =& cache_server();
        $key  = 'store_category_' . $this->id;
        $data = $cache_server->get($key);
        if ($data === false)
        {
            $data = array(0 => array('cids' => array()));

            $cate_list = $this->get_list(2,-1, true);                       //暂时
            foreach ($cate_list as $id => $cate)
            {
                $data[$id] = array(
                    'name' => $cate['name'],
                    'pid'  => $cate['parent_id'],
                    'cids' => array()
                );
            }

            foreach ($cate_list as $id => $cate)
            {
                $pid = $cate['parent_id'];
                isset($data[$pid]) && $data[$pid]['cids'][] = $id;
            }

            $cache_server->set($key, $data, 1800);
        }

        return $data;
    }

    function clear_cache()
    {
        $cache_server =& cache_server();
        $keys = array('store_category_' . $this->id);
        foreach ($keys as $key)
        {
            $cache_server->delete($key);
        }
    }



    public function unique($cate_name, $parent_id, $cate_id = 0)
    {
        $conditions = "parent_id = '$parent_id' AND sectname = '$cate_name'";
        $cate_id && $conditions .= " AND id <> '" . $cate_id . "'";
        return count($this->find(array('conditions' => $conditions))) == 0;
    }





}



?>