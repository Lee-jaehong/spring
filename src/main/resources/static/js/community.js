/**
 * 
 */
 function deleteCmt(cmtidx,idx){
		var yn=confirm('댓글을 삭제하시겠습니까?');
		if(yn){
			alert('댓글을 삭제합니다.');  /* cmtidx:댓글 idx , page:현재페이지번호 , mref:메인글 idx */
			location.href='comment?action=delete&idx='+cmtidx+'&mref='+idx;
		}  
	}
	
	
	//메인글 삭제 확인
	function deleteOk(idx){
		var yn= confirm( '글을 삭제하시겠습니까?');
		
		if(yn){
			alert('글 ' + idx +'를 삭제합니다.');
			//수정해야 실행됩니다.
			location.href='delete?func=2&idx='+idx;
		}
	}
	
	function commentLogin(email){
		console.log(email)
		var yn;
		if(email == "") {
				yn = confirm('댓글 작성은 로그인을 해야합니다.\n로그인을 하시겠습니까?');
				if(yn) document.frmCmt.submit();
		}	
	}
