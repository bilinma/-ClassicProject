package com.bilin.crm.dao;

import java.util.List;

import com.bilin.crm.domain.Order;
import com.bilin.crm.vo.OrderCondition;

public interface OrderMapper extends BaseMapper<Order>{

	public Integer getNextOrderSeq();

	public List<Order> getOrderList(OrderCondition orderQuery);

	public int getOrderListCount(OrderCondition orderCondition);

}