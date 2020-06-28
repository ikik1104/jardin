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

function search() {
	alert($("#search").val());
	var value = $("#search").val();
	if(value == null || value==""){
		alert("검색어를 입력하세요");
		return false;
	}
	
}
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
         
         if(${not empty type}){
        	 var text = '${type}';
        	 $("#"+text).attr("class", "on");
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
				<li><a href="#">COMMUNITY</a></li>
				<li class="last">사용 후기</li>
			</ol>
		</div>
		
		<div id="outbox">		
			<div id="left">
				<div id="title2">COMMUNITY<span>커뮤니티</span></div>
				<ul>	
					<li><a href="review_list?ru_type=일반" id="leftNavi2">사용 후기</a></li>
					<li class="last"><a href="enjoy_list" id="leftNavi3">ENJOY COFFEE</a></li>
				</ul>			
			</div><script type="text/javascript">initSubmenu(2,0);</script>


			<!-- contents -->
			<div id="contents">
				<div id="mypage">
					<h2><strong>사용 후기</strong><span>쟈뎅 제품을 구매하신 회원님들의 소중한 후기입니다.</span></h2>
					
					<div class="productTab normaltab">
						<ul>
							<li><a href="review_list?ru_type=포토" id="photo">포토 구매후기</a></li>
							<li class="last"><a href="review_list?ru_type=일반" id="basic">상품평</a></li>
						</ul>						
					</div>


					<!-- 상품평 -->
					<div class="orderDiv">
					<table summary="상품평 게시판으로 NO, 제품명, 제목, 작성자, 평점/등록일, 조회수 순으로 조회 하실수 있습니다." class="orderTable" border="1" cellspacing="0">
						<caption>주문 제품 확인</caption>
						<colgroup>
						<col width="8%" class="tnone" />
						<col width="12%" class="tw20" />
						<col width="*" />
						<col width="14%" class="tw20" />
						<col width="14%" class="tnone" />
						<col width="10%" class="tnone" />
						</colgroup>
						<thead>
							<th scope="col" class="tnone">NO.</th>
							<th scope="col">제품명</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col" class="tnone">평점/등록일</th>
							<th scope="col" class="tnone">조회수</th>
						</thead>
						<tbody>
						<c:choose>
							<c:when test="${not empty list }">
								<c:forEach var="list" items="${list}">
								<tr>
									<td class="tnone">${list.RNUM}</td>
									<td>
										${list.P_NAME}</td>
									<td class="left" style="text-overflow:ellipsis;overflow:hidden;white-space: nowrap; ">
										<a href="review_detail?ru_num=${list.RU_NUM}&rownum=${list.RNUM}&ru_type=${list.RU_TYPE}&page=${ paging.getPage()}">
											<c:if test="${list.RU_TYPE eq '포토'}">
												<img src="${list.RU_IMG}" width="70px" height="50px">
											</c:if>
											${list.RU_TITLE}
											<img src="user/images/ico/ico_new.gif" alt="new" />
											<c:if test="${list.RU_STATUS eq '답변완료'}">
											(1)
											</c:if>
										</a>
									</td>
									<td>${list.M_ID}</td>
									<td class="tnone">
										<c:forEach begin="1" end="${list.RU_SCORE}">
											<img src="user/images/ico/ico_star.gif" alt="별점" />
										</c:forEach>
										<c:forEach begin="1" end="${5-list.RU_SCORE}">
											<img src="user/images/ico/ico_star_off.gif" alt="별점" />
										</c:forEach>
	
										<br/><fmt:formatDate value="${list.RU_DATE}" pattern="yy-MM-dd"/>
									</td>
									<td class="right tnone">${list.RU_HIT}</td>
								</tr>
							</c:forEach>
							</c:when>
							<c:otherwise>
								<td style="text-align: center;" colspan="6">작성된 리뷰가 없습니다.</td>
							</c:otherwise>
						</c:choose>
						</tbody>
					</table>
					</div>

					<div class="btnAreaList">

						<!-- 페이징이동1 -->
						<div class="allPageMoving1">
							<a href="review_list?page=1&ru_type=${type}" class="n"><img src="user/images/btn/btn_pre2.gif" alt="처음으로"/></a>
							<c:if test="${ paging.getPage()<=1 }">
								<img src="user/images/btn/btn_pre1.gif" alt="앞페이지로"/>
							</c:if>
							<c:if test="${ paging.getPage()>1 }">
								<a href="review_list?page=${ paging.getPage() - 1 }&ru_type=${type}" class="pre"><img src="user/images/btn/btn_pre1.gif" alt="앞페이지로"/></a>
							</c:if>
							<c:forEach var="num" begin="${ paging.getStartPage() }" end="${ paging.getEndPage() }" step="1">
								<c:choose>
									<c:when test="${ num == paging.getPage() }">
										<strong>${ num }</strong>
									</c:when>
									<c:when test="${ num != paging.getPage() }">
										<a href="review_list?page=${ num }&ru_type=${type}">${ num }</a>
									</c:when>
								</c:choose>
							</c:forEach>
							
							<c:if test="${ paging.getPage()>= paging.getLastPage() }">
								<img src="user/images/btn/btn_next1.gif" alt="뒤페이지로"/>
							</c:if>
							<c:if test="${ paging.getPage() < paging.getLastPage() }">
								<a href="review_list?page=${ paging.getPage() + 1 }&ru_type=${type}" class="next"><img src="user/images/btn/btn_next1.gif" alt="뒤페이지로"/></a>
							</c:if>
							<a href="review_list?page=${ paging.getLastPage() }&ru_type=${type}" class="n"><img src="user/images/btn/btn_next2.gif" alt="마지막페이지로"/></a>
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
								<li><input type="text" name="search" class="searchInput" /></li>
								<li class="web"><a onclick="search()"><img src="user/images/btn/btn_search.gif" alt="검색" /></a></li>
								<li class="mobile"><a href="#"><img src="user/images/btn/btn_search_m.gif" alt="검색" /></a></li>
							</ul>
						</div>
					</div>
					<!-- //상품평 -->

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