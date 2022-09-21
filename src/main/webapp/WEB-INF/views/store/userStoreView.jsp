<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.wrapper {
	display: grid;
	grid-template-rows: repeat(3, 300px);
	grid-template-columns: repeat(3, 300px);
	column-gap: 50px;
	row-gap: 50px;
	margin-left: 100px;
	margin-right: 100px;
	justify-content: center;
	align-content: center;
}

.item {
	border: 1px solid black;
}

.image {
	width: 100%;
	height: 250px;
}

.word {
	width: 100%;
	height: 50px;
	text-align: center;
}

img {
	width: 100%;
	height: 100%;
	object-fit: contain;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<section>
		<h1 align="center">빵집 리스트</h1>
		<div class="wrapper">
			<c:forEach items="${sList }" var="store">
				<div class="item">
					<a href="/store/storeDetail.kh?storeNo=${store.storeNo }">
						<div class="image">
							<img src="/resources/store-images/${store.storeFileRename }"
								alt="" />
						</div>
						<div class="word">${store.storeName }</div>
					</a>
				</div>
			</c:forEach>
		</div>
		<table align="center">
			<tr>
				<td colspan="6"><c:if test="${currentPage != 1}">
						<a
							href="/store/${urlVal }.kh?page=${currentPage - 1 }%searchCondition=${searchCondition }&searchValue=${searchValue }">
							이전 </a>
					</c:if> <c:forEach var="p" begin="${startNavi }" end="${endNavi }">
						<c:if test="${currentPage eq p }">
							<b>${p }</b>
						</c:if>
						<c:if test="${currentPage ne p }">
							<a
								href="/store/${urlVal }.kh?page=${p}&searchCondition=${searchCondition}&searchValue=${searchValue}">${p }</a>
						</c:if>
					</c:forEach> <c:if test="${maxPage > currentPage }">
						<a
							href="/store/${urlVal }.kh?page=${endNavi +1}&searchCondition=${searchCondition}&searchValue=${searchValue}">다음</a>
					</c:if></td>
			</tr>
		</table>
		<form action="/store/userStoreSearch.kh" method="get">
			<select name="searchCondition">
				<option value="all">전체</option>
				<option value="name">이름</option>
				<option value="region">지역</option>
			</select> <input type="text" name="searchValue" value="${searchValue }">
			<input type="submit" value="검색">
		</form>
	</section>
	<footer></footer>
</body>
</html>