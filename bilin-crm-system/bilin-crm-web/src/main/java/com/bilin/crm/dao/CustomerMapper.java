package com.bilin.crm.dao;

import java.util.List;

import com.bilin.crm.domain.Customer;
import com.bilin.crm.vo.CustomerCondition;

public interface CustomerMapper extends BaseMapper<Customer>{

	public List<Customer> getCustomerList(CustomerCondition customerCondition);
	
	public int getCustomerListCount(CustomerCondition customerCondition);

	public List<Customer> getCustomerSelectList();
}