<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빵지순례 FAQ</title>
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
       .faq-detail{ 
           border : 1px solid #414141 ;
           width: 980px;
           margin: 25px auto;
           box-sizing:border-box ;
           padding : 50px 60px;
       }
       .faq-title{
           display: flex;
           margin: 25px auto;
           width: 980px;
           padding : 30px 40px;
           box-sizing:border-box ;
           border : 1px solid white ;
       }
       .faq-title-btn{
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
       #faq-img{
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
    <div id="faq-title">
        <div id="faq-title">
            <h1 id="storename">${faq.faqTitle } </h1>
        </div>
    </div>
      <!-- 1 -->
      <div class="faq-detail">
        <div class="detail-title-wrap">
                <div class="user-date">
                    <div class="user-id">${faq.faqWriter }</div>
                    <div class="date">${faq.faqCreateDate }</div>
                </div>
        </div>
        <div class="faq-content">
            <div id="faq-img">
            <c:if test="${!empty faq.faqFileRename }">
                <img alt="본문이미지" src="/resources/faquploadFiles/${faq.faqFileRename }" width="500">
                </c:if>
            </div>
        <div id="content">
        	${faq.faqContent }
        </div>
        
    </div>
   <c:if test="${login.userId eq faq.faqWriter || login.status eq '0'}">
	    <div class="btn-wrap">
	        <a id="btn-modify" href="/faq/modifyView.kh?faqNo=${faq.faqNo }&page=${page}">수정</a>&nbsp&nbsp
            <a id="btn-delete" href="#" onclick="qnaRemove(${page});">삭제</a><br>
	     </div>
    </c:if> 
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