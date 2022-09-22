<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>빵지순례 리뷰</title>
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
            color : dimgray;
        }
        ul {
            display: block;
            list-style-type: disc;
            margin-block-start: 1em;
            margin-block-end: 1em;
            margin-inline-start: 0px;
            margin-inline-end: 0px;
            padding-inline-start: 40px;
        }
        /* html {
            width: 980px;
            height: 100%;
            color: var(--main-color);
        } */
        div {
            display: block;
        }
        body, code {
            font-size: 15px;
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
            margin: 0 auto;
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
    </style>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
    <div class="wrap">
        <ul class="review-board board-fixed">
	        <c:forEach items ="${rList}" var="review" varStatus="i">
	            <li data-href="#" class="review-list">
	                <div class="review_list_inner" data-href="#">       
	                    <p class="no"></p>
		                    <div class="thumb-box">
		                        <div class="thumb">
		                        	<img src="../resources/image/review-image/bread.jpg">
		                        </div>
		                        <div class="content">
			                        <a href="#">
			                       	 	${review.reviewContents }<br><br>
									</a>
								</div>
								<div class="writer">${review.userId }</div>
		                        <p class="point displaynone"><%-- ${review.starRating } 별점이미지 or 아이콘--%>★★★★☆</p>
		                        <p class="date "><i class="bar"></i>${review.rCreateDate }</p>
		                 	</div>
	                    <div class="review_product_info">
	                    	
	                        <a href="#">
	                            <span class="storeNo">${review.storeNo }</span><!-- 점포명이 들어가야함 -->
	                        </a>	                       
	                    </div>
	                </div>
	            </li>
         	</c:forEach>
        </ul>
        <div class="paging-btn">
            <ul id="paging-wrap">     
                <li id="paging-number">      
                    <a href="#">        
                        <span>«</span>
                    </a>
                </li>
                <c:forEach var="p" begin="${startNavi }" end="${endNavi }">
                	<li id="paging-number"><a href="/review/list.kh?page=${p }">${p }</a></li>
                </c:forEach>
                <li id="paging-number">
                    <a href="/review/list.kh?page=${endNavi + 1 }">
                        <span>»</span>
                    </a> 
                </li>
            </ul>
        </div>
    </div>
</body>
</html>