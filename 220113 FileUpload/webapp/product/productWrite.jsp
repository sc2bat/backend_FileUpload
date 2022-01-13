<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>productWrite</title>
<link rel="stylesheet" type="text/css" href="css/product.css">
</head>
<body>
<div id="wrap" align="center">
	<h1>상품 등록 - 관리자 페이지</h1>
	<form action="product.do?command=productWrite" method="post"  enctype="multipart/form-data">
		<table>
			<tr>
				<th>상품명</th>
				<td><input type="text" name="name" size="80"></td>
			</tr>			
			<tr>
				<th>가격</th>
				<td><input type="text" name="price">원</td>
			</tr>			
			<tr>
				<th>사진</th>
				<td><input type="file" name="pictureurl"></td>
			</tr>			
			<tr>
				<th>설명</th>
				<td><textarea cols="80" rows="10" name="description"></textarea></td>
			</tr>			
		</table> <br>
		<input type="submit" value="등록">
		<input type="reset" value="다시 작성">
		<input type="button" value="목록" onClick="location.href='product.do?command=index'">
	</form>
</div>
</body>
</html>