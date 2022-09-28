<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
	<h1 align="center">${faq.faqNo}번게시글 수정하기</h1>
	<br>
	<form action="/faq/modify.kh" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="page" value="${page}" /> <input
			type="hidden" name="faqNo" value="${faq.faqNo}" /> <input
			type="hidden" name="faqFilename" value="${faq.faqFilename}" /> <input
			type="hidden" name="faqFileRename" value="${faq.faqFileRename}" />
		<table align="center" border="1">

			<tr>
				<td>제목</td>
				<td><input type="text" name="faqTitle" value="${faq.faqTitle}"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="faqWriter"
					value="${faq.faqWriter}" readonly></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea col="30" rows="7" name="faqContent">${faq.faqContent}</textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="reloadFile"> <a href="#">${faq.faqFilename}</a>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="수정">
					<a href="/faq/list.kh">목록으로</a> <a href="javascript:history.go(-1)">이전페이지로</a></td>
			</tr>
		</table>
	</form>
</body>
</html>