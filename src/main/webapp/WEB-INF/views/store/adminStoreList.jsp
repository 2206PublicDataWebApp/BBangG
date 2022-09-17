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
<h1 align="center">점포 리스트 </h1>
	<table border="1">
		<tr>
			<th>등록번호</th>
			<th>점포명</th>
			<th>등록날짜</th>
			<th>상품관리</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:forEach items="${sList }" var="store" varStatus="i">
		<tr>
			<td>${store.storeNo }</td>
			<td>${store.storeName }</td>
			<td>2022-09-16</td>
			<td><button>이동</button></td>
			<td><button onclick="modifyStore()">수정</button></td>
			<td><button onclick="storeRemove()">삭제</button></td>
		</tr>
		</c:forEach>
	</table>
	<button onclick="storeRegist();">점포등록</button>
	<script>
		function storeRegist(){
			location.href="/store/storeRegistForm.kh";
		}
		function storeRemove(){
			event.preventDefault();
			if(confirm("게시물을 삭제하시겠습니까?")){
				location.href="/store/removeStore.kh";
			}
		}
		function modifyStore(){
			location.href="/store/modifyStore.kh";
		}
	</script>
</body>
</html>