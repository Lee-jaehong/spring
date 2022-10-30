<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	img{
		 border-radius: 40%;
		 width: 65px;
		 height: 65px;
	}
	h5{
		font-size: small;
	}
	tr:hover{		filter: brightness(50%); }
	input#toId{
	  width: 400px;
	  height: 43px;
	 background: #ffffff;
	  font-size: 12pt;
	  color: #63717f;
	  padding-left: 45px;
	  -webkit-border-radius: 5px;
	  -moz-border-radius: 5px;  
	  border-radius: 5px;  
	}	
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
</head>
<body>
<%@ include file="../header.jsp" %>
<h2 style="text-align: center; padding: 8px; ">채팅함</h2>
<form action="searchMessage" method="get">
	<div style="text-align: center; margin-top: 40px; margin-bottom: 40px; ">
	<input type="text" name="toId" id="toId" placeholder="검색">
	<input type="hidden" id="userid" name="userid" value="${member.id }"></div>
</form>

<table style="margin: auto;">
	<c:forEach var="lists" items="${list }">
		<c:if test="${lists.fromId == userid }">
		<tr onclick="location.href='room?userid=${userid}&fromId=${userid }&toId=${lists.toId}';">
			<td style="width: 60px;">
				<c:forEach var="picture" items="${pictures }">
					<c:if test="${picture.id != userid && picture.id == lists.toId}">
						<img alt="프사" src="/uploads/${picture.profile_file }">
					</c:if>
				</c:forEach>
			</td>
			<td style="width: 400px;">
				<!-- 상대방Id 보여주기 -->
				<h4 style="padding-left: 30px; ">${lists.toId } 님</h4>
				<h5 style="padding-left: 30px; padding-bottom: 10px;">${lists.content }</h5>
			</td>		
			<td><div style="text-align: right;"><span style="font-size: small;">${lists.chatTime }</span></div></td>
		</tr>
		</c:if>
		<c:if test="${lists.fromId != userid }">
		<tr onclick="location.href='room?userid=${userid}&fromId=${userid }&toId=${lists.fromId}';">
			<td style="width: 60px;">
				<c:forEach var="picture" items="${pictures }">
					<c:if test="${picture.id != userid && picture.id == lists.fromId}">
						<img alt="프사" src="/uploads/${picture.profile_file }">
					</c:if>
				</c:forEach>
			</td>
			<td style="width: 400px;">
				<!-- 상대방Id 보여주기 -->				
				<h4 style="padding-left: 30px;">${lists.fromId } 님</h4>
				<h5 style="padding-left: 30px; padding-bottom: 10px;">${lists.content }</h5>
			</td>		
			<td><div style="text-align: right;"><span style="font-size: small;">${lists.chatTime }</span></div></td>
		</tr>
		</c:if>
	</c:forEach>
</table>

</body>
</html>