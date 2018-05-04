package com.bilin.crm.common;

import com.bilin.crm.domain.User;

public class UserUtils {
	private static ThreadLocal<User> local = new ThreadLocal<User>();

	public UserUtils()
	{
	}

	public static void setUser(User User)
	{
		local.set(User); 
	}

	public static void removeLocal()
	{
		local.remove(); 
	}

	public static synchronized User getCurrentUser()
	{
		User user = (User)local.get();
		if (user == null)
			return null;
		return user;
	}
}
