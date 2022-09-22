<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 주문 상세페이지</title>
</head>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style>
#f_table {
	width: 80%;
	border-top: 1px solid #3A2618;
	border-bottom: 1px solid #3A2618;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
}

h1 {
	color: #fff;
}

#cover {
	text-align: center;
	
	
}

.menu {
	text-align: center;
	display: inline-block; .
	display: inline;
}
 #title {
    line-height: 56px;
    color: #fffff;
    font-size: 15px;
    font-weight: normal;
    text-align: center;
    background: #3A2618;
    position:relative;
}
</style>
<body>
	<div id="title" >
	<h1 align="center">주문 상세정보</h1>
	
	</div>
	<br>
	<br>
	<table align="center"  id="f_table" style="text-align:center">
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
					test="${order.orderState eq 1 }">입금완료</c:if> <c:if
					test="${order.orderState eq 2 }">입금확인완료</c:if> <c:if
					test="${order.orderState eq 3}">입금확인완료</c:if> <c:if
					test="${order.orderState eq 4}">입금확인완료</c:if> <c:if
					test="${order.orderState eq 5}">취소요청 진행중</c:if></td>
			<td><c:if test="${order.orderState eq 0 }">배송전</c:if> <c:if
					test="${order.orderState eq 1 }">배송전</c:if> <c:if
					test="${order.orderState eq 2 }">배송전</c:if> <c:if
					test="${order.orderState eq 3}">배송출발</c:if> <c:if
					test="${order.orderState eq 4}">구매확정</c:if> <c:if
					test="${order.orderState eq 5}">취소요청 진행중</c:if></td>
		</tr>
	</table>
	<br>
	<br>
	<br>
	<div id="cover" >
		<div class="menu" style="width: 30%; ">
				<table  align="center" style="width: 100%;">
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
			<div class="menu" style="width: 30%; ">
				<table  style="width: 100%;">
				<h3 >주문자 정보</h3>
				<tr>
					<td colspan="2"><a href="#">${order.userId }</a></td>
				</tr>
				<tr>
					<td><br><br><br><button id="btn_receiveConfirm" type="button">입금확인</button></td>
					<td><br><br><br><button id="btn_delivaryStart" type="button">배송출발</button></td>
				</tr>
				<tr>
					<td colspan="2">취소 요정 여부</td>
				</tr>
				<tr>
					<td><c:if test="${order.orderState eq 5 }">Y</c:if>
						<c:if test="${order.orderState ne 5 }">N</c:if></td>
					<td><button id="btn_orderCancle" type="button">주문취소</button></td>
				</tr>
			</table>
		</div>
		<div class="menu" style="width: 30%; height:">
			<table style="width: 100%;">
				<h3>결제 내역</h3>
				<tr>
					<td>${order.orderDetail }</td>
				</tr>
				<tr>
					<td>${order.totalPrice}원</td>
				</tr>
				<tr>
					<td>${store.storeTel }</td>
				</tr>
				<tr>
					<td>${store.storeName }</td>
				</tr>
			</table>
		</div>
	</div>



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
		$("#btn_orderCancle").click(function(){
			if(${order.orderState eq 5}){
				if(confirm("주문 취소 하시겠습니까?")){
					location.href="/admin/adminOrderRemove.kh?orderNo="+${order.orderNo };
					}
			}else{
				event.preventDefault();
				alert("취소요청이 없으므로 주문취소 불가합니다.")
			}
			
		});
	
	
	</script>
</body>
</html>