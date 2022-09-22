<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			<th>상품코드 </th>
			<th>상품명 </th>
			<th>가격 </th>
			
		</tr>
		<tr>
			<c:forEach items="${pList }" var="product">
				<td>${product.productCode }</td>
				<td>${product.productName }</td>
				<td>${product.productPrice }</td>
			</c:forEach>	
		</tr>
	</table>
	<button onclick="productRegist(${storeNo},'${storeName }')">상품등록</button>
	<script>
		function productRegist(storeNo, storeName){
			location.href="/product/productRegistForm.kh?storeNo="+storeNo+"&storeName="+storeName;
		}
	</script>
</body>
</html>