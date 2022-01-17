<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm</title>
<link rel="stylesheet" type="text/css" href="css/board.css">
<script src="script/script.js"></script>
</head>
<body>
	<form action="board.do" method="post" name="frm">
		<input type="hidden" name="cmd" value="login">
			<div class="box">Log In</div>
			<div class="box">
				<div class="label">ID</div>
				<div class="item"><input type="text" name="userid" id="loginid" size="20"></div>
			</div>
			<div class="box">
				<div class="label">Password</div>
				<div class="item"><input type="password" name="pwd" id="loginpwd" size="20"></div>
			</div>
			<div class="box">
				<input type="submit" value="sign in" onClick="return loginCheck();">
				<input type="button" value="sign up" onClick="location.href='board.do?cmd=joinForm'">
			</div>
			<div class="box">${message } ${param.message }</div>
	</form>
</body>
</html>