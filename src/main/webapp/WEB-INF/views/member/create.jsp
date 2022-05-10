<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap CSS --> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> 
 
<meta charset="EUC-KR">
<title>회원가입 화면 샘플 - Bootstrap</title> 
<script type="text/javascript">

function CheckId(){
	var params = "id="+$('#id').val();
	// console.log(params);
	
	$.ajax({
		dataType:'json',
		url:'/member/CheckId.do',
		Type:'get',
		data:params,
		success:function(cnt){
			//alert(cnt.cnt)
			if($('#id').val().length <= 5){
				alert("최소 다섯글자 이상이여야 합니다.")
				return false;
			}
				if (cnt.cnt == 1){
					alert("이미 사용중인 아이디 입니다.")
				}else{
					alert("사용 가능한 아이디 입니다.")
				}

		},
		error:function(XMLHttpRequest,textStatus, errorThrown){
			alert("통신실패")
		}
		
		
	})
}

function CheckPwd(){
	pwd1 = $('#pwd1').val()
	pwd2 = $('#pwd2').val()
	console.log(pwd2.length)
	if (pwd2.length < 1){
		$('#Checkpwd').html("")
	}
	if (pwd1 === pwd2){
		$('#Checkpwd').html("비밀번호가 일치합니다.")
	}
	else {
		$('#Checkpwd').html("비밀번호가 일치하지 않습니다.")
	}
}

</script>
<style>
 body { min-height: 100vh; 
 background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
 background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
 background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%); 
 background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
 background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%); }
.input-form { max-width: 680px;
 margin-top: 80px;
padding: 32px;
 background: #fff;
 -webkit-border-radius: 10px;
 -moz-border-radius: 10px;
 border-radius: 10px;
 -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
 -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
  box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15) }
</style>
</head>
<body>
<body> 
<div class="container"> 
  <div class="input-form-backgroud row"> 
    <div class="input-form col-md-12 mx-auto"> 
      <h4 class="mb-3">회원가입</h4> 
        <form class="validation-form" novalidate name='frm' method='post' action='/member/create.do'> 
			<div class="row"> 
			  <div class="col-md-6 mb-3"> 
				<label for="name">이름</label> 
				<input type="text" class="form-control" id="name" name="member_name" placeholder="" value="" required> 
			    <div class="invalid-feedback"> 이름을 입력해주세요. 
			    </div> 
			  </div> 
			  <div class="col-md-6 mb-3"> 
				<label for="id">아이디</label> <button onclick="CheckId()" type="button" class="btn btn-primary btn-lg btn-block" style="width:150px;">중복 확인</button>
				<input type="text" class="form-control" id="id" name="id" placeholder="" value="" required> 
			    <div class="invalid-feedback"> 아이디을 입력해주세요. 
			    </div> 
			  </div> 
			  <div class="col-md-6 mb-3"> 
				<label for="pwd1">비밀번호</label> 
				<input type="password" class="form-control" id="pwd1" name="pwd1" placeholder="" value="" required> 
				<div class="invalid-feedback"> 비밀번호를 입력해주세요. 
				</div> 
			  </div> 
			  <div class="col-md-6 mb-3"> 
				<label for="pwd2">비밀번호 확인</label> 
				<input type="password" class="form-control" onkeyup="CheckPwd()" id="pwd2" name="pwd2" placeholder="" value="" required> 
				<div id='Checkpwd'>
				</div> 
			  </div> 
			</div> 
			  <div class="mb-3"> 
				<label for="email">이메일</label> 
				<input type="email" class="form-control" id="email" name="member_email" placeholder="you@example.com" required> 
				<div class="invalid-feedback"> 이메일을 입력해주세요. 
				</div> 
			  </div> 
			  <div class="mb-3"> 
				<label for="address">주소</label> 
				<input type="text" class="form-control" id="address" name="member_address" placeholder="서울특별시 강남구" required> 
				<div class="invalid-feedback"> 주소를 입력해주세요. 
				</div> 
			  </div> 
			  <div class="mb-3"> 
				<label for="phone">핸드폰<span class="text-muted">&nbsp;(필수)</span></label> 
				<input type="text" class="form-control" id="phone" name="member_phone" placeholder="상세주소를 입력해주세요."> 
			  </div> 
			<hr class="mb-4"> 
			  <div class="custom-control custom-checkbox"> 
				<input type="checkbox" class="custom-control-input" id="aggrement" required> 
				<label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label> 
			  </div> 
			<div class="mb-4">
			</div> 
          <button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button> 
        </form> 
    </div> 
  </div> 
<footer class="my-3 text-center text-small"> <p class="mb-1">&copy; 2021 YD</p> </footer> 
</div> 
<script> 
window.addEventListener('load', () => { const forms = document.getElementsByClassName('validation-form');
Array.prototype.filter.call(forms, (form) => { form.addEventListener('submit', function (event) {
	if (form.checkValidity() === false) { event.preventDefault(); event.stopPropagation(); } form.classList.add('was-validated'); 
	}, false); }); }, false); </script> </body> </html>

</body>
</html>