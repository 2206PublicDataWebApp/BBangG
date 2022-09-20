<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>리뷰 상세</title>

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
        #order-btn{
            width: 500px;
            margin: 20px auto;
            display:block;
        }
        .review-detail{ 
            border : 1px solid #002954 ;
            width: 980px;
            margin: 25px auto;
            box-sizing:border-box ;
            padding : 30px 40px;

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
        /* .review-title{
            display: flex;
            height: 150px;

        }
        .title-btn-reft{
            text-align: center;

        }
        .title-btn3-right{
            margin-left: auto;
            text-align: center;
        }  */
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

        #btn-modify{
            width: 80px;
            font-size: 15px;
            border: 2px solid #002954;
            background-color: #002954;
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
            border: 2px solid #002954;
            background-color: #ffffff;
            color: #002954;
            /* padding: 15px 25px; */
            text-align: center;
            text-decoration: none;
            display: inline-block;
            position: relative;
            left : 80%;
        }

    </style>
    <script src="/resources/js/jquery-3.6.1.min.js"></script>
</head>
<body>
	
	    <div>
	        <a href="#"><button type="submit" id="order-btn">주문하러 가기</button></a>
	    </div>
	    <div class="review-title">
	        <h1>만동제과</h1>
	        <h1>(1,826)</h1>
	        &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 
	        &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 
	        &nbsp &nbsp &nbsp &nbsp &nbsp  
	            <div class="review-title-btn">
	                <a href="#"><button class="title-btn-reft">좋아요많은 순</button></a>
	                <a href="#"><button class="title-btn-reft">최신순</button></a>
	                <a href="#"><button class="title-btn3-right">리뷰 작성하기</button></a>
	            <!-- <a href="#"><button class="review-writer">리뷰 작성하기</button></a> -->
	            </div>
	    </div>
	    <!-- 1 -->
	    <div class="review-detail">
	        <div class="">
	            <div>카레빵맨</div>
	            <div>2022/09/16</div>
	            <div>★★★★★</div>
	            <div>♡</div>
	            <div>1,078</div>
	            <img alt="본문이미지" src="" width="500">
	            <div>너무 요새 유명한 만동제과!!!! 벼르고 벼르다가 맘 먹고 갔어요 ㅎㅎㅎ 
			                마늘바게트가 시그니쳐 메뉴라서 두개 샀어요 저는 바삭바삭한 마늘바게트보다 
			                만동제과처럼 마늘 소스가 촉촉한 마늘바게트가 좋은데 딱 제 스타일이었습니다 
			                진짜 너무너무 맛있어요 ㅠㅠㅠㅠ 집에 소분해서 에어프라이어에 돌려먹으니까 
			                겉은 바삭 속은 촉촉 겉바속촉.... 다른 것도 시식이 너무 많아서 시식만 
			                먹다가 배가 불러버렸네요.. 인절미 맛 나는 빵이랑 치아바타 
			                그리고 쑥빵 다 너무 맛있었어요 특히나 쑥빵은 계획에 없었는데 
			                시식빵 먹어보고 너무 맛있어서 샀는데 안에는 쑥떡이 들어있어서 
			                쑥향도 너무 좋고 완전 인생빵 만동제과 진짜 강추할게요 
			                강추강추 속초 봉브레드 마늘빵 맛있게 드신분들은 맛있을 것 같아요
			    </div>
	        </div>
	        <!-- <div>
	            <div>장발장</div>
	            <div>이건 햄빵이예요</div>
	            <div>22/09/17</div>
	            <input type="button" value="수정">
	            <input type="submit" value="삭제">
	        </div> -->
	        <div class="btn-wrap">
	            <a id="btn-modify" href="#">수정</a>
	            <a id="btn-delete" href="#" onclick="">삭제하기</a>
	        </div>
	    </div>
	
	    <!-- 2 -->
	    <div class="review-detail">
	        <div class="">
	            <div>카레빵맨</div>
	            <div>2022/09/16</div>
	            <div>★★★★★</div>
	            <div>♡</div>
	            <div>1,078</div>
	            <img alt="본문이미지" src="" width="500">
	            <div>너무 요새 유명한 만동제과!!!! 벼르고 벼르다가 맘 먹고 갔어요 ㅎㅎㅎ 
			                마늘바게트가 시그니쳐 메뉴라서 두개 샀어요 저는 바삭바삭한 마늘바게트보다 
			                만동제과처럼 마늘 소스가 촉촉한 마늘바게트가 좋은데 딱 제 스타일이었습니다 
			                진짜 너무너무 맛있어요 ㅠㅠㅠㅠ 집에 소분해서 에어프라이어에 돌려먹으니까 
			                겉은 바삭 속은 촉촉 겉바속촉.... 다른 것도 시식이 너무 많아서 시식만 
			                먹다가 배가 불러버렸네요.. 인절미 맛 나는 빵이랑 치아바타 
			                그리고 쑥빵 다 너무 맛있었어요 특히나 쑥빵은 계획에 없었는데 
			                시식빵 먹어보고 너무 맛있어서 샀는데 안에는 쑥떡이 들어있어서 
			                쑥향도 너무 좋고 완전 인생빵 만동제과 진짜 강추할게요 
			                강추강추 속초 봉브레드 마늘빵 맛있게 드신분들은 맛있을 것 같아요
			    </div>
	        </div>
	        <!-- <div>
	            <div>장발장</div>
	            <div>이건 햄빵이예요</div>
	            <div>22/09/17</div>
	            <input type="button" value="수정">
	            <input type="submit" value="삭제">
	        </div> -->
	        <div class="btn-wrap">
	            <a id="btn-modify" href="#">수정</a>
	            <a id="btn-delete" href="#" onclick="">삭제하기</a>
	        </div>
	    </div>
	
	    <!-- 3 -->
	    <div class="review-detail">
	        <div class="">
	            <div>카레빵맨</div>
	            <div>2022/09/16</div>
	            <div>★★★★★</div>
	            <div>♡</div>
	            <div>1,078</div>
	            <img alt="본문이미지" src="" width="500">
	            <div>너무 요새 유명한 만동제과!!!! 벼르고 벼르다가 맘 먹고 갔어요 ㅎㅎㅎ 
			                마늘바게트가 시그니쳐 메뉴라서 두개 샀어요 저는 바삭바삭한 마늘바게트보다 
			                만동제과처럼 마늘 소스가 촉촉한 마늘바게트가 좋은데 딱 제 스타일이었습니다 
			                진짜 너무너무 맛있어요 ㅠㅠㅠㅠ 집에 소분해서 에어프라이어에 돌려먹으니까 
			                겉은 바삭 속은 촉촉 겉바속촉.... 다른 것도 시식이 너무 많아서 시식만 
			                먹다가 배가 불러버렸네요.. 인절미 맛 나는 빵이랑 치아바타 
			                그리고 쑥빵 다 너무 맛있었어요 특히나 쑥빵은 계획에 없었는데 
			                시식빵 먹어보고 너무 맛있어서 샀는데 안에는 쑥떡이 들어있어서 
			                쑥향도 너무 좋고 완전 인생빵 만동제과 진짜 강추할게요 
			                강추강추 속초 봉브레드 마늘빵 맛있게 드신분들은 맛있을 것 같아요
			    </div>
	        </div>
	        <!-- <div>
	            <div>장발장</div>
	            <div>이건 햄빵이예요</div>
	            <div>22/09/17</div>
	            <input type="button" value="수정">
	            <input type="submit" value="삭제">
	        </div> -->
	        <div class="btn-wrap">
	            <a id="btn-modify" href="#">수정</a>
	            <a id="btn-delete" href="#" onclick="">삭제하기</a>
	        </div>
	    </div>
	
	    <div class="paging-btn">
	        <ul>     
	            <li>      
	                <a href="#">        
	                    <span>«</span>
	                </a>
	            </li>
	            <li><a href="#">1</a></li>
	            <li><a href="#">2</a></li>
	            <li><a href="#">3</a></li>    
	            <li><a href="#">4</a></li>    
	            <li><a href="#">5</a></li>    
	            <li>
	                <a href="#">
	                    <span>»</span>
	                </a> 
	            </li>
	        </ul>
	            
	    </div>
	</body>
	
<!-- 	<script>
	
	</script> -->
</body>
</html>