<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<jsp:useBean id="now" class="java.util.Date" />
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
         
         $(".nbtnMini").each(function(){
             if($(this).text() == "답변대기"){
            	 $(this).css('background-color', '#999999');
             } else {
            	 $(this).css('background-color', '#f7703c');
             }
         })
         
         
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
     
     function search_submit(){
    	inq_search.submit();	 
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
				<li class="last">1:1문의</li>
			</ol>
		</div>
		
		<div id="outbox">
        		<jsp:include page="common/sub_navi.jsp" />
                <script type="text/javascript">initSubmenu(7,0);</script>

			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>1:1문의</strong><span>쟈뎅에 궁금하신 사항을 남겨주시면 답변해드립니다.</span></h2>
					
					<div class="myInfo">
						<ul>
							<li class="info"><strong>가나다</strong> 님의 정보를 한눈에 확인하세요.</li>
							<li>보유 쿠폰<br/><span class="num">199</span> <span class="unit">장</span></li>
							<li class="point">내 포인트<br/><span class="num">100,000</span> <span class="unit">P</span></li>
							<li class="last">진행중인 주문<br/><span class="num">199</span> <span class="unit">건</span></li>
						</ul>
					</div>


					<div class="orderDivNm">
						<table summary="NO, 종류, 적립포인트, 적립날짜, 상태 순으로 현재 적립된 포인트를 조회 하실수 있습니다." class="orderTable2" border="1" cellspacing="0">
							<caption>적립내역 보기</caption>
							<colgroup>
							<col width="9%" class="tnone" />
							<col width="14%" class="tw20" />
							<col width="*" />
							<col width="15%" class="tnone" />
							<col width="15%" class="tw30" />
							</colgroup>
							<thead>
								<th scope="col" class="tnone">NO.</th>
								<th scope="col">분류</th>
								<th scope="col">제목</th>
								<th scope="col" class="tnone">등록일</th>
								<th scope="col">처리상태</th>
							</thead>
							<tbody>

                                <c:forEach var="inq" items="${ inquiry }">
                                    <tr>
                                        <td class="tnone">${ inq.getRownum() } </td>
                                        <td>${ inq.getIu_sort() }</td>
                                        <td class="left"><a href="inquiry_view?m_num=${ inq.getM_num() }&iu_num=${ inq.getIu_num() }&rownum=${ inq.getRownum() }">${ inq.getIu_title() }</a></td>
                                        <fmt:formatDate value="${now}" pattern="yy.MM.dd" var="today" />
                                        <fmt:formatDate value="${ inq.getIu_date() }" pattern="yy.MM.dd" var="date_type" />
                                        <fmt:formatDate value="${ inq.getIu_date() }" pattern="hh:mm:ss" var="time_type"/>
                                        <c:if test="${ date_type < today }">
                                            <td class="tnone">
                                                ${ date_type }
                                            </td>
                                        </c:if>
                                        <c:if test="${ date_type >= today }">
                                            <td class="tnone">
                                                ${ time_type }
                                            </td>
                                        </c:if>
                                        <td>
                                            <ul class="state">
                                                <li><div class="nbtnMini iw83">${ inq.getIu_status() }</div></li>
                                            </ul>
                                        </td>
                                    </tr>
                                </c:forEach>
                                
							</tbody>
						</table>

<!-- 						<div class="noData"> -->
<!-- 							문의 하신 내용이 없습니다. -->
<!-- 						</div> -->
					</div>
					

					<div class="btnAreaList">
						
						<div class="bwright">
							<ul>
								<li><a href="inquiry_write" class="writeBtn">글쓰기</a></li>
							</ul>
						</div>

						<!-- 페이징이동1 -->
						<div class="allPageMoving1">
							<a href="inquiry?page=1" class="n"><img src="user/images/btn/btn_pre2.gif" alt="처음으로"/></a>
							<c:if test="${ paging.getPage()<=1 }">
								<img src="user/images/btn/btn_pre1.gif" alt="앞페이지로"/>
							</c:if>
							<c:if test="${ paging.getPage()>1 }">
								<a href="inquiry?page=${ paging.getPage() - 1 }" class="pre"><img src="user/images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
							</c:if>
							<c:forEach var="num" begin="${ paging.getStartPage() }" end="${ paging.getEndPage() }" step="1">
								<c:choose>
									<c:when test="${ num == paging.getPage() }">
										<strong>${ num }</strong>
									</c:when>
									<c:when test="${ num != paging.getPage() }">
										<a href="inquiry?page=${ num }">${ num }</a>
									</c:when>
								</c:choose>
							</c:forEach>
							
							<c:if test="${ paging.getPage()>= paging.getLastPage() }">
								<img src="user/images/btn/btn_next1.gif" alt="뒤페이지로"/>
							</c:if>
							<c:if test="${ paging.getPage() < paging.getLastPage() }">
								<a href="inquiry?page=${ paging.getPage() + 1 }" class="next"><img src="user/images/btn/btn_next1.gif" alt="뒤페이지로"/></a>
							</c:if>
							<a href="inquiry?page=${ paging.getLastPage() }" class="n"><img src="user/images/btn/btn_next2.gif" alt="마지막페이지로"/></a>
						</div>
						<!-- //페이징이동1 -->
						
					</div>
                    
                    <form action="inq_search" method="get" name="inq_search">
    					<div class="searchWrap">
    						<div class="search">
    							<ul>
    								<li class="web"><img src="user/images/txt/txt_search.gif" alt="search" /></li>
    								<li class="se">
    									<select name="search_category">
    										<option value="all" />전체</option>
    										<option value="iu_title" />제목</option>
    										<option value="iu_content" />내용</option>
    									</select>
    								</li>
    								<li><input type="text" class="searchInput" name="search_input"/></li>
    								<li class="web"><a href="#" onclick="search_submit()"><img src="user/images/btn/btn_search.gif" alt="검색" /></a></li>
    								<li class="mobile"><a href="#" onclick="search_submit()"><img src="user/images/btn/btn_search_m.gif" alt="검색" /></a></li>
    							</ul>
    						</div>
    					</div>
                    </form>

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