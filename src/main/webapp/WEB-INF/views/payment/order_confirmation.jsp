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
<meta name="description" content="JARDIN SHOP" />
<meta name="keywords" content="JARDIN SHOP" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
<link rel="stylesheet" type="text/css" href="user/css/reset.css?v=Y" />
<link rel="stylesheet" type="text/css" href="user/css/layout.css?v=Y" />
<link rel="stylesheet" type="text/css" href="user/css/content.css?v=Y" />
<script type="text/javascript" src="user/js/jquery.min.js"></script>
<script type="text/javascript" src="user/js/top_navi.js"></script>
<script type="text/javascript" src="user/js/left_navi.js"></script>
<script type="text/javascript" src="user/js/main.js"></script>
<script type="text/javascript" src="user/js/common.js"></script>
<script type="text/javascript" src="user/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="user/js/idangerous.swiper-2.1.min.js"></script>
<script type="text/javascript" src="user/js/jquery.anchor.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="user/js/html5.js"></script>
<script type="text/javascript" src="user/js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
$(document).ready(function() {
	


});
</script>
</head>
<body>



<!--익스레이어팝업-->
<div id="ieUser" style="display:none">
	<div class="iewrap">	
		<p class="img"><img src="user/images/ico/ico_alert.gif" alt="알림" /></p>
		<p class="txt">IE버전이 낮아 홈페이지 이용에 불편함이 있으므로 <strong>IE9이상이나 다른 브라우저</strong>를 이용해 주세요. </p>
		<ul>
			<li><a href="http://windows.microsoft.com/ko-kr/internet-explorer/download-ie" target="_blank"><img src="user/images/ico/ico_ie.gif" alt="IE 최신브라우저 다운" ></a></li>
			<li><a href="https://www.google.com/intl/ko/chrome/browser" target="_blank"><img src="user/images/ico/ico_chrome.gif" alt="IE 최신브라우저 다운" ></a></li>
			<li><a href="http://www.mozilla.org/ko/firefox/new" target="_blank"><img src="user/images/ico/ico_mozila.gif" alt="MOZILA 최신브라우저 다운" ></a></li>
			<li><a href="http://www.apple.com/safari" target="_blank"><img src="user/images/ico/ico_safari.gif" alt="SAFARI 최신브라우저 다운" ></a></li>
			<li><a href="http://www.opera.com/ko/o/ie-simple" target="_blank"><img src="user/images/ico/ico_opera.gif" alt="OPERA 최신브라우저 다운" ></a></li>		
		</ul>
		<p class="btn" onclick="msiehide();"><img src="user/images/ico/ico_close.gif" alt="닫기" /></p>
	</div>
</div>
<!--//익스레이어팝업-->
<!--IE 6,7,8 사용자에게 브라우저 업데이터 설명 Div 관련 스크립트-->
 <script type="text/javascript">

     var settimediv = 200000; //지속시간(1000= 1초)
     var msietimer;

     $(document).ready(function () {
         msiecheck();
     });

     var msiecheck = function () {
         var browser = navigator.userAgent.toLowerCase();
         if (browser.indexOf('msie 6') != -1 ||
                browser.indexOf('msie 7') != -1 ||
				 browser.indexOf('msie 8') != -1) {
             msieshow();			 
         }
         else {
             msiehide();
         }
     }

     var msieshow = function () {
        $("#ieUser").show();
        msietimer = setTimeout("msiehide()", settimediv);
     }

     var msiehide = function () {
		$("#ieUser").hide();
        clearTimeout(msietimer);
     }
</script>

