package com.bilin.crm.constant;

public enum BackStatus {

	unBackMoney(1,"未返款"),
	waitBackMoney(2,"待返款"),
	backMoney(3,"已返款");
	
	public int code;
	public String desc;
	
	private BackStatus(int code,String desc){
		this.code = code;
		this.desc = desc;
	}
	
}
