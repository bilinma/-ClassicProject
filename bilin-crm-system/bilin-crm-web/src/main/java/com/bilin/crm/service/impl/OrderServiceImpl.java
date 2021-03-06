package com.bilin.crm.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bilin.crm.constant.BackStatus;
import com.bilin.crm.constant.OrderStatus;
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
		Order order = orderMapper.selectByPrimaryKey(id);
		Customer customer = customerMapper.selectByPrimaryKey(order.getCustomerId());
		if(customer!=null){
			customer.setAmountTotal(customer.getAmountTotal()-order.getAmount());
			customerMapper.updateByPrimaryKey(customer);
		}
		orderMapper.deleteByPrimaryKey(id);
	}

	@Override
	@Transactional(readOnly = false,rollbackFor=Exception.class)
	public void saveOrder(Order order) {
		Long orderId = order.getId();
		Order orderDB = null;
		if(orderId!=null&&orderId!=0){
			orderDB = orderMapper.selectByPrimaryKey(orderId);
		}
		if(orderDB!=null){
			order.setCreateTime(order.getCreateTime());
			orderMapper.updateByPrimaryKeySelective(order);
			if(orderDB.getCustomerId().longValue()!=order.getCustomerId().longValue()){
				Customer customerOld = customerMapper.selectByPrimaryKey(orderDB.getCustomerId());
				if(customerOld!=null){
					customerOld.setAmountTotal(customerOld.getAmountTotal()-orderDB.getAmount());
					customerMapper.updateByPrimaryKey(customerOld);
				}
				Customer customerNew = customerMapper.selectByPrimaryKey(order.getCustomerId());
				if(customerNew!=null){
					customerNew.setAmountTotal(customerNew.getAmountTotal()+order.getAmount());
					customerMapper.updateByPrimaryKey(customerNew);
				}
			}else{
				if(orderDB.getAmount().intValue()!=order.getAmount().intValue()){
					Customer customer = customerMapper.selectByPrimaryKey(order.getCustomerId());
					if(customer!=null){
						Integer amountTotal = customer.getAmountTotal()-orderDB.getAmount()+order.getAmount();
						customer.setAmountTotal(amountTotal);
						customerMapper.updateByPrimaryKey(customer);
					}
				}
			}
			
		}else{
			order.setCreateTime(new Date());
			order.setBackStatus(BackStatus.unBackMoney.code);
			orderMapper.insert(order);
			Customer customer = customerMapper.selectByPrimaryKey(order.getCustomerId());
			if(customer!=null){
				Integer amountTotal = customer.getAmountTotal();
				amountTotal =  amountTotal + order.getAmount();
				customer.setAmountTotal(amountTotal);
				customerMapper.updateByPrimaryKey(customer);
			}
			int orderCount = orderMapper.selectCount(null);
			if(orderCount%31==0){
				orderMapper.updateMinUnBackOrder();
			}
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

	@Override
	@Transactional(readOnly = false,rollbackFor=Exception.class)
	public String confirmBackMoney(Long id) {
		String retMsg = "返款成功！";
		Order order = orderMapper.selectByPrimaryKey(id);
		if(order.getOrderStatus().intValue()==OrderStatus.payed.code&&order.getBackStatus()==BackStatus.waitBackMoney.code){
			order.setBackStatus(BackStatus.backMoney.code);
			orderMapper.updateByPrimaryKeySelective(order);
		}else{
			retMsg = "订单未支付或者没到待返款状态！";
		}
		return retMsg;
		
	}

}
