package com.mewin.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mewin.entity.User;

public class LoginFilter implements Filter {

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		User user = (User) ((HttpServletRequest) request).getSession()
				.getAttribute("user");
		if (user == null) {

			String path = ((HttpServletRequest) request).getContextPath();
			String basePath = request.getScheme() + "://"
					+ request.getServerName() + ":" + request.getServerPort()
					+ path + "/";
			((HttpServletResponse) response).sendRedirect(basePath
					+ "user_loginUI.htm");
		} else {
			doFilter(request, response, chain);
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

}
