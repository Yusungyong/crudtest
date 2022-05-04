<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function delete_member (member_no){ // member 삭제 기능, 삭제버튼 클릭시 경고창 없이 바로 삭제됨.
		const params = "member_no=" + member_no
		console.log(member_no)
		$.ajax({
			type:"POST",
			url:"/member/delete_ajax",
			data:params,
			success:function(mdata){
				location.reload();
			},
			error:function(XMLHttpRequest,textStatus, errorThrown){
				alert("통신실패")
			}
		})
		
	}
	function show_text(member_no) {
		const params ="member_no=" + member_no
		$.ajax({
			type:"GET",
			url:"/member/update_form.do",
			data:params,
			dataType:"json",
			success:function(mdata){
			      $( document ).ready(function() {
			    	    $('#member_no').val(mdata.member_no)
						$('#name').val(" "+mdata.name)
						$('#address').val(" "+mdata.address)
						$('#phone').val(" "+mdata.phone)
						$('#email').val(" "+mdata.email)
			        } );
			},
			error:function(XMLHttpRequest,textStatus, errorThrown){
				alert("통신실패")
			}
		})
			  
		}
</script>
<style>
	td{
	text-align:center;
	}
	.read_box{
	background-color:black;
	color:white;
	width:500px;
	height:200px;
	}
	.read_box input{
	background-color:black;
	color:white;
	border: black;
	}
</style>
<body>
<table class="table table-dark table-hover">
	<thead>
		<tr>
		  <td>member_number</td>
		  <td>member_name</td>
		  <td>member_address</td>
		  <td>member_phone</td>
		  <td>member_email</td>
		  <td>option</td>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="memberVO" items="${list }">
		<tr >
		  <td>${memberVO.member_no }</td>
		  <td>${memberVO.member_name }</td>
		  <td>${memberVO.member_address }</td>
		  <td>${memberVO.member_phone }</td>
		  <td>${memberVO.member_email }</td>
		  <td><button onclick="delete_member(${memberVO.member_no})"> 삭제</button>
		  	  <button onclick="show_text(${memberVO.member_no})">수정</button>
		   </td>

		</tr>
		</c:forEach>
		<tr>
		<form id="frm_create" method="post" name='new_member' action='/member/new_member.do'>
		  <td>member_number</td>
		  <td><input type="text" value="name" required="required" name="member_name"></td>
		  <td><input type="text" value="address" required="required" name="member_address"></td>
		  <td><input type="text" value="phone" required="required" name="member_phone"></td>
		  <td><input type="text" value="email" required="required" name="member_email"></td>
		  <td><button type="submit">새로운 회원 추가하기</button></td>
		</form>
		</tr>
		<tr id="tr_number_3">
		</tr>
	</tbody>
</table>
	<div class="read_box">
		
		<form name="update_form" method="post" action="/member/update_member.do">
		member_number: <input type="text" value="" id="member_no" name="member_no" readonly><br>
		member_name:<input type="text" value="" id=name  name="member_name"> <br>
		member_addresss:<input type="text" value="" id=address name="member_address"> <br>
		member_phone:<input type="text" value="" id=phone name="member_phone"> <br>
		member_email:<input type="text" value="" id=email name="member_email"> <br>
		<button type="submit" style="position:relative; left:450px; ">저장</button>
		</form>
	</div>
</body>
</html>