<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1 align="center">점포상세정보화면</h1>
    <form action="/store/storeModify.kh" method="post">
      <table align="center" border="1">
        <tr>
          <td>이름</td>
          <td colspan="2"><input type="text" name="storeName" value="${store.storeName }"/></td>
        </tr>
        <tr>
          <td>우편번호</td>
          <td>
            <input type="text" placeholder="우편번호" id="sample4_postcode" name="postCode" value="${store.storeZipCode }"/>
          </td>
          <td>
            <input
              type="button"
              value="우편번호 찾기"
              onclick="sample4_execDaumPostcode()"
            />
          </td>
        </tr>
        <tr>
          <td>주소</td>
          <td colspan="2">
            <input type="text" placeholder="주소" id="sample4_roadAddress" name="store_addr" value="${store.storeAddr}"/>
          </td>
        </tr>
        <tr>
          <td>상세주소</td>
          <td colspan="2">
            <input
              type="text"
              placeholder="상세주소"
              id="sample4_detailAddress"
              name="storeAddrDetail"
              value="${store.storeAddrDetail}"
            />
          </td>
        </tr>
        <tr>
          <td>대표자</td>
          <td colspan="2"><input type="text" name="storeCeo"/ value="${store.storeCeo}"></td>
        </tr>
        <tr>
          <td>전화번호</td>
          <td colspan="2"><input type="text" name="storeTel" value="${store.storeTel}"/></td>
        </tr>
         <tr>
          <td>대표사이트</td>
          <td colspan="2"><input type="text" name="storeUrl" value="${store.storeUrl}"/></td>
        </tr>
        <tr>
          <td>계좌번호</td>
          <td colspan="2"><input type="text" name="storeAccount" value="${store.storeAccount}"/></td>
        </tr>
        <tr>
          <td>점포사진</td>
          <td colspan="2"><input type="file" name="uploadFile"/></td>
        </tr>
        <tr>
          <td colspan="3" align="center">
            <input type="submit" value="등록" />
            <input
              type="button"
              value="이전화면 돌아가기"
            />
          </td>
        </tr>
      </table>
    </form>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
      //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
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
            document.getElementById('sample4_jibunAddress').value =
              data.jibunAddress;

            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if (roadAddr !== '') {
              document.getElementById('sample4_extraAddress').value =
                extraRoadAddr;
            } else {
              document.getElementById('sample4_extraAddress').value = '';
            }

            var guideTextBox = document.getElementById('guide');
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if (data.autoRoadAddress) {
              var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
              guideTextBox.innerHTML =
                '(예상 도로명 주소 : ' + expRoadAddr + ')';
              guideTextBox.style.display = 'block';
            } else if (data.autoJibunAddress) {
              var expJibunAddr = data.autoJibunAddress;
              guideTextBox.innerHTML =
                '(예상 지번 주소 : ' + expJibunAddr + ')';
              guideTextBox.style.display = 'block';
            } else {
              guideTextBox.innerHTML = '';
              guideTextBox.style.display = 'none';
            }
          },
        }).open();
      }
    </script>
  </body>
</html>