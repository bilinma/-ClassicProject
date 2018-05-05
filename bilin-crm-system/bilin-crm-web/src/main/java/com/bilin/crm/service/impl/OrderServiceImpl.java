package com.bilin.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bilin.crm.dao.CustomerMapper;
import com.bilin.crm.dao.OrderMapper;
import com.bilin.crm.domain.Customer;
import com.bilin.crm.domain.Order;
import com.bilin.crm.service.IOrderService;
import com.bilin.crm.vo.OrderCondition;

@Service
@Transactional(readOnly = true)
public class OrderServiceImpl implements IOrderService {

	@Autowired 
	private OrderMapper orderMapper;
	
	@Autowired 
	private CustomerMapper customerMapper;
	
	@Override
	@Transactional(readOnly = false,rollbackFor=Exception.class)
	public void deleteOrder(Long id) {
		orderMapper.deleteByPrimaryKey(id);
	}

	@Override
	@Transactional(readOnly = false,rollbackFor=Exception.class)
	public void saveOrder(Order order) {
		orderMapper.insert(order);
		Customer customer = customerMapper.selectByPrimaryKey(order.getCustomerId());
		Integer amountTotal = customer.getAmountTotal();
		amountTotal =  amountTotal + order.getAmount();
		customer.setAmountTotal(amountTotal);
		customerMapper.updateByPrimaryKey(customer);
		
		int orderCount = orderMapper.selectCount(null);
		if(orderCount%31==0){
			orderMapper.updateMinUnBackOrder();
		}
	}

	@Override
	public List<Order> getOrderList(OrderCondition orderQuery) {
		return orderMapper.getOrderList(orderQuery);
	}

	@Override
	public int getOrderListCount(OrderCondition orderCondition) {
		return orderMapper.getOrderListCount(orderCondition);
	}
	
	@Override
	public Integer getNextOrderSeq() {
		return orderMapper.getNextOrderSeq();
	}

	@Override
	public Order getOrderByOrderNo(String orderNo) {
		return orderMapper.getOrderByOrderNo(orderNo);
	}

}
