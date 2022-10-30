<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>동아리 커뮤니티</title>
<script type="text/javascript">
function post_data() {
	//var subject = frm1.subject.value;  //유효성 검사
	frm1.submit();
}
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/freeboard.css">
</head>
<body>
<%@ include file="../header.jsp" %>
<h3>동아리 커뮤니티 글 수정</h3>
<hr>
<form name="frm1" method="post" action="update">
 <input type="hidden" name="timeline_board_id" value="${bean.timeline_board_id }">

 <table>
 	
 	<tr><td class="td1">작성자</td>
 		<td class="left"><input type="text" name="id" value="${bean.id}" size="70" class="input1" disabled></td>
 	</tr>
 	<tr><td class="td1">내용</td>  <!-- textarea 의 크기 : rows="20" cols="80" -->
 		<td class="left"><textarea  rows="20" cols="80" name="content" class="input1" required="required">${bean.content}</textarea></td>
 	</tr>
 	<tr><td colspan="2" align="center">
 	<input type="submit" value="저장" class="btnGreen">
 	<!-- <a class="button" href="javascript:post_data();">저장</a> -->
 	<input type="reset" class="btnGreen" value="다시쓰기">
 	<input type="button" class="btnGreen" onclick="location.href='list'" value="목록">
 	</td></tr>
 </table>
 </form>
</body>
</html>