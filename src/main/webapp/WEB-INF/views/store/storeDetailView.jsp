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
	height: 500px;
	display: block;
}

img {
	width: 100%;
	height: 100%;
}

#goOrder {
	color: #fff;
	font-size: 16px;
	background-color: #3A2618;
	margin-top: 10px;
	height: 50px;
	width: 600px;
}

#goOrder:hover{
	cursor: pointer;
	background-color: #fff;
	color: #3A2618;
}

#goReview {
	color: #3A2618;
	font-size: 16px;
	background-color: #fff;
	margin-top: 10px;
	height: 50px;
	width: 600px;

}

#goReview:hover{
	cursor: pointer;
	background-color: #3A2618;
	color: #fff;
}

html, body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre,
	code, form, fieldset, legend, input, textarea, p, blockquote, th, td,
	img {
	margin: 0;
	padding: 0;
	padding-left: 0px;
	list-style: none;
	font-family: 'Noto Sans KR', sans-serif;
	color: #414141;
}

a, li, ul {
	text-decoration: none;
}

#order-btn {
	width: 500px;
	margin: 20px auto;
	display: block;
}

.review-detail {
	display: grid;
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
td{
	border-bottom: 1px solid grey;
}

.review-title-btn {
	margin: 10px auto;
	margin-left: auto;
}

.title-btn3-right {
	margin-left: auto;
}

.paging-btn {
	margin: 30px;
}

ul {
	text-align: center;
}

li {
	margin: 10px 10px;
	display: inline-block;
}

.btn-wrap {
	margin-top: 50px;
}

#storename {
	margin: 60px auto;
	width: 980px;
	padding: 10px 40px;
	box-sizing: border-box;
}

#sort {
	position: relative;
	left: -2%;
	font-weight: lighter;
}

#bestSort {
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

#latestSort {
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

.detail-title-wrap {
	display: flex;
	justify-content: space-between;
}

.user-date {
	display: flex;
	align-items: center;
}

.user-id {
	margin-right: 10px;
}

.date {
	font-size: 12px;
}

.heart-count {
	display: flex;
	flex-direction: column;
	justify-content: space-evenly;
}

#star {
	margin-bottom: 10px;
}

#bbang-img {
	margin-bottom: 10px;
}

#heart {
	text-decoration: none;
}
</style>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6396a18cfa9668486b16a2ad0a533dd1&libraries=services,clusterer,drawing"></script>
</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<section>
		<h1 align="center">????????????????????????</h1>
		<div class="container">
			<div class="item" id="detail">
				<img
					src="/resources/image/store-images/${store.sImage.storeFileRename }" />
			</div>
			<div class="item" id="map"></div>
			<div class="item">
				<table>
					<tr>
						<td>??????</td>
						<td colspan="2"><p>${store.storeName } </p></td>
					</tr>
					<tr>
						<td>????????????</td>
						<td colspan="2"><p>${store.storeZipCode } </p></td>
					</tr>
					<tr>
						<td>??????</td>
						<td colspan="2"><p>${store.storeAddr} </td>
					</tr>
					<tr>
						<td>????????????</td>
						<td colspan="2"><p>${store.storeAddrDetail} </p></td>
					</tr>
					<tr>
						<td>?????????</td>
						<td colspan="2"><p>${store.storeCeo}</p></td>
					</tr>
					<tr>
						<td>????????????</td>
						<td colspan="2"><p>${store.storeTel}</p></td>
					</tr>
					<tr>
						<td>???????????????</td>
						<td colspan="2"><p>${store.storeUrl} </p></td>
					</tr>
					<tr>
						<td rowspan="3">????????????</td>
						<td >
							<p>${product1.productName} </p>
						</td>
						<td>
							<p>${product1.productPrice }???
						</td>
						
					</tr>
					<tr>
						<td >
							<p>${product2.productName} </p>
						</td>
						<td>
							<p>${product2.productPrice }???
						</td>
						
					</tr>
					<tr>
						<td >
							<p>${product3.productName} </p>
						</td>
						<td>
							<p>${product3.productPrice }???
						</td>
						
					</tr>
				</table>
			</div>
			<div class="item">
				<button type="button" id="goReview" onclick="goReview()">???????????? ????????????</button>
				<button type="button" id="goOrder" onclick="goOrder()">????????????
					??????</button>
			</div>
			<div class="item">

				<div>
					<jsp:include page="/WEB-INF/views/include/storeReviewList.jsp"/>
				</div>

	</section>
	
	
	<script>
		var address = '${store.storeAddr}'
		var storeName = '${store.storeName}'
		var mapContainer = document.getElementById('map'), // ????????? ????????? div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // ????????? ????????????
			level : 3
		// ????????? ?????? ??????
		};

		// ????????? ???????????????    
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// ??????-?????? ?????? ????????? ???????????????
		var geocoder = new kakao.maps.services.Geocoder();

		// ????????? ????????? ???????????????
		geocoder
				.addressSearch(
						address,
						function(result, status) {

							// ??????????????? ????????? ??????????????? 
							if (status === kakao.maps.services.Status.OK) {

								var coords = new kakao.maps.LatLng(result[0].y,
										result[0].x);

								// ??????????????? ?????? ????????? ????????? ???????????????
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords
								});

								// ?????????????????? ????????? ?????? ????????? ???????????????
								var infowindow = new kakao.maps.InfoWindow(
										{
											content : '<div style="width:150px;text-align:center;padding:6px 0;">'
													+ storeName + '</div>'
										});
								infowindow.open(map, marker);

								// ????????? ????????? ??????????????? ?????? ????????? ??????????????????
								map.setCenter(coords);
							}
						});
		
		
		function goOrder(){
		 	if(${login ne null}){
				location.href="/order/orderForm.kh?storeNo="+${store.storeNo};
			}else{
				event.preventDefault();
				if(confirm("???????????? ????????? ??????????????????. ????????? ???????????? ?????????????????????????")){
					location.href="/user/loginView.kh";
				}
			} 
		
		}
		
		function goReview(){
			if(${login ne null}){
				location.href="/review/writeView.kh?storeNo="+${store.storeNo};
			}else{
				event.preventDefault();
				if(confirm("???????????? ????????? ??????????????????. ????????? ???????????? ?????????????????????????")){
					location.href="/user/loginView.kh";
				}
			} 
		}
	
	</script>
</body>
</html>