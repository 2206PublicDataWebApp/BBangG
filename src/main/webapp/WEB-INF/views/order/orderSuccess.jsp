<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/include/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

#bodyWrapper{
	padding-left:200px;
	padding-top:80px;
	margin-bottom:50px;
	  text-align:center;
}

  #f_table {
  	width : 80%;
    border-top: 1px solid  #3A2618;
    border-bottom: 1px solid #3A2618;
    border-collapse: collapse;
    margin-left:10%;
  }
  
  th, td {
    padding: 10px;
    
  }
  
 h1{
color : #3A2618;
 	
 }

div span a{
 	height: 20px;
	width: 80px;
	background-color: #3A2618;
	color: #ffffff;
	border: 1px solid;
	border-color: #3A2618;
	padding-left:3px;
	padding-right:3px;
 }
 div span a:hover{
 	background-color: #ffffff;
	color: #3A2618;
	border: 1px solid;
	border-color: #3A2618;
 }
 
</style>
<body>
<jsp:include page = "/WEB-INF/views/include/header.jsp"/>
<jsp:include page="/WEB-INF/views/include/sideBar_user.jsp"/>
<div id="bodyWrapper">
	<h1>주문 성공</h1>
	<br>
	<br>
	<span style="margin-right:65%; margin-bottom:20px">주문일시 ${order.orderDate }</span>
	<br>
	<br>
	<table id="f_table" >
	<tr>
	<td style="border-bottom:2px solid #3A2618"><h2>- 주문번호 : ${order.orderNo } -</h2></td>
	</tr>
				<tr>
					<td>${order.orderDetail }</td>
				</tr>
				<tr>
					<td>+배송비${order.orderShipfee }원</td>
				</tr>
				<tr style=" border-bottom: 1px solid #3A2618;">
					<td style="font-size:20px; font-weight:bold;">합계${order.totalPrice}원</td>
				</tr>
				<tr>
					<td style="font-size:20px; font-weight:bold;">입금계좌 ${store.storeAccount } ${store.storeBank }</th>
				</tr>
				<tr>
					<td style="font-size:20px; font-weight:bold;"> 입금주명 ${store.storeName } </td>
				</tr>

		</table>
		<br>
		<div >
			<span style="margin-right:68%"><a href="/home.kh">홈으로</a></span>
			<span ><a href="/order/userOrderList.kh?userId=${login.userId }">나의 주문내역</a></span>
		</div>		
</div>
</body>
</html>