<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<style>
#buttons {
	text-align: center;
}

#btn-delete {
	margin: auto;
	width: 100px;
	font-size: 16px;
	border: 1px solid #414141;
	background-color: #ffffff;
	color: #414141;
	/* padding: 15px 25px; */
	text-align: center;
	text-decoration: none;
	display: inline-block;
	left: 80%;

}

#submitBtn {
	margin: auto;
	color: #fff;
	font-size: 16px;
	background-color: #3A2618;
	margin-top: 10px;
	width: 100px;
	display: inline-block;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<h1 align="center">${storeName }</h1>
	<table border="1" align="center">
		<tr>
			<th>상품코드</th>
			<th>상품명</th>
			<th>가격</th>
			<th>선택</th>
		</tr>
		<c:forEach items="${pList }" var="product" varStatus="i">
			<tr>
				<td>${product.productCode }</td>
				<td>${product.productName }</td>
				<td>${product.productPrice }</td>
				<td><input type="checkbox" name="chkList"
					value="${product.productCode}" onclick="getValue(event)"></td>
			</tr>
		</c:forEach>
	</table>
	<div id="buttons">
		<button id="submitBtn"
			onclick="productRegist(${storeNo},'${storeName }')">상품등록</button>
		<button id="btn-delete"
			onclick="productRemove(${storeNo},'${storeName }')">선택삭제</button>

	</div>
	<script>
		var productCode = '';
		function getValue(event){
			productCode = event.target.parentElement.previousElementSibling.previousElementSibling.previousElementSibling.innerHTML;
			return productCode;
		}
	
		function productRegist(storeNo, storeName){
			location.href="/product/productRegistForm.kh?storeNo="+storeNo+"&storeName="+storeName;
		}
		function productRemove(storeNo, storeName){
			location.href="/product/removeProduct.kh?storeNo="+storeNo+"&storeName="+encodeURI(encodeURIComponent(storeName))+"&productCode="+productCode;
		}
	</script>
</body>
</html>