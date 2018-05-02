package com.bilin.crm.dao;

import java.util.List;

import com.bilin.crm.domain.Order;

public interface OrderMapper extends BaseMapper<Order>{

    public List<Order> selectByCustomerId(Long id);

}