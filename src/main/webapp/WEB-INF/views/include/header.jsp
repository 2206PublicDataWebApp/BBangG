<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<header>
	<nav id="nav">
		<ul>
			<a href="#">Home</a>
			<a href="/store/userStoreList.kh">빵집검색</a>
			<a href="#">리뷰게시판</a>
			<a href="#">QnA게시판</a>
			<c:if test="${empty login}">
			<a href="/user/loginView.kh">로그인</a>
			<a href="/user/joinView.kh">회원가입</a>
			</c:if>
			<c:if test="${login.status == '1'}">
			<a href="/user/myPage.kh">마이페이지</a>
			<a href="${path}/user/logout">로그아웃</a>
			</c:if>
			<c:if test="${login.status == '0'}">
			<a href="/user/myPage.kh">관리자페이지</a>
			<a href="${path}/user/logout">로그아웃</a>
			</c:if>
		</ul>
	</nav>
</header>