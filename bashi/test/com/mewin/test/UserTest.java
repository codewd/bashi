package com.mewin.test;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.mewin.entity.User;
import com.mewin.service.UserService;

public class UserTest {
	private ApplicationContext ac = new ClassPathXmlApplicationContext(
			"applicationContext.xml");

	UserService us = (UserService) ac.getBean("userServiceImpl");
	@Test
	public void t1() {
		
		System.out.println(us.getByFiled("k2", "account").getName());
		
	}
	@Test
	public void t2() {
		User user = new User();
		
		user.setAccount("wd10");
		user.setPsw("123456");
		System.out.println(us.login(user));
	}

}
