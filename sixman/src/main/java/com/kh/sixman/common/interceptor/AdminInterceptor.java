package com.kh.sixman.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.sixman.member.vo.MemberVo;

public class AdminInterceptor implements HandlerInterceptor{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		if(loginMember != null && "3".equals(loginMember.getAuthorizeNo())) {
			return true;
		}
		
		request.setAttribute("code", "ERR");
		request.setAttribute("errorMsg", "access restrictionn");
		request.setAttribute("title", "해당 페이지의 접근 권한이 부족합니다.");
		request.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(request, response);
		return false;
	}

}
