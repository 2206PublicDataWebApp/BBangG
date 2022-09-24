<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA 게시글 수정</title>
</head>
<body>
	<h1 align="center">${qna.qnaNo }번 게시글 수정하기</h1>
	<br>
	<form action="/qna/modify.kh" method="post" enctype="multipart/form-data">
		<input type="hidden" name="page" value="${page }">
		<input type="hidden" name="qnaNo" value="${qna.qnaNo }">
		<input type="hidden" name="qnaFilename" value="${qna.qnaFilename }">
		<input type="hidden" name="qnaFileRename" value="${qna.qnaFileRename }">
		<table align="center" border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="qnaTitle" value="${qna.qnaTitle }"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="qnaWriter" value="${qna.qnaWriter }" readonly></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="30" rows="7" name="qnaContent">${qna.qnaContent }</textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="reloadFile">
					<a href="#">${qna.qnaFilename }</a>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정">
					<a href="/qna/list.kh">목록으로</a>
					<a href="javascript:history.go(-1);">이전 페이지로</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>