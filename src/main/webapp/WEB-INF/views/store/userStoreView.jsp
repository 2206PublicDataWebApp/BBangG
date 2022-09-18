<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        height: 200px;
        border: 1px solid red;
      }
      .word {
        width: 100%;
        height: 100px;
        border: 1px solid blue;
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
        <div class="item">
          <a href="/store/storeDetail.kh">
            <div class="image"><img src="45.png" alt="" /></div>
            <div class="word">말디니에용</div>
          </a>
        </div>
        <div class="item">2</div>
        <div class="item">3</div>
        <div class="item">4</div>
        <div class="item">5</div>
        <div class="item">6</div>
        <div class="item">7</div>
        <div class="item">8</div>
        <div class="item">9</div>
      </div>
      <select>
        <option>점포이름</option>
        <option>지역</option>
      </select>
      <input type="text" />
      <button>검색</button>
    </section>
    <footer></footer>
  </body>
</html>