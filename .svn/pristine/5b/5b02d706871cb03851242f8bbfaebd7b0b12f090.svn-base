<?php

/* 专题页面 specialpage */

class SpecialpageModel extends BaseModel
{
    var $table  = 'specialpage';
    var $prikey = 'spec_id';
    var $alias  = 'specialpage';
    var $_name  = 'specialpage';
    var $_relation = array(
        // 一个专题页面对应多个商品
        'specialpage_has_goods' => array(
            'model'         => 'goods',
            'type'          => HAS_AND_BELONGS_TO_MANY,
            'foreign_key'   => 'spec_id',
            'middle_table'  => 'specialpage_goods',
            'alias'         => 'sgoods',
            'reverse'       => 'goods_belongs_specialpage'
        ),
    );

    var $_autov = array(
        'name' => array(
            'required'  => true,    //必填
            'min'       => 1,       //最短1个字符
            'max'       => 255,     //最长255个字符
            'filter'    => 'trim',
        ),
        'description' => array(
            'filter'    => 'trim',
        ),
        'starttime' => array(
            'required'  => true,    //必填
        ),
        'endtime' => array(
            'required'  => true,    //必填
        ),
    );
}

?>