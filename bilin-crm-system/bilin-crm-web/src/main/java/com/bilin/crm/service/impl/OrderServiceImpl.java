package com.bilin.crm.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bilin.crm.domain.Order;
import com.bilin.crm.service.IOrderService;

@Service
@Transactional(readOnly = true)
public class OrderServiceImpl implements IOrderService {

	@Override
	public void deleteOrder(Long id) {
		// TODO Auto-generated method stub

	}

	@Override
	public int saveOrder(Order order) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Order> getOrderList(String searchValue) {
		// TODO Auto-generated method stub
		return null;
	}

}
