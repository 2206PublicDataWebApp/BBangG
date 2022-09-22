<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<style>
#nav {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    z-index: 1000;
    transition: top .3s;
    background: #fff;
    --main-color: #002954;
    --sub-color: #8db9ea;
    --width: 1500px;
    --main-padding: 0 15px;
}
html, body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, input, textarea, p, blockquote, th, td, img {
    margin: 0;
    padding: 0;
    font-family: 'Montserrat','Noto Sans KR',"Malgun Gothic","맑은 고딕",-apple-system,BlinkMacSystemFont,helvetica,"Apple SD Gothic Neo",sans-serif;
}
</style>
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