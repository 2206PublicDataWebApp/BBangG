<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            font-size: 30px;
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
       
    </style>

    <div class="wrap">
    	<div id="review-page"># 믿고가는 빵집 BEST</div>
        <ul class="review-board board-fixed">
	        <c:forEach items ="${reviewList}" var="review" varStatus="i">
	            <li data-href="#" class="review-list">
	                <div class="review_list_inner" data-href="#">
	                    <a href="/review/detail.kh?reviewNo=${review.reviewNo }">
		                    <div class="thumb-box">
		                        <div class="thumb">
		                        	<img src="../resources/reviewUploadFiles/${review.reviewFileRename }">
		                        </div>
		                        <div class="content">
			                       	 	${review.reviewContent }<br><br>
									</a>
								</div>
								<div class="writer">${review.reviewWriter }</div>
		                        <p class="point displaynone">
		                        	<c:if test="${review.starRating == 1 }">★☆☆☆☆</c:if>
		                        	<c:if test="${review.starRating == 2 }">★★☆☆☆</c:if>
		                        	<c:if test="${review.starRating == 3 }">★★★☆☆</c:if>
		                        	<c:if test="${review.starRating == 4 }">★★★★☆</c:if>
		                        	<c:if test="${review.starRating == 5 }">★★★★★</c:if>
		                        </p>
		                        <p class="date "><i class="bar"></i>${review.rCreateDate }</p>
		                        <div class="review_product_info">
			                        <a href="/review/detail.kh?reviewNo=${review.reviewNo  }">
			                            <span class="storeName">${review.storeName }</span>
			                        </a>	                       
			                    </div>
		                 	</div>
	                 	</a>
	                </div>
	            </li>
         	</c:forEach>
        </ul>
    </div>
