<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	margin-left: 250px;
	margin-right: 250px;
	align-items: center;
	align-content: center;
}

img {
	width: 100%;
	height: 300px;
}

#map {
	float: left;
}

button {
	border: none;
	border-radius: 50px;
	background-color: bisque;
	width: 350px;
	height: 40px;
}
</style>
</style>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6396a18cfa9668486b16a2ad0a533dd1&libraries=services,clusterer,drawing"></script>
</script>
</head>
<body>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<h1 align="center">점포상세정보화면</h1>
	<div id="detail">
		<img src="" />
	</div>
	<div id="map" style="width: 350px; height: 350px"></div>
	<table border="1" height="350px">
		<tr>
			<td>이름</td>
			<td colspan="2"><input type="text" name="storeName"
				value="${store.storeName }" /></td>
		</tr>
		<tr>
			<td>우편번호</td>
			<td><input type="text" placeholder="우편번호" id="sample4_postcode"
				name="postCode" value="${store.storeZipCode }" /></td>
		</tr>
		<tr>
			<td>주소</td>
			<td colspan="2"><input type="text" placeholder="주소"
				id="sample4_roadAddress" name="store_addr"
				value="${store.storeAddr}" /></td>
		</tr>
		<tr>
			<td>상세주소</td>
			<td colspan="2"><input type="text" placeholder="상세주소"
				id="sample4_detailAddress" name="storeAddrDetail"
				value="${store.storeAddrDetail}" /></td>
		</tr>
		<tr>
			<td>대표자</td>
			<td colspan="2"><input type="text" name="storeCeo"
				/ value="${store.storeCeo}"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td colspan="2"><input type="text" name="storeTel"
				value="${store.storeTel}" /></td>
		</tr>
		<tr>
			<td>대표사이트</td>
			<td colspan="2"><input type="text" name="storeUrl"
				value="${store.storeUrl}" /></td>
		</tr>
		<tr>
			<td>계좌번호</td>
			<td colspan="2"><input type="text" name="storeAccount"
				value="${store.storeAccount}" /></td>
		</tr>
	</table>
	<br>
	<hr>
	<button>리뷰작성 하러가기</button>
	<button>주문하러 가기</button>
	<div id="review">리뷰 영역</div>

	<script>
		var address = '${store.storeAddr}'
		var storeName = '${store.storeName}'
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder
				.addressSearch(
						address,
						function(result, status) {

							// 정상적으로 검색이 완료됐으면 
							if (status === kakao.maps.services.Status.OK) {

								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								// 결과값으로 받은 위치를 마커로 표시합니다
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});

								// 인포윈도우로 장소에 대한 설명을 표시합니다
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:6px 0;">'
													+ storeName + '</div>'
										});
								infowindow.open(map, marker);

								// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								map.setCenter(coords);
							}
						});
	</script>
</body>
</html>