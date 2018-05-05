package com.bilin.crm.web;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bilin.crm.common.UserUtils;
import com.bilin.crm.domain.Customer;
import com.bilin.crm.domain.Order;
import com.bilin.crm.domain.User;
import com.bilin.crm.service.ICustomerService;
import com.bilin.crm.service.IOrderService;
import com.bilin.crm.utils.CommonUtils;
import com.bilin.crm.vo.OrderCondition;

@Controller
@RequestMapping(value = "/order")
public class OrderController {
	
	
	@Autowired
	private IOrderService orderService; 
	@Autowired
	private ICustomerService customerService; 
	
	@RequestMapping("init")
	public String forwardConfigMain(HttpServletRequest request,Model model) {
		User user  = UserUtils.getCurrentUser();
		request.setAttribute("roleCode", user.getRoleCode());
		List<Customer> dataList = customerService.getCustomerSelectList();
		model.addAttribute("customerList", dataList);
		return "order/orderManageMain";
	}
	
	@RequestMapping(value = "/getOrderList") 
	@ResponseBody
	public Object getOrderList(OrderCondition orderCondition) throws Exception {
		orderCondition.setStratRow();
		List<Order> dataList = orderService.getOrderList(orderCondition);
		int totalRecords = orderService.getOrderListCount(orderCondition);
		Map<String,Object> map = new HashMap<String, Object>(); 
		map.put("totalRecords", totalRecords);
		map.put("result", dataList);
		return map; 
	}
	
	@RequestMapping(value = "/saveOrderData") 
	@ResponseBody
	public Map<String, Object> saveOrderData(Order order) {
		Map<String, Object> retMap = new HashMap<String, Object>();
		try{
			order.setCreateTime(new Date());
			order.setOrderStatus(1);
			order.setBackStatus(1);
			orderService.saveOrder(order);
			retMap.put("successFlag", true);
			retMap.put("retMsg", "保存成功！");
		}catch(Exception e){
			e.printStackTrace();
			retMap.put("successFlag", false);
			retMap.put("retMsg", e.getMessage());
			return retMap;
		}
		return retMap;
	}
	
	@RequestMapping(value = "/deleteOrder") 
	@ResponseBody
	public String deleteOrder(@RequestParam(value = "id", required=true)Long id) {
		try{
			orderService.deleteOrder(id);  
		}catch(Exception e){
			e.printStackTrace();
			return e.getMessage();
		}
		return "success";
	}
	
	@RequestMapping(value = "/getOrderNo") 
	@ResponseBody
	public String getOrderNo() {
		String orderNo="";
		try{
			orderNo = CommonUtils.getOrderNo();
		}catch(Exception e){
			e.printStackTrace();
			return e.getMessage();
		}
		return orderNo;
	}
	
	@RequestMapping(value = "/getOrderByOrderNo") 
	@ResponseBody
	public Order getOrderByOrderNo(String orderNo) {
		Order order = orderService.getOrderByOrderNo(orderNo);
		return order;
	}
	
	@RequestMapping(value = "/getNextOrderSeq") 
	@ResponseBody
	public Integer getNextOrderSeq() {
		Integer orderSeq = 1;
		try{
			orderSeq = orderService.getNextOrderSeq();
			if(orderSeq==null){
				orderSeq = 1;
			}else{
				orderSeq += 1;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return orderSeq;
	}
	
}
