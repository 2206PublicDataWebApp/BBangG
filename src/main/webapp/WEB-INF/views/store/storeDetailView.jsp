<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<style>
body {
	/* margin-left: 250px;
	margin-right: 250px; */
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

.review-detail {
	border: 1px solid #414141;
	width: 980px;
	margin: 25px auto;
	box-sizing: border-box;
	padding: 50px 60px;
}

.review-title {
	display: flex;
	margin: 25px auto;
	width: 980px;
	padding: 30px 40px;
	box-sizing: border-box;
	border: 1px solid white;
}

#btn-modify {
	width: 80px;
	font-size: 15px;
	border: 1px solid #414141;
	background-color: #414141;
	color: rgb(255, 255, 255);
	/* padding: 15px 25px; */
	text-align: center;
	text-decoration: none;
	display: inline-block;
	position: relative;
	left: 80%;
}

#btn-delete {
	width: 80px;
	font-size: 15px;
	border: 1px solid #414141;
	background-color: #ffffff;
	color: #414141;
	/* padding: 15px 25px; */
	text-align: center;
	text-decoration: none;
	display: inline-block;
	position: relative;
	left: 80%;
}
</style>
</style>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6396a18cfa9668486b16a2ad0a533dd1&libraries=services,clusterer,drawing"></script>
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<h1 align="center">점포상세정보화면</h1>
	<div id="detail">
		<img src="/resources/image/store-images/${store.sImage.storeFileRename }" />
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
	<button type="button" onclick="goOrder()">주문하러 가기</button>
	<div id="review">
		<div class="review-detail">
			<div class="detail-title-wrap">
				<div class="user-date-star">
					<div class="user-date">
						<div class="user-id">${review.reviewWriter }</div>
						<div class="date">${review.rCreateDate }</div>
					</div>
					<div id="star">
						<div>${review.starRating }</div>
					</div>
				</div>
				<div class="heart-count">
					<div id="heart">
						<a href="/review/heartCountUpdate.kh?reviewNo=${review.reviewNo }">♡
							${review.reviewHeart }</a>
					</div>
					<div>HIT ${review.reviewCount }</div>
				</div>
			</div>
			<div class="reivew-content">
				<div id="bbang-img">
					<img alt="본문이미지"
						src="/resources/reviewUploadFiles/${review.reviewFilename }"
						width="500">
				</div>
				<div>${review.reviewContent }</div>
				<div class="btn-wrap">
					<a id="btn-modify"
						href="/review/modifyView.kh?reviewNo=${review.reviewNo }">수정</a> <a
						id="btn-delete" href="#" onclick="reviewRemove(${page});">삭제하기</a>
				</div>
			</div>

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