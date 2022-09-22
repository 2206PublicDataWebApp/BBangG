<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 주문 상세페이지</title>
</head>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style>
  #f_table {
  width : 80%;
    border-top: 1px solid  #3A2618;
   
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
 #cover{
  text-align:center;
}

.menu {
  display:inline-block;.display:inline;
  
}

</style>
<body>
	<h1 align="center">주문 상세정보</h1>
	<br><br>
	<table id="f_table" align="center" style="text-align:center">
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
				<td >
					<c:if test="${order.orderState eq 0 }">입금전</c:if>
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
					<c:if test="${order.orderState eq 3}" >배송출발</c:if>
					<c:if test="${order.orderState eq 4}" >구매확정</c:if>
					<c:if test="${order.orderState eq 5}" >취소요청 진행중</c:if>
				</td>
			</tr>
		</table>
		<br><br>
		<div id="cover">
		<div class="menu" style="width: 30%; ">
			<table align="center">
				<h3 >배송지 정보</h3>
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
		<div class="menu" style="width: 30%;">
		<table  align="center">
			<h3>주문자 정보</h3>
				<tr>
					<td>${user.userName }</td>
				</tr>
				<tr>
					<td>${user.userPhone }</td>
				</tr>
		</table>
		<br><br>
		<table align="center" style="border:none">
			<div style="margin:10%">
				<div style="width: 20%; float:left"><button id="btn_sendMoney" type="button">입금완료</button></div>
				<div style="width: 35%; float:left"><button id="btn_orderRemove" type="button">주문취소요청</button></div>
				<div style="width: 20%; float:left"><button id="btn_orderModify" type="button">주문수정</button></div>
				<div style="width: 20%; float:left"><button id="btn_orderConfirm" type="button">구매확정</button></div>
				
			</div>
		</table>
		</div>
		<div class="menu" style="width: 30%; ">
		<table align="center">
			<h3>결제 내역</h3>
			
				<tr>
					<td>${order.orderDetail }</td>
				</tr>
				<tr>
					<td>${order.totalPrice}원</td>
				</tr>
				<tr>
					<th>${store.storeAccount }</th>
				</tr>
				<tr>
					<td>${store.storeBank }  ${store.storeName }  은행명</td>
				</tr>
			</table>
		</div>
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
				if(confirm("주문 취소 하시겠습니까?")){
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