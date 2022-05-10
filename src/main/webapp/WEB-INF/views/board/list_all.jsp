<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<meta charset="EUC-KR">
<title>Fishing Diary</title>
<script>
</script>
<style>
	tr:hover{
		cursor: pointer;
	}
</style>
</head>

<body style="margin:220px;">
<table class="table table-hover">
	<thead>
		<tr>
			<td>게시판 이름</td>
			<td>게시판 내용</td>
			<td>게시판 생성일</td>
			<td>게시판 조회수</td>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="boardVO" items="${list }">
		<tr>
			<td><a style="text-decoration:none; color:black;" href="/board/read_board.do?board_no=${boardVO.board_no}">${boardVO.board_name }</a></td>
			<td>${boardVO.board_contents }</td>
			<td>${boardVO.bdate }</td>
			<td>${boardVO.read_cnt }</td>
		</tr>
		</c:forEach>
	</tbody>
</table>

</body>
</html>