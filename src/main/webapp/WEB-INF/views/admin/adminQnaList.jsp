<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 문의 리스트</title>
<style>
  table {
  width : 80%;
    border-top: 1px solid  #3A2618;
   
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #3A2618;
    padding: 10px;
    
  }
 h1{
 	    font-weight: bold;
            color : #3A2618;
 	
 }
#bodyWrapper{
	padding-left:200px;
	padding-top:80px;
}
.orderNo a,.storeNo a{
	color: mediumblue;
	
}
</style>
</head>
<body>
<jsp:include page = "/WEB-INF/views/include/header.jsp"/>
<jsp:include page="/WEB-INF/views/include/sideBar_admin.jsp"/>
<div id="bodyWrapper">
		<h1 align="center">QNA 게시판</h1>
	<br><br>

		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>답변여부</th>
		</tr>
		<c:forEach items="${qnaList }" var="qna" varStatus="i">
			<tr>
					<td>${qna.qnaNo }</td>
					<td><a href="/qna/detail.kh?qnaNo=${qna.qnaNo }&page=${currentPage }">${qna.qnaTitle }</a></td>
					<td>${qna.qnaWriter }</td>
					<td>${qna.qnaCreateDate }</td>
					<td>${qna.qnaViewCount }</td>
					<td>
					<c:if test="${qna.qnaIsAnswered }== 0"> <a href="#">미답변</a>
					 <c:if test="${qna.qnaIsAnswered }== 1"> 답변
					
					</c:if>
					
					</td>
				</tr>
			
				
				
					<div style="color:red; font-weight:bold;text-decoration : underline;">Y</div></c:if>
				</td>
			</tr>
		</c:forEach>
		<tr align="center" height="20">
			<td colspan="6">
				<c:if test="${currentPage!=1 }">
					<a href="/admin/adminOrderList.kh?orderDate=${orderDate }&page=${currentPage-1 }">[이전]</a>
				</c:if>
				<c:forEach var="p" begin="${startNavi }" end="${endNavi }" >
					<c:if test="${currentPage eq p }" ><b>${p }</b></c:if>
					<c:if test="${currentPage ne p }">
						<a href="/admin/adminOrderList.kh?orderDate=${orderDate }&page=${p }">${p }</a> 
					</c:if>
				</c:forEach>
				<c:if test="${maxPage>currentPage }">
					<a href="/admin/adminOrderList.kh?orderDate=${orderDate }&page=${currentPage+1 }">[다음]</a>
				</c:if>
				
			</td>
		</table>
		<br><br><br><br>
</div>
</body>

</html>