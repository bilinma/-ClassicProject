package com.bilin.crm.dao;

import java.util.Map;

import com.bilin.crm.domain.User;

public interface IUserMapper extends BaseMapper<User>{

	public User selectLoginUser(Map<String, Object> paramMap);

}
