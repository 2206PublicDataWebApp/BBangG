# 빵지순례

## 개요

> 맛있는 빵집의 정보를 모아두어 제공하는 사이트로 빵집을 검색하고 지역별로 확인할 수 있으며 맛있는 빵을 주문하고 리뷰를 공유 할 수 있도록 구성하였습니다.

## 기능   

#### -로그인 및 회원관리   

>**1. 로그인**   
>Controller 외에 Interceptor 클래스를 생성하여 세션 처리를 했고 쿠키와 세션을 이용해 자동로그인을 구현했습니다.   
>**2. 회원관리**   
>사용자는 회원가입을 할 수 있고 마이페이지에서 정보 수정, 탈퇴가 가능합니다.   
>관리자는 관리자페이지에서 회원 조회가 가능하며 강제로 탈퇴시킬 수 있습니다.   



#### - 점포 & 상품관리 및 검색
>**1. 점포와 상품관리**
>
> 관리자는 관리자 페이지에서 DB에 등록된 모든 점포를 확인 할 수 있습니다. 
> 관리자 페이지에서 점포를 등록할 수 있습니다. 점포 등록 시에는 점포 기본 정보 및 매장의 사진이 함께 등록되며, DB에는 점포 정보와 점포 사진 정보가 분리되어 저장됩니다.
> 점포 정보의 변경과 삭제가 가능합니다.
> 상품등록은 빵이라는 상품의 특성상 같은 이름을 가진 상품이 많을 수 있다고 판단해 점포정보와 함께 저장됩니다.
> 상품의 삭제는 체크버튼으로 가능하도록 제작하였습니다.
>
>**2. 검색, 상세페이지**
>
> 사용자는 기본적으로 빵집검색 페이지에서 점포의 목록을 볼 수 있습니다.
> 점포등록시 입력된 점포이름이나 주소의 일부만 입력하여도 결과가 출력됩니다.
> 페이지 상단의 지역을 클릭하면 해당지역의 점포를 빠르게 볼 수 있습니다.
> 점포상세페이지에는 해당 점포의 이미지, 입력된 정보를 볼 수 있고 주소를 이용하여 카카오 지도 API에 위치를 표시하여 줍니다. 또한, 해당 점포에 등록된 상품정보를 가져와 대표메뉴로 보여줍니다.

#### - 주문
>**1.주문하기**
>
> 점포별 제품을 주문하기 페이지에 불러와 주문할 수 있도록 구현했습니다.
> 
>**2. 주문관리**
>
>사용자 : 주문을 등록할 수 있으며 입금여부, 구매확정 여부에 따라 입금완료/구매확정 버튼을 이용해 배송상태 변경 할 수 있습니다. 
>       배송상태에 따라 즉시취소/취소요청/주문수정 할 수 있습니다.
>       날짜/기간별로 주문리스트를 불러 올 수 있습니다.
>       
>관리자 : 등록한 주문에 대해 입금확인, 배송출발 버튼을 이용해 배송상태를 변경 할 수 있습니다. 
>        취소요청이 있는 주문에 한하여 주문취소 할 수 있습니다.
>        날짜별/아이디/주문번호 검색을 통해 주문리스트를 불러 올 수 있습니다.


#### - 리뷰 
>**1. 리뷰게시판**  
>         리뷰 게시판에서 등록된 모든 스토어의 별점, 리뷰를 조회할 수 있으며, 등록된 게시물은 추천 할 수 있습니다.  
>         게시글을 작성자, 내용, 전체를 조건으로 검색할 수 있습니다.  
>         
>**2. 메인**  
>         메인페이지에서 BEST4 리뷰를 조회할 수 있습니다.
>
>**3. 스토어별 리뷰 게시판**   
>         빵집검색 카테고리에 등록된 빵집에서 게시글을 작성, 별점 등록을 할 수 있고  
>         등록된 게시물에 조회, 추천을 할 수 있습니다.  
>         등록된 리뷰는 높은 추천순으로 정렬됩니다.  
          
#### - QnA & FAQ
>**1. QnA**


# 기술스택

<div> 
  <img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white"> 
  <br>
  <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> 
  <br>
  <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> 
  <br>
  <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> 
  <br>
  <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">
  <br>
  <img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white"> 
  <br>
  <img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white"> 
  <br>
  <img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white"> 
  <br>
  <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">
  <br>
  <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">
  <br>
</div>
