package com.taffle.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.taffle.pojo.User;

public class ServerInterceptor implements HandlerInterceptor{
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
	}
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		// 获取session当前用户
		HttpSession session = request.getSession();
		Object loginer = session.getAttribute("loginer");
		if(loginer == null) {
			response.sendRedirect("/taffle_project/login");
			return false;
		}
		// 非系统管理员跳转到客户端index首页
		User user = (User)loginer;
		if(!user.getUserAlice().equals("系统管理员")) {
			response.sendRedirect("/taffle_project/");
			return false;
		}
		return true;
	}
}
