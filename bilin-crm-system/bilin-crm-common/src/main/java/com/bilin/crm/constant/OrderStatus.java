package com.bilin.crm.constant;

public enum OrderStatus {

	unPayed(1,"待付款"),
	payed(2,"已付款");
	
	public int code;
	public String desc;
	
	private OrderStatus(int code,String desc){
		this.code = code;
		this.desc = desc;
	}
	
	
}
