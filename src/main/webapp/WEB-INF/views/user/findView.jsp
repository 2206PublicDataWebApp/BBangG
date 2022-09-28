<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빵지순례</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style type="text/css">
*{
	padding: 0;
	border: none;
	color: #3A2618;
	margin-top:5px;
	margin-bottom:5px;
}
    
body{
	margin:80px;
	font-size: 16px;
	font-family: 'Noto Sans KR', sans-serif;
	}
.wrapper{
	margin: 0 auto;
    padding: 40px;
    box-sizing: border-box;
    display: block;
    text-align: center;
}
.userName{
	margin-left:15px;
}
input{
	text-color: #3A2618;
}
input[type='text']{
	box-sizing: border-box;
	border: 1px solid #3A2618;
	height: 20px;
}
input[type='text']:focus{
	outline: none;
}
input[type='submit'], input[type='button']{
	font-size: 15px;
	margin-top: 20px;
}
#findId, #findPwd{
	padding-left: 3px;
	padding-right: 3px;
	margin-left: 5px;
	margin-right: 5px;
	border: 1px solid #3A2618;
	height: 20px;
	background-color: #3A2618;
	color: #ffffff;
}
.cancel{
	padding-left: 3px;
	padding-right: 3px;
	margin-left: 5px;
	margin-right: 5px;
	border: 1px solid #3A2618;
	height: 20px;
	background-color: #ffffff;
	color: #3A2618;
	font-weight: bold;
}
#findId, #findPwd{
	margin-left: 25px;
}
h2{
	margin-left:30px;
	color: #3A2618;
	margin-bottom:20px;
}
</style>
</head>
<body>
<div class="wrapper">
	<h2>ID 찾기</h2>
<form action="/user/findid.kh" method="get">
	<div>
		이름
		<input type="text" name="userName" class="userName">
	</div>
	<div>
		이메일
		<input type="text" name="userEmail">
	</div>
	<div class="find">
		<input type="submit" id="findId" value="ID찾기">
		<input type="button" class="cancel" value="뒤로가기" onclick="history.back(-1)">
	</div>
</form>
<br><br><br>
<h2>PW 찾기</h2>
<form action="/user/findPwd.kh" method="post">
	<div>
		아이디
		<input type="text" name="userId">
	</div>
	<div>
		이메일
		<input type="text" name="userEmail">
	</div>
	<div class="find">
		<input type="submit" id="findPwd" value="PW찾기">
		<input type="button" class="cancel" value="뒤로가기" onclick="history.back(-1)">
	</div>
</form>
</div>
</body>
</html>