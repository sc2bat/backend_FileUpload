<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${empty loginUser }">
	<jsp:forward page="board.go?command=login"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
<link rel="stylesheet" type="text/css" href="css/board.css">
</head>
<body>
<div id="wrap" align="center">
	<h1>List</h1>
	<table>
		<tr>
			<td colspan="5" style="border:white;">
				<div style="float:left;">
					Hello ${loginUser.name }(${loginUser.userid })  
					<input type="button" value="update info" onClick="location.href='board.do?cmd=editMForm'">
					<input type="button" value="logout" onClick="location.href='board.do?cmd=logout'">
				</div>
				<div style="float:right;">
					<a href="board.do?cmd=boardWriteForm">Write board</a>
				</div>
			</td>
		</tr>	
		<tr>
			<th>Num</th>
			<th>Title</th>
			<th>Id</th>
			<th>writeDate</th>
			<th>cnt</th>
		</tr>
		<c:forEach items="${blist }" var="b">
			<tr align="center">
				<td width="100">${b.num }</td>
				<td align="left">
					<a href="board.do?cmd=boardV&num=${b.num }">${b.title}</a>
				</td>
				<td width="100">${b.userid }</td>
				<td width="200">${b.writedate }</td>
				<td width="100">${b.readcount}</td>
			</tr>
		</c:forEach>
	</table> <br> <br>
	
	<div></div>
</div>
</body>
</html>