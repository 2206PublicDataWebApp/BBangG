<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="./resources/css/main.css" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
 	<section id="container">
	    <div class="arrow prev" onclick = "prevNext(-1)">&#10094;</div>
	    <div class="arrow next" onclick = "prevNext(1)">&#10095;</div>
	
	    <div class="slideNum">
	        <span id="thisSlide">0</span> / <span id="allSlide">0</span>
	    </div>
	
	    <article class="slides">
	        <img src="./resources/image/main/111.jpg" alt="">
	    </article><!--1-->
	    <article class="slides">
	        <img src="./resources/image/main/222.jpg" alt="">
	    </article><!--2-->
	    <article class="slides">
	        <img src="./resources/image/main/333.jpg" alt="">
	    </article><!--3-->
	    <article class="slides">
	        <img src="./resources/image/main/444.jpg" alt="">
	    </article><!--4-->
	</section>

	<section id="pager">
	    <span class="dots on" onclick="currentSlide(1)"></span>
	    <span class="dots" onclick="currentSlide(2)"></span>
	    <span class="dots" onclick="currentSlide(3)"></span>
	    <span class="dots" onclick="currentSlide(4)"></span>
	</section>
	
	
	<div style="margin-top:50px;">
		<jsp:include page="/WEB-INF/views/include/mainReviewList.jsp"/>
	</div>
	<div>
		<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	</div>
	
	
  <script type="text/javascript">
  var slides = document.getElementsByClassName('slides');
  var dots =  document.getElementsByClassName('dots');

  var slideIndex = 0;

  document.getElementById('allSlide').innerHTML = slides.length;



  var myVar;


  showSlides();

  function showSlides(){
      for(var i=0; i<slides.length; i++){
          slides[i].style.display = 'none';
          dots[i].className = dots[i].className.replace(" on", "");}
      
      slideIndex++;

      if(slideIndex > slides.length){slideIndex = 1;}

      document.getElementById('thisSlide').innerHTML = slideIndex;
      slides[slideIndex-1].style.display = 'block';
      dots[slideIndex-1].className += ' on';
      
      myVar = setTimeout(showSlides, 2200);
  }//showSlides

  function stopSlide(){ clearTimeout(myVar);} //stopSlide

  /* ========= */

  function prevNext(num){
      stopSlide();
      slideIndex += num;

      for(var i=0; i<slides.length; i++){
          slides[i].style.display = 'none';
          dots[i].className = dots[i].className.replace(" on", ""); }

      if(slideIndex < 1){ slideIndex = slides.length; }
      if(slideIndex > slides.length ){ slideIndex = 1; }

      document.getElementById('thisSlide').innerHTML = slideIndex;
      slides[slideIndex - 1 ].style.display = 'block';
      dots[slideIndex - 1 ].className += ' on';
  }

  /* ========= */
  function currentSlide(num){
      stopSlide();
      slideIndex = num;

      for(var i=0; i<slides.length; i++){
          slides[i].style.display = 'none';
          dots[i].className = dots[i].className.replace(" on", ""); }
      
      document.getElementById('thisSlide').innerHTML = slideIndex;
      slides[slideIndex - 1 ].style.display = 'block';
      dots[slideIndex - 1 ].className += ' on';

  }
	</script>
</body>
</html>
