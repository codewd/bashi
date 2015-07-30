package com.mewin.interceptor;

import com.mewin.entity.Admin;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class LoginTimeout implements Interceptor {
	

	public void destroy() {
	}

	public void init() {
	}

	public String intercept(ActionInvocation invocation) throws Exception {
		
		Admin admin = (Admin) ActionContext.getContext().getSession().get("admin");
		if(admin != null){
			
//			//加载初始化数据
//			ActionContext.getContext().put(
//					"notices",noticeService.getNotice(user.getAccount()));
//					//"notices",noticeService.getByFileds(new Object[]{user.getAccount()}, "getUser"));
//			
			
			return invocation.invoke();
		}
		ActionContext.getContext().put("msg","登陆超时，请重新登陆");
		return "login_ui";
	}

}
