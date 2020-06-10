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
				<li><a href="#">MY PAGE</a></li>
				<li class="last">나의 쿠폰</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<div id="left">
				<div id="title">MY PAGE<span>마이페이지</span></div>
				<ul>	
					<li><a href="#" id="leftNavi1">주문/배송 조회</a></li>
					<li><a href="#" id="leftNavi2">반품/배송 현황</a></li>
					<li><a href="#" id="leftNavi3">장바구니</a></li>
					<li><a href="#" id="leftNavi4">위시리스트</a></li>
					<li><a href="#" id="leftNavi5">나의 쿠폰</a></li>
					<li><a href="#" id="leftNavi6">나의 포인트</a></li>
					<li><a href="#" id="leftNavi7">1:1문의</a></li>
					<li><a href="#" id="leftNavi8">회원정보 수정</a></li>
					<li class="last"><a href="#" id="leftNavi9">회원 탈퇴</a></li>
				</ul>			
			</div><script type="text/javascript">initSubmenu(5,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>나의 쿠폰</strong><span>회원님께서 보유하신 쿠폰을 확인해보세요.</span></h2>
					
					<div class="myInfo">
						<ul>
							<li class="info"><strong>가나다</strong> 님의 정보를 한눈에 확인하세요.</li>
							<li>보유 쿠폰<br/><span class="num">199</span> <span class="unit">장</span></li>
							<li class="point">내 포인트<br/><span class="num">100,000</span> <span class="unit">P</span></li>
							<li class="last">진행중인 주문<br/><span class="num">199</span> <span class="unit">건</span></li>
						</ul>
					</div>





					<div class="otherTab">
						<ul>
							<li><a href="javascript:;" onclick="return false;" id="tab_serviceable">사용 가능 쿠폰</a></li>
							<li class="last"><a href="javascript:;" onclick="return false;" id="tab_usage">쿠폰 사용내역</a></li>
						</ul>						
					</div><script type="text/javascript">$(function(){$(".otherTab ul li a:eq(0)").click();});</script>
				
					<!-- Serviceable -->
					<div class="tab_serviceable couponnone">
						<div class="shortTxt">현재 사용 가능한 쿠폰은 <span class="orange">3</span>장입니다.</div>
						<div class="orderDivNm">
							<table summary="사용가능 한 쿠폰으로 No, 종류, 쿠폰명, 사용기한, 상태를 조회 하실수 있습니다." class="orderTable2" border="1" cellspacing="0">
								<caption>사용 가능 쿠폰 보기</caption>
								<colgroup>
								<col width="9%" class="tnone" />
								<col width="20%" class="tw28" />
								<col width="30%" class="tnone"/>
								<col width="*" />
								<col width="14%" class="tw20" />
								</colgroup>
								<thead>
									<th scope="col" class="tnone">NO.</th>
									<th scope="col">종류</th>
									<th scope="col" class="tnone">쿠폰명</th>
									<th scope="col">사용기한</th>
									<th scope="col">상태</th>
								</thead>
								<tbody>
									<tr>
										<td class="tnone">1</td>
										<td>10% 할인쿠폰</td>
										<td class="tnone">쟈뎅샵 1주년 기념 쿠폰</td>
										<td>14-01-28 ~ 14-05-31</td>
										<td><span class="heavygray">사용가능</span></td>
									</tr>

									<tr>
										<td class="tnone">2</td>
										<td>원두 전품목 5%</td>
										<td class="tnone">쟈뎅샵 오픈기념 이벤트 쿠폰</td>
										<td>14-01-28 ~ 14-05-31</td>
										<td><span class="heavygray">사용가능</span></td>
									</tr>

									<tr>
										<td class="tnone">3</td>
										<td>회원가입 감사 쿠폰</td>
										<td class="tnone">회원가입 기념 전품목 5% 할인 쿠폰</td>
										<td>14-01-28 ~ 14-05-31</td>
										<td><span class="heavygray">사용가능</span></td>
									</tr>
								</tbody>
							</table>

							<div class="noData">
								등록된 상품이 없습니다.
							</div>
						</div>
						

						<div class="btnAreaList">
							<!-- 페이징이동1 -->
							<div class="allPageMoving1">

							<a href="#" class="n"><img src="user/images/btn/btn_pre2.gif" alt="처음으로"/></a><a href="#" class="pre"><img src="user/images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
							<strong>1</strong>
							<a href="#">2</a>
							<a href="#">3</a>
							<a href="#">4</a>
							<a href="#">5</a>
							<a href="#" class="next"><img src="user/images/btn/btn_next1.gif" alt="뒤페이지로"/></a><a href="#" class="n"><img src="user/images/btn/btn_next2.gif" alt="마지막페이지로"/></a>

							</div>
							<!-- //페이징이동1 -->
						</div>
					</div>
					<!-- //Serviceable -->


					<!-- Usage -->
					<div class="tab_usage couponnone">
						<div class="shortTxt">쿠폰 사용 내역입니다.</div>
						<div class="orderDivNm">
							<table summary="사용한 쿠폰내역으로 No, 종류, 쿠폰명, 사용기한, 상태를 조회 하실수 있습니다." class="orderTable2" border="1" cellspacing="0">
								<caption>쿠폰 사용내역</caption>
								<colgroup>
								<col width="9%" class="tnone" />
								<col width="20%" class="tw28" />
								<col width="30%" class="tnone"/>
								<col width="*" />
								<col width="14%" class="tw20" />
								</colgroup>
								<thead>
									<th scope="col" class="tnone">NO.</th>
									<th scope="col">종류</th>
									<th scope="col" class="tnone">쿠폰명</th>
									<th scope="col">사용기한</th>
									<th scope="col">상태</th>
								</thead>
								<tbody>
									<tr>
										<td class="tnone">1</td>
										<td>10% 할인쿠폰</td>
										<td class="tnone">쟈뎅샵 1주년 기념 쿠폰</td>
										<td>14-01-28 ~ 14-05-31</td>
										<td><span class="heavygray">사용완료</span></td>
									</tr>

									<tr>
										<td class="tnone">2</td>
										<td>원두 전품목 5%</td>
										<td class="tnone">쟈뎅샵 오픈기념 이벤트 쿠폰</td>
										<td>14-01-28 ~ 14-05-31</td>
										<td><span class="heavygray">사용완료</span></td>
									</tr>

									<tr>
										<td class="tnone">3</td>
										<td>회원가입 감사 쿠폰</td>
										<td class="tnone">회원가입 기념 전품목 5% 할인 쿠폰</td>
										<td>14-01-28 ~ 14-05-31</td>
										<td><span class="heavygray">기간만료</span></td>
									</tr>
								</tbody>
							</table>

							<div class="noData">
								등록된 상품이 없습니다.
							</div>
						</div>
						

						<div class="btnAreaList">
							<!-- 페이징이동1 -->
							<div class="allPageMoving1">

							<a href="#" class="n"><img src="user/images/btn/btn_pre2.gif" alt="처음으로"/></a><a href="#" class="pre"><img src="user/images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
							<strong>1</strong>
							<a href="#">2</a>
							<a href="#">3</a>
							<a href="#">4</a>
							<a href="#">5</a>
							<a href="#" class="next"><img src="user/images/btn/btn_next1.gif" alt="뒤페이지로"/></a><a href="#" class="n"><img src="user/images/btn/btn_next2.gif" alt="마지막페이지로"/></a>

							</div>
							<!-- //페이징이동1 -->
						</div>
					</div>	
					<!-- //Usage -->





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



<script type="text/javascript" src="user/js/jquery.fancybox-1.3.4.pack.js"></script>
<link rel="stylesheet" type="text/css" href="user/css/jquery.fancybox-1.3.4.css" />
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

	$(".iwc80").fancybox({
		'autoDimensions'    : false,
		'showCloseButton'	: false,
		'width' : 486,
		'padding' : 0,
		'type'			: 'iframe',
		'onComplete' : function() {
			$('#fancybox-frame').load(function() { // wait for frame to load and then gets it's height
			$('#fancybox-content').height($(this).contents().find('body').height());
			});
		}
	});

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