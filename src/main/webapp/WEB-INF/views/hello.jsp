<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  쿠키 읽어오기 입니다. 콘솔창 확인!! </P>
<a href="community/list">커뮤니티</a>
<!-- 404오류는 요청 url과 컨트롤러의 매핑 url 일치하는지 확인하세요. -->
<p>세션 애트리뷰트 출력 테스트 : ${sessionScope.sessview }</p>
</body>
</html>

<!-- JSESSIONID : 처음 요청시 서버가 값을 생성하여 클라이언트 브라우저에 전달(저장) ->세션쿠키
	 다음번 다른 요청 떄 JSESSIONID가 서버에게 전달되며 서버는 이값을 비교하여 동일한 세션인지
     새로운 세션인지 비교해서 처리. -> 로그인할때 사용해 왔음.(인증)    
-->