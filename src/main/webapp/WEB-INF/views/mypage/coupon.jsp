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
				<li><a href="main">HOME</a></li>
				<li><a href="#">MY PAGE</a></li>
				<li class="last">나의 쿠폰</li>
			</ol>
		</div>
		
		<div id="outbox">	
			<jsp:include page="common/sub_navi.jsp" />
			<script type="text/javascript">initSubmenu(5,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>나의 쿠폰</strong><span>회원님께서 보유하신 쿠폰을 확인해보세요.</span></h2>
					
					<jsp:include page="common/shortInfo.jsp" />

					<div class="otherTab">
						<ul>
							<li><a href="javascript:;" onclick="return false;" id="tab_serviceable">사용 가능 쿠폰</a></li>
							<li class="last"><a href="javascript:;" onclick="return false;" id="tab_usage">쿠폰 사용내역</a></li>
						</ul>						
					</div><script type="text/javascript">$(function(){$(".otherTab ul li a:eq(0)").click();});</script>
				
					<!-- Serviceable -->
					<div class="tab_serviceable couponnone">
						<div class="shortTxt">현재 사용 가능한 쿠폰은 <span class="orange">${coupon }</span>장입니다.</div>
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
								<c:forEach var="couponlist" items="${couponlist }" varStatus="status">
									<tr>
										<td class="tnone">${status.count }</td>
										<c:if test="${couponlist.cDto.co_type=='cart' }">
										<td>장바구니 쿠폰</td>
										</c:if>
										<c:if test="${couponlist.cDto.co_type=='product' }">
										<td>제품할인 쿠폰</td>
										</c:if>
										<c:if test="${couponlist.cDto.co_type=='delivery' }">
										<td>배송비 쿠폰</td>
										</c:if>
										<td class="tnone">${couponlist.cDto.co_name}</td>
										<fmt:formatDate var="start_day" value="${couponlist.cDto.co_start_day}" pattern="yy-MM-dd"/>
										<fmt:formatDate var="end_day" value="${couponlist.ci_end_day}" pattern="yy-MM-dd"/>
										<td>${start_day} ~ ${end_day}</td>
										<td><span class="heavygray">사용가능</span></td>
									</tr>
								</c:forEach>
									
								</tbody>
							</table>

							<div class="noData1">
							</div>
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
								<c:forEach var="usedlist" items="${usedlist }" varStatus="status2">
									<tr>
										<td class="tnone">${status2.count }</td>
										<c:if test="${usedlist.cDto.co_type=='cart' }">
										<td>장바구니 쿠폰</td>
										</c:if>
										<c:if test="${usedlist.cDto.co_type=='product' }">
										<td>제품할인 쿠폰</td>
										</c:if>
										<c:if test="${usedlist.cDto.co_type=='delivery' }">
										<td>배송비 쿠폰</td>
										</c:if>
										<td class="tnone">${usedlist.cDto.co_name}</td>
										<fmt:formatDate var="start_day1" value="${usedlist.cDto.co_start_day}" pattern="yy-MM-dd"/>
										<fmt:formatDate var="end_day1" value="${usedlist.ci_end_day}" pattern="yy-MM-dd"/>
										<td>${start_day1} ~ ${end_day1}</td>
										<c:if test="${not empty usedlist.ci_use_day }">
										<td><span class="heavygray">사용완료</span></td>
										</c:if>
										<c:if test="${empty usedlist.ci_use_day }">
										<td><span class="heavygray">기간만료</span></td>
										</c:if>
									</tr>
								</c:forEach>
								</tbody>
							</table>

							<div class="noData1">
							</div>
						</div>
					</div>	
					<!-- //Usage -->

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