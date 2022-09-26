<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
 <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/moment@2.29.1/moment.min.js"></script>
<style>
  table {
  	width : 80%;
    border-top: 1px solid  #3A2618;
   	align:center;
   	text-align:center;
    border-collapse: collapse;
    margin-left:auto;
	margin-right:auto;
  }
  th, td {
    border-bottom: 1px solid #3A2618;
    padding: 10px;
    
  }
 h1{
 	    font-weight: bold;
            color : #3A2618;
 	
 }
 button{
  	border: none;
  	margin-right:5px;
  	cursor:pointer;
 	
 }
input[type=date]{
border: none;
border-bottom:1px solid #3A2618;
}
#bodyWrapper{
	padding-left:200px;
	padding-top:80px;
}


</style>
</head>
<body>
<jsp:include page = "/WEB-INF/views/include/header.jsp"/>
<jsp:include page="/WEB-INF/views/include/sideBar_admin.jsp"/>
	<div id="bodyWrapper">
		<input type="hidden" name="userId" value="${login.userId }">
		<h1 align="center">${login.userId }님의 주문 목록</h1>
		<br><br>
		<table style="width:40%; ">
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
		
		<div style="text-align:right;padding-right:10%">
			<div>
				<form action="/order/userOrderList.kh" method="get">
					<button onclick="set3Months()">3개월</button>
					<button onclick="set1Months()">1개월</button>
					<button onclick="set1Week()">1주일</button>
					<button onclick="set3Days()">3일</button>
					<button onclick="setToday()">오늘</button>
					 <label style="margin-left:20px;">
					     
					    <input type="date" id="dateFrom" name="dateFrom" value="${dateFrom }">
					    ~
					    <input type="date" id="dateTo" name="dateTo" value="${dateTo }">
					    <input type="hidden" name="userId" value="${login.userId }">
					  </label>
					 <button type="submit" style="background-color:transparent;">
					 <img src="/resources/image/icon/serch_bt.png" height ="20" width="20" /></button>
				</form>
			</div>
		</div>
		<br>
			
			<table>
			<tr style="border-bottom: 3px solid  #3A2618;">
				<th>주문번호</th>
				<th>주문내역</th>
				<th>주문날짜</th>
				<th>입금상태</th>
				<th>배송상태</th>
			</tr>
			<c:forEach items="${oList}" var="order" varStatus="i">
				<tr>
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
	</div>

</style>
<script>
var from = document.getElementById("dateFrom");
var end = document.getElementById("dateTo");
function set3Months(){
	from.value = moment().add(-3,'M').format("YYYY-MM-DD");
	end.value = moment().format("YYYY-MM-DD"); }
	
function set1Months(){
	from.value = moment().add(-1,'M').format("YYYY-MM-DD");
	end.value = moment().format("YYYY-MM-DD"); }
	
function set1Week(){
	from.value = moment().add(-1,'w').format("YYYY-MM-DD");
	end.value = moment().format("YYYY-MM-DD"); }
	
function set3Days(){
	from.value = moment().add(-3,'d').format("YYYY-MM-DD");
	end.value = moment().format("YYYY-MM-DD"); }
function setToday(){
	from.value=moment().format("YYYY-MM-DD");
	end.value=moment().format("YYYY-MM-DD");
	
}




</script>
</body>
</html>