<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 주문 리스트</title>
<style>
table {
	width: 80%;
	border-top: 1px solid #3A2618;
	border-collapse: collapse;
	text-align: center;
}

th, td {
	border-bottom: 1px solid #3A2618;
	padding: 10px;
}

h1 {
	font-weight: bold;
	color: #3A2618;
}

#bodyWrapper {
	padding-left: 200px;
	padding-top: 80px;
}

.orderNo a, .storeNo a {
	color: mediumblue;
	text-decoration-line: underline;
}

button {
	border: none;
	margin-right: 5px;
	cursor: pointer;
	background-color: transparent;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<jsp:include page="/WEB-INF/views/include/sideBar_admin.jsp" />
	<div id="bodyWrapper">
		<h1 align="center">전체 주문 목록</h1>
		<br>
		<br>
		<form action="/admin/adminOrderList.kh" method="get">
			<table align="center" border="1">
				<tr>
					<td colspan="3" align="left" style="border-right: none;"><select
						name="searchCondition" id="searchCondition">
							<option value="uId"
								<c:if test="${searchCondition eq 'userId' }">selected</c:if>>주문자
								아이디</option>
							<option value="oNo"
								<c:if test="${searchCondition eq 'orderNo' }">selected</c:if>>주문번호</option>
					</select> <input type="text" name="searchValue" id="searchValue"
						value=${searchValue }>
						<button type="submit">
							<img src="/resources/image/icon/serch_bt.png" height="20"
								width="20" />
						</button></td>
					<td colspan="3" align="right" style="border-left: none;"><label>
							날짜 : <input type="date" id="orderDate" name="orderDate" >
					</label>
						<button type="submit">
							<img src="/resources/image/icon/serch_bt.png" height="20"
								width="20" />
						</button></td>
				</tr>
				<tr>
					<th>주문번호</th>
					<th>주문점포</th>
					<th>주문자 아이디</th>
					<th style="width: 20%">주문날짜</th>
					<th>주문상태</th>
					<th>취소요청</th>
				</tr>
				<c:forEach items="${oList}" var="order" varStatus="i">
					<tr>
						<td class="orderNo"><a
							href="/admin/adminOrderDetail.kh?orderNo=${order.orderNo }">${order.orderNo }</a></td>
						<td class="storeNo"><a href="/store/storeDetail.kh?storeNo=${order.storeNo}">${order.storeNo}</a></td>
						<td>${order.userId }</td>
						<td>${order.orderDate}</td>
						<td><c:if test="${order.orderState eq 0 }">입금전</c:if> <c:if
								test="${order.orderState eq 1 }">입금완료</c:if> <c:if
								test="${order.orderState eq 2 }">입금완료확인</c:if> <c:if
								test="${order.orderState eq 3}">배송출발</c:if> <c:if
								test="${order.orderState eq 4}">구매확정</c:if> <c:if
								test="${order.orderState eq 5}">취소진행중</c:if></td>
						<td><c:if test="${order.orderState ne 5}">N</c:if> <c:if
								test="${order.orderState eq 5}">
								<div
									style="color: red; font-weight: bold; text-decoration: underline;">Y</div>
							</c:if></td>
					</tr>
				</c:forEach>
				<tr align="center" height="20">
					<td colspan="6"><c:if test="${currentPage!=1 }">
							<a href="/admin/adminOrderList.kh?searchCondition=${searchCondition }&searchValue=${searchValue }&orderDate=${orderDate }&page=${currentPage-1 }">[이전]</a>
						</c:if> <c:forEach var="p" begin="${startNavi }" end="${endNavi }">
							<c:if test="${currentPage eq p }">
								<b>${p }</b>
							</c:if>
							<c:if test="${currentPage ne p }">
								<a href="/admin/adminOrderList.kh?searchCondition=${searchCondition }&searchValue=${searchValue }&orderDate=${orderDate }&page=${p }">${p }</a>
							</c:if>
						</c:forEach> <c:if test="${maxPage>currentPage }">
							<a href="/admin/adminOrderList.kh?searchCondition=${searchCondition }&searchValue=${searchValue }&orderDate=${orderDate }&page=${currentPage+1 }">[다음]</a>
						</c:if></td>
				</tr>
			</table>
		</form>
		<br>
		<br>
		<br>
		<br>
	</div>
</body>
<script>
	<c:if test="${empty login}">
		alert("접근이 제한된 페이지 입니다. 메인으로 돌아갑니다.");
		location.href="/home.kh";	
	</c:if>
</script>
</html>