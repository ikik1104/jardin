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
				<li><a href="#">COMMUNITY</a></li>
				<li class="last">사용 후기</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<div id="left">
				<div id="title2">COMMUNITY<span>커뮤니티</span></div>
				<ul>	
					<li><a href="#" id="leftNavi1">체험단</a></li>
					<li><a href="#" id="leftNavi2">사용 후기</a></li>
					<li class="last"><a href="#" id="leftNavi3">ENJOY COFFEE</a></li>
				</ul>			
			</div><script type="text/javascript">initSubmenu(1,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>체험단</strong><span>쟈뎅샵에서 진행되는 무료체험 기회를 놓치지 마세요.</span></h2>
					
					<!-- 체험단 -->
					<div class="imgListType">
						<ul>

							<!-- List -->
							<li>
								<div class="img"><img src="user/images/img/sample_expr.jpg" width="155" height="160" alt="" /></div>
								<div class="txt">
									<div class="subject">
										<a href="#">카페모리 홍차라떼, 드립커피백 체험단 모집 <span class="ingbtn">진행중</span></a>
									</div>
									<div class="star">
										체험단 평점&nbsp;
										<img src="user/images/ico/ico_star.gif" alt="별점" />
										<img src="user/images/ico/ico_star.gif" alt="별점" />
										<img src="user/images/ico/ico_star.gif" alt="별점" />
										<img src="user/images/ico/ico_star_off.gif" alt="별점" />
										<img src="user/images/ico/ico_star_off.gif" alt="별점" />
									</div>
									<div class="databox">
										<span class="tit">모집 인원</span><span class="cont">15명</span>
										<span class="tit">신청 기간</span><span>2014-04-01 ~ 2014-04-25</span>
										<span class="tit">체험단 발표</span><span class="cont">2014-04-30</span>
										<span class="tit">리뷰 등록기간</span><span>2014-05-06 ~ 2014-06-30</span>
									</div>
								</div>
							</li>
							<!-- //List -->


							<li>
								<div class="img"><img src="user/images/img/sample_expr.jpg" width="155" height="160" alt="" /></div>
								<div class="txt">
									<div class="subject">
										<a href="#">카페모리 홍차라떼, 드립커피백 체험단 모집 <span class="finishbtn">종료</span></a>
									</div>
									<div class="star">
										체험단 평점&nbsp;
										<img src="user/images/ico/ico_star.gif" alt="별점" />
										<img src="user/images/ico/ico_star.gif" alt="별점" />
										<img src="user/images/ico/ico_star.gif" alt="별점" />
										<img src="user/images/ico/ico_star_off.gif" alt="별점" />
										<img src="user/images/ico/ico_star_off.gif" alt="별점" />
									</div>
									<div class="databox">
										<span class="tit">모집 인원</span><span class="cont">15명</span>
										<span class="tit">신청 기간</span><span>2014-04-01 ~ 2014-04-25</span>
										<span class="tit">체험단 발표</span><span class="cont">2014-04-30</span>
										<span class="tit">리뷰 등록기간</span><span>2014-05-06 ~ 2014-06-30</span>
									</div>
								</div>
							</li>

							<li>
								<div class="img"><img src="user/images/img/sample_expr.jpg" width="155" height="160" alt="" /></div>
								<div class="txt">
									<div class="subject">
										<a href="#">카페모리 홍차라떼, 드립커피백 체험단 모집 <span class="finishbtn">종료</span></a>
									</div>
									<div class="star">
										체험단 평점&nbsp;
										<img src="user/images/ico/ico_star.gif" alt="별점" />
										<img src="user/images/ico/ico_star.gif" alt="별점" />
										<img src="user/images/ico/ico_star.gif" alt="별점" />
										<img src="user/images/ico/ico_star_off.gif" alt="별점" />
										<img src="user/images/ico/ico_star_off.gif" alt="별점" />
									</div>
									<div class="databox">
										<span class="tit">모집 인원</span><span class="cont">15명</span>
										<span class="tit">신청 기간</span><span>2014-04-01 ~ 2014-04-25</span>
										<span class="tit">체험단 발표</span><span class="cont">2014-04-30</span>
										<span class="tit">리뷰 등록기간</span><span>2014-05-06 ~ 2014-06-30</span>
									</div>
								</div>
							</li>

							<li>
								<div class="img"><img src="user/images/img/sample_expr.jpg" width="155" height="160" alt="" /></div>
								<div class="txt">
									<div class="subject">
										<a href="#">카페모리 홍차라떼, 드립커피백 체험단 모집 <span class="finishbtn">종료</span></a>
									</div>
									<div class="star">
										체험단 평점&nbsp;
										<img src="user/images/ico/ico_star.gif" alt="별점" />
										<img src="user/images/ico/ico_star.gif" alt="별점" />
										<img src="user/images/ico/ico_star.gif" alt="별점" />
										<img src="user/images/ico/ico_star_off.gif" alt="별점" />
										<img src="user/images/ico/ico_star_off.gif" alt="별점" />
									</div>
									<div class="databox">
										<span class="tit">모집 인원</span><span class="cont">15명</span>
										<span class="tit">신청 기간</span><span>2014-04-01 ~ 2014-04-25</span>
										<span class="tit">체험단 발표</span><span class="cont">2014-04-30</span>
										<span class="tit">리뷰 등록기간</span><span>2014-05-06 ~ 2014-06-30</span>
									</div>
								</div>
							</li>

						</ul>
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

					<div class="searchWrap">
						<div class="search">
							<ul>
								<li class="web"><img src="user/images/txt/txt_search.gif" alt="search" /></li>
								<li class="se">
									<select>
										<option value="" />제목</option>
									</select>
								</li>
								<li><input type="text" class="searchInput" /></li>
								<li class="web"><a href="#"><img src="user/images/btn/btn_search.gif" alt="검색" /></a></li>
								<li class="mobile"><a href="#"><img src="user/images/btn/btn_search_m.gif" alt="검색" /></a></li>
							</ul>
						</div>
					</div>
					<!-- //체험단 -->


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