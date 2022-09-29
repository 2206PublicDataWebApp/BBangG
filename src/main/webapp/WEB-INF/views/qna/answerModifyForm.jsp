<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의 수정</title>
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
        #qna-content{
            
            margin: 0px auto;
           
        }
        #max{
        	
        	margin: 10px auto;
            font-size : 10px;
          
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
		    text-shadow: 0 0 0 #a00; 
		}
        .write-btn-cancel{
            width: 80px;
            font-size: 15px;
            border: 2px solid #002954;
            background-color: #ffffff;
            color: #002954;
        
            text-align: center;
            text-decoration: none;
            display: inline-block;
       
        }
        
        .write-btn{
            width: 80px;
            font-size: 15px;
            border: 2px solid #002954;
            background-color: #002954;
            color: #ffffff;
          
            text-align: center;
            text-decoration: none;
            display: inline-block;
          
        }

    </style>
    <script src="/resources/js/jquery-3.6.1.min.js"></script>
    <%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
    <div class="review-write">
        <h2 id="store-name"> 답변 수정</h2>
            <div id="write_area">
                		
	         </div>
	         <form action="/qna/answerModify.kh" method="post" enctype="multipart/form-data">
	         	<input type="hidden" name="page" value="${page }">
				<input type="hidden" name="answerNo" value="${qna.answerNo }">
				<input type="hidden" name="qnaFilename" value="${qna.qnaFilename }">
				<input type="hidden" name="qnaFileRename" value="${qna.qnaFileRename }">
				
                	<input type="text" name="answerTitle" value="${qna.answerTitle }">
                	<br><br>
                <div id="qna-content">
                    <textarea name="qnaContent" id="in-content" rows="20" cols="55" placeholder="내용을 작성해주세요" required>${qna.answerContent}</textarea>
                    <div id="max">(0 / 2000)</div>
                </div>

                <input type="file" id="select-file" name="reloadFile" value="${qna.qnaFilename }"/>
                
	            <div>
	                <a  href = "/qna/list.kh"><button class="write-btn-cancel" type="reset">취소</button></a>
	                <button class="write-btn" type="submit">수정</button>
	                <br>
	                <a href="/qna/list.kh" >목록</a>&nbsp&nbsp&nbsp
					<a href="javascript:history.go(-1);">이전 페이지로</a>
	          
	          
				
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
