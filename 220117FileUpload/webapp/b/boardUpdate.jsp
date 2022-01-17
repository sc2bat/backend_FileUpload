<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardUpdate</title>
<link rel="stylesheet" type="text/css" href="css/board.css">
<script type="text/javascript" src="script/script.js"></script>
</head>
<body>
<div id="wrap" align="center">
	<h1>Update Content</h1>
	<form action="board.do?cmd=boardUpdate" method="post" name="frm" enctype="multipart/form-data">
<!-- 	<input type="hidden" name="command" value="boardUpdate"> -->
	<input type="hidden" name="num" value="${b.num }">
		<table>
			<tr>
				<th>Writer</th>
				<td>${b.userid }<input type="hidden" name="userid" value="${loginUser.userid }"></td>
			</tr>
			<tr>
				<th>Pass</th>
				<td><input type="password" name="pass" size="12">*</td>
			</tr>
			<tr>
				<th>Email</th>
				<td><input type="text" name="email" size="12" value="${b.email }"></td>
			</tr>
			<tr>
				<th>Title</th>
				<td><input type="text" name="title" size="20" value="${b.title }"></td>
			</tr>
			<tr>
				<th>Content</th>
				<td><textarea cols="70" rows="15" name="content">${b.content }</textarea></td>
			</tr>
			<tr>
				<th>이미지</th>
				<td>
					<c:choose>
						<c:when test="${empty b.imgfilename }">
							<img height="50" src="images/noname.jpg"> <br>
						</c:when>
						<c:otherwise>
							<img height="50" src="images/${b.imgfilename }"> <br>
						</c:otherwise>
					</c:choose>
					<input type="file" name="imgfilename"> <br> 파일을 수정하고자 할때만 사용하세요
					<input type="hidden" name="oldfilename" value="${b.imgfilename }">
				</td>
			</tr>
		</table> <br> <br>
		<input type="submit" value="update confirm" onClick="return boardCheck();">
		<input type="reset" value="reset">
		<input type="button" value="go back" onClick="location.href='board.do?cmd=boardNoneCnt&num=${b.num}'">
	</form>
</div>
</body>
</html>