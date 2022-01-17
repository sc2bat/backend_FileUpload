<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>idChk</title>
<link rel="stylesheet" type="text/css" href="css/board.css">
<script src="script/script.js"></script>
</head>
<body>
	<form action="board.do" method="post" name="frm">
		<input type="hidden" name="cmd" value="idCheck">
		ID<input type="text" name="userid" value="${userid }">
		<input type="submit" value="Check dupli"> <br>
	</form> <br><br><br>
	<c:if test="${result ==1 }">
		<script type="text/javascript">
			opener.document.frm.id.value="";
		</script>
		${id} was Used
	</c:if>
	<c:if test="${result==-1}">
		${userid } can use
		<input type="button" value="confirm" onClick="dupli('${userid}')">
	</c:if>
</body>
</html>