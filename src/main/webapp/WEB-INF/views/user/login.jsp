<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
</head>
<body>
	<form action="${path}/user/login" method="post">
		<input type="hidden" name="status" value="${login.status }">
		<div>
			ID <input type="text" name="userId">
		</div>
		<div>
			PW <input type="password" name="userPwd">
		</div>
		<div class="col-xs-8">
			<div class="checkbox icheck">
				<label> <input type="checkbox" name="useCookie">
					로그인유지
				</label>
			</div>
		</div>
		<div><input type="submit" value="로그인"></div>
		<div><a href="/user/findView">ID 찾기</a></div>
		<div><a href="/user/findView">PW 찾기</a></div>
		<div><a href="/user/joinView.kh">회원가입</a></div>
	<c:if test="${login.status == '1' or login.status =='0'}">
		<script type="text/javascript">
			alert("이미 로그인 하셨습니다. 메인으로 돌아갑니다.");
			location.href = "/home.kh";
		</script>
	</c:if>
	</form>
</body>
</html>