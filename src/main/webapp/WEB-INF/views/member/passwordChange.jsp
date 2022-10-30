<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell-up 회원 비밀번호 변경</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/snsJoin_style.css">
</head>

<body>
	<form action="changing.do" method="post" name="frmPass" style="text-align: center; padding-top: 30px;">
		<div>
			<input type="hidden" value="${ member.id }" name="id" id="id">
			<input type="hidden" value="${ member.pw }" name="pw" id="pw">
			<div id="newpass">
			새로운 비밀번호는 영문자 1개 이상, 숫자 1개 이상, 특수문자 1개 이상
			<br>반드시 포함되어야 하며, 8자 이상이어야 합니다.</div>  <!-- 유효성 검사 오류시 출력할 내용 표시 -->
			<br><input type="password" name="newpw" 
				id="newpw" oninput="pwCheck()" placeholder="새로운 비밀번호" style="width: 200px;">
			<br><small id="pw_checker"></small>		
		</div>
			<!-- 파라미터를 받아올 때는 name..!! -->
		<div style="padding-top: 10px;">
			<input type="password" id="newpw2" 
			placeholder="새로운 비밀번호 확인"  style="width: 200px;" oninput="pwOK()">
			<br><small id="newpass2"></small>
		</div>
		<div>
			<input type="button" id="passChange" value="패스워드 변경">
			<input type="button" value="취소" onclick="self.close()">
		</div>
	</form>
</body>
<script src="${pageContext.request.contextPath}/resources/js/memUpdate_valid.js"></script>
<script type="text/javascript">
	// 비밀번호 변경 js
	document.querySelector('#passChange').addEventListener('click', function() {
		console.log(document.querySelector('#pw').value);
		console.log(document.querySelector('#newpw').value);
		console.log(document.querySelector('#id').value);
		
		document.forms[0].submit();
		// 미해결 : 창이 안닫힘..
		function close() {
			self.close();
		}
		setTimeout(close, 5000);
	});


	// ?? 뭔지 모르겠음
	function lock() {
		var mid = document.querySelector('#mid').value;
		var i;
		
		var url = 'admin/lock?id' + mid + '&authority=' + i;
		
		location.href = url;
	}
</script>

</html>