<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ include file="/WEB-INF/views/home.jsp" %>
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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

</style>
</head>
<body>
	<input type="hidden" name="userId" value="${login.userId }">
	<h1 align="center">${login.userId }님의 주문 목록</h1>
	<br><br>
	<table style="width:40%;"  align="center">
	
	 <tr>
	 	<th>결제확인/완료</th>
	 	<th>배송중/완료</th>
	 	<th>취소진행중/완료</th>
	 </tr>
	 <tr align="center">
	 	<td>${payState }</td>
	 	<td>${delivaryState }</td>
	 	<td>${cancleState }</td>
	 </tr>
	</table>
	<br><br>
	<table align="center" >
		<tr style="border-bottom: 3px solid  #3A2618;">
			<th>주문번호</th>
			<th>주문내역</th>
			<th>주문날짜</th>
			<th>입금상태</th>
			<th>배송상태</th>
		</tr>
		<c:forEach items="${oList}" var="order" varStatus="i">
			<tr align="center">
				<td><a href="/order/userOrderDetail.kh?orderNo=${order.orderNo }">${order.orderNo }</a></td>
				<td>${order.orderDetail}</td>
				<c:set var="orderDateOn" value="${order.orderDate}"/>
				<c:set var="simpleDate" value="${ fn:substring(orderDateOn,0,10)}"/>
				<td >${simpleDate }</td>
				
				<td>
					<c:if test="${order.orderState eq 0 }">입금전</c:if>
					<c:if test="${order.orderState eq 1 }">입금완료</c:if>
					<c:if test="${order.orderState eq 2 }">입금확인완료</c:if>
					<c:if test="${order.orderState eq 3}" >입금확인완료</c:if>
					<c:if test="${order.orderState eq 4}" >입금확인완료</c:if>
					<c:if test="${order.orderState eq 5}" >취소요청 진행중</c:if>
				</td>
				<td>
					<c:if test="${order.orderState eq 0 }">배송전</c:if>
					<c:if test="${order.orderState eq 1 }">배송전</c:if>
					<c:if test="${order.orderState eq 2 }">배송전</c:if>
					<c:if test="${order.orderState eq 3}" >배송출발</c:if>
					<c:if test="${order.orderState eq 4}" >구매확정</c:if>
					<c:if test="${order.orderState eq 5}" >취소요청 진행중</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>