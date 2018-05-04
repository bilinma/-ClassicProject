package com.bilin.crm.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
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
import com.bilin.crm.utils.DateUtils;
import com.bilin.crm.vo.OrderCondition;
import com.bilin.crm.vo.OrderVo;

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
		List<Customer> dataList = customerService.getCustomerList(null);
		model.addAttribute("customerList", dataList);
		return "order/orderManageMain";
	}

	
	
	//前台做定义时 注意：把系统表放在最前面 序号为0 其它表序号从1开始
	@RequestMapping(value = "/getOrderList") 
	@ResponseBody
	public Object getOrderList(OrderCondition orderQuery) throws Exception { 
		Map<String,List<OrderVo>> map = new HashMap<String, List<OrderVo>>(); 
		List<Order> dataList = orderService.getOrderList(orderQuery);
		
		List<OrderVo> orderVoList = new ArrayList<OrderVo>();
		if(dataList!=null&&!dataList.isEmpty()){
			for(Order order : dataList){
				OrderVo orderVo = new OrderVo();
				BeanUtils.copyProperties(order, orderVo);
				orderVo.setCreateTime(DateUtils.formatDate(DateUtils.LONG_DATE, order.getCreateTime()));
				orderVoList.add(orderVo);
			}
		}
		map.put("result", orderVoList);
		return map; 
	}
	
	@RequestMapping(value = "/saveOrderData") 
	@ResponseBody
	public Map<String, Object> saveOrderData(Order order) {
		Map<String, Object> retMap = new HashMap<String, Object>();
		try{
			//JSONObject jsonObject = JSONObject.fromObject(rowDataRecord); 
			//Map<String, Object> objMap = (Map<String, Object>)JSONObject.toBean(jsonObject, Map.class);
			order.setCreateTime(new Date());
			int retMsg = orderService.saveOrder(order);
			retMap.put("successFlag", true);
			retMap.put("retMsg", retMsg);
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
	
	@RequestMapping(value = "/getNextOrderSeq") 
	@ResponseBody
	public Integer getNextOrderSeq() {
		Integer orderSeq = 1;
		try{
			orderSeq = orderService.getNextOrderSeq();
			if(orderSeq==null){
				orderSeq = 1;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return orderSeq;
	}
	
}
