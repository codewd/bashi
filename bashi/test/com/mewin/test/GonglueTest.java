package com.mewin.test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.mewin.entity.Address;
import com.mewin.entity.Gonglue;
import com.mewin.service.AddressService;
import com.mewin.service.GonglueService;

public class GonglueTest {
	private ApplicationContext ac = new ClassPathXmlApplicationContext(
			"applicationContext.xml");

	AddressService as = (AddressService) ac.getBean("addressServiceImpl");
	GonglueService gs = (GonglueService) ac.getBean("gonglueServiceImpl");
	@Test
	public void t1() {
		
		Address a = as.getById(2l);
		System.out.println(a.getName());
		List<Gonglue> list = gs.getListByAddress(a);
		
		System.out.println(list.size());
		
	}

}
