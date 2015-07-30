package com.mewin.test;

import java.util.List;

import net.sf.json.JSONArray;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.mewin.entity.User;
import com.mewin.service.UserService;

public class JsonTest {
	private ApplicationContext ac = new ClassPathXmlApplicationContext(
			"applicationContext.xml");

	@Test
	public void t1() {
		UserService us = (UserService) ac.getBean("userServiceImpl");
		
		List<User> list = us.getBySQL("select * from user");
		
		JSONArray js = JSONArray.fromObject(list);
		
		
		System.out.println(js);
		
	}

}
