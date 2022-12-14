<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" href="/resources/css/myPage.css" />
</head>
<body>
	<script type="text/javascript">
		<c:if test="${empty login}">
			location.href="/home.kh";	
			alert("로그인이 필요한 페이지 입니다. 메인으로 돌아갑니다.");
		</c:if>
	</script>
	<jsp:include page = "/WEB-INF/views/include/header.jsp"/>
	<jsp:include page="/WEB-INF/views/include/sideBar_user.jsp"/>
	<div class="main">
		<h1 align="center">회원 정보 수정</h1>
			<form action="/user/modify.kh" method="post"
			 onsubmit="modifyUser();">
					<div>
						<span>아이디</span>
						<input type="text" id="userId" name="userId" class="userId" value="${user.userId }" readonly>
					</div>
					<div>
						 <span>비밀번호</span>
						 <input type="password" name="userPwd">
					</div>
					<div>
						<span>이름</span>
						<input type="text" name="userName"  value="${user.userName }">
					</div>
					<div>
						<span>성별</span>
						<input type="radio" name="userGender" value="여자" ${user.userGender eq '여자' ? "checked" : '' }/>여자
						<input type="radio" name="userGender" value="남자" ${user.userGender eq '남자' ? "checked" : '' }/>남자
					</div>
					<div>
						<span>이메일</span>
						<input type="text" name="userEmail" class="userEmail"  value="${user.userEmail }" readonly>
					</div>
					<div>
						<span>전화번호</span>
						<input type="text" name="userPhone" value="${user.userPhone }">
					</div>
					<div>
						<span>우편번호</span>
						<input type="text" name="zipCode" id="sample6_postcode"
							placeholder="우편번호" value="${user.userZipCode }"> <input type="button"
							onclick="sample6_execDaumPostcode()" value="검색"><br>
					</div>
					<div>
						<span>주소</span>
						<input type="text" name="address" id="sample6_address"
							placeholder="주소" value="${user.addr }"><br>
					</div>
					<div>
						<span>상세주소</span>
						<input type="text" name="addrDetail"
							id="sample6_detailAddress" placeholder="상세주소" value="${user.addrDetail }"> <input
							type="text" name="extra" id="sample6_extraAddress"
							placeholder="참고항목">
					</div>
					<div class="wrrapper">
					<div class="click">
						<button type="button" onclick="removeUser();">탈퇴하기</button>
					</div>
					<div>
						<input type="submit" value="수정하기">
					</div>
					</div>
				
				</form>
		</div>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
		function removeUser() {
			if(confirm("탈퇴하시겠습니까?")) {
				alert("탈퇴되었습니다.");
				location.href = "/user/remove.kh";
			}
		}
		function modifyUser() {
			if(confirm("수정하시겠습니까?")) {
				alert("수정되었습니다.");
			}
		}
	</script>
</body>
</html>