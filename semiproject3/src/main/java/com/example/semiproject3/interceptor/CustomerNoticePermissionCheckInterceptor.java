package com.example.semiproject3.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.example.semiproject3.constant.SessionConstant;

@Component
public class CustomerNoticePermissionCheckInterceptor implements HandlerInterceptor{

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//회원검사기보다 늦게 실행시킬 예정이므로 이 검사기에는 회원만 들어온다
		//(목표) 관리자가 아닌 회원이 공지사항을 등록하려고 하면 차단
		//1. 관리자인지 아닌지 검사 - 관리자면 통과
		//2. 1번이 아니라면 noticeHead라는 파라미터 값이 "공지"이면 차단, 아니면 허용
		
		//만약 POST방식이 아니라면 통과
		if(!request.getMethod().equals("POST")) {
			return true;
		}
		
		//1
		HttpSession session = request.getSession();
		//String memberGrade = (String)session.getAttribute("mg");
		String GRADE = (String)session.getAttribute(SessionConstant.GRADE);
		if(GRADE.equals("관리자")) {
			return true;
		}
		
		//2
		String noticeHead = request.getParameter("noticeHead");
		if(noticeHead != null && !noticeHead.equals("공지")) {
			return true;
		}
		
		//나머지는 다 차단
		response.sendError(403);
		//response.sendError(HttpServletResponse.SC_FORBIDDEN);
		return false;
	}
}
