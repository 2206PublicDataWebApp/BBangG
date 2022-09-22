<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="header-title">
	<div class="bbangg">
		<div>
			<a href="/home.kh"> <img class="logo"
				src="../resources/image/logo.png" /></a>
		</div>
	</div>
	<div class="menu-bar">
		<div id="menu">
			<a href="/store/userStoreList.kh">빵집검색</a>
		</div>
		<div id="menu">
			<a href="#">REVIEW</a>
		</div>
		<div id="menu">
			<a href="#">QNA</a>
		</div>
	</div>
	<div class="user">
		<c:if test="${empty login}">
			<div id="my">
				<ul class="my-ul">
					<li class="my-li"><a href="/user/loginView.kh">LOGIN</a></li>
					<li class="my-li"><a href="/user/joinView.kh">JOIN</a></li>
				</ul>
			</div>
		</c:if>
		<c:if test="${login.status == '1'}">
			<div id="my">
				<ul class="my-ul">
					<li class="my-li"><a href="/user/myPage.kh">MyPage</a></li>
					<li class="my-li"><a href="${path}/user/logout">LOGOUT</a></li>
				</ul>
			</div>
		</c:if>
		<c:if test="${login.status == '0'}">
			<div id="my">
				<ul class="my-ul">
					<li class="my-li"><a href="/admin/userList">AdminPage</a></li>
					<li class="my-li"><a href="${path}/user/logout">LOGOUT</a></li>
				</ul>
			</div>
		</c:if>
	</div>
</div>