package com.idev.boot.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

import com.idev.boot.dto.Member;

public class LoginInterceptor implements HandlerInterceptor {
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	//로그인 여부 - 세션 체크 - 검사하여 요청처리하기에 인터셉터 활용
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		logger.info("login interceptor : {}" ,request.getRequestURL());
		HttpSession session = request.getSession();		// 세션 불러오기
		Member member = (Member) session.getAttribute("member");	
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();		// 내장 객체를 쓸 수 있게 함
		if(member == null) {		// 로그인이 안된 상태
			session.setAttribute("url", request.getRequestURL().toString());	// url을 저장후 StringBuffer타입을 투스트링으로 문자열로 변환
			out.print("<script>");
			out.print("alert('로그인이 필요합니다.');");
			out.print("location.href='"+request.getContextPath()+"/login'");	// 로그인 url로 가라
			out.print("</script>");
			out.flush();
			out.close();
			return false;		//handler 메소드로 제어(실행)가 이동되지 않습니다.
		}else {
			return true;
		}
	}
}
