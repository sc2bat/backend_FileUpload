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
<title>boardView</title>
<link rel="stylesheet" type="text/css" href="css/board.css">
<script type="text/javascript" src="script/script.js"></script>
</head>
<body>
<div id="wrap" align="center">
	<h1>Content</h1>
	<table>
		<tr>
			<th width="100">User</th>
			<td>${b.userid }</td>
			<th width="100">Email</th>
			<td>${b.email }</td>
		</tr>
		<tr>
			<th width="100">Writedate</th>
			<td><fmt:formatDate value="${b.writedate }" /></td>
			<th>cnt</th>
			<td>${b.readcount }</td>
		</tr>
		<tr>
			<th width="100">Title</th>
			<td colspan="3">${b.title }</td>
		</tr>
		<tr>
			<th width="100">Content</th>
			<td><pre>${b.content}</pre></td>
			<th width="100">이미지</th>
			<td width="220" align="center">
				<c:choose>
					<c:when test="${empty b.imgfilename}">
						<img width="200" src="images/noname.jpg">
					</c:when>
					<c:otherwise>
						<img width="200" src="images/${b.imgfilename }">
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table> <br> <br> <br>
	<input type="button" value="list" onClick="location.href='board.do?cmd=main'">
	<input type="button" value="update" onClick="open_win('${b.num}', 'updateB')">
	<input type="button" value="delete" onClick="open_win('${b.num}', 'deleteB')">
	<br><br>
	
	<c:set var="now" value="<%=new java.util.Date() %>"></c:set>
	<form action="board.do" method="post" name="frm_reply">
	<input type="hidden" name="cmd" value="addReply">
	<input type="hidden" name="boardnum" value="${b.num }">
		<table>
			<tr>
				<th width="100">Writer</th>
				<th width="100">WriteDate</th>
				<th>Content</th>
				<th width="100">add/delete</th>
			</tr>
			<tr align="center">
				<td>
					${loginUser.userid } <input type="hidden" name="userid" value="${loginUser.userid }"></td>				
				<td>
					<fmt:formatDate value="${now }" pattern="MM/dd HH:mm"/></td>
				<td>
					<input type="text" name="reply" size="80"></td>
				<td>
					<input type="submit" value="add reply" onClick="return reply_check();"></td>
			</tr>
			<c:forEach items="${replyList }" var="r">
				<tr align="center">
					<td>${r.userid }</td>
					<td>
					<fmt:formatDate value="${r.writedate }" pattern="MM/dd HH:mm"/></td>
					<td align="left">&nbsp;&nbsp;${r.reply }</td>
					<td>
						<c:if test="${r.userid == loginUser.userid }">
							<input type="button" value="reply_delete" 
							onClick="location.href='board.do?cmd=deleteR&replynum=${r.replynum}&boardnum=${r.boardnum }'">
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</form>
</div>
</body>
</html>