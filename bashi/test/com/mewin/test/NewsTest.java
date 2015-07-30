package com.mewin.test;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.mewin.entity.News;
import com.mewin.entity.Type;
import com.mewin.service.NewsService;
import com.mewin.service.TypeService;

public class NewsTest {
	private ApplicationContext ac = new ClassPathXmlApplicationContext(
			"applicationContext.xml");
	NewsService ns = (NewsService) ac.getBean("newsServiceImpl");
	TypeService ts = (TypeService) ac.getBean("typeServiceImpl");

	@Test
	public void t1() {
		Type t = new Type();
		
		News n = new News();
		n.setTitle("sss");
		
		n.setType(ts.getById(1l));
		
		ns.save(n);
		
	}
	@Test
	public void t2() {
		System.out.println(ns.getById(1l).getType().getTitle());
	}
	@Test
	public void t3() {
		
		Type t= ts.getById(2l);
		List<News> l = ns.getNewsByType(t);
		
		System.out.println(l.get(0).getTitle());
	}
	@Test
	public void t4() {
		Type t= ts.getById(8l);
		System.out.println(ns.getTop3(t).size());
	}

}
