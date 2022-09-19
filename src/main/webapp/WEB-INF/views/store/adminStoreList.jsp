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
			<td><a href="/store/storeDetail.kh?storeNo=${store.storeNo }">${store.storeName }</a></td>
			<td>2022-09-16</td>
			<td><button>이동</button></td>
			<td><button onclick="modifyStore(${store.storeNo})">수정</button></td>
			<td><button onclick="removeStore(${store.storeNo})">삭제</button></td>
		</tr>
		</c:forEach>
	</table>
	<br>
	<button onclick="registStore();">점포등록</button>
	<script>
		function registStore(){
			location.href="/store/storeRegistForm.kh";
		}
		function removeStore(storeNo){
			event.preventDefault();
			if(confirm("게시물을 삭제하시겠습니까?")){
				location.href="/store/removeStore.kh?storeNo="+storeNo;
			}
		}
		function modifyStore(storeNo){
			location.href="/store/modifyStore.kh?storeNo="+storeNo;
		}
	</script>
</body>
</html>