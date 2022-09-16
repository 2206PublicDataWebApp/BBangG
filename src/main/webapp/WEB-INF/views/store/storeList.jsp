<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>등록번호</th>
			<th>점포명</th>
			<th>등록날짜</th>
			<th>상품관리</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<tr>
			<td>001</td>
			<td>성심당</td>
			<td>2022-09-16</td>
			<td><button>이동</button></td>
			<td><button>수정</button></td>
			<td><button>삭제</button></td>
		</tr>
	</table>
	<button onclick="storeRegist();">점포등록</button>
	<script>
		function storeRegist(){
			location.href="/store/storeRegistForm.kh";
		}
	</script>
</body>
</html>