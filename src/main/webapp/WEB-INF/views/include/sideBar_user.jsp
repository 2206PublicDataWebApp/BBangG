<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body>
<nav id="sideBar">
    <ul class="menu">
        <li><a href="/user/myPage.kh" >내정보수정</a></li>
        <li><a href="/order/userOrderList.kh?userId=${login.userId }" >주문 조회</a></li>
    </ul>
</nav>
<style>
#sideBar{
    width: 200px;
    background-color: #F0F0F0;
    position: fixed;
      height:100%;
    padding-top:30px;

}
.menu li a{
    height: 40px;
    display: block;
    padding: 0 40px;
    font-size: 16px;
    color: #3A2618;
}
.menu li a:hover{
	 font-size:18px;
	 font-weight: bolder;
}

.menu li a.choiceMenu{
	 font-size:18px;
	 font-weight: bolder;
}



</style>
</body>
</html>