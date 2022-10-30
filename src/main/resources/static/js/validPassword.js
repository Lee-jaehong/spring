/**
 * 
 */
 let result=false;
	const newp1 = document.querySelector("input[name='newpass']")
	newp1.addEventListener("input",check_newpass1);
	
	const newp2 = document.querySelector("input[name='newpass2']")
	newp2.addEventListener("input",check_newpass2);
	
	const oldp = document.querySelector("input[name='oldpass']")
	newp2.addEventListener("input",check_oldpass);
	
//	console.log(newp2)
	function check_oldpass(){
		if(newp1.value =="" || newp1.value!="" && newp1.value.length<4) {
			document.getElementById("oldpass").innerHTML="현재 비밀번호 4자리 이상 입력하세요..";
			document.getElementById("oldpass").style.color="red";
			result=false;
		}else{
			document.getElementById("oldpass").innerHTML="OK!!";
			document.getElementById("oldpass").style.color="green";
			result=true;
		}
	}

	function check_newpass1(){
		if(newp1.value =="" || newp1.value!="" && newp1.value.length<4) {
			document.getElementById("newpass").innerHTML="새로운 비밀번호는 4글자 이상입니다.";
			document.getElementById("newpass").style.color="red";
			result=false;
		}else{
			document.getElementById("newpass").innerHTML="OK!!";
			document.getElementById("newpass").style.color="green";
			result=true;
		}
	}
	
	function check_newpass2(){
		var new1=newp1.value;
		var new2=newp2.value;
		
		if(newp2.value =="") {
			document.getElementById("newpass2").innerHTML="비밀번호 확인 입력하세요.";
			document.getElementById("newpass2").style.color="red";
			result=false;
		}else if(new1 == new2) {
			document.getElementById("newpass2").innerHTML="새로운 비밀번호 확인 일치합니다.";
			document.getElementById("newpass2").style.color="green";
			result=true;
		}else {
			document.getElementById("newpass2").innerHTML="새로운 비밀번호 확인 일치하지 않습니다.";
			document.getElementById("newpass2").style.color="red";
			result=false;
		}
		
		
	}

	function validPassw() {
		var new1=document.frmPass.newpass.value;
		var new2=document.frmPass.newpass2.value;
		var old=document.frmPass.oldpass.value;
			
		if(old=="") {
			/* span 태그에 내용과 스타일 수정 */
			document.getElementById("oldpass").innerHTML="현재 비밀번호 입력 필수입니다.";
			document.getElementById("oldpass").style.color="red";
			document.frmPass.oldpass.focus();
			result=false;
		}else{
			result=true;
		}
		
		check_newpass1()
		check_newpass2()
		
		console.log(result)
		if(result){
			document.frmPass.submit();
		//	setTimeout("self.close()",1);
		}
	}