<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chkSuccess</title>
</head>
<body>
	<script type="text/javascript">
		if(window.name == "updateB"){
			window.opener.location.href="board.do?cmd=boardUpdateF&num=${param.num}";
		}else if(window.name == "deleteB"){
			var bool = confirm("Are you sure?");
			if(bool){
				window.opener.location.href="board.do?cmd=boardDelete&num=${param.num}";
			}
		}
		self.close();
	</script>
</body>
</html>