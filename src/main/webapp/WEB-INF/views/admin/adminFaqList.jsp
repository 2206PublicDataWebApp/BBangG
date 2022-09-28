<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  table {
  width : 80%;
    border-top: 1px solid  #3A2618;
   
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #3A2618;
    padding: 10px;
    
  }
 	h1{
	font-weight: bold;
  	color : #3A2618;
 	
 }
#bodyWrapper{
	padding-left:200px;
	padding-top:80px;
}
.orderNo a,.storeNo a{
	color: mediumblue;
	
}
</style>
</head>
<body>
<jsp:include page = "/WEB-INF/views/include/header.jsp"/>
<jsp:include page="/WEB-INF/views/include/sideBar_admin.jsp"/>
<h1 align="center">FAQ 목록</h1>
<div id="all" style="padding:0px 300px 0px 300px"]>
	<br>
	<br>
	
	<table align="center" border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<c:if test="${!empty faqList }">
			<c:forEach items="${faqList }" var="faq" varStatus="i">
				<tr>
					<td>${i.count }</td>
					<td><a href="/faq/detail.kh?faqNo=${faq.faqNo }&page=${currentPage }">${faq.faqTitle }</a></td>
					<td>${faq.faqCreateDate }</td>
					<td>${faq.faqViewCount }</td>
				</tr>
			</c:forEach>

			<tr align="center" height="20">
			<td colspan="6">
				<c:if test="${currentPage != 1 }">
					<a href="/faq/${urlValue }.kh?page=${currentPage - 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}">[이전]</a>
				</c:if>
				<c:forEach var="p" begin="${startNavi }" end="${endNavi }">
					<c:if test="${currentPage eq p }">
						<b>${p }</b>
					</c:if>
					<c:if test="${currentPage ne p }">
						<a href="/faq/${urlValue }.kh?page=${p }&searchCondition=${searchCondition}&searchValue=${searchValue}">${p }</a>
					</c:if>
				</c:forEach>
				<c:if test="${maxPage > currentPage }">
					<a href="/faq/${urlValue }.kh?page=${currentPage + 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}">[다음]</a>
				</c:if>
			</td>
		</tr>
		</c:if>
		<c:if test="${empty faqList }">
			<tr>
				<td colspan="6" align="center"><b>데이터가 존재하지 않습니다.</b></td>
			</tr>
		</c:if>
		<tr>
			<td colspan="5" align="center">
				<form action="/faq/search.kh" method="get">
					<select name="searchCondition">
						<option value="all" <c:if test="${searchCondition eq 'all' }">selected</c:if>>전체</option>
						<option value="writer" <c:if test="${searchCondition eq 'writer' }">selected</c:if>>작성자</option>
						<option value="title" <c:if test="${searchCondition eq 'title' }">selected</c:if>>제목</option>
						<option value="content" <c:if test="${searchCondition eq 'contents' }">selected</c:if>>내용</option>
					</select>
					<input type="text" name="searchValue" value="${searchValue }">
					<input type="submit" value="검색">
				</form>
			</td>
			<td>
				<button onclick="location.href='/faq/writeView.kh';">글쓰기</button>
			</td>
		</tr>
	</table>
	</div>
</body>
</body>
</html>