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

function createSubmit(){

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
				<label for="id">아이디</label> 
				<input type="text" class="form-control" id="id" name="id" placeholder="" value="" required> 
			    <div class="invalid-feedback"> 이름을 입력해주세요. 
			    </div> 
			  </div> 
			  <div class="col-md-6 mb-3"> 
				<label for="pwd">패스워드</label> 
				<input type="password" class="form-control" id="pwd" name="pwd" placeholder="" value="" required> 
				<div class="invalid-feedback"> 별명을 입력해주세요. 
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