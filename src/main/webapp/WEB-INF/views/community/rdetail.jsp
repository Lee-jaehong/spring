<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/freeboard.css"> 
<meta charset="UTF-8">
<script type="text/javascript">
//메인글 삭제 확인
	function deleteOk(admin_board_id){
		var yn= confirm( '글을 삭제하시겠습니까?');
		
		if(yn==true){
			location.href='rdelete?admin_board_id='+admin_board_id;
		}
	}
</script>
<%@ include file="../header.jsp" %>
</head>
<br>
<h2 style="text-align: center;">신고글 수정</h2>
<br>
 <table style="width:50%;margin:auto;">
 	<tr><td width="20%" class="td1">제목</td>
 		<td class="input1">${bean.title}</td>
 		<td class="td1">작성자</td>
 		<td class="input1">${bean.id}</td>
 	</tr>
 	<tr>
 		<td class="td1">작성날짜</td>
 		<td class="input1">
 		<fmt:parseDate pattern="yyyy-MM-dd" value="${bean.wdate }" var="wdate"/>
 		<fmt:formatDate value="${wdate }" type="both"/>
 		</td>
 	</tr>
 	<tr><td class="td1">내용</td> 
 		<td class="input1" colspan="3"style="text-align: left;">
		<div class="content1" style="height: 200px;">
 		<pre>${bean.content }</pre> 
 		</div>   <!-- 엔터,탭,기호 등 텍스트 그대로 출력할 때 사용 -->
 		</td>
 	</tr>
 	<tr>
 		<td class="td1">첨부 이미지</td>
 		<td><a href="http://localhost:8082/uploads/${bean.filename }"><img src="/uploads/${bean.filename}" width="400px" height="400px" style="object-fit:cover"></a></td>
 		</tr>
 	<tr><td colspan="4" align="center"><br>
 	<a class="button" type="submit" onclick="javascript:deleteOk(${bean.admin_board_id });">삭제</a>
 	<a class="button" href="rlist">목록</a><br><br><br>
 	</td></tr>
 </table>
</body>
</html>