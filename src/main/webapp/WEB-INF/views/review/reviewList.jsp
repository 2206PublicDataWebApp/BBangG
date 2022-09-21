<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 리스트</title>
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
            max-width: var(--width);
            margin: 100px auto 0;
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

        .review-board {
            display: flex;
            padding: 30px 0 0;
            width: 1200px;
            flex-wrap: wrap;
            margin: 25px auto;
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
    </style>
</head>
<body>
    <div class="wrap">
        <ul class="review-board board-fixed">
	        <c:forEach items ="${rList}" var="review" varStatus="i">
	            <li data-href="#" class="review-list">
	                <div class="review_list_inner" data-href="#">       
	                    <p class="no"></p>
		                    <div class="thumb-box">
		                        <div class="thumb"><img src="../resources/image/review-image/bread.jpg"></div>
			                        <div class="content">
				                        <a href="#">
				                       	 	${review.reviewContents }<br><br>
										</a>
									</div>
		                        <p class="point displaynone">${review.starRating }</p>
		                        <p class="date "> <br><i class="bar"></i>${review.rCreateDate }</p>
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
    </div>
</body>
</html>