<div id="allwrap">
<div id="wrap">

	<jsp:include page="../header.jsp" />

	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li class="last">주문/결제</li>
			</ol>
		</div>
		
		<div id="outbox">		
			
			<!-- maxcontents -->
			<div id="maxcontents">
				<div id="mypage">
					<h2><strong>주문/결제</strong></h2>
					
					<!-- 주문 상품 -->
					<h3 class="dep">주문 제품 확인</h3>
					<div class="orderDivNm">
						<table summary="주문 제품 확인 게시판으로 상품명, 가격, 수량, 합계순으로 조회 하실수 있습니다." class="orderTable" border="1" cellspacing="0">
							<caption>주문 제품 확인</caption>
							<colgroup>
							<col width="*" />
							<col width="16%" class="tnone" />
							<col width="14%" />
							<col width="16%" class="tw28"/>
							</colgroup>
							<thead>
								<th scope="col">상품명</th>
								<th scope="col" class="tnone">가격/포인트</th>
								<th scope="col">수량</th>
								<th scope="col">합계</th>
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
									<td class="tnone">
										123,400 원

										<!-- 회원일 시 -->
										<br/><span class="pointscore">1,234 Point</span>
										<!-- //회원일 시 -->
									</td>
									<td>1 개</td>
									<td>123,400 원</td>
								</tr>
								
								<tr>
									<td class="left">
										<p class="img"><img src="user/images/img/sample_product.jpg" alt="상품" width="66" height="66" /></p>

										<ul class="goods">
											<li>
												<a href="#">가나다라마바사아자차카타파하 가나다라마바사아자차카타파하 가나다라마바사아자차카타파하</a>
											</li>
										</ul>
									</td>
									<td class="tnone">
										123,400 원

										<!-- 회원일 시 -->
										<br/><span class="pointscore">1,234 Point</span>
										<!-- //회원일 시 -->
									</td>
									<td>1 개</td>
									<td>123,400 원</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="poroductTotal">
						<ul>	
							<li>상품 합계금액 <strong>1,132,310</strong> 원</li>
							<li>+ 배송비 <strong>2,500</strong> 원</li>
							<li>= 총 합계 <strong>1,134,810</strong> 원</li>
						</ul>
					</div>
					<!-- //주문 상품 -->


			<!-- 총 주문금액 -->
					<div class="amount">

						<!-- 회원 일때 -->
						<h4 class="member">총 주문금액</h4>
						<!-- 회원 일때 -->
						<!-- 비회원 일때  <h4>총 주문금액</h4> //비회원 일때 -->

						<ul class="info">
							<li>
								<span class="title">상품 합계금액</span>
								<span class="won"><strong>1,132,310</strong> 원</span>
							</li>
							<li>
								<span class="title">배송비</span>
								<span class="won"><strong>2,500</strong> 원</span>
							</li>

							<!-- 회원 일때만 -->
							<li>
								<span class="title">포인트 할인</span>
								<span class="won"><strong>- 1,000</strong> P</span>
							</li>
							<li>
								<span class="title">쿠폰 할인</span>
								<span class="won"><strong>- 1,000</strong> 원</span>
							</li>
							<!-- //회원 일떄만 -->
						</ul>

						<ul class="total">
							<!-- 회원 일때만 -->
							<li class="mileage">(적립 포인트 <strong>11,324</strong> Point) </li>
							<!-- //회원 일때만 -->

							<li class="txt"><strong>결제 예정 금액</strong></li>
							<li class="money"><span>1,134,810</span> 원</li>
						</ul>
					</div>
			<!-- //총 주문금액 -->
					

			<!-- 주문자 정보확인 -->
					<h3 class="dep">주문자 정보</h3>
					<div class="checkDiv">
						<table summary="주문자 정보를 이름, 주소, 이메일, 휴대폰 번호, 전화번호 순으로 확인 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
							<caption>주문자 정보확인</caption>
							<colgroup>
							<col width="17%" class="tw20" />
							<col width="*" />
							<col width="17%" class="tw20" />
							<col width="*" class="tw25" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>이름</span></th>
									<td>홍길동</td>
									<th scope="row"><span>이메일</span></th>
									<td>sldkfje@naver.com</td>
								</tr>

								<tr>
									<th scope="row" rowspan="2"><span>주소</span></th>
									<td rowspan="2">220 - 920<br/>강원도 원주시 원동<br/>123-456</td>
									<th scope="row"><span>휴대폰 <u>번호</u></span></th>
									<td>010-2456-7894</td>
								</tr>

								<tr>
									<th scope="row"><span>전화<u>번호</u></span></th>
									<td>02-6534-8652</td>
								</tr>
							</tbody>
						</table>
					</div>
			<!-- //주문자 정보확인 -->


			<!-- 수취자 정보확인 -->
					<h3 class="dep">수취자 정보</h3>
					<div class="checkDiv">
						<table summary="수취자 정보를 이름, 주소, 이메일, 휴대폰 번호, 전화번호, 배송시 요구사항 순으로 확인 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
							<caption>수취자 정보확인</caption>
							<colgroup>
							<col width="17%" class="tw20" />
							<col width="*" />
							<col width="17%" class="tw20" />
							<col width="*" class="tw25" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>이름</span></th>
									<td colspan="3">홍길동</td>
								</tr>

								<tr>
									<th scope="row" rowspan="2"><span>주소</span></th>
									<td rowspan="2">220 - 920<br/>강원도 원주시 원동<br/>123-456</td>
									<th scope="row"><span>휴대폰 <u>번호</u></span></th>
									<td>010-2456-7894</td>
								</tr>

								<tr>
									<th scope="row"><span>전화<u>번호</u></span></th>
									<td>02-6534-8652</td>
								</tr>

								<tr>
									<th scope="row"><span>배송시 <u>요구사항</u></span></th>
									<td colspan="3">부재시 경비실에 맡겨주세요.</td>
								</tr>
							</tbody>
						</table>
					</div>
			<!-- //주문자 정보확인 -->


			<!-- 결제금액 확인 -->
					<h3 class="dep">결제금액</h3>
					<div class="checkDiv">
						<table summary="결제되는 금액를 총 주문금액, 쿠폰할인, 배송비, 포인트사용, 총 결제금액 순으로 확인 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
							<caption>결제금액확인</caption>
							<colgroup>
							<col width="17%" class="tw20" />
							<col width="*" />
							<col width="17%" class="tw20" />
							<col width="*" class="tw25" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>총 주문<u>금액</u></span></th>
									<td>1,132,132원</td>
									<th scope="row"><span>쿠폰 <u>할인</u></span></th>
									<td>132,132원</td>
								</tr>

								<tr>
									<th scope="row"><span>배송비</span></th>
									<td>2,500 원 (선불)</td>
									<th scope="row"><span>포인트 <u>사용</u></span></th>
									<td>1,000 Point</td>
								</tr>

								<tr>
									<th scope="row"><span>총 결제<u>금액</u></span></th>
									<td colspan="3"><strong>22,820 원</strong></td>
								</tr>
							</tbody>
						</table>
					</div>
			<!-- //결제금액 확인 -->


			<!-- 주문 정보 확인 -->
					<h3 class="dep">주문 정보</h3>
					<div class="checkDiv">
						<table summary="주문정보를 주문번호, 결제수단, 주문일, 입금은행, 요구사항, 입금자 명 순으로 확인 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
							<caption>주문 정보</caption>
							<colgroup>
							<col width="17%" class="tw20" />
							<col width="*" />
							<col width="17%" class="tw20" />
							<col width="*" class="tw25" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>주문번호</span></th>
									<td>201404253254-1354</td>
									<th scope="row"><span>결제수단</span></th>
									<td>무통장 입금</td>
								</tr>

								<tr>
									<th scope="row"><span>주문일</span></th>
									<td>2014-04-20</td>
									<th scope="row"><span>입금은행</span></th>
									<td>신한은행 1234-45-786135 (주)쟈뎅</td>
								</tr>

								<tr>
									<th scope="row"><span>요구사항</span></th>
									<td>부재시 경비실에 맡겨주세요.</td>
									<th scope="row"><span>입금자 <u>명</u></span></th>
									<td>홍길동</td>
								</tr>
							</tbody>
						</table>
					</div>
			<!-- //주문 정보 확인 -->


					<!-- Btn Area -->
					<div class="btnArea2">
						<a href="#" class="nbtnbig iw0140">확인</a>
					</div>
					<!-- //Btn Area -->


				</div>
			</div>
			<!-- //maxcontents -->


		</div>
	</div>
	<!-- //container -->




	<jsp:include page="../footer.jsp" />



</div>
</div>
</body>
</html>