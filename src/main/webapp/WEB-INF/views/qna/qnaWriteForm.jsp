<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>
	<h1 align="center">질문 등록</h1>
	<br><br>
	<form action="/qna/register.kh" method="post" enctype="multipart/form-data">
		<table align="center" border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" name="qnaTitle"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="qnaUserName" value="${login.userName }" readonly></td>
				<input type="text" name="qnaWriter" value="${login.userId}" style="display: none">
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="10" name="qnaContent"></textarea></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="uploadFile"></td>
			</tr>
			<tr>
				<td>비밀글 여부</td>

				<td>
					<select name="qnaSecret">
						<option value="1">비밀글</option>
						<option value="0">전체 공개</option>
					</select>
				</td>
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