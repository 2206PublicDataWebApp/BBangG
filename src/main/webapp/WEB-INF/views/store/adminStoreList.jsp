<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<style>
#btn-modify {
	width: 80px;
	font-size: 15px;
	border: 1px solid #414141;
	background-color: #414141;
	color: rgb(255, 255, 255);
	/* padding: 15px 25px; */
	text-align: center;
	text-decoration: none;
	display: inline-block;
	left: 80%;
}

#btn-delete {
	width: 80px;
	font-size: 15px;
	border: 1px solid #414141;
	background-color: #ffffff;
	color: #414141;
	/* padding: 15px 25px; */
	text-align: center;
	text-decoration: none;
	display: inline-block;
	left: 80%;
}

#btn-move {
	width: 80px;
	font-size: 15px;
	border: 1px solid #414141;
	background-color: #ffffff;
	color: #414141;
	/* padding: 15px 25px; */
	text-align: center;
	text-decoration: none;
	display: inline-block;
	left: 80%;
}
#submitBtn{
		color: #fff;
	font-size: 16px;
	background-color: #3A2618;
	margin-top: 10px;
	width: 100px
}
#search {
	width: 20px;
	height: 20px;
	cursor: pointer;
}

#searchBtn {
	background-color: white;
	border: none;
}
</style>
</head>
<body align="center">
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<jsp:include page="/WEB-INF/views/include/sideBar_admin.jsp" />
	<h1 align="center">점포 리스트</h1>
	<table align="center" border="1">
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
				<td>${store.storeUpdateDate }</td>
				<td><button id="btn-move"
						onclick="showProduct(${store.storeNo },'${store.storeName }')">이동</button></td>
				<td><button id="btn-modify"
						onclick="modifyStore(${store.storeNo},'${store.storeName }')">점포
						수정</button></td>
				<td><button id="btn-delete"
						onclick="removeStore(${store.storeNo},'${store.storeName }')">점포
						삭제</button></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<form action="/store/storeSearch.kh" method="get">
		<select name="searchCondition">
			<option value="all">전체</option>
			<option value="name">이름</option>
			<option value="region">지역</option>
		</select> <input type="text" name="searchValue" value="${searchValue }">
		<button type="submit" id="searchBtn">
			<img id="search" alt="" src="/resources/image/icon/serch_bt.png">
		</button>
		<!-- 		<input type="submit" value="검색"> -->
	</form>
	<table align="center">
		<tr>
			<td colspan="6"><c:if test="${currentPage != 1}">
					<a
						href="/store/${urlVal }.kh?page=${currentPage - 1 }%searchCondition=${searchCondition }&searchValue=${searchValue }">
						이전 </a>
				</c:if> <c:forEach var="p" begin="${startNavi }" end="${endNavi }">
					<c:if test="${currentPage eq p }">
						<b>${p }</b>
					</c:if>
					<c:if test="${currentPage ne p }">
						<a
							href="/store/${urlVal }.kh?page=${p}&searchCondition=${searchCondition}&searchValue=${searchValue}">${p }</a>
					</c:if>
				</c:forEach> <c:if test="${maxPage > currentPage }">
					<a
						href="/store/${urlVal }.kh?page=${endNavi +1}&searchCondition=${searchCondition}&searchValue=${searchValue}">다음</a>
				</c:if></td>
		</tr>
	</table>
	<button onclick="registStore();" id="submitBtn">점포등록</button>
	<script>
		function registStore(){
			location.href="/store/storeRegistForm.kh";
		}
		
		function showProduct(storeNo, storeName){
			location.href="/product/adminProductList.kh?storeNo="+storeNo+"&storeName="+storeName;
		}
		function removeStore(storeNo, storeName){
			event.preventDefault();
			if(confirm(storeName+"을 삭제하시겠습니까?")){
				location.href="/store/removeStore.kh?storeNo="+storeNo;
			}
		}
		function modifyStore(storeNo, storeName){
			event.preventDefault();
			if(confirm(storeName+"을 수정하시겠습니까?")){
				location.href="/store/modifyStore.kh?storeNo="+storeNo;
			}
		}
	</script>
	<br><br><br><br><br><br><br><br><br><br><br><br><br>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>