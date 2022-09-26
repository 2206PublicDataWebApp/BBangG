<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빵지순례</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style type="text/css">
*{
	padding: 0;
	margin:0 auto;
	border: none;
	color: #3A2618;
}
    
body{
	font-family: 'Noto Sans KR', sans-serif;
	}
div{
	position:inline-block;
}
h2{
	text-align: center;
	color: #3A2618;
	margin-top: 150px;
	margin-bottom: 50px;
}
.cancel{
	text-align: center;
}
a, a:visited{
	color: #3A2618;
}

</style>
</head>
<body>
	<div>
	  <h2> 아이디는 
  		<c:forEach items="${uList}" var="uList">
  		  	${uList.userId}
  		
  		</c:forEach>
  		입니다</h2>
  	<div class="cancel"><a href="javascript:history.back(-1)">뒤로가기</a></div>
  	</div>
</body>
</html>