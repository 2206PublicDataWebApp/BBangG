<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<h1>상품등록화면</h1>
	<h3>${storeName}</h3>
	<form action="/product/registProduct.kh" method="post">
		<table border="1">
			<tr>
				<td>점포번호</td>
				<td><input type="text" name="refStoreNo" value="${storeNo }"
					readonly /></td>
			</tr>
			<tr>
				<td>상품명</td>
				<td><input type="text" name="productName" /></td>
			</tr>
			<tr>
				<td>제품가격</td>
				<td><input type="text" name="productPrice" /></td>
			</tr>
			<tr>
				<td><input type="submit" /></td>
			</tr>
		</table>
	</form>
</body>
</html>