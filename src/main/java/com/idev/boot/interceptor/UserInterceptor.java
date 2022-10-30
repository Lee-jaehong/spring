package com.idev.boot.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

import com.idev.boot.dto.Member;

public class UserInterceptor implements HandlerInterceptor {
	private static final Logger logger = LoggerFactory.getLogger(UserInterceptor.class);

	//로그인 여부 - 세션 체크 - 이미 로그인 되어있는 상태에서는 접근을 못하게 하기 위함.(로그인, 회원가입 등등)
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("user interceptor : {}" ,request.getRequestURL());
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(member != null) {
			out.print("<script>");
			out.print("alert('이미 로그인이 되었습니다.');");
			out.print("location.href='"+request.getContextPath()+"/'");
			out.print("</script>");
			out.flush();
			out.close();
			return false;		//handler 메소드로 제어(실행)가 이동되지 않습니다.
		}else {
			return true;
		}
	}
}
