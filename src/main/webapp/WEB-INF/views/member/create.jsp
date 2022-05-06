<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">

function createSubmit(){

	$.ajax({
		type:'POST',
		url:'/member/create.do',
		dataType:"json",
		success:function(cnt){
			$( document ).ready(function() {
			if(cnt.cnt != 0){
			alert(cnt.id+'님 환영합니다.')
			window.close();
			window.opener.location.reload();
			}
			else {
				alert('아이디와 비밀번호를 다시 확인해주세요.')
			}
		})
		},
		error:function(XMLHttpRequest,textStatus, errorThrown){
			
		}
	})
}
</script>
</head>
<body>
 	 <h1>회원가입</h1><br>
 <form id='frm' name='frm' action='/member/create.do' method='post'>
 	<input type="text" value="이름" required="required" name="member_name"><br>
 	<input type="text" value="주소" required="required" name="member_address"><br>
 	<input type="text" value="핸드폰 번호" required="required" name="member_phone"><br>
 	<input type="text" value="이메일" required="required" name="member_email"><br>
 	<button type="button" onclick="createSubmit()">가입</button>
 	</form>
</body>
</html>