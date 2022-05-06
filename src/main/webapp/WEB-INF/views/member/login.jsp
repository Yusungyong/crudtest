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

function loginSubmit(){
	var id = $('#id').val()
	var pwd = $('#pwd').val()
	console.log(id,pwd)
	var params = 'id='+id+'&pwd='+pwd
	$.ajax({
		type:'get',
		url:'/member/login.do',
		data:params,
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
<h1>로그인</h1><br>
 <form id='frmm' name='frm' action='login.do' method='get'>
<input type="text" value="아이디" required="required" name="id" id="id"><br>
<input type="text" value="비밀번호" required="required" name="pwd" id="pwd"><br>
<button type='button' onclick='loginSubmit(); return false;'>로그인</button>
</form>
</body>
</html>