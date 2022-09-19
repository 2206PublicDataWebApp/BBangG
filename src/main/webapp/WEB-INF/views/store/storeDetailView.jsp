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
    
  </body>
</html>