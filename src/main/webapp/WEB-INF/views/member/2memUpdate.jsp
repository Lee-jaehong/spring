<%@page import="javax.websocket.SendResult"%>
<%@page import="com.idev.boot.dao.EmailSend"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell-up 회원정보 수정</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/snsJoin_style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/deleteModal.css">
</head>

<body>
<script type="text/javascript">
	var alerty = '<c:out value="${ alerty }" />';
	if (alerty != "") {
		alert(alerty);
	}
</script>
<div style="width: 40%; margin: auto;">
	<div style="text-align: center;">
		<h3>Sell-up 회원정보 수정</h3>
	</div>	
		<!-- *** name 속성은 값을 위한 변수명, id 속성은 태그 구별을 위한 변수명 -->
		<form name="frmUpdate" method="post" action="memSave.do">
			<table style="width: 100%">
				<tr>
					<th>회원 ID (이메일 형식)<br><small id="id_val"></small></th>
					<td>
						<div style="padding-top: 15px;">
							<input type="text" name="id" id="id" value="${ member.id }" style="width: 50%;" readonly="readonly">
						</div>
					</td>
				</tr>
				<tr>			<!-- 비밀번호 변경 만들기 -->
					<th>비밀번호<br><small id="pw_val"></small></th>
					<td>
						<input type="button" value="비밀번호 변경" onclick="passChange()">
					</td>
				</tr>
				<tr>
					<th>이름<br><small id="name_val"></small></th>
					<td><input type="text" value="${ member.name }" name="name" id="name" style="width: 40%;">
					</td>
				</tr>
				<tr>
					<th>닉네임<br><small id="nic_val"></small></th>
					<td><input type="text" name="nickname" value="${ member.nickname }" id="nickname" style="width: 40%;">
					<input type="button" value="중복체크" id="check_nick" onclick="nickCheck()">
					</td>
				</tr>
				<tr>
					<th>나이<br><small id="age_val"></small></th>
					<td><input type="number" name="age" value="${ member.age }" id="age" min="14" max="99"
						 style="width: 10%; text-align: right;"> 세</td>
				</tr>
				<tr>
					<th>생년월일<br><small id="birth_val"></small></th>
					<td><input type="date" name="birth" value="${ member.birth }" id="birth" readonly="readonly"></td>
				</tr>
				<tr>
					<th>성별<br><small id="gen_val"></small></th> 
					<td>
					<span id="optgender">
					    <input type="hidden" id="gender">
						<input type="radio" value="male" name="gender" 
					    <c:if test="${ member.gender == 'male' }">
					    checked='checked'
					    </c:if>
					    id="male" onclick="return(false);">
						<label for="male">남자</label> 
						<input type="radio" value="female" name="gender" 
					    <c:if test="${ member.gender == 'female' }">
					    checked='checked'
					    </c:if>	
					    id="female" onclick="return(false);">					
						<label for="female">여자</label>
						<input type="radio" value="unknown" name="gender" 
					    <c:if test="${ member.gender == 'unknown' }">
					    checked='checked'
					    </c:if>		
					    id="unknown" onclick="return(false);">				
						<label for="unknown">선택안함</label>
					</span>
					</td>
				</tr>
				<tr>
					<th>주소<br><small id="addr_val"></small></th>
					<td>
						<input type="text" name="addr" id="addr" value="${ member.addr }" style="width: 50%;">
						<br><small style="font-size: 0.7em; color: black;">예시 : 경기도 수원시 / 서울시 강남구</small>
					</td>
				</tr>
				<tr>
					<th>프로필 사진 변경<br><small id="up_val"></small></th>
					<td>
						<div style="font-size: 0.7em;">
							현재 파일명 : ${ member.profile_file }
							<!-- <input type="text" name="profile_file" id="profile_file"> -->
							<input type="file" name="profile_file" id="profile_file">
						</div>	
					</td>
				</tr>
				<tr style="border-top: 0px solid;">
					<td colspan="2" style="text-align: center">
					<input type="button" value="수정하기" onclick='validForm()'>
					<input type="button" value="홈으로" onclick='location.href="../"'>
					<input type="button" value="회원탈퇴" onclick="document.getElementById('myModal').style.display='block'"></td>
				</tr>

			</table>
		</form>
	</div>
<%@ include file="deleteModal.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/memUpdate_valid.js"></script>

</body>
</html>


















