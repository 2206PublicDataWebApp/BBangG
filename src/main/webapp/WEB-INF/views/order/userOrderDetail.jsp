<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 주문 상세페이지</title>
</head>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style>

  #f_table {
  width : 90%;
    border-top: 1px solid  #3A2618;
   
    border-bottom: 1px solid #3A2618;
    border-collapse: collapse;
  }
  th, td {
    padding: 10px;
    
  }
 h1{
 	  
            color : #3A2618;
 	
 }
 #cover{
  text-align:center;
}

.menu {
  display:inline-block;.display:inline;
  
}

#bodyWrapper{
	padding-left:200px;
	padding-top:80px;
	margin-bottom:50px;
}
#btn_orderRemove{
	background-color:#F0F0F0;
 	color:#3A2618;
 	border:1px solid;
 	border-color:#F0F0F0;
 	height:30px;
 	font-size:16px;

}
#btn_sendMoney,#btn_orderConfirm{
	background-color:#3A2618;
 	color:#ffffff;
 	border:1px solid;
 	border-color:#3A2618;
 	height:30px;
 	font-size:16px;
 	cursor:pointer;
}
#btn_orderModify{
	background-color:#3A2618;
 	color:#ffffff;
 	border:1px solid;
 	border-color:#3A2618;
 	 height:30px;
 	font-size:16px;
}
#btn_orderRemove:hover{
	background-color:#ffffff;
 	color:#3A2618;
 	border:1px solid;
 	border-color:#3A2618;
}
#btn_orderModify:hover{
 	background-color:#ffffff;
 	color:#3A2618;
 	border:1px solid;
 	border-color:#3A2618;
}
.storeNo a{
	color: mediumblue;
	text-decoration-line:underline;
	
}
</style>
<body>
<jsp:include page = "/WEB-INF/views/include/header.jsp"/>
<jsp:include page="/WEB-INF/views/include/sideBar_user.jsp"/>
<div id="bodyWrapper">
	<h1 align="center">주문 상세정보</h1>
	<br><br>
	<table id="f_table" align="center" style="text-align:center">
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
				<td class="storeNo"><a href="/store/storeDetail.kh?storeNo=${order.storeNo}">${store.storeName }</a></td>
				<td >
					<c:if test="${order.orderState eq 0 }">입금전  <button id="btn_sendMoney" type="button">입금완료</button></c:if>
					<c:if test="${order.orderState eq 1 }">입금완료(입금확인 대기중)</c:if>
					<c:if test="${order.orderState eq 2 }">입금확인완료</c:if>
					<c:if test="${order.orderState eq 3}" >입금확인완료</c:if>
					<c:if test="${order.orderState eq 4}" >입금확인완료</c:if>
					<c:if test="${order.orderState eq 5}" >취소요청 진행중</c:if>
				</td>
				<td>
					<c:if test="${order.orderState eq 0 }">배송전</c:if>
					<c:if test="${order.orderState eq 1 }">배송전</c:if>
					<c:if test="${order.orderState eq 2 }">배송전</c:if>
					<c:if test="${order.orderState eq 3}" >배송출발  <button id="btn_orderConfirm" type="button">구매확정</button></c:if>
					<c:if test="${order.orderState eq 4}" >구매확정</c:if>
					<c:if test="${order.orderState eq 5}" >취소요청 진행중</c:if>
				</td>
			</tr>
		</table>
		<br><br>
	<div style="width:90%; margin-left:8%;">
		<div style="width:45%; float:left;">
		<table style="text-align:left">
			<h2>주문자 정보</h2>
				<tr>
					<th>주문자 이름</th>
					<td>${order.orderName }</td>
				</tr>
				<tr>
					<th>주문자 연락처</th>
					<td>${order.orderPhone }</td>
				</tr>
		</table>
		<br>
			<table>
				<h2 >배송지 정보</h2>
					<tr>
						<th>수령인</th>
						<td style="text-align:left">${order.delivaryName }</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td style="text-align:left">${order.delivaryPhone }</td>
					</tr>
					<tr>
						<th>배송지</th>
						<td style="text-align:left">${order.delivaryZipcode} ${delivaryFullAdd }</td>
					</tr>
					<tr>
						<th>배송메모</th>
						<td style="text-align:left">${order.delivaryMemo }</td>
					</tr>
				</table>
		</div>
		<div style=" height:500px;width:45%; float:left; text-align:left; padding-left:30px; border-left:1px solid">
		<table style="width:90%;">

		<h2>결제 내역</h2>
				<tr>
					<td>${order.orderDetail }</td>
				</tr>
				<tr>
					<td>+배송비${order.orderShipfee }원</td>
				</tr>
				<tr>
					<td style="font-size:20px; font-weight:bold; text-align:right">합계${order.totalPrice}원</td>
				</tr>
				<tr>
					<th>입금계좌 ${store.storeAccount }</th>
				</tr>
				<tr>
					<td>${store.storeBank } ${store.storeName } </td>
				</tr>
		</table>
		</div>
</div>
<br>
	<span style="margin-top:30%; margin-left:75%">
		<button id="btn_orderModify" type="button">주문수정</button>
		<button id="btn_orderRemove" type="button">주문취소요청</button>
	</span>
</div>
			

	<script type="text/javascript" >
		$("#btn_sendMoney").click(function(){
			if(${order.orderState}==0){
				if(confirm("입금완료 하셨습니까?")){
					location.href="/order/userChangeOrdeState.kh?orderNo="+${order.orderNo };
				}
			}else{
				event.preventDefault();
				alert("취소 신청중 이거나, 이미 입금 완료된 주문입니다.");
			}
			
		});
		$("#btn_orderRemove").click(function(){
			if(${order.orderState}==0 ){
				if(confirm("입금 전 이므로 즉시 주문취소 가능합니다. 주문 취소 하시겠습니까?")){
				location.href="/order/orderRemove.kh?orderNo="+${order.orderNo };
				}
			}else if(${order.orderState}==1||${order.orderState}==2){
				event.preventDefault();
				if(confirm("입금완료 상태이므로 즉시취소 불가합니다.취소요청 하시겠습니까?")){
					location.href="/order/orderRemoveRequest.kh?orderNo="+${order.orderNo };
				}
			}else if(${order.orderState}==3){
				event.preventDefault();
				alert("배송출발 상태이므로 취소요청 불가합니다. 문의바랍니다.");
			}else if(${order.orderState}==4){
				event.preventDefault();
				alert("이미 구매 확정된 주문입니다.");
			}
			else{
				event.preventDefault();
				alert("이미 취소요청 진행중입니다.");
			}
			
		});
		$("#btn_orderModify").click(function(){
			if(${order.orderState}==0||${order.orderState}==1||${order.orderState}==2){
				location.href="/order/orderModifyView.kh?orderNo="+${order.orderNo };
			}else if(${order.orderState}==3){
				event.preventDefault();
				alert("배송출발 상태이므로 수정 불가합니다.문의바랍니다.");
			}else if(${order.orderState}==4){
				event.preventDefault();
				alert("이미 구매 확정된 주문입니다.");
			}else{
				event.preventDefault();
				alert("취소요청 진행중이므로 수정 불가합니다.");
			}
			
		});
		$("#btn_orderConfirm").click(function(){
			if(${order.orderState}==3){
				if(confirm("구매확정 하시겠습니까?")){
					location.href="/order/userChangeOrdeState.kh?orderNo="+${order.orderNo };
					
				}
			}else{
				event.preventDefault();
				alert("배송 전이거나 주문 취소요청 중입니다. 현재 구매확정 불가합니다.");
			}
			
		});
	
	</script>
	</body>
</html>