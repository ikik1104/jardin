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
				<li>원두커피</li>
				<li class="last">원두</li>
			</ol>
		</div>
					
		<!-- maxcontents -->
		<div id="maxcontents">
			<div class="banner"><img src="user/images/img/product_banner01.jpg" alt="원두커피, 원두커피 전문 기업 쟈뎅의 Coffee Master의 심혈을 기울인 엄선된 원두 선별, 일반 원두커피부터 간편하게 즐기는 원두커피백, POD까지 다양하게 구성되어 있습니다." class="web" /><img src="user/images/img/product_banner01_m.jpg" alt="원두커피, 원두커피 전문 기업 쟈뎅의 Coffee Master의 심혈을 기울인 엄선된 원두 선별, 일반 원두커피부터 간편하게 즐기는 원두커피백, POD까지 다양하게 구성되어 있습니다." class="mobile" /></div>

			<div class="brandList">
				<ul>
					<!-- 반복 -->
					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>
					<!-- //반복 -->

					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>

					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>

					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>

					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>

					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>

					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>

					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>

					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>

					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>

					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>

					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>

					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>

					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>

					<li>
						<a href="#">
							<div class="img"><img src="user/images/img/sample_brand.jpg" alt="제품이미지" /></div>
							<div class="name">쟈뎅 바리스타 벨벳<br/>에스프레소 원두커피</div>
							<div class="price">5,600원</div>
						</a>
					</li>
				</ul>
			</div>

		</div>
		<!-- //maxcontents -->

	</div>
	<!-- //container -->




	<jsp:include page="../footer.jsp" />


</div>
</div>
</body>
</html>