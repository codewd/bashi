package com.mewin.interceptor;

import java.util.Map;

import com.mewin.entity.Admin;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;

public class LoginInterceptor {
	
	    public String intercept(ActionInvocation invocation) throws Exception {  
	  
	        // 取得请求相关的ActionContext实例  
	        ActionContext ctx = invocation.getInvocationContext();  
	        Map session = ctx.getSession();  
	        Admin admin = (Admin) session.get("admin");  
	  
	        // 如果没有登陆，或者登陆所有的用户名不是yuewei，都返回重新登陆  
	  
	        if (admin != null ) {  
	            return invocation.invoke();  
	        }  
	  
	        ctx.put("msg", "你还没有登录");  
	        return "login_ui";  
	  
	    }  
}
