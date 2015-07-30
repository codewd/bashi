package com.mewin.cfg;

/**
 * @author wangdong
 */
public class Configuration {

	private static int pageSize;
	
	public static String keywords = "";
	public static String description = "";
	
	public static String[] STUDENTLIST = {"姓名","专业","毕业学校","学历","出生年月"};
	public static String[] CLIENTLIST = {"姓名","职位","公司","地址","手机号"
											,"电话","传真","邮箱","QQ号","微信","备注"
										};

	static {
		pageSize = 12;
	}

	public static int getPageSize() {
		return pageSize;
	}

}
