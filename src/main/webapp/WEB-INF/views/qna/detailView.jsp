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
          

		.qna-title{
	       display: flex;
	       margin: 25px auto;
	       width: 980px;
	       padding : 30px 40px;
	       box-sizing:border-box ;
	       border : 1px solid white ;
		       
		.qna-detail{ 
	       border : 1px solid #414141 ;
	       width: 980px;
	       margin: 25px auto;
	       box-sizing:border-box ;
	       padding : 50px 60px;
	       }
	       
	        .detail-title-wrap{
       display: flex;
       justify-content: space-between;
       }
       
       .user-date{
       display: flex;
       align-items: center;
       
       .btn-wrap{
   		margin-top:50px;
	       }
	       
	   #btn-modify{
       width: 80px;
       font-size: 15px;
       border: 1px solid #414141;
       background-color: #414141;
       color: rgb(255, 255, 255);
       /* padding: 15px 25px; */
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
       /* padding: 15px 25px; */
       text-align: center;
       text-decoration: none;
       display: inline-block;
       position: relative;
       left : 80%;
       
       #qna-page{
        	text-align: center;
        	margin-top : 80px;
            margin: 80px auto;
            color:#3A2618;
            font-size: 30px;
        	font-weight: bold;
        }
   }
           
    </style>
    <script src="/resources/js/jquery-3.6.1.min.js"></script>
    <%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div id="all" style="padding:0px 300px 0px 300px"]>
<br><br><br>
    <div id="qna-page" padding="300px" align="center">
    <h1>${qna.qnaWriter }님의 질문 상세보기</h1></div> <br><br>
	
	<div class="qna-detail">
        <div class="detail-title-wrap">
            <div class="user-date-star">
                <div class="user-date">
                    <div class="user-id" >${qna.qnaWriter }</div><br>
                    <div class="date" style="border-top:1px solid brown";>${qna.qnaCreateDate }</div>
                </div><br>
		<div>
                    <div></div>
                </div>
               </div>
                <div></div>
            	<div></div>
            </div>
             </div>
        <div class="qna-content">
            <div id="qna-img" style="border-top:1px solid brown";>
                <img alt="image" style="width:200px"; height="200px" src="/resources/qnauploadFiles/${qna.qnaFileRename }" 
				width="300" height="300">
            </div><br><br>
        <div style="border-top:1px solid brown";>
        	${qna.qnaContent }
        </div> <br><br>
        <div class="btn-wrap">
            <a id="btn-modify" href="/qna/modifyView.kh?qnaNo=${qna.qnaNo }&page=${page}">수정</a>
            <a id="btn-delete" href="#" onclick="qnaRemove(${page});">삭제</a>

        </div>
    </div>   
  
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
			</td>
		</table>
	</form>
			<button type="button" onclick="location.href='/qna/writeAnswer.kh';">답변하기</button>
	
	<table align="center" width="500" border="1">
		<c:forEach items="${replyList }" var="reply">
			<tr>
				<td width="100">${reply.qnaReplyWriter }</td>
				<td>${reply.qnaReplyContent }</td>
				<td>${reply.qnaReplyUpdateDate }</td>
				<td>
				<c:if test="${!empty sessionScope.login.userId}">
					<a href="#" onclick="modifyView(this,'${reply.qnaReplyContent }', ${reply.qnaReplyNo });">수정</a> 
					<a href="#" onclick="removeReply(${reply.qnaReplyNo });">삭제</a>
					</c:if>
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
	</div>
</body>
</html>
