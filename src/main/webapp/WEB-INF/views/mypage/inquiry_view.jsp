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
     
         if($(".obtnMini").text() == "답변대기"){
        	 $(".obtnMini").css('background-color', '#999999');
         } else {
        	 $(".obtnMini").css('background-color', '#f7703c');
         }
         
     }); //jquery
     
     
     
     function inq_delete(iu_num){
    	 
    	 console.log(typeof iu_num);
    	 console.log("inquiry : "+iu_num);
    	     	 
    	 if(confirm("1:1문의를 삭제하시겠습니까? (삭제시 더이상 답변을 확인할 수 없습니다.)")){
             $.ajax({
               url : "inquiry_delete",
               type : "POST",
               data: JSON.stringify(iu_num),
               contentType: "application/json",
               dataType : "json",
               success : function(val){
                  if(val == 1){ //리턴값이 1이면 (=성공)
                     alert("삭제가 완료되었습니다.");
                 	 location.href="inquiry";
                  }else{ // 0이면 실패
                     alert("삭제할 수 없습니다. 관리자에게 문의하세요.");
                  }
               },
               error : function(){
                  alert("서버통신실패. 관리자에게 문의하세요.");
               }
            });
      	}
     }

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

					<div class="viewDiv">
						<div class="viewHead">
							<div class="subject">
								<ul>
									<li class="cate">${ inq_view.getIu_sort() }</li>
									<li>${ inq_view.getIu_title() }</li>
								</ul>
							</div>
							<div class="day">
								<p class="txt">등록일<span>${ inq_view.getIu_date() }</span></p>
								<p class="btn"><span class="obtnMini">${ inq_view.getIu_status() }</span></p>
							</div>
						</div>

						<div class="viewContents">
							${ inq_view.getIu_content() }
						</div>
					</div>

					<!-- 답변 -->
                    <c:if test="${ not empty ans_view }">
    					<div class="answer">
    						<div class="inbox">
    							<div class="aname">
    								<p>담당자 <span>[${ ans_view.getIa_date() }]</span></p>
    							</div>
    
    							<div class="atxt">
    								${ ans_view.getIa_content() }
    							</div>
    						</div>
    					</div>
                    </c:if>
                    <!-- //답변 -->

					<!-- 이전다음글 -->
					<div class="pnDiv web">
						<table summary="이전다음글을 선택하여 보실 수 있습니다." class="preNext" border="1" cellspacing="0">
							<caption>이전다음글</caption>
							<colgroup>
							<col width="100px" />
							<col width="*" />
							<col width="100px" />
							</colgroup>
							<tbody>
								<tr>
									<th class="pre">PREV</th>
                                    
                                    <c:if test="${ empty next_title }">
                                        <td>다음 글이 없습니다.</td>
                                        <td>&nbsp;</td>
                                    </c:if>
                                    <c:if test="${ not empty next_title }">
                                        <td><a href="inquiry_view?iu_num=${ next_title.getIu_num() }&m_num=${ next_title.getM_num() }&rownum=${ rownum+1 }">${ next_title.getIu_title() }</a></td>
                                        <td>
                                            <div class="parea">
                                                <div class="nbtnMini">${ next_title.getIu_status() }</div>
                                            </div>
                                        </td>
                                    </c:if>
								</tr>

								<tr>
									<th class="next">NEXT</th>
                                    <c:if test="${ empty pre_title }">
                                        <td>이전 글이 없습니다.</td>
                                    </c:if>
                                    <c:if test="${ not empty pre_title }">
                                        <td><a href="inquiry_view?iu_num=${ pre_title.getIu_num() }&m_num=${ pre_title.getM_num() }&rownum=${ rownum-1 }">${ pre_title.getIu_title() }</a></td>
                                        <td>
                                            <div class="parea">
                                                <div class="nbtnMini">${ pre_title.getIu_status() }</div>
                                            </div>
                                        </td>
                                    </c:if>
								</tr>
                                
							</tbody>
						</table>
					</div>
					<!-- //이전다음글 -->


					<!-- Btn Area -->
					<div class="btnArea">
						<div class="bRight">
							<ul>
								<li><a href="inquiry_modify?m_num=${ inq_view.getM_num() }&iu_num=${ inq_view.getIu_num() }&rownum=${ rownum }" class="nbtnbig mw">수정</a></li>
								<li><a href="#" class="nbtnbig mw" onclick="inq_delete(${inq_view.getIu_num()})">삭제</a></li>
								<li><a href="inquiry?m_num=${ inq_view.getM_num() }" class="sbtnMini mw">목록</a></li>
							</ul>
						</div>
					</div>
					<!-- //Btn Area -->
					
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