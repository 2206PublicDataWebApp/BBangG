<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Id 조회</title>
</head>
<body>
	<div>
	  <h2> 아이디는 : </h2><br/>
  		<ul>
  		<c:forEach items="${uList}" var="uList">
  		  	
  		  	<li>${uList.userId} </li><br/>
  		
  		</c:forEach>
  		</ul>
  	<h2>입니다</h2>
  	<a href="javascript:history.back(-1)">뒤로가기</a>
  	</div>
</body>
</html>