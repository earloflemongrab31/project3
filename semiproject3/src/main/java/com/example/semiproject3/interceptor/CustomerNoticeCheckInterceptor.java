package com.example.semiproject3.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.example.semiproject3.constant.SessionConstant;

public class CustomerNoticeCheckInterceptor implements HandlerInterceptor{

  @Override
  	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
  			throws Exception {
	  
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

