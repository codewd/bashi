package com.mewin.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;


/**
 * 读取 properties 文件
 * @author wangdong
 * 说明：properties 文件 必须和源码是同一个目录
 */
public class PropertiesUtil {
	
	/**
	 * 读取 properties 文件
	 * @param c 
	 * @param key 
	 * @return
	 * @throws IOException
	 */
	public static String read(Class c,String key) throws IOException{
		InputStream in = c.getResourceAsStream("field.properties");  
		Properties p = new Properties();  
		p.load(in); 
		String result = p.getProperty(key);
		in.close();
		return result;
	}
	
}
