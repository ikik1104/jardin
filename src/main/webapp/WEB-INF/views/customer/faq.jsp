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
				<li><a href="#">CUSTOMER</a></li>
				<li class="last">FAQ</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<div id="left">
				<div id="title2">CUSTOMER<span>고객센터</span></div>
				<ul>	
					<li><a href="#" id="leftNavi1">NOTICE</a></li>
					<li><a href="#" id="leftNavi2">1:1문의</a></li>
					<li><a href="#" id="leftNavi3">FAQ</span></a></li>
					<li class="last"><a href="#" id="leftNavi4">이용안내</a></li>
				</ul>			
			</div><script type="text/javascript">initSubmenu(3,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="customer">
					<h2><strong>FAQ</strong><span>회원님들께서 자주 묻는 질문들을 모아 놓았습니다.</span></h2>
					
					<div class="faqTab">
						<ul>
							<li><a href="#" class="on">전체</a></li>
							<li class="dep"><a href="#">회원가입</a></li>
							<li><a href="#">상품</a></li>
							<li class="last"><a href="#">주문</a></li>
						</ul>						
					</div>	
					
					<!-- FAQ -->
					<div class="faqList">
						<ul>
							<!-- list -->
							<li>
								<a href="javascript:;" class="faqbtn">
									<div class="question">
										<div class="blet">Q</div>
										<div class="category">상품</div>
										<div class="title">주문 상품의 수량을 변경하고 싶어요.</div>
									</div>
								</a>

								<div class="faqanswer">
									<div class="faqbox">
										<div class="blet">A</div>
										<div class="text">
											<strong><u>소비자상담실(02-546-3881)</u></strong>로 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 
										</div>
									</div>
								</div>
							</li>
							<!-- //list -->

							<li>
								<a href="javascript:;" class="faqbtn">
									<div class="question">
										<div class="blet">Q</div>
										<div class="category">상품</div>
										<div class="title">주문 상품의 수량을 변경하고 싶어요.</div>
									</div>
								</a>

								<div class="faqanswer">
									<div class="faqbox">
										<div class="blet">A</div>
										<div class="text">
											<strong><u>소비자상담실(02-546-3881)</u></strong>로 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 
										</div>
									</div>
								</div>
							</li>

							<li>
								<a href="javascript:;" class="faqbtn">
									<div class="question">
										<div class="blet">Q</div>
										<div class="category">회원가입</div>
										<div class="title">회원가입을 하면 어떤 혜택이 있나요?</div>
									</div>
								</a>

								<div class="faqanswer">
									<div class="faqbox">
										<div class="blet">A</div>
										<div class="text">
											<strong><u>소비자상담실(02-546-3881)</u></strong>로 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 
										</div>
									</div>
								</div>
							</li>

							<li>
								<a href="javascript:;" class="faqbtn">
									<div class="question">
										<div class="blet">Q</div>
										<div class="category">회원가입</div>
										<div class="title">회원 탈퇴를 하고 싶습니다</div>
									</div>
								</a>

								<div class="faqanswer">
									<div class="faqbox">
										<div class="blet">A</div>
										<div class="text">
											<strong><u>소비자상담실(02-546-3881)</u></strong>로 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 
										</div>
									</div>
								</div>
							</li>

							<li>
								<a href="javascript:;" class="faqbtn">
									<div class="question">
										<div class="blet">Q</div>
										<div class="category">회원가입</div>
										<div class="title">비밀번호를 잊어버렸습니다.</div>
									</div>
								</a>

								<div class="faqanswer">
									<div class="faqbox">
										<div class="blet">A</div>
										<div class="text">
											<strong><u>소비자상담실(02-546-3881)</u></strong>로 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 
										</div>
									</div>
								</div>
							</li>

							<li>
								<a href="javascript:;" class="faqbtn">
									<div class="question">
										<div class="blet">Q</div>
										<div class="category">주문</div>
										<div class="title">주문 상품의 수량을 변경하고 싶어요.</div>
									</div>
								</a>

								<div class="faqanswer">
									<div class="faqbox">
										<div class="blet">A</div>
										<div class="text">
											<strong><u>소비자상담실(02-546-3881)</u></strong>로 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 
										</div>
									</div>
								</div>
							</li>

							<li>
								<a href="javascript:;" class="faqbtn">
									<div class="question">
										<div class="blet">Q</div>
										<div class="category">주문</div>
										<div class="title">배송조회가 되지 않습니다.</div>
									</div>
								</a>

								<div class="faqanswer">
									<div class="faqbox">
										<div class="blet">A</div>
										<div class="text">
											<strong><u>소비자상담실(02-546-3881)</u></strong>로 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 
										</div>
									</div>
								</div>
							</li>

							<li>
								<a href="javascript:;" class="faqbtn">
									<div class="question">
										<div class="blet">Q</div>
										<div class="category">주문</div>
										<div class="title">배송은 평균 얼마나 걸리나요?</div>
									</div>
								</a>

								<div class="faqanswer">
									<div class="faqbox">
										<div class="blet">A</div>
										<div class="text">
											<strong><u>소비자상담실(02-546-3881)</u></strong>로 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 연락 주시면 가능 여부에 관하여 답변드리고 있습니다. 
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<!-- //FAQ -->


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