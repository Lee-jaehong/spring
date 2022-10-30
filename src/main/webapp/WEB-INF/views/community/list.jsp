<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>동아리 커뮤니티</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/gallery.css?v=3">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/freeboard.css">

</head>
<body>
<%@ include file="../header.jsp" %>
<div>
 	<c:forEach items="${list }" var="vo" varStatus="main">
	<div class="slideshow-container">  <!-- css 파일참고 -->

		<div id="item${main.count }" style = "border: 1px solid gray; border-radius: 30px; padding: 30px">
		<c:forEach items="${vo.filename }" var="pic" varStatus="stat">
			<!-- 업로드한 3개의 파일명을 리스트로 애트리뷰트에서 가져오기 -->
			<div class="mySlides fade" style="margin: auto;">
				<%-- <div class="numbertext">${stat.count} / </div> --%>
				<a href="detail?timeline_board_id=${vo.timeline_board_id}">
				<img src="/uploads/${pic}" width="400px" height="400px" style="object-fit:cover; border-radius: 30px"></a>
			</div>
		</c:forEach>
		<!-- Next and previous buttons -->
		<div style="text-align:center;padding-top: 30px;">
			<c:forEach items="${vo.filename }" var="no" varStatus="stat">
			  <span class="dot" onclick="currentSlide(${main.count },${stat.count})"></span>
			</c:forEach>
			
		</div>
		<div style="margin-left: 5%">
		<div><b>조회수 ${vo.view_count } 회</b></div>
		<div><b>좋아요 ${vo.heart_count } 개</b></div>
		<div><b>${vo.nickname}</b> ${vo.content}</div>
		</div>
		</div>
		
		<a class="prev" onclick="plusSlides(${main.count },-1)">&#10094;</a> 
		<a class="next" onclick="plusSlides(${main.count },1)">&#10095;</a>
	</div>
	
	</c:forEach>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/gallery.js"> </script>

</body>
</html>








