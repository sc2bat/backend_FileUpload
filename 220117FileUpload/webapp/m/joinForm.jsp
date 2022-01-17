<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>joinForm</title>
<link rel="stylesheet" type="text/css" href="css/board.css">
<script type="text/javascript" src="script/script.js"></script>
</head>
<body>
<div id="wrap" align="center">
	<h1>Join User</h1>
	<form action="board.do" method="post" name="frm">
		<input type="hidden" name="cmd" value="join">
		<table>
			<tr>
				<th>ID</th>
				<td>
					<input type="text" name="userid" size="20">*
					<input type="button" value="check dupli" onClick="idChk();">
					<input type="hidden" name="reid">
				</td>
			</tr>
			<tr>
				<th>Name</th>
				<td><input type="text" size="20" name="name">*</td>
			</tr>
			<tr>
				<th>Password</th>
				<td><input type="password" size="20" name="pwd">*</td>
			</tr>
			<tr>
				<th>Password Check</th>
				<td><input type="password" size="20" name="pwd_chk">*</td>
			</tr>
			<tr>
				<th>Email</th>
				<td><input type="text" size="30" name="email"></td>
			</tr>
			<tr>
				<th>Phone</th>
				<td><input type="text" size="20" name="phone"></td>
			</tr>
			<tr>
				<th>Permission</th>
				<td>
					<input type="radio" name="admin" value="0" checked="checked">User
					<input type="radio" name="admin" value="1">Admin
				</td>
			</tr>
		</table> <br>
		<input type="submit" value="confirm" onClick="return joinChk();">
		<input type="reset" value="reset">
		<input type="button" value="to loginPage" onClick="location.href='board.do?cmd=login'">
	</form>
</div>
</body>
</html>