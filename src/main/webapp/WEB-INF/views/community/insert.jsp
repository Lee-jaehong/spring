<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<script type="text/javascript">
function post_data() {
	//var subject = frm1.subject.value;  //유효성 검사
	frm1.submit();
}
function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	      document.getElementById('preview').style.width = '100px';
		  document.getElementById('preview').style.height = '100px';
	    };
	    reader.readAsDataURL(input.files[0]);
	    
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}
function readURL2(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview2').src = e.target.result;
	      document.getElementById('preview2').style.width = '100px';
		  document.getElementById('preview2').style.height = '100px';
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview2').src = "";
	  }
	}
function readURL3(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview3').src = e.target.result;
	      document.getElementById('preview3').style.width = '100px';
		  document.getElementById('preview3').style.height = '100px';
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview3').src = "";
	  }
	}
function readURL4(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview4').src = e.target.result;
	      document.getElementById('preview4').style.width = '100px';
		  document.getElementById('preview4').style.height = '100px';
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview3').src = "";
	  }
	}
function readURL5(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview5').src = e.target.result;
	      document.getElementById('preview5').style.width = '100px';
		  document.getElementById('preview5').style.height = '100px';
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview3').src = "";
	  }
	}
	
</script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/freeboard.css?v=3">
</head>
<body>
<%@ include file="../header.jsp" %>
<form name="frm1" method="post" action="save" enctype="multipart/form-data">
<input type="hidden" name="nickname" value="${member.nickname }">
 <table>
 	<tr><td class="td1">작성자</td>
 		<td class="left"><input type="text" name="id" size="70" class="input1" required="required" value="${member.id }" readonly></td>
 	</tr>
 	<tr><td class="td1">내용</td>  <!-- textarea 의 크기 : rows="20" cols="80" -->
 		<td class="left"><textarea  rows="20" cols="80" name="content" class="input1" required="required"></textarea></td>
 	</tr>
 	<tr>
 		<td colspan="2" align="center"><label for="file-input">
       		<img src="${pageContext.request.contextPath}/resources/image/plus.png" id="preview" style="width: 30px; height: 30px">
    		</label>
			<input type="file" name="pics" accept="image/*" onchange="readURL(this)" id="file-input" style="display: none;"> 
 			<label for="file-input2">
        	<img src="${pageContext.request.contextPath}/resources/image/plus.png" id="preview2" style="width: 30px; height: 30px">
			</label>
			<input type="file" name="pics" accept="image/*" onchange="readURL2(this)" id="file-input2" style="display: none;">
		<label for="file-input3">
        <img src="${pageContext.request.contextPath}/resources/image/plus.png" id="preview3" style="width: 30px; height: 30px">
			</label>
			<input type="file" name="pics" accept="image/*" onchange="readURL3(this)" id="file-input3" style="display: none;">
			<label for="file-input4">
        <img src="${pageContext.request.contextPath}/resources/image/plus.png" id="preview4" style="width: 30px; height: 30px">
			</label>
			<input type="file" name="pics" accept="image/*" onchange="readURL4(this)" id="file-input4" style="display: none;">
			<label for="file-input5">
        <img src="${pageContext.request.contextPath}/resources/image/plus.png" id="preview5" style="width: 30px; height: 30px">
			</label>
			<input type="file" name="pics" accept="image/*" onchange="readURL5(this)" id="file-input5" style="display: none;"></td></tr>
 	<tr><td colspan="2" align="center">
 	<input type="submit" value="저장" class="btn" >
 	<!-- <a class="button" href="javascript:post_data();">저장</a> -->
 	<input type="reset"  value="다시쓰기" class="btn">
 	<input type="button" value="목록" onclick="location.href='list?page=${page}'" class="btn">
 <!-- 	<a class="button" href="#">목록</a>  -->
 	</td></tr>
 </table>
 </form>
</body>
</html>