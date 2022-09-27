<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 정보</title>
</head>
<body>
	<h1 align="center">${faq.faqNo }번게시글상세보기</h1>
	<br>
	<br>
	<table align="center" width="500" border="1">
		<tr>
			<td>제목</td>
			<td>${faq.faqTitle }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${faq.faqWriter }</td>
		</tr>
		<tr>
			<td>작성날짜</td>
			<td>${faq.faqCreateDate }</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${faq.faqViewCount }</td>
		</tr>
		<tr height="300">
			<td>내용</td>
			<td>${faq.faqContent }</td>
		</tr>
		<tr height="300">
			<td>첨부파일</td>
			<td>
			<img alt="본문이미지" src="/resources/faquploadFiles/${faq.faqFileRename}">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<a href="/faq/modifyView.kh?faqNo=${faq.faqNo }">수정페이지로이동</a> 
			<a href="#" onclick="faqRemove(${page});">삭제 </a>
			</td>
		</tr>
		<tr>
		<td>
	
		</td>
		</tr>
	</table>

	<script>
		function faqRemove(page) {
			event.preventDefault(); // 하이퍼링크 이동 방지
			if (confirm("게시물을 삭제하시겠습니까?")) {
				location.href = "/faq/remove.kh?page="+page;
			}
		}
	</script>
</html>