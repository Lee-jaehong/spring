<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<title>채팅방</title>
<style type="text/css">
*{
	padding: 0px; margin: 0px;
}
h2{
  position: fixed;
  top: 0;	
  left: 0;
  right: 0;
  background-color: #D3D3D3;
  padding: 20px;
  text-align: center;
  font-weight: bolder;
}
.chat{
	margin-bottom: 100px;
	padding-top: 100px;
}
input[type=text] {
	width: 100%;
	height: 100px;
	text-align:center;
	font-size: large;
	border-top-color: #B0C4DE; 
}
.chatting{
	position : fixed;
	bottom : 1px;
	text-align: center;
 	background-color: #e5e5e5;	
}
.textbox{
	position:static;
	display:block;
    font-size: 20px;
    border-radius: 30px;
	background-color:#DCDCDC;
    padding: 10px;
    margin: 0px;
}
.textboxTime{
	position:static;
	font-size: 20px;
    border-radius: 30px;
    color: black;
}
#rightTime{
	float: right;
	font-size: 20px;
	margin-right: 30px;
}
#right{
	float: right;
	font-size: 20px;
	margin-right: 180px;
}
#leftTime{
	float: left;
	font-size: 20px;
	margin-left: 30px;
}
#left{
	float: left;
	font-size: 20px;
	margin-left: 180px;
}
img{
	width: 50px;
	height: 50px;
	border-radius: 40%;
}
</style>

<script type="text/javascript">
//시작하자마자 바로 실행

$(document).ready(function() {
	Chat_loadNewMessages();
	
	
});

function submitChatMessageForm(form){
	if(form.content.value.length == 0){
		alert('내용을 입력해주세요.');
		form.content.focus();
		return false;
	}
	
	const fromId = document.querySelector('#fromId').value
	const toId = document.querySelector('#toId').value
	const content = document.querySelector('#content').value

	const xhr = new XMLHttpRequest()
	xhr.open('POST','doAddMessage')		//메소드,url (POST 메소드는 데이터 insert)
	xhr.setRequestHeader('content-type','application/json;charset=utf-8')	//보낼데이터형식;인코딩
	//자바스크립트 객체
	var jsob = {"chatId":0,"fromId":fromId,"toId":toId,"content":content}
	console.log(jsob)
	
	xhr.send(JSON.stringify(jsob))		
	xhr.onload= function(){	
		if(xhr.status === 200) {
			console.log(xhr.response)		//비동기 통신 응답 xhr.response
			Chat_loadNewMessages();
			
		}else{
			console.error('error',xhr.status,xhr.statusText)
		}  
	}
	form.content.value='';
	return false;
}


function Chat_loadNewMessages(){

	$('#chat').empty();

	const fromId = document.querySelector('#fromId').value
	const toId = document.querySelector('#toId').value
	const userid = document.querySelector('#userid').value

	
	$.get(
		'./getMessage',
		{
			fromId:fromId,
			toId : toId,
		},
		function(data){
 			const lists = data.result
 			
 			if(lists == null){
 				return "";
 			}else{
 				lists.forEach(function(ele){
 					
 					if(userid == ele.fromId){	  //보내는 사람이 나면 오른쪽에 표시			
 						html = ele.content;
 						html2 = ele.chatTime.substr(11, 8);
 						obj = document.getElementById('chat');
 						
 						newdiv = document.createElement("div")
 						newdiv2 = document.createElement("div")
 						br1 = document.createElement("br")
 						br2 = document.createElement("br")
 						newdiv.id = 'right'
 						newdiv.className = 'textbox'
 						newdiv2.id = 'rightTime'
 						newdiv2.className = 'textboxTime'
 						
 						newdiv.innerHTML = html
 						newdiv2.innerHTML = html2
 						newdiv.style.textAlign = "right"
 						obj.appendChild(newdiv)
 						obj.appendChild(newdiv2)
 						obj.appendChild(br1)
 						obj.appendChild(br2)
 						
 					}else{	 //보내는 사람이 너면 왼쪽에 표시
 						html = ele.content;
 						html2 = ele.chatTime.substr(11, 8);
 						obj = document.getElementById('chat');
 						newdiv = document.createElement("div")
 						newdiv2 = document.createElement("div")
 						br1 = document.createElement("br")
 						br2 = document.createElement("br")
 						
 						newdiv.id = 'left'
 						newdiv.className = 'textbox'
 						newdiv2.id = 'leftTime'
 						newdiv2.className = 'textboxTime'
 						
 						newdiv.innerHTML = html
 						newdiv2.innerHTML = html2
 						newdiv.style.textAlign = "left"
 						obj.appendChild(newdiv)
 						obj.appendChild(newdiv2)
 						obj.appendChild(br1)
 						obj.appendChild(br2)
 					}
 				})			
 			}
		},
	'json'
	);	

	$('html, body').animate({scrollTop:9999},'fast');
};
	
</script>
</head>
<body>

	<!-- param 통하면 바로 가져올 수 있음 -->
	<c:choose>
		<c:when test="${userid == fromId }">
			<h2 id="chatHeader"><img src="/uploads/${picture }">${toId}님<a href="${pageContext.request.contextPath }/chat/messageBox?userid=${member.id}" style="float: right; text-decoration: none; font-size: 0.7em; color: black;">돌아가기</a></h2>
		</c:when>
		<c:when test="${userid == toId}">
			<h2 id="chatHeader"><img src="/uploads/${picture }">${fromId}님<a href="${pageContext.request.contextPath }/chat/messageBox?userid=${member.id}" style="float: right; text-decoration: none; font-size: 0.7em; color: black;">돌아가기</a></h2>
		</c:when>
	</c:choose>
	<hr>
	<div class="chat" id="chat" style="font-size:x-large;">
	</div>
	<div class="chatting" style="width: 100%;" id="place">
		<form onsubmit="return submitChatMessageForm(this)">
			<input type="hidden" name="fromId" id="fromId" value="${fromId }"><!-- autocomplete : 자동완성금지 -->
			<input type="hidden" name="toId" id="toId" value="${toId }">
			<input type="hidden" name="userid" id=userid value="${userid }">
			<div><input type="text" name="content" id="content" 
			placeholder="chat Start  !" autocomplete="off"></div>
		</form>
	</div>

</body>
</html>