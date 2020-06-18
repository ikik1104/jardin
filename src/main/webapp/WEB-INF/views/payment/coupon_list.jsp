<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<jsp:useBean id="sysdate" class="java.util.Date"/>
<!DOCTYPE html>
<html>
<head>
<title> JARDIN SHOP </title>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="JARDIN" />
<meta name="keywords" content="JARDIN" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
<link rel="stylesheet" type="text/css" href="user/css/reset.css" />
<link rel="stylesheet" type="text/css" href="user/css/content.css" />
<script type="text/javascript" src="user/js/jquery.min.js"></script>
<script type="text/javascript" src="user/js/common.js"></script>
<script type="text/javascript">
	$(function() {
	
	});

	// 선택한 쿠폰에 따른 쿠폰 할인 금액 변경
	function couponSelect(p_num){
		var optSelect = document.getElementById("cou_opt_"+p_num);
		var optValue = optSelect.options[optSelect.selectedIndex].value;
		$('#discount_'+p_num).text(optValue);
		
		var count = $('.discount1').length;
		var sum = 0;
		for(i=0;i<count;i++){
			sum +=Number($(".discount1").eq(i).text());
		}
		$('#discount_sum').text(sum);
	}

	// 쿠폰 할인 금액 합계 값 부모창으로 보내기 & 자식창 닫기 
	function confirm(){	
		var discountSum = $('#discount_sum').text();
		
		opener.document.getElementById("productcoup").value = discountSum;
		opener.document.getElementById("productcoup").onchange();
		
		window.close();
	}
	
	function childClose(){
		opener.document.getElementById("productcoup").value = "0";
		opener.document.getElementById("productcoup").onchange();
		window.close();
	}	
	
</script>
</head>
<body>
<div id="layerWrap">

<div class="inputWrap">
		
	<div class="inputBody">
		<div class="title">쿠폰 조회</div>

		<div id="member">
			<h3 class="dep">쿠폰 적용</h3>
			<c:forEach var="cartlist" items="${cartlist }">
				<div class="orderDivNm">
					<table summary="상품 게시판으로 주문하신 상품명, 수량, 판매가, 배송순으로 조회 하시고 쿠폰을 적용하실 수 있습니다." class="orderTable" border="1" cellspacing="0">
						<caption>상품 게시판</caption>
						<colgroup>
						<col width="*" />
						<col width="16%" />
						<col width="14%" class="tw30" />
						<col width="16%" class="pnone" />
						</colgroup>
						<thead>
							<th scope="col">상품명</th>
							<th scope="col">수량</th>
							<th scope="col">판매가</th>
							<th scope="col" class="pnone">배송비</th>
						</thead>
						<tbody>
							<tr>
								<td class="left">
									<p class="img"><img src="user/images/img/sample_product.jpg" alt="상품" width="66" height="66" /></p>
	
									<ul class="goods">
										<li>
											<a href="detail?p_num=${cartlist.pDto.p_num }">${cartlist.pDto.p_name }</a>
										</li>
									</ul>
								</td>
								<td>${cartlist.ca_amount }개</td>
								<td>${cartlist.pDto.p_price * cartlist.ca_amount } 원</td>
								<td class="pnone">0 원</td>
							</tr>
						</tbody>
					</table>
				</div>
	
				<div class="popGraybox">
					<div class="choose">
						쿠폰선택&nbsp;&nbsp;
						<select class="coup_opt" id="cou_opt_${cartlist.pDto.p_num }" onchange="couponSelect(${cartlist.pDto.p_num })">
							<option value="0">쿠폰선택</option>
							<c:forEach var="couponlist" items="${couponlist }">
								<c:if test="${couponlist.cDto.co_type == 'product' && couponlist.ci_end_day > sysdate && couponlist.cDto.co_product == cartlist.pDto.p_num }">
									<option id="opt_${couponlist.ci_num }" value="${couponlist.cDto.co_discount }" >${couponlist.cDto.co_name }/${couponlist.ci_num }</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
	
					<div class="result">
						<div class="point">* 옵션가와 배송비는 제외</div>
						<div class="discount">
							쿠폰 할인 금액 : <span class="discount1" id="discount_${cartlist.pDto.p_num }">0</span> 원
						</div>
					</div>
				</div>
						
			</c:forEach>

