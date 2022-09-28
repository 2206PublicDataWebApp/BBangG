<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빵지순례 후기</title>
<style>
       html, body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, input, textarea, p, blockquote, th, td, img {
           margin: 0;
           padding: 0;
           padding-left:0px;
           list-style:none;
           font-family: 'Noto Sans KR', sans-serif;
           color: #414141;
       }
       a,li,ul{
           text-decoration: none;
       }
       #order-btn{
           width: 500px;
           margin: 20px auto;
           display:block;
       }
       .qna-detail{ 
           border : 1px solid #414141 ;
           width: 980px;
           margin: 25px auto;
           box-sizing:border-box ;
           padding : 50px 60px;
       }
       .qna-title{
           display: flex;
           margin: 25px auto;
           width: 980px;
           padding : 30px 40px;
           box-sizing:border-box ;
           border : 1px solid white ;
       }
       .qna-title-btn{
           margin: 10px auto;
           margin-left: auto;
       }
       .title-btn3-right{
           margin-left: auto;
       } 
       .paging-btn{
           margin: 30px;
       }
       ul  {
           text-align:center;
       }
       li {
           margin: 10px 10px;
           display:inline-block;
       }
       .btn-wrap{
               margin-top:50px;
       }
    
       #btn-modify{
           width: 80px;
           font-size: 15px;
           border: 1px solid #414141;
           background-color: #414141;
           color: rgb(255, 255, 255);
           text-align: center;
           text-decoration: none;
           display: inline-block;
           position: relative;
           left : 80%;
       }
       #storename{
            margin: 60px auto;
            width: 980px;
            padding : 10px 40px;
            box-sizing:border-box ;
       }
       #sort{
        position: relative;
        left : -2%;
        font-weight: lighter;
       }
       #bestSort{
           width: 80px;
           font-size: 15px;
           border: 1px solid #414141;
           background-color: #ffffff;
           color: #414141;
           text-align: center;
           text-decoration: none;
           display: inline-block;
           position: relative;
           left : 80%;
       }
       #latestSort{
           width: 80px;
           font-size: 15px;
           border: 1px solid #414141;
           background-color: #ffffff;
           color: #414141;
           text-align: center;
           text-decoration: none;
           display: inline-block;
           position: relative;
           left : 80%;
       }
       #btn-delete{
           width: 80px;
           font-size: 15px;
           border: 1px solid #414141;
           background-color: #ffffff;
           color: #414141;
           text-align: center;
           text-decoration: none;
           display: inline-block;
           position: relative;
           left : 80%;
       }
       .detail-title-wrap{
           display: flex;
           justify-content: space-between;
       }
       .user-date{
           display: flex;
           align-items: center;
           
       }
       .user-id {
           margin-right: 10px ;
       }
       .date{
           font-size: 12px;
       }
       .heart-count{
           display: flex;
           flex-direction: column;
           justify-content: space-evenly;
       }
       
       #star{
           margin-bottom: 10px;
       }
       #qna-img{
           margin-bottom: 10px;
       }
       #heart{
            text-decoration: none;
       }
       
       #content{
       overflow:hidden;
       word-wrap:break-word;
       }
       
      table {
         width: 900px;
      }
       
       textarea {
    width: 100%;
    height: 2em;
    border: none;
    resize: none;
  }
         
</style>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div id="wrapper">
<input type="hidden" name="userId" value="${login.userId }">
    <div id="qna-title">
        <div id="qna-title">
            <h1 id="storename">${qna.qnaTitle } </h1>
        </div>
    </div>
      <!-- 1 -->
      <div class="qna-detail">
        <div class="detail-title-wrap">
                <div class="user-date">
                    <div class="user-id">${qna.qnaWriter }</div>
                    <div class="date">${qna.qnaCreateDate }</div>
                </div>
        </div>
        <div class="qna-content">
            <div id="qna-img">
            <c:if test="${!empty qna.qnaFileRename }">
                <img alt="본문이미지" src="/resources/qnauploadFiles/${qna.qnaFileRename }" width="500">
                </c:if>
            </div>
        <div id="content">
        	${qna.qnaContent }
        </div>
        
    </div>
   <c:if test="${login.userId eq qna.qnaWriter || login.status eq '0'}">
	    <div class="btn-wrap">
	        <a id="btn-modify" href="/qna/modifyView.kh?qnaNo=${qna.qnaNo }&page=${page}">수정</a>&nbsp&nbsp
            <a id="btn-delete" href="#" onclick="qnaRemove(${page});">삭제</a><br>
            <c:if test="${sessionScope.login.status == 0}">
			<button type="button" onclick="location.href='/qna/writeAnswer.kh';">답변하기</button>
			</c:if>
	     </div>
    </c:if> <br><br>
    
    <div class="reply">
	<table align="center" width="500" border="0">
		<c:forEach items="${replyList }" var="reply">
			<tr>
				<td colspan="6">${reply.qnaReplyWriter }</td>
				<td>${reply.qnaReplyContent }</td>
				<td>${reply.qnaReplyUpdateDate }</td>
				<td>
				<c:if test="${login.userId eq reply.qnaReplyWriter || login.status eq '0'}">
					<a href="#" onclick="modifyView(this,'${reply.qnaReplyContent }', ${reply.qnaReplyNo });">수정</a>&nbsp&nbsp
					<a href="#" onclick="removeReply(${reply.qnaReplyNo });">삭제</a>
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table><br>
	<form action="/qna/addReply.kh" method="post">
		<input type="hidden" name="page" value="${page }">
		<input type="hidden" name="refQnaNo" value="${qna.qnaNo }">
		<table align="center" width="600" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<textarea rows="3" cols="55" name="qnaReplyContent"></textarea>
				</td>
				<td align="center" width="100" >
				<c:if test="${!empty sessionScope.login.userId}">
					<input type="submit" style="WIDTH: 70pt; HEIGHT: 20pt" value="댓글등록">
				</c:if>
				</td>
			</tr>
			
		</table>
	</form>
    </div>
    
    
   </div>
</div>
</div>
<div>


   	<script>
   	function qnaRemove(value) {
		event.preventDefault(); 
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