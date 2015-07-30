package com.mewin.test;

import java.lang.reflect.Field;
import java.util.Date;

import com.mewin.entity.*;

public class EntityUtil {
	
	public static void main(String[] args) {
		
		Class clazz = User.class;
		
		Field[] fs = clazz.getDeclaredFields();
		
		System.out.println("<class name=\""+clazz.getSimpleName()+"\">");
		
		for(Field f:fs){
			String s = "";
			String name = f.getName();
			
			if(name.equals("id")){
				s+= "<id name=\"id\"><generator class=\"native\"/></id>";
				System.out.println(s);
				continue;
			}
			
			s += "<property name=\""+name+"\"";
			
			if(f.getType() == String.class){
				s += " length=\"15\"/>";
			}else if(f.getType() == Date.class){
				s += " type=\"date\"/>";
			}else if(f.getType() == long.class){
				s += " />";
			}else if(f.getType() == int.class){
				s += " />";
			}else if(f.getType() == double.class){
				s += " />";
			}
			
			System.out.println(s);
			
			
		}
		
		System.out.println("</class>");
		
		
		
	}

}
