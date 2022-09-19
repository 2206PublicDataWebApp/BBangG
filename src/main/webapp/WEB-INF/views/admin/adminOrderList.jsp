<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 주문 리스트</title>
</head>
<body>
		<h1 align="center">주문 목록</h1>
	<br><br>
	<table align="center" border="1">
		<tr>
			<td colspan="5" align="right">
				<form action="/admin/adminOrderList.kh?orderDate=orderdate">
				 <label>
				    날짜 : 
				    <input type="date" id="orderDate" name="date" >
				  </label>
				  <input type="submit" value="검색">
				  
				  
			</td>
		</tr>
		<tr>
			<th>주문번호</th>
			<th>주문점포</th>
			<th>주문날짜</th>
			<th>주문상태</th>
			<th>취소요청</th>
		</tr>
		<c:forEach items="${oList}" var="order" varStatus="i">
			<tr>
				<td><a href="/admin/adminOrderDetail.kh?orderNo=${order.orderNo }">${order.orderNo }</a></td>
				
				<td><a href="#">${order.storeNo}</a></td>
				<td>${order.orderDate}<td>
				<td>
					<c:if test="${order.orderState eq 0 }">입금전</c:if>
					<c:if test="${order.orderState eq 1 }">입금완료</c:if>
					<c:if test="${order.orderState eq 2 }">입금완료확인</c:if>
					<c:if test="${order.orderState eq 3}" >배송출발</c:if>
					<c:if test="${order.orderState eq 4}" >구매확정</c:if>
					<c:if test="${order.orderState eq 5}" >취소진행중</c:if>
				</td>
				<td>
					<c:if test="${order.orderState ne 5}" >N</c:if>
					<c:if test="${order.orderState eq 5}" >Y</c:if>
				</td>
			</tr>
		</c:forEach>
</body>
<script>
	document.getElementById('orderDate').valueAsDate = new Date();

</script>
</html>