package com.mewin.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class Number {
	
	/**
	 * 生成订单号  年月日+1-4位随机数
	 * @return 订单号
	 */
	public static String order(){
		return new SimpleDateFormat("yyMMddHHmmss").format(new Date())+new Random().nextInt(100000%10001);
	}

}
