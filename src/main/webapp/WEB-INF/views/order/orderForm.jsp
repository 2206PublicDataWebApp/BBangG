<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/head.jsp"%>

</head>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<style>
#bodyWrapper {
	position: relative;
	margin: 0 auto;
	box-sizing: border-box;
	display: flex;
	flex-direction: column;
	justify-content: center;
	padding-top: 80px;
}

h1 {
	padding: 40px;
	font-size: 30px;
}

h2 {
	align: right;
}

table th {
	text-align: right;
	padding-right: 10px;
}

div input {
	height: 24px;
}

.orderForm_input_right input {
	border: none;
	border-bottom: 1px solid black;
	width: 250px;
}

input:focus {
	outline: none;
}

.orderForm_input_right th, .orderForm_input_right td {
	padding-top: 5px;
	padding-bottom: 10px;
	padding-left: 30px;
	padding-right: 40ox;
}

#btnSearchAddressC {
	border: none;
	background-color: transparent;
}

#btnAddGoods {
	height: 40px;
	float: right;
	background-color: #F0F0F0;
	border: none;
}

#btnAddGoods:hover {
	background-color: #3A2618;
	color: #ffffff;
}

input[type=reset] {
	height: 30px;
	width: 80px;
	background-color: #F0F0F0;
	color: #3A2618;
	border: 1px solid;
	border-color: #F0F0F0;
}

input[type=reset]:hover {
	background-color: #ffffff;
	color: #3A2618;
	border: 1px solid;
	border-color: #3A2618;
}

input[type=submit] {
	height: 30px;
	width: 80px;
	background-color: #3A2618;
	color: #ffffff;
	border: 1px solid;
	border-color: #3A2618;
}

input[type=submit]:hover {
	background-color: #ffffff;
	color: #3A2618;
	border: 1px solid;
	border-color: #3A2618;
}
input[type=checkbox]{
	height:20px;
	width:20px;
	margin:6px;

}

span{
margin-left:55%;

}
</style>

<body id="bodyWrapper">
	<%@ include file="/WEB-INF/views/include/header.jsp"%>
	<div id="title">
		<h1 align="center">${store.storeName}주문</h1>

	</div>
	<br>
	<br>
	<br>
	<form action="/order/orderSend.kh" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="orderShipfee" value=3000> 
		<input type="hidden" name="userId" value="${user.userId}"> 
		<input type="hidden" name="storeNo" value="${storeNo}">
		<div>
			<div style="float: left; width: 30%; margin-left: 15%;">
				<select id="selGoods" name="selGoods" style="height: 40px;">
				</select>
				<button id="btnAddGoods" type="button">추가</button>
				<br>
				<br>
				<div id="container"></div>
				<br>
				<div>+ 배송비 3000원</div>
				<div>
					<div style="width: 30%; float: left;">요금합계</div>
					<div style="width: 50%; float: right;">
						<b><input id="goodsTotAmt"
							style="border: none; text-align: right;" name="totalPrice"
							value=0></b>원
					</div>
				</div>
			</div>
			<div style="float: right; margin-right: 20%;"
				class="orderForm_input_right">
				<h2>주문자정보</h2>
				<br>
				<table>
					<tr>
						<th>주문자 이름</th>
						<td><input type="text" name="orderName"
							value="${user.userName }"></td>
					</tr>
					<tr>
						<th>주문자 연락처</th>
						<td><input type="text" name="orderPhone"
							value="${user.userPhone }"></td>
					</tr>
				</table>
				<br>
				<span>주문자 정보와 동일
				<input type="checkbox"  id="copy">
				<h2 >배송지 정보</h2>
				<br>
				<table>



					<tr>
						<th>수령인</th>
						<td><input type="text" id="delivaryName" name="delivaryName"></td>
					</tr>
					<tr>
						<th>수령인 연락처</th>
						<td><input type="text" id="delivaryPhone" name="delivaryPhone"></td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td>
							<div style="float: left;">
								<input type="text" id="delivaryZipcode" name="delivaryZipcode"
									style="width: 120px">
							</div>
							<div style="float: left;">
								<button id="btnSearchAddressC" type="Button"
									onclick="findDaumPostcode()" value="우편번호 찾기">
									<img src="/resources/image/icon/serch_bt.png" height="20"
										width="20" />
								</button>

							</div>
						</td>
					</tr>
					<tr>
						<th>상세주소1</th>
						<td><input type="text" id="delivaryAddr" name="delivaryAddr"></td>
					</tr>
					<tr>
						<th>상세주소2</th>
						<td><input type="text" id="delivaryAddrDetail"
							name="delivaryAddrDetail"></td>
					</tr>
					<tr>
						<th>배송메모</th>
						<td><input type="text" name="delivaryMemo"></td>
					</tr>

					<tr>
						<td></td>
						<td align="right"><input type="reset" value="다시입력">
							<input type="submit" value="주문하기"></td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</body>
