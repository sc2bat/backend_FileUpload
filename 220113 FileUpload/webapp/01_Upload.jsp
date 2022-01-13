<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>01_Upload</title>
</head>
<body>
<!-- 파일 업로드 기능이 포함된 form 은 반드시 enctype="multipart/form-data" 옵션을 추가해주어야 합니다.  -->
<!-- 파일 업로드시 method= 반드시 post 이여야 합니다. -->
	<form action="upload.do" method="post" enctype="multipart/form-data">
		글쓴이 : <input type="text" name="name"> <br>
		제&nbsp;목 : <input type="text" name="title"> <br>
		파일 지정하기 : <input type="file" name="uploadFile"> <br>
		<input type="submit" value="전송">
	</form>
<!-- 	<img width="300" src="upload/jquery.jpg"> -->
</body>
</html>