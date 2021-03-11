package com.board.controller.commons.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	//페이지 접근권한 시스템
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		//세션을 가져온다 (가져올 세션이 없으면 생성)
		HttpSession httpSession =request.getSession();
		
		//로그인 세션값이 null인 경우 실행
		if (httpSession.getAttribute("login") == null) {
			logger.info("로그인하지 않았습니다");
			//로그인 페이지로 리다이렉트
			response.sendRedirect("/member/login");
			return false;
		}
		//컨트롤러 호출
		return true;
		
	}
}
