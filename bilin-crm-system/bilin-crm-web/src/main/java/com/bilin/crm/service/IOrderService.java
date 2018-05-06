package com.bilin.crm.service;

import java.util.List;

import com.bilin.crm.domain.Order;
import com.bilin.crm.vo.OrderCondition;

public interface IOrderService {

	public void deleteOrder(Long id);

	public void saveOrder(Order order);

	public List<Order> getOrderList(OrderCondition orderQuery);

	public Integer getNextOrderSeq();

	public int getOrderListCount(OrderCondition orderCondition);

	public Order getOrderByOrderNo(String orderNo);

	public String confirmBackMoney(Long id);

}
