package com.khfinal.devstairs.user.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		    throws Exception {
			//세션 객체 생성
			HttpSession session = request.getSession();
			// 세션에 login 없다면
			if(session.getAttribute("login")==null) {
				//로그인페이지로 이동
				response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out_equals = response.getWriter();
	            out_equals.println("<script>alert('세션값이없네요. 로그인해주세요');</script>");
				response.sendRedirect(request.getContextPath()+"/index.jsp");
				out_equals.flush();
				return false;
			}else {
				return true;
			}
		
		
		}
	@Override
	public void postHandle(
			HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)
			throws Exception {
	}
}
