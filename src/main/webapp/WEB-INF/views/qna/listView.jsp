<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<link href=”https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap” rel=”stylesheet”>

<%@ include file="/WEB-INF/views/include/sideBar.Qna.jsp"%>

<meta charset="UTF-8">
<title>QNA게시판</title>
<style>
		#qna-page {
			text-align: center;
			margin-top: 80px;
			margin: 80px auto;
			color: #3A2618;
			font-size: 30px;
			font-weight: bold;
		}
		
		a, li, ul {
			text-decoration: none;
			color: dimgray;
		}
		
		#content {
			display: block;
			list-style-type: disc;
			margin-block-start: 1em;
			margin-block-end: 2em;
			margin-inline-start: 0px;
			margin-inline-end: 0px;
			padding-inline-start: 30px;
		}
		
		.paging-btn {
			margin: 30px;
		}
		
		#paging-wrap {
			text-align: center;
		}
		
		#paging-number {
			margin: 10px 10px;
			display: inline-block;
		}
		
		#search-icon {
			width: 15px;
			border: none;
			margin-right: 5px;
			cursor: pointer;
			background-color: transparent;
		}
</style>
</head>
<script>
	<c:if test="${not empty notVerified}">
	alert("${notVerified}");
	location.href = "/qna/list.kh";
	</c:if>

	<c:if test="${not empty needLogin}">
	alert("${needLogin}");
	location.href = "/qna/list.kh";
	</c:if>
</script>

<%@ include file="/WEB-INF/views/include/head.jsp"%>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<body>
	<div style="padding: 0px 300px 0px 300px" ]>
		<div id="qna-page">빵지순례 QNA</div>

		<div class="text">
			<c:if test="${!empty qnaList }">
				<c:forEach items="${qnaList }" var="qna" varStatus="i">
					<div id="content" style="border-top: 1px solid brown"; >
						<a href="/qna/detail.kh?qnaNo=${qna.qnaNo }&page=${currentPage }">${qna.qnaTitle }</a>
						<c:if test="${qna.qnaSecret == 1}">
							<img src="/resources/image/icon/lock.png" height="13" width="13">
						</c:if>
					</div>

					<!-- 처음 답변 작성하기를 눌렀을 때 jsp에서 hidden타입으로 qnaId값을 받아둔 다음 리스트뷰에서  -->
					<%-- <c:if test="${qna.isanswered == 1"> --%>
					<%-- <c:if test="${qna.qnaId == qna.checkQnaId">  --%>
					<!-- <a href="#">  -->
					<%-- </c:if> --%>
					<%-- </c:if> --%>
					<%-- 그러려면 일단 insert 할 때 isanswered 값을 조정해주고, 
				원글 isanswered 처리하기--%>


				</c:forEach>
				<div style="border-bottom: 1px solid brown";></div>

				<div id="page" align="center">
					<td colspan="6"><c:if test="${currentPage != 1 }">
							<a
								href="/qna/${urlVal }.kh?page=${currentPage - 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}">[이전]</a>
						</c:if> <c:forEach var="p" begin="${startNavi }" end="${endNavi }">
							<c:if test="${currentPage eq p }">
								<b>${p }</b>
							</c:if>
							<c:if test="${currentPage ne p }">
								<a
									href="/qna/${urlVal }.kh?page=${p }&searchCondition=${searchCondition}&searchValue=${searchValue}">${p }</a>
							</c:if>
						</c:forEach> <c:if test="${maxPage > currentPage }">
							<a
								href="/qna/${urlVal }.kh?page=${currentPage + 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}">[다음]</a>
						</c:if></td>
			</c:if>
			<c:if test="${empty qnaList }">
				<tr>
					<td colspan="6" align="center"><b>데이터가 존재하지 않습니다.</b></td>
				</tr>
			</c:if>
			<tr>
				<td colspan="5" align="center">
					<form action="/qna/search.kh" method="get">
						<select name="searchCondition">
							<option value="all"
								<c:if test="${searchCondition eq 'all' }">selected</c:if>>전체</option>
							<option value="writer"
								<c:if test="${searchCondition eq 'writer' }">selected</c:if>>작성자</option>
							<option value="title"
								<c:if test="${searchCondition eq 'title' }">selected</c:if>>제목</option>
							<option value="contents"
								<c:if test="${searchCondition eq 'contents' }">selected</c:if>>내용</option>
						</select> <input type="text" name="searchValue" value="${searchValue }">
						<input id="search-icon" type="image"
							src="/resources/image/icon/serch_bt.png" alt="검색">
					</form> <br>
					<button onclick="location.href='/qna/writeView.kh';">문의글 작성</button>
				</td>
				<td></td>
			</tr>
		</div>
	</div>

	</div>
	</body>
</html>