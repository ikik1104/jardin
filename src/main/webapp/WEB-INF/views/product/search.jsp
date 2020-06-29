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
         
         var keyword = '${keyword}';
         if(keyword != null || keyword != ""){
        	 $("#search_input").val(keyword);
         }
         
         var sort = '${sort}';
//          alert(sort);
         if(sort != null && sort != ""){
        	 $("#hot").removeAttr("class");
        	 $("#"+sort).attr("class", "on")
         }
         
         
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
			
			<div class="sContents">
				<p><strong><span class="orange">‘${keyword}’</span>에 대한 검색 결과입니다.</strong></p>
				<p>다른 상품을 검색하시려면 다시 한번 검색어를 입력하신 후 검색 버튼을 클릭하세요.</p>

				<div class="searchForm">
					<input type="text" class="reSearchType" id="search_input" onfocus="this.className='reSearchfocus'" onblur="if (this.value.length==0) {this.className='reSearchType'}else {this.className='reSearchfocusnot'}" />
					<div class="btn"><a href="#"><img src="user/images/btn/btn_result_search.gif" alt="검색" /></a></div>
					<p class="rechk"><input type="checkbox" /><label for="">결과 내 재검색</label></p>
				</div>
			</div>

			<div class="tabCategory">
				<div class="cateLeft"><span class="orange">‘${keyword}’</span> 검색 결과 <span class="orange">${fn:length(list)}</span>건 </div>
				<div class="cateRight">
					<ul>
						<li class="first"><a href="search_sort?keyword=${keyword}&sort='hot'" class="on" id="hot">인기도순</a></li>
						<li><a href="search_sort?keyword=${keyword}&sort=new" id="new">신상품순</a></li>
						<li><a href="search_sort?keyword=${keyword}&sort=high" id="higt">높은 가격순</a></li>
						<li class="last"><a href="search_sort?keyword=${keyword}&sort=low" id="low">낮은 가격순</a></li>
					</ul>
				</div>
			</div>

			<div class="brandList">
				<ul>
					<!-- 반복 -->
					<c:forEach var="list" items="${list}">
					<li>
						<a href="product_detail?p_num=${list.p_num}">
							<div class="img"><img src="${list.p_thumb_img1}" alt="제품이미지" /></div>
							<div class="name">[${list.p_step2}] ${list.p_name}</div>
							<div class="price"><fmt:formatNumber value="${list.p_price}" type="number"/></div>
						</a>
					</li>
					</c:forEach>
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