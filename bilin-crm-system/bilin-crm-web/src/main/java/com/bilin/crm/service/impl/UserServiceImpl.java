package com.bilin.crm.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bilin.crm.dao.IUserMapper;
import com.bilin.crm.domain.User;
import com.bilin.crm.service.IUserService;
import com.bilin.crm.utils.MD5Util;

@Service
@Transactional(readOnly = true)
public class UserServiceImpl implements IUserService {
	@Autowired 
	private IUserMapper userMapper;
	
	@Override
	public User getUser(String userCode, String passWord) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userCode", userCode.toUpperCase());
		paramMap.put("password",MD5Util.MD5(passWord));
		return userMapper.selectLoginUser(paramMap);
	}

}
