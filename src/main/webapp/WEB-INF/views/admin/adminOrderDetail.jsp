<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 주문 상세페이지</title>
</head>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script>

<c:if test="${empty login}">
	alert("접근이 제한된 페이지 입니다. 메인으로 돌아갑니다.");
	location.href="/home.kh";	
</c:if>

</script>
<style>
#f_table {
	width: 90%;
	border-top: 1px solid #3A2618;
	border-bottom: 1px solid #3A2618;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
}
 h1{
 	    font-weight: bold;
            color : #3A2618;
 	
 }

#cover {
	text-align: center;
	
	
}

.menu {
	text-align: center;
	display: inline-block; .
	display: inline;
}
#bodyWrapper{
	padding-left:200px;
	padding-top:80px;
margin-bottom:10%;
}
#btn_receiveConfirm,#btn_delivaryStart{
 height:30px; 
 background-color:#F0F0F0;
 border: none;
}
#btn_orderCancleY{
	background-color:red;
 	color:#ffffff;
 	border:1px solid;
 	border-color:red;
}
#btn_orderCancleN{
	background-color:dimgray;
 	color:#ffffff;
 	border:1px solid;
 	border-color:dimgray;
}
</style>
<body>
<jsp:include page = "/WEB-INF/views/include/header.jsp"/>
<jsp:include page="/WEB-INF/views/include/sideBar_admin.jsp"/>
<div id="bodyWrapper">
	<h1 align="center">주문 상세정보</h1>
	
	
	<br>
	<br>
	<table align="center"  id="f_table" style="text-align:center">
		<div style="margin-left: 5%;">주문날짜 ${order.orderDate }</div>
		<br>
		<tr style=" border-bottom: 1px solid  #3A2618;">
			<th>주문번호</th>
			<th>주문내역</th>
			<th>주문점포</th>
			<th>입금상태</th>
			<th>배송상태</th>
		</tr>
		<tr>
			<td>${order.orderNo }</td>
			<td>${order.orderDetail}</td>
			<td><a href="#">${order.storeNo}</a></td>
			<td><c:if test="${order.orderState eq 0 }">입금전</c:if> <c:if
					test="${order.orderState eq 1 }">입금완료 <button id="btn_receiveConfirm" type="button">입금확인</button></c:if> <c:if
					test="${order.orderState eq 2 }">입금확인완료</c:if> <c:if
					test="${order.orderState eq 3}">입금확인완료</c:if> <c:if
					test="${order.orderState eq 4}">입금확인완료</c:if> <c:if
					test="${order.orderState eq 5}">취소요청 진행중</c:if></td>
			<td><c:if test="${order.orderState eq 0 }">배송전</c:if> <c:if
					test="${order.orderState eq 1 }">배송전</c:if> <c:if
					test="${order.orderState eq 2 }">배송전 <button id="btn_delivaryStart" type="button">배송출발</button></c:if> <c:if
					test="${order.orderState eq 3}">배송출발(구매확정 대기중)</c:if> <c:if
					test="${order.orderState eq 4}">구매확정</c:if> <c:if
					test="${order.orderState eq 5}">취소요청 진행중</c:if></td>
		</tr>
	</table>
	<br>
	<br>
	<br>
	<div style="width:90%; margin-left:5%;">
		<div style="width:32%; float:left;">
		<h2>주문자 정보</h2>
			<table>
				<tr>
					<th>주문자 이름</th>
					<td ><a href="#">${order.orderName }</a></td>
				</tr>
				<tr>
					<th>주문자 연락처</th>
					<td ><a href="#">${order.orderPhone }</a></td>
				</tr>
			</table>
			<br>
			<table >
					<h2>배송지정보</h2>
					<tr>
						<th>수령인</th>
						<td>${order.delivaryName }</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>${order.delivaryPhone }</td>
					</tr>
					<tr>
						<th>배송지</th>
						<td>${delivaryFullAdd }</td>
					</tr>
					<tr>
						<th>배송메모</th>
						<td>${order.delivaryMemo }</td>
					</tr>
				</table>
		</div>
		<div style=" height:400px;width:37%; float:left; text-align:left; padding-left:30px; border-right:1px solid; border-left:1px solid">
			<h2>결제내역</h2>
		<table >
				<tr>
					<td>${order.orderDetail }</td>
				</tr>
				<tr>
					<td>+배송비${order.orderShipfee }원</td>
				</tr>
				<tr>
					<td style="font-size:20px; font-weight:bold;">합계${order.totalPrice}원</td>
				</tr>
				<tr>
					<td>${store.storeTel }</td>
				</tr>
				<tr>
					<td>${store.storeName }</td>
				</tr>
			</table>
		</div>
		<div style="width:23%; float:left;margin-left:20px">	
			<table style="width:100%">
				<h2>주문 상태</h2>
				<tr>
					<td colspan="2">취소 요청 여부</td>
				</tr>
				<tr>
					<td><c:if test="${order.orderState eq 5 }">Y</c:if>
						<c:if test="${order.orderState ne 5 }">N</c:if></td>
					<td align="right">
						<c:if test="${order.orderState eq 5 }">
							<button id="btn_orderCancleY" type="button">주문취소</button>
						</c:if>
						<c:if test="${order.orderState ne 5 }">
							<button id="btn_orderCancleN" type="button">주문취소</button>
						</c:if>
					</td>
				</tr>
			</table>
		</div>
	

	</div>
</div>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


</body>
<script type="text/javascript">
	
		
		$("#btn_receiveConfirm").click(function(){
			if(${order.orderState}==0){
				event.preventDefault();
				alert("주문자가 입금 전입니다.");
			}else if(${order.orderState}==1){
				if(confirm("입금 확인완료 하시겠습니까?")){
				location.href="/admin/adminChangeOrderState.kh?orderNo="+${order.orderNo };
				}
			}else if(${order.orderState}==2){
				event.preventDefault();
				alert("이미 입금 확인완료 상태입니다.");
			}else if(${order.orderState}==3){
				event.preventDefault();
				alert("이미 배송출발 상태입니다.");
			}else if(${order.orderState}==4){
				event.preventDefault();
				alert("이미 구매 확정된 주문입니다.");
			}else{
				event.preventDefault();
				alert("주문 취소 진행중입니다.");
			}
			
		});	
		
		$("#btn_delivaryStart").click(function(){
			if(${order.orderState}==0){
				event.preventDefault();
				alert("주문자가 입금 전입니다.");
			}else if(${order.orderState}==1){
				event.preventDefault();
				alert("입금 확인완료부터 진행하여 주세요");
			}else if(${order.orderState}==2){
				if(confirm("배송출발 상태로 변경 하시겠습니까?")){
					location.href="/admin/adminChangeOrderState.kh?orderNo="+${order.orderNo };
					}
			}else if(${order.orderState}==3){
				event.preventDefault();
				alert("이미 배송출발 상태입니다.");
			}else if(${order.orderState}==4){
				event.preventDefault();
				alert("이미 구매 확정된 주문입니다.");
			}else{
				event.preventDefault();
				alert("주문 취소 진행중입니다.");
			}
			
		});
		$("#btn_orderCancleY").click(function(){
			
				if(confirm("주문 취소 하시겠습니까?")){
					location.href="/admin/adminOrderRemove.kh?orderNo="+${order.orderNo };
					}
		});
		$("#btn_orderCancleN").click(function(){
				event.preventDefault();
				alert("취소요청이 없으므로 주문취소 불가합니다.")
		});
	

	
	</script>

</html>