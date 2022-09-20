<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID/PW Find</title>
</head>
<body>
<form action="/user/findid.kh" method="get">
	<div>
		이름
		<input type="text" name="userName">
	</div>
	<div>
		이메일
		<input type="text" name="userEmail">
	</div>
	<div>
		<input type="submit" id="findId" value="ID찾기">
		<input type="button" value="뒤로가기" onclick="history.back(-1)">
	</div>
</form>
<form action="/user/findPwd.kh" method="post">
	<div>
		아이디
		<input type="text" name="userId">
	</div>
	<div>
		이메일
		<input type="text" name="userEmail">
	</div>
	<div>
		<input type="submit" id="findPwd" value="PW찾기">
		<input type="button" value="뒤로가기" onclick="history.back(-1)">
	</div>
</form>
</body>
</html>