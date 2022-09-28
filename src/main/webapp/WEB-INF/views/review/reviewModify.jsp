<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 작성</title>
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
        #review-content{
            
            margin: 0px auto;
           
        }
        #max{
        	
        	margin: 10px auto;
            font-size : 10px;
            /* text-align : right; */
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
		    text-shadow: 0 0 0 #a00; /* 마우스 클릭 체크 */
		}
        .write-btn-cancel{
            width: 80px;
            font-size: 15px;
            border: 1px solid #767676;
            background-color: #767676;
            color: rgb(255, 255, 255);
            /* padding: 15px 25px; */
            text-align: center;
            text-decoration: none;
            display: inline-block;
            /* position: relative;
            left : 80%; */
        }
        
        .write-btn{
            width: 80px;
            font-size: 15px;
            border: 1px solid #767676;
            background-color: #ffffff;
            color: #767676;
            /* padding: 15px 25px; */
            text-align: center;
            text-decoration: none;
            display: inline-block;
            /* position: relative;
            left : 80%; */
        }

    </style>
    <script src="/resources/js/jquery-3.6.1.min.js"></script>
    <%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
    <div class="review-write">
        <h2 id="store-name">${review.storeName }에서 작성한 리뷰를 수정합니다</h2>
            <div id="write_area">
                <div class="star-rating">
                    <form class="star-form" name="star-form" id="star-form" method="post">
                        <fieldset>
                            <div class="text-bold">평가하기</div>
	                            <div class="text-bold">별점을 선택해주세요</div>
	                            <input type="radio" name="reviewStar" value="5" id="rate1"><label for="rate1">★</label>
	                            <input type="radio" name="reviewStar" value="4" id="rate2"><label for="rate2">★</label>
	                            <input type="radio" name="reviewStar" value="3" id="rate3"><label for="rate3">★</label>
	                            <input type="radio" name="reviewStar" value="2" id="rate4"><label for="rate4">★</label>
	                            <input type="radio" name="reviewStar" value="1" id="rate5"><label for="rate5">★</label>
	                       </fieldset>
	                 </form>		
	            </div>			
	         </div>
	         <form id="modifyForm" action="/review/modify.kh" method="post" enctype="multipart/form-data">
	         	<input type="hidden" name="page" value="${page }">
				<input type="hidden" name="reviewNo" value="${review.reviewNo }">
				<input type="hidden" name="reloadFile" value="${review.reviewFilename }">
				<input type="hidden" name="reviewFileRename" value="${review.reviewFileRename }">
                <div id="review-content">
                	<%-- <input type="hidden" name="userId" value="${review.userId}" placeholder="작성자"/> --%>
                    <textarea name="reviewContent" id="in-content" rows="20" cols="55" placeholder="내용을 작성해주세요" required>${review.reviewContent}</textarea>
                    <div id="max">(0 / 2000)</div>
                </div>

                <!-- 왼쪽 정렬 -->
                <input type="file" id="select-file" name="reloadFile" value="${review.reviewFilename }"/>
                
	            <div>
	                <a  href = "/review/list.kh"><button class="write-btn-cancel" type="reset">취소</button></a>
	                <button class="write-btn" type="submit">수정</button>
	            </div>
			</form>
	
    </div>

     <script>

     
        $(document).ready(function() {
            $('#in-content').on('keyup', function() {
                $('#max').html("("+$(this).val().length+" / 2000)");
    
                if($(this).val().length > 2000) {
                    $(this).val($(this).val().substring(0, 2000));
                    $('#max').html("(2000 / 2000)");
                }
            });
    	});

     
    </script>
</body>
</html>
