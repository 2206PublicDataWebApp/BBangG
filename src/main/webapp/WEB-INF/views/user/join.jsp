<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<link rel="stylesheet" href="/resources/css/join.css" />
<body>
	<jsp:include page = "/WEB-INF/views/include/header.jsp"/>
	<h1 align="center">회원가입</h1>
		<div class="join-wrapper">
			<form id="join_form" method="post">
					<div class="wrapper">
						<span class="index">아이디</span>
						<input type="text" id="userId" name="userId">
						<span class="final_id_ck">아이디를 입력해주세요.</span>
					</div>
					<div class="wrrapper">
						<span class="index">비밀번호</span>
						<input type="password" name="userPwd" class="userPwd">
						<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
					</div>
					<div class="wrrapper">
						<span class="index">이름</span>
						<input type="text" name="userName" class="name">
						<span class="final_name_ck">이름을 입력해주세요.</span>
					</div>
					<div class="wrrapper">
						<span class="index">성별</span>
						<input type="radio" name="userGender" value="여자">여자
						<input type="radio" name="userGender" value="남자">남자
					</div>
					<div class="email-wrapper">
						<span class="index">이메일</span>
					<div class="email_auth">
						<input type="text" placeholder="이메일" name="userEmail" id="userEmail" class="email">
						<button type="button" id="email_auth_btn" class="email_auth_btn">전송</button>
					</div>
					<div class="mail-check-box">
						<input class="mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
					</div>
					<span class="final_mail_ck">이메일을 입력해주세요.</span>
					<span id="mail-check-warn"></span>
					</div>
					<div class="wrrapper">
						<span class="index">전화번호</span>
						<input type="text" name="userPhone" class="userPhone">
						<span class="final_phone_ck">전화번호를 입력해주세요.</span>
						</div>
					<div class="wrrapper">
						<span class="index">우편번호</span>
						<input type="text" name="zipCode" id="sample6_postcode"
							placeholder="우편번호">
						<input type="button" class="saerch"
							onclick="sample6_execDaumPostcode()" value="검색"><br>
					</div>
					<div class="wrrapper">
						<span class="index">주소</span>
						<input type="text" name="address" id="sample6_address" class="address"
							placeholder="주소"><br>
					</div>
					<div class="wrrapper">
						<span class="index">상세주소</span>
						<input type="text" name="addrDetail"
							id="sample6_detailAddress" placeholder="상세주소">
						<input
							type="text" name="extra" id="sample6_extraAddress"
							placeholder="참고항목">
					</div>
						<span class="final_addr_ck">주소를 입력해주세요.</span>
					<div class="result">
						<input type="button" id="join_button" value="가입하기">
						<button type="button" id="cancel" onclick="location.href='/home.kh';">취소</button>
					</div>
				
			</form>
		</div>
		<script
			src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		 /* 유효성 검사 통과유무 변수 */
		 var idCheck = false;            // 아이디
		 var pwCheck = false;            // 비번
		 var nameCheck = false;            // 이름
		 var mailCheck = false;            // 이메일
		 var addressCheck = false;         // 주소
		 var phoneCheck = false;
		 var mailnumCheck = false;		// 이메일 인증번호 확인
		 
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
	// blur -> focus가 벗어나는 경우 발생
	$('.mail-check-input').blur(function () {
		const inputCode = $(this).val();
		const $resultMsg = $('#mail-check-warn');
		
		if(inputCode === email_auth_cd){
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color','green');
			$('#email_auth_btn').attr('disabled',true);
			$('#userEmail').attr('readonly',true);
			mailnumCheck = true;
		}else{
			$resultMsg.html('인증번호가 불일치 합니다.');
			$resultMsg.css('color','red');
			mailnumCheck = false;
		}
	});
	
	$(document).ready(function(){
		$('#join_button').click(function(){
			var id = $('#userId').val();
			var pwd = $('.userPwd').val();
			var name = $('.name').val();
			var mail = $('.email').val();
			var phone = $('.userPhone').val();
			var addr = $('.address').val();
			
			 /* 아이디 유효성검사 */
	        if(id == ""){
	            $('.final_id_ck').css('display','block');
	            idCheck = false;
	        }else{
	            $('.final_id_ck').css('display', 'none');
	            idCheck = true;
	        }
			 
	        /* 비밀번호 유효성 검사 */
	        if(pwd == ""){
	            $('.final_pw_ck').css('display','block');
	            pwCheck = false;
	        }else{
	            $('.final_pw_ck').css('display', 'none');
	            pwCheck = true;
	        }
	        
	        /* 주소 유효성 검사 */
	        if(addr == ""){
	            $('.final_addr_ck').css('display','block');
	            addressCheck = false;
	        }else{
	            $('.final_addr_ck').css('display', 'none');
	            addressCheck = true;
	        }
	        
	        /* 이름 유효성 검사 */
	        if(name == ""){
	            $('.final_name_ck').css('display','block');
	            nameCheck = false;
	        }else{
	            $('.final_name_ck').css('display', 'none');
	            nameCheck = true;
	        }
	        
	        /* 이메일 유효성 검사 */
	        if(mail == ""){
	            $('.final_mail_ck').css('display','block');
	            mailCheck = false;
	        }else{
	            $('.final_mail_ck').css('display', 'none');
	            mailCheck = true;
	        }
	        
	        /* 전화번호 유효성 검사 */
	        if(phone == ""){
	            $('.final_phone_ck').css('display','block');
	            phoneCheck = false;
	        }else{
	            $('.final_phone_ck').css('display', 'none');
	            phoneCheck = true;
	        }
	        
	        /* 최종 유효성 검사 */
	        if(idCheck&&pwCheck&&nameCheck&&mailCheck&&addressCheck&&phoneCheck&&mailnumCheck){
	        	$("#join_form").attr("action", "/user/join.kh");
	        	$("#join_form").submit();
	        	alert("가입되었습니다.");
	        }
	        
	        return false;
		});
	});   
	</script>
</body>
</html>