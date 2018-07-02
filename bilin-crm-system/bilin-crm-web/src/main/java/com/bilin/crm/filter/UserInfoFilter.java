package com.bilin.crm.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bilin.crm.common.UserUtils;
import com.bilin.crm.domain.User;

public class UserInfoFilter implements Filter {
	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		Cookie[] cookies = request.getCookies();
		String access_token = getValueByCookie(cookies, "access_token");
		System.out.println(access_token);
		
		HttpServletResponse response = (HttpServletResponse) res;
		User userDTO = (User) request.getSession().getAttribute("loginUserInfo");
		if (userDTO == null) {
			// 判断是否ajax请求
			if (request.getHeader("x-requested-with") == null) {
				// 跳转登录页面
				if (!request.getRequestURI().equals(request.getContextPath() + "/login.do")) {
					if (!request.getRequestURI().equals(request.getContextPath() + "/relogin.do")) {
						response.sendRedirect(request.getContextPath() + "/relogin.do");
					}
				}
				filterChain.doFilter(request, response);
			} else {

			}
		} else {
			request.getSession().setAttribute("loginUserInfo", userDTO);
			UserUtils.setUser(userDTO);
			filterChain.doFilter(req, res);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {

	}

	
	private static String getValueByCookie(Cookie[] cookies, String name) {
		if ((null != cookies) && (cookies.length > 0)) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie cookie = cookies[i];
				if (cookie.getName().equalsIgnoreCase(name)) {
					return cookie.getValue();
				}
			}
		}

		return null;
	}
}
