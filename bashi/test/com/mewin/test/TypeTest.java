package com.mewin.test;

import java.util.HashSet;
import java.util.Set;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.mewin.entity.Type;
import com.mewin.service.TypeService;

public class TypeTest {
	private ApplicationContext ac = new ClassPathXmlApplicationContext(
			"applicationContext.xml");

	@Test
	public void t1() {
		TypeService ts = (TypeService) ac.getBean("typeServiceImpl");
		
		Type t = new Type();
		t.setTitle("网络部");
		ts.save(t);
		Set set = new HashSet();
		set.add(t);
		Type t1 = ts.getById(1L);
		t1.setChilds(set);
		ts.update(t1);
		
		
	}

}
