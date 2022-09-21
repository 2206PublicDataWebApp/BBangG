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
        <c:forEach items ="#{rList} " var="review" varStatus="i">
            <li data-href="#" class="review-list">
                <div class="review_list_inner" data-href="#">       
                    <p class="no"></p>
                    <div class="thumb-box">
                        <div class="thumb"><img src="../resources/image/review-image/bread.jpg"></div>
                    <div class="description" data-href="#">
                        <!-- <a href="#"><p class="subject"><a href="#">너무 요새 유명한 만동제과!!!!</p></a> -->
                        <a href="#"><p class="content">${review.reviewContents }<br>
				                            마늘바게트가 시그니쳐 메뉴라서 두개 샀어요 <br>
				                            저는 바삭바삭한 마늘바게트보 다....</p></a>
                        
                        <p class="point displaynone">${review.starRating }</p>
                        <p class="date "> <br><i class="bar"></i>${review.R_CREATE_DATE }</p>
                    </div>
                    <div class="review_product_info">
                        <a href="#">
                            <span class="rpi_tit">${review.storeNo }</span>
                        </a>
                    </div>
                </div>
            </li>
         </c:forEach>
            <!-- <li data-href="#" class="review-list">
                <div class="review_list_inner" data-href="#">       
                    <p class="no"></p>
                    <div class="thumb-box">
                        <span class="empty "></span>
                        <span class="thumb"><img src="//ecudemo221603.cafe24.com/web/product/tiny/202202/c5c236c4567bdeeaa04fe31c4d7dc2f5.jpeg" border="0" alt=""></span>
                        <span class="thumb-img" style="background:url('//ecudemo221603.cafe24.com/file_data/ecudemo221603/2022/02/14/64b864ed6664f226db51cd1524fa9476.jpg') no-repeat;"></span>
                        </div>
                    <div class="description" data-href="#">
                        <a href="#"><p class="subject"><a href="#">너무 요새 유명한 만동제과!!!!</p></a>
                        <a href="#"><p class="content">벼르고 벼르다가 맘 먹고 갔어요 ㅎㅎㅎ<br>
                            마늘바게트가 시그니쳐 메뉴라서 두개 샀어요 <br>
                            저는 바삭바삭한 마늘바게트보 다....</p></a>
                        <p class="date ">브래드피트 <i class="bar"></i> 2022-02-14</p>
                        <p class="point displaynone"><img src="//img.echosting.cafe24.com/skin/base/board/ico_point5.gif" alt="5점"></p>
                    </div>
                    <div class="review_product_info">
                        <a href="#">
                            <span class="rpi_tit">만동제과</span>
                        </a>
                    </div>
                </div>
            </li>
            <li data-href="#" class="review-list">
                <div class="review_list_inner" data-href="#">       
                    <p class="no"></p>
                    <div class="thumb-box">
                        <span class="empty "></span>
                        <span class="thumb"><img src="//ecudemo221603.cafe24.com/web/product/tiny/202202/c5c236c4567bdeeaa04fe31c4d7dc2f5.jpeg" border="0" alt=""></span>
                        <span class="thumb-img" style="background:url('//ecudemo221603.cafe24.com/file_data/ecudemo221603/2022/02/14/64b864ed6664f226db51cd1524fa9476.jpg') no-repeat;"></span>
                        </div>
                    <div class="description" data-href="#">
                        <a href="#"><p class="subject"><a href="#">너무 요새 유명한 만동제과!!!!</p></a>
                        <a href="#"><p class="content">벼르고 벼르다가 맘 먹고 갔어요 ㅎㅎㅎ<br>
                            마늘바게트가 시그니쳐 메뉴라서 두개 샀어요 <br>
                            저는 바삭바삭한 마늘바게트보 다....</p></a>
                        <p class="date ">브래드피트 <i class="bar"></i> 2022-02-14</p>
                        <p class="point displaynone"><img src="//img.echosting.cafe24.com/skin/base/board/ico_point5.gif" alt="5점"></p>
                    </div>
                    <div class="review_product_info">
                        <a href="#">
                            <span class="rpi_tit">만동제과</span>
                        </a>
                    </div>
                </div>
            </li>
            <li data-href="#" class="review-list">
                <div class="review_list_inner" data-href="#">       
                    <p class="no"></p>
                    <div class="thumb-box">
                        <span class="empty "></span>
                        <span class="thumb"><img src="//ecudemo221603.cafe24.com/web/product/tiny/202202/c5c236c4567bdeeaa04fe31c4d7dc2f5.jpeg" border="0" alt=""></span>
                        <span class="thumb-img" style="background:url('//ecudemo221603.cafe24.com/file_data/ecudemo221603/2022/02/14/64b864ed6664f226db51cd1524fa9476.jpg') no-repeat;"></span>
                        </div>
                    <div class="description" data-href="#">
                        <a href="#"><p class="subject"><a href="#">너무 요새 유명한 만동제과!!!!</p></a>
                        <a href="#"><p class="content">벼르고 벼르다가 맘 먹고 갔어요 ㅎㅎㅎ<br>
				                            마늘바게트가 시그니쳐 메뉴라서 두개 샀어요 <br>
				                            저는 바삭바삭한 마늘바게트보 다....</p></a>
                        <p class="date ">브래드피트 <i class="bar"></i> 2022-02-14</p>
                        <p class="point displaynone"><img src="//img.echosting.cafe24.com/skin/base/board/ico_point5.gif" alt="5점"></p>
                    </div>
                    <div class="review_product_info">
                        <a href="#">
                            <span class="rpi_tit">만동제과</span>
                        </a>
                    </div>
                </div>
            </li>
            2
                        <li data-href="#" class="review-list">
                <div class="review_list_inner" data-href="#">       
                    <p class="no"></p>
                    <div class="thumb-box">
                        <span class="empty "></span>
                        <div class="thumb"><img src="//ecudemo221603.cafe24.com/web/product/tiny/202202/c5c236c4567bdeeaa04fe31c4d7dc2f5.jpeg" border="0" alt=""></div>
                        <span class="thumb-img" style="background:url('//ecudemo221603.cafe24.com/file_data/ecudemo221603/2022/02/14/64b864ed6664f226db51cd1524fa9476.jpg') no-repeat;"></span>
                        </div>
                    <div class="description" data-href="#">
                        <a href="#"><p class="subject"><a href="#">너무 요새 유명한 만동제과!!!!</p></a>
                        <a href="#"><p class="content">벼르고 벼르다가 맘 먹고 갔어요 ㅎㅎㅎ<br>
                            마늘바게트가 시그니쳐 메뉴라서 두개 샀어요 <br>
                            저는 바삭바삭한 마늘바게트보 다....</p></a>
                        <p class="date ">브래드피트 <i class="bar"></i> 2022-02-14</p>
                        <p class="point displaynone"><img src="//img.echosting.cafe24.com/skin/base/board/ico_point5.gif" alt="5점"></p>
                    </div>
                    <div class="review_product_info">
                        <a href="#">
                            <span class="rpi_tit">만동제과</span>
                        </a>
                    </div>
                </div>
            </li>
            <li data-href="#" class="review-list">
                <div class="review_list_inner" data-href="#">       
                    <p class="no"></p>
                    <div class="thumb-box">
                        <span class="empty "></span>
                        <span class="thumb"><img src="//ecudemo221603.cafe24.com/web/product/tiny/202202/c5c236c4567bdeeaa04fe31c4d7dc2f5.jpeg" border="0" alt=""></span>
                        <span class="thumb-img" style="background:url('//ecudemo221603.cafe24.com/file_data/ecudemo221603/2022/02/14/64b864ed6664f226db51cd1524fa9476.jpg') no-repeat;"></span>
                        </div>
                    <div class="description" data-href="#">
                        <a href="#"><p class="subject"><a href="#">너무 요새 유명한 만동제과!!!!</p></a>
                        <a href="#"><p class="content">벼르고 벼르다가 맘 먹고 갔어요 ㅎㅎㅎ<br>
                            마늘바게트가 시그니쳐 메뉴라서 두개 샀어요 <br>
                            저는 바삭바삭한 마늘바게트보 다....</p></a>
                        <p class="date ">브래드피트 <i class="bar"></i> 2022-02-14</p>
                        <p class="point displaynone"><img src="//img.echosting.cafe24.com/skin/base/board/ico_point5.gif" alt="5점"></p>
                    </div>
                    <div class="review_product_info">
                        <a href="#">
                            <span class="rpi_tit">만동제과</span>
                        </a>
                    </div>
                </div>
            </li>
            <li data-href="#" class="review-list">
                <div class="review_list_inner" data-href="#">       
                    <p class="no"></p>
                    <div class="thumb-box">
                        <span class="empty "></span>
                        <span class="thumb"><img src="//ecudemo221603.cafe24.com/web/product/tiny/202202/c5c236c4567bdeeaa04fe31c4d7dc2f5.jpeg" border="0" alt=""></span>
                        <span class="thumb-img" style="background:url('//ecudemo221603.cafe24.com/file_data/ecudemo221603/2022/02/14/64b864ed6664f226db51cd1524fa9476.jpg') no-repeat;"></span>
                        </div>
                    <div class="description" data-href="#">
                        <a href="#"><p class="subject"><a href="#">너무 요새 유명한 만동제과!!!!</p></a>
                        <a href="#"><p class="content">벼르고 벼르다가 맘 먹고 갔어요 ㅎㅎㅎ<br>
				                            마늘바게트가 시그니쳐 메뉴라서 두개 샀어요 <br>
				                            저는 바삭바삭한 마늘바게트보 다....</p></a>
                        <p class="date ">브래드피트 <i class="bar"></i> 2022-02-14</p>
                        <p class="point displaynone"><img src="//img.echosting.cafe24.com/skin/base/board/ico_point5.gif" alt="5점"></p>
                    </div>
                    <div class="review_product_info">
                        <a href="#">
                            <span class="rpi_tit">만동제과</span>
                        </a>
                    </div>
                </div>
            </li>
            <li data-href="#" class="review-list">
                <div class="review_list_inner" data-href="#">       
                    <p class="no"></p>
                    <div class="thumb-box">
                        <span class="empty "></span>
                        <span class="thumb"><img src="//ecudemo221603.cafe24.com/web/product/tiny/202202/c5c236c4567bdeeaa04fe31c4d7dc2f5.jpeg" border="0" alt=""></span>
                        <span class="thumb-img" style="background:url('//ecudemo221603.cafe24.com/file_data/ecudemo221603/2022/02/14/64b864ed6664f226db51cd1524fa9476.jpg') no-repeat;"></span>
                        </div>
                    <div class="description" data-href="#">
                        <a href="#"><p class="subject"><a href="#">너무 요새 유명한 만동제과!!!!</p></a>
                        <a href="#"><p class="content">벼르고 벼르다가 맘 먹고 갔어요 ㅎㅎㅎ<br>
				                            마늘바게트가 시그니쳐 메뉴라서 두개 샀어요 <br>
				                            저는 바삭바삭한 마늘바게트보 다....</p></a>
                        <p class="date ">브래드피트 <i class="bar"></i> 2022-02-14</p>
                        <p class="point displaynone"><img src="//img.echosting.cafe24.com/skin/base/board/ico_point5.gif" alt="5점"></p>
                    </div>
                    <div class="review_product_info">
                        <a href="#">
                            <span class="rpi_tit">만동제과</span>
                        </a>
                    </div>
                </div>
            </li> -->
        </ul>
    </div>
</body>
</html>