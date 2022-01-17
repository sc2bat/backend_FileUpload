<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${empty loginUser }">
	<jsp:forward page="board.go?command=login"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardWForm</title>
<link rel="stylesheet" type="text/css" href="css/board.css">
<script type="text/javascript" src="script/script.js"></script>
</head>
<body>
<div id="wrap" align="center">
	<h1>Write board</h1>
<!-- 	<form action="board.do?cmd=boardWrite" method="post" name="frm"> -->
	<form action="board.do?cmd=boardWrite" method="post" name="frm" enctype="multipart/form-data">
		<table>
			<tr>
				<th>User</th>
				<td>${loginUser.userid }<input type="hidden" name="userid" value="${loginUser.userid }"></td>
			</tr>
			<tr>
				<th>Pass</th>
				<td><input type="password" name="pass">* </td>
			</tr>
			<tr>
				<th>Email</th>
				<td><input type="text" name="email" value="${loginUser.email }"></td>
			</tr>
			<tr>
				<th>Title</th>
				<td><input type="text" name="title" size="70">*</td>
			</tr>
			<tr>
				<th>Content</th>
				<td><textarea cols="70" rows="15" name="content"></textarea>*</td>
			</tr>
			<tr>
				<th>이미지</th>
				<td><input type="file" name="imgfilename"></td>
			</tr>
		</table>
		<input type="submit" value="Wrote" onClick="return boardCheck();">
		<input type="reset" value="rewrite">
		<input type="button" value="to List" onClick="location.href='board.do?cmd=main'">
	</form>
</div>
</body>
</html>