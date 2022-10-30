<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<!-- modal : alert,confirm 함수 사용하지 않고 추가적인 정보를 받을 때 사용자가 만드는 입력 상자...-->
	<div id="myModal" class="modal">
		<!-- Modal content : 모달 입력창-->
		<div class="modal-content">
		<span class="close" id="close">&times;</span><br>
		<h3 style="text-align: center;">신고하기</h3>
			<form name="frmReport" method="post" action="${contextPath }/community/report" enctype="multipart/form-data">
			<table class="table" style="width: 50%">
				<tr>
					<th>신고자 ID</th>
					<td><input type="text" name="id" value="${member.id }" readonly="readonly"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<th>신고사유</th>
					<td><textarea class="content" name="content" rows="10" cols="22"></textarea></td>
				</tr>
				<tr>
					<th>이미지 첨부</th>
					<td><input class="file" type="file" name="pics" accept="image/*"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center">
					<input type="submit" value="신고하기"><input type="button" value="취소" onclick="history.back();">
				</tr>
				</table>
				</form>
		</div>
	</div>
<script type="text/javascript">
//모달 입력 상자 닫기
//let close = document.getElementsByClassName('close')[0];	//getElementsXXX 이면 배열 리턴. 그 요소중에 0번 인덱스
const vclose = document.getElementById('close');
vclose.onclick = function(){
	document.getElementById('myModal').style.display='none';
}
function rmodalSet() {
	document.getElementById('myModal').style.display='block';
}
</script>
