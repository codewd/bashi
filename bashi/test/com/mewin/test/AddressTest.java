package com.mewin.test;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.mewin.entity.Address;
import com.mewin.entity.Type;
import com.mewin.service.AddressService;

public class AddressTest {
	private ApplicationContext ac = new ClassPathXmlApplicationContext(
			"applicationContext.xml");

	AddressService as = (AddressService) ac.getBean("addressServiceImpl");
	@Test
	public void t1() {
		
		List<Address> list = as.getFather();
		
		int len = list.size();
		
		List<Object> ss = new LinkedList<Object>();
		
		String[] son1 = null;
		for(Address a :list){
			Set<Address> set = a.getChilds();
			Iterator<Address> iter = set.iterator();
			son1 = new String[set.size()];
			
			int i = 0;
			while(iter.hasNext()){
				son1[i] = iter.next().getName();i++;
			}
			
			ss.add(son1);
		}
		
		for(Object s : ss){
			
			String[] aaa = (String[]) s;
			
			for(String str : aaa){
				System.out.print(str+";");
			}
			
			System.out.println();
		}
		
	}
	@Test
	public void t2() {
		Address a = new Address();
		a.setName("test");
		as.save(a);
	}
	@Test
	public void t3() {
		Address a = new Address();
		a.getFather().setId(1l);
//		a.s
	}
	@Test
	public void t4() {
		Address a = as.getById(1l);
		
		List<Address> l = as.getChild(a);
		for(Address a1 : l){
			System.out.println(a1.getName());
		}
	}
	

}
