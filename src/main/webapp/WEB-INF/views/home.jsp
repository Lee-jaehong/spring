<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell-up</title>
<style type="text/css">
/* div{
	width:200px;height: 400px;
	border: 1px solid gray;
	padding:50px;
	margin: 100px auto;
} */

th {
	font-size: 1.2em;
	width: 50%;
}

th > a {
	background-color: bisque;
    border-radius: 9px;	
}

.tag {
	text-decoration: none;
	color: black;	
}
</style>
</head>
<body>
	<script>
		var alertm='<c:out value="${alertm}" />'
		if(alertm!="")
			alert(alertm);
	</script>
<c:if test="${ member != null }">
</c:if>
<%@ include file="header.jsp" %>	

<div style ="width:450px;
	height: 500px;
	border: 4px double gray;
	padding-bottom: 100px;
	margin: 100px auto;">
	<div style="text-align: center;">
	<img alt="Sell-up LOGO" src="${pageContext.request.contextPath }/resources/images/logo.png"
		style="width: 400px;">
	</div>	
<!-- 객체가 null 인지 비교 : 같다(==)는 eq , 같지않다(!=)  ne  -->
<!-- member 애트리뷰는 로그인 성공하면 session 에 저장했다. -->
	<c:choose>    
		<c:when test="${member == null}">  
		<!-- 로그인 안했을 때 메뉴 -->
			<h2 style="color: darkslategray; text-align:center;">SNS / 중고거래 플랫폼 Sell-up</h2>
			<table style="width: 60%; margin: auto; padding-top: 20px;">
				<tr>
					<th><a href="login" class="tag">로그인</a></th>
					<th><a href="register" class="tag">회원가입</a></th>
				</tr>
			</table>
		</c:when>
		<c:otherwise>  
		<!-- 로그인했을 때 메뉴 -->
			<div style="text-align: center;">
				<h3 style="color: darkgreen;">안녕하세요, ${member.nickname}&nbsp;님!</h3>
				<h5 style="color: graytext;">내 계정 : ${member.id}</h5>
				<table style="width: 60%; margin: auto;">
					<tr>
						<th><a href="./member/memUpdate.do" class="tag">내 정보 수정</a></th>
						<th><a href="logout" class="tag">로그아웃</a></th>
					</tr>
				</table>	
			</div>	
		</c:otherwise>
	</c:choose>
</div>

</body>
</html>








