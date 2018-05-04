package com.bilin.crm.web;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bilin.crm.common.UserUtils;
import com.bilin.crm.domain.Customer;
import com.bilin.crm.domain.User;
import com.bilin.crm.service.ICustomerService;
import com.bilin.crm.utils.DateUtils;
import com.bilin.crm.vo.CustomerVo;

@Controller
@RequestMapping(value = "/customer")
public class CustomerController {
	
	
	@Autowired
	private ICustomerService customerService; 
	
	@RequestMapping("init")
	public String forwardConfigMain(HttpServletRequest request,
			HttpServletResponse response) {
		User user  = UserUtils.getCurrentUser();
		request.setAttribute("roleCode", user.getRoleCode()); 
		return "customer/customerManageMain";
	}

	
	
	//前台做定义时 注意：把系统表放在最前面 序号为0 其它表序号从1开始
	@RequestMapping(value = "/getCustomerList") 
	@ResponseBody
	public Object getCustomerList(String searchValue) throws Exception { 
		Map<String,List<CustomerVo>> map = new HashMap<String, List<CustomerVo>>(); 
		List<Customer> dataList = customerService.getCustomerList(searchValue);
		
		List<CustomerVo> customerVoList = new ArrayList<CustomerVo>();
		if(dataList!=null&&!dataList.isEmpty()){
			for(Customer customer : dataList){
				CustomerVo customerVo = new CustomerVo();
				BeanUtils.copyProperties(customer, customerVo);
				customerVo.setCreateTime(DateUtils.formatDate(DateUtils.LONG_DATE, customer.getCreateTime()));
				customerVoList.add(customerVo);
			}
		}
		map.put("result", customerVoList);
		return map; 
	}
	
	@RequestMapping(value = "/saveCustomerData") 
	@ResponseBody
	public Map<String, Object> saveCustomerData(Customer customer) {
		Map<String, Object> retMap = new HashMap<String, Object>();
		try{
			//JSONObject jsonObject = JSONObject.fromObject(rowDataRecord); 
			//Map<String, Object> objMap = (Map<String, Object>)JSONObject.toBean(jsonObject, Map.class);
			customer.setCreateTime(new Date());
			customer.setLevel(1);
			customer.setAmountTotal(0);
			int retMsg = customerService.saveCustomer(customer);
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
	
	@RequestMapping(value = "/deleteCustomer") 
	@ResponseBody
	public String deleteCustomer(@RequestParam(value = "id", required=true)Long id) {
		try{
			customerService.deleteCustomer(id);  
		}catch(Exception e){
			e.printStackTrace();
			return e.getMessage();
		}
		return "success";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/getCustomerSelect")
	public List<Map<String,Object>> getCustomerSelect(){
		List<Customer> dataList = customerService.getCustomerList(null);
		List<Map<String,Object>> retlist = new ArrayList<Map<String,Object>>();
		for(Customer customer : dataList){
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("value", customer.getId());
			map.put("label", customer.getName());
			retlist.add(map);
		}
		return retlist;
	}
	
}
