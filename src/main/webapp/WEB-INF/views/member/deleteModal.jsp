<%@page import="com.idev.boot.dao.SnsMemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<!-- modal : alert, confirm 함수 사용하지 않고 추가적인 정보를 받을 때 사용자가 만드는 입력 상자 -->
	<div id="myModal" class="modal" style="display: none;">
		<!-- Modal content : 모달 입력창 -->
		<div class="modal-content">
			<!-- 기존 id와 pw 가져오기 -->	
			<input type="hidden" id="session_id" value="${ member.id }">
			<input type="hidden" id="session_pw" value="${ member.pw }">
			<span class="close" id="close">&times;</span><br>   <!-- 특수기호 코드 &times;는 x기호 -->
			<div style="padding: 0px 20px; text-align: center;">
				<b>Sell-up 회원 탈퇴</b><br>
				<p>Sell-up 회원 탈퇴는<br>아이디와 비밀번호 확인이 필요합니다.</p>
				<br>
					<div>
						아이디 : 
						<input type="text" style="width: 200px;" name="moid" id="moid" placeholder="아이디 입력">
					</div>
					<div>
						비밀번호 : 
						<input type="password" style="width: 200px;" name="pw" id="pw" placeholder="비밀번호 입력">
					</div>
					<div>
					<input type="button" value="탈퇴" onclick="memDelete()">
					<input type="button" value="취소" onclick="document.getElementById('myModal').style.display='none'">
					<!-- changePassw()는 ajaxTest.jsp에 있음! -->
					</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	
	// 1006 작성, 회원 탈퇴 비동기 통신 작성
	function memDelete() {
		var isValid = true;
		var id = document.querySelector('#moid').value;
		var pw = document.querySelector('#pw').value;
		var session_id = document.querySelector('#session_id').value;
		var session_pw = document.querySelector('#session_pw').value;
		
		if(id == "" || pw == "") {
			alert('정보를 입력하세요.');
			isValid = false;
			return ;			
		}
		
		if(confirm('정말 탈퇴하시겠습니까?') === true && isValid === true) {
			const xhr = new XMLHttpRequest();
			xhr.open('DELETE', 'delete/' + id + '/' + pw);		
			xhr.send();		// 삭제 보내기
			xhr.onload = function() {
				if(xhr.status == 200) {		// 제대로 보내졌으면
					// xhr.response는 문자열이므로 object 변환 필요
					const data = JSON.parse(xhr.response);
					console.log(data.result);
					console.log(data.message);
					if(data.result == 1) {
						alert('Sell-up 탈퇴 완료. 이용해주셔서 감사합니다.');
						location.href = '../';
					} else {
						alert('탈퇴 오류! 아이디와 비밀번호를 다시 확인해주세요.');
					}
				} else {		// 제대로 보내지지 않았으면
					console.error('error', xhr.status, xhr.statusText);
				}
			}		
		} else {
			alert('탈퇴 취소되었습니다.');
		}
	}
</script>



