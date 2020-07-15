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
<script type="text/javascript" src="user/js/user_event2.js"></script>
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
				<li><a href="#">EVENT</a></li>
				<li class="last">진행중 이벤트</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<div id="left">
				<div id="title2">EVENT<span>이벤트</span></div>
				<ul>	
					<li style="cursor:pointer;"><a href="event" id="leftNavi1">진행중 이벤트</a></li>
					<li style="cursor:pointer;"><a href="fin_event" id="leftNavi2">종료된 이벤트</a></li>
					<!--<li class="last" style="cursor:pointer;"><a href="prizewinner" id="leftNavi3">당첨자 발표</a></li>  -->
				</ul>			
			</div><script type="text/javascript">initSubmenu(1,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>진행중 이벤트</strong><span>쟈뎅샵의 특별한 혜택이 가득한 이벤트에 참여해 보세요.</span></h2>
					
					<!-- list -->
					<div class="eventList">
						<ul>
							<c:if test="${list_size==0 }">
								<c:if test="${search_keyword ne null && search_keyword ne '' }">
									<li style="text-align:center; font-size:16px;">검색 결과가 없습니다.</li>
								</c:if>
								<c:if test="${search_keyword eq null || search_keyword eq '' }">
									<li style="text-align:center; font-size:16px;">진행중 이벤트가 없습니다.</li>
								</c:if>
							</c:if>
							<c:if test="${list_size!=0 }">							
								<c:forEach var="event_list" items="${event_list }">
								<c:if test="${event_list.eventdto.rownum>=page_info.startRow && event_list.eventdto.rownum<=page_info.endRow }">
									<li>
										<div class="img">
											<a style="color:black;" href="user_event_view?e_num=${event_list.eventdto.e_num }&page=${page_info.page}&search_type=${search_type}&search_keyword=${search_keyword}"><img style="width:668px; height:198px;" src="${event_list.eventdto.e_thumb_img }" alt="진행중 이벤트" /></a>
										</div>
										<div class="txt">
											<div class="subject"  style="overflow:hidden; text-overflow:ellipsis; width:420px; white-space:pre;"><a  style="color:black;" href="user_event_view?e_num=${event_list.eventdto.e_num }&page=${page_info.page}&search_type=${search_type}&search_keyword=${search_keyword}">${event_list.eventdto.e_title }</a></div>
											<div class="day">이벤트 기간 : ${event_list.utildto.str1 } ~ ${event_list.utildto.str2 }</div>
										</div>
									</li>									
								</c:if>
								</c:forEach>
							</c:if>
						</ul>
					</div>
					<!-- //list -->

					  
					<c:if test="${page_info ne null}">  
						<div class="btnAreaList"> 
							<!-- 페이징이동1 -->
							 <div class="allPageMoving1">
							<!-- 제일 첫번째 페이지로 이동 -->
							<c:if test="${page_info.page ne 1 }">
								<a href="event?page=1&search_type=${search_type}&search_keyword=${search_keyword}"  class="n"><img src="user/images/btn/btn_pre2.gif" alt="처음으로"/></a>							
							</c:if>
							<!-- 제일 첫번째 페이지로 이동 -->
							<!-- 전 페이지로 이동 -->
							<c:if test="${page_info.page ne 1 }">
								<a href="event?page=${page_info.page-1 }&search_type=${search_type}&search_keyword=${search_keyword}"  class="pre"><img src="user/images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
							</c:if>
							<!-- 전 페이지로 이동 -->
							<!-- 페이지열 -->
							<c:forEach var="i" begin="${page_info.startPage }" end="${page_info.endPage }"> 
								<c:if test="${page_info.page eq i }">
									<strong>${i }</strong>
								</c:if>
								<c:if test="${page_info.page ne i }">
									<a href="event?page=${i }&search_type=${search_type}&search_keyword=${search_keyword}">${i }</a>
								</c:if>							
							</c:forEach>
							<!-- 페이지열 -->
							<!-- 다음페이지로 이동 -->
							<c:if test="${page_info.page ne page_info.lastPage }">
								<a href="event?page=${page_info.page+1 }&search_type=${search_type}&search_keyword=${search_keyword}" class="next"><img src="user/images/btn/btn_next1.gif" alt="뒤페이지로"/></a>
							</c:if>
							<!-- 다음페이지로 이동 -->
							<!-- 제일 끝페이지로 이동 -->
							<c:if test="${page_info.page ne page_info.lastPage }">
								<a href="event?page=${page_info.lastPage }&search_type=${search_type}&search_keyword=${search_keyword}"class="n"><img src="user/images/btn/btn_next2.gif" alt="마지막페이지로"/></a>							
							</c:if>
							<!-- 제일 끝페이지로 이동 -->
							
	
							</div> 
							<!-- //페이징이동1 -->
						</div>
					</c:if>
					 
					
					<!-- 검색 -->
					<form action="event" method="get" name="searchForm">
					<div class="searchWrap">
						<div class="search" style="width:400px;">
							<ul>
								<li class="web"><img src="user/images/txt/txt_search.gif" alt="search" /></li>
								<li class="se">
									<select name="search_type" id="search_type">
									    <c:if test="${search_type eq 'title' }">
									    	<option value="title" selected>제목</option>
									    </c:if>
									    <c:if test="${search_type ne 'title' }">
									    	<option value="title" >제목</option>
									    </c:if>			
									    <c:if test="${search_type eq 'content' }">
									    	<option value="content" selected>내용</option>
									    </c:if>
									    <c:if test="${search_type ne 'content' }">
									    	<option value="content" >내용</option>
									    </c:if>										    						    
									    <c:if test="${search_type eq 'title_content' }">
									    	<option value="title_content" selected>제목+내용</option>
									    </c:if>
									    <c:if test="${search_type ne 'title_content' }">
									    	<option value="title_content" >제목+내용</option>
									    </c:if>								
									</select>
								</li>
								<li><input type="text" class="searchInput" name="search_keyword" id="search_keyword" value="${search_keyword }"/></li>
								<li class="web"><a onclick="searchForm.submit()"><img src="user/images/btn/btn_search.gif" alt="검색" /></a></li>
								<li class="mobile"><a onclick="searchForm.submit()"><img src="user/images/btn/btn_search_m.gif" alt="검색" /></a></li>
							</ul>
						</div>
					</div>
					</form>
					<!-- //검색 -->

				</div>
			</div>
			<!-- //contents -->

		</div>

		<!-- quickmenu -->
		<!--  <div id="quick">
			<div class="cart"><a href="#">장바구니</a></div>
			<div class="wish">
				<p class="title">위시 리스트</p>
				
				<div class="list">
					<ul>	
						<li><a href="#"><img src="user/images/img/sample_wish.gif" alt="" /></a>
						<li><a href="#"><img src="user/images/img/sample_wish.gif" alt="" /></a>
						<li><a href="#"><img src="user/images/img/sample_wish.gif" alt="" /></a>
						<li><a href="#"><img src="user/images/img/sample_wish.gif" alt="" /></a>
						<li><a href="#"><img src="user/images/img/sample_wish.gif" alt="" /></a>
						<li><a href="#"><img src="user/images/img/sample_wish.gif" alt="" /></a>
						<li><a href="#"><img src="user/images/img/sample_wish.gif" alt="" /></a>
						<li><a href="#"><img src="user/images/img/sample_wish.gif" alt="" /></a>
						<li><a href="#"><img src="user/images/img/sample_wish.gif" alt="" /></a>
						<li><a href="#"><img src="user/images/img/sample_wish.gif" alt="" /></a>
						<li><a href="#"><img src="user/images/img/sample_wish.gif" alt="" /></a>
						<li><a href="#"><img src="user/images/img/sample_wish.gif" alt="" /></a>
						<li><a href="#"><img src="user/images/img/sample_wish.gif" alt="" /></a>
						<li><a href="#"><img src="user/images/img/sample_wish.gif" alt="" /></a>
						<li><a href="#"><img src="user/images/img/sample_wish.gif" alt="" /></a>
					</ul>
				</div>

				<div class="total">
					<a href="#none" class="wishLeft"><img src="user/images/btn/wish_left.gif" alt="" /></a>
					 <span class="page">1</span> / <span class="sum">3</span>
					<a href="#none" class="wishRight"><img src="user/images/btn/wish_right.gif" alt="" /></a>
				</div>

			</div>

			<div class="top"><a href="#">TOP&nbsp;&nbsp;<img src="user/images/ico/ico_top.gif" alt="" /></a></div>
		</div>-->
		
		
		<script type="text/javascript">
		$(function(){
			
			$(window).scroll(function(){
				var tg = $("div#quick");
				var xg = $("div#container");
				var limit = xg.height()- 500;
				var tmp = $(window).scrollTop();

				if (tmp > limit) {
					tg.css({"position" : "absolute","right" : "-150px","bottom" : "220px","top" : "auto"});
				}
				else {
					tg.css({"position" : "fixed","top" : "314px" , "margin-left" : "940px","right" : "auto"});
				}
			});

		});
		</script>
		<!-- //quickmenu -->

	</div>
	<!-- //container -->




	<jsp:include page="../footer.jsp" />



</div>
</div>
</body>
</html>