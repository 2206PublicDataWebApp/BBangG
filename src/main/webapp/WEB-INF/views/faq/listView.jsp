<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href=”https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap” rel=”stylesheet”>

<%@ include file="/WEB-INF/views/include/sideBar.Qna.jsp"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<meta charset="UTF-8">
<title>FAQ게시판</title>
<style>
.qna-board {
            display: flex;
            padding: 30px 0 0;
            width: 1200px;
            margin: 25px auto;
            flex-wrap: wrap;
    		justify-content: space-between;
        }
        
        #common #contents {
            margin-top: 140px;
            max-width: var(--width);
            padding: 0 20px;
        }
        
         #qna-page{
        	text-align: center;
        	margin-top : 80px;
            margin: 80px auto;
            color:#3A2618;
            font-size: 30px;
        	font-weight: bold;
        }
        
         a,li,ul{
            text-decoration: none;
            color : dimgray;
        }
        div {
            display: block;
            list-style-type: disc;
            margin-block-start: 1em;
            margin-block-end: 2em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
            padding-inline-start: 40px;
            margin-top: 0px;
        }
        
        .paging-btn{
            margin: 30px;
        }
        #paging-wrap  {
            text-align:center;
        }
        #paging-number {
            margin: 10px 10px;
            display:inline-block;

        }
      
        #faq-page{
        	text-align: center;
        	margin-top : 80px;
            margin: 80px auto;
            color:#3A2618;
            font-size: 30px;
        	font-weight: bold;
        	}
        	
        	div {
            display: block;
            list-style-type: disc;
            margin-block-start: 1em;
            margin-block-end: 2em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
            padding-inline-start: 40px;
        }
        
         .accordion {
            background-color: #eee;
            color: #444;
            cursor: pointer;
            padding: 18px;
            width: 100%;
            border: none;
            text-align: left;
            outline: none;
            font-size: 15px;
            transition: 0.4s;
        }

        .active,
        .accordion:hover {
            background-color: #ccc;
        }

        .panel {
            padding: 0 18px;
            background-color: white;
            overflow: hidden;
        }
       
 
</style>
</head>
<script>
	<c:if test="${not empty notVerified}">
	     alert("${notVerified}");
		 location.href="/qna/list.kh";
	</c:if>

	<c:if test="${not empty needLogin}">
	alert("${needLogin}");
	location.href="/qna/list.kh";
	</c:if>
	
	
</script>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

<body>
<div id="all" style="padding:0px 300px 0px 300px"]>
	<div id="faq-page">빵지순례 FAQ</div>
	<table align="center" border="0">
		    <div class="panel">
		<c:if test="${!empty faqList }">
			<c:forEach items="${faqList }" var="faq" varStatus="i">
			</div>
			<button class="accordion">${faq.faqTitle }</button>
        <p style="display:none;">${faq.faqContent}</p>
        
    <div class="panel">
    </div>
					
			</c:forEach>

			<tr align="center" height="20">
			<td colspan="6">
				<c:if test="${currentPage != 1 }">
					<a href="/faq/${urlValue }.kh?page=${currentPage - 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}">[이전]</a>
				</c:if>
				<c:forEach var="p" begin="${startNavi }" end="${endNavi }">
					<c:if test="${currentPage eq p }">
						<b>${p }</b>
					</c:if>
					<c:if test="${currentPage ne p }">
						<a href="/faq/${urlValue }.kh?page=${p }&searchCondition=${searchCondition}&searchValue=${searchValue}">${p }</a>
					</c:if>
				</c:forEach>
				<c:if test="${maxPage > currentPage }">
					<a href="/faq/${urlValue }.kh?page=${currentPage + 1 }&searchCondition=${searchCondition}&searchValue=${searchValue}">[다음]</a>
				</c:if>
			</td>
		</tr>
		</c:if>
		<c:if test="${empty faqList }">
			<tr>
				<td colspan="6" align="center"><b>데이터가 존재하지 않습니다.</b></td>
			</tr>
		</c:if>
		<tr>
			<td colspan="5" align="center">
				<form action="/faq/search.kh" method="get">
					<select name="searchCondition">
						<option value="all" <c:if test="${searchCondition eq 'all' }">selected</c:if>>전체</option>
						<option value="writer" <c:if test="${searchCondition eq 'writer' }">selected</c:if>>작성자</option>
						<option value="title" <c:if test="${searchCondition eq 'title' }">selected</c:if>>제목</option>
						<option value="content" <c:if test="${searchCondition eq 'contents' }">selected</c:if>>내용</option>
					</select>
					<input type="text" name="searchValue" value="${searchValue }">
					<input type="submit" value="검색">
				</form>
			</td>
		
			<td>
				<button onclick="location.href='/faq/writeView.kh';">글쓰기</button>
				
			</td>
			
		</tr>
	</table>
	</div>
	<script>
        $(".panel").css('display', 'none');
        $(".accordion").click(function (event) {
            var selector = $(this).next();
            console.log(selector);
            var display_ys = selector.css('display');
            if (display_ys != 'block') {
               
                selector.css("display", "block");
            } else {
                selector.css("display", "none");
            }
        });
    </script>
</body>
</html>