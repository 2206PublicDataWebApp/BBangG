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
	<h1 align="center">회원 목록</h1>
	<br><br>
	<table align="center" border="1">
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>주소</th>
		</tr>
		<c:if test="${!empty uList }">
			<c:forEach items="${uList }" var="uList" varStatus="i">
				<tr>
					<td>${i.count }</td>
					<td>${uList.userId }</td>
					<td>${uList.userName }</td>
					<td>${uList.userGender }</td>
					<td>${uList.userEmail }</td>
					<td>${uList.userPhone }</td>
					<td>(${uList.userZipCode }) ${uList.addr } ${uList.addrDetail }</td>
				</tr>
			</c:forEach>
			<tr align="center" height="20">
			<td colspan="6">
				<c:if test="${currentPage != 1 }">
					<a href="/admin/${urlVal }.kh?page=${currentPage - 1 }&searchCondition=${searchCondition}$searchValue=${searchValue}">[이전]</a>
				</c:if>
				<c:forEach var="p" begin="${startNavi }" end="${endNavi }">
					<c:if test="${currentPage eq p }">
						<b>${p }</b>
					</c:if>
					<c:if test="${currentPage ne p }">
						<a href="/admin/${urlVal }.kh?page=${p }&searchCondition=${searchCondition}$searchValue=${searchValue}">${p }</a>
					</c:if>
				</c:forEach>
				<c:if test="${maxPage > currentPage }">
					<a href="/admin/${urlVal }.kh?page=${currentPage + 1 }&searchCondition=${searchCondition}$searchValue=${searchValue}">[다음]</a>
				</c:if>
			</td>
		</tr>
		</c:if>
		<c:if test="${empty uList }">
			<tr>
				<td colspan="6" align="center"><b>데이터가 존재하지 않습니다.</b></td>
			</tr>
		</c:if>
		<tr>
			<td colspan="5" align="center">
			${searchCondition }
				<form action="/board/search.kh" method="get">
					<select name="searchCondition">
						<option value="all" <c:if test="${searchCondition eq 'all'}">selected</c:if>>전체</option>
						<option value="id" <c:if test="${searchCondition eq 'id'}">selected</c:if>>ID</option>
						<option value="name" <c:if test="${searchCondition eq 'name'}">selected</c:if>>이름</option>
						<option value="email" <c:if test="${searchCondition eq 'email'}">selected</c:if>>메일</option>
					</select>
					<input type="text" name="searchValue" value="${searchValue }">
					<input type="submit" value="검색">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>