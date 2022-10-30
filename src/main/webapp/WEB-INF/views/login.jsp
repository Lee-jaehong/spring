<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">

<script type="text/javascript">
	function goHome() {
		location.href='./';		/* 요청 url 변경 */
	}
	
	function findid(){
		location.href = 'member/find_id_Form.do';
	}
</script>
</head>
<body>
<script>
		var alertm='<c:out value="${alertm}" />'
		if(alertm!="")
			alert(alertm);
</script>
<div id="login_div">
	<div style="text-align: center;">
		<img alt="Sell-up LOGO" src="${pageContext.request.contextPath }/resources/images/logo.png"
			style="width: 400px; float: left;">
	</div>	
	<div style="padding-top: 15%;">
	<form action="login" method="post">
		<div style="padding-bottom: 5px;">
		<label for="id" style="padding-right: 15px;">아이디</label>
		<button type = "button" id = "find_id" onclick = "findid()">아이디 찾기</button><br>
		</div>
		<input class="box" type="text" name="id" id="id" placeholder="이메일" required="required">
		<br><br>
		<div style="padding-bottom: 5px;">
		<label for="pw">패스워드</label><br>
		</div>
		<input class="box" type="password" name="pw" id="pw" placeholder="패스워드" required="required"><br><br>
		<button class="but" type="submit">로그인</button> 
		<button class="but" type="button" onclick="goHome()">홈</button> 
	</form>
	</div>
</div>

</body>
</html>