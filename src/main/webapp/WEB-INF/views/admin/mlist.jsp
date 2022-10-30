<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/rlist.css">
<title>회원관리</title>
</head>
<body>

<%@ include file="../header.jsp" %>
<br>
<h2 style="text-align: center">회원목록</h2>
<div style="margin:auto;">
	<table>
		<tr>
			<th>이름</th>
			<th>닉네임</th>
			<th>아이디</th>
			<th>회원분류</th>
		</tr>
		 <c:forEach var="vo" items="${list }"> 
		<tr>
			<td>${vo.name }</td>
			<td>${vo.nickname }</td>
			<td>${vo.id }</td>
			<td><button type="button" onclick="lock('${vo.id}')">정지</button>
			&nbsp;&nbsp;&nbsp;<button type="button" onclick="opena('${vo.id}')">해제</button></td>
		</tr>
		</c:forEach>
	</table>
</div>
<script type="text/javascript">
	function lock(id){
		alert('정지 되었습니다.');
		location.href = './lock?id=' + id;
	}
	function opena(id){
		alert('정지 해제되었습니다.');
		location.href = './op?id=' + id;
	}
</script>
</body>
</html>