<!-- 
			<div class="orderDiv">
				<table summary="상품 게시판으로 주문하신 상품명, 수량, 판매가, 배송순으로 조회 하시고 쿠폰을 적용하실 수 있습니다." class="orderTable" border="1" cellspacing="0">
					<caption>상품 게시판</caption>
					<colgroup>
					<col width="*" />
					<col width="16%" />
					<col width="14%" class="tw30" />
					<col width="16%" class="pnone" />
					</colgroup>
					<thead>
						<th scope="col">상품명</th>
						<th scope="col">수량</th>
						<th scope="col">판매가</th>
						<th scope="col" class="pnone">배송비</th>
					</thead>
					<tbody>
						<tr>
							<td class="left">
								<p class="img"><img src="user/images/img/sample_product.jpg" alt="상품" width="66" height="66" /></p>

								<ul class="goods">
									<li>
										<a href="#">쟈뎅 오리지널 콜롬비아 페레이라 원두커피백 15p</a>
									</li>
								</ul>
							</td>
							<td>1개</td>
							<td>14,400 원</td>
							<td class="pnone">0 원</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="popGraybox">
				<div class="choose">
					쿠폰선택&nbsp;&nbsp;
					<select>
						<option value="">쿠폰선택</option>
					</select>
				</div>

				<div class="result">
					<div class="point">* 옵션가와 배송비는 제외</div>
					<div class="discount">
						쿠폰 할인 금액 : <span>0</span> 원
					</div>
				</div>
			</div>
 -->
			<!-- 쿠폰할인 금액 합계 -->
			<div class="amount popamount">
				<ul class="coupon">
					<li>쿠폰 할인 금액 합계 : <span class="orange" id="discount_sum">0</span> 원</li>
				</ul>
			</div>
			<!-- //쿠폰할인 금액 합계 -->

	
<!-- 나의 쿠폰 내역 
			<h3 class="dep">나의 쿠폰 내역</h3>
			<div class="couponrDiv">
				<table summary="No, 쿠폰번호/쿠폰내용, 등록날짜/사용기간, 할인금액, 상태, 적용순으로 쿠폰내역을 조회하실 수 있습니다." class="orderTable3" border="1" cellspacing="0">
					<caption>나의 쿠폰 내역</caption>
					<colgroup>
					<col width="8%" class="tnone" />
					<col width="*" class="tw40" />
					<col width="26%" class="tw40" />
					<col width="12%" class="tnone" />
					<col width="10%" class="tw20" />
					<col width="10%" class="tnone" />
					</colgroup>
					<thead>
						<th scope="col" class="tnone">NO.</th>
						<th scope="col">쿠폰번호 / <span>쿠폰내용</span></th>
						<th scope="col">등록날짜 / <span>사용기간</span></th>
						<th scope="col" class="tnone">할인금액</th>
						<th scope="col">상태</th>
						<th scope="col" class="tnone">적용</th>
					</thead>
					<tbody>
						<tr>
							<td class="tnone">3</td>
							<td class="left">MSCP110109883615<br/><span>10% 할인 쿠폰 (가격제한 없음)</span></td>
							<td>2014-04-20 <u>18:36:24</u><br/><span>(2014-01-10 ~ 2014-04-30)</span></td>
							<td class="tnone">1,000원</td>
							<td><span class="orange">사용<u>가능</u></span></td>
							<td class="tnone"><span class="heavygray">적용중</span></td>
						</tr>

						<tr>
							<td class="tnone">2</td>
							<td class="left">MSCP110109883615<br/><span>무료배송 (20,000원 이상 구매시)</span></td>
							<td>2014-04-20 <u>18:36:24</u><br/><span>(2014-01-10 ~ 2014-04-30)</span></td>
							<td class="tnone">2,000원</td>
							<td>사용<u>불가</u></td>
							<td class="tnone">사용완료</td>
						</tr>

						<tr>
							<td class="tnone">1</td>
							<td class="left">MSCP110109883615<br/><span>무료배송 (50,000원 이상 구매시)</span></td>
							<td>2014-04-20 <u>18:36:24</u><br/><span>(2014-01-10 ~ 2014-04-30)</span></td>
							<td class="tnone">1,000원</td>
							<td><span class="orange">사용<u>가능</u></span></td>
							<td class="tnone"><span class="orange">미사용</span></td>
						</tr>
					</tbody>
				</table>
			</div>
			
 -->				
			<!-- Btn Area -->
			<div class="btnArea">
				<div class="bCenter">
					<ul>								
						<li><a href="#" class="sbtnMini" onclick="confirm()">확인</a></li>
						<li><a href="#" class="nbtnbig" onclick="childClose()">취소</a></li>
					</ul>
				</div>
			</div>
			<!-- //Btn Area -->

		</div>

	</div>

</div>


</div>
</body>
</html>