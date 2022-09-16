<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 페이지</title>
</head>
<body>
<h3>오류발생!!</h3>
${msg }
<button onclick="goBack()">돌아가기</button>
<script>
	function goBack(){
		location.href = 'home.kh';
	}
</script>
</body>
</html>