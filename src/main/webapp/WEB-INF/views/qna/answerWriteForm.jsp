<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답변 등록</title>
</head>
<body>
	<h1 align="center">답변 등록</h1>
	<br><br>
	<form action="/qna/registAnswer.kh" method="post" enctype="multipart/form-data">
		<table align="center" border="1">
		<input type="hidden" name="qnaId">
			<tr>
				<td>제목</td>
				<td><input type="text" name="answerTitle" placeholder="제목을 입력하세요" required></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" value="관리자" name="userWriter" readonly></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="10" name="answerContent" placeholder="내용을 입력하세요" required ></textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="uploadFile"></td>
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="submit" value="등록">
					<input type="reset" value="취소">
				</td>

			</tr>
		</table>
	</form>
</body>
</html>