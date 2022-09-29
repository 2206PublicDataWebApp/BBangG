<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href=”https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap” rel=”stylesheet”>
<meta charset="UTF-8">
<title>빵지순례 리뷰</title>
    <style>
        /* ul {
            display: block;
            list-style-type: disc;
            margin-block-start: 1em;
            margin-block-end: 1em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
            padding-inline-start: 40px;
        } */
        /* html {
            width: 980px;
            height: 100%;
            color: var(--main-color);
        } */
        div {
            display: block;
        }
        
        #common #contents {
            margin-top: 140px;
            max-width: var(--width);
            padding: 0 20px;
        }
        #contents {
            max-width: 260px;
            max-width: var(--width);
            margin: 100px auto 0;
            margint
        }
        /* contents?  */
        .content{
        	margin-top : 20px;
        }
        ::selection {
            background: var(--main-color);
            color: #fff;
        }
        :root {
            --main-color: #002954;
            --sub-color: #8db9ea;
            --width: 1500px;
            --main-padding: 0 15px;
        }
        /* .board-fixed {
            border-top: 0!important;
        } */
        .review-board {
            display: flex;
            padding: 30px 0 0;
            width: 1200px;
            margin: 25px auto;
            flex-wrap: wrap;
    		justify-content: space-between;
    		
    		/* display: block; */
            list-style-type: disc;
            margin-block-start: 1em;
            margin-block-end: 1em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
            padding-inline-start: 40px;
        }
        .review-list{
            text-align: center;
            width: 23%;
            justify-content: space-between;
            flex-wrap: wrap;
            margin-bottom : 30px;
        }
        .wrap{
            width: 1200px;
            margin: 60px auto;
        }
        .thumb {
            width: 100%;
            height : 276px;
            overflow : hidden;
        }
        .thumb > img{
            width: 100%;
            height : 100%;
            object-fit : cover;
        }
        .description{
      		margin-top : 15px;
      	}
        .review_list_inner{
            display: flex;
            flex-direction: column;
            align-items: center;
            font-size : 13px;
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
        #review-page{
        	text-align: center;
        	margin-top : 80px;
            margin: 80px auto;
            color:#3A2618;
            font-size: 45px;
        	font-weight: bold;
        }
        #search{
        	margin: 10px auto;
        	display: flex;
        	justify-content: center;
        }
        #search-icon{
        	width : 15px;
	       	border: none;
		    margin-right:5px;
		    cursor:pointer;
		    background-color:transparent;
        }
        .content{
            width: 290px;
            height: 110px;
        }
       
    </style>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>

    <div class="wrap">
    	<div id="review-page">리뷰 게시판</div>
    	<c:if test="${!empty rList }">
	        <ul class="review-board board-fixed">
		        <c:forEach items ="${rList}" var="review" varStatus="i">
		            <li data-href="#" class="review-list">
		                <div class="review_list_inner" data-href="#">
		                    <a href="/review/detail.kh?reviewNo=${review.reviewNo }<%-- &page=${currentPage} --%>">
			                    <div class="thumb-box">
			                        <div class="thumb">
			                        	<img src="../resources/reviewUploadFiles/${review.reviewFileRename }">
			                        </div>
			                        <div class="content">
				                        <%-- <a href="/review/detail.kh?reviewNo=${review.reviewNo }&page=${currentPage}"> --%>
				                       	 	${review.reviewContent }<br><br>
										</a>
									</div>
									<div class="writer">작성자 : ${review.reviewWriter }</div>
			                        <p class="point displaynone">
			                        	<c:if test="${review.starRating == 1 }">★☆☆☆☆</c:if>
			                        	<c:if test="${review.starRating == 2 }">★★☆☆☆</c:if>
			                        	<c:if test="${review.starRating == 3 }">★★★☆☆</c:if>
			                        	<c:if test="${review.starRating == 4 }">★★★★☆</c:if>
			                        	<c:if test="${review.starRating == 5 }">★★★★★</c:if>
									</p>
			                        <p class="date "><i class="bar"></i>${review.rCreateDate }</p>
			                        <div class="review_product_info">
				                        <a href="/review/detail.kh?reviewNo=${review.storeName  }">
				                            <span class="storeName">빵집 : ${review.storeName }</span>
				                        </a>	                       
				                    </div>
			                 	</div>
		                 	</a>
		                </div>
		            </li>
	         	</c:forEach>
	        </ul>
	        <div class="paging-btn">
	            <ul id="paging-wrap">
		            <c:if test="currentPage != 1 }">        
		                <li id="paging-number">
			                    <a href="/review/${urlVal }.kh?page=${currentPage - 1 }"><span>«</span></a>
		                </li>
		            </c:if>
		                <c:forEach var="p" begin="${startNavi }" end="${endNavi }">
		                	<c:if test="${currentPage eq p }">
		                		<b>${p }</b>
		                	</c:if>
		                	<c:if test="${currentPage ne p }">
		                		<li id="paging-number"><a href="/review/${urlVal }.kh?page=${p }&searchCondition=${searchCondition}&searchValue=${searchValue}">${p }</a></li>
		                	</c:if>
		                </c:forEach>
			        <c:if test="${maxPage > currentPage }">
		                <li id="paging-number">
		                    <a href="/review/${urlVal }.kh?page=${currentPage + 1 }"><span>»</span></a> 
		                </li>
			        </c:if>
	            </ul>
           </c:if>
            
            <c:if test="${empty rList }">
				<tr>
					<td colspan="6" align="center"><b>데이터가 존재하지 않습니다.</b></td>
				</tr>
			</c:if>
			<div id="search">
				<form action="/review/search.kh" method="get">
					<select name="searchCondition">
						<option value="all" <c:if test="${searchCondition eq 'all' }">selected</c:if>>전체</option>
						<option value="writer" <c:if test="${searchCondition eq 'writer' }">selected</c:if>>작성자</option>
						<option value="content" <c:if test="${searchCondition eq 'content' }">selected</c:if>>내용</option>
					</select>
					<input type="text" name="searchValue" value="${searchValue }">
					<input id="search-icon" type="image" src="/resources/image/icon/serch_bt.png" alt="검색">
					<!-- <a id="search-icon" href="/resources/image/icon/search_icon.png"></a><input type="submit" value="검색"></a> -->
				</form>
			</div>
        </div>
    </div>

</body>
</html>