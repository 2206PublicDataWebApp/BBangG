<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>QNA게시판 상세 정보</title>
    <style>
        html, body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, input, textarea, p, blockquote, th, td, img {
            margin: 0;
            padding: 0;
            padding-left:0px;
            list-style:none;
            font-family: 'Montserrat','Noto Sans KR',"Malgun Gothic","맑은 고딕",-apple-system,BlinkMacSystemFont,helvetica,"Apple SD Gothic Neo",sans-serif;
        }
        a,li,ul{
            text-decoration: none;
        }

        .review-write{
            width: 980px;
            margin: 25px auto;
            box-sizing:border-box ;
            padding : 30px 40px;
            text-align:center; 
        }
        #store-name{
            margin: 50px;
        }
        #review-title{
            margin: 5px;
        }
        #qna-content{
            
            margin: 0px auto;
           
        }
        #max{
        	
        	margin: 10px auto;
            font-size : 10px;
          
        }
        
        #select-file{
            margin: 10px;
            text-decoration: none; 
            position: relative;
            right: 6%;
        }
        .write-btn{
            margin: 10px auto;
        }
        
        #star-form fieldset{
            display: inline-block;
            direction: rtl;
            border:0;
        }
        
        #star-form fieldset legend{
            
            text-align: right;
        }
        
        #star-form input[type=radio]{
            display: none;
        }
        #star-form label{
            font-size: 20px;
            color: transparent;
            text-shadow: 0 0 0 #c5c5c5;
        }
        
        #star-form label:hover{
            text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
        }
        
        #star-form label:hover ~ label{
            text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
        }
        
        #star-form input[type=radio]:checked ~ label{
            text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
        }
        
        .star-rating{
            
            margin: 10px auto;
            box-sizing:border-box ;
            padding : 10px ;
        }
        #myform input[type=radio]:checked ~ label{
		    text-shadow: 0 0 0 #a00; 
		}
        .write-btn-cancel{
            width: 80px;
            font-size: 15px;
            border: 2px solid #002954;
            background-color: #ffffff;
            color: #002954;
        
            text-align: center;
            text-decoration: none;
            display: inline-block;
       
        }
        
        .write-btn{
            width: 80px;
            font-size: 15px;
            border: 2px solid #002954;
            background-color: #002954;
            color: #ffffff;
          
            text-align: center;
            text-decoration: none;
            display: inline-block;
          
        }

    </style>
    <script src="/resources/js/jquery-3.6.1.min.js"></script>
    <%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
    
    <h1 align="center">${qna.qnaNo }번 게시글 상세 보기</h1>
	<br><br>
	<table align="center" width="600" border="1">
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
		<table align="center" width="600" border="1">
			<tr>
				<td>
					<textarea rows="3" cols="55" name="qnaReplyContent"></textarea>
				</td>
				<td>
				<c:if test="${!empty sessionScope.login.userId}">
					<input type="submit" value="등록하기">
				</c:if>
				</td>
			</tr>
			<td>
					<input type="button" value="답변하기" onCLick="answerForm${isLogOn}; ${contextPath }/qna/writeAnswer.kh; ${article.articleNO } )">
				</td>
		</table>
	</form>
	
	<table align="center" width="600" border="1">
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
