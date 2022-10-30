<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
</head>
<body>
	<div class="container">
		<header>
		<div>
		<a href="list"><img class="logo" alt="로고" src="${pageContext.request.contextPath }/resources/images/logo.png"></a>
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
        <a><img class="chat" alt="채팅" src="${pageContext.request.contextPath }/resources/images/chat.png"></a>
        <a><img class="cart" alt="카트" src="${pageContext.request.contextPath }/resources/images/cart.png"></a>
         	<a href="${pageContext.request.contextPath }/login"><img class="profile" alt="로그인" src="${pageContext.request.contextPath }/resource/images/profile.jpeg"></a>
        </div>
        </div>
			</nav>
		</header>
	<hr>
	</div>
	
</body>
</html>