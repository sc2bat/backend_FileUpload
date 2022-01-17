<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>editMForm</title>
<link rel="stylesheet" type="text/css" href="css/board.css">
<script type="text/javascript" src="script/script.js"></script>
</head>
<body>
<div id="wrap" align="center">
	<h1>User Info update</h1>
	<form action="board.do" method="post" name="frm">
	<input type="hidden" name="cmd" value="editM">
		<table>
			<tr>
				<th>ID</th>
				<td>${loginUser.userid }
				<input type="hidden" name="userid" value="${loginUser.userid }"></td>
			</tr>
			<tr>
				<th>Password</th>
				<td><input type="password" name="pwd" size="20"></td>
			</tr>
			<tr>
				<th>Password Check</th>
				<td><input type="password" name="pwd_chk" size="20"></td>
			</tr>
			<tr>
				<th>Name</th>
				<td><input type="text" name="name" size="20" value="${loginUser.name }"></td>
			</tr>
			<tr>
				<th>Email</th>
				<td><input type="text" name="email" size="20" value="${loginUser.email }"></td>
			</tr>
			<tr>
				<th>Phone</th>
				<td><input type="text" name="phone" size="20" value="${loginUser.phone }"></td>
			</tr>
			<tr>
				<th>Permission</th>
				<td>
					<c:choose>
						<c:when test="${loginUser.admin == 0 }">
							<input type="radio" name="admin" value="0" checked="checked">User
							<input type="radio" name="admin" value="1">Admin
						</c:when>
						<c:otherwise>
							<input type="radio" name="admin" value="0">User
							<input type="radio" name="admin" value="1" checked="checked">Admin
						</c:otherwise>
					</c:choose>
				</td>			
			</tr>
		</table> <br> <br>
		<input type="submit" value="confirm" onClick="return editCheck();">
		<input type="reset" value="reset">
		<input type="button" value="to main" onClick="location.href='board.do?cmd=main'">
	</form>
</div>
</body>
</html>