<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${storeName }</h1>
	<table border="1">
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
	<button onclick="productRegist(${storeNo},'${storeName }')">상품등록</button>
	<button onclick="productRemove(${storeNo},'${storeName }')">선택삭제</button>
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
			location.href="/product/removeProduct.kh?storeNo="+storeNo+"&storeName="+storeName+"&productCode="+productCode;
		}
	</script>
</body>
</html>