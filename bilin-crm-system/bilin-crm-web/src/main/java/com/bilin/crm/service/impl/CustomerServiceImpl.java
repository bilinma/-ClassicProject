package com.bilin.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bilin.crm.dao.CustomerMapper;
import com.bilin.crm.domain.Customer;
import com.bilin.crm.service.ICustomerService;
import com.bilin.crm.vo.CustomerCondition;

@Service
@Transactional(readOnly = true)
public class CustomerServiceImpl implements ICustomerService {

	@Autowired 
	private CustomerMapper customerMapper;

	@Override
	public List<Customer> getCustomerList(CustomerCondition customerCondition) {
		return customerMapper.getCustomerList(customerCondition);
	}

	@Override
	public int getCustomerListCount(CustomerCondition customerCondition) {
		return customerMapper.getCustomerListCount(customerCondition);
	}
	
	
	@Override
	@Transactional(readOnly = false,rollbackFor=Exception.class)
	public int saveCustomer(Customer customer) {
		return customerMapper.insert(customer);
	}

	@Override
	@Transactional(readOnly = false,rollbackFor=Exception.class)
	public void deleteCustomer(Long id) {
		customerMapper.deleteByPrimaryKey(id);
	}

	@Override
	public List<Customer> getCustomerSelectList() {
		return customerMapper.getCustomerSelectList();
	}

}
