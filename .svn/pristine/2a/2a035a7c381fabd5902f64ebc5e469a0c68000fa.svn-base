<?php

class ConsumerserviceModel extends BaseModel
{
    var $table  = 'consumer_service';
    var $prikey = 'c_id';
	var $alias  = 'cs';
    var $_name  = 'consumerservice';

    var $_relation  = array(
        // 一个消费者服务只能属于一个店铺
        'belongs_to_store' => array(
            'model'         => 'store',
            'type'          => BELONGS_TO,
            'foreign_key'   => 'store_id',
            'reverse'       => 'has_consumerservice',
        ),
    );
	
	/**
     * 取得信息
     */
    function get_info($c_id)
    {
        $info = $this->get(array(
            'conditions' => $c_id,
            'join'       => 'belongs_to_store',
            'fields'     => 'this.*,store.store_name, store.owner_name',
        ));

        return $info;
    }
}

?>