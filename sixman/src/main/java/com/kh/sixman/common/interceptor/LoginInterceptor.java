package com.kh.sixman.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.sixman.member.vo.MemberVo;

public class LoginInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		if(loginMember != null) {
			return true;
		}
		session.setAttribute("msg", "로그인이 필요합니다.");
		response.sendRedirect(request.getContextPath());
		return false;
	}

}
