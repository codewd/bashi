package com.mewin.test;

import java.util.Queue;
import java.util.Stack;
import java.util.concurrent.LinkedBlockingQueue;

import org.junit.Test;

/**
 * 日期加减法测试
 * @author wangdong
 */
public class DatePSTest {
	@Test
	public void t1(){
		Stack<String> s = new Stack<String>();
		s.push("1");
		s.push("2");
		s.push("3");
		s.push("4");
//		s.pop();
		s.pop();
		
		for(String x: s){
			System.out.println(x);
		}
		
	}
	@Test
	public void t2(){
		Queue<String> s = new LinkedBlockingQueue<String>();
		s.offer("1");
		s.offer("2");
		s.offer("3");
		
		
		for(String str : s){
			System.out.println(str);
		}
		
	}
}
