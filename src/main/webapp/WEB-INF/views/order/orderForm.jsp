<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<body>
	<h1 align="center">주문</h1>
	<div class="">
		<form action="/order/sendOrder.kh" method="post">
		<input type="hidden" name="orderShipfee" value=3000>

			<select id="selGoods" name="selGoods" style="height:40px;">
			</select>
			<button id="btnAddGoods" type="button" style="height:40px;">추가</button>	
			<br><br>	
			<div id="container">
			</div>
			<br>
			<div>+ 배송비 3000원</div>
			요금합계 <b><input id="goodsTotAmt" style="border:none;text-align:right;" name="totalPrice" value=0></b>원
			<table>
				<tr>
					<td>수령인</td>
					<td><input type="text" name="delivaryName">
					</td>
				</tr>
				<tr>
					<td>수령인 연락처</td>
					<td><input type="text" name="delivaryPhone"></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input type="text" id="delivaryZipcode" name="delivaryZipcode">
					<div><button id="btnSearchAddressC" type="Button" onclick="findDaumPostcode()" 
						value="우편번호 찾기"  >
						SearchAddress</button>
					</div>
					</td>
				</tr>
				<tr>
					<td>상세주소1</td>
					<td><input type="text" id="delivaryAddressFirst" name="delivaryAddressFirst"></td>
				</tr>
				<tr>
					<td>상세주소2</td>
					<td><input type="text" id="delivaryAddressSecond" name="delivaryAddressSecond"></td>
				</tr>
				<tr>
					<td>배송메모</td>
					<td><input type="text" name="delivaryMemo"></td>
				</tr>
			
				<tr>
					<td><input type="reset" value="다시입력"></td>
					<td>
					<input type="submit" value="주문하기">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
	function findDaumPostcode() {
	    new daum.Postcode({
	      oncomplete: function (data) {
	        var zoneCodeCompany = data.zonecode;
	        var addressCompany = data.address;
	        document.getElementById("delivaryZipcode").value = zoneCodeCompany; // zipcode
	        document.getElementById("delivaryAddressFirst").value = addressCompany; // 주소 넣기
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
			innerHtml += '	<input type="text" style="width:25px" id="input_cnt_'+prmtObj.goodsId+'" name="orderProductCtn" value="0">'
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
		goods.arrAllGoods.push({goodsId:"${pList[0].productCode}",goodsUnprc:"${pList[0].productPrice}",goodsNm:"${pList[0].productName}",cnt:0});
		goods.arrAllGoods.push({goodsId:"${pList[1].productCode}",goodsUnprc:"${pList[1].productPrice}",goodsNm:"${pList[1].productName}",cnt:0});
		goods.arrAllGoods.push({goodsId:"${pList[2].productCode}",goodsUnprc:"${pList[2].productPrice}",goodsNm:"${pList[2].productName}",cnt:0});
		
		//jstl로 셀렉트 박스 옵션 채우기
		

			
		$('#selGoods').append('<option id="" value="${pList[0].productCode}">${pList[0].productName}</option>');
		$('#selGoods').append('<option id="" value="${pList[1].productCode}">${pList[1].productName}</option>');
		$('#selGoods').append('<option id="" value="${pList[2].productCode}">${pList[2].productName}</option>');
		
	
		
		$('#btnAddGoods').on('click',function(){
			
		
			goods.select($('#selGoods option:selected').val());
		
		});
	
			
			
		

</script>
</html>