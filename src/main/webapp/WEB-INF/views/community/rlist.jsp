<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/rlist.css">
<title>내 신고 목록</title>
</head>
<body>
	<script>
		var alertm='<c:out value="${alertm}" />'
		if(alertm!="")
			alert(alertm);
	</script>
<%@ include file="../header.jsp" %>
<br>
<c:if test="${member.id == 'tt@naver.com'}">
<h2 style="text-align: center">신고 목록</h2>
</c:if>
<c:if test="${member.id != 'tt@naver.com' and member.id != null}">
<h2 style="text-align: center">신고 목록</h2>
</c:if>
<div style="margin:auto;">
	<table>
		<tr>
			<th>작성일</th>
			<th>제목</th>
			<th>신고내용</th>
		</tr>
		 <c:forEach var="vo" items="${list }"> 
		<tr>
			<td><fmt:parseDate pattern="yyyy-MM-dd" value="${vo.wdate }" var="wdate"/>
 		<fmt:formatDate value="${vo.wdate }" type="both"/>
			<td><a href="rdetail?admin_board_id=${vo.admin_board_id }" class="title">${vo.title }</a></td>
			
			<td>${vo.content }...<span style="color:gold; font-size: 80%;"></span></td>
		</tr>
		</c:forEach>
	</table>
</div>
<br>
 <c:if test="${page.findText==null}">
 <div style="text-align: center;">
	<a class="pagenum" href="?page=1">&lt;&lt;</a>   <!-- 요청url은 동일하고 파라미터만 변경됩니다. -->
	<a class="${page.startPage>1? 'pagenum':'none'}" href="?page=${page.startPage-1 }">&lt;</a>  
	<!-- 현재페이지값을 변경 : blists.getStartPage() -1 -->
	
	<c:forEach var="i" begin="${page.startPage }" end="${page.endPage}">  <!-- 페이지목록의 범위  -->
		<a class="pagenum" href="?page=${i}">${i}</a>     <!-- 현재페이지 i값으로 변경  -->
	</c:forEach>
	
	<!-- 현재페이지값을 변경 : blists.getEndPage() +1 -->
	<a class="${page.endPage!=page.totalPage? 'pagenum':'none'}" href="?page=${page.endPage+1 }">&gt;</a> 
	<a class="pagenum" href="?page=${page.totalPage }">&gt;&gt;</a>
</div>
</c:if>
<!-- 페이지 이동 :검색결과 보기 -->
 <c:if test="${page.findText!=null}">
 <div style="text-align: center;">
	<a class="pagenum" href="?page=1&field=${page.field}&findText=${page.findText}">&lt;&lt;</a>   <!-- 요청url은 동일하고 파라미터만 변경됩니다. -->
	<a class="${page.startPage>1? 'pagenum':'none'}" href="?page=${page.startPage-1 }&field=${page.field}&findText=${page.findText}">&lt;</a>  
	<!-- 현재페이지값을 변경 : blists.getStartPage() -1 -->
	
	<c:forEach var="i" begin="${page.startPage }" end="${page.endPage}">  <!-- 페이지목록의 범위  -->
		<a class="pagenum" href="?page=${i}&field=${page.field}&findText=${page.findText}">${i}</a>     <!-- 현재페이지 i값으로 변경  -->
	</c:forEach>
	
	<!-- 현재페이지값을 변경 : blists.getEndPage() +1 -->
	<a class="${page.endPage!=page.totalPage? 'pagenum':'none'}" href="?page=${page.endPage+1 }&field=${page.field}&findText=${page.findText}">&gt;</a> 
	<a class="pagenum" href="?page=${page.totalPage }&field=${page.field}&findText=${page.findText}">&gt;&gt;</a>
</div>
</c:if>
<script type="text/javascript">
    	const sel = document.querySelectorAll("#field > option");  
    	sel.forEach(function(item){
    	//sel은 배열, item 은 sel 배열 요소	
    		if(item.value=='${page.field}'){
    			item.selected='selected';
    		}
    	});
    	const text = document.querySelector("#findText"); 
    	const find = '${page.findText}'
    	if(find != "")  
    		text.value = find;
    </script>
</body>
</html>