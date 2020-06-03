<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
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
</script>
</head>
<body>
<div id="layerWrap">

<div class="inputWrap">
		
	<div class="inputBody">
		<div class="title">주문 상세내역</div>
		<p class="close"><a onclick="parent.$.fancybox.close();" href="javascript:;"><img src="user/images/btn/btn_input_close.gif" alt="닫기" /></a></p>

		<div id="member">
			<h3 class="dep">주문 상품 정보</h3>
			<div class="orderDivNm">
				<table summary="주문 상품 정보 게시판으로 주문하신 상품명, 수량, 판매가, 배송순으로 조회 하시고 쿠폰을 적용하실 수 있습니다." class="orderTable" border="1" cellspacing="0">
					<caption>주문 상품 정보</caption>
					<colgroup>
					<col width="*" />
					<col width="12%" class="pnone" />
					<col width="12%" class="pnone" />
					<col width="12%" class="pnone" />
					<col width="12%" class="ptw30"/>
					</colgroup>
					<thead>
						<th scope="col">상품명</th>
						<th scope="col" class="pnone">수량</th>
						<th scope="col" class="pnone">판매가</th>
						<th scope="col" class="pnone">배송비</th>
						<th scope="col">합계</th>
					</thead>
					<tbody>
						<tr>
							<td class="left">
								쟈뎅 오리지널 콜롬비아 페레이라 원두커피백 15p
							</td>
							<td class="pnone">1개</td>
							<td class="pnone">14,400 원</td>
							<td class="pnone">0 원</td>
							<td>250,000 원</td>
						</tr>
					</tbody>
				</table>
			</div>


			<!-- 결제 정보 확인 -->
			<h3 class="dep">결제 정보</h3>
			<div class="checkDiv">
				<table summary="결제 정보를 주문일, 결제 총액, 결제수단, 입금자 명 순으로 확인 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
					<caption>결제 정보</caption>
					<colgroup>
					<col width="17%" class="tw30" />
					<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><span>주문일</span></th>
							<td>2014-04-30</td>
						</tr>
						<tr>
							<th scope="row"><span>결제총액</span></th>
							<td>27,250 원</td>
						</tr>
						<tr>
							<th scope="row"><span>결제수단</span></th>
							<td>무통장 입금 (신한은행 123456-785-459324 (주)쟈뎅)</td>
						</tr>
						<tr>
							<th scope="row"><span>입금자 명</span></th>
							<td>홍길동</td>
						</tr>

					</tbody>
				</table>
			</div>
			<!-- //결제 정보 확인 -->


			<!-- 배송지 정보 확인 -->
			<h3 class="dep">배송지 정보</h3>
			<div class="checkDiv">
				<table summary="배송지 정보를 구매자명, 수취인명, 배송지주소, 휴대전화, 전화번호 배송시 요구사항 순으로 확인 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
					<caption>배송지 정보</caption>
					<colgroup>
					<col width="17%" class="tw30" />
					<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th scope="row"><span>구매자 명</span></th>
							<td>홍길동</td>
						</tr>
						<tr>
							<th scope="row"><span>수취인 명</span></th>
							<td>김철수</td>
						</tr>
						<tr>
							<th scope="row"><span>배송지 주소</span></th>
							<td>[123-456] 경기도 오산시 원동</td>
						</tr>
						<tr>
							<th scope="row"><span>휴대전화</span></th>
							<td>010-1234-5678</td>
						</tr>
						<tr>
							<th scope="row"><span>전화번호</span></th>
							<td>031-1234-5678</td>
						</tr>
						<tr>
							<th scope="row"><span>배송시 <u>요구사항</u></span></th>
							<td>부재시 경비실에 맡겨주세요.</td>
						</tr>

					</tbody>
				</table>
			</div>
			<!-- //배송지 정보 확인 -->

			
			<!-- Btn Area -->
			<div class="btnArea">
				<div class="bCenter">
					<ul>								
						<li><a href="#" class="sbtnMini">확인</a></li>
						<li><a onclick="parent.$.fancybox.close();" href="javascript:;" class="nbtnbig">취소</a></li>
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