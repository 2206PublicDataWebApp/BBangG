<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
=======
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
>>>>>>> refs/remotes/origin/KHJ
<html>
<head>
	<title>Home</title>
</head>
<body>
	<nav id="nav">
		<ul>
			<a href="#">Home</a>
			<a href="/store/userStoreList.kh"">빵집검색</a>
			<a href="#">리뷰게시판</a>
			<a href="#">QnA게시판</a>
			<c:if test="${sessionScope.loginUser eq null }">
			<a href="/user/loginView.kh">로그인</a>
			<a href="/user/joinView.kh">회원가입</a>
			</c:if>
			<c:if test="${sessionScope.loginUser ne null }">
			<a href="/user/myPage.kh">마이페이지</a>
			<a href="/user/logout.kh">로그아웃</a>
			</c:if>
		</ul>
	</nav>
</body>
</html>
