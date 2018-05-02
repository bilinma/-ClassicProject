package com.bilin.crm.service;

import java.util.List;

import com.bilin.crm.domain.Customer;

public interface ICustomerService {

	public List<Customer> getCustomerList(String searchValue);

	public int saveCustomer(Customer customer);

	public void deleteCustomer(Long id);

}
