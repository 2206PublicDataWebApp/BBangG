<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" href="/resources/css/adminUserList.css" />
<meta charset="UTF-8">
</head>
<body>
<jsp:include page = "/WEB-INF/views/include/header.jsp"/>
<jsp:include page="/WEB-INF/views/include/sideBar_admin.jsp"/>
	<div class="wrrapper">
	<h1 align="center">회원 목록</h1>
	<br><br>
	<div class="search-wrapper">
				<form class="search-form" action="/admin/userSearch" method="get">
					<select name="searchCondition">
						<option value="all" <c:if test="${searchCondition eq 'all'}">selected</c:if>>전체</option>
						<option value="id" <c:if test="${searchCondition eq 'id'}">selected</c:if>>ID</option>
						<option value="name" <c:if test="${searchCondition eq 'name'}">selected</c:if>>이름</option>
						<option value="email" <c:if test="${searchCondition eq 'email'}">selected</c:if>>메일</option>
					</select>
					<input type="text" name="searchValue" value="${searchValue }">
				<div class="search-button">
					<input type="submit" class="search" value="">
				</div>
				</form>
					
			</div>
	<table align="center" border="1">
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>주소</th>
		</tr>
		<c:if test="${!empty uList }">
			<c:forEach items="${uList }" var="uList" varStatus="i">
				<tr>
					<td>${i.count }</td>
					<td>${uList.userId }</td>
					<td>${uList.userName }</td>
					<td>${uList.userGender }</td>
					<td>${uList.userEmail }</td>
					<td>${uList.userPhone }</td>
					<td>(${uList.userZipCode }) ${uList.addr } ${uList.addrDetail }</td>
				</tr>
			</c:forEach>
			<tr align="center" height="20">
			<td colspan="8">
				<input type="button" class="remove" value="회원탈퇴" onclick="removeUser();">
				<div class="index">
				<c:if test="${currentPage != 1 }">
					<a href="/admin/${urlVal }?page=${currentPage - 1 }&searchCondition=${searchCondition}$searchValue=${searchValue}">[이전]</a>
				</c:if>
				<c:forEach var="p" begin="${startNavi }" end="${endNavi }">
					<c:if test="${currentPage eq p }">
						<b>${p }</b>
					</c:if>
					<c:if test="${currentPage ne p }">
						<a href="/admin/${urlVal }?page=${p }&searchCondition=${searchCondition}$searchValue=${searchValue}">${p }</a>
					</c:if>
				</c:forEach>
				<c:if test="${maxPage > currentPage }">
					<a href="/admin/${urlVal }?page=${currentPage + 1 }&searchCondition=${searchCondition}$searchValue=${searchValue}">[다음]</a>
				</c:if>
				</div>
			</td>
		</tr>
		</c:if>
		<c:if test="${empty uList }">
			<tr>
				<td colspan="6" align="center"><b>데이터가 존재하지 않습니다.</b></td>
			</tr>
		</c:if>
	</table>
	</div>
	<script type="text/javascript">
	function removeUser() {
			var id = prompt("탈퇴시킬 아이디를 입력해주세요.");
			if(id !== null){
				document.location.href="/admin/remove?action=edit&id="+id;
			}else{
			}
		}
	<c:if test="${empty login}">
		alert("접근이 제한된 페이지 입니다. 메인으로 돌아갑니다.");
		location.href="/home.kh";	
	</c:if>
	</script>
</body>
</html>