<script type="text/javascript">
	function findDaumPostcode() {
	    new daum.Postcode({
	      oncomplete: function (data) {
	        var zoneCodeCompany = data.zonecode;
	        var addressCompany = data.address;
	        document.getElementById("delivaryZipcode").value = zoneCodeCompany; // zipcode
	        document.getElementById("delivaryAddr").value = addressCompany; // 주소 넣기
	        }
	    }).open();
	  }
	
	
	function Goods(){
	
		//json 배열[{goodsId:goodsId, goodsNm:goodsNm, amt:amt},{...},{...}]
		this.arrAllGoods = new Array();//상품 목록
		this.arrSelGoods = new Array();//선택한 상품 목록
		
		var p = this;
		
		//상품 추가 시
		this.select = function (trgtGoodsId){
			
			var selectedIndex = -1;
			
			//전체 목록 배열에서 검색하여 goodsId가 없다면 선택 목록에 push후 container안에 그려준다.
			
			//선택 목록에서 검색
			for(var i=0;i<p.arrSelGoods.length;i++){
				
				if(p.arrSelGoods[i].goodsId==trgtGoodsId){
					selectedIndex = i;
					break;
				}
			}
			
			if(selectedIndex<0){//선택목록에 없을 경우 추가. 잇을경우 얼럿.
				//전체목록에서 선택 추가해줌.
				for(var j=0;j<p.arrAllGoods.length;j++){
					
					if(p.arrAllGoods[j].goodsId==trgtGoodsId){
						p.arrSelGoods.push(p.arrAllGoods[j]);
						p.arrSelGoods[p.arrSelGoods.length-1].cnt = 0;//무조건 개수 초기화
						p.appendChoiceDiv(p.arrAllGoods[j]);
						break;
					}
				}
			}else{
				alert("이미 추가한 상품입니다.");
			}
			p.afterProc();
		}
		
		//상품 제거 시
		this.deselect = function (trgtGoodsId){
			
			var selectedIndex = -1;
			
			//배열에서 검색.
			for(var i=0;i<p.arrSelGoods.length;i++){
				
				if(p.arrSelGoods[i].goodsId==trgtGoodsId){
					p.removeChoiceDiv(p.arrSelGoods[i]);
					p.arrSelGoods.splice(i,1);
					break;
				}
			}
			p.afterProc();
		}
		
		this.appendChoiceDiv = function(prmtObj){
			
			var innerHtml = "";
			
			innerHtml += '<div id="div_'+prmtObj.goodsId+'">';		
	        innerHtml += '<table >';
			innerHtml += '<tr >';
			innerHtml += '	<td><div id="div_'+prmtObj.goodsId+'_name">'+prmtObj.goodsNm+'<input type="hidden" name="orderProductNm" value="'+prmtObj.goodsNm+'"></div><br>'+prmtObj.goodsUnprc+'원</td>';
			innerHtml += '	<td width="100" align="right"><button type="button" id="" class="add" name="" onclick="goods.minus(\''+prmtObj.goodsId+'\');">-</button>'
			innerHtml += '	<input type="text" style="width:37px; text-align:center" id="input_cnt_'+prmtObj.goodsId+'" name="orderProductCtn" value="0">'
	        innerHtml += '	<button type="button" id="" class="remove" name="" onclick="goods.plus(\''+prmtObj.goodsId+'\');">+</button></td>';
	        innerHtml += '	<td width="200px" style="text-align:right;">가격 <input type="text" style="width:70px;border: none;text-align:right;" id="input_sumAmt_'+prmtObj.goodsId+'" name="orderProductPrice" value="0"/>원</td>'
			innerHtml += '	<td><button type="button" id="" class="remove" name="" onclick="goods.deselect(\''+prmtObj.goodsId+'\');">X</button></td>';
			innerHtml += '</tr>';
	        innerHtml += '</table>';
			innerHtml += '</div>';		
			$('#container').append(innerHtml);
			
		}
		
		this.removeChoiceDiv = function(prmtObj){
			$("#div_"+prmtObj.goodsId).remove();
		}
		
		this.plus = function (trgtGoodsId){
			
			for(var i=0;i<p.arrSelGoods.length;i++){
					
					if(p.arrSelGoods[i].goodsId==trgtGoodsId){
						p.arrSelGoods[i].cnt++;
						break;
					}
			}
			
			
			p.afterProc();			
		}
		
		this.minus = function (trgtGoodsId){
			
			for(var i=0;i<p.arrSelGoods.length;i++){
					
					if(p.arrSelGoods[i].goodsId==trgtGoodsId){
						if(p.arrSelGoods[i].cnt==0) break;
						p.arrSelGoods[i].cnt--;
						break;
					}
			}
			
			p.afterProc();			
		}
		
		//계산 후처리.
		this.afterProc = function (){
			
			for(var i=0;i<p.arrSelGoods.length;i++){
				$('#input_cnt_'+p.arrSelGoods[i].goodsId).val(p.arrSelGoods[i].cnt);
				$('#input_sumAmt_'+p.arrSelGoods[i].goodsId).val(p.arrSelGoods[i].cnt*p.arrSelGoods[i].goodsUnprc);
			}
			
			var goodsTotAmt = 0;
			for(var i=0;i<p.arrSelGoods.length;i++){
				goodsTotAmt += p.arrSelGoods[i].cnt*p.arrSelGoods[i].goodsUnprc;
			}
			goodsTotAmt +=3000;
			$('#goodsTotAmt').val(goodsTotAmt);
			
		}
	
	}
				
	var goods = new Goods();
		//jstl로 전체 상품 목록 미리 세팅
		<c:forEach items="${pList}" var="product">
			goods.arrAllGoods.push({goodsId:"${product.productCode}",goodsUnprc:"${product.productPrice}",goodsNm:"${product.productName}",cnt:0});
		</c:forEach>
		//jstl로 셀렉트 박스 옵션 채우기
		<c:forEach items="${pList}" var="product">	
			$('#selGoods').append('<option id="" value="${product.productCode}">${product.productName}</option>');
		</c:forEach>
	
		
		$('#btnAddGoods').on('click',function(){
			
		
			goods.select($('#selGoods option:selected').val());
		
		});

		
		    $("#copy").change(function(){
		        if($("#copy").is(":checked")){
					$("#delivaryName").val('${user.userName}');
					$("#delivaryPhone").val(${user.userPhone});
			 		$("#delivaryZipcode").val(${user.userZipCode});
				 	$("#delivaryAddr").val('${user.addr}');
			 		$("#delivaryAddrDetail").val('${user.addrDetail}'); 
					 
		        }
			
		});
	
			
			
		

</script>
</html>