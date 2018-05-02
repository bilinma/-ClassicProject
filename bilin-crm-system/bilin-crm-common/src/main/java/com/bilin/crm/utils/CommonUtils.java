package com.bilin.crm.utils;

import java.util.Date;
import java.util.Random;

public class CommonUtils {
	
	public static String getOrderNo() throws Exception{
		String orderNo = DateUtils.formatDate("yyyyMMddHHmmss", new Date());
		Random random = new Random();
		for(int i=0;i<3;i++){
			orderNo += random.nextInt(10);
		}
		return orderNo;
	}

	public static void main(String[] args) throws Exception{
		System.out.println(getOrderNo());
	}
	
	
}
