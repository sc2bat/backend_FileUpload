<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardPassChk</title>
<link rel="stylesheet" type="text/css" href="css/board.css">
<script type="text/javascript" src="script/script.js"></script>
</head>
<body>
<div align="center">
	<h1>Check Pass</h1>
	<form action="board.do" name="frm" method="get">
		<input type="hidden" name="cmd" value="boardPassChk">
		<input type="hidden" name="num" value="${param.num }">
		<table style="width:80%">
			<tr>
				<th>update/delete Pass</th>
				<td><input type="password" name="pass" size="20"></td>
			</tr>
		</table>
		<br>
		<input type="submit" value="confirm" onClick="return passChk();">
		<br> <br> ${message }
	</form>
</div>
</body>
</html>