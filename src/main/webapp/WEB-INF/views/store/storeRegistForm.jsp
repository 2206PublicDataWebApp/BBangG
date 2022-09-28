<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<style>
td {
	padding: 5px;
}

.th {
	text-align: right;
}

.right {
	text-align: right;
}

.text {
	border: none;
	border-bottom: 1px solid black;
}

#searchBtn{
	background-color: white;
	border: none;
}

#search {
	width: 20px;
	height: 20px;
	cursor: pointer;
}

#submitBtn{
		color: #fff;
	font-size: 16px;
	background-color: #3A2618;
	margin-top: 10px;
	width: 100px
}

#backBtn{
		color: #3A2618;
	font-size: 16px;
	background-color: #fff;
	margin-top: 10px;
	width: 200px
}
#previewDiv{
	width: 200px;
	height: 200px;
	display: block;
}
#preview{
	width: 100%;
	height: 100%;
	object-fit: contain;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
    <h1 align="center">점포등록화면</h1>
    <form action="/store/registStore.kh" method="post" encType="multipart/form-data">
      <table align="center">
			<tr>
				<td class="th">이름</td>
				<td class="right"><input type="text" class="text"
					name="storeName" value="${store.storeName }" /></td>
			</tr>
			<tr>
				<td class="th">우편번호</td>
				<td class="right"><input type="text" placeholder="우편번호"
					id="sample4_postcode" class="text" name="storeZipCode"
					value="${store.storeZipCode }" /></td>
				<td><button type="button"  id="searchBtn"
					onclick="sample4_execDaumPostcode()"><img id="search" src="/resources/image/icon/serch_bt.png"/></button></td>
			</tr>
			<tr>
				<td class="th">주소</td>
				<td class="right"><input type="text" placeholder="주소"
					id="sample4_roadAddress" class="text" name="storeAddr"
					value="${store.storeAddr}" /></td>
			</tr>
			<tr>
				<td class="th">상세주소</td>
				<td class="right"><input type="text" placeholder="상세주소"
					id="sample4_extraAddress" name="storeAddrDetail" class="text"
					value="${store.storeAddrDetail}" /></td>
			</tr>
			<tr>
				<td class="th">대표자</td>
				<td class="right"><input type="text" class="text"
					name="storeCeo" value="${store.storeCeo}"></td>
			</tr>
			<tr>
				<td class="th">전화번호</td>
				<td class="right"><input type="text" class="text"
					name="storeTel" value="${store.storeTel}" /></td>
			</tr>
			<tr>
				<td class="th">대표사이트</td>
				<td class="right"><input type="text" class="text"
					name="storeUrl" value="${store.storeUrl}" /></td>
			</tr>
			<tr>
				<td class="th">계좌번호</td>
				<td class="right"><input type="text" name="storeAccount" class="text"
					value="${store.storeAccount}" /></td>
				<td><select name="storeBank">
						<option value="우리">우리</option>
						<option value="신한">신한</option>
						<option value="농협">농협</option>
						<option value="국민">국민</option>
						<option value="하나">하나</option>
						<option value="기업">기업</option>
						<option value="광주">광주</option>
						<option value="대구">대구</option>
						<option value="우체국">우체국</option>
				</select></td>
			</tr>
			<tr>
				<td class="th">점포사진</td>
				<td colspan="2"><input type="file" name="uploadFile"  onchange="readFile(this);"/></td>
			</tr>
			<tr>
				<td class="th">미리보기</td>
				<td>
					<div id="previewDiv">
						<img id="preview"/>
					</div>

				</td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<input type="submit" value="등록" id="submitBtn"/>
					<button type="button" id="backBtn" onclick="goBack()">이전화면 돌아가기</button></td>
			</tr>
		</table>
    </form>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
      function sample4_execDaumPostcode() {
        new daum.Postcode({
          oncomplete: function (data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
              extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if (data.buildingName !== '' && data.apartment === 'Y') {
              extraRoadAddr +=
                extraRoadAddr !== ''
                  ? ', ' + data.buildingName
                  : data.buildingName;
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if (extraRoadAddr !== '') {
              extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById('sample4_roadAddress').value = roadAddr;


            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if (roadAddr !== '') {
              document.getElementById('sample4_extraAddress').value =
                extraRoadAddr;
            } else {
              document.getElementById('sample4_extraAddress').value = '';
            }

            var guideTextBox = document.getElementById('guide');
            
          },
        }).open();
      }
      function goBack(){
			event.preventDefault();
			if(confirm('변경사항이 전부 사라집니다. 돌아가시겠습니까?')){
				window.history.back();
				
			}
		}
      function readFile(input){
  		if(input.files && input.files[0]){
  			var reader = new FileReader();
  			reader.onload = function(e){
  				document.getElementById('preview').src = e.target.result;
  			};
  			reader.readAsDataURL(input.files[0]);
  		}else{
  			document.getElementById('preview').src = "";
  		}
  	}
    </script>
    <br><br><br><br><br><br>
    <%@ include file="/WEB-INF/views/include/footer.jsp"%>
  </body>
</html>