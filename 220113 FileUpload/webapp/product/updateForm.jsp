<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateForm</title>
<link rel="stylesheet" type="text/css" href="css/product.css">
</head>
<body>
<div id="wrap" align="center">
	<h1>상품 수정 - 관리자 페이지</h1>
	<form action="product.do?command=update" method="post" enctype="multipart/form-data">
	<input type="hidden" name="code" value="${product.code }">
	<input type="hidden" name="oldPicture" value="${product.pictureurl }">
	<table>
		<tr>
			<td>
				<c:choose>
					<c:when test="${empty product.pictureurl}">
						<img alt="" src="upload/noname.jpg" width="220" height="300">
					</c:when>
					<c:otherwise>
						<img width="220" height="300" src="upload/${product.pictuerurl }">
					</c:otherwise>
				</c:choose>
			</td>
			<td>
				<table>
					<tr>
						<th style="width:80px">상품명</th>
						<td><input type="text" name="name" value="${product.name }"></td>
					</tr>
					<tr>
						<th>가격</th>
						<td><input type="text" name="price" value="${product.price }" size="80">원</td>
					</tr>
					<tr>
						<th>사진</th>
						<td><input type="file" name="pictureurl" value="${product.pictureurl }"><br> 
							(주의사항 : 이미지를 변경하고자 할때만 선택하시오)</td>
					</tr>
					<tr>
						<th>설명</th>
						<td><textarea cols="90" rows="10" name="description">${product.description }</textarea></td>
					</tr>
				</table>
			</td>
		</tr>		
	</table> <br>
	<input type="submit" value="수정" onClick="">
	<input type="reset" value="다시작성">
	<input type="button" value="목록으로" onClick="location.href='product.do?command=index'">
	</form>
</div>
</body>
</html>