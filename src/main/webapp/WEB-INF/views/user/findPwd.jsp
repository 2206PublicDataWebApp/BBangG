<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빵지순례</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<style>
*{
	padding: 0;
	margin:0 auto;
	boarder: none;
	text-color: #3A2618;
}
    
body{
	font-family: 'Noto Sans KR', sans-serif;
	}
.findPwd{
	margin-top: 150px;
}
h2{
	text-align: center;
	color: #3A2618;
	margin: 10px;
}
.login{
	text-align: center;
}
.btn{
	padding-left:10px;
	padding-right:10px;
	padding-top:3px;
	padding-bottom:3px;
	margin-top:20px;
	border: 1px solid #ffffff;
	height: 30px;
	background-color: #3A2618;
	color: #ffffff;
	font-weight: bold;
}
</style>
<body>
	<div class="findPwd">
		<h2>임시 비밀번호가 전송되었습니다. </h2>
	  	<h2>${user.userEmail}</h2>
	  	<h2>위의 이메일을 확인해주세요.</h2>
	  <div class="login">
	  <button type="button" class="btn" onclick="location.href='/user/loginView.kh'">로그인</button>
	  </div>
	</div>
</body>
</html>