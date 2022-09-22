<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<script src="https://kit.fontawesome.com/17243252a5.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resources/css/main.css" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp" />
	<div class="slide">
		<ul class="slide__list">
			<li class="slide__item"><img class="slide__image"
				src="images/1.jpeg" alt="" /></li>
			<li class="slide__item"><img class="slide__image"
				src="images/2.jpeg" alt="" /></li>
			<li class="slide__item"><img class="slide__image"
				src="images/3.jpeg" alt="" /></li>
			<li class="slide__item"><img class="slide__image"
				src="images/4.jpeg" alt="" /></li>
			<li class="slide__item"><img class="slide__image"
				src="images/5.jpeg" alt="" /></li>
		</ul>
		<div class="buttons"></div>
		<div class="paginations"></div>
	</div>
	<!-- Scripts -->
	<script>
    const list = document.querySelector('.slide__list');
    const items = document.querySelectorAll('.slide__item');
    const buttons = document.querySelector('.buttons');
    const paginations = document.querySelector('.paginations');
    const lastIndex = items.length - 1;
    let selected = 0;
    let interval;

    // Util Functions
    const setTransition = (value) => {
      list.style.transition = value;
    };

    const setTranslate = ({ index, reset }) => {
      if (reset) list.style.transform = `translate(-${list.clientWidth}px, 0)`;
      else list.style.transform = `translate(-${(index + 1) * list.clientWidth}px, 0)`;
    };

    const activePagination = (index) => {
      [...paginations.children].forEach((pagination) => {
        pagination.classList.remove('on');
      });
      paginations.children[index].classList.add('on');
    };

 // Make prev and next buttons.
    const handlePrev = () => {
      selected -= 1;
      setTransition('transform 0.3s linear');
      setTranslate({ index: selected });
      if (selected < 0) {
        selected = lastIndex;
        setTimeout(() => {
          setTransition('');
          setTranslate({ index: selected });
        }, 300);
      }
      if (selected >= 0) activePagination(selected);
    };

    const handleNext = () => {
      console.log(selected);
      selected += 1;
      setTransition('transform 0.3s linear');
      setTranslate({ index: selected });
      if (selected > lastIndex) {
        selected = 0;
        setTimeout(() => {
          setTransition('');
          setTranslate({ index: selected });
        }, 300);
      }
      if (selected <= lastIndex) activePagination(selected);
    };

    const handlePagination = (e) => {
    	  if (e.target.dataset.num) {
    	    selected = parseInt(e.target.dataset.num);
    	    setTransition('all 0.3s linear');
    	    setTranslate({ index: selected });
    	    activePagination(selected);
    	  }
    	};
    	
    const render = () => {
      // makeButton();
      const makeButton = () => {
  if (items.length > 1) {
    const prevButton = document.createElement('button');
    prevButton.classList.add('buttons__prev');
    prevButton.innerHTML = '<i class="fas fa-arrow-left"></i>';
    prevButton.addEventListener('click', handlePrev);

    const nextButton = document.createElement('button');
    nextButton.classList.add('buttons__next');
    nextButton.innerHTML = '<i class="fas fa-arrow-right"></i>';
    nextButton.addEventListener('click', handleNext);

    buttons.appendChild(prevButton);
    buttons.appendChild(nextButton);
  }
};
      // makePagination();
      const makePagination = () => {
  if (items.length > 1) {
    for (let i = 0; i < items.length; i++) {
      const button = document.createElement('button');
      button.dataset.num = i;
      button.classList.add('pagination');
      if (i === 0) {
        button.classList.add('on');
      }
      paginations.appendChild(button);
      paginations.addEventListener('click', handlePagination);
    }
  }
};
      // cloneElement();
      // Clone the first and last elements.
const cloneElement = () => {
  list.prepend(items[lastIndex].cloneNode(true));
  list.append(items[0].cloneNode(true));
  setTranslate({ reset: true });
};
      // autoplay({ duration: 2000 });
const autoplayIterator = () => {
	  selected += 1;
	  setTransition('all 0.3s linear');
	  setTranslate({ index: selected });
	  if (selected > lastIndex) {
	    activePagination(0);
	    clearInterval(interval);
	    setTimeout(() => {
	      selected = 0;
	      setTransition('');
	      setTranslate({ reset: true });
	      autoplay({ duration: 2000 });
	    }, 300);
	  }
	  if (selected <= lastIndex) activePagination(selected);
	};

	const autoplay = ({ duration }) => {
	  interval = setInterval(autoplayIterator, duration);
	};
      
    };
    render();
    
   
    </script>
</body>
</html>
