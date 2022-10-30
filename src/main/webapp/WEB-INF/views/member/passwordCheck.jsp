<%@page import="com.idev.boot.dao.SnsMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell-up 현재 비밀번호 확인</title>
</head>

<body>
	<div>
		<input type="hidden" name="pw2" id="session_pw" value="${ member.pw }">
		<input type="password" name="pw" id="pw" placeholder="현재 비밀번호">		
		<input type="button" id="pw_ok" value="확인">
	</div>
</body>

<script type="text/javascript">

	// 현재 비밀번호 일치 여부 확인
	document.querySelector('#pw_ok').addEventListener('click', function() {
		var session_pw = document.querySelector('#session_pw').value;
		var pw = document.querySelector('#pw').value;
		
		if(pw != "") {
			const xhr = new XMLHttpRequest();
			xhr.open('POST', './pwCheck_ajax?pw=' + pw);
			xhr.send();
			xhr.onload = function () {
				if(xhr.status == 200) {
					const data = JSON.parse(xhr.response);
					console.log(data.pw);
					if(data.pw == session_pw) {
						alert('현재 비밀번호 일치!');
						// 페이지 이동하기
						location.href = './pwChange.do';
					} else {
						alert('현재 비밀번호 불일치!');
					}
				} else {
					console.error('error', xhr.status, xhr.statusText);
				}	
			} 
		} else {
			alert('비밀번호를 입력하세요.');
		}
	});
	
</script>
</html>