<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="../resources/css/header2.css">
</head>
<body>
	<div class="container">
		<header>
		<div class="logotab">
		<a href="${pageContext.request.contextPath }/community/list"><img class="logo" alt="로고" src="${pageContext.request.contextPath }/resources/images/logo.png"></a>
		<div class="dropdown">
		<button class="dropbtn"><img class="ddicon" alt="드롭다운" src="${pageContext.request.contextPath }/resources/images/down.png"></button>
			<div class="dropdown-content">
				<a href="${pageContext.request.contextPath }/community/list">피드</a>
				<a href="#">중고</a>
			</div>
		</div>
		</div>
			<nav>
		<div class="navbar">
        <form class="search" action="" method="post">
          <input style="border-radius: 5px;" name="searchVal" type="text" placeholder="    검색..." 
				class="searchBox" required>
        </form>		
				<button class="searchButton">
				<img class="searchicon" alt="검색" src="${pageContext.request.contextPath }/resources/images/searchicon.png"></button>
        <div class="smenu">
        <a href="${pageContext.request.contextPath }/community/insert"><img class="upload" alt="업로드" src="${pageContext.request.contextPath }/resources/images/upload.png"></a>
        <a href="${pageContext.request.contextPath }/chat/messageBox?userid=${member.id}"><img class="chat" alt="채팅" src="${pageContext.request.contextPath }/resources/images/chat.png"></a>
        <a><img class="cart" alt="카트" src="${pageContext.request.contextPath }/resources/images/cart.png"></a>
         <c:if test="${member.id == null }">
        <a href="${pageContext.request.contextPath }/login"><img class="login" alt="로그인" src="${pageContext.request.contextPath }/resources/images/login.png"></a>
        </c:if> 
        <c:if test="${member.id != 'tt@naver.com' and member.id != null}">
        <div class="dropdown">
        <a class="dropbtn" href="#"><img class="profile" name="filename" alt="프로필" src="/uploads/${member.profile_file }"></a>
        	<div class="dropdown-cnt">
				<a href="#">마이페이지</a>
				<a href="${pageContext.request.contextPath }/community/rlist">내 신고</a>
				<a href="${pageContext.request.contextPath }/logout">로그아웃</a>
			</div>
        </div>
        </c:if>
        <c:if test="${member.id == 'tt@naver.com'}">
        <div class="dropdown">
        <a class="dropbtn" href="#"><img class="profile" alt="프로필" src="${pageContext.request.contextPath }/resources/images/admin.png"></a>
        	<div class="dropdown-cnt">
				<a href="${pageContext.request.contextPath }/admin/mlist">관리자 페이지</a>
				<a href="${pageContext.request.contextPath }/community/rlist2">신고 목록 확인</a>
				<a href="${pageContext.request.contextPath }/logout">로그아웃</a>
			</div>
        </div>
        </c:if>
        </div>
        </div>
			</nav>
		</header>
	</div>
	<hr>
	
</body>
</html>