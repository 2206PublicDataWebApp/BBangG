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
       .review-detail{ 
           border : 1px solid #414141 ;
           width: 980px;
           margin: 25px auto;
           box-sizing:border-box ;
           padding : 50px 60px;
       }
       .review-title{
           display: flex;
           margin: 25px auto;
           width: 980px;
           padding : 30px 40px;
           box-sizing:border-box ;
           border : 1px solid white ;
       }
       .review-title-btn{
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
           /* padding: 15px 25px; */
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
           /* padding: 15px 25px; */
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
       #bbang-img{
           margin-bottom: 10px;
       }
       #heart{
            text-decoration: none;
       }
       
</style>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div id="wrapper">
<input type="hidden" name="userId" value="${login.userId }">
    <div id="review-title">
        <div id="review-title">
            <h1 id="storename">${review.storeName } 리뷰</h1>
        </div>
    </div>
      <!-- 1 -->
      <div class="review-detail">
        <div class="detail-title-wrap">
            <div class="user-date-star">
                <div class="user-date">
                    <div class="user-id">${review.reviewWriter }</div>
                    <div class="date">${review.rCreateDate }</div>
                </div>
                <div id="star">
                    <c:if test="${review.starRating == 1 }">★☆☆☆☆</c:if>
                  	<c:if test="${review.starRating == 2 }">★★☆☆☆</c:if>
                  	<c:if test="${review.starRating == 3 }">★★★☆☆</c:if>
                  	<c:if test="${review.starRating == 4 }">★★★★☆</c:if>
                  	<c:if test="${review.starRating == 5 }">★★★★★</c:if>
                </div>
            </div>
            <div class="heart-count">
                <div id="heart"><a href="javascript:void(0);" onclick="clickHeart('${review.reviewNo}', 0);">♡  ${review.reviewHeart }</a></div>
            	<div>조회 ${review.reviewCount } </div>
            </div>
        </div>
        <div class="reivew-content">
            <div id="bbang-img">
                <img alt="본문이미지" src="/resources/reviewUploadFiles/${review.reviewFileRename }" width="500">
            </div>
        <div id="content">
        	${review.reviewContent }
        </div>
        
    </div>
    <c:if test="${login.userId eq review.reviewWriter }">
	    <div class="btn-wrap">
	            <a id="btn-modify" href="/review/modifyView.kh?reviewNo=${review.reviewNo }">수정</a>
	            <a id="btn-delete" href="#" onclick="reviewRemove('${review.reviewNo}');">삭제</a>
	     </div>
    </c:if>
    </div>
    
    	  <%-- <a id="btn-modify" href="/review/modifyView.kh?reviewNo=${review.reviewNo }&page=${page }">수정</a>
	      <a id="btn-delete" href="#" onclick="reviewRemove(${page});">삭제</a> --%>

</div>

   	<script>
   	
   	function clickHeart(reviewNo, storeNo){
   		var userId = '${login.userId}';
   		if('${empty login}' == 'true'){
   			alert('로그인을 해주세요');
   			
   		}else{
	   		location.href='/review/heartCountUpdate.kh?reviewNo='+reviewNo+'&storeNo='+storeNo;   				
   		}
   	}
   	
   	
   	function reviewRemove(reviewNo){
		event.preventDefault();
		if(confirm("삭제하시겠습니까?")){
			location.href="/review/remove.kh?reviewNo="+reviewNo;
		}
	}
	

	</script>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>