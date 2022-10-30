	/////////////////////////////////// 닉네임 중복 검사 ///////////////////////////////////////////

	// 닉네임 중복 체크
	function nickCheck() {
		var nickname = document.frmUpdate.nickname.value;
		
		if(nickname == "") {
			alert('닉네임을 입력하세요.');
			document.frmUpdate.nickname.focus();
			return ;
		}
		
		const xhr = new XMLHttpRequest();
		xhr.open('GET', './registerer?nickname=' + nickname);
		xhr.send();
		xhr.onload = function() {
			if(xhr.status == 200) {
				const data = JSON.parse(xhr.response);
				console.log(data.result);
				
				if(data.result == 1) {
					alert('사용할 수 없는 닉네임입니다.');
					isValid = false;
				} else {
					alert('사용 가능한 닉네임입니다.');
					isValid = true;
				} 
			} else {
				console.error('error', xhr.status, xhr.statusText);
			}
		}
	}
	
	/////////////////////////////////// 여기까지 닉네임 중복 검사 ///////////////////////////////////////////	
	
	////////////////////////////////////////// 비밀번호 재설정 확인 ///////////////////////////////////////////

	// 비밀번호 변경 창 열기
	function passChange() {
		window.open('./pwCheck.do', '현재 비밀번호 확인', 'width=1000px, height=300px, resizable=no');
	}
 	
	// 비밀번호 형식 확인
	function pwCheck() {
		const pw = document.querySelector('#newpw').value;
		var regPw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
				
		if(regPw.test(pw) === false) {
			document.querySelector('#pw_checker').innerHTML = '패스워드 형식이 올바르지 않습니다.';
			document.querySelector('#pw_checker').style.color = 'red';
		} else {
			document.querySelector('#pw_checker').innerHTML = '올바른 패스워드 형식입니다.';
			document.querySelector('#pw_checker').style.color = 'green';							
		}
		return ;
	}
	
	// 비밀번호 확인 일치?
	function pwOK() {
		const pw = document.frmPass.newpw.value;		
		const pw2 = document.frmPass.newpw2.value;	
		if(pw != pw2) {
			document.querySelector('#newpass2').innerHTML = '패스워드가 일치하지 않습니다.';
			document.querySelector('#newpass2').style.color = 'red';
		} else {
			document.querySelector('#newpass2').innerHTML = '패스워드가 일치합니다.';
			document.querySelector('#newpass2').style.color = 'green';							
		}	
	}
	
	/////////////////////////////////////// 여기까지 비밀번호 확인 ///////////////////////////////////////

/////////////////////////////////////// 여기서부터 회원정보 수정 유효성 검사 ///////////////////////////////////////
  
 // 회원정보 수정 유효성 검사
 
 	function validForm(){
		var isValid = true;
		var frm = document.frmUpdate;

		// a. 이름
		if(frm.name.value == "") {
			// alert("이름은 필수 입력입니다.");
			document.getElementById('name_val').innerHTML = '*필수 입력*';	
			frm.name.focus();
			isValid = false;			
		} else {
			document.getElementById('name_val').innerHTML = '';
		}		
		
		// b. 닉네임
		if(frm.nickname.value == "") {
			// alert("닉네임은 필수 입력입니다.");
			document.getElementById('nic_val').innerHTML = '*필수 입력*';	
			frm.nickname.focus();
			isValid = false;			
		} else {
			document.getElementById('nic_val').innerHTML = '';
		}
		
		// c. 나이
		if(frm.age.value == "") {
			// alert("나이를 입력하세요.");
			document.getElementById('age_val').innerHTML = '*필수 입력*';				
			frm.age.focus();
			isValid = false;			
		} else {
			document.getElementById('age_val').innerHTML = '';
		}
		
		if(frm.age.value > 100 || frm.age.value <= 14) {
			// alert("나이는 14세 이상 100세 미만으로만 가능합니다.");
			document.getElementById('age_val').innerHTML = '*14세 이상, 100세 미만*';				
			frm.age.focus();
			isValid = false;			
		} else {
			document.getElementById('age_val').innerHTML = '';
		}
		
		// d. 주소
		if(frm.addr.value == "") {
			// alert("주소를 입력하세요.");
			document.getElementById('addr_val').innerHTML = '*필수 입력*';					
			frm.addr.focus();
			isValid = false;			
		} else {
			document.getElementById('addr_val').innerHTML = '';
		}
		
		// e. 프사 파일 이름
		if(frm.profile_file.value == "") {
			if(confirm("프로필 사진을 업로드하지 않으면 기본 프로필 사진으로 설정됩니다.") === false) {
				frm.profile_file.focus();
				isValid = false;				
			} 
		}
		
		if(isValid) {
			frm.submit();
		}  else {
			alert('입력한 정보를 확인하세요.');
		}
	}
	
	//////////////////////////////// 여기까지 회원정보 수정 유효성 검사 ////////////////////////////////////