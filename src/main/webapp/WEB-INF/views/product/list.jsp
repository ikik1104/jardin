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
<style>
.wishThumb{width:80px;}
</style>
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
         
         
         $(".brandTab ul li").each(function() {
        	 var p_step2 = '${p_step2}';
	         	if((p_step2 != null ||p_step2 != "")&& p_step2 == $(this).text()){
         		$(this).children("a").attr("class", "hover");
         	}
         	
         	if((p_step2 == null ||p_step2 == "") && $(this).text()=='전체'){
         		$(this).children("a").attr("class", "hover");
         	}
        	 
        	 
         });
         
         
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
			
			<h2 class="brand">${p_step1}<span>더 신선한 커피, 더 맛있는 커피</span></h2>

			<div class="brandTab">
				<ul>
				<c:if test="${p_step1 eq '원두'}">
					<li><a href="u_product_list?p_step1=원두">전체</a></li>
						<li><a href="u_product_list?p_step1=원두&p_step2=클래스">클래스</a></li>
						<li><a href="u_product_list?p_step1=원두&p_step2=바리스타">바리스타</a></li>
						<li><a href="u_product_list?p_step1=원두&p_step2=마스터즈">마스터즈</a></li>
						<li><a href="u_product_list?p_step1=원두&p_step2=쟈뎅">쟈뎅</a></li>
				</c:if>
				<c:if test="${p_step1  eq '인스턴트 커피'}">
					<li><a href="u_product_list?p_step1=인스턴트 커피">전체</a></li>
					<li><a href="u_product_list?p_step1=인스턴트 커피&p_step2=카페모리">카페모리</a></li>
					<li><a href="u_product_list?p_step1=인스턴트 커피&p_step2=에스프레소 스틱">에스프레소 스틱</a></li>
				</c:if>
				<c:if test="${p_step1  eq '차'}">
					<li><a href="u_product_list?p_step1=차">전체</a></li>
					<li><a href="u_product_list?p_step1=차&p_step2=아워티(티백)">아워티(티백)</a></li>
				</c:if>
				<c:if test="${p_step1 eq '음료/커피/티'}">
					<li><a href="u_product_list?p_step1=음료/커피/티">전체</a></li>
					<li><a href="u_product_list?p_step1=음료/커피/티&p_step2=시그니처">시그니처</a></li>
					<li><a href="u_product_list?p_step1=음료/커피/티&p_step2=카페리얼">카페리얼</a></li>
					<li><a href="u_product_list?p_step1=음료/커피/티&p_step2=아워티(음료)">아워티(음료)</a></li>
				</c:if>
				<c:if test="${p_step1  eq '선물세트'}">
					<li><a href="u_product_list?p_step1=선물세트" >전체</a></li>
					<li><a href="u_product_list?p_step1=선물세트&p_step2=선물세트">선물세트</a></li>
					<li><a href="u_product_list?p_step1=선물세트&p_step2=DIY선물세트">DIY선물세트</a></li>
				</c:if>
				<c:if test="${p_step1  eq '브랜드관'}">
					<li><a href="u_product_list?p_step1=브랜드관">전체</a></li>
					<li><a href="u_product_list?p_step1=브랜드관&p_step2=GS">GS</a></li>
						<li><a href="u_product_list?p_step1=브랜드관&p_step2=투썸">투썸</a></li>
						<li><a href="u_product_list?p_step1=브랜드관&p_step2=드롭탑">드롭탑</a></li>
						<li><a href="u_product_list?p_step1=브랜드관&p_step2=요거프레소">요거프레소</a></li>
				</c:if>
				<c:if test="${p_step1 eq '용품'}">
					<li><a href="u_product_list?p_step1=용품">전체</a></li>
						<li><a href="u_product_list?p_step2=용품&p_step2=커피용품">커피용품</a></li>
				</c:if>
				</ul>
				
			</div>

			<div class="brandList">
				<ul>
					<!-- 반복 -->
					<c:forEach items="${product}" var="product" varStatus="pro">
					<c:set var="p" value="pro_count" />
					<li>
						<a href="product_detail?p_num=${product.p_num}">
							<div class="img"><img src="${product.p_thumb_img1}" alt="제품이미지" /></div>
							<div class="step2 name" style="font-weight: bold;">${product.p_step2	}</div>
							<div class="name">${product.p_name}</div>
							<div class="price">
							<fmt:formatNumber value="${product.p_price}" type="number"/>
							원</div>
						</a>
					</li>
					</c:forEach>
				</ul>
			</div>

			<!-- quickmenu -->
			<div id="quick">
				<div class="cart"><a href="cart">장바구니</a></div>
				<div class="wish">
					<p class="title">위시 리스트</p>
					
					<div class="list">
						<ul>
							<c:forEach var="wlist" items="${ wlist }">
								<li><a href="product_detail?p_num=${ wlist.pDto.p_num }"><img class="wishThumb" src="${ wlist.pDto.p_thumb_img1 }"></a>
							</c:forEach>	
						</ul>
					</div>

					<div class="total">
						<a href="#none" class="wishLeft"><img src="user/images/btn/wish_left.gif" alt="" /></a>
						 <span class="page">1</span> / <span class="sum">3</span>
						<a href="#none" class="wishRight"><img src="user/images/btn/wish_right.gif" alt="" /></a>
					</div>

				</div>

				<div class="top"><a href="#">TOP&nbsp;&nbsp;<img src="user/images/ico/ico_top.gif" alt="" /></a></div>
			</div>
			<script type="text/javascript">
			$(function(){
				
				$(window).scroll(function(){
					var tg = $("div#quick");
					var xg = $("div#maxcontents");
					var limit = xg.height()- 165;
					var tmp = $(window).scrollTop();

					if (tmp > limit) {
						tg.css({"position" : "absolute","right" : "-150px","bottom" : "208px","top" : "auto"});
					}
					else {
						tg.css({"position" : "fixed","top" : "208px" , "margin-left" : "940px","right" : "auto"});
					}
				});

			});
			</script>
			<!-- //quickmenu -->

		</div>
		<!-- //maxcontents -->

	</div>
	<!-- //container -->




	<jsp:include page="../footer.jsp" />


</div>
</div>
</body>
</html>