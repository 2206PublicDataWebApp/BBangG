<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<c:forEach items="${faqList }" var="faq" varStatus="i" >
		<tr>
			<td>${i.count }</td>
			<td>${faq.faqTitle }</td>
			<td>${faq.faqWriter }</td>
			<td>${faq.faqCreateDate }</td>
			<td>${faq.faqViewCount }</td>
			<td>0</td>
		</tr>
		</c:forEach>
		<tr align="center" height="20">
		<td colspan="6">
		<a href="/faq/list.kh?page=1">1</a>
		<a href="/faq/list.kh?page=2">2</a>
		<a href="/faq/list.kh?page=3">3</a>
		<a href="/faq/list.kh?page=4">4</a>
		<a href="/faq/list.kh?page=5">5</a>
		</td>
		</tr>
	</table>
</body>
</html>