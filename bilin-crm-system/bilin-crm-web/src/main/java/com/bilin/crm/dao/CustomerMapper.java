package com.bilin.crm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bilin.crm.domain.Customer;

public interface CustomerMapper extends BaseMapper<Customer>{

	public List<Customer> getCustomerList(@Param("searchValue")String searchValue);
}