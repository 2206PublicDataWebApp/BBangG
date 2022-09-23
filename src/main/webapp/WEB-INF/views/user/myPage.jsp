<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
</head>
<body>
	<%-- <%@ include file="/WEB-INF/views/include/header.jsp"%> --%>
	<jsp:include page = "/WEB-INF/views/include/header.jsp"/>

	<div class="main">
		<h1 align="center">회원 정보 수정</h1>
			<form action="/user/modify.kh" method="post"
			 onsubmit="modifyUser();">
					<div class="email_auth">
						<input type="text" placeholder="이메일" name="userEmail" id="userEmail" class="email"  value="${user.userEmail }">
						<button type="button" id="email_auth_btn" class="email_auth_btn">인증번호 받기</button>
					<div class="mail-check-box">
						<input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
					</div>
					<span id="mail-check-warn"></span>
					</div>
					<div>
						아이디
						<input type="text" id="userId" name="userId" value="${user.userId }" readonly>
					</div>
					<div>
						 <input type="button" onclick="location.href='/pwUpdateView'" value="비밀번호 변경">
					</div>
					<div>
						이름
						<input type="text" name="userName"  value="${user.userName }">
					</div>
					<div>
						성별
						<input type="radio" name="userGender" value="여자" ${user.userGender eq '여자' ? "checked" : '' }/>여자
						<input type="radio" name="userGender" value="남자" ${user.userGender eq '남자' ? "checked" : '' }/>남자
					</div>
					<div>
						이메일
					</div>
					<div>
						전화번호
						<input type="text" name="userPhone" value="${user.userPhone }">
					</div>
					<div>
						우편번호
						<input type="text" name="zipCode" id="sample6_postcode"
							placeholder="우편번호" value="${user.userZipCode }"> <input type="button"
							onclick="sample6_execDaumPostcode()" value="검색"><br>
					</div>
					<div>
						주소
						<input type="text" name="address" id="sample6_address"
							placeholder="주소" value="${user.addr }"><br>
					</div>
					<div>
						상세 주소
						<input type="text" name="addrDetail"
							id="sample6_detailAddress" placeholder="상세주소" value="${user.addrDetail }"> <input
							type="text" name="extra" id="sample6_extraAddress"
							placeholder="참고항목">
					</div>
					<div>
						<button type="button" onclick="removeUser();">탈퇴하기</button>
					</div>
					<div>
						<input type="submit" value="수정하기">
					</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
				<div>a</div>
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
		
		$(".email_auth_btn").click(function(){	     
				 const checkInput = $('.mail-check-input')
		    	 var email = $('#userEmail').val();
		    	 
		    	 if(email == ''){
		    	 	alert("이메일을 입력해주세요.");
		    	 	return false;
		    	 }
		    	 
		    	 $.ajax({
					type : "POST",
					url : "/emailAuth",
					data : {email : email},
					success: function(data){
						checkInput.attr('disabled',false);
						alert("인증번호가 발송되었습니다.");
						email_auth_cd = data;
					},
					error: function(data){
						alert("메일 발송에 실패했습니다.");
					}
				});
			});
	
		// 인증번호 비교 
		$('.mail-check-input').blur(function () {
			const inputCode = $(this).val();
			const $resultMsg = $('#mail-check-warn');
			
			if(inputCode === email_auth_cd){
				$resultMsg.html('인증번호가 일치합니다.');
				$resultMsg.css('color','green');
				$('#email_auth_btn').attr('disabled',true);
				$('#userEmail').attr('readonly',true);
			}else{
				$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
				$resultMsg.css('color','red');
			}
		});
		
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