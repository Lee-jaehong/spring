

	
var i;		// 중복 검사 통과 못하면 회원가입 막기
var v;		// 중복 검사 통과 못하면 회원가입 막기
	/////////////////////////////////// id(이메일 형식) 중복 검사 ///////////////////////////////////////////
		
// 이메일 형식 체크
	let isId = false;
	function check_id() {
		var id = document.getElementById('id').value;
		const regId = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;

		if(id == "" || regId.test(id) === false) {		// email 유효성 검사
			document.querySelector('#valid_id').innerHTML = '올바른 이메일 형식이 아닙니다.';
			document.querySelector('#valid_id').style.color = 'red';
			return ;
		} 
		
		// email 중복 검사
		const xhr = new XMLHttpRequest();
		xhr.open('GET', 'member/register?id=' + id);					// 여기 체크
		xhr.send();
		xhr.onload = function() {
			if(xhr.status == 200) {
				const data = JSON.parse(xhr.response);		
				console.log(data.result);
				if(data.result == 1) {
					document.querySelector('#valid_id').innerHTML = '존재하는 이메일입니다. 다른 이메일을 입력하세요.';
					document.querySelector('#valid_id').style.color = 'red';
					v = 1;
						
				} else {
					document.querySelector('#valid_id').innerHTML = '사용할 수 있는 이메일입니다.';
					document.querySelector('#valid_id').style.color = 'green';
					v = 0;
				}
			} else {
				console.error('error', xhr.status, xhr.statusText);				
			}
		}
		
	}
	
	/////////////////////////////////// 여기까지 이메일 중복 검사 ///////////////////////////////////////////	
	
	/////////////////////////////////// 닉네임 중복 검사 ///////////////////////////////////////////

	// 닉네임 중복 체크
	function nickCheck() {
		var nickname = document.frmUser.nickname.value;
		
		if(nickname == "") {
			alert('닉네임을 입력하세요.');
			document.frmUser.nickname.focus();
			return ;
		}
		
		const xhr = new XMLHttpRequest();
		xhr.open('GET', 'member/registerer?nickname=' + nickname);
		xhr.send();
		xhr.onload = function() {
			if(xhr.status == 200) {
				const data = JSON.parse(xhr.response);
				console.log(data.result);
				
				if(data.result >= 1) {
					alert('사용할 수 없는 닉네임입니다.');
					i = 1;		// 불가능
				} else {
					alert('사용 가능한 닉네임입니다.');
					i = 0;		// 가능
				} 
			} else {
				console.error('error', xhr.status, xhr.statusText);
			}
		}
	}
	
	/////////////////////////////////// 여기까지 닉네임 중복 검사 ///////////////////////////////////////////	
	
	////////////////////////////////////////// 비밀번호 확인 ///////////////////////////////////////////
	
	// 비밀번호 형식 확인
	function pwCheck() {
		const pw = document.querySelector('#pw').value;
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
		const pw = document.frmUser.pw.value;		
		const pw2 = document.frmUser.pw2.value;	
		if(pw != pw2) {
			alert('비밀번호가 일치하지 않습니다.');
		} else {
			alert('비밀번호 일치합니다.');
		}	
	}
	
	/////////////////////////////////////// 여기까지 비밀번호 확인 ///////////////////////////////////////

  
 // 회원가입 form 유효성 검사
 
 	function validForm(){
		var isValid = true;
		var frm = document.frmUser;
		console.log(i);

		// a. 아이디 (이메일 형식)
		if(frm.id.value == "") {
			// alert("아이디는 필수 입력입니다.");
			document.getElementById('id_val').innerHTML = '*필수 입력*';
			frm.id.focus();
			isValid = false;
		} else {
			document.getElementById('id_val').innerHTML = '';
		}
		
		// b. 비밀번호
		if(frm.pw.value.length < 8) {
			// alert("비밀번호는 8글자 이상입니다.");
			document.getElementById('pw_val').innerHTML = '*필수 입력, 8자 이상*';			
			frm.pw.focus();
			isValid = false;
		} else {
			document.getElementById('pw_val').innerHTML = '';
		}
		
		// b-2. 비밀번호 확인
		if(frm.pw2.value != frm.pw.value) {
			alert("비밀번호 불일치");
			document.getElementById('pw2_val').innerHTML = '비밀번호 불일치';
			frm.pw2.focus();
			isValid = false;
		} else {
			document.getElementById('pw2_val').innerHTML = '';
		}
		
		if(frm.pw2.value == "") {
			// alert("비밀번호 확인이 필요합니다.");
			document.getElementById('pw2_val').innerHTML = '*필수 입력*';	
			frm.pw2.focus();
			isValid = false;
		} else {
			document.getElementById('pw2_val').innerHTML = '';
		}
		
		// 이름
		if(frm.name.value == "") {
			// alert("이름은 필수 입력입니다.");
			document.getElementById('name_val').innerHTML = '*필수 입력*';	
			frm.name.focus();
			isValid = false;
		} else {
			document.getElementById('name_val').innerHTML = '';
		}		
		
		// c. 닉네임
		if(frm.nickname.value == "") {
			// alert("닉네임은 필수 입력입니다.");
			document.getElementById('nic_val').innerHTML = '*필수 입력*';	
			frm.nickname.focus();
			isValid = false;
		} else {
			document.getElementById('nic_val').innerHTML = '';
		}
		
		// d. 나이
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
		
		// e. 생년월일
		if(frm.birth.value == "") {
			// alert("생년월일을 입력하세요.");
			document.getElementById('birth_val').innerHTML = '*필수 입력*';	
			frm.birth.focus();
			isValid = false;
		} else {
			document.getElementById('birth_val').innerHTML = '';
		}
		
		// f. 성별
		if(frm.gender.value == "") {
			// alert("성별을 선택하세요.");
			document.getElementById('gen_val').innerHTML = '*필수 입력*';				
			frm.gender[0].focus();
			isValid = false;
		} else {
			document.getElementById('gen_val').innerHTML = '';
		}
		
		// g. 주소
		if(frm.addr.value == "") {
			// alert("주소를 입력하세요.");
			document.getElementById('addr_val').innerHTML = '*필수 입력*';					
			frm.addr.focus();
			isValid = false;
		} else {
			document.getElementById('addr_val').innerHTML = '';
		}
		
		// h. 프사 파일 이름
		if(frm.filename.value == "") {
			confirm("프로필 사진을 업로드하지 않으면 기본 프로필 사진으로 설정됩니다.");
		}
		
		if(isValid === true && i == 0 && v == 0) {
			frm.submit();
			alert("회원 등록 완료!");
		} else {
			alert("회원 등록 실패! 입력한 정보를 확인하세요.");
			return ;
		}
	}
	
	//////////////////////////////// 여기까지 회원가입 유효성 검사 ////////////////////////////////////
