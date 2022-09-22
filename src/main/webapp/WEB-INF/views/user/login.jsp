<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>
*{
	padding: 0;
	margin:0;
	boarder: none;
}
    
body{
	font-size: 14px;
	font-family: 'Noto Sans KR', sans-serif;
	}
	
.logo{
	position: absolute;
	top: 25%;
	left: 50.5%;
	transform: translate(-50%, -50%);
}

img{
	width:90%;
}

.login-wrapper{
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
    width: 400px;
    height: 350px;
    padding: 40px;
    box-sizing: border-box;
    display: block;
}

.login-wrapper > h2{
    font-size: 24px;
    color: #3A2618;
    margin-bottom: 20px;
    text-align: center;
}
#login-form > input{
    width: 100%;
    height: 40px;
    padding: 0 10px;
    box-sizing: border-box;
    margin-bottom: 10px;
    border: 1px solid #3A2618;
}
#login-form > input::placeholder{
    color: #D2D2D2;
}
#login-form > input[type="submit"]{
    color: #fff;
    font-size: 16px;
    background-color: #3A2618;
    margin-top: 10px;
    height: 50px;
}
#login-form > input[type="checkbox"]{
    display: none;
}
#login-form > label{
    color: #999999;
}
#login-form input[type="checkbox"] + label{
    cursor: pointer;
    padding-left: 26px;
}
#login-form input[type="checkbox"]:checked + label{
    background-image: url("checkbox-active.png");
    background-repeat: no-repeat;
    background-size: contain;
}
.ul{
	float: right;
}

li{
	list-style: none;
	float: left;
}

.find{
	margin-right: 10px;
}
a{
	text-decoration-line: none;
}
.login
</style>
</head>
<body>
	<div class="logo">
		<a href="/home.kh"> <img src="../resources/image/logo.png" /></a>
	</div>
	<div class="login-wrapper">
		<h2>Login</h2>
			<form action="${path}/user/login" method="post" id="login-form">
				<input type="hidden" name="status" value="${login.status }">
					<input type="text" name="userId" placeholder="Id">
					<input type="password" name="userPwd" placeholder="Password">
					<div class="checkbox icheck">
						<label for="remember-check">
						<input type="checkbox" name="useCookie" id="remember-check">로그인 유지
						</label>
						<ul class="ul">
						<li class="find"><a href="/user/findView">ID/PW찾기</a></li>
						<li class="join"><a href="/user/joinView.kh">JOIN</a></li>
						</ul>
					</div>
				<input type="submit" value="Login">
			<c:if test="${login.status == '1' or login.status =='0'}">
				<script type="text/javascript">
					alert("이미 로그인 하셨습니다. 메인으로 돌아갑니다.");
					location.href = "/home.kh";
				</script>
			</c:if>
		</form>
	</div>
</body>
</html>