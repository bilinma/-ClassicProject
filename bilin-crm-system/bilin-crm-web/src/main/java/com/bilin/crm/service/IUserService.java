package com.bilin.crm.service;

import com.bilin.crm.domain.User;

public interface IUserService {

	public User getUser(String userCode, String passWord);

}
