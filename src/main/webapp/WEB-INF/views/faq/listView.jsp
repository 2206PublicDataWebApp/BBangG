<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center">게시글목록</h1>
	<br>
	<br>
	<table align="center" border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
			<th>첨부파일</th>
		</tr>
		<c:if test="${!empty faqList }">
			<c:forEach items="${faqList }" var="faq" varStatus="i">
				<tr>
					<td>${i.count }</td>
					<td><a href="/faq/detail.kh?faqNo=${faq.faqNo }">${faq.faqTitle }</a></td>
					<td>${faq.faqWriter }</td>
					<td>${faq.faqCreateDate }</td>
					<td>${faq.faqViewCount }</td>
					<td><c:if test="${!empty faq.faqFilename }">
					O
					</c:if> <c:if test="${empty faq.faqFilename }">
					X
					</c:if></td>
				</tr>
			</c:forEach>

			<tr align="center" height="20">
				<td colspan="6"><c:if test="${currentPage != 1 }">
						<a href="/faq/list.kh?page=${currentPage - 1 }">[이전]</a>
					</c:if> <c:forEach var="p" begin="${startNavi }" end="${endNavi }">
						<c:if test="${currentPage eq p }">
							<b>${p }</b>
						</c:if>
						<c:if test="${currentPage ne p }">
							<a href="/faq/list.kh?page=${p }">${p }</a>
						</c:if>
					</c:forEach> <c:if test="${maxPage > currentPage }">
						<a href="/faq/list.kh?page=${currentPage + 1 }">[다음]</a>
					</c:if></td>
			</tr>
		</c:if>
		<c:if test="${empty faqList }">
			<tr>
				<td colspan="6" align="center">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>

		<td colspan="5" align="center">
			<form action="/faq/search.kh" value="get">
				<select name="searchCondition">
					<option value="all">전체</option>
					<option value="writer">작성자</option>
					<option value="title">제목</option>
					<option value="contents">내용</option>
				</select> <input type="text" name="searchValue">
				<button>
					검색</b utton>
			</form>
		</td>
		<td>
			<button onclick="location.href ='/faq/writeView.kh'">글쓰기</button>
		</td>
		</tr>
	</table>
</body>
</html>