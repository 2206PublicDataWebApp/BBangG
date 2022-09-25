<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA게시판 상세 정보</title>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
</head>
<body>
	<h1 align="center">${qna.qnaNo }번 게시글 상세 보기</h1>
	<br><br>
	<table align="center" width="500" border="1">
		<tr>
			<td>제목</td>
			<td>${qna.qnaTitle }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${qna.qnaWriter }</td>
		</tr>
		<tr>
			<td>작성날짜</td>
			<td>${qna.qnaCreateDate }</td>
		</tr>
		<tr>
			<td>조회수</td>
			<td>${qna.qnaViewCount }</td>
		</tr>
		<tr height="300">
			<td>내용</td>
			<td>${qna.qnaContent }
			</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td>
				<img alt="본문이미지" src="/resources/qnauploadFiles/${qna.qnaFileRename }" 
				width="300" height="300">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<a href="/qna/modifyView.kh?qnaNo=${qna.qnaNo }&page=${page}">수정 페이지로 이동</a>
				<a href="#" onclick="qnaRemove(${page});">삭제하기</a>
			</td>
		</tr>
	</table>
	
	
	<form action="/qna/addReply.kh" method="post">
		<input type="hidden" name="page" value="${page }">
		<input type="hidden" name="refQnaNo" value="${qna.qnaNo }">
		<table align="center" width="500" border="1">
			<tr>
				<td>
					<textarea rows="3" cols="55" name="qnaReplyContent"></textarea>
				</td>
				<td>
					<input type="submit" value="등록하기">
				</td>
			</tr>
		</table>
	</form>
	
	<table align="center" width="500" border="1">
		<c:forEach items="${replyList }" var="reply">
			<tr>
				<td width="100">${reply.qnaReplyWriter }</td>
				<td>${reply.qnaReplyContent }</td>
				<td>${reply.qnaReplyUpdateDate }</td>
				<td>
					<a href="#" onclick="modifyView(this,'${reply.qnaReplyContent }', ${reply.qnaReplyNo });">수정</a> 
					<a href="#" onclick="removeReply(${reply.qnaReplyNo });">삭제</a>
				</td>
			</tr>

		</c:forEach>
	</table>
	<script>
		function qnaRemove(value) {
			event.preventDefault(); // 하이퍼링크 이동 방지
			if(confirm("게시물을 삭제하시겠습니까?")) {
				location.href="/qna/remove.kh?page="+value;
			}
		}
		function removeReply(replyNo) {
			event.preventDefault();
			if(confirm("정말 삭제하시겠습니까?")) {
				var $delForm = $("<form>");
				$delForm.attr("action", "/qna/removeReply.kh");
				$delForm.attr("method", "post");
				$delForm.append("<input type='hidden' name='qnaReplyNo' value='"+replyNo+"'>");
				$delForm.appendTo("body");
				$delForm.submit();
			}
		}
		function modifyView(obj, qnaReplyContent, qnaReplyNo) {
			event.preventDefault();
			var $tr = $("<tr>");
			$tr.append("<td colspan='3'><input type='text' size='50' value='"+qnaReplyContent+"'></td>");
			$tr.append("<td><button onclick='modifyReply(this, "+qnaReplyNo+");'>수정</button></td>");
			$(obj).parent().parent().after($tr);
		}
		function modifyReply(obj, rNo) {
			var inputTag = $(obj).parent().prev().children();
			var qnaReplyContent = inputTag.val();
			var $form = $("<form>");
			$form.attr("action", "/qna/modifyReply.kh");
			$form.attr("method", "post");
			$form.append("<input type='hidden' value='"+qnaReplyContent+"' name='qnaReplyContent'>");
			$form.append("<input type='hidden' value='"+rNo+"' name='qnaReplyNo'>");
			$form.appendTo("body");
			$form.submit();
		}
	</script>
</body>
</html>