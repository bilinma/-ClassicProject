package com.bilin.crm.service;

import java.util.List;

import com.bilin.crm.domain.Customer;
import com.bilin.crm.vo.CustomerCondition;

public interface ICustomerService {

	public List<Customer> getCustomerList(CustomerCondition customerCondition);
	
	public int getCustomerListCount(CustomerCondition customerCondition);

	public int saveCustomer(Customer customer);

	public void deleteCustomer(Long id);

	public List<Customer> getCustomerSelectList();

}
