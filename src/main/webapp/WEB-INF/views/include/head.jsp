<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빵지순례</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style>

* {
	font-family: 'Noto Sans KR', sans-serif;

}

a {
	text-decoration: none;
	color: #3A2618;
}
.header-title {
	font-weight: bold;
	color: #3A2618;
	display: flex;
	width: 100%;
	height: 50px;
	align-items: center;
	background-color: white;
	position: fixed;
	top: 0px;
    padding: 10px;
    justify-content: space-between;
    margin 0 auto;
    border-bottom: 1px solid #EFEFEF;
    z-index:10000;
}
body{
	padding-top: 70px;
}
.bbangg {
	vertical-align: top;
	font-size: 30px;
}

.menu-bar {
	display: flex;
	margin: 0 auto;
}

#menu {
    text-align: center;
    margin: 0 20px;
}


.my-ul{
	display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
    list-style: none;
    margin-right: 1em;
}
.my-li {
	display: inline-block;
    margin-right: 15px;
    vertical-align: middle;
    line-height: 60px;
    list-style: none;
}

.logo{
	width : 170px;
	height: 50px;
	object-fit: cover;
}
</style>

