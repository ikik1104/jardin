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

	<div id="header">
		
		<div id="snbBox">
			<h1><img src="user/images/txt/logo.gif" alt="JARDIN SHOP" /></h1>
			<div id="quickmenu">
				<div id="mnaviOpen"><img src="user/images/btn/btn_mnavi.gif" width="33" height="31" alt="메뉴열기" /></div>
				<div id="mnaviClose"><img src="user/images/btn/btn_mnavi_close.gif" width="44" height="43" alt="메뉴닫기" /></div>
				<ul>
					<li><a href="#">EVENT</a></li>
					<li><a href="#">CUSTOMER</a></li>
					<li><a href="#">COMMUNITY</a></li>
				</ul>
			</div>
			<div id="snb">
				<ul>
					<li><a href="#">LOGIN</a></li>
					<li><a href="#">JOIN</a></li>
					<li><a href="#">MY PAGE</a></li>
					<li><a href="#">CART</a></li>
				</ul>

				<div id="search">
					<input type="text" class="searchType" />
					<input type="image" src="user/images/btn/btn_main_search.gif" width="23" height="20" alt="검색하기" />
				</div>
			</div>
		</div>
	</div>


	<jsp:include page="../header.jsp" />

	<!-- container -->
	<div id="container">

		<div id="location">
			<ol>
				<li><a href="#">HOME</a></li>
				<li><a href="#">MY PAGE</a></li>
				<li class="last">반품/교환 현황</li>
			</ol>
		</div>
		
		<div id="outbox">		
            <jsp:include page="common/sub_navi.jsp" />
            <script type="text/javascript">initSubmenu(1,0);</script>

			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>반품/교환 현황</strong><span>회원님이 구매하신 상품의 반품/교환 신청 및 내역을 확인하실 수 있습니다.</span></h2>
					
					<div class="myInfo">
						<ul>
							<li class="info"><strong>가나다</strong> 님의 정보를 한눈에 확인하세요.</li>
							<li>보유 쿠폰<br/><span class="num">199</span> <span class="unit">장</span></li>
							<li class="point">내 포인트<br/><span class="num">100,000</span> <span class="unit">P</span></li>
							<li class="last">진행중인 주문<br/><span class="num">199</span> <span class="unit">건</span></li>
						</ul>
					</div>

					<h3>반품/교환 상품정보</h3>
					<div class="orderDivNm">
						<table summary="주문일자/주문번호, 상품명, 가격, 수량, 주문상태 순으로 조회를 하실수 있습니다." class="orderTable" border="1" cellspacing="0">
							<caption>반품/교환 상품정보</caption>
							<colgroup>
							<col width="25%" class="tw28" />
							<col width="*" />
							<col width="15%" class="tnone" />
							<col width="8%" class="tnone" />
							<col width="18%" class="tw30" />
							</colgroup>
							<thead>
								<th scope="col">주문일자 <span>/ 주문번호</span></th>
								<th scope="col">상품명</th>
								<th scope="col" class="tnone">가격</th>
								<th scope="col" class="tnone">수량</th>
								<th scope="col">주문상태</th>
							</thead>
							<tbody>
								<tr>
									<td>
										<p class="day">2012-05-30</p>
										<p class="orderNum">201205301204-8057</p>
									</td>
									<td class="left">
										쟈뎅 오리지널 콜롬비아 페레이라 원두커피백 15p
									</td>
									<td class="tnone">999,999 원</td>
									<td class="tnone">1000개</td>
									<td>
										<span class="heavygray">배송완료</span>
									</td>
								</tr>
							</tbody>
						</table>

						<div class="noData">
							등록된 상품이 없습니다.
						</div>
					</div>



					<h3 class="dep">반품/교환 사유</h3>
					<div class="checkDiv">
						<table summary="분류, 자세한 이유 순으로 반품/교환 사유를 작성 하실수 있습니다." class="checkTable" border="1" cellspacing="0">
							<caption>반품/교환 사유</caption>
							<colgroup>
							<col width="22%" class="tw30" />
							<col width="*" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><span>분류</span></th>
									<td>
										<select>
											<option value="">선택해주세요.</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row"><span>자세한 이유</span></th>
									<td>
										<textarea class="tta"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

					<!-- Btn Area -->
					<div class="btnArea">
						<div class="bCenter">
							<ul>								
								<li><a href="#" class="sbtnMini">반품/교환신청</a></li>
								<li><a href="#" class="nbtnbig">취소</a></li>
							</ul>
						</div>
					</div>
					<!-- //Btn Area -->
					



					<div class="productTab">
						<ul>
							<li><a href="javascript:;" onclick="return false;" id="tab_today">오늘 본 상품 <span>(4)</span></a></li>
							<li class="last"><a href="javascript:;" onclick="return false;" id="tab_basket">장바구니 <span>(0)</span></a></li>
						</ul>						
					</div><script type="text/javascript">$(function(){$(".productTab ul li a:eq(0)").click();});</script>	


					<!-- Today Product -->
					<div class="tab_today disnone">
						
						<div class="productList">
							<ul>
								<!-- Product Yes -->
								<li>
									<span class="chk"><input type="checkbox" /></span>
									<span class="img"><img src="user/images/img/sample_product.jpg" alt="상품" /></span>
									<span class="name"><a href="#">쟈뎅 오리지널 블루마운틴 블렌드 원두커피백 15P</a></span>
									<span class="price">4,330원</span>
								</li>

								<li>
									<span class="chk"><input type="checkbox" /></span>
									<span class="img"><img src="user/images/img/sample_product.jpg" alt="상품" /></span>
									<span class="name"><a href="#">쟈뎅 오리지널 블루마운틴 블렌드 원두커피백 15P</a></span>
									<span class="price">4,330원</span>
								</li>

								<li>
									<span class="chk"><input type="checkbox" /></span>
									<span class="img"><img src="user/images/img/sample_product.jpg" alt="상품" /></span>
									<span class="name"><a href="#">쟈뎅 오리지널 블루마운틴 블렌드 원두커피백 15P</a></span>
									<span class="price">4,330원</span>
								</li>

								<li>
									<span class="chk"><input type="checkbox" /></span>
									<span class="img"><img src="user/images/img/sample_product.jpg" alt="상품" /></span>
									<span class="name"><a href="#">쟈뎅 오리지널 블루마운틴 블렌드 원두커피백 15P</a></span>
									<span class="price">4,330원</span>
								</li>
								<!-- //Product Yes -->

								<!-- Product No 
								<li class="noProduct">
									상품이 없습니다.
								</li>
								 -->
							</ul>
						</div>

						<div class="btnArea">
							<div class="bRight">
								<ul>
									<li><a href="#" class="nbtnbig">선택상품 삭제</a></li>
									<li><a href="#" class="sbtnMini">장바구니 추가</a></li>
								</ul>
							</div>
						</div>

					</div>
					<!-- //Today Product -->


					<!-- Shopping Basket -->
					<div class="tab_basket disnone">
						
						<div class="productList">
							<ul>
								<!-- Product Yes -->
								<li>
									<span class="chk"><input type="checkbox" /></span>
									<span class="img"><img src="user/images/img/sample_product.jpg" alt="상품" /></span>
									<span class="name"><a href="#">쟈뎅 장바구니 블루마운틴 블렌드 원두커피백 15P</a></span>
									<span class="price">4,330원</span>
								</li>

								<li>
									<span class="chk"><input type="checkbox" /></span>
									<span class="img"><img src="user/images/img/sample_product.jpg" alt="상품" /></span>
									<span class="name"><a href="#">쟈뎅 장바구니 블루마운틴 블렌드 원두커피백 15P</a></span>
									<span class="price">4,330원</span>
								</li>

								<li>
									<span class="chk"><input type="checkbox" /></span>
									<span class="img"><img src="user/images/img/sample_product.jpg" alt="상품" /></span>
									<span class="name"><a href="#">쟈뎅 장바구니 블루마운틴 블렌드 원두커피백 15P</a></span>
									<span class="price">4,330원</span>
								</li>

								<li>
									<span class="chk"><input type="checkbox" /></span>
									<span class="img"><img src="user/images/img/sample_product.jpg" alt="상품" /></span>
									<span class="name"><a href="#">쟈뎅 장바구니 블루마운틴 블렌드 원두커피백 15P</a></span>
									<span class="price">4,330원</span>
								</li>
								<!-- //Product Yes -->

								<!-- Product No 
								<li class="noProduct">
									상품이 없습니다.
								</li>
								 -->
							</ul>
						</div>

						<div class="btnArea">
							<div class="bRight">
								<ul>
									<li><a href="#" class="nbtnbig">선택상품 삭제</a></li>
									<li><a href="#" class="sbtnMini">선택상품 주문</a></li>
								</ul>
							</div>
						</div>

					</div>
					<!-- //Shopping Basket -->


<script type="text/javascript">
$(function(){
	function distance(){
		var winWidth = $(window).width();
		if(winWidth > 767){
			$(".productList ul li:nth-child(4n+4)").css("padding","0 0 0 0");
		}else{
			$(".productList ul li:nth-child(4n+4)").css("padding","0 10px");
		}
	}
	distance();
	$(window).resize(function(){distance();});
});
</script>



				</div>
			</div>
			<!-- //contents -->


		</div>
	</div>
	<!-- //container -->




	<jsp:include page="../footer.jsp" />



</div>
</div>
</body>
</html>