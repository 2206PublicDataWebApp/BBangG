<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
      .wrapper {
        display: grid;
        grid-template-rows: repeat(3, 300px);
        grid-template-columns: repeat(3, 300px);
        column-gap: 50px;
        row-gap: 50px;
        padding: 80px;
      }
      .item {
        border: 1px solid black;
      }
      .image {
        width: 100%;
        height: 250px;
      }
      .word {
        width: 100%;
        height: 50px;
        text-align: center;
      }
      img {
        width: 100%;
        height: 100%;
        object-fit: contain;
      }
    </style>
</head>
<body>
    <header></header>
    <section>
      <div class="wrapper">
    <c:forEach items="${sList }" var="store">
        <div class="item">
          <a href="/store/storeDetail.kh?storeNo=${store.storeNo }">
            <div class="image"><img src="/resources/store-images/${store.storeFileRename }" alt="" /></div>
            <div class="word">${store.storeName }</div>
          </a>
        </div>
      </c:forEach>
      </div>
      <div align="center">
      <select>
        <option>점포이름</option>
        <option>지역</option>
      </select>
      <input type="text" />
      <button>검색</button>
      </div>
    </section>
    <footer></footer>
  </body>
</html>