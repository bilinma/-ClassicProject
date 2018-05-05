package com.bilin.crm.vo;

import com.bilin.crm.request.PageRequest;

public class CustomerCondition extends PageRequest {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5155325966118481664L;

	private String searchValue;

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	
	
}
