<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 수정 페이지</title>
<link rel="stylesheet" type="text/css" href="/resources/css/orderStyle.css">
</head>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<body>
	<form action="/order/orderModify.kh" method="post">
	<input type="hidden" name="orderNo" value="${order.orderNo }"> 
	<header id="header" >
	<div class="titleArea">
	<h1 align="center" >주문수정</h1>
	</div>
	</header>
	
	<table align="center">
		<tr >
			<td colspan="2"><h3>주문자 정보</h3></td>
		</tr>
		<tr>
			<th>주문자 이름</th>
			<td><input type="text" value="${user.userName }" readonly></td>
		</tr>
		<tr>
			<th>주문자 연락처</th>
			<td><input type="text" value="${user.userPhone }" readonly></td>
		</tr>
	
	</table>
	<br><br>
	<table align="center">
		<tr >
			<td colspan="2"><h3>배송지 정보</h3></td>
		</tr>
		<tr>
			<th>수령인</th>
			<td><input type="text" name="delivaryName" value="${order.delivaryName }" ></td>
		</tr>
		<tr>
			<th>수령인 연락처</th>
			<td><input type="text" name="delivaryPhone" value="${order.delivaryPhone }" ></td>
		</tr>
		<tr>
			<th>배송지 주소</th>
			<td>
				<div style=" float: left; width: 60%;">
					<input type="text" id="delivaryZipcode" name="delivaryZipcode">
				</div>
				<div style=" float: right; width: 38%;">
					<button id="btnSearchAddressC" type="Button" onclick="findDaumPostcode()" value="우편번호 찾기"  >
				주소검색</button>
				
				</div>
			</td>
		</tr>
		<tr>
			<td rowspan="2">
			<td><input type="text" id="delivaryAddr" name="delivaryAddr" value="${order.delivaryAddr }" ></td>
		</tr>
		<tr>
			<td><input type="text" id="delivaryAddrDetail" name="delivaryAddrDetail" value="${order.delivaryAddrDetail }" ></td>
		</tr>
		<tr>
			<th >배송메모</th>
			<td><input type="text" name="delivaryMemo" value="${order.delivaryMemo}" ></td>
		</tr>
		<tr>
			
			<td colspan="2" align="right">
			<input type="submit" value="수정완료">
			</td>
		</tr>
	</table>
	</form>
</body>
<script type="text/javascript">
	function findDaumPostcode() {
	    new daum.Postcode({
	      oncomplete: function (data) {
	        var zoneCodeCompany = data.zonecode;
	        var addressCompany = data.address;
	        document.getElementById("delivaryZipcode").value = zoneCodeCompany; // zipcode
	        document.getElementById("delivaryAddr").value = addressCompany; // 주소 넣기
	        }
	    }).open();
	  }
</script>
</html>