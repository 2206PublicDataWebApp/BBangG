# 빵지순례에 오신 것을 환영합니다!

## 개요

> 맛있는 빵집의 정보를 모아두어 제공하는 사이트로 빵집을 검색하고 지역별로 확인할 수 있으며 맛있는 빵을 주문하고 리뷰를 공유 할 수 있도록 구성하였습니다.

## 팀원소개 및 역할분담
>**- 🥪김다현[조장]**
>
>담당업무 : 회원관리(회원 가입, 정보 수정, 회원 탈퇴), 로그인(일반로그인, 자동로그인), ID/PW 찾기


>**- 🍞최진하**
>
>담당업무 : 상품 주문, 주문관리(주문조회,주문정보 수정, 주문상태 변경, 주문 취소) 

>**- 🥐고형진**
>
>담당업무 : 점포관리(점포 등록, 삭제, 수정, 조회), 상품관리(상품 등록, 삭제, 수정, 조회), 점포 검색 기능  

>**- 🥖조혜원**
>
>담당업무 : 커뮤니티 게시판(게시글 등록, 삭제, 수정, 조회), QnA 게시판(게시글 등록, 삭제, 수정, 조회)

>**- 🥯장은선**
>
>담당업무 : 리뷰게시판 게시글(등록, 수정, 삭제, 조회), 조건별 검색, 별점, 하트(좋아요), 베스트게시물, 점포별 리뷰 게시글 등록
## 기능   

#### -로그인 및 회원관리   

>**1. 로그인**   
>Controller 외에 Interceptor 클래스를 생성하여 세션 처리를 했고 쿠키와 세션을 이용해 자동 로그인을 구현했습니다.

>**2. 회원관리**   
>사용자:  회원가입을 할 수 있으며 메일 인증시 발송되는 6자리 난수번호의 정확한 입력이 필요합니다.
>         마이페이지에서 정보 수정, 탈퇴가 가능합니다.
>관리자:  관리자페이지에서 회원을 조회와 검색과 회원 탈퇴를 진행할 수 있습니다.
>         회원 탈퇴 버튼을 누르면 prompt 창이 표시되고 회원의 아이디를 입력 후 확인을 누르면 회원을 탈퇴시킬 수 있습니다.

>**3. 아이디/비밀번호 찾기**
>아이디를 찾기 위해서는 이름과 이메일이 필요하며 입력 후 ID찾기 버튼을 누르면 아이디가 출력됩니다.
>비밀번호를 찾기 위해서는 아이디와 이메일이 필요하며, 입력 후 PW찾기 버튼을 누르면 임시 비밀번호가 해당 이메일을 통해 전송되고 임시 비밀번호로 로그인을 할수 있습니다.



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
>         게시글을 등록(별점, 후기게시글, 이미지첨부), 수정(게시글, 별점, 이미지 수정), 삭제할 수 있으며
>         게시글을 작성자, 내용, 전체(게시글의 일부만 포함되어도 검색됨)를 조건으로 검색할 수 있습니다.
>         리뷰 게시판에서는 등록된 모든 스토어의 별점, 리뷰를 조회할 수 있으며, 등록된 게시물은 추천 할 수 있습니다.  
>         리뷰게시판에 등록된 게시글의 BEST4게시물이 메인화면에 노출됩니다.
>         게시글은 점포 상세페이지 안에서만 등록이 가능하며 해당하는 점포 상세페이지 하단에 포함되어 리뷰가 하트(좋아요)가 높은 차 순으로 보여집니다.
>         
>**2. 메인**  
>         리뷰 게시글을 메인페이지에서 BEST4 게시물로 노출됩니다.
>
>**3. 스토어별 리뷰 게시판**   
>         빵집검색 카테고리에 등록된 빵집에서 게시글을 작성, 별점 등록을 할 수 있고  
>         등록된 게시물에 조회, 추천을 할 수 있습니다.  
>         등록된 리뷰는 높은 추천순으로 정렬됩니다.  
          
#### - QnA & FAQ
>**1. QnA**
          사용자 : 질문을 등록할 수 있으며 희망여부에 따라 비밀글로 등록하여 해당 작성자 및 관리자만 조회/수정/삭제할 수 있습니다.
                 비밀글이 아닌 공개글로 작성한 질문글에 대해 다른 사용자들은 댓글을 입력할 수 있습니다. 댓글 또한 해당 댓글 작성자와 관리자만 수정/삭제가 가능합니다.
                 그동안 등록된 질문글에 대하여 작성자, 제목, 내용으로 해당 게시글을 검색할 수 있습니다.
          관리자 : 사용자가 입력한 질문글에 대해 답변글을 달 수 있습니다. 
                  부적절한 게시글이나 댓글에 대해 관리자 권한으로 삭제/수정할 수 있습니다.
                  
>**2. FAQ**
>         사용자 : 글을 작성할 수는 없으며 자주 묻는 질문에 대한 답변을 간편하게 조회할 수 있습니다.
>                 그동안 등록된 FAQ게시글에 대하여 제목, 내용으로 검색할 수 있습니다.
>         관리자 : 관리자페이지를 통해 FAQ게시판의 작성/수정/삭제가 가능합니다.
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



