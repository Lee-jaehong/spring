<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 상세보기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/gallery.css?v=3">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/freeboard.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/modal.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

</head>
<body>  
<%@ include file="../header.jsp" %>
	<div class="slideshow-container">  <!-- css 파일참고 -->
		<div id="item1">
		<c:forTokens items="${bean.filename }" var="vo" varStatus="main" delims=",">
			<div class="mySlides fade" style="margin: auto;">
				<img src="/uploads/${vo}" width="400px" height="400px" style="object-fit:cover">
			</div>
		</c:forTokens>
		<div style="text-align:center;padding-top: 30px;">
			<c:forTokens items="${bean.filename }" var="vo" varStatus="main" delims=",">
			  <span class="dot" onclick="currentSlide(1,${main.count})"></span>
			</c:forTokens>
		</div>	
		<div><a class="LikeBtn">
		<c:if test="${like == 1 }"> <img alt="heart" id="heart" src="${pageContext.request.contextPath}/resources/image/fullheart.png" style="width:30px; height: 30px;">
		</c:if>
		<c:if test="${like == 0 }"> <img alt="heart" id="heart" src="${pageContext.request.contextPath}/resources/image/heart.png" style="width:30px; height: 30px;">
		</c:if>
		<c:if test="${member == null }"> <img alt="heart" id="heart" src="${pageContext.request.contextPath}/resources/image/heart.png" style="width:30px; height: 30px;">
		</c:if>
		</a>
		<a href="${pageContext.request.contextPath}/chat/room?userid=${member.id }&fromId=${member.id }&toId=${bean.id }"><img alt="채팅" src="${pageContext.request.contextPath}/resources/image/chat.jpg"style="width:30px; height: 30px;"> </a>
		<a href="javascript:rmodalSet()"><img class="report" alt="리폿" src="${pageContext.request.contextPath }/resources/images/report.png" style="width:30px; height: 30px;"></a>
		</div>
		<div><b>조회수 ${bean.view_count } 회</b></div>
		<div><b id="heart_c">좋아요 ${bean.heart_count } 개</b></div>
		<div><b>${nick}</b> ${bean.content}</div>
		
		</div>
		<a class="prev" onclick="plusSlides(1,-1)">&#10094;</a> 
		<a class="next" onclick="plusSlides(1,1)">&#10095;</a>
		<br>
		<div style="margin-left: 10%;">
		<c:if test="${member.id== bean.id}">
		<a class="button" href="update?timeline_board_id=${bean.timeline_board_id }">수정</a>
 		<a class="button" onclick="javascript:deleteOk(${bean.timeline_board_id});">삭제</a>
 		</c:if>
		<a class="button" href="list">목록</a>
		</div>
	</div>
 	<br><br><br>
 <!-- 메인글 출력 끝 -->
 <!-- 댓글 시작 -->
 <!-- 댓글 입력 -->
 <!-- 요청파라미터 action은 get , 다른 input 요소는 post 메소드로 전송 -->
 
 <form action="comment?action=insert" method="post" name="frmCmt"><!-- 댓글 입력  , 추가 : 댓글수정과 삭제 -->
 <input type="hidden" name="timeline_board_id" value="${bean.timeline_board_id }">  <!-- 메인글의 idx -->
 <input type="hidden" name="id" class="input1" value="${bean.id }">
 <table style="width:60%;margin: auto;">
 	<tr><td colspan="4">댓글 갯수 : ${bean.comment_count }
 		<input type="button" onclick="window.location.reload()" value="새로고침" class="btn-small">
 		<!--  또는 window.location.reload() :history.go(0)현재페이지로 url 재요청-->
 	</td>
 	</tr>
 	<tr><td colspan="4"><hr></td></tr>
 	<tr>
 		<td colspan="3">  <!-- 크기조절불가 : style="resize: none;" -->
 			<textarea rows="5" cols="80" name="content"  style="resize: none;" placeholder="댓글을 작성하세요." class="input1"></textarea>
 		</td>
 		<td width="15%" style="text-align: left;">
 			<input type="submit" value="저장" class="btn-small"><br><br>
 			<input type="reset" value="취소" class="btn-small">
 		</td>
 	</tr>
 	<tr><td colspan="4"><hr></td></tr>
 	<!-- 댓글 출력  -->
 	<c:forEach var="cmt" items="${cmtlist}">
 		<tr>
 			<td colspan="4" style="text-align: left;">
 	<div id="comment" style="width: 60%; margin: auto;">
 			<div>
			 <span class="name">
			 <c:out value="${cmt.id }"/>
			 </span>				
 			 <span class="now">
 			 <fmt:parseDate pattern="yyyy-MM-dd" value="${cmt.wdate }" var="reDate"/>
 			 <span style="float: right;">
 			 <fmt:formatDate value="${reDate }" pattern="yyyy-MM-dd"/></span>  <!-- 출력패턴 -->
 			 </span>
 				<c:if test="${member.id== bean.id}">
	 			 <span style="float: right;">  <!-- span은 부모영역의 오른쪽으로 정렬  -->
	 			 <c:set value="${pageContext.request.contextPath}/resources/image" var="image" />
	 			 <a href="javascript:deleteCmt(${cmt.tcomment_id },${bean.timeline_board_id })" style="cursor: pointer;text-decoration: none;">
		 			 	<img src="${image}/delete.png" alt="삭제" style="width:20px;"><small>삭제</small> 
		 		 </a>
	 			 </span>
	 			 </c:if>
 			
 			 </div>
 			 <div style="padding-top: 10px;padding-bottom: 40px;">  <!-- 댓글 내용 -->
 		<%-- 	 	<pre>${cmt.content}<br></pre> --%> 
		 		<c:set var="content" value="${fn:replace(cmt.content,cr,'<br>')}" />   <!--개행문자를 <br>로 바꾸기  -->
 			 	<c:out value="${content}" escapeXml = "false"/>
 			 </div>
 	</div>
 			</td>
 		</tr>
 	</c:forEach> 
 </table>
 </form>

 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/gallery.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/community.js"></script>
  <script type="text/javascript">


 $('.LikeBtn').click(function(){
		likeupdate();
	});
 let likeval = ${like};
 const likeval2 =${like}
 function likeupdate(){

	
	let board_no = ${bean.timeline_board_id};
	let user_no = `${member.id}`;
	if(likeval > 0){
		console.log(likeval + "좋아요 누름");
		

			$.ajax({
				type :'post',
				url : '<c:url value ="/community/likeDown"/>',
				contentType: 'application/json',
				data : JSON.stringify(
						{
							"board_no" : board_no,
							"id" : user_no
						}		
					),
				success : function(data) {
					alert('좋아요 취소 성공');
				}
			})// 아작스 끝
			document.getElementById('heart').src= '../resources/image/heart.png'
			count();
			likeval = 0;
			

	}else{
		console.log(likeval + "좋아요 안누름")
		console.log(user_no);
		
			$.ajax({
				type :'post',
				url : '<c:url value ="/community/likeUp"/>',
				contentType: 'application/json',
				data : JSON.stringify(
						{
							"board_no" : board_no,
							"id" : user_no
						}		
					),
				success : function(data) {
					alert('좋아요 성공');
				}
			})// 아작스 끝
			document.getElementById('heart').src= '../resources/image/fullheart.png'
			count();
			likeval=1;
			
			}
	}
 function count(){
	 if(likeval2 == 1 && likeval == 1){
		 document.getElementById('heart_c').innerHTML = `좋아요 ${bean.heart_count-1} 개`;
	 }else if(likeval2 == 1 && likeval == 0) {
		 document.getElementById('heart_c').innerHTML = `좋아요 ${bean.heart_count} 개`;
	 }else if(likeval2 == 0 && likeval == 0){
		 document.getElementById('heart_c').innerHTML = `좋아요 ${bean.heart_count+1} 개`;
	 }else if(likeval2 == 0 && likeval == 1){
		 document.getElementById('heart_c').innerHTML = `좋아요 ${bean.heart_count} 개`;
	 }
	 }
 

 
 
 </script>

<%@ include file="../common/modal.jsp" %>
</body>
</html>









