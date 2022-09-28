<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
td{
padding: 5px;
}
.th {
	text-align: right;
}
.text {
	border: none;
	border-bottom: 1px solid black;
}
#submitBtn{
		color: #fff;
	font-size: 16px;
	background-color: #3A2618;
	margin-top: 10px;
	width: 100px
}

#backBtn{
		color: #3A2618;
	font-size: 16px;
	background-color: #fff;
	margin-top: 10px;
	width: 200px
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<h1 align="center">상품등록화면</h1>
	<h3 align="center" id=storeName>${storeName }</h3>
	<form action="/product/registProduct.kh" method="post">
	<input type="hidden" name=storeName value="${storeName }" >
		<table align="center">
			<tr>
				<td class="th">점포번호</td>
				<td><input type="text" name="refStoreNo" value="${storeNo }"
					readonly class="text"/></td>
			</tr>
			<tr>
				<td class="th">상품명</td>
				<td><input type="text" name="productName" class="text"/></td>
			</tr>
			<tr>
				<td class="th">제품가격</td>
				<td><input type="text" name="productPrice" class="text"/></td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;"><input type="submit" id="submitBtn"/>
				<button type="button" id="backBtn" onclick="goBack()">이전화면 돌아가기</button></td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
	function goBack(){
		event.preventDefault();
		if(confirm('변경사항이 전부 사라집니다. 돌아가시겠습니까?')){
			window.history.back();
			
		}
	}
	
	</script>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	 <%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>