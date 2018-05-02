package com.bilin.crm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bilin.crm.dao.CustomerMapper;
import com.bilin.crm.domain.Customer;
import com.bilin.crm.service.ICustomerService;

@Service
@Transactional(readOnly = true)
public class CustomerServiceImpl implements ICustomerService {

	@Autowired 
	private CustomerMapper customerMapper;

	@Override
	public List<Customer> getCustomerList(String searchValue) {
		return customerMapper.getCustomerList(searchValue);
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
	
}