## 구현화면
#### 로그인
![로그인](https://user-images.githubusercontent.com/105486016/194996588-019995ab-6d47-4454-9a30-26963b92078b.JPG)
#### 회원가입
![회원가입](https://user-images.githubusercontent.com/105486016/194996631-e4dcf3f5-f060-419b-8770-93daced06391.jpg)
#### ID/PW찾기
![idpw찾기](https://user-images.githubusercontent.com/105486016/194996567-36f3f9aa-a4aa-4091-9ac6-b635e20665a8.JPG)
#### 가입 / 임시 비밀번호 메일
![메일](https://user-images.githubusercontent.com/105486016/194997324-cbd5e85d-20a0-4953-a673-a5d59e0b7d8f.JPG)
#### 마이페이지 > 정보수정
![마이페이지-정보수정](https://user-images.githubusercontent.com/105486016/194996605-6ffd1324-2251-4dca-b8c8-c62b528f758f.png)
#### 관리자 > 회원관리
![관리자-회원](https://user-images.githubusercontent.com/105486016/194996587-9d33c8ce-fa3f-4614-b666-8560f4548ab9.JPG)
#### 빵집리스트 및 검색
![빵집검색](https://user-images.githubusercontent.com/105486016/194996614-281dc0e5-4e4f-4b5f-a231-479595149575.JPG)
#### 빵집 상세페이지
![상세페이지](https://user-images.githubusercontent.com/105486016/194996628-7af2169c-9798-4efe-af69-30a85be0c39f.png)
#### 관리자 > 점포관리
![관리자-점포](https://user-images.githubusercontent.com/105486016/194998516-36d0e56b-9e8e-4d5c-a542-93bb5f7826a8.png)
#### 관리자 > 점포관리 > 상품관리
![관리자-상품관리](https://user-images.githubusercontent.com/105486016/194998514-5d2319e4-d664-4844-8126-c7dae65af6de.png)
#### 관리자 > 점포관리 > 점포등록
![관리자-점포등록](https://user-images.githubusercontent.com/105486016/194998519-34e2d898-051b-4d9b-a844-4c84c8020515.PNG)
#### 관리자 > 점포관리 > 점포수정
![관리자-점포수정](https://user-images.githubusercontent.com/105486016/194998520-d4e62c4d-249c-4632-a542-02abfc4140d4.png)
#### 주문하기
![주문하기](https://user-images.githubusercontent.com/105486016/194999794-91e7da4e-8916-44df-988c-a16818e9986b.PNG)
#### 마이페이지 > 주문목록
![마이페이지-주문](https://user-images.githubusercontent.com/105486016/194996634-874175e5-1415-4f48-9bfe-00e7cdd5552f.png)
#### 마이페이지 > 주문목록 > 주문상세
![마이페이지-주문2](https://user-images.githubusercontent.com/105486016/194996639-49bc31bc-90e4-4c23-9fc8-d7f6ae15154d.png)
#### 관리자 > 주문관리
![관리자-주문](https://user-images.githubusercontent.com/105486016/194996583-11779dc5-3489-4733-9c67-e0e3d3b13c52.png)
#### 관리자 > 주문상세
![관리자-주문상세](https://user-images.githubusercontent.com/105486016/195000264-5e80fc2b-f4b6-46e1-91c3-83bbc661d482.png)
#### 리뷰게시판
![review_List](https://user-images.githubusercontent.com/108337430/195141778-9f6e50b0-872e-432f-86fe-2194ffc33233.png)
#### 리뷰게시판 > 상세글보기
![리뷰게시판-1](https://user-images.githubusercontent.com/105486016/194996602-a8a20ce2-baeb-4839-be1a-89f1ea2a8763.JPG)
#### 리뷰게시판 > 리뷰작성
![리뷰작성](https://user-images.githubusercontent.com/105486016/194999105-add02d81-68fe-4ea3-a527-4e4d19966b56.JPG)
#### 리뷰게시판 > 리뷰수정
![리뷰수정](https://user-images.githubusercontent.com/105486016/194999101-8109e96d-2523-4b78-89fb-1ab0e57c0bc8.JPG)
#### Q&A게시판
![qna](https://user-images.githubusercontent.com/105486016/194996571-1b0ad9a3-e107-4dd8-a2b7-1463be33902a.JPG)
#### Q&A게시판 > 상세 글조회
![qna-2](https://user-images.githubusercontent.com/105486016/194996580-cae0eba3-a06d-4cc6-9632-fde0a4775b7b.JPG)
#### Q&A게시판 > 질문글 작성
![qna-1](https://user-images.githubusercontent.com/105486016/194996577-a067afbf-6467-49d0-a244-099b8db94f9d.JPG)
#### FAQ게시판
![faq](https://user-images.githubusercontent.com/105486016/194996550-7decfa99-9fac-4525-9728-b6b06d5d43b6.JPG)
#### 관리자 > FAQ 관리
![관리자-faq](https://user-images.githubusercontent.com/105486016/194998521-94912baf-4eba-4687-a4f0-92c7ad89b8e9.PNG)
#### 관리자 > FAQ 등록
![관리자-faq등록](https://user-images.githubusercontent.com/105486016/195000648-3c4f062a-a0b2-41be-a640-c407408c66f0.PNG)
#### 관리자 > FAQ 수정/삭제
![관리자-faq수정삭제](https://user-images.githubusercontent.com/105486016/195000651-e7b9843c-93e4-40ec-8d7c-1525f18acb3f.PNG)
