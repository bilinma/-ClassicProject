package com.bilin.crm.service;

import java.util.List;

import com.bilin.crm.domain.Order;

public interface IOrderService {

	void deleteOrder(Long id);

	int saveOrder(Order order);

	List<Order> getOrderList(String searchValue);

}
