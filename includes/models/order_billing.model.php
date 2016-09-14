<?php

/* 订单商品 ordergoods */
class Order_BillingModel extends BaseModel
{
	public $table  = 'order_billing';
    public $prikey = 'user_id';
    public $alias  = 'obill';
    public $_name  = 'order_billing';
    public $_relation = array(
        'belongs_to_user'  => array(
            'type'          => HAS_ONE,
            'reverse'       => 'has_billings',
            'model'         => 'member',
            'foreign_key'	=> 'user_id',
        ),
    );
}
?>