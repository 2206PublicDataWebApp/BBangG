<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<style>
section {
	width: 1200px;
	margin-left: 20%;
}

img {
	width: 100%;
	height: 800px;
}

.container {
	display: grid;
	justify-content: center;
	align-content: center;
	grid-template-columns: repeat(4, 1fr);
	row-gap: 20px;
}

.item {
	display: flex;
	justify-content: center;
	align-items: center;
	box-sizing: border-box;
	font-size: 20px;
	font-weight: 900;
	border: 1px solid black;
	grid-column: 1/5;
}

.item:nth-child(1) {
	grid-column: 1/5;
	height: 500px;
}

.item:nth-child(2) {
	grid-column: 1/3;
}

.item:nth-child(3) {
	grid-column: 3/5;
}

.item:nth-child(4) {
	grid-column: 1/5;
	height: 50px;
}

.item:nth-child(5) {
	grid-column: 1/5;
	height: 50px;
}

img {
	width: 100%;
	height: 100%;
}

button {
	color: #fff;
	font-size: 16px;
	background-color: #3A2618;
	margin-top: 10px;
	height: 50px;
	width: 600px;
}
</style>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6396a18cfa9668486b16a2ad0a533dd1&libraries=services,clusterer,drawing"></script>
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<section>
		<h1 align="center">점포상세정보화면</h1>
		<div class="container">
			<div class="item" id="detail">
				<img
					src="/resources/image/store-images/${store.sImage.storeFileRename }" />
			</div>
			<div class="item" id="map"></div>
			<div class="item">
				<table>
					<tr>
						<td>이름</td>
						<td colspan="2"><input type="text" name="storeName"
							value="${store.storeName }" /></td>
					</tr>
					<tr>
						<td>우편번호</td>
						<td><input type="text" placeholder="우편번호"
							id="sample4_postcode" name="postCode"
							value="${store.storeZipCode }" /></td>
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
							value="${store.storeCeo}"></td>
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
			</div>
			<div class="item">
				<button>리뷰작성 하러가기</button>
				<button type="button" onclick="goOrder()">주문하러 가기</button>
			</div>
			<div class="item">
				
			</div>
	</section>
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
		
		
		function goOrder(){
		 	if(${login ne null}){
				location.href="/order/orderForm.kh?storeNo="+${store.storeNo};
			}else{
				event.preventDefault();
				if(confirm("로그인이 필요한 서비스입니다. 로그인 화면으로 이동하시겠습니까?")){
					location.href="/user/loginView.kh";
				}
			} 
		
		}
	
	</script>
</body>
</html>