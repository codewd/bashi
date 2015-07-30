package com.mewin.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.mewin.entity.User;

public class SessionListener implements HttpSessionListener {

	public void sessionCreated(HttpSessionEvent se) {
		User user = (User)se.getSession().getAttribute("user");
//		System.out.println(user.getAccount());
		System.out.println("sessionCreated");
	}

	public void sessionDestroyed(HttpSessionEvent se) {
		User user = (User)se.getSession().getAttribute("user");
//		System.out.println(user.getAccount());
		System.out.println("sessionDestroyed");
	}

}
