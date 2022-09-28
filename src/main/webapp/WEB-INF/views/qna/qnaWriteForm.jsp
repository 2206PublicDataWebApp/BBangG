<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의 등록</title>
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

        .qna-write{
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
        
        textarea {
    width: 100%;
    height: 20em;
    border: none;
    resize: none;
  }
  
  

    </style>
    <script src="/resources/js/jquery-3.6.1.min.js"></script>
    <%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<div id="all" style="padding:0px 300px 0px 300px"]>
    <h1 align="center">질문 등록</h1>
    <div align="center">
	<br><br>
	<form action="/qna/register.kh" method="post" enctype="multipart/form-data">
		<table align="center" border="1">
			<tr>
				<td align=center>제목</td>
				<td><input type="text" name="qnaTitle" placeholder="제목을 입력하세요" style="width:100%; border:0"; required></td>
			</tr>
			<tr>
				<td align=center>작성자</td>
				<td><input type="text" name="qnaUserName" value="${login.userName }" style="width:100%" readonly></td>
				<input type="text" name="qnaWriter" value="${login.userId}" style="display: none">
			</tr>
			<tr>
				<td align=center>내용</td>
				<td><textarea cols="50" rows="10" name="qnaContent" placeholder="내용을 입력하세요" required></textarea></td>
			</tr>
			<tr>
				<td align=center>첨부파일</td>
				<td><input type="file" name="uploadFile"></td>
			</tr>
			<tr>
				<td align=center>비밀글 여부</td>

				<td>
					<select name="qnaSecret">
						<option value="1">비밀글</option>
						<option value="0">전체 공개</option>
					</select>
				</td>
			
			</tr>
		</table>
			</div>
			<br>
				<div align="center">
					<button class="write-btn" type="submit">등록</button>
					<button class="write-btn-cancel" type="reset">취소</button></a>
				
	</form>
				</div>
				</div>
				<br>
				<br><br><br><br><br>
					</div id="wrapper"><jsp:include page="/WEB-INF/views/include/footer.jsp" /></div>
				
</body>
</